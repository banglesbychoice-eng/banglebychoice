'use client';

import { Check, Plus, ShoppingBag } from 'lucide-react';
import { getDefaultPackChoice } from '@/lib/pricing';
import { useCommerce } from './CommerceContext';
import styles from './QuickCartButton.module.css';

export default function QuickCartButton({ product, compact = false }) {
  const { addToCart, getCartQuantity } = useCommerce();
  const firstPack = getDefaultPackChoice(product);
  const cartQuantity = getCartQuantity(product.id, firstPack);
  const inBag = cartQuantity > 0;
  const label = firstPack ? `Add ${firstPack}` : 'Add to cart';
  const unavailable = product.availability === 'Out of Stock';

  function handleAdd() {
    if (!unavailable) addToCart(product, firstPack);
  }

  return (
    <button className={`${styles.button} ${compact ? styles.compact : ''} ${inBag ? styles.added : ''}`} type="button" onClick={handleAdd} disabled={unavailable} aria-label={unavailable ? `${product.name} is unavailable` : inBag ? `${product.name}: ${cartQuantity} in bag, add one more` : `${label}: ${product.name}`}>
      {unavailable ? 'Unavailable' : inBag ? <><Check aria-hidden="true" /> In bag · {cartQuantity} <Plus aria-hidden="true" /></> : <><ShoppingBag aria-hidden="true" /> {label}</>}
    </button>
  );
}
