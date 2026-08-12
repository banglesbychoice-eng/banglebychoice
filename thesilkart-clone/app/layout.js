import { Playfair_Display, Plus_Jakarta_Sans } from 'next/font/google';
import './globals.css';
import Header from '@/components/Header';
import Footer from '@/components/Footer';
import { CommerceProvider } from '@/components/CommerceContext';
import CartDrawer from '@/components/CartDrawer';
import MobileBottomNav from '@/components/MobileBottomNav';
import Analytics from '@/components/Analytics';
import ServiceWorkerRegister from '@/components/ServiceWorkerRegister';
import InstallAppPrompt from '@/components/InstallAppPrompt';
import { absoluteUrl, defaultOgImage, jsonLd, ogImage, siteName, siteUrl, twitterImage } from '@/lib/seo';

const playfair = Playfair_Display({ variable: '--font-playfair', subsets: ['latin'] });
const jakarta = Plus_Jakarta_Sans({ variable: '--font-jakarta', subsets: ['latin'] });

export const metadata = {
  metadataBase: new URL(siteUrl),
  title: { default: 'Kundan Stones & Jewellery-Making Materials Online | Bangle by Choice', template: '%s | Bangle by Choice' },
  description: 'Buy premium Kundan stones, enamel charms, bangle-making tools, adhesives and jewellery craft materials online with dispatch within 24 hours across India.',
  applicationName: siteName,
  manifest: '/manifest.webmanifest',
  authors: [{ name: siteName, url: siteUrl }],
  creator: siteName,
  publisher: siteName,
  category: 'shopping',
  keywords: ['kundan stones online India', 'bangle making materials', 'silk thread materials', 'jewellery making supplies India', 'enamel charms for jewellery making'],
  alternates: { canonical: '/', languages: { 'en-IN': '/' } },
  openGraph: { title: 'Bangle by Choice', description: 'Bangle and jewellery-making materials delivered across India.', url: '/', siteName, images: [ogImage(defaultOgImage, 'Bangle by Choice jewellery-making materials')], locale: 'en_IN', type: 'website' },
  twitter: { card: 'summary_large_image', title: 'Bangle by Choice', description: 'Shop bangle and jewellery-making materials across India.', images: twitterImage([defaultOgImage]) },
  icons: { icon: [{ url: '/favicon.ico?v=20260812b', sizes: 'any' }, { url: '/icon.png?v=20260812b', type: 'image/png', sizes: '192x192' }], apple: [{ url: '/apple-icon.png?v=20260812b', sizes: '180x180', type: 'image/png' }] },
  appleWebApp: { capable: true, title: 'Bangle by Choice', statusBarStyle: 'default' },
  robots: { index: true, follow: true, googleBot: { index: true, follow: true, 'max-image-preview': 'large', 'max-snippet': -1, 'max-video-preview': -1 } },
  verification: { google: process.env.NEXT_PUBLIC_GOOGLE_SITE_VERIFICATION || undefined, other: { 'msvalidate.01': process.env.NEXT_PUBLIC_BING_SITE_VERIFICATION || undefined } },
};

export const viewport = { width: 'device-width', initialScale: 1, themeColor: '#6e1734' };

export default function RootLayout({ children }) {
  return (
    <html lang="en" className={`${playfair.variable} ${jakarta.variable}`}>
      <head><link rel="preconnect" href="https://vigfueqwurcagfmnbsnp.supabase.co" /></head>
      <body>
        <a className="skipLink" href="#main-content">Skip to main content</a>
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd({ '@context': 'https://schema.org', '@type': 'OnlineStore', '@id': `${siteUrl}/#store`, name: siteName, url: siteUrl, telephone: '+91 95536 55562', logo: absoluteUrl('/icon.png'), image: absoluteUrl('/images/generated/banglebychoice-hero.webp'), description: 'Hyderabad online store for Kundan stones, enamel charms, adhesives and jewellery-making materials delivered across India.', address: { '@type': 'PostalAddress', addressLocality: 'Hyderabad', addressRegion: 'Telangana', addressCountry: 'IN' }, openingHours: 'Mo-Sa 10:00-19:00', areaServed: { '@type': 'Country', name: 'India' }, currenciesAccepted: 'INR', paymentAccepted: 'UPI, cards', sameAs: ['https://wa.me/919553655562', 'https://www.instagram.com/banglebychoice/'] }) }} />
        <CommerceProvider>
          <Header />
          <div id="main-content">{children}</div>
          <CartDrawer />
          <MobileBottomNav />
          <Footer />
        </CommerceProvider>
        <ServiceWorkerRegister />
        <InstallAppPrompt />
        <Analytics />
      </body>
    </html>
  );
}
