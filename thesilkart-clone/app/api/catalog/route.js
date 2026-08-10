import { NextResponse } from 'next/server';
import { getCatalogProducts } from '@/lib/catalog-server';

export const dynamic = 'force-static';
export const revalidate = 300;

function catalogCard(product) {
  return {
    id: product.id,
    slug: product.slug,
    name: product.name,
    price: product.price,
    sale_price: product.sale_price,
    category: product.category,
    subcategory: product.subcategory,
    image: product.image,
    alt_text: product.alt_text,
    facets: product.facets,
    pack_prices: product.pack_prices,
  };
}

export async function GET() {
  const products = await getCatalogProducts();
  return NextResponse.json(products.map(catalogCard), { headers: { 'Cache-Control': 'public, max-age=60, s-maxage=300, stale-while-revalidate=86400' } });
}
