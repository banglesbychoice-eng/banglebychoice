import { NextResponse } from 'next/server';
import { normalizeDatabaseProduct } from '@/lib/catalog-server';
import { rateLimit, requestIp } from '@/lib/rate-limit';
import { getServiceSupabase } from '@/lib/supabase-server';

export async function POST(request) {
  try {
    const limit = rateLimit(`track:${requestIp(request)}`, { limit: 20, windowMs: 10 * 60_000 });
    if (limit.limited) return NextResponse.json({ error: 'Too many tracking attempts. Please try again shortly.' }, { status: 429 });
    const body = await request.json();
    const orderNumber = String(body.orderNumber || '').trim().toUpperCase();
    const mobile = String(body.mobile || '').replace(/\D/g, '').slice(-10);
    if (!/^BBC-\d{6}-[A-Z0-9]{8}$/.test(orderNumber) || !/^\d{10}$/.test(mobile)) return NextResponse.json({ error: 'Enter a valid order number and 10-digit mobile number.' }, { status: 400 });

    const supabase = getServiceSupabase();
    const { data: order, error } = await supabase.from('orders').select('id,order_number,status,payment_status,subtotal,shipping,total,created_at,order_items(product_id,product_slug,product_name,image_url,pack_size,quantity,unit_price,line_total)').eq('order_number', orderNumber).eq('customer_mobile', mobile).maybeSingle();
    if (error) throw error;
    if (!order) return NextResponse.json({ error: 'No matching order was found. Check the order number and mobile number.' }, { status: 404 });

    const productIds = [...new Set(order.order_items.map((item) => item.product_id))];
    const { data: rows } = productIds.length ? await supabase.from('products').select('*').in('id', productIds) : { data: [] };
    const currentProducts = (rows || []).map(normalizeDatabaseProduct).filter((product) => product.status !== 'draft' && product.availability !== 'Out of Stock');
    const currentById = new Map(currentProducts.map((product) => [String(product.id), product]));
    const reorderItems = order.order_items.map((item) => {
      const product = currentById.get(String(item.product_id));
      return product ? { product, packSize: item.pack_size || '', quantity: item.quantity } : null;
    }).filter(Boolean);

    return NextResponse.json({
      order: {
        number: order.order_number, status: order.status, paymentStatus: order.payment_status,
        subtotal: Number(order.subtotal), shipping: Number(order.shipping), total: Number(order.total),
        createdAt: order.created_at,
        items: order.order_items.map((item) => ({ name: item.product_name, slug: item.product_slug, image: item.image_url, packSize: item.pack_size, quantity: item.quantity, lineTotal: Number(item.line_total) })),
      },
      reorderItems,
    });
  } catch (error) {
    console.error('Order tracking failed:', error.message);
    return NextResponse.json({ error: 'Unable to retrieve the order right now.' }, { status: 500 });
  }
}
