-- ========================================
-- E-COMMERCE ANALYTICS DATABASE
-- Portfolio Project (SQL + Power BI)
-- ========================================

-- DROP TABLES (reset database)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ========================================
-- CUSTOMERS
-- Stores customer identity information
-- ========================================
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT
);

-- ========================================
-- PRODUCTS
-- Product catalog with pricing
-- ========================================
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL
);

-- ========================================
-- ORDERS
-- Each order belongs to one customer
-- ========================================
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL REFERENCES customers(id),
    order_date DATE NOT NULL
);

-- ========================================
-- ORDER ITEMS (FACT TABLE)
-- Stores product-level transaction data
-- ========================================
CREATE TABLE order_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL REFERENCES orders(id),
    product_id INTEGER NOT NULL REFERENCES products(id),
    quantity INTEGER NOT NULL
);