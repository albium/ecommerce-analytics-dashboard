-- ========================================
-- KPI: TOTAL REVENUE
-- ========================================
SELECT 
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id;


-- ========================================
-- KPI: TOTAL ORDERS
-- ========================================
SELECT COUNT(*) AS total_orders
FROM orders;


-- ========================================
-- KPI: TOTAL PRODUCTS SOLD
-- ========================================
SELECT SUM(quantity) AS total_products_sold
FROM order_items;


-- ========================================
-- KPI: AVERAGE ORDER VALUE
-- ========================================
SELECT 
    SUM(oi.quantity * p.price) * 1.0 / COUNT(DISTINCT o.id) AS avg_order_value
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id;


-- ========================================
-- ANALYSIS: REVENUE BY PRODUCT
-- ========================================
SELECT 
    p.name,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY revenue DESC;


-- ========================================
-- ADVANCED ANALYSIS: TOP PRODUCT PER CUSTOMER
-- ========================================
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
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customer 
               ORDER BY total_quantity DESC
           ) AS rn
    FROM base_data
)

SELECT customer, product, total_quantity
FROM ranked
WHERE rn = 1;