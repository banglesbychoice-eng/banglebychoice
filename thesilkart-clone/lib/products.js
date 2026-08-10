import catalog from '@/data/products.json';

const slugFromProduct = (product) => product.url.split('/').filter(Boolean).pop();

export function catalogImage(image = '') {
  if (image.includes('crown-shape-glossy-white-kundans-hero-top-view-v2.webp')) {
    return image.replace('-hero-top-view-v2.webp', '-catalog-v2.webp');
  }
  if (image.endsWith('-hero-top-view-v4.webp')) {
    return image.replace('-hero-top-view-v4.webp', '-catalog-v4.webp');
  }
  if (image.endsWith('-hero-top-view-v5.webp')) {
    return image.replace('-hero-top-view-v5.webp', '-catalog-v5.webp');
  }
  if (image.endsWith('-premium-product-v6.webp')) {
    return image.replace('-premium-product-v6.webp', '-catalog-v6.webp');
  }
  return image.replace(/-hero-top-view-v3\.webp$/, '-catalog-v3.webp');
}

const TYPO_REPLACEMENTS = [
  ['purpule', 'purple'],
  ['prupule', 'purple'],
  ['droup', 'drop'],
  ['moom', 'moon'],
  ['trianglr', 'triangle'],
  ['reactangle', 'rectangle'],
  ['pestral', 'pastel'],
  ['peral', 'pearl'],
  ['piler', 'plier'],
  ['jewelery', 'jewellery'],
];

export function cleanProductText(value = '') {
  return TYPO_REPLACEMENTS.reduce((text, [from, to]) => text.replace(new RegExp(from, 'gi'), (match) => {
    if (match === match.toUpperCase()) return to.toUpperCase();
    if (match[0] === match[0].toUpperCase()) return `${to[0].toUpperCase()}${to.slice(1)}`;
    return to;
  }), value).replace(/\s+/g, ' ').trim();
}

export function cleanProductSlug(slug = '') {
  return cleanProductText(slug).toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
}

export function rawSlugCandidates(slug = '') {
  let candidates = new Set([slug]);
  TYPO_REPLACEMENTS.forEach(([from, to]) => {
    const nextCandidates = new Set(candidates);
    candidates.forEach((candidate) => {
      if (candidate.includes(to)) nextCandidates.add(candidate.replaceAll(to, from));
    });
    candidates = nextCandidates;
  });
  return [...candidates];
}

export const products = catalog.products.map((product) => ({
  ...product,
  raw_slug: slugFromProduct(product),
  slug: cleanProductSlug(slugFromProduct(product)),
  image: `/${product.images[0].replaceAll('\\', '/')}`,
  images: product.images.map((image) => `/${image.replaceAll('\\', '/')}`),
}));

export const categories = [...new Set(products.map((product) => product.category))];

export function categorySlug(category) {
  return cleanProductSlug(category);
}

export function getCategoryBySlug(slug) {
  return categories.find((category) => categorySlug(category) === cleanProductSlug(slug));
}

export function getProduct(slug) {
  return products.find((product) => product.slug === cleanProductSlug(slug) || product.raw_slug === slug);
}

export function getRelatedProducts(product, count = 8) {
  return products
    .filter((item) => item.category === product.category && item.id !== product.id)
    .slice(0, count);
}

export function titleCase(value) {
  return cleanProductText(value)
    .replace(/\b\w/g, (letter) => letter.toUpperCase())
    .replace('Purpule', 'Purple')
    .replace('Peral', 'Pearl');
}
