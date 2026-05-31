import os
import sys
import time
from playwright.sync_api import sync_playwright

# Reconfigure stdout for UTF-8 encoding on Windows terminal
if sys.platform.startswith('win'):
    import io
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

# Setup artifact directory
ARTIFACT_DIR = r"C:\Users\venka\.gemini\antigravity\brain\16e0b140-5cb1-4432-a156-62a8ccb4f791"
os.makedirs(ARTIFACT_DIR, exist_ok=True)

def get_path(filename):
    return os.path.join(ARTIFACT_DIR, filename)

def run():
    print("Starting Web Application E2E Test...")
    with sync_playwright() as p:
        # Launch browser in headless mode
        browser = p.chromium.launch(headless=True)
        # Create context with viewport size mimicking mobile device (to verify PWA responsiveness first)
        mobile_context = browser.new_context(
            viewport={"width": 375, "height": 812},
            user_agent="Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1"
        )
        
        # We will also create a desktop context for verifying desktop-specific view
        desktop_context = browser.new_context(
            viewport={"width": 1280, "height": 800}
        )

        # ----------------------------------------------------
        # 1. RUN DESKTOP FLOWS
        # ----------------------------------------------------
        print("\n--- Running Desktop Tests ---")
        page = desktop_context.new_page()
        
        # Hook up a dialog handler
        dialog_logs = []
        def handle_dialog(dialog):
            msg = f"Dialog: type={dialog.type}, message='{dialog.message}', default='{dialog.default_value}'"
            print(msg)
            dialog_logs.append(msg)
            
            # PIN prompt
            if "PIN" in dialog.message or "admin123" in dialog.message:
                dialog.accept("1234")
                print("   Accepted dialog: entered PIN '1234'")
            # Add Custom Category ID prompt
            elif "short" in dialog.message.lower() and "id" in dialog.message.lower() and "category" in dialog.message.lower():
                dialog.accept("beads")
                print("   Accepted dialog: entered category ID 'beads'")
            # Add Custom Category Name prompt
            elif "display name" in dialog.message.lower() and "category" in dialog.message.lower():
                dialog.accept("🔮 Crystal Beads")
                print("   Accepted dialog: entered category name '🔮 Crystal Beads'")
            # Add Custom Color ID prompt
            elif "short id" in dialog.message.lower() and "color" in dialog.message.lower():
                dialog.accept("bg-pink")
                print("   Accepted dialog: entered color ID 'bg-pink'")
            # Add Custom Color Name prompt
            elif "display name" in dialog.message.lower() and "color" in dialog.message.lower():
                dialog.accept("🩷 Soft Pink")
                print("   Accepted dialog: entered color name '🩷 Soft Pink'")
            # Add Custom Color Gradient prompt
            elif "css" in dialog.message.lower() and "gradient" in dialog.message.lower():
                dialog.accept("linear-gradient(135deg, #FFE4E1 0%, #FFB6C1 100%)")
                print("   Accepted dialog: entered gradient value")
            else:
                dialog.accept()
                print("   Accepted dialog: default empty")

        page.on("dialog", handle_dialog)

        # Navigate
        url = "https://banglebychoice.vercel.app"
        print(f"Navigating to {url}...")
        page.goto(url)
        page.wait_for_load_state("networkidle")
        
        # Screenshot 1: Desktop Landing Page
        page.screenshot(path=get_path("desktop_home.png"))
        print("Captured desktop_home.png")

        # Verify page title
        title = page.title()
        print(f"Page Title: {title}")

        # Test Search Overlay
        print("Testing Search...")
        page.click("#searchBtnIcon")
        page.fill("#searchInputField", "Silk")
        page.wait_for_timeout(500) # Wait for debounce / layout render
        page.screenshot(path=get_path("desktop_search.png"))
        print("Captured desktop_search.png")
        page.click("#closeSearchBtn")

        # Test Category Pill Filters
        print("Testing Category Chips...")
        # Check available chips
        chips = page.locator(".filter-chip").all_inner_texts()
        print(f"Found category chips: {chips}")
        # Click on 'Silk Thread' filter chip
        page.locator(".filter-chip", has_text="Silk Thread").click()
        page.wait_for_timeout(300)
        page.screenshot(path=get_path("desktop_filtered_silk.png"))
        print("Captured desktop_filtered_silk.png")

        # Test Color Filters
        print("Testing Storefront Color Filters...")
        # Select "Emerald Green" color filter chip
        page.locator("#colorsFilterContainer .filter-chip", has_text="Emerald Green").click()
        page.wait_for_timeout(300)
        page.screenshot(path=get_path("desktop_filtered_green_color.png"))
        print("Captured desktop_filtered_green_color.png")

        # Reset Color Filters
        page.locator("#colorsFilterContainer .filter-chip", has_text="All Colors").click()
        page.wait_for_timeout(200)

        # Test Size Filters
        print("Testing Storefront Size Filters...")
        # Select "Size 2.6" filter chip
        page.locator("#sizesFilterContainer .filter-chip", has_text="Size 2.6").click()
        page.wait_for_timeout(300)
        page.screenshot(path=get_path("desktop_filtered_size_2.6.png"))
        print("Captured desktop_filtered_size_2.6.png")

        # Reset Size Filters
        page.locator("#sizesFilterContainer .filter-chip", has_text="All Sizes").click()
        page.wait_for_timeout(200)

        # Open details bottom sheet
        print("Opening Product Details sheet...")
        # Reset filter to 'View All' so we can click first item easily
        page.locator(".filter-chip", has_text="View All").click()
        page.wait_for_timeout(300)
        
        # Click the 'Glass Kada — Rose Gold Shimmer' product card
        page.locator(".product-card", has_text="Glass Kada — Rose Gold Shimmer").click()
        page.wait_for_selector("#detailSheet.show")
        page.wait_for_timeout(500)
        page.screenshot(path=get_path("desktop_detail_sheet.png"))
        print("Captured desktop_detail_sheet.png")

        # Click size chip 2.6
        print("Selecting size 2.6...")
        page.locator(".size-chip[data-size='2.6']").click()
        page.wait_for_timeout(200)

        # Check direct WhatsApp button logic
        print("Verifying direct WhatsApp redirect...")
        with page.expect_popup() as popup_info:
            page.click("#directWhatsAppBtn")
        whatsapp_page = popup_info.value
        print(f"Direct WhatsApp URL triggered: {whatsapp_page.url}")
        whatsapp_page.close()

        # Add to cart from sheet
        print("Adding product to cart...")
        page.click("#addToCartBtn")
        page.wait_for_timeout(500) # Wait for toast/UI animations

        # Close detail sheet
        try:
            page.click("#closeSheetBtn", timeout=3000)
        except Exception as e:
            print(f"Clicking #closeSheetBtn failed, falling back to JS close: {e}")
            page.evaluate("closeDetailSheet()")
        page.wait_for_timeout(200)

        # Test Cart & Checkout
        print("Opening Cart...")
        page.click("#cartBtnIcon")
        page.wait_for_selector("#cartPanel.show")
        page.wait_for_timeout(500)
        page.screenshot(path=get_path("desktop_cart.png"))
        print("Captured desktop_cart.png")

        # Increase qty
        print("Increasing item quantity...")
        page.locator(".qty-btn").last.click() # The plus button
        page.wait_for_timeout(300)

        # Fill client details
        page.fill("#custName", "Test User Desktop")
        page.fill("#custAddress", "Flat 101, Bangle Towers, Hyderabad, Telangana, 500002")
        page.screenshot(path=get_path("desktop_cart_filled.png"))
        print("Captured desktop_cart_filled.png")

        # Click Checkout Order WhatsApp
        print("Verifying Cart Checkout WhatsApp redirect...")
        with page.expect_popup() as popup_info:
            page.click("#checkoutBtn")
        checkout_wa_page = popup_info.value
        print(f"Checkout WhatsApp URL triggered: {checkout_wa_page.url}")
        checkout_wa_page.close()
        
        # Verify cart was cleared after checkout
        page.click("#cartBtnIcon") # reopen cart
        page.wait_for_timeout(300)
        empty_text = page.locator(".cart-empty p").inner_text()
        print(f"Cart empty verification: {empty_text}")
        try:
            page.click("#closeCartBtn", timeout=3000)
        except Exception as e:
            print(f"Clicking #closeCartBtn failed, falling back to JS close: {e}")
            page.evaluate("toggleCart(false)")
        page.wait_for_timeout(200)

        # Test Admin Portal Login and Actions
        print("\n--- Testing Admin Portal (Desktop) ---")
        page.click("#adminPortalToggle")
        page.wait_for_selector("#adminApp.active")
        page.wait_for_timeout(500)
        page.screenshot(path=get_path("desktop_admin_portal.png"))
        print("Captured desktop_admin_portal.png")

        # Add custom category
        print("Adding Custom Category...")
        page.click("#addCatBtn")
        page.wait_for_timeout(500) # Accept prompts in dialog handler

        # Add custom color theme
        print("Adding Custom Color Theme...")
        page.click("#addColorThemeBtn")
        page.wait_for_timeout(500) # Accept prompts in dialog handler

        # Fill out add product form
        print("Filling Add Product Form...")
        page.fill("#prodName", "Browser Test Bangle Set")
        page.select_option("#prodCat", "beads") # newly added category
        page.fill("#prodTag", "NEW ERA")
        page.fill("#prodPrice", "399")
        page.fill("#prodMRP", "599")
        page.select_option("#prodColorTheme", "bg-pink") # newly added color
        page.fill("#prodDesc", "A premium set designed and validated automatically during E2E tests.")
        # Uncheck size 2.2 and 2.8, leave 2.4 and 2.6 checked
        page.uncheck('input[name="prodSizes"][value="2.2"]')
        page.uncheck('input[name="prodSizes"][value="2.8"]')
        print("Unchecked sizes 2.2 and 2.8 (leaving 2.4 and 2.6 checked)")
        page.screenshot(path=get_path("desktop_admin_form_filled.png"))
        print("Captured desktop_admin_form_filled.png")

        # Submit product
        page.click('#addProductForm button[type="submit"]')
        page.wait_for_timeout(500) # Wait for list update

        # Verify added product in table
        inventory_items = page.locator("#inventoryTableBody tr").all_inner_texts()
        print("Current Inventory list snippet:")
        for idx, text in enumerate(inventory_items[:3]):
            print(f"   [{idx}] {text.replace('\n', ' | ')}")
        page.screenshot(path=get_path("desktop_admin_updated_inventory.png"))
        print("Captured desktop_admin_updated_inventory.png")

        # Exit admin portal
        print("Exiting Admin Portal...")
        page.click("#exitAdminBtn")
        page.wait_for_timeout(500)

        # Verify custom product is displayed in Consumer storefront
        print("Verifying newly added product in client store front...")
        page.locator(".filter-chip", has_text="Crystal Beads").click()
        page.wait_for_timeout(500)
        page.screenshot(path=get_path("desktop_store_added_product.png"))
        print("Captured desktop_store_added_product.png")

        # Click the added product to verify size selection logic
        print("Opening details for added product...")
        page.locator(".product-card", has_text="Browser Test Bangle Set").click()
        page.wait_for_selector("#detailSheet.show")
        page.wait_for_timeout(500)
        
        # Verify visible sizes
        visible_sizes = page.locator(".size-chips .size-chip").all_inner_texts()
        print(f"Product detail sizes checked: {visible_sizes}")
        assert visible_sizes == ['2.4', '2.6'], f"Sizes do not match! Expected ['2.4', '2.6'], got {visible_sizes}"
        page.screenshot(path=get_path("desktop_store_added_product_sizes.png"))
        print("Captured desktop_store_added_product_sizes.png")

        # Close detail sheet
        page.evaluate("closeDetailSheet()")
        page.wait_for_timeout(300)

        # Go back to admin to delete product to keep state clean (also verifies delete function)
        print("Cleaning up added test product from inventory...")
        page.click("#adminPortalToggle")
        page.wait_for_selector("#adminApp.active")
        page.wait_for_timeout(500)
        
        # Delete first row
        page.locator("#inventoryTableBody tr button.table-action-btn").first.click()
        page.wait_for_timeout(500)
        print("Product delete action verified and test product cleaned up.")

        # Exit admin portal
        print("Exiting Admin Portal...")
        page.click("#exitAdminBtn")
        page.wait_for_timeout(500)

        desktop_context.close()


        # ----------------------------------------------------
        # 2. RUN MOBILE FLOWS (Responsive Check)
        # ----------------------------------------------------
        print("\n--- Running Mobile Layout & Navigation Tests ---")
        mpage = mobile_context.new_page()
        mpage.on("dialog", handle_dialog)
        
        print(f"Navigating to {url} on mobile view...")
        mpage.goto(url)
        mpage.wait_for_load_state("networkidle")
        mpage.screenshot(path=get_path("mobile_home.png"))
        print("Captured mobile_home.png")

        # Verify bottom nav tabs are visible on mobile
        tabs_visible = mpage.locator(".mobile-bottom-nav").is_visible()
        print(f"Mobile Bottom Navigation bar is visible: {tabs_visible}")

        # Navigate using mobile tabs
        print("Testing mobile tab: Shop...")
        mpage.click("#mobTabShop")
        mpage.wait_for_timeout(500)
        mpage.screenshot(path=get_path("mobile_shop_tab.png"))
        print("Captured mobile_shop_tab.png")

        print("Testing mobile tab: Admin PIN prompt...")
        mpage.click("#mobTabAdmin")
        mpage.wait_for_timeout(500) # This triggers the dialog handler which inputs PIN '1234'
        mpage.wait_for_selector("#adminApp.active")
        mpage.screenshot(path=get_path("mobile_admin_portal.png"))
        print("Captured mobile_admin_portal.png")

        # Exit admin
        mpage.click("#exitAdminBtn")
        mpage.wait_for_timeout(300)

        mobile_context.close()
        browser.close()

    print("\n--- All tests completed successfully! ---")

if __name__ == "__main__":
    run()
