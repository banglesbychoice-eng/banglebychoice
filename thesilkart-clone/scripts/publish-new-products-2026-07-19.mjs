import crypto from 'node:crypto';
import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const apply = process.argv.includes('--apply');
const root = process.cwd();
const sourceRoot = path.resolve(root, '..', '..', '..', 'Clip stones, charms, enamel charms and other');
const auditDir = path.join(sourceRoot, '_inventory', 'catalog-publication');
const manifestPath = path.join(root, 'data', 'new-products-2026-07-19.json');
const catalogPath = path.join(root, 'data', 'products.json');
const reportPath = path.join(auditDir, 'new-products-publication-report.json');

const normalizeName = (value = '') => value.toLowerCase().replace(/[^a-z0-9]+/g, ' ').replace(/\s+/g, ' ').trim();
const absoluteImage = (value) => `/${value.replace(/^\/+/, '')}`;

function unitLabel(product) {
  if (/clipstones?/i.test(product.name)) return 'per piece';
  if (/charms?/i.test(product.name)) return 'per piece';
  return '';
}

function seoFields(product, slug) {
  const unit = unitLabel(product);
  const priceCopy = unit ? ` at Rs ${product.price} ${unit}` : ` from Rs ${product.price}`;
  const useCopy = /clipstones?/i.test(product.name)
    ? 'for bangle decoration, jewellery making and craft work'
    : /charms?/i.test(product.name)
      ? 'for bangles, jewellery making, blouse work and DIY craft projects'
      : 'for jewellery making, bangle making and craft projects';
  const description = `Buy ${product.name}${priceCopy} from Bangle By Choice. Suitable ${useCopy}. Premium catalogue image shows the exact colour, finish and product details.`;
  const metaDescription = `Buy ${product.name} online${priceCopy}. Quality material for jewellery and bangle making. Order from Bangle By Choice.`;
  return {
    name: product.name,
    slug,
    price: Number(product.price),
    mrp: Number(product.mrp),
    cat: product.category,
    bg: '#FAF9F6',
    emoji: 'BBC',
    desc_text: JSON.stringify({ _bbc: 1, status: 'active', description, unit: unit || undefined }),
    tag: `${product.name}, ${product.subcategory}, ${product.type}, jewellery making supplies, bangle making materials`,
    sizes: [],
    image_url: absoluteImage(product.imagePath),
    meta_title: `${product.name} | Bangle By Choice`,
    meta_description: metaDescription.slice(0, 160),
    alt_text: `${product.name} premium product photo with Bangle By Choice watermark and phone number`,
  };
}

function localFields(product, slug, description) {
  return {
    url: `https://www.banglebychoice.in/products/${slug}`,
    source: 'banglebychoice',
    currency: 'INR',
    name: product.name,
    price: Number(product.mrp),
    sale_price: Number(product.price),
    category: product.category,
    subcategory: product.subcategory,
    type: product.type,
    availability: 'In Stock',
    weight: '',
    description,
    images: [product.imagePath],
  };
}

function indexByName(items) {
  const index = new Map();
  for (const item of items) {
    const key = normalizeName(item.name);
    if (!index.has(key)) index.set(key, []);
    index.get(key).push(item);
  }
  return index;
}

function findMatch(product, index, label) {
  const keys = [...new Set([product.matchName, product.name].filter(Boolean).map(normalizeName))];
  const matches = [...new Set(keys.flatMap((key) => index.get(key) || []))];
  if (matches.length > 1) {
    throw new Error(`${label} has ambiguous matches for ${product.name}: ${matches.map((item) => item.name).join(', ')}`);
  }
  return matches[0] || null;
}

async function runConcurrent(items, concurrency, worker) {
  let cursor = 0;
  const runners = Array.from({ length: concurrency }, async () => {
    while (cursor < items.length) {
      const index = cursor++;
      await worker(items[index], index);
    }
  });
  await Promise.all(runners);
}

const manifest = JSON.parse(await fs.readFile(manifestPath, 'utf8'));
const localCatalogText = (await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, '');
const localCatalog = JSON.parse(localCatalogText);
if (manifest.length !== 115) throw new Error(`Expected 115 unique products, found ${manifest.length}.`);

for (const product of manifest) {
  const imageFile = path.join(root, 'public', product.imagePath);
  const stat = await fs.stat(imageFile);
  if (stat.size < 30000) throw new Error(`Image is unexpectedly small: ${product.imagePath}`);
}

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } },
);
const { data: databaseProducts, error: readError } = await supabase.from('products').select('*').order('created_at');
if (readError) throw readError;

const databaseByName = indexByName(databaseProducts);
const localByName = indexByName(localCatalog.products);
const usedSlugs = new Set(databaseProducts.map((item) => item.slug));
const databaseUpdates = [];
const databaseInserts = [];
const localUpdates = [];
const localInserts = [];

for (const product of manifest) {
  const databaseMatch = findMatch(product, databaseByName, 'Database');
  let slug = databaseMatch?.slug || product.slug;
  if (!databaseMatch && usedSlugs.has(slug)) slug = `${slug}-${product.sourceIndex}`;
  usedSlugs.add(slug);
  const fields = seoFields(product, slug);
  if (databaseMatch) databaseUpdates.push({ product, existing: databaseMatch, fields: { ...fields, slug: databaseMatch.slug } });
  else databaseInserts.push({ product, fields });

  const localMatch = findMatch(product, localByName, 'Local catalogue');
  const description = JSON.parse(fields.desc_text).description;
  const local = localFields(product, fields.slug, description);
  if (localMatch) localUpdates.push({ product, existing: localMatch, fields: local });
  else localInserts.push({ product, fields: { id: crypto.createHash('sha1').update(fields.slug).digest('hex').slice(0, 12), ...local } });
}

const report = {
  generatedAt: new Date().toISOString(),
  mode: apply ? 'apply' : 'dry-run',
  sourceProducts: manifest.length,
  databaseBefore: databaseProducts.length,
  databaseUpdates: databaseUpdates.length,
  databaseInserts: databaseInserts.length,
  localBefore: localCatalog.products.length,
  localUpdates: localUpdates.length,
  localInserts: localInserts.length,
  updatedNames: databaseUpdates.map(({ product, existing }) => ({ from: existing.name, to: product.name })),
  insertedNames: databaseInserts.map(({ product }) => product.name),
};

await fs.mkdir(auditDir, { recursive: true });
if (apply) {
  await fs.writeFile(path.join(auditDir, 'products-local-before.json'), `${localCatalogText.trimEnd()}\n`);
  await fs.writeFile(path.join(auditDir, 'products-supabase-before.json'), `${JSON.stringify(databaseProducts, null, 2)}\n`);

  if (databaseInserts.length) {
    const { error } = await supabase.from('products').insert(databaseInserts.map(({ fields }) => fields));
    if (error) throw error;
  }
  await runConcurrent(databaseUpdates, 8, async ({ existing, fields }) => {
    const { error } = await supabase.from('products').update(fields).eq('id', existing.id);
    if (error) throw error;
  });

  for (const { existing, fields } of localUpdates) Object.assign(existing, fields);
  localCatalog.products.push(...localInserts.map(({ fields }) => fields));
  await fs.writeFile(catalogPath, `${JSON.stringify(localCatalog, null, 2)}\n`);

  const { data: verified, error: verifyError } = await supabase
    .from('products')
    .select('name,slug,image_url,price,mrp,meta_title,meta_description,alt_text')
    .in('image_url', manifest.map((product) => absoluteImage(product.imagePath)));
  if (verifyError) throw verifyError;
  if (verified.length !== manifest.length) throw new Error(`Verification found ${verified.length} of ${manifest.length} published products.`);
  const { count: totalCount, error: countError } = await supabase
    .from('products')
    .select('id', { count: 'exact', head: true });
  if (countError) throw countError;
  report.databaseAfter = totalCount;
  report.verifiedProducts = verified.length;
  report.localAfter = localCatalog.products.length;
}

await fs.writeFile(reportPath, `${JSON.stringify(report, null, 2)}\n`);
console.log(JSON.stringify({
  mode: report.mode,
  sourceProducts: report.sourceProducts,
  databaseBefore: report.databaseBefore,
  databaseUpdates: report.databaseUpdates,
  databaseInserts: report.databaseInserts,
  localBefore: report.localBefore,
  localUpdates: report.localUpdates,
  localInserts: report.localInserts,
  databaseAfter: report.databaseAfter,
  localAfter: report.localAfter,
  verifiedProducts: report.verifiedProducts,
  reportPath,
}, null, 2));
