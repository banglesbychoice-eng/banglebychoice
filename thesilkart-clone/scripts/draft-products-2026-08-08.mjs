import fs from 'node:fs/promises';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const productNames = [
  'Tilakam Shape Peach Glossy Kundans',
  'Tilakam Shape Sea Green Glass Kundans',
  'Tilakam Shape Dark Pink Glossy Kundans',
  'Multicolour Kundans-tilakam(4k Drop)shape',
  'Tilakam Shape Light Purple Glossy Kundans',
  'Tilakam Shape Glossy White Kundans',
  'Tilakam Shape Sky Blue Glass Kundans',
  'Tilakam Shape Dark Green Glass Kundans',
  'Tilakam Shape Baby Pink Glass Kundans',
  'Tilakam Shape Red Glass Kundans',
  'Tilakam Shape Yellow Glass Kundans',
  '6K Drop Rose Pink Glass Kundans',
  'Lotus silk Thread-shade No. 63S',
  'Lotus silk Thread-shade No. 706',
  'Lotus silk Thread-shade No. 87N',
  'Lotus silk Thread-shade No. 74',
  'Lotus silk Thread-shade No. 9D',
  'Lotus silk Thread-shade No. 30ND',
  'Lotus silk Thread-shade No. 28',
];

const wantedNames = new Set(productNames.map((name) => name.toLowerCase()));

function draftDescription(value) {
  if (String(value || '').startsWith('{')) {
    try {
      const parsed = JSON.parse(value);
      if (parsed?._bbc === 1) return JSON.stringify({ ...parsed, status: 'draft' });
    } catch {}
  }
  return JSON.stringify({ _bbc: 1, description: String(value || ''), sku: '', stock_quantity: null, shipping_weight_grams: null, status: 'draft', featured: false });
}

const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false, autoRefreshToken: false } });
const { data, error } = await supabase.from('products').select('id,name,slug,desc_text').order('name');
if (error) throw error;
const matched = data.filter((product) => wantedNames.has(product.name.toLowerCase()));
const missing = productNames.filter((name) => !matched.some((product) => product.name.toLowerCase() === name.toLowerCase()));
if (missing.length || matched.length !== productNames.length) throw new Error(`Product match failed. Missing: ${missing.join(', ') || 'none'}. Matched: ${matched.length}.`);

for (const product of matched) {
  const { error: updateError } = await supabase.from('products').update({ desc_text: draftDescription(product.desc_text) }).eq('id', product.id);
  if (updateError) throw updateError;
}

const localPath = 'data/products.json';
const localCatalog = JSON.parse(await fs.readFile(localPath, 'utf8'));
const localRows = Array.isArray(localCatalog) ? localCatalog : localCatalog.products || [];
const slugs = new Set(matched.map((product) => product.slug));
let localUpdated = 0;
for (const product of localRows) {
  const slug = product.slug || String(product.url || '').split('/').filter(Boolean).pop();
  if (!slugs.has(slug)) continue;
  product.status = 'draft';
  localUpdated += 1;
}
await fs.writeFile(localPath, `${JSON.stringify(localCatalog, null, 2)}\n`);

console.log(JSON.stringify({ databaseUpdated: matched.length, localUpdated, products: matched.map(({ name, slug }) => ({ name, slug })) }, null, 2));
