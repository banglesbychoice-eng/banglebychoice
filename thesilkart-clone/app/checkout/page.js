'use client';

import Image from 'next/image';
import Link from 'next/link';
import { useEffect, useState, useSyncExternalStore } from 'react';
import { QRCodeSVG } from 'qrcode.react';
import { useCommerce } from '@/components/CommerceContext';
import { analyticsItems, trackEvent } from '@/lib/analytics-client';
import { DEFAULT_DELIVERY_METHOD, DELIVERY_METHODS } from '@/lib/delivery';
import { buildStaticUpiQrLink, buildUpiPaymentLink, isUpiConfigured, upiPayeeAddress } from '@/lib/payments';
import { FREE_SHIPPING_MIN, MINIMUM_SHIPPING_FEE, SHIPPING_RATE_PER_KG, formatSavingsAmount, getShippingQuote } from '@/lib/pricing';
import styles from './checkout.module.css';

const WHATSAPP_NUMBER = '919553655562';
const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || 'https://www.banglebychoice.in';
const RAZORPAY_ENABLED = Boolean(process.env.NEXT_PUBLIC_RAZORPAY_KEY_ID);
const subscribeToHydration = () => () => {};

function buildWhatsAppOrderMessage(order) {
  const trackingUrl = `${SITE_URL}/account?order=${encodeURIComponent(order.orderNumber)}`;
  const itemLines = (order.items || []).map((item, index) => [
    `${index + 1}. ${item.name}`,
    `   Pack: ${item.packSize || 'Standard'} | Qty: ${item.quantity}`,
    `   Price: Rs ${item.unitPrice} each | Amount: Rs ${item.lineTotal}`,
  ].join('\n')).join('\n');
  const paymentLabel = order.paymentMethod === 'razorpay' ? 'UPI / Card' : 'Direct UPI';
  const deliveryLabel = order.deliveryLabel || DELIVERY_METHODS[order.deliveryMethod]?.label || DELIVERY_METHODS.shipping.label;
  const deliveryLines = order.deliveryMethod === 'shipping' || !order.deliveryMethod
    ? [
      `Calculated delivery charge: Rs ${order.deliveryCharge ?? order.shipping}`,
      ...(Number(order.deliveryDiscount) ? [`Free-shipping deduction: Rs ${formatSavingsAmount(order.deliveryDiscount)}`] : []),
      `Delivery payable: ${Number(order.shipping) ? `Rs ${order.shipping}` : 'Free'}`,
    ]
    : [
      `Delivery method: ${deliveryLabel}`,
      order.deliveryMethod === 'customer_arranged'
        ? 'Website delivery charge: Rs 0 (pickup service is arranged and paid by the customer)'
        : 'Delivery payable: Rs 0',
    ];
  return [
    'Hello Bangle by Choice 👋',
    `Please confirm my order ${order.orderNumber}:`,
    '',
    itemLines,
    '',
    `Subtotal: Rs ${order.subtotal}`,
    ...deliveryLines,
    `Total amount payable: Rs ${order.total}`,
    `Payment method: ${paymentLabel}`,
    `Track order: ${trackingUrl}`,
    '',
    'Payment is completed / in progress. Please confirm receipt. I can share the UTR or payment screenshot if required.',
  ].join('\n');
}

function cartSavings(cart) {
  return cart.reduce((sum, item) => sum + Math.max(0, Number(item.mrp || item.price) - Number(item.price)) * item.quantity, 0);
}

function loadRazorpay() {
  if (window.Razorpay) return Promise.resolve(true);
  return new Promise((resolve) => {
    const script = document.createElement('script');
    script.src = 'https://checkout.razorpay.com/v1/checkout.js';
    script.onload = () => resolve(true);
    script.onerror = () => resolve(false);
    document.body.appendChild(script);
  });
}

export default function CheckoutPage() {
  const { cart, cartTotal, clearCart } = useCommerce();
  const hydrated = useSyncExternalStore(subscribeToHydration, () => true, () => false);
  const [customer, setCustomer] = useState({ name: '', mobile: '', email: '', address: '', city: '', state: '', postalCode: '', notes: '' });
  const [deliveryMethod, setDeliveryMethod] = useState(DEFAULT_DELIVERY_METHOD);
  const [paymentMethod, setPaymentMethod] = useState(RAZORPAY_ENABLED ? 'razorpay' : isUpiConfigured() ? 'upi' : '');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');
  const [placed, setPlaced] = useState(null);
  const [copyStatus, setCopyStatus] = useState('');
  const shippingQuote = getShippingQuote(cart, cartTotal);
  const requiresAddress = DELIVERY_METHODS[deliveryMethod].requiresAddress;
  const shipping = requiresAddress ? shippingQuote.fee : 0;
  const savings = cartSavings(cart);
  const totalSavings = savings + (requiresAddress ? shippingQuote.freeShippingSavings : 0);
  const orderTotal = cartTotal + shipping;

  useEffect(() => {
    if (!cart.length || !hydrated) return;
    trackEvent('begin_checkout', { currency: 'INR', value: orderTotal, items: analyticsItems(cart) });
  }, [cart, hydrated, orderTotal]);

  function updateCustomer(event) {
    const { name, value } = event.target;
    setCustomer((current) => ({ ...current, [name]: value }));
  }

  async function openRazorpay(order) {
    const loaded = await loadRazorpay();
    if (!loaded) return setError('Secure payment window could not load. Please try Direct UPI.');
    const checkout = new window.Razorpay({
      key: order.razorpay.key,
      order_id: order.razorpay.orderId,
      amount: Math.round(order.total * 100),
      currency: 'INR',
      name: 'Bangle by Choice',
      description: order.orderNumber,
      prefill: { name: customer.name, contact: customer.mobile, email: customer.email },
      theme: { color: '#6e1734' },
      handler: async (payment) => {
        const response = await fetch('/api/payments/razorpay/verify', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ localOrderId: order.orderId, ...payment }) });
        const result = await response.json();
        if (!response.ok) return setError(result.error || 'Payment could not be verified.');
        setPlaced((current) => ({ ...current, paid: result.paid, paymentStatus: result.status }));
        if (result.paid) {
          trackEvent('purchase', {
            currency: 'INR',
            value: order.total,
            shipping: order.shipping,
            transaction_id: order.orderNumber,
            items: analyticsItems(cart),
          });
        }
        clearCart();
      },
    });
    checkout.on('payment.failed', () => setError('Payment failed. Your order is saved; you can retry or choose support.'));
    checkout.open();
  }

  async function submitOrder(event) {
    event.preventDefault();
    if (!paymentMethod) {
      setError('Online payment is temporarily unavailable. Please contact WhatsApp support.');
      return;
    }
    setBusy(true);
    setError('');
    try {
      const response = await fetch('/api/orders', {
        method: 'POST', headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ customer, deliveryMethod, paymentMethod, items: cart.map(({ id, packSize, quantity }) => ({ id, packSize, quantity })) }),
      });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'Unable to place the order.');
      setPlaced({ ...data, paymentMethod });
      trackEvent('purchase_intent', { currency: 'INR', value: data.total, transaction_id: data.orderNumber, items: analyticsItems(cart) });
      if (paymentMethod === 'razorpay') await openRazorpay(data);
      else clearCart();
    } catch (orderError) {
      setError(orderError.message);
    } finally {
      setBusy(false);
    }
  }

  async function copyUpiDetails(amount) {
    try {
      await navigator.clipboard.writeText(`UPI ID: ${upiPayeeAddress}\nAmount: Rs ${amount}`);
      setCopyStatus('UPI ID and amount copied.');
    } catch {
      setCopyStatus(`Copy manually: ${upiPayeeAddress} · Rs ${amount}`);
    }
  }

  if (placed) {
    const upiUrl = placed.paymentMethod === 'upi' ? buildUpiPaymentLink({ amount: placed.total, note: `Bangle by Choice ${placed.orderNumber}`, transactionReference: placed.orderNumber }) : '';
    const staticUpiQrUrl = placed.paymentMethod === 'upi' ? buildStaticUpiQrLink() : '';
    const trackingUrl = `/account?order=${encodeURIComponent(placed.orderNumber)}`;
    const message = buildWhatsAppOrderMessage(placed);
    const whatsappUrl = `https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(message)}`;
    return <main className={styles.confirmation}>
      <p className={styles.eyebrow}>Order received</p><h1><Link href={trackingUrl}>{placed.orderNumber}</Link></h1>
      <p>{placed.paid ? 'Your payment is verified and the order is confirmed.' : 'Your order is saved. Complete payment to move it into processing.'}</p>
      <strong className={styles.confirmationTotal}>₹{placed.total}</strong>
      {upiUrl && staticUpiQrUrl ? <div className={styles.paymentPanel}><div className={styles.qrFrame}><QRCodeSVG value={staticUpiQrUrl} size={208} level="M" marginSize={2} title="Bangle by Choice static UPI QR" /><small>Scan with any UPI app</small></div><div className={styles.paymentCopy}><span>Static UPI QR</span><strong className={styles.exactAmount}>Pay exactly ₹{placed.total}</strong><small>Enter ₹{placed.total} manually after scanning this QR.</small><small>Reference: {placed.orderNumber}</small><small>UPI ID: {upiPayeeAddress}</small><small>Confirm the recipient name before entering your UPI PIN.</small><a className={styles.upiButton} href={upiUrl} onClick={() => trackEvent('upi_payment_click', { currency: 'INR', value: placed.total, transaction_id: placed.orderNumber })}>On mobile, open UPI app · ₹{placed.total}</a><button type="button" className={styles.copyUpiButton} onClick={() => copyUpiDetails(placed.total)}>Copy UPI ID &amp; exact amount</button>{copyStatus ? <small role="status">{copyStatus}</small> : null}</div></div> : null}
      {placed.paymentMethod === 'razorpay' && !placed.paid ? <button className={styles.primaryButton} onClick={() => openRazorpay(placed)}>Retry secure payment</button> : null}
      <div className={styles.confirmationActions}><Link href={trackingUrl}>Track this order</Link><a href={whatsappUrl} target="_blank" rel="nofollow external noreferrer">Paid? Send payment confirmation</a></div>
    </main>;
  }

  if (!cart.length) return <main className={styles.empty}><h1>Your bag is empty</h1><p>Add products before starting checkout.</p><Link href="/#catalog">Browse products</Link></main>;

  return <main className={styles.page}>
    <section className={styles.checkout}>
      <p className={styles.eyebrow}>Secure checkout</p><h1>Delivery and payment</h1>
      <p className={styles.intro}>Choose delivery, pickup or your own pickup service, then complete payment and receive an order number immediately.</p>
      <form className={styles.form} onSubmit={submitOrder}>
        <fieldset className={styles.deliveryChoices}><legend>How would you like to receive the order?</legend>
          {Object.entries(DELIVERY_METHODS).map(([value, option]) => <label key={value}><input type="radio" name="deliveryMethod" checked={deliveryMethod === value} onChange={() => setDeliveryMethod(value)} /><span><b>{option.label}</b><small>{option.description}</small></span></label>)}
        </fieldset>
        <div className={styles.formGrid}>
          <label>Full name<input required autoComplete="name" name="name" value={customer.name} onChange={updateCustomer} /></label>
          <label>Mobile number<input required inputMode="numeric" pattern="[0-9]{10}" maxLength="10" autoComplete="tel" name="mobile" value={customer.mobile} onChange={updateCustomer} /></label>
          <label>Email (optional)<input type="email" autoComplete="email" name="email" value={customer.email} onChange={updateCustomer} /></label>
          {requiresAddress ? <><label>PIN code<input required inputMode="numeric" pattern="[0-9]{6}" maxLength="6" autoComplete="postal-code" name="postalCode" value={customer.postalCode} onChange={updateCustomer} /></label>
          <label className={styles.fullField}>Delivery address<textarea required autoComplete="street-address" name="address" value={customer.address} onChange={updateCustomer} rows="3" /></label>
          <label>City<input required autoComplete="address-level2" name="city" value={customer.city} onChange={updateCustomer} /></label>
          <label>State<input required autoComplete="address-level1" name="state" value={customer.state} onChange={updateCustomer} /></label></> : <p className={`${styles.fullField} ${styles.pickupNotice}`}>{deliveryMethod === 'pickup' ? 'We will confirm when the order is packed and ready for collection.' : 'Arrange the pickup only after we confirm the order is ready. Pay the pickup provider directly.'}</p>}
          <label className={styles.fullField}>Order note (optional)<input name="notes" value={customer.notes} onChange={updateCustomer} placeholder="Colour or delivery note" /></label>
        </div>
        <fieldset className={styles.paymentChoices}><legend>Payment method</legend>
          {RAZORPAY_ENABLED ? <label><input type="radio" name="payment" checked={paymentMethod === 'razorpay'} onChange={() => setPaymentMethod('razorpay')} /><span><b>UPI or card</b><small>Secure Razorpay checkout</small></span></label> : null}
          {isUpiConfigured() ? <label><input type="radio" name="payment" checked={paymentMethod === 'upi'} onChange={() => setPaymentMethod('upi')} /><span><b>UPI QR or app</b><small>Dynamic QR on desktop and UPI intent on mobile</small></span></label> : null}
        </fieldset>
        <div className={styles.trustBadges}><span>No cash on delivery</span><span>Order saved before payment</span><span>Dispatch within 24 hours</span></div>
        {!paymentMethod ? <p className={styles.error} role="alert">Online payment is temporarily unavailable. Please contact WhatsApp support.</p> : null}
        {error ? <p className={styles.error} role="alert">{error}</p> : null}
        <button className={styles.primaryButton} disabled={busy || !paymentMethod} type="submit">{busy ? 'Placing order…' : `Place order · ₹${orderTotal}`}</button>
        <p className={styles.note}>By placing the order, you agree to our <Link href="/help/terms">terms</Link> and <Link href="/help/privacy">privacy policy</Link>.</p>
      </form>
    </section>
    <aside className={styles.summary}>
      <p>Order summary</p><h2>{cart.length} {cart.length === 1 ? 'item' : 'items'}</h2>
      <div className={styles.items}>{cart.map((item) => <article key={item.key}><Image src={item.image} alt={item.name} width={72} height={82} /><div><h3>{item.name}</h3><p>{item.packSize || 'Standard'} · Qty {item.quantity}</p><strong>₹{item.price * item.quantity}</strong></div></article>)}</div>
      <dl><div><dt>Subtotal</dt><dd>₹{cartTotal}</dd></div>{savings ? <div><dt>Product savings</dt><dd>₹{formatSavingsAmount(savings)}</dd></div> : null}{requiresAddress ? <><div><dt>{shippingQuote.deliveryDiscount ? 'Calculated delivery' : 'Delivery'}</dt><dd>₹{shippingQuote.regularFee}</dd></div>{shippingQuote.deliveryDiscount ? <div className={styles.discountLine}><dt>Free-shipping deduction</dt><dd>−₹{formatSavingsAmount(shippingQuote.deliveryDiscount)}</dd></div> : null}{shippingQuote.deliveryDiscount ? <div><dt>Delivery payable</dt><dd>{shipping ? `₹${shipping}` : 'Free'}</dd></div> : null}</> : <div><dt>{DELIVERY_METHODS[deliveryMethod].label}</dt><dd>₹0</dd></div>}{totalSavings ? <div className={styles.discountLine}><dt>Total saved today</dt><dd>₹{formatSavingsAmount(totalSavings)}</dd></div> : null}<div><dt>Total</dt><dd>₹{orderTotal}</dd></div></dl>
      {requiresAddress && shippingQuote.remainingForFreeShipping > 0 ? <Link className={styles.freeShippingUpsell} href="/#catalog">Add ₹{shippingQuote.remainingForFreeShipping} more to unlock free shipping on eligible products</Link> : null}
      <p className={styles.shippingNote}>{requiresAddress ? `Delivery is minimum ₹${MINIMUM_SHIPPING_FEE}, calculated at ₹${SHIPPING_RATE_PER_KG}/kg. Orders from ₹${FREE_SHIPPING_MIN} ship free, except bangle boxes.` : deliveryMethod === 'pickup' ? 'Pickup has no delivery charge. Collect only after receiving the ready-for-pickup confirmation.' : 'No website delivery charge. You arrange and pay Rapido, Porter or your chosen pickup provider directly.'}</p>
    </aside>
  </main>;
}
