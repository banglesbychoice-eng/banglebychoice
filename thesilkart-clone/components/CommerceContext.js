'use client';

import { createContext, useContext, useEffect, useState } from 'react';
import { CheckCircle2, X } from 'lucide-react';
import { getPackChoices, getPackMrp, getPackPrice } from '@/lib/pricing';
import styles from './CommerceContext.module.css';
import { trackEvent } from '@/lib/analytics-client';

const CommerceContext = createContext(null);

const correctedTilakamNames = new Map([
  ['6k-drop-dark-blue-glossy-kundans', 'Tilakam Shape Dark Blue Glossy Kundans'],
  ['6k-drop-green-glass-kundans', 'Tilakam Shape Green Glass Kundans'],
  ['6k-drop-glossy-white-kundans', 'Tilakam Shape Clear White Glossy Kundans'],
  ['6k-drop-c-green-glass-kundans', 'Tilakam Shape C Green Glass Kundans'],
  ['6k-drop-champagne-glass-kundans', 'Tilakam Shape Champagne Glass Kundans'],
  ['6k-drop-baby-pink-glass-kundans', 'Tilakam Shape Baby Pink Champagne Glass Kundans'],
  ['6k-drop-deep-red-glass-kundans', 'Tilakam Shape Deep Red Glass Kundans'],
]);

const draftedProductSlugs = new Set([
  'tilakam-shape-peach-glossy',
  'tilakam-shape-sea-green-glass',
  'tilakam-shape-dark-pink-glossy-kundans',
  'multicolour-kundans-tilakam-4k-drop-shape',
  'tilakam-shape-light-purpule-glossy-kundans',
  'tilakam-shape-glossy-white',
  'tilakam-shape-sky-blue-glass',
  'tilakam-shape-dark-green-glass',
  'tilakam-shape-baby-pink-glass',
  'tilakam-shape-red-glass',
  'tilakam-shape-yellow-glass',
  '6k-drop-rose-pink-glass-kundans',
  'lotus-silk-thread-shade-no-63s',
  'lotus-silk-thread-shade-no-706',
  'lotus-silk-thread-shade-no-87n',
  'lotus-silk-thread-shade-no-74',
  'lotus-silk-thread-shade-no-9d',
  'lotus-silk-thread-shade-no-30nd',
  'lotus-silk-thread-shade-no-28',
]);

function correctStoredCartItem(item) {
  const correctedName = correctedTilakamNames.get(item.slug);
  if (!correctedName) return item;
  return { ...item, name: correctedName, category: 'Kundan Stones', subcategory: 'Tilakam Shape Kundans', type: 'Tilakam shape glass kundans' };
}

function readStorage(key) {
  try {
    return JSON.parse(localStorage.getItem(key) || '[]');
  } catch {
    return [];
  }
}

export function CommerceProvider({ children }) {
  const [cart, setCart] = useState([]);
  const [wishlist, setWishlist] = useState([]);
  const [cartOpen, setCartOpen] = useState(false);
  const [cartNotice, setCartNotice] = useState('');

  useEffect(() => {
    const timer = window.setTimeout(() => {
      const pricingVersion = localStorage.getItem('bbc_cart_pricing_version');
      if (pricingVersion !== '2') {
        localStorage.removeItem('bbc_cart');
        localStorage.setItem('bbc_cart_pricing_version', '2');
        setCart([]);
      } else {
        const existingCart = readStorage('bbc_cart');
        const storedCart = existingCart.map(correctStoredCartItem).filter((item) => !draftedProductSlugs.has(item.slug));
        localStorage.setItem('bbc_cart', JSON.stringify(storedCart));
        setCart(storedCart);
        const removedCount = existingCart.length - storedCart.length;
        if (removedCount) setCartNotice(`${removedCount} unavailable ${removedCount === 1 ? 'item was' : 'items were'} removed from your bag.`);
      }
      setWishlist(readStorage('bbc_wishlist'));
    }, 0);
    return () => window.clearTimeout(timer);
  }, []);

  useEffect(() => {
    if (!cartNotice) return undefined;
    const timer = window.setTimeout(() => setCartNotice(''), 3500);
    return () => window.clearTimeout(timer);
  }, [cartNotice]);

  function persistCart(next) {
    setCart(next);
    localStorage.setItem('bbc_cart', JSON.stringify(next));
  }

  function persistWishlist(next) {
    setWishlist(next);
    localStorage.setItem('bbc_wishlist', JSON.stringify(next));
  }

  function addToCart(product, packSize = '', quantity = 1) {
    const addQuantity = Math.max(1, Math.min(50, Number(quantity) || 1));
    const choices = getPackChoices(product);
    const selectedPack = packSize || choices[0] || '';
    const key = `${product.id}:${selectedPack}`;
    const selectedPrice = getPackPrice(product, selectedPack);
    const selectedMrp = getPackMrp(product, selectedPack);
    const addedSavings = Math.max(0, selectedMrp - selectedPrice) * addQuantity;
    setCart((current) => {
      const existing = current.find((item) => item.key === key);
      const next = existing
        ? current.map((item) => item.key === key ? { ...item, price: selectedPrice, mrp: selectedMrp, quantity: item.quantity + addQuantity } : item)
        : [...current, {
          key,
          id: product.id,
          slug: product.slug,
          name: product.name,
          image: product.image,
          category: product.category,
          subcategory: product.subcategory,
          type: product.type,
          shippingWeightGrams: Number(product.shipping_weight_grams || product.shippingWeightGrams || 0),
          price: selectedPrice,
          mrp: selectedMrp,
          packSize: selectedPack,
          quantity: addQuantity,
        }];
      localStorage.setItem('bbc_cart', JSON.stringify(next));
      return next;
    });
    trackEvent('add_to_cart', { currency: 'INR', value: selectedPrice * addQuantity, items: [{ item_id: String(product.id), item_name: product.name, item_variant: selectedPack || undefined, price: selectedPrice, quantity: addQuantity }] });
    setCartNotice(`${product.name}${selectedPack ? ` · ${selectedPack}` : ''}${addQuantity > 1 ? ` × ${addQuantity}` : ''} added${addedSavings ? `. You saved ₹${addedSavings}` : ''}.`);
  }

  function updateQuantity(key, quantity) {
    if (quantity <= 0) return removeFromCart(key);
    persistCart(cart.map((item) => item.key === key ? { ...item, quantity } : item));
  }

  function removeFromCart(key) {
    persistCart(cart.filter((item) => item.key !== key));
  }

  function clearCart() {
    persistCart([]);
  }

  function addOrderItems(orderItems = []) {
    const next = [...cart];
    for (const entry of orderItems) {
      const product = entry.product;
      if (!product?.id) continue;
      const choices = getPackChoices(product);
      const packSize = choices.includes(entry.packSize) ? entry.packSize : choices[0] || '';
      const key = `${product.id}:${packSize}`;
      const quantity = Math.max(1, Math.min(50, Number(entry.quantity) || 1));
      const existingIndex = next.findIndex((item) => item.key === key);
      const cartItem = {
        key, id: product.id, slug: product.slug, name: product.name,
        image: product.image || product.images?.[0], category: product.category,
        subcategory: product.subcategory, type: product.type,
        shippingWeightGrams: Number(product.shipping_weight_grams || 0),
        price: getPackPrice(product, packSize), mrp: getPackMrp(product, packSize), packSize, quantity,
      };
      if (existingIndex >= 0) next[existingIndex] = { ...cartItem, quantity: Math.min(50, next[existingIndex].quantity + quantity) };
      else next.push(cartItem);
    }
    persistCart(next);
    setCartNotice(`${orderItems.length} reordered item${orderItems.length === 1 ? '' : 's'} added to your bag.`);
  }

  function toggleWishlist(product) {
    const exists = wishlist.some((item) => item.id === product.id);
    persistWishlist(exists ? wishlist.filter((item) => item.id !== product.id) : [...wishlist, product]);
  }

  const value = {
    cart,
    wishlist,
    cartOpen,
    setCartOpen,
    addToCart,
    updateQuantity,
    removeFromCart,
    clearCart,
    addOrderItems,
    toggleWishlist,
    getCartQuantity: (id, packSize = '') => cart.find((item) => item.key === `${id}:${packSize}`)?.quantity || 0,
    isWishlisted: (id) => wishlist.some((item) => item.id === id),
    cartCount: cart.reduce((sum, item) => sum + item.quantity, 0),
    cartTotal: cart.reduce((sum, item) => sum + item.price * item.quantity, 0),
  };

  return <CommerceContext.Provider value={value}>{children}{cartNotice ? <div className={styles.notice} role="status"><CheckCircle2 aria-hidden="true" /><span>{cartNotice}</span><button onClick={() => { setCartOpen(true); setCartNotice(''); }}>View bag</button><button onClick={() => setCartNotice('')} aria-label="Dismiss"><X aria-hidden="true" /></button></div> : null}</CommerceContext.Provider>;
}

export function useCommerce() {
  const value = useContext(CommerceContext);
  if (!value) throw new Error('useCommerce must be used inside CommerceProvider');
  return value;
}
