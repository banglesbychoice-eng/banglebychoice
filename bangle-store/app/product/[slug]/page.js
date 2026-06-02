import { supabase } from '@/lib/supabase';

const BASE_URL = 'https://banglebychoice.netlify.app';

// ---------- helpers ----------
async function fetchProduct(slug) {
  // Try slug first
  let { data, error } = await supabase
    .from('products')
    .select('*')
    .eq('slug', slug)
    .maybeSingle();

  if (!data) {
    // Fallback: try by id (numeric or uuid)
    const res = await supabase
      .from('products')
      .select('*')
      .eq('id', slug)
      .maybeSingle();
    data = res.data;
    error = res.error;
  }

  return data;
}

function productDescription(product) {
  return (
    product.desc_text ||
    product.desc ||
    `Shop ${product.name} — premium handcrafted bangles from BangleByChoice, Hyderabad.`
  );
}

// ---------- SEO metadata ----------
export async function generateMetadata({ params }) {
  const { slug } = await params;
  const product = await fetchProduct(slug);

  if (!product) {
    return {
      title: 'Product Not Found — BangleByChoice',
      description: 'The product you are looking for does not exist.',
    };
  }

  const title = `${product.name} — Handcrafted Bangles | BangleByChoice`;
  const description = productDescription(product);
  const url = `${BASE_URL}/product/${product.slug || product.id}`;

  return {
    title,
    description,
    openGraph: {
      title,
      description,
      url,
      type: 'website',
      ...(product.image_url && { images: [{ url: product.image_url }] }),
    },
    twitter: {
      card: 'summary_large_image',
      title,
      description,
    },
  };
}

// ---------- page ----------
export default async function ProductPage({ params }) {
  const { slug } = await params;
  const product = await fetchProduct(slug);

  if (!product) {
    return (
      <div style={styles.notFound}>
        <span style={{ fontSize: 64 }}>🔍</span>
        <h1 style={styles.notFoundTitle}>Product Not Found</h1>
        <p style={styles.notFoundText}>
          We couldn&apos;t find the bangle you were looking for.
        </p>
        <a href="/" style={styles.backBtn}>
          ← Back to Shop
        </a>
      </div>
    );
  }

  const desc = productDescription(product);
  const canonicalUrl = `${BASE_URL}/product/${product.slug || product.id}`;
  const categoryLabel =
    product.cat?.charAt(0).toUpperCase() + product.cat?.slice(1) || 'Bangles';
  const sizes = product.sizes || ['2.2', '2.4', '2.6', '2.8'];

  // ---------- JSON-LD ----------
  const productSchema = {
    '@context': 'https://schema.org',
    '@type': 'Product',
    name: product.name,
    description: desc,
    sku: String(product.id),
    brand: { '@type': 'Brand', name: 'BangleByChoice' },
    offers: {
      '@type': 'Offer',
      url: canonicalUrl,
      priceCurrency: 'INR',
      price: product.price,
      itemCondition: 'https://schema.org/NewCondition',
      availability: 'https://schema.org/InStock',
    },
  };

  const breadcrumbSchema = {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: [
      {
        '@type': 'ListItem',
        position: 1,
        name: 'Home',
        item: BASE_URL,
      },
      {
        '@type': 'ListItem',
        position: 2,
        name: categoryLabel,
        item: `${BASE_URL}/?cat=${product.cat}`,
      },
      {
        '@type': 'ListItem',
        position: 3,
        name: product.name,
        item: canonicalUrl,
      },
    ],
  };

  const whatsappText = `Hello BangleByChoice! I'm interested in:\n- *Product:* ${product.name}\n- *Price:* ₹${product.price}`;
  const whatsappUrl = `https://wa.me/919553655562?text=${encodeURIComponent(whatsappText)}`;

  return (
    <>
      {/* Structured Data */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(productSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />

      <div style={styles.page}>
        {/* Breadcrumb */}
        <nav style={styles.breadcrumb} aria-label="Breadcrumb">
          <a href="/" style={styles.breadcrumbLink}>
            Home
          </a>
          <span style={styles.breadcrumbSep}>›</span>
          <a href={`/?cat=${product.cat}`} style={styles.breadcrumbLink}>
            {categoryLabel}
          </a>
          <span style={styles.breadcrumbSep}>›</span>
          <span style={styles.breadcrumbCurrent}>{product.name}</span>
        </nav>

        <div style={styles.grid}>
          {/* ---- Image / Visual ---- */}
          <div style={styles.imageCol}>
            <div style={styles.imageCard}>
              {product.image_url ? (
                <img src={product.image_url} alt={product.name} style={{ width: '100%', height: '100%', objectFit: 'cover', borderRadius: '16px' }} />
              ) : (
                <span style={styles.emoji}>{product.emoji || '🌸'}</span>
              )}
            </div>
          </div>

          {/* ---- Details ---- */}
          <div style={styles.detailCol}>
            {product.tag && <span style={styles.tag}>{product.tag}</span>}

            <h1 style={styles.productName}>{product.name}</h1>

            {/* Price */}
            <div style={styles.priceRow}>
              <span style={styles.price}>₹{product.price}</span>
              {product.mrp && product.mrp > product.price && (
                <>
                  <span style={styles.mrp}>₹{product.mrp}</span>
                  <span style={styles.discount}>
                    Save ₹{product.mrp - product.price}
                  </span>
                </>
              )}
            </div>

            {/* Description */}
            <p style={styles.desc}>{desc}</p>

            {/* Sizes */}
            {product.cat !== 'materials' && (
              <div style={styles.sizesSection}>
                <span style={styles.sizeLabel}>Available Sizes</span>
                <div style={styles.sizeChips}>
                  {sizes.map((sz) => (
                    <span key={sz} style={styles.sizeChip}>
                      {sz}
                    </span>
                  ))}
                </div>
              </div>
            )}

            {/* CTAs */}
            <div style={styles.ctas}>
              <a
                href={`/?add=${product.slug || product.id}`}
                style={styles.addBagBtn}
              >
                🛍️ Add to Bag
              </a>
              <a
                href={whatsappUrl}
                target="_blank"
                rel="noopener noreferrer"
                style={styles.whatsappBtn}
              >
                💬 Buy via WhatsApp
              </a>
            </div>

            <a href="/" style={styles.backLink}>
              ← Back to Shop
            </a>
          </div>
        </div>
      </div>
    </>
  );
}

// ---------- inline styles ----------
const styles = {
  page: {
    maxWidth: 1080,
    margin: '0 auto',
    padding: '24px 20px 80px',
    fontFamily: "'Plus Jakarta Sans', system-ui, sans-serif",
    color: '#fff',
    minHeight: '100vh',
  },

  /* breadcrumb */
  breadcrumb: {
    display: 'flex',
    alignItems: 'center',
    gap: 8,
    fontSize: 13,
    marginBottom: 32,
    flexWrap: 'wrap',
  },
  breadcrumbLink: {
    color: '#A8A8A8',
    textDecoration: 'none',
  },
  breadcrumbSep: { color: '#555' },
  breadcrumbCurrent: {
    color: '#D4A574',
    fontWeight: 600,
  },

  /* grid */
  grid: {
    display: 'grid',
    gridTemplateColumns: '1fr',
    gap: 40,
  },
  // Note: for desktop we rely on CSS media query via globals; inline grid works well for mobile-first

  /* image */
  imageCol: {},
  imageCard: {
    aspectRatio: '1',
    borderRadius: 16,
    background: 'linear-gradient(135deg, #1A1A1A 0%, #2A2421 100%)',
    border: '1px solid rgba(212,165,116,0.2)',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    maxHeight: 480,
  },
  emoji: { fontSize: 96 },

  /* detail */
  detailCol: { display: 'flex', flexDirection: 'column', gap: 16 },

  tag: {
    alignSelf: 'flex-start',
    background: 'rgba(212,165,116,0.15)',
    color: '#D4A574',
    fontSize: 11,
    fontWeight: 700,
    textTransform: 'uppercase',
    letterSpacing: 1,
    padding: '5px 12px',
    borderRadius: 6,
  },

  productName: {
    fontFamily: "'Playfair Display', Georgia, serif",
    fontSize: 32,
    fontWeight: 700,
    lineHeight: 1.25,
    color: '#fff',
    margin: 0,
  },

  priceRow: {
    display: 'flex',
    alignItems: 'baseline',
    gap: 10,
    flexWrap: 'wrap',
  },
  price: {
    fontFamily: "'JetBrains Mono', monospace",
    fontSize: 26,
    fontWeight: 700,
    color: '#D4A574',
  },
  mrp: {
    fontFamily: "'JetBrains Mono', monospace",
    fontSize: 16,
    textDecoration: 'line-through',
    color: '#777',
  },
  discount: {
    fontSize: 13,
    fontWeight: 600,
    color: '#25D366',
    background: 'rgba(37,211,102,0.1)',
    padding: '3px 8px',
    borderRadius: 4,
  },

  desc: {
    fontSize: 15,
    lineHeight: 1.7,
    color: '#A8A8A8',
    margin: 0,
  },

  /* sizes */
  sizesSection: { marginTop: 4 },
  sizeLabel: {
    fontSize: 12,
    fontWeight: 600,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    color: '#A8A8A8',
    marginBottom: 8,
    display: 'block',
  },
  sizeChips: { display: 'flex', gap: 8, flexWrap: 'wrap', marginTop: 8 },
  sizeChip: {
    width: 48,
    height: 48,
    borderRadius: 8,
    border: '1px solid #2C2C2C',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    fontSize: 14,
    fontWeight: 600,
    color: '#fff',
    background: '#1C1C1C',
  },

  /* CTAs */
  ctas: {
    display: 'grid',
    gridTemplateColumns: '1fr 1fr',
    gap: 12,
    marginTop: 8,
  },
  addBagBtn: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    padding: '14px 20px',
    borderRadius: 10,
    fontWeight: 600,
    fontSize: 14,
    textDecoration: 'none',
    color: '#fff',
    background: '#D4A574',
    border: 'none',
    cursor: 'pointer',
    textAlign: 'center',
  },
  whatsappBtn: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    padding: '14px 20px',
    borderRadius: 10,
    fontWeight: 600,
    fontSize: 14,
    textDecoration: 'none',
    color: '#fff',
    background: '#25D366',
    border: 'none',
    cursor: 'pointer',
    textAlign: 'center',
  },

  backLink: {
    fontSize: 13,
    color: '#A8A8A8',
    textDecoration: 'none',
    marginTop: 8,
  },

  /* Not found */
  notFound: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    minHeight: '70vh',
    textAlign: 'center',
    padding: 40,
    gap: 12,
    color: '#fff',
  },
  notFoundTitle: {
    fontFamily: "'Playfair Display', Georgia, serif",
    fontSize: 28,
    fontWeight: 700,
    margin: 0,
  },
  notFoundText: { fontSize: 15, color: '#A8A8A8', margin: 0 },
  backBtn: {
    marginTop: 16,
    display: 'inline-flex',
    alignItems: 'center',
    gap: 8,
    padding: '12px 28px',
    borderRadius: 10,
    background: '#D4A574',
    color: '#fff',
    fontWeight: 600,
    fontSize: 14,
    textDecoration: 'none',
  },
};
