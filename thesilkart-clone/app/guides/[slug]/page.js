import Image from 'next/image';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getGuide, guides } from '@/lib/guides';
import { absoluteUrl, jsonLd, ogImage, siteName, twitterImage } from '@/lib/seo';
import styles from '../guides.module.css';

export function generateStaticParams() { return guides.map(({ slug }) => ({ slug })); }

export async function generateMetadata({ params }) {
  const guide = getGuide((await params).slug);
  if (!guide) return { title: 'Guide not found' };
  return {
    title: guide.title,
    description: guide.description,
    alternates: { canonical: `/guides/${guide.slug}` },
    openGraph: { title: guide.title, description: guide.description, url: absoluteUrl(`/guides/${guide.slug}`), type: 'article', images: [ogImage(guide.image, guide.title)] },
    twitter: { card: 'summary_large_image', title: guide.title, description: guide.description, images: twitterImage([guide.image]) },
  };
}

export default async function GuidePage({ params }) {
  const guide = getGuide((await params).slug);
  if (!guide) notFound();
  const articleSchema = { '@context': 'https://schema.org', '@type': 'Article', headline: guide.title, description: guide.description, image: absoluteUrl(guide.image), author: { '@type': 'Organization', name: siteName }, publisher: { '@type': 'Organization', name: siteName }, mainEntityOfPage: absoluteUrl(`/guides/${guide.slug}`), datePublished: guide.datePublished, dateModified: guide.dateModified };
  return <><script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(articleSchema) }} /><main className={styles.article}><nav><Link href="/guides">Guides</Link><span>/</span><b>{guide.category}</b></nav><header><p>{guide.category} · {guide.readTime}</p><h1>{guide.title}</h1><div>{guide.description}</div></header><figure><Image src={guide.image} alt={guide.title} fill sizes="(max-width: 760px) 100vw, 1100px" priority /></figure><div className={styles.body}>{guide.sections.map(([title, copy]) => <section key={title}><h2>{title}</h2><p>{copy}</p></section>)}<aside><p>Ready to choose materials?</p><h2>Shop the supplies for this guide.</h2><Link href={guide.collection}>Browse relevant products</Link></aside></div></main></>;
}
