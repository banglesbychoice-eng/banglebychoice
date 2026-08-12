import { getDatabaseProducts } from '@/lib/catalog-server';
import { productGroupKey } from '@/lib/product-grouping';
import { absoluteUrl, premiumProductMetaDescription, siteName, siteUrl } from '@/lib/seo';
import { FREE_SHIPPING_MIN, SHIPPING_FEE, isBangleBoxProduct } from '@/lib/pricing';

function xml(value) {
  return String(value ?? '').replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll('"', '&quot;').replaceAll("'", '&apos;');
}

function googleProductCategory(product) {
  const text = `${product.category || ''} ${product.subcategory || ''} ${product.tag || ''}`.toLowerCase();
  if (text.includes('bead') || text.includes('pearl')) return '505382';
  if (text.includes('tool') || text.includes('plier') || text.includes('cutter')) return '503739';
  if (text.includes('thread') || text.includes('craft') || text.includes('material')) return '505370';
  return '505378';
}

function productMaterial(product) {
  const text = `${product.name || ''} ${product.type || ''} ${product.subcategory || ''}`.toLowerCase();
  return ['ceramic', 'glass', 'acrylic', 'pearl', 'silk thread', 'mdf'].find((material) => text.includes(material)) || '';
}

export async function GET() {
  const products = await getDatabaseProducts();
  const items = products.map((product) => {
    const images = product.images.map(absoluteUrl);
    const shippingFee = !isBangleBoxProduct(product) && product.sale_price >= FREE_SHIPPING_MIN ? 0 : SHIPPING_FEE;
    const material = productMaterial(product);
    return `<item>
      <g:id>${xml(product.id)}</g:id>
      <title>${xml(product.name)}</title>
      <description>${xml(premiumProductMetaDescription(product))}</description>
      <link>${xml(absoluteUrl(`/products/${product.slug}`))}</link>
      <g:image_link>${xml(images[0])}</g:image_link>
      ${images.slice(1, 10).map((image) => `<g:additional_image_link>${xml(image)}</g:additional_image_link>`).join('\n')}
      <g:availability>${product.availability === 'In Stock' ? 'in_stock' : 'out_of_stock'}</g:availability>
      <g:condition>new</g:condition>
      <g:price>${Number(product.price).toFixed(2)} INR</g:price>
      <g:sale_price>${Number(product.sale_price).toFixed(2)} INR</g:sale_price>
      <g:brand>${xml(siteName)}</g:brand>
      <g:product_type>${xml(product.category)} &gt; ${xml(product.subcategory)}</g:product_type>
      <g:google_product_category>${googleProductCategory(product)}</g:google_product_category>
      <g:item_group_id>${xml(productGroupKey(product))}</g:item_group_id>
      ${product.facets?.colours?.length ? `<g:color>${xml(product.facets.colours.join('/'))}</g:color>` : ''}
      ${material ? `<g:material>${xml(material)}</g:material>` : ''}
      <g:shipping><g:country>IN</g:country><g:service>Standard</g:service><g:price>${Number(shippingFee).toFixed(2)} INR</g:price></g:shipping>
      <g:identifier_exists>false</g:identifier_exists>
    </item>`;
  }).join('\n');
  const body = `<?xml version="1.0" encoding="UTF-8"?>
  <rss xmlns:g="http://base.google.com/ns/1.0" version="2.0"><channel><title>${xml(siteName)}</title><link>${xml(siteUrl)}</link><description>Silk thread bangle-making materials, Kundan stones, bangle bases, charms and tools delivered across India.</description>${items}</channel></rss>`;
  return new Response(body, { headers: { 'Content-Type': 'application/xml; charset=utf-8', 'Cache-Control': 'public, max-age=3600, stale-while-revalidate=86400' } });
}
