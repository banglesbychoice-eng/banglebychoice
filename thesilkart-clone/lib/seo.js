export const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://www.banglebychoice.in';
export const siteName = 'Bangle by Choice';
export const defaultOgImage = '/images/generated/banglebychoice-hero.webp';
const weakMetaPattern = /^(descriptionshipping|buy .+ online for bangles, jewellery making, blouse work and diy craft projects\. premium kundan stones from bangle by choice\.)/i;

export function absoluteUrl(path = '/') {
  return new URL(path, siteUrl).toString();
}

export function ogImage(src = defaultOgImage, alt = `${siteName} product preview`) {
  return { url: absoluteUrl(src || defaultOgImage), width: 1200, height: 630, alt };
}

export function ogImages(images = [], alt = `${siteName} product preview`) {
  const normalized = images.filter(Boolean).map((image) => ogImage(image, alt));
  return normalized.length ? normalized : [ogImage(defaultOgImage, alt)];
}

export function twitterImage(images = []) {
  return [absoluteUrl(images.filter(Boolean)[0] || defaultOgImage)];
}

export function jsonLd(data) {
  return JSON.stringify(data).replace(/</g, '\\u003c');
}

function cleanText(value = '') {
  return String(value).replace(/\s+/g, ' ').trim();
}

function titleCase(value = '') {
  return cleanText(value)
    .toLowerCase()
    .split(' ')
    .map((word) => (/^\d+(?:[x×*.-]\d+)?[a-z]*$/i.test(word) ? word.toUpperCase() : word.charAt(0).toUpperCase() + word.slice(1)))
    .join(' ')
    .replace(/\bMm\b/g, 'mm')
    .replace(/\bK\b/g, 'K')
    .replace(/\bMdf\b/g, 'MDF')
    .replace(/\bB-7000\b/g, 'B-7000')
    .replace(/\*/g, '×');
}

function sentence(values = []) {
  const filtered = values.map(cleanText).filter(Boolean);
  if (filtered.length < 2) return filtered[0] || '';
  return `${filtered.slice(0, -1).join(', ')} and ${filtered.at(-1)}`;
}

function productAttributes(product) {
  const productText = `${product.name || ''} ${product.subcategory || ''} ${product.type || ''}`;
  const facets = product.facets || {};
  const attributes = [
    ...(facets.shapes || []).slice(0, 2),
    ...(facets.colours || []).slice(0, 2),
    ...(facets.sizes || []).filter((size) => !/^\d+(?:\.\d+)?\s*(?:g|kg|pack)/i.test(size)).slice(0, 2),
  ];
  const finish = /glue|adhesive/i.test(productText) ? 'adhesive' : /glossy|matte|glass|ceramic|pearl|stone|silk|mdf/i.exec(productText)?.[0];
  if (finish) attributes.push(titleCase(finish));
  return sentence([...new Set(attributes.map(titleCase))].slice(0, 5));
}

function productUseCaseText(product) {
  const text = `${product.category || ''} ${product.subcategory || ''} ${product.type || ''} ${product.name || ''}`.toLowerCase();
  if (text.includes('kundan')) return 'silk thread bangles, bridal bangle sets, borders and centre motifs';
  if (text.includes('glue') || text.includes('adhesive')) return 'thread wrapping, stone fixing and clean bangle finishing';
  if (text.includes('thread')) return 'silk thread bangles, wrapped bases and coordinated handmade sets';
  if (text.includes('chain') || text.includes('chaine')) return 'silk thread bangle borders, accents and coordinated sets';
  if (text.includes('charm') || text.includes('marking')) return 'designer silk thread bangles, festive sets and traditional motifs';
  if (text.includes('bangle')) return 'silk thread wrapping, Kundan decoration and custom bangle sets';
  if (text.includes('plier') || text.includes('cutter') || text.includes('tool')) return 'cutting, shaping and assembling silk thread bangle decorations';
  return 'silk thread bangles, decorative borders and handmade bangle sets';
}

export function isWeakProductMetaDescription(value = '') {
  const text = cleanText(value);
  return !text || text.length < 120 || weakMetaPattern.test(text);
}

export function productSeoTitle(product) {
  const name = titleCase(product.name);
  return name.length <= 54 ? name : `${name.slice(0, 51).trim()}…`;
}

export function premiumProductMetaDescription(product) {
  const name = titleCase(product.name);
  const attributes = productAttributes(product);
  const price = Number(product.sale_price || product.price);
  const priceText = Number.isFinite(price) && price > 0 ? ` starting at ₹${Math.round(price)}` : '';
  const quality = attributes ? `${attributes} finish` : 'premium craft finish';
  const base = cleanText(`Buy ${name}${priceText} from Bangle by Choice. ${quality} for ${productUseCaseText(product)}. Dispatch within 24 hours across India.`);
  if (base.length <= 155) return base;
  return cleanText(`Buy ${name}${priceText} for silk thread bangles and handmade bangle sets. Dispatch within 24 hours across India from Bangle by Choice.`).slice(0, 155);
}

export function premiumProductDescription(product) {
  const name = titleCase(product.name);
  const category = titleCase(product.category || 'Jewellery Making Supplies');
  return cleanText(`${name} is a ${category.toLowerCase()} item suited to ${productUseCaseText(product)}. Its colour, shape and finish are shown clearly in the product photos so you can match it to your design. Choose the pack size you need above. Packed by Bangle by Choice in Hyderabad and dispatched across India.`);
}

export function productKeywords(product) {
  return [
    titleCase(product.name),
    product.category,
    product.subcategory,
    product.type,
    ...(product.facets?.colours || []).map((colour) => `${colour} bangle making material`),
    ...(product.facets?.shapes || []).map((shape) => `${shape} kundans`),
    'silk thread bangle making materials',
    'bangle making supplies India',
    'Bangle by Choice',
  ].map(cleanText).filter(Boolean);
}
