"use client";

import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';

export default function Home() {
  // Database-backed states
  const [catalog, setCatalog] = useState([]);
  const [categories, setCategories] = useState({ all: '✨ View All' });
  const [colors, setColors] = useState({});
  const [gradients, setGradients] = useState({});

  // App Client UI states
  const [cart, setCart] = useState([]);
  const [currentFilter, setCurrentFilter] = useState('all');
  const [currentColorFilter, setCurrentColorFilter] = useState('all');
  const [currentSizeFilter, setCurrentSizeFilter] = useState('all');
  const [currentProduct, setCurrentProduct] = useState(null);
  const [currentSize, setCurrentSize] = useState('2.4');

  // Panel overlays states
  const [isCartOpen, setIsCartOpen] = useState(false);
  const [isSearchOpen, setIsSearchOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [isAdminOpen, setIsAdminOpen] = useState(false);

  // Toast notification state
  const [toastMessage, setToastMessage] = useState('');

  // Admin form inputs
  const [adminProdName, setAdminProdName] = useState('');
  const [adminProdCat, setAdminProdCat] = useState('');
  const [adminProdTag, setAdminProdTag] = useState('');
  const [adminProdPrice, setAdminProdPrice] = useState('');
  const [adminProdMRP, setAdminProdMRP] = useState('');
  const [adminProdColorTheme, setAdminProdColorTheme] = useState('');
  const [adminProdDesc, setAdminProdDesc] = useState('');
  const [adminProdSizes, setAdminProdSizes] = useState({
    '2.2': true,
    '2.4': true,
    '2.6': true,
    '2.8': true,
  });
  const [adminProdImageFile, setAdminProdImageFile] = useState(null);
  const [isUploading, setIsUploading] = useState(false);

  // Fetch all DB records
  const fetchData = async () => {
    try {
      // 1. Fetch Categories
      const catRes = await fetch('/api/categories');
      const catData = await catRes.json();
      if (!catData.error) {
        setCategories(catData);
        // Default admin selected category to the first available category key (excluding 'all')
        const keys = Object.keys(catData).filter(k => k !== 'all');
        if (keys.length > 0 && !adminProdCat) {
          setAdminProdCat(keys[0]);
        }
      }

      // 2. Fetch Colors & Gradients
      const colorRes = await fetch('/api/colors');
      const colorData = await colorRes.json();
      if (!colorData.error) {
        setColors(colorData.colors);
        setGradients(colorData.gradients);
        const keys = Object.keys(colorData.colors);
        if (keys.length > 0 && !adminProdColorTheme) {
          setAdminProdColorTheme(keys[0]);
        }
      }

      // 3. Fetch Catalog Products
      const prodRes = await fetch('/api/products');
      const prodData = await prodRes.json();
      if (!prodData.error) {
        setCatalog(prodData);
      }
    } catch (err) {
      console.error("Failed to load catalog data from API backend:", err);
      showToast("Backend connection error. Using local states.");
    }
  };

  // Load state and cache on mount
  useEffect(() => {
    fetchData();
    // Retrieve cart from localStorage
    const savedCart = localStorage.getItem('bbc_cart');
    if (savedCart) {
      setCart(JSON.parse(savedCart));
    }
  }, []);

  // Sync cart to localStorage whenever updated
  const saveCartState = (newCart) => {
    setCart(newCart);
    localStorage.setItem('bbc_cart', JSON.stringify(newCart));
  };

  // Toast trigger helper
  const showToast = (msg) => {
    setToastMessage(msg);
    setTimeout(() => {
      setToastMessage('');
    }, 3000);
  };

  // Cart operations
  const handleAddToCart = (product, size) => {
    const exists = cart.find(item => item.id === product.id && item.size === size);
    let updatedCart;
    if (exists) {
      updatedCart = cart.map(item =>
        item.id === product.id && item.size === size ? { ...item, qty: item.qty + 1 } : item
      );
    } else {
      updatedCart = [
        ...cart,
        {
          id: product.id,
          name: product.name,
          price: product.price,
          mrp: product.mrp,
          emoji: product.emoji,
          bg: product.bg,
          size: size,
          qty: 1,
          image_url: product.image_url
        }
      ];
    }
    saveCartState(updatedCart);
    showToast(`Added ${product.name} to Cart`);
  };

  const handleQuickAdd = (product) => {
    const size = product.cat === 'materials' ? 'N/A' : '2.4';
    handleAddToCart(product, size);
  };

  const handleUpdateQty = (index, diff) => {
    const updated = [...cart];
    updated[index].qty += diff;
    if (updated[index].qty <= 0) {
      updated.splice(index, 1);
    }
    saveCartState(updated);
  };

  // WhatsApp Redirect Checkouts
  const handleDirectWhatsApp = (product, size) => {
    const text = `Hello BangleByChoice! I want to order:\n- *Product:* ${product.name}\n- *Size:* ${size}\n- *Price:* ₹${product.price}`;
    window.open(`https://wa.me/919553655562?text=${encodeURIComponent(text)}`, '_blank');
  };

  const getDiscountPercent = (qty) => {
    if (qty >= 50) return 0.3;
    if (qty >= 25) return 0.2;
    if (qty >= 10) return 0.1;
    return 0;
  };

  const handleCheckoutCart = (e) => {
    e.preventDefault();
    const name = document.getElementById('custName').value.trim();
    const address = document.getElementById('custAddress').value.trim();

    if (!name || !address) {
      alert('Please provide your name and delivery address to place the order.');
      return;
    }

    let text = `*New Order - BangleByChoice*\n\n*Name:* ${name}\n*Address:* ${address}\n\n*Items:*`;
    let total = 0;
    let totalSavings = 0;
    
    cart.forEach(item => {
      const discountPct = getDiscountPercent(item.qty);
      const discountMultiplier = 1 - discountPct;
      const finalPrice = Math.round(item.price * discountMultiplier);
      const lineTotal = finalPrice * item.qty;
      const baseSavings = item.mrp ? (item.mrp - item.price) * item.qty : 0;
      const volSavings = (item.price - finalPrice) * item.qty;
      
      totalSavings += baseSavings + volSavings;
      total += lineTotal;

      text += `\n- ${item.name} (${item.size !== 'N/A' ? `Size: ${item.size}` : 'Material'}) x${item.qty}`;
      if (discountPct > 0) {
        text += `\n  ~₹${item.price}~ -> ₹${finalPrice} each (-${discountPct*100}%)`;
      }
      text += `\n  Line Total: ₹${lineTotal}`;
    });

    text += `\n\n*Total Amount:* ₹${total}`;
    if (totalSavings > 0) {
      text += `\n*You Saved:* ₹${totalSavings} 🎉`;
    }

    window.open(`https://wa.me/919553655562?text=${encodeURIComponent(text)}`, '_blank');
    
    // Clear cart
    saveCartState([]);
    setIsCartOpen(false);
    showToast('WhatsApp Checkout Initialized!');
  };

  // Admin secure prompt login challenge
  const triggerAdminLogin = () => {
    const pin = prompt('Enter Admin PIN:');
    if (pin === 'admin123' || pin === '1234') {
      setIsAdminOpen(true);
    } else {
      alert('Incorrect PIN!');
    }
  };

  // Dynamically add categories via prompts
  const handleAddCategory = async () => {
    const catId = prompt('Enter a short URL-friendly ID for the category (e.g., "lac" or "beads"):');
    if (!catId) return;
    
    const cleanedId = catId.toLowerCase().trim().replace(/[^a-z0-9]/g, '');
    if (categories[cleanedId]) {
      alert('This category ID already exists.');
      return;
    }

    const catName = prompt('Enter the category display name with an emoji (e.g., "🔮 Lac Bangles" or "✨ Beads"):');
    if (!catName) return;

    try {
      const res = await fetch('/api/categories', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: cleanedId, name: catName }),
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);

      showToast(`Category "${catName}" added successfully!`);
      fetchData();
    } catch (err) {
      alert(`Failed to add category: ${err.message}`);
    }
  };

  // Dynamically add color themes via prompts
  const handleAddColorTheme = async () => {
    const colorId = prompt('Enter a short ID for the color theme (e.g., "bg-pink" or "bg-coral"):');
    if (!colorId) return;
    
    const cleanedId = colorId.toLowerCase().trim().replace(/[^a-z0-9_-]/g, '');
    if (colors[cleanedId]) {
      alert('This color theme ID already exists.');
      return;
    }

    const colorLabel = prompt('Enter the color display name with an emoji (e.g., "🩷 Soft Pink" or "🧡 Coral Peach"):');
    if (!colorLabel) return;

    const gradientVal = prompt('Enter a CSS background gradient (e.g., "linear-gradient(135deg, #FFE4E1 0%, #FFB6C1 100%)"):');
    if (!gradientVal) return;

    try {
      const res = await fetch('/api/colors', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: cleanedId, name: colorLabel, gradient: gradientVal }),
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);

      showToast(`Color theme "${colorLabel}" added successfully!`);
      fetchData();
    } catch (err) {
      alert(`Failed to add color theme: ${err.message}`);
    }
  };

  // Add Product form submission
  const handleSubmitProduct = async (e) => {
    e.preventDefault();
    
    // Extract selected sizes
    const sizes = [];
    if (adminProdCat !== 'materials') {
      Object.keys(adminProdSizes).forEach(sz => {
        if (adminProdSizes[sz]) {
          sizes.push(sz);
        }
      });
      if (sizes.length === 0) {
        alert('Please select at least one size for the bangle.');
        return;
      }
    } else {
      sizes.push('N/A');
    }

    // Determine visual emoji automatically
    let emoji = '🌸';
    if (adminProdCat === 'glass') emoji = '🔮';
    else if (adminProdCat === 'silk') emoji = '🧵';
    else if (adminProdCat === 'designer') emoji = '👑';
    else if (adminProdCat === 'bridal') emoji = '💒';
    else if (adminProdCat === 'materials') emoji = '📦';

    let uploadedImageUrl = null;
    if (adminProdImageFile) {
      setIsUploading(true);
      try {
        const fileExt = adminProdImageFile.name.split('.').pop();
        const fileName = `${Date.now()}.${fileExt}`;
        const filePath = `${fileName}`;

        const { data: uploadData, error: uploadError } = await supabase.storage
          .from('products')
          .upload(filePath, adminProdImageFile);

        if (uploadError) {
          throw uploadError;
        }

        const { data: publicUrlData } = supabase.storage
          .from('products')
          .getPublicUrl(filePath);

        uploadedImageUrl = publicUrlData.publicUrl;
      } catch (err) {
        alert(`Image upload failed: ${err.message}`);
        setIsUploading(false);
        return;
      }
      setIsUploading(false);
    }

    const newProduct = {
      name: adminProdName,
      cat: adminProdCat,
      tag: adminProdTag,
      price: parseInt(adminProdPrice),
      mrp: adminProdMRP ? parseInt(adminProdMRP) : null,
      bg: adminProdColorTheme,
      desc: adminProdDesc,
      emoji,
      sizes,
      image_url: uploadedImageUrl
    };

    try {
      const res = await fetch('/api/products', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newProduct)
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);

      showToast("Product added successfully!");
      // Reset form
      setAdminProdName('');
      setAdminProdTag('');
      setAdminProdPrice('');
      setAdminProdMRP('');
      setAdminProdDesc('');
      setAdminProdSizes({ '2.2': true, '2.4': true, '2.6': true, '2.8': true });
      setAdminProdImageFile(null);
      fetchData();
    } catch (err) {
      alert(`Failed to save product: ${err.message}`);
    }
  };

  // Delete product action
  const handleDeleteProduct = async (id) => {
    try {
      const res = await fetch(`/api/products/${id}`, {
        method: 'DELETE'
      });
      const data = await res.json();
      if (data.error) throw new Error(data.error);

      showToast("Product deleted successfully!");
      fetchData();
    } catch (err) {
      alert(`Failed to delete product: ${err.message}`);
    }
  };

  // Storefront Filtering Logic
  const filteredProducts = catalog.filter(p => {
    const matchCat = (currentFilter === 'all' || p.cat === currentFilter);
    const matchColor = (currentColorFilter === 'all' || p.bg === currentColorFilter);
    
    let matchSize = false;
    if (currentSizeFilter === 'all') {
      matchSize = true;
    } else if (p.cat === 'materials') {
      matchSize = (currentSizeFilter === 'N/A');
    } else {
      const sizesSupported = p.sizes || ['2.2', '2.4', '2.6', '2.8'];
      matchSize = sizesSupported.includes(currentSizeFilter);
    }
    
    return matchCat && matchColor && matchSize;
  });

  // Search Results Filtering
  const searchResults = searchQuery.trim() === ''
    ? []
    : catalog.filter(p =>
        p.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (p.desc && p.desc.toLowerCase().includes(searchQuery.toLowerCase()))
      );

  return (
    <>
      {/* HEADER */}
      <header>
        <div className="container header-wrap">
          <img
            src="/banglebychoice_logo.png"
            className="brand-logo-img"
            alt="BangleByChoice Logo"
            onClick={() => {
              setIsAdminOpen(false);
              setCurrentFilter('all');
              window.scrollTo({ top: 0, behavior: 'smooth' });
            }}
          />
          <div className="nav-actions">
            <button
              className="icon-btn"
              id="searchBtnIcon"
              title="Search"
              onClick={() => setIsSearchOpen(true)}
            >
              <i className="fa-solid fa-magnifying-glass"></i>
            </button>
            <button
              className="icon-btn"
              id="cartBtnIcon"
              title="Cart"
              onClick={() => setIsCartOpen(true)}
            >
              <i className="fa-solid fa-bag-shopping"></i>
              <span className="badge" id="cartBadgeCount">
                {cart.reduce((sum, item) => sum + item.qty, 0)}
              </span>
            </button>
            {!isAdminOpen && (
              <button
                className="btn btn-secondary"
                id="adminPortalToggle"
                style={{ padding: '10px 16px' }}
                onClick={triggerAdminLogin}
              >
                <i className="fa-solid fa-user-gear"></i> Admin
              </button>
            )}
          </div>
        </div>
      </header>

      {/* CONSUMER VIEWPORT FRONTEND */}
      {!isAdminOpen ? (
        <div id="consumerApp">
          {/* HERO */}
          <section className="hero">
            <div class="container">
              <div className="hero-banner">
                <div className="hero-content">
                  <span className="hero-eyebrow">Handcrafted Elegance</span>
                  <h1 className="hero-title">Hyderabad's Finest Designer Bangles</h1>
                  <p className="hero-sub">Explore bridal sets, customized thread creations, glass stacks, and premium craft raw materials.</p>
                  <button
                    className="btn btn-primary"
                    onClick={() => {
                      document.getElementById('productsArea').scrollIntoView({ behavior: 'smooth' });
                    }}
                  >
                    Explore Collection
                  </button>
                </div>
              </div>
            </div>
          </section>

          {/* DYNAMIC MULTI-DIMENSIONAL FILTERS */}
          <section className="filters-section">
            <div className="container filters-wrap" style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
              
              {/* Category Pills Row */}
              <div className="categories-scroll" id="categoriesContainer" style={{ padding: 0 }}>
                {Object.keys(categories).map(key => (
                  <div
                    key={key}
                    className={`filter-chip ${currentFilter === key ? 'active' : ''}`}
                    onClick={() => setCurrentFilter(key)}
                  >
                    {categories[key]}
                  </div>
                ))}
              </div>

              {/* Color filter chips row */}
              <div
                className="categories-scroll"
                id="colorsFilterContainer"
                style={{ padding: '6px 0 0 0', borderTop: '1px dashed var(--border)', display: 'flex', gap: '10px', alignItems: 'center' }}
              >
                <div
                  className={`filter-chip ${currentColorFilter === 'all' ? 'active' : ''}`}
                  style={{ fontSize: '12px', padding: '6px 12px' }}
                  onClick={() => setCurrentColorFilter('all')}
                >
                  🎨 All Colors
                </div>
                {Object.keys(colors).map(key => (
                  <div
                    key={key}
                    className={`filter-chip ${currentColorFilter === key ? 'active' : ''}`}
                    style={{ fontSize: '12px', padding: '6px 12px' }}
                    onClick={() => setCurrentColorFilter(key)}
                  >
                    {colors[key]}
                  </div>
                ))}
              </div>

              {/* Size filter chips row */}
              <div
                className="categories-scroll"
                id="sizesFilterContainer"
                style={{ padding: '6px 0 0 0', borderTop: '1px dashed var(--border)', display: 'flex', gap: '10px', alignItems: 'center' }}
              >
                <div
                  className={`filter-chip ${currentSizeFilter === 'all' ? 'active' : ''}`}
                  style={{ fontSize: '12px', padding: '6px 12px' }}
                  onClick={() => setCurrentSizeFilter('all')}
                >
                  ⭕ All Sizes
                </div>
                {['2.2', '2.4', '2.6', '2.8', 'N/A'].map(size => (
                  <div
                    key={size}
                    className={`filter-chip ${currentSizeFilter === size ? 'active' : ''}`}
                    style={{ fontSize: '12px', padding: '6px 12px' }}
                    onClick={() => setCurrentSizeFilter(size)}
                  >
                    {size === 'N/A' ? '📦 Craft Materials (N/A)' : `Size ${size}`}
                  </div>
                ))}
              </div>

            </div>
          </section>

          {/* DYNAMIC PRODUCT GRID */}
          <section className="products-section" id="productsArea">
            <div className="container">
              <h2 className="section-title" id="shopGridTitle">
                {categories[currentFilter] || 'All Products'}
              </h2>
              
              {filteredProducts.length === 0 ? (
                <div style={{ gridColumn: '1 / -1', textAlign: 'center', padding: '40px', color: 'var(--ink-light)' }}>
                  No products match the selected filters.
                </div>
              ) : (
                <div className="products-grid" id="productsGrid">
                  {filteredProducts.map(p => (
                    <div
                      key={p.id}
                      className="product-card"
                      onClick={() => {
                        setCurrentProduct(p);
                        const sizesSupported = p.sizes || ['2.2', '2.4', '2.6', '2.8'];
                        setCurrentSize(sizesSupported[0] || 'N/A');
                      }}
                    >
                      <div className="card-image-wrap">
                        <div
                          className="card-img-placeholder"
                          style={{ background: gradients[p.bg] || gradients['bg-rainbow'] }}
                        >
                          {p.emoji || '🌸'}
                        </div>
                        {p.tag && <span className="card-badge">{p.tag}</span>}
                      </div>
                      <div className="card-body">
                        <h3 className="card-name">{p.name}</h3>
                        <div className="card-meta">
                          <div className="price-wrap">
                            <span className="card-price">₹{p.price}</span>
                            {p.mrp && <span className="card-mrp">₹{p.mrp}</span>}
                          </div>
                          <button
                            className="add-icon-btn"
                            onClick={(e) => {
                              e.stopPropagation();
                              handleQuickAdd(p);
                            }}
                          >
                            <i className="fa-solid fa-plus"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </section>
        </div>
      ) : (
        /* ADMIN PORTAL */
        <div id="adminApp" className="admin-view active">
          <div className="container" style={{ padding: '40px 0' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifySpace: 'space-between', justifyContent: 'space-between', marginBottom: '24px' }}>
              <h1 className="section-title" style={{ marginBottom: 0 }}>Admin Portal | Product Manager</h1>
              <button
                className="btn btn-secondary"
                id="exitAdminBtn"
                onClick={() => setIsAdminOpen(false)}
              >
                <i className="fa-solid fa-arrow-left"></i> Exit Admin
              </button>
            </div>
            
            <div className="admin-grid">
              
              {/* Product Form Card */}
              <div className="admin-card">
                <h2 className="admin-card-title">Add New Item</h2>
                <form id="addProductForm" onSubmit={handleSubmitProduct}>
                  
                  <div className="form-group">
                    <label className="form-label">Product Name *</label>
                    <input
                      type="text"
                      className="form-control"
                      placeholder="e.g. Silk Thread Set"
                      required
                      value={adminProdName}
                      onChange={(e) => setAdminProdName(e.target.value)}
                    />
                  </div>

                  <div className="form-group">
                    <label className="form-label">Category *</label>
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <select
                        className="form-control"
                        required
                        style={{ flex: 1 }}
                        value={adminProdCat}
                        onChange={(e) => setAdminProdCat(e.target.value)}
                      >
                        {Object.keys(categories).filter(k => k !== 'all').map(key => (
                          <option key={key} value={key}>{categories[key]}</option>
                        ))}
                      </select>
                      <button
                        type="button"
                        className="btn btn-secondary"
                        id="addCatBtn"
                        style={{ padding: '10px 14px' }}
                        title="Add Custom Category"
                        onClick={handleAddCategory}
                      >
                        <i className="fa-solid fa-plus"></i>
                      </button>
                    </div>
                  </div>

                  <div className="form-group">
                    <label className="form-label">Special Tag / Shape</label>
                    <input
                      type="text"
                      className="form-control"
                      placeholder="e.g. Best Seller, Round Shape"
                      value={adminProdTag}
                      onChange={(e) => setAdminProdTag(e.target.value)}
                    />
                  </div>
                  
                  <div className="form-group">
                    <label className="form-label">Price (₹) *</label>
                    <div className="form-row">
                      <input
                        type="number"
                        className="form-control"
                        placeholder="Selling Price"
                        required
                        value={adminProdPrice}
                        onChange={(e) => setAdminProdPrice(e.target.value)}
                      />
                      <input
                        type="number"
                        className="form-control"
                        placeholder="MRP (optional)"
                        value={adminProdMRP}
                        onChange={(e) => setAdminProdMRP(e.target.value)}
                      />
                    </div>
                  </div>

                  <div className="form-group">
                    <label className="form-label">Choose Theme / Color Accent</label>
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <select
                        className="form-control"
                        style={{ flex: 1 }}
                        value={adminProdColorTheme}
                        onChange={(e) => setAdminProdColorTheme(e.target.value)}
                      >
                        {Object.keys(colors).map(key => (
                          <option key={key} value={key}>{colors[key]}</option>
                        ))}
                      </select>
                      <button
                        type="button"
                        className="btn btn-secondary"
                        id="addColorThemeBtn"
                        style={{ padding: '10px 14px' }}
                        title="Add Custom Color Theme"
                        onClick={handleAddColorTheme}
                      >
                        <i className="fa-solid fa-plus"></i>
                      </button>
                    </div>
                  </div>

                  {adminProdCat !== 'materials' && (
                    <div className="form-group" id="prodSizesGroup">
                      <label className="form-label">Available Sizes *</label>
                      <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap', marginTop: '6px' }}>
                        {['2.2', '2.4', '2.6', '2.8'].map(sz => (
                          <label key={sz} style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '13px', cursor: 'pointer' }}>
                            <input
                              type="checkbox"
                              name="prodSizes"
                              value={sz}
                              checked={adminProdSizes[sz]}
                              onChange={(e) => {
                                setAdminProdSizes({
                                  ...adminProdSizes,
                                  [sz]: e.target.checked
                                });
                              }}
                            /> {sz}
                          </label>
                        ))}
                      </div>
                    </div>
                  )}

                  <div className="form-group">
                    <label className="form-label">Description / Story Details</label>
                    <textarea
                      className="form-control"
                      rows="3"
                      placeholder="Describe the style, beauty, or material details..."
                      value={adminProdDesc}
                      onChange={(e) => setAdminProdDesc(e.target.value)}
                    ></textarea>
                  </div>

                  <div className="form-group">
                    <label className="form-label">Product Image</label>
                    <input
                      type="file"
                      className="form-control"
                      accept="image/*"
                      onChange={(e) => setAdminProdImageFile(e.target.files[0])}
                    />
                  </div>

                  <button
                    type="submit"
                    className="btn btn-primary"
                    style={{ width: '100%', padding: '14px' }}
                    disabled={isUploading}
                  >
                    {isUploading ? <><i className="fa-solid fa-spinner fa-spin"></i> Uploading...</> : <><i className="fa-solid fa-plus"></i> Add Product</>}
                  </button>

                </form>
              </div>

              {/* Current Inventory Table */}
              <div className="admin-card" style={{ overflow: 'hidden' }}>
                <h2 className="admin-card-title">Current Inventory</h2>
                <div className="inventory-table-wrap">
                  <table className="inventory-table">
                    <thead>
                      <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody id="inventoryTableBody">
                      {catalog.map(p => (
                        <tr key={p.id}>
                          <td>
                            <div
                              className="table-img"
                              style={{ background: gradients[p.bg] || gradients['bg-rainbow'] }}
                            >
                              {p.emoji || '🌸'}
                            </div>
                          </td>
                          <td style={{ fontWeight: 600 }}>{p.name}</td>
                          <td>
                            <span style={{ textTransform: 'capitalize' }}>
                              {categories[p.cat] ? categories[p.cat].replace(/[\p{Emoji}\s]/gu, '') : p.cat}
                            </span>
                          </td>
                          <td style={{ fontFamily: 'var(--font-mono)' }}>₹{p.price}</td>
                          <td>
                            <button
                              className="table-action-btn"
                              onClick={() => handleDeleteProduct(p.id)}
                            >
                              <i className="fa-solid fa-trash"></i> Delete
                            </button>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>

            </div>
          </div>
        </div>
      )}

      {/* DETAIL BOTTOM SHEET MODAL */}
      <div
        className={`backdrop ${currentProduct ? 'show' : ''}`}
        onClick={() => setCurrentProduct(null)}
      ></div>
      {currentProduct && (
        <div className={`sheet ${currentProduct ? 'show' : ''}`} id="detailSheet">
          <div className="sheet-drag-handle"></div>
          <div
            className="sheet-close"
            id="closeSheetBtn"
            onClick={() => setCurrentProduct(null)}
          >
            <i className="fa-solid fa-xmark"></i>
          </div>
          <div
            className="sheet-image-wrap"
            id="sheetImgWrap"
            style={{ 
              background: currentProduct.image_url ? 'none' : (gradients[currentProduct.bg] || gradients['bg-rainbow']),
              overflow: 'hidden'
            }}
          >
            {currentProduct.image_url ? (
              <img src={currentProduct.image_url} alt={currentProduct.name} style={{ width: '100%', height: '100%', objectFit: 'cover' }} />
            ) : (
              currentProduct.emoji || '🌸'
            )}
          </div>
          <h2 className="sheet-name">{currentProduct.name}</h2>
          <div className="sheet-price-row">
            <span className="sheet-price">₹{currentProduct.price}</span>
            {currentProduct.mrp && <span className="sheet-mrp">₹{currentProduct.mrp}</span>}
          </div>
          <p className="sheet-desc">
            {currentProduct.desc || 'Beautiful handcrafted piece from BangleByChoice.'}
          </p>
          
          {currentProduct.cat !== 'materials' && (
            <div id="sizeSelectorWrap">
              <span className="size-selector-label">Select Size</span>
              <div className="size-chips">
                {(currentProduct.sizes || ['2.2', '2.4', '2.6', '2.8']).map(sz => (
                  <div
                    key={sz}
                    className={`size-chip ${currentSize === sz ? 'active' : ''}`}
                    onClick={() => setCurrentSize(sz)}
                  >
                    {sz}
                  </div>
                ))}
              </div>
            </div>
          )}

          <div className="sheet-actions">
            <button
              className="btn btn-secondary"
              id="addToCartBtn"
              onClick={() => {
                handleAddToCart(currentProduct, currentSize);
                setCurrentProduct(null);
              }}
            >
              <i className="fa-solid fa-cart-plus"></i> Add to Bag
            </button>
            <button
              className="btn btn-whatsapp"
              id="directWhatsAppBtn"
              onClick={() => {
                handleDirectWhatsApp(currentProduct, currentSize);
              }}
            >
              <i className="fa-brands fa-whatsapp"></i> Buy via WhatsApp
            </button>
          </div>
        </div>
      )}

      {/* CART PANEL SLIDEOUT */}
      <div
        className={`backdrop ${isCartOpen ? 'show' : ''}`}
        style={{ zIndex: 1001 }}
        onClick={() => setIsCartOpen(false)}
      ></div>
      <div className={`cart-panel ${isCartOpen ? 'show' : ''}`} id="cartPanel">
        <div className="cart-header">
          <h2 className="cart-title">Your Bag</h2>
          <div
            className="cart-close"
            id="closeCartBtn"
            onClick={() => setIsCartOpen(false)}
          >
            <i className="fa-solid fa-xmark"></i>
          </div>
        </div>
        <div className="cart-items" id="cartItemsContainer">
          {cart.length === 0 ? (
            <div className="cart-empty">
              <i className="fa-solid fa-bag-shopping"></i>
              <p>Your bag is empty.</p>
            </div>
          ) : (
            cart.map((item, index) => (
              <div key={`${item.id}-${item.size}`} className="cart-item">
                <div
                  className="cart-item-img"
                  style={{ 
                    background: item.image_url ? 'none' : (gradients[item.bg] || gradients['bg-rainbow']),
                    overflow: 'hidden'
                  }}
                >
                  {item.image_url ? (
                    <img src={item.image_url} alt={item.name} style={{ width: '100%', height: '100%', objectFit: 'cover' }} />
                  ) : (
                    item.emoji || '🌸'
                  )}
                </div>
                <div className="cart-item-info">
                  <h4 className="cart-item-name">{item.name}</h4>
                  <div className="cart-item-meta">
                    {item.size !== 'N/A' ? `Size: ${item.size}` : 'Craft Material'}
                  </div>
                  <div className="cart-item-price">
                    {(() => {
                      const pct = getDiscountPercent(item.qty);
                      if (pct > 0) {
                        const finalPrice = Math.round(item.price * (1 - pct));
                        return (
                          <>
                            <span style={{ textDecoration: 'line-through', color: 'var(--ink-light)', marginRight: '6px', fontSize: '12px' }}>₹{item.price}</span>
                            <span style={{ color: '#E3244D' }}>₹{finalPrice} (-{pct * 100}%)</span>
                          </>
                        );
                      }
                      return `₹${item.price}`;
                    })()}
                  </div>
                  <div className="cart-item-qty">
                    <button
                      className="qty-btn"
                      onClick={() => handleUpdateQty(index, -1)}
                    >
                      <i className="fa-solid fa-minus"></i>
                    </button>
                    <span className="qty-val">{item.qty}</span>
                    <button
                      className="qty-btn"
                      onClick={() => handleUpdateQty(index, 1)}
                    >
                      <i className="fa-solid fa-plus"></i>
                    </button>
                  </div>
                </div>
              </div>
            ))
          )}
        </div>
        
        {cart.length > 0 && (
          (() => {
            let total = 0;
            let totalSavings = 0;
            cart.forEach(item => {
              const discountPct = getDiscountPercent(item.qty);
              const discountMultiplier = 1 - discountPct;
              const finalPrice = Math.round(item.price * discountMultiplier);
              const lineTotal = finalPrice * item.qty;
              const baseSavings = item.mrp ? (item.mrp - item.price) * item.qty : 0;
              const volSavings = (item.price - finalPrice) * item.qty;
              totalSavings += baseSavings + volSavings;
              total += lineTotal;
            });
            return (
              <div className="cart-footer" id="cartFooter">
                <div className="cart-total-row">
                  <span>Total Amount:</span>
                  <span id="cartTotalPrice">₹{total}</span>
                </div>
                {totalSavings > 0 && (
                  <div className="cart-total-row" style={{ color: '#10b981', fontSize: '14px', marginTop: '4px' }}>
                    <span>You Save:</span>
                    <span>₹{totalSavings} 🎉</span>
                  </div>
                )}
                <form onSubmit={handleCheckoutCart} style={{ marginTop: '16px' }}>
                  <div className="cart-form-field">
                    <input type="text" id="custName" placeholder="Your Name" required />
                  </div>
                  <div className="cart-form-field">
                    <textarea id="custAddress" rows={2} placeholder="Delivery Address (with Pincode)" required></textarea>
                  </div>
                  <button
                    type="submit"
                    className="btn btn-whatsapp"
                    id="checkoutBtn"
                    style={{ width: '100%' }}
                  >
                    <i className="fa-brands fa-whatsapp"></i> Order on WhatsApp
                  </button>
                </form>
              </div>
            );
          })()
        )}
      </div>

      {/* SEARCH OVERLAY */}
      <div className={`search-overlay ${isSearchOpen ? 'show' : ''}`} id="searchOverlay">
        <div className="container">
          <div className="search-input-wrap">
            <input
              type="text"
              className="search-input"
              id="searchInputField"
              placeholder="Search bangles or materials..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
            <div
              className="search-close-btn"
              id="closeSearchBtn"
              onClick={() => {
                setIsSearchOpen(false);
                setSearchQuery('');
              }}
            >
              <i className="fa-solid fa-xmark"></i>
            </div>
          </div>
          
          <div className="products-grid" id="searchResultsGrid">
            {searchResults.map(p => (
              <div
                key={p.id}
                className="product-card"
                onClick={() => {
                  setIsSearchOpen(false);
                  setSearchQuery('');
                  setCurrentProduct(p);
                  const sizesSupported = p.sizes || ['2.2', '2.4', '2.6', '2.8'];
                  setCurrentSize(sizesSupported[0] || 'N/A');
                }}
              >
                <div className="card-image-wrap">
                  <div
                    className="card-img-placeholder"
                    style={{ background: gradients[p.bg] || gradients['bg-rainbow'] }}
                  >
                    {p.emoji || '🌸'}
                  </div>
                </div>
                <div className="card-body">
                  <h3 className="card-name">{p.name}</h3>
                  <div className="card-meta">
                    <span className="card-price">₹{p.price}</span>
                  </div>
                </div>
              </div>
            ))}
            {searchQuery.trim() !== '' && searchResults.length === 0 && (
              <div style={{ gridColumn: '1 / -1', textAlign: 'center', color: 'var(--ink-light)' }}>
                No matching items found.
              </div>
            )}
          </div>
        </div>
      </div>

      {/* TOAST NOTIFICATIONS */}
      <div className={`toast ${toastMessage !== '' ? 'show' : ''}`} id="toast">
        <i className="fa-solid fa-circle-check toast-icon"></i>
        <span id="toastMessage">{toastMessage}</span>
      </div>

      {/* FOOTER */}
      <footer>
        <div className="container footer-wrap">
          <img src="/banglebychoice_logo.png" className="footer-logo" alt="BangleByChoice Logo" />
          <p>&copy; 2026 BangleByChoice. All Rights Reserved. Crafted with love.</p>
        </div>
      </footer>

      {/* MOBILE BOTTOM NAV */}
      <nav className="mobile-bottom-nav">
        <button
          className={`nav-tab ${!isAdminOpen ? 'active' : ''}`}
          id="mobTabHome"
          onClick={() => {
            setIsAdminOpen(false);
            window.scrollTo({ top: 0, behavior: 'smooth' });
          }}
        >
          <i className="fa-solid fa-house"></i>
          <span>Home</span>
        </button>
        <button
          className="nav-tab"
          id="mobTabShop"
          onClick={() => {
            setIsAdminOpen(false);
            document.getElementById('productsArea').scrollIntoView({ behavior: 'smooth' });
          }}
        >
          <i className="fa-solid fa-bag-shopping"></i>
          <span>Shop</span>
        </button>
        <button
          className="nav-tab"
          id="mobTabCart"
          onClick={() => setIsCartOpen(true)}
        >
          <i className="fa-solid fa-cart-shopping"></i>
          <span
            className="badge"
            id="mobCartBadgeCount"
            style={{ display: cart.reduce((sum, item) => sum + item.qty, 0) > 0 ? 'flex' : 'none' }}
          >
            {cart.reduce((sum, item) => sum + item.qty, 0)}
          </span>
          <span>Bag</span>
        </button>
        <button
          className={`nav-tab ${isAdminOpen ? 'active' : ''}`}
          id="mobTabAdmin"
          onClick={() => {
            if (isAdminOpen) {
              setIsAdminOpen(false);
            } else {
              triggerAdminLogin();
            }
          }}
        >
          <i className="fa-solid fa-user-gear"></i>
          <span>Admin</span>
        </button>
      </nav>
    </>
  );
}
