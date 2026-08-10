create table if not exists product_reviews (
  id uuid primary key default gen_random_uuid(),
  product_slug text not null,
  product_name text not null,
  author_name text not null,
  rating integer not null check (rating between 1 and 5),
  review_text text not null check (char_length(review_text) between 10 and 600),
  status text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  created_at timestamptz not null default now()
);

create index if not exists product_reviews_slug_status_idx on product_reviews (product_slug, status, created_at desc);
