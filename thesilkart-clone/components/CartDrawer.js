'use client';

import Image from 'next/image';
import Link from 'next/link';
import { Minus, Plus, ShoppingBag, Trash2, X } from 'lucide-react';
import { useCommerce } from './CommerceContext';
import styles from './CartDrawer.module.css';
import { FREE_SHIPPING_MIN, MINIMUM_SHIPPING_FEE, SHIPPING_RATE_PER_KG, formatSavingsAmount, getShippingQuote } from '@/lib/pricing';

function cartSavings(cart) {
  return cart.reduce((sum, item) => sum + Math.max(0, Number(item.mrp || item.price) - Number(item.price)) * item.quantity, 0);
}

export default function CartDrawer() {
  const { cart, cartOpen, setCartOpen, cartTotal, updateQuantity, removeFromCart } = useCommerce();
  const shippingQuote = getShippingQuote(cart, cartTotal);
  const freeShippingRemaining = shippingQuote.remainingForFreeShipping;
  const freeShippingProgress = Math.min(100, Math.round((cartTotal / FREE_SHIPPING_MIN) * 100));
  const savings = cartSavings(cart);
  const freeShippingUnlocked = shippingQuote.thresholdReached;
  const shippingCopy = freeShippingRemaining
    ? shippingQuote.hasBangleBoxes
      ? `Add ₹${freeShippingRemaining} more for free shipping on eligible non-box items.`
      : `Add ₹${freeShippingRemaining} more for free shipping.`
    : shippingQuote.hasBangleBoxes
      ? 'Free shipping applied to eligible items. Bangle boxes are charged by weight.'
      : 'Free shipping unlocked.';

  return <>
    <button className={`${styles.backdrop} ${cartOpen ? styles.visible : ''}`} onClick={() => setCartOpen(false)} aria-label="Close cart" />
    <aside className={`${styles.drawer} ${cartOpen ? styles.open : ''}`} aria-hidden={!cartOpen}>
      <header><div><p>Your bag</p><h2>{cart.length ? `${cart.length} selected items` : 'Your bag is empty'}</h2></div><button onClick={() => setCartOpen(false)} aria-label="Close cart"><X aria-hidden="true" /></button></header>
      <div className={styles.items}>
        {cart.map((item) => { const itemSavings = Math.max(0, Number(item.mrp || item.price) - Number(item.price)) * item.quantity; return <article key={item.key}><Link href={`/products/${item.slug}`} onClick={() => setCartOpen(false)}><Image src={item.image} alt={item.name} width={92} height={104} /></Link><div><Link href={`/products/${item.slug}`} onClick={() => setCartOpen(false)}><h3>{item.name}</h3></Link>{item.packSize && <p>{item.packSize}</p>}<strong>₹{item.price * item.quantity}</strong>{itemSavings ? <small className={styles.itemSaving}>Save ₹{formatSavingsAmount(itemSavings)} on this line</small> : null}<div className={styles.quantity}><button aria-label="Decrease quantity" onClick={() => updateQuantity(item.key, item.quantity - 1)}><Minus aria-hidden="true" /></button><span>{item.quantity}</span><button aria-label="Increase quantity" onClick={() => updateQuantity(item.key, item.quantity + 1)}><Plus aria-hidden="true" /></button><button aria-label={`Remove ${item.name}`} onClick={() => removeFromCart(item.key)}><Trash2 aria-hidden="true" /><span>Remove</span></button></div></div></article>; })}
        {!cart.length && <div className={styles.empty}><span>◇</span><p>Add something beautiful to begin.</p><Link href="/#catalog" onClick={() => setCartOpen(false)}>Browse products</Link></div>}
      </div>
      {cart.length > 0 && <footer><div><span>Subtotal</span><strong>₹{cartTotal}</strong></div>{savings ? <div className={styles.savingsLine}><span>Product savings</span><strong>₹{formatSavingsAmount(savings)}</strong></div> : null}<div><span>{shippingQuote.deliveryDiscount ? 'Calculated delivery' : 'Estimated delivery'}</span><strong>₹{shippingQuote.regularFee}</strong></div>{shippingQuote.deliveryDiscount ? <div className={styles.savingsLine}><span>Free-shipping deduction</span><strong>−₹{formatSavingsAmount(shippingQuote.deliveryDiscount)}</strong></div> : null}{shippingQuote.deliveryDiscount ? <div><span>Delivery payable</span><strong>{shippingQuote.fee ? `₹${shippingQuote.fee}` : 'Free'}</strong></div> : null}<div className={`${styles.shippingProgress} ${freeShippingUnlocked ? styles.shippingUnlocked : ''}`} aria-label={`${freeShippingProgress}% toward free shipping`}><span style={{ width: `${freeShippingProgress}%` }} /></div><p className={freeShippingUnlocked ? styles.unlockedCopy : ''}>{shippingCopy}</p><small>Delivery starts at ₹{MINIMUM_SHIPPING_FEE} and is calculated at ₹{SHIPPING_RATE_PER_KG}/kg. Bangle boxes are excluded from free shipping.</small><Link href="/checkout" onClick={() => setCartOpen(false)}><ShoppingBag aria-hidden="true" /> Review &amp; pay</Link></footer>}
    </aside>
  </>;
}
