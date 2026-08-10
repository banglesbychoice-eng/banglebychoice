import { productGroupLabel } from '@/lib/product-grouping';

const corrections = new Map([
  ['purpule', 'purple'], ['prupule', 'purple'], ['bliu', 'blue'], ['droup', 'drop'], ['reactangle', 'rectangle'],
  ['cilpstones', 'clipstones'], ['cilpstone', 'clipstone'], ['peral', 'pearl'], ['moom', 'moon'], ['piler', 'plier'],
  ['jewelery', 'jewellery'], ['kundhans', 'kundans'], ['kudan', 'kundan'], ['kundhan', 'kundan'],
  ['glosy', 'glossy'], ['glod', 'gold'], ['chaines', 'chains'], ['chaine', 'chain'], ['bluee', 'blue'],
  ['six', '6'], ['eight', '8'], ['for', ''],
]);

const stopWords = new Set(['a', 'an', 'and', 'are', 'buy', 'do', 'for', 'find', 'give', 'i', 'in', 'me', 'need', 'of', 'online', 'please', 'product', 'products', 'search', 'show', 'the', 'to', 'want', 'with']);

const aliases = new Map([
  ['adhesive', ['glue', 'gum']], ['glue', ['adhesive', 'gum']], ['tool', ['plier', 'cutter']], ['tools', ['plier', 'cutter']],
  ['stone', ['kundan', 'clipstone']], ['stones', ['kundan', 'clipstones']], ['thread', ['silk']], ['bangle', ['bangles']],
  ['bead', ['beads']], ['beads', ['bead']], ['jewelry', ['jewellery']],
  ['dhaga', ['thread', 'silk']], ['moti', ['beads', 'pearl']], ['patthar', ['stone', 'kundan']],
  ['choodiyan', ['bangle', 'bangles']], ['gajulu', ['bangle', 'bangles']], ['rangu', ['colour', 'color']],
  ['6', ['6k']], ['8', ['8k']], ['eye', ['navette']], ['navette', ['eye']], ['drop', ['tilakam']],
  ['round', ['circle']], ['circle', ['round']], ['white', ['ceramic']], ['ceramic', ['white']],
  ['gloss', ['glossy']], ['glossy', ['gloss']], ['chain', ['chains']], ['chains', ['chain']],
]);

export function normalizeProductText(value = '') {
  return String(value)
    .toLowerCase()
    .replace(/[×*]/g, 'x')
    .replace(/(\d)\s+k\b/g, '$1k')
    .replace(/(\d+(?:\.\d+)?)\s*mm\b/g, '$1mm')
    .replace(/(\d+(?:\.\d+)?)\s*x\s*(\d+(?:\.\d+)?)/g, '$1x$2')
    .replace(/[^a-z0-9.]+/g, ' ')
    .trim()
    .split(/\s+/)
    .filter(Boolean)
    .map((word) => corrections.get(word) || word)
    .filter((word) => word && !stopWords.has(word))
    .join(' ');
}

function baseQueryTokens(query) {
  return normalizeProductText(query).split(' ').filter(Boolean);
}

function searchTokens(query) {
  const base = baseQueryTokens(query);
  return [...new Set(base.flatMap((token) => [token, ...(aliases.get(token) || [])]))];
}

function tokenMatches(field, token) {
  if (!token) return true;
  if (field.includes(token)) return true;
  if (token.length >= 3) return field.split(' ').some((word) => word.startsWith(token) || token.startsWith(word));
  return false;
}

function tokenScore({ name, family, category, subcategory, haystack }, token) {
  if (name === token) return 70;
  if (name.startsWith(token)) return 55;
  if (name.includes(token)) return 36;
  if (family.includes(token)) return 28;
  if (subcategory.includes(token)) return 16;
  if (category.includes(token)) return 10;
  if (haystack.includes(token)) return 6;
  if (token.length >= 3 && haystack.split(' ').some((word) => word.startsWith(token))) return 4;
  return 0;
}

export function productFamily(product) {
  return productGroupLabel(product);
}

export function scoreProduct(product, query) {
  const normalizedQuery = normalizeProductText(query);
  if (!normalizedQuery) return 1;
  const name = normalizeProductText(product.name);
  const family = normalizeProductText(productFamily(product));
  const category = normalizeProductText(product.category);
  const subcategory = normalizeProductText(product.subcategory);
  const haystack = `${name} ${family} ${category} ${subcategory} ${normalizeProductText(product.type)} ${normalizeProductText(product.sku)} ${(product.facets?.colours || []).join(' ')} ${(product.facets?.shapes || []).join(' ')} ${(product.facets?.sizes || []).join(' ')} ${(product.pack_prices || []).map((pack) => pack.label).join(' ')}`;
  const tokens = searchTokens(query);
  const baseTokens = baseQueryTokens(query);
  if (!baseTokens.every((token) => tokenMatches(haystack, token) || (aliases.get(token) || []).some((alias) => tokenMatches(haystack, alias)))) return 0;
  let score = tokens.reduce((total, token) => total + tokenScore({ name, family, category, subcategory, haystack }, token), 0);
  if (name === normalizedQuery) score += 120;
  else if (name.startsWith(normalizedQuery)) score += 80;
  else if (name.includes(normalizedQuery)) score += 50;
  if (family === normalizedQuery) score += 90;
  else if (family.startsWith(normalizedQuery)) score += 60;
  else if (family.includes(normalizedQuery)) score += 35;
  return score;
}

export function searchProducts(products, query) {
  return products.map((product) => ({ product, score: scoreProduct(product, query) })).filter((item) => item.score > 0).sort((a, b) => b.score - a.score || a.product.name.localeCompare(b.product.name)).map((item) => item.product);
}
