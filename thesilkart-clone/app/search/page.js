import Image from 'next/image';
import Link from 'next/link';
import { getCatalogProducts } from '@/lib/catalog-server';
import { productFamily, searchProducts } from '@/lib/product-search';
import { catalogImage, titleCase } from '@/lib/products';
import { facetOptions, matchesFacets } from '@/lib/product-facets';
import { absoluteUrl, defaultOgImage, ogImage, twitterImage } from '@/lib/seo';
import PendingSubmitButton from '@/components/PendingSubmitButton';
import QuickCartButton from '@/components/QuickCartButton';
import SearchForm from './SearchForm';
import styles from './search.module.css';

export const metadata = {
  title: 'Search Products',
  description: 'Search Bangle by Choice products, bangle materials, kundan stones and jewellery-making supplies.',
  robots: { index: false, follow: true },
  openGraph: { title: 'Search Products | Bangle by Choice', description: 'Find bangle and jewellery-making materials by colour, shape, size and category.', url: absoluteUrl('/search'), type: 'website', images: [ogImage(defaultOgImage, 'Bangle by Choice product search')] },
  twitter: { card: 'summary_large_image', title: 'Search Products | Bangle by Choice', description: 'Find bangle and jewellery-making materials by colour, shape, size and category.', images: twitterImage([defaultOgImage]) },
};

function ProductCard({ product }) {
  return (
    <article>
      <Link href={`/products/${product.slug}`}>
        <span><Image src={catalogImage(product.image)} alt={product.alt_text || product.name} fill sizes="(max-width: 760px) 50vw, 20vw" quality={60} /></span>
        <small>{product.category}</small>
        <h3>{titleCase(product.name)}</h3>
        <div><b>₹{product.sale_price}</b>{product.price !== product.sale_price ? <del>₹{product.price}</del> : null}</div>
      </Link>
      <QuickCartButton product={product} compact />
    </article>
  );
}

export default async function SearchPage({ searchParams }) {
  const { q = '', colour = '', shape = '', size = '' } = await searchParams;
  const query = String(q).trim();
  const queryMatches = query ? searchProducts(await getCatalogProducts(), query) : [];
  const availableFacets = facetOptions(queryMatches);
  const matches = queryMatches.filter((product) => matchesFacets(product, { colour, shape, size })).slice(0, 120);
  const groups = new Map();
  matches.forEach((product) => {
    const family = productFamily(product);
    if (!groups.has(family)) groups.set(family, []);
    groups.get(family).push(product);
  });

  return (
    <main className={styles.page}>
      <header>
        <p>Product search</p>
        <h1>{query ? `Results for “${query}”` : 'Find a material.'}</h1>
        <SearchForm query={query}>
          {query ? (
            <div className={styles.facetBar}>
              <label>Colour<select name="colour" defaultValue={colour}><option value="">All colours</option>{availableFacets.colours.map((option) => <option key={option}>{option}</option>)}</select></label>
              <label>Shape<select name="shape" defaultValue={shape}><option value="">All shapes</option>{availableFacets.shapes.map((option) => <option key={option}>{option}</option>)}</select></label>
              <label>Size / pack<select name="size" defaultValue={size}><option value="">All sizes</option>{availableFacets.sizes.map((option) => <option key={option}>{option}</option>)}</select></label>
              <PendingSubmitButton>Apply filters</PendingSubmitButton>
              {(colour || shape || size) ? <Link href={`/search?q=${encodeURIComponent(query)}`}>Clear</Link> : null}
            </div>
          ) : null}
        </SearchForm>
        {query
          ? <div>{matches.length ? `${matches.length} matching products in ${groups.size} groups` : 'No matching products found'}</div>
          : <div>Search by colour, shape, material, tool or product name.</div>}
      </header>
      {matches.length ? (
        <div className={styles.groups}>
          {[...groups.entries()].map(([family, products]) => (
            <section key={family}>
              <div className={styles.groupHead}><h2>{family}</h2><span>{products.length} {products.length === 1 ? 'product' : 'products'}</span></div>
              <div className={styles.grid}>{products.map((product) => <ProductCard product={product} key={product.id} />)}</div>
            </section>
          ))}
        </div>
      ) : query ? (
        <section className={styles.empty}><h2>Try a broader search</h2><p>Check the spelling or search for a material such as thread, Kundan, beads, glue or pliers.</p><Link href="/#catalog">Browse all products</Link></section>
      ) : null}
    </main>
  );
}
