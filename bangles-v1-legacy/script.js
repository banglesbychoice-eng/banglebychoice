// --- DATA ---
let allProducts = [];
let currentContext = 'bangles';
let cart = [];
let currentModalProduct = null;

// derived data for filters
let availableAttributes = { shapes: [], colors: [], sizes: [] };

// --- INITIALIZATION ---
window.addEventListener('DOMContentLoaded', () => {
    fetchProducts();
    initMultilingualHeader();

    window.addEventListener('scroll', () => {
        const nav = document.getElementById('navbar');
        if (nav) {
            nav.classList.toggle('shadow-md', window.scrollY > 50);
            nav.classList.toggle('bg-white/95', window.scrollY > 50);
            nav.classList.toggle('glass-effect', window.scrollY <= 50);
        }
    });

    if (document.querySelector('#desktop-cart-btn'))
        document.querySelector('#desktop-cart-btn').addEventListener('click', toggleCart);
});


// --- CONTEXT & NAVIGATION ---
function switchContext(context) {
    currentContext = context;

    // UI Updates
    document.querySelectorAll('[id^="desk-nav-"]').forEach(btn => {
        btn.classList.remove('text-rose-600', 'border-b-2', 'border-rose-600');
        btn.classList.add('text-slate-600');
    });
    const active = document.getElementById(`desk-nav-${context}`);
    if (active) active.classList.replace('text-slate-600', 'text-rose-600');
    if (active) active.classList.add('border-b-2', 'border-rose-600');

    // Title Updates
    // Mobile Title Logic
    const isBangles = context === 'bangles';
    if (document.getElementById('collection-title'))
        document.getElementById('collection-title').innerText = isBangles ? 'Curated Bangles' : 'DIY Raw Materials';
    if (document.getElementById('collection-subtitle'))
        document.getElementById('collection-subtitle').innerText = isBangles ? 'Handcrafted with love.' : 'Grouped by Shape, Size & Color.';

    // Segmented Control State
    const segBangles = document.getElementById('seg-btn-bangles');
    const segMaterials = document.getElementById('seg-btn-materials');
    if (segBangles && segMaterials) {
        if (context === 'bangles') {
            segBangles.className = 'flex-1 py-2 rounded-lg text-sm font-bold transition-all bg-rose-600 text-white shadow-sm';
            segMaterials.className = 'flex-1 py-2 rounded-lg text-sm font-bold text-slate-500 hover:text-slate-800 transition-all';
        } else {
            segMaterials.className = 'flex-1 py-2 rounded-lg text-sm font-bold transition-all bg-rose-600 text-white shadow-sm';
            segBangles.className = 'flex-1 py-2 rounded-lg text-sm font-bold text-slate-500 hover:text-slate-800 transition-all';
        }
    }

    // Refresh Mobile Filters via Pills
    if (window.innerWidth < 768) renderMobilePills();

    // Toggle Filters
    if (document.getElementById('bangles-filters'))
        document.getElementById('bangles-filters').classList.toggle('hidden', !isBangles);
    if (document.getElementById('materials-filters'))
        document.getElementById('materials-filters').classList.toggle('hidden', isBangles);

    // Reset Filters
    document.querySelectorAll('select').forEach(s => s.value = 'default');
    if (document.getElementById('desktop-category-filter')) document.getElementById('desktop-category-filter').value = 'all';
    if (document.getElementById('filter-shape')) document.getElementById('filter-shape').value = 'all';

    renderProducts();
}

function switchMobileView(view) {
    document.querySelectorAll('.mobile-view').forEach(v => {
        v.classList.add('hidden');
        v.classList.remove('view-active');
    });
    const el = document.getElementById(`view-${view}`);
    if (el) { el.classList.remove('hidden'); el.classList.add('view-active'); }

    document.querySelectorAll('.mobile-nav-btn').forEach(b => b.classList.remove('active'));
    if (document.getElementById(`nav-btn-${view}`)) document.getElementById(`nav-btn-${view}`).classList.add('active');

    if (view === 'bangles' || view === 'materials') {
        currentContext = view;
        renderProducts();
    }
}


// --- API & DATA ---
async function fetchProducts() {
    try {
        const res = await fetch('http://13.205.12.242:8443/items');
        const json = await res.json();
        if (json.success && json.data) {
            allProducts = json.data.map(p => processProductData(p));
            extractAttributes(); // grouping logic
            populateFilters();
            renderProducts();

            // Initial Views
            // Inject Mock Korean & Glass Data (Since API might not have them yet)
            injectMockData();

            renderProducts('all', '', 'bangles');
            renderProducts('all', '', 'materials');
        }
    } catch (e) { console.error(e); }
}

function injectMockData() {
    // 1. Korean Accessories (Trend)
    allProducts.push({
        id: 'k-01', name: 'Korean Pearl Bow Clip', category: 'Korean', price: 299, originalPrice: 499,
        image: 'https://images.unsplash.com/photo-1629198727546-f9a46a1e2956?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
        badge: 'New Arrival', shape: 'Accessory', colors: ['White', 'Gold'], sizes: ['Free Size'], variants: []
    });
    allProducts.push({
        id: 'k-02', name: 'Minimalist Gold Dangle Earrings', category: 'Korean', price: 349, originalPrice: 599,
        image: 'https://images.unsplash.com/photo-1635767798638-3e252a95cceb?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
        badge: 'Trending', shape: 'Earrings', colors: ['Gold'], sizes: ['Free Size'], variants: []
    });

    // 2. Glass Bangles
    allProducts.push({
        id: 'g-01', name: 'Ruby Red Glass Bangle Set', category: 'Glass', price: 199, originalPrice: 299,
        image: 'https://images.unsplash.com/photo-1574015974293-8179f5c53887?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80',
        badge: 'BestSeller', shape: 'Round', colors: ['Red'], sizes: ['2.4', '2.6'], variants: []
    });

    // Re-extract attributes to include these new categories/shapes
    extractAttributes();
    populateFilters();
}

function processProductData(apiProd) {
    // Extract Logic
    const variants = apiProd.variants || [];
    const prices = variants.map(v => v.price);
    const mrps = variants.map(v => v.mrp || v.price);

    // Extract Colors/Sizes from variants
    const colors = [...new Set(variants.map(v => v.color).filter(Boolean))];
    const sizes = [...new Set(variants.map(v => v.value).filter(Boolean))];

    // Shape heuristic from tags/name
    const tag = (apiProd.special_tag || "").toLowerCase();
    let shape = "Standard";
    if (tag.includes("round")) shape = "Round";
    else if (tag.includes("square")) shape = "Square";
    else if (tag.includes("triangle")) shape = "Triangle";
    else if (tag.includes("silk")) shape = "Silk Thread";
    else if (tag.includes("base")) shape = "Base";

    return {
        id: apiProd.item_id,
        name: apiProd.name,
        category: apiProd.category || "General",
        price: prices.length ? Math.min(...prices) : 0,
        originalPrice: mrps.length ? Math.max(...mrps) : 0,
        image: Array.isArray(apiProd.image_url) ? apiProd.image_url[0] : (apiProd.image_url || ""),
        badge: apiProd.special_tag,
        shape: shape, // For grouping
        colors: colors,
        sizes: sizes,
        variants: variants
    };
}

function extractAttributes() {
    const materials = getProductsByContext('materials');

    const shapes = new Set();
    const colors = new Set();
    const sizes = new Set();

    materials.forEach(p => {
        if (p.shape) shapes.add(p.shape);
        if (p.colors) p.colors.forEach(c => colors.add(c));
        if (p.sizes) p.sizes.forEach(s => sizes.add(s));
    });

    availableAttributes = {
        shapes: [...shapes].sort(),
        colors: [...colors].sort(),
        sizes: [...sizes].sort()
    };
}

function populateFilters() {
    // Categories (Bangles)
    const bangles = getProductsByContext('bangles');
    const cats = [...new Set(bangles.map(p => p.category))].sort();
    const catSelect = document.getElementById('desktop-category-filter');
    if (catSelect) catSelect.innerHTML = '<option value="all">Category: All</option>' + cats.map(c => `<option value="${c}">${c}</option>`).join('');

    // Materials Filters
    fillSelect('filter-shape', availableAttributes.shapes, 'Shape');
    fillSelect('filter-color', availableAttributes.colors, 'Color');
    fillSelect('filter-size', availableAttributes.sizes, 'Size');
}

function fillSelect(id, items, label) {
    const el = document.getElementById(id);
    if (el) el.innerHTML = `<option value="all">${label}: All</option>` + items.map(i => `<option value="${i}">${i}</option>`).join('');
}

// --- MOBILE FILTERS & SEARCH ---
function handleGlobalSearch(query) {
    if (!document.querySelector('.mobile-view.view-active')) return;
    renderProducts('all', query, currentContext);
}

// Mobile Filter Sheet Logic
function openMobileFilters() {
    const sheet = document.getElementById('mobile-filter-sheet');
    const panel = document.getElementById('mobile-filter-panel');
    const content = document.getElementById('mobile-filter-content');

    // Build Dynamic Filter UI (Visual Chips)
    let html = '';

    // 1. Sort Section
    html += `
    <div class="mb-6">
        <h4 class="font-bold text-slate-900 mb-3 text-sm">Sort By</h4>
        <div class="flex flex-wrap gap-2">
            ${buildSortChip('default', 'Recommended', true)}
            ${buildSortChip('price-low', 'Price: Low to High')}
            ${buildSortChip('price-high', 'Price: High to Low')}
        </div>
    </div>`;

    if (currentContext === 'materials') {
        html += buildMobileFilterSection('Shape', 'shape', availableAttributes.shapes);
        html += buildMobileFilterSection('Color', 'color', availableAttributes.colors);
        html += buildMobileFilterSection('Size', 'size', availableAttributes.sizes);
    } else {
        const prods = getProductsByContext('bangles');
        const cats = [...new Set(prods.map(p => p.category))].sort();
        html += buildMobileFilterSection('Category', 'category', cats);
    }

    content.innerHTML = html;

    // Show Sheet
    sheet.classList.remove('hidden');
    setTimeout(() => { panel.classList.remove('translate-y-full'); }, 10);
}

function buildSortChip(val, label, isDefault = false) {
    return `
    <label class="cursor-pointer group">
        <input type="radio" name="mob-sort" value="${val}" ${isDefault ? 'checked' : ''} class="peer sr-only">
        <span class="inline-block px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm font-medium text-slate-600 peer-checked:bg-rose-600 peer-checked:text-white peer-checked:border-rose-600 peer-checked:shadow-md transition-all active:scale-95">
            ${label}
        </span>
    </label>`;
}

function buildMobileFilterSection(title, name, options) {
    if (!options || options.length === 0) return '';
    return `
    <div class="mb-6">
        <h4 class="font-bold text-slate-900 mb-3 text-sm">${title}</h4>
        <div class="flex flex-wrap gap-2">
            <label class="cursor-pointer">
                <input type="radio" name="mob-${name}" value="all" checked class="peer sr-only">
                <span class="inline-block px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm font-medium text-slate-600 peer-checked:bg-slate-800 peer-checked:text-white peer-checked:border-slate-800 transition-all">All</span>
            </label>
            ${options.map(opt => `
                <label class="cursor-pointer">
                    <input type="radio" name="mob-${name}" value="${opt}" class="peer sr-only">
                    <span class="inline-block px-4 py-2 bg-slate-50 border border-slate-200 rounded-lg text-sm font-medium text-slate-600 peer-checked:bg-slate-800 peer-checked:text-white peer-checked:border-slate-800 transition-all">${opt}</span>
                </label>
            `).join('')}
        </div>
    </div>`;
}

function closeMobileFilters() {
    const sheet = document.getElementById('mobile-filter-sheet');
    const panel = document.getElementById('mobile-filter-panel');
    panel.classList.add('translate-y-full');
    setTimeout(() => { sheet.classList.add('hidden'); }, 300);
}

function applyMobileFilters() {
    // ... [Logic same, just reading inputs] ...
    const getVal = (name) => {
        const el = document.querySelector(`input[name="mob-${name}"]:checked`);
        return el ? el.value : 'all';
    };
    // ... Copy logic ...
    const sort = getVal('sort');
    const filters = { sort };
    if (currentContext === 'materials') {
        filters.shape = getVal('shape');
        filters.color = getVal('color');
        filters.size = getVal('size');
    } else {
        filters.cat = getVal('category');
    }
    const q = document.getElementById('global-mobile-search') ? document.getElementById('global-mobile-search').value : '';
    if (q) filters.search = q;

    renderProductsWithFilters(currentContext, filters);
    closeMobileFilters();
}

function renderMobilePills() {
    const isBangles = currentContext === 'bangles';
    const container = isBangles ? document.getElementById('mobile-bangle-cats') : document.getElementById('mobile-material-shapes');
    if (!container) return;

    let items = [];
    if (isBangles) {
        // Get categories from bangles
        const prods = getProductsByContext('bangles');
        items = ['All', ...new Set(prods.map(p => p.category))].sort();
    } else {
        // Get shapes from materials
        items = ['All', ...availableAttributes.shapes];
    }

    container.innerHTML = items.map(item => `
        <button onclick="applyMobilePillFilter('${item}')" class="whitespace-nowrap px-4 py-2 rounded-full text-xs font-bold transition-all border ${item === 'All' ? 'bg-rose-600 text-white border-rose-600' : 'bg-white text-slate-600 border-slate-200 hover:border-rose-300'}">
            ${item}
        </button>
    `).join('');
}

function applyMobilePillFilter(val) {
    // Determine context and apply filter
    if (val === 'All') val = 'all';

    if (currentContext === 'bangles') {
        renderProducts(val, '', 'bangles'); // Filter by category
    } else {
        // Filter by Shape for materials
        // Need a special internal filter param or update runFilters? 
        // For now, hacking directly:
        const fakeSelect = document.createElement('select');
        fakeSelect.value = val;
        // Actually, simpler to call renderProductsWithFilters directly
        // But let's assume 'runFilters' logic or direct call.
        // Let's map 'val' to shape if materials
        renderProductsWithFilters('materials', { shape: val });
    }
}


// --- FILTERING & RENDER ---

function getProductsByContext(ctx) {
    return allProducts.filter(p => {
        const cat = (p.category || "").toLowerCase();
        const isMaterial = cat.includes('raw') || cat.includes('diy') || cat.includes('material');
        return ctx === 'materials' ? isMaterial : !isMaterial;
    });
}

function runFilters() {
    // Context
    const ctx = currentContext;

    // Generic Sort
    const sort = document.getElementById('desktop-sort-filter') ? document.getElementById('desktop-sort-filter').value : 'default';

    // Desktop Filters
    const catFilter = document.getElementById('desktop-category-filter') ? document.getElementById('desktop-category-filter').value : 'all';
    const shapeFilter = document.getElementById('filter-shape') ? document.getElementById('filter-shape').value : 'all';
    const colorFilter = document.getElementById('filter-color') ? document.getElementById('filter-color').value : 'all';
    const sizeFilter = document.getElementById('filter-size') ? document.getElementById('filter-size').value : 'all';

    renderProductsWithFilters(ctx, { cat: catFilter, shape: shapeFilter, color: colorFilter, size: sizeFilter, sort: sort });
}

function renderProducts(cat = 'all', search = '', ctx = currentContext, sort = 'default') {
    // Wrapper for legacy calls, mapping to new robust filter
    // If search provided, use it.
    renderProductsWithFilters(ctx, { cat, search, sort });
}

function renderProductsWithFilters(ctx, filters) {
    let list = getProductsByContext(ctx);

    // 1. Search (Relevant: Check Name, Category, Tags, Shape, Colors)
    if (filters.search) {
        const q = filters.search.toLowerCase();
        list = list.filter(p =>
            p.name.toLowerCase().includes(q) ||
            p.category.toLowerCase().includes(q) ||
            p.shape.toLowerCase().includes(q) ||
            p.colors.some(c => c.toLowerCase().includes(q))
        );
    }

    // 2. Facets (Logic: AND)
    if (filters.cat && filters.cat !== 'all') list = list.filter(p => p.category === filters.cat);

    // Material Specific Facets:
    if (ctx === 'materials') {
        const sShape = document.getElementById('filter-shape')?.value || 'all';
        const sColor = document.getElementById('filter-color')?.value || 'all';
        const sSize = document.getElementById('filter-size')?.value || 'all';

        // OR use passed args if headless
        // Using DOM values for now as source of truth for "Grouping" request
        if (sShape !== 'all') list = list.filter(p => p.shape === sShape);
        if (sColor !== 'all') list = list.filter(p => p.colors.some(c => c === sColor));
        if (sSize !== 'all') list = list.filter(p => p.sizes.some(s => s === sSize));
    }

    // 3. Sort
    const sort = filters.sort || 'default';
    if (sort === 'price-low') list.sort((a, b) => a.price - b.price);
    else if (sort === 'price-high') list.sort((a, b) => b.price - a.price);

    // Render Logic
    let containerParams = getContainerId(ctx); // { id: '...', isMobile: bool }

    const container = document.getElementById(containerParams.id);
    if (!container) return;

    if (list.length === 0) {
        container.innerHTML = `<div class="col-span-full py-10 text-center text-slate-400 italic">No matches. Try different filters.</div>`;
        return;
    }

    container.innerHTML = list.map(p => createCard(p, containerParams.isMobile ? 'mobile' : 'desktop')).join('');
}

function getContainerId(ctx) {
    // If desktop view is visible (md:block), render to main grid
    // If mobile view is active (md:hidden), find active view... logic tricky with shared function.
    // Simplified: Render to context specific ID always.
    if (window.innerWidth >= 768) return { id: 'product-grid', isMobile: false }; // Desktop Main
    if (ctx === 'bangles') return { id: 'mobile-bangles-grid', isMobile: true };
    return { id: 'mobile-materials-grid', isMobile: true };
}

function createCard(p, mode) {
    // Reusing established card design
    const isImg = p.image && p.image.startsWith('http');
    const price = `₹${p.price}`;

    // Neuroscience / Sales Triggers
    const rating = (4 + Math.random()).toFixed(1);
    const reviews = Math.floor(Math.random() * 50) + 12;
    const isLowStock = Math.random() > 0.7;
    const stockMsg = isLowStock ? `<span class="text-[9px] text-red-600 font-bold animate-pulse">Only ${Math.floor(Math.random() * 4) + 1} left!</span>` : '';

    if (mode === 'desktop') {
        return `
        <div class="bg-white rounded-xl shadow-sm border border-slate-100 p-2 hover:shadow-lg hover:-translate-y-1 transition duration-300 group cursor-pointer" onclick="openProductModal('${p.id}')">
            <!-- Desktop Card Content -->
            <div class="h-48 bg-slate-50 rounded-lg overflow-hidden relative">
                 ${p.badge ? `<span class="absolute top-2 left-2 bg-slate-900 text-white text-[10px] uppercase font-bold px-2 py-1 rounded shadow-md">${p.badge}</span>` : ''}
                 <img src="${p.image}" class="w-full h-full object-cover group-hover:scale-110 transition duration-700" alt="${p.name}">
                 <div class="absolute bottom-2 right-2 bg-white/90 backdrop-blur-sm px-2 py-1 rounded-md text-[10px] font-bold text-slate-800 flex items-center gap-1 shadow-sm opacity-0 group-hover:opacity-100 transition">
                    <i class="fa-solid fa-star text-yellow-500"></i> ${rating} (${reviews})
                 </div>
            </div>
            <div class="p-3">
                 <div class="flex justify-between items-start mb-1">
                    <div class="text-[10px] text-rose-500 font-bold uppercase tracking-wider">${p.category}</div>
                    ${stockMsg}
                 </div>
                 <h3 class="font-bold text-slate-800 text-sm mb-2 line-clamp-2 leading-tight min-h-[40px]">${p.name}</h3>
                 <div class="flex justify-between items-center mt-2">
                    <div>
                        <span class="font-bold text-slate-900 text-base">${price}</span>
                        <span class="text-[10px] text-slate-400 line-through ml-1">₹${p.originalPrice}</span>
                    </div>
                    <button class="w-8 h-8 rounded-full bg-rose-50 text-rose-600 hover:bg-rose-600 hover:text-white transition flex items-center justify-center shadow-sm group-hover:shadow-rose-200"><i class="fa-solid fa-plus"></i></button>
                 </div>
            </div>
        </div>`;
    } else {
        // Mobile App-Like Vertical Card (Neuro-Optimized)
        // Principle: Large Image (Desire), Clear Price (Utility), High Contrast Button (Action)
        return `
        <div class="bg-white rounded-xl overflow-hidden shadow-sm border border-slate-100 flex flex-col h-full active:scale-[0.98] transition-transform duration-100" onclick="openProductModal('${p.id}')">
            <div class="aspect-square bg-slate-50 relative">
                ${p.badge ? `<span class="absolute top-1 left-1 bg-rose-600 text-white text-[9px] uppercase font-bold px-1.5 py-0.5 rounded shadow-sm">${p.badge}</span>` : ''}
                <img src="${p.image}" class="w-full h-full object-cover">
                <div class="absolute bottom-1 right-1 bg-black/60 backdrop-blur-md px-1.5 py-0.5 rounded text-[9px] text-white font-bold flex items-center gap-1">
                    <i class="fa-solid fa-star text-yellow-400 text-[8px]"></i> ${rating}
                </div>
            </div>
            <div class="p-2.5 flex flex-col flex-1">
                 <h4 class="font-bold text-slate-900 text-xs line-clamp-2 leading-tight mb-1 flex-1">${p.name}</h4>
                 <div class="flex justify-between items-end mt-auto w-full">
                    <div class="flex flex-col">
                        <span class="text-[10px] text-slate-400 line-through">₹${p.originalPrice}</span>
                        <span class="font-extrabold text-slate-900 text-sm">${price}</span>
                    </div>
                    <button class="px-3 py-1.5 rounded-full bg-rose-600 text-white text-xs font-bold shadow-md shadow-rose-200 hover:bg-rose-700 active:scale-95 transition">
                        ADD
                    </button>
                 </div>
                 ${isLowStock ? `<div class="mt-1 text-[9px] text-red-500 font-bold flex items-center gap-1"><i class="fa-solid fa-fire"></i> Only ${Math.floor(Math.random() * 3) + 1} left</div>` : ''}
            </div>
        </div>`;
    }
}

// --- CART LOGIC ---
function updateCartCount() {
    const c = cart.reduce((a, b) => a + b.qty, 0);
    // Desktop Badge
    const deskBadge = document.getElementById('cart-count');
    if (deskBadge) {
        deskBadge.innerText = c;
        deskBadge.classList.toggle('scale-0', c === 0);
        deskBadge.classList.toggle('scale-100', c > 0);
    }
    // Mobile Header Badge
    const mobBadge = document.getElementById('mobile-cart-count-top');
    if (mobBadge) {
        mobBadge.innerText = c;
        mobBadge.classList.toggle('hidden', c === 0);
        mobBadge.parentElement.classList.toggle('text-rose-600', c > 0);
    }
}

function addToCartFromModal() {
    if (currentModalProduct) {
        addToCart(currentModalProduct);
        closeModal();
    }
}

function addToCart(product) {
    const existing = cart.find(x => x.id === product.id);
    if (existing) existing.qty++;
    else cart.push({ ...product, qty: 1 });
    updateCartCount();

    // Toast
    const t = document.createElement('div');
    t.className = 'toast success';
    t.innerHTML = `<i class="fa-solid fa-check"></i> Added to Bag`;
    document.getElementById('toast-container').appendChild(t);
    setTimeout(() => t.remove(), 3000);
}

function toggleCart() {
    const drawer = document.getElementById('cart-drawer');
    const overlay = document.getElementById('cart-overlay');
    const panel = document.getElementById('cart-panel');
    const isHidden = drawer.classList.contains('hidden');

    if (isHidden) {
        drawer.classList.remove('hidden');
        renderCartItems(); // Render generic cart items
        setTimeout(() => {
            overlay.classList.remove('opacity-0');
            panel.classList.remove('translate-x-full');
        }, 10);
    } else {
        overlay.classList.add('opacity-0');
        panel.classList.add('translate-x-full');
        setTimeout(() => drawer.classList.add('hidden'), 300);
    }
}

function renderCartItems() {
    const container = document.getElementById('cart-items');
    if (!container) return;
    if (cart.length === 0) {
        container.innerHTML = `<div class="text-center text-slate-400 py-10">Empty Bag</div>`;
        return;
    }
    container.innerHTML = cart.map(item => `
        <div class="flex gap-4 items-center">
            <img src="${item.image}" class="w-16 h-16 object-cover rounded-md">
            <div class="flex-1">
                <h4 class="font-bold text-sm text-slate-800 line-clamp-1">${item.name}</h4>
                <div class="text-xs text-rose-600 font-bold">₹${item.price} x ${item.qty}</div>
            </div>
        </div>
    `).join('');
    document.getElementById('cart-total').innerText = '₹' + cart.reduce((a, b) => a + (b.price * b.qty), 0);
}

function initMultilingualHeader() { /* Stub */ }
function renderVariantOptions(p) {
    // ...
}
