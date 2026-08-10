import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const apply = process.argv.includes('--apply');
const projectRoot = process.cwd();
const catalogPath = path.join(projectRoot, 'data', 'products.json');
const newProductsPath = path.join(projectRoot, 'data', 'new-products-2026-07-19.json');
const reportPath = path.join(projectRoot, 'data', 'catalog-maintenance-2026-07-21.json');
const sizeSheetPattern = /^2-(?:0|2|4|6|8|10|12|14)-bangle-size-sticker-sheet$/;

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;
if (!url || !key) throw new Error('Supabase service credentials are unavailable.');
const database = createClient(url, key, { auth: { persistSession: false } });

function detailsFrom(value = '') {
  if (value.startsWith('{')) {
    try {
      const parsed = JSON.parse(value);
      if (parsed?._bbc === 1) return parsed;
    } catch {}
  }
  return { _bbc: 1, description: value };
}

function slugFromCatalogProduct(product) {
  return product.url?.split('/').filter(Boolean).at(-1) || '';
}

const { data: rows, error } = await database
  .from('products')
  .select('id,name,slug,price,mrp,tag,desc_text')
  .order('name');
if (error) throw error;

const markingProducts = rows.filter((product) => product.tag?.trim().toLowerCase() === 'marking papers');
const sizeSheets = rows.filter((product) => sizeSheetPattern.test(product.slug));
const reference = sizeSheets.find((product) => product.slug === '2-0-bangle-size-sticker-sheet');
if (!reference) throw new Error('The 2.0 Bangle Size Sticker Sheet reference product was not found.');
if (markingProducts.length !== 5) throw new Error(`Expected 5 Marking Papers products, found ${markingProducts.length}.`);
if (sizeSheets.length !== 8) throw new Error(`Expected 8 bangle-size sheet products, found ${sizeSheets.length}.`);

const plan = {
  reference: { slug: reference.slug, selling_price: Number(reference.price), mrp: Number(reference.mrp) },
  marking_products: markingProducts.map((product) => ({
    id: product.id,
    name: product.name,
    slug: product.slug,
    current_status: detailsFrom(product.desc_text).status || 'active',
    next_status: 'draft',
  })),
  size_sheets: sizeSheets.map((product) => ({
    id: product.id,
    name: product.name,
    slug: product.slug,
    current_price: Number(product.price),
    current_mrp: Number(product.mrp),
    next_price: Number(reference.price),
    next_mrp: Number(reference.mrp),
  })),
};

if (!apply) {
  console.log(JSON.stringify({ apply: false, ...plan }, null, 2));
} else {
for (const product of markingProducts) {
  const details = { ...detailsFrom(product.desc_text), _bbc: 1, status: 'draft' };
  const { error: updateError } = await database.from('products').update({ desc_text: JSON.stringify(details) }).eq('id', product.id);
  if (updateError) throw updateError;
}

const { error: priceError } = await database
  .from('products')
  .update({ price: reference.price, mrp: reference.mrp })
  .in('id', sizeSheets.map((product) => product.id));
if (priceError) throw priceError;

const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));
const markingSlugs = new Set(markingProducts.map((product) => product.slug));
for (const product of catalog.products) {
  const slug = slugFromCatalogProduct(product);
  if (markingSlugs.has(slug)) product.status = 'draft';
  if (sizeSheetPattern.test(slug)) {
    product.price = Number(reference.mrp);
    product.sale_price = Number(reference.price);
    product.description = product.description.replace(/from Rs \d+(?:\.\d+)?/i, `from Rs ${reference.price}`);
  }
}
await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');

const newProducts = JSON.parse((await fs.readFile(newProductsPath, 'utf8')).replace(/^\uFEFF/, ''));
for (const product of newProducts) {
  if (!sizeSheetPattern.test(product.slug)) continue;
  product.price = Number(reference.price);
  product.mrp = Number(reference.mrp);
}
await fs.writeFile(newProductsPath, `${JSON.stringify(newProducts, null, 2)}\n`, 'utf8');

const { data: verified, error: verifyError } = await database
  .from('products')
  .select('id,name,slug,price,mrp,tag,desc_text')
  .in('id', [...markingProducts, ...sizeSheets].map((product) => product.id));
if (verifyError) throw verifyError;

const verification = {
  marking_products_drafted: verified.filter((product) => markingSlugs.has(product.slug) && detailsFrom(product.desc_text).status === 'draft').length,
  size_sheet_prices_matched: verified.filter((product) => sizeSheetPattern.test(product.slug) && Number(product.price) === Number(reference.price) && Number(product.mrp) === Number(reference.mrp)).length,
};
if (verification.marking_products_drafted !== markingProducts.length) throw new Error('Marking product verification failed.');
if (verification.size_sheet_prices_matched !== sizeSheets.length) throw new Error('Size-sheet price verification failed.');

const report = { generated_at: new Date().toISOString(), applied: true, ...plan, verification };
await fs.writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
console.log(JSON.stringify({ reportPath, ...verification, reference: plan.reference }, null, 2));
}
