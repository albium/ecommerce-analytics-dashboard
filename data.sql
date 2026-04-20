-- ========================================
-- SAMPLE DATA (E-COMMERCE SIMULATION)
-- ========================================

INSERT INTO customers (name, email) VALUES
('John', 'john@email.com'),
('Maria', 'maria@email.com'),
('Alex', 'alex@email.com'),
('Sophie', 'sophie@email.com'),
('NoOrdersUser', 'noorders@email.com');

INSERT INTO products (name, price) VALUES
('Laptop', 1000),
('Phone', 700),
('Headphones', 150),
('Keyboard', 100),
('Mouse', 50),
('Monitor', 300);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2026-01-10'),
(2, '2026-01-11'),
(1, '2026-01-15'),
(3, '2026-01-20'),
(4, '2026-01-22'),
(1, '2026-01-25'),
(2, '2026-01-26'),
(3, '2026-01-27');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(3, 3, 1),
(4, 1, 1),
(4, 2, 1),
(5, 3, 3),
(6, 5, 2),
(7, 6, 1),
(8, 1, 1),
(8, 3, 2);