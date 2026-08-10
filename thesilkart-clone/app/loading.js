import styles from './loading.module.css';

export default function Loading() {
  return (
    <main className={styles.page} role="status" aria-live="polite" aria-label="Loading page">
      <div className={styles.heading} />
      <div className={styles.controls} />
      <div className={styles.grid}>
        {Array.from({ length: 8 }, (_, index) => <div className={styles.card} key={index}><span /><i /><b /></div>)}
      </div>
      <p>Loading products…</p>
    </main>
  );
}
