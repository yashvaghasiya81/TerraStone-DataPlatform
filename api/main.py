# ============================================================
# PROJECT    : TerraStone Data Platform
# FILE       : main.py
# DESCRIPTION: Fake Online Sales API using FastAPI
# AUTHOR     : TerraStone Team
# DATE       : 2026-03-25
# NOTE       : Data intentionally contains dirty/messy records
#              for Silver layer cleaning practice
# ============================================================

from fastapi import FastAPI
from datetime import date
from typing import Optional
import random

app = FastAPI(
    title="TerraStone Online Sales API",
    description="Fake API simulating international online sales for TerraStone marble and tile operations",
    version="1.0.0"
)

# ============================================================
# ONLINE SALES DATA — dirty and messy intentionally
# ============================================================
online_sales = [
    {"order_id": "ORD-1001", "customer_id": "CUST-01", "product_id": "SKU-001", "quantity": 10, "amount": 2500.00, "currency": "USD", "order_date": "2026-01-15", "country": "USA", "channel": "web"},
    {"order_id": "ORD-1002", "customer_id": "CUST-02", "product_id": "SKU-002", "quantity": 5, "amount": 900.50, "currency": "EUR", "order_date": "2026-01-16", "country": "Italy", "channel": "mobile"},
    {"order_id": "ORD-1003", "customer_id": None, "product_id": "SKU-003", "quantity": 8, "amount": None, "currency": "GBP", "order_date": "2026-01-17", "country": "UK", "channel": "web"},
    {"order_id": "ORD-1004", "customer_id": "CUST-04", "product_id": "SKU-001", "quantity": -3, "amount": -750.00, "currency": "usd", "order_date": "2026-01-18", "country": "usa", "channel": "WEB"},
    {"order_id": "ORD-1005", "customer_id": "CUST-05", "product_id": "SKU-004", "quantity": 15, "amount": 3200.00, "currency": "AED", "order_date": "17-01-2026", "country": "UAE", "channel": "web"},
    {"order_id": "ORD-1006", "customer_id": "CUST-06", "product_id": "SKU-005", "quantity": 6, "amount": 1440.00, "currency": "INR", "order_date": "2026/01/19", "country": "india", "channel": "mobile"},
    {"order_id": "ORD-1002", "customer_id": "CUST-02", "product_id": "SKU-002", "quantity": 5, "amount": 900.50, "currency": "EUR", "order_date": "2026-01-16", "country": "Italy", "channel": "mobile"},
    {"order_id": "ORD-1007", "customer_id": "CUST-07", "product_id": "SKU-006", "quantity": 20, "amount": 4800.00, "currency": "JPY", "order_date": "2026-01-20", "country": "Japan", "channel": "web"},
    {"order_id": "ORD-1008", "customer_id": "N/A", "product_id": "SKU-007", "quantity": 4, "amount": 520.00, "currency": "AUD", "order_date": "2026-01-21", "country": "Australia", "channel": "web"},
    {"order_id": "ORD-1009", "customer_id": "CUST-09", "product_id": None, "quantity": None, "amount": None, "currency": None, "order_date": None, "country": None, "channel": None},
    {"order_id": "ORD-1010", "customer_id": "CUST-10", "product_id": "SKU-008", "quantity": 12, "amount": 2880.00, "currency": "SAR", "order_date": "2026-01-23", "country": "Saudi Arabia", "channel": "mobile"},
    {"order_id": "ORD-1011", "customer_id": "CUST-11", "product_id": "SKU-001", "quantity": 7, "amount": 1750.00, "currency": "USD", "order_date": "2026-01-24", "country": "Canada", "channel": "web"},
    {"order_id": "ORD-1012", "customer_id": "CUST-12", "product_id": "SKU-009", "quantity": 9, "amount": 2250.00, "currency": "CNY", "order_date": "2026-01-25", "country": "CHINA", "channel": "MOBILE"},
    {"order_id": "ORD-1013", "customer_id": "CUST-13", "product_id": "SKU-010", "quantity": 3, "amount": 690.00, "currency": "SGD", "order_date": "2026-01-26", "country": "Singapore", "channel": "web"},
    {"order_id": "ORD-1014", "customer_id": "CUST-14", "product_id": "SKU-002", "quantity": 11, "amount": 1980.00, "currency": "EUR", "order_date": "2026-01-27", "country": "Germany", "channel": "web"},
    {"order_id": "ORD-1010", "customer_id": "CUST-10", "product_id": "SKU-008", "quantity": 12, "amount": 2880.00, "currency": "SAR", "order_date": "2026-01-23", "country": "Saudi Arabia", "channel": "mobile"},
    {"order_id": "ORD-1015", "customer_id": "CUST-15", "product_id": "SKU-003", "quantity": 5, "amount": 1125.00, "currency": "GBP", "order_date": "2026-01-28", "country": "UK", "channel": "mobile"},
    {"order_id": "ORD-1016", "customer_id": "not available", "product_id": "SKU-011", "quantity": 8, "amount": 960.00, "currency": "USD", "order_date": "2026-01-29", "country": "USA", "channel": "web"},
    {"order_id": "ORD-1017", "customer_id": "CUST-17", "product_id": "SKU-012", "quantity": -2, "amount": -480.00, "currency": "EUR", "order_date": "2026-01-30", "country": "France", "channel": "web"},
    {"order_id": "ORD-1018", "customer_id": "CUST-18", "product_id": "SKU-005", "quantity": 14, "amount": 3360.00, "currency": "inr", "order_date": "31-01-2026", "country": "INDIA", "channel": "Mobile"},
    {"order_id": "ORD-1019", "customer_id": "CUST-19", "product_id": "SKU-006", "quantity": 6, "amount": 1440.00, "currency": "JPY", "order_date": "2026-02-01", "country": "Japan", "channel": "web"},
    {"order_id": "ORD-1020", "customer_id": "CUST-20", "product_id": "SKU-013", "quantity": 10, "amount": 2200.00, "currency": "AED", "order_date": "2026-02-02", "country": "UAE", "channel": "mobile"},
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
# API ENDPOINTS
# ============================================================

@app.get("/")
def root():
    return {
        "project": "TerraStone Data Platform",
        "api": "Online Sales API",
        "version": "1.0.0",
        "endpoints": [
            "/orders",
            "/products",
            "/health"
        ]
    }

@app.get("/health")
def health():
    return {"status": "healthy", "api": "TerraStone Online Sales API"}

@app.get("/orders")
def get_orders(country: Optional[str] = None, channel: Optional[str] = None):
    data = online_sales
    if country:
        data = [o for o in data if o["country"] and o["country"].lower() == country.lower()]
    if channel:
        data = [o for o in data if o["channel"] and o["channel"].lower() == channel.lower()]
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