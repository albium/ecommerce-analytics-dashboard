-- ========================================
-- E-COMMERCE ANALYTICS QUERIES
-- Portfolio Project (SQL + Power BI)
-- ========================================


-- ========================================
-- SECTION: KPI QUERIES
-- ========================================

-- Total Revenue
-- Business Question: What is the total revenue generated?
SELECT 
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id;


-- Total Orders
-- Business Question: How many orders have been placed?
SELECT 
    COUNT(*) AS total_orders
FROM orders;


-- Total Products Sold
-- Business Question: How many total units have been sold?
SELECT 
    SUM(quantity) AS total_products_sold
FROM order_items;


-- Average Order Value (AOV)
-- Business Question: What is the average revenue per order?
SELECT 
    SUM(oi.quantity * p.price) * 1.0 / COUNT(DISTINCT o.id) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;



-- ========================================
-- SECTION: PRODUCT ANALYSIS
-- ========================================

-- Revenue by Product
-- Business Question: Which products generate the most revenue?
SELECT 
    p.name,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY revenue DESC;


-- Units Sold by Product
-- Business Question: Which products sell the most units?
SELECT 
    p.name,
    SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY units_sold DESC;



-- ========================================
-- SECTION: CUSTOMER ANALYSIS
-- ========================================

-- Revenue per Customer
-- Business Question: Who are the highest-value customers?
SELECT 
    c.name,
    COALESCE(SUM(oi.quantity * p.price), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
GROUP BY c.name
ORDER BY total_revenue DESC;


-- Customers with No Orders
-- Business Question: Which customers have not made any purchases?
SELECT 
    c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;


-- Top Product per Customer
-- Business Question: What is each customer's most frequently purchased product?
-- Use Case: Personalization, targeted marketing
WITH base_data AS (
    SELECT 
        c.name AS customer,
        p.name AS product,
        SUM(oi.quantity) AS total_quantity
    FROM customers c
    JOIN orders o ON o.customer_id = c.id
    JOIN order_items oi ON oi.order_id = o.id
    JOIN products p ON oi.product_id = p.id
    GROUP BY c.name, p.name
),
ranked AS (
    SELECT 
        customer,
        product,
        total_quantity,
        ROW_NUMBER() OVER (
            PARTITION BY customer 
            ORDER BY total_quantity DESC
        ) AS rn
    FROM base_data
)
SELECT 
    customer, 
    product, 
    total_quantity
FROM ranked
WHERE rn = 1;



-- ========================================
-- SECTION: TIME ANALYSIS
-- ========================================

-- Daily Revenue Trend
-- Business Question: How does revenue change over time?
SELECT 
    o.order_date,
    SUM(oi.quantity * p.price) AS daily_revenue
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY o.order_date
ORDER BY o.order_date;



-- ========================================
-- SECTION: ADVANCED (OPTIONAL - CLEAN MODELING)
-- ========================================

-- Reusable Revenue CTE (Analyst-style thinking)
-- Purpose: Centralize revenue calculation for reuse
WITH revenue_data AS (
    SELECT 
        o.id AS order_id,
        o.order_date,
        c.name AS customer,
        p.name AS product,
        oi.quantity,
        p.price,
        (oi.quantity * p.price) AS revenue
    FROM orders o
    JOIN customers c ON o.customer_id = c.id
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.product_id = p.id
)

-- Example Use: Total Revenue from CTE
SELECT 
    SUM(revenue) AS total_revenue
FROM revenue_data;