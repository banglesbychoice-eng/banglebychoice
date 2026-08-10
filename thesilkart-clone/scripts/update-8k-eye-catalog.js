const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');
const { createClient } = require('@supabase/supabase-js');

dotenv.config({ path: path.join(__dirname, '../.env.local') });

const projectRoot = path.join(__dirname, '..');
const sourceImageDir = path.resolve(projectRoot, '../../../8K kundans/processed-webp');
const publicImageDir = path.join(projectRoot, 'public/images/kundan-stones');
const catalogPath = path.join(projectRoot, 'data/products.json');
const applyDatabase = process.argv.includes('--apply');

const products = [
  { oldSlug: '8k-eye-shape-c-green-glossy', slug: '8k-eye-shape-c-green-glossy-kundans', name: '8K Eye Shape C Green Glossy Kundans', finish: 'glossy', shade: 'C green' },
  { oldSlug: '8k-eye-shape-glossy-white', slug: '8k-eye-shape-glossy-white-kundans', name: '8K Eye Shape Glossy White Kundans', finish: 'glossy', shade: 'white' },
  { oldSlug: '8k-eye-kanakambaram-pink-matt', slug: '8k-eye-kanakambaram-pink-matte-kundans', name: '8K Eye Kanakambaram Pink Matte Kundans', finish: 'matte', shade: 'kanakambaram pink' },
  { oldSlug: '8k-eye-shape-sky-blue-glossy', slug: '8k-eye-shape-sky-blue-glossy-kundans', name: '8K Eye Shape Sky Blue Glossy Kundans', finish: 'glossy', shade: 'sky blue' },
  { oldSlug: '8k-eye-yellow-matt', slug: '8k-eye-yellow-matte-kundans', name: '8K Eye Yellow Matte Kundans', finish: 'matte', shade: 'yellow' },
  { oldSlug: '8k-eye-white-matt', slug: '8k-eye-white-matte-kundans', name: '8K Eye White Matte Kundans', finish: 'matte', shade: 'white' },
  { oldSlug: '8k-eye-shape-light-pink-glass', slug: '8k-eye-shape-light-pink-glass-kundans', name: '8K Eye Shape Light Pink Glass Kundans', finish: 'glass', shade: 'light pink' },
  { oldSlug: '8k-eye-shape-dark-pink-glossy', slug: '8k-eye-shape-dark-pink-glossy-kundans', name: '8K Eye Shape Dark Pink Glossy Kundans', finish: 'glossy', shade: 'dark pink' },
  { oldSlug: '8k-eye-shape-light-green-glossy', slug: '8k-eye-shape-light-green-glossy-kundans', name: '8K Eye Shape Light Green Glossy Kundans', finish: 'glossy', shade: 'light green' },
  { oldSlug: '8k-eye-shape-light-purpule-glossy', slug: '8k-eye-shape-light-purple-glossy-kundans', name: '8K Eye Shape Light Purple Glossy Kundans', finish: 'glossy', shade: 'light purple' },
  { oldSlug: '8k-eye-shape-ceramic-gold', slug: '8k-eye-shape-ceramic-gold-kundans', name: '8K Eye Shape Ceramic Gold Kundans', finish: 'ceramic', shade: 'gold' },
  { oldSlug: '8k-eye-shape-red-colour-glossy', slug: '8k-eye-shape-red-glossy-kundans', name: '8K Eye Shape Red Glossy Kundans', finish: 'glossy', shade: 'red' },
  { oldSlug: '8k-eye-shape-matt-peach-colour-kundans', slug: '8k-eye-shape-matte-peach-kundans', name: '8K Eye Shape Matte Peach Kundans', finish: 'matte', shade: 'peach' },
].map((product) => ({
  ...product,
  sourceImageFile: `${product.slug}-hero-top-view.webp`,
  imageFile: `${product.slug}-hero-top-view-v2.webp`,
  imagePath: `/images/kundan-stones/${product.slug}-hero-top-view-v2.webp`,
  description: `${product.name} are premium 8K eye-shaped ${product.shade} kundan stones with an accurate ${product.finish} finish and antique-gold setting. Suitable for bangles, jewellery making, blouse work, saree embellishment and DIY craft projects.`,
  metaDescription: `Buy ${product.name} online for bangles, jewellery making, blouse work and craft projects from Bangle By Choice.`,
  altText: `${product.name} top-view product image with antique-gold setting`,
}));

function parseDetails(value) {
  if (!value || !value.startsWith('{')) return {};
  try {
    const parsed = JSON.parse(value);
    return parsed?._bbc === 1 ? parsed : {};
  } catch {
    return {};
  }
}

function updateLocalCatalog() {
  const catalog = JSON.parse(fs.readFileSync(catalogPath, 'utf8'));
  let updated = 0;

  for (const product of products) {
    const sourcePath = path.join(sourceImageDir, product.sourceImageFile);
    if (!fs.existsSync(sourcePath)) throw new Error(`Missing processed image: ${sourcePath}`);
    fs.mkdirSync(publicImageDir, { recursive: true });
    fs.copyFileSync(sourcePath, path.join(publicImageDir, product.imageFile));

    const entry = catalog.products.find((item) => {
      const slug = item.url.split('/').filter(Boolean).pop();
      return slug === product.oldSlug || slug === product.slug;
    });
    if (!entry) throw new Error(`Local catalog product not found: ${product.oldSlug}`);

    entry.url = `https://www.banglebychoice.in/products/${product.slug}`;
    entry.name = product.name;
    entry.category = 'Kundan Stones';
    entry.subcategory = `8K Eye-Shaped ${product.finish[0].toUpperCase()}${product.finish.slice(1)} Kundans`;
    entry.type = `8K eye-shaped ${product.finish} kundans`;
    entry.description = product.description;
    entry.images = [product.imagePath.slice(1)];
    updated += 1;
  }

  fs.writeFileSync(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, 'utf8');
  return updated;
}

async function updateSupabase() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  if (!supabaseUrl || !serviceKey) throw new Error('Supabase URL or service role key is missing.');

  const supabase = createClient(supabaseUrl, serviceKey, { auth: { persistSession: false } });
  const candidates = [...new Set(products.flatMap((product) => [product.oldSlug, product.slug]))];
  const { data: rows, error } = await supabase
    .from('products')
    .select('id,name,slug,desc_text,price,mrp,sizes')
    .in('slug', candidates);
  if (error) throw error;

  const updates = [];
  for (const product of products) {
    const matches = rows.filter((row) => row.slug === product.oldSlug || row.slug === product.slug);
    if (matches.length !== 1) throw new Error(`Expected one Supabase row for ${product.oldSlug}; found ${matches.length}.`);
    const row = matches[0];
    const details = parseDetails(row.desc_text);
    updates.push({
      id: row.id,
      previousSlug: row.slug,
      fields: {
        name: product.name,
        slug: product.slug,
        cat: 'Kundan Stones',
        tag: `8K eye-shaped ${product.finish} kundans, ${product.shade} kundans, jewellery-making stones`,
        image_url: product.imagePath,
        desc_text: JSON.stringify({ ...details, _bbc: 1, description: product.description, status: 'active' }),
        meta_title: `${product.name} | Bangle By Choice`,
        meta_description: product.metaDescription,
        alt_text: product.altText,
      },
    });
  }

  if (!applyDatabase) {
    console.log(JSON.stringify({ mode: 'dry-run', databaseRowsFound: rows.length, updates: updates.map(({ id, previousSlug, fields }) => ({ id, previousSlug, nextSlug: fields.slug, image_url: fields.image_url })) }, null, 2));
    return 0;
  }

  for (const update of updates) {
    const { error: updateError } = await supabase.from('products').update(update.fields).eq('id', update.id);
    if (updateError) throw updateError;
  }
  return updates.length;
}

async function main() {
  const localUpdated = updateLocalCatalog();
  const databaseUpdated = await updateSupabase();
  console.log(JSON.stringify({ localUpdated, imagesCopied: products.length, databaseUpdated, applied: applyDatabase }, null, 2));
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
