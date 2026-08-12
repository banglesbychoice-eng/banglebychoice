'use client';

import Image from 'next/image';
import Link from 'next/link';
import { memo, useCallback, useDeferredValue, useEffect, useMemo, useRef, useState } from 'react';
import { Heart } from 'lucide-react';
import { useCommerce } from './CommerceContext';
import QuickCartButton from './QuickCartButton';
import VoiceSearchButton from './VoiceSearchButton';
import styles from './Storefront.module.css';
import { scoreProduct } from '@/lib/product-search';
import { facetOptions, matchesFacets } from '@/lib/product-facets';
import { productGroupKey } from '@/lib/product-grouping';
import { catalogImage, categorySlug } from '@/lib/product-utils';
import { FREE_SHIPPING_MIN, formatSavingsAmount, getPackChoices } from '@/lib/pricing';

const PAGE_SIZE = 48;
const categoryImages = {
  'All Products': '/images/generated/banglebychoice-hero.webp',
  'Kundan Stones': '/images/kundan-stones/8k-eye-shape-glossy-white-kundans-hero-top-view-v2.webp',
  'Silk Thread Materials': '/images/silk-thread-materials/b-7000-glue-50ml_0.webp',
  'Jewellery Making': '/images/imitation-jewelery-material/2-hole-connectors-catalog-v6.webp',
};

function displayName(value = '') {
  return value.replace(/\b\w/g, (letter) => letter.toUpperCase());
}

const ProductTile = memo(function ProductTile({ product }) {
  const discount = Math.round(((product.price - product.sale_price) / product.price) * 100);
  const saveAmount = Math.max(0, Number(product.price) - Number(product.sale_price));
  const firstPack = getPackChoices(product)[0];
  const { toggleWishlist, isWishlisted } = useCommerce();

  return (
    <article className={styles.productTile}>
      <div className={styles.imageWrap}>
        <Link href={`/products/${product.slug}`} className={styles.imageLink}>
          <Image src={catalogImage(product.image)} alt={product.alt_text || `${product.name} for jewellery making`} fill sizes="(max-width: 760px) 47vw, (max-width: 1200px) 30vw, 21vw" className={styles.productImage} quality={75} />
          {discount > 0 && <span className={styles.discount}>{discount}% off</span>}
        </Link>
        <button className={styles.heart} onClick={() => toggleWishlist(product)} aria-label="Save to wishlist"><Heart aria-hidden="true" fill={isWishlisted(product.id) ? 'currentColor' : 'none'} /></button>
      </div>
      <div className={styles.productMeta}>
        <p>{product.subcategory}</p>
        <Link href={`/products/${product.slug}`}><h3>{displayName(product.name)}</h3></Link>
        <div className={styles.priceRow}>
          <strong>₹{product.sale_price}</strong>
          {product.price !== product.sale_price && <del>₹{product.price}</del>}
          {saveAmount ? <span>Save ₹{formatSavingsAmount(saveAmount)}</span> : null}
        </div>
        {firstPack ? <p className={styles.packHint}>Starting pack: {firstPack}</p> : null}
        <QuickCartButton product={product} />
      </div>
    </article>
  );
});

export default function Storefront({ initialProducts, categories, collectionGroups = [], totalProducts, initialQuery = '', seoProducts = [] }) {
  const [catalogProducts, setCatalogProducts] = useState(initialProducts);
  const [activeCollection, setActiveCollection] = useState('all');
  const [query, setQuery] = useState(initialQuery);
  const [sort, setSort] = useState('featured');
  const [page, setPage] = useState(1);
  const [colour, setColour] = useState('');
  const [shape, setShape] = useState('');
  const [size, setSize] = useState('');
  const [catalogLoaded, setCatalogLoaded] = useState(initialProducts.length >= totalProducts);
  const [catalogLoading, setCatalogLoading] = useState(false);
  const [catalogError, setCatalogError] = useState(false);
  const catalogRequest = useRef(null);

  const deferredCollection = useDeferredValue(activeCollection);
  const deferredQuery = useDeferredValue(query);
  const deferredColour = useDeferredValue(colour);
  const deferredShape = useDeferredValue(shape);
  const deferredSize = useDeferredValue(size);
  const filtersPending = deferredCollection !== activeCollection
    || deferredQuery !== query
    || deferredColour !== colour
    || deferredShape !== shape
    || deferredSize !== size;

  const loadCatalog = useCallback(() => {
    if (catalogLoaded) return catalogRequest.current || Promise.resolve(catalogProducts);
    if (!catalogRequest.current) {
      setCatalogLoading(true);
      setCatalogError(false);
      catalogRequest.current = fetch('/api/catalog')
        .then((response) => response.ok ? response.json() : Promise.reject(new Error('Catalog unavailable')))
        .then((catalog) => {
          setCatalogProducts(catalog);
          setCatalogLoaded(true);
          return catalog;
        })
        .catch(() => {
          catalogRequest.current = null;
          setCatalogError(true);
          return null;
        })
        .finally(() => setCatalogLoading(false));
    }
    return catalogRequest.current;
  }, [catalogLoaded, catalogProducts]);

  useEffect(() => {
    if (catalogLoaded) return undefined;
    const schedule = window.requestIdleCallback
      ? window.requestIdleCallback(() => loadCatalog(), { timeout: 1200 })
      : window.setTimeout(loadCatalog, 600);
    return () => window.requestIdleCallback ? window.cancelIdleCallback(schedule) : window.clearTimeout(schedule);
  }, [catalogLoaded, loadCatalog]);

  useEffect(() => {
    if (catalogLoaded || catalogLoading) return undefined;
    const catalog = document.getElementById('catalog');
    if (!catalog || !('IntersectionObserver' in window)) {
      loadCatalog();
      return undefined;
    }
    const observer = new IntersectionObserver(([entry]) => {
      if (entry.isIntersecting) {
        loadCatalog();
        observer.disconnect();
      }
    }, { rootMargin: '500px 0px' });
    observer.observe(catalog);
    return () => observer.disconnect();
  }, [catalogLoaded, catalogLoading, loadCatalog]);

  const filteredProducts = useMemo(() => {
    const normalizedQuery = deferredQuery.trim().toLowerCase();
    const result = catalogProducts.filter((product) => {
      const inCollection = deferredCollection === 'all' || productGroupKey(product) === deferredCollection;
      const matchesQuery = !normalizedQuery || scoreProduct(product, normalizedQuery) > 0;
      return inCollection && matchesQuery && matchesFacets(product, { colour: deferredColour, shape: deferredShape, size: deferredSize });
    });

    if (sort === 'low') return [...result].sort((a, b) => a.sale_price - b.sale_price);
    if (sort === 'high') return [...result].sort((a, b) => b.sale_price - a.sale_price);
    if (sort === 'name') return [...result].sort((a, b) => a.name.localeCompare(b.name));
    return result;
  }, [catalogProducts, deferredCollection, deferredColour, deferredQuery, deferredShape, deferredSize, sort]);

  const availableFacets = useMemo(() => facetOptions(catalogProducts.filter((product) => {
    const inCollection = deferredCollection === 'all' || productGroupKey(product) === deferredCollection;
    return inCollection && (!deferredQuery.trim() || scoreProduct(product, deferredQuery) > 0);
  })), [catalogProducts, deferredCollection, deferredQuery]);

  const visibleProducts = useMemo(() => filteredProducts.slice(0, page * PAGE_SIZE), [filteredProducts, page]);
  const catalogTotal = catalogLoaded ? filteredProducts.length : totalProducts;
  const browseCollections = [{ key: 'all', label: 'All Products', category: 'All materials', count: totalProducts }, ...collectionGroups];
  const activeCollectionLabel = browseCollections.find((collection) => collection.key === activeCollection)?.label || 'All Products';

  function changeCollection(collectionKey) {
    if (!catalogLoaded) loadCatalog();
    setActiveCollection(collectionKey);
    setPage(1);
    setColour('');
    setShape('');
    setSize('');
  }

  function updateQuery(value) {
    if (value.trim() && !catalogLoaded) loadCatalog();
    setQuery(value);
    setPage(1);
  }

  function clearFacets() {
    setColour('');
    setShape('');
    setSize('');
    setPage(1);
  }

  return (
    <>
      <section className={styles.hero}>
        <div className={styles.heroBackdrop}>
          <Image src="/images/generated/banglebychoice-hero.webp" alt="Premium kundan stones and bangle-making materials from Bangle by Choice" fill priority fetchPriority="high" sizes="100vw" quality={75} className={styles.heroBackdropImage} />
        </div>
        <div className={styles.heroContent}>
          <p className={styles.eyebrow}>India’s craft supply destination</p>
          <h1>Bangle by Choice: Kundan Stones &amp; Jewellery-Making Materials</h1>
          <p className={styles.heroCopy}>Premium bangle, kundan and jewellery-making materials—now curated by Bangle by Choice.</p>
          <Link href="/collections/silk-thread-materials">Shop bangle materials</Link>
        </div>
      </section>

      <section className={styles.mobileHeroSearch} aria-label="Search products">
        <div>
          <input aria-label="Search products" value={query} onChange={(event) => updateQuery(event.target.value)} placeholder={`Search ${totalProducts} products`} />
          <VoiceSearchButton className={styles.mobileVoiceButton} onTranscript={updateQuery} onFinal={updateQuery} label="" />
        </div>
      </section>

      <section className={styles.categoryRail} aria-label="Shop categories">
        {['All Products', ...categories].map((category) => {
          const categoryProduct = category === 'All Products' ? catalogProducts[0] : catalogProducts.find((product) => product.category === category);
          const categoryImage = catalogImage(categoryImages[category] || categoryProduct?.image || '/images/generated/banglebychoice-hero.webp');
          return (
            <Link key={category} href={category === 'All Products' ? '/#catalog' : `/collections/${categorySlug(category)}`}>
              <span className={styles.categoryImage}><Image src={categoryImage} alt={`${category} jewellery-making materials`} fill sizes="100px" quality={75} /></span>
              <span>{category}</span>
            </Link>
          );
        })}
      </section>

      <section className={styles.promiseStrip}>
        <span><b>{totalProducts}</b> products available</span><span><b>24-hour</b> dispatch</span><span><b>Secure</b> online shopping</span><span><b>India-wide</b> delivery</span>
      </section>

      <section className={styles.catalog} id="catalog">
        <aside className={styles.filters}>
          <p className={styles.filterLabel}>Browse collection</p><h2>Shop materials</h2>
          <div className={styles.filterList}>
            {browseCollections.map((collection) => (
              <button key={collection.key} onClick={() => changeCollection(collection.key)} className={activeCollection === collection.key ? styles.activeFilter : ''}>
                <span><b>{collection.label}</b>{collection.key !== 'all' ? <em>{collection.category}</em> : null}</span><small>{collection.count}</small>
              </button>
            ))}
          </div>
          <div className={styles.facets}><p className={styles.filterLabel}>Refine materials</p><label>Colour<select value={colour} onChange={(event) => { setColour(event.target.value); setPage(1); }}><option value="">All colours</option>{availableFacets.colours.map((option) => <option key={option}>{option}</option>)}</select></label><label>Shape<select value={shape} onChange={(event) => { setShape(event.target.value); setPage(1); }}><option value="">All shapes</option>{availableFacets.shapes.map((option) => <option key={option}>{option}</option>)}</select></label><label>Size / pack<select value={size} onChange={(event) => { setSize(event.target.value); setPage(1); }}><option value="">All sizes</option>{availableFacets.sizes.map((option) => <option key={option}>{option}</option>)}</select></label>{(colour || shape || size) && <button onClick={clearFacets}>Clear filters</button>}</div>
          <div className={styles.deliveryNote}><span>Free shipping</span><p>On orders from ₹{FREE_SHIPPING_MIN} across India. Bangle boxes are charged by weight.</p></div>
        </aside>

        <div className={styles.productArea} aria-busy={catalogLoading || filtersPending}>
          <div className={styles.catalogHead}>
            <div><p>{activeCollectionLabel}</p><h2>{catalogTotal} products</h2><span className={styles.resultSummary}>{catalogLoaded ? `Showing ${visibleProducts.length} of ${filteredProducts.length}` : `Loading all ${totalProducts} products...`}</span></div>
            <div className={styles.catalogTools}>
              <label><span>Search</span><div className={styles.searchBox}><input aria-label="Search catalog products" value={query} onChange={(event) => updateQuery(event.target.value)} placeholder="Search 6K eye, 3mm round, silk thread..." /><VoiceSearchButton className={styles.inlineVoiceButton} onTranscript={updateQuery} onFinal={updateQuery} label="Mic" /></div></label>
              <label><span>Sort by</span><select value={sort} onChange={(event) => setSort(event.target.value)}><option value="featured">Featured</option><option value="low">Price: low to high</option><option value="high">Price: high to low</option><option value="name">Name</option></select></label>
            </div>
          </div>
          <div className={styles.mobileSearch}>
            <input aria-label="Search products" value={query} onChange={(event) => updateQuery(event.target.value)} placeholder={`Search ${totalProducts} products`} />
            <VoiceSearchButton className={styles.mobileVoiceButton} onTranscript={updateQuery} onFinal={updateQuery} label="Mic" />
            <select value={sort} onChange={(event) => setSort(event.target.value)} aria-label="Sort products"><option value="featured">Featured</option><option value="low">Price ↑</option><option value="high">Price ↓</option></select>
          </div>
          <div className={styles.mobileFacets}><select className={styles.collectionSelect} aria-label="Browse collection" value={activeCollection} onChange={(event) => changeCollection(event.target.value)}>{browseCollections.map((collection) => <option key={collection.key} value={collection.key}>{collection.label} ({collection.count})</option>)}</select><select aria-label="Filter by colour" value={colour} onChange={(event) => { setColour(event.target.value); setPage(1); }}><option value="">Colour</option>{availableFacets.colours.map((option) => <option key={option}>{option}</option>)}</select><select aria-label="Filter by shape" value={shape} onChange={(event) => { setShape(event.target.value); setPage(1); }}><option value="">Shape</option>{availableFacets.shapes.map((option) => <option key={option}>{option}</option>)}</select><select aria-label="Filter by size" value={size} onChange={(event) => { setSize(event.target.value); setPage(1); }}><option value="">Size</option>{availableFacets.sizes.map((option) => <option key={option}>{option}</option>)}</select>{(colour || shape || size || activeCollection !== 'all') && <button onClick={() => { setActiveCollection('all'); clearFacets(); }}>Clear</button>}</div>
          {(catalogLoading || filtersPending) && <div className={styles.catalogStatus} role="status" aria-live="polite"><span />{catalogLoading ? 'Loading the full catalog…' : 'Updating products…'}</div>}
          {catalogError && !catalogLoaded && <div className={styles.catalogError} role="alert"><span>Could not load every product.</span><button onClick={loadCatalog}>Retry</button></div>}
          {visibleProducts.length ? <div className={styles.productGrid}>{visibleProducts.map((product) => <ProductTile product={product} key={product.id} />)}</div> : <div className={styles.emptyState}><h3>No products found</h3><p>Try a different spelling or browse another category.</p></div>}
          {visibleProducts.length < filteredProducts.length && <div className={styles.pagination}><button onClick={() => setPage((current) => current + 1)}>Load more products</button><span>Showing {visibleProducts.length} of {filteredProducts.length}</span></div>}
        </div>
      </section>

      <section className={styles.seoProductLinks} aria-label="Popular product links">
        <h2>Popular jewellery-making materials</h2>
        <div>{seoProducts.map((product) => <Link key={product.id} href={`/products/${product.slug}`}>{displayName(product.name)}</Link>)}</div>
      </section>

    </>
  );
}
