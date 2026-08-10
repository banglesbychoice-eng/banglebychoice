import process from "node:process";
import { createClient } from "@supabase/supabase-js";
import { config } from "dotenv";

config({ path: ".env.local", quiet: true });

const origin = "https://www.banglebychoice.in";
const client = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false, autoRefreshToken: false } },
);

if (!process.env.ADMIN_PIN) throw new Error("ADMIN_PIN is not configured.");

const { data: product, error: productError } = await client
  .from("products")
  .select("id,image_url")
  .eq("slug", "green-fish-enamel-charm")
  .single();

if (productError) throw productError;

const login = await fetch(`${origin}/api/admin/login`, {
  method: "POST",
  headers: { "content-type": "application/json" },
  body: JSON.stringify({ pin: process.env.ADMIN_PIN }),
});

if (!login.ok) throw new Error(`Production admin login failed with ${login.status}.`);
const cookie = login.headers.getSetCookie?.()[0] || login.headers.get("set-cookie");
if (!cookie) throw new Error("Production admin session cookie was not returned.");

const update = await fetch(`${origin}/api/products/${product.id}`, {
  method: "PUT",
  headers: {
    "content-type": "application/json",
    cookie: cookie.split(";")[0],
  },
  body: JSON.stringify({ image_url: product.image_url }),
});

if (!update.ok) throw new Error(`Production catalog revalidation failed with ${update.status}.`);
console.log("Production catalog cache revalidated.");
