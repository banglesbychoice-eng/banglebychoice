export const FREE_SHIPPING_MIN = 999;
export const MINIMUM_SHIPPING_FEE = 60;
export const SHIPPING_RATE_PER_KG = 65;
export const SHIPPING_FEE = MINIMUM_SHIPPING_FEE;

const PACKAGING_WEIGHT_GRAMS = 100;
const BANGLE_BOX_WEIGHT_GRAMS = 300;

function parsePackAmount(choice) {
  const match = String(choice || '').trim().match(/([\d.]+)\s*(kg|g)?/i);
  if (!match) return null;
  const amount = Number(match[1]);
  if (!Number.isFinite(amount) || amount <= 0) return null;
  return match[2]?.toLowerCase() === 'kg' ? amount * 1000 : amount;
}

export function getPackGrams(choice) {
  return parsePackAmount(choice);
}

function getShippingPackGrams(choice) {
  const match = String(choice || '').trim().match(/^([\d.]+)\s*(kg|g)$/i);
  if (!match) return 0;
  const amount = Number(match[1]);
  if (!Number.isFinite(amount) || amount <= 0) return 0;
  return match[2].toLowerCase() === 'kg' ? amount * 1000 : amount;
}

export function isBangleBoxProduct(product) {
  return /(?:bangle|bamgle)\s*(?:making\s*)?box|box[^a-z]*(?:bangle|bamgle)/i.test([
    product?.name,
    product?.type,
    product?.subcategory,
    product?.category,
  ].filter(Boolean).join(' '));
}

export function getFreeShippingRemaining(subtotal) {
  return Math.max(0, FREE_SHIPPING_MIN - Number(subtotal || 0));
}

function itemShippingWeight(item) {
  const quantity = Math.max(1, Number(item?.quantity) || 1);
  if (isBangleBoxProduct(item)) return BANGLE_BOX_WEIGHT_GRAMS * quantity;
  const selectedPackGrams = getShippingPackGrams(item?.packSize);
  const configuredGrams = Number(item?.shippingWeightGrams || item?.shipping_weight_grams || 0);
  const unitGrams = selectedPackGrams || (Number.isFinite(configuredGrams) && configuredGrams > 0 ? configuredGrams : 0);
  return unitGrams * quantity;
}

function feeForProductWeight(productWeightGrams, hasItems) {
  if (!hasItems) return 0;
  const chargeableWeightGrams = productWeightGrams + PACKAGING_WEIGHT_GRAMS;
  return Math.max(MINIMUM_SHIPPING_FEE, Math.ceil((chargeableWeightGrams / 1000) * SHIPPING_RATE_PER_KG));
}

export function getShippingQuote(cart = [], subtotal = 0) {
  const items = Array.isArray(cart) ? cart : [];
  const bangleBoxItems = items.filter(isBangleBoxProduct);
  const regularProductWeightGrams = items.reduce((total, item) => total + itemShippingWeight(item), 0);
  const bangleBoxWeightGrams = bangleBoxItems.reduce((total, item) => total + itemShippingWeight(item), 0);
  const regularFee = feeForProductWeight(regularProductWeightGrams, items.length > 0);
  const thresholdReached = Number(subtotal) >= FREE_SHIPPING_MIN;
  const fee = thresholdReached
    ? feeForProductWeight(bangleBoxWeightGrams, bangleBoxItems.length > 0)
    : regularFee;

  return {
    fee,
    regularFee,
    deliveryDiscount: Math.max(0, regularFee - fee),
    freeShippingSavings: Math.max(0, regularFee - fee),
    remainingForFreeShipping: getFreeShippingRemaining(subtotal),
    thresholdReached,
    hasBangleBoxes: bangleBoxItems.length > 0,
  };
}

export function getBestValuePack(product) {
  const choices = getPackChoices(product);
  return choices.reduce((best, choice) => {
    const grams = getPackGrams(choice);
    if (!grams) return best;
    const unitPrice = getPackPrice(product, choice) / grams;
    return !best || unitPrice < best.unitPrice ? { label: choice, unitPrice } : best;
  }, null)?.label || '';
}

export function getPackChoices(product) {
  if (product.pack_prices?.length) return product.pack_prices.map((pack) => pack.label).filter(Boolean);
  return product.weight ? product.weight.split(',').map((choice) => choice.trim()).filter(Boolean) : [];
}

export function getPackPrice(product, packSize = '') {
  const basePrice = Number(product.sale_price ?? product.price ?? 0);
  const configuredPack = product.pack_prices?.find((pack) => pack.label === packSize);
  if (configuredPack && Number.isFinite(Number(configuredPack.price))) return Math.round(Number(configuredPack.price));
  const choices = getPackChoices(product);
  if (!packSize || choices.length < 2) return Math.round(basePrice);

  const amounts = choices.map(parsePackAmount);
  const selectedAmount = parsePackAmount(packSize);
  if (!selectedAmount || amounts.some((amount) => !amount)) return Math.round(basePrice);

  const baseAmount = Math.min(...amounts);
  return Math.round(basePrice * (selectedAmount / baseAmount));
}

export function getPackMrp(product, packSize = '') {
  const configuredPack = product.pack_prices?.find((pack) => pack.label === packSize);
  if (configuredPack && Number.isFinite(Number(configuredPack.mrp))) return Math.round(Number(configuredPack.mrp));
  const sellingPrice = Number(product.sale_price ?? product.price ?? 0);
  const mrp = Number(product.price ?? sellingPrice);
  if (!sellingPrice) return Math.round(mrp);
  return Math.round(getPackPrice(product, packSize) * (mrp / sellingPrice));
}

export function getShippingFee(subtotal, cart = []) {
  if (!cart.length) return Number(subtotal) >= FREE_SHIPPING_MIN ? 0 : MINIMUM_SHIPPING_FEE;
  return getShippingQuote(cart, subtotal).fee;
}

export function getPriceValidUntil(days = 30) {
  const date = new Date();
  date.setUTCDate(date.getUTCDate() + days);
  return date.toISOString().slice(0, 10);
}
