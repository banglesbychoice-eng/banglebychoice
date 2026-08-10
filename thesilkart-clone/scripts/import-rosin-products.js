import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local' });

const SITE_BASE = 'https://rosinjewellery.com';
const BATCH_SIZE = 100;
const REQUEST_DELAY_MS = 250;
const RETRY_DELAYS_MS = [1500, 4000, 9000];

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
);

function decodeHtml(value = '') {
  return String(value)
    .replace(/&#038;|&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;|&#8217;/g, "'")
    .replace(/&#8211;|&#8212;/g, '-')
    .replace(/&nbsp;/g, ' ')
    .replace(/&#(\d+);/g, (_match, code) => String.fromCharCode(Number(code)))
    .replace(/\s+/g, ' ')
    .trim();
}

function stripHtml(value = '') {
  return decodeHtml(String(value).replace(/<[^>]+>/g, ' '));
}

function slugify(value = '') {
  return decodeHtml(value).toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
}

function priceAmount(value) {
  const amount = Number(String(value || '').replace(/[^\d.]/g, ''));
  return Number.isFinite(amount) && amount > 0 ? Math.round(amount) : 0;
}

async function fetchJson(path) {
  const url = path.startsWith('http') ? path : `${SITE_BASE}${path}`;
  for (let attempt = 0; attempt <= RETRY_DELAYS_MS.length; attempt += 1) {
    const response = await fetch(url, {
      headers: { Accept: 'application/json', 'User-Agent': 'BangleByChoiceCatalogImporter/1.0' },
    });
    if (response.ok) {
      await new Promise((resolve) => setTimeout(resolve, REQUEST_DELAY_MS));
      return response.json();
    }
    if (response.status !== 429 || attempt === RETRY_DELAYS_MS.length) {
      throw new Error(`${response.status} ${response.statusText}: ${url}`);
    }
    const delay = RETRY_DELAYS_MS[attempt];
    console.log(`Rate limited, retrying in ${delay}ms: ${url}`);
    await new Promise((resolve) => setTimeout(resolve, delay));
  }
}

async function fetchPaged(path, key) {
  const rows = [];
  for (let page = 1; ; page += 1) {
    const separator = path.includes('?') ? '&' : '?';
    const data = await fetchJson(`${path}${separator}limit=250&page=${page}`);
    const batch = data[key] || [];
    if (!batch.length) break;
    rows.push(...batch);
    if (batch.length < 250) break;
  }
  return rows;
}

function isImitation(value = '') {
  return /im{1,2}itation/i.test(value);
}

function shouldExcludeProduct(product, membership) {
  const searchable = [product.title, product.handle, product.product_type, ...(product.tags || []), ...membership.map((collection) => collection.title), ...membership.map((collection) => collection.handle)].join(' ');
  return isImitation(searchable);
}

function chooseCategory(product, membership) {
  const usable = membership.filter((collection) => !isImitation(`${collection.title} ${collection.handle}`));
  const title = `${product.title} ${product.handle}`.toLowerCase();
  const collectionText = usable.map((collection) => `${collection.title} ${collection.handle}`.toLowerCase()).join(' ');

  const preferred = [
    [/saree[-\s]?pins?/.test(collectionText), 'Saree Pins'],
    [/(hair|clip|clutch|rubber|headband)/.test(collectionText), 'Hair Accessories'],
    [/(bangle|bridal|glass|ghungroo|kada)/.test(collectionText) || /bangle|stack|glass/.test(title), 'Bangles'],
    [/(earring|necklace|neckpiece|chain)/.test(collectionText), 'Jewellery Sets'],
    [/return[-\s]?gifts?/.test(collectionText), 'Return Gifts'],
    [/kids/.test(collectionText), 'Kids Accessories'],
  ].find(([matches]) => matches);

  return {
    category: normalizeCategory(preferred?.[1] || decodeHtml(usable[0]?.title || 'Rosin Jewellery')),
    subcategory: decodeHtml(usable.at(-1)?.title || usable[0]?.title || 'Imported products'),
  };
}

function normalizeCategory(value) {
  const lookup = {
    'Stock clearance sets': 'Stock Clearance Sets',
    'Fancy items': 'Fancy Items',
  };
  return lookup[value] || value;
}

function uniqueBy(items, getKey) {
  const seen = new Set();
  return items.filter((item) => {
    const key = getKey(item);
    if (!key || seen.has(key)) return false;
    seen.add(key);
    return true;
  });
}

function variantLabel(variant) {
  const label = decodeHtml(variant.title || '');
  return label && label !== 'Default Title' ? label : 'Default';
}

function buildPackPrices(product) {
  const variants = uniqueBy(product.variants || [], (variant) => variantLabel(variant));
  if (variants.length <= 1 && variantLabel(variants[0]) === 'Default') return [];
  return variants
    .map((variant) => {
      const price = priceAmount(variant.price);
      const mrp = priceAmount(variant.compare_at_price);
      return {
        label: variantLabel(variant),
        price,
        mrp: mrp > price ? mrp : price,
      };
    })
    .filter((pack) => pack.label && pack.price > 0);
}

function buildDescription(product, category, subcategory) {
  const sourceDescription = stripHtml(product.body_html || '');
  const sourceHint = sourceDescription ? ` Use the photos and option labels to confirm the exact style, shade and size before checkout.` : '';
  return `${decodeHtml(product.title)} is listed under ${subcategory} for Bangle by Choice customers shopping ${category.toLowerCase()} and festive accessories.${sourceHint} Add the required quantity to cart and confirm quickly on WhatsApp for availability, shipping and final dispatch support.`;
}

function normalizeProduct(product, membership) {
  const { category, subcategory } = chooseCategory(product, membership);
  const name = decodeHtml(product.title);
  const variants = product.variants || [];
  const variantPrices = variants.map((variant) => priceAmount(variant.price)).filter(Boolean);
  const comparePrices = variants.map((variant) => priceAmount(variant.compare_at_price)).filter(Boolean);
  const salePrice = variantPrices.length ? Math.min(...variantPrices) : 0;
  const maxCompare = comparePrices.length ? Math.max(...comparePrices) : 0;
  const images = uniqueBy((product.images || []).map((image) => image.src).filter(Boolean), (src) => src);
  const packPrices = buildPackPrices(product);
  const firstVariant = variants.find((variant) => variant.sku) || variants[0] || {};
  const details = {
    _bbc: 1,
    description: buildDescription(product, category, subcategory),
    sku: firstVariant.sku || `ROSIN-${product.id}`,
    stock_quantity: null,
    status: variants.some((variant) => variant.available) ? 'active' : 'draft',
    featured: false,
    source: 'rosinjewellery.com',
    source_url: `${SITE_BASE}/products/${product.handle}`,
  };

  return {
    name,
    slug: `rosin-${product.handle || slugify(name)}`,
    price: salePrice || 1,
    mrp: maxCompare > salePrice ? maxCompare : null,
    cat: category,
    bg: '#FFF7ED',
    emoji: '✦',
    desc_text: JSON.stringify(details),
    tag: subcategory,
    sizes: packPrices,
    image_url: images.length > 1 ? JSON.stringify(images) : images[0] || null,
    meta_title: `${name} | Bangle by Choice`,
    meta_description: `${name} in ${subcategory}. Shop ${category.toLowerCase()} from Bangle by Choice with WhatsApp checkout.`,
    alt_text: `${name} from Bangle by Choice`,
  };
}

async function fetchCollections() {
  const data = await fetchJson('/collections.json?limit=250');
  return data.collections || [];
}

async function fetchCollectionMembership(collections) {
  const productCollections = new Map();
  for (const collection of collections) {
    const products = await fetchPaged(`/collections/${collection.handle}/products.json`, 'products');
    for (const product of products) {
      const list = productCollections.get(product.id) || [];
      list.push({ handle: collection.handle, title: collection.title });
      productCollections.set(product.id, list);
    }
    console.log(`Mapped ${collection.handle}: ${products.length} products`);
  }
  return productCollections;
}

async function upsertProducts(products) {
  for (let index = 0; index < products.length; index += BATCH_SIZE) {
    const batch = products.slice(index, index + BATCH_SIZE);
    const { error } = await supabase.from('products').upsert(batch, { onConflict: 'slug' });
    if (error) throw error;
    console.log(`Imported ${Math.min(index + BATCH_SIZE, products.length)} / ${products.length}`);
  }
}

async function main() {
  const dryRun = process.argv.includes('--dry-run');
  const collections = await fetchCollections();
  const productCollections = await fetchCollectionMembership(collections);
  const products = await fetchPaged('/products.json', 'products');
  const included = products.filter((product) => !shouldExcludeProduct(product, productCollections.get(product.id) || []));
  const excluded = products.length - included.length;
  const normalized = included
    .map((product) => normalizeProduct(product, productCollections.get(product.id) || []))
    .filter((product) => product.price > 0 && product.image_url);
  const sections = [...new Set(normalized.map((product) => product.cat))].sort();

  console.log(JSON.stringify({ fetched: products.length, excluded, importable: normalized.length, sections }, null, 2));
  if (dryRun) return;
  await upsertProducts(normalized);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
