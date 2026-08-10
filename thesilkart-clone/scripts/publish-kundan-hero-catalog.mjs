import crypto from 'node:crypto';
import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const apply = process.argv.includes('--apply');
const projectRoot = process.cwd();
const workspace = path.resolve(projectRoot, '..', '..', '..');
const kundanDir = path.join(workspace, 'Kundans');
const sourceImageDir = path.join(kundanDir, 'processed-webp');
const publicImageDir = path.join(projectRoot, 'public', 'images', 'kundan-stones');
const catalogPath = path.join(projectRoot, 'data', 'products.json');
const manifestPath = path.join(kundanDir, 'production-manifest.json');

const oldSlugs = new Map(Object.entries({
  1: '6k-droup-peach-glass',
  2: '6k-drop-ceramic-white-kundans',
  3: '6k-droup-light-purpule-glass',
  6: '6k-drop-dark-pink-glass-kundans',
  8: 'triangle-shape-ceramic-white',
  10: '6k-drop-light-green-glossy-kundans',
  11: '6k-drop-ceramic-gold',
  12: 'triangle-ceramic-gold',
  13: '6k-drop-glossy-gold',
  14: 'small-star-glossy-white',
  15: '3-3-square-gold-glossy',
  17: 'diamond-shape-glossy-gold',
  19: 'diamond-shape-light-green-glossy',
  20: 'diamond-shape-orange-glossy',
  24: 'diamond-shape-rose-pink-glossy-kundans',
  27: '6k-droup-dark-blue-glossy',
  28: '6k-drop-rama-green-glass-kundans',
  29: '6k-drop-glossy-white',
  32: '6k-drop-dark-sky-blue-glass-kundans',
  34: '4-4-square-glossy-white',
  38: '4-4-square-yellow-glossy',
  39: '4-4-square-glossy-glod',
  40: '4-4-square-white-colour-matt',
  41: '4-4-square-ceramic-gold',
  42: '4-4-square-red-glossy',
  46: '4-4-square-rose-pink-glossy',
  47: 'half-moon-sky-blue-glass',
  48: '4-4-square-purpule-glossy',
  50: 'half-moon-dark-purpule-glass',
  52: 'half-moon-dark-blue-glass',
  54: 'half-moon-red-glass',
  55: 'half-moon-orange-glass',
  56: 'half-moon-dark-pink-glass',
  57: 'half-moon-yelllow-glass',
}));

function parseCsvLine(line) {
  return line.split(',');
}

function titleFromSlug(slug) {
  return slug.split('-').map((word, index) => {
    if (word === '6k') return '6K';
    if (word === '3x3' || word === '4x4') return word;
    if (word === 'c' && index > 0) return 'C';
    return word.charAt(0).toUpperCase() + word.slice(1);
  }).join(' ');
}

function familyLabel(slug) {
  if (slug.startsWith('6k-drop-')) return '6K Drop';
  if (slug.startsWith('3x3-square-')) return '3x3 Square';
  if (slug.startsWith('4x4-square-')) return '4x4 Square';
  if (slug.startsWith('diamond-')) return 'Diamond';
  if (slug.startsWith('half-moon-')) return 'Half Moon';
  if (slug.startsWith('triangle-')) return 'Triangle';
  return 'Small Star';
}

function finishLabel(slug) {
  if (slug.includes('ceramic')) return 'Ceramic';
  if (slug.includes('glass')) return 'Glass';
  return 'Glossy';
}

function parseDetails(value) {
  if (!value?.startsWith('{')) return {};
  try { const parsed = JSON.parse(value); return parsed?._bbc === 1 ? parsed : {}; } catch { return {}; }
}

const csv = (await fs.readFile(path.join(kundanDir, 'product-mapping.csv'), 'utf8')).replace(/^\uFEFF/, '').trim().split(/\r?\n/).slice(1);
const products = csv.map((line) => {
  const [indexText, slug, shape, promptDescriptor] = parseCsvLine(line);
  const index = Number(indexText);
  const name = titleFromSlug(slug);
  const family = familyLabel(slug);
  const finish = finishLabel(slug);
  const imageFile = `${slug}-hero-top-view-v3.webp`;
  const imagePath = `/images/kundan-stones/${imageFile}`;
  const description = `${name} are premium ${promptDescriptor} Kundan stones in an antique-gold metal setting. The true top-view image shows the exact ${shape} shape, colour, shine, front finish and backside detail for confident visual matching. Suitable for silk-thread bangles, jewellery making, blouse work, saree embellishment and DIY craft projects.`;
  return {
    index,
    oldSlug: oldSlugs.get(String(index)) || null,
    slug,
    name,
    family,
    finish,
    promptDescriptor,
    imageFile,
    imagePath,
    sourceImageFile: `${slug}-hero-top-view.webp`,
    description,
    tag: `${family.toLowerCase()} kundans, ${promptDescriptor} kundans, kundan stones, jewellery making stones, bangle making kundans`,
    metaTitle: `${name} | Bangle By Choice`,
    metaDescription: `Buy ${name} online for bangles, jewellery making, blouse work and craft projects from Bangle By Choice.`,
    altText: `${name} premium top-view product image with antique-gold setting`,
  };
});

async function currentDatabaseRows(client) {
  const candidates = [...new Set(products.flatMap((product) => [product.slug, product.oldSlug]).filter(Boolean))];
  const { data, error } = await client.from('products').select('*').in('slug', candidates);
  if (error) throw error;
  return data;
}

async function planDatabase(client) {
  const rows = await currentDatabaseRows(client);
  return products.map((product) => {
    const matches = rows.filter((row) => row.slug === product.slug || row.slug === product.oldSlug);
    if (matches.length > 1) throw new Error(`Multiple database rows match ${product.slug}.`);
    const existing = matches[0] || null;
    const details = parseDetails(existing?.desc_text);
    const fields = {
      name: product.name,
      slug: product.slug,
      price: Number(existing?.price || 20),
      mrp: Number(existing?.mrp || 25),
      cat: 'Kundan Stones',
      bg: existing?.bg || '#FAF8F4',
      emoji: existing?.emoji || '◇',
      desc_text: JSON.stringify({ ...details, _bbc: 1, description: product.description, status: 'active' }),
      tag: product.tag,
      sizes: Array.isArray(existing?.sizes) && existing.sizes.every((item) => item && typeof item === 'object') ? existing.sizes : [],
      image_url: product.imagePath,
      meta_title: product.metaTitle,
      meta_description: product.metaDescription,
      alt_text: product.altText,
    };
    return { product, existing, fields, action: existing ? 'update' : 'insert' };
  });
}

async function updateLocalCatalog(plan) {
  const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));
  for (const item of plan) {
    const { product, existing, fields } = item;
    const entry = catalog.products.find((row) => {
      const slug = row.url?.split('/').filter(Boolean).at(-1);
      return slug === product.slug || slug === product.oldSlug;
    });
    const local = entry || {
      id: crypto.createHash('sha256').update(product.slug).digest('hex').slice(0, 12),
      source: 'banglebychoice',
      currency: 'INR',
      weight: '',
    };
    local.url = `https://www.banglebychoice.in/products/${product.slug}`;
    local.name = product.name;
    local.price = fields.mrp;
    local.sale_price = fields.price;
    local.category = 'Kundan Stones';
    local.subcategory = `${product.family} ${product.finish} Kundans`;
    local.type = `${product.family} ${product.finish.toLowerCase()} kundans`;
    local.availability = 'In Stock';
    local.description = product.description;
    local.images = [product.imagePath.slice(1)];
    if (!entry) catalog.products.push(local);
  }
  catalog.total_products = catalog.products.length;
  await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');
}

async function copyImages() {
  await fs.mkdir(publicImageDir, { recursive: true });
  for (const product of products) {
    await fs.copyFile(path.join(sourceImageDir, product.sourceImageFile), path.join(publicImageDir, product.imageFile));
  }
}

async function publishDatabase(client, plan) {
  for (const item of plan) {
    const query = item.action === 'update'
      ? client.from('products').update(item.fields).eq('id', item.existing.id)
      : client.from('products').insert(item.fields);
    const { error } = await query;
    if (error) throw new Error(`${item.action} failed for ${item.product.slug}: ${error.message}`);
  }
}

const client = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
const plan = await planDatabase(client);
const summary = {
  mode: apply ? 'apply' : 'dry-run',
  total: plan.length,
  updates: plan.filter((item) => item.action === 'update').length,
  inserts: plan.filter((item) => item.action === 'insert').length,
  rows: plan.map((item) => ({ index: item.product.index, action: item.action, previousSlug: item.existing?.slug || null, slug: item.product.slug, image: item.product.imagePath })),
};

if (apply) {
  await copyImages();
  await updateLocalCatalog(plan);
  await publishDatabase(client, plan);
  await fs.writeFile(manifestPath, `${JSON.stringify({ generatedAt: new Date().toISOString(), ...summary }, null, 2)}\n`, 'utf8');
}

console.log(JSON.stringify(summary, null, 2));
