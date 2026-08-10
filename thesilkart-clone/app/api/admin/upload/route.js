import { NextResponse } from 'next/server';
import sharp from 'sharp';
import { isAdmin } from '@/lib/admin-auth';
import { getServiceSupabase } from '@/lib/supabase-server';

const BUCKET = 'product-images';
const MAX_BYTES = 8 * 1024 * 1024;

export async function POST(request) {
  if (!(await isAdmin())) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  const formData = await request.formData();
  const file = formData.get('file');
  if (!(file instanceof File) || !file.type.startsWith('image/')) return NextResponse.json({ error: 'Choose a valid image file.' }, { status: 400 });
  if (file.size > MAX_BYTES) return NextResponse.json({ error: 'Images must be 8 MB or smaller.' }, { status: 400 });

  try {
    const client = getServiceSupabase();
    const { data: buckets } = await client.storage.listBuckets();
    if (!buckets?.some((bucket) => bucket.id === BUCKET)) {
      const { error: bucketError } = await client.storage.createBucket(BUCKET, { public: true, fileSizeLimit: MAX_BYTES, allowedMimeTypes: ['image/webp', 'image/jpeg', 'image/png', 'image/avif'] });
      if (bucketError && !bucketError.message.toLowerCase().includes('already exists')) throw bucketError;
    }

    const input = Buffer.from(await file.arrayBuffer());
    const output = await sharp(input).rotate().resize({ width: 1600, height: 1600, fit: 'inside', withoutEnlargement: true }).webp({ quality: 84 }).toBuffer();
    await sharp(output).metadata();
    const safeName = file.name.replace(/\.[^.]+$/, '').toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '') || 'product';
    const path = `${new Date().toISOString().slice(0, 10)}/${safeName}-${crypto.randomUUID().slice(0, 8)}.webp`;
    const { error: uploadError } = await client.storage.from(BUCKET).upload(path, new Blob([output], { type: 'image/webp' }), { contentType: 'image/webp', cacheControl: '31536000', upsert: false });
    if (uploadError) throw uploadError;
    const { data } = client.storage.from(BUCKET).getPublicUrl(path);
    return NextResponse.json({ success: true, url: data.publicUrl });
  } catch (error) {
    console.error('Image upload failed:', error.message);
    return NextResponse.json({ error: 'Unable to upload this image.' }, { status: 500 });
  }
}
