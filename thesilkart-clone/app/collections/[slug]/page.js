import Image from 'next/image';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import { catalogImage, categorySlug, titleCase } from '@/lib/products';
import { getCatalogProducts } from '@/lib/catalog-server';
import { collectionContent } from '@/lib/collection-content';
import { absoluteUrl, jsonLd, ogImages, twitterImage } from '@/lib/seo';
import { facetOptions, matchesFacets } from '@/lib/product-facets';
import { groupProductsByDesign } from '@/lib/product-grouping';
import QuickCartButton from '@/components/QuickCartButton';
import PendingSubmitButton from '@/components/PendingSubmitButton';
import styles from './collection.module.css';

const PAGE_SIZE = 48;

export const dynamicParams = true;

function findCategoryBySlug(products, slug) {
  return [...new Set(products.map((product) => product.category))].find((category) => categorySlug(category) === slug);
}

export async function generateStaticParams() {
  const products = await getCatalogProducts();
  return [...new Set(products.map((product) => product.category))].map((category) => ({ slug: categorySlug(category) }));
}

export async function generateMetadata({ params, searchParams }) {
  const { slug } = await params;
  const { page = '1', colour = '', shape = '', size = '' } = await searchParams;
  const products = await getCatalogProducts();
  const category = findCategoryBySlug(products, slug);
  if (!category) return { title: 'Collection not found' };
  const name = titleCase(category).replace('Jewelery', 'Jewellery');
  const collection = products.filter((product) => product.category === category);
  const image = collection[0]?.image;
  const content = collectionContent[slug];
  const description = content?.metaDescription || content?.intro || `Shop ${name.toLowerCase()} for bangle and jewellery making. Dispatch within 24 hours and delivery across India.`;
  const images = ogImages([image], `${name} from Bangle by Choice`);
  const hasFilters = Boolean(colour || shape || size);
  return {
    title: content?.seoTitle || `${name} Online in India`,
    description,
    alternates: { canonical: `/collections/${slug}${Number(page) > 1 ? `?page=${Number(page)}` : ''}`, languages: { 'en-IN': `/collections/${slug}` } },
    robots: hasFilters ? { index: false, follow: true } : { index: true, follow: true },
    openGraph: { title: `${name} | Bangle by Choice`, description, url: absoluteUrl(`/collections/${slug}`), type: 'website', images },
    twitter: { card: 'summary_large_image', title: `${name} | Bangle by Choice`, description, images: twitterImage([image]) },
  };
}

function ProductCard({ product }) {
  return (
    <article>
      <Link href={`/products/${product.slug}`}>
        <span><Image src={catalogImage(product.image)} alt={product.alt_text || `${titleCase(product.name)} for jewellery making`} fill sizes="(max-width: 760px) 46vw, (max-width: 1100px) 24vw, 18vw" quality={60} /></span>
        <small>{product.subcategory}</small>
        <h2>{titleCase(product.name)}</h2>
        <strong>₹{product.sale_price}</strong>
        {product.price !== product.sale_price ? <del>₹{product.price}</del> : null}
      </Link>
      <QuickCartButton product={product} compact />
    </article>
  );
}

function pageHref(slug, filters, page) {
  const params = new URLSearchParams();
  Object.entries({ ...filters, page }).forEach(([key, value]) => {
    if (value && !(key === 'page' && Number(value) === 1)) params.set(key, value);
  });
  const query = params.toString();
  return `/collections/${slug}${query ? `?${query}` : ''}`;
}

export default async function CollectionPage({ params, searchParams }) {
  const { slug } = await params;
  const { colour = '', shape = '', size = '', page = '1' } = await searchParams;
  const products = await getCatalogProducts();
  const category = findCategoryBySlug(products, slug);
  if (!category) notFound();
  const collection = products.filter((product) => product.category === category);
  const availableFacets = facetOptions(collection);
  const filteredCollection = collection.filter((product) => matchesFacets(product, { colour, shape, size }));
  const pageCount = Math.max(1, Math.ceil(filteredCollection.length / PAGE_SIZE));
  const currentPage = Math.min(pageCount, Math.max(1, Number(page) || 1));
  const start = (currentPage - 1) * PAGE_SIZE;
  const pagedCollection = filteredCollection.slice(start, start + PAGE_SIZE);
  const productGroups = groupProductsByDesign(pagedCollection);
  const filters = { colour, shape, size };
  const name = titleCase(category).replace('Jewelery', 'Jewellery');
  const content = collectionContent[slug];
  const collectionUrl = absoluteUrl(`/collections/${slug}`);
  const collectionSchema = { '@context': 'https://schema.org', '@type': 'CollectionPage', name, url: collectionUrl, mainEntity: { '@type': 'ItemList', numberOfItems: filteredCollection.length, itemListElement: pagedCollection.map((product, index) => ({ '@type': 'ListItem', position: start + index + 1, name: titleCase(product.name), url: absoluteUrl(`/products/${product.slug}`) })) } };
  const breadcrumbSchema = { '@context': 'https://schema.org', '@type': 'BreadcrumbList', itemListElement: [{ '@type': 'ListItem', position: 1, name: 'Home', item: absoluteUrl('/') }, { '@type': 'ListItem', position: 2, name, item: collectionUrl }] };
  const faqSchema = content?.faqs?.length ? { '@context': 'https://schema.org', '@type': 'FAQPage', mainEntity: content.faqs.map(([question, answer]) => ({ '@type': 'Question', name: question, acceptedAnswer: { '@type': 'Answer', text: answer } })) } : null;

  return <>
    <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(collectionSchema) }} />
    <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(breadcrumbSchema) }} />
    {faqSchema && <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(faqSchema) }} />}
    <main className={styles.page}>
      <nav><Link href="/">Home</Link><span>/</span><b>{name}</b></nav>
      <header><p>Shop by collection</p><h1>{name}</h1><div>{content?.intro || `${collection.length} products for jewellery and bangle making, packed for delivery across India.`}</div></header>
      <form className={styles.filters}>
        <label>Colour<select name="colour" defaultValue={colour}><option value="">All colours</option>{availableFacets.colours.map((option) => <option key={option}>{option}</option>)}</select></label>
        <label>Shape<select name="shape" defaultValue={shape}><option value="">All shapes</option>{availableFacets.shapes.map((option) => <option key={option}>{option}</option>)}</select></label>
        <label>Size / pack<select name="size" defaultValue={size}><option value="">All sizes</option>{availableFacets.sizes.map((option) => <option key={option}>{option}</option>)}</select></label>
        <PendingSubmitButton>Apply filters</PendingSubmitButton>
        {(colour || shape || size) ? <Link href={`/collections/${slug}`}>Clear</Link> : null}
        <span>Products {pagedCollection.length ? start + 1 : 0}-{Math.min(start + PAGE_SIZE, filteredCollection.length)} of {filteredCollection.length}</span>
      </form>
      <section className={styles.familyGroups}>
        {productGroups.map((group) => <section className={styles.familySection} key={group.key}><div className={styles.familyHead}><h2>{group.label}</h2>{group.products.length > 1 ? <span>{group.products.length} variants</span> : null}</div><div className={styles.grid}>{group.products.map((product) => <ProductCard product={product} key={product.id} />)}</div></section>)}
      </section>
      {pageCount > 1 ? <nav className={styles.pagination} aria-label="Collection pages">{currentPage > 1 ? <Link href={pageHref(slug, filters, currentPage - 1)}>Previous</Link> : <span>Previous</span>}<b>Page {currentPage} of {pageCount}</b>{currentPage < pageCount ? <Link href={pageHref(slug, filters, currentPage + 1)}>Next</Link> : <span>Next</span>}</nav> : null}
      {!filteredCollection.length ? <div className={styles.empty}><h2>No matching materials</h2><p>Clear one or more filters to see additional products.</p><Link href={`/collections/${slug}`}>Clear filters</Link></div> : null}
      {content?.buyingGuide?.length ? <section className={styles.buyingGuide}><p>Expert buying guide</p><h2>Choose the right {name.toLowerCase()}</h2><div>{content.buyingGuide.map(([heading, copy]) => <article key={heading}><h3>{heading}</h3><p>{copy}</p></article>)}</div></section> : null}
      {content?.faqs?.length ? <section className={styles.faq}><p>Buying guide</p><h2>Common questions about {name.toLowerCase()}</h2><div>{content.faqs.map(([question, answer]) => <details key={question}><summary>{question}</summary><p>{answer}</p></details>)}</div><Link href="https://wa.me/919553655562" rel="nofollow external noopener">Ask a product question on WhatsApp</Link></section> : null}
    </main>
  </>;
}
