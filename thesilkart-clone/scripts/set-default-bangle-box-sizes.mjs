import dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';

dotenv.config({ path: '.env.local', quiet: true });

const labels = ['2.2', '2.4', '2.6', '2.8', '2.10', '2.12'];
const supabase = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const isBangleBox = (name) => /(?:bangle|bamgle)\s*(?:making\s*)?box|box[^a-z]*(?:bangle|bamgle)/i.test(name || '');

const { data, error } = await supabase.from('products').select('id,name,price,mrp,sizes');
if (error) throw error;

const products = data.filter((product) => isBangleBox(product.name));
for (const product of products) {
  const price = Math.round(Number(product.price));
  const mrp = Math.round(Number(product.mrp ?? product.price));
  const sizes = labels.map((label) => ({ label, price, mrp, available: true }));
  const { error: updateError } = await supabase.from('products').update({ sizes }).eq('id', product.id);
  if (updateError) throw updateError;
}

console.log(JSON.stringify({ updated: products.length, products: products.map((product) => product.name).sort() }, null, 2));
process.exit(0);
