import fs from "node:fs/promises";
import path from "node:path";
import process from "node:process";
import { createClient } from "@supabase/supabase-js";
import { config } from "dotenv";

config({ path: ".env.local", quiet: true });

const [, , slug, imagePath] = process.argv;

if (!slug || !imagePath) {
  console.error("Usage: node scripts/publish-product-image.mjs <slug> <image-path>");
  process.exit(1);
}

const client = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY,
  { auth: { persistSession: false, autoRefreshToken: false } },
);

const file = await fs.readFile(imagePath);
const storagePath = `premium-charms/${slug}-${Date.now()}.webp`;
const { error: uploadError } = await client.storage
  .from("product-images")
  .upload(storagePath, file, {
    cacheControl: "31536000",
    contentType: "image/webp",
    upsert: false,
  });

if (uploadError) throw uploadError;

const { data: publicData } = client.storage.from("product-images").getPublicUrl(storagePath);
const publicUrl = publicData.publicUrl;
const { data: product, error: updateError } = await client
  .from("products")
  .update({ image_url: publicUrl })
  .eq("slug", slug)
  .select("id,name,slug,image_url")
  .single();

if (updateError) throw updateError;

console.log(JSON.stringify({ product, source: path.resolve(imagePath) }, null, 2));
