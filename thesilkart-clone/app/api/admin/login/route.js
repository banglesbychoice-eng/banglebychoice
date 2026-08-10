import { NextResponse } from 'next/server';
import { setAdminSession, validAdminPin } from '@/lib/admin-auth';
import { rateLimit, requestIp } from '@/lib/rate-limit';

export async function POST(request) {
  const limit = rateLimit(`admin-login:${requestIp(request)}`, { limit: 5, windowMs: 10 * 60_000 });
  if (limit.limited) return NextResponse.json({ error: 'Too many login attempts. Try again later.' }, { status: 429, headers: { 'Retry-After': String(Math.ceil(limit.retryAfter / 1000)) } });

  const { pin } = await request.json();
  if (!validAdminPin(pin)) return NextResponse.json({ error: 'Invalid admin PIN' }, { status: 401 });
  try {
    await setAdminSession();
    return NextResponse.json({ success: true });
  } catch {
    return NextResponse.json({ error: 'Admin security variables are not configured.' }, { status: 503 });
  }
}
