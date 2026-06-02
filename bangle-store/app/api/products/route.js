import { supabase } from '@/lib/supabase';
import { NextResponse } from 'next/server';

// GET /api/products - Fetch all products
export async function GET() {
  try {
    const { data, error } = await supabase
      .from('products')
      .select('*')
      .order('created_at', { ascending: false });

    if (error) throw error;

    // Supabase returns sizes as standard arrays. We map db structure 'desc_text' to json response field 'desc'.
    const mappedProducts = data.map(p => ({
      id: p.id,
      name: p.name,
      slug: p.slug || p.id.toLowerCase().replace(/[^a-z0-9]+/g, '-'),
      price: p.price,
      mrp: p.mrp,
      cat: p.cat,
      bg: p.bg,
      emoji: p.emoji,
      desc: p.desc_text,
      tag: p.tag || '',
      sizes: p.sizes || [],
      image_url: p.image_url || null,
      meta_title: p.meta_title || null,
      meta_description: p.meta_description || null,
      alt_text: p.alt_text || null
    }));

    return NextResponse.json(mappedProducts);
  } catch (err) {
    console.error("GET /api/products failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}

// POST /api/products - Insert a new custom product
export async function POST(req) {
  try {
    const body = await req.json();
    const { name, cat, tag, price, mrp, bg, emoji, desc, sizes, image_url } = body;

    if (!name || !cat || !price) {
      return NextResponse.json({ error: "Missing required fields: name, cat, price" }, { status: 400 });
    }

    const slug = name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
    
    // Auto-generate SEO Metadata
    const meta_title = `${name} — Handcrafted Bangles | BangleByChoice`;
    const meta_description = desc 
      ? desc.length > 150 ? desc.substring(0, 147) + '...' : desc
      : `Shop ${name} at BangleByChoice. Premium handcrafted designer bangles.`;
    const alt_text = `Photo of ${name}`;

    const { data, error } = await supabase
      .from('products')
      .insert([
        {
          id: 'CUSTOM_' + Date.now(),
          name,
          slug,
          price: parseInt(price),
          mrp: mrp ? parseInt(mrp) : null,
          cat,
          bg,
          emoji: emoji || '🌸',
          desc_text: desc || '',
          tag: tag || '',
          sizes: sizes || ['2.2', '2.4', '2.6', '2.8'],
          image_url: image_url || null,
          meta_title,
          meta_description,
          alt_text
        }
      ])
      .select();

    if (error) throw error;

    return NextResponse.json({ success: true, product: data[0] });
  } catch (err) {
    console.error("POST /api/products failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
