import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const apply = process.argv.includes('--apply');
const currentPrice = 160;
const nextPrice = 150;
const projectRoot = process.cwd();
const catalogPath = path.join(projectRoot, 'data', 'products.json');
const reportPath = path.join(projectRoot, 'data', 'kundan-100g-price-update-2026-07-22.json');
const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;
if (!url || !key) throw new Error('Supabase service credentials are unavailable.');
const database = createClient(url, key, { auth: { persistSession: false } });

function isHundredGramPack(pack) {
  return pack && typeof pack === 'object' && /^100(?:g|gm|gms|gram|grams)$/i.test(String(pack.label).replace(/\s+/g, ''));
}

function statusFrom(value = '') {
  try {
    return JSON.parse(value)?.status || 'active';
  } catch {
    return 'active';
  }
}

function slugFromCatalogProduct(product) {
  return product.url?.split('/').filter(Boolean).at(-1) || '';
}

const { data: kundans, error } = await database
  .from('products')
  .select('id,name,slug,sizes,desc_text')
  .ilike('cat', '%kundan%')
  .order('name');
if (error) throw error;

const targets = kundans
  .filter((product) => (Array.isArray(product.sizes) ? product.sizes : []).some((pack) => isHundredGramPack(pack) && Number(pack.price) === currentPrice))
  .map((product) => ({
    ...product,
    nextSizes: product.sizes.map((pack) => isHundredGramPack(pack) && Number(pack.price) === currentPrice ? { ...pack, price: nextPrice } : pack),
  }));

const plan = {
  previous_100g_price: currentPrice,
  next_100g_price: nextPrice,
  products: targets.length,
  active_products: targets.filter((product) => statusFrom(product.desc_text) !== 'draft').length,
  draft_products: targets.filter((product) => statusFrom(product.desc_text) === 'draft').length,
};

if (!apply) {
  console.log(JSON.stringify({ apply: false, ...plan, sample: targets.slice(0, 12).map(({ name, slug, sizes, nextSizes }) => ({ name, slug, before: sizes, after: nextSizes })) }, null, 2));
} else {
  for (let start = 0; start < targets.length; start += 12) {
    const batch = targets.slice(start, start + 12);
    await Promise.all(batch.map(async (product) => {
      const { error: updateError } = await database.from('products').update({ sizes: product.nextSizes }).eq('id', product.id);
      if (updateError) throw updateError;
    }));
    console.log(`Updated ${Math.min(start + batch.length, targets.length)}/${targets.length}`);
  }

  const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));
  const sizesBySlug = new Map(targets.map((product) => [product.slug, product.nextSizes]));
  let localProductsUpdated = 0;
  for (const product of catalog.products) {
    const sizes = sizesBySlug.get(slugFromCatalogProduct(product));
    if (!sizes) continue;
    product.pack_prices = sizes;
    localProductsUpdated += 1;
  }
  await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');

  const { data: verified, error: verifyError } = await database
    .from('products')
    .select('id,sizes')
    .in('id', targets.map((product) => product.id));
  if (verifyError) throw verifyError;
  const stillAtOldPrice = verified.filter((product) => product.sizes.some((pack) => isHundredGramPack(pack) && Number(pack.price) === currentPrice));
  const updatedToNewPrice = verified.filter((product) => product.sizes.some((pack) => isHundredGramPack(pack) && Number(pack.price) === nextPrice));
  if (stillAtOldPrice.length || updatedToNewPrice.length !== targets.length) throw new Error('Kundan 100 g price verification failed.');

  const report = {
    generated_at: new Date().toISOString(),
    applied: true,
    ...plan,
    local_products_updated: localProductsUpdated,
    verification: { database_products_at_150: updatedToNewPrice.length, database_products_still_at_160: stillAtOldPrice.length },
    products: targets.map(({ id, name, slug }) => ({ id, name, slug })),
  };
  await fs.writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
  console.log(JSON.stringify({ reportPath, ...report.verification, localProductsUpdated }, null, 2));
}
