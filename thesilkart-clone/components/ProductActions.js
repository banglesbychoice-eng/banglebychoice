'use client';

import { useEffect, useState } from 'react';
import { Check, Heart, MessageCircle, Minus, PackageCheck, Plus, ShoppingBag } from 'lucide-react';
import { useCommerce } from './CommerceContext';
import styles from '@/app/products/[slug]/product.module.css';
import { getBestValuePack, getPackGrams, getPackMrp, getPackPrice } from '@/lib/pricing';
import { trackEvent } from '@/lib/analytics-client';

export default function ProductActions({ product, choices }) {
  const [packSize, setPackSize] = useState(choices[0] || '');
  const [quantity, setQuantity] = useState(1);
  const [pincode, setPincode] = useState('');
  const { addToCart, getCartQuantity, toggleWishlist, isWishlisted } = useCommerce();
  const selectedPrice = getPackPrice(product, packSize);
  const selectedMrp = getPackMrp(product, packSize);
  const packSavings = Math.max(0, selectedMrp - selectedPrice);
  const savingsPercent = selectedMrp > selectedPrice ? Math.round((packSavings / selectedMrp) * 100) : 0;
  const lineTotal = selectedPrice * quantity;
  const lineSavings = packSavings * quantity;
  const starterPack = choices.find((choice) => getPackGrams(choice) === 100);
  const starterPrice = starterPack ? getPackPrice(product, starterPack) : 0;
  const starterSavings = starterPack ? Math.max(0, getPackMrp(product, starterPack) - starterPrice) : 0;
  const bestValuePack = getBestValuePack(product);
  const deliveryEstimate = /^\d{6}$/.test(pincode) ? (pincode.startsWith('50') || pincode.startsWith('51') || pincode.startsWith('52') ? 'Estimated delivery: 1–3 business days after dispatch.' : 'Estimated delivery: 3–7 business days after dispatch.') : '';
  const cartQuantity = getCartQuantity(product.id, packSize);
  const inBag = cartQuantity > 0;

  useEffect(() => {
    trackEvent('view_item', { currency: 'INR', value: Number(product.sale_price), items: [{ item_id: String(product.id), item_name: product.name, item_category: product.category, price: Number(product.sale_price), quantity: 1 }] });
  }, [product]);

  function handleAdd() {
    addToCart(product, packSize, quantity);
  }

  if (product.availability === 'Out of Stock') {
    return <><div className={styles.actions}><button className={styles.cart} disabled>Currently out of stock</button><button className={styles.wishlist} aria-label={isWishlisted(product.id) ? `Remove ${product.name} from wishlist` : `Save ${product.name} to wishlist`} onClick={() => toggleWishlist(product)}><Heart aria-hidden="true" fill={isWishlisted(product.id) ? 'currentColor' : 'none'} />{isWishlisted(product.id) ? 'Saved' : 'Save'}</button></div><a className={styles.whatsapp} rel="nofollow external noopener" href={`https://wa.me/919553655562?text=${encodeURIComponent(`Hello Bangle by Choice, please notify me when ${product.name} is back in stock.`)}`}><MessageCircle aria-hidden="true" /> Notify me on WhatsApp</a></>;
  }

  return (
    <>
      {choices.length > 0 && <div className={styles.options}><p>Select pack size</p><div>{choices.map((choice) => <button type="button" className={packSize === choice ? styles.selectedOption : ''} onClick={() => setPackSize(choice)} key={choice}><b>{choice}</b><small>₹{getPackPrice(product, choice)}{choice === bestValuePack ? ' · Best value' : ''}</small></button>)}</div><p className={styles.selectedPrice}>Selected pack: <strong>₹{selectedPrice}</strong>{selectedMrp > selectedPrice ? <del>₹{selectedMrp}</del> : null}{packSavings ? <span>{savingsPercent}% off · Save ₹{packSavings} per pack</span> : null}</p></div>}
      {starterPack ? <p className={styles.starterOffer}><PackageCheck aria-hidden="true" /><span><b>100 g value pack: ₹{starterPrice}</b>{starterSavings ? ` · Save ₹${starterSavings} against MRP` : ' · Clear price before checkout'}</span></p> : null}
      <div className={styles.buyTools}>
        <label>Quantity <span className={styles.quantityStepper}><button type="button" aria-label="Decrease quantity" onClick={() => setQuantity((current) => Math.max(1, current - 1))}><Minus aria-hidden="true" /></button><b>{quantity}</b><button type="button" aria-label="Increase quantity" onClick={() => setQuantity((current) => Math.min(50, current + 1))}><Plus aria-hidden="true" /></button></span></label>
        <label>Delivery estimate <input inputMode="numeric" maxLength="6" value={pincode} onChange={(event) => setPincode(event.target.value.replace(/\D/g, '').slice(0, 6))} placeholder="Enter pincode" /></label>
      </div>
      <p className={styles.quantityNudge} key={`${packSize}-${quantity}`} role="status"><b>{quantity > 1 ? `${quantity} packs · ₹${lineTotal}` : `${packSize || 'Selected pack'} · ₹${lineTotal}`}</b>{lineSavings ? <span>You save ₹{lineSavings} on this selection.</span> : starterPack && packSize !== starterPack ? <span>Prefer to try it first? Start with {starterPack} for ₹{getPackPrice(product, starterPack)}.</span> : <span>Choose the quantity you need; the total updates instantly.</span>}</p>
      {deliveryEstimate ? <p className={styles.deliveryEstimate}>{deliveryEstimate}</p> : null}
      <div className={styles.actions}><button className={`${styles.cart} ${inBag ? styles.addedCart : ''}`} onClick={handleAdd}>{inBag ? <><Check aria-hidden="true" /> In bag · {cartQuantity} · Add ₹{lineTotal}</> : <><ShoppingBag aria-hidden="true" /> Add · ₹{lineTotal}</>}</button><button className={styles.wishlist} aria-label={isWishlisted(product.id) ? `Remove ${product.name} from wishlist` : `Save ${product.name} to wishlist`} onClick={() => toggleWishlist(product)}><Heart aria-hidden="true" fill={isWishlisted(product.id) ? 'currentColor' : 'none'} />{isWishlisted(product.id) ? 'Saved' : 'Save'}</button></div>
      <a className={styles.whatsapp} rel="nofollow external noopener" onClick={() => trackEvent('whatsapp_product_question', { item_id: String(product.id), item_name: product.name, item_variant: packSize || undefined })} href={`https://wa.me/919553655562?text=${encodeURIComponent(`Hello Bangle by Choice, I have a question about ${product.name}${packSize ? ` (${packSize})` : ''}.`)}`}><MessageCircle aria-hidden="true" /> Ask about this product on WhatsApp</a>
    </>
  );
}
