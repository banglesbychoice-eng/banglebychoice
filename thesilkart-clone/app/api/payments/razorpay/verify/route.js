import { createHmac, timingSafeEqual } from 'node:crypto';
import { NextResponse } from 'next/server';
import { rateLimit, requestIp } from '@/lib/rate-limit';
import { getServiceSupabase } from '@/lib/supabase-server';

function validSignature(orderId, paymentId, signature, secret) {
  const expected = createHmac('sha256', secret).update(`${orderId}|${paymentId}`).digest('hex');
  const expectedBuffer = Buffer.from(expected);
  const receivedBuffer = Buffer.from(String(signature || ''));
  return expectedBuffer.length === receivedBuffer.length && timingSafeEqual(expectedBuffer, receivedBuffer);
}

export async function POST(request) {
  try {
    const limit = rateLimit(`razorpay:${requestIp(request)}`, { limit: 15, windowMs: 10 * 60_000 });
    if (limit.limited) return NextResponse.json({ error: 'Too many verification attempts.' }, { status: 429 });
    const secret = process.env.RAZORPAY_KEY_SECRET;
    const keyId = process.env.NEXT_PUBLIC_RAZORPAY_KEY_ID;
    if (!secret || !keyId) return NextResponse.json({ error: 'Razorpay is not configured.' }, { status: 503 });
    const body = await request.json();
    if (!body.localOrderId || !body.razorpay_order_id || !body.razorpay_payment_id || !body.razorpay_signature) return NextResponse.json({ error: 'Missing payment verification details.' }, { status: 400 });
    if (!validSignature(body.razorpay_order_id, body.razorpay_payment_id, body.razorpay_signature, secret)) return NextResponse.json({ error: 'Payment signature did not match.' }, { status: 400 });

    const supabase = getServiceSupabase();
    const { data: order } = await supabase.from('orders').select('id,notes,total').eq('id', body.localOrderId).maybeSingle();
    if (!order || !order.notes?.includes(`Razorpay order: ${body.razorpay_order_id}`)) return NextResponse.json({ error: 'Order could not be matched.' }, { status: 404 });

    const authorization = Buffer.from(`${keyId}:${secret}`).toString('base64');
    const paymentResponse = await fetch(`https://api.razorpay.com/v1/payments/${encodeURIComponent(body.razorpay_payment_id)}`, { headers: { Authorization: `Basic ${authorization}` }, cache: 'no-store' });
    const payment = await paymentResponse.json();
    if (!paymentResponse.ok || payment.order_id !== body.razorpay_order_id || Number(payment.amount) !== Math.round(Number(order.total) * 100)) return NextResponse.json({ error: 'Payment details could not be confirmed.' }, { status: 400 });

    const paid = payment.status === 'captured';
    await supabase.from('orders').update({ payment_status: paid ? 'paid' : 'pending', status: paid ? 'confirmed' : 'pending' }).eq('id', order.id);
    return NextResponse.json({ success: true, paid, status: payment.status });
  } catch (error) {
    console.error('Razorpay verification failed:', error.message);
    return NextResponse.json({ error: 'Unable to verify payment.' }, { status: 500 });
  }
}
