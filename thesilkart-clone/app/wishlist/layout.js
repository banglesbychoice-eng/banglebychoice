import { absoluteUrl, defaultOgImage, ogImage, twitterImage } from '@/lib/seo';

export const metadata = {
  title: 'Wishlist',
  description: 'Saved Bangle by Choice products and jewellery-making materials.',
  robots: { index: false, follow: false },
  openGraph: { title: 'Wishlist | Bangle by Choice', description: 'Saved products and jewellery-making materials.', url: absoluteUrl('/wishlist'), type: 'website', images: [ogImage(defaultOgImage, 'Bangle by Choice wishlist')] },
  twitter: { card: 'summary_large_image', title: 'Wishlist | Bangle by Choice', description: 'Saved products and jewellery-making materials.', images: twitterImage([defaultOgImage]) },
};

export default function WishlistLayout({ children }) { return children; }
