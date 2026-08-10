import crypto from 'node:crypto';
import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import dotenv from 'dotenv';
import sharp from 'sharp';
import { createClient } from '@supabase/supabase-js';

dotenv.config({ path: '.env.local', quiet: true });

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const generatedRoot = path.resolve('C:/Users/amigo/.codex/generated_images/019ee902-6c3e-7d80-82bd-69856bd699aa');
const publicDirectory = path.join(root, 'public', 'images', 'catalog-2026-08-08');
const qaDirectory = path.join(root, 'tmp', 'whatsapp-products-2026-08-08');
const catalogPath = path.join(root, 'data', 'products.json');
const shouldApply = process.argv.includes('--apply');
const brandText = 'www.banglebychoice.in  |  +91 95536 55562';

const kundanPacks = [
  { label: '10g', price: 20, mrp: 25 },
  { label: '50g', price: 90, mrp: 125 },
  { label: '100g', price: 160, mrp: 250 },
];

const bangleSizes = ['2.2', '2.4', '2.6', '2.8'];

const products = [
  {
    slug: 'flat-plain-bangle-boxes-1-cut',
    name: 'Flat Plain Bangle Box - 1 Cut',
    source: 'exec-f9894c6f-1be2-4a4f-a6b0-16d23018de5b.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'flat-plain-bangle-boxes-2-cut',
    name: 'Flat Plain Bangle Box - 2 Cut',
    source: 'exec-27c6e247-828d-4857-afef-12392c7042b9.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'flat-plain-bangle-boxes-4-cut',
    name: 'Flat Plain Bangle Box - 4 Cut',
    source: 'exec-d8cb3d7d-7ded-4a80-bc4f-57823344252f.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'flat-plain-bangle-boxes-6-cut',
    name: 'Flat Plain Bangle Box - 6 Cut',
    source: 'exec-e023bdb8-6123-4e34-962f-73e6c3550fc2.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
    status: 'active',
  },
  {
    slug: 'curve-plain-bangle-boxes-1cut',
    name: 'Curve Plain Bangle Box - 1 Cut',
    source: 'exec-4259da47-3fd9-4534-9860-450ab78af94a.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'curve-plain-bangle-boxes-2cut',
    name: 'Curve Plain Bangle Box - 2 Cut',
    source: 'exec-945ff310-77dc-4c0b-9b27-9634d5700d34.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'curve-plain-bangle-boxes-4-cut',
    name: 'Curve Plain Bangle Box - 4 Cut',
    source: 'exec-2252ad0d-b4e3-48ff-bc2b-c8f88a18d7b1.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'curve-plain-bangle-boxes-6-cut',
    name: 'Curve Plain Bangle Box - 6 Cut',
    source: 'exec-78329222-4076-418d-929a-6033e7d5f8b9.png',
    category: 'Silk Thread Materials',
    type: 'bangle boxes',
    sizes: bangleSizes,
    price: 120,
    mrp: 130,
  },
  {
    slug: 'sky-bliu-colour-stone-chaine',
    name: 'Sky Blue Colour Stone Chain',
    source: 'exec-f3a4d64e-1b5c-4049-9019-94ec162fa33e.png',
    category: 'Silk Thread Materials',
    type: 'stone chains',
    price: 23,
    mrp: 25,
  },
  {
    slug: 'dark-blue-colour-stone-chain',
    name: 'Dark Blue Colour Stone Chain',
    source: 'exec-513d51a5-eb03-4377-bcd0-2e002ba05e5c.png',
    category: 'Silk Thread Materials',
    type: 'stone chains',
    price: 23,
    mrp: 25,
    status: 'active',
  },
  {
    slug: 'red-colour-stone-chaine',
    name: 'Red Colour Stone Chain',
    source: 'exec-3d3f0b9f-8c52-49e8-a0e2-94499201df0e.png',
    category: 'Silk Thread Materials',
    type: 'stone chains',
    price: 23,
    mrp: 25,
  },
  {
    slug: 'black-eye-shape-glossy-kundans',
    name: 'Black Eye Shape Glossy Kundans',
    source: 'exec-ff5d468e-93d5-4382-aff0-038c55909217.png',
    gallerySources: [
      'exec-ff5d468e-93d5-4382-aff0-038c55909217.png',
      'exec-927eee39-1c1b-41ad-8212-b9838b204b43.png',
      'exec-7255bc5c-4c21-45d3-8e46-e547925ab54c.png',
    ],
    category: 'Kundan Stones',
    type: 'eye shape kundans',
    sizes: kundanPacks,
    price: 20,
    mrp: 25,
    status: 'active',
  },
  {
    slug: 'black-square-glossy-kundans',
    name: 'Black Square Glossy Kundans',
    source: 'exec-afaf04a3-3242-41fb-a76c-f896f968cfbf.png',
    category: 'Kundan Stones',
    type: 'square kundans',
    sizes: kundanPacks,
    price: 20,
    mrp: 25,
    status: 'active',
  },
];

function escapeXml(value) {
  return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

function watermarkSvg() {
  const text = escapeXml(brandText);
  return Buffer.from(`
    <svg width="1200" height="1200" xmlns="http://www.w3.org/2000/svg">
      <g transform="rotate(-28 600 600)">
        <text x="600" y="605" text-anchor="middle" font-family="Arial, Helvetica, sans-serif" font-size="43" font-weight="700" letter-spacing="1.2" fill="none" stroke="#1e1510" stroke-width="5" stroke-opacity="0.34">${text}</text>
        <text x="600" y="605" text-anchor="middle" font-family="Arial, Helvetica, sans-serif" font-size="43" font-weight="700" letter-spacing="1.2" fill="#ffffff" fill-opacity="0.62">${text}</text>
      </g>
    </svg>
  `);
}

function imagePaths(product) {
  const sources = product.gallerySources || [product.source];
  return sources.map((source, index) => {
    const suffix = sources.length > 1 ? `-${index + 1}` : '';
    return {
      source: path.join(generatedRoot, source),
      filename: `${product.slug}${suffix}.webp`,
      publicPath: `/images/catalog-2026-08-08/${product.slug}${suffix}.webp`,
      catalogPath: `images/catalog-2026-08-08/${product.slug}${suffix}.webp`,
    };
  });
}

async function buildImages() {
  await fs.mkdir(publicDirectory, { recursive: true });
  await fs.mkdir(qaDirectory, { recursive: true });
  const results = [];

  for (const product of products) {
    for (const image of imagePaths(product)) {
      const destination = path.join(publicDirectory, image.filename);
      await sharp(image.source)
        .rotate()
        .resize(1200, 1200, { fit: 'contain', background: '#f8f4ef', withoutEnlargement: false })
        .composite([{ input: watermarkSvg(), blend: 'over' }])
        .webp({ quality: 84, effort: 6, smartSubsample: true })
        .toFile(destination);
      const stats = await fs.stat(destination);
      results.push({ product: product.name, file: image.filename, bytes: stats.size });
    }
  }

  const thumbnails = await Promise.all(results.map(async (result) => ({
    input: await sharp(path.join(publicDirectory, result.file)).resize(260, 260, { fit: 'cover' }).toBuffer(),
  })));
  await sharp({
    create: {
      width: 1040,
      height: Math.ceil(thumbnails.length / 4) * 260,
      channels: 3,
      background: '#eee7df',
    },
  }).composite(thumbnails.map((thumbnail, index) => ({
    input: thumbnail.input,
    left: (index % 4) * 260,
    top: Math.floor(index / 4) * 260,
  }))).webp({ quality: 82 }).toFile(path.join(qaDirectory, 'contact-sheet.webp'));

  return results;
}

function structuredDescription(product, status, existingDetails = {}) {
  const isKundan = product.category === 'Kundan Stones';
  const isBangleBox = product.type === 'bangle boxes';
  const description = isKundan
    ? `${product.name} feature glossy black stones in gold-colour frames for silk thread bangles, jewellery making, blouse work and decorative craft projects. The exact stone measurement is not stated, so use the close-up product photographs and selected pack as the visual reference. The gallery shows rim thickness, prong placement, surface reflections and backside coating details.`
    : isBangleBox
      ? `${product.name} contains assorted-colour plain plastic bangles for silk thread wrapping, bridal bangle sets and handmade jewellery projects. Select the required bangle size before ordering. Product photographs show the supplied colour assortment and ${product.name.includes('Flat') ? 'flat' : 'rounded'} edge profile.`
      : `${product.name} has colour stones set in a gold-colour chain for bangle borders, jewellery making, blouse work and decorative craft projects. The exact stone measurement is not stated, so use the close-up product photograph as the visual reference before ordering.`;
  return JSON.stringify({
    ...existingDetails,
    _bbc: 1,
    description,
    status,
    featured: Boolean(existingDetails.featured),
  });
}

function parseDetails(value) {
  if (!value?.startsWith('{')) return {};
  try { return JSON.parse(value); }
  catch { return {}; }
}

function rowForProduct(product, existing, storageUrls) {
  const images = imagePaths(product).map((image) => storageUrls.get(image.filename) || image.publicPath);
  const status = parseDetails(existing?.desc_text).status || product.status || 'active';
  const name = product.name;
  const isKundan = product.category === 'Kundan Stones';
  const metaDescription = isKundan
    ? `Shop ${name} in 10g, 50g and 100g packs for bangles, jewellery, blouse and craft work. Premium close-up photos. Delivery across India.`
    : product.type === 'bangle boxes'
      ? `Buy ${name} in assorted colours for silk thread and handmade bangle projects. Choose your bangle size. Packed in Hyderabad for India delivery.`
      : `Buy ${name} for bangles, jewellery making, blouse work and crafts. See the actual colour and finish in premium close-up photos.`;
  return {
    id: existing?.id || crypto.randomUUID(),
    name,
    slug: product.slug,
    price: Number(existing?.price ?? product.price),
    mrp: Number(existing?.mrp ?? product.mrp),
    cat: existing?.cat || product.category,
    bg: existing?.bg || '#FAF9F6',
    emoji: existing?.emoji || 'BBC',
    desc_text: structuredDescription(product, status, parseDetails(existing?.desc_text)),
    tag: [name, product.type, isKundan ? 'black kundans, kundan stones' : 'jewellery making supplies, bangle making materials'].join(', '),
    sizes: existing?.sizes?.length ? existing.sizes : (product.sizes || []),
    image_url: images.length > 1 ? JSON.stringify(images) : images[0],
    meta_title: `${name} | Bangle by Choice`,
    meta_description: metaDescription.slice(0, 160),
    alt_text: `${name} premium product photo with diagonal Bangle By Choice watermark`,
  };
}

function localSlug(product) {
  return product.slug || product.url?.split('/').filter(Boolean).at(-1) || '';
}

function localProduct(product, databaseRow) {
  const images = imagePaths(product).map((image) => image.catalogPath);
  const status = parseDetails(databaseRow.desc_text).status || 'active';
  return {
    id: crypto.createHash('sha1').update(product.slug).digest('hex').slice(0, 12),
    url: `https://www.banglebychoice.in/products/${product.slug}`,
    source: 'banglebychoice',
    currency: 'INR',
    name: databaseRow.name,
    price: databaseRow.mrp,
    sale_price: databaseRow.price,
    category: databaseRow.cat,
    subcategory: product.type,
    type: product.type,
    availability: status === 'draft' ? 'Out of Stock' : 'In Stock',
    weight: '',
    description: parseDetails(databaseRow.desc_text).description,
    images,
    options: databaseRow.sizes,
  };
}

async function publishCatalog() {
  const client = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY,
  );
  const slugs = products.map((product) => product.slug);
  const { data: existingRows, error: selectError } = await client.from('products').select('*').in('slug', slugs);
  if (selectError) throw selectError;
  const existingBySlug = new Map(existingRows.map((row) => [row.slug, row]));
  const bucket = 'product-images';
  const storageUrls = new Map();
  for (const product of products) {
    for (const image of imagePaths(product)) {
      const storagePath = `catalog-2026-08-08/${image.filename}`;
      const file = await fs.readFile(path.join(publicDirectory, image.filename));
      const { error: uploadError } = await client.storage.from(bucket).upload(storagePath, file, {
        contentType: 'image/webp',
        cacheControl: '31536000',
        upsert: true,
      });
      if (uploadError) throw uploadError;
      const { data } = client.storage.from(bucket).getPublicUrl(storagePath);
      storageUrls.set(image.filename, data.publicUrl);
    }
  }
  const rows = products.map((product) => rowForProduct(product, existingBySlug.get(product.slug), storageUrls));

  const backupPath = path.join(root, 'data', `whatsapp-products-2026-08-08-backup-${new Date().toISOString().replaceAll(':', '-')}.json`);
  await fs.writeFile(backupPath, `${JSON.stringify({ existingRows, incomingRows: rows }, null, 2)}\n`);

  const { data: published, error: upsertError } = await client.from('products').upsert(rows, { onConflict: 'slug' }).select('*');
  if (upsertError) throw upsertError;

  const catalog = JSON.parse(await fs.readFile(catalogPath, 'utf8'));
  const publishedBySlug = new Map(published.map((row) => [row.slug, row]));
  const requestedSlugs = new Set(slugs);
  catalog.products = catalog.products.filter((item) => !requestedSlugs.has(localSlug(item)));
  catalog.products.push(...products.map((product) => localProduct(product, publishedBySlug.get(product.slug))));
  catalog.total_products = catalog.products.length;
  catalog.scraped_at = new Date().toISOString();
  await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`);

  return {
    backupPath,
    created: rows.filter((row) => !existingBySlug.has(row.slug)).map((row) => row.slug),
    updated: rows.filter((row) => existingBySlug.has(row.slug)).map((row) => row.slug),
    uploadedImages: storageUrls.size,
    published: published.map((row) => ({ slug: row.slug, image_url: row.image_url, status: parseDetails(row.desc_text).status })),
  };
}

const images = await buildImages();
const publication = shouldApply ? await publishCatalog() : null;
console.log(JSON.stringify({ shouldApply, images, contactSheet: path.join(qaDirectory, 'contact-sheet.webp'), publication }, null, 2));
