import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';

config({ path: '.env.local', quiet: true });

const oldSlug = 'crown-shape-glossy-white';
const slug = 'crown-shape-glossy-white-kundans';
const name = 'Crown Shape Glossy White Kundans';
const image = `/images/kundan-stones/${slug}-hero-top-view-v2.webp`;
const description = 'Shop crown-shaped glossy white glass Kundans with antique-gold settings for silk thread bangles, jewellery making, blouse work and decorative crafts.';
const metaTitle = 'Crown Shape Glossy White Kundans';
const metaDescription = 'Buy Crown Shape Glossy White Kundans with antique-gold settings for bangles, jewellery making, blouse work and craft projects from Bangle By Choice.';
const altText = 'Crown Shape Glossy White Kundans premium top-view product image with antique-gold setting';
const client = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });

const { data: existing, error: readError } = await client.from('products').select('*').eq('slug', oldSlug).single();
if (readError) throw readError;

let details = {};
try { details = JSON.parse(existing.desc_text || '{}'); } catch {}

const { error: updateError } = await client.from('products').update({
  name,
  slug,
  image_url: image,
  tag: 'Crown Shape Glossy White Kundans',
  desc_text: JSON.stringify({ ...details, _bbc: 1, status: 'active', description }),
  meta_title: metaTitle,
  meta_description: metaDescription,
  alt_text: altText,
}).eq('id', existing.id);
if (updateError) throw updateError;

const catalogPath = path.join(process.cwd(), 'data', 'products.json');
const catalog = JSON.parse((await fs.readFile(catalogPath, 'utf8')).replace(/^\uFEFF/, ''));
const product = catalog.products.find((row) => row.url?.split('/').filter(Boolean).at(-1) === oldSlug);
if (!product) throw new Error(`Local product not found: ${oldSlug}`);
product.url = `https://www.banglebychoice.in/products/${slug}`;
product.name = name;
product.description = description;
product.images = [image.slice(1)];
product.subcategory = 'Crown Shape Glossy Kundans';
product.type = 'Crown shape glossy glass kundans';
await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');

console.log(JSON.stringify({ id: existing.id, oldSlug, slug, image }));
