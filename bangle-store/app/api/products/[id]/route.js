import { supabase } from '@/lib/supabase';
import { NextResponse } from 'next/server';

// DELETE /api/products/[id] - Remove product by ID
export async function DELETE(req, { params }) {
  try {
    const { id } = params;
    if (!id) {
      return NextResponse.json({ error: "Missing product ID in request path" }, { status: 400 });
    }

    const { data, error } = await supabase
      .from('products')
      .delete()
      .eq('id', id)
      .select();

    if (error) throw error;

    if (data.length === 0) {
      return NextResponse.json({ error: "Product not found" }, { status: 404 });
    }

    return NextResponse.json({ success: true, deleted: data[0] });
  } catch (err) {
    console.error("DELETE /api/products/[id] failed:", err);
    return NextResponse.json({ error: err.message }, { status: 500 });
  }
}
