#!/usr/bin/env python3
"""
Master Scraper - Run all scrapers sequentially
"""

import sys
import time
from pathlib import Path

# Add scripts directory to path
sys.path.insert(0, str(Path(__file__).parent))

from scraper_unboxkar import UnboxkarScraper
from scraper_scrunchybows import ScrunchyBowsScraper
from scraper_theunikart import UnikartScraper
from unify_catalog import CatalogUnifier

def main():
    print("="*80)
    print("BANGLES BY CHOICE - MASTER WEB SCRAPER")
    print("="*80)
    print("\nThis script will scrape all three websites:")
    print("  1. Unboxkar.in")
    print("  2. ScrunchyBowsIndia.com")
    print("  3. TheUnikart.co.in")
    print("\nAnd then create a unified catalog with lowest prices.")
    print("\n" + "="*80 + "\n")
    
    start_time = time.time()
    
    # Scrape Unboxkar
    print("\n" + "="*80)
    print("STEP 1/4: Scraping Unboxkar.in")
    print("="*80)
    try:
        unboxkar = UnboxkarScraper()
        unboxkar.run()
    except Exception as e:
        print(f"Error scraping Unboxkar: {e}")
    
    time.sleep(3)
    
    # Scrape ScrunchyBows
    print("\n" + "="*80)
    print("STEP 2/4: Scraping ScrunchyBowsIndia.com")
    print("="*80)
    try:
        scrunchybows = ScrunchyBowsScraper()
        scrunchybows.run()
    except Exception as e:
        print(f"Error scraping ScrunchyBows: {e}")
    
    time.sleep(3)
    
    # Scrape TheUnikart
    print("\n" + "="*80)
    print("STEP 3/4: Scraping TheUnikart.co.in")
    print("="*80)
    try:
        unikart = UnikartScraper()
        unikart.run()
    except Exception as e:
        print(f"Error scraping TheUnikart: {e}")
    
    time.sleep(3)
    
    # Unify catalogs
    print("\n" + "="*80)
    print("STEP 4/4: Creating Unified Catalog")
    print("="*80)
    try:
        unifier = CatalogUnifier()
        unifier.run()
    except Exception as e:
        print(f"Error creating unified catalog: {e}")
    
    # Completion
    elapsed = time.time() - start_time
    minutes = int(elapsed // 60)
    seconds = int(elapsed % 60)
    
    print("\n" + "="*80)
    print("ALL DONE!")
    print("="*80)
    print(f"Total time: {minutes}m {seconds}s")
    print(f"\nData saved to: c:/Users/venka/Downloads/Bangles/scraped-data/")
    print("  - Individual site data: unboxkar/, scrunchybows/, theunikart/")
    print("  - Unified catalog: unified-catalog/")
    print("\n" + "="*80)

if __name__ == "__main__":
    main()
