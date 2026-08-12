const titleFixes = new Map([
  ['and', 'and'],
  ['3d', '3D'],
  ['2d', '2D'],
  ['mdf', 'MDF'],
  ['b7000', 'B-7000'],
  ['6k', '6K'],
  ['8k', '8K'],
]);

const colourWords = [
  'baby', 'black', 'blue', 'c', 'dark', 'gold', 'green', 'kanakambaram', 'krishna', 'lavender', 'leaf',
  'light', 'multi', 'multicolour', 'nemali', 'onion', 'orange', 'peach', 'peacock', 'pink', 'pistha',
  'pista', 'pestral', 'purple', 'rainbow', 'rama', 'red', 'rose', 'sea', 'silver', 'sky', 'skyblue',
  'tomato', 'violet', 'white', 'yellow',
];

const finishWords = [
  'ceramic', 'ceramiic', 'colour', 'color', 'glass', 'glod', 'glossy', 'matt', 'matte', 'shade',
];

function normalizeSpaces(value = '') {
  return String(value).replace(/[×]/g, 'x').replace(/x{2,}/gi, 'x').replace(/\s+/g, ' ').trim();
}

function normalizeKey(value = '') {
  return normalizeSpaces(value).toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
}

function titleCase(value = '') {
  return normalizeSpaces(value)
    .toLowerCase()
    .replace(/\b[a-z0-9]+\b/g, (word) => titleFixes.get(word) || `${word[0].toUpperCase()}${word.slice(1)}`)
    .replace(/\bAnd\b/g, 'and')
    .replace(/\bB 7000\b/g, 'B-7000')
    .replace(/\bMdf\b/g, 'MDF')
    .replace(/\b6k\b/gi, '6K')
    .replace(/\b8k\b/gi, '8K')
    .replace(/(\d+)x(\d+)/gi, '$1×$2');
}

function searchableText(product) {
  return normalizeSpaces([product?.name, product?.subcategory, product?.tag, product?.type].filter(Boolean).join(' ')).toLowerCase();
}

function cleanProductName(product) {
  return normalizeSpaces(product?.name || 'Other products')
    .replace(/^[\d.]+\s*[–—-]\s*/u, '')
    .replace(/\s*\([^)]{1,80}\)\s*$/u, '')
    .replace(/\s+(?:catalogue|catalog)\s+\d+\b/iu, '')
    .replace(/\s*-\s*(?:copy|duplicate)\b/iu, '')
    .replace(/\s+\d+\s*$/u, '');
}

function stripVariantWords(value = '') {
  const blocked = new Set([...colourWords, ...finishWords, 'kundans', 'kundan', 'stones', 'shape', 'shaped', 'size']);
  return normalizeSpaces(value)
    .toLowerCase()
    .split(/\s+/)
    .filter((word) => !blocked.has(word))
    .join(' ');
}

function kundanFamily(product) {
  const text = searchableText(product).replace(/×/g, 'x');
  const name = cleanProductName(product).replace(/×/g, 'x').toLowerCase();

  const sizedClipstone = text.match(/\b(\d+(?:\.\d+)?)\s*mm\b.*\bclip\s*stones?\b/) || text.match(/\bclip\s*stones?\b.*\b(\d+(?:\.\d+)?)\s*mm\b/);
  if (sizedClipstone) return `${sizedClipstone[1]}mm Round Clip Stones`;

  const sizedRound = text.match(/\b(\d+(?:\.\d+)?)\s*mm\b.*\bround\b/) || text.match(/\bround\b.*\b(\d+(?:\.\d+)?)\s*mm\b/);
  if (sizedRound) return `${sizedRound[1]}mm Round Kundans`;

  const sizedSquare = text.match(/\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b.*\bsquare\b/) || text.match(/\bsquare\b.*\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b/);
  if (sizedSquare) return `${sizedSquare[1]}×${sizedSquare[2]} Square Kundans`;

  const sizedRectangle = text.match(/\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b.*\b(?:rectangle|rectangular)\b/) || text.match(/\b(?:rectangle|rectangular)\b.*\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b/);
  if (sizedRectangle) return `${sizedRectangle[1]}×${sizedRectangle[2]} Rectangle Kundans`;

  const sizedEye = text.match(/\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b.*\beye\b/) || text.match(/\beye\b.*\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b/);
  if (sizedEye) return `${sizedEye[1]}×${sizedEye[2]} Eye Shape Kundans`;

  const genericDimension = text.match(/\b(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)\b/);
  if (genericDimension && genericDimension[1] === genericDimension[2]) return `${genericDimension[1]}×${genericDimension[2]} Square Kundans`;

  const millimetreSize = text.match(/\b(\d+(?:\.\d+)?)\s*mm\b/);
  if (millimetreSize) return `${millimetreSize[1]}mm Round Kundans`;

  const kEye = text.match(/\b([68])\s*k\b.*\beye\b/) || text.match(/\b([68])k\b.*\beye\b/);
  if (kEye) return `${kEye[1]}K Eye Shape Kundans`;

  const kDrop = text.match(/\b([68])\s*k\b.*\bdrop\b/) || text.match(/\b([68])k\b.*\bdrop\b/);
  if (kDrop) return `${kDrop[1]}K Drop Kundans`;

  if (/\bv\b.*\bshape\b|\bv shape\b/.test(text)) return 'V Shape Kundans';
  if (/\btriangle\b/.test(text)) return 'Triangle Kundans';
  if (/\bdiamond\b/.test(text)) return 'Diamond Shape Kundans';
  if (/\bhalf\b.*\bmo+?n\b|\bhlaf\b.*\bmoon\b|\bmoom\b/.test(text)) return 'Half Moon Kundans';
  if (/\bmoon\b/.test(text)) return 'Moon Shape Kundans';
  if (/\btilakam\b|\b4k\b.*\bdrop\b/.test(text)) return 'Tilakam Shape Kundans';
  if (/\bheart\b/.test(text)) return 'Heart Shape Kundans';
  if (/\bcrown\b/.test(text)) return 'Crown Shape Kundans';
  if (/\bstar\b/.test(text)) return 'Star Kundans';
  if (/\bbig\b.*\bs\b.*\bshape\b/.test(text)) return 'Big S Shape Kundans';
  if (/\bsmall\b.*\bs\b.*\bshape\b/.test(text)) return 'Small S Shape Kundans';
  if (/\bpear\b|\bjadav\b|\bpendent\b|\bpendant\b/.test(text)) return 'Jadav Kundan Components';

  const cleaned = stripVariantWords(name.replace(/[-_]/g, ' '));
  return cleaned ? `${titleCase(cleaned)} Kundans` : 'Kundan Stones';
}

function silkThreadFamily(product) {
  const text = searchableText(product);
  const name = cleanProductName(product).toLowerCase();

  if (/\bsilk\s*thread\b/.test(text)) return 'Lotus Silk Thread';
  if (/\bstone\s*chai?n(?:e|s)?\b|\bperal\s*chai?n/.test(text)) return 'Stone Chains';
  if (/\bmarking\b/.test(text)) return 'Marking Papers';
  if (/\bmdf\b/.test(text)) return 'MDF Bases';
  if (/\bb-?7000\b/.test(text)) return 'B-7000 Glue';
  if (/\bfabric\s*glue\b|\bglue\s*pad\b|\bgums?\b|\bglue\s*pens?\b/.test(text)) return 'Glue and Adhesives';
  if (/\bbeginner\s*kit\b|\bsmall\s*business\s*kit\b|\bfree\s*classes\b/.test(text)) return 'Starter Kits';
  if (/\bpressing\s*covers?\b/.test(text)) return 'Pressing Covers';
  if (/\bstick\s*covers?\b/.test(text)) return 'Stick Covers';
  if (/\bflat\b.*\bmixed\b.*\bbox\b/.test(text)) return 'Flat Mixed Bangle Boxes';
  if (/\bcurve\b.*\bmixed\b.*\bbox\b|\bcurv[e]?\s+mixed\s+bamgle\b/.test(text)) return 'Curve Mixed Bangle Boxes';
  if (/\bflat\b.*\bplain\b.*\bbox\b/.test(text)) return 'Flat Plain Bangle Boxes';
  if (/\bcurve\b.*\bplain\b.*\bbox\b/.test(text)) return 'Curve Plain Bangle Boxes';
  if (/\bbangle\s*box/.test(text)) return 'Bangle Boxes';
  if (/\blaxmi\b|\bkasulu\b|\bcoin/.test(text)) return 'Laxmi Coins and Kasulu';
  if (/\bleaf\b.*\bcharms?\b/.test(text)) return 'Leaf Charms';
  if (/\bcharms?\b/.test(text)) return 'Charms';

  return titleCase(product?.subcategory || name || 'Silk Thread Materials');
}

function derivedFamily(product) {
  const category = normalizeSpaces(product?.category || product?.cat || '');
  const categoryKey = category.toLowerCase();
  if (categoryKey.includes('kundan')) return kundanFamily(product);
  if (categoryKey.includes('silk thread')) return silkThreadFamily(product);
  return titleCase(cleanProductName(product) || product?.subcategory || category || 'Other products');
}

export function productDesignName(product) {
  return derivedFamily(product);
}

export function productGroupKey(product) {
  return [product?.category || product?.cat, productDesignName(product)]
    .map(normalizeKey)
    .filter(Boolean)
    .join('|');
}

export function productGroupLabel(product) {
  return productDesignName(product);
}

export function groupProductsByDesign(products) {
  const groups = new Map();
  products.forEach((product) => {
    const key = productGroupKey(product);
    if (!groups.has(key)) groups.set(key, { key, label: productGroupLabel(product), products: [] });
    groups.get(key).products.push(product);
  });

  return [...groups.values()]
    .map((group) => ({ ...group, products: group.products.sort((left, right) => left.name.localeCompare(right.name, undefined, { numeric: true })) }))
    .sort((left, right) => left.label.localeCompare(right.label, undefined, { numeric: true }));
}
