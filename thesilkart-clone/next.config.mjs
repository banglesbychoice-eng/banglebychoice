/** @type {import('next').NextConfig} */
const supabaseImageHosts = [
  process.env.NEXT_PUBLIC_SUPABASE_URL ? new URL(process.env.NEXT_PUBLIC_SUPABASE_URL).hostname : null,
  'vigfueqwurcagfmnbsnp.supabase.co',
].filter(Boolean);

const kundanCatalogRedirects = [
  ['crown-shape-glossy-white', 'crown-shape-glossy-white-kundans'],
  ['v-shape-dark-green-glossy', 'v-shape-dark-green-glossy-kundans'],
  ['v-shape-dark-pink-glossy', 'v-shape-dark-pink-glossy-kundans'],
  ['v-shape-dark-purpule-glossy', 'v-shape-dark-purple-glossy-kundans'],
  ['v-shape-glossy-gold', 'v-shape-glossy-gold-kundans'],
  ['v-shape-glossy-white', 'v-shape-glossy-white-kundans'],
  ['v-shape-light-green-glossy', 'v-shape-light-green-glossy-kundans'],
  ['v-shape-orange-glossy', 'v-shape-orange-glossy-kundans'],
  ['v-shape-sky-blue-glossy', 'v-shape-sky-blue-glossy-kundans'],
  ['6k-eye-shape-dark-green-glossy', '6k-eye-shape-dark-green-glossy-kundans'],
  ['6k-droup-peach-glass', '6k-drop-peach-glass-kundans'],
  ['6k-droup-light-purpule-glass', '6k-drop-light-purple-glass-kundans'],
  ['triangle-shape-ceramic-white', 'triangle-glossy-white-kundans'],
  ['6k-drop-light-green-glossy-kundans', '6k-drop-light-green-glass-kundans'],
  ['6k-drop-ceramic-gold', '6k-drop-ceramic-gold-kundans'],
  ['triangle-ceramic-gold', 'triangle-glossy-gold-kundans'],
  ['6k-drop-glossy-gold', '6k-drop-glossy-gold-kundans'],
  ['small-star-glossy-white', 'small-star-glossy-white-kundans'],
  ['3-3-square-gold-glossy', '3x3-square-glossy-gold-kundans'],
  ['diamond-shape-glossy-gold', 'diamond-glossy-gold-kundans'],
  ['diamond-shape-light-green-glossy', 'diamond-light-green-glossy-kundans'],
  ['diamond-shape-orange-glossy', 'diamond-orange-glossy-kundans'],
  ['diamond-shape-rose-pink-glossy-kundans', 'diamond-rose-pink-glossy-kundans'],
  ['6k-droup-dark-blue-glossy', '6k-drop-dark-blue-glossy-kundans'],
  ['6k-drop-rama-green-glass-kundans', '6k-drop-green-glass-kundans'],
  ['6k-drop-glossy-white', '6k-drop-glossy-white-kundans'],
  ['6k-drop-dark-sky-blue-glass-kundans', '6k-drop-c-green-glass-kundans'],
  ['4-4-square-glossy-white', '4x4-square-glossy-white-kundans'],
  ['4-4-square-yellow-glossy', '4x4-square-yellow-glossy-kundans'],
  ['4-4-square-glossy-glod', '4x4-square-glossy-gold-kundans'],
  ['4-4-square-white-colour-matt', '4x4-square-ceramic-white-kundans'],
  ['4-4-square-ceramic-gold', '4x4-square-ceramic-gold-kundans'],
  ['4-4-square-red-glossy', '4x4-square-red-glossy-kundans'],
  ['4-4-square-rose-pink-glossy', '4x4-square-rose-pink-glossy-kundans'],
  ['half-moon-sky-blue-glass', 'half-moon-sky-blue-glass-kundans'],
  ['4-4-square-purpule-glossy', '4x4-square-purple-glossy-kundans'],
  ['half-moon-dark-purpule-glass', 'half-moon-purple-glass-kundans'],
  ['half-moon-dark-blue-glass', 'half-moon-dark-blue-glass-kundans'],
  ['half-moon-red-glass', 'half-moon-red-glass-kundans'],
  ['half-moon-orange-glass', 'half-moon-orange-glass-kundans'],
  ['half-moon-dark-pink-glass', 'half-moon-dark-pink-glass-kundans'],
  ['half-moon-yelllow-glass', 'half-moon-glossy-gold-kundans'],
];

const securityHeaders = [
  { key: 'Strict-Transport-Security', value: 'max-age=63072000; includeSubDomains; preload' },
  { key: 'X-Content-Type-Options', value: 'nosniff' },
  { key: 'X-Frame-Options', value: 'DENY' },
  { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
  { key: 'Permissions-Policy', value: 'camera=(), geolocation=(), payment=(self), microphone=(self)' },
  {
    key: 'Content-Security-Policy',
    value: [
      "default-src 'self'",
      "base-uri 'self'",
      "frame-ancestors 'none'",
      "object-src 'none'",
      "form-action 'self' https://wa.me https://api.whatsapp.com",
      "img-src 'self' data: blob: https:",
      "script-src 'self' 'unsafe-inline' https://checkout.razorpay.com https://www.googletagmanager.com https://www.google-analytics.com https://www.clarity.ms https://scripts.clarity.ms",
      "style-src 'self' 'unsafe-inline'",
      "connect-src 'self' https://api.razorpay.com https://lumberjack.razorpay.com https://*.supabase.co https://www.google-analytics.com https://www.googletagmanager.com https://www.clarity.ms https://*.clarity.ms",
      "frame-src 'self' https://api.razorpay.com https://checkout.razorpay.com",
      "font-src 'self' data:",
      'upgrade-insecure-requests',
    ].join('; '),
  },
];

const nextConfig = {
  async redirects() {
    return [
      {
        source: '/:path*',
        has: [{ type: 'host', value: 'banglebychoice.in' }],
        destination: 'https://www.banglebychoice.in/:path*',
        permanent: true,
      },
      ...kundanCatalogRedirects.map(([source, destination]) => ({ source: `/products/${source}`, destination: `/products/${destination}`, permanent: true })),
      { source: '/collections/imitation-jewelery-material', destination: '/collections/imitation-jewellery-material', permanent: true },
      { source: '/products/diamond-shape-purpule-colour-matt', destination: '/products/diamond-shape-purple-colour-matt', permanent: true },
      { source: '/products/dark-green-half-moom-glass-kundans', destination: '/products/dark-green-half-moon-glass-kundans', permanent: true },
      { source: '/products/trianglr-matt-kundans', destination: '/products/triangle-matt-kundans', permanent: true },
      { source: '/products/8k-eye-shape-c-green-glossy', destination: '/products/8k-eye-shape-c-green-glossy-kundans', permanent: true },
      { source: '/products/8k-eye-shape-glossy-white', destination: '/products/8k-eye-shape-glossy-white-kundans', permanent: true },
      { source: '/products/8k-eye-kanakambaram-pink-matt', destination: '/products/8k-eye-kanakambaram-pink-matte-kundans', permanent: true },
      { source: '/products/8k-eye-shape-sky-blue-glossy', destination: '/products/8k-eye-shape-sky-blue-glossy-kundans', permanent: true },
      { source: '/products/8k-eye-yellow-matt', destination: '/products/8k-eye-yellow-matte-kundans', permanent: true },
      { source: '/products/8k-eye-white-matt', destination: '/products/8k-eye-white-matte-kundans', permanent: true },
      { source: '/products/8k-eye-shape-light-pink-glass', destination: '/products/8k-eye-shape-light-pink-glass-kundans', permanent: true },
      { source: '/products/8k-eye-shape-dark-pink-glossy', destination: '/products/8k-eye-shape-dark-pink-glossy-kundans', permanent: true },
      { source: '/products/8k-eye-shape-light-green-glossy', destination: '/products/8k-eye-shape-light-green-glossy-kundans', permanent: true },
      { source: '/products/8k-eye-shape-light-purpule-glossy', destination: '/products/8k-eye-shape-light-purple-glossy-kundans', permanent: true },
      { source: '/products/8k-eye-shape-ceramic-gold', destination: '/products/8k-eye-shape-ceramic-gold-kundans', permanent: true },
      { source: '/products/8k-eye-shape-red-colour-glossy', destination: '/products/8k-eye-shape-red-glossy-kundans', permanent: true },
      { source: '/products/8k-eye-shape-matt-peach-colour-kundans', destination: '/products/8k-eye-shape-matte-peach-kundans', permanent: true },
    ];
  },
  images: {
    // Product assets are already compressed WebPs. Direct delivery avoids
    // broken images when the Vercel Image Optimization quota is unavailable.
    unoptimized: true,
    formats: ['image/avif', 'image/webp'],
    qualities: [50, 60, 75, 85],
    minimumCacheTTL: 31536000,
    remotePatterns: [
      ...[...new Set(supabaseImageHosts)].map((hostname) => ({ protocol: 'https', hostname, pathname: '/storage/v1/object/public/**' })),
      { protocol: 'https', hostname: 'mirdhuart.com', pathname: '/wp-content/uploads/**' },
      { protocol: 'https', hostname: 'cdn.shopify.com', pathname: '/s/files/**' },
    ],
  },
  async headers() {
    return [
      { source: '/:path*', headers: securityHeaders },
      { source: '/images/:path*', headers: [{ key: 'Cache-Control', value: 'public, max-age=31536000, immutable' }] },
    ];
  },
};

export default nextConfig;
