'use client';

import Image from 'next/image';
import { useEffect, useMemo, useRef, useState } from 'react';
import styles from '@/app/admin/admin.module.css';

const ORDER_STATUSES = ['pending', 'confirmed', 'packed', 'shipped', 'delivered', 'cancelled'];
const PAYMENT_STATUSES = ['pending', 'paid', 'failed', 'refunded'];

function trackingUrl(orderNumber) {
  return `${window.location.origin}/account?order=${encodeURIComponent(orderNumber)}`;
}

export default function AdminOrders({ orders, onRefresh }) {
  const dialogRef = useRef(null);
  const [selectedId, setSelectedId] = useState('');
  const [busy, setBusy] = useState(false);
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const selectedOrder = useMemo(() => orders.find((order) => order.id === selectedId) || null, [orders, selectedId]);

  useEffect(() => {
    const dialog = dialogRef.current;
    if (!dialog) return;
    if (selectedOrder && !dialog.open) dialog.showModal();
    if (!selectedOrder && dialog.open) dialog.close();
  }, [selectedOrder]);

  async function updateStatus(field, value) {
    if (!selectedOrder) return;
    setBusy(true);
    setError('');
    setMessage('');
    const response = await fetch('/api/orders', {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ id: selectedOrder.id, [field]: value }),
    });
    const data = await response.json();
    if (!response.ok) setError(data.error || 'Unable to update the order.');
    else {
      setMessage('Order updated.');
      await onRefresh();
    }
    setBusy(false);
  }

  async function copyTrackingLink(order) {
    try {
      await navigator.clipboard.writeText(trackingUrl(order.order_number));
      setMessage(`Tracking link copied for ${order.order_number}.`);
      setError('');
    } catch {
      setError('Unable to copy automatically. Open the tracking link and copy it from the address bar.');
    }
  }

  return <section className={styles.workspace}>
    <div className={styles.sectionHead}><div><p className={styles.kicker}>Customer orders</p><h2>Stored orders</h2></div><button className={styles.refreshButton} onClick={onRefresh}>Refresh</button></div>
    <div className={styles.privacyNotice}><b>Customer data</b><p>Mobile numbers and delivery details are stored only for orders submitted through website checkout.</p></div>
    {message ? <div className={styles.successMessage} role="status">{message}</div> : null}
    {error ? <div className={styles.errorMessage} role="alert">{error}</div> : null}
    {orders.length ? <div className={styles.tableResponsive}><table className={styles.table}><thead><tr><th>Order</th><th>Customer</th><th>Total</th><th>Status</th><th>Payment</th><th>Date</th><th>Actions</th></tr></thead><tbody>{orders.map((order) => <tr key={order.id}><td><button className={styles.orderNumberButton} onClick={() => setSelectedId(order.id)}>{order.order_number}</button><small className={styles.tableSubtext}>{order.order_items?.length || 0} items</small></td><td>{order.customer_name}<a className={styles.tableSubtext} href={`tel:${order.customer_mobile}`}>{order.customer_mobile}</a></td><td>₹{order.total}</td><td><span className={styles.status}>{order.status}</span></td><td><span className={`${styles.status} ${order.payment_status !== 'paid' ? styles.draft : ''}`}>{order.payment_status || 'pending'}</span></td><td>{new Date(order.created_at).toLocaleDateString('en-IN')}</td><td><div className={styles.rowActions}><button onClick={() => setSelectedId(order.id)}>View details</button><button onClick={() => copyTrackingLink(order)}>Copy tracking</button></div></td></tr>)}</tbody></table></div> : <div className={styles.emptyOrders}><h3>No website orders stored</h3><p>New prepaid website orders will appear here.</p></div>}
    {selectedOrder ? <dialog ref={dialogRef} className={styles.orderModal} aria-labelledby="order-detail-title" onClose={() => setSelectedId('')} onClick={(event) => { if (event.target === event.currentTarget) setSelectedId(''); }}><article className={styles.orderDetail}>
      <header><div><p className={styles.kicker}>Order details</p><h3 id="order-detail-title">{selectedOrder.order_number}</h3></div><button className={styles.closeDetail} onClick={() => setSelectedId('')}>Close</button></header>
      <div className={styles.orderControls}>
        <label>Order status<select value={selectedOrder.status || 'pending'} disabled={busy} onChange={(event) => updateStatus('status', event.target.value)}>{ORDER_STATUSES.map((status) => <option key={status}>{status}</option>)}</select></label>
        <label>Payment status<select value={selectedOrder.payment_status || 'pending'} disabled={busy} onChange={(event) => updateStatus('paymentStatus', event.target.value)}>{PAYMENT_STATUSES.map((status) => <option key={status}>{status}</option>)}</select></label>
        <button disabled={busy} onClick={() => copyTrackingLink(selectedOrder)}>Copy tracking link</button>
        <a href={`/account?order=${encodeURIComponent(selectedOrder.order_number)}`} target="_blank" rel="noreferrer">Open tracking page</a>
      </div>
      <div className={styles.orderFacts}><div><small>Customer</small><b>{selectedOrder.customer_name}</b><span>{selectedOrder.customer_mobile}</span>{selectedOrder.customer_email ? <span>{selectedOrder.customer_email}</span> : null}</div><div><small>Delivery address</small><b>{selectedOrder.address}</b><span>{selectedOrder.city}, {selectedOrder.state} - {selectedOrder.postal_code}</span></div><div><small>Order value</small><span>Subtotal ₹{selectedOrder.subtotal}</span><span>Delivery {Number(selectedOrder.shipping) ? `₹${selectedOrder.shipping}` : 'Free'}</span><b>Total ₹{selectedOrder.total}</b></div><div><small>Placed</small><b>{new Date(selectedOrder.created_at).toLocaleString('en-IN')}</b>{selectedOrder.notes ? <span>{selectedOrder.notes}</span> : null}</div></div>
      <div className={styles.orderLineItems}>{(selectedOrder.order_items || []).map((item) => <div key={item.id || `${item.product_id}-${item.pack_size}`}>
        {item.image_url ? <Image src={item.image_url} alt={item.product_name} width={64} height={72} /> : null}
        <span><b>{item.product_name}</b><small>{item.pack_size || 'Standard'} · Qty {item.quantity} · ₹{item.unit_price} each</small></span><strong>₹{item.line_total}</strong>
      </div>)}</div>
    </article></dialog> : null}
  </section>;
}
