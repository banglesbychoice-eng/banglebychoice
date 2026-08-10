import Image from 'next/image';
import Link from 'next/link';
import { getCatalogProducts } from '@/lib/catalog-server';
import { absoluteUrl, defaultOgImage, ogImage, twitterImage } from '@/lib/seo';
import { catalogImage, titleCase } from '@/lib/products';
import QuickCartButton from '@/components/QuickCartButton';
import { FREE_SHIPPING_MIN } from '@/lib/pricing';
import styles from './offers.module.css';

export const revalidate = 300;

export const metadata = {
  title: 'Offers on Bangle Making Materials',
  description: 'Shop current offers on kundan stones, silk thread materials and jewellery-making supplies from Bangle by Choice.',
  alternates: { canonical: '/offers', languages: { 'en-IN': '/offers' } },
  openGraph: { title: 'Bangle by Choice Offers', description: 'Discounted bangle and jewellery-making materials delivered across India.', url: absoluteUrl('/offers'), type: 'website', images: [ogImage(defaultOgImage, 'Bangle by Choice offers')] },
  twitter: { card: 'summary_large_image', title: 'Bangle by Choice Offers', description: 'Shop discounted craft materials online.', images: twitterImage([defaultOgImage]) },
};

function discount(product) {
  return product.price > product.sale_price ? Math.round(((product.price - product.sale_price) / product.price) * 100) : 0;
}

function saving(product) {
  return Math.max(0, product.price - product.sale_price);
}

export default async function OffersPage() {
  const products = (await getCatalogProducts()).filter((product) => discount(product) > 0).sort((left, right) => discount(right) - discount(left)).slice(0, 120);
  return <main className={styles.page}>
    <nav><Link href="/">Home</Link><span>/</span><b>Offers</b></nav>
    <header><p>Current deals</p><h1>Offers on craft materials</h1><div>Save on kundan stones, silk thread materials and jewellery-making supplies. Free shipping applies above ₹{FREE_SHIPPING_MIN}.</div></header>
    <section className={styles.grid}>{products.map((product) => <article key={product.id}><Link href={`/products/${product.slug}`}><span><Image src={catalogImage(product.image)} alt={product.alt_text || product.name} fill sizes="(max-width: 640px) 50vw, (max-width: 1100px) 33vw, 20vw" quality={50} /></span><small>{discount(product)}% off · Save ₹{saving(product)} · {product.category}</small><h2>{titleCase(product.name)}</h2><strong>₹{product.sale_price}</strong>{product.price !== product.sale_price ? <del>₹{product.price}</del> : null}</Link><QuickCartButton product={product} compact /></article>)}</section>
  </main>;
}
