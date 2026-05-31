// BangleByChoice V3 - Intelligent Boutique

const state = {
    view: 'grid', // 'grid' | 'story'
    products: []
};

// --- MOCK DATA (High Res for Stories) ---
const MOCK_PRODUCTS = [
    {
        id: 'p1',
        name: 'Royal Silk Bridal Set',
        price: 2499,
        image: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?ixlib=rb-4.0.3&w=800&q=80', // Grid
        storyImage: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?ixlib=rb-4.0.3&w=800&h=1400&fit=crop&q=80', // Tall
        desc: 'Handcrafted silk thread bangles with kundans. "The Silent Office Kada collection is a game changer!" - Sneha',
        tags: ['Bridal', 'Silk']
    },
    {
        id: 'p2',
        name: 'Kundan Gold Accent',
        price: 1299,
        image: 'https://images.unsplash.com/photo-1574015974293-8179f5c53887?ixlib=rb-4.0.3&w=800&q=80',
        storyImage: 'https://images.unsplash.com/photo-1574015974293-8179f5c53887?ixlib=rb-4.0.3&w=800&h=1400&fit=crop&q=80',
        desc: 'Traditional gold-plated bangles with intricate design. Customized exactly to your lehenga.',
        tags: ['Gold', 'Occasion']
    },
    {
        id: 'm1',
        name: 'DIY Bangle Materials Kit',
        price: 499,
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiLh0FCj8uvTZqTeFGIxxg3zHZr7zsf87_XA&s',
        storyImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiLh0FCj8uvTZqTeFGIxxg3zHZr7zsf87_XA&s',
        desc: 'Everything you need to create your own magic. "It is such a fun weekend activity with my daughter." - Anjali',
        tags: ['DIY', 'Kit']
    }
];

document.addEventListener('DOMContentLoaded', () => {
    state.products = MOCK_PRODUCTS; // In real app, fetch from API
    switchView('grid'); // Default
});

// --- AI FEATURES ---
function startVoiceSearch() {
    const overlay = document.getElementById('voice-overlay');
    const status = document.getElementById('voice-status');

    overlay.classList.remove('hidden');
    // Force reflow
    void overlay.offsetWidth;
    overlay.classList.remove('opacity-0');

    // Mock Conversation
    setTimeout(() => { status.textContent = "Processing..."; }, 2000);
    setTimeout(() => { status.textContent = "Searching for 'Bridal Set'..."; }, 3500);
    setTimeout(() => {
        closeAiOverlays();
        // Mock Filter Result
        alert("AI: Found 12 matching items for 'Bridal Set'");
    }, 5000);
}

function startCameraSearch() {
    const overlay = document.getElementById('camera-overlay');
    overlay.classList.remove('hidden');
    void overlay.offsetWidth;
    overlay.classList.remove('opacity-0');

    setTimeout(() => {
        closeAiOverlays();
        alert("AI: Outfit match found! Showing complementary Gold Bangles.");
    }, 4000);
}

function closeAiOverlays() {
    ['voice-overlay', 'camera-overlay'].forEach(id => {
        const el = document.getElementById(id);
        el.classList.add('opacity-0');
        setTimeout(() => el.classList.add('hidden'), 300);
    });
}

// --- DOUBLE TAP INTERACTION ---
let lastTap = 0;
function handleDoubleTap(e, id) {
    const currentTime = new Date().getTime();
    const tapLength = currentTime - lastTap;

    if (tapLength < 300 && tapLength > 0) {
        // Double Tap Detected
        showLikeAnimation(e.clientX, e.clientY);
        toggleLike(id);
        e.preventDefault();
    }
    lastTap = currentTime;
}

function showLikeAnimation(x, y) {
    const container = document.getElementById('like-animation-container');
    const heart = document.createElement('div');
    heart.className = 'absolute text-rose-600 text-6xl drop-shadow-2xl animate-ping opacity-0';
    heart.style.left = `${x - 30}px`;
    heart.style.top = `${y - 30}px`;
    heart.innerHTML = '<i class="fa-solid fa-heart"></i>';

    container.appendChild(heart);

    // Animate
    requestAnimationFrame(() => {
        heart.classList.remove('opacity-0');
        heart.style.transform = 'scale(2)';
    });

    setTimeout(() => {
        heart.remove();
    }, 800);
}

function toggleLike(id) {
    // Find button and toggle class (Mock)
    const btn = document.querySelector(`[data-like-btn="${id}"]`);
    if (btn) {
        const icon = btn.querySelector('i');
        if (icon.classList.contains('fa-regular')) {
            icon.classList.replace('fa-regular', 'fa-solid');
            icon.classList.add('text-rose-600');
        } else {
            icon.classList.replace('fa-solid', 'fa-regular');
            icon.classList.remove('text-rose-600');
        }
    }
}

function switchView(view) {
    state.view = view;

    const gridEl = document.getElementById('grid-view');
    const storyEl = document.getElementById('story-view');
    const btnGrid = document.getElementById('btn-view-grid');
    const btnStory = document.getElementById('btn-view-story');

    if (view === 'grid') {
        gridEl.classList.remove('hidden');
        storyEl.classList.add('hidden');

        btnGrid.classList.replace('text-white/50', 'text-white');
        btnGrid.classList.add('bg-white/20');
        btnStory.classList.replace('text-white', 'text-white/50');
        btnStory.classList.remove('bg-white/20');

        renderGrid();
    } else {
        gridEl.classList.add('hidden');
        storyEl.classList.remove('hidden');

        btnStory.classList.replace('text-white/50', 'text-white');
        btnStory.classList.add('bg-white/20');
        btnGrid.classList.replace('text-white', 'text-white/50');
        btnGrid.classList.remove('bg-white/20');

        renderStories();
    }
}

function renderGrid() {
    const container = document.getElementById('product-grid');
    if (!container.innerHTML.trim()) {
        // Only render if empty to save resources
        container.innerHTML = state.products.map(p => `
        <div class="bg-white rounded-xl overflow-hidden shadow-sm">
            <div class="w-full aspect-[3/4] bg-stone-100 relative">
                <img src="${p.image}" class="w-full h-full object-cover">
                <span class="absolute top-2 left-2 bg-white/90 text-[9px] font-bold px-2 py-1 rounded uppercase">${p.tags[0]}</span>
                <!-- AI Controls (Left) -->
                <!-- Removed accidental injection -->
            </div>
            <div class="p-2">
                <h4 class="font-bold text-sm text-slate-800 line-clamp-1">${p.name}</h4>
                <div class="flex justify-between items-center mt-1">
                    <span class="text-rose-600 font-bold text-sm">₹${p.price}</span>
                    <button class="w-6 h-6 rounded-full bg-stone-100 text-slate-600 flex items-center justify-center text-xs"><i class="fa-solid fa-plus"></i></button>
                </div>
            </div>
        </div>
        `).join('');
    }

    // Filters Injection
    const filters = document.getElementById('grid-filters');
    if (!filters.innerHTML.trim()) {
        filters.innerHTML = `
        <button class="px-4 py-2 bg-slate-900 text-white rounded-full text-xs font-bold whitespace-nowrap">All Items</button>
        <button class="px-4 py-2 bg-white border border-stone-200 text-slate-600 rounded-full text-xs font-bold whitespace-nowrap">Bridal</button>
        <button class="px-4 py-2 bg-white border border-stone-200 text-slate-600 rounded-full text-xs font-bold whitespace-nowrap">Silk Thread</button>
        `;
    }
}

function renderStories() {
    const container = document.getElementById('story-view');
    // Always re-render or check? For simple mock, re-render.

    container.innerHTML = state.products.map(p => `
    <div class="w-full h-screen snap-center relative bg-slate-900 flex items-center justify-center overflow-hidden" 
         onclick="handleDoubleTap(event, '${p.id}')">
        <img src="${p.storyImage}" class="w-full h-full object-cover opacity-80 pointer-events-none select-none">
        
        <!-- Gradient Overlay -->
        <div class="absolute inset-0 bg-linear-to-t from-black/90 via-transparent to-black/20 pointer-events-none"></div>
        
        <!-- Content Layer -->
        <div class="absolute bottom-24 left-0 w-full px-6 text-white pb-6 pointer-events-none">
            <div class="flex items-center gap-2 mb-2">
                <span class="bg-rose-600 text-[10px] font-bold px-2 py-0.5 rounded uppercase">Featured</span>
                <div class="flex text-yellow-400 text-xs">
                    <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star-half-stroke"></i>
                </div>
            </div>
            <h2 class="font-serif text-3xl font-bold mb-2 leading-tight">${p.name}</h2>
            <p class="text-sm text-slate-300 line-clamp-2 mb-4 font-light">${p.desc}</p>
            
            <div class="flex items-center justify-between pointer-events-auto">
                <div class="text-2xl font-bold">₹${p.price}</div>
                <button class="px-8 py-3 bg-white text-slate-900 font-bold rounded-full uppercase tracking-widest text-xs hover:bg-rose-50 transition shadow-[0_0_20px_rgba(255,255,255,0.3)] shrink-0">
                    Add to Bag
                </button>
            </div>
        </div>
        
        <!-- Right Actions (Pointer Events Auto) -->
        <div class="absolute bottom-32 right-4 flex flex-col gap-6 text-white items-center z-20 pointer-events-auto">
            <button class="flex flex-col items-center gap-1 active:scale-75 transition" data-like-btn="${p.id}" onclick="toggleLike('${p.id}'); event.stopPropagation();">
                <i class="fa-regular fa-heart text-2xl drop-shadow-lg"></i>
                <span class="text-[10px] font-bold">2.4k</span>
            </button>
            <button class="flex flex-col items-center gap-1 active:scale-75 transition">
                <i class="fa-solid fa-share text-2xl drop-shadow-lg"></i>
                <span class="text-[10px] font-bold">Share</span>
            </button>
        </div>
    </div>
    `).join('');
}
