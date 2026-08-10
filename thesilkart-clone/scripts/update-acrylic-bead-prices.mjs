import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';

dotenv.config({ path: '.env.local', quiet: true });

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const shouldApply = process.argv.includes('--apply');
const client = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
);

function parseDetails(value) {
  if (!value?.startsWith('{')) return {};
  try { return JSON.parse(value); }
  catch { return {}; }
}

const { data: products, error } = await client
  .from('products')
  .select('*')
  .ilike('name', '%acrylic%bead%')
  .order('name');

if (error) throw error;

const updates = products.map((product) => {
  const details = parseDetails(product.desc_text);
  return {
    id: product.id,
    name: product.name,
    slug: product.slug,
    price: 1,
    mrp: 1,
    cat: product.cat,
    bg: product.bg,
    emoji: product.emoji,
    desc_text: JSON.stringify({
      ...details,
      _bbc: 1,
      description: `${product.name} are sold individually at ₹1 per bead for jewellery making, bangle decoration, blouse work and DIY craft projects. Use the product photograph as the colour and finish reference before ordering.`,
      unit: 'per bead',
    }),
    tag: product.tag,
    sizes: [{ label: '1 bead', price: 1, mrp: 1 }],
    image_url: product.image_url,
    meta_title: `${product.name} at ₹1 Per Bead | Bangle by Choice`,
    meta_description: `Buy ${product.name} at ₹1 per bead for jewellery making, bangles and craft projects. Select the required quantity and order across India.`.slice(0, 160),
    alt_text: product.alt_text,
  };
});

if (shouldApply && updates.length) {
  const backupPath = path.join(root, 'data', `acrylic-bead-price-backup-${new Date().toISOString().replaceAll(':', '-')}.json`);
  await fs.writeFile(backupPath, `${JSON.stringify(products, null, 2)}\n`);
  const { error: updateError } = await client.from('products').upsert(updates, { onConflict: 'slug' });
  if (updateError) throw updateError;

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://www.banglebychoice.in';
  const loginResponse = await fetch(`${siteUrl}/api/admin/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ pin: process.env.ADMIN_PIN }),
  });
  if (!loginResponse.ok) throw new Error(`Unable to authenticate cache revalidation (${loginResponse.status}).`);
  const sessionCookie = loginResponse.headers.get('set-cookie')?.split(';')[0];
  const revalidateResponse = await fetch(`${siteUrl}/api/products/${updates[0].id}`, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json', Cookie: sessionCookie || '' },
    body: JSON.stringify({ price: 1, mrp: 1, sizes: [{ label: '1 bead', price: 1, mrp: 1 }] }),
  });
  if (!revalidateResponse.ok) throw new Error(`Unable to revalidate the product catalog (${revalidateResponse.status}).`);

  const catalogPath = path.join(root, 'data', 'products.json');
  const catalog = JSON.parse(await fs.readFile(catalogPath, 'utf8'));
  const slugs = new Set(updates.map((product) => product.slug));
  for (const product of catalog.products) {
    const slug = product.slug || product.url?.split('/').filter(Boolean).at(-1);
    if (!slugs.has(slug)) continue;
    product.price = 1;
    product.sale_price = 1;
    product.options = [{ label: '1 bead', price: 1, mrp: 1 }];
    product.description = `${product.name} are sold individually at ₹1 per bead for jewellery making, bangle decoration, blouse work and DIY craft projects.`;
  }
  await fs.writeFile(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`);
}

console.log(JSON.stringify({
  shouldApply,
  matched: updates.length,
  products: updates.map(({ name, slug, price, mrp, sizes }) => ({ name, slug, price, mrp, sizes })),
}, null, 2));
