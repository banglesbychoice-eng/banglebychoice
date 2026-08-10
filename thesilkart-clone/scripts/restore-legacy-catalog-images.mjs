import fs from 'node:fs/promises';
import path from 'node:path';
import sharp from 'sharp';

const workspace = path.resolve(process.cwd(), '..', '..', '..');
const manifestPath = path.join(workspace, 'Kundans', 'legacy-watermark-manifest.json');
const sourceRoot = path.resolve(process.cwd(), '..', 'scraped-data', 'thesilkart', 'images');
const publicRoot = path.join(process.cwd(), 'public', 'images');
const sampleSheetPath = path.join(workspace, 'Kundans', 'restoration-v6-sample-sheet.jpg');
const brandText = 'www.banglebychoice.in | 9553655562';
const canvasSize = 1600;
const footerHeight = 144;

const sampleSlugs = new Set([
  '2-hole-connectors',
  '1014-size-dark-green-clipstones',
  '33-square-gold-glossy',
  '08-inch-gold-colour-bases',
  'gold-polish-chandraharam-chaine-24-inch-length',
  '625-size-stick-covers',
]);

const args = new Set(process.argv.slice(2));
const sampleOnly = args.has('--sample');
const debugMasks = args.has('--debug-mask');
const classicalInpaint = args.has('--classical');
const nonKundanOnly = args.has('--non-kundan');
const preserveSource = args.has('--preserve-source');
const outputStem = nonKundanOnly ? 'restored-non-kundan-v6' : 'restored-catalog-v6';
const outputManifestPath = path.join(workspace, 'Kundans', `${outputStem}${sampleOnly ? '-sample' : ''}.json`);
const lamaModelPath = path.join(workspace, 'Kundans', 'models', 'lama_fp32.onnx');
const ort = preserveSource ? null : await import('onnxruntime-node');
const lamaSession = preserveSource ? null : await ort.InferenceSession.create(lamaModelPath, { executionProviders: ['cpu'] });
const cv = classicalInpaint ? await import('@techstark/opencv-js').then((module) => module.default) : null;

function escapeXml(value) {
  return value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;');
}

function seoSlug(value) {
  return value
    .toLowerCase()
    .replaceAll('purpule', 'purple')
    .replaceAll('prupule', 'purple')
    .replaceAll('droup', 'drop')
    .replaceAll('reactangle', 'rectangle')
    .replaceAll('jewelery', 'jewellery')
    .replaceAll('peral', 'pearl')
    .replaceAll('squre', 'square')
    .replaceAll('glod', 'gold')
    .replace(/^(\d)(\d)-square/, '$1x$2-square')
    .replace(/^(\d)(\d)-rectangle/, '$1x$2-rectangle')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

function brandingSvg() {
  const text = escapeXml(brandText);
  return Buffer.from(`
    <svg width="${canvasSize}" height="${canvasSize}" xmlns="http://www.w3.org/2000/svg">
      <rect x="0" y="${canvasSize - footerHeight}" width="${canvasSize}" height="${footerHeight}" fill="#faf8f4"/>
      <g transform="rotate(-45 ${canvasSize / 2} 760)">
        <text x="${canvasSize / 2}" y="780" text-anchor="middle"
          font-family="Arial, Helvetica, sans-serif" font-size="68" font-weight="600"
          letter-spacing="1.4" fill="#403e3c" fill-opacity="0.46"
          stroke="#ffffff" stroke-opacity="0.24" stroke-width="2" paint-order="stroke">${text}</text>
      </g>
      <text x="${canvasSize / 2}" y="1541" text-anchor="middle"
        font-family="Arial, Helvetica, sans-serif" font-size="40" font-weight="500"
        letter-spacing="1.5" fill="#4a4745">${text}</text>
    </svg>`);
}

function pixelIndex(x, y, width, channels) {
  return (y * width + x) * channels;
}

function brightness(data, index) {
  return (data[index] + data[index + 1] + data[index + 2]) / 3;
}

async function createSupplierWatermarkTemplate() {
  const svg = Buffer.from(`
    <svg width="1400" height="180" xmlns="http://www.w3.org/2000/svg">
      <rect width="100%" height="100%" fill="#000"/>
      <text x="18" y="132" font-family="Arial, Helvetica, sans-serif" font-size="120" font-weight="400" fill="#fff">www.thesilkart.com</text>
    </svg>`);
  const { data, info } = await sharp(svg)
    .trim({ background: '#000000' })
    .greyscale()
    .raw()
    .toBuffer({ resolveWithObject: true });
  const allPoints = [];
  for (let y = 0; y < info.height; y += 1) {
    for (let x = 0; x < info.width; x += 1) {
      const alpha = data[y * info.width + x];
      if (alpha >= 48) allPoints.push({ x: x - info.width / 2, y: y - info.height / 2, alpha: alpha / 255 });
    }
  }
  const stride = Math.max(1, Math.floor(allPoints.length / 650));
  return {
    width: info.width,
    height: info.height,
    allPoints,
    scorePoints: allPoints.filter((_, index) => index % stride === 0),
  };
}

const supplierWatermarkTemplate = await createSupplierWatermarkTemplate();

function detectWatermarkMask(data, width, height, channels) {
  const minDimension = Math.min(width, height);
  const normalOffset = minDimension * 0.055;
  const candidateOffset = Math.max(14, Math.round(minDimension * 0.035));
  const candidatePixels = new Uint8Array(width * height);
  const distanceMap = new Float32Array(width * height);
  distanceMap.fill(1e6);
  for (let y = candidateOffset; y < height - candidateOffset; y += 1) {
    for (let x = candidateOffset; x < width - candidateOffset; x += 1) {
      const index = pixelIndex(x, y, width, channels);
      const r = data[index];
      const g = data[index + 1];
      const b = data[index + 2];
      const value = (r + g + b) / 3;
      if (value < 175 || Math.max(r, g, b) - Math.min(r, g, b) > 70) continue;
      const base = Math.min(
        brightness(data, pixelIndex(x - candidateOffset, y, width, channels)),
        brightness(data, pixelIndex(x + candidateOffset, y, width, channels)),
        brightness(data, pixelIndex(x, y - candidateOffset, width, channels)),
        brightness(data, pixelIndex(x, y + candidateOffset, width, channels)),
      );
      if (value - base >= 22) {
        distanceMap[y * width + x] = 0;
        candidatePixels[y * width + x] = 1;
      }
    }
  }
  for (let y = 0; y < height; y += 1) {
    for (let x = 0; x < width; x += 1) {
      const index = y * width + x;
      if (x > 0) distanceMap[index] = Math.min(distanceMap[index], distanceMap[index - 1] + 1);
      if (y > 0) distanceMap[index] = Math.min(distanceMap[index], distanceMap[index - width] + 1);
      if (x > 0 && y > 0) distanceMap[index] = Math.min(distanceMap[index], distanceMap[index - width - 1] + 1.414);
    }
  }
  for (let y = height - 1; y >= 0; y -= 1) {
    for (let x = width - 1; x >= 0; x -= 1) {
      const index = y * width + x;
      if (x < width - 1) distanceMap[index] = Math.min(distanceMap[index], distanceMap[index + 1] + 1);
      if (y < height - 1) distanceMap[index] = Math.min(distanceMap[index], distanceMap[index + width] + 1);
      if (x < width - 1 && y < height - 1) distanceMap[index] = Math.min(distanceMap[index], distanceMap[index + width + 1] + 1.414);
    }
  }

  function scoreRegistration({ angle, widthFraction, centerX, centerY }) {
    const radians = angle * Math.PI / 180;
    const cos = Math.cos(radians);
    const sin = Math.sin(radians);
    const scale = width * widthFraction / supplierWatermarkTemplate.width;
    let score = 0;
    let visible = 0;
    const segmentScores = new Float32Array(10);
    const segmentWeights = new Float32Array(10);
    const segmentMatches = new Float32Array(10);
    let shapeMatch = 0;
    for (const point of supplierWatermarkTemplate.scorePoints) {
      const x = Math.round(centerX * width + scale * (point.x * cos - point.y * sin));
      const y = Math.round(centerY * height + scale * (point.x * sin + point.y * cos));
      if (x < 1 || x >= width - 1 || y < 1 || y >= height - 1) continue;
      const index = pixelIndex(x, y, width, channels);
      const r = data[index];
      const g = data[index + 1];
      const b = data[index + 2];
      const value = (r + g + b) / 3;
      const saturation = Math.max(r, g, b) - Math.min(r, g, b);
      const normalX = -sin * normalOffset;
      const normalY = cos * normalOffset;
      const x1 = Math.max(0, Math.min(width - 1, Math.round(x + normalX)));
      const y1 = Math.max(0, Math.min(height - 1, Math.round(y + normalY)));
      const x2 = Math.max(0, Math.min(width - 1, Math.round(x - normalX)));
      const y2 = Math.max(0, Math.min(height - 1, Math.round(y - normalY)));
      const base = Math.min(
        brightness(data, pixelIndex(x1, y1, width, channels)),
        brightness(data, pixelIndex(x2, y2, width, channels)),
      );
      const contrast = Math.max(0, value - base - 4);
      const neutrality = Math.max(0, 1 - saturation / 125);
      const contribution = contrast * neutrality * point.alpha;
      const proximity = Math.max(0, 1 - distanceMap[y * width + x] / (minDimension * 0.018)) * point.alpha;
      score += contribution;
      visible += point.alpha;
      const segment = Math.max(0, Math.min(9, Math.floor(((point.x / supplierWatermarkTemplate.width) + 0.5) * 10)));
      segmentScores[segment] += contribution;
      segmentWeights[segment] += point.alpha;
      segmentMatches[segment] += proximity;
      shapeMatch += proximity;
    }
    if (visible === 0) return 0;
    const normalizedSegments = Array.from(segmentScores, (value, index) =>
      segmentWeights[index] > 0 ? value / segmentWeights[index] : 0,
    ).sort((a, b) => a - b);
    const median = normalizedSegments[Math.floor(normalizedSegments.length / 2)];
    const covered = normalizedSegments.filter((value) => value >= 3).length;
    const normalizedMatches = Array.from(segmentMatches, (value, index) =>
      segmentWeights[index] > 0 ? value / segmentWeights[index] : 0,
    ).sort((a, b) => a - b);
    const medianMatch = normalizedMatches[Math.floor(normalizedMatches.length / 2)];
    const matchedSegments = normalizedMatches.filter((value) => value >= 0.2).length;
    return score / visible + median * 0.8 + covered * 0.7
      + (shapeMatch / visible) * 180 + medianMatch * 120 + matchedSegments * 2;
  }

  let best = { angle: -38, widthFraction: 0.84, centerX: 0.5, centerY: 0.5, score: -1 };
  for (let angle = -54; angle <= -20; angle += 4) {
    for (let widthFraction = 0.74; widthFraction <= 1.1; widthFraction += 0.06) {
      for (const centerX of [0.48, 0.5, 0.52]) {
        for (const centerY of [0.48, 0.5, 0.52]) {
          const candidate = { angle, widthFraction, centerX, centerY };
          const score = scoreRegistration(candidate);
          if (score > best.score) best = { ...candidate, score };
        }
      }
    }
  }

  const coarse = best;
  for (let angle = coarse.angle - 3; angle <= coarse.angle + 3; angle += 1) {
    for (let widthFraction = coarse.widthFraction - 0.04; widthFraction <= coarse.widthFraction + 0.04; widthFraction += 0.02) {
      if (widthFraction < 0.72 || widthFraction > 1.12) continue;
      for (let centerX = coarse.centerX - 0.015; centerX <= coarse.centerX + 0.015; centerX += 0.015) {
        for (let centerY = coarse.centerY - 0.015; centerY <= coarse.centerY + 0.015; centerY += 0.015) {
          const candidate = { angle, widthFraction, centerX, centerY };
          const score = scoreRegistration(candidate);
          if (score > best.score) best = { ...candidate, score };
        }
      }
    }
  }

  const radians = best.angle * Math.PI / 180;
  const cos = Math.cos(radians);
  const sin = Math.sin(radians);
  const initialMask = new Uint8Array(width * height);
  const centerX = best.centerX * width;
  const centerY = best.centerY * height;
  const halfLength = width * best.widthFraction * 0.58;
  const halfBand = minDimension * 0.1;
  for (let y = 0; y < height; y += 1) {
    for (let x = 0; x < width; x += 1) {
      if (!candidatePixels[y * width + x]) continue;
      const relativeX = x - centerX;
      const relativeY = y - centerY;
      const normalDistance = -sin * relativeX + cos * relativeY;
      const alongDistance = cos * relativeX + sin * relativeY;
      if (Math.abs(normalDistance) <= halfBand && Math.abs(alongDistance) <= halfLength) {
        initialMask[y * width + x] = 1;
      }
    }
  }
  const mask = new Uint8Array(initialMask);
  const radius = Math.max(4, Math.round(minDimension * 0.006));
  for (let y = radius; y < height - radius; y += 1) {
    for (let x = radius; x < width - radius; x += 1) {
      if (!initialMask[y * width + x]) continue;
    for (let dy = -radius; dy <= radius; dy += 1) {
      for (let dx = -radius; dx <= radius; dx += 1) {
          mask[(y + dy) * width + x + dx] = 1;
        }
      }
    }
  }
  mask.registration = best;
  return mask;
}

async function inpaintMaskedPixels(source, mask, width, height, channels) {
  if (classicalInpaint) {
    const sourceMat = cv.matFromArray(height, width, cv.CV_8UC3, source);
    const maskBytes = Uint8Array.from(mask, (value) => value * 255);
    const maskMat = cv.matFromArray(height, width, cv.CV_8UC1, maskBytes);
    const outputMat = new cv.Mat();
    cv.inpaint(sourceMat, maskMat, outputMat, 3, cv.INPAINT_TELEA);
    const output = Buffer.from(outputMat.data);
    sourceMat.delete();
    maskMat.delete();
    outputMat.delete();
    return output;
  }
  const modelSize = 512;
  const resizedImage = await sharp(source, { raw: { width, height, channels } })
    .resize(modelSize, modelSize, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
    .raw()
    .toBuffer();
  const resizedMask = await sharp(Buffer.from(mask), { raw: { width, height, channels: 1 } })
    .resize(modelSize, modelSize, { fit: 'fill', kernel: sharp.kernel.nearest })
    .extractChannel(0)
    .raw()
    .toBuffer();

  const imageTensorData = new Float32Array(3 * modelSize * modelSize);
  const maskTensorData = new Float32Array(modelSize * modelSize);
  for (let pixel = 0; pixel < modelSize * modelSize; pixel += 1) {
    imageTensorData[pixel] = resizedImage[pixel * 3] / 255;
    imageTensorData[modelSize * modelSize + pixel] = resizedImage[pixel * 3 + 1] / 255;
    imageTensorData[2 * modelSize * modelSize + pixel] = resizedImage[pixel * 3 + 2] / 255;
    maskTensorData[pixel] = resizedMask[pixel] > 0 ? 1 : 0;
  }

  const results = await lamaSession.run({
    image: new ort.Tensor('float32', imageTensorData, [1, 3, modelSize, modelSize]),
    mask: new ort.Tensor('float32', maskTensorData, [1, 1, modelSize, modelSize]),
  });
  const modelOutput = results.output.data;
  const modelBuffer = Buffer.alloc(modelSize * modelSize * 3);
  for (let pixel = 0; pixel < modelSize * modelSize; pixel += 1) {
    modelBuffer[pixel * 3] = Math.max(0, Math.min(255, Math.round(modelOutput[pixel])));
    modelBuffer[pixel * 3 + 1] = Math.max(0, Math.min(255, Math.round(modelOutput[modelSize * modelSize + pixel])));
    modelBuffer[pixel * 3 + 2] = Math.max(0, Math.min(255, Math.round(modelOutput[2 * modelSize * modelSize + pixel])));
  }
  const upscaled = await sharp(modelBuffer, { raw: { width: modelSize, height: modelSize, channels: 3 } })
    .resize(width, height, { fit: 'fill', kernel: sharp.kernel.lanczos3 })
    .raw()
    .toBuffer();

  const output = Buffer.from(source);
  for (let pixel = 0; pixel < mask.length; pixel += 1) {
    if (!mask[pixel]) continue;
    output[pixel * channels] = upscaled[pixel * 3];
    output[pixel * channels + 1] = upscaled[pixel * 3 + 1];
    output[pixel * channels + 2] = upscaled[pixel * 3 + 2];
  }
  return output;
}

async function restoreSource(sourcePath) {
  const { data, info } = await sharp(sourcePath)
    .removeAlpha()
    .toColourspace('srgb')
    .raw()
    .toBuffer({ resolveWithObject: true });
  if (preserveSource) {
    return { buffer: data, info, maskedPixels: 0 };
  }
  const mask = detectWatermarkMask(data, info.width, info.height, info.channels);
  const restored = await inpaintMaskedPixels(data, mask, info.width, info.height, info.channels);
  if (debugMasks) {
    const debugDir = path.join(workspace, 'Kundans', 'debug-masks');
    const debugPath = path.join(debugDir, `${path.parse(sourcePath).name}-mask.png`);
    await fs.mkdir(debugDir, { recursive: true });
    await sharp(Buffer.from(mask.map((value) => value * 255)), {
      raw: { width: info.width, height: info.height, channels: 1 },
    }).png().toFile(debugPath);
    await sharp(restored, { raw: info }).png().toFile(path.join(debugDir, `${path.parse(sourcePath).name}-restored.png`));
    console.log('registration', path.parse(sourcePath).name, mask.registration);
  }
  return {
    buffer: restored,
    info,
    maskedPixels: mask.reduce((sum, value) => sum + value, 0),
  };
}

async function makeSampleSheet(records) {
  const tile = 420;
  const label = 54;
  const columns = 2;
  const composites = [];
  for (const [index, record] of records.entries()) {
    const left = (index % columns) * tile;
    const top = Math.floor(index / columns) * (tile + label);
    const thumb = await sharp(path.join(publicRoot, record.heroPath))
      .resize(tile, tile, { fit: 'cover' })
      .jpeg({ quality: 90 })
      .toBuffer();
    const labelSvg = Buffer.from(`<svg width="${tile}" height="${label}" xmlns="http://www.w3.org/2000/svg"><rect width="100%" height="100%" fill="#faf8f4"/><text x="12" y="28" font-family="Arial" font-size="16" fill="#34312f">${escapeXml(record.slug)}</text></svg>`);
    composites.push({ input: thumb, left, top });
    composites.push({ input: labelSvg, left, top: top + tile });
  }
  const rows = Math.ceil(records.length / columns);
  await sharp({ create: { width: columns * tile, height: rows * (tile + label), channels: 3, background: '#f3efea' } })
    .composite(composites)
    .jpeg({ quality: 92 })
    .toFile(sampleSheetPath);
}

const manifest = JSON.parse(await fs.readFile(manifestPath, 'utf8'));
let assets = manifest.assets.filter((asset) => asset.products.length > 0);
if (nonKundanOnly) assets = assets.filter((asset) => asset.category !== 'kundan-stones');
if (sampleOnly) assets = assets.filter((asset) => asset.products.some((product) => sampleSlugs.has(product.slug)));

const branding = brandingSvg();
const records = [];
const slugTotals = new Map();
for (const asset of assets) {
  const slug = seoSlug(asset.products[0].slug);
  slugTotals.set(slug, (slugTotals.get(slug) || 0) + 1);
}
const slugOccurrences = new Map();
for (const [index, asset] of assets.entries()) {
  const product = asset.products[0];
  const slug = seoSlug(product.slug);
  const occurrence = (slugOccurrences.get(slug) || 0) + 1;
  slugOccurrences.set(slug, occurrence);
  const viewSuffix = slugTotals.get(slug) > 1 ? `-view-${occurrence}` : '';
  const heroName = `${slug}${viewSuffix}-premium-product-v6.webp`;
  const cardName = `${slug}${viewSuffix}-catalog-v6.webp`;
  const heroPath = path.posix.join(asset.category, heroName);
  const cardPath = path.posix.join(asset.category, cardName);
  const outputDir = path.join(publicRoot, asset.category);
  await fs.mkdir(outputDir, { recursive: true });

  const sourcePath = path.join(sourceRoot, asset.source_path);
  const restored = await restoreSource(sourcePath);
  const productArea = await sharp(restored.buffer, { raw: restored.info })
    .resize(canvasSize, canvasSize - footerHeight, {
      fit: 'contain',
      background: '#faf8f4',
      kernel: sharp.kernel.lanczos3,
    })
    .png()
    .toBuffer();
  const heroBuffer = await sharp({ create: { width: canvasSize, height: canvasSize, channels: 3, background: '#faf8f4' } })
    .composite([
      { input: productArea, left: 0, top: 0 },
      { input: branding, left: 0, top: 0 },
    ])
    .webp({ quality: 88, effort: 5, smartSubsample: true })
    .toBuffer();

  await Promise.all([
    fs.writeFile(path.join(publicRoot, heroPath), heroBuffer),
    sharp(heroBuffer)
      .resize(800, 800, { fit: 'cover', kernel: sharp.kernel.lanczos3 })
      .webp({ quality: 82, effort: 5, smartSubsample: true })
      .toFile(path.join(publicRoot, cardPath)),
  ]);

  records.push({
    category: asset.category,
    oldPublicPath: asset.public_path,
    sourcePath: asset.source_path,
    products: asset.products,
    slug,
    view: occurrence,
    heroPath,
    cardPath,
    maskedPixels: restored.maskedPixels,
  });
  console.log(`${index + 1}/${assets.length} ${heroPath}`);
}

await fs.writeFile(outputManifestPath, `${JSON.stringify({ generatedAt: new Date().toISOString(), sampleOnly, nonKundanOnly, preserveSource, records }, null, 2)}\n`, 'utf8');
if (sampleOnly) await makeSampleSheet(records);
console.log(JSON.stringify({ processed: records.length, outputManifestPath, sampleSheetPath: sampleOnly ? sampleSheetPath : null }));
