import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const restorationPath = path.join(workspace, 'Kundans', 'restored-catalog-v6.json');
const catalogPath = path.join(process.cwd(), 'data', 'products.json');
const localBackupPath = path.join(workspace, 'Kundans', 'products-before-restored-v6.json');
const databaseBackupPath = path.join(workspace, 'Kundans', 'supabase-products-before-restored-v6.json');

function normalizeImage(value = '') {
  return value.replaceAll('\\', '/').replace(/^\//, '').replace(/^images\//, '');
}

function cleanAltText(value = '') {
  return value
    .replace(/purpule|prupule/gi, 'purple')
    .replace(/droup/gi, 'drop')
    .replace(/reactangle/gi, 'rectangle')
    .replace(/jewelery/gi, 'jewellery')
    .replace(/peral/gi, 'pearl')
    .replace(/squre/gi, 'square')
    .replace(/glod/gi, 'gold')
    .replace(/\s+/g, ' ')
    .trim();
}

async function runConcurrent(items, concurrency, worker) {
  let cursor = 0;
  const runners = Array.from({ length: concurrency }, async () => {
    while (cursor < items.length) {
      const index = cursor;
      cursor += 1;
      await worker(items[index], index);
    }
  });
  await Promise.all(runners);
}

const restoration = JSON.parse(await fs.readFile(restorationPath, 'utf8'));
if (restoration.records.length !== 540) throw new Error(`Expected 540 restored image records, found ${restoration.records.length}.`);

const oldToNew = new Map(restoration.records.map((record) => [normalizeImage(record.oldPublicPath), record.heroPath]));
const catalogText = (await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, '');
const catalog = JSON.parse(catalogText);
const modified = [];

for (const product of catalog.products) {
  const originalImages = product.images.map((image) => normalizeImage(image));
  const nextImages = originalImages.map((image) => oldToNew.get(image) || image);
  if (nextImages.every((image, index) => image === originalImages[index])) continue;

  modified.push({
    local: product,
    slug: product.url.split('/').filter(Boolean).at(-1),
    oldImages: [...product.images],
    nextImages: nextImages.map((image) => `images/${image}`),
  });
  product.images = nextImages.map((image) => `images/${image}`);
}

if (modified.length !== 527) throw new Error(`Expected 527 affected products, found ${modified.length}.`);
await fs.writeFile(localBackupPath, `${catalogText.trimEnd()}\n`, 'utf8');

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } },
);
const { data: databaseProducts, error: readError } = await supabase
  .from('products')
  .select('id,slug,name,image_url,alt_text');
if (readError) throw readError;

const bySlug = new Map(databaseProducts.map((product) => [product.slug, product]));
const byImage = new Map(databaseProducts.map((product) => [normalizeImage(product.image_url), product]));
const databaseUpdates = modified.map((item) => {
  const databaseProduct = bySlug.get(item.slug) || byImage.get(normalizeImage(item.oldImages[0]));
  if (!databaseProduct) throw new Error(`Database product not found for ${item.slug}.`);
  return {
    databaseProduct,
    imageUrl: `/${item.nextImages[0]}`,
    altText: `${cleanAltText(databaseProduct.name || item.local.name)} product image with Bangle By Choice watermark`,
  };
});

const uniqueDatabaseIds = new Set(databaseUpdates.map((item) => item.databaseProduct.id));
if (uniqueDatabaseIds.size !== modified.length) throw new Error('Database mapping contains duplicate product IDs.');
await fs.writeFile(databaseBackupPath, `${JSON.stringify(databaseUpdates.map((item) => item.databaseProduct), null, 2)}\n`, 'utf8');

await runConcurrent(databaseUpdates, 10, async (item, index) => {
  const { error } = await supabase.from('products').update({
    image_url: item.imageUrl,
    alt_text: item.altText,
  }).eq('id', item.databaseProduct.id);
  if (error) throw error;
  if ((index + 1) % 50 === 0) console.log(`Updated ${index + 1}/${databaseUpdates.length} database products.`);
});

await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');
console.log(JSON.stringify({
  restoredImages: restoration.records.length,
  updatedProducts: modified.length,
  localBackupPath,
  databaseBackupPath,
}, null, 2));
