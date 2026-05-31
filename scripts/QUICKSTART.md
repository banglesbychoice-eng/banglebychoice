# Quick Start Guide - Web Scraping Setup

## Prerequisites

You'll need Python installed on your Windows system to run the scraping scripts.

### Step 1: Install Python

1. **Download Python:**
   - Go to https://www.python.org/downloads/
   - Download Python 3.11 or later for Windows
   - Or run this command to install from Microsoft Store:
     ```powershell
     winget install Python.Python.3.11
     ```

2. **Verify Installation:**
   ```powershell
   python --version
   ```

### Step 2: Install Dependencies

```powershell
cd c:\Users\venka\Downloads\Bangles\scripts
python -m pip install -r requirements.txt
```

### Step 3: Run the Scraper

#### Option A: Scrape All Websites (Recommended)

```powershell
python run_all_scrapers.py
```

This will scrape all three websites and create a unified catalog automatically.

**Estimated time:** 30-60 minutes depending on product count

#### Option B: Scrape Individual Websites

```powershell
# Test with just one website first
python scraper_unboxkar.py

# Then scrape the others
python scraper_scrunchybows.py
python scraper_theunikart.py

# Create unified catalog
python unify_catalog.py
```

## What Will Be Created

```
c:/Users/venka/Downloads/Bangles/scraped-data/
├── unboxkar/
│   ├── images/          # All product images organized by category
│   │   ├── hair-claws/
│   │   ├── hair-ties/
│   │   └── ...
│   └── products.json    # All Unboxkar products
├── scrunchybows/
│   ├── images/
│   └── products.json
├── theunikart/
│   ├── images/
│   └── products.json
└── unified-catalog/
    ├── products.json    # Unified catalog with lowest prices
    ├── products.csv     # Excel-friendly format
    ├── price-comparison.json  # Products with price differences
    └── summary.json     # Statistics
```

## Key Features

✅ **Automated Image Downloads** - All product images saved locally  
✅ **Price Comparison** - Finds duplicate products across sites  
✅ **Lowest Price Selection** - Automatically uses cheapest price  
✅ **Multiple Formats** - JSON and CSV exports  
✅ **Progress Tracking** - See real-time progress  

## Troubleshooting

### "Python was not found"
- Install Python from https://www.python.org/downloads/
- Make sure to check "Add Python to PATH" during installation

### "ModuleNotFoundError"
- Run: `python -m pip install -r requirements.txt`

### Scraping is slow
- This is normal! Each website may have 100+ products
- The script includes delays to be respectful to the servers

### Connection errors
- Check your internet connection
- Some sites may temporarily block scraping - wait and retry

## Next Steps

After scraping completes:

1. **Review the data:**
   - Open `unified-catalog/products.csv` in Excel
   - Check `price-comparison.json` for savings opportunities

2. **Use the images:**
   - All images are organized in category folders
   - Reference them in your new website

3. **Import to database:**
   - Use `products.json` files to import into your e-commerce platform

## Support

For more details, see the full README.md in the scripts folder.
