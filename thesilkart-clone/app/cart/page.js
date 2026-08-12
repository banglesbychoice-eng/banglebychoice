'use client';

import Image from 'next/image';
import Link from 'next/link';
import { Minus, Plus, ShoppingBag, Trash2 } from 'lucide-react';
import { useCommerce } from '@/components/CommerceContext';
import { FREE_SHIPPING_MIN, MINIMUM_SHIPPING_FEE, SHIPPING_RATE_PER_KG, formatSavingsAmount, getShippingQuote } from '@/lib/pricing';
import styles from './cart.module.css';

function cartSavings(cart) {
  return cart.reduce((sum, item) => sum + Math.max(0, Number(item.mrp || item.price) - Number(item.price)) * item.quantity, 0);
}

export default function CartPage() {
  const { cart, cartTotal, updateQuantity, removeFromCart } = useCommerce();
  const shippingQuote = getShippingQuote(cart, cartTotal);
  const shipping = shippingQuote.fee;
  const total = cartTotal + shipping;
  const savings = cartSavings(cart);
  const remaining = shippingQuote.remainingForFreeShipping;
  const shippingCopy = remaining
    ? shippingQuote.hasBangleBoxes
      ? `Add ₹${remaining} more to unlock free shipping on eligible non-box items.`
      : `Add ₹${remaining} more to unlock free shipping.`
    : shippingQuote.hasBangleBoxes
      ? 'Eligible items ship free. Bangle boxes remain charged by weight.'
      : 'Free shipping unlocked.';

  return <main className={styles.page}>
    <nav><Link href="/">Home</Link><span>/</span><b>Cart</b></nav>
    <header><p>Your bag</p><h1>{cart.length ? `${cart.length} selected item${cart.length === 1 ? '' : 's'}` : 'Your cart is empty'}</h1><div>Review quantities before paying securely by UPI or card.</div></header>
    {!cart.length ? <section className={styles.empty}><span>◇</span><h2>No products added yet</h2><p>Browse kundans, silk thread materials and jewellery-making supplies.</p><Link href="/#catalog">Browse products</Link></section> : <section className={styles.layout}>
      <div className={styles.items}>
        {cart.map((item) => {
          const lineSavings = Math.max(0, Number(item.mrp || item.price) - Number(item.price)) * item.quantity;
          return <article key={item.key}>
            <Link href={`/products/${item.slug}`}><Image src={item.image} alt={item.name} width={112} height={126} /></Link>
            <div>
              <Link href={`/products/${item.slug}`}><h2>{item.name}</h2></Link>
              {item.packSize ? <p>{item.packSize}</p> : null}
              <strong>₹{item.price * item.quantity}</strong>
              {lineSavings ? <small>Save ₹{formatSavingsAmount(lineSavings)} on this line</small> : null}
              <div className={styles.quantity}>
                <button aria-label={`Decrease ${item.name}`} onClick={() => updateQuantity(item.key, item.quantity - 1)}><Minus aria-hidden="true" /></button>
                <span>{item.quantity}</span>
                <button aria-label={`Increase ${item.name}`} onClick={() => updateQuantity(item.key, item.quantity + 1)}><Plus aria-hidden="true" /></button>
                <button aria-label={`Remove ${item.name}`} onClick={() => removeFromCart(item.key)}><Trash2 aria-hidden="true" /> Remove</button>
              </div>
            </div>
          </article>;
        })}
      </div>
      <aside className={styles.summary}>
        <h2>Order summary</h2>
        <p><span>Subtotal</span><b>₹{cartTotal}</b></p>
        {savings ? <p className={styles.savings}><span>Product savings</span><b>₹{formatSavingsAmount(savings)}</b></p> : null}
        <p><span>{shippingQuote.deliveryDiscount ? 'Calculated shipping' : 'Shipping'}</span><b>₹{shippingQuote.regularFee}</b></p>
        {shippingQuote.deliveryDiscount ? <p className={styles.savings}><span>Free-shipping deduction</span><b>−₹{formatSavingsAmount(shippingQuote.deliveryDiscount)}</b></p> : null}
        {shippingQuote.deliveryDiscount ? <p><span>Shipping payable</span><b>{shipping ? `₹${shipping}` : 'Free'}</b></p> : null}
        <small>{shippingCopy} Delivery starts at ₹{MINIMUM_SHIPPING_FEE} and is calculated at ₹{SHIPPING_RATE_PER_KG}/kg. Free shipping from ₹{FREE_SHIPPING_MIN} excludes bangle boxes.</small>
        <div><span>Total</span><strong>₹{total}</strong></div>
        <Link href="/checkout"><ShoppingBag aria-hidden="true" /> Continue to checkout</Link>
      </aside>
    </section>}
  </main>;
}
