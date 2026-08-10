import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const corrections = new Map([
  ['6k-drop-dark-blue-glossy-kundans', ['Tilakam Shape Dark Blue Glossy Kundans', 'deep royal blue glossy glass']],
  ['6k-drop-green-glass-kundans', ['Tilakam Shape Green Glass Kundans', 'bright emerald green glass']],
  ['6k-drop-glossy-white-kundans', ['Tilakam Shape Clear White Glossy Kundans', 'clear white glossy glass']],
  ['6k-drop-c-green-glass-kundans', ['Tilakam Shape C Green Glass Kundans', 'cyan green glass']],
  ['6k-drop-champagne-glass-kundans', ['Tilakam Shape Champagne Glass Kundans', 'warm champagne glass']],
  ['6k-drop-baby-pink-glass-kundans', ['Tilakam Shape Baby Pink Champagne Glass Kundans', 'baby pink champagne glass']],
  ['6k-drop-deep-red-glass-kundans', ['Tilakam Shape Deep Red Glass Kundans', 'deep ruby red glass']],
]);

function correctedProduct(slug) {
  const [name, colourFinish] = corrections.get(slug);
  const description = `${name} feature the traditional tilakam silhouette in ${colourFinish} with an antique-gold setting. Suitable for silk-thread bangles, jewellery making, blouse work, saree embellishment and premium DIY craft projects. Review the product image for the exact colour and finish before ordering.`;
  return {
    name,
    description,
    category: 'Kundan Stones',
    subcategory: 'Tilakam Shape Kundans',
    type: 'Tilakam shape glass kundans',
    tag: `tilakam shape kundans, ${colourFinish} kundans, kundan stones, jewellery making stones, bangle making kundans`,
    metaTitle: `${name} from ₹20 | Bangle by Choice`,
    metaDescription: `Buy ${name} for bangles, jewellery making, blouse work and decorative crafts. Premium Tilakam kundans delivered across India.`,
    altText: `${name} for jewellery and bangle making`,
  };
}

function structuredDescription(value, description) {
  if (String(value || '').startsWith('{')) {
    try {
      const parsed = JSON.parse(value);
      if (parsed?._bbc === 1) return JSON.stringify({ ...parsed, description });
    } catch {}
  }
  return JSON.stringify({ _bbc: 1, description, sku: '', stock_quantity: null, shipping_weight_grams: null, status: 'active', featured: false });
}

async function updateDatabase() {
  const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false, autoRefreshToken: false } });
  const slugs = [...corrections.keys()];
  const { data, error } = await supabase.from('products').select('id,name,slug,desc_text').in('slug', slugs);
  if (error) throw error;
  if (data.length !== slugs.length) throw new Error(`Expected ${slugs.length} products, found ${data.length}.`);
  const updated = [];
  for (const product of data) {
    const next = correctedProduct(product.slug);
    const { error: updateError } = await supabase.from('products').update({
      name: next.name,
      cat: next.category,
      tag: next.tag,
      desc_text: structuredDescription(product.desc_text, next.description),
      meta_title: next.metaTitle,
      meta_description: next.metaDescription,
      alt_text: next.altText,
    }).eq('id', product.id);
    if (updateError) throw updateError;
    const { data: orderItems, error: orderItemError } = await supabase.from('order_items').update({ product_name: next.name }).eq('product_slug', product.slug).select('id');
    if (orderItemError) throw orderItemError;
    updated.push({ slug: product.slug, oldName: product.name, name: next.name, updatedOrderItems: orderItems.length });
  }
  return updated.sort((left, right) => left.name.localeCompare(right.name));
}

async function updateJsonFile(file) {
  const absolute = path.resolve(file);
  const json = JSON.parse(await fs.readFile(absolute, 'utf8'));
  const rows = Array.isArray(json) ? json : json.products || json.updated || [];
  let count = 0;
  for (const product of rows) {
    const slug = product.slug || String(product.url || '').split('/').filter(Boolean).pop();
    if (!corrections.has(slug)) continue;
    const next = correctedProduct(slug);
    product.name = next.name;
    if ('category' in product) product.category = next.category;
    if ('subcategory' in product) product.subcategory = next.subcategory;
    if ('type' in product) product.type = next.type;
    if ('description' in product) product.description = next.description;
    count += 1;
  }
  await fs.writeFile(absolute, `${JSON.stringify(json, null, 2)}\n`);
  return { file, count };
}

const database = await updateDatabase();
const files = await Promise.all(['data/products.json', 'data/kundan-100g-price-update-2026-07-22.json'].map(updateJsonFile));
console.log(JSON.stringify({ database, files }, null, 2));
