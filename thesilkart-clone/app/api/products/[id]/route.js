import { NextResponse } from 'next/server';
import { isAdmin } from '@/lib/admin-auth';
import { getServiceSupabase } from '@/lib/supabase-server';
import { revalidatePath, revalidateTag } from 'next/cache';
import { PRODUCT_CACHE_TAG } from '@/lib/catalog-server';
import { isDisallowedProduct } from '@/lib/disallowed-products';
import { getDefaultBanglePacks, isBangleBaseProduct } from '@/lib/pricing';

function editableFields(body) {
  const slug = body.name ? body.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '') : undefined;
  return {
    ...(body.name && { name: body.name.trim(), slug }), ...(body.price !== undefined && { price: Math.round(Number(body.price)) }),
    ...(body.mrp !== undefined && { mrp: body.mrp ? Math.round(Number(body.mrp)) : null }), ...(body.cat && { cat: body.cat }),
    ...(body.desc_text !== undefined && { desc_text: body.desc_text }), ...(body.tag !== undefined && { tag: body.tag }),
    ...(body.sizes && { sizes: body.sizes }), ...(body.image_url !== undefined && { image_url: body.image_url }),
    ...(body.meta_title !== undefined && { meta_title: body.meta_title }), ...(body.meta_description !== undefined && { meta_description: body.meta_description }),
    ...(body.alt_text !== undefined && { alt_text: body.alt_text }),
  };
}

export async function PUT(request, { params }) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const { id } = await params;
  const body = await request.json();
  const client = getServiceSupabase();
  const { data: existing } = await client.from('products').select('*').eq('id', id).maybeSingle();
  const fields = editableFields(body);
  const nextProduct = { ...existing, ...fields };
  if (isBangleBaseProduct(nextProduct) && (!Array.isArray(nextProduct.sizes) || !nextProduct.sizes.length)) fields.sizes = getDefaultBanglePacks(nextProduct);
  if (isDisallowedProduct({ ...existing, ...fields })) return NextResponse.json({ error: 'This product category is no longer supported.' }, { status: 400 });
  const { data, error } = await client.from('products').update(fields).eq('id', id).select().single();
  if (error) return NextResponse.json({ error: 'Unable to update product.' }, { status: error.code === 'PGRST116' ? 404 : 500 });
  revalidateTag(PRODUCT_CACHE_TAG, { expire: 0 });
  revalidatePath('/');
  revalidatePath('/api/catalog');
  revalidatePath('/sitemap.xml');
  if (existing?.slug) revalidatePath(`/products/${existing.slug}`);
  if (data?.slug) revalidatePath(`/products/${data.slug}`);
  revalidatePath('/products/[slug]', 'page');
  revalidatePath('/collections/[slug]', 'page');
  return NextResponse.json({ success: true, product: data });
}

export async function DELETE(_request, { params }) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const { id } = await params;
  const { error } = await getServiceSupabase().from('products').delete().eq('id', id);
  if (error) return NextResponse.json({ error: 'Unable to delete product.' }, { status: 500 });
  revalidateTag(PRODUCT_CACHE_TAG, { expire: 0 });
  revalidatePath('/');
  revalidatePath('/api/catalog');
  revalidatePath('/sitemap.xml');
  revalidatePath('/products/[slug]', 'page');
  return NextResponse.json({ success: true });
}
