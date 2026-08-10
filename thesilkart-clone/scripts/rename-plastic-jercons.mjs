import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local' });

const colourNames = [
  ['multicolour', 'Multicolour'],
  ['sky blue', 'Sky Blue'],
  ['marron', 'Maroon'],
  ['maroon', 'Maroon'],
  ['gold', 'Gold'],
  ['green', 'Green'],
  ['purple', 'Purple'],
  ['red', 'Red'],
  ['silver', 'Silver'],
];

function colourFrom(product) {
  const text = `${product.name || ''} ${product.slug || ''}`.toLowerCase();
  return colourNames.find(([key]) => text.includes(key))?.[1] || 'Assorted Colour';
}

function renamedProduct(product) {
  const colour = colourFrom(product);
  const name = `${colour} 6K Eye Frameless Kundans`;
  const description = `${name} are lightweight eye-shaped kundan frames for bangles, jewellery making, blouse work and decorative craft projects. Check the product images for the exact colour, finish and setting before ordering.`;
  return {
    name,
    category: 'Kundan Stones',
    description,
    type: '6K Eye Frameless Kundans',
    tag: `${name}, 6K eye frameless kundans, kundan stones, jewellery making stones, bangle making kundans`,
    metaTitle: `${name} | Bangle by Choice`,
    metaDescription: `Buy ${name} online for bangles, jewellery making, blouse work and premium craft projects. Delivery across India from Bangle by Choice.`,
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
  const { data, error } = await supabase.from('products').select('*').or('name.ilike.%jercon%,tag.ilike.%jercon%,slug.ilike.%jercon%').order('name');
  if (error) throw error;
  const updated = [];
  for (const product of data) {
    const next = renamedProduct(product);
    const payload = {
      name: next.name,
      cat: next.category,
      tag: next.tag,
      desc_text: structuredDescription(product.desc_text, next.description),
      meta_title: next.metaTitle,
      meta_description: next.metaDescription,
      alt_text: next.altText,
    };
    const { error: updateError } = await supabase.from('products').update(payload).eq('id', product.id);
    if (updateError) throw updateError;
    updated.push({ id: product.id, oldName: product.name, name: next.name, slug: product.slug });
  }
  return updated;
}

async function updateJsonFile(file) {
  const absolute = path.resolve(file);
  const json = JSON.parse(await fs.readFile(absolute, 'utf8'));
  const rows = Array.isArray(json) ? json : json.products || [];
  let count = 0;
  for (const product of rows) {
    if (!/jercon/i.test([product.name, product.slug, product.url, product.type, product.matchName].filter(Boolean).join(' '))) continue;
    const next = renamedProduct(product);
    product.name = next.name;
    product.category = next.category;
    product.type = next.type;
    if ('description' in product) product.description = next.description;
    count += 1;
  }
  await fs.writeFile(absolute, `${JSON.stringify(json, null, 2)}\n`);
  return { file, count };
}

const database = await updateDatabase();
const files = await Promise.all(['data/products.json', 'data/new-products-2026-07-19.json'].map(updateJsonFile));
console.log(JSON.stringify({ database, files }, null, 2));
