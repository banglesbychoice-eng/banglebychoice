import Link from 'next/link';
import { notFound } from 'next/navigation';
import { absoluteUrl, defaultOgImage, jsonLd, ogImage, siteName, twitterImage } from '@/lib/seo';
import { FREE_SHIPPING_MIN, MINIMUM_SHIPPING_FEE, SHIPPING_RATE_PER_KG } from '@/lib/pricing';
import styles from './help.module.css';

const pages = {
  shipping: { eyebrow: 'Delivery', title: 'Shipping across India', description: 'Delivery times, dispatch information and shipping charges for Bangle by Choice orders across India.', sections: [['When will my order be dispatched?', 'Confirmed orders are normally packed and dispatched within 24 hours on business days. Orders placed on Sundays or public holidays begin processing on the next business day.'], ['Can I collect or arrange my own delivery?', 'Yes. At checkout choose Customer pickup or Rapido or own delivery. The website delivery charge becomes ₹0. Wait for the ready confirmation before arriving or booking a pickup agent; customer-arranged pickup charges are paid directly to the provider.'], ['How long does delivery take?', 'Estimated delivery is 1-3 business days for Andhra Pradesh and Telangana, 3-5 days for Tamil Nadu, Puducherry and Karnataka, and 4-7 days for most other serviceable locations.'], ['How is shipping calculated?', `Delivery starts at ₹${MINIMUM_SHIPPING_FEE} and is calculated at ₹${SHIPPING_RATE_PER_KG} per kg using the packed shipment weight. Each bangle box is counted at approximately 300g per unit for this calculation.`], ['How does free shipping appear in the cart?', `For eligible orders from ₹${FREE_SHIPPING_MIN}, the cart shows the calculated delivery charge and then deducts the free-shipping benefit. Bangle-box delivery remains payable by weight and is not included in that deduction.`], ['Which courier will deliver?', 'The courier is selected according to PIN-code serviceability, parcel weight and estimated delivery time. Tracking details are shared after pickup.'], ['Is payment required before dispatch?', 'Yes. Orders are prepaid and can be completed through direct UPI or the secure online payment option shown at checkout.'], ['Where can I track my order?', 'Open the Order Tracking page and enter the order number with the 10-digit mobile number used at checkout.']] },
  returns: { eyebrow: 'Customer care', title: 'Returns and replacements', description: 'Read the Bangle by Choice return, replacement and damaged-item policy.', sections: [['What should I do if an item arrives damaged?', 'Contact us within 48 hours of delivery. Share the order number, a clear photo of the outer parcel and clear photos or a short video showing the affected item.'], ['What if I receive the wrong product?', 'Keep the product and packaging unused and contact us within 48 hours. We will compare the received item with the order before arranging a resolution.'], ['Which items cannot be returned?', 'Opened packets, cut thread or chain, used materials and quantity-based supplies cannot be returned unless the item was damaged or incorrect when delivered.'], ['How is a request reviewed?', 'We verify the order, packaging and product evidence. We may request another image when the product colour, quantity or damage is not clearly visible.'], ['When will a refund arrive?', 'Approved refunds are initiated to the original payment method. Banks and UPI providers usually take 5-10 business days to display the credit after it is initiated.'], ['Who pays return shipping?', 'For an approved damaged or incorrect-item claim, we provide the applicable return or replacement instructions. Unapproved parcels sent without confirmation may not be accepted.']] },
  'order-help': { eyebrow: 'Order support', title: 'Need help with an order?', description: 'Track a Bangle by Choice order or get support for delivery, payment and reordering.', sections: [['Track without waiting for a reply', 'Use the Order Tracking page with your order number and mobile number to view the latest order and payment status.'], ['Before dispatch', 'Contact us promptly with the order number if an address correction is needed. Changes are not always possible after packing or courier pickup.'], ['After dispatch', 'Tracking details are shared after courier pickup. Courier scans can take several hours to appear after the parcel is handed over.'], ['Payment help', 'For direct UPI payments, keep the UTR or payment screenshot until the order status is updated. Never share an OTP, UPI PIN or card PIN with support.'], ['Reorder previous items', 'A tracked order can add currently available items back to the bag. Current prices and available pack sizes are applied at the new checkout.'], ['Contact', 'WhatsApp +91 95536 55562 during Monday-Saturday support hours for assistance that cannot be completed through self-service tracking.']] },
  faq: { eyebrow: 'Quick answers', title: 'Frequently asked questions', description: 'Answers about ordering, payments, delivery, product colours and wholesale enquiries at Bangle by Choice.', sections: [['How can I pay?', 'Checkout supports direct UPI. Secure Razorpay UPI and card payment also appears when the payment gateway is available. Cash on delivery is not offered.'], ['Are product colours exact?', 'We photograph products under controlled lighting and preserve the material colour, but screen settings can cause small differences. Compare shade names and product photos before ordering.'], ['Can I order different pack sizes?', 'Available pack sizes and their current prices are shown on each product page. Only the displayed options can be selected at checkout.'], ['Do you accept bulk orders?', 'Yes. Use the Wholesale page to request a quote based on the exact product, pack size and quantity required.'], ['How do I track or reorder?', 'Use Order Tracking with the order number and delivery mobile. Available products from the earlier order can be added to the bag again.'], ['How do I report a damaged item?', 'Contact us within 48 hours with the order number, parcel photo and clear product photos or video.']] },
  contact: { eyebrow: 'We are here', title: 'Talk to Bangle by Choice', description: 'Contact Bangle by Choice in Hyderabad for product and order support.', sections: [['WhatsApp', '+91 95536 55562'], ['Location', 'Hyderabad, India'], ['Support hours', 'Monday to Saturday, 10:00 AM to 7:00 PM IST.']] },
  about: { eyebrow: 'Our story', title: 'About Bangle by Choice', description: 'Learn about Bangle by Choice, a Hyderabad-based store for bangle and jewellery-making materials.', sections: [['What we do', 'We curate silk thread, kundan stones, tools and jewellery-making supplies for makers across India.'], ['Our promise', 'Useful product guidance, careful packing and responsive WhatsApp support are at the heart of every order.'], ['Based in Hyderabad', 'Orders are prepared in Hyderabad and delivered across India.']] },
  privacy: { eyebrow: 'Your data', title: 'Privacy policy', description: 'How Bangle by Choice collects and uses information when you browse or place an order.', sections: [['Information we collect', 'Checkout stores the name, mobile number, optional email, delivery address and order details needed to process and support an order.'], ['How information is used', 'Order information is used for payment confirmation, packing, courier delivery, tracking, support and fraud prevention.'], ['Payments', 'Payment credentials, UPI PINs and card PINs are not stored by Bangle by Choice. Gateway payments are handled by the payment provider.'], ['Analytics', 'Google Analytics and Microsoft Clarity help us understand site performance and improve the shopping experience.'], ['Retention and access', 'Order records are retained for fulfilment, support, accounting and legal requirements. Tracking only displays limited order details after the matching order number and mobile are provided.'], ['Contact', 'Message us on WhatsApp if you have a privacy, correction or deletion request. Some transaction records may need to be retained where required by law.']] },
  terms: { eyebrow: 'Store policy', title: 'Terms of use', description: 'Terms governing use of the Bangle by Choice website and online ordering service.', sections: [['Product information', 'We aim to keep product availability, descriptions, images, pack sizes and prices accurate. Screen settings can cause small colour differences.'], ['Orders', 'Submitting checkout creates a prepaid order request. Orders move forward after payment verification; cash on delivery is not available.'], ['Pricing and availability', 'Current checkout pricing and stock availability apply. An order may be cancelled and refunded if a product becomes unavailable before fulfilment.'], ['Delivery details', 'Customers are responsible for providing a complete, serviceable delivery address and reachable mobile number.'], ['Returns', 'Damaged, incorrect and return requests are handled under the Returns and Replacements policy.'], ['Acceptable use', 'Do not misuse the website, interfere with its operation, attempt fraudulent payments or submit false orders.']] },
};

function pageSchema(slug, page) {
  if (slug === 'shipping' || slug === 'returns' || slug === 'faq') {
    return {
      '@context': 'https://schema.org',
      '@type': 'FAQPage',
      mainEntity: page.sections.map(([name, text]) => ({ '@type': 'Question', name, acceptedAnswer: { '@type': 'Answer', text } })),
    };
  }

  if (slug === 'contact' || slug === 'order-help') {
    return {
      '@context': 'https://schema.org',
      '@type': 'ContactPage',
      name: page.title,
      url: absoluteUrl(`/help/${slug}`),
      mainEntity: { '@type': 'Organization', name: siteName, telephone: '+91 95536 55562', contactPoint: { '@type': 'ContactPoint', telephone: '+91 95536 55562', contactType: 'customer support', areaServed: 'IN', availableLanguage: ['English', 'Hindi', 'Telugu'] } },
    };
  }

  return null;
}

export function generateStaticParams() {
  return Object.keys(pages).map((slug) => ({ slug }));
}

export async function generateMetadata({ params }) {
  const { slug } = await params;
  const page = pages[slug];
  if (!page) return { title: 'Page not found' };
  return {
    title: page.title,
    description: page.description,
    alternates: { canonical: `/help/${slug}` },
    openGraph: { title: page.title, description: page.description, url: absoluteUrl(`/help/${slug}`), type: 'website', images: [ogImage(defaultOgImage, page.title)] },
    twitter: { card: 'summary_large_image', title: page.title, description: page.description, images: twitterImage([defaultOgImage]) },
  };
}

export default async function HelpPage({ params }) {
  const { slug } = await params;
  const page = pages[slug];
  if (!page) notFound();
  const schema = pageSchema(slug, page);

  return (
    <>
      {schema && <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: jsonLd(schema) }} />}
      <main className={styles.page}>
        <p>{page.eyebrow}</p>
        <h1>{page.title}</h1>
        <div>{page.sections.map(([title, copy]) => <section key={title}><h2>{title}</h2><p>{copy}</p></section>)}</div>
        <Link href="https://wa.me/919553655562" rel="nofollow external noopener">Chat on WhatsApp</Link>
      </main>
    </>
  );
}
