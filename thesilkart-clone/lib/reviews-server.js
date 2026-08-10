import { getServerSupabase } from '@/lib/supabase-server';

export async function getApprovedReviews(slug) {
  const { data, error } = await getServerSupabase()
    .from('product_reviews')
    .select('id,author_name,rating,review_text,created_at')
    .eq('product_slug', slug)
    .eq('status', 'approved')
    .order('created_at', { ascending: false })
    .limit(50);
  if (error) return [];
  return data || [];
}

export function reviewSummary(reviews) {
  if (!reviews.length) return null;
  const value = reviews.reduce((total, review) => total + Number(review.rating || 0), 0) / reviews.length;
  return { count: reviews.length, value: Number(value.toFixed(1)) };
}
