/**
 * Product Grouping & Category Hierarchy Utility
 * Hierarchical category system with smart grouping for mobile browsing
 */

// ===== Category Hierarchy =====
const CATEGORY_HIERARCHY = {
    bangles: {
        label: 'Bangles',
        icon: '💍',
        subCategories: {
            'round-bangles': { label: 'Round Bangles', match: ['Round Bangles'] },
            'flat-bangles': { label: 'Flat Bangles', match: ['Flat Bangles'] },
            'kids-bangles': { label: 'Kids Bangles', match: ['Kids Bangles'] },
            'curve-bangles': { label: 'Curve Bangles', match: ['Curve Bangles'] },
            'metal-bangles': { label: 'Metal Bangles', match: ['Metal Bangles'] },
        }
    },
    'raw-materials': {
        label: 'Raw Materials',
        icon: '🧵',
        subCategories: {
            'silk-thread': { label: 'Silk Thread', match: ['Silk Thread'] },
            'glue': { label: 'Glue', match: ['Glue'] },
            'stone-chain': { label: 'Stone Chains', match: ['Stone Chain', 'Anti Tarnish Chains'] },
            'jewellery-findings': { label: 'Findings & Tools', match: ['Jewellery Findings', 'Ring Base'] },
            'zardosi': { label: 'Zardosi', match: ['Zardosi'] },
            'mdf': { label: 'MDF', match: ['MDF'] },
            'sequins': { label: 'Sequins', match: ['Sequins'] },
        }
    },
    kundhans: {
        label: 'Kundhans & Beads',
        icon: '💎',
        subCategories: {
            'glass-kundhans': { label: 'Glass Kundhans', match: ['Glass Kundhans', 'Glass Kundan 3mm Round', 'Glass Kundan 4mm Round'] },
            'ceramic-kundhans': { label: 'Ceramic Pearl', match: ['Ceramic Pearl'] },
            'kundan-beads': { label: 'Kundan Beads', match: ['Multicolour Kundan Beads', 'Silver Kundan Beads', 'Golden Kundan Beads', 'Silver Frame Kundan Beads'] },
            'clip-stones': { label: 'Clip Stones', match: ['Clip Stones', '3mm Round Clip Stone', '5mm Round Clip Stone', '6mm Round Clip Stone', '8mm Round Clip Stone'] },
            'seed-beads': { label: 'Seed Beads', match: ['Seed Beads'] },
            'cut-beads': { label: 'Cut Beads', match: ['Cut Beads'] },
            'pearl-beads': { label: 'Pearl Beads', match: ['Pearl Beads'] },
            'tube-beads': { label: 'Tube Beads', match: ['Tube Beads'] },
            'hot-fix': { label: 'Hot Fix Rhinestone', match: ['Hot Fix Rhinestone'] },
            'charms': { label: 'Charms', match: ['Charms', 'AD Stone Charms'] },
            'jasmine': { label: 'Jasmine Buds', match: ['Jasmine Buds'] },
        }
    },
    accessories: {
        label: 'Accessories',
        icon: '📿',
        subCategories: {
            'hair-pins': { label: 'Hair Pins', match: ['Hair Pins'] },
            'headbands': { label: 'Headbands', match: ['Headbands', 'Hair Band'] },
            'hair-accessories': { label: 'Hair Accessories', match: ['Hair Accessories', 'Clips'] },
            'hair-brush': { label: 'Hair Brush', match: ['Hair Brush'] },
            'saree-pins': { label: 'Saree Pins', match: ['Saree Pins', 'U Pin'] },
            'pendant-jhumka': { label: 'Pendant & Jhumka', match: ['Pendant & Jhumka'] },
            'utility': { label: 'Utility', match: ['Utility'] },
        }
    },
    'kits-more': {
        label: 'Kits & Packaging',
        icon: '🎁',
        subCategories: {
            'beginners-kit': { label: 'Beginners Kit', match: ['Beginners Kit'] },
            'gifting': { label: 'Gifting', match: ['Gifting'] },
            'packaging': { label: 'Packaging', match: ['Potli Bag', 'Plastic Bag', 'Zip Lock Bag', 'Corrugated Boxes'] },
        }
    }
};

/**
 * Find which super-category and sub-category a product belongs to
 */
function categorizeProduct(product) {
    const productCategory = (product.category || '').trim();

    for (const [superKey, superCat] of Object.entries(CATEGORY_HIERARCHY)) {
        for (const [subKey, subCat] of Object.entries(superCat.subCategories)) {
            if (subCat.match.some(m => productCategory.toLowerCase() === m.toLowerCase())) {
                return { superKey, subKey, superLabel: superCat.label, subLabel: subCat.label };
            }
        }
    }

    // Fallback: try partial match
    for (const [superKey, superCat] of Object.entries(CATEGORY_HIERARCHY)) {
        for (const [subKey, subCat] of Object.entries(superCat.subCategories)) {
            if (subCat.match.some(m => productCategory.toLowerCase().includes(m.toLowerCase()) || m.toLowerCase().includes(productCategory.toLowerCase()))) {
                return { superKey, subKey, superLabel: superCat.label, subLabel: subCat.label };
            }
        }
    }

    // Default: put in accessories > utility
    return { superKey: 'accessories', subKey: 'utility', superLabel: 'Accessories', subLabel: 'Utility' };
}

/**
 * Get the category hierarchy tree
 */
function getCategoryTree() {
    return CATEGORY_HIERARCHY;
}

/**
 * Get sub-categories for a given super-category key
 */
function getSubCategories(superKey) {
    const superCat = CATEGORY_HIERARCHY[superKey];
    if (!superCat) return [];

    return Object.entries(superCat.subCategories).map(([key, val]) => ({
        key,
        label: val.label,
        match: val.match
    }));
}

/**
 * Extract base name from product name by removing variations like sizes, colors, SKUs
 */
function extractBaseName(name) {
    if (!name) return 'Product';

    let base = name
        .trim()
        // Remove UBK/SKU codes like "- UBK1487", "– UBK3119"
        .replace(/\s*[-–]\s*UBK\d+/gi, '')
        // Remove sizes like "2.4", "3mm", "4mm"
        .replace(/\b\d+\.?\d*\s?(mm|cm|inch|inches|size)?\b/gi, '')
        // Remove common color words at end
        .replace(/\b(red|blue|green|yellow|pink|purple|black|white|gold|golden|silver|brown|orange|grey|gray|matt|matte)\b/gi, '')
        // Remove quantity patterns like "(Set of 2)", "(2Pcs)", "(3Pcs)", "(Pack of 3)"
        .replace(/\s*\((?:set of|pack of|)?\s*\d+\s*(?:pcs|pcs\)|pieces)?\)/gi, '')
        // Remove shade numbers like "Shade No 104L"
        .replace(/\bshade\s*no\.?\s*\w+/gi, '')
        // Remove extra whitespace and dashes
        .replace(/\s*[-–]+\s*/g, ' ')
        .replace(/\s+/g, ' ')
        .trim();

    if (!base || base.length < 2) return name.trim();

    // Capitalize first letter of each word
    return base.replace(/\b\w/g, c => c.toUpperCase());
}

/**
 * Group products by sub-category, then by name similarity within each
 */
function groupProducts(products) {
    if (!products || products.length === 0) return [];

    const groups = {};

    products.forEach(product => {
        const { superKey, subKey, superLabel, subLabel } = categorizeProduct(product);
        const baseName = extractBaseName(product.name);
        const groupKey = `${superKey}::${subKey}::${baseName}`;

        if (!groups[groupKey]) {
            groups[groupKey] = {
                id: groupKey,
                baseName: baseName,
                category: product.category || subLabel,
                superCategory: superKey,
                superLabel: superLabel,
                subCategory: subKey,
                subLabel: subLabel,
                variants: [],
                priceRange: { min: Infinity, max: 0 },
                mainImage: product.image || product.images?.[0] || '',
                sources: new Set(),
                allImages: [],
                searchText: '' // Pre-built search index
            };
        }

        groups[groupKey].variants.push(product);

        const price = product.price || 0;
        if (price > 0) {
            groups[groupKey].priceRange.min = Math.min(groups[groupKey].priceRange.min, price);
            groups[groupKey].priceRange.max = Math.max(groups[groupKey].priceRange.max, price);
        }

        if (product.sources) {
            product.sources.forEach(s => groups[groupKey].sources.add(s.website || s));
        } else if (product.source) {
            groups[groupKey].sources.add(product.source);
        }

        if (product.images && Array.isArray(product.images)) {
            groups[groupKey].allImages.push(...product.images);
        } else if (product.image) {
            groups[groupKey].allImages.push(product.image);
        }

        // Build search text
        groups[groupKey].searchText += ` ${product.name} ${product.category} ${product.description || ''} ${baseName} ${subLabel} ${superLabel}`;
    });

    return Object.values(groups).map(group => ({
        ...group,
        sources: Array.from(group.sources),
        variantCount: group.variants.length,
        allImages: [...new Set(group.allImages)],
        mainImage: group.mainImage || group.allImages[0] || '',
        priceRange: {
            min: group.priceRange.min === Infinity ? 0 : group.priceRange.min,
            max: group.priceRange.max
        },
        searchText: group.searchText.toLowerCase()
    }));
}

/**
 * Filter product groups by super-category
 */
function filterGroupsByCategory(groups, superCategoryKey) {
    if (!superCategoryKey || superCategoryKey === 'all') return groups;
    return groups.filter(g => g.superCategory === superCategoryKey);
}

/**
 * Filter product groups by sub-category
 */
function filterGroupsBySubCategory(groups, subCategoryKey) {
    if (!subCategoryKey || subCategoryKey === 'all') return groups;
    return groups.filter(g => g.subCategory === subCategoryKey);
}

/**
 * Get groups organized by sub-category for a given super-category
 * Returns: [{ subKey, subLabel, groups: [...] }, ...]
 */
function getGroupedBySubCategory(allGroups, superCategoryKey) {
    const filtered = filterGroupsByCategory(allGroups, superCategoryKey);
    const subGroups = {};

    filtered.forEach(group => {
        if (!subGroups[group.subCategory]) {
            subGroups[group.subCategory] = {
                subKey: group.subCategory,
                subLabel: group.subLabel,
                groups: []
            };
        }
        subGroups[group.subCategory].groups.push(group);
    });

    return Object.values(subGroups).sort((a, b) => a.subLabel.localeCompare(b.subLabel));
}

/**
 * Sort product groups
 */
function sortGroups(groups, sortBy = 'name') {
    const sorted = [...groups];
    switch (sortBy) {
        case 'price-low':
            sorted.sort((a, b) => a.priceRange.min - b.priceRange.min);
            break;
        case 'price-high':
            sorted.sort((a, b) => b.priceRange.min - a.priceRange.min);
            break;
        case 'variants':
            sorted.sort((a, b) => b.variantCount - a.variantCount);
            break;
        case 'name':
        default:
            sorted.sort((a, b) => a.baseName.localeCompare(b.baseName));
            break;
    }
    return sorted;
}

/**
 * Smart search across product groups with fuzzy matching
 */
function searchGroups(groups, query) {
    if (!query || query.trim() === '') return groups;

    const terms = query.toLowerCase().trim().split(/\s+/);

    // Score each group
    const scored = groups.map(group => {
        let score = 0;
        const searchText = group.searchText;
        const baseLower = group.baseName.toLowerCase();
        const catLower = group.subLabel.toLowerCase();
        const superLower = group.superLabel.toLowerCase();

        terms.forEach(term => {
            // Exact match in base name (highest priority)
            if (baseLower.includes(term)) score += 10;
            // Exact match in sub-category
            if (catLower.includes(term)) score += 8;
            // Exact match in super-category
            if (superLower.includes(term)) score += 6;
            // Match in full search text
            if (searchText.includes(term)) score += 3;
            // Starts-with bonus
            if (baseLower.startsWith(term)) score += 5;
            if (catLower.startsWith(term)) score += 4;
        });

        return { group, score };
    });

    return scored
        .filter(s => s.score > 0)
        .sort((a, b) => b.score - a.score)
        .map(s => s.group);
}

/**
 * Get popular search suggestions based on product data
 */
function getPopularSearchTerms(groups) {
    const terms = new Map();

    // Add sub-category labels
    groups.forEach(g => {
        const key = g.subLabel.toLowerCase();
        terms.set(key, (terms.get(key) || 0) + g.variantCount);
    });

    // Sort by product count and return top 12
    return [...terms.entries()]
        .sort((a, b) => b[1] - a[1])
        .slice(0, 12)
        .map(([term, count]) => ({
            term: term.charAt(0).toUpperCase() + term.slice(1),
            count
        }));
}

/**
 * Get category counts for navigation
 */
function getCategoryCounts(groups) {
    const counts = {};

    for (const [superKey, superCat] of Object.entries(CATEGORY_HIERARCHY)) {
        const superGroups = groups.filter(g => g.superCategory === superKey);
        const totalProducts = superGroups.reduce((sum, g) => sum + g.variantCount, 0);

        counts[superKey] = {
            label: superCat.label,
            icon: superCat.icon,
            groupCount: superGroups.length,
            productCount: totalProducts,
            subCategories: {}
        };

        for (const [subKey, subCat] of Object.entries(superCat.subCategories)) {
            const subGroups = superGroups.filter(g => g.subCategory === subKey);
            const subProducts = subGroups.reduce((sum, g) => sum + g.variantCount, 0);

            counts[superKey].subCategories[subKey] = {
                label: subCat.label,
                groupCount: subGroups.length,
                productCount: subProducts
            };
        }
    }

    return counts;
}
