import { categorySlug } from '@/lib/products';
import { getCatalogProducts } from '@/lib/catalog-server';
import { siteUrl as baseUrl } from '@/lib/seo';
import { guides } from '@/lib/guides';
import { departmentProducts, storeDepartments } from '@/lib/store-departments';

function latestProductDate(products, fallback) {
  const timestamps = products.map((product) => new Date(product.updated_at || fallback).getTime()).filter(Number.isFinite);
  return timestamps.length ? new Date(Math.max(...timestamps)) : fallback;
}

export default async function sitemap() {
  const products = await getCatalogProducts();
  const categories = [...new Set(products.map((product) => product.category))];
  const lastModified = new Date();
  return [
    { url: baseUrl, lastModified },
    { url: `${baseUrl}/guides`, lastModified },
    { url: `${baseUrl}/offers`, lastModified },
    { url: `${baseUrl}/wholesale`, lastModified },
    ...guides.map((guide) => ({ url: `${baseUrl}/guides/${guide.slug}`, lastModified, images: [new URL(guide.image, baseUrl).toString()] })),
    ...['shipping', 'returns', 'order-help', 'faq', 'contact', 'about', 'privacy', 'terms'].map((slug) => ({ url: `${baseUrl}/help/${slug}`, lastModified })),
    ...storeDepartments.map((department) => ({ url: `${baseUrl}/collections/${department.slug}`, lastModified: latestProductDate(departmentProducts(products, department.slug), lastModified) })),
    ...categories.map((category) => ({ url: `${baseUrl}/collections/${categorySlug(category)}`, lastModified: latestProductDate(products.filter((product) => product.category === category), lastModified) })),
    ...products.map((product) => ({ url: `${baseUrl}/products/${product.slug}`, lastModified: new Date(product.updated_at || lastModified), images: [new URL(product.image, baseUrl).toString()] })),
  ];
}
