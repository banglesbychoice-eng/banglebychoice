import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local' });

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
);

const corrections = [
  [/\bkundhans\b/gi, 'kundans'],
  [/\breactangle\b/gi, 'rectangle'],
  [/\bdroup\b/gi, 'drop'],
  [/\braindroup\b/gi, 'raindrop'],
  [/\bpurpule\b/gi, 'purple'],
  [/\bprupule\b/gi, 'purple'],
  [/\bgrren\b/gi, 'green'],
  [/\bbliu\b/gi, 'blue'],
  [/\bglod\b/gi, 'gold'],
  [/\bsqure\b/gi, 'square'],
  [/\bovel\b/gi, 'oval'],
  [/\bpestral\b|\bpestarl\b|\bpestrak\b/gi, 'pastel'],
  [/\bglassy\b/gi, 'glossy'],
  [/\bmatt\b/gi, 'matte'],
  [/\s+/g, ' '],
];

const colourWords = [
  'baby pink', 'dark pink', 'light pink', 'rose pink', 'onion pink', 'tomato red', 'dark green', 'light green',
  'pista green', 'mint green', 'sea green', 'leaf green', 'dark blue', 'sky blue', 'peacock blue', 'lemon yellow',
  'light peach', 'maroon', 'lilac', 'lavender', 'violet', 'rainbow', 'multicolour', 'multi colour', 'yellow',
  'orange', 'white', 'black', 'red', 'green', 'blue', 'purple', 'pink', 'peach', 'gold', 'silver',
];

const shapeWords = [
  'half moon', 'eye shape', 'navette', 'raindrop', 'drop', 'round', 'rectangle', 'square', 'triangle',
  'moon', 'v shape', 'tilakam', 'star', 'leaf', 'lily', 'oval', 's shape',
];

const finishWords = ['glossy', 'matte', 'glass', 'ceramic', 'pastel'];

function cleanText(value = '') {
  return corrections.reduce((text, [pattern, replacement]) => text.replace(pattern, replacement), String(value)).trim();
}

function titleCase(value = '') {
  return cleanText(value)
    .toLowerCase()
    .split(' ')
    .map((word) => (/^\d+[a-z]?$/i.test(word) ? word.toUpperCase() : word.charAt(0).toUpperCase() + word.slice(1)))
    .join(' ')
    .replace(/\bMm\b/g, 'mm')
    .replace(/\bK\b/g, 'K')
    .replace(/\*/g, '×');
}

function parseDetails(value) {
  if (!value?.startsWith('{')) return { description: value?.startsWith('DescriptionShipping') ? '' : value || '', sku: '', stock_quantity: null, status: 'active', featured: false };
  try {
    const parsed = JSON.parse(value);
    return parsed?._bbc === 1 ? parsed : { description: value, sku: '', stock_quantity: null, status: 'active', featured: false };
  } catch {
    return { description: value, sku: '', stock_quantity: null, status: 'active', featured: false };
  }
}

function hasConfirmedPackPricing(sizes) {
  return Array.isArray(sizes) && sizes.every((item) => item && typeof item === 'object' && item.label && Number.isFinite(Number(item.price)));
}

function findKnownTerms(text, terms) {
  const normalized = cleanText(text).toLowerCase();
  return terms.filter((term) => new RegExp(`(^|[^a-z0-9])${term.replaceAll(' ', '[ -]')}([^a-z0-9]|$)`, 'i').test(normalized));
}

function inferredSizeText(productName) {
  const name = cleanText(productName);
  const sizes = [
    ...name.matchAll(/\b\d+(?:\.\d+)?\s*mm\b/gi),
    ...name.matchAll(/\b\d+\s*[*×]\s*\d+\b/gi),
    ...name.matchAll(/\b\d+k\b/gi),
  ].map((match) => match[0].replace('*', '×').replace(/\s+/g, ''));
  return [...new Set(sizes)].join(', ');
}

function isKundanStone(product) {
  const text = `${product.cat || ''} ${product.tag || ''} ${product.name || ''} ${product.image_url || ''}`;
  if (String(product.slug || '').startsWith('mirdhu-') || String(product.slug || '').startsWith('rosin-')) return false;
  if (String(product.image_url || '').includes('/images/kundan-stones/')) return true;
  if (/kundan stones/i.test(product.cat || '')) return true;
  return /kundan/i.test(text) && /\b(kundan|kundans|clipstone|clipstones|glass|glossy|matte|matt|ceramic|round|eye|drop|raindrop|oval|rectangle|square|triangle|moon|v shape|tilakam|star|leaf|lily|navette)\b/i.test(text);
}

function productName(product) {
  const base = titleCase(cleanText(product.name).replace(/\bcolour\b/gi, '').replace(/\s+-\s+/g, ' '));
  return /\bkundans\b/i.test(base) ? base : `${base} Kundans`;
}

function productTags(product, name) {
  const text = `${name} ${product.tag || ''}`;
  const colours = findKnownTerms(text, colourWords);
  const shapes = findKnownTerms(text, shapeWords);
  const finishes = findKnownTerms(text, finishWords);
  return [
    ...colours.map((colour) => `${colour} kundans`),
    ...shapes.map((shape) => `${shape} kundans`),
    ...finishes.map((finish) => `${finish} kundans`),
    'kundan stones',
    'jewellery making stones',
    'bangle making kundans',
    'blouse work kundans',
    'saree work embellishments',
    'DIY craft materials',
  ].filter((tag, index, tags) => tags.indexOf(tag) === index).join(', ');
}

function description(product, name) {
  const text = `${name} ${product.tag || ''}`;
  const colours = findKnownTerms(text, colourWords);
  const shapes = findKnownTerms(text, shapeWords);
  const finishes = findKnownTerms(text, finishWords);
  const size = inferredSizeText(name);
  const shape = shapes[0] ? `${shapes[0]} shape` : 'visible shape';
  const colour = colours[0] ? `${colours[0]} colour` : 'visible colour';
  const finish = finishes[0] ? `${finishes[0]} finish` : 'decorative finish';
  const sizeSentence = size ? ` Confirmed visible/product size: ${size}.` : ' Exact size is not stated, so please use the image and pack details as the visual reference.';
  return `${name} are premium Kundan stones for silk thread bangles, designer jewellery, blouse work, saree embellishment and festive craft projects. The product is identified by its ${shape}, ${colour} and ${finish}, with attention to edge smoothness, rim proportion, surface gloss and realistic stone reflections.${sizeSentence} Pair with suitable jewellery or fabric adhesive and test placement before fixing. Packed by Bangle By Choice for makers across India.`;
}

function altText(name) {
  return `${name} for bangle making, jewellery making, blouse work and DIY craft projects`;
}

async function getRows() {
  const rows = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await supabase
      .from('products')
      .select('id,name,slug,cat,tag,image_url,desc_text,meta_title,meta_description,alt_text,sizes,price,mrp,created_at')
      .order('created_at', { ascending: true })
      .range(from, from + 999);
    if (error) throw error;
    rows.push(...data);
    if (data.length < 1000) break;
  }
  return rows;
}

const rows = await getRows();
const products = rows.filter(isKundanStone);
const updates = products.map((product, index) => {
  const name = productName(product);
  const details = parseDetails(product.desc_text);
  const desc = description(product, name);
  const sku = details.sku || `BBC-KUN-${String(index + 1).padStart(3, '0')}`;
  return {
    id: product.id,
    name,
    cat: 'Kundan Stones',
    tag: productTags(product, name),
    desc_text: JSON.stringify({ ...details, _bbc: 1, description: desc, sku, status: details.status || 'active' }),
    sizes: hasConfirmedPackPricing(product.sizes) ? product.sizes : [],
    meta_title: `${name} | Bangle By Choice`,
    meta_description: `Buy ${name} online for bangles, jewellery making, blouse work and DIY craft projects. Premium Kundan stones from Bangle By Choice.`,
    alt_text: altText(name),
  };
});

for (let index = 0; index < updates.length; index += 1) {
  const { id, ...fields } = updates[index];
  const { error } = await supabase.from('products').update(fields).eq('id', id);
  if (error) throw error;
  if ((index + 1) % 50 === 0 || index + 1 === updates.length) console.log(`Updated ${index + 1} / ${updates.length}`);
}

console.log(JSON.stringify({
  updated: updates.length,
  preservedConfirmedPackPricing: updates.filter((update) => update.sizes.length).length,
  clearedUnconfirmedSizeArrays: updates.filter((update) => !update.sizes.length).length,
}, null, 2));
