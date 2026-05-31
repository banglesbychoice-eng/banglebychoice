import { supabase } from '@/lib/supabase';
import { NextResponse } from 'next/server';

// GET /api/categories - Fetch all categories
export async function GET() {
  try {
    const { data, error } = await supabase
      .from('categories')
      .select('*');

    if (error) throw error;

    // Convert flat database array into the app's key-value category map format
    // e.g. { glass: "🔮 Glass Bangles", ... }
    const catMap = { all: '✨ View All' };
    data.forEach(c => {
      catMap[c.id] = c.name;
    });

    return NextResponse.json(catMap);
  } catch (err) {
    console.error("GET /api/categories failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}

// POST /api/categories - Create custom category
export async function POST(req) {
  try {
    const body = await req.json();
    const { id, name } = body;

    if (!id || !name) {
      return NextResponse.json({ error: "Missing required fields: id, name" }, { status: 400 });
    }

    const { data, error } = await supabase
      .from('categories')
      .insert([{ id, name }])
      .select();

    if (error) throw error;

    return NextResponse.json({ success: true, category: data[0] });
  } catch (err) {
    console.error("POST /api/categories failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
