import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const projectRoot = process.cwd();
const publicRoot = path.join(projectRoot, 'public', 'images');
const sourceRoot = path.resolve(projectRoot, '..', 'scraped-data', 'thesilkart', 'images');
const outputPath = path.resolve(projectRoot, '..', '..', '..', 'Kundans', 'legacy-watermark-manifest.json');
const catalog = JSON.parse((await fs.readFile(path.join(projectRoot, 'data', 'products.json'), 'utf8')).replace(/^\uFEFF/, ''));

async function walk(directory) {
  const files = [];
  for (const entry of await fs.readdir(directory, { withFileTypes: true })) {
    const fullPath = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...await walk(fullPath));
    else if (/\.(?:webp|png|jpe?g|avif)$/i.test(entry.name)) files.push(fullPath);
  }
  return files;
}

async function hasOpaqueBrownBand(file) {
  const { data, info } = await sharp(file).resize(128, 128, { fit: 'fill' }).removeAlpha().raw().toBuffer({ resolveWithObject: true });
  let diagonalPixels = 0;
  let diagonalBrown = 0;
  let outsidePixels = 0;
  let outsideBrown = 0;

  for (let y = 0; y < info.height; y += 1) {
    for (let x = 0; x < info.width; x += 1) {
      const offset = (y * info.width + x) * 3;
      const [red, green, blue] = data.subarray(offset, offset + 3);
      const brown = red >= 75 && red <= 145 && green <= 55 && blue >= 30 && blue <= 90 && red > green * 2 && red > blue * 1.2;
      const diagonal = Math.abs((x + y) / (info.width - 1) - 1) < 0.145;
      if (diagonal) {
        diagonalPixels += 1;
        if (brown) diagonalBrown += 1;
      } else {
        outsidePixels += 1;
        if (brown) outsideBrown += 1;
      }
    }
  }

  const diagonalRatio = diagonalBrown / diagonalPixels;
  const outsideRatio = outsideBrown / outsidePixels;
  return diagonalRatio > 0.38 && diagonalRatio > outsideRatio * 2.8 + 0.08;
}

function normalizedImagePath(value = '') {
  return String(value).replace(/^https?:\/\/[^/]+\//, '').replace(/^\//, '').replace(/^images\//, '').replaceAll('\\', '/');
}

const productReferences = new Map();
for (const product of catalog.products) {
  for (const image of product.images || []) {
    const key = normalizedImagePath(image);
    const references = productReferences.get(key) || [];
    references.push({ name: product.name, slug: product.url?.split('/').filter(Boolean).at(-1) || '' });
    productReferences.set(key, references);
  }
}

const sourceFiles = await walk(sourceRoot);
const sourceByStem = new Map(sourceFiles.map((file) => {
  const relative = path.relative(sourceRoot, file).replaceAll('\\', '/');
  return [relative.replace(/\.[^.]+$/, ''), relative];
}));

const affected = [];
for (const file of await walk(publicRoot)) {
  if (!(await hasOpaqueBrownBand(file))) continue;
  const publicPath = path.relative(publicRoot, file).replaceAll('\\', '/');
  const sourcePath = sourceByStem.get(publicPath.replace(/\.[^.]+$/, '')) || null;
  affected.push({
    category: publicPath.split('/')[0],
    public_path: publicPath,
    source_path: sourcePath,
    products: productReferences.get(publicPath) || [],
  });
}

const categories = {};
for (const item of affected) {
  categories[item.category] ||= { assets: 0, referenced_assets: 0, source_matches: 0 };
  categories[item.category].assets += 1;
  if (item.products.length) categories[item.category].referenced_assets += 1;
  if (item.source_path) categories[item.category].source_matches += 1;
}

const manifest = {
  generated_at: new Date().toISOString(),
  affected_assets: affected.length,
  referenced_assets: affected.filter((item) => item.products.length).length,
  source_matches: affected.filter((item) => item.source_path).length,
  categories,
  assets: affected,
};

await fs.writeFile(outputPath, `${JSON.stringify(manifest, null, 2)}\n`, 'utf8');
console.log(JSON.stringify({ outputPath, ...manifest, assets: undefined }, null, 2));
