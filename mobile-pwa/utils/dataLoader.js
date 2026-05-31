/**
 * Data Loader Utility
 * Loads and transforms scraped product data with image fallbacks
 */

// SVG placeholder for missing images
const PLACEHOLDER_SVG = `data:image/svg+xml,${encodeURIComponent(`<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400" viewBox="0 0 400 400"><rect fill="#f1f5f9" width="400" height="400"/><g fill="#94a3b8" transform="translate(140,140)"><rect x="20" y="0" width="80" height="100" rx="8" fill="none" stroke="#94a3b8" stroke-width="4"/><circle cx="60" cy="30" r="12" fill="none" stroke="#94a3b8" stroke-width="3"/><path d="M25 80 L45 55 L55 65 L75 40 L95 75" fill="none" stroke="#94a3b8" stroke-width="3" stroke-linejoin="round"/></g><text x="200" y="290" text-anchor="middle" fill="#94a3b8" font-family="sans-serif" font-size="14">No Image</text></svg>`)}`;

/**
 * Fix image path separators (backslash to forward slash)
 */
function fixImagePath(imagePath, sourceWebsite) {
    if (!imagePath) return PLACEHOLDER_SVG;
    
    // Already a URL
    if (imagePath.startsWith('http')) return imagePath;
    if (imagePath.startsWith('data:')) return imagePath;
    
    // Fix backslashes to forward slashes
    const fixed = imagePath.replace(/\\\\/g, '/').replace(/\\/g, '/');
    
    // Build relative path from mobile-pwa directory
    return `../scraped-data/${sourceWebsite}/${fixed}`;
}

/**
 * Transform scraped data to app format
 */
function transformScrapedData(scrapedProducts) {
    return scrapedProducts.map((sp, index) => {
        const primarySource = sp.sources && sp.sources.length > 0 ? sp.sources[0] : null;
        const sourceWebsite = primarySource ? primarySource.website : 'unboxkar';

        const price = sp.lowest_price || (primarySource ? (primarySource.sale_price || primarySource.best_price || primarySource.price) : 0) || sp.price || 0;
        const originalPrice = sp.highest_price || (primarySource ? primarySource.price : 0) || sp.price || 0;

        const hasDiscount = originalPrice && price && originalPrice > price;
        const discountPercent = hasDiscount
            ? Math.round(((originalPrice - price) / originalPrice) * 100)
            : 0;

        // Process images
        const rawImages = sp.images && sp.images.length > 0 ? sp.images : [];
        const processedImages = rawImages.map(img => fixImagePath(img, sourceWebsite));
        const mainImage = processedImages.length > 0 ? processedImages[0] : PLACEHOLDER_SVG;

        const url = (primarySource && primarySource.url) || sp.url || '';
        let finalName = sp.name || 'Unnamed Product';
        
        // Fix missing names by parsing URL slug
        if (finalName === 'Unknown Product' && url) {
            const slug = url.split('/').pop().split('?')[0];
            // E.g. "flat-bangles-2-cut" -> "Flat Bangles 2 Cut"
            finalName = slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
        }

        return {
            id: sp.id || `product-${index + 1}`,
            name: finalName,
            category: sp.category || 'Accessories',
            price: price,
            originalPrice: originalPrice,
            image: mainImage,
            images: processedImages.length > 0 ? processedImages : [PLACEHOLDER_SVG],
            sources: sp.sources || [],
            description: sp.description || '',
            badge: hasDiscount && discountPercent > 5 ? `${discountPercent}% OFF` : null,
            sourceCount: sp.source_count || 1,
            availableAt: sp.available_at || [],
            url: url
        };
    });
}

/**
 * Load products from scraped data
 */
async function loadProducts() {
    try {
        // Try unified catalog first
        const response = await fetch('../scraped-data/unified-catalog/products.json');
        const result = await response.json();

        if (result.products && result.products.length > 0) {
            console.log(`Loaded ${result.products.length} products from unified catalog`);
            const transformed = transformScrapedData(result.products);
            
            // Cache for instant reload
            try {
                localStorage.setItem('bangles-products-cache-v2', JSON.stringify({
                    timestamp: Date.now(),
                    products: transformed
                }));
            } catch (e) {
                console.warn('Could not cache products:', e.message);
            }
            
            return transformed;
        }

        throw new Error('No products in unified catalog');
    } catch (error) {
        console.warn('Unified catalog not available, trying fallback:', error.message);

        // Try cached data first for instant load
        try {
            const cached = localStorage.getItem('bangles-products-cache-v2');
            if (cached) {
                const { timestamp, products } = JSON.parse(cached);
                const ageHours = (Date.now() - timestamp) / (1000 * 60 * 60);
                if (ageHours < 24 && products.length > 0) {
                    console.log(`Using cached data (${products.length} products, ${ageHours.toFixed(1)}h old)`);
                    return products;
                }
            }
        } catch (e) { /* ignore cache errors */ }

        // Fallback: Load from individual sites
        const sites = ['unboxkar', 'scrunchybows', 'theunikart'];
        let allProducts = [];

        for (const site of sites) {
            try {
                const siteResponse = await fetch(`../scraped-data/${site}/products.json`);
                const siteData = await siteResponse.json();

                if (siteData.products) {
                    const siteProducts = siteData.products.map(p => ({
                        id: p.id,
                        name: p.name,
                        category: p.category,
                        lowest_price: p.sale_price || p.price,
                        highest_price: p.price,
                        images: p.images || [],
                        description: p.description,
                        sources: [{
                            website: site,
                            price: p.price,
                            best_price: p.sale_price || p.price,
                            sku: p.sku,
                            availability: p.availability,
                            url: p.url
                        }],
                        source_count: 1,
                        available_at: [site]
                    }));

                    allProducts = allProducts.concat(siteProducts);
                    console.log(`Loaded ${siteProducts.length} products from ${site}`);
                }
            } catch (siteError) {
                console.warn(`Could not load from ${site}:`, siteError.message);
            }
        }

        if (allProducts.length > 0) {
            return transformScrapedData(allProducts);
        }

        throw new Error('No products found in any source');
    }
}

/**
 * Setup lazy image loading with IntersectionObserver
 */
function setupLazyImages() {
    if (!('IntersectionObserver' in window)) return;

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                const src = img.dataset.src;
                if (src) {
                    img.src = src;
                    img.removeAttribute('data-src');
                    observer.unobserve(img);
                }
            }
        });
    }, { rootMargin: '200px' });

    // Observe all lazy images
    document.querySelectorAll('img[data-src]').forEach(img => {
        observer.observe(img);
    });

    return observer;
}

/**
 * Handle broken images by replacing with placeholder
 */
function handleImageError(img) {
    if (img.src !== PLACEHOLDER_SVG) {
        img.src = PLACEHOLDER_SVG;
        img.classList.add('img-placeholder');
    }
}
