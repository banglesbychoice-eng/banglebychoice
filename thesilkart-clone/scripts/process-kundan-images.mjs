import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const sourceDir = path.join(workspace, 'Kundans', 'editor-masters');
const outputDir = path.join(workspace, 'Kundans', 'processed-webp');
const contactSheetPath = path.join(workspace, 'Kundans', 'processed-webp-contact-sheet.jpg');
const brandText = 'www.banglebychoice.in | 9553655562';
const canvasSize = 2048;
const footerHeight = 184;

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
          letter-spacing="1.5" fill="#403e3c" fill-opacity="0.38"
          stroke="#ffffff" stroke-opacity="0.22" stroke-width="2" paint-order="stroke">${text}</text>
      </g>
      <text x="${canvasSize / 2}" y="1971" text-anchor="middle"
        font-family="Arial, Helvetica, sans-serif" font-size="50" font-weight="500"
        letter-spacing="2" fill="#4a4745">${text}</text>
    </svg>`);
}

async function makeContactSheet(files) {
  const columns = 5;
  const tileWidth = 300;
  const imageSize = 270;
  const labelHeight = 52;
  const tileHeight = imageSize + labelHeight;
  const rows = Math.ceil(files.length / columns);
  const composites = [];

  for (let index = 0; index < files.length; index += 1) {
    const file = files[index];
    const left = (index % columns) * tileWidth + 15;
    const top = Math.floor(index / columns) * tileHeight;
    const thumb = await sharp(path.join(outputDir, file)).resize(imageSize, imageSize, { fit: 'cover' }).jpeg({ quality: 82 }).toBuffer();
    const label = `${index + 1}. ${file.replace('-hero-top-view.webp', '')}`;
    const labelSvg = Buffer.from(`<svg width="${imageSize}" height="${labelHeight}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#faf8f4"/><text x="6" y="18" font-family="Arial" font-size="12" fill="#34312f">${escapeXml(label)}</text></svg>`);
    composites.push({ input: thumb, left, top });
    composites.push({ input: labelSvg, left, top: top + imageSize });
  }

  await sharp({ create: { width: columns * tileWidth, height: rows * tileHeight, channels: 3, background: '#f3efea' } })
    .composite(composites)
    .jpeg({ quality: 88, chromaSubsampling: '4:4:4' })
    .toFile(contactSheetPath);
}

await fs.mkdir(outputDir, { recursive: true });
const sourceFiles = (await fs.readdir(sourceDir))
  .filter((file) => file.endsWith('-hero-top-view-master.png'))
  .sort((a, b) => a.localeCompare(b));

if (sourceFiles.length !== 58) {
  throw new Error(`Expected 58 editor masters, found ${sourceFiles.length}.`);
}

const branding = brandingSvg();
for (const sourceFile of sourceFiles) {
  const outputFile = sourceFile.replace('-master.png', '.webp');
  await sharp(path.join(sourceDir, sourceFile))
    .resize(canvasSize, canvasSize, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
    .composite([{ input: branding, left: 0, top: 0 }])
    .webp({ quality: 92, effort: 6, smartSubsample: true })
    .toFile(path.join(outputDir, outputFile));
  console.log(outputFile);
}

await makeContactSheet(sourceFiles.map((file) => file.replace('-master.png', '.webp')));
console.log(`Processed ${sourceFiles.length} images.`);
console.log(contactSheetPath);
