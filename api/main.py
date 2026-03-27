# ============================================================
# PROJECT    : TerraStone Data Platform
# FILE       : main.py
# DESCRIPTION: Fake Online Sales API using FastAPI
# AUTHOR     : TerraStone Team
# DATE       : 2026-03-25
# VERSION    : 1.1 — Added /customers, /orders/{id}/items, /suppliers
# NOTE       : Data intentionally contains dirty/messy records
#              for Silver layer cleaning practice
# ============================================================

from fastapi import FastAPI
from typing import Optional

app = FastAPI(
    title="TerraStone Online Sales API",
    description="Fake API simulating international online sales for TerraStone marble and tile operations",
    version="1.1.0"
)

# ============================================================
# ONLINE SALES DATA — dirty and messy intentionally
# Issues: duplicates, nulls, negative values, wrong date formats,
#         inconsistent casing, junk customer_id values
# ============================================================
online_sales = [
    {"order_id": "ORD-1001", "customer_id": "CUST-01", "product_id": "SKU-001", "quantity": 10, "amount": 2500.00, "currency": "USD", "order_date": "2026-01-15", "country": "USA", "channel": "web", "status": "Delivered", "discount": 0.00},
    {"order_id": "ORD-1002", "customer_id": "CUST-02", "product_id": "SKU-002", "quantity": 5, "amount": 900.50, "currency": "EUR", "order_date": "2026-01-16", "country": "Italy", "channel": "mobile", "status": "delivered", "discount": 50.00},
    {"order_id": "ORD-1003", "customer_id": None, "product_id": "SKU-003", "quantity": 8, "amount": None, "currency": "GBP", "order_date": "2026-01-17", "country": "UK", "channel": "web", "status": None, "discount": None},
    {"order_id": "ORD-1004", "customer_id": "CUST-04", "product_id": "SKU-001", "quantity": -3, "amount": -750.00, "currency": "usd", "order_date": "2026-01-18", "country": "usa", "channel": "WEB", "status": "Cancelled", "discount": 0.00},
    {"order_id": "ORD-1005", "customer_id": "CUST-05", "product_id": "SKU-004", "quantity": 15, "amount": 3200.00, "currency": "AED", "order_date": "17-01-2026", "country": "UAE", "channel": "web", "status": "DELIVERED", "discount": 100.00},
    {"order_id": "ORD-1006", "customer_id": "CUST-06", "product_id": "SKU-005", "quantity": 6, "amount": 1440.00, "currency": "INR", "order_date": "2026/01/19", "country": "india", "channel": "mobile", "status": "Pending", "discount": 0.00},
    {"order_id": "ORD-1002", "customer_id": "CUST-02", "product_id": "SKU-002", "quantity": 5, "amount": 900.50, "currency": "EUR", "order_date": "2026-01-16", "country": "Italy", "channel": "mobile", "status": "delivered", "discount": 50.00},
    {"order_id": "ORD-1007", "customer_id": "CUST-07", "product_id": "SKU-006", "quantity": 20, "amount": 4800.00, "currency": "JPY", "order_date": "2026-01-20", "country": "Japan", "channel": "web", "status": "Delivered", "discount": 200.00},
    {"order_id": "ORD-1008", "customer_id": "N/A", "product_id": "SKU-007", "quantity": 4, "amount": 520.00, "currency": "AUD", "order_date": "2026-01-21", "country": "Australia", "channel": "web", "status": "Delivered", "discount": 0.00},
    {"order_id": "ORD-1009", "customer_id": "CUST-09", "product_id": None, "quantity": None, "amount": None, "currency": None, "order_date": None, "country": None, "channel": None, "status": None, "discount": None},
    {"order_id": "ORD-1010", "customer_id": "CUST-10", "product_id": "SKU-008", "quantity": 12, "amount": 2880.00, "currency": "SAR", "order_date": "2026-01-23", "country": "Saudi Arabia", "channel": "mobile", "status": "pending", "discount": 0.00},
    {"order_id": "ORD-1011", "customer_id": "CUST-11", "product_id": "SKU-001", "quantity": 7, "amount": 1750.00, "currency": "USD", "order_date": "2026-01-24", "country": "Canada", "channel": "web", "status": "Delivered", "discount": 75.00},
    {"order_id": "ORD-1012", "customer_id": "CUST-12", "product_id": "SKU-009", "quantity": 9, "amount": 2250.00, "currency": "CNY", "order_date": "2026-01-25", "country": "CHINA", "channel": "MOBILE", "status": "DELIVERED", "discount": 0.00},
    {"order_id": "ORD-1013", "customer_id": "CUST-13", "product_id": "SKU-010", "quantity": 3, "amount": 690.00, "currency": "SGD", "order_date": "2026-01-26", "country": "Singapore", "channel": "web", "status": "Delivered", "discount": 30.00},
    {"order_id": "ORD-1014", "customer_id": "CUST-14", "product_id": "SKU-002", "quantity": 11, "amount": 1980.00, "currency": "EUR", "order_date": "2026-01-27", "country": "Germany", "channel": "web", "status": "Returned", "discount": 0.00},
    {"order_id": "ORD-1010", "customer_id": "CUST-10", "product_id": "SKU-008", "quantity": 12, "amount": 2880.00, "currency": "SAR", "order_date": "2026-01-23", "country": "Saudi Arabia", "channel": "mobile", "status": "pending", "discount": 0.00},
    {"order_id": "ORD-1015", "customer_id": "CUST-15", "product_id": "SKU-003", "quantity": 5, "amount": 1125.00, "currency": "GBP", "order_date": "2026-01-28", "country": "UK", "channel": "mobile", "status": "Delivered", "discount": 0.00},
    {"order_id": "ORD-1016", "customer_id": "not available", "product_id": "SKU-011", "quantity": 8, "amount": 960.00, "currency": "USD", "order_date": "2026-01-29", "country": "USA", "channel": "web", "status": "delivered", "discount": 0.00},
    {"order_id": "ORD-1017", "customer_id": "CUST-17", "product_id": "SKU-012", "quantity": -2, "amount": -480.00, "currency": "EUR", "order_date": "2026-01-30", "country": "France", "channel": "web", "status": "Cancelled", "discount": 0.00},
    {"order_id": "ORD-1018", "customer_id": "CUST-18", "product_id": "SKU-005", "quantity": 14, "amount": 3360.00, "currency": "inr", "order_date": "31-01-2026", "country": "INDIA", "channel": "Mobile", "status": "PENDING", "discount": 150.00},
    {"order_id": "ORD-1019", "customer_id": "CUST-19", "product_id": "SKU-006", "quantity": 6, "amount": 1440.00, "currency": "JPY", "order_date": "2026-02-01", "country": "Japan", "channel": "web", "status": "Delivered", "discount": 0.00},
    {"order_id": "ORD-1020", "customer_id": "CUST-20", "product_id": "SKU-013", "quantity": 10, "amount": 2200.00, "currency": "AED", "order_date": "2026-02-02", "country": "UAE", "channel": "mobile", "status": "delivered", "discount": 200.00},
]

# ============================================================
# ORDER ITEMS DATA — multiple products per order
# Issues: nulls, negative unit prices, missing order references
# ============================================================
order_items = [
    {"item_id": "ITEM-001", "order_id": "ORD-1001", "product_id": "SKU-001", "quantity": 6, "unit_price": 250.00, "total_amount": 1500.00, "currency": "USD", "discount": 0.00},
    {"item_id": "ITEM-002", "order_id": "ORD-1001", "product_id": "SKU-005", "quantity": 4, "unit_price": 250.00, "total_amount": 1000.00, "currency": "USD", "discount": 0.00},
    {"item_id": "ITEM-003", "order_id": "ORD-1002", "product_id": "SKU-002", "quantity": 3, "unit_price": 180.10, "total_amount": 540.30, "currency": "EUR", "discount": 50.00},
    {"item_id": "ITEM-004", "order_id": "ORD-1002", "product_id": "SKU-012", "quantity": 2, "unit_price": 180.10, "total_amount": 360.20, "currency": "EUR", "discount": 0.00},
    {"item_id": "ITEM-005", "order_id": "ORD-1003", "product_id": "SKU-003", "quantity": 8, "unit_price": None, "total_amount": None, "currency": "GBP", "discount": None},
    {"item_id": "ITEM-006", "order_id": "ORD-1004", "product_id": "SKU-001", "quantity": -3, "unit_price": 250.00, "total_amount": -750.00, "currency": "usd", "discount": 0.00},
    {"item_id": "ITEM-007", "order_id": "ORD-1005", "product_id": "SKU-004", "quantity": 10, "unit_price": 180.00, "total_amount": 1800.00, "currency": "AED", "discount": 100.00},
    {"item_id": "ITEM-008", "order_id": "ORD-1005", "product_id": "SKU-008", "quantity": 5, "unit_price": 280.00, "total_amount": 1400.00, "currency": "AED", "discount": 0.00},
    {"item_id": "ITEM-009", "order_id": "ORD-1006", "product_id": "SKU-005", "quantity": 6, "unit_price": 240.00, "total_amount": 1440.00, "currency": "INR", "discount": 0.00},
    {"item_id": "ITEM-010", "order_id": "ORD-1007", "product_id": "SKU-006", "quantity": 12, "unit_price": 200.00, "total_amount": 2400.00, "currency": "JPY", "discount": 200.00},
    {"item_id": "ITEM-011", "order_id": "ORD-1007", "product_id": "SKU-013", "quantity": 8, "unit_price": 300.00, "total_amount": 2400.00, "currency": "JPY", "discount": 0.00},
    {"item_id": "ITEM-012", "order_id": "ORD-1008", "product_id": "SKU-007", "quantity": 4, "unit_price": 130.00, "total_amount": 520.00, "currency": "AUD", "discount": 0.00},
    {"item_id": "ITEM-013", "order_id": "ORD-1009", "product_id": None, "quantity": None, "unit_price": None, "total_amount": None, "currency": None, "discount": None},
    {"item_id": "ITEM-014", "order_id": "ORD-1010", "product_id": "SKU-008", "quantity": 12, "unit_price": 240.00, "total_amount": 2880.00, "currency": "SAR", "discount": 0.00},
    {"item_id": "ITEM-015", "order_id": "ORD-1011", "product_id": "SKU-001", "quantity": 4, "unit_price": 250.00, "total_amount": 1000.00, "currency": "USD", "discount": 75.00},
    {"item_id": "ITEM-016", "order_id": "ORD-1011", "product_id": "SKU-017", "quantity": 3, "unit_price": 250.00, "total_amount": 750.00, "currency": "USD", "discount": 0.00},
    {"item_id": "ITEM-017", "order_id": "ORD-1012", "product_id": "SKU-009", "quantity": 9, "unit_price": 250.00, "total_amount": 2250.00, "currency": "CNY", "discount": 0.00},
    {"item_id": "ITEM-018", "order_id": "ORD-1013", "product_id": "SKU-010", "quantity": 3, "unit_price": 230.00, "total_amount": 690.00, "currency": "SGD", "discount": 30.00},
    {"item_id": "ITEM-019", "order_id": "ORD-1014", "product_id": "SKU-002", "quantity": 7, "unit_price": 180.00, "total_amount": 1260.00, "currency": "EUR", "discount": 0.00},
    {"item_id": "ITEM-020", "order_id": "ORD-1014", "product_id": "SKU-012", "quantity": 4, "unit_price": 180.00, "total_amount": 720.00, "currency": "EUR", "discount": 0.00},
    {"item_id": "ITEM-021", "order_id": "ORD-9999", "product_id": "SKU-001", "quantity": 5, "unit_price": 250.00, "total_amount": 1250.00, "currency": "USD", "discount": 0.00},
    {"item_id": "ITEM-022", "order_id": "ORD-1015", "product_id": "SKU-003", "quantity": 5, "unit_price": 225.00, "total_amount": 1125.00, "currency": "GBP", "discount": 0.00},
    {"item_id": "ITEM-023", "order_id": "ORD-1016", "product_id": "SKU-011", "quantity": 8, "unit_price": 120.00, "total_amount": 960.00, "currency": "USD", "discount": 0.00},
    {"item_id": "ITEM-024", "order_id": "ORD-1017", "product_id": "SKU-012", "quantity": -2, "unit_price": 240.00, "total_amount": -480.00, "currency": "EUR", "discount": 0.00},
    {"item_id": "ITEM-025", "order_id": "ORD-1018", "product_id": "SKU-005", "quantity": 14, "unit_price": 240.00, "total_amount": 3360.00, "currency": "inr", "discount": 150.00},
    {"item_id": "ITEM-026", "order_id": "ORD-1019", "product_id": "SKU-006", "quantity": 6, "unit_price": 240.00, "total_amount": 1440.00, "currency": "JPY", "discount": 0.00},
    {"item_id": "ITEM-027", "order_id": "ORD-1020", "product_id": "SKU-013", "quantity": 6, "unit_price": 200.00, "total_amount": 1200.00, "currency": "AED", "discount": 200.00},
    {"item_id": "ITEM-028", "order_id": "ORD-1020", "product_id": "SKU-017", "quantity": 4, "unit_price": 250.00, "total_amount": 1000.00, "currency": "AED", "discount": 0.00},
    {"item_id": "ITEM-024", "order_id": "ORD-1017", "product_id": "SKU-012", "quantity": -2, "unit_price": 240.00, "total_amount": -480.00, "currency": "EUR", "discount": 0.00},
]

# ============================================================
# ONLINE CUSTOMERS DATA — dirty and messy intentionally
# Issues: duplicates, nulls, junk values, inconsistent casing,
#         invalid phone numbers, extra whitespace
# ============================================================
online_customers = [
    {"customer_id": "CUST-01", "customer_name": "James Carter", "customer_type": "B2C", "email": "james.carter@email.com", "city": "New York", "country": "USA", "phone": "+12125551234"},
    {"customer_id": "CUST-02", "customer_name": "Giulia Russo", "customer_type": "B2C", "email": "giulia.russo@email.it", "city": "Rome", "country": "Italy", "phone": "+390612345678"},
    {"customer_id": "CUST-03", "customer_name": "GIULIA RUSSO", "customer_type": "b2c", "email": "giulia.russo@email.it", "city": "rome", "country": "italy", "phone": "390612345678"},
    {"customer_id": "CUST-04", "customer_name": "N/A", "customer_type": None, "email": None, "city": None, "country": "USA", "phone": None},
    {"customer_id": "CUST-05", "customer_name": "Khalid Al Mansoori", "customer_type": "B2B", "email": "khalid@almansoori.ae", "city": "Abu Dhabi", "country": "UAE", "phone": "+97126543210"},
    {"customer_id": "CUST-06", "customer_name": "  Priya Nair  ", "customer_type": "B2C", "email": "priya.nair@email.in", "city": "  Mumbai  ", "country": "India", "phone": "000000"},
    {"customer_id": "CUST-07", "customer_name": "Hiroshi Tanaka", "customer_type": "B2B", "email": "hiroshi@tanaka.jp", "city": "Osaka", "country": "Japan", "phone": "+81667891234"},
    {"customer_id": "CUST-08", "customer_name": "not available", "customer_type": None, "email": None, "city": None, "country": "Australia", "phone": None},
    {"customer_id": "CUST-09", "customer_name": "Fatima Al Hashmi", "customer_type": "B2C", "email": "fatima@email.ae", "city": "Sharjah", "country": "UAE", "phone": "+97165432109"},
    {"customer_id": "CUST-10", "customer_name": "Abdullah Al Qahtani", "customer_type": "B2B", "email": "abdullah@qahtani.sa", "city": "Jeddah", "country": "Saudi Arabia", "phone": "+966126543210"},
    {"customer_id": "CUST-11", "customer_name": "Sophie Tremblay", "customer_type": "B2C", "email": "sophie@tremblay.ca", "city": "Montreal", "country": "Canada", "phone": "+15141234567"},
    {"customer_id": "CUST-12", "customer_name": "WANG LEI", "customer_type": "B2B", "email": "wang.lei@company.cn", "city": "BEIJING", "country": "CHINA", "phone": "+861012345678"},
    {"customer_id": "CUST-13", "customer_name": "Lim Wei Jie", "customer_type": "B2C", "email": "lim.weijie@email.sg", "city": "Singapore", "country": "Singapore", "phone": "+6591234567"},
    {"customer_id": "CUST-14", "customer_name": "Klaus Muller", "customer_type": "B2B", "email": "N/A", "city": "Berlin", "country": "Germany", "phone": "+4930123456"},
    {"customer_id": "CUST-15", "customer_name": "Emma Williams", "customer_type": "B2C", "email": "emma.williams@email.co.uk", "city": "Manchester", "country": "UK", "phone": "N/A"},
    {"customer_id": "CUST-16", "customer_name": None, "customer_type": None, "email": None, "city": None, "country": None, "phone": None},
    {"customer_id": "CUST-17", "customer_name": "Marie Dupont", "customer_type": "b2c", "email": "marie.dupont@email.fr", "city": "paris", "country": "France", "phone": "+33123456789"},
    {"customer_id": "CUST-18", "customer_name": "Amit Sharma", "customer_type": "B2B", "email": "amit.sharma@business.in", "city": "Delhi", "country": "INDIA", "phone": "+911123456789"},
    {"customer_id": "CUST-19", "customer_name": "Yuki Nakamura", "customer_type": "B2C", "email": "yuki.nakamura@email.jp", "city": "Tokyo", "country": "Japan", "phone": "+81312345678"},
    {"customer_id": "CUST-20", "customer_name": "Ahmed Al Mazrouei", "customer_type": "B2B", "email": "ahmed@almazrouei.ae", "city": "Dubai", "country": "UAE", "phone": "+971412345678"},
    {"customer_id": "CUST-01", "customer_name": "James Carter", "customer_type": "B2C", "email": "james.carter@email.com", "city": "New York", "country": "USA", "phone": "+12125551234"},
]

# ============================================================
# PRODUCT CATALOGUE DATA — dirty and messy intentionally
# ============================================================
product_catalogue = [
    {"sku_id": "SKU-001", "product_name": "Carrara White Marble", "category": "Marble", "sub_category": "Floor", "unit_price": 250.00, "origin_country": "Italy", "supplier_id": "SUP-01"},
    {"sku_id": "SKU-002", "product_name": "CARRARA WHITE MARBLE", "category": "marble", "sub_category": "floor", "unit_price": 250.00, "origin_country": "italy", "supplier_id": "SUP-01"},
    {"sku_id": "SKU-003", "product_name": "Black Galaxy Granite", "category": "Granite", "sub_category": "Wall", "unit_price": 180.50, "origin_country": "India", "supplier_id": "SUP-02"},
    {"sku_id": "SKU-004", "product_name": "Desert Gold Marble", "category": "MARBLE", "sub_category": "FLOOR", "unit_price": -500.00, "origin_country": "UAE", "supplier_id": "SUP-03"},
    {"sku_id": "SKU-005", "product_name": "Ceramic Floor Tile", "category": "Tile", "sub_category": "Floor", "unit_price": 45.00, "origin_country": "China", "supplier_id": "SUP-04"},
    {"sku_id": "SKU-006", "product_name": "Porcelain Wall Tile", "category": "Tile", "sub_category": "Wall", "unit_price": 60.00, "origin_country": "UK", "supplier_id": "SUP-05"},
    {"sku_id": "SKU-007", "product_name": "Travertine Classic", "category": "Marble", "sub_category": "Floor", "unit_price": None, "origin_country": "Turkey", "supplier_id": "SUP-06"},
    {"sku_id": "SKU-008", "product_name": "Onyx Green Marble", "category": "Marble", "sub_category": "Wall", "unit_price": 450.00, "origin_country": "Turkey", "supplier_id": "SUP-06"},
    {"sku_id": "SKU-009", "product_name": "Sandstone Beige", "category": "Stone", "sub_category": "Outdoor", "unit_price": 95.00, "origin_country": "Australia", "supplier_id": "SUP-07"},
    {"sku_id": "SKU-010", "product_name": "Mosaic Glass Tile", "category": "Tile", "sub_category": "Wall", "unit_price": 120.00, "origin_country": "China", "supplier_id": "SUP-04"},
    {"sku_id": "SKU-011", "product_name": "unknown", "category": None, "sub_category": None, "unit_price": None, "origin_country": None, "supplier_id": None},
    {"sku_id": "SKU-012", "product_name": "Italian Statuario", "category": "Marble", "sub_category": "Floor", "unit_price": 580.00, "origin_country": "Italy", "supplier_id": "SUP-01"},
    {"sku_id": "SKU-013", "product_name": "Calacatta Gold Marble", "category": "Marble", "sub_category": "Floor", "unit_price": 750.00, "origin_country": "Italy", "supplier_id": "SUP-01"},
    {"sku_id": "SKU-014", "product_name": "CALACATTA GOLD MARBLE", "category": "MARBLE", "sub_category": "FLOOR", "unit_price": 750.00, "origin_country": "ITALY", "supplier_id": "SUP-01"},
    {"sku_id": "SKU-015", "product_name": "Basalt Black Stone", "category": "Stone", "sub_category": "Outdoor", "unit_price": 110.00, "origin_country": "China", "supplier_id": "SUP-04"},
    {"sku_id": "SKU-016", "product_name": "Norwegian Slate", "category": "Stone", "sub_category": "Outdoor", "unit_price": -200.00, "origin_country": "Norway", "supplier_id": None},
    {"sku_id": "SKU-017", "product_name": "Emperador Dark Marble", "category": "Marble", "sub_category": "Floor", "unit_price": 320.00, "origin_country": "Spain", "supplier_id": "SUP-08"},
    {"sku_id": "SKU-018", "product_name": "Limestone Classic", "category": "Stone", "sub_category": "Floor", "unit_price": None, "origin_country": "Saudi Arabia", "supplier_id": "SUP-09"},
    {"sku_id": "SKU-019", "product_name": "  Porcelain Floor Tile  ", "category": "Tile", "sub_category": "Floor", "unit_price": 75.00, "origin_country": "China", "supplier_id": "SUP-04"},
    {"sku_id": "SKU-020", "product_name": "N/A", "category": None, "sub_category": None, "unit_price": None, "origin_country": None, "supplier_id": None},
]

# ============================================================
# ONLINE SUPPLIERS DATA — dirty and messy intentionally
# Issues: duplicates, junk emails, null values, inconsistent casing
# ============================================================
online_suppliers = [
    {"supplier_id": "SUP-01", "supplier_name": "Marble World Italy", "country": "Italy", "contact_email": "contact@marbleworld.it", "currency": "EUR"},
    {"supplier_id": "SUP-02", "supplier_name": "Stone Masters India", "country": "India", "contact_email": "info@stonemasters.in", "currency": "INR"},
    {"supplier_id": "SUP-03", "supplier_name": "Gulf Granite LLC", "country": "UAE", "contact_email": "sales@gulfgranite.ae", "currency": "AED"},
    {"supplier_id": "SUP-04", "supplier_name": "Global Tiles Co", "country": "China", "contact_email": "N/A", "currency": "CNY"},
    {"supplier_id": "SUP-05", "supplier_name": "Premium Stone UK", "country": "UK", "contact_email": None, "currency": "GBP"},
    {"supplier_id": "SUP-06", "supplier_name": "Elite Marble Turkey", "country": "Turkey", "contact_email": "info@elitemarble.tr", "currency": "USD"},
    {"supplier_id": "SUP-07", "supplier_name": "Aussie Granite Co", "country": "Australia", "contact_email": "info@aussiegranite.au", "currency": "AUD"},
    {"supplier_id": "SUP-08", "supplier_name": "mediterranean marble", "country": "spain", "contact_email": "contact@medmarble.es", "currency": "eur"},
    {"supplier_id": "SUP-09", "supplier_name": "Saudi Stone Works", "country": "Saudi Arabia", "contact_email": None, "currency": "SAR"},
    {"supplier_id": "SUP-04", "supplier_name": "Global Tiles Co", "country": "China", "contact_email": "N/A", "currency": "CNY"},
    {"supplier_id": "SUP-10", "supplier_name": "MARBLE WORLD ITALY", "country": "ITALY", "contact_email": "contact@marbleworld.it", "currency": "EUR"},
    {"supplier_id": "SUP-11", "supplier_name": "not available", "country": None, "contact_email": None, "currency": None},
    {"supplier_id": "SUP-12", "supplier_name": "North American Tiles", "country": "USA", "contact_email": "sales@natiles.com", "currency": "USD"},
]

# ============================================================
# API ENDPOINTS
# ============================================================

@app.get("/")
def root():
    return {
        "project": "TerraStone Data Platform",
        "api": "Online Sales API",
        "version": "1.1.0",
        "endpoints": [
            "/orders",
            "/orders/{order_id}",
            "/orders/{order_id}/items",
            "/customers",
            "/customers/{customer_id}",
            "/products",
            "/products/{sku_id}",
            "/suppliers",
            "/suppliers/{supplier_id}",
            "/health"
        ]
    }

@app.get("/health")
def health():
    return {"status": "healthy", "api": "TerraStone Online Sales API", "version": "1.1.0"}

# ── ORDERS ──────────────────────────────────────────────────

@app.get("/orders")
def get_orders(country: Optional[str] = None, channel: Optional[str] = None, status: Optional[str] = None):
    data = online_sales
    if country:
        data = [o for o in data if o["country"] and o["country"].lower() == country.lower()]
    if channel:
        data = [o for o in data if o["channel"] and o["channel"].lower() == channel.lower()]
    if status:
        data = [o for o in data if o["status"] and o["status"].lower() == status.lower()]
    return {
        "total_records": len(data),
        "source": "TerraStone Online Sales",
        "data": data
    }

@app.get("/orders/{order_id}")
def get_order(order_id: str):
    order = next((o for o in online_sales if o["order_id"] == order_id), None)
    if not order:
        return {"error": f"Order {order_id} not found"}
    return order

@app.get("/orders/{order_id}/items")
def get_order_items(order_id: str):
    items = [i for i in order_items if i["order_id"] == order_id]
    if not items:
        return {"error": f"No items found for order {order_id}"}
    return {
        "order_id": order_id,
        "total_items": len(items),
        "source": "TerraStone Order Items",
        "data": items
    }

# ── CUSTOMERS ───────────────────────────────────────────────

@app.get("/customers")
def get_customers(country: Optional[str] = None, customer_type: Optional[str] = None):
    data = online_customers
    if country:
        data = [c for c in data if c["country"] and c["country"].lower() == country.lower()]
    if customer_type:
        data = [c for c in data if c["customer_type"] and c["customer_type"].lower() == customer_type.lower()]
    return {
        "total_records": len(data),
        "source": "TerraStone Online Customers",
        "data": data
    }

@app.get("/customers/{customer_id}")
def get_customer(customer_id: str):
    customer = next((c for c in online_customers if c["customer_id"] == customer_id), None)
    if not customer:
        return {"error": f"Customer {customer_id} not found"}
    return customer

# ── PRODUCTS ────────────────────────────────────────────────

@app.get("/products")
def get_products(category: Optional[str] = None):
    data = product_catalogue
    if category:
        data = [p for p in data if p["category"] and p["category"].lower() == category.lower()]
    return {
        "total_records": len(data),
        "source": "TerraStone Product Catalogue",
        "data": data
    }

@app.get("/products/{sku_id}")
def get_product(sku_id: str):
    product = next((p for p in product_catalogue if p["sku_id"] == sku_id), None)
    if not product:
        return {"error": f"Product {sku_id} not found"}
    return product

# ── SUPPLIERS ───────────────────────────────────────────────

@app.get("/suppliers")
def get_suppliers(country: Optional[str] = None):
    data = online_suppliers
    if country:
        data = [s for s in data if s["country"] and s["country"].lower() == country.lower()]
    return {
        "total_records": len(data),
        "source": "TerraStone Online Suppliers",
        "data": data
    }

@app.get("/suppliers/{supplier_id}")
def get_supplier(supplier_id: str):
    supplier = next((s for s in online_suppliers if s["supplier_id"] == supplier_id), None)
    if not supplier:
        return {"error": f"Supplier {supplier_id} not found"}
    return supplier