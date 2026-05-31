// BangleByChoice V2 - Premium App Logic

// --- STATE ---
const state = {
    context: 'jewelry', // 'jewelry' | 'materials'
    cart: [],
    products: [],
    filters: {
        sort: 'popular',
        category: 'all'
    }
};

// --- MOCK DATA (Premium Edition) ---
// --- MOCK DATA (Premium Edition - Synced with Design Final) ---
const MOCK_PRODUCTS = [
    {
        id: 'p1',
        name: 'Royal Silk Bridal Set',
        category: 'Bridal',
        price: 2499,
        image: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?ixlib=rb-4.0.3&w=800&q=80',
        tags: ['Best Seller', 'Silk'],
        rating: 4.9
    },
    {
        id: 'p2',
        name: 'Kundan Gold Accent',
        category: 'Occasion',
        price: 1299,
        image: 'https://images.unsplash.com/photo-1574015974293-8179f5c53887?ixlib=rb-4.0.3&w=800&q=80',
        tags: ['New'],
        rating: 4.7
    },
    {
        id: 'p3',
        name: 'Velvet Matte Red',
        category: 'Daily Wear',
        price: 599,
        image: 'https://images.unsplash.com/photo-1606293926075-69a00febf280?ixlib=rb-4.0.3&w=800&q=80',
        tags: ['Trending'],
        rating: 4.5
    },
    {
        id: 'm1',
        name: 'DIY Bangle Materials Kit',
        category: 'Kit',
        price: 499,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiLh0FCj8uvTZqTeFGIxxg3zHZr7zsf87_XA&s',
        tags: ['DIY Essential'],
        rating: 4.8,
        isMaterial: true
    }
];

const TESTIMONIALS = [
    { name: "Sneha Reddy", role: "Software Engineer", img: "https://randomuser.me/api/portraits/women/44.jpg", text: "The 'Silent Office Kada' collection is a game changer! I feel connected to my culture without compromising my work." },
    { name: "Priya Sharma", role: "Student", img: "https://randomuser.me/api/portraits/women/68.jpg", text: "Used the 'Match Your Outfit' feature for my sister's wedding. They customized the thread color exactly to my lehenga." },
    { name: "Anjali K.", role: "DIY Enthusiast", img: "https://randomuser.me/api/portraits/women/33.jpg", text: "I love that they sell raw materials! I bought the silk threads and bases to make bangles with my daughter." }
];

const PSYCHOLOGY = [
    { color: "Red & Black", icon: "fa-heart", text: "Red signifies energy and passion. Black protects your aura. A bold statement.", bg: "bg-red-50", textCol: "text-red-600" },
    { color: "Blue & Green", icon: "fa-water", text: "Blue radiates calmness. Green signifies new beginnings. Ideal for stressful workdays.", bg: "bg-blue-50", textCol: "text-blue-600" },
    { color: "The Modern Switch", icon: "fa-briefcase", text: "Silent thread bangles that don't clink against keys but still keep you stylish.", bg: "bg-amber-50", textCol: "text-amber-600" }
];

// --- INIT ---
document.addEventListener('DOMContentLoaded', () => {
    state.products = MOCK_PRODUCTS;
    renderApp();
});

// --- ACTIONS ---
function switchContext(ctx) {
    state.context = ctx;
    state.filters.category = 'all'; // Reset cat on context switch

    // UI Indicator Logic
    const ind = document.getElementById('toggle-indicator');
    const btnJ = document.getElementById('btn-jewelry');
    const btnM = document.getElementById('btn-materials');

    if (ctx === 'jewelry') {
        ind.style.transform = 'translateX(0)';
        btnJ.classList.replace('text-slate-400', 'text-rose-950');
        btnM.classList.replace('text-rose-950', 'text-slate-400');
    } else {
        ind.style.transform = 'translateX(100%)';
        btnM.classList.replace('text-slate-400', 'text-rose-950');
        btnJ.classList.replace('text-rose-950', 'text-slate-400');
    }

    renderApp();
}

// --- FILTER LOGIC ---
function openFilters() {
    const drawer = document.getElementById('filter-drawer');
    const backdrop = document.getElementById('filter-backdrop');
    const sheet = document.getElementById('filter-sheet');

    drawer.classList.remove('hidden');
    // Populate Categories dynamically based on current context items
    renderDrawerCategories();

    // Animate in
    setTimeout(() => {
        backdrop.classList.remove('opacity-0');
        sheet.classList.remove('translate-y-full');
    }, 10);
}

function closeFilters() {
    const drawer = document.getElementById('filter-drawer');
    const backdrop = document.getElementById('filter-backdrop');
    const sheet = document.getElementById('filter-sheet');

    backdrop.classList.add('opacity-0');
    sheet.classList.add('translate-y-full');

    setTimeout(() => {
        drawer.classList.add('hidden');
    }, 300);
}

function setSort(val) {
    state.filters.sort = val;
    // Visual Update
    document.querySelectorAll('[data-group="sort"]').forEach(btn => {
        if (btn.dataset.val === val) {
            btn.classList.add('bg-slate-900', 'text-white');
            btn.classList.remove('bg-slate-100', 'text-slate-600');
        } else {
            btn.classList.remove('bg-slate-900', 'text-white');
            btn.classList.add('bg-slate-100', 'text-slate-600');
        }
    });
}

function addToCart(id) {
    // Find product
    const product = state.products.find(p => p.id === id);
    if (!product) return;

    // Add to cart state
    state.cart.push(product);

    // Show Toast
    showToast(`Added ${product.name}`, 'success');

    // Update Bag UI (Mock)
    updateBagCount();
}

function showToast(msg, type = 'success') {
    const toast = document.getElementById('toast-container');
    const msgEl = document.getElementById('toast-message');
    const iconEl = document.getElementById('toast-icon');

    msgEl.textContent = msg;

    if (type === 'success') {
        iconEl.className = 'fa-solid fa-check text-emerald-400';
    } else {
        iconEl.className = 'fa-solid fa-info-circle text-blue-400';
    }

    toast.classList.remove('-translate-y-24', 'opacity-0');

    setTimeout(() => {
        toast.classList.add('-translate-y-24', 'opacity-0');
    }, 2500);
}

function updateBagCount() {
    // Mock update to the bottom sticky bar
    const bagCount = document.querySelector('.fa-bag-shopping').parentNode.nextElementSibling;
    if (bagCount) {
        bagCount.innerHTML = `
            <span class="text-[10px] text-slate-300 font-bold uppercase tracking-wider">My Bag</span>
            <span class="text-xs font-bold">${state.cart.length} Items • ₹${state.cart.reduce((a, b) => a + b.price, 0)}</span>
        `;
    }
}

function setDrawerCategory(cat) {
    state.filters.category = cat;
    // Visual Update
    document.querySelectorAll('[data-group="cat"]').forEach(btn => {
        if (btn.dataset.val === cat) {
            btn.classList.add('bg-rose-600', 'text-white', 'shadow-md');
            btn.classList.remove('bg-white', 'text-slate-600', 'border');
        } else {
            btn.classList.remove('bg-rose-600', 'text-white', 'shadow-md');
            btn.classList.add('bg-white', 'text-slate-600', 'border');
        }
    });
}

function clearFilters() {
    state.filters.sort = 'popular';
    state.filters.category = 'all';
    renderDrawerCategories(); // Re-render to reset visuals
    setSort('popular'); // Reset sort visuals
}

function applyFilters() {
    renderGrid();
    closeFilters();
    // Scroll top
    document.getElementById('main-content').scrollTo({ top: 0, behavior: 'smooth' });
}

function renderDrawerCategories() {
    const container = document.getElementById('drawer-cat-filters');
    const isMat = state.context === 'materials';
    // Get unique categories from current context items
    const relevantProducts = state.products.filter(p => isMat ? p.isMaterial : !p.isMaterial);
    const cats = ['all', ...new Set(relevantProducts.map(p => p.category))];

    container.innerHTML = cats.map(c => `
        <button onclick="setDrawerCategory('${c}')" 
            class="px-4 py-2 rounded-full text-sm font-bold transition border border-stone-200 ${state.filters.category === c ? 'bg-rose-600 text-white shadow-md' : 'bg-white text-slate-600'}" 
            data-group="cat" data-val="${c}">
            ${c === 'all' ? 'All' : c}
        </button>
    `).join('');
}

// --- RENDERERS ---
function renderApp() {
    renderFilters();
    renderGrid();
}

function renderFilters() {
    const container = document.getElementById('quick-filters');
    // Keep the "Filter" button (first child) and append dynamic ones
    // For now, simpler to just overwrite after first static item if needed, 
    // but let's just create a list of chips.

    const filters = state.context === 'jewelry'
        ? ['Bridal', 'Silk', 'Stone', 'Office', 'Party']
        : ['Silk Thread', 'Kundan', 'Base', 'Frames', 'Glue'];

    const staticFilterBtn = `
    <button onclick="openFilters()" class="shrink-0 w-16 h-16 rounded-full border border-stone-200 p-0.5 flex flex-col items-center justify-center gap-1 group">
        <div class="w-full h-full rounded-full bg-stone-100 flex items-center justify-center group-hover:bg-rose-50 transition">
            <i class="fa-solid fa-sliders text-slate-400 group-hover:text-rose-600"></i>
        </div>
        <span class="text-[9px] font-bold uppercase tracking-wider text-slate-400">Filters</span>
    </button>`;

    const chips = filters.map(f => `
    <button onclick="setDrawerCategory('${f}')" class="shrink-0 w-16 h-16 rounded-full border border-stone-200 p-0.5 flex flex-col items-center justify-center gap-1 group fade-enter active:scale-95 transition">
        <div class="w-full h-full rounded-full bg-white flex items-center justify-center shadow-sm group-hover:shadow-md transition ${state.filters.category === f ? 'bg-rose-50 border-rose-200' : ''}">
            <span class="font-serif text-xl italic text-slate-300 group-hover:text-rose-600 ${state.filters.category === f ? 'text-rose-600' : ''}">${f[0]}</span>
        </div>
        <span class="text-[9px] font-bold uppercase tracking-wider text-slate-600 line-clamp-1 w-full text-center">${f}</span>
    </button>
    `).join('');

    container.innerHTML = staticFilterBtn + chips;
}

function renderGrid() {
    const container = document.getElementById('product-grid');
    const isMat = state.context === 'materials';

    // Filter Logic
    let list = state.products.filter(p => isMat ? p.isMaterial : !p.isMaterial);

    // Category Filter
    if (state.filters.category !== 'all') {
        list = list.filter(p => p.category === state.filters.category || (p.tags && p.tags.includes(state.filters.category)));
    }

    // Sort Logic
    if (state.filters.sort === 'price_low') list.sort((a, b) => a.price - b.price);
    else if (state.filters.sort === 'new') list.reverse(); // Mock new
    // Default is 'popular' (keep order)

    container.innerHTML = list.map(p => `
    <div class="group fade-enter">
        <!-- Card Image (3:4 Aspect Ratio for Luxury Feel) -->
        <div class="relative w-full aspect-[3/4] bg-stone-100 rounded-2xl overflow-hidden mb-3 shadow-sm group-hover:shadow-lg transition duration-500">
            <img src="${p.image}" class="w-full h-full object-cover group-hover:scale-105 transition duration-700">
            
            <!-- Floating Badge -->
            ${p.tags.length ? `<span class="absolute top-2 left-2 bg-white/90 backdrop-blur-md text-[9px] font-bold uppercase tracking-widest px-2 py-1 rounded-sm text-rose-950">${p.tags[0]}</span>` : ''}
            
            <!-- Quick Add Button (Mobile Friendly Fab) -->
            <button onclick="addToCart('${p.id}')" class="absolute bottom-2 right-2 w-8 h-8 bg-white text-rose-600 rounded-full flex items-center justify-center shadow-md active:scale-95 transition hover:bg-rose-600 hover:text-white">
                <i class="fa-solid fa-plus"></i>
            </button>
        </div>
        
        <!-- Details -->
        <div class="px-1">
            <div class="flex justify-between items-start">
                <div>
                    <h4 class="font-serif text-base text-slate-900 leading-tight mb-0.5 line-clamp-1">${p.name}</h4>
                    <p class="text-[10px] text-slate-500 uppercase tracking-widest font-semibold">${p.category}</p>
                </div>
                <span class="font-bold text-sm text-rose-900">₹${p.price}</span>
            </div>
        </div>
    </div>
    `).join('');

    // Empty State
    if (list.length === 0) {
        container.innerHTML = `<div class="col-span-full py-12 text-center text-slate-400 font-serif italic">No items found in this category.</div>`;
    }
}
