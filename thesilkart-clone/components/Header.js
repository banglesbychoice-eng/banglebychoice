'use client';

import Link from 'next/link';
import { useRef, useState } from 'react';
import { Menu, Search, ShoppingBag, X } from 'lucide-react';
import { useCommerce } from './CommerceContext';
import VoiceSearchButton from './VoiceSearchButton';
import styles from './Header.module.css';
import { FREE_SHIPPING_MIN } from '@/lib/pricing';

const navItems = [
  ['Raw Materials', 'raw-materials'],
  ['Bangles', 'bangles'],
  ['Accessories', 'accessories'],
];

export default function Header() {
  const [menuOpen, setMenuOpen] = useState(false);
  const [query, setQuery] = useState('');
  const desktopFormRef = useRef(null);
  const mobileFormRef = useRef(null);
  const { cartCount, setCartOpen } = useCommerce();

  function submitSearch(formRef, transcript) {
    setQuery(transcript);
    const input = formRef.current?.elements?.q;
    if (input) input.value = transcript;
    requestAnimationFrame(() => formRef.current?.requestSubmit());
  }

  function renderSearchForm(formRef) {
    return <>
      <input name="q" aria-label="Search products" value={query} onChange={(event) => setQuery(event.target.value)} placeholder="Search colours, stones, tools..." />
      <VoiceSearchButton className={styles.voiceButton} onTranscript={setQuery} onFinal={(transcript) => submitSearch(formRef, transcript)} label="Mic" />
      <button aria-label="Search products"><Search aria-hidden="true" /><span className={styles.buttonLabel}>Search</span></button>
    </>;
  }

  return (
    <header className={styles.header}>
      <div className={styles.topBar}>Free shipping from ₹{FREE_SHIPPING_MIN}, except bangle boxes · Dispatch within 24 hours</div>
      <div className={styles.desktopHeader}>
        <Link href="/" className={styles.wordmark}><span>Bangle</span><b>by Choice</b></Link>
        <form ref={desktopFormRef} className={styles.search} action="/search"><Search aria-hidden="true" />{renderSearchForm(desktopFormRef)}</form>
        <div className={styles.actions}><Link href="/wishlist">Wishlist</Link><button onClick={() => setCartOpen(true)} aria-label={`Open cart with ${cartCount} items`}><ShoppingBag aria-hidden="true" /> Cart <span>{cartCount}</span></button></div>
      </div>
      <nav className={styles.desktopNav}>
        <Link href="/">Home</Link>
        {navItems.map(([label, slug]) => <Link href={`/collections/${slug}`} key={slug}>{label}</Link>)}
        <Link href="/offers" className={styles.sale}>Offers</Link>
      </nav>
      <div className={styles.mobileHeader}>
        <button className={styles.menuButton} onClick={() => setMenuOpen((open) => !open)} aria-label={menuOpen ? 'Close menu' : 'Open menu'}>{menuOpen ? <X aria-hidden="true" /> : <Menu aria-hidden="true" />}</button>
        <Link href="/" className={styles.wordmark}><span>Bangle</span><b>by Choice</b></Link>
        <button className={styles.bagButton} onClick={() => setCartOpen(true)} aria-label={`Open bag with ${cartCount} items`}><ShoppingBag aria-hidden="true" /><span>{cartCount}</span></button>
      </div>
      {menuOpen && (
        <nav className={styles.mobileMenu}>
          <form ref={mobileFormRef} action="/search">{renderSearchForm(mobileFormRef)}</form>
          <Link onClick={() => setMenuOpen(false)} href="/">Home</Link>
          {navItems.map(([label, slug]) => <Link onClick={() => setMenuOpen(false)} href={`/collections/${slug}`} key={slug}>{label}</Link>)}
          <Link onClick={() => setMenuOpen(false)} href="/offers">Offers</Link>
          <Link onClick={() => setMenuOpen(false)} href="/#catalog">View all products</Link>
        </nav>
      )}
    </header>
  );
}
