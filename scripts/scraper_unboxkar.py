#!/usr/bin/env python3
"""
Unboxkar.in Product Scraper
Extracts products, images, and pricing data from Unboxkar.in
"""

import os
import json
import re
import time
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
from pathlib import Path
from tqdm import tqdm
import hashlib

class UnboxkarScraper:
    def __init__(self, base_dir="c:/Users/venka/Downloads/Bangles/scraped-data"):
        self.base_url = "https://unboxkar.in"
        self.base_dir = Path(base_dir)
        self.site_dir = self.base_dir / "unboxkar"
        self.images_dir = self.site_dir / "images"
        self.products = []
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        }
        
        # Create directories
        self.site_dir.mkdir(parents=True, exist_ok=True)
        self.images_dir.mkdir(parents=True, exist_ok=True)
        
    def slugify(self, text):
        """Convert text to URL-friendly slug"""
        text = str(text).lower().strip()
        text = re.sub(r'[^\w\s-]', '', text)
        text = re.sub(r'[-\s]+', '-', text)
        return text
    
    def download_image(self, url, category, product_name, index=0):
        """Download image and return local path"""
        try:
            # Create category folder
            category_dir = self.images_dir / self.slugify(category)
            category_dir.mkdir(parents=True, exist_ok=True)
            
            # Generate filename
            ext = os.path.splitext(urlparse(url).path)[1] or '.jpg'
            filename = f"{self.slugify(product_name)}_{index}{ext}"
            filepath = category_dir / filename
            
            # Skip if already exists
            if filepath.exists():
                return str(filepath.relative_to(self.site_dir))
            
            # Download image
            response = requests.get(url, headers=self.headers, timeout=10)
            response.raise_for_status()
            
            with open(filepath, 'wb') as f:
                f.write(response.content)
            
            time.sleep(0.1)  # Rate limiting
            return str(filepath.relative_to(self.site_dir))
            
        except Exception as e:
            print(f"Error downloading image {url}: {e}")
            return None
    
    def extract_price(self, price_text):
        """Extract numeric price from text"""
        if not price_text:
            return None
        # Remove currency symbols and extract number
        match = re.search(r'[\d,]+\.?\d*', price_text.replace(',', ''))
        if match:
            return float(match.group())
        return None
    
    def scrape_product_page(self, url, category=""):
        """Scrape individual product page"""
        try:
            response = requests.get(url, headers=self.headers, timeout=10)
            response.raise_for_status()
            soup = BeautifulSoup(response.content, 'lxml')
            
            # Extract product details
            product = {
                'id': hashlib.md5(url.encode()).hexdigest()[:12],
                'url': url,
                'source': 'unboxkar',
                'category': category
            }
            
            # Product name
            name_elem = soup.find('h1', class_='product__title')
            if name_elem:
                product['name'] = name_elem.get_text(strip=True)
            
            # Price
            price_elem = soup.find('span', class_='price-item--regular')
            if not price_elem:
                price_elem = soup.find('span', class_='price')
            if price_elem:
                product['price'] = self.extract_price(price_elem.get_text(strip=True))
                product['currency'] = 'INR'
            
            # Sale price
            sale_elem = soup.find('span', class_='price-item--sale')
            if sale_elem:
                product['sale_price'] = self.extract_price(sale_elem.get_text(strip=True))
            
            # SKU
            sku_elem = soup.find('span', class_='sku')
            if sku_elem:
                product['sku'] = sku_elem.get_text(strip=True)
            
            # Description
            desc_elem = soup.find('div', class_='product__description')
            if desc_elem:
                product['description'] = desc_elem.get_text(strip=True)
            
            # Images
            product['images'] = []
            img_elems = soup.find_all('img', class_='product__media-item')
            if not img_elems:
                img_elems = soup.find_all('img', attrs={'data-src': True})
            
            for idx, img in enumerate(img_elems[:5]):  # Limit to 5 images
                img_url = img.get('data-src') or img.get('src')
                if img_url:
                    if not img_url.startswith('http'):
                        img_url = urljoin(self.base_url, img_url)
                    
                    local_path = self.download_image(
                        img_url, 
                        category, 
                        product.get('name', 'product'), 
                        idx
                    )
                    if local_path:
                        product['images'].append(local_path)
            
            # Availability
            availability_elem = soup.find('button', {'name': 'add'})
            product['availability'] = 'in_stock' if availability_elem else 'out_of_stock'
            
            return product
            
        except Exception as e:
            print(f"Error scraping product {url}: {e}")
            return None
    
    def scrape_collection(self, collection_url, category_name):
        """Scrape all products from a collection page"""
        products = []
        page = 1
        
        while True:
            try:
                url = f"{collection_url}?page={page}"
                print(f"Scraping {category_name} - Page {page}")
                
                response = requests.get(url, headers=self.headers, timeout=10)
                response.raise_for_status()
                soup = BeautifulSoup(response.content, 'lxml')
                
                # Find product links
                product_links = []
                for link in soup.find_all('a', class_='product-item__title'):
                    href = link.get('href')
                    if href:
                        product_links.append(urljoin(self.base_url, href))
                
                # Also try alternative selectors
                if not product_links:
                    for link in soup.find_all('a', href=re.compile(r'/products/')):
                        href = link.get('href')
                        if href and '/products/' in href:
                            full_url = urljoin(self.base_url, href)
                            if full_url not in product_links:
                                product_links.append(full_url)
                
                if not product_links:
                    break  # No more products
                
                # Scrape each product
                for product_url in tqdm(product_links, desc=f"{category_name} Page {page}"):
                    product = self.scrape_product_page(product_url, category_name)
                    if product:
                        products.append(product)
                    time.sleep(0.5)  # Rate limiting
                
                # Check for next page
                next_page = soup.find('a', {'aria-label': 'Next page'})
                if not next_page:
                    break
                
                page += 1
                time.sleep(1)  # Rate limiting between pages
                
            except Exception as e:
                print(f"Error scraping collection {collection_url}: {e}")
                break
        
        return products
    
    def scrape_all_collections(self):
        """Scrape all collections from the site"""
        # Main categories to scrape
        collections = {
            'Hair Claws': '/collections/hair-claw',
            'Hair Ties': '/collections/hair-ties',
            'Scrunchies': '/collections/scrunchies',
            'Hair Pins': '/collections/hair-pins',
            'Headbands': '/collections/head-bands',
            'Earrings': '/collections/earrings',
            'Anti-Tarnish Jewelry': '/collections/anti-tarnish-jewellery',
            'Kids': '/collections/kids',
            'Utility': '/collections/utility',
            'Hair Brush': '/collections/hair-brush',
            'Gifting': '/collections/hamper'
        }
        
        all_products = []
        
        for category_name, collection_path in collections.items():
            print(f"\n{'='*60}")
            print(f"Scraping category: {category_name}")
            print(f"{'='*60}")
            
            collection_url = urljoin(self.base_url, collection_path)
            products = self.scrape_collection(collection_url, category_name)
            all_products.extend(products)
            
            print(f"Found {len(products)} products in {category_name}")
            time.sleep(2)  # Rate limiting between categories
        
        self.products = all_products
        return all_products
    
    def save_to_json(self, filename="products.json"):
        """Save products to JSON file"""
        filepath = self.site_dir / filename
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump({
                'website': 'unboxkar.in',
                'scraped_at': time.strftime('%Y-%m-%d %H:%M:%S'),
                'total_products': len(self.products),
                'products': self.products
            }, f, indent=2, ensure_ascii=False)
        
        print(f"\nSaved {len(self.products)} products to {filepath}")
        return filepath
    
    def run(self):
        """Main scraping workflow"""
        print("Starting Unboxkar.in scraper...")
        print(f"Output directory: {self.site_dir}")
        
        # Scrape all collections
        self.scrape_all_collections()
        
        # Save to JSON
        self.save_to_json()
        
        print(f"\n{'='*60}")
        print(f"Scraping completed!")
        print(f"Total products: {len(self.products)}")
        print(f"Data saved to: {self.site_dir}")
        print(f"{'='*60}")


if __name__ == "__main__":
    scraper = UnboxkarScraper()
    scraper.run()
