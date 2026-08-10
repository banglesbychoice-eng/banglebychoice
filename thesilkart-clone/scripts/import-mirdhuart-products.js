import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local' });

const API_BASE = 'https://mirdhuart.com/wp-json/wc/store/v1';
const EXCLUDED_CATEGORY_SLUGS = new Set(['imitation-jewelry']);
const BATCH_SIZE = 100;

const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);

function decodeHtml(value = '') {
  return value
    .replace(/&#8211;/g, '–')
    .replace(/&#038;|&amp;/g, '&')
    .replace(/&#8377;/g, '₹')
    .replace(/&quot;/g, '"')
    .replace(/&#8217;/g, "'")
    .replace(/&#8220;|&#8221;/g, '"')
    .replace(/&nbsp;/g, ' ')
    .replace(/&#(\d+);/g, (_match, code) => String.fromCharCode(Number(code)))
    .replace(/\s+/g, ' ')
    .trim();
}

function stripHtml(value = '') {
  return decodeHtml(value.replace(/<[^>]+>/g, ' '));
}

function slugify(value = '') {
  return decodeHtml(value).toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
}

async function fetchJson(url) {
  const response = await fetch(url, { headers: { Accept: 'application/json', 'User-Agent': 'BangleByChoiceCatalogImporter/1.0' } });
  if (!response.ok) throw new Error(`${response.status} ${response.statusText}: ${url}`);
  return response.json();
}

function lineage(category, categoryById) {
  const items = [];
  let current = category;
  const seen = new Set();
  while (current && !seen.has(current.id)) {
    seen.add(current.id);
    items.unshift(current);
    current = current.parent ? categoryById.get(current.parent) : null;
  }
  return items;
}

function productLineages(product, categoryById) {
  return (product.categories || [])
    .map((category) => categoryById.get(category.id) || category)
    .filter((category) => category.slug !== 'all')
    .map((category) => lineage(category, categoryById));
}

function shouldExclude(product, categoryById) {
  return productLineages(product, categoryById).some((items) => items.some((category) => EXCLUDED_CATEGORY_SLUGS.has(category.slug) || /imitation/i.test(decodeHtml(category.name))));
}

function chooseCategory(product, categoryById) {
  const lineages = productLineages(product, categoryById);
  const primaryLineage = lineages.sort((left, right) => right.length - left.length)[0] || [];
  const top = primaryLineage[0] || product.categories?.find((category) => category.slug !== 'all');
  const deepest = primaryLineage.at(-1) || top;
  return {
    category: normalizeCategory(decodeHtml(top?.name || 'Mirdhu Art Products')),
    subcategory: decodeHtml(deepest?.name || top?.name || 'Imported products'),
  };
}

function normalizeCategory(value) {
  const normalized = decodeHtml(value);
  const lookup = {
    'Hair accessories': 'Hair Accessories',
    'Imitation jewelery material': 'Imitation jewellery material',
    'Stock clearance sets': 'Stock Clearance Sets',
    'Fancy items': 'Fancy Items',
  };
  return lookup[normalized] || normalized;
}

function priceAmount(product, key) {
  const value = product.prices?.[key] || product.prices?.price || '0';
  const amount = Number(String(value).replace(/[^\d.]/g, ''));
  return Number.isFinite(amount) && amount > 0 ? Math.round(amount) : 0;
}

function buildDescription(product, category, subcategory) {
  const short = stripHtml(product.short_description || product.description || '');
  const dispatch = /dispatch/i.test(short) ? ' Confirm availability and dispatch timing on WhatsApp before payment.' : '';
  return `${decodeHtml(product.name)} is listed in ${subcategory} for customers shopping ${category.toLowerCase()} and festive accessories. Check the product image, size option and order quantity before confirming.${dispatch} Packed through Bangle by Choice with WhatsApp-assisted checkout.`;
}

function normalizeProduct(product, categoryById) {
  const { category, subcategory } = chooseCategory(product, categoryById);
  const name = decodeHtml(product.name);
  const price = priceAmount(product, 'sale_price');
  const regularPrice = priceAmount(product, 'regular_price') || price;
  const maxPrice = Number(product.prices?.price_range?.max_amount || regularPrice);
  const images = (product.images || []).map((image) => image.src).filter(Boolean);
  const description = buildDescription(product, category, subcategory);
  const details = {
    _bbc: 1,
    description,
    sku: product.sku || `MIRDHU-${product.id}`,
    stock_quantity: null,
    status: product.is_in_stock ? 'active' : 'draft',
    featured: false,
    source: 'mirdhuart.com',
    source_url: product.permalink,
  };

  return {
    name,
    slug: `mirdhu-${product.slug || slugify(name)}`,
    price: Math.max(price, regularPrice, maxPrice || 0) || price || 1,
    mrp: null,
    cat: category,
    bg: '#FDF2F8',
    emoji: '◇',
    desc_text: JSON.stringify(details),
    tag: subcategory,
    sizes: [],
    image_url: images.length > 1 ? JSON.stringify(images) : images[0] || null,
    meta_title: `${name} | Bangle by Choice`,
    meta_description: `${name} for ${category.toLowerCase()} shoppers. Order through Bangle by Choice on WhatsApp.`,
    alt_text: `${name} from Bangle by Choice`,
  };
}

async function fetchAllCategories() {
  return fetchJson(`${API_BASE}/products/categories?per_page=100`);
}

async function fetchAllProducts() {
  const products = [];
  for (let page = 1; ; page += 1) {
    const batch = await fetchJson(`${API_BASE}/products?per_page=100&page=${page}`);
    if (!batch.length) break;
    products.push(...batch);
    console.log(`Fetched page ${page}: ${batch.length} products`);
    if (batch.length < 100) break;
  }
  return products;
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
  const categories = await fetchAllCategories();
  const categoryById = new Map(categories.map((category) => [category.id, category]));
  const products = await fetchAllProducts();
  const included = products.filter((product) => !shouldExclude(product, categoryById));
  const excluded = products.length - included.length;
  const normalized = included.map((product) => normalizeProduct(product, categoryById)).filter((product) => product.price > 0 && product.image_url);
  const sections = [...new Set(normalized.map((product) => product.cat))].sort();

  console.log(JSON.stringify({ fetched: products.length, excluded, importable: normalized.length, sections }, null, 2));
  if (dryRun) return;
  await upsertProducts(normalized);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
