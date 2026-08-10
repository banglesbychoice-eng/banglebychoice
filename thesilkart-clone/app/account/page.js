import Link from 'next/link';
import AccountPortal from './AccountPortal';
import styles from './account.module.css';

export const metadata = {
  title: 'Track an Order',
  description: 'Track a Bangle by Choice order and quickly reorder previous items.',
  robots: { index: false, follow: true },
};

export default async function AccountPage({ searchParams }) {
  const query = await searchParams;
  return <main className={styles.page}>
    <nav><Link href="/">Home</Link><span>/</span><b>Order tracking</b></nav>
    <section>
      <p>Self-service order help</p>
      <h1>Track or reorder</h1>
      <div className={styles.intro}>Use the order number from checkout and the mobile number used for delivery. Your address and contact details are not displayed.</div>
      <AccountPortal initialOrder={query?.order || ''} />
    </section>
  </main>;
}
