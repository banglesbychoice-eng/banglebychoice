'use client';

import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { Heart, Home, Search, ShoppingBag } from 'lucide-react';
import { useCommerce } from './CommerceContext';
import VoiceSearchButton from './VoiceSearchButton';
import styles from './MobileBottomNav.module.css';

export default function MobileBottomNav() {
  const pathname = usePathname();
  const router = useRouter();
  const { cartCount, setCartOpen } = useCommerce();

  function openVoiceResults(transcript) {
    const query = transcript.trim();
    if (query) router.push(`/search?q=${encodeURIComponent(query)}`);
  }

  return (
    <nav className={styles.nav} aria-label="Mobile navigation">
      <Link href="/" className={pathname === '/' ? styles.active : ''}><Home aria-hidden="true" /><span>Home</span></Link>
      <Link href="/search" className={pathname === '/search' ? styles.active : ''}><Search aria-hidden="true" /><span>Type</span></Link>
      <VoiceSearchButton className={styles.voice} label="Voice" onTranscript={() => {}} onFinal={openVoiceResults} />
      <Link href="/wishlist" className={pathname === '/wishlist' ? styles.active : ''}><Heart aria-hidden="true" /><span>Wishlist</span></Link>
      <button onClick={() => setCartOpen(true)} className={pathname === '/checkout' || pathname === '/cart' ? styles.active : ''} aria-label={`Open bag with ${cartCount} items`}><ShoppingBag aria-hidden="true" />{cartCount > 0 && <b className={styles.badge}>{cartCount}</b>}<span>Bag</span></button>
    </nav>
  );
}
