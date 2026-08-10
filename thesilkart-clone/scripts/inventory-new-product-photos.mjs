import crypto from 'node:crypto';
import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const sourceDir = path.join(workspace, 'Clip stones, charms, enamel charms and other');
const outputDir = path.join(sourceDir, '_inventory');
const supported = new Set(['.jpg', '.jpeg', '.png', '.webp', '.heic']);

function escapeXml(value) {
  return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

await fs.rm(outputDir, { recursive: true, force: true });
await fs.mkdir(outputDir, { recursive: true });

const files = (await fs.readdir(sourceDir))
  .filter((file) => supported.has(path.extname(file).toLowerCase()))
  .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));
const byHash = new Map();
for (const file of files) {
  const buffer = await fs.readFile(path.join(sourceDir, file));
  const hash = crypto.createHash('sha256').update(buffer).digest('hex');
  const metadata = await sharp(buffer).metadata();
  const existing = byHash.get(hash);
  if (existing) {
    existing.duplicates.push(file);
    continue;
  }
  byHash.set(hash, {
    hash,
    filename: file,
    duplicates: [],
    width: metadata.width,
    height: metadata.height,
    orientation: metadata.orientation || 1,
    bytes: buffer.length,
  });
}

const records = [...byHash.values()].map((record, index) => ({ index: index + 1, ...record }));
const pageSize = 24;
const columns = 4;
const tile = 360;
const labelHeight = 74;

for (let pageIndex = 0; pageIndex * pageSize < records.length; pageIndex += 1) {
  const pageRecords = records.slice(pageIndex * pageSize, (pageIndex + 1) * pageSize);
  const rows = Math.ceil(pageRecords.length / columns);
  const composites = [];
  for (const [position, record] of pageRecords.entries()) {
    const left = (position % columns) * tile;
    const top = Math.floor(position / columns) * (tile + labelHeight);
    const thumb = await sharp(path.join(sourceDir, record.filename))
      .rotate()
      .resize(tile, tile, { fit: 'contain', background: '#f8f6f2' })
      .jpeg({ quality: 92, chromaSubsampling: '4:4:4' })
      .toBuffer();
    const shortName = record.filename.replace(/^WhatsApp Image 2026-07-19 at /, '').replace(/\.jpeg$/i, '');
    const label = Buffer.from(`<svg width="${tile}" height="${labelHeight}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#faf8f4"/><text x="10" y="26" font-family="Arial" font-size="17" font-weight="700" fill="#282522">${record.index}. ${escapeXml(shortName)}</text><text x="10" y="50" font-family="Arial" font-size="13" fill="#625d58">${record.width} x ${record.height}${record.duplicates.length ? ` | ${record.duplicates.length} duplicate` : ''}</text></svg>`);
    composites.push({ input: thumb, left, top });
    composites.push({ input: label, left, top: top + tile });
  }
  await sharp({
    create: {
      width: columns * tile,
      height: rows * (tile + labelHeight),
      channels: 3,
      background: '#f2eee9',
    },
  })
    .composite(composites)
    .jpeg({ quality: 94, chromaSubsampling: '4:4:4' })
    .toFile(path.join(outputDir, `contact-sheet-${String(pageIndex + 1).padStart(2, '0')}.jpg`));
}

await fs.writeFile(
  path.join(outputDir, 'source-inventory.json'),
  `${JSON.stringify({ generatedAt: new Date().toISOString(), totalFiles: files.length, uniqueImages: records.length, duplicates: files.length - records.length, records }, null, 2)}\n`,
  'utf8',
);
console.log(JSON.stringify({ totalFiles: files.length, uniqueImages: records.length, duplicates: files.length - records.length, outputDir }, null, 2));
