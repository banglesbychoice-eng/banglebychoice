'use client';

import Image from 'next/image';
import Link from 'next/link';
import { useState } from 'react';
import { useCommerce } from '@/components/CommerceContext';
import styles from './account.module.css';

const STATUS_STEPS = ['pending', 'confirmed', 'packed', 'shipped', 'delivered'];

export default function AccountPortal({ initialOrder }) {
  const { addOrderItems } = useCommerce();
  const [orderNumber, setOrderNumber] = useState(initialOrder);
  const [mobile, setMobile] = useState('');
  const [result, setResult] = useState(null);
  const [error, setError] = useState('');
  const [busy, setBusy] = useState(false);
  const [copyStatus, setCopyStatus] = useState('');

  async function findOrder(event) {
    event.preventDefault(); setBusy(true); setError(''); setResult(null);
    try {
      const response = await fetch('/api/orders/track', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ orderNumber, mobile }) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'Order lookup failed.');
      setResult(data);
    } catch (lookupError) { setError(lookupError.message); }
    finally { setBusy(false); }
  }

  async function copyTrackingLink() {
    const url = `${window.location.origin}/account?order=${encodeURIComponent(result.order.number)}`;
    try {
      await navigator.clipboard.writeText(url);
      setCopyStatus('Tracking link copied.');
    } catch {
      setCopyStatus(url);
    }
  }

  const currentStep = result ? STATUS_STEPS.indexOf(result.order.status) : -1;
  return <div className={styles.portal}>
    <form className={styles.lookup} onSubmit={findOrder}>
      <label>Order number<input required value={orderNumber} onChange={(event) => setOrderNumber(event.target.value.toUpperCase())} placeholder="BBC-260719-AB12CD34" /></label>
      <label>Mobile number<input required inputMode="numeric" pattern="[0-9]{10}" maxLength="10" value={mobile} onChange={(event) => setMobile(event.target.value.replace(/\D/g, ''))} placeholder="10-digit number" /></label>
      <button disabled={busy}>{busy ? 'Checking…' : 'Track order'}</button>
    </form>
    {error ? <p className={styles.error} role="alert">{error}</p> : null}
    {result ? <article className={styles.orderResult}>
      <header><div><small>Order</small><h2>{result.order.number}</h2></div><span>{result.order.status}</span></header>
      {result.order.status === 'cancelled' ? <p className={styles.cancelled}>This order was cancelled.</p> : <ol className={styles.timeline}>{STATUS_STEPS.map((step, index) => <li key={step} className={index <= currentStep ? styles.done : ''}>{step}</li>)}</ol>}
      <div className={styles.orderItems}>{result.order.items.map((item, index) => <div key={`${item.slug}-${index}`}>{item.image ? <Image src={item.image} alt="" width={58} height={64} /> : null}<span><b>{item.name}</b><small>{item.packSize || 'Standard'} · Qty {item.quantity}</small></span><strong>₹{item.lineTotal}</strong></div>)}</div>
      <dl><div><dt>Payment</dt><dd>{result.order.paymentStatus}</dd></div><div><dt>Order total</dt><dd>₹{result.order.total}</dd></div><div><dt>Placed</dt><dd>{new Date(result.order.createdAt).toLocaleDateString('en-IN')}</dd></div></dl>
      <div className={styles.resultActions}>{result.reorderItems.length ? <button onClick={() => addOrderItems(result.reorderItems)}>Add available items to bag</button> : null}<button onClick={copyTrackingLink}>Copy tracking link</button><Link href="/cart">View bag</Link><a href={`https://wa.me/919553655562?text=${encodeURIComponent(`Hello Bangle by Choice, I need help with order ${result.order.number}.`)}`} target="_blank" rel="nofollow external noreferrer">Get order help</a></div>
      {copyStatus ? <small className={styles.copyStatus} role="status">{copyStatus}</small> : null}
    </article> : null}
  </div>;
}
