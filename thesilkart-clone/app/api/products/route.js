import { NextResponse } from 'next/server';
import { isAdmin } from '@/lib/admin-auth';
import { getServiceSupabase } from '@/lib/supabase-server';
import { revalidatePath, revalidateTag } from 'next/cache';
import { getProductRows, PRODUCT_CACHE_TAG } from '@/lib/catalog-server';
import { isDisallowedProduct } from '@/lib/disallowed-products';

export async function GET() {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  try {
    return NextResponse.json(await getProductRows({ ascending: false }));
  } catch {
    return NextResponse.json({ error: 'Unable to load products.' }, { status: 500 });
  }
}

export async function POST(request) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  try {
    const body = await request.json();
    if (!body.name || !Number.isFinite(Number(body.price))) return NextResponse.json({ error: 'Name and valid price are required.' }, { status: 400 });
    const slug = body.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
    const product = {
      name: body.name.trim(), slug, price: Math.round(Number(body.price)), mrp: body.mrp ? Math.round(Number(body.mrp)) : null,
      cat: body.cat || 'Uncategorized', bg: body.bg || '#FDF2F8', emoji: body.emoji || '◇', desc_text: body.desc_text || '',
      tag: body.tag || '', sizes: body.sizes || [], image_url: body.image_url || null,
      meta_title: body.meta_title || `${body.name} | Bangle by Choice`, meta_description: body.meta_description || `Buy ${body.name} online at Bangle by Choice.`, alt_text: body.alt_text || body.name,
    };
    if (isDisallowedProduct(product)) return NextResponse.json({ error: 'This product category is no longer supported.' }, { status: 400 });
    const { data, error } = await getServiceSupabase().from('products').insert(product).select().single();
    if (error) throw error;
    revalidateTag(PRODUCT_CACHE_TAG, { expire: 0 });
    revalidatePath('/');
    revalidatePath('/api/catalog');
    revalidatePath('/sitemap.xml');
    revalidatePath('/products/[slug]', 'page');
    return NextResponse.json({ success: true, product: data });
  } catch (error) {
    console.error('POST /api/products failed:', error.code || error.message);
    return NextResponse.json({ error: 'Unable to add product.' }, { status: 500 });
  }
}
