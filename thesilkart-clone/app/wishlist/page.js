'use client';

import Image from 'next/image';
import Link from 'next/link';
import { useCommerce } from '@/components/CommerceContext';
import styles from './wishlist.module.css';

export default function WishlistPage() {
  const { wishlist, toggleWishlist, addToCart } = useCommerce();
  return (
    <main className={styles.page}>
      <p>Saved pieces</p><h1>Your wishlist</h1>
      <div className={styles.deviceNote}>Wishlist items are saved on this device only. For reorder help across devices, message us on WhatsApp.</div>
      {!wishlist.length ? <div className={styles.empty}><span>♡</span><h2>Nothing saved yet</h2><p>Tap the heart on any product to keep it here.</p><Link href="/#catalog">Explore the collection</Link></div> : <div className={styles.grid}>{wishlist.map((product) => { const hasPacks = product.weight?.split(',').filter(Boolean).length > 1; return <article key={product.id}><Link href={`/products/${product.slug}`}><span><Image src={product.image} alt={product.name} fill sizes="(max-width: 760px) 50vw, 25vw" /></span><h2>{product.name}</h2></Link><strong>₹{product.sale_price ?? product.price}</strong><div>{hasPacks ? <Link href={`/products/${product.slug}`}>Choose pack</Link> : <button onClick={() => addToCart(product)}>Add to bag</button>}<button onClick={() => toggleWishlist(product)}>Remove</button></div></article>; })}</div>}
    </main>
  );
}
