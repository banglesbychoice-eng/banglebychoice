#!/usr/bin/env python3
"""
Unified Catalog Generator
Merges products from all three websites and applies lowest price logic
"""

import json
import pandas as pd
from pathlib import Path
from fuzzywuzzy import fuzz
from collections import defaultdict
import re

class CatalogUnifier:
    def __init__(self, base_dir="c:/Users/venka/Downloads/Bangles/scraped-data"):
        self.base_dir = Path(base_dir)
        self.unified_dir = self.base_dir / "unified-catalog"
        self.unified_dir.mkdir(parents=True, exist_ok=True)
        
        self.all_products = []
        self.unified_products = []
        
    def load_products(self):
        """Load products from all three JSON files"""
        sites = ['unboxkar', 'scrunchybows', 'theunikart']
        
        for site in sites:
            json_path = self.base_dir / site / "products.json"
            if json_path.exists():
                print(f"Loading products from {site}...")
                with open(json_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    products = data.get('products', [])
                    self.all_products.extend(products)
                    print(f"  Loaded {len(products)} products from {site}")
            else:
                print(f"  Warning: {json_path} not found")
        
        print(f"\nTotal products loaded: {len(self.all_products)}")
        return self.all_products
    
    def normalize_name(self, name):
        """Normalize product name for comparison"""
        if not name:
            return ""
        # Convert to lowercase, remove extra spaces and special chars
        name = name.lower().strip()
        name = re.sub(r'[^\w\s-]', '', name)
        name = re.sub(r'\s+', ' ', name)
        # Remove common prefixes/suffixes
        name = re.sub(r'\s*-\s*ubk\d+.*$', '', name)  # Remove UBK codes
        name = re.sub(r'\s*\(\d+\s*pcs?\).*$', '', name, flags=re.IGNORECASE)
        return name.strip()
    
    def are_products_similar(self, name1, name2, threshold=85):
        """Check if two product names are similar using fuzzy matching"""
        norm1 = self.normalize_name(name1)
        norm2 = self.normalize_name(name2)
        
        if not norm1 or not norm2:
            return False
        
        # Calculate similarity ratio
        ratio = fuzz.token_sort_ratio(norm1, norm2)
        return ratio >= threshold
    
    def get_best_price(self, product_sources):
        """Get the lowest price from multiple sources"""
        prices = []
        
        for source in product_sources:
            # Use sale price if available, otherwise regular price
            price = source.get('sale_price') or source.get('price')
            if price and price > 0:
                prices.append(price)
        
        return min(prices) if prices else None
    
    def merge_products(self):
        """Merge similar products and apply lowest price logic"""
        print("\nMerging products...")
        
        # Group products by category for faster matching
        by_category = defaultdict(list)
        for product in self.all_products:
            category = product.get('category', 'Uncategorized')
            by_category[category].append(product)
        
        processed_ids = set()
        
        for category, products in by_category.items():
            print(f"Processing category: {category} ({len(products)} products)")
            
            for i, product in enumerate(products):
                if product['id'] in processed_ids:
                    continue
                
                # Find similar products
                similar = [product]
                processed_ids.add(product['id'])
                
                for j in range(i + 1, len(products)):
                    other = products[j]
                    if other['id'] in processed_ids:
                        continue
                    
                    if self.are_products_similar(product.get('name', ''), other.get('name', '')):
                        similar.append(other)
                        processed_ids.add(other['id'])
                
                # Create unified product
                unified = self.create_unified_product(similar)
                self.unified_products.append(unified)
        
        print(f"\nUnified products: {len(self.unified_products)}")
        return self.unified_products
    
    def create_unified_product(self, similar_products):
        """Create a unified product from similar products across websites"""
        # Use the first product as base
        base = similar_products[0]
        
        unified = {
            'id': f"unified_{base['id']}",
            'name': base.get('name', 'Unknown Product'),
            'category': base.get('category', 'Uncategorized'),
            'sources': []
        }
        
        # Collect all sources
        all_prices = []
        all_images = []
        descriptions = []
        
        for product in similar_products:
            source_info = {
                'website': product.get('source', 'unknown'),
                'url': product.get('url', ''),
                'sku': product.get('sku', ''),
                'price': product.get('price'),
                'sale_price': product.get('sale_price'),
                'availability': product.get('availability', 'unknown')
            }
            
            # Track best price from this source
            best_price = source_info['sale_price'] or source_info['price']
            if best_price and best_price > 0:
                all_prices.append(best_price)
                source_info['best_price'] = best_price
            
            unified['sources'].append(source_info)
            
            # Collect images
            images = product.get('images', [])
            if images:
                all_images.extend(images)
            
            # Collect descriptions
            desc = product.get('description', '')
            if desc and desc not in descriptions:
                descriptions.append(desc)
        
        # Set lowest price
        if all_prices:
            unified['lowest_price'] = min(all_prices)
            unified['highest_price'] = max(all_prices)
            unified['price_savings'] = max(all_prices) - min(all_prices) if len(all_prices) > 1 else 0
            unified['currency'] = 'INR'
        
        # Set images (unique only)
        unified['images'] = list(dict.fromkeys(all_images))[:5]  # Max 5 images
        
        # Combine descriptions
        unified['description'] = ' | '.join(descriptions[:2])  # Max 2 descriptions
        
        # Add metadata
        unified['source_count'] = len(similar_products)
        unified['available_at'] = [s['website'] for s in unified['sources']]
        
        return unified
    
    def save_to_json(self, filename="products.json"):
        """Save unified catalog to JSON"""
        filepath = self.unified_dir / filename
        
        output = {
            'catalog_name': 'Bangles by Choice - Unified Catalog',
            'generated_at': pd.Timestamp.now().strftime('%Y-%m-%d %H:%M:%S'),
            'total_products': len(self.unified_products),
            'total_source_products': len(self.all_products),
            'products': self.unified_products
        }
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(output, f, indent=2, ensure_ascii=False)
        
        print(f"\nSaved unified catalog to {filepath}")
        return filepath
    
    def save_to_csv(self, filename="products.csv"):
        """Save unified catalog to CSV"""
        filepath = self.unified_dir / filename
        
        # Flatten data for CSV
        rows = []
        for product in self.unified_products:
            row = {
                'ID': product['id'],
                'Name': product['name'],
                'Category': product['category'],
                'Lowest Price': product.get('lowest_price', ''),
                'Highest Price': product.get('highest_price', ''),
                'Price Savings': product.get('price_savings', ''),
                'Currency': product.get('currency', 'INR'),
                'Available At': ', '.join(product.get('available_at', [])),
                'Source Count': product.get('source_count', 0),
                'Images': len(product.get('images', [])),
                'Description': product.get('description', '')[:100]  # Truncate
            }
            rows.append(row)
        
        df = pd.DataFrame(rows)
        df.to_csv(filepath, index=False, encoding='utf-8')
        
        print(f"Saved CSV to {filepath}")
        return filepath
    
    def generate_price_comparison_report(self):
        """Generate a price comparison report"""
        filepath = self.unified_dir / "price-comparison.json"
        
        # Find products with price differences
        price_comparisons = []
        
        for product in self.unified_products:
            if product.get('source_count', 0) > 1 and product.get('price_savings', 0) > 0:
                comparison = {
                    'name': product['name'],
                    'category': product['category'],
                    'lowest_price': product.get('lowest_price'),
                    'highest_price': product.get('highest_price'),
                    'savings': product.get('price_savings'),
                    'savings_percent': round((product.get('price_savings', 0) / product.get('highest_price', 1)) * 100, 2),
                    'sources': product['sources']
                }
                price_comparisons.append(comparison)
        
        # Sort by savings
        price_comparisons.sort(key=lambda x: x['savings'], reverse=True)
        
        output = {
            'total_products_with_price_differences': len(price_comparisons),
            'total_potential_savings': sum(p['savings'] for p in price_comparisons),
            'comparisons': price_comparisons[:100]  # Top 100
        }
        
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(output, f, indent=2, ensure_ascii=False)
        
        print(f"\nSaved price comparison report to {filepath}")
        print(f"Found {len(price_comparisons)} products with price differences")
        print(f"Total potential savings: ₹{output['total_potential_savings']:.2f}")
        
        return filepath
    
    def generate_summary_report(self):
        """Generate a summary statistics report"""
        # Category breakdown
        by_category = defaultdict(int)
        by_source = defaultdict(int)
        
        for product in self.unified_products:
            by_category[product.get('category', 'Uncategorized')] += 1
            for source in product.get('sources', []):
                by_source[source['website']] += 1
        
        summary = {
            'total_unified_products': len(self.unified_products),
            'total_source_products': len(self.all_products),
            'deduplication_rate': round((1 - len(self.unified_products) / max(len(self.all_products), 1)) * 100, 2),
            'products_by_category': dict(by_category),
            'products_by_source': dict(by_source),
            'avg_sources_per_product': round(sum(p.get('source_count', 0) for p in self.unified_products) / max(len(self.unified_products), 1), 2)
        }
        
        filepath = self.unified_dir / "summary.json"
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(summary, f, indent=2, ensure_ascii=False)
        
        print(f"\n{'='*60}")
        print("SUMMARY REPORT")
        print(f"{'='*60}")
        print(f"Total Unified Products: {summary['total_unified_products']}")
        print(f"Total Source Products: {summary['total_source_products']}")
        print(f"Deduplication Rate: {summary['deduplication_rate']}%")
        print(f"Avg Sources per Product: {summary['avg_sources_per_product']}")
        print(f"\nTop Categories:")
        for cat, count in sorted(by_category.items(), key=lambda x: x[1], reverse=True)[:10]:
            print(f"  - {cat}: {count}")
        
        return filepath
    
    def run(self):
        """Main unification workflow"""
        print("Starting catalog unification...")
        print(f"Output directory: {self.unified_dir}\n")
        
        # Load products
        self.load_products()
        
        # Merge products
        self.merge_products()
        
        # Save outputs
        self.save_to_json()
        self.save_to_csv()
        self.generate_price_comparison_report()
        self.generate_summary_report()
        
        print(f"\n{'='*60}")
        print("UNIFICATION COMPLETED!")
        print(f"{'='*60}")


if __name__ == "__main__":
    unifier = CatalogUnifier()
    unifier.run()
