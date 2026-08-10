import { createClient } from '@supabase/supabase-js';

export function getServerSupabase({ requireServiceRole = false } = {}) {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  const key = requireServiceRole ? serviceKey : serviceKey || anonKey;
  if (!url || !key) throw new Error(requireServiceRole ? 'SUPABASE_SERVICE_ROLE_KEY is not configured.' : 'Supabase environment variables are not configured.');
  return createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } });
}

export function getServiceSupabase() {
  return getServerSupabase({ requireServiceRole: true });
}
