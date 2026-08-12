const bangleProductPattern = /\bbangle(?:s)?\b/i;
const bangleMaterialPattern = /bangle size sticker|bangle making|bangle material/i;
const bangleBoxPattern = /bangle boxes?/i;
const accessoryPattern = /\b(?:charms?|chains?|pendants?|lockets?|connectors?|saree pins?|brooch(?:es)?|hair clips?|hair bands?|rubber bands?|u pins?|acrylic beads?|hanging beads?|sugar beads?|pearls?|earrings?|jhumkas?|necklaces?|anklets?|bracelets?)\b/i;

export const storeDepartments = [
  { slug: 'raw-materials', name: 'Raw Materials' },
  { slug: 'bangles', name: 'Bangles' },
  { slug: 'accessories', name: 'Accessories' },
];

export function productDepartment(product) {
  const name = product?.name || '';
  const searchable = `${name} ${product?.subcategory || ''}`;
  if (bangleBoxPattern.test(searchable) || (bangleProductPattern.test(name) && !bangleMaterialPattern.test(name))) return 'bangles';
  if (accessoryPattern.test(searchable)) return 'accessories';
  return 'raw-materials';
}

export function getStoreDepartment(slug) {
  return storeDepartments.find((department) => department.slug === slug);
}

export function departmentProducts(products, slug) {
  return products.filter((product) => productDepartment(product) === slug);
}
