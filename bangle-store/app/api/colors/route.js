import { supabase } from '@/lib/supabase';
import { NextResponse } from 'next/server';

// GET /api/colors - Fetch all colors and their CSS gradients
export async function GET() {
  try {
    const { data, error } = await supabase
      .from('colors')
      .select('*');

    if (error) throw error;

    const colorsMap = {};
    const gradientsMap = {};
    data.forEach(c => {
      colorsMap[c.id] = c.name;
      gradientsMap[c.id] = c.gradient;
    });

    return NextResponse.json({ colors: colorsMap, gradients: gradientsMap });
  } catch (err) {
    console.error("GET /api/colors failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}

// POST /api/colors - Add custom color theme and gradient
export async function POST(req) {
  try {
    const body = await req.json();
    const { id, name, gradient } = body;

    if (!id || !name || !gradient) {
      return NextResponse.json({ error: "Missing required fields: id, name, gradient" }, { status: 400 });
    }

    const { data, error } = await supabase
      .from('colors')
      .insert([{ id, name, gradient }])
      .select();

    if (error) throw error;

    return NextResponse.json({ success: true, color: data[0] });
  } catch (err) {
    console.error("POST /api/colors failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
