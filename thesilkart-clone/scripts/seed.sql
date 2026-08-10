-- Seed products into BangleByChoice database

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pen with glue pad', 'pen-with-glue-pad', 40, 50, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gums and glue pens', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/pen-with-glue-pad_0.webp', 'pen with glue pad | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pen with glue pad')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape glossy white', 'v-shape-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-glossy-white_0.webp', 'v shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape purpule colour matt', 'diamond-shape-purpule-colour-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-purpule-colour-matt_0.webp', 'diamond shape purpule colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape purpule colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('flat nose piler', 'flat-nose-piler', 80, 100, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cutters and pliers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/flat-nose-piler_0.webp', 'flat nose piler | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of flat nose piler')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('yash colour hanging beads', 'yash-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/yash-colour-hanging-beads_0.webp', 'yash colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of yash colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('soap blue colour 4mm round clipstones', 'soap-blue-colour-4mm-round-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/soap-blue-colour-4mm-round-clipstones_0.webp', 'soap blue colour 4mm round clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of soap blue colour 4mm round clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop shape gold colour clipstones', '10-8-size-drop-shape-gold-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-shape-gold-colour-clipstones_0.webp', '10*8 size drop shape gold colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop shape gold colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('dark green half moom glass kundans', 'dark-green-half-moom-glass-kundans', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/dark-green-half-moom-glass-kundans_0.webp', 'dark green half moom glass kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of dark green half moom glass kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle maroon matt', 'triangle-maroon-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'trianglr matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-maroon-matt_0.webp', 'triangle maroon matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle maroon matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size drop shape pestral colour-orange', '10-14-size-drop-shape-pestral-colour-orange', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestral-colour-orange_0.webp', '10*14 size drop shape pestral colour-orange | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size drop shape pestral colour-orange')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape orange glossy', 'v-shape-orange-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'v shape glossy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-orange-glossy_0.webp', 'v shape orange glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape orange glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye dark green matt', '8k-eye-dark-green-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-dark-green-matt_0.webp', '8k eye dark green matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye dark green matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k orange matt', '6k-orange-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-orange-matt_0.webp', '6k orange matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k orange matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape dark pink colour clipstones', '6mm-size-round-shape-dark-pink-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-dark-pink-colour-clipstones_0.webp', '6mm size round shape dark pink colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape dark pink colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape rainbow colour clipstones', '8mm-size-round-shape-rainbow-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-rainbow-colour-clipstones_0.webp', '8mm size round shape rainbow colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape rainbow colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Red colour flower shape brooch shells', 'red-colour-flower-shape-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/red-colour-flower-shape-brooch-shells_0.webp', 'Red colour flower shape brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Red colour flower shape brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round ceramic white', '3mm-round-ceramic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-ceramic-white_0.webp', '3mm round ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size drop shape pestral colour-white', '10-14-size-drop-shape-pestral-colour-white', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestral-colour-white_0.webp', '10*14 size drop shape pestral colour-white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size drop shape pestral colour-white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape green colour matt', 'diamond-shape-green-colour-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-green-colour-matt_0.webp', 'diamond shape green colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape green colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Coral Red Acrylic colour', 'coral-red-acrylic-colour', 25, 26, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Acrylic colours', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/coral-red-acrylic-colour_0.webp', 'Coral Red Acrylic colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Coral Red Acrylic colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size sequences colour-purpule', '4mm-size-sequences-colour-purpule', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm size sequences', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-sequences-colour-purpule_0.webp', '4mm size sequences colour-purpule | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size sequences colour-purpule')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Silver shade gear wire', 'silver-shade-gear-wire', 40, 50, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Gear wire and lock beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/silver-shade-gear-wire_0.webp', 'Silver shade gear wire | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Silver shade gear wire')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8K Eye shape matt lavender colour kundans', '8k-eye-shape-matt-lavender-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape pestral colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-matt-lavender-colour-kundans_0.webp', '8K Eye shape matt lavender colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8K Eye shape matt lavender colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop shape light green colour clipstones', '10-8-size-drop-shape-light-green-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-shape-light-green-colour-clipstones_0.webp', '10*8 size drop shape light green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop shape light green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size drop skyblue colour clipstones', '10-6-size-drop-skyblue-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-drop-skyblue-colour-clipstones_0.webp', '10*6 size drop skyblue colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size drop skyblue colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square light orange matt', '4-4-square-light-orange-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-light-orange-matt_0.webp', '4*4 square light orange matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square light orange matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape glossy white', '8k-eye-shape-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-glossy-white_0.webp', '8k eye shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('light black colour 10*8 size reactangle clipstones', 'light-black-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/light-black-colour-108-size-reactangle-clipstones_0.webp', 'light black colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of light black colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square ceramic gold', '4-4-square-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-ceramic-gold_0.webp', '4*4 square ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold sugar beads', 'gold-sugar-beads', 18, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'sugar beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-sugar-beads_0.webp', 'gold sugar beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold sugar beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape glossy white', '6k-eye-shape-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-glossy-white_0.webp', '6k eye shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round Rose pink glass', '4mm-round-rose-pink-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-rose-pink-glass_0.webp', '4mm round Rose pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round Rose pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('peach colour small cut beads', 'peach-colour-small-cut-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/peach-colour-small-cut-beads_0.webp', 'peach colour small cut beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of peach colour small cut beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm swaroski perals', '6mm-swaroski-perals', 260, 300, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'swaroski perals', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/6mm-swaroski-perals_0.webp', '6mm swaroski perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm swaroski perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye yellow matt', '8k-eye-yellow-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-yellow-matt_0.webp', '8k eye yellow matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye yellow matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round prupule glass', '4mm-round-prupule-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-prupule-glass_0.webp', '4mm round prupule glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round prupule glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('small s shape glossy white', 'small-s-shape-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/small-s-shape-glossy-white_0.webp', 'small s shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of small s shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop shape dark pink colour clipstones', '10-8-size-drop-shape-dark-pink-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-shape-dark-pink-colour-clipstones_0.webp', '10*8 size drop shape dark pink colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop shape dark pink colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2cut Flat bangles', '2cut-flat-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/2cut-flat-bangles_0.webp', '2cut Flat bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2cut Flat bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape light purpule glossy kundans', 'tilakam-shape-light-purpule-glossy-kundans', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-light-purpule-glossy-kundans_0.webp', 'Tilakam shape light purpule glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape light purpule glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle dark lavender matt', 'triangle-dark-lavender-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral triangle matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-dark-lavender-matt_0.webp', 'triangle dark lavender matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle dark lavender matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup dark blue glossy', '6k-droup-dark-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-dark-blue-glossy_0.webp', '6k droup dark blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup dark blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size drop shape pestral colour -purpulish pink', '10-14-size-drop-shape-pestral-colour-purpulish-pink', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestral-colour-purpulish-pink_0.webp', '10*14 size drop shape pestral colour -purpulish pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size drop shape pestral colour -purpulish pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('heart shape ceramic white', 'heart-shape-ceramic-white', 17, 24, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans ceramic gold and white', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/heart-shape-ceramic-white_0.webp', 'heart shape ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of heart shape ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape glossy gold', 'v-shape-glossy-gold', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-glossy-gold_0.webp', 'v shape glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour 10*8 size reactangle clipstones', 'gold-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-108-size-reactangle-clipstones_0.webp', 'gold colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle light peach colour matt', 'triangle-light-peach-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral triangle matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-light-peach-colour-matt_0.webp', 'triangle light peach colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle light peach colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle sky blue matt', 'triangle-sky-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'trianglr matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-sky-blue-matt_0.webp', 'triangle sky blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle sky blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1.5cm size gold colour laxmi coins', '1-5cm-size-gold-colour-laxmi-coins', 25, 30, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'laxmi coins and leaf charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/15cm-size-gold-colour-laxmi-coins_0.webp', '1.5cm size gold colour laxmi coins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1.5cm size gold colour laxmi coins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape dark pink glossy kundans', 'tilakam-shape-dark-pink-glossy-kundans', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-dark-pink-glossy-kundans_0.webp', 'Tilakam shape dark pink glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape dark pink glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Big s shape glossy white', 'big-s-shape-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/big-s-shape-glossy-white_0.webp', 'Big s shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Big s shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('sky bliu colour stone chaine', 'sky-bliu-colour-stone-chaine', 23, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/sky-bliu-colour-stone-chaine_0.webp', 'sky bliu colour stone chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of sky bliu colour stone chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold shade 4 hole connectors', 'gold-shade-4-hole-connectors', 40, 50, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/gold-shade-4-hole-connectors_0.webp', 'Gold shade 4 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold shade 4 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape purpule glossy kundans', '6k-eye-shape-purpule-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-purpule-glossy-kundans_0.webp', '6k eye shape purpule glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape purpule glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle orange glossy', '3-7-reactangle-orange-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-orange-glossy_0.webp', '3*7 reactangle orange glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle orange glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle sky blue glossy', 'triangle-sky-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-sky-blue-glossy_0.webp', 'Triangle sky blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle sky blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('crown shape glossy white', 'crown-shape-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/crown-shape-glossy-white_0.webp', 'crown shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of crown shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round orange glass', '3mm-round-orange-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-orange-glass_0.webp', '3mm round orange glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round orange glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-Moon shape', 'multicolour-kundans-moon-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-moon-shape_0.webp', 'multicolour kundans-Moon shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-Moon shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k drop ceramic white', '8k-drop-ceramic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-drop-ceramic-white_0.webp', '8k drop ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k drop ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye peach pink', '6k-eye-peach-pink', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-peach-pink_0.webp', '6k eye peach pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye peach pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop nemalikantam matt', '6k-drop-nemalikantam-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-nemalikantam-matt_0.webp', '6k drop nemalikantam matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop nemalikantam matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('banana clips', 'banana-clips', 10, 12, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/banana-clips_0.webp', 'banana clips | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of banana clips')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon orange matt', 'half-moon-orange-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-orange-matt_0.webp', 'half moon orange matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon orange matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold colour Memory wire', 'gold-colour-memory-wire', 10, 15, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Memory wire', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-memory-wire_0.webp', 'Gold colour Memory wire | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold colour Memory wire')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup light purpule glass', '6k-droup-light-purpule-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-light-purpule-glass_0.webp', '6k droup light purpule glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup light purpule glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF flower shape', 'mdf-flower-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-flower-shape_0.webp', 'MDF flower shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF flower shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon dark pink glass', 'half-moon-dark-pink-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-dark-pink-glass_0.webp', 'half moon dark pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon dark pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('purpule colour plastic jercons', 'purpule-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/purpule-colour-plastic-jercons_0.webp', 'purpule colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of purpule colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop shape red colour clipstones', '10-8-size-drop-shape-red-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-shape-red-colour-clipstones_0.webp', '10*8 size drop shape red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop shape red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape dark pink colour clipstones', '10-15-size-oval-shape-dark-pink-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-dark-pink-colour-clipstones_0.webp', '10*15 size oval shape dark pink colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape dark pink colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Mint green colour moon matt kundans', 'mint-green-colour-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/mint-green-colour-moon-matt-kundans_0.webp', 'Mint green colour moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Mint green colour moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle ceramic gold', 'triangle-ceramic-gold', 17, 24, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans ceramic gold and white', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-ceramic-gold_0.webp', 'triangle ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape light green colour clipstones', '8-8-size-square-shape-light-green-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-light-green-colour-clipstones_0.webp', '8*8 size square shape light green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape light green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape red colour matt', 'diamond-shape-red-colour-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-red-colour-matt_0.webp', 'diamond shape red colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape red colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square yellow glossy', '4-4-square-yellow-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-yellow-glossy_0.webp', '4*4 square yellow glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square yellow glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('heart shape ceramic gold', 'heart-shape-ceramic-gold', 17, 24, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans ceramic gold and white', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/heart-shape-ceramic-gold_0.webp', 'heart shape ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of heart shape ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('sky blue colour plastic jercons', 'sky-blue-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/sky-blue-colour-plastic-jercons_0.webp', 'sky blue colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of sky blue colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape light purpule glossy', '8k-eye-shape-light-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-light-purpule-glossy_0.webp', '8k eye shape light purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape light purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-6k drop shape', 'multicolour-kundans-6k-drop-shape', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-6k-drop-shape_0.webp', 'multicolour kundans-6k drop shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-6k drop shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square rainbow glossy', '4-4-square-rainbow-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-rainbow-glossy_0.webp', '4*4 square rainbow glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square rainbow glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('white colour 10*8 size reactangle clipstones', 'white-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/white-colour-108-size-reactangle-clipstones_0.webp', 'white colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of white colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Parrot marking', 'parrot-marking', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Marking papers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/parrot-marking_0.webp', 'Parrot marking | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Parrot marking')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Rose Flowers', 'rose-flowers', 20, 30, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Artifical Flowers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/rose-flowers_0.webp', 'Rose Flowers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Rose Flowers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape dark green colour clipstones', '6mm-size-round-shape-dark-green-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-dark-green-colour-clipstones_0.webp', '6mm size round shape dark green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape dark green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1.5cm mild gold kasulu', '1-5cm-mild-gold-kasulu', 20, 22, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'laxmi coins and leaf charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/15cm-mild-gold-kasulu_0.webp', '1.5cm mild gold kasulu | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1.5cm mild gold kasulu')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle red glossy', 'triangle-red-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-red-glossy_0.webp', 'Triangle red glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle red glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*4 size pressing covers', '3-4-size-pressing-covers', 15, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/34-size-pressing-covers_0.webp', '3*4 size pressing covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*4 size pressing covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape c green glossy', '8k-eye-shape-c-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–2 business daysTamil Nadu, Puducherry & Karnataka:2–4 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-c-green-glossy_0.webp', '8k eye shape c green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape c green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape gold colour clipstones', '10-6-size-eye-shape-gold-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-gold-colour-clipstones_0.webp', '10*6 size eye shape gold colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape gold colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size swaroski perals', '4mm-size-swaroski-perals', 240, 270, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'swaroski perals', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/4mm-size-swaroski-perals_0.webp', '4mm size swaroski perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size swaroski perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape kanakambaram pink colour matt', 'diamond-shape-kanakambaram-pink-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-kanakambaram-pink-colour-matt_0.webp', 'diamond shape kanakambaram pink colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape kanakambaram pink colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size bead caps', '4mm-size-bead-caps', 35, 45, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bead side caps', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/4mm-size-bead-caps_0.webp', '4mm size bead caps | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size bead caps')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle dark blue glossy kundans', '3-7-reactangle-dark-blue-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-dark-blue-glossy-kundans_0.webp', '3*7 reactangle dark blue glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle dark blue glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square dark purpule glossy', '4-4-square-dark-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-dark-purpule-glossy_0.webp', '4*4 square dark purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square dark purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-4mm round shape', 'multicolour-kundans-4mm-round-shape', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-4mm-round-shape_0.webp', 'multicolour kundans-4mm round shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-4mm round shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Light lavender colour moon matt kundans', 'light-lavender-colour-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/light-lavender-colour-moon-matt-kundans_0.webp', 'Light lavender colour moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Light lavender colour moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size reactangle dark blue colour', '10-14-size-reactangle-dark-blue-colour', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-reactangle-dark-blue-colour_0.webp', '10*14 size reactangle dark blue colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size reactangle dark blue colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye pinkish marron matt', '6k-eye-pinkish-marron-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-pinkish-marron-matt_0.webp', '6k eye pinkish marron matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye pinkish marron matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k size drop ceramic gold', '8k-size-drop-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-size-drop-ceramic-gold_0.webp', '8k size drop ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k size drop ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round c green colour glossy kundans', '4mm-round-c-green-colour-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-c-green-colour-glossy-kundans_0.webp', '4mm round c green colour glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round c green colour glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestral colour-sea blue', '10-15-size-oval-shape-pestral-colour-sea-blue', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestral-colour-sea-blue_0.webp', '10*15 size oval shape pestral colour-sea blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestral colour-sea blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Antique shade 5 hole connectors', 'antique-shade-5-hole-connectors', 40, 50, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/antique-shade-5-hole-connectors_0.webp', 'Antique shade 5 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Antique shade 5 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape sky blue glossy', 'v-shape-sky-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'v shape glossy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-sky-blue-glossy_0.webp', 'v shape sky blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape sky blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-8k eye shape', 'multicolour-kundans-8k-eye-shape', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-8k-eye-shape_0.webp', 'multicolour kundans-8k eye shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-8k eye shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6*6 square glossy white', '6-6-square-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/66-square-glossy-white_0.webp', '6*6 square glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6*6 square glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Red colour flower shape brooch shells', 'red-colour-flower-shape-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/red-colour-flower-shape-brooch-shells_0.webp', 'Red colour flower shape brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Red colour flower shape brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('marron colour plastic jercons', 'marron-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/marron-colour-plastic-jercons_0.webp', 'marron colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of marron colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestral colour-baby pink', '10-15-size-oval-shape-pestral-colour-baby-pink', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestral-colour-baby-pink_0.webp', '10*15 size oval shape pestral colour-baby pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestral colour-baby pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-4*4 square shape', 'multicolour-kundans-4-4-square-shape', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-44-square-shape_0.webp', 'multicolour kundans-4*4 square shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-4*4 square shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle dark pink glossy', '3-7-reactangle-dark-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-dark-pink-glossy_0.webp', '3*7 reactangle dark pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle dark pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size sequences colour-baby pink', '4mm-size-sequences-colour-baby-pink', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm size sequences', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-sequences-colour-baby-pink_0.webp', '4mm size sequences colour-baby pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size sequences colour-baby pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*3 square gold glossy', '3-3-square-gold-glossy', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/33-square-gold-glossy_0.webp', '3*3 square gold glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*3 square gold glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('orange colour 4mm round clipstones', 'orange-colour-4mm-round-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/orange-colour-4mm-round-clipstones_0.webp', 'orange colour 4mm round clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of orange colour 4mm round clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape dark blue colour clipstones', '10-15-size-oval-shape-dark-blue-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-dark-blue-colour-clipstones_0.webp', '10*15 size oval shape dark blue colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape dark blue colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape rainbow colour clipstones', '6mm-size-round-shape-rainbow-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-rainbow-colour-clipstones_0.webp', '6mm size round shape rainbow colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape rainbow colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt mint green colour kundans', '4-4-square-matt-mint-green-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-mint-green-colour-kundans_0.webp', '4*4 square matt mint green colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt mint green colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF 1.5 inch jada billa base round shape', 'mdf-1-5-inch-jada-billa-base-round-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-15-inch-jada-billa-base-round-shape_0.webp', 'MDF 1.5 inch jada billa base round shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF 1.5 inch jada billa base round shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle dark blue glossy', 'triangle-dark-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-dark-blue-glossy_0.webp', 'Triangle dark blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle dark blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape dark pink matt', 'diamond-shape-dark-pink-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-dark-pink-matt_0.webp', 'diamond shape dark pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape dark pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF mango shape', 'mdf-mango-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-mango-shape_0.webp', 'MDF mango shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF mango shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle purpule matt', 'triangle-purpule-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'trianglr matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-purpule-matt_0.webp', 'triangle purpule matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle purpule matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-pista green', 'drop-shape-crystal-beads-pista-green', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-pista-green_0.webp', 'drop shape crystal beads-pista green | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-pista green')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon sky blue glass', 'half-moon-sky-blue-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-sky-blue-glass_0.webp', 'half moon sky blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon sky blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape dark blue matt', 'diamond-shape-dark-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-dark-blue-matt_0.webp', 'diamond shape dark blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape dark blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Ganesh charms', 'ganesh-charms', 15, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/ganesh-charms_0.webp', 'Ganesh charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Ganesh charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape sky blue glossy', '8k-eye-shape-sky-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-sky-blue-glossy_0.webp', '8k eye shape sky blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape sky blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape c green glossy', 'diamond-shape-c-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-c-green-glossy_0.webp', 'Diamond shape c green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape c green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Green Acrylic colour', 'green-acrylic-colour', 25, 26, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Acrylic colours', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/green-acrylic-colour_0.webp', 'Green Acrylic colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Green Acrylic colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape yellow glossy', '6k-eye-shape-yellow-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-yellow-glossy_0.webp', '6k Eye shape yellow glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape yellow glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('double face leaf charms model no:2', 'double-face-leaf-charms-model-no-2', 5, 7, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/double-face-leaf-charms-model-no2_0.webp', 'double face leaf charms model no:2 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of double face leaf charms model no:2')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8 hole connectors', '8-hole-connectors', 60, 70, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/8-hole-connectors_0.webp', '8 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-tomato red', 'drop-shape-crystal-beads-tomato-red', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-tomato-red_0.webp', 'drop shape crystal beads-tomato red | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-tomato red')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape sky blue colour clipstones', '10-6-size-eye-shape-sky-blue-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-sky-blue-colour-clipstones_0.webp', '10*6 size eye shape sky blue colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape sky blue colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Double facing peacock marking', 'double-facing-peacock-marking', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Marking papers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/double-facing-peacock-marking_0.webp', 'Double facing peacock marking | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Double facing peacock marking')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape matt lavender colour kundans', '6k-eye-shape-matt-lavender-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6K  Eye shape pestral matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-matt-lavender-colour-kundans_0.webp', '6k Eye shape matt lavender colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape matt lavender colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size droup pestral lemon yellow colour clipstones', '10-6-size-droup-pestral-lemon-yellow-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-droup-pestral-lemon-yellow-colour-clipstones_0.webp', '10*6 size droup pestral lemon yellow colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size droup pestral lemon yellow colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape sky blue colour glossy kundans', '6k-eye-shape-sky-blue-colour-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-sky-blue-colour-glossy-kundans_0.webp', '6k eye shape sky blue colour glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape sky blue colour glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Multicolour Matt Kundans-6k eye shape', 'multicolour-matt-kundans-6k-eye-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour Matt Kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-matt-kundans-6k-eye-shape_0.webp', 'Multicolour Matt Kundans-6k eye shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Multicolour Matt Kundans-6k eye shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('lakshmi with mango pendents', 'lakshmi-with-mango-pendents', 100, 110, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cz pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/lakshmi-with-mango-pendents_0.webp', 'lakshmi with mango pendents | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of lakshmi with mango pendents')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape light green glossy', '8k-eye-shape-light-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-light-green-glossy_0.webp', '8k eye shape light green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape light green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape silver colour raindrop kundans', '8-4-size-eye-shape-silver-colour-raindrop-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-silver-colour-raindrop-kundans_0.webp', '8*4 size eye shape silver colour raindrop kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape silver colour raindrop kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size red colour reactangle clipstones', '10-14-size-red-colour-reactangle-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-red-colour-reactangle-clipstones_0.webp', '10*14 size red colour reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size red colour reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink jadav heart shape with 2 connectors', 'pink-jadav-heart-shape-with-2-connectors', 24, 26, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pink-jadav-heart-shape-with-2-connectors_0.webp', 'pink jadav heart shape with 2 connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink jadav heart shape with 2 connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1cut Flat bangles', '1cut-flat-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/1cut-flat-bangles_0.webp', '1cut Flat bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1cut Flat bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round ceramic gold', '4mm-round-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-ceramic-gold_0.webp', '4mm round ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon light green matt', 'half-moon-light-green-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-light-green-matt_0.webp', 'half moon light green matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon light green matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 706', 'lotus-silk-thread-shade-no-706', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-706_0.webp', 'Lotus silk Thread-shade No. 706 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 706')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('double face elephant charms no:2', 'double-face-elephant-charms-no-2', 35, 40, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/double-face-elephant-charms-no2_0.webp', 'double face elephant charms no:2 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of double face elephant charms no:2')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape red colour glossy', '8k-eye-shape-red-colour-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–2 business daysTamil Nadu, Puducherry & Karnataka:2–4 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-red-colour-glossy_0.webp', '8k eye shape red colour glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape red colour glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square red glossy', '4-4-square-red-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-red-glossy_0.webp', '4*4 square red glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square red glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop glossy gold', '6k-drop-glossy-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-glossy-gold_0.webp', '6k drop glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape light green colour clipstones', '10-6-size-eye-shape-light-green-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-light-green-colour-clipstones_0.webp', '10*6 size eye shape light green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape light green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF star shape', 'mdf-star-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-star-shape_0.webp', 'MDF star shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF star shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver colour small cut beads', 'silver-colour-small-cut-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/silver-colour-small-cut-beads_0.webp', 'silver colour small cut beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver colour small cut beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm size gold beads', '3mm-size-gold-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold colour beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/3mm-size-gold-beads_0.webp', '3mm size gold beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm size gold beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle purpule glossy', '3-7-reactangle-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-purpule-glossy_0.webp', '3*7 reactangle purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('rainbow colour 4mm round clipstones', 'rainbow-colour-4mm-round-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/rainbow-colour-4mm-round-clipstones_0.webp', 'rainbow colour 4mm round clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of rainbow colour 4mm round clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape glossy gold', 'diamond-shape-glossy-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-glossy-gold_0.webp', 'diamond shape glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('dull gold micro gold balls', 'dull-gold-micro-gold-balls', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold colour beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/dull-gold-micro-gold-balls_0.webp', 'dull gold micro gold balls | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of dull gold micro gold balls')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Rubber Band attachers', 'rubber-band-attachers', 3, 4, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Rubber bands and u pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/rubber-band-attachers_0.webp', 'Rubber Band attachers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Rubber Band attachers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round dark pink glass', '3mm-round-dark-pink-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-dark-pink-glass_0.webp', '3mm round dark pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round dark pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm ceramic white', '4mm-ceramic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-ceramic-white_0.webp', '4mm ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold colour round french hooks', 'gold-colour-round-french-hooks', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'earring material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-round-french-hooks_0.webp', 'Gold colour round french hooks | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold colour round french hooks')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('sky blue colour small cut beads', 'sky-blue-colour-small-cut-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/sky-blue-colour-small-cut-beads_0.webp', 'sky blue colour small cut beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of sky blue colour small cut beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye kanakambaram pink matt', '8k-eye-kanakambaram-pink-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-kanakambaram-pink-matt_0.webp', '8k eye kanakambaram pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye kanakambaram pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape ice blue colour matt', 'diamond-shape-ice-blue-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-ice-blue-colour-matt_0.webp', 'diamond shape ice blue colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape ice blue colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape light green colour clipstones', '10-15-size-oval-shape-light-green-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-light-green-colour-clipstones_0.webp', '10*15 size oval shape light green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape light green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('0.8 inch gold colour bases', '0-8-inch-gold-colour-bases', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Plastic gold colour bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/08-inch-gold-colour-bases_0.webp', '0.8 inch gold colour bases | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 0.8 inch gold colour bases')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape rainbow colour raindroup kundans', '8-4-size-eye-shape-rainbow-colour-raindroup-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-rainbow-colour-raindroup-kundans_0.webp', '8*4 size eye shape rainbow colour raindroup kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape rainbow colour raindroup kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('flat plain bangle boxes 2 cut', 'flat-plain-bangle-boxes-2-cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/flat-plain-bangle-boxes-2-cut_0.webp', 'flat plain bangle boxes 2 cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of flat plain bangle boxes 2 cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon kanakambaram pink matt', 'half-moon-kanakambaram-pink-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-kanakambaram-pink-matt_0.webp', 'half moon kanakambaram pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon kanakambaram pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round yellow colour  glossy kundans', '4mm-round-yellow-colour-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-yellow-colour-glossy-kundans_0.webp', '4mm round yellow colour  glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round yellow colour  glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestrak colour-lemon yellow', '10-15-size-oval-shape-pestrak-colour-lemon-yellow', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestrak-colour-lemon-yellow_0.webp', '10*15 size oval shape pestrak colour-lemon yellow | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestrak colour-lemon yellow')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('flat plain bangle boxes 1 cut', 'flat-plain-bangle-boxes-1-cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/flat-plain-bangle-boxes-1-cut_0.webp', 'flat plain bangle boxes 1 cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of flat plain bangle boxes 1 cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Small business kit', 'small-business-kit', 5000, 5100, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Beginner kits', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/small-business-kit_0.webp', 'Small business kit | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Small business kit')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop red matt', '6k-drop-red-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-red-matt_0.webp', '6k drop red matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop red matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestral colour-white', '10-15-size-oval-shape-pestral-colour-white', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestral-colour-white_0.webp', '10*15 size oval shape pestral colour-white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestral colour-white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink jadav Lotus with 2 side connectors', 'pink-jadav-lotus-with-2-side-connectors', 70, 80, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pink-jadav-lotus-with-2-side-connectors_0.webp', 'pink jadav Lotus with 2 side connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink jadav Lotus with 2 side connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Light pistha green colour moon matt', 'light-pistha-green-colour-moon-matt', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/light-pistha-green-colour-moon-matt_0.webp', 'Light pistha green colour moon matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Light pistha green colour moon matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flower shape pestral colour brooch shells', 'flower-shape-pestral-colour-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/flower-shape-pestral-colour-brooch-shells_0.webp', 'Flower shape pestral colour brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flower shape pestral colour brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('earring material-hangings', 'earring-material-hangings', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'earring material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/earring-material-hangings_0.webp', 'earring material-hangings | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of earring material-hangings')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape matt brown colour matt', '6k-eye-shape-matt-brown-colour-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6K  Eye shape pestral matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-matt-brown-colour-matt_0.webp', '6k Eye shape matt brown colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape matt brown colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape sky blue glossy', 'diamond-shape-sky-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-sky-blue-glossy_0.webp', 'Diamond shape sky blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape sky blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestral colour-peach', '10-15-size-oval-shape-pestral-colour-peach', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestral-colour-peach_0.webp', '10*15 size oval shape pestral colour-peach | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestral colour-peach')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('peral chaine', 'peral-chaine', 20, 22, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/peral-chaine_0.webp', 'peral chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of peral chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Light lilac shade moon matt kundans', 'light-lilac-shade-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/light-lilac-shade-moon-matt-kundans_0.webp', 'Light lilac shade moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Light lilac shade moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Ganesh charms', 'ganesh-charms', 15, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/ganesh-charms_0.webp', 'Ganesh charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Ganesh charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Multicolour Matt Kundans-moon shape', 'multicolour-matt-kundans-moon-shape', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour Matt Kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-matt-kundans-moon-shape_0.webp', 'Multicolour Matt Kundans-moon shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Multicolour Matt Kundans-moon shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('skyblue colour 4mm round clipstones', 'skyblue-colour-4mm-round-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/skyblue-colour-4mm-round-clipstones_0.webp', 'skyblue colour 4mm round clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of skyblue colour 4mm round clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour micro beads', 'gold-colour-micro-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold colour beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-micro-beads_0.webp', 'gold colour micro beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour micro beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flat mixed bangle box-2,4and6cuts', 'flat-mixed-bangle-box-2-4and6cuts', 135, 150, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangle boxes mixed', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/flat-mixed-bangle-box-24and6cuts_0.webp', 'Flat mixed bangle box-2,4and6cuts | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flat mixed bangle box-2,4and6cuts')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flat mixed box-1,2,4 and 6 cut', 'flat-mixed-box-1-2-4-and-6-cut', 135, 150, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangle boxes mixed', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/flat-mixed-box-124-and-6-cut_0.webp', 'Flat mixed box-1,2,4 and 6 cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flat mixed box-1,2,4 and 6 cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt orange colour kundans', '4-4-square-matt-orange-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-orange-colour-kundans_0.webp', '4*4 square matt orange colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt orange colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('peral with gold colour stone chaine', 'peral-with-gold-colour-stone-chaine', 23, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/peral-with-gold-colour-stone-chaine_0.webp', 'peral with gold colour stone chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of peral with gold colour stone chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('slides gold colour', 'slides-gold-colour', 60, 70, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/slides-gold-colour_0.webp', 'slides gold colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of slides gold colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape Red colour clipstones', '8-8-size-square-shape-red-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-red-colour-clipstones_0.webp', '8*8 size square shape Red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape Red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('red colour stone chaine', 'red-colour-stone-chaine', 23, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/red-colour-stone-chaine_0.webp', 'red colour stone chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of red colour stone chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop pink matt', '6k-drop-pink-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-pink-matt_0.webp', '6k drop pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('red colour small cut beads', 'red-colour-small-cut-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/red-colour-small-cut-beads_0.webp', 'red colour small cut beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of red colour small cut beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Black shade gear wire', 'black-shade-gear-wire', 70, 80, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Gear wire and lock beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/black-shade-gear-wire_0.webp', 'Black shade gear wire | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Black shade gear wire')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle green matt', 'triangle-green-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'trianglr matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-green-matt_0.webp', 'triangle green matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle green matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Cz drops', 'cz-drops', 100, 110, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cz pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/cz-drops_0.webp', 'Cz drops | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Cz drops')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size oval shape colour-gold', '10-8-size-oval-shape-colour-gold', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-oval-shape-colour-gold_0.webp', '10*8 size oval shape colour-gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size oval shape colour-gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape light pistha green colour matt', 'diamond-shape-light-pistha-green-colour-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-light-pistha-green-colour-matt_0.webp', 'diamond shape light pistha green colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape light pistha green colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('7.5 inch back pati chaine', '7-5-inch-back-pati-chaine', 70, 85, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Back chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/75-inch-back-pati-chaine_0.webp', '7.5 inch back pati chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 7.5 inch back pati chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('curve plain bangle boxes 2cut', 'curve-plain-bangle-boxes-2cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/curve-plain-bangle-boxes-2cut_0.webp', 'curve plain bangle boxes 2cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of curve plain bangle boxes 2cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape ceramic gold', '6k-eye-shape-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-ceramic-gold_0.webp', '6k eye shape ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye dark blue matt', '8k-eye-dark-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-dark-blue-matt_0.webp', '8k eye dark blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye dark blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold eye pins', 'gold-eye-pins', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye pins and head pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-eye-pins_0.webp', 'gold eye pins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold eye pins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size oval shape-baby pink colour', '10-8-size-oval-shape-baby-pink-colour', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-oval-shape-baby-pink-colour_0.webp', '10*8 size oval shape-baby pink colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size oval shape-baby pink colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Pear shaped jadav pink kundan with 2 connectors', 'pear-shaped-jadav-pink-kundan-with-2-connectors', 24, 26, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pear-shaped-jadav-pink-kundan-with-2-connectors_0.webp', 'Pear shaped jadav pink kundan with 2 connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Pear shaped jadav pink kundan with 2 connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm bead caps', '6mm-bead-caps', 40, 50, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bead side caps', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/6mm-bead-caps_0.webp', '6mm bead caps | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm bead caps')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Pear shaped jadav Green kundan with 2 connectors', 'pear-shaped-jadav-green-kundan-with-2-connectors', 24, 26, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pear-shaped-jadav-green-kundan-with-2-connectors_0.webp', 'Pear shaped jadav Green kundan with 2 connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Pear shaped jadav Green kundan with 2 connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape multi colour clipsones', '8-8-size-square-shape-multi-colour-clipsones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-multi-colour-clipsones_0.webp', '8*8 size square shape multi colour clipsones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape multi colour clipsones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape dark green glossy', '6k-eye-shape-dark-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-dark-green-glossy_0.webp', '6k Eye shape dark green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape dark green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*5 size pressing covers', '4-5-size-pressing-covers', 20, 22, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/45-size-pressing-covers_0.webp', '4*5 size pressing covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*5 size pressing covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Black colour rubber bands', 'black-colour-rubber-bands', 4, 5, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Rubber bands and u pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/black-colour-rubber-bands_0.webp', 'Black colour rubber bands | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Black colour rubber bands')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle shape ceramic white', 'triangle-shape-ceramic-white', 17, 24, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans ceramic gold and white', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-shape-ceramic-white_0.webp', 'triangle shape ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle shape ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2mm swaroski perals', '2mm-swaroski-perals', 290, 330, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'swaroski perals', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/2mm-swaroski-perals_0.webp', '2mm swaroski perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2mm swaroski perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape dark blue colour clipstone', '6mm-size-round-shape-dark-blue-colour-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-dark-blue-colour-clipstone_0.webp', '6mm size round shape dark blue colour clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape dark blue colour clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('doup shape crystal beads-white', 'doup-shape-crystal-beads-white', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/doup-shape-crystal-beads-white_0.webp', 'doup shape crystal beads-white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of doup shape crystal beads-white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('red colour plastic jercons', 'red-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/red-colour-plastic-jercons_0.webp', 'red colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of red colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape baby pink glossy kundans', 'diamond-shape-baby-pink-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-baby-pink-glossy-kundans_0.webp', 'Diamond shape baby pink glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape baby pink glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape light pink colour clipstones', '8mm-size-round-shape-light-pink-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-light-pink-colour-clipstones_0.webp', '8mm size round shape light pink colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape light pink colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Leaf shape multi colour brooch shells', 'leaf-shape-multi-colour-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/leaf-shape-multi-colour-brooch-shells_0.webp', 'Leaf shape multi colour brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Leaf shape multi colour brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('white colour 4mm round clipstone', 'white-colour-4mm-round-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/white-colour-4mm-round-clipstone_0.webp', 'white colour 4mm round clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of white colour 4mm round clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval size gold colour clipstones', '10-15-size-oval-size-gold-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-size-gold-colour-clipstones_0.webp', '10*15 size oval size gold colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval size gold colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm gold colour beads', '3mm-gold-colour-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold colour beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/3mm-gold-colour-beads_0.webp', '3mm gold colour beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm gold colour beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye c green matt', '8k-eye-c-green-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-c-green-matt_0.webp', '8k eye c green matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye c green matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape dark green glossy', 'v-shape-dark-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'v shape glossy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-dark-green-glossy_0.webp', 'v shape dark green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape dark green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-Diamond shape', 'multicolour-kundans-diamond-shape', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-diamond-shape_0.webp', 'multicolour kundans-Diamond shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-Diamond shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('orange colour sugar beads', 'orange-colour-sugar-beads', 18, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'sugar beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/orange-colour-sugar-beads_0.webp', 'orange colour sugar beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of orange colour sugar beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon yellow matt', 'half-moon-yellow-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-yellow-matt_0.webp', 'half moon yellow matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon yellow matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flower shape multi colour brooch sheels', 'flower-shape-multi-colour-brooch-sheels', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/flower-shape-multi-colour-brooch-sheels_0.webp', 'Flower shape multi colour brooch sheels | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flower shape multi colour brooch sheels')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round red glass', '3mm-round-red-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-red-glass_0.webp', '3mm round red glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round red glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lavender colour flower shape brooch shells', 'lavender-colour-flower-shape-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/lavender-colour-flower-shape-brooch-shells_0.webp', 'Lavender colour flower shape brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lavender colour flower shape brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('double face leaf charms model no:1', 'double-face-leaf-charms-model-no-1', 5, 7, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/double-face-leaf-charms-model-no1_0.webp', 'double face leaf charms model no:1 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of double face leaf charms model no:1')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flat painting brushes set of 7', 'flat-painting-brushes-set-of-7', 300, 320, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Painting brushes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/flat-painting-brushes-set-of-7_0.webp', 'Flat painting brushes set of 7 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flat painting brushes set of 7')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop white matt', '6k-drop-white-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-white-matt_0.webp', '6k drop white matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop white matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round dark purpule glass', '3mm-round-dark-purpule-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-dark-purpule-glass_0.webp', '3mm round dark purpule glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round dark purpule glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size drop shape peach colour clipstone', '10-6-size-drop-shape-peach-colour-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-drop-shape-peach-colour-clipstone_0.webp', '10*6 size drop shape peach colour clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size drop shape peach colour clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('light green colour 10*8 size reactangle clipstones', 'light-green-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/light-green-colour-108-size-reactangle-clipstones_0.webp', 'light green colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of light green colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup light green glossy', '6k-droup-light-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-light-green-glossy_0.webp', '6k droup light green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup light green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye nemali kantam matt', '6k-eye-nemali-kantam-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-nemali-kantam-matt_0.webp', '6k eye nemali kantam matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye nemali kantam matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('peach colour 10*8 size reactangle clipstones', 'peach-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/peach-colour-108-size-reactangle-clipstones_0.webp', 'peach colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of peach colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('brown colour sugar beads', 'brown-colour-sugar-beads', 18, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'sugar beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/brown-colour-sugar-beads_0.webp', 'brown colour sugar beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of brown colour sugar beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape dark purpule glossy', '6k-eye-shape-dark-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-dark-purpule-glossy_0.webp', '6k Eye shape dark purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape dark purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye red matt', '6k-eye-red-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-red-matt_0.webp', '6k eye red matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye red matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square white colour matt', '4-4-square-white-colour-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-white-colour-matt_0.webp', '4*4 square white colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square white colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon orange glass', 'half-moon-orange-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-orange-glass_0.webp', 'half moon orange glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon orange glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink mango jadav pendent', 'pink-mango-jadav-pendent', 300, 350, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pink-mango-jadav-pendent_0.webp', 'pink mango jadav pendent | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink mango jadav pendent')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('small star glossy white', 'small-star-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/small-star-glossy-white_0.webp', 'small star glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of small star glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink jadav circle shape with 2 connectors', 'pink-jadav-circle-shape-with-2-connectors', 24, 26, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pink-jadav-circle-shape-with-2-connectors_0.webp', 'pink jadav circle shape with 2 connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink jadav circle shape with 2 connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round glossy white', '4mm-round-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-glossy-white_0.webp', '4mm round glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4 cut curve bangles', '4-cut-curve-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/4-cut-curve-bangles_0.webp', '4 cut curve bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4 cut curve bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver tube beads', 'silver-tube-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/silver-tube-beads_0.webp', 'silver tube beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver tube beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon krishna blue glass', 'half-moon-krishna-blue-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-krishna-blue-glass_0.webp', 'half moon krishna blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon krishna blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt light pista green colour kundans', '4-4-square-matt-light-pista-green-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-light-pista-green-colour-kundans_0.webp', '4*4 square matt light pista green colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt light pista green colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round black glass', '3mm-round-black-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-black-glass_0.webp', '3mm round black glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round black glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round dark blue glass', '4mm-round-dark-blue-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-dark-blue-glass_0.webp', '4mm round dark blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round dark blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop ceramic gold', '6k-drop-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-ceramic-gold_0.webp', '6k drop ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6 hole connectors', '6-hole-connectors', 60, 70, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/6-hole-connectors_0.webp', '6 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8K Eye shape matt peach colour kundans', '8k-eye-shape-matt-peach-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape pestral colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-matt-peach-colour-kundans_0.webp', '8K Eye shape matt peach colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8K Eye shape matt peach colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape Red colour clipstones', '8mm-size-round-shape-red-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-red-colour-clipstones_0.webp', '8mm size round shape Red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape Red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 63S', 'lotus-silk-thread-shade-no-63s', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-63s_0.webp', 'Lotus silk Thread-shade No. 63S | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 63S')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round glossy gold', '3mm-round-glossy-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-glossy-gold_0.webp', '3mm round glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape dark pesara pacha colour matt', 'diamond-shape-dark-pesara-pacha-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-dark-pesara-pacha-colour-matt_0.webp', 'diamond shape dark pesara pacha colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape dark pesara pacha colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4cut flat bangles', '4cut-flat-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/4cut-flat-bangles_0.webp', '4cut flat bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4cut flat bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Curve mixed bangle box-2,4and6cuts', 'curve-mixed-bangle-box-2-4and6cuts', 135, 150, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangle boxes mixed', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/curve-mixed-bangle-box-24and6cuts_0.webp', 'Curve mixed bangle box-2,4and6cuts | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Curve mixed bangle box-2,4and6cuts')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round sky blye glass', '4mm-round-sky-blye-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-sky-blye-glass_0.webp', '4mm round sky blye glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round sky blye glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour tiktaks', 'gold-colour-tiktaks', 60, 70, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-tiktaks_0.webp', 'gold colour tiktaks | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour tiktaks')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-peach', 'drop-shape-crystal-beads-peach', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-peach_0.webp', 'drop shape crystal beads-peach | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-peach')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size sequences colour-dark blue', '4mm-size-sequences-colour-dark-blue', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm size sequences', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-sequences-colour-dark-blue_0.webp', '4mm size sequences colour-dark blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size sequences colour-dark blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round light green glass', '4mm-round-light-green-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-light-green-glass_0.webp', '4mm round light green glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round light green glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 squre yellow matt', '4-4-squre-yellow-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-squre-yellow-matt_0.webp', '4*4 squre yellow matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 squre yellow matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye yash matt', '6k-eye-yash-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-yash-matt_0.webp', '6k eye yash matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye yash matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink square jadav pendent with 2 connectors', 'pink-square-jadav-pendent-with-2-connectors', 24, 26, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pink-square-jadav-pendent-with-2-connectors_0.webp', 'pink square jadav pendent with 2 connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink square jadav pendent with 2 connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestral coloue-blue', '10-15-size-oval-shape-pestral-coloue-blue', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestral-coloue-blue_0.webp', '10*15 size oval shape pestral coloue-blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestral coloue-blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 87N', 'lotus-silk-thread-shade-no-87n', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-87n_0.webp', 'Lotus silk Thread-shade No. 87N | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 87N')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 9D', 'lotus-silk-thread-shade-no-9d', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-9d_0.webp', 'Lotus silk Thread-shade No. 9D | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 9D')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop skyblue matt', '6k-drop-skyblue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-skyblue-matt_0.webp', '6k drop skyblue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop skyblue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3 hole broch pins', '3-hole-broch-pins', 4, 5, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'saree pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/3-hole-broch-pins_0.webp', '3 hole broch pins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3 hole broch pins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape marron colour clipstones', '10-6-size-eye-shape-marron-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-marron-colour-clipstones_0.webp', '10*6 size eye shape marron colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape marron colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape dark green colour clipstones', '10-15-size-oval-shape-dark-green-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-dark-green-colour-clipstones_0.webp', '10*15 size oval shape dark green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape dark green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm antique gold beads', '3mm-antique-gold-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold colour beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/3mm-antique-gold-beads_0.webp', '3mm antique gold beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm antique gold beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape peacock blue colour raindroup kundans', '8-4-size-eye-shape-peacock-blue-colour-raindroup-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-peacock-blue-colour-raindroup-kundans_0.webp', '8*4 size eye shape peacock blue colour raindroup kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape peacock blue colour raindroup kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('light pink colour 10*8 size reactangle clipstones', 'light-pink-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/light-pink-colour-108-size-reactangle-clipstones_0.webp', 'light pink colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of light pink colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye purpule matt', '6k-eye-purpule-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-purpule-matt_0.webp', '6k eye purpule matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye purpule matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square marr light lilac colour kundans', '4-4-square-marr-light-lilac-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-marr-light-lilac-colour-kundans_0.webp', '4*4 square marr light lilac colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square marr light lilac colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye sky blue matt', '6k-eye-sky-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-sky-blue-matt_0.webp', '6k eye sky blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye sky blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon white matt', 'half-moon-white-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-white-matt_0.webp', 'half moon white matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon white matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape dark pink glossy', 'v-shape-dark-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'v shape glossy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-dark-pink-glossy_0.webp', 'v shape dark pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape dark pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink Acrylic colour', 'pink-acrylic-colour', 25, 26, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Acrylic colours', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/pink-acrylic-colour_0.webp', 'pink Acrylic colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink Acrylic colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle dark green glossy', 'triangle-dark-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-dark-green-glossy_0.webp', 'Triangle dark green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle dark green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt violet colour kundans', '4-4-square-matt-violet-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-violet-colour-kundans_0.webp', '4*4 square matt violet colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt violet colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape white colour clipstones', '8mm-size-round-shape-white-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-white-colour-clipstones_0.webp', '8mm size round shape white colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape white colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape gold colour clipstones', '8mm-size-round-shape-gold-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-gold-colour-clipstones_0.webp', '8mm size round shape gold colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape gold colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver colour ball chaine', 'silver-colour-ball-chaine', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/silver-colour-ball-chaine_0.webp', 'silver colour ball chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver colour ball chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*4 size stick covers', '3-4-size-stick-covers', 13, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/34-size-stick-covers_0.webp', '3*4 size stick covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*4 size stick covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle glossy gold', '3-7-reactangle-glossy-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-glossy-gold_0.webp', '3*7 reactangle glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF triangle shape', 'mdf-triangle-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-triangle-shape_0.webp', 'MDF triangle shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF triangle shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multi colour hanging beads', 'multi-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/multi-colour-hanging-beads_0.webp', 'multi colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multi colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Round lakshmi devi Pendents', 'round-lakshmi-devi-pendents', 100, 110, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cz pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/round-lakshmi-devi-pendents_0.webp', 'Round lakshmi devi Pendents | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Round lakshmi devi Pendents')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold polish chandraharam chaine 24 inch length', 'gold-polish-chandraharam-chaine-24-inch-length', 100, 120, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'peral and chandraharam chaine', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/gold-polish-chandraharam-chaine-24-inch-length_0.webp', 'gold polish chandraharam chaine 24 inch length | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold polish chandraharam chaine 24 inch length')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF 2 inch jada billa base round shape', 'mdf-2-inch-jada-billa-base-round-shape', 4, 5, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-2-inch-jada-billa-base-round-shape_0.webp', 'MDF 2 inch jada billa base round shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF 2 inch jada billa base round shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('5mm round ceramic white', '5mm-round-ceramic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/5mm-round-ceramic-white_0.webp', '5mm round ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 5mm round ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape rainbow colour clipstones', '10-6-size-eye-shape-rainbow-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-rainbow-colour-clipstones_0.webp', '10*6 size eye shape rainbow colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape rainbow colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape pink colour raindroup kundans', '8-4-size-eye-shape-pink-colour-raindroup-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-pink-colour-raindroup-kundans_0.webp', '8*4 size eye shape pink colour raindroup kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape pink colour raindroup kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('B-7000 glue 50ml', 'b-7000-glue-50ml', 65, 80, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gums and glue pens', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/b-7000-glue-50ml_0.webp', 'B-7000 glue 50ml | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of B-7000 glue 50ml')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 28', 'lotus-silk-thread-shade-no-28', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-28_0.webp', 'Lotus silk Thread-shade No. 28 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 28')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup sky blue glossy', '6k-droup-sky-blue-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-sky-blue-glossy_0.webp', '6k droup sky blue glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup sky blue glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('round nose piler', 'round-nose-piler', 80, 100, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cutters and pliers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/round-nose-piler_0.webp', 'round nose piler | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of round nose piler')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape dark pink colour clipstones', '8mm-size-round-shape-dark-pink-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-dark-pink-colour-clipstones_0.webp', '8mm size round shape dark pink colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape dark pink colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Drop with flower lockets-Cz stones', 'drop-with-flower-lockets-cz-stones', 100, 110, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cz pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/drop-with-flower-lockets-cz-stones_0.webp', 'Drop with flower lockets-Cz stones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Drop with flower lockets-Cz stones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6K Eye shape matt violet colour kundans', '6k-eye-shape-matt-violet-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6K  Eye shape pestral matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-matt-violet-colour-kundans_0.webp', '6K Eye shape matt violet colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6K Eye shape matt violet colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle dark green glossy', '3-7-reactangle-dark-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-dark-green-glossy_0.webp', '3*7 reactangle dark green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle dark green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape glossy white', 'diamond-shape-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-glossy-white_0.webp', 'Diamond shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 skyblue colour matt', '4-4-skyblue-colour-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-skyblue-colour-matt_0.webp', '4*4 skyblue colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 skyblue colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape nemali kantam colour matt', 'diamond-shape-nemali-kantam-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-nemali-kantam-colour-matt_0.webp', 'diamond shape nemali kantam colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape nemali kantam colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape red colour clipstones', '10-6-size-eye-shape-red-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-red-colour-clipstones_0.webp', '10*6 size eye shape red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size  drop shape pestarl colours-sea blue', '10-14-size-drop-shape-pestarl-colours-sea-blue', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestarl-colours-sea-blue_0.webp', '10*14 size  drop shape pestarl colours-sea blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size  drop shape pestarl colours-sea blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('onion pink 4mm round clipstone', 'onion-pink-4mm-round-clipstone', 25, 30, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/onion-pink-4mm-round-clipstone_0.webp', 'onion pink 4mm round clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of onion pink 4mm round clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square rose pink glossy', '4-4-square-rose-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-rose-pink-glossy_0.webp', '4*4 square rose pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square rose pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape rose pink colour raindrop kundans', '8-4-size-eye-shape-rose-pink-colour-raindrop-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-rose-pink-colour-raindrop-kundans_0.webp', '8*4 size eye shape rose pink colour raindrop kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape rose pink colour raindrop kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape multi colour clipstones', '10-6-size-eye-shape-multi-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-multi-colour-clipstones_0.webp', '10*6 size eye shape multi colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape multi colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle red matt', 'triangle-red-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'trianglr matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-red-matt_0.webp', 'triangle red matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle red matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF flower shape', 'mdf-flower-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-flower-shape_0.webp', 'MDF flower shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF flower shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape gold colour clipstones', '8-8-size-square-shape-gold-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-gold-colour-clipstones_0.webp', '8*8 size square shape gold colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape gold colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape sky blue glass', 'tilakam-shape-sky-blue-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-sky-blue-glass_0.webp', 'Tilakam shape sky blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape sky blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Bangle marking paper', 'bangle-marking-paper', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Marking papers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/bangle-marking-paper_0.webp', 'Bangle marking paper | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Bangle marking paper')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6*2.5 size stick covers', '6-2-5-size-stick-covers', 30, 33, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/625-size-stick-covers_0.webp', '6*2.5 size stick covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6*2.5 size stick covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('orange colour stone chaine', 'orange-colour-stone-chaine', 23, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/orange-colour-stone-chaine_0.webp', 'orange colour stone chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of orange colour stone chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle shape ceramic gold', '3-7-reactangle-shape-ceramic-gold', 17, 24, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans ceramic gold and white', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-shape-ceramic-gold_0.webp', '3*7 reactangle shape ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle shape ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver colour stone chaine', 'silver-colour-stone-chaine', 23, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/silver-colour-stone-chaine_0.webp', 'silver colour stone chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver colour stone chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape sky blue matt', 'diamond-shape-sky-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-sky-blue-matt_0.webp', 'diamond shape sky blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape sky blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8**4 size eye shape tomato red colour raindrop kundans', '8-4-size-eye-shape-tomato-red-colour-raindrop-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-tomato-red-colour-raindrop-kundans_0.webp', '8**4 size eye shape tomato red colour raindrop kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8**4 size eye shape tomato red colour raindrop kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape dark green colour clip stones', '8mm-size-round-shape-dark-green-colour-clip-stones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-dark-green-colour-clip-stones_0.webp', '8mm size round shape dark green colour clip stones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape dark green colour clip stones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size drop shape pestral colour-light pink', '10-14-size-drop-shape-pestral-colour-light-pink', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestral-colour-light-pink_0.webp', '10*14 size drop shape pestral colour-light pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size drop shape pestral colour-light pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle light pink glossy', '3-7-reactangle-light-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-light-pink-glossy_0.webp', '3*7 reactangle light pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle light pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape peach glossy', 'tilakam-shape-peach-glossy', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-peach-glossy_0.webp', 'Tilakam shape peach glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape peach glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape dark blue glass', '8k-eye-shape-dark-blue-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-dark-blue-glass_0.webp', '8k eye shape dark blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape dark blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape white colour clipstones', '8-8-size-square-shape-white-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-white-colour-clipstones_0.webp', '8*8 size square shape white colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape white colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF skanda shape', 'mdf-skanda-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-skanda-shape_0.webp', 'MDF skanda shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF skanda shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Antique gold shade Gear wire', 'antique-gold-shade-gear-wire', 40, 50, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Gear wire and lock beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/antique-gold-shade-gear-wire_0.webp', 'Antique gold shade Gear wire | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Antique gold shade Gear wire')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup peach glass', '6k-droup-peach-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-peach-glass_0.webp', '6k droup peach glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup peach glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square red matt', '4-4-square-red-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-red-matt_0.webp', '4*4 square red matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square red matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape dark green glossy', 'diamond-shape-dark-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–2 business daysTamil Nadu, Puducherry & Karnataka:2–4 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-dark-green-glossy_0.webp', 'Diamond shape dark green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape dark green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size light green clipstones', '10-14-size-light-green-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-light-green-clipstones_0.webp', '10*14 size light green clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size light green clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Big size fabric glue 80g', 'big-size-fabric-glue-80g', 37, 40, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gums and glue pens', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/big-size-fabric-glue-80g_0.webp', 'Big size fabric glue 80g | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Big size fabric glue 80g')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('double face swan charms', 'double-face-swan-charms', 40, 45, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/double-face-swan-charms_0.webp', 'double face swan charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of double face swan charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('thread cutter', 'thread-cutter', 25, 30, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cutters and pliers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/thread-cutter_0.webp', 'thread cutter | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of thread cutter')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop shape orange colour clipstones', '10-8-size-drop-shape-orange-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-shape-orange-colour-clipstones_0.webp', '10*8 size drop shape orange colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop shape orange colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('saree pin sheet', 'saree-pin-sheet', 70, 80, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'saree pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/saree-pin-sheet_0.webp', 'saree pin sheet | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of saree pin sheet')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Jusmine Flowers', 'jusmine-flowers', 10, 15, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Artifical Flowers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/jusmine-flowers_0.webp', 'Jusmine Flowers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Jusmine Flowers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle dark pink glossy', 'triangle-dark-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-dark-pink-glossy_0.webp', 'Triangle dark pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle dark pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 onion pink glossy', '4-4-onion-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-onion-pink-glossy_0.webp', '4*4 onion pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 onion pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size drop shape dark green colour clipstone', '10-6-size-drop-shape-dark-green-colour-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-drop-shape-dark-green-colour-clipstone_0.webp', '10*6 size drop shape dark green colour clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size drop shape dark green colour clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lakshmi devi locet', 'lakshmi-devi-locet', 100, 110, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cz pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/lakshmi-devi-locet_0.webp', 'Lakshmi devi locet | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lakshmi devi locet')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle  purpule glossy', 'triangle-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-purpule-glossy_0.webp', 'Triangle  purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle  purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2mm size perals', '2mm-size-perals', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'white peral beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/2mm-size-perals_0.webp', '2mm size perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2mm size perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop shape dark green colour clipstones', '10-8-size-drop-shape-dark-green-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-shape-dark-green-colour-clipstones_0.webp', '10*8 size drop shape dark green colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop shape dark green colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Butterfly marking', 'butterfly-marking', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Marking papers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/butterfly-marking_0.webp', 'Butterfly marking | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Butterfly marking')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop dark pink matt', '6k-drop-dark-pink-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-dark-pink-matt_0.webp', '6k drop dark pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop dark pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*2.5 size stick covers', '3-2-5-size-stick-covers', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/325-size-stick-covers_0.webp', '3*2.5 size stick covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*2.5 size stick covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2 hole connectors', '2-hole-connectors', 30, 35, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/2-hole-connectors_0.webp', '2 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle light green glossy', '3-7-reactangle-light-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3*7 reactangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-light-green-glossy_0.webp', '3*7 reactangle light green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle light green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape glossy gold', '6k-eye-shape-glossy-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-glossy-gold_0.webp', '6k eye shape glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye white matt', '8k-eye-white-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-white-matt_0.webp', '8k eye white matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye white matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('OHP sheet (transparent sheet)-175 micron', 'ohp-sheet-transparent-sheet-175-micron', 7, 8, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ohp and wax sheets', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/ohp-sheet-transparent-sheet-175-micron_0.webp', 'OHP sheet (transparent sheet)-175 micron | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of OHP sheet (transparent sheet)-175 micron')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye purpule matt', '8k-eye-purpule-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-purpule-matt_0.webp', '8k eye purpule matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye purpule matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flower shape multicolour brooch shells', 'flower-shape-multicolour-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/flower-shape-multicolour-brooch-shells_0.webp', 'Flower shape multicolour brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flower shape multicolour brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*2.5 size stick covers', '4-2-5-size-stick-covers', 20, 22, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/425-size-stick-covers_0.webp', '4*2.5 size stick covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*2.5 size stick covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape c green colour glossy', '6k-eye-shape-c-green-colour-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-c-green-colour-glossy_0.webp', '6k eye shape c green colour glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape c green colour glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8 cm large size center clips', '8-cm-large-size-center-clips', 12, 14, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8-cm-large-size-center-clips_0.webp', '8 cm large size center clips | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8 cm large size center clips')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Curve brushes set of 7', 'curve-brushes-set-of-7', 250, 260, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Painting brushes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/curve-brushes-set-of-7_0.webp', 'Curve brushes set of 7 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Curve brushes set of 7')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('dark red colour hanging beads', 'dark-red-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/dark-red-colour-hanging-beads_0.webp', 'dark red colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of dark red colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape baby pink colour matt', 'diamond-shape-baby-pink-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-baby-pink-colour-matt_0.webp', 'diamond shape baby pink colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape baby pink colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-6k eye shape', 'multicolour-kundans-6k-eye-shape', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-6k-eye-shape_0.webp', 'multicolour kundans-6k eye shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-6k eye shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flower lockets', 'flower-lockets', 100, 110, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cz pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/flower-lockets_0.webp', 'Flower lockets | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flower lockets')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour fish hooks', 'gold-colour-fish-hooks', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fish hooks', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-fish-hooks_0.webp', 'gold colour fish hooks | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour fish hooks')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape red glass', 'tilakam-shape-red-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-red-glass_0.webp', 'Tilakam shape red glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape red glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape orange colour matt', 'diamond-shape-orange-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-orange-colour-matt_0.webp', 'diamond shape orange colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape orange colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver sugar beads', 'silver-sugar-beads', 18, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'sugar beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/silver-sugar-beads_0.webp', 'silver sugar beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver sugar beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop baby pink clipstones', '10-8-size-drop-baby-pink-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-baby-pink-clipstones_0.webp', '10*8 size drop baby pink clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop baby pink clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape rainbow colour clipstones', '8-8-size-square-shape-rainbow-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-rainbow-colour-clipstones_0.webp', '8*8 size square shape rainbow colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape rainbow colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multi colour small cut beads', 'multi-colour-small-cut-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/multi-colour-small-cut-beads_0.webp', 'multi colour small cut beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multi colour small cut beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape baby pink glass', 'tilakam-shape-baby-pink-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-baby-pink-glass_0.webp', 'Tilakam shape baby pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape baby pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop light pink matt', '6k-drop-light-pink-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-light-pink-matt_0.webp', '6k drop light pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop light pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Light green colour moon matt kundans', 'light-green-colour-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/light-green-colour-moon-matt-kundans_0.webp', 'Light green colour moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Light green colour moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape red colour clipstones', '10-15-size-oval-shape-red-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-red-colour-clipstones_0.webp', '10*15 size oval shape red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape multi colour clipstones', '8mm-size-round-shape-multi-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-multi-colour-clipstones_0.webp', '8mm size round shape multi colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape multi colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6 cut curve bangles', '6-cut-curve-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/6-cut-curve-bangles_0.webp', '6 cut curve bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6 cut curve bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size sequences colour-dark green', '4mm-size-sequences-colour-dark-green', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm size sequences', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-sequences-colour-dark-green_0.webp', '4mm size sequences colour-dark green | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size sequences colour-dark green')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Coral Red Acrylic colour', 'coral-red-acrylic-colour', 25, 26, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Acrylic colours', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/coral-red-acrylic-colour_0.webp', 'Coral Red Acrylic colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Coral Red Acrylic colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square tomato red matt', '4-4-square-tomato-red-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-tomato-red-matt_0.webp', '4*4 square tomato red matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square tomato red matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon yelllow glass', 'half-moon-yelllow-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-yelllow-glass_0.webp', 'half moon yelllow glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon yelllow glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size gold colour clipstones', '10-14-size-gold-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-gold-colour-clipstones_0.webp', '10*14 size gold colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size gold colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape light green glossy kundans', '6k-eye-shape-light-green-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-light-green-glossy-kundans_0.webp', '6k eye shape light green glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape light green glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('light red colour hanging beads', 'light-red-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/light-red-colour-hanging-beads_0.webp', 'light red colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of light red colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size droup white colour clipstones', '10-6-size-droup-white-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-droup-white-colour-clipstones_0.webp', '10*6 size droup white colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size droup white colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold colour u pins with out cap', 'gold-colour-u-pins-with-out-cap', 5, 6, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Rubber bands and u pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-u-pins-with-out-cap_0.webp', 'Gold colour u pins with out cap | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold colour u pins with out cap')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Triangle light green glossy', 'triangle-light-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Triangle glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-light-green-glossy_0.webp', 'Triangle light green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Triangle light green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape sea green glass', 'tilakam-shape-sea-green-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-sea-green-glass_0.webp', 'Tilakam shape sea green glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape sea green glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half  moon red glass', 'half-moon-red-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-red-glass_0.webp', 'half  moon red glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half  moon red glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Printed saree pins', 'printed-saree-pins', 7, 8, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'saree pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/printed-saree-pins_0.webp', 'Printed saree pins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Printed saree pins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver colour plastic jercons', 'silver-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/silver-colour-plastic-jercons_0.webp', 'silver colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Ganesh charms', 'ganesh-charms', 20, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/ganesh-charms_0.webp', 'Ganesh charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Ganesh charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6cut flat bangles', '6cut-flat-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/6cut-flat-bangles_0.webp', '6cut flat bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6cut flat bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm swaroski peral', '3mm-swaroski-peral', 290, 330, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'swaroski perals', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/3mm-swaroski-peral_0.webp', '3mm swaroski peral | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm swaroski peral')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8K Eye shape matt dark marron colour kundans', '8k-eye-shape-matt-dark-marron-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape pestral colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-matt-dark-marron-colour-kundans_0.webp', '8K Eye shape matt dark marron colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8K Eye shape matt dark marron colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape pesara green colour raindroup kundans', '8-4-size-eye-shape-pesara-green-colour-raindroup-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-pesara-green-colour-raindroup-kundans_0.webp', '8*4 size eye shape pesara green colour raindroup kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape pesara green colour raindroup kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt peach colour kundans', '4-4-square-matt-peach-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-peach-colour-kundans_0.webp', '4*4 square matt peach colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt peach colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('laxmi devi charms no:2', 'laxmi-devi-charms-no-2', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/laxmi-devi-charms-no2_0.webp', 'laxmi devi charms no:2 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of laxmi devi charms no:2')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round dark blue glass', '3mm-round-dark-blue-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-dark-blue-glass_0.webp', '3mm round dark blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round dark blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Leaf shape pestral colour brooch shells', 'leaf-shape-pestral-colour-brooch-shells', 34, 36, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Brooch shells', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/leaf-shape-pestral-colour-brooch-shells_0.webp', 'Leaf shape pestral colour brooch shells | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Leaf shape pestral colour brooch shells')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size round shape dark blue colour clip stones', '8mm-size-round-shape-dark-blue-colour-clip-stones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8mm size round shape clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/8mm-size-round-shape-dark-blue-colour-clip-stones_0.webp', '8mm size round shape dark blue colour clip stones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size round shape dark blue colour clip stones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Multicolour Matt Kundans-6k drop shape', 'multicolour-matt-kundans-6k-drop-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour Matt Kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-matt-kundans-6k-drop-shape_0.webp', 'Multicolour Matt Kundans-6k drop shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Multicolour Matt Kundans-6k drop shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('mild gold tube beads', 'mild-gold-tube-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/mild-gold-tube-beads_0.webp', 'mild gold tube beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of mild gold tube beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape multi colour clipstones', '6mm-size-round-shape-multi-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-multi-colour-clipstones_0.webp', '6mm size round shape multi colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape multi colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-yash', 'drop-shape-crystal-beads-yash', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-yash_0.webp', 'drop shape crystal beads-yash | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-yash')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round red glass', '4mm-round-red-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-red-glass_0.webp', '4mm round red glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round red glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('sea green colour small cut beads', 'sea-green-colour-small-cut-beads', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cut beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/sea-green-colour-small-cut-beads_0.webp', 'sea green colour small cut beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of sea green colour small cut beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3 hole connectors', '3-hole-connectors', 30, 40, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/3-hole-connectors_0.webp', '3 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold colour jardosi', 'gold-colour-jardosi', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jardosi(spring)', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-jardosi_0.webp', 'Gold colour jardosi | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold colour jardosi')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('White  Acrylic colour', 'white-acrylic-colour', 25, 26, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Acrylic colours', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/white-acrylic-colour_0.webp', 'White  Acrylic colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of White  Acrylic colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('earring material-back presers', 'earring-material-back-presers', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'earring material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/earring-material-back-presers_0.webp', 'earring material-back presers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of earring material-back presers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size eye shape orange colour clipstones', '10-6-size-eye-shape-orange-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size Eye shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-eye-shape-orange-colour-clipstones_0.webp', '10*6 size eye shape orange colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size eye shape orange colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2 cut round bangles', '2-cut-round-bangles', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/2-cut-round-bangles_0.webp', '2 cut round bangles | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2 cut round bangles')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape matt peach colour kundans', '6k-eye-shape-matt-peach-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6K  Eye shape pestral matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-matt-peach-colour-kundans_0.webp', '6k Eye shape matt peach colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape matt peach colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('dark purpule hanging beads', 'dark-purpule-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/dark-purpule-hanging-beads_0.webp', 'dark purpule hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of dark purpule hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape yellow glass', 'tilakam-shape-yellow-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-yellow-glass_0.webp', 'Tilakam shape yellow glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape yellow glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('purpule colour hanging beads', 'purpule-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/purpule-colour-hanging-beads_0.webp', 'purpule colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of purpule colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Curve mixed bamgle box-1,2,4and6cuts', 'curve-mixed-bamgle-box-1-2-4and6cuts', 135, 150, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangle boxes mixed', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/curve-mixed-bamgle-box-124and6cuts_0.webp', 'Curve mixed bamgle box-1,2,4and6cuts | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Curve mixed bamgle box-1,2,4and6cuts')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('small size fabric glue 30g', 'small-size-fabric-glue-30g', 17, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gums and glue pens', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/small-size-fabric-glue-30g_0.webp', 'small size fabric glue 30g | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of small size fabric glue 30g')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Mixed acrylic colours', 'mixed-acrylic-colours', 250, 260, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Acrylic colours', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/mixed-acrylic-colours_0.webp', 'Mixed acrylic colours | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Mixed acrylic colours')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon marron matt', 'half-moon-marron-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-marron-matt_0.webp', 'half moon marron matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon marron matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2cm doughnut rings', '2cm-doughnut-rings', 8, 10, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Doughnut rings', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/2cm-doughnut-rings_0.webp', '2cm doughnut rings | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2cm doughnut rings')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 orange glossy', '4-4-orange-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-orange-glossy_0.webp', '4*4 orange glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 orange glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('5mm size metal hair band', '5mm-size-metal-hair-band', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/5mm-size-metal-hair-band_0.webp', '5mm size metal hair band | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 5mm size metal hair band')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Multicolour Matt Kundans-4*4 square shape', 'multicolour-matt-kundans-4-4-square-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour Matt Kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-matt-kundans-44-square-shape_0.webp', 'Multicolour Matt Kundans-4*4 square shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Multicolour Matt Kundans-4*4 square shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-red', 'drop-shape-crystal-beads-red', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-red_0.webp', 'drop shape crystal beads-red | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-red')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Single peacock pattern', 'single-peacock-pattern', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Marking papers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/single-peacock-pattern_0.webp', 'Single peacock pattern | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Single peacock pattern')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt light lavender colour kundans', '4-4-square-matt-light-lavender-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-light-lavender-colour-kundans_0.webp', '4*4 square matt light lavender colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt light lavender colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('dark pink colour 10*8 size reactangle clipstones', 'dark-pink-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/dark-pink-colour-108-size-reactangle-clipstones_0.webp', 'dark pink colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of dark pink colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size drop shape orange colour clipstone', '10-6-size-drop-shape-orange-colour-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-drop-shape-orange-colour-clipstone_0.webp', '10*6 size drop shape orange colour clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size drop shape orange colour clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size oval shape colour-red', '10-8-size-oval-shape-colour-red', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-oval-shape-colour-red_0.webp', '10*8 size oval shape colour-red | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size oval shape colour-red')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm round glossy gold', '4mm-round-glossy-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/4mm-round-glossy-gold_0.webp', '4mm round glossy gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm round glossy gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape Red colour clipstones', '6mm-size-round-shape-red-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-red-colour-clipstones_0.webp', '6mm size round shape Red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape Red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size ovel shape clipstones colour-baby pink', '10-15-size-ovel-shape-clipstones-colour-baby-pink', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-ovel-shape-clipstones-colour-baby-pink_0.webp', '10*15 size ovel shape clipstones colour-baby pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size ovel shape clipstones colour-baby pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('orange colour hanging beads', 'orange-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/orange-colour-hanging-beads_0.webp', 'orange colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of orange colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('red colour 4mm round clipstones', 'red-colour-4mm-round-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/red-colour-4mm-round-clipstones_0.webp', 'red colour 4mm round clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of red colour 4mm round clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('rainbow stone chaine', 'rainbow-stone-chaine', 23, 25, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'stone chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/rainbow-stone-chaine_0.webp', 'rainbow stone chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of rainbow stone chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon dark purpule glass', 'half-moon-dark-purpule-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-dark-purpule-glass_0.webp', 'half moon dark purpule glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon dark purpule glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('hlaf moon glossy white', 'hlaf-moon-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/hlaf-moon-glossy-white_0.webp', 'hlaf moon glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of hlaf moon glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size drop shape pestral colour -skyblue', '10-14-size-drop-shape-pestral-colour-skyblue', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestral-colour-skyblue_0.webp', '10*14 size drop shape pestral colour -skyblue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size drop shape pestral colour -skyblue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape wine colour clipstones', '8-8-size-square-shape-wine-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-wine-colour-clipstones_0.webp', '8*8 size square shape wine colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape wine colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Free Classes Beginner kit-Batch 1', 'free-classes-beginner-kit-batch-1', 1999, 2100, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Beginner kits', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/free-classes-beginner-kit-batch-1_0.webp', 'Free Classes Beginner kit-Batch 1 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Free Classes Beginner kit-Batch 1')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop glossy white', '6k-drop-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-glossy-white_0.webp', '6k drop glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*4 size eye shape red colour raindrop kundans', '8-4-size-eye-shape-red-colour-raindrop-kundans', 15, 20, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye shape and raindroup 8*4 size kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/84-size-eye-shape-red-colour-raindrop-kundans_0.webp', '8*4 size eye shape red colour raindrop kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*4 size eye shape red colour raindrop kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour stud bases', 'gold-colour-stud-bases', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'earring material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-stud-bases_0.webp', 'gold colour stud bases | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour stud bases')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Dark blue coloue moon matt kundans', 'dark-blue-coloue-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/dark-blue-coloue-moon-matt-kundans_0.webp', 'Dark blue coloue moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Dark blue coloue moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('clachers black colour', 'clachers-black-colour', 10, 12, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/clachers-black-colour_0.webp', 'clachers black colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of clachers black colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('red colour hanging beads', 'red-colour-hanging-beads', 15, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'hanging beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/red-colour-hanging-beads_0.webp', 'red colour hanging beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of red colour hanging beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape light pink glass', '8k-eye-shape-light-pink-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-light-pink-glass_0.webp', '8k eye shape light pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape light pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('dark blue colour sugar beads', 'dark-blue-colour-sugar-beads', 18, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'sugar beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/dark-blue-colour-sugar-beads_0.webp', 'dark blue colour sugar beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of dark blue colour sugar beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('punching tool', 'punching-tool', 150, 170, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'cutters and pliers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/punching-tool_0.webp', 'punching tool | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of punching tool')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape light green glossy', 'diamond-shape-light-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-light-green-glossy_0.webp', 'Diamond shape light green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape light green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup c green glass', '6k-droup-c-green-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-c-green-glass_0.webp', '6k droup c green glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup c green glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape pesara pacha colour matt', 'diamond-shape-pesara-pacha-colour-matt', 25, 30, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'pestral diamond [8*4] shape matt', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-pesara-pacha-colour-matt_0.webp', 'diamond shape pesara pacha colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape pesara pacha colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size drop shape pestral colour-green colour', '10-14-size-drop-shape-pestral-colour-green-colour', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size droup shape pestral colour clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-drop-shape-pestral-colour-green-colour_0.webp', '10*14 size drop shape pestral colour-green colour | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size drop shape pestral colour-green colour')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 74', 'lotus-silk-thread-shade-no-74', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-74_0.webp', 'Lotus silk Thread-shade No. 74 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 74')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon dark blue glass', 'half-moon-dark-blue-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-dark-blue-glass_0.webp', 'half moon dark blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon dark blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('MDF heart shape', 'mdf-heart-shape', 3, 4, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'MDF bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/mdf-heart-shape_0.webp', 'MDF heart shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of MDF heart shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop purpule matt', '6k-drop-purpule-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-purpule-matt_0.webp', '6k drop purpule matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop purpule matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape orange glossy', '6k-eye-shape-orange-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-orange-glossy_0.webp', '6k Eye shape orange glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape orange glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size dark pink reactangle clipstones', '10-14-size-dark-pink-reactangle-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-dark-pink-reactangle-clipstones_0.webp', '10*14 size dark pink reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size dark pink reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3*7 reactangle ceramic white', '3-7-reactangle-ceramic-white', 17, 24, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans ceramic gold and white', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/37-reactangle-ceramic-white_0.webp', '3*7 reactangle ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3*7 reactangle ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('orange colour 10*8 size reactangle clipstones', 'orange-colour-10-8-size-reactangle-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size reactangle clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/orange-colour-108-size-reactangle-clipstones_0.webp', 'orange colour 10*8 size reactangle clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of orange colour 10*8 size reactangle clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold shape 5 hole connectors', 'gold-shape-5-hole-connectors', 50, 60, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Connectors', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/gold-shape-5-hole-connectors_0.webp', 'gold shape 5 hole connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold shape 5 hole connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('tilakam shape glossy white', 'tilakam-shape-glossy-white', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'fancy kundans glass white and gold', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-glossy-white_0.webp', 'tilakam shape glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of tilakam shape glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k Eye shape matt dark marron colour kundans', '6k-eye-shape-matt-dark-marron-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6K  Eye shape pestral matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-matt-dark-marron-colour-kundans_0.webp', '6k Eye shape matt dark marron colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k Eye shape matt dark marron colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour u pins', 'gold-colour-u-pins', 4, 5, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-u-pins_0.webp', 'gold colour u pins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour u pins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 706', 'lotus-silk-thread-shade-no-706', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-706_0.webp', 'Lotus silk Thread-shade No. 706 | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 706')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round baby pink glass', '3mm-round-baby-pink-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-baby-pink-glass_0.webp', '3mm round baby pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round baby pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1 inch gold colour plastic bases', '1-inch-gold-colour-plastic-bases', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Plastic gold colour bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/1-inch-gold-colour-plastic-bases_0.webp', '1 inch gold colour plastic bases | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1 inch gold colour plastic bases')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8mm size swaroski perals', '8mm-size-swaroski-perals', 210, 250, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'swaroski perals', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/8mm-size-swaroski-perals_0.webp', '8mm size swaroski perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8mm size swaroski perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold colour plastic jercons', 'gold-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-plastic-jercons_0.webp', 'gold colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k drop glossy white', '8k-drop-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-drop-glossy-white_0.webp', '8k drop glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k drop glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Flat mixed bangle box-1,2ans4cut', 'flat-mixed-bangle-box-1-2ans4cut', 135, 150, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangle boxes mixed', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/flat-mixed-bangle-box-12ans4cut_0.webp', 'Flat mixed bangle box-1,2ans4cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Flat mixed bangle box-1,2ans4cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape dark green glossy', 'diamond-shape-dark-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-dark-green-glossy_0.webp', 'Diamond shape dark green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape dark green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-peacock blue', 'drop-shape-crystal-beads-peacock-blue', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-peacock-blue_0.webp', 'drop shape crystal beads-peacock blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-peacock blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('peral chaine 24 inch length', 'peral-chaine-24-inch-length', 100, 120, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'peral and chandraharam chaine', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/peral-chaine-24-inch-length_0.webp', 'peral chaine 24 inch length | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of peral chaine 24 inch length')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold leaf charms', 'gold-leaf-charms', 35, 40, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'laxmi coins and leaf charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/gold-leaf-charms_0.webp', 'gold leaf charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold leaf charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('diamond shape marron colour matt', 'diamond-shape-marron-colour-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'diamond [8*4] shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-marron-colour-matt_0.webp', 'diamond shape marron colour matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of diamond shape marron colour matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square purpule glossy', '4-4-square-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 glassy kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-purpule-glossy_0.webp', '4*4 square purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3cm size jumka bases', '3cm-size-jumka-bases', 10, 11, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'jumka and chandbali bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/3cm-size-jumka-bases_0.webp', '3cm size jumka bases | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3cm size jumka bases')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size droup red colour clipstones', '10-6-size-droup-red-colour-clipstones', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-droup-red-colour-clipstones_0.webp', '10*6 size droup red colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size droup red colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6.5 cm size center clips medium size', '6-5-cm-size-center-clips-medium-size', 10, 12, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Hair accessories', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/65-cm-size-center-clips-medium-size_0.webp', '6.5 cm size center clips medium size | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6.5 cm size center clips medium size')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('mehandi green coloure sugar beads', 'mehandi-green-coloure-sugar-beads', 18, 20, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'sugar beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/mehandi-green-coloure-sugar-beads_0.webp', 'mehandi green coloure sugar beads | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of mehandi green coloure sugar beads')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square leaf green matt', '4-4-square-leaf-green-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-leaf-green-matt_0.webp', '4*4 square leaf green matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square leaf green matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square matt Red Arecanut colour kundans', '4-4-square-matt-red-arecanut-colour-kundans', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt pestral kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-matt-red-arecanut-colour-kundans_0.webp', '4*4 square matt Red Arecanut colour kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square matt Red Arecanut colour kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size skyblue colour clipstones', '10-14-size-skyblue-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-skyblue-colour-clipstones_0.webp', '10*14 size skyblue colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size skyblue colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('B-7000 glue 110ml', 'b-7000-glue-110ml', 80, 100, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gums and glue pens', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/b-7000-glue-110ml_0.webp', 'B-7000 glue 110ml | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of B-7000 glue 110ml')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('curve plain bangle boxes 1cut', 'curve-plain-bangle-boxes-1cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/curve-plain-bangle-boxes-1cut_0.webp', 'curve plain bangle boxes 1cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of curve plain bangle boxes 1cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape light pink colour glossy kundans', '6k-eye-shape-light-pink-colour-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-light-pink-colour-glossy-kundans_0.webp', '6k eye shape light pink colour glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape light pink colour glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Black colour thin rubber bands', 'black-colour-thin-rubber-bands', 4, 5, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Rubber bands and u pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/black-colour-thin-rubber-bands_0.webp', 'Black colour thin rubber bands | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Black colour thin rubber bands')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multicolour kundans-tilakam(4k drop)shape', 'multicolour-kundans-tilakam-4k-drop-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-kundans-tilakam4k-dropshape_0.webp', 'multicolour kundans-tilakam(4k drop)shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multicolour kundans-tilakam(4k drop)shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape dark purpule glossy', 'v-shape-dark-purpule-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'v shape glossy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-dark-purpule-glossy_0.webp', 'v shape dark purpule glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape dark purpule glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Multicolour Matt Kundans-8k eye shape', 'multicolour-matt-kundans-8k-eye-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour Matt Kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-matt-kundans-8k-eye-shape_0.webp', 'Multicolour Matt Kundans-8k eye shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Multicolour Matt Kundans-8k eye shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size perals', '6mm-size-perals', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'white peral beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-perals_0.webp', '6mm size perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size marron colour clipstones', '10-14-size-marron-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-marron-colour-clipstones_0.webp', '10*14 size marron colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size marron colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2mm size bead caps', '2mm-size-bead-caps', 30, 40, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bead side caps', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/2mm-size-bead-caps_0.webp', '2mm size bead caps | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2mm size bead caps')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('gold leaf charms', 'gold-leaf-charms', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/gold-leaf-charms_0.webp', 'gold leaf charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of gold leaf charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1.7 cm jumka bases', '1-7-cm-jumka-bases', 7, 8, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'jumka and chandbali bases', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/17-cm-jumka-bases_0.webp', '1.7 cm jumka bases | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1.7 cm jumka bases')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold shade 3 rings back chaine', 'gold-shade-3-rings-back-chaine', 15, 17, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Back chains', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/gold-shade-3-rings-back-chaine_0.webp', 'Gold shade 3 rings back chaine | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold shade 3 rings back chaine')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Gold colour 3D outliner', 'gold-colour-3d-outliner', 25, 27, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3D outliners', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/gold-colour-3d-outliner_0.webp', 'Gold colour 3D outliner | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Gold colour 3D outliner')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square glossy white', '4-4-square-glossy-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'glossy white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-glossy-white_0.webp', '4*4 square glossy white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square glossy white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('silver eye pins', 'silver-eye-pins', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'eye pins and head pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/silver-eye-pins_0.webp', 'silver eye pins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of silver eye pins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Rice shape peral chaine 24 inch length', 'rice-shape-peral-chaine-24-inch-length', 100, 120, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'peral and chandraharam chaine', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/rice-shape-peral-chaine-24-inch-length_0.webp', 'Rice shape peral chaine 24 inch length | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Rice shape peral chaine 24 inch length')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape orange glossy', 'diamond-shape-orange-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-orange-glossy_0.webp', 'Diamond shape orange glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape orange glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye sky blue matt', '8k-eye-sky-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k eye shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-sky-blue-matt_0.webp', '8k eye sky blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye sky blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8*8 size square shape sky blue colour clipstones', '8-8-size-square-shape-sky-blue-colour-clipstones', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8*8 size Square clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/88-size-square-shape-sky-blue-colour-clipstones_0.webp', '8*8 size square shape sky blue colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8*8 size square shape sky blue colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('triangle orange matt', 'triangle-orange-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'trianglr matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/triangle-orange-matt_0.webp', 'triangle orange matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of triangle orange matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape dark pink glossy', '8k-eye-shape-dark-pink-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '8k Eye shape gloss kundhans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-dark-pink-glossy_0.webp', '8k eye shape dark pink glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape dark pink glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Diamond shape Rose pink glossy kundans', 'diamond-shape-rose-pink-glossy-kundans', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Diamond shape gloosy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/diamond-shape-rose-pink-glossy-kundans_0.webp', 'Diamond shape Rose pink glossy kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Diamond shape Rose pink glossy kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-skyblue', 'drop-shape-crystal-beads-skyblue', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-skyblue_0.webp', 'drop shape crystal beads-skyblue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-skyblue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Rectangular pink Kundan  jadav pendent', 'rectangular-pink-kundan-jadav-pendent', 120, 130, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/rectangular-pink-kundan-jadav-pendent_0.webp', 'Rectangular pink Kundan  jadav pendent | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Rectangular pink Kundan  jadav pendent')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('multi colour plastic jercons', 'multi-colour-plastic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/multi-colour-plastic-jercons_0.webp', 'multi colour plastic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of multi colour plastic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size drop dark blue colour clipstones', '10-8-size-drop-dark-blue-colour-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size droup shape cilpstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-drop-dark-blue-colour-clipstones_0.webp', '10*8 size drop dark blue colour clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size drop dark blue colour clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup dark pink glass', '6k-droup-dark-pink-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-dark-pink-glass_0.webp', '6k droup dark pink glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup dark pink glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Multicolour Matt Kundans-Diamond shape', 'multicolour-matt-kundans-diamond-shape', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Multicolour Matt Kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/multicolour-matt-kundans-diamond-shape_0.webp', 'Multicolour Matt Kundans-Diamond shape | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Multicolour Matt Kundans-Diamond shape')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('5mm round ceramic gold', '5mm-round-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/5mm-round-ceramic-gold_0.webp', '5mm round ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 5mm round ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon light pink matt', 'half-moon-light-pink-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-light-pink-matt_0.webp', 'half moon light pink matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon light pink matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1cm mild gold kasulu', '1cm-mild-gold-kasulu', 20, 22, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'laxmi coins and leaf charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/1cm-mild-gold-kasulu_0.webp', '1cm mild gold kasulu | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1cm mild gold kasulu')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lavender colour moon matt kundans', 'lavender-colour-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/lavender-colour-moon-matt-kundans_0.webp', 'Lavender colour moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lavender colour moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k eye shape ceramic white', '6k-eye-shape-ceramic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-eye-shape-ceramic-white_0.webp', '6k eye shape ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k eye shape ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('v shape light green glossy', 'v-shape-light-green-glossy', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'v shape glossy colour kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/v-shape-light-green-glossy_0.webp', 'v shape light green glossy | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of v shape light green glossy')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*14 size dark green clipstones', '10-14-size-dark-green-clipstones', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*14 size reactangles clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1014-size-dark-green-clipstones_0.webp', '10*14 size dark green clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*14 size dark green clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6mm size round shape gold colour clipstone', '6mm-size-round-shape-gold-colour-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6mm size round shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/6mm-size-round-shape-gold-colour-clipstone_0.webp', '6mm size round shape gold colour clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6mm size round shape gold colour clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('peach colour 4mm round clipstones', 'peach-colour-4mm-round-clipstones', 25, 30, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm round clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/peach-colour-4mm-round-clipstones_0.webp', 'peach colour 4mm round clipstones | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of peach colour 4mm round clipstones')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('pink jadav Drop shape with 4 connectors', 'pink-jadav-drop-shape-with-4-connectors', 24, 26, 'Imitation jewelery material', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Jadav pendents', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/imitation-jewelery-material/pink-jadav-drop-shape-with-4-connectors_0.webp', 'pink jadav Drop shape with 4 connectors | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of pink jadav Drop shape with 4 connectors')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('curve plain bangle boxes 4 cut', 'curve-plain-bangle-boxes-4-cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/curve-plain-bangle-boxes-4-cut_0.webp', 'curve plain bangle boxes 4 cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of curve plain bangle boxes 4 cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*8 size oval shape colour-dark blue', '10-8-size-oval-shape-colour-dark-blue', 30, 35, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*8 size oval shape clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/108-size-oval-shape-colour-dark-blue_0.webp', '10*8 size oval shape colour-dark blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*8 size oval shape colour-dark blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square dark blue matt', '4-4-square-dark-blue-matt', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4*4 square matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-dark-blue-matt_0.webp', '4*4 square dark blue matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square dark blue matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*15 size oval shape pestral colour-sky blue', '10-15-size-oval-shape-pestral-colour-sky-blue', 35, 40, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*15 size oval shape pestral colours  clipstones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/1015-size-oval-shape-pestral-colour-sky-blue_0.webp', '10*15 size oval shape pestral colour-sky blue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*15 size oval shape pestral colour-sky blue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('flat plain bangle boxes 4 cut', 'flat-plain-bangle-boxes-4-cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/flat-plain-bangle-boxes-4-cut_0.webp', 'flat plain bangle boxes 4 cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of flat plain bangle boxes 4 cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('green colour platic jercons', 'green-colour-platic-jercons', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'plastic jercons', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/green-colour-platic-jercons_0.webp', 'green colour platic jercons | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of green colour platic jercons')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('10*6 size drop black colour clipstone', '10-6-size-drop-black-colour-clipstone', 20, 25, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '10*6 size droup clip stones', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/106-size-drop-black-colour-clipstone_0.webp', '10*6 size drop black colour clipstone | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 10*6 size drop black colour clipstone')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('3mm round light green glass', '3mm-round-light-green-glass', 18, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '3mm round glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/3mm-round-light-green-glass_0.webp', '3mm round light green glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 3mm round light green glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Tilakam shape dark green glass', 'tilakam-shape-dark-green-glass', 20, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Tilakam shape glass kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/tilakam-shape-dark-green-glass_0.webp', 'Tilakam shape dark green glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Tilakam shape dark green glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('White shape Thin Jasmine buds', 'white-shape-thin-jasmine-buds', 60, 70, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Artifical Flowers', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/white-shape-thin-jasmine-buds_0.webp', 'White shape Thin Jasmine buds | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of White shape Thin Jasmine buds')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Lotus silk Thread-shade No. 30ND', 'lotus-silk-thread-shade-no-30nd', 18, 20, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Silk Threads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/lotus-silk-thread-shade-no-30nd_0.webp', 'Lotus silk Thread-shade No. 30ND | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Lotus silk Thread-shade No. 30ND')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size sequences colour-lavender', '4mm-size-sequences-colour-lavender', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm size sequences', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-sequences-colour-lavender_0.webp', '4mm size sequences colour-lavender | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size sequences colour-lavender')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('drop shape crystal beads-pink', 'drop-shape-crystal-beads-pink', 40, 45, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Droup shape crystal beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/drop-shape-crystal-beads-pink_0.webp', 'drop shape crystal beads-pink | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of drop shape crystal beads-pink')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('curve plain bangle boxes 6 cut', 'curve-plain-bangle-boxes-6-cut', 120, 130, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'bangle boxes', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/curve-plain-bangle-boxes-6-cut_0.webp', 'curve plain bangle boxes 6 cut | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of curve plain bangle boxes 6 cut')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k droup dark sky blue glass', '6k-droup-dark-sky-blue-glass', 17, 22, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '6k droup glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-droup-dark-sky-blue-glass_0.webp', '6k droup dark sky blue glass | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k droup dark sky blue glass')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 square glossy glod', '4-4-square-glossy-glod', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gold glossy kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-square-glossy-glod_0.webp', '4*4 square glossy glod | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 square glossy glod')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*4 ceramiic white', '4-4-ceramiic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/44-ceramiic-white_0.webp', '4*4 ceramiic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*4 ceramiic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('Dark grren colour moon matt kundans', 'dark-grren-colour-moon-matt-kundans', 35, 40, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Pestral colours moon shape matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/dark-grren-colour-moon-matt-kundans_0.webp', 'Dark grren colour moon matt kundans | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of Dark grren colour moon matt kundans')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('premium fabric glue', 'premium-fabric-glue', 25, 27, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'gums and glue pens', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/premium-fabric-glue_0.webp', 'premium fabric glue | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of premium fabric glue')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('half moon red matt', 'half-moon-red-matt', 30, 35, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'half moon matt kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/half-moon-red-matt_0.webp', 'half moon red matt | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of half moon red matt')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2*3 size stick covers', '2-3-size-stick-covers', 10, 12, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/23-size-stick-covers_0.webp', '2*3 size stick covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2*3 size stick covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('2 hole broch pins', '2-hole-broch-pins', 3, 4, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'saree pins', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/2-hole-broch-pins_0.webp', '2 hole broch pins | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 2 hole broch pins')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('1 cut curve bangle', '1-cut-curve-bangle', 12, 15, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'Bangles loose', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/1-cut-curve-bangle_0.webp', '1 cut curve bangle | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 1 cut curve bangle')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4*3 size stick covers', '4-3-size-stick-covers', 15, 18, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'packing material', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/43-size-stick-covers_0.webp', '4*3 size stick covers | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4*3 size stick covers')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('6k drop ceramic white', '6k-drop-ceramic-white', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic white kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/6k-drop-ceramic-white_0.webp', '6k drop ceramic white | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 6k drop ceramic white')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size perals', '4mm-size-perals', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'white peral beads', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-perals_0.webp', '4mm size perals | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size perals')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('8k eye shape ceramic gold', '8k-eye-shape-ceramic-gold', 15, 18, 'kundan stones', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'ceramic  gold kundans', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/kundan-stones/8k-eye-shape-ceramic-gold_0.webp', '8k eye shape ceramic gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 8k eye shape ceramic gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('4mm size sequences colour-gold', '4mm-size-sequences-colour-gold', 20, 22, 'Jewellery Making', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', '4mm size sequences', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/jewellery-making/4mm-size-sequences-colour-gold_0.webp', '4mm size sequences colour-gold | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of 4mm size sequences colour-gold')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

INSERT INTO products (name, slug, price, mrp, cat, bg, emoji, desc_text, tag, sizes, image_url, meta_title, meta_description, alt_text)
VALUES ('siver leaf charms', 'siver-leaf-charms', 35, 40, 'Silk Thread Materials', '#FDF2F8', '🌸', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing (business days only).Estimated Delivery Time (from date of dispatch):Andhra Pradesh & Telangana:1–3 business daysTamil Nadu, Puducherry & Karnataka:3-5 business daysNorthern India:4–7 business daysNOTE:The above delivery timeline applies to DTDC shipments. Orders sent via India Post may require an additional 1–2 working days. In certain cases, order processing and delivery may take longer due to unforeseen circumstances.', 'laxmi coins and leaf charms', '["2.2","2.4","2.6","2.8"]'::jsonb, '/images/silk-thread-materials/siver-leaf-charms_0.webp', 'siver leaf charms | BangleByChoice', 'DescriptionShipping & Delivery InformationOrder Processing:All orders are processed and dispatched on the same day based on order confirmation timing ', 'Photo of siver leaf charms')
ON CONFLICT (slug) 
DO UPDATE SET 
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  mrp = EXCLUDED.mrp,
  cat = EXCLUDED.cat,
  desc_text = EXCLUDED.desc_text,
  tag = EXCLUDED.tag,
  image_url = EXCLUDED.image_url,
  meta_title = EXCLUDED.meta_title,
  meta_description = EXCLUDED.meta_description;

