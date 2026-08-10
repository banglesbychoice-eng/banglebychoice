import Link from 'next/link';
import styles from './not-found.module.css';

const popularLinks = [
  ['Shop Kundan Stones', '/collections/kundan-stones'],
  ['Silk Thread Materials', '/collections/silk-thread-materials'],
  ['Jewellery Making Tools', '/collections/jewellery-making'],
  ['Current Offers', '/offers'],
];

export default function NotFound() {
  return (
    <main className={styles.page}>
      <p className={styles.eyebrow}>Page not found</p>
      <h1>Let us get you back to the right material.</h1>
      <p className={styles.copy}>This product or page may have moved. Search the store or browse the most-used Bangle by Choice sections.</p>
      <form className={styles.search} action="/search">
        <input name="q" placeholder="Search kundan stones, silk thread, tools..." autoFocus />
        <button>Search products</button>
      </form>
      <div className={styles.links}>
        {popularLinks.map(([label, href]) => <Link key={href} href={href}>{label}</Link>)}
      </div>
    </main>
  );
}
