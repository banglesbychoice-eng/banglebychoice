import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const apply = process.argv.includes('--apply');
const projectRoot = process.cwd();
const outputDirectory = path.join(projectRoot, 'public', 'images', 'silk-thread-materials', 'bangle-size-stickers');
const catalogPath = path.join(projectRoot, 'data', 'products.json');
const sourceCatalogPath = path.join(projectRoot, 'data', 'new-products-2026-07-19.json');
const backupPath = path.join(projectRoot, 'data', 'bangle-size-sticker-image-backup-2026-08-12.json');
const bucket = 'product-images';

const products = [
  ['2-0-bangle-size-sticker-sheet', '2.0', '2★0'],
  ['2-2-bangle-size-sticker-sheet', '2.2', '2★2'],
  ['2-4-bangle-size-sticker-sheet', '2.4', '2★4'],
  ['2-6-bangle-size-sticker-sheet', '2.6', '2★6'],
  ['2-8-bangle-size-sticker-sheet', '2.8', '2★8'],
  ['2-10-bangle-size-sticker-sheet', '2.10', '2★10'],
  ['2-12-bangle-size-sticker-sheet', '2.12', '2★12'],
  ['2-14-bangle-size-sticker-sheet', '2.14', '2★14'],
].map(([slug, size, printedLabel]) => ({
  slug,
  size,
  printedLabel,
  name: `${size} Bangle Size Sticker Sheet`,
  fileName: `${slug}-horizontal-premium.webp`,
}));

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SERVICE_KEY;
if (!supabaseUrl || !serviceKey) throw new Error('Supabase service credentials are unavailable.');

const database = createClient(supabaseUrl, serviceKey, {
  auth: { persistSession: false, autoRefreshToken: false },
});

function escapeXml(value) {
  return value.replace(/[<>&'\"]/g, (character) => ({
    '<': '&lt;',
    '>': '&gt;',
    '&': '&amp;',
    "'": '&apos;',
    '"': '&quot;',
  })[character]);
}

function createStickerSheetSvg(product) {
  const canvas = 1200;
  const sheetX = 135;
  const sheetY = 380;
  const sheetWidth = 930;
  const sheetHeight = 440;
  const columns = 9;
  const rows = 6;
  const paddingX = 20;
  const paddingY = 22;
  const gapX = 7;
  const gapY = 7;
  const cellWidth = (sheetWidth - (paddingX * 2) - (gapX * (columns - 1))) / columns;
  const cellHeight = (sheetHeight - (paddingY * 2) - (gapY * (rows - 1))) / rows;
  const fontSize = product.printedLabel.length > 3 ? 28 : 31;
  const cells = [];

  for (let row = 0; row < rows; row += 1) {
    for (let column = 0; column < columns; column += 1) {
      const x = sheetX + paddingX + (column * (cellWidth + gapX));
      const y = sheetY + paddingY + (row * (cellHeight + gapY));
      const centreX = x + (cellWidth / 2);
      const centreY = y + (cellHeight / 2) + 1;
      cells.push(`
        <g>
          <rect x="${x.toFixed(2)}" y="${y.toFixed(2)}" width="${cellWidth.toFixed(2)}" height="${cellHeight.toFixed(2)}" rx="3" fill="url(#stickerPaper)" stroke="#e9cfd1" stroke-width="1"/>
          <path d="M ${(x + 3).toFixed(2)} ${(y + 5).toFixed(2)} H ${(x + cellWidth - 3).toFixed(2)}" stroke="#ffffff" stroke-opacity="0.9"/>
          <text x="${centreX.toFixed(2)}" y="${centreY.toFixed(2)}" text-anchor="middle" dominant-baseline="middle" font-family="Arial, DejaVu Sans, sans-serif" font-size="${fontSize}" font-weight="700" letter-spacing="0.2" fill="#a51028">${escapeXml(product.printedLabel)}</text>
        </g>`);
    }
  }

  return Buffer.from(`
    <svg xmlns="http://www.w3.org/2000/svg" width="${canvas}" height="${canvas}" viewBox="0 0 ${canvas} ${canvas}">
      <defs>
        <linearGradient id="background" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0" stop-color="#fffdfb"/>
          <stop offset="0.55" stop-color="#faf6f1"/>
          <stop offset="1" stop-color="#f2ebe4"/>
        </linearGradient>
        <linearGradient id="sheetRed" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0" stop-color="#d1263f"/>
          <stop offset="0.45" stop-color="#ba1731"/>
          <stop offset="1" stop-color="#941026"/>
        </linearGradient>
        <linearGradient id="stickerPaper" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0" stop-color="#fffefd"/>
          <stop offset="1" stop-color="#f8f1ed"/>
        </linearGradient>
        <filter id="sheetShadow" x="-25%" y="-40%" width="150%" height="180%">
          <feDropShadow dx="0" dy="24" stdDeviation="23" flood-color="#5f2430" flood-opacity="0.2"/>
        </filter>
        <filter id="softShadow" x="-20%" y="-50%" width="140%" height="200%">
          <feGaussianBlur stdDeviation="25"/>
        </filter>
      </defs>
      <rect width="1200" height="1200" fill="url(#background)"/>
      <ellipse cx="600" cy="844" rx="430" ry="42" fill="#8e6f65" opacity="0.13" filter="url(#softShadow)"/>
      <g filter="url(#sheetShadow)">
        <rect x="${sheetX}" y="${sheetY}" width="${sheetWidth}" height="${sheetHeight}" rx="12" fill="url(#sheetRed)"/>
        <rect x="${sheetX + 5}" y="${sheetY + 5}" width="${sheetWidth - 10}" height="${sheetHeight - 10}" rx="9" fill="none" stroke="#f97686" stroke-opacity="0.48" stroke-width="2"/>
        ${cells.join('')}
        <path d="M ${sheetX + 18} ${sheetY + 14} H ${sheetX + sheetWidth - 18}" stroke="#ff9baa" stroke-width="4" stroke-linecap="round" opacity="0.35"/>
      </g>
      <g transform="rotate(-34 600 600)" opacity="0.91">
        <rect x="180" y="559" width="840" height="82" rx="10" fill="#7b1232"/>
        <text x="600" y="601" text-anchor="middle" dominant-baseline="middle" font-family="Arial, DejaVu Sans, sans-serif" font-size="31" font-weight="700" letter-spacing="0.55" fill="#ffffff">www.banglebychoice.in  |  +91 95536 55562</text>
      </g>
    </svg>`);
}

function slugFromCatalogProduct(product) {
  return product.url?.split('/').filter(Boolean).at(-1) || '';
}

const slugs = products.map((product) => product.slug);
const { data: currentRows, error: selectError } = await database
  .from('products')
  .select('id,name,slug,price,mrp,sizes,desc_text,image_url,alt_text')
  .in('slug', slugs)
  .order('slug');
if (selectError) throw selectError;
if (currentRows.length !== products.length) throw new Error(`Expected ${products.length} products, found ${currentRows.length}.`);

const currentBySlug = new Map(currentRows.map((row) => [row.slug, row]));
const plan = products.map((product) => ({
  ...product,
  outputPath: path.join(outputDirectory, product.fileName),
  oldImageUrl: currentBySlug.get(product.slug).image_url,
  price: Number(currentBySlug.get(product.slug).price),
  mrp: Number(currentBySlug.get(product.slug).mrp),
}));

if (!apply) {
  console.log(JSON.stringify({ apply: false, products: plan }, null, 2));
  process.exit(0);
}

await fs.mkdir(outputDirectory, { recursive: true });
const backup = {
  generated_at: new Date().toISOString(),
  purpose: 'Rollback map for the 2026-08-12 bangle size sticker image replacement.',
  products: currentRows,
};
await fs.writeFile(backupPath, `${JSON.stringify(backup, null, 2)}\n`, 'utf8');

const published = [];
for (const product of plan) {
  const svg = createStickerSheetSvg(product);
  await sharp(svg)
    .webp({ quality: 88, smartSubsample: true })
    .toFile(product.outputPath);

  const file = await fs.readFile(product.outputPath);
  const storagePath = `catalog-2026-08-12/bangle-size-stickers/${product.fileName}`;
  const { error: uploadError } = await database.storage.from(bucket).upload(storagePath, file, {
    cacheControl: '31536000',
    contentType: 'image/webp',
    upsert: true,
  });
  if (uploadError) throw uploadError;

  const { data: publicData } = database.storage.from(bucket).getPublicUrl(storagePath);
  const publicUrl = publicData.publicUrl;
  const altText = `${product.size} bangle size sticker sheet in horizontal orientation with repeated size labels`;
  const { data: updated, error: updateError } = await database
    .from('products')
    .update({ image_url: publicUrl, alt_text: altText })
    .eq('slug', product.slug)
    .select('id,name,slug,price,mrp,sizes,desc_text,image_url,alt_text')
    .single();
  if (updateError) throw updateError;

  published.push({ ...updated, localImage: `images/silk-thread-materials/bangle-size-stickers/${product.fileName}` });
}

const localImageBySlug = new Map(published.map((product) => [product.slug, product.localImage]));
const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));
for (const product of catalog.products) {
  const image = localImageBySlug.get(slugFromCatalogProduct(product));
  if (image) product.images = [image];
}
await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');

const sourceCatalog = JSON.parse((await fs.readFile(sourceCatalogPath, 'utf8')).replace(/^\uFEFF/, ''));
for (const product of sourceCatalog) {
  const image = localImageBySlug.get(product.slug);
  if (image) product.imagePath = image;
}
await fs.writeFile(sourceCatalogPath, `${JSON.stringify(sourceCatalog, null, 2)}\n`, 'utf8');

const { data: verified, error: verifyError } = await database
  .from('products')
  .select('id,name,slug,price,mrp,sizes,desc_text,image_url,alt_text')
  .in('slug', slugs)
  .order('slug');
if (verifyError) throw verifyError;

for (const row of verified) {
  const before = currentBySlug.get(row.slug);
  if (Number(row.price) !== Number(before.price) || Number(row.mrp) !== Number(before.mrp)) {
    throw new Error(`Pricing changed unexpectedly for ${row.slug}.`);
  }
  if (JSON.stringify(row.sizes) !== JSON.stringify(before.sizes) || row.desc_text !== before.desc_text) {
    throw new Error(`Product data changed unexpectedly for ${row.slug}.`);
  }
  if (!row.image_url.includes('/catalog-2026-08-12/bangle-size-stickers/')) {
    throw new Error(`Image verification failed for ${row.slug}.`);
  }
}

console.log(JSON.stringify({
  applied: true,
  generated: published.length,
  backupPath,
  products: verified.map((row) => ({
    slug: row.slug,
    price: Number(row.price),
    mrp: Number(row.mrp),
    image_url: row.image_url,
  })),
}, null, 2));
