import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const sourceDir = path.join(workspace, 'Kundans', 'google-reference-masters');
const archiveDir = path.join(workspace, 'Kundans', 'google-verified-webp');
const publicDir = path.join(process.cwd(), 'public', 'images', 'kundan-stones');
const brandText = 'www.banglebychoice.in | 9553655562';
const canvasSize = 2048;
const footerHeight = 184;

const products = [
  '6k-eye-shape-dark-green-glossy-kundans',
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

await Promise.all([
  fs.mkdir(archiveDir, { recursive: true }),
  fs.mkdir(publicDir, { recursive: true }),
]);

const branding = brandingSvg();
for (const slug of products) {
  const source = path.join(sourceDir, `${slug}-master.png`);
  const heroFile = `${slug}-hero-top-view-v5.webp`;
  const catalogFile = `${slug}-catalog-v5.webp`;
  const heroBuffer = await sharp(source)
    .resize(canvasSize, canvasSize, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
    .composite([{ input: branding, left: 0, top: 0 }])
    .webp({ quality: 92, effort: 6, smartSubsample: true })
    .toBuffer();

  await Promise.all([
    fs.writeFile(path.join(publicDir, heroFile), heroBuffer),
    fs.writeFile(path.join(archiveDir, heroFile), heroBuffer),
    sharp(heroBuffer)
      .resize(960, 960, { fit: 'cover', kernel: sharp.kernel.lanczos3 })
      .webp({ quality: 86, effort: 6, smartSubsample: true })
      .toFile(path.join(publicDir, catalogFile)),
  ]);
  console.log(heroFile);
}
