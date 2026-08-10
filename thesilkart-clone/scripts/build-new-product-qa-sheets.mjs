import fs from "node:fs/promises";
import path from "node:path";
import sharp from "sharp";

const root = process.cwd();
const manifest = JSON.parse(await fs.readFile(path.join(root, "data/new-products-2026-07-19.json"), "utf8"));
const sourceDir = path.join(root, "public/images/new-products-2026-07-19");
const outputDir = path.resolve(root, "../../../Clip stones, charms, enamel charms and other/_inventory/processed-qa");
await fs.rm(outputDir, { recursive: true, force: true });
await fs.mkdir(outputDir, { recursive: true });

const columns = 4;
const tile = 360;
const labelHeight = 70;
const pageSize = 24;
const metrics = [];

for (let page = 0; page * pageSize < manifest.length; page += 1) {
  const products = manifest.slice(page * pageSize, (page + 1) * pageSize);
  const rows = Math.ceil(products.length / columns);
  const composites = [];
  for (const [position, product] of products.entries()) {
    const file = path.join(sourceDir, path.basename(product.imagePath));
    const stats = await fs.stat(file);
    const metadata = await sharp(file).metadata();
    metrics.push({ sourceIndex: product.sourceIndex, name: product.name, file: path.basename(file), bytes: stats.size, width: metadata.width, height: metadata.height });
    const thumb = await sharp(file).resize(tile, tile, { fit: "contain", background: "#faf9f6" }).jpeg({ quality: 92 }).toBuffer();
    const label = Buffer.from(`<svg width="${tile}" height="${labelHeight}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#f4f0eb"/><text x="10" y="25" font-family="Arial" font-size="16" font-weight="700" fill="#282522">${product.sourceIndex}. ${product.name.replaceAll("&", "&amp;")}</text><text x="10" y="49" font-family="Arial" font-size="13" fill="#625d58">Rs ${product.price} | MRP Rs ${product.mrp} | ${(stats.size / 1024).toFixed(0)} KB</text></svg>`);
    const left = (position % columns) * tile;
    const top = Math.floor(position / columns) * (tile + labelHeight);
    composites.push({ input: thumb, left, top }, { input: label, left, top: top + tile });
  }
  await sharp({ create: { width: columns * tile, height: rows * (tile + labelHeight), channels: 3, background: "#eee9e3" } })
    .composite(composites)
    .jpeg({ quality: 94, chromaSubsampling: "4:4:4" })
    .toFile(path.join(outputDir, `processed-contact-sheet-${String(page + 1).padStart(2, "0")}.jpg`));
}

await fs.writeFile(path.join(outputDir, "processed-image-metrics.json"), `${JSON.stringify(metrics, null, 2)}\n`);
console.log(JSON.stringify({ products: manifest.length, sheets: Math.ceil(manifest.length / pageSize), outputDir }));
