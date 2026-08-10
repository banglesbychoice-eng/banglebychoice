const disallowedTerms = [
  'imitation jewellery material',
  'mirdhu art products',
  'wall decor',
  'wall décor',
  'uvabyrosin',
  'rosin jewellery',
  'return gifts',
  'jewellery sets',
  'stock clearance sets',
  'fancy items',
];

function normalize(value = '') {
  return String(value).toLowerCase().replace(/\s+/g, ' ').trim();
}

export function isDisallowedProduct(product = {}) {
  const fields = [product.cat, product.category, product.tag, product.subcategory, product.name, product.slug].map(normalize);
  return disallowedTerms.some((term) => fields.some((field) => field === term || field.includes(term)));
}
