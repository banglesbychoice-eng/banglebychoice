import { unstable_cache } from 'next/cache';
import { getServerSupabase } from '@/lib/supabase-server';
import { cleanProductSlug, cleanProductText, getProduct, products as importedProducts, rawSlugCandidates, titleCase } from '@/lib/products';
import { deriveProductFacets } from '@/lib/product-facets';
import { isDisallowedProduct } from '@/lib/disallowed-products';
import { versionedProductImage } from '@/lib/product-utils';

const PRODUCT_PAGE_SIZE = 1000;
const PRODUCT_CACHE_SECONDS = 300;
export const PRODUCT_CACHE_TAG = 'products';

const canonicalCategories = new Map([
  ['kundan stones', 'Kundan Stones'],
  ['silk thread materials', 'Silk Thread Materials'],
  ['jewellery making', 'Jewellery Making'],
]);

function canonicalCategory(value) {
  const category = cleanProductText(value || 'Jewellery Making');
  return canonicalCategories.get(category.toLowerCase()) || category;
}

function productDescription(product) {
  const quantity = product.weight ? ` Available in ${product.weight}.` : '';
  const category = product.category.toLowerCase();
  const name = titleCase(product.name);
  if (category.includes('kundan')) return `${name} is selected for traditional jewellery, bridal bangles, maggam work and decorative craft projects. The ${cleanProductText(product.type || product.subcategory)} format helps makers build detailed borders, floral arrangements and custom motifs.${quantity} Pair it with a compatible jewellery or fabric adhesive and test the placement before fixing. Packed carefully in Hyderabad for delivery across India.`;
  if (category.includes('silk thread')) return `${name} is a practical choice for handmade bangles, jhumkas and decorative jewellery projects. This ${cleanProductText(product.type || product.subcategory)} can be combined with thread, stones, chain and suitable craft adhesive to create coordinated traditional or contemporary designs.${quantity} Plan the colour combination and layout before assembly for a cleaner finish. Packed carefully in Hyderabad for delivery across India.`;
  if (category.includes('imitation')) return `${name} is an imitation jewellery component suited to traditional, festive and everyday handmade designs. Use this ${cleanProductText(product.type || product.subcategory)} in coordinated earrings, necklaces, bangles or decorative craft work.${quantity} Check the product image and pack details before matching it with stones, chain or findings. Store finished pieces away from moisture and perfume. Delivered across India from Hyderabad.`;
  return `${name} is a jewellery-making material selected for custom bangles, earrings, necklaces and decorative craft projects. This ${cleanProductText(product.type || product.subcategory)} can be paired with compatible beads, findings, chain or adhesive depending on your design.${quantity} Check measurements and pack details before assembly, especially when combining several components. Packed carefully in Hyderabad for dependable delivery across India.`;
}

function parseStructuredDescription(value) {
  if (!value?.startsWith('{')) return { description: value || '' };
  try {
    const parsed = JSON.parse(value);
    return parsed?._bbc === 1 ? parsed : { description: value };
  } catch {
    return { description: value };
  }
}

function parseImages(value, fallback) {
  if (!value) return [fallback];
  if (value.startsWith('[')) {
    try {
      const images = JSON.parse(value).filter(Boolean);
      if (images.length) return images;
    } catch {}
  }
  return [value];
}

function packIsAvailable(pack) {
  return pack?.available !== false;
}

export function normalizeDatabaseProduct(row) {
  const imported = getProduct(row.slug);
  const fallbackImage = imported?.image || '/images/generated/banglebychoice-hero.webp';
  const images = parseImages(row.image_url, fallbackImage).map(versionedProductImage);
  const image = images[0];
  const details = parseStructuredDescription(row.desc_text);
  const packPrices = Array.isArray(row.sizes) && row.sizes.every((item) => item && typeof item === 'object') ? row.sizes : [];
  const product = {
    ...imported,
    id: row.id,
    raw_slug: row.slug,
    slug: cleanProductSlug(row.slug),
    name: cleanProductText(row.name),
    price: Number(row.mrp || row.price),
    sale_price: Number(row.price),
    category: canonicalCategory(row.cat || imported?.category),
    subcategory: cleanProductText(row.tag || imported?.subcategory || 'Craft material'),
    type: cleanProductText(imported?.type || row.tag || 'Jewellery-making material'),
    availability: details.status === 'draft' || details.stock_quantity === 0 || (packPrices.length > 0 && !packPrices.some(packIsAvailable)) ? 'Out of Stock' : imported?.availability || 'In Stock',
    image,
    images,
    description: details.description && !details.description.startsWith('DescriptionShipping') ? cleanProductText(details.description) : '',
    sku: details.sku || '',
    stock_quantity: Number.isFinite(Number(details.stock_quantity)) ? Number(details.stock_quantity) : null,
    shipping_weight_grams: Number.isFinite(Number(details.shipping_weight_grams)) ? Number(details.shipping_weight_grams) : null,
    status: details.status || 'active',
    featured: Boolean(details.featured),
    pack_prices: packPrices,
    meta_title: row.meta_title ? titleCase(row.meta_title) : '',
    meta_description: row.meta_description && !row.meta_description.startsWith('DescriptionShipping') ? cleanProductText(row.meta_description) : '',
    alt_text: cleanProductText(row.alt_text || row.name),
  };
  product.facets = deriveProductFacets(product);
  product.seoDescription = product.description || productDescription(product);
  return product;
}

export function normalizeCatalogProduct(row) {
  const imported = getProduct(row.slug);
  const fallbackImage = imported?.image || '/images/generated/banglebychoice-hero.webp';
  const images = parseImages(row.image_url, fallbackImage).map(versionedProductImage);
  const details = parseStructuredDescription(row.desc_text);
  const packPrices = Array.isArray(row.sizes) && row.sizes.every((item) => item && typeof item === 'object') ? row.sizes : [];
  const product = {
    id: row.id,
    raw_slug: row.slug,
    slug: cleanProductSlug(row.slug),
    name: cleanProductText(row.name),
    price: Number(row.mrp || row.price),
    sale_price: Number(row.price),
    category: canonicalCategory(row.cat || imported?.category),
    subcategory: cleanProductText(row.tag || imported?.subcategory || 'Craft material'),
    type: cleanProductText(imported?.type || row.tag || 'Jewellery-making material'),
    availability: details.status === 'draft' || details.stock_quantity === 0 || (packPrices.length > 0 && !packPrices.some(packIsAvailable)) ? 'Out of Stock' : imported?.availability || 'In Stock',
    image: images[0],
    alt_text: cleanProductText(row.alt_text || row.name),
    status: details.status || 'active',
    shipping_weight_grams: Number.isFinite(Number(details.shipping_weight_grams)) ? Number(details.shipping_weight_grams) : null,
    pack_prices: packPrices,
    updated_at: row.updated_at || row.created_at,
    weight: '',
  };
  product.facets = deriveProductFacets(product);
  product.pack_prices = (packPrices.find(packIsAvailable) ? packPrices.filter(packIsAvailable) : packPrices).slice(0, 1);
  return product;
}

export async function getDatabaseProducts() {
  try {
    const data = await getProductRows({ ascending: true });
    return data.map(normalizeDatabaseProduct).filter((product) => product.status !== 'draft' && !isDisallowedProduct(product));
  } catch (error) {
    console.error('Unable to load Supabase catalog:', error.message);
    return importedProducts.filter((product) => product.status !== 'draft' && !isDisallowedProduct(product));
  }
}

async function loadCatalogProducts() {
  try {
    const data = await getProductRows({ ascending: true, columns: 'id,name,slug,price,mrp,cat,tag,sizes,image_url,alt_text,desc_text,created_at,updated_at' });
    return data.map(normalizeCatalogProduct).filter((product) => product.status !== 'draft' && !isDisallowedProduct(product));
  } catch (error) {
    console.error('Unable to load compact Supabase catalog:', error.message);
    return importedProducts.filter((product) => product.status !== 'draft' && !isDisallowedProduct(product));
  }
}

const getCachedCatalogProducts = unstable_cache(loadCatalogProducts, ['catalog-products-v7'], {
  tags: [PRODUCT_CACHE_TAG],
  revalidate: PRODUCT_CACHE_SECONDS,
});

export async function getCatalogProducts() {
  return getCachedCatalogProducts();
}

async function loadDatabaseProduct(slug) {
  const { data, error } = await getServerSupabase().from('products').select('*').in('slug', rawSlugCandidates(slug)).limit(1).maybeSingle();
  if (error) console.error('Unable to load Supabase product:', error.message);
  if (!data) return null;
  return normalizeDatabaseProduct(data);
}

const getCachedDatabaseProduct = unstable_cache(loadDatabaseProduct, ['database-product-v6'], {
  tags: [PRODUCT_CACHE_TAG],
  revalidate: PRODUCT_CACHE_SECONDS,
});

export async function getDatabaseProduct(slug) {
  return getCachedDatabaseProduct(slug);
}

export async function getProductRows({ ascending = true, columns = '*' } = {}) {
  const client = getServerSupabase();
  const rows = [];
  for (let from = 0; ; from += PRODUCT_PAGE_SIZE) {
    const { data, error } = await client
      .from('products')
      .select(columns)
      .order('created_at', { ascending })
      .range(from, from + PRODUCT_PAGE_SIZE - 1);
    if (error) throw error;
    rows.push(...data);
    if (data.length < PRODUCT_PAGE_SIZE) break;
  }
  return rows;
}
