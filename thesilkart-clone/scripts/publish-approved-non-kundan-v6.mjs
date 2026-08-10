import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const apply = process.argv.includes('--apply');
const workspace = path.resolve(process.cwd(), '..', '..', '..');
const restorationPath = path.join(workspace, 'Kundans', 'restored-non-kundan-v6.json');
const catalogPath = path.join(process.cwd(), 'data', 'products.json');
const reportPath = path.join(workspace, 'Kundans', 'non-kundan-v6-publication-report.json');
const localBackupPath = path.join(workspace, 'Kundans', 'products-before-non-kundan-v6.json');
const databaseBackupPath = path.join(workspace, 'Kundans', 'supabase-products-before-non-kundan-v6.json');

const rejected = new Map([
  [1, 'Product detail changed around the original watermark.'],
  [4, 'Residual white watermark fragments.'],
  [15, 'Residual white watermark fragment.'],
  [29, 'Original supplier text remains visible.'],
  [30, 'Fine chain links are distorted.'],
  [84, 'Residual white watermark fragments.'],
  [109, 'Residual white watermark fragments.'],
  [110, 'Residual white watermark fragment.'],
  [115, 'Residual white watermark fragment.'],
  [116, 'Original supplier text remains visible.'],
  [192, 'Residual white watermark fragment.'],
  [204, 'Residual white watermark fragment.'],
  [258, 'Residual white watermark fragment.'],
  [268, 'Original supplier text remains visible.'],
  [270, 'Original supplier text remains visible.'],
  [272, 'Original supplier text remains visible.'],
  [274, 'Original supplier text remains visible.'],
  [275, 'Original supplier text remains visible.'],
  [279, 'Original supplier text remains visible.'],
  [288, 'Original supplier text remains visible.'],
  [289, 'Original supplier text remains visible.'],
  [290, 'Original supplier text remains visible.'],
  [291, 'Original supplier text remains visible.'],
  [295, 'Residual white watermark fragments.'],
  [300, 'Original supplier text remains visible.'],
  [301, 'Original supplier text remains visible.'],
  [302, 'Original supplier text remains visible.'],
  [314, 'Residual white watermark fragment.'],
  [315, 'Residual white watermark fragments.'],
  [327, 'Original supplier text remains visible.'],
]);

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

function cleanProductName(value = '') {
  return cleanAltText(value)
    .replace(/swaroski/gi, 'Swarovski')
    .replace(/\bperals\b/gi, 'pearls')
    .replace(/\bperal\b/gi, 'pearl')
    .replace(/\bpendents\b/gi, 'pendants')
    .replace(/\bpendent\b/gi, 'pendant')
    .replace(/\blocet\b/gi, 'locket')
    .replace(/\bchaine\b/gi, 'chain')
    .replace(/\bbroch\b/gi, 'brooch')
    .replace(/\s+/g, ' ')
    .trim();
}

function seoSlug(value = '') {
  return value
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

function normalizeName(value = '') {
  return cleanProductName(value).toLowerCase().replace(/[^a-z0-9]+/g, ' ').replace(/\s+/g, ' ').trim();
}

function categoryName(value = '') {
  if (/imitation/i.test(value)) return 'Imitation Jewellery Material';
  if (/silk thread/i.test(value)) return 'Silk Thread Materials';
  return 'Jewellery Making';
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
if (restoration.records.length !== 336) {
  throw new Error(`Expected 336 non-kundan records, found ${restoration.records.length}.`);
}

const reviewed = restoration.records.map((record, index) => ({
  ...record,
  qaIndex: index + 1,
  approved: !rejected.has(index + 1),
  rejectionReason: rejected.get(index + 1) || null,
}));
const approved = reviewed.filter((record) => record.approved);
const approvedByOldPath = new Map(approved.map((record) => [normalizeImage(record.oldPublicPath), record.heroPath]));

const catalogText = (await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, '');
const catalog = JSON.parse(catalogText);
const localUpdates = [];
for (const product of catalog.products) {
  const oldImages = product.images.map((image) => normalizeImage(image));
  const nextImages = oldImages.map((image) => approvedByOldPath.get(image) || image);
  if (nextImages.every((image, index) => image === oldImages[index])) continue;
  localUpdates.push({
    product,
    slug: product.url.split('/').filter(Boolean).at(-1),
    oldImages: [...product.images],
    nextImages: nextImages.map((image) => `images/${image}`),
  });
}

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } },
);
const { data: databaseProducts, error: readError } = await supabase
  .from('products')
  .select('id,slug,name,image_url,alt_text,cat,bg,emoji');
if (readError) throw readError;

const databaseUpdates = databaseProducts
  .map((product) => {
    const heroPath = approvedByOldPath.get(normalizeImage(product.image_url));
    if (!heroPath) return null;
    return {
      databaseProduct: product,
      imageUrl: `/images/${heroPath}`,
      altText: `${cleanAltText(product.name)} product image with transparent Bangle By Choice watermark`,
    };
  })
  .filter(Boolean);

const databaseByImage = new Map(databaseProducts.map((product) => [normalizeImage(product.image_url), product]));
const databaseByName = new Map(databaseProducts.map((product) => [normalizeName(product.name), product]));
const databaseSlugs = new Set(databaseProducts.map((product) => product.slug));
const defaultsByCategory = new Map();
for (const product of databaseProducts) {
  if (!defaultsByCategory.has(product.cat)) defaultsByCategory.set(product.cat, product);
}

const insertCandidatesByName = new Map();
for (const item of localUpdates) {
  const oldImage = normalizeImage(item.oldImages[0]);
  const normalizedName = normalizeName(item.product.name);
  if (databaseByImage.has(oldImage) || databaseByName.has(normalizedName)) continue;
  if (!insertCandidatesByName.has(normalizedName)) insertCandidatesByName.set(normalizedName, item);
}

const databaseInserts = [...insertCandidatesByName.values()].map((item) => {
  const name = cleanProductName(item.product.name);
  const slug = seoSlug(name);
  if (databaseSlugs.has(slug)) throw new Error(`SEO slug already exists for missing product: ${slug}`);
  databaseSlugs.add(slug);
  const cat = categoryName(item.product.category);
  const defaults = defaultsByCategory.get(cat) || {};
  const description = `Shop ${name} for jewellery making, silk thread bangles, blouse work and DIY craft projects from Bangle By Choice.`;
  const imageUrl = `/${item.nextImages[0]}`;
  return {
    item,
    fields: {
      name,
      slug,
      price: Number(item.product.sale_price || item.product.price || 0),
      mrp: Number(item.product.price || item.product.sale_price || 0),
      cat,
      bg: defaults.bg || '#FAF8F4',
      emoji: defaults.emoji || 'BBC',
      desc_text: JSON.stringify({ _bbc: 1, status: 'active', description }),
      tag: `${name}, jewellery making supplies, bangle making materials`,
      sizes: [],
      image_url: imageUrl,
      meta_title: `${name} | Bangle By Choice`,
      meta_description: `Buy ${name} online for jewellery making, bangles and craft projects from Bangle By Choice.`,
      alt_text: `${name} product image with transparent Bangle By Choice watermark`,
    },
  };
});

const report = {
  generatedAt: new Date().toISOString(),
  mode: apply ? 'apply' : 'dry-run',
  sourceRecords: reviewed.length,
  approvedImages: approved.length,
  rejectedImages: reviewed.length - approved.length,
  localProductsUpdated: localUpdates.length,
  databaseProductsUpdated: databaseUpdates.length,
  databaseProductsInserted: databaseInserts.length,
  rejected: reviewed
    .filter((record) => !record.approved)
    .map((record) => ({ index: record.qaIndex, category: record.category, slug: record.slug, reason: record.rejectionReason })),
};

if (apply) {
  await fs.writeFile(localBackupPath, `${catalogText.trimEnd()}\n`, 'utf8');
  await fs.writeFile(
    databaseBackupPath,
    `${JSON.stringify({ updates: databaseUpdates.map((item) => item.databaseProduct), inserts: databaseInserts.map((item) => item.fields) }, null, 2)}\n`,
    'utf8',
  );

  if (databaseInserts.length > 0) {
    const { error } = await supabase.from('products').insert(databaseInserts.map((item) => item.fields));
    if (error) throw error;
  }

  await runConcurrent(databaseUpdates, 10, async (item) => {
    const { error } = await supabase.from('products').update({
      image_url: item.imageUrl,
      alt_text: item.altText,
    }).eq('id', item.databaseProduct.id);
    if (error) throw error;
  });

  for (const item of localUpdates) item.product.images = item.nextImages;
  for (const insert of databaseInserts) {
    insert.item.product.url = `https://www.banglebychoice.in/products/${insert.fields.slug}`;
    insert.item.product.source = 'banglebychoice';
    insert.item.product.name = insert.fields.name;
    insert.item.product.category = insert.fields.cat;
    insert.item.product.description = JSON.parse(insert.fields.desc_text).description;
  }
  await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');
}

await fs.writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`, 'utf8');
console.log(JSON.stringify({ ...report, rejected: report.rejected.length, reportPath }, null, 2));
