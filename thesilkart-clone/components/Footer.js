import Link from 'next/link';
import styles from './Footer.module.css';

export default function Footer() {
  return (
    <footer className={styles.footer}>
      <div className={styles.footerTop}>
        <div className={styles.brand}><Link href="/"><span>Bangle</span><b>by Choice</b></Link><p>Your destination for bangles, kundan stones and thoughtfully selected jewellery-making materials.</p></div>
        <div><h4>Shop</h4><Link href="/collections/silk-thread-materials">Silk Thread Materials</Link><Link href="/collections/kundan-stones">Kundan Stones</Link><Link href="/collections/jewellery-making">Jewellery Making</Link><Link href="/offers">Offers</Link><Link href="/wholesale">Wholesale</Link></div>
        <div><h4>Learn & Help</h4><Link href="/guides">Making Guides</Link><Link href="/account">Track an Order</Link><Link href="/help/faq">FAQs</Link><Link href="/help/shipping">Shipping & Delivery</Link><Link href="/help/returns">Returns</Link><Link href="/help/order-help">Order Help</Link><Link href="/help/contact">Contact Us</Link><Link href="/help/about">About Us</Link><Link href="/help/privacy">Privacy Policy</Link><Link href="/help/terms">Terms of Use</Link></div>
        <div><h4>Talk to us</h4><a href="tel:+919553655562">+91 95536 55562</a><a href="https://wa.me/919553655562" rel="nofollow external noopener">WhatsApp support</a><a className={styles.socialLink} href="https://www.instagram.com/banglebychoice/" target="_blank" rel="me external noopener noreferrer" aria-label="Bangle by Choice official Instagram profile"><svg aria-hidden="true" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="3" y="3" width="18" height="18" rx="5" /><circle cx="12" cy="12" r="4" /><circle cx="17.5" cy="6.5" r="1" fill="currentColor" stroke="none" /></svg>Instagram <span>@banglebychoice</span></a><span>Hyderabad, India</span></div>
      </div>
      <div className={styles.footerBottom}>© {new Date().getFullYear()} Bangle by Choice. All rights reserved.</div>
    </footer>
  );
}
