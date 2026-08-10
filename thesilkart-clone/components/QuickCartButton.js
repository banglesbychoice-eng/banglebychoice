'use client';

import { Check, Plus, ShoppingBag } from 'lucide-react';
import { getPackChoices } from '@/lib/pricing';
import { useCommerce } from './CommerceContext';
import styles from './QuickCartButton.module.css';

export default function QuickCartButton({ product, compact = false }) {
  const { addToCart, getCartQuantity } = useCommerce();
  const firstPack = getPackChoices(product)[0] || '';
  const cartQuantity = getCartQuantity(product.id, firstPack);
  const inBag = cartQuantity > 0;
  const label = firstPack ? `Add ${firstPack}` : 'Add to cart';

  function handleAdd() {
    addToCart(product, firstPack);
  }

  return (
    <button className={`${styles.button} ${compact ? styles.compact : ''} ${inBag ? styles.added : ''}`} type="button" onClick={handleAdd} aria-label={inBag ? `${product.name}: ${cartQuantity} in bag, add one more` : `${label}: ${product.name}`}>
      {inBag ? <><Check aria-hidden="true" /> In bag · {cartQuantity} <Plus aria-hidden="true" /></> : <><ShoppingBag aria-hidden="true" /> {label}</>}
    </button>
  );
}
