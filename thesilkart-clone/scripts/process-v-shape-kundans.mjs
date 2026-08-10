import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const sourceDir = path.join(workspace, 'Kundans', 'restored-masters');
const archiveDir = path.join(workspace, 'Kundans', 'restored-webp');
const publicDir = path.join(process.cwd(), 'public', 'images', 'kundan-stones');
const contactSheetPath = path.join(workspace, 'Kundans', 'v-shape-restored-contact-sheet.jpg');
const brandText = 'www.banglebychoice.in | 9553655562';
const canvasSize = 2048;
const footerHeight = 184;

const products = [
  'v-shape-dark-green-glossy-kundans',
  'v-shape-dark-pink-glossy-kundans',
  'v-shape-dark-purple-glossy-kundans',
  'v-shape-glossy-gold-kundans',
  'v-shape-glossy-white-kundans',
  'v-shape-light-green-glossy-kundans',
  'v-shape-orange-glossy-kundans',
  'v-shape-sky-blue-glossy-kundans',
];

function escapeXml(value) {
  return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

function brandingSvg() {
  const text = escapeXml(brandText);
  return Buffer.from(`
    <svg width="${canvasSize}" height="${canvasSize}" xmlns="http://www.w3.org/2000/svg">
      <rect x="0" y="${canvasSize - footerHeight}" width="${canvasSize}" height="${footerHeight}" fill="#faf8f4"/>
      <g transform="rotate(-35 ${canvasSize / 2} 930)">
        <text x="${canvasSize / 2}" y="950" text-anchor="middle"
          font-family="Arial, Helvetica, sans-serif" font-size="62" font-weight="600"
          letter-spacing="1.5" fill="#403e3c" fill-opacity="0.4"
          stroke="#ffffff" stroke-opacity="0.24" stroke-width="2" paint-order="stroke">${text}</text>
      </g>
      <text x="${canvasSize / 2}" y="1971" text-anchor="middle"
        font-family="Arial, Helvetica, sans-serif" font-size="50" font-weight="500"
        letter-spacing="2" fill="#4a4745">${text}</text>
    </svg>`);
}

async function makeContactSheet(heroFiles) {
  const columns = 4;
  const tileWidth = 380;
  const imageSize = 350;
  const labelHeight = 56;
  const tileHeight = imageSize + labelHeight;
  const rows = Math.ceil(heroFiles.length / columns);
  const composites = [];

  for (const [index, file] of heroFiles.entries()) {
    const left = (index % columns) * tileWidth + 15;
    const top = Math.floor(index / columns) * tileHeight;
    const thumb = await sharp(path.join(publicDir, file))
      .resize(imageSize, imageSize, { fit: 'cover' })
      .jpeg({ quality: 90, chromaSubsampling: '4:4:4' })
      .toBuffer();
    const label = `${index + 1}. ${file.replace('-hero-top-view-v4.webp', '')}`;
    const labelSvg = Buffer.from(`<svg width="${imageSize}" height="${labelHeight}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#faf8f4"/><text x="8" y="22" font-family="Arial" font-size="14" fill="#34312f">${escapeXml(label)}</text></svg>`);
    composites.push({ input: thumb, left, top });
    composites.push({ input: labelSvg, left, top: top + imageSize });
  }

  await sharp({
    create: {
      width: columns * tileWidth,
      height: rows * tileHeight,
      channels: 3,
      background: '#f3efea',
    },
  })
    .composite(composites)
    .jpeg({ quality: 92, chromaSubsampling: '4:4:4' })
    .toFile(contactSheetPath);
}

await Promise.all([
  fs.mkdir(archiveDir, { recursive: true }),
  fs.mkdir(publicDir, { recursive: true }),
]);

const branding = brandingSvg();
const heroFiles = [];

for (const slug of products) {
  const source = path.join(sourceDir, `${slug}-master.png`);
  const heroFile = `${slug}-hero-top-view-v4.webp`;
  const catalogFile = `${slug}-catalog-v4.webp`;
  const publicHero = path.join(publicDir, heroFile);

  const heroBuffer = await sharp(source)
    .resize(canvasSize, canvasSize, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
    .composite([{ input: branding, left: 0, top: 0 }])
    .webp({ quality: 92, effort: 6, smartSubsample: true })
    .toBuffer();

  await Promise.all([
    fs.writeFile(publicHero, heroBuffer),
    fs.writeFile(path.join(archiveDir, heroFile), heroBuffer),
    sharp(heroBuffer)
      .resize(960, 960, { fit: 'cover', kernel: sharp.kernel.lanczos3 })
      .webp({ quality: 86, effort: 6, smartSubsample: true })
      .toFile(path.join(publicDir, catalogFile)),
  ]);

  heroFiles.push(heroFile);
  console.log(heroFile);
}

await makeContactSheet(heroFiles);
console.log(`Processed ${heroFiles.length} individually restored V-shape Kundan images.`);
console.log(contactSheetPath);
