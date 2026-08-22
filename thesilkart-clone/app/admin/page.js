'use client';

import { Fragment, useCallback, useEffect, useMemo, useState } from 'react';
import Image from 'next/image';
import styles from './admin.module.css';
import { productGroupLabel } from '@/lib/product-grouping';
import AdminOrders from '@/components/AdminOrders';

const baseCategories = ['Silk Thread Materials', 'kundan stones', 'Jewellery Making', 'Ready To Dispatch'];

function parseDetails(value) {
  if (!value?.startsWith('{')) return { description: value?.startsWith('DescriptionShipping') ? '' : value || '', sku: '', stock_quantity: '', shipping_weight_grams: '', status: 'active', featured: false };
  try {
    const parsed = JSON.parse(value);
    return parsed?._bbc === 1 ? parsed : { description: value, sku: '', stock_quantity: '', status: 'active', featured: false };
  } catch {
    return { description: value, sku: '', stock_quantity: '', status: 'active', featured: false };
  }
}

function parseImages(value) {
  if (!value) return [];
  if (value.startsWith('[')) {
    try { return JSON.parse(value).filter(Boolean); } catch {}
  }
  return [value];
}

function productStatus(product) {
  return parseDetails(product.desc_text).status === 'draft' ? 'draft' : 'active';
}

function packsToText(sizes) {
  if (!Array.isArray(sizes) || !sizes.every((item) => item && typeof item === 'object')) return '';
  return sizes.map((pack) => [pack.label, pack.price, pack.mrp || '', pack.available === false ? 'unavailable' : 'available'].join(' | ')).join('\n');
}

function textToPacks(value) {
  return value.split('\n').map((line) => {
    const [label, price, mrp, availability = 'available'] = line.split('|').map((part) => part.trim());
    const unavailable = /^(?:unavailable|out[ -]?of[ -]?stock|false|no|0)$/i.test(availability);
    return { label, price: Number(price), ...(mrp ? { mrp: Number(mrp) } : {}), available: !unavailable };
  }).filter((pack) => pack.label && Number.isFinite(pack.price));
}

function packAvailabilitySummary(sizes) {
  if (!Array.isArray(sizes) || !sizes.every((item) => item && typeof item === 'object') || !sizes.length) return '';
  return `${sizes.filter((pack) => pack.available !== false).length}/${sizes.length} options available`;
}

const emptyForm = {
  name: '', price: '', mrp: '', cat: 'Silk Thread Materials', tag: '', description: '', sku: '', stockQuantity: '', status: 'active', featured: false,
  images: [], packsText: '', shippingWeightGrams: '', metaTitle: '', metaDescription: '', altText: '',
};

const listingGuidelines = [
  'Use uploaded images as the exact product reference: preserve visible shape, colour, finish, setting, backside and arrangement.',
  'If product size is not explicitly known from the uploaded image, identify the product visually but do not invent an exact measurement unless confidently inferable.',
  'Focus on micro-details such as edge smoothness, gold rim thickness, prong placement, faceting, surface gloss, backside coating texture and realistic stone reflections.',
  'Use exact sizes only when the image, product packet, supplier detail or existing pack data clearly confirms the measurement.',
];

export default function AdminPage() {
  const [isAuthorized, setIsAuthorized] = useState(false);
  const [pin, setPin] = useState('');
  const [products, setProducts] = useState([]);
  const [orders, setOrders] = useState([]);
  const [reviews, setReviews] = useState([]);
  const [activeTab, setActiveTab] = useState('list');
  const [form, setForm] = useState(emptyForm);
  const [editId, setEditId] = useState(null);
  const [query, setQuery] = useState('');
  const [groupBy, setGroupBy] = useState('design');
  const [productStatusTab, setProductStatusTab] = useState('active');
  const [loading, setLoading] = useState(false);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const visibleProducts = useMemo(() => {
    const normalized = query.trim().toLowerCase();
    return products.filter((product) => {
      if (productStatus(product) !== productStatusTab) return false;
      if (!normalized) return true;
      const details = parseDetails(product.desc_text);
      const groupLabel = productGroupLabel({ name: product.name, category: product.cat, subcategory: product.tag });
      return [product.name, product.cat, product.tag, product.slug, details.sku, groupLabel].join(' ').toLowerCase().includes(normalized);
    });
  }, [products, productStatusTab, query]);

  const productStatusCounts = useMemo(() => products.reduce((counts, product) => {
    counts[productStatus(product)] += 1;
    return counts;
  }, { active: 0, draft: 0 }), [products]);

  const categoryOptions = useMemo(() => [...new Set([...baseCategories, ...products.map((product) => product.cat).filter(Boolean), form.cat].filter(Boolean))].sort((left, right) => left.localeCompare(right)), [form.cat, products]);

  const productGroups = useMemo(() => {
    if (groupBy === 'none') return [['All products', visibleProducts]];
    const groups = new Map();
    visibleProducts.forEach((product) => {
      const label = groupBy === 'category' ? product.cat?.trim() || 'Uncategorized' : groupBy === 'subtype' ? product.tag?.trim() || 'Other products' : productGroupLabel({ name: product.name, category: product.cat, subcategory: product.tag });
      if (!groups.has(label)) groups.set(label, []);
      groups.get(label).push(product);
    });
    return [...groups.entries()].sort(([left], [right]) => left.localeCompare(right)).map(([label, items]) => [label, items.sort((left, right) => left.name.localeCompare(right.name))]);
  }, [groupBy, visibleProducts]);

  function updateField(field, value) {
    setForm((current) => ({ ...current, [field]: value }));
  }

  const fetchProducts = useCallback(async () => {
    const response = await fetch('/api/products');
    const data = await response.json();
    if (!response.ok) throw new Error(data.error || 'Unable to load products.');
    setProducts(data);
  }, []);

  const fetchOrders = useCallback(async () => {
    const response = await fetch('/api/orders');
    const data = await response.json();
    if (!response.ok) throw new Error(data.error || 'Unable to load orders.');
    setOrders(data);
  }, []);

  const fetchReviews = useCallback(async () => {
    const response = await fetch('/api/admin/reviews');
    const data = await response.json();
    if (!response.ok) throw new Error(data.error || 'Unable to load reviews.');
    setReviews(data);
  }, []);

  const loadAdminData = useCallback(async () => {
    setLoading(true);
    setError('');
    try { await Promise.all([fetchProducts(), fetchOrders(), fetchReviews()]); } catch (loadError) { setError(loadError.message); } finally { setLoading(false); }
  }, [fetchOrders, fetchProducts, fetchReviews]);

  useEffect(() => {
    fetch('/api/admin/session').then((response) => response.json()).then((data) => {
      if (data.authenticated) { setIsAuthorized(true); loadAdminData(); }
    }).catch(() => setError('Unable to verify admin session.'));
  }, [loadAdminData]);

  async function handleLogin(event) {
    event.preventDefault();
    setLoading(true);
    const response = await fetch('/api/admin/login', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ pin }) });
    const data = await response.json();
    if (response.ok) { setIsAuthorized(true); setError(''); await loadAdminData(); } else { setError(data.error || 'Invalid admin PIN.'); setLoading(false); }
  }

  async function handleLogout() {
    await fetch('/api/admin/logout', { method: 'POST' });
    setIsAuthorized(false);
    setProducts([]);
    setOrders([]);
    setReviews([]);
  }

  async function updateReview(id, status) {
    const response = await fetch('/api/admin/reviews', { method: 'PATCH', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ id, status }) });
    if (response.ok) { setSuccess('Review updated.'); await fetchReviews(); } else { const data = await response.json(); setError(data.error || 'Unable to update review.'); }
  }

  async function deleteReview(id) {
    if (!confirm('Delete this review permanently?')) return;
    const response = await fetch(`/api/admin/reviews?id=${encodeURIComponent(id)}`, { method: 'DELETE' });
    if (response.ok) { setSuccess('Review deleted.'); await fetchReviews(); } else { const data = await response.json(); setError(data.error || 'Unable to delete review.'); }
  }

  function resetForm() {
    setEditId(null);
    setForm(emptyForm);
  }

  function openProduct(product, duplicate = false) {
    const details = parseDetails(product.desc_text);
    setEditId(duplicate ? null : product.id);
    setForm({
      name: duplicate ? `${product.name} copy` : product.name || '',
      price: product.price ?? '', mrp: product.mrp ?? '', cat: product.cat || baseCategories[0], tag: product.tag || '',
      description: details.description || '', sku: duplicate ? '' : details.sku || '', stockQuantity: details.stock_quantity ?? '', status: details.status || 'active', featured: Boolean(details.featured),
      images: parseImages(product.image_url), packsText: packsToText(product.sizes), shippingWeightGrams: details.shipping_weight_grams ?? '', metaTitle: product.meta_title || '', metaDescription: product.meta_description || '', altText: product.alt_text || '',
    });
    setActiveTab('form');
    setSuccess(duplicate ? 'Product duplicated. Review and save the new copy.' : '');
  }

  async function uploadImage(file) {
    const body = new FormData();
    body.append('file', file);
    const response = await fetch('/api/admin/upload', { method: 'POST', body });
    const data = await response.json();
    if (!response.ok) throw new Error(data.error || `Unable to upload ${file.name}.`);
    return data.url;
  }

  async function handleUpload(event) {
    const files = [...(event.target.files || [])];
    if (!files.length) return;
    setUploading(true);
    setError('');
    try {
      const urls = await Promise.all(files.map(uploadImage));
      setForm((current) => ({ ...current, images: [...current.images, ...urls] }));
      setSuccess(`${urls.length} ${urls.length === 1 ? 'image' : 'images'} uploaded and converted to WebP. Click “Update product” to publish them.`);
    } catch (uploadError) { setError(uploadError.message); } finally { setUploading(false); event.target.value = ''; }
  }

  async function handleSubmit(event) {
    event.preventDefault();
    setLoading(true);
    setError('');
    setSuccess('');
    const nextStatusTab = form.status === 'draft' ? 'draft' : 'active';
    const details = { _bbc: 1, description: form.description, sku: form.sku, stock_quantity: form.stockQuantity === '' ? null : Number(form.stockQuantity), shipping_weight_grams: form.shippingWeightGrams === '' ? null : Number(form.shippingWeightGrams), status: form.status, featured: form.featured };
    const payload = {
      name: form.name, price: Number(form.price), mrp: form.mrp ? Number(form.mrp) : null, cat: form.cat, tag: form.tag,
      desc_text: JSON.stringify(details), image_url: form.images.length > 1 ? JSON.stringify(form.images) : form.images[0] || '', sizes: textToPacks(form.packsText),
      meta_title: form.metaTitle, meta_description: form.metaDescription, alt_text: form.altText,
    };
    try {
      const response = await fetch(editId ? `/api/products/${editId}` : '/api/products', { method: editId ? 'PUT' : 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(payload) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || 'Unable to save product.');
      setSuccess(editId ? 'Product updated.' : 'Product created.');
      resetForm();
      await fetchProducts();
      setProductStatusTab(nextStatusTab);
      setActiveTab('list');
    } catch (saveError) { setError(saveError.message); } finally { setLoading(false); }
  }

  async function handleDelete(id) {
    if (!confirm('Delete this product permanently?')) return;
    setLoading(true);
    const response = await fetch(`/api/products/${id}`, { method: 'DELETE' });
    if (response.ok) { setSuccess('Product deleted.'); await fetchProducts(); } else { const data = await response.json(); setError(data.error || 'Unable to delete product.'); }
    setLoading(false);
  }

  if (!isAuthorized) return <div className={styles.loginContainer}><form onSubmit={handleLogin} className={styles.loginCard}><p className={styles.kicker}>Store operations</p><h1 className={styles.loginTitle}>Bangle by Choice Admin</h1>{error && <div className={styles.errorMessage}>{error}</div>}<label className={styles.label}>Admin PIN<input type="password" value={pin} onChange={(event) => setPin(event.target.value)} className={styles.input} placeholder="Enter admin PIN" required /></label><button type="submit" className={styles.primaryButton} disabled={loading}>{loading ? 'Checking…' : 'Access portal'}</button></form></div>;

  return <main className={styles.adminContainer}>
    <header className={styles.adminHeader}><div><p className={styles.kicker}>Store operations</p><h1>Bangle by Choice</h1><span>{products.length} products · {orders.length} stored orders</span></div><button onClick={handleLogout} className={styles.logoutButton}>Logout</button></header>
    <nav className={styles.tabBar} aria-label="Admin sections">
      <button onClick={() => { setProductStatusTab('active'); setActiveTab('list'); resetForm(); }} className={`${styles.tabButton} ${activeTab === 'list' && productStatusTab === 'active' ? styles.activeTab : ''}`}>Active products <span>{productStatusCounts.active}</span></button>
      <button onClick={() => { setProductStatusTab('draft'); setActiveTab('list'); resetForm(); }} className={`${styles.tabButton} ${activeTab === 'list' && productStatusTab === 'draft' ? styles.activeTab : ''}`}>Draft products <span>{productStatusCounts.draft}</span></button>
      <button onClick={() => { setActiveTab('form'); resetForm(); }} className={`${styles.tabButton} ${activeTab === 'form' ? styles.activeTab : ''}`}>{editId ? 'Edit product' : 'Add product'}</button>
      <button onClick={() => setActiveTab('orders')} className={`${styles.tabButton} ${activeTab === 'orders' ? styles.activeTab : ''}`}>Orders <span>{orders.length}</span></button>
      <button onClick={() => setActiveTab('reviews')} className={`${styles.tabButton} ${activeTab === 'reviews' ? styles.activeTab : ''}`}>Reviews <span>{reviews.filter((review) => review.status === 'pending').length}</span></button>
    </nav>
    {error && <div className={styles.errorMessage}>{error}</div>}{success && <div className={styles.successMessage}>{success}</div>}

    {activeTab === 'list' && <section className={styles.workspace}><div className={styles.sectionHead}><div><p className={styles.kicker}>Catalog</p><h2>Products</h2></div><div className={styles.tableTools}><label>Group by<select value={groupBy} onChange={(event) => setGroupBy(event.target.value)}><option value="design">Design family</option><option value="subtype">Similar product type</option><option value="category">Category</option><option value="none">No grouping</option></select></label><input className={styles.searchInput} value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search name, SKU, group or category" /></div></div>{loading ? <p>Loading catalog…</p> : <div className={styles.tableResponsive}><table className={styles.table}><thead><tr><th>Product</th><th>Category</th><th>Status</th><th>Price</th><th>Stock</th><th>Actions</th></tr></thead><tbody>{productGroups.map(([group, groupProducts]) => <Fragment key={group}><tr className={styles.groupRow}><td colSpan="6"><b>{group}</b><span>{groupProducts.length} products</span></td></tr>{groupProducts.map((product) => { const details = parseDetails(product.desc_text); const images = parseImages(product.image_url); const availabilitySummary = packAvailabilitySummary(product.sizes); return <tr key={product.id}><td><div className={styles.productCell}><Image src={images[0] || '/images/generated/banglebychoice-hero.webp'} alt={product.name} width={58} height={58} className={styles.thumbnail} /><div><b>{product.name}</b><small>{details.sku || product.slug}</small></div></div></td><td>{product.cat}<small className={styles.tableSubtext}>{product.tag}</small></td><td><span className={`${styles.status} ${details.status === 'draft' ? styles.draft : ''}`}>{details.status || 'active'}</span></td><td><b>₹{product.price}</b>{product.mrp ? <small className={styles.tableSubtext}>MRP ₹{product.mrp}</small> : null}</td><td>{details.stock_quantity ?? '—'}{availabilitySummary ? <small className={styles.tableSubtext}>{availabilitySummary}</small> : null}</td><td><div className={styles.rowActions}><button onClick={() => openProduct(product)}>Edit</button><button onClick={() => openProduct(product, true)}>Duplicate</button><button className={styles.dangerAction} onClick={() => handleDelete(product.id)}>Delete</button></div></td></tr>; })}</Fragment>)}</tbody></table></div>}</section>}

    {activeTab === 'form' && <form onSubmit={handleSubmit} className={styles.productForm}><div className={styles.sectionHead}><div><p className={styles.kicker}>{editId ? 'Editing' : 'New listing'}</p><h2>{editId ? form.name : 'Add product'}</h2></div><span>Draft products stay hidden from shoppers.</span></div>
      <section className={styles.guidanceCard}><h3>Image-based listing rule</h3><ul>{listingGuidelines.map((guideline) => <li key={guideline}>{guideline}</li>)}</ul></section>
      <section className={styles.formSection}><h3>Product details</h3><div className={styles.formRow}><label className={styles.label}>Product name<input className={styles.input} value={form.name} onChange={(event) => updateField('name', event.target.value)} required /></label><label className={styles.label}>SKU<input className={styles.input} value={form.sku} onChange={(event) => updateField('sku', event.target.value)} placeholder="BBC-KUN-001" /></label></div><div className={styles.formRow}><label className={styles.label}>Category<select className={styles.select} value={form.cat} onChange={(event) => updateField('cat', event.target.value)}>{categoryOptions.map((category) => <option key={category}>{category}</option>)}</select></label><label className={styles.label}>Subtype / tag<input className={styles.input} value={form.tag} onChange={(event) => updateField('tag', event.target.value)} /></label></div><label className={styles.label}>Description<textarea className={styles.textarea} rows="5" value={form.description} onChange={(event) => updateField('description', event.target.value)} /></label></section>
      <section className={styles.formSection}><h3>Images</h3><p className={styles.fieldHint}>Upload JPG, PNG, AVIF or WebP. Files are resized and converted to WebP automatically. The first image is the primary image.</p><label className={styles.uploadButton}>{uploading ? 'Processing images…' : 'Upload product images'}<input type="file" accept="image/*" multiple onChange={handleUpload} disabled={uploading} /></label>{form.images.length ? <p className={styles.fieldHint}>{form.images.length} {form.images.length === 1 ? 'image' : 'images'} selected. Save the product to reflect them on the website.</p> : null}<div className={styles.imageGrid}>{form.images.map((image, index) => <figure key={image}><Image src={image} alt={`Product image ${index + 1}`} fill sizes="160px" /><figcaption><span>{index === 0 ? 'Primary' : `View ${index + 1}`}</span><button type="button" onClick={() => updateField('images', form.images.filter((item) => item !== image))}>Remove</button></figcaption></figure>)}</div></section>
      <section className={styles.formSection}><h3>Pricing, packs and bangle sizes</h3><div className={styles.formRow}><label className={styles.label}>Default selling price<input type="number" min="0" className={styles.input} value={form.price} onChange={(event) => updateField('price', event.target.value)} required /></label><label className={styles.label}>Default MRP<input type="number" min="0" className={styles.input} value={form.mrp} onChange={(event) => updateField('mrp', event.target.value)} /></label></div><label className={styles.label}>Pack / bangle-size pricing<textarea className={styles.textarea} rows="6" value={form.packsText} onChange={(event) => updateField('packsText', event.target.value)} placeholder={'2.2 | 120 | 150 | available\n2.4 | 120 | 150 | available\n2.6 | 120 | 150 | unavailable'} /></label><p className={styles.fieldHint}>One option per line: label | selling price | MRP | available/unavailable. New bangle bases and bangle boxes default to available sizes 2.2, 2.4, 2.6, 2.8, 2.10 and 2.12 when this field is empty. Unavailable sizes remain visible but cannot be added to the bag.</p><label className={styles.label}>Shipping weight per unit (grams)<input type="number" min="0" step="1" className={styles.input} value={form.shippingWeightGrams} onChange={(event) => updateField('shippingWeightGrams', event.target.value)} placeholder="For standard products and bangle boxes" /></label><p className={styles.fieldHint}>Used for ₹65/kg delivery calculation. A selected pack labelled in grams or kilograms takes priority.</p></section>
      <section className={styles.formSection}><h3>Availability</h3><div className={styles.formRow}><label className={styles.label}>Stock quantity<input type="number" min="0" className={styles.input} value={form.stockQuantity} onChange={(event) => updateField('stockQuantity', event.target.value)} /></label><label className={styles.label}>Store status<select className={styles.select} value={form.status} onChange={(event) => updateField('status', event.target.value)}><option value="active">Active</option><option value="draft">Draft</option></select></label></div><label className={styles.checkboxLabel}><input type="checkbox" checked={form.featured} onChange={(event) => updateField('featured', event.target.checked)} /> Feature this product in the catalog</label></section>
      <section className={styles.formSection}><h3>Search appearance</h3><div className={styles.formRow}><label className={styles.label}>Meta title<input className={styles.input} value={form.metaTitle} onChange={(event) => updateField('metaTitle', event.target.value)} placeholder="Generated from product name if empty" /></label><label className={styles.label}>Image alt text<input className={styles.input} value={form.altText} onChange={(event) => updateField('altText', event.target.value)} /></label></div><label className={styles.label}>Meta description<textarea className={styles.textarea} rows="3" maxLength="160" value={form.metaDescription} onChange={(event) => updateField('metaDescription', event.target.value)} /></label><div className={styles.seoPreview}><small>{form.metaTitle || form.name || 'Product title'} | Bangle by Choice</small><b>https://www.banglebychoice.in/products/{form.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '')}</b><p>{form.metaDescription || form.description || 'Add a concise product description for search results.'}</p></div></section>
      <div className={styles.buttonRow}><button type="submit" disabled={loading || uploading} className={styles.submitButton}>{loading ? 'Saving…' : editId ? 'Update product' : 'Create product'}</button><button type="button" onClick={() => { setActiveTab('list'); resetForm(); }} className={styles.cancelButton}>Cancel</button></div>
    </form>}

    {activeTab === 'orders' && <AdminOrders orders={orders} onRefresh={fetchOrders} />}
    {activeTab === 'reviews' && <section className={styles.workspace}><div className={styles.sectionHead}><div><p className={styles.kicker}>Social proof</p><h2>Product reviews</h2></div><button className={styles.refreshButton} onClick={fetchReviews}>Refresh</button></div>{reviews.length ? <div className={styles.tableResponsive}><table className={styles.table}><thead><tr><th>Product</th><th>Reviewer</th><th>Review</th><th>Status</th><th>Actions</th></tr></thead><tbody>{reviews.map((review) => <tr key={review.id}><td><b>{review.product_name}</b><small className={styles.tableSubtext}>{review.product_slug}</small></td><td>{review.author_name}<small className={styles.tableSubtext}>{'★'.repeat(review.rating)}</small></td><td>{review.review_text}</td><td><span className={`${styles.status} ${review.status !== 'approved' ? styles.draft : ''}`}>{review.status}</span></td><td><div className={styles.rowActions}><button onClick={() => updateReview(review.id, 'approved')}>Approve</button><button onClick={() => updateReview(review.id, 'rejected')}>Reject</button><button className={styles.dangerAction} onClick={() => deleteReview(review.id)}>Delete</button></div></td></tr>)}</tbody></table></div> : <div className={styles.emptyOrders}><h3>No reviews yet</h3><p>If this stays empty after setup, run <code>scripts/reviews-schema.sql</code> in Supabase first.</p></div>}</section>}
  </main>;
}
