import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const products = [
  {
    oldSlug: '6k-eye-shape-dark-green-glossy',
    slug: '6k-eye-shape-dark-green-glossy-kundans',
    name: '6K Eye Shape Dark Green Glossy Kundans',
    image: '/images/kundan-stones/6k-eye-shape-dark-green-glossy-kundans-hero-top-view-v5.webp',
    description: 'Shop premium 6K eye-shaped dark green glossy glass Kundans with antique-gold settings for silk thread bangles, embroidery and jewellery making.',
    altText: '6K Eye Shape Dark Green Glossy Kundans premium top-view image with antique-gold setting',
  },
];

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false } },
);
const catalogPath = path.join(process.cwd(), 'data', 'products.json');
const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));

for (const product of products) {
  const { data: candidates, error: readError } = await supabase
    .from('products')
    .select('*')
    .in('slug', [product.oldSlug, product.slug]);
  if (readError) throw readError;
  if (candidates.length !== 1) throw new Error(`Expected one product for ${product.oldSlug}; found ${candidates.length}.`);

  const existing = candidates[0];
  let details = {};
  try { details = JSON.parse(existing.desc_text || '{}'); } catch {}
  const metaDescription = `Buy ${product.name} for bangles, embroidery, blouse work and jewellery making from Bangle By Choice.`;
  const { error: updateError } = await supabase.from('products').update({
    name: product.name,
    slug: product.slug,
    image_url: product.image,
    tag: '6K Eye Shape Glossy Kundans',
    desc_text: JSON.stringify({ ...details, _bbc: 1, status: 'active', description: product.description }),
    meta_title: product.name,
    meta_description: metaDescription,
    alt_text: product.altText,
  }).eq('id', existing.id);
  if (updateError) throw updateError;

  const local = catalog.products.find((row) => {
    const slug = row.url?.split('/').filter(Boolean).at(-1);
    return slug === product.oldSlug || slug === product.slug;
  });
  if (!local) throw new Error(`Local product not found: ${product.oldSlug}`);
  local.url = `https://www.banglebychoice.in/products/${product.slug}`;
  local.name = product.name;
  local.description = product.description;
  local.images = [product.image.slice(1)];
  local.subcategory = '6K Eye Shape Glossy Kundans';
  local.type = '6K eye shape glossy glass Kundans';
  console.log(JSON.stringify({ id: existing.id, slug: product.slug, image: product.image }));
}

await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');
