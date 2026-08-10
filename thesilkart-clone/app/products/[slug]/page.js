import Image from 'next/image';
import Link from 'next/link';
import { permanentRedirect } from 'next/navigation';
import { catalogImage, categorySlug, titleCase } from '@/lib/products';
import { getCatalogProducts, getDatabaseProduct } from '@/lib/catalog-server';
import ProductActions from '@/components/ProductActions';
import styles from './product.module.css';
import { absoluteUrl, jsonLd, ogImages, premiumProductDescription, premiumProductMetaDescription, productKeywords, productSeoTitle, siteName, twitterImage } from '@/lib/seo';
import { FREE_SHIPPING_MIN, SHIPPING_FEE, getPackChoices, getPriceValidUntil, isBangleBoxProduct } from '@/lib/pricing';
import { productGroupKey } from '@/lib/product-grouping';
import { getApprovedReviews, reviewSummary } from '@/lib/reviews-server';
import ProductReviews from '@/components/ProductReviews';
import { isDisallowedProduct } from '@/lib/disallowed-products';

export const dynamic = 'force-static';
export const revalidate = 300;

function legacyCollection(slug = '') {
  const value = slug.toLowerCase();
  if (/kundan|stone|glass|glossy|matte|matt|ceramic/.test(value)) return 'kundan-stones';
  if (/thread|bangle|charm|mdf|glue|fabric/.test(value)) return 'silk-thread-materials';
  return 'jewellery-making';
}

function structuredMaterial(product) {
  const text = `${product.name || ''} ${product.type || ''} ${product.subcategory || ''}`.toLowerCase();
  return ['ceramic', 'glass', 'acrylic', 'pearl', 'silk thread', 'mdf'].find((material) => text.includes(material)) || '';
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const product = await getDatabaseProduct(slug);
  if (!product || product.status === 'draft') return { title: 'Product not found', robots: { index: false, follow: false } };
  const title = productSeoTitle(product);
  const description = product.meta_description || premiumProductMetaDescription(product);
  const images = ogImages(product.images, title);
  return {
    title,
    description,
    keywords: productKeywords(product),
    alternates: { canonical: `/products/${product.slug}`, languages: { 'en-IN': `/products/${product.slug}` } },
    openGraph: { title, description, url: absoluteUrl(`/products/${product.slug}`), type: 'website', images },
    twitter: { card: 'summary_large_image', title, description, images: twitterImage(product.images) },
    other: { 'product:price:amount': String(product.sale_price), 'product:price:currency': 'INR', 'product:availability': product.availability, 'og:type': 'product' },
  };
}

export default async function ProductPage({ params }) {
  const { slug } = await params;
  const product = await getDatabaseProduct(slug);
  if (!product) permanentRedirect(`/collections/${legacyCollection(slug)}`);
  if (product.status === 'draft' || isDisallowedProduct(product)) permanentRedirect(`/collections/${categorySlug(product.category)}`);
  const currentGroup = productGroupKey(product);
  const related = [...new Map((await getCatalogProducts())
    .filter((item) => item.category === product.category && item.id !== product.id && productGroupKey(item) !== currentGroup)
    .map((item) => [productGroupKey(item), item])).values()].slice(0, 8);
  const discount = Math.round(((product.price - product.sale_price) / product.price) * 100);
  const baseSavings = Math.max(0, product.price - product.sale_price);
  const choices = getPackChoices(product);
  const reviews = await getApprovedReviews(product.slug);
  const summary = reviewSummary(reviews);
  const productUrl = absoluteUrl(`/products/${product.slug}`);
  const shippingDetails = {
    '@type': 'OfferShippingDetails',
    shippingDestination: { '@type': 'DefinedRegion', addressCountry: 'IN' },
    deliveryTime: { '@type': 'ShippingDeliveryTime', handlingTime: { '@type': 'QuantitativeValue', minValue: 0, maxValue: 1, unitCode: 'DAY' }, transitTime: { '@type': 'QuantitativeValue', minValue: 1, maxValue: 7, unitCode: 'DAY' } },
    shippingRate: { '@type': 'MonetaryAmount', value: !isBangleBoxProduct(product) && product.sale_price >= FREE_SHIPPING_MIN ? 0 : SHIPPING_FEE, currency: 'INR' },
  };
  const returnPolicy = { '@type': 'MerchantReturnPolicy', applicableCountry: 'IN', returnPolicyCategory: 'https://schema.org/MerchantReturnFiniteReturnWindow', merchantReturnDays: 2, returnMethod: 'https://schema.org/ReturnByMail', returnFees: 'https://schema.org/ReturnShippingFees' };
  const productDescription = product.description || premiumProductDescription(product);
  const additionalProperty = [
    ...(product.facets?.colours || []).map((value) => ({ '@type': 'PropertyValue', name: 'Colour', value })),
    ...(product.facets?.shapes || []).map((value) => ({ '@type': 'PropertyValue', name: 'Shape', value })),
    ...(product.facets?.sizes || []).map((value) => ({ '@type': 'PropertyValue', name: 'Size', value })),
    ...(choices || []).map((value) => ({ '@type': 'PropertyValue', name: 'Pack size', value })),
  ];
  const productSchema = {
    '@context': 'https://schema.org', '@type': 'Product', name: titleCase(product.name), description: productDescription,
    sku: product.id, image: product.images.map(absoluteUrl), category: product.category, brand: { '@type': 'Brand', name: siteName },
    offers: { '@type': 'Offer', url: productUrl, priceCurrency: 'INR', price: product.sale_price, priceValidUntil: getPriceValidUntil(), availability: product.availability.toLowerCase().includes('stock') ? 'https://schema.org/InStock' : 'https://schema.org/OutOfStock', itemCondition: 'https://schema.org/NewCondition', seller: { '@type': 'Organization', name: siteName }, shippingDetails, hasMerchantReturnPolicy: returnPolicy },
  };
  if (additionalProperty.length) productSchema.additionalProperty = additionalProperty;
  if (product.facets?.colours?.length) productSchema.color = product.facets.colours.join(', ');
  if (product.facets?.sizes?.length) productSchema.size = product.facets.sizes.join(', ');
  const material = structuredMaterial(product);
  if (material) productSchema.material = material;
  if (summary) {
    productSchema.aggregateRating = { '@type': 'AggregateRating', ratingValue: summary.value, reviewCount: summary.count };
    productSchema.review = reviews.slice(0, 5).map((review) => ({ '@type': 'Review', author: { '@type': 'Person', name: review.author_name }, reviewRating: { '@type': 'Rating', ratingValue: review.rating, bestRating: 5 }, reviewBody: review.review_text }));
  }
  const breadcrumbSchema = { '@context': 'https://schema.org', '@type': 'BreadcrumbList', itemListElement: [
    { '@type': 'ListItem', position: 1, name: 'Home', item: absoluteUrl('/') },
    { '@type': 'ListItem', position: 2, name: product.category, item: absoluteUrl(`/collections/${categorySlug(product.category)}`) },
    { '@type': 'ListItem', position: 3, name: titleCase(product.name), item: productUrl },
  ] };

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(productSchema) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(breadcrumbSchema) }} />
      <main className={styles.page}>
        <nav className={styles.breadcrumb}><Link href="/">Home</Link><span>/</span><Link href={`/collections/${categorySlug(product.category)}`}>{product.category}</Link><span>/</span><b>{titleCase(product.name)}</b></nav>
        <section className={styles.productLayout}>
          <div className={styles.gallery}>
            {product.images.length > 1 ? <div className={styles.photoCount}>{product.images.length} photos</div> : null}
            {product.images.map((image, index) => (
              <div className={styles.imageFrame} id={`photo-${index + 1}`} key={image}><Image src={image} alt={index === 0 ? product.alt_text || `${titleCase(product.name)} for jewellery making` : `${titleCase(product.name)} detail view ${index + 1}`} fill sizes="(max-width: 760px) 100vw, 50vw" priority={index === 0} quality={index === 0 ? 75 : 50} /></div>
            ))}
            {product.images.length > 1 ? <div className={styles.galleryNav}>{product.images.map((image, index) => <a key={image} href={`#photo-${index + 1}`} aria-label={`View product photo ${index + 1}`}><Image src={image} alt="" fill sizes="72px" /></a>)}</div> : null}
            {product.images.length > 1 ? <div className={styles.mobileDots} aria-hidden="true">{product.images.map((image, index) => <span key={image} className={index === 0 ? styles.activeDot : ''} />)}</div> : null}
          </div>
          <div className={styles.info}>
            <p className={styles.category}>{product.category} · {product.subcategory}</p>
            <h1>{titleCase(product.name)}</h1>
            {summary ? <a className={styles.ratingSummary} href="#reviews"><span>★★★★★</span><b>{summary.value}</b><small>{summary.count} review{summary.count === 1 ? '' : 's'}</small></a> : null}
            <div className={styles.prices}><strong>{choices.length > 1 ? 'From ' : ''}₹{product.sale_price}</strong><del>₹{product.price}</del>{discount > 0 && <span>{discount}% off · Save ₹{baseSavings}</span>}</div>
            <p className={styles.tax}>Inclusive of all taxes</p>
            <div className={styles.stock}><span /> {product.availability}{product.stock_quantity > 0 && product.stock_quantity < 5 ? <b className={styles.lowStock}>Only {product.stock_quantity} packs left</b> : null}</div>
            <div className={styles.trustRow}><span>Secure online checkout</span><span>UPI and cards</span><span>48-hr damage support</span></div>
            <ProductActions product={product} choices={choices} />
            <div className={styles.benefits}>
              <p><b>Fast dispatch</b><span>Orders confirmed on business days are dispatched within 24 hours.</span></p>
              <p><b>Delivery across India</b><span>1–3 days in AP & Telangana, 3–7 days elsewhere.</span></p>
              <p><b>Need help?</b><span>Chat with us for product and quantity guidance.</span></p>
            </div>
            <details open><summary>Product details</summary><p>{productDescription}</p><p><b>Type:</b> {product.type}</p>{choices.length ? <p><b>Available packs:</b> {choices.join(', ')}</p> : null}</details>
            <details><summary>Shipping & delivery</summary><p>Orders are processed for dispatch within 24 hours after confirmation. India Post shipments may require 1–2 additional working days.</p></details>
          </div>
        </section>
      </main>
      <section className={styles.related}>
        <p>You may also like</p><h2>More from this collection</h2>
        <div>{related.map((item) => <Link href={`/products/${item.slug}`} key={item.id}><span><Image src={catalogImage(item.image)} alt={item.name} fill sizes="200px" quality={50} /></span><b>{titleCase(item.name)}</b><small>₹{item.sale_price}</small></Link>)}</div>
      </section>
      <ProductReviews productSlug={product.slug} productName={titleCase(product.name)} reviews={reviews} />
    </>
  );
}

