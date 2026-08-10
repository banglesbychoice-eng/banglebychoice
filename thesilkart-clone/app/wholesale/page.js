import Link from 'next/link';
import { absoluteUrl, defaultOgImage, jsonLd, ogImage, twitterImage } from '@/lib/seo';
import styles from './wholesale.module.css';

export const metadata = {
  title: 'Wholesale Jewellery-Making Materials',
  description: 'Request bulk pricing for kundan stones, silk thread and jewellery-making materials from Bangle by Choice in Hyderabad.',
  alternates: { canonical: '/wholesale' },
  openGraph: { title: 'Wholesale Jewellery-Making Materials', description: 'Bulk craft-material enquiries for makers and resellers across India.', url: absoluteUrl('/wholesale'), type: 'website', images: [ogImage(defaultOgImage, 'Bangle by Choice wholesale materials')] },
  twitter: { card: 'summary_large_image', title: 'Bangle by Choice Wholesale', description: 'Request a bulk quote for jewellery-making materials.', images: twitterImage([defaultOgImage]) },
};

const questions = [
  ['Who can request wholesale pricing?', 'Boutiques, craft teachers, jewellery makers, resellers and production teams can request a quote.'],
  ['Is there one fixed wholesale discount?', 'No. The quote depends on the exact product, pack size, quantity and current stock, so you receive pricing that matches the requirement.'],
  ['Can several colours or shapes be combined?', 'Share the required colour, shape, size and quantity for every item. We will confirm which combinations are available.'],
  ['How is bulk shipping calculated?', 'Shipping is quoted using the final packed weight and destination PIN code.'],
];

export default function WholesalePage() {
  const enquiry = 'Hello Bangle by Choice, I need a wholesale quote. Products: __. Pack size: __. Quantity: __. Delivery PIN code: __.';
  const schema = { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: questions.map(([name, text]) => ({ '@type': 'Question', name, acceptedAnswer: { '@type': 'Answer', text } })) };
  return <><script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(schema) }} /><main className={styles.page}>
    <nav><Link href="/">Home</Link><span>/</span><b>Wholesale</b></nav>
    <header><p>For makers and resellers</p><h1>Wholesale materials, quoted clearly</h1><div>Tell us exactly what you make and the quantity you need. We will check current stock and quote the suitable pack sizes, unit pricing and shipping.</div><a href={`https://wa.me/919553655562?text=${encodeURIComponent(enquiry)}`} rel="nofollow external noopener">Request a wholesale quote</a></header>
    <section><h2>Include these details</h2><ol><li>Product link or exact product name</li><li>Colour, shape, size and pack size</li><li>Total quantity required</li><li>Delivery PIN code and preferred timeline</li></ol></section>
    <section><h2>Wholesale questions</h2>{questions.map(([title, copy]) => <article key={title}><h3>{title}</h3><p>{copy}</p></article>)}</section>
  </main></>;
}
