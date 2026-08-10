import Image from 'next/image';
import Link from 'next/link';
import { guides } from '@/lib/guides';
import { absoluteUrl, ogImage, twitterImage } from '@/lib/seo';
import styles from './guides.module.css';

const guidePreview = guides[0]?.image;

export const metadata = {
  title: 'Bangle & Jewellery-Making Guides',
  description: 'Practical tutorials and material guides for silk thread bangles, Kundan stones and handmade jewellery.',
  alternates: { canonical: '/guides' },
  openGraph: { title: 'Bangle & Jewellery-Making Guides', description: 'Practical tutorials and material guides for handmade jewellery.', url: absoluteUrl('/guides'), type: 'website', images: [ogImage(guidePreview, 'Bangle by Choice jewellery-making guides')] },
  twitter: { card: 'summary_large_image', title: 'Bangle & Jewellery-Making Guides', description: 'Practical tutorials and material guides for handmade jewellery.', images: twitterImage([guidePreview]) },
};

export default function GuidesPage() {
  return <main className={styles.page}><header><p>Learn with Bangle by Choice</p><h1>Make with confidence.</h1><div>Practical guidance for choosing materials, planning designs and completing handmade jewellery projects.</div></header><section className={styles.grid}>{guides.map((guide) => <article key={guide.slug}><Link href={`/guides/${guide.slug}`}><span><Image src={guide.image} alt={guide.title} fill sizes="(max-width: 760px) 100vw, 33vw" /></span><small>{guide.category} · {guide.readTime}</small><h2>{guide.title}</h2><p>{guide.description}</p><b>Read guide</b></Link></article>)}</section></main>;
}
