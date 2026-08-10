import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const imageDir = path.join(process.cwd(), 'public', 'images', 'kundan-stones');
const files = (await fs.readdir(imageDir)).filter((file) => file.endsWith('-hero-top-view-v3.webp'));

for (const file of files) {
  const output = file.replace('-hero-top-view-v3.webp', '-catalog-v3.webp');
  await sharp(path.join(imageDir, file))
    .resize(960, 960, { fit: 'cover' })
    .webp({ quality: 84, effort: 6 })
    .toFile(path.join(imageDir, output));
}

console.log(`Generated ${files.length} Kundan catalogue images.`);
