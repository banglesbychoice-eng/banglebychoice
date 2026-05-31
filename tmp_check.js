// Quick check: which products have no name
const data = require('./scraped-data/unified-catalog/products.json');

console.log('Total products:', data.products.length);
console.log('Products without name:', data.products.filter(p => !p.name).length);

// Show flat bangles names
console.log('\nFlat Bangles:');
data.products.filter(p => p.category === 'Flat Bangles').forEach(p => {
    console.log(`  "${p.name || '(none)'}"`);
});

// Check how many have images
const withImages = data.products.filter(p => p.images && p.images.length > 0);
console.log(`\nProducts with images: ${withImages.length} / ${data.products.length}`);
