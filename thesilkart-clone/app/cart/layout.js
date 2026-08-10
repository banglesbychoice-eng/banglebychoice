import { absoluteUrl, defaultOgImage, ogImage, twitterImage } from '@/lib/seo';

export const metadata = {
  title: 'Shopping Cart',
  description: 'Review your Bangle by Choice items, quantities, savings and delivery charges before checkout.',
  robots: { index: false, follow: true },
  openGraph: { title: 'Shopping Cart | Bangle by Choice', description: 'Review your selected craft materials before checkout.', url: absoluteUrl('/cart'), type: 'website', images: [ogImage(defaultOgImage, 'Bangle by Choice shopping cart')] },
  twitter: { card: 'summary_large_image', title: 'Shopping Cart | Bangle by Choice', description: 'Review your selected craft materials before checkout.', images: twitterImage([defaultOgImage]) },
};

export default function CartLayout({ children }) {
  return children;
}
