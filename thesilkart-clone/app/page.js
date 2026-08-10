import Storefront from '@/components/Storefront';
import { getCatalogProducts } from '@/lib/catalog-server';
import { absoluteUrl, jsonLd } from '@/lib/seo';
import { titleCase } from '@/lib/products';
import { groupProductsByDesign } from '@/lib/product-grouping';

export const revalidate = 300;

export default async function Home() {
  const products = await getCatalogProducts();
  const categories = [...new Set(products.map((product) => product.category))];
  const productGroups = categories.flatMap((category) => groupProductsByDesign(products.filter((product) => product.category === category)));
  const collectionGroups = productGroups
    .filter((group) => group.products.length > 1)
    .sort((a, b) => b.products.length - a.products.length)
    .slice(0, 24)
    .map((group) => ({ key: group.key, label: group.label, category: group.products[0]?.category || '', count: group.products.length }));
  const initialProducts = [...new Map([
    ...products.slice(0, 24),
    ...categories.map((category) => products.find((product) => product.category === category)),
  ].filter(Boolean).map((product) => [product.id, product])).values()];
  const itemListSchema = {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: 'Bangle by Choice product catalog',
    numberOfItems: products.length,
    itemListElement: products.slice(0, 30).map((product, index) => ({
      '@type': 'ListItem',
      position: index + 1,
      name: titleCase(product.name),
      url: absoluteUrl(`/products/${product.slug}`),
    })),
  };
  return <><script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(itemListSchema) }} /><Storefront initialProducts={initialProducts} categories={categories} collectionGroups={collectionGroups} totalProducts={products.length} seoProducts={products.slice(0, 30).map(({ id, name, slug }) => ({ id, name, slug }))} /></>;
}
