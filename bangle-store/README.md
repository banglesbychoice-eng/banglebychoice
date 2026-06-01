# BangleByChoice Next.js Store

This is the production-ready full-stack e-commerce PWA for **BangleByChoice**, built using the Next.js App Router, styled with vanilla CSS/Tailwind rules, powered by a **Supabase PostgreSQL** database, and hosted on **Netlify**.

## 🚀 Live Site
- **Production URL**: [https://banglebychoice.netlify.app](https://banglebychoice.netlify.app)
- **Admin Portal**: Accessible via the UI toggle with password/PIN verification.

---

## 🛠️ Architecture & Tech Stack

- **Frontend**: Next.js App Router (React)
  - Designed for dual views: behaves like a **native mobile app** on mobile screens, and a **full desktop website** on desktop screens.
  - Interactive features: Search overlay, size selector (2.2, 2.4, 2.6, 2.8), color filters, category chips.
  - Cart persistency using local storage.
- **Backend / API**: Next.js Serverless Route Handlers (`/api/products`, `/api/categories`, `/api/colors`).
- **Database**: Supabase PostgreSQL.
- **Hosting**: Netlify with Next.js Runtime integration (supporting Edge functions).
- **Checkout**: Direct WhatsApp integration (Retail Checkout format & Wholesale PO format).

---

## 💾 Database Schema

The PostgreSQL schema is managed in Supabase and comprises three main tables:
1. `categories`: Defines available bangle categories (e.g., Silk, Glass, Bridal).
2. `colors`: Color themes with custom gradients (e.g., Ruby Crimson, Soft Pink).
3. `products`: The product catalog linking categories, sizes, and colors, including pricing and image metadata.

The SQL setup script can be found in the repository at `setup_db.sql` or run directly in the Supabase SQL editor.

---

## ⚙️ Environment Variables

To run the application locally or deploy it elsewhere, the following environment variables are required:

```env
NEXT_PUBLIC_SUPABASE_URL=https://<your-project-id>.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your-anon-api-key>
```

---

## 💻 Local Development

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Run the local development server**:
   ```bash
   npm run dev
   ```
   Open [http://localhost:3000](http://localhost:3000) in your browser.

3. **Compile build locally**:
   ```bash
   npm run build
   ```

---

## 🚀 Deployment

The site is linked to Netlify. To deploy updates directly from the CLI:

```bash
# Set environment variables (only once)
npx netlify env:set NEXT_PUBLIC_SUPABASE_URL <url>
npx netlify env:set NEXT_PUBLIC_SUPABASE_ANON_KEY <key>

# Deploy production version
npx netlify deploy --prod
```
