'use client';

import Script from 'next/script';
import { usePathname } from 'next/navigation';
import { GoogleAnalytics } from '@next/third-parties/google';

export default function Analytics() {
  const pathname = usePathname();
  const gaId = process.env.NEXT_PUBLIC_GA_MEASUREMENT_ID;
  const clarityId = process.env.NEXT_PUBLIC_CLARITY_PROJECT_ID;
  if (pathname.startsWith('/admin') || pathname === '/login') return null;

  return (
    <>
      {gaId ? <GoogleAnalytics gaId={gaId} /> : null}
      {clarityId ? (
        <Script id="microsoft-clarity" strategy="lazyOnload">
          {`(function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);})(window,document,"clarity","script","${clarityId}");`}
        </Script>
      ) : null}
    </>
  );
}
