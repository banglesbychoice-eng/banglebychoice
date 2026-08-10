const buckets = new Map();

export function rateLimit(key, { limit = 10, windowMs = 60_000 } = {}) {
  const now = Date.now();
  const bucket = buckets.get(key);

  if (!bucket || bucket.resetAt <= now) {
    buckets.set(key, { count: 1, resetAt: now + windowMs });
    return { limited: false, retryAfter: windowMs };
  }

  bucket.count += 1;
  return { limited: bucket.count > limit, retryAfter: Math.max(0, bucket.resetAt - now) };
}

export function requestIp(request) {
  return (request.headers.get('x-forwarded-for') || request.headers.get('x-real-ip') || 'unknown').split(',')[0].trim();
}
