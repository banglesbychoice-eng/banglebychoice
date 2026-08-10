import { NextResponse } from 'next/server';
import { revalidatePath } from 'next/cache';
import { isAdmin } from '@/lib/admin-auth';
import { getServiceSupabase } from '@/lib/supabase-server';

export async function GET() {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const { data, error } = await getServiceSupabase().from('product_reviews').select('*').order('created_at', { ascending: false }).limit(200);
  if (error) return NextResponse.json([]);
  return NextResponse.json(data || []);
}

export async function PATCH(request) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const { id, status } = await request.json();
  if (!id || !['approved', 'rejected', 'pending'].includes(status)) return NextResponse.json({ error: 'Invalid review update.' }, { status: 400 });
  const client = getServiceSupabase();
  const { data, error } = await client.from('product_reviews').update({ status }).eq('id', id).select('product_slug').single();
  if (error) return NextResponse.json({ error: 'Unable to update review.' }, { status: 500 });
  if (data?.product_slug) revalidatePath(`/products/${data.product_slug}`);
  return NextResponse.json({ success: true });
}

export async function DELETE(request) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const id = request.nextUrl.searchParams.get('id');
  if (!id) return NextResponse.json({ error: 'Missing review id.' }, { status: 400 });
  const client = getServiceSupabase();
  const { data } = await client.from('product_reviews').select('product_slug').eq('id', id).single();
  const { error } = await client.from('product_reviews').delete().eq('id', id);
  if (error) return NextResponse.json({ error: 'Unable to delete review.' }, { status: 500 });
  if (data?.product_slug) revalidatePath(`/products/${data.product_slug}`);
  return NextResponse.json({ success: true });
}
