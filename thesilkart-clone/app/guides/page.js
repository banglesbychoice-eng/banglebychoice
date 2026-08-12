import Image from 'next/image';
import Link from 'next/link';
import { guides } from '@/lib/guides';
import { absoluteUrl, ogImage, twitterImage } from '@/lib/seo';
import styles from './guides.module.css';

const guidePreview = guides[0]?.image;

export const metadata = {
  title: 'Silk Thread Bangle-Making Guides',
  description: 'Practical silk thread bangle-making tutorials, material checklists, Kundan stone guides and finishing advice for bangle makers.',
  alternates: { canonical: '/guides' },
  openGraph: { title: 'Silk Thread Bangle-Making Guides', description: 'Practical tutorials, checklists and material guides for silk thread bangle makers.', url: absoluteUrl('/guides'), type: 'website', images: [ogImage(guidePreview, 'Bangle by Choice silk thread bangle-making guides')] },
  twitter: { card: 'summary_large_image', title: 'Silk Thread Bangle-Making Guides', description: 'Practical tutorials and material guides for bangle makers.', images: twitterImage([guidePreview]) },
};

export default function GuidesPage() {
  return <main className={styles.page}><header><p>Learn with Bangle by Choice</p><h1>Make better thread bangles.</h1><div>Practical guidance for choosing materials, planning repeats and finishing silk thread bangles neatly.</div></header><section className={styles.grid}>{guides.map((guide) => <article key={guide.slug}><Link href={`/guides/${guide.slug}`}><span><Image src={guide.image} alt={guide.title} fill sizes="(max-width: 760px) 100vw, 33vw" /></span><small>{guide.category} · {guide.readTime}</small><h2>{guide.title}</h2><p>{guide.description}</p><b>Read guide</b></Link></article>)}</section></main>;
}
