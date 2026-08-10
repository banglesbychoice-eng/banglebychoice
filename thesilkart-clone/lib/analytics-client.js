'use client';

export function trackEvent(name, parameters = {}) {
  if (typeof window === 'undefined') return;
  window.gtag?.('event', name, parameters);
  window.clarity?.('event', name);
}

export function analyticsItems(items) {
  return items.map((item) => ({ item_id: String(item.id), item_name: item.name, item_variant: item.packSize || undefined, price: Number(item.price), quantity: Number(item.quantity || 1) }));
}
