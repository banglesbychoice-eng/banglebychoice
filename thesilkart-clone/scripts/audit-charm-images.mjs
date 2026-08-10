import fs from "node:fs/promises";
import { createClient } from "@supabase/supabase-js";
import { config } from "dotenv";

config({ path: ".env.local", quiet: true });

const client = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false, autoRefreshToken: false } },
);

const manifest = JSON.parse(await fs.readFile("data/new-products-2026-07-19.json", "utf8"));
const expected = manifest.filter((product) =>
  /charm/i.test([product.name, product.slug, product.type, product.subcategory].join(" ")),
);
const slugAliases = new Map([
  ["antique-gold-elephant-charms", "double-face-elephant-charms-no-2"],
]);
const expectedSlugs = expected.map((product) => slugAliases.get(product.slug) || product.slug);
const { data: products, error } = await client
  .from("products")
  .select("name,slug,image_url,desc_text,cat,tag")
  .in("slug", expectedSlugs);

if (error) throw error;

const { data: relatedProducts, error: relatedError } = await client
  .from("products")
  .select("name,slug,image_url,desc_text,cat,tag")
  .or("name.ilike.%charm%,cat.ilike.%charm%,tag.ilike.%charm%");

if (relatedError) throw relatedError;

const activeRelatedProducts = relatedProducts.filter((product) => {
  try {
    return JSON.parse(product.desc_text || "{}").status !== "draft";
  } catch {
    return true;
  }
});

const bySlug = new Map(products.map((product) => [product.slug, product]));
const missing = expectedSlugs.filter((slug) => !bySlug.has(slug));
const unrefreshed = products
  .filter((product) => !product.image_url?.includes("/premium-charms/"))
  .map((product) => ({ slug: product.slug, image_url: product.image_url }));
const liveOutliers = activeRelatedProducts
  .filter((product) => !product.image_url?.includes("/premium-charms/"))
  .map((product) => ({ name: product.name, slug: product.slug, image_url: product.image_url }));

console.log(JSON.stringify({
  expected: expected.length,
  found: products.length,
  refreshed: products.length - unrefreshed.length,
  missing,
  unrefreshed,
  activeRelated: activeRelatedProducts.length,
  liveOutliers,
}, null, 2));
