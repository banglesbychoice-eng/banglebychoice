import { NextResponse } from 'next/server';
import { isAdmin } from '@/lib/admin-auth';
import { normalizeDatabaseProduct } from '@/lib/catalog-server';
import { DELIVERY_METHODS, getDeliveryDetails } from '@/lib/delivery';
import { formatSavingsAmount, getAvailablePackChoices, getPackChoices, getPackPrice, getShippingQuote, isPackChoiceAvailable } from '@/lib/pricing';
import { rateLimit, requestIp } from '@/lib/rate-limit';
import { getServiceSupabase } from '@/lib/supabase-server';

const PAYMENT_METHODS = new Set(['upi', 'razorpay']);
const ORDER_STATUSES = new Set(['pending', 'confirmed', 'packed', 'shipped', 'delivered', 'cancelled']);
const PAYMENT_STATUSES = new Set(['pending', 'paid', 'failed', 'refunded']);

function clean(value, max = 300) {
  return String(value || '').trim().slice(0, max);
}

function validateOrder(body) {
  const { customer, items } = body || {};
  if (body.deliveryMethod && !DELIVERY_METHODS[body.deliveryMethod]) return 'Please choose a valid delivery method.';
  const delivery = getDeliveryDetails(body.deliveryMethod);
  if (!customer?.name || !/^\d{10}$/.test(customer.mobile || '')) return 'Please provide your name and 10-digit mobile number.';
  if (delivery.requiresAddress && (!customer.address || !customer.city || !customer.state || !/^\d{6}$/.test(customer.postalCode || ''))) return 'Please provide complete delivery details.';
  if (!PAYMENT_METHODS.has(body.paymentMethod)) return 'Please choose a valid payment method.';
  if (!Array.isArray(items) || !items.length || items.length > 50) return 'Your cart is empty or too large.';
  if (items.some((item) => !item.id || !Number.isInteger(item.quantity) || item.quantity < 1 || item.quantity > 50)) return 'One or more cart items are invalid.';
  return null;
}

function makeOrderNumber() {
  const date = new Date().toISOString().slice(2, 10).replaceAll('-', '');
  const token = crypto.randomUUID().replaceAll('-', '').slice(0, 8).toUpperCase();
  return `BBC-${date}-${token}`;
}

async function createRazorpayOrder(orderNumber, total) {
  const keyId = process.env.NEXT_PUBLIC_RAZORPAY_KEY_ID;
  const secret = process.env.RAZORPAY_KEY_SECRET;
  if (!keyId || !secret) throw new Error('Razorpay is not configured.');
  const authorization = Buffer.from(`${keyId}:${secret}`).toString('base64');
  const response = await fetch('https://api.razorpay.com/v1/orders', {
    method: 'POST',
    headers: { Authorization: `Basic ${authorization}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ amount: Math.round(total * 100), currency: 'INR', receipt: orderNumber, notes: { local_order: orderNumber } }),
    cache: 'no-store',
  });
  const data = await response.json();
  if (!response.ok || !data.id) throw new Error(data.error?.description || 'Unable to start Razorpay checkout.');
  return data.id;
}

export async function GET() {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const { data, error } = await getServiceSupabase().from('orders').select('*, order_items(*)').order('created_at', { ascending: false }).limit(200);
  if (error) return NextResponse.json({ error: 'Unable to load orders.' }, { status: 500 });
  return NextResponse.json(data);
}

export async function PATCH(request) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  try {
    const body = await request.json();
    const id = clean(body.id, 80);
    const updates = {};
    if (!id) return NextResponse.json({ error: 'Order ID is required.' }, { status: 400 });
    if (body.status !== undefined) {
      if (!ORDER_STATUSES.has(body.status)) return NextResponse.json({ error: 'Invalid order status.' }, { status: 400 });
      updates.status = body.status;
    }
    if (body.paymentStatus !== undefined) {
      if (!PAYMENT_STATUSES.has(body.paymentStatus)) return NextResponse.json({ error: 'Invalid payment status.' }, { status: 400 });
      updates.payment_status = body.paymentStatus;
    }
    if (!Object.keys(updates).length) return NextResponse.json({ error: 'Choose a status to update.' }, { status: 400 });
    const { data, error } = await getServiceSupabase().from('orders').update(updates).eq('id', id).select('id,status,payment_status').single();
    if (error) throw error;
    return NextResponse.json(data);
  } catch (error) {
    console.error('Order status update failed:', error.message);
    return NextResponse.json({ error: 'Unable to update the order.' }, { status: 500 });
  }
}

export async function POST(request) {
  let createdOrderId = null;
  try {
    const limit = rateLimit(`order:${requestIp(request)}`, { limit: 12, windowMs: 10 * 60_000 });
    if (limit.limited) return NextResponse.json({ error: 'Too many order attempts. Please try again shortly.' }, { status: 429, headers: { 'Retry-After': String(Math.ceil(limit.retryAfter / 1000)) } });

    const body = await request.json();
    const validationError = validateOrder(body);
    if (validationError) return NextResponse.json({ error: validationError }, { status: 400 });
    const delivery = getDeliveryDetails(body.deliveryMethod);

    const supabase = getServiceSupabase();
    const requestedIds = [...new Set(body.items.map((item) => String(item.id)))];
    const { data: rows, error: productError } = await supabase.from('products').select('*').in('id', requestedIds);
    if (productError) throw productError;
    const products = (rows || []).map(normalizeDatabaseProduct);
    const byId = new Map(products.map((product) => [String(product.id), product]));
    if (byId.size !== requestedIds.length) return NextResponse.json({ error: 'One or more products are no longer available.' }, { status: 409 });

    const items = body.items.map((item) => {
      const product = byId.get(String(item.id));
      if (product.status === 'draft' || product.availability === 'Out of Stock') throw new Error(`${product.name} is no longer available.`);
      const choices = getPackChoices(product);
      const availableChoices = getAvailablePackChoices(product);
      if (item.packSize && !choices.includes(item.packSize)) throw new Error(`${product.name} has an invalid size or pack selection.`);
      const packSize = item.packSize || availableChoices[0] || '';
      if (choices.length > 0 && !isPackChoiceAvailable(product, packSize)) throw new Error(`${product.name} in ${packSize || 'the selected size'} is no longer available.`);
      const unitPrice = getPackPrice(product, packSize);
      return {
        id: String(product.id), slug: product.slug, name: product.name, image: product.image,
        category: product.category, type: product.type, packSize, quantity: item.quantity,
        unitPrice, shippingWeightGrams: product.shipping_weight_grams,
      };
    });
    const subtotal = items.reduce((sum, item) => sum + item.unitPrice * item.quantity, 0);
    const shippingQuote = getShippingQuote(items, subtotal);
    const shipping = delivery.requiresAddress ? shippingQuote.fee : 0;
    const total = subtotal + shipping;
    const orderNumber = makeOrderNumber();
    const paymentLabel = body.paymentMethod === 'razorpay' ? 'Razorpay' : 'Direct UPI';
    const customerNotes = clean(body.customer.notes, 500);
    const notes = [
      `Payment method: ${paymentLabel}`,
      `Delivery method: ${delivery.label}`,
      delivery.requiresAddress ? `Calculated delivery: Rs ${shippingQuote.regularFee}` : '',
      delivery.requiresAddress && shippingQuote.deliveryDiscount ? `Free-shipping deduction: Rs ${formatSavingsAmount(shippingQuote.deliveryDiscount)}` : '',
      delivery.method === 'customer_arranged' ? 'Pickup service charge is arranged and paid directly by the customer.' : '',
      customerNotes,
    ].filter(Boolean).join('\n');

    const { data: order, error: orderError } = await supabase.from('orders').insert({
      order_number: orderNumber,
      customer_name: clean(body.customer.name, 100), customer_mobile: body.customer.mobile,
      customer_email: clean(body.customer.email, 160) || null,
       address: delivery.requiresAddress ? clean(body.customer.address, 400) : delivery.label,
       city: delivery.requiresAddress ? clean(body.customer.city, 100) : '',
       state: delivery.requiresAddress ? clean(body.customer.state, 100) : '',
       postal_code: delivery.requiresAddress ? body.customer.postalCode : '',
      notes, subtotal, shipping, total,
    }).select('id,order_number').single();
    if (orderError) throw orderError;
    createdOrderId = order.id;

    const { error: itemError } = await supabase.from('order_items').insert(items.map((item) => ({
      order_id: order.id, product_id: item.id, product_slug: item.slug, product_name: item.name,
      image_url: item.image, pack_size: item.packSize || null, quantity: item.quantity,
      unit_price: item.unitPrice, line_total: item.unitPrice * item.quantity,
    })));
    if (itemError) throw itemError;

    let razorpayOrderId = null;
    if (body.paymentMethod === 'razorpay') {
      razorpayOrderId = await createRazorpayOrder(orderNumber, total);
      await supabase.from('orders').update({ notes: `${notes}\nRazorpay order: ${razorpayOrderId}` }).eq('id', order.id);
    }

    return NextResponse.json({
      success: true, orderId: order.id, orderNumber: order.order_number, subtotal, shipping, total,
      deliveryMethod: delivery.method,
      deliveryLabel: delivery.label,
      deliveryCharge: delivery.requiresAddress ? shippingQuote.regularFee : 0,
      deliveryDiscount: delivery.requiresAddress ? shippingQuote.deliveryDiscount : 0,
      items: items.map((item) => ({
        name: item.name,
        packSize: item.packSize || 'Standard',
        quantity: item.quantity,
        unitPrice: item.unitPrice,
        lineTotal: item.unitPrice * item.quantity,
      })),
      razorpay: razorpayOrderId ? { key: process.env.NEXT_PUBLIC_RAZORPAY_KEY_ID, orderId: razorpayOrderId } : null,
    });
  } catch (error) {
    if (createdOrderId) await getServiceSupabase().from('orders').delete().eq('id', createdOrderId);
    console.error('POST /api/orders failed:', error.message);
    const availabilityError = /(?:no longer available|invalid size or pack selection)/i.test(error.message || '');
    return NextResponse.json({ error: availabilityError ? error.message : 'Unable to process the order.' }, { status: availabilityError ? 409 : 500 });
  }
}
