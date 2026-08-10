import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const projectRoot = process.cwd();
const workspace = path.resolve(projectRoot, '..', '..', '..');
const publicDir = path.join(projectRoot, 'public', 'images', 'kundan-stones');
const masterDirs = [
  path.join(workspace, 'Kundans', 'editor-masters'),
  path.join(workspace, '8K kundans', 'editor-masters'),
  path.join(workspace, 'Kundans', 'restored-masters'),
  path.join(workspace, 'Kundans', 'legacy-shape-masters'),
  path.join(workspace, 'Kundans', 'google-reference-masters'),
];
const requestedSlug = process.argv.find((argument) => argument.startsWith('--slug='))?.slice(7);
const catalogOnly = process.argv.includes('--catalog-only');
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
      <g transform="rotate(-35 ${canvasSize / 2} 965)">
        <text x="${canvasSize / 2}" y="985" text-anchor="middle"
          font-family="Arial, Helvetica, sans-serif" font-size="72" font-weight="700"
          letter-spacing="1.2" fill="#292725" fill-opacity="0.60"
          stroke="#ffffff" stroke-opacity="0.76" stroke-width="4" paint-order="stroke">${text}</text>
      </g>
      <line x1="180" y1="1885" x2="1868" y2="1885" stroke="#c7c1b9" stroke-opacity="0.65" stroke-width="2"/>
      <text x="${canvasSize / 2}" y="1980" text-anchor="middle"
        font-family="Arial, Helvetica, sans-serif" font-size="52" font-weight="500"
        letter-spacing="1.8" fill="#45413e">${text}</text>
    </svg>`);
}

async function filesIn(directory) {
  try {
    return (await fs.readdir(directory)).map((file) => path.join(directory, file));
  } catch {
    return [];
  }
}

const masterFiles = (await Promise.all(masterDirs.map(filesIn))).flat();
const masterBySlug = new Map();
for (const file of masterFiles) {
  const name = path.basename(file);
  const slug = name.replace(/-hero-top-view-master\.png$/i, '').replace(/-master\.png$/i, '');
  if (slug !== name) masterBySlug.set(slug, file);
}

const heroFiles = (await fs.readdir(publicDir))
  .filter((file) => /-hero-top-view(?:-v\d+)?\.webp$/i.test(file))
  .filter((file) => !requestedSlug || file.startsWith(`${requestedSlug}-hero-top-view`))
  .sort((a, b) => a.localeCompare(b));

if (!heroFiles.length) throw new Error(requestedSlug ? `No hero image found for ${requestedSlug}.` : 'No Kundan hero images found.');

const branding = brandingSvg();
const results = [];
for (const heroFile of heroFiles) {
  const slug = heroFile.replace(/-hero-top-view(?:-v\d+)?\.webp$/i, '');
  const master = masterBySlug.get(slug);
  if (!master) throw new Error(`Missing untouched master for ${heroFile}.`);

  const heroPath = path.join(publicDir, heroFile);
  const heroBuffer = catalogOnly
    ? await fs.readFile(heroPath)
    : await sharp(master)
      .resize(canvasSize, canvasSize, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
      .composite([{ input: branding, left: 0, top: 0 }])
      .webp({ quality: 94, effort: 6, smartSubsample: true })
      .toBuffer();

  if (!catalogOnly) await fs.writeFile(heroPath, heroBuffer);

  const catalogFile = heroFile.replace(/-hero-top-view(-v\d+)?\.webp$/i, '-catalog$1.webp');
  const catalogPath = path.join(publicDir, catalogFile);
  await sharp(heroBuffer)
    .resize(960, 960, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
    .webp({ quality: 88, effort: 6, smartSubsample: true })
    .toFile(catalogPath);

  results.push({ slug, master, hero: path.join(publicDir, heroFile), catalog: catalogFile });
  console.log(`${results.length}/${heroFiles.length} ${heroFile}`);
}

const reportPath = path.join(workspace, 'Kundans', 'strong-watermark-report.json');
await fs.writeFile(reportPath, `${JSON.stringify({ generated_at: new Date().toISOString(), watermark: brandText, opacity: 0.60, processed: results.length, results }, null, 2)}\n`, 'utf8');
console.log(JSON.stringify({ processed: results.length, reportPath }));
