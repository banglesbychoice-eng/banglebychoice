import { supabase } from '@/lib/supabase';

const BASE_URL = 'https://banglebychoice.netlify.app';

export default async function sitemap() {
  // Fetch all products
  const { data: products } = await supabase
    .from('products')
    .select('id, slug, created_at')
    .order('created_at', { ascending: false });

  const productEntries = (products || []).map((p) => ({
    url: `${BASE_URL}/product/${p.slug || p.id}`,
    lastModified: p.created_at ? new Date(p.created_at) : new Date(),
    changeFrequency: 'weekly',
    priority: 0.8,
  }));

  return [
    {
      url: BASE_URL,
      lastModified: new Date(),
      changeFrequency: 'daily',
      priority: 1,
    },
    ...productEntries,
  ];
}
