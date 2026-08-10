export default function manifest() {
  return {
    name: 'Bangle by Choice', short_name: 'BBC', description: 'Premium kundan stones, silk thread and jewellery-making materials delivered across India.',
    id: '/', start_url: '/', scope: '/', display: 'standalone', orientation: 'portrait', background_color: '#fff9f6', theme_color: '#6e1734',
    icons: [
      { src: '/favicon.ico', sizes: 'any', type: 'image/x-icon' },
      { src: '/icons/icon-48.png', sizes: '48x48', type: 'image/png', purpose: 'any' },
      { src: '/icons/icon-96.png', sizes: '96x96', type: 'image/png', purpose: 'any' },
      { src: '/icons/icon-180.png', sizes: '180x180', type: 'image/png', purpose: 'any' },
      { src: '/icons/icon-192.png', sizes: '192x192', type: 'image/png', purpose: 'any maskable' },
      { src: '/icons/icon-512.png', sizes: '512x512', type: 'image/png', purpose: 'any maskable' },
    ],
    categories: ['shopping', 'lifestyle', 'business'],
    shortcuts: [
      { name: 'Kundan Stones', short_name: 'Kundans', url: '/collections/kundan-stones', icons: [{ src: '/icons/icon-192.png', sizes: '192x192' }] },
      { name: 'Offers', short_name: 'Offers', url: '/offers', icons: [{ src: '/icons/icon-192.png', sizes: '192x192' }] },
    ],
  };
}
