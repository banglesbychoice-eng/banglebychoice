create extension if not exists pgcrypto;

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text unique not null,
  customer_name text not null,
  customer_mobile text not null,
  customer_email text,
  address text not null,
  city text not null,
  state text not null,
  postal_code text not null,
  notes text,
  status text not null default 'pending' check (status in ('pending','confirmed','packed','shipped','delivered','cancelled')),
  payment_status text not null default 'pending' check (payment_status in ('pending','paid','failed','refunded')),
  subtotal numeric(12,2) not null,
  shipping numeric(12,2) not null,
  total numeric(12,2) not null,
  created_at timestamptz not null default now()
);

create table if not exists public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  product_id text not null,
  product_slug text,
  product_name text not null,
  image_url text,
  pack_size text,
  quantity integer not null check (quantity between 1 and 50),
  unit_price numeric(12,2) not null check (unit_price >= 0),
  line_total numeric(12,2) not null check (line_total >= 0)
);

alter table public.orders enable row level security;
alter table public.order_items enable row level security;

create or replace function public.create_store_order(customer_input jsonb, items_input jsonb)
returns table(order_id uuid, order_number text)
language plpgsql
security definer
set search_path = public
as $$
declare
  new_order_id uuid;
  new_order_number text;
  calculated_subtotal numeric(12,2);
  calculated_shipping numeric(12,2);
begin
  if jsonb_array_length(items_input) < 1 or jsonb_array_length(items_input) > 50 then raise exception 'Invalid item count'; end if;
  calculated_subtotal := (select sum((item->>'price')::numeric * (item->>'quantity')::integer) from jsonb_array_elements(items_input) item);
  calculated_shipping := case when calculated_subtotal >= 999 then 0 else 99 end;
  new_order_number := 'BBC-' || to_char(now(), 'YYMMDD') || '-' || upper(substr(encode(gen_random_bytes(4), 'hex'), 1, 8));

  insert into public.orders (order_number, customer_name, customer_mobile, customer_email, address, city, state, postal_code, notes, subtotal, shipping, total)
  values (new_order_number, trim(customer_input->>'name'), trim(customer_input->>'mobile'), nullif(trim(customer_input->>'email'), ''), trim(customer_input->>'address'), trim(customer_input->>'city'), trim(customer_input->>'state'), trim(customer_input->>'postalCode'), nullif(trim(customer_input->>'notes'), ''), calculated_subtotal, calculated_shipping, calculated_subtotal + calculated_shipping)
  returning id into new_order_id;

  insert into public.order_items (order_id, product_id, product_slug, product_name, image_url, pack_size, quantity, unit_price, line_total)
  select new_order_id, item->>'id', item->>'slug', item->>'name', item->>'image', nullif(item->>'packSize', ''), (item->>'quantity')::integer, (item->>'price')::numeric, (item->>'price')::numeric * (item->>'quantity')::integer
  from jsonb_array_elements(items_input) item;

  return query select new_order_id, new_order_number;
end;
$$;

revoke all on function public.create_store_order(jsonb, jsonb) from public;
grant execute on function public.create_store_order(jsonb, jsonb) to anon, authenticated;
