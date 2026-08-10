const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');

// Load env variables
dotenv.config({ path: path.join(__dirname, '../.env.local') });

function copyFolderSync(from, to) {
  if (!fs.existsSync(from)) return;
  fs.mkdirSync(to, { recursive: true });
  fs.readdirSync(from).forEach(element => {
    const fromPath = path.join(from, element);
    const toPath = path.join(to, element);
    if (fs.lstatSync(fromPath).isDirectory()) {
      copyFolderSync(fromPath, toPath);
    } else {
      fs.copyFileSync(fromPath, toPath);
    }
  });
}

function escapeSQLString(val) {
  if (val === null || val === undefined) return 'NULL';
  return `'${String(val).replace(/'/g, "''")}'`;
}

function generateSQL(products) {
  let sql = `-- Seed products into BangleByChoice database\n\n`;
  
  for (let i = 0; i < products.length; i++) {
    const p = products[i];
    const slug = p.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
    const sellingPrice = p.sale_price || p.price || 0;
    const mrpPrice = p.sale_price ? p.price : null;
    const metaTitle = `${p.name} | BangleByChoice`;
    const metaDescription = p.description 
      ? p.description.substring(0, 150) 
      : `Buy ${p.name} online at BangleByChoice. Premium handmade bangles.`;

    // Map image path to local public folder
    let imageUrl = null;
    if (p.images && p.images.length > 0) {
      imageUrl = '/' + p.images[0].replace(/\\/g, '/');
    } else {
      imageUrl = `https://placehold.co/400x400/E3244D/white?text=${encodeURIComponent(p.name)}`;
    }

    const name = escapeSQLString(p.name);
    const sqlSlug = escapeSQLString(slug);
    const price = Math.round(sellingPrice);
    const mrp = mrpPrice ? Math.round(mrpPrice) : 'NULL';
    const cat = escapeSQLString(p.category || 'Uncategorized');
    const bg = escapeSQLString('#FDF2F8');
    const emoji = escapeSQLString('🌸');
    const descText = escapeSQLString(p.description || '');
    const tag = escapeSQLString(p.type || '');
    const sizes = escapeSQLString(JSON.stringify(['2.2', '2.4', '2.6', '2.8']));
    const sqlImageUrl = escapeSQLString(imageUrl);
    const sqlMetaTitle = escapeSQLString(metaTitle);
    const sqlMetaDesc = escapeSQLString(metaDescription);
    const altText = escapeSQLString(`Photo of ${p.name}`);

    sql += `INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES (${name}, ${sqlSlug}, ${price}, ${mrp}, ${cat}, ${bg}, ${emoji}, ${descText}, ${tag}, ${sizes}::jsonb, ${sqlImageUrl}, ${sqlMetaTitle}, ${sqlMetaDesc}, ${altText})
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

`;
  }
  
  return sql;
}

async function main() {
  try {
    const scrapedDataPath = path.join(__dirname, '../../scraped-data/thesilkart/products.json');
    if (!fs.existsSync(scrapedDataPath)) {
      console.error(`Scraped products file not found at ${scrapedDataPath}`);
      process.exit(1);
    }

    const data = JSON.parse(fs.readFileSync(scrapedDataPath, 'utf8'));
    const products = data.products || [];
    console.log(`Loaded ${products.length} products.`);

    // 1. Copy images to the public directory
    const srcImagesDir = path.join(__dirname, '../../scraped-data/thesilkart/images');
    const destImagesDir = path.join(__dirname, '../public/images');
    console.log(`Copying images from ${srcImagesDir} to ${destImagesDir}...`);
    copyFolderSync(srcImagesDir, destImagesDir);
    console.log("Images copied successfully!");

    // 2. Generate SQL file
    const sqlContent = generateSQL(products);
    const sqlFilePath = path.join(__dirname, 'seed.sql');
    fs.writeFileSync(sqlFilePath, sqlContent, 'utf8');
    console.log(`Generated seed.sql at ${sqlFilePath}`);
    console.log(`You can run this SQL script in the Supabase SQL editor to seed your database.`);

  } catch (err) {
    console.error("Process failed:", err.message);
  }
}

main();
