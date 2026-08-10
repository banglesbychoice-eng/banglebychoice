import { mkdir } from "node:fs/promises";
import path from "node:path";
import process from "node:process";
import sharp from "sharp";

const [, , inputPath, outputPath] = process.argv;

if (!inputPath || !outputPath) {
  console.error("Usage: node scripts/brand-product-image.mjs <input> <output>");
  process.exit(1);
}

const image = sharp(inputPath).rotate();
const metadata = await image.metadata();
const width = metadata.width ?? 1600;
const height = metadata.height ?? 1600;
const fontSize = Math.max(28, Math.round(Math.min(width, height) * 0.037));
const watermark = Buffer.from(`
  <svg width="${width}" height="${height}" xmlns="http://www.w3.org/2000/svg">
    <g transform="translate(${width / 2} ${height / 2}) rotate(-32)">
      <text
        x="0"
        y="0"
        text-anchor="middle"
        dominant-baseline="central"
        font-family="Arial, Helvetica, sans-serif"
        font-size="${fontSize}"
        font-weight="600"
        letter-spacing="2"
        fill="#7e1237"
        fill-opacity="0.19"
        stroke="#ffffff"
        stroke-opacity="0.22"
        stroke-width="1"
      >Bangle by Choice · www.banglebychoice.in</text>
    </g>
  </svg>
`);

await mkdir(path.dirname(outputPath), { recursive: true });
await image
  .composite([{ input: watermark, blend: "over" }])
  .webp({ quality: 90, effort: 5, smartSubsample: true })
  .toFile(outputPath);

console.log(outputPath);
