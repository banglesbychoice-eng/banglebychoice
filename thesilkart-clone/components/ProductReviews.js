'use client';

import { useState } from 'react';
import styles from './ProductReviews.module.css';

export default function ProductReviews({ productSlug, productName, reviews = [] }) {
  const [form, setForm] = useState({ name: '', rating: '5', review: '', company: '' });
  const [message, setMessage] = useState('');
  const average = reviews.length ? (reviews.reduce((total, review) => total + Number(review.rating), 0) / reviews.length).toFixed(1) : '';

  async function submitReview(event) {
    event.preventDefault();
    setMessage('Submitting…');
    const response = await fetch('/api/reviews', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ ...form, productSlug, productName }) });
    const data = await response.json();
    if (!response.ok) return setMessage(data.error || 'Unable to submit review.');
    setForm({ name: '', rating: '5', review: '', company: '' });
    setMessage('Thank you. Your review will appear after moderation.');
  }

  return <section className={styles.reviews} id="reviews">
    <div className={styles.head}><p>Customer reviews</p><h2>{reviews.length ? `★ ${average} from ${reviews.length} review${reviews.length === 1 ? '' : 's'}` : 'Be the first to review this product'}</h2></div>
    {reviews.length ? <div className={styles.list}>{reviews.slice(0, 6).map((review) => <article key={review.id}><b>{'★'.repeat(review.rating)}{'☆'.repeat(5 - review.rating)}</b><p>{review.review_text}</p><small>{review.author_name}</small></article>)}</div> : null}
    <form onSubmit={submitReview} className={styles.form}>
      <h3>Write a review</h3>
      <label>Name<input value={form.name} onChange={(event) => setForm((current) => ({ ...current, name: event.target.value }))} required /></label>
      <input className={styles.honeypot} tabIndex="-1" autoComplete="off" aria-hidden="true" value={form.company} onChange={(event) => setForm((current) => ({ ...current, company: event.target.value }))} />
      <label>Rating<select value={form.rating} onChange={(event) => setForm((current) => ({ ...current, rating: event.target.value }))}><option value="5">5 stars</option><option value="4">4 stars</option><option value="3">3 stars</option><option value="2">2 stars</option><option value="1">1 star</option></select></label>
      <label>Review<textarea value={form.review} onChange={(event) => setForm((current) => ({ ...current, review: event.target.value }))} minLength={10} maxLength={600} required /></label>
      <button>Submit review</button>{message ? <p>{message}</p> : null}
    </form>
  </section>;
}
