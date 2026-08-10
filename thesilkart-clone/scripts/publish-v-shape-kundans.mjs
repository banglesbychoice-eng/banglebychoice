import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const products = [
  { oldSlug: 'v-shape-dark-green-glossy', slug: 'v-shape-dark-green-glossy-kundans', colour: 'Dark Green' },
  { oldSlug: 'v-shape-dark-pink-glossy', slug: 'v-shape-dark-pink-glossy-kundans', colour: 'Dark Pink' },
  { oldSlug: 'v-shape-dark-purpule-glossy', slug: 'v-shape-dark-purple-glossy-kundans', colour: 'Dark Purple' },
  { oldSlug: 'v-shape-glossy-gold', slug: 'v-shape-glossy-gold-kundans', colour: 'Glossy Gold', goldFirst: true },
  { oldSlug: 'v-shape-glossy-white', slug: 'v-shape-glossy-white-kundans', colour: 'Glossy White', whiteFirst: true },
  { oldSlug: 'v-shape-light-green-glossy', slug: 'v-shape-light-green-glossy-kundans', colour: 'Light Green' },
  { oldSlug: 'v-shape-orange-glossy', slug: 'v-shape-orange-glossy-kundans', colour: 'Orange' },
  { oldSlug: 'v-shape-sky-blue-glossy', slug: 'v-shape-sky-blue-glossy-kundans', colour: 'Sky Blue' },
];

function productName(product) {
  if (product.goldFirst) return 'V Shape Glossy Gold Kundans';
  if (product.whiteFirst) return 'V Shape Glossy White Kundans';
  return `V Shape ${product.colour} Glossy Kundans`;
}

function productDescription(product) {
  const colour = product.colour.toLowerCase();
  return `Shop premium V-shaped ${colour} glass Kundans with antique-gold settings for silk thread bangles, jewellery making, blouse work and decorative crafts.`;
}

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } },
);

const catalogPath = path.join(process.cwd(), 'data', 'products.json');
const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));
const published = [];

for (const product of products) {
  const name = productName(product);
  const description = productDescription(product);
  const image = `/images/kundan-stones/${product.slug}-hero-top-view-v4.webp`;
  const metaDescription = `Buy ${name} with antique-gold settings for bangles, jewellery making, blouse work and craft projects from Bangle By Choice.`;
  const altText = `${name} premium top-view product image with antique-gold setting`;

  const { data: candidates, error: readError } = await supabase
    .from('products')
    .select('*')
    .in('slug', [product.oldSlug, product.slug]);
  if (readError) throw readError;
  if (candidates.length !== 1) {
    throw new Error(`Expected one database product for ${product.oldSlug}; found ${candidates.length}.`);
  }

  const existing = candidates[0];
  let details = {};
  try { details = JSON.parse(existing.desc_text || '{}'); } catch {}

  const { error: updateError } = await supabase.from('products').update({
    name,
    slug: product.slug,
    image_url: image,
    tag: 'V Shape Glossy Kundans',
    desc_text: JSON.stringify({ ...details, _bbc: 1, status: 'active', description }),
    meta_title: name,
    meta_description: metaDescription,
    alt_text: altText,
  }).eq('id', existing.id);
  if (updateError) throw updateError;

  const local = catalog.products.find((row) => {
    const rowSlug = row.url?.split('/').filter(Boolean).at(-1);
    return rowSlug === product.oldSlug || rowSlug === product.slug;
  });
  if (!local) throw new Error(`Local product not found: ${product.oldSlug}`);

  local.url = `https://www.banglebychoice.in/products/${product.slug}`;
  local.name = name;
  local.description = description;
  local.images = [image.slice(1)];
  local.subcategory = 'V Shape Glossy Kundans';
  local.type = `V shape ${product.colour.toLowerCase()} glossy glass Kundans`;

  published.push({ id: existing.id, oldSlug: product.oldSlug, slug: product.slug, image });
}

await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');
console.log(JSON.stringify(published, null, 2));
