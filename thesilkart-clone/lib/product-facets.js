import { normalizeProductText } from '@/lib/product-search';

const colours = ['rose gold', 'dark green', 'light green', 'sky blue', 'royal blue', 'navy blue', 'dark blue', 'light blue', 'baby pink', 'hot pink', 'rani pink', 'light pink', 'dark pink', 'off white', 'multi colour', 'multicolour', 'purple', 'violet', 'maroon', 'magenta', 'turquoise', 'orange', 'yellow', 'mustard', 'peach', 'cream', 'beige', 'brown', 'black', 'white', 'green', 'blue', 'pink', 'red', 'gold', 'silver', 'grey', 'gray', 'copper'];
const shapes = ['half moon', 'big s shape', 'small s shape', 'v shape', 'eye shape', 'teardrop', 'tear drop', 'rectangle', 'rectangular', 'marquise', 'diamond', 'triangle', 'square', 'round', 'oval', 'heart', 'flower', 'crown', 'leaf', 'eye', 'star', 'moon', 'drop', 'tilakam', 'tilak'];

function title(value) {
  return value.replace(/\b\w/g, (letter) => letter.toUpperCase()).replace('Grey', 'Gray').replace('Multi Colour', 'Multicolour').replace('Tear Drop', 'Teardrop').replace('Rectangular', 'Rectangle').replace('Tilakam', 'Tilak');
}

function unique(values) {
  return [...new Set(values.filter(Boolean))];
}

export function deriveProductFacets(product) {
  const text = normalizeProductText(`${product.name || ''} ${product.type || ''} ${product.subcategory || ''} ${product.tag || ''}`);
  const foundColours = colours.filter((colour, index) => text.includes(colour) && !colours.slice(0, index).some((specific) => text.includes(specific) && specific.includes(colour))).map(title);
  const foundShapes = shapes.filter((shape, index) => text.includes(shape) && !shapes.slice(0, index).some((specific) => text.includes(specific) && specific.includes(shape))).map(title);
  const stringSizes = Array.isArray(product.sizes) ? product.sizes.filter((value) => typeof value === 'string') : [];
  const sizeText = `${text} ${product.weight || ''} ${(product.pack_prices || []).filter((pack) => pack.available !== false).map((pack) => pack.label).join(' ')} ${stringSizes.join(' ')}`;
  const measuredSizes = sizeText.match(/\b\d+(?:\.\d+)?\s*(?:mm|cm|inches|inch|kg|g)\b/gi) || [];
  const dimensions = sizeText.match(/\b\d+(?:\.\d+)?\s*[x*]\s*\d+(?:\.\d+)?(?:\s*mm)?\b/gi) || [];
  const bangleSizes = sizeText.match(/\b2\.(?:2|4|6|8|10|12|14)\b/g) || [];
  return { colours: unique(foundColours), shapes: unique(foundShapes), sizes: unique([...measuredSizes, ...dimensions, ...bangleSizes].map((value) => value.replace(/\s+/g, '').replace('*', '×').toLowerCase())) };
}

export function facetOptions(products) {
  return {
    colours: unique(products.flatMap((product) => product.facets?.colours || [])).sort(),
    shapes: unique(products.flatMap((product) => product.facets?.shapes || [])).sort(),
    sizes: unique(products.flatMap((product) => product.facets?.sizes || [])).sort((left, right) => left.localeCompare(right, undefined, { numeric: true })),
  };
}

export function matchesFacets(product, filters) {
  return (!filters.colour || product.facets?.colours.includes(filters.colour)) && (!filters.shape || product.facets?.shapes.includes(filters.shape)) && (!filters.size || product.facets?.sizes.includes(filters.size));
}
