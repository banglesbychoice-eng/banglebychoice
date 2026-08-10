# Bangle by Choice Storefront

Production-oriented Next.js 16 storefront for Bangle by Choice with 571 product pages, responsive catalog browsing, local cart and wishlist persistence, guest checkout, Supabase order storage, protected product administration, sitemap and robots metadata.

## Local setup

```bash
npm install
Copy-Item .env.example .env.local
npm run dev
```

Required environment variables:

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY` for protected product administration
- `ADMIN_PIN`
- `ADMIN_SESSION_SECRET`

Never commit `.env.local` or any service-role key.

## Supabase

Apply `supabase/migrations/202606210001_create_store_orders.sql` through the Supabase SQL editor or CLI. It creates the order tables and the restricted `create_store_order` function used by `/api/orders`.

The existing `products` table powers the admin catalog. Product images and the public catalog snapshot are stored locally under `public/images` and `data/products.json`.

## Validation

```bash
npm run lint
npm run build
```

## Deployment

Link the `thesilkart-clone` directory as the Vercel project root, configure all environment variables for Preview and Production, then deploy a preview before promoting it to production.
