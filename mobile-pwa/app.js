/**
 * Mobile PWA Main App Logic
 * Bangles by Choice - Mobile-First E-commerce
 * Enhanced with smart search, category hierarchy, and WhatsApp checkout
 */

// ===== Global State =====
const appState = {
    allProducts: [],
    productGroups: [],
    categoryCounts: {},
    cart: [],
    currentSection: 'home',
    currentSubFilter: {},  // { sectionKey: subCategoryKey }
    currentSort: {},       // { sectionKey: sortBy }
    searchQuery: '',
    recentSearches: [],
    popularTerms: [],
    shippingDetails: { name: '', phone: '', address: '', gstin: '' },
    imageObserver: null,
    ITEMS_PER_PAGE: 25,    // Denser listing for B2B wholesale
    loadedCounts: {}       // { sectionKey: count }
};

// Actual Bangle by Choice WhatsApp business number
const WHATSAPP_NUMBER = '919553655562';

// ===== B2B Wholesale Business Rules =====
const B2B_MOQ = 5000;                    // Minimum Order Quantity in ₹
const B2B_TIERS = [
    { minAmount: 20000, discount: 0.20, label: 'Tier 2 — 20% OFF' },
    { minAmount: 10000, discount: 0.10, label: 'Tier 1 — 10% OFF' },
];

/**
 * Calculate B2B discount tier based on subtotal
 * @param {number} subtotal - Cart subtotal in ₹
 * @returns {{ discount: number, rate: number, label: string }}
 */
function getB2BDiscount(subtotal) {
    for (const tier of B2B_TIERS) {
        if (subtotal >= tier.minAmount) {
            return {
                discount: Math.round(subtotal * tier.discount),
                rate: tier.discount,
                label: tier.label
            };
        }
    }
    return { discount: 0, rate: 0, label: '' };
}

// ===== App Initialization =====
document.addEventListener('DOMContentLoaded', async () => {
    console.log('🚀 Initializing Mobile PWA...');

    loadCartFromStorage();
    loadShippingFromStorage();
    loadRecentSearches();
    recalculateWholesaleTotals();

    await initializeProducts();

    setupEventListeners();
    setupPWAInstall();

    console.log('✅ App initialized!');
});

// ===== Product Loading =====
async function initializeProducts() {
    try {
        appState.allProducts = await loadProducts();
        appState.productGroups = groupProducts(appState.allProducts);
        appState.categoryCounts = getCategoryCounts(appState.productGroups);
        appState.popularTerms = getPopularSearchTerms(appState.productGroups);

        console.log(`Loaded ${appState.allProducts.length} products in ${appState.productGroups.length} groups`);

        renderHomeSection();
        renderHomeCategoryCards();
        renderPopularSuggestions();
        renderBrowseCategories();
        recalculateWholesaleTotals();

    } catch (error) {
        console.error('Failed to load products:', error);
        document.getElementById('home-products').innerHTML = `
            <div class="error-state">
                <i class="fa-solid fa-triangle-exclamation"></i>
                <p>Products are loading...</p>
                <button class="btn-primary" onclick="location.reload()" style="max-width:200px;margin:1rem auto;">
                    Refresh
                </button>
            </div>
        `;
    }
}

// ===== Section Switching =====
function switchSection(sectionName) {
    document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));

    const section = document.getElementById(`${sectionName}-section`);
    if (section) {
        section.classList.add('active');
    }

    document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
    const navItem = document.querySelector(`.nav-item[data-section="${sectionName}"]`);
    if (navItem) navItem.classList.add('active');

    appState.currentSection = sectionName;

    switch (sectionName) {
        case 'home': renderHomeSection(); break;
        case 'bangles': renderCategorySection('bangles'); break;
        case 'raw-materials': renderCategorySection('raw-materials'); break;
        case 'kundhans': renderCategorySection('kundhans'); break;
        case 'accessories': renderCategorySection('accessories'); break;
        case 'cart': renderCartSection(); break;
    }

    document.getElementById('main-content').scrollTop = 0;
}

// ===== Home Section =====
function renderHomeSection() {
    const container = document.getElementById('home-products');

    // Show most popular groups (by variant count)
    const popular = [...appState.productGroups]
        .sort((a, b) => b.variantCount - a.variantCount)
        .slice(0, 8);

    container.innerHTML = popular.map(g => createProductCard(g)).join('');
    setupImageObserver();
}

function renderHomeCategoryCards() {
    const container = document.getElementById('home-categories');
    const tree = getCategoryTree();

    container.innerHTML = Object.entries(tree).map(([key, cat]) => {
        const count = appState.categoryCounts[key];
        const productCount = count ? count.productCount : 0;

        return `
            <button class="category-card" onclick="switchSection('${key}')">
                <div class="category-icon">${cat.icon}</div>
                <span class="category-name">${cat.label}</span>
                <span class="category-count">${productCount} items</span>
            </button>
        `;
    }).join('');
}

// ===== Category Section Rendering =====
function renderCategorySection(superKey) {
    const subCatsContainer = document.getElementById(`${superKey}-sub-cats`);
    const tableBody = document.getElementById(`${superKey}-products-table`);
    const productsContainer = document.getElementById(`${superKey}-products`);

    if (!subCatsContainer) return;

    // Render sub-category chips
    const subCats = getSubCategories(superKey);
    const activeSubFilter = appState.currentSubFilter[superKey] || 'all';

    subCatsContainer.innerHTML = `
        <button class="sub-cat-btn ${activeSubFilter === 'all' ? 'active' : ''}"
            onclick="filterBySubCategory('${superKey}', 'all')">All</button>
        ${subCats.map(sc => {
            const count = appState.categoryCounts[superKey]?.subCategories[sc.key];
            const pCount = count ? count.productCount : 0;
            if (pCount === 0) return '';
            return `
                <button class="sub-cat-btn ${activeSubFilter === sc.key ? 'active' : ''}"
                    onclick="filterBySubCategory('${superKey}', '${sc.key}')">
                    ${sc.label}
                    <span class="chip-count">${pCount}</span>
                </button>
            `;
        }).join('')}
    `;

    // Render products
    let groups = filterGroupsByCategory(appState.productGroups, superKey);

    if (activeSubFilter !== 'all') {
        groups = filterGroupsBySubCategory(groups, activeSubFilter);
    }

    // Sort
    const sortBy = appState.currentSort[superKey] || 'name';
    groups = sortGroups(groups, sortBy);

    // Pagination
    const page = appState.loadedCounts[superKey] || appState.ITEMS_PER_PAGE;
    const visible = groups.slice(0, page);
    const hasMore = groups.length > page;

    // ── B2B Table Rendering (for category sections with <tbody>) ──
    if (tableBody) {
        if (visible.length === 0) {
            tableBody.innerHTML = `
                <tr><td colspan="4" style="text-align:center; padding:2rem;">
                    <i class="fa-solid fa-box-open"></i>
                    <p>No products in this category yet</p>
                </td></tr>
            `;
            return;
        }

        tableBody.innerHTML = visible.map(group => {
            const price = group.priceRange.max > 0 ? group.priceRange.max : 0;
            const priceDisplay = price > 0 ? `₹${price}` : 'On request';
            const imgSrc = group.mainImage || PLACEHOLDER_SVG;

            // Find current quantity in cart (match by first variant id)
            const firstVariant = group.variants[0];
            const cartItem = appState.cart.find(c => c.id === firstVariant.id);
            const currentQty = cartItem ? cartItem.quantity : 0;

            // Safely encode group data for onclick attribute
            const variantJson = JSON.stringify({
                id: firstVariant.id,
                name: firstVariant.name,
                price: firstVariant.price || price,
                image: firstVariant.image || imgSrc,
                url: firstVariant.url || ''
            }).replace(/'/g, '&apos;').replace(/"/g, '&quot;');

            return `
                <tr class="wholesale-row">
                    <td class="text-center">
                        <img src="${imgSrc}" alt="${group.baseName}" width="40" height="40"
                            onerror="handleImageError(this)"
                            style="object-fit:cover; border:1px solid var(--border);">
                    </td>
                    <td>
                        <span class="product-sku-name">${group.baseName}</span>
                        <span class="product-cat-tag" style="font-size:0.65rem; margin-left:4px;">${group.subLabel}</span>
                    </td>
                    <td class="text-right font-mono-data" style="white-space:nowrap;">${priceDisplay}</td>
                    <td class="text-right">
                        <input type="number" min="0" step="1" value="${currentQty}"
                            class="qty-input" style="width:60px; text-align:center; font-family:'JetBrains Mono',monospace; padding:4px; border:1.5px solid var(--border);"
                            data-variant='${variantJson}'
                            onchange="handleTableQtyChange(this)">
                    </td>
                </tr>
            `;
        }).join('');

        if (hasMore) {
            tableBody.innerHTML += `
                <tr><td colspan="4" style="text-align:center; padding:0.75rem;">
                    <button class="btn-load-more" onclick="loadMore('${superKey}')">
                        Show More (${groups.length - page} remaining)
                    </button>
                </td></tr>
            `;
        }

        setupImageObserver();
        return;
    }

    // ── Fallback: grid card rendering (home section or missing table) ──
    if (!productsContainer) return;

    if (visible.length === 0) {
        productsContainer.innerHTML = `
            <div class="empty-state" style="grid-column: 1/-1">
                <i class="fa-solid fa-box-open"></i>
                <p>No products in this category yet</p>
            </div>
        `;
        return;
    }

    productsContainer.innerHTML = visible.map(g => createProductCard(g)).join('');

    if (hasMore) {
        productsContainer.innerHTML += `
            <div class="load-more-row" style="grid-column: 1/-1">
                <button class="btn-load-more" onclick="loadMore('${superKey}')">
                    Show More (${groups.length - page} remaining)
                </button>
            </div>
        `;
    }

    setupImageObserver();
}

/**
 * Handle quantity change from B2B table row input
 * @param {HTMLInputElement} input - The quantity input element
 */
function handleTableQtyChange(input) {
    const qty = parseInt(input.value, 10) || 0;
    const variant = JSON.parse(input.dataset.variant.replace(/&quot;/g, '"').replace(/&apos;/g, "'"));

    const existingIndex = appState.cart.findIndex(item => item.id === variant.id);

    if (qty <= 0) {
        // Remove from cart if exists
        if (existingIndex !== -1) {
            appState.cart.splice(existingIndex, 1);
            showToast(`Removed ${variant.name}`, 'info');
        }
        input.value = 0;
    } else if (existingIndex !== -1) {
        // Update existing quantity
        appState.cart[existingIndex].quantity = qty;
    } else {
        // Add new item to cart
        appState.cart.push({
            id: variant.id,
            name: variant.name,
            price: variant.price || 0,
            image: variant.image || PLACEHOLDER_SVG,
            quantity: qty,
            url: variant.url || ''
        });
        showToast(`Added ${variant.name}`, 'success');
    }

    updateCartBadge();
    saveCartToStorage();
    recalculateWholesaleTotals();
}

function filterBySubCategory(superKey, subKey) {
    appState.currentSubFilter[superKey] = subKey;
    appState.loadedCounts[superKey] = appState.ITEMS_PER_PAGE;
    renderCategorySection(superKey);
}

function loadMore(superKey) {
    appState.loadedCounts[superKey] = (appState.loadedCounts[superKey] || appState.ITEMS_PER_PAGE) + appState.ITEMS_PER_PAGE;
    renderCategorySection(superKey);
}

// ===== Product Card =====
function createProductCard(group) {
    const priceDisplay = group.priceRange.min === group.priceRange.max || group.priceRange.min === 0
        ? (group.priceRange.max > 0 ? `₹${group.priceRange.max}` : 'Price on request')
        : `₹${group.priceRange.min} - ₹${group.priceRange.max}`;

    const badgeHtml = group.variants[0]?.badge
        ? `<div class="product-badge">${group.variants[0].badge}</div>`
        : '';

    const categoryTag = `<span class="product-cat-tag">${group.subLabel}</span>`;

    const imgSrc = group.mainImage || PLACEHOLDER_SVG;
    const isPlaceholder = !group.mainImage || group.mainImage === PLACEHOLDER_SVG;

    const variantInfo = group.variantCount > 1
        ? `<span class="variant-pill">${group.variantCount} options</span>`
        : '';

    // Use data-src for lazy loading, src for first screen
    return `
        <div class="product-card" onclick='openVariationSheet(${JSON.stringify({ id: group.id }).replace(/'/g, "&apos;")})'>
            <div class="product-image">
                <img src="${imgSrc}" alt="${group.baseName}" loading="lazy"
                    onerror="handleImageError(this)"
                    ${isPlaceholder ? 'class="img-placeholder"' : ''}>
                ${badgeHtml}
                ${categoryTag}
            </div>
            <div class="product-info">
                <div class="product-name">${group.baseName}</div>
                <div class="product-price-row">
                    <span class="product-price">${priceDisplay}</span>
                    ${variantInfo}
                </div>
            </div>
        </div>
    `;
}

// ===== Variation Bottom Sheet =====
function openVariationSheet(ref) {
    const group = appState.productGroups.find(g => g.id === ref.id);
    if (!group) return;

    const sheet = document.getElementById('variation-sheet');
    const title = document.getElementById('sheet-title');
    const body = document.getElementById('sheet-body');
    const footer = document.getElementById('sheet-footer');

    title.textContent = group.baseName;

    // Single variant: show detail view
    if (group.variantCount === 1) {
        const v = group.variants[0];
        body.innerHTML = `
            <div class="detail-view">
                <div class="detail-image">
                    <img src="${v.image || PLACEHOLDER_SVG}" alt="${v.name}"
                        onerror="handleImageError(this)">
                </div>
                <div class="detail-info">
                    <span class="detail-cat">${group.subLabel}</span>
                    <h3 class="detail-name">${v.name}</h3>
                    <div class="detail-price">₹${v.price || 0}</div>
                    ${v.description ? `<p class="detail-desc">${v.description}</p>` : ''}
                    <div class="detail-trust">
                        <span><i class="fa-solid fa-truck-fast"></i> Free Shipping > ₹999</span>
                        <span><i class="fa-solid fa-shield-check"></i> Authentic Quality</span>
                    </div>
                </div>
            </div>
        `;
        footer.innerHTML = `
            <div class="sheet-actions">
                <button class="btn-whatsapp-buy" onclick='buyNowWhatsApp(${JSON.stringify(v).replace(/'/g, "&apos;")})'>
                    <i class="fa-brands fa-whatsapp"></i> Buy via WhatsApp
                </button>
                <button class="btn-add-cart" onclick='addToCartFromSheet(${JSON.stringify(v).replace(/'/g, "&apos;")})'>
                    <i class="fa-solid fa-cart-plus"></i> Add to Cart
                </button>
            </div>
        `;
    } else {
        // Multiple variants: show list
        body.innerHTML = group.variants.map(variant => `
            <div class="variation-item">
                <img src="${variant.image || PLACEHOLDER_SVG}" alt="${variant.name}"
                    onerror="handleImageError(this)" class="variation-img">
                <div class="variation-info">
                    <div class="variation-name">${variant.name}</div>
                    <div class="variation-price">₹${variant.price || 0}</div>
                </div>
                <div class="variation-actions">
                    <button onclick='buyNowWhatsApp(${JSON.stringify(variant).replace(/'/g, "&apos;")})' class="btn-wa-mini" title="Buy on WhatsApp">
                        <i class="fa-brands fa-whatsapp"></i>
                    </button>
                    <button onclick='addToCartFromSheet(${JSON.stringify(variant).replace(/'/g, "&apos;")})' class="btn-cart-mini" title="Add to Cart">
                        <i class="fa-solid fa-plus"></i>
                    </button>
                </div>
            </div>
        `).join('');
        footer.innerHTML = '';
    }

    sheet.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeVariationSheet() {
    document.getElementById('variation-sheet').classList.remove('active');
    document.body.style.overflow = '';
}

// ===== Cart Functions =====
function addToCartFromSheet(variant) {
    addToCart(variant);
    closeVariationSheet();
}

function addToCart(product) {
    const existing = appState.cart.find(item => item.id === product.id);

    if (existing) {
        existing.quantity++;
    } else {
        appState.cart.push({
            id: product.id,
            name: product.name,
            price: product.price || 0,
            image: product.image || PLACEHOLDER_SVG,
            quantity: 1,
            url: product.url || ''
        });
    }

    updateCartBadge();
    saveCartToStorage();
    recalculateWholesaleTotals();
    showToast(`Added ${product.name}`, 'success');

    if (appState.currentSection === 'cart') renderCartSection();
}

function removeFromCart(index) {
    appState.cart.splice(index, 1);
    updateCartBadge();
    saveCartToStorage();
    recalculateWholesaleTotals();
    renderCartSection();
    showToast('Item removed', 'info');
}

function updateCartQty(index, delta) {
    const item = appState.cart[index];
    if (!item) return;

    item.quantity += delta;
    if (item.quantity <= 0) {
        removeFromCart(index);
        return;
    }

    saveCartToStorage();
    renderCartSection();
}

function updateCartBadge() {
    const badge = document.getElementById('nav-cart-badge');
    const count = appState.cart.reduce((sum, item) => sum + item.quantity, 0);
    badge.textContent = count;
    badge.style.display = count > 0 ? 'flex' : 'none';
}

function saveCartToStorage() {
    localStorage.setItem('bangles-cart', JSON.stringify(appState.cart));
    // Also persist as B2B draft with GSTIN
    localStorage.setItem('bangles-b2b-cart', JSON.stringify({
        cart: appState.cart,
        shipping: appState.shippingDetails,
        savedAt: new Date().toISOString()
    }));
}

function loadCartFromStorage() {
    try {
        // Try loading B2B draft first (includes GSTIN)
        const b2bDraft = localStorage.getItem('bangles-b2b-cart');
        if (b2bDraft) {
            const parsed = JSON.parse(b2bDraft);
            if (parsed.cart && Array.isArray(parsed.cart)) {
                appState.cart = parsed.cart;
            }
            if (parsed.shipping) {
                appState.shippingDetails = {
                    name: parsed.shipping.name || '',
                    phone: parsed.shipping.phone || '',
                    address: parsed.shipping.address || '',
                    gstin: parsed.shipping.gstin || ''
                };
            }
            updateCartBadge();
            return;
        }
        // Fallback to legacy cart key
        const saved = localStorage.getItem('bangles-cart');
        if (saved) {
            appState.cart = JSON.parse(saved);
            updateCartBadge();
        }
    } catch (e) { /* ignore */ }
}

// ===== Cart Rendering =====
function renderCartSection() {
    const itemsContainer = document.getElementById('cart-items');
    const shippingForm = document.getElementById('shipping-form');
    const footerContainer = document.getElementById('cart-footer');
    const moqStatus = document.getElementById('cart-moq-status');
    const discountRow = document.getElementById('discount-row');
    const checkoutBtn = document.getElementById('cart-checkout-btn');

    if (appState.cart.length === 0) {
        itemsContainer.innerHTML = `
            <div class="empty-state">
                <i class="fa-solid fa-shopping-cart"></i>
                <p>No wholesale items selected</p>
                <button class="btn-primary" onclick="switchSection('home')">Browse Wholesale Catalog</button>
            </div>
        `;
        shippingForm.classList.add('hidden');
        footerContainer.classList.add('hidden');

        // MOQ status for empty cart
        if (moqStatus) {
            moqStatus.innerHTML = `
                <i class="fa-solid fa-circle-info"></i>
                <span>Add items worth <strong>₹${B2B_MOQ.toLocaleString('en-IN')}</strong> to place a wholesale order.</span>
            `;
        }
        recalculateWholesaleTotals();
        return;
    }

    itemsContainer.innerHTML = appState.cart.map((item, index) => `
        <div class="cart-item">
            <img src="${item.image}" alt="${item.name}" onerror="handleImageError(this)" class="cart-item-img">
            <div class="cart-item-info">
                <div class="cart-item-name">${item.name}</div>
                <div class="cart-item-price">₹${item.price} × ${item.quantity} = ₹${item.price * item.quantity}</div>
            </div>
            <div class="cart-item-qty">
                <button onclick="updateCartQty(${index}, -1)" class="qty-btn">−</button>
                <span class="qty-num">${item.quantity}</span>
                <button onclick="updateCartQty(${index}, 1)" class="qty-btn">+</button>
            </div>
            <button onclick="removeFromCart(${index})" class="cart-remove-btn" aria-label="Remove">
                <i class="fa-solid fa-trash"></i>
            </button>
        </div>
    `).join('');

    // Show shipping form
    shippingForm.classList.remove('hidden');

    // Pre-fill saved details (including GSTIN)
    document.getElementById('ship-name').value = appState.shippingDetails.name;
    document.getElementById('ship-phone').value = appState.shippingDetails.phone;
    document.getElementById('ship-address').value = appState.shippingDetails.address;
    const gstinField = document.getElementById('ship-gstin');
    if (gstinField) gstinField.value = appState.shippingDetails.gstin || '';

    // ── B2B Totals with Tiered Discount ──
    const subtotal = appState.cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const { discount, rate, label: tierLabel } = getB2BDiscount(subtotal);
    const shipping = subtotal >= 999 ? 0 : 50;
    const total = subtotal - discount + shipping;
    const moqMet = subtotal >= B2B_MOQ;

    // Update MOQ status banner
    if (moqStatus) {
        if (moqMet) {
            const tierInfo = tierLabel
                ? ` | 🎉 <strong>${tierLabel}</strong> applied!`
                : ' | Add ₹' + (B2B_TIERS[B2B_TIERS.length - 1].minAmount - subtotal).toLocaleString('en-IN') + ' more for 10% OFF';
            moqStatus.innerHTML = `
                <i class="fa-solid fa-circle-check" style="color: #16a34a;"></i>
                <span>✅ MOQ met (₹${subtotal.toLocaleString('en-IN')})${tierInfo}</span>
            `;
            moqStatus.style.borderColor = '#16a34a';
        } else {
            const remaining = B2B_MOQ - subtotal;
            moqStatus.innerHTML = `
                <i class="fa-solid fa-triangle-exclamation" style="color: #dc2626;"></i>
                <span>⚠️ Add <strong>₹${remaining.toLocaleString('en-IN')}</strong> more to meet MOQ of ₹${B2B_MOQ.toLocaleString('en-IN')}</span>
            `;
            moqStatus.style.borderColor = '#dc2626';
        }
    }

    // Show/hide discount row
    if (discountRow) {
        if (discount > 0) {
            discountRow.style.display = 'flex';
            document.getElementById('cart-discount').textContent = `-₹${discount.toLocaleString('en-IN')}`;
        } else {
            discountRow.style.display = 'none';
        }
    }

    document.getElementById('cart-subtotal').textContent = `₹${subtotal.toLocaleString('en-IN')}`;
    document.getElementById('cart-shipping').textContent = shipping === 0 ? 'Free ✨' : `₹${shipping}`;
    document.getElementById('cart-total').textContent = `₹${total.toLocaleString('en-IN')}`;

    // Enable/disable checkout based on MOQ
    if (checkoutBtn) {
        checkoutBtn.disabled = !moqMet;
    }

    footerContainer.classList.remove('hidden');
    recalculateWholesaleTotals();
}

// ===== Shipping =====
function saveShippingDetails() {
    appState.shippingDetails = {
        name: document.getElementById('ship-name')?.value?.trim() || '',
        phone: document.getElementById('ship-phone')?.value?.trim() || '',
        address: document.getElementById('ship-address')?.value?.trim() || '',
        gstin: document.getElementById('ship-gstin')?.value?.trim().toUpperCase() || ''
    };
    localStorage.setItem('bangles-shipping', JSON.stringify(appState.shippingDetails));
    // Sync to B2B draft
    saveCartToStorage();
}

function loadShippingFromStorage() {
    try {
        const saved = localStorage.getItem('bangles-shipping');
        if (saved) appState.shippingDetails = JSON.parse(saved);
    } catch (e) { /* ignore */ }
}

// ===== WhatsApp Checkout =====
function checkout() {
    if (appState.cart.length === 0) {
        showToast('Cart is empty', 'error');
        return;
    }

    saveShippingDetails();
    const { name, phone, address, gstin } = appState.shippingDetails;

    // B2B Totals
    const subtotal = appState.cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const { discount, rate, label: tierLabel } = getB2BDiscount(subtotal);
    const shipping = subtotal >= 999 ? 0 : 50;
    const grandTotal = subtotal - discount + shipping;
    const totalItems = appState.cart.reduce((sum, item) => sum + item.quantity, 0);

    // MOQ guard
    if (subtotal < B2B_MOQ) {
        showToast(`MOQ not met. Minimum order is ₹${B2B_MOQ.toLocaleString('en-IN')}`, 'error');
        return;
    }

    // Generate PO number from timestamp
    const poNumber = `PO-${Date.now().toString(36).toUpperCase()}`;
    const poDate = new Date().toLocaleDateString('en-IN', {
        year: 'numeric', month: 'short', day: 'numeric'
    });

    // Build formal B2B Purchase Order WhatsApp message
    let msg = `📋 *B2B PURCHASE ORDER*\n`;
    msg += `*Bangle by Choice — Wholesale Division*\n`;
    msg += `━━━━━━━━━━━━━━━━━━━━━━\n\n`;

    msg += `*PO #:* ${poNumber}\n`;
    msg += `*Date:* ${poDate}\n\n`;

    msg += `*— BUYER DETAILS —*\n`;
    if (name) msg += `👤 *Name/Business:* ${name}\n`;
    if (phone) msg += `📱 *Phone:* +91 ${phone}\n`;
    if (address) msg += `📍 *Ship To:* ${address}\n`;
    if (gstin) msg += `🏛️ *GSTIN:* ${gstin}\n`;
    msg += `\n`;

    msg += `*— ORDER LINE ITEMS (${totalItems} units) —*\n`;
    msg += `━━━━━━━━━━━━━━━━━━━━━━\n`;

    appState.cart.forEach((item, i) => {
        const lineTotal = item.price * item.quantity;
        msg += `${String(i + 1).padStart(2, ' ')}. *${item.name}*\n`;
        msg += `    ₹${item.price} × ${item.quantity} = ₹${lineTotal.toLocaleString('en-IN')}\n`;
    });

    msg += `━━━━━━━━━━━━━━━━━━━━━━\n\n`;

    msg += `*— ORDER SUMMARY —*\n`;
    msg += `*Subtotal:* ₹${subtotal.toLocaleString('en-IN')}\n`;
    if (discount > 0) {
        msg += `*${tierLabel} (${Math.round(rate * 100)}%):* -₹${discount.toLocaleString('en-IN')}\n`;
    }
    msg += `*Shipping:* ${shipping === 0 ? 'Free 🎉' : `₹${shipping}`}\n`;
    msg += `*━━━━━━━━━━━━━━━━━━━━━━*\n`;
    msg += `*GRAND TOTAL: ₹${grandTotal.toLocaleString('en-IN')}*\n\n`;

    msg += `💬 Please confirm availability, share payment details, and expected dispatch date.\n`;
    msg += `🔗 Ref: banglebychoice.in | ${poNumber}`;

    const url = `https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(msg)}`;
    window.open(url, '_blank');
}

function buyNowWhatsApp(product) {
    const msg = `Hi! I'm interested in:\n\n` +
        `*${product.name}*\n` +
        `💰 Price: ₹${product.price || 'On request'}\n\n` +
        `Please share availability and payment details. 🙏`;

    const url = `https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(msg)}`;
    window.open(url, '_blank');
    closeVariationSheet();
}

// ===== Search =====
let searchDebounce = null;

function openSearch() {
    const overlay = document.getElementById('search-overlay');
    overlay.classList.add('active');
    document.getElementById('search-input').focus();
    showSearchSuggestions();
    document.body.style.overflow = 'hidden';
}

function closeSearch() {
    document.getElementById('search-overlay').classList.remove('active');
    document.getElementById('search-input').value = '';
    document.getElementById('search-results').classList.add('hidden');
    document.getElementById('search-suggestions').classList.remove('hidden');
    document.getElementById('search-clear').classList.add('hidden');
    document.body.style.overflow = '';
}

function clearSearch() {
    document.getElementById('search-input').value = '';
    document.getElementById('search-input').focus();
    document.getElementById('search-results').classList.add('hidden');
    document.getElementById('search-suggestions').classList.remove('hidden');
    document.getElementById('search-clear').classList.add('hidden');
}

function handleSearchInput(query) {
    const clearBtn = document.getElementById('search-clear');
    clearBtn.classList.toggle('hidden', !query);

    if (!query || query.trim().length < 2) {
        document.getElementById('search-results').classList.add('hidden');
        document.getElementById('search-suggestions').classList.remove('hidden');
        return;
    }

    clearTimeout(searchDebounce);
    searchDebounce = setTimeout(() => {
        performSearch(query.trim());
    }, 200);
}

function performSearch(query) {
    const results = searchGroups(appState.productGroups, query);
    const resultsContainer = document.getElementById('search-results');
    const suggestionsContainer = document.getElementById('search-suggestions');

    suggestionsContainer.classList.add('hidden');
    resultsContainer.classList.remove('hidden');

    if (results.length === 0) {
        resultsContainer.innerHTML = `
            <div class="search-empty">
                <i class="fa-solid fa-search"></i>
                <p>No results for "${query}"</p>
                <p class="search-empty-hint">Try searching for "bangles", "kundhans", or "thread"</p>
            </div>
        `;
        return;
    }

    // Group results by super-category
    const grouped = {};
    results.forEach(g => {
        if (!grouped[g.superLabel]) grouped[g.superLabel] = [];
        grouped[g.superLabel].push(g);
    });

    let html = `<div class="search-count">${results.length} results for "${query}"</div>`;

    for (const [catLabel, groups] of Object.entries(grouped)) {
        html += `<div class="search-category-header">${catLabel}</div>`;
        html += `<div class="product-grid search-grid">`;
        html += groups.slice(0, 10).map(g => createProductCard(g)).join('');
        html += `</div>`;
    }

    resultsContainer.innerHTML = html;

    // Save to recent
    addRecentSearch(query);
    setupImageObserver();
}

function searchFromSuggestion(term) {
    document.getElementById('search-input').value = term;
    handleSearchInput(term);
}

// ===== Recent Searches =====
function addRecentSearch(query) {
    const lower = query.toLowerCase().trim();
    appState.recentSearches = appState.recentSearches.filter(s => s.toLowerCase() !== lower);
    appState.recentSearches.unshift(query);
    appState.recentSearches = appState.recentSearches.slice(0, 8);
    localStorage.setItem('bangles-recent-searches', JSON.stringify(appState.recentSearches));
    renderRecentSearches();
}

function loadRecentSearches() {
    try {
        const saved = localStorage.getItem('bangles-recent-searches');
        if (saved) appState.recentSearches = JSON.parse(saved);
    } catch (e) { /* ignore */ }
}

function clearRecentSearches() {
    appState.recentSearches = [];
    localStorage.removeItem('bangles-recent-searches');
    renderRecentSearches();
}

function renderRecentSearches() {
    const container = document.getElementById('recent-searches');
    const list = document.getElementById('recent-list');

    if (appState.recentSearches.length === 0) {
        container.classList.add('hidden');
        return;
    }

    container.classList.remove('hidden');
    list.innerHTML = appState.recentSearches.map(term =>
        `<button class="suggestion-chip" onclick="searchFromSuggestion('${term.replace(/'/g, "\\'")}')">
            <i class="fa-solid fa-clock"></i> ${term}
        </button>`
    ).join('');
}

function showSearchSuggestions() {
    renderRecentSearches();
}

function renderPopularSuggestions() {
    const list = document.getElementById('popular-list');
    if (!list) return;

    list.innerHTML = appState.popularTerms.map(({ term, count }) =>
        `<button class="suggestion-chip popular" onclick="searchFromSuggestion('${term.replace(/'/g, "\\'")}')">
            ${term} <span class="chip-count">${count}</span>
        </button>`
    ).join('');
}

function renderBrowseCategories() {
    const list = document.getElementById('browse-list');
    if (!list) return;

    const tree = getCategoryTree();
    list.innerHTML = Object.entries(tree).map(([key, cat]) => {
        const count = appState.categoryCounts[key];
        return `
            <button class="browse-cat-item" onclick="closeSearch(); switchSection('${key}')">
                <span class="browse-cat-icon">${cat.icon}</span>
                <span class="browse-cat-name">${cat.label}</span>
                <span class="browse-cat-count">${count ? count.productCount : 0}</span>
                <i class="fa-solid fa-chevron-right"></i>
            </button>
        `;
    }).join('');
}

// ===== Sort =====
function openSortSheet(sectionKey) {
    const current = appState.currentSort[sectionKey] || 'name';
    const options = [
        { key: 'name', label: 'Name (A→Z)', icon: 'fa-arrow-down-a-z' },
        { key: 'price-low', label: 'Price (Low→High)', icon: 'fa-arrow-down-1-9' },
        { key: 'price-high', label: 'Price (High→Low)', icon: 'fa-arrow-up-9-1' },
        { key: 'variants', label: 'Most Options', icon: 'fa-layer-group' },
    ];

    const sheet = document.getElementById('variation-sheet');
    document.getElementById('sheet-title').textContent = 'Sort By';
    document.getElementById('sheet-footer').innerHTML = '';
    document.getElementById('sheet-body').innerHTML = options.map(opt => `
        <button class="sort-option ${current === opt.key ? 'active' : ''}"
            onclick="applySort('${sectionKey}', '${opt.key}')">
            <i class="fa-solid ${opt.icon}"></i>
            <span>${opt.label}</span>
            ${current === opt.key ? '<i class="fa-solid fa-check"></i>' : ''}
        </button>
    `).join('');

    sheet.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function applySort(sectionKey, sortBy) {
    appState.currentSort[sectionKey] = sortBy;
    closeVariationSheet();
    renderCategorySection(sectionKey);
}

// ===== Image Observer =====
function setupImageObserver() {
    if (typeof setupLazyImages === 'function') {
        appState.imageObserver = setupLazyImages();
    }
}

// ===== Toast =====
function showToast(message, type = 'info') {
    const container = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = `toast toast-${type}`;

    const icons = { success: 'check-circle', error: 'exclamation-circle', info: 'info-circle' };
    toast.innerHTML = `
        <i class="fa-solid fa-${icons[type] || 'info-circle'}"></i>
        <span>${message}</span>
    `;

    container.appendChild(toast);
    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(-20px)';
        setTimeout(() => toast.remove(), 300);
    }, 2500);
}

// ===== PWA Install =====
let deferredInstallPrompt = null;

function setupPWAInstall() {
    window.addEventListener('beforeinstallprompt', (e) => {
        e.preventDefault();
        deferredInstallPrompt = e;

        setTimeout(() => {
            const prompt = document.getElementById('install-prompt');
            prompt.classList.remove('hidden');

            document.getElementById('install-btn').addEventListener('click', async () => {
                if (deferredInstallPrompt) {
                    deferredInstallPrompt.prompt();
                    const { outcome } = await deferredInstallPrompt.userChoice;
                    console.log(`Install: ${outcome}`);
                    deferredInstallPrompt = null;
                    prompt.classList.add('hidden');
                }
            });
        }, 5000);
    });
}

function dismissInstall() {
    document.getElementById('install-prompt').classList.add('hidden');
}

// ===== Event Listeners =====
function setupEventListeners() {
    // Search input
    document.getElementById('search-input').addEventListener('input', (e) => {
        handleSearchInput(e.target.value);
    });

    // Search on Enter
    document.getElementById('search-input').addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            const q = e.target.value.trim();
            if (q) performSearch(q);
        }
    });

    // Save shipping on input
    ['ship-name', 'ship-phone', 'ship-address', 'ship-gstin'].forEach(id => {
        const el = document.getElementById(id);
        if (el) {
            el.addEventListener('input', () => saveShippingDetails());
        }
    });

    // Close bottom sheet on back button
    window.addEventListener('popstate', () => {
        const sheet = document.getElementById('variation-sheet');
        if (sheet.classList.contains('active')) {
            closeVariationSheet();
        }
        const search = document.getElementById('search-overlay');
        if (search.classList.contains('active')) {
            closeSearch();
        }
    });
}

// ===== B2B Floating PO Dock — Wholesale Totals Recalculation =====
/**
 * Recalculate and render the floating Purchase Order dock.
 * Called after every cart mutation (add, remove, qty change).
 *
 * Updates:
 *  - #wholesale-total-items   — sum of all quantities
 *  - #wholesale-subtotal      — sum of (price × qty)
 *  - #wholesale-grand-total   — subtotal minus tiered discount
 *  - Floating dock visibility  — shown only when cart has items
 *  - #wholesale-checkout-btn  — enabled only when MOQ is met
 */
function recalculateWholesaleTotals() {
    const totalItems = appState.cart.reduce((sum, item) => sum + item.quantity, 0);
    const subtotal = appState.cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const { discount } = getB2BDiscount(subtotal);
    const grandTotal = subtotal - discount;
    const moqMet = subtotal >= B2B_MOQ;

    // Update floating dock elements (guard against missing DOM)
    const elItems = document.getElementById('wholesale-total-items');
    const elSubtotal = document.getElementById('wholesale-subtotal');
    const elGrand = document.getElementById('wholesale-grand-total');
    const elDock = document.getElementById('b2b-wholesale-cart');
    const elBtn = document.getElementById('wholesale-checkout-btn');

    if (elItems) elItems.textContent = `${totalItems} units`;
    if (elSubtotal) elSubtotal.textContent = `₹${subtotal.toLocaleString('en-IN')}`;
    if (elGrand) elGrand.textContent = `₹${grandTotal.toLocaleString('en-IN')}`;

    // Show dock when cart has items, hide when empty
    if (elDock) {
        elDock.style.display = totalItems > 0 ? '' : 'none';
    }

    // Enable checkout button only when MOQ is met
    if (elBtn) {
        elBtn.disabled = !moqMet;
    }
}

// ===== Service Worker Update =====
if ('serviceWorker' in navigator) {
    navigator.serviceWorker.addEventListener('controllerchange', () => {
        showToast('App updated! Reloading...', 'info');
        setTimeout(() => window.location.reload(), 1000);
    });
}
