import { NextResponse } from 'next/server';
import { getServerSupabase, getServiceSupabase } from '@/lib/supabase-server';
import { rateLimit, requestIp } from '@/lib/rate-limit';
import { rawSlugCandidates } from '@/lib/products';

function clean(value, max = 600) {
  return String(value || '').trim().replace(/\s+/g, ' ').slice(0, max);
}

export async function GET(request) {
  const slug = request.nextUrl.searchParams.get('slug');
  if (!slug) return NextResponse.json([]);
  const { data, error } = await getServerSupabase().from('product_reviews').select('id,author_name,rating,review_text,created_at').eq('product_slug', slug).eq('status', 'approved').order('created_at', { ascending: false }).limit(50);
  if (error) return NextResponse.json([]);
  return NextResponse.json(data || [], { headers: { 'Cache-Control': 'public, max-age=60, s-maxage=300' } });
}

export async function POST(request) {
  const body = await request.json().catch(() => null);
  if (clean(body?.website || body?.company || body?.url, 120)) return NextResponse.json({ success: true });
  const limit = rateLimit(`review:${requestIp(request)}`, { limit: 3, windowMs: 10 * 60_000 });
  if (limit.limited) return NextResponse.json({ error: 'Too many review attempts. Please try again shortly.' }, { status: 429, headers: { 'Retry-After': String(Math.ceil(limit.retryAfter / 1000)) } });
  const rating = Number(body?.rating);
  const review = {
    product_slug: clean(body?.productSlug, 120),
    product_name: clean(body?.productName, 180),
    author_name: clean(body?.name, 80),
    rating,
    review_text: clean(body?.review, 600),
    status: 'pending',
  };
  if (!review.product_slug || !review.product_name || !review.author_name || !Number.isInteger(rating) || rating < 1 || rating > 5 || review.review_text.length < 10) return NextResponse.json({ error: 'Please add your name, rating and a short review.' }, { status: 400 });
  try {
    const client = getServiceSupabase();
    const { data: product, error: productError } = await client.from('products').select('slug,name').in('slug', rawSlugCandidates(review.product_slug)).limit(1).maybeSingle();
    if (productError) throw productError;
    if (!product) return NextResponse.json({ error: 'This product is not available for reviews.' }, { status: 404 });
    const { error } = await client.from('product_reviews').insert({ ...review, product_slug: product.slug, product_name: clean(product.name || review.product_name, 180) });
    if (error) throw error;
    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Review submission failed:', error.code || error.message);
    return NextResponse.json({ error: 'Reviews are being set up. Please try again later.' }, { status: 503 });
  }
}
