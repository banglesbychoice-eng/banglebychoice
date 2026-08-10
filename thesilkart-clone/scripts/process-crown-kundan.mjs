import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const slug = 'crown-shape-glossy-white-kundans';
const master = path.join(workspace, 'Kundans', 'legacy-shape-masters', `${slug}-hero-top-view-master.png`);
const processed = path.join(workspace, 'Kundans', 'processed-webp', `${slug}-hero-top-view.webp`);
const publicDir = path.join(process.cwd(), 'public', 'images', 'kundan-stones');
const hero = path.join(publicDir, `${slug}-hero-top-view-v2.webp`);
const card = path.join(publicDir, `${slug}-catalog-v2.webp`);
const brandText = 'www.banglebychoice.in | 9553655562';
const canvasSize = 2048;

const branding = Buffer.from(`
  <svg width="${canvasSize}" height="${canvasSize}" xmlns="http://www.w3.org/2000/svg">
    <rect x="0" y="1864" width="2048" height="184" fill="#faf8f4"/>
    <g transform="rotate(-35 1024 930)">
      <text x="1024" y="950" text-anchor="middle" font-family="Arial, Helvetica, sans-serif"
        font-size="62" font-weight="600" letter-spacing="1.5" fill="#403e3c" fill-opacity="0.42"
        stroke="#ffffff" stroke-opacity="0.22" stroke-width="2" paint-order="stroke">${brandText}</text>
    </g>
    <text x="1024" y="1971" text-anchor="middle" font-family="Arial, Helvetica, sans-serif"
      font-size="50" font-weight="500" letter-spacing="2" fill="#4a4745">${brandText}</text>
  </svg>`);

await fs.mkdir(path.dirname(processed), { recursive: true });
await fs.mkdir(publicDir, { recursive: true });

await sharp(master)
  .resize(canvasSize, canvasSize, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
  .composite([{ input: branding, left: 0, top: 0 }])
  .webp({ quality: 92, effort: 6, smartSubsample: true })
  .toFile(processed);

await fs.copyFile(processed, hero);
await sharp(processed).resize(960, 960).webp({ quality: 84, effort: 6 }).toFile(card);

console.log(JSON.stringify({ processed, hero, card }));
