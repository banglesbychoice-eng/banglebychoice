import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const nonKundanOnly = process.argv.includes('--non-kundan');
const manifestName = nonKundanOnly ? 'restored-non-kundan-v6.json' : 'restored-catalog-v6.json';
const manifest = JSON.parse(await fs.readFile(path.join(workspace, 'Kundans', manifestName), 'utf8'));
const publicRoot = path.join(process.cwd(), 'public', 'images');
const outputDir = path.join(workspace, 'Kundans', nonKundanOnly ? 'non-kundan-v6-qa' : 'restoration-v6-qa');

function escapeXml(value) {
  return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

await fs.rm(outputDir, { recursive: true, force: true });
await fs.mkdir(outputDir, { recursive: true });

const pageSize = 24;
const columns = 4;
const tile = 360;
const labelHeight = 58;
const pages = [];

for (let pageIndex = 0; pageIndex * pageSize < manifest.records.length; pageIndex += 1) {
  const records = manifest.records.slice(pageIndex * pageSize, (pageIndex + 1) * pageSize);
  const rows = Math.ceil(records.length / columns);
  const composites = [];

  for (const [index, record] of records.entries()) {
    const left = (index % columns) * tile;
    const top = Math.floor(index / columns) * (tile + labelHeight);
    const thumb = await sharp(path.join(publicRoot, record.heroPath))
      .resize(tile, tile, { fit: 'cover' })
      .jpeg({ quality: 92, chromaSubsampling: '4:4:4' })
      .toBuffer();
    const globalIndex = pageIndex * pageSize + index + 1;
    const label = `${globalIndex}. ${record.slug}${record.view > 1 ? ` view ${record.view}` : ''}`;
    const labelSvg = Buffer.from(`<svg width="${tile}" height="${labelHeight}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#faf8f4"/><text x="8" y="22" font-family="Arial" font-size="13" fill="#34312f">${escapeXml(label.slice(0, 52))}</text><text x="8" y="42" font-family="Arial" font-size="11" fill="#6b6661">${escapeXml(record.category)}</text></svg>`);
    composites.push({ input: thumb, left, top });
    composites.push({ input: labelSvg, left, top: top + tile });
  }

  const pagePath = path.join(outputDir, `page-${String(pageIndex + 1).padStart(2, '0')}.jpg`);
  await sharp({
    create: {
      width: columns * tile,
      height: rows * (tile + labelHeight),
      channels: 3,
      background: '#f3efea',
    },
  })
    .composite(composites)
    .jpeg({ quality: 94, chromaSubsampling: '4:4:4' })
    .toFile(pagePath);
  pages.push(pagePath);
  console.log(pagePath);
}

await fs.writeFile(
  path.join(outputDir, 'index.json'),
  `${JSON.stringify({ manifest: manifestName, records: manifest.records.length, pages }, null, 2)}\n`,
  'utf8',
);
