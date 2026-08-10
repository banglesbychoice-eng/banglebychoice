import { absoluteUrl, defaultOgImage, ogImage, twitterImage } from '@/lib/seo';

export const metadata = {
  title: 'Secure Checkout',
  description: 'Complete delivery details and pay securely by UPI or card for your Bangle by Choice order.',
  robots: { index: false, follow: false },
  openGraph: { title: 'Secure Checkout | Bangle by Choice', description: 'Pay securely by UPI or card.', url: absoluteUrl('/checkout'), type: 'website', images: [ogImage(defaultOgImage, 'Bangle by Choice secure checkout')] },
  twitter: { card: 'summary_large_image', title: 'Secure Checkout | Bangle by Choice', description: 'Pay securely by UPI or card.', images: twitterImage([defaultOgImage]) },
};

export default function CheckoutLayout({ children }) { return children; }
