import fs from 'node:fs/promises';
import path from 'node:path';
import { config } from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import sharp from 'sharp';

config({ path: '.env.local', quiet: true });

const projectRoot = process.cwd();
const workspace = path.resolve(projectRoot, '..', '..', '..');
const sourceDir = path.join(workspace, 'Kundans');
const outputDir = path.join(sourceDir, 'match-sheets');
const publicDir = path.join(projectRoot, 'public');
const inventory = JSON.parse((await fs.readFile(path.join(sourceDir, 'source-inventory.json'), 'utf8')).replace(/^\uFEFF/, ''));
const mappingRows = (await fs.readFile(path.join(sourceDir, 'product-mapping.csv'), 'utf8')).trim().split(/\r?\n/).slice(1).map((line) => {
  const [index, seoSlug, shape, promptDescriptor] = line.split(',');
  return { index: Number(index), seoSlug, shape, promptDescriptor };
});

const client = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false } });
const { data: products, error } = await client.from('products').select('name,slug,image_url,desc_text').order('slug');
if (error) throw error;

const families = {
  '6k-drop': {
    source: (row) => row.seoSlug.startsWith('6k-drop-'),
    portal: (row) => /^6k-(?:drop|droup)-/.test(row.slug),
  },
  square: {
    source: (row) => row.seoSlug.includes('square-'),
    portal: (row) => /^(?:3-3|4-4)-square-/.test(row.slug),
  },
  diamond: {
    source: (row) => row.seoSlug.startsWith('diamond-'),
    portal: (row) => row.slug.startsWith('diamond-shape-'),
  },
  'half-moon': {
    source: (row) => row.seoSlug.startsWith('half-moon-'),
    portal: (row) => row.slug.startsWith('half-moon-'),
  },
  triangle: {
    source: (row) => row.seoSlug.startsWith('triangle-'),
    portal: (row) => row.slug.startsWith('triangle-'),
  },
  star: {
    source: (row) => row.seoSlug.startsWith('small-star-'),
    portal: (row) => row.slug.startsWith('small-star-'),
  },
};

function escapeXml(value) {
  return String(value).replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

function status(row) {
  try { return JSON.parse(row.desc_text).status || 'active'; } catch { return 'active'; }
}

async function imageBuffer(imagePath) {
  if (imagePath.startsWith('[')) imagePath = JSON.parse(imagePath)[0];
  if (/^https?:/.test(imagePath)) {
    const response = await fetch(imagePath);
    if (!response.ok) throw new Error(`Unable to fetch ${imagePath}`);
    return Buffer.from(await response.arrayBuffer());
  }
  return fs.readFile(path.join(publicDir, imagePath.replace(/^\//, '')));
}

async function sheet(items, destination, columns = 4) {
  const tileWidth = 360;
  const imageSize = 330;
  const labelHeight = 72;
  const tileHeight = imageSize + labelHeight;
  const rows = Math.ceil(items.length / columns);
  const composites = [];

  for (let index = 0; index < items.length; index += 1) {
    const item = items[index];
    const left = (index % columns) * tileWidth + 15;
    const top = Math.floor(index / columns) * tileHeight;
    const thumb = await sharp(await item.input()).resize(imageSize, imageSize, { fit: 'contain', background: '#faf8f4' }).jpeg({ quality: 86 }).toBuffer();
    const label = Buffer.from(`<svg width="${imageSize}" height="${labelHeight}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#faf8f4"/><text x="5" y="18" font-family="Arial" font-size="13" font-weight="700" fill="#302e2c">${escapeXml(item.title)}</text><text x="5" y="39" font-family="Arial" font-size="11" fill="#55514e">${escapeXml(item.subtitle.slice(0, 48))}</text><text x="5" y="57" font-family="Arial" font-size="11" fill="#55514e">${escapeXml(item.subtitle.slice(48, 96))}</text></svg>`);
    composites.push({ input: thumb, left, top }, { input: label, left, top: top + imageSize });
  }

  await sharp({ create: { width: columns * tileWidth, height: rows * tileHeight, channels: 3, background: '#eee9e3' } })
    .composite(composites)
    .jpeg({ quality: 90, chromaSubsampling: '4:4:4' })
    .toFile(destination);
}

await fs.mkdir(outputDir, { recursive: true });

for (const [family, filters] of Object.entries(families)) {
  const sources = mappingRows.filter(filters.source).map((row) => {
    const source = inventory.unique_files.find((item) => item.index === row.index);
    return {
      title: `${row.index}. ${row.seoSlug}`,
      subtitle: row.promptDescriptor,
      input: () => fs.readFile(path.join(sourceDir, source.filename)),
    };
  });
  const portal = products.filter(filters.portal).map((row) => ({
    title: `${status(row)} | ${row.slug}`,
    subtitle: row.name,
    input: () => imageBuffer(row.image_url),
  }));
  await sheet(sources, path.join(outputDir, `${family}-sources.jpg`));
  await sheet(portal, path.join(outputDir, `${family}-portal.jpg`));
  console.log(`${family}: ${sources.length} sources, ${portal.length} portal candidates`);
}
