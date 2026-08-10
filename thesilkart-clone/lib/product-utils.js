const WATERMARK_REVISION = '20260720';

export function versionedProductImage(image = '') {
  const imagePath = image.split('?')[0];
  if (!imagePath.startsWith('/images/kundan-stones/') || !/-(?:hero-top-view|catalog)(?:-v\d+)?\.webp$/i.test(imagePath)) return image;
  return `${imagePath}?wm=${WATERMARK_REVISION}`;
}

export function catalogImage(productOrImage) {
  const image = typeof productOrImage === 'string'
    ? productOrImage
    : Array.isArray(productOrImage?.images) && productOrImage.images.length
      ? productOrImage.images[0]
      : productOrImage?.image;
  if (!image) return '/images/generated/banglebychoice-hero.webp';
  if (image.startsWith('/images/kundan-stones/')) {
    const imagePath = image.split('?')[0];
    return versionedProductImage(imagePath
      .replace(/-hero-top-view(-v\d+)?\.webp$/i, '-catalog$1.webp')
      .replace(/-premium-product-v6\.webp$/i, '-catalog-v6.webp'));
  }
  return image;
}

function cleanProductSlug(value = '') {
  return String(value)
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

export function categorySlug(category = '') {
  const value = String(category).toLowerCase();
  if (value.includes('kundan') || value.includes('stone')) return 'kundan-stones';
  if (value.includes('thread') || value.includes('material')) return 'silk-thread-materials';
  if (value.includes('bangle')) return 'bangle-boxes';
  return cleanProductSlug(category) || 'jewellery-making';
}
