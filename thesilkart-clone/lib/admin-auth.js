import crypto from 'node:crypto';
import { cookies } from 'next/headers';

const COOKIE_NAME = 'bbc_admin_session';
const SESSION_SECONDS = 60 * 60 * 8;

function signSession(expiry) {
  const secret = process.env.ADMIN_SESSION_SECRET;
  if (!secret) return null;
  return crypto.createHmac('sha256', secret).update(`bangle-by-choice-admin:${expiry}`).digest('hex');
}

function hash(value) {
  return crypto.createHash('sha256').update(String(value)).digest();
}

function safeEqual(left, right) {
  return left.length === right.length && crypto.timingSafeEqual(left, right);
}

export function validAdminPin(pin) {
  const expected = process.env.ADMIN_PIN;
  if (!expected || typeof pin !== 'string') return false;
  return safeEqual(hash(pin), hash(expected));
}

export async function isAdmin() {
  const cookieStore = await cookies();
  const actual = cookieStore.get(COOKIE_NAME)?.value || '';
  const [expiry, signature] = actual.split('.');
  const expiresAt = Number(expiry);
  if (!expiresAt || expiresAt <= Math.floor(Date.now() / 1000) || !signature) {
    if (actual) cookieStore.delete(COOKIE_NAME);
    return false;
  }
  const expected = signSession(expiry);
  return Boolean(expected && safeEqual(Buffer.from(signature), Buffer.from(expected)));
}

export async function setAdminSession() {
  const expiry = Math.floor(Date.now() / 1000) + SESSION_SECONDS;
  const signature = signSession(expiry);
  if (!signature) throw new Error('ADMIN_SESSION_SECRET is not configured');
  (await cookies()).set(COOKIE_NAME, `${expiry}.${signature}`, { httpOnly: true, sameSite: 'strict', secure: process.env.NODE_ENV === 'production', maxAge: SESSION_SECONDS, path: '/' });
}

export async function clearAdminSession() {
  (await cookies()).delete(COOKIE_NAME);
}
