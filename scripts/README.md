# Bangles by Choice - Web Scraping Project

This directory contains scripts to scrape product data from three e-commerce websites and create a unified catalog.

## Websites

1. **Unboxkar.in** - Korean hair accessories & fashion items
2. **ScrunchyBowsIndia.com** - Hair accessories & craft supplies
3. **TheUnikart.co.in** - Craft & jewelry making supplies

## Setup

### Install Dependencies

```powershell
cd c:\Users\venka\Downloads\Bangles\scripts
pip install -r requirements.txt
```

## Usage

### Option 1: Run All Scrapers (Recommended)

```powershell
python run_all_scrapers.py
```

This will:
- Scrape all three websites sequentially
- Download all product images
- Create individual JSON files for each site
- Generate a unified catalog with lowest prices
- Create price comparison reports

### Option 2: Run Individual Scrapers

```powershell
# Scrape only Unboxkar
python scraper_unboxkar.py

# Scrape only ScrunchyBows
python scraper_scrunchybows.py

# Scrape only TheUnikart
python scraper_theunikart.py

# After scraping, unify catalogs
python unify_catalog.py
```

## Output Structure

```
c:/Users/venka/Downloads/Bangles/scraped-data/
├── unboxkar/
│   ├── images/
│   │   ├── hair-claws/
│   │   ├── hair-ties/
│   │   └── ...
│   └── products.json
├── scrunchybows/
│   ├── images/
│   │   ├── hair-accessories/
│   │   └── ...
│   └── products.json
├── theunikart/
│   ├── images/
│   │   ├── kundan-beads/
│   │   └── ...
│   └── products.json
└── unified-catalog/
    ├── products.json (unified with lowest prices)
    ├── products.csv
    ├── price-comparison.json
    └── summary.json
```

## Features

- ✅ **Automatic Image Downloading** - Downloads product images to organized folders
- ✅ **Price Comparison** - Identifies duplicate products and uses lowest price
- ✅ **Fuzzy Matching** - Intelligently matches similar products across sites
- ✅ **Rate Limiting** - Respectful scraping with delays
- ✅ **Error Handling** - Continues scraping even if individual products fail
- ✅ **Progress Tracking** - Shows progress bars during scraping
- ✅ **Multiple Export Formats** - JSON and CSV outputs

## Data Schema

### Individual Product (JSON)

```json
{
  "id": "unique-id",
  "name": "Product Name",
  "category": "Category",
  "price": 299.00,
  "sale_price": 249.00,
  "currency": "INR",
  "url": "https://...",
  "images": ["images/category/product_0.jpg"],
  "sku": "SKU-123",
  "availability": "in_stock",
  "source": "unboxkar"
}
```

### Unified Product (JSON)

```json
{
  "id": "unified_abc123",
  "name": "Product Name",
  "category": "Category",
  "lowest_price": 249.00,
  "highest_price": 299.00,
  "price_savings": 50.00,
  "sources": [
    {
      "website": "unboxkar",
      "price": 249.00,
      "url": "https://...",
      "sku": "UBK-123"
    },
    {
      "website": "scrunchybows",
      "price": 299.00,
      "url": "https://...",
      "sku": "SB-456"
    }
  ],
  "images": ["..."],
  "source_count": 2,
  "available_at": ["unboxkar", "scrunchybows"]
}
```

## Notes

- Scraping may take 30-60 minutes depending on the number of products
- Images are deduplicated by filename hash
- Product matching uses fuzzy string matching (85% similarity threshold)
- Rate limiting: 0.5s between products, 1s between pages, 2s between categories

## Troubleshooting

If you encounter errors:

1. **ModuleNotFoundError**: Run `pip install -r requirements.txt`
2. **Connection timeout**: Check your internet connection and try again
3. **Access denied**: Website may be blocking scraping - wait and retry later

## Legal Notice

These scripts are designed for personal use on websites you own or have permission to scrape. Always respect website Terms of Service and robots.txt files.
