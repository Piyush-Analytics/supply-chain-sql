-- Supply Chain & Inventory Optimization System

CREATE TABLE suppliers (
    supplier_id     SERIAL PRIMARY KEY,
    supplier_name   VARCHAR(100),
    country         VARCHAR(50),
    city            VARCHAR(50),
    contact_email   VARCHAR(100),
    rating          DECIMAL(3,1),
    lead_time_days  INTEGER,
    is_active       BOOLEAN DEFAULT TRUE
);

SELECT * FROM suppliers;

CREATE TABLE products (
    product_id      SERIAL PRIMARY KEY,
    product_name    VARCHAR(150),
    category        VARCHAR(50),
    unit_price      DECIMAL(10,2),
    reorder_point   INTEGER,
    reorder_qty     INTEGER,
    supplier_id     INTEGER REFERENCES suppliers(supplier_id)
);

SELECT * FROM products;

CREATE TABLE inventory (
    inventory_id    SERIAL PRIMARY KEY,
    product_id      INTEGER REFERENCES products(product_id),
    warehouse       VARCHAR(50),
    quantity        INTEGER,
    last_updated    TIMESTAMP DEFAULT NOW()
);

SELECT * FROM inventory;

CREATE TABLE orders (
    order_id        SERIAL PRIMARY KEY,
    product_id      INTEGER REFERENCES products(product_id),
    supplier_id     INTEGER REFERENCES suppliers(supplier_id),
    order_date      DATE,
    delivery_date   DATE,
    quantity        INTEGER,
    unit_cost       DECIMAL(10,2),
    status          VARCHAR(20),
    warehouse       VARCHAR(50)
);

SELECT * FROM orders;

SELECT 'All tables created successfully!' AS status;


INSERT INTO suppliers (supplier_name, country, city, contact_email, rating, lead_time_days) VALUES
('TechSupply Co.', 'India', 'Mumbai', 'tech@techsupply.com', 4.5, 7),
('Global Parts Ltd.', 'China', 'Shanghai', 'info@globalparts.com', 3.8, 14),
('FastShip India', 'India', 'Delhi', 'sales@fastship.in', 4.2, 5),
('QuickStock Inc.', 'USA', 'New York', 'orders@quickstock.com', 4.7, 10),
('EcoGoods Pvt.', 'India', 'Bangalore', 'eco@ecogoods.in', 4.0, 6),
('MegaSupplier', 'China', 'Beijing', 'mega@megasupplier.com', 3.5, 21),
('SwiftLogistics', 'India', 'Chennai', 'swift@swiftlog.in', 4.3, 4),
('PrimeParts Co.', 'Germany', 'Berlin', 'prime@primeparts.de', 4.8, 12),
('AsiaTradeHub', 'Japan', 'Tokyo', 'trade@asiatrade.jp', 4.6, 9),
('LocalVendors Ltd.', 'India', 'Pune', 'local@localvendors.in', 3.9, 3);

SELECT 'Suppliers inserted: ' || COUNT(*) FROM suppliers;

INSERT INTO products (product_name, category, unit_price, reorder_point, reorder_qty, supplier_id) VALUES
('Laptop 15inch', 'Electronics', 45000.00, 20, 50, 1),
('Wireless Mouse', 'Electronics', 850.00, 50, 100, 1),
('Office Chair', 'Furniture', 8500.00, 15, 30, 3),
('Standing Desk', 'Furniture', 22000.00, 10, 20, 3),
('Printer Paper A4', 'Stationery', 350.00, 100, 500, 5),
('Ball Pen Box', 'Stationery', 120.00, 200, 1000, 5),
('USB-C Hub', 'Electronics', 1200.00, 40, 80, 2),
('Monitor 24inch', 'Electronics', 18000.00, 15, 25, 4),
('Keyboard Mechanical', 'Electronics', 3500.00, 30, 60, 1),
('Webcam HD', 'Electronics', 2800.00, 25, 50, 4),
('Filing Cabinet', 'Furniture', 6500.00, 8, 15, 3),
('Whiteboard', 'Stationery', 2200.00, 12, 20, 5),
('Headphones', 'Electronics', 4500.00, 20, 40, 9),
('Power Bank', 'Electronics', 1800.00, 35, 70, 2),
('Desk Lamp', 'Furniture', 950.00, 25, 50, 10),
('Notebook Pack', 'Stationery', 280.00, 150, 500, 5),
('Cable Management', 'Electronics', 450.00, 60, 120, 7),
('Phone Stand', 'Electronics', 350.00, 80, 150, 7),
('Air Purifier', 'Appliances', 12000.00, 10, 15, 8),
('Coffee Maker', 'Appliances', 8500.00, 8, 12, 8);

SELECT 'Products inserted: ' || COUNT(*) FROM products;

INSERT INTO inventory (product_id, warehouse, quantity, last_updated) VALUES
(1, 'Mumbai', 18, NOW() - INTERVAL '2 days'),
(1, 'Delhi', 25, NOW() - INTERVAL '1 day'),
(2, 'Mumbai', 45, NOW() - INTERVAL '3 days'),
(2, 'Delhi', 62, NOW()),
(3, 'Mumbai', 12, NOW() - INTERVAL '5 days'),
(3, 'Delhi', 8, NOW() - INTERVAL '2 days'),
(4, 'Mumbai', 6, NOW() - INTERVAL '1 day'),
(4, 'Delhi', 14, NOW()),
(5, 'Mumbai', 85, NOW() - INTERVAL '4 days'),
(5, 'Delhi', 120, NOW() - INTERVAL '1 day'),
(6, 'Mumbai', 180, NOW()),
(6, 'Delhi', 250, NOW() - INTERVAL '2 days'),
(7, 'Mumbai', 35, NOW() - INTERVAL '3 days'),
(7, 'Delhi', 28, NOW()),
(8, 'Mumbai', 10, NOW() - INTERVAL '6 days'),
(8, 'Delhi', 18, NOW() - INTERVAL '1 day'),
(9, 'Mumbai', 22, NOW() - INTERVAL '2 days'),
(9, 'Delhi', 15, NOW()),
(10, 'Mumbai', 20, NOW() - INTERVAL '4 days'),
(10, 'Delhi', 30, NOW()),
(11, 'Mumbai', 5, NOW() - INTERVAL '7 days'),
(11, 'Delhi', 9, NOW() - INTERVAL '3 days'),
(12, 'Mumbai', 8, NOW() - INTERVAL '2 days'),
(12, 'Delhi', 11, NOW()),
(13, 'Mumbai', 15, NOW() - INTERVAL '1 day'),
(13, 'Delhi', 22, NOW()),
(14, 'Mumbai', 30, NOW() - INTERVAL '5 days'),
(14, 'Delhi', 25, NOW()),
(15, 'Mumbai', 20, NOW() - INTERVAL '3 days'),
(15, 'Delhi', 18, NOW()),
(16, 'Mumbai', 130, NOW() - INTERVAL '2 days'),
(16, 'Delhi', 200, NOW()),
(17, 'Mumbai', 55, NOW() - INTERVAL '1 day'),
(17, 'Delhi', 48, NOW()),
(18, 'Mumbai', 70, NOW() - INTERVAL '4 days'),
(18, 'Delhi', 90, NOW()),
(19, 'Mumbai', 7, NOW() - INTERVAL '6 days'),
(19, 'Delhi', 12, NOW()),
(20, 'Mumbai', 6, NOW() - INTERVAL '3 days'),
(20, 'Delhi', 9, NOW());

SELECT 'Inventory inserted: ' || COUNT(*) FROM inventory;

INSERT INTO orders (product_id, supplier_id, order_date, delivery_date, quantity, unit_cost, status, warehouse) VALUES
(1, 1, '2024-01-05', '2024-01-12', 50, 42000, 'Delivered', 'Mumbai'),
(2, 1, '2024-01-08', '2024-01-15', 100, 780, 'Delivered', 'Delhi'),
(3, 3, '2024-01-10', '2024-01-15', 30, 7800, 'Delivered', 'Mumbai'),
(4, 3, '2024-01-15', '2024-01-20', 20, 20000, 'Delivered', 'Delhi'),
(5, 5, '2024-01-20', '2024-01-26', 500, 320, 'Delivered', 'Mumbai'),
(6, 5, '2024-02-01', '2024-02-07', 1000, 100, 'Delivered', 'Delhi'),
(7, 2, '2024-02-05', '2024-02-19', 80, 1100, 'Delivered', 'Mumbai'),
(8, 4, '2024-02-10', '2024-02-20', 25, 16500, 'Delivered', 'Delhi'),
(9, 1, '2024-02-15', '2024-02-22', 60, 3200, 'Delivered', 'Mumbai'),
(10, 4, '2024-02-20', '2024-03-01', 50, 2600, 'Delivered', 'Delhi'),
(11, 3, '2024-03-01', '2024-03-06', 15, 6000, 'Delivered', 'Mumbai'),
(12, 5, '2024-03-05', '2024-03-11', 20, 2000, 'Delivered', 'Delhi'),
(13, 9, '2024-03-10', '2024-03-19', 40, 4200, 'Delivered', 'Mumbai'),
(14, 2, '2024-03-15', '2024-03-29', 70, 1650, 'Delivered', 'Delhi'),
(15, 10, '2024-03-20', '2024-03-23', 50, 880, 'Delivered', 'Mumbai'),
(1, 1, '2024-04-01', '2024-04-08', 50, 43000, 'Delivered', 'Delhi'),
(2, 1, '2024-04-05', '2024-04-12', 100, 800, 'Delivered', 'Mumbai'),
(8, 4, '2024-04-10', '2024-04-20', 25, 17000, 'Delivered', 'Delhi'),
(19, 8, '2024-04-15', '2024-04-27', 15, 11000, 'Delivered', 'Mumbai'),
(20, 8, '2024-04-20', '2024-05-02', 12, 7800, 'Delivered', 'Delhi'),
(1, 1, '2024-05-01', '2024-05-08', 50, 44000, 'Delivered', 'Mumbai'),
(3, 3, '2024-05-05', '2024-05-10', 30, 8000, 'Delivered', 'Delhi'),
(7, 2, '2024-05-10', '2024-05-24', 80, 1100, 'In Transit', 'Mumbai'),
(9, 1, '2024-05-15', '2024-05-22', 60, 3300, 'In Transit', 'Delhi'),
(11, 3, '2024-05-20', '2024-05-25', 15, 6200, 'Pending', 'Mumbai'),
(4, 3, '2024-05-22', '2024-05-27', 20, 20500, 'Pending', 'Delhi'),
(8, 4, '2024-05-25', '2024-06-04', 25, 17500, 'Pending', 'Mumbai'),
(19, 8, '2024-05-28', '2024-06-09', 15, 11500, 'Pending', 'Delhi'),
(13, 9, '2024-06-01', '2024-06-10', 40, 4300, 'Pending', 'Mumbai'),
(20, 8, '2024-06-05', '2024-06-17', 12, 8000, 'Pending', 'Delhi');

SELECT 'Orders inserted: ' || COUNT(*) FROM orders;




-- Query 1: Overview of all tables
SELECT 
    (SELECT COUNT(*) FROM suppliers) AS total_suppliers,
    (SELECT COUNT(*) FROM products) AS total_products,
    (SELECT COUNT(*) FROM inventory) AS total_inventory_records,
    (SELECT COUNT(*) FROM orders) AS total_orders;

-- Query 2: Total inventory value per warehouse
SELECT 
    i.warehouse,
    COUNT(DISTINCT i.product_id) AS unique_products,
    SUM(i.quantity) AS total_units,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS total_inventory_value
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY i.warehouse
ORDER BY total_inventory_value DESC;

-- Query 3: Stock levels per product
SELECT 
    p.product_name,
    p.category,
    SUM(i.quantity) AS total_stock,
    p.reorder_point,
    CASE 
        WHEN SUM(i.quantity) < p.reorder_point THEN 'LOW STOCK'
        WHEN SUM(i.quantity) < p.reorder_point * 1.5 THEN 'MEDIUM'
        ELSE 'SUFFICIENT'
    END AS stock_status
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, p.category, p.reorder_point
ORDER BY total_stock ASC;

-- Query 4: Products by category
SELECT 
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(unit_price), 2) AS avg_price,
    ROUND(MIN(unit_price), 2) AS min_price,
    ROUND(MAX(unit_price), 2) AS max_price
FROM products
GROUP BY category
ORDER BY total_products DESC;

-- Query 5: Supplier overview
SELECT 
    s.supplier_name,
    s.country,
    s.rating,
    s.lead_time_days,
    COUNT(p.product_id) AS products_supplied
FROM suppliers s
LEFT JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.country, s.rating, s.lead_time_days
ORDER BY s.rating DESC;


-- Query 6: Order status summary
SELECT 
    status,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units,
    ROUND(SUM(quantity * unit_cost), 2) AS total_value
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

-- Query 7: Monthly order trend
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_units,
    ROUND(SUM(quantity * unit_cost), 2) AS total_value
FROM orders
GROUP BY month
ORDER BY month;

-- Query 8: Warehouse stock comparison
SELECT 
    i.warehouse,
    p.category,
    SUM(i.quantity) AS total_stock,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS stock_value
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY i.warehouse, p.category
ORDER BY i.warehouse, stock_value DESC;



-- SECTION 2: INVENTORY ANALYSIS

-- Query 9: Products below reorder point — REORDER ALERT!
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.reorder_point,
    p.reorder_qty,
    SUM(i.quantity) AS current_stock,
    p.reorder_point - SUM(i.quantity) AS shortage,
    s.supplier_name,
    s.lead_time_days,
    ROUND(p.reorder_qty * p.unit_price, 2) AS reorder_cost
FROM products p
JOIN inventory i ON p.product_id = i.product_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.product_name, p.category, p.reorder_point,
         p.reorder_qty, p.unit_price, s.supplier_name, s.lead_time_days
HAVING SUM(i.quantity) < p.reorder_point
ORDER BY shortage DESC;


-- Query 10: Inventory turnover rate
SELECT 
    p.product_name,
    p.category,
    SUM(o.quantity) AS units_ordered,
    AVG(i.quantity) AS avg_stock,
    ROUND(SUM(o.quantity) / NULLIF(AVG(i.quantity), 0), 2) AS turnover_rate
FROM products p
JOIN orders o ON p.product_id = o.product_id
JOIN inventory i ON p.product_id = i.product_id
WHERE o.status = 'Delivered'
GROUP BY p.product_name, p.category
ORDER BY turnover_rate DESC;

-- Query 11: Overstock analysis (3x above reorder point)
SELECT 
    p.product_name,
    p.category,
    p.reorder_point,
    SUM(i.quantity) AS current_stock,
    SUM(i.quantity) - p.reorder_point AS excess_stock,
    ROUND((SUM(i.quantity) - p.reorder_point) * p.unit_price, 2) AS excess_value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, p.category, p.reorder_point, p.unit_price
HAVING SUM(i.quantity) > p.reorder_point * 3
ORDER BY excess_value DESC;

-- Query 12: Stock value by category
SELECT 
    p.category,
    COUNT(DISTINCT p.product_id) AS products,
    SUM(i.quantity) AS total_units,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS total_value,
    ROUND(AVG(i.quantity * p.unit_price), 2) AS avg_product_value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.category
ORDER BY total_value DESC;

-- Query 13: Days of stock remaining
SELECT 
    p.product_name,
    p.category,
    SUM(i.quantity) AS current_stock,
    ROUND(AVG(o.quantity), 0) AS avg_daily_demand,
    ROUND(SUM(i.quantity) / NULLIF(AVG(o.quantity), 0), 0) AS days_of_stock_remaining
FROM products p
JOIN inventory i ON p.product_id = i.product_id
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name, p.category
ORDER BY days_of_stock_remaining ASC
LIMIT 15;

-- Query 14: Warehouse capacity utilization
SELECT 
    i.warehouse,
    COUNT(DISTINCT i.product_id) AS unique_products,
    SUM(i.quantity) AS total_units,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS total_value,
    ROUND(SUM(i.quantity * p.unit_price) / 
          SUM(SUM(i.quantity * p.unit_price)) OVER () * 100, 2) AS value_share_pct
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY i.warehouse;

-- Query 15: Products never ordered
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price,
    s.supplier_name
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.product_id = p.product_id
);


SELECT 
    i.warehouse,
    COUNT(DISTINCT i.product_id) AS unique_products,
    SUM(i.quantity) AS total_units,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS total_value,
    ROUND(SUM(i.quantity * p.unit_price) / 
          SUM(SUM(i.quantity * p.unit_price)) OVER () * 100, 2) AS value_share_pct
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY i.warehouse;

-- Query 15: Products never ordered
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price,
    s.supplier_name
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.product_id = p.product_id
);


-- Query 16: Critical stock alert with reorder recommendation
SELECT 
    p.product_name,
    p.category,
    SUM(i.quantity) AS current_stock,
    p.reorder_point,
    p.reorder_qty,
    s.supplier_name,
    s.lead_time_days,
    CURRENT_DATE + s.lead_time_days AS expected_delivery,
    ROUND(p.reorder_qty * p.unit_price, 2) AS reorder_cost,
    CASE 
        WHEN SUM(i.quantity) = 0 THEN 'OUT OF STOCK'
        WHEN SUM(i.quantity) < p.reorder_point * 0.5 THEN 'CRITICAL'
        WHEN SUM(i.quantity) < p.reorder_point THEN 'LOW'
        ELSE 'OK'
    END AS alert_level
FROM products p
JOIN inventory i ON p.product_id = i.product_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.product_name, p.category, p.reorder_point,
         p.reorder_qty, p.unit_price, s.supplier_name, s.lead_time_days
ORDER BY current_stock ASC;



-- SECTION 3: SUPPLIER PERFORMANCE


-- Query 17: Supplier performance scorecard
SELECT 
    s.supplier_name,
    s.country,
    s.rating,
    s.lead_time_days,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_units_supplied,
    ROUND(SUM(o.quantity * o.unit_cost), 2) AS total_spend,
    ROUND(AVG(o.delivery_date - o.order_date), 1) AS avg_delivery_days
FROM suppliers s
LEFT JOIN orders o ON s.supplier_id = o.supplier_id
WHERE o.status = 'Delivered'
GROUP BY s.supplier_id, s.supplier_name, s.country, s.rating, s.lead_time_days
ORDER BY total_spend DESC;

-- Query 18: Supplier delivery performance vs promised lead time
SELECT 
    s.supplier_name,
    s.lead_time_days AS promised_days,
    ROUND(AVG(o.delivery_date - o.order_date), 1) AS actual_avg_days,
    ROUND(AVG(o.delivery_date - o.order_date) - s.lead_time_days, 1) AS delay_days,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN (o.delivery_date - o.order_date) <= s.lead_time_days 
        THEN 1 ELSE 0 END) AS on_time_orders,
    ROUND(SUM(CASE WHEN (o.delivery_date - o.order_date) <= s.lead_time_days 
        THEN 1 ELSE 0 END) * 100.0 / COUNT(o.order_id), 2) AS on_time_pct
FROM suppliers s
JOIN orders o ON s.supplier_id = o.supplier_id
WHERE o.status = 'Delivered'
GROUP BY s.supplier_id, s.supplier_name, s.lead_time_days
ORDER BY on_time_pct DESC;

-- Query 19: Top suppliers by spend
SELECT 
    s.supplier_name,
    s.country,
    COUNT(o.order_id) AS orders,
    ROUND(SUM(o.quantity * o.unit_cost), 2) AS total_spend,
    ROUND(AVG(o.quantity * o.unit_cost), 2) AS avg_order_value,
    ROUND(SUM(o.quantity * o.unit_cost) * 100.0 / 
          SUM(SUM(o.quantity * o.unit_cost)) OVER (), 2) AS spend_share_pct
FROM suppliers s
JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.country
ORDER BY total_spend DESC;

-- Query 20: Supplier risk analysis
SELECT 
    s.supplier_name,
    s.country,
    s.rating,
    s.lead_time_days,
    COUNT(DISTINCT p.product_id) AS products_supplied,
    CASE 
        WHEN s.rating < 4.0 AND s.lead_time_days > 14 THEN 'HIGH RISK'
        WHEN s.rating < 4.0 OR s.lead_time_days > 14 THEN 'MEDIUM RISK'
        ELSE 'LOW RISK'
    END AS risk_level
FROM suppliers s
LEFT JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.country, s.rating, s.lead_time_days
ORDER BY s.rating ASC;

-- Query 21: Monthly spend per supplier
SELECT 
    s.supplier_name,
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(o.order_id) AS orders,
    ROUND(SUM(o.quantity * o.unit_cost), 2) AS monthly_spend
FROM suppliers s
JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_name, month
ORDER BY s.supplier_name, month;

-- Query 22: Single source dependency risk
SELECT 
    p.product_name,
    p.category,
    COUNT(DISTINCT p.supplier_id) AS supplier_count,
    s.supplier_name AS current_supplier,
    s.rating,
    CASE 
        WHEN COUNT(DISTINCT p.supplier_id) = 1 THEN '⚠️ SINGLE SOURCE RISK'
        ELSE '✅ MULTIPLE SUPPLIERS'
    END AS dependency_risk
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.product_name, p.category, s.supplier_name, s.rating
ORDER BY dependency_risk DESC;

-- Query 22: Single source dependency risk
SELECT 
    p.product_name,
    p.category,
    COUNT(DISTINCT p.supplier_id) AS supplier_count,
    s.supplier_name AS current_supplier,
    s.rating,
    CASE 
        WHEN COUNT(DISTINCT p.supplier_id) = 1 THEN '⚠️ SINGLE SOURCE RISK'
        ELSE '✅ MULTIPLE SUPPLIERS'
    END AS dependency_risk
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.product_name, p.category, s.supplier_name, s.rating
ORDER BY dependency_risk DESC;


-- Query 22: Single source dependency risk
SELECT 
    p.product_name,
    p.category,
    COUNT(DISTINCT p.supplier_id) AS supplier_count,
    s.supplier_name AS current_supplier,
    s.rating,
    CASE 
        WHEN COUNT(DISTINCT p.supplier_id) = 1 THEN '⚠️ SINGLE SOURCE RISK'
        ELSE '✅ MULTIPLE SUPPLIERS'
    END AS dependency_risk
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.product_name, p.category, s.supplier_name, s.rating
ORDER BY dependency_risk DESC;


-- Query 22: Single source dependency risk
SELECT 
    p.product_name,
    p.category,
    COUNT(DISTINCT p.supplier_id) AS supplier_count,
    s.supplier_name AS current_supplier,
    s.rating,
    CASE 
        WHEN COUNT(DISTINCT p.supplier_id) = 1 THEN 'SINGLE SOURCE RISK'
        ELSE 'MULTIPLE SUPPLIERS'
    END AS dependency_risk
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
GROUP BY p.product_id, p.product_name, p.category, s.supplier_name, s.rating
ORDER BY dependency_risk DESC;

-- Query 23: Supplier category coverage
SELECT 
    s.supplier_name,
    s.country,
    STRING_AGG(DISTINCT p.category, ', ') AS categories_supplied,
    COUNT(DISTINCT p.category) AS category_count,
    COUNT(DISTINCT p.product_id) AS product_count
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.country
ORDER BY category_count DESC;

-- Query 24: Best supplier per category
WITH supplier_category_rank AS (
    SELECT 
        p.category,
        s.supplier_name,
        s.rating,
        s.lead_time_days,
        COUNT(p.product_id) AS products,
        RANK() OVER (PARTITION BY p.category ORDER BY s.rating DESC) AS rank
    FROM suppliers s
    JOIN products p ON s.supplier_id = p.supplier_id
    GROUP BY p.category, s.supplier_name, s.rating, s.lead_time_days
)
SELECT * FROM supplier_category_rank
WHERE rank = 1
ORDER BY category;


-- SECTION 4: WINDOW FUNCTIONS

-- Query 25: Running total of order value by month
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(quantity * unit_cost), 2) AS monthly_spend,
    ROUND(SUM(SUM(quantity * unit_cost)) OVER (ORDER BY DATE_TRUNC('month', order_date)), 2) AS cumulative_spend
FROM orders
GROUP BY month
ORDER BY month;

-- Query 26: Rank products by inventory value
SELECT 
    p.product_name,
    p.category,
    SUM(i.quantity) AS total_stock,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS stock_value,
    RANK() OVER (ORDER BY SUM(i.quantity * p.unit_price) DESC) AS value_rank,
    RANK() OVER (PARTITION BY p.category ORDER BY SUM(i.quantity * p.unit_price) DESC) AS category_rank
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, p.category, p.unit_price
ORDER BY value_rank;

-- Query 27: LAG — month over month spend change
WITH monthly_spend AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        ROUND(SUM(quantity * unit_cost), 2) AS spend
    FROM orders
    GROUP BY month
)
SELECT 
    month,
    spend,
    LAG(spend) OVER (ORDER BY month) AS prev_month_spend,
    ROUND(spend - LAG(spend) OVER (ORDER BY month), 2) AS spend_change,
    ROUND((spend - LAG(spend) OVER (ORDER BY month)) / 
          NULLIF(LAG(spend) OVER (ORDER BY month), 0) * 100, 2) AS change_pct
FROM monthly_spend
ORDER BY month;

-- Query 28: LEAD — next order prediction
SELECT 
    o.order_id,
    p.product_name,
    o.order_date,
    o.quantity,
    LEAD(o.order_date) OVER (PARTITION BY o.product_id ORDER BY o.order_date) AS next_order_date,
    LEAD(o.quantity) OVER (PARTITION BY o.product_id ORDER BY o.order_date) AS next_order_qty
FROM orders o
JOIN products p ON o.product_id = p.product_id
ORDER BY o.product_id, o.order_date;


-- Query 29: Moving average of order quantity
WITH product_orders AS (
    SELECT 
        p.product_name,
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(o.quantity) AS monthly_qty
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY p.product_name, month
)
SELECT 
    product_name,
    month,
    monthly_qty,
    ROUND(AVG(monthly_qty) OVER (
        PARTITION BY product_name
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 0) AS three_month_avg
FROM product_orders
ORDER BY product_name, month;

-- Query 30: NTILE — categorize products by stock value
SELECT 
    p.product_name,
    p.category,
    ROUND(SUM(i.quantity * p.unit_price), 2) AS stock_value,
    NTILE(4) OVER (ORDER BY SUM(i.quantity * p.unit_price) DESC) AS quartile,
    CASE NTILE(4) OVER (ORDER BY SUM(i.quantity * p.unit_price) DESC)
        WHEN 1 THEN 'A — High Value'
        WHEN 2 THEN 'B — Medium Value'
        WHEN 3 THEN 'C — Low Value'
        ELSE 'D — Minimal Value'
    END AS abc_category
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name, p.category, p.unit_price
ORDER BY stock_value DESC;

-- Query 31: DENSE_RANK suppliers by on-time delivery
WITH supplier_performance AS (
    SELECT 
        s.supplier_name,
        ROUND(SUM(CASE WHEN (o.delivery_date - o.order_date) <= s.lead_time_days 
              THEN 1 ELSE 0 END) * 100.0 / COUNT(o.order_id), 2) AS on_time_pct
    FROM suppliers s
    JOIN orders o ON s.supplier_id = o.supplier_id
    WHERE o.status = 'Delivered'
    GROUP BY s.supplier_id, s.supplier_name, s.lead_time_days
)
SELECT 
    supplier_name,
    on_time_pct,
    DENSE_RANK() OVER (ORDER BY on_time_pct DESC) AS performance_rank
FROM supplier_performance;

-- Query 32: ROW_NUMBER — latest order per product
WITH latest_orders AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY order_date DESC) AS rn
    FROM orders
)
SELECT 
    p.product_name,
    p.category,
    o.order_date AS last_order_date,
    o.quantity AS last_order_qty,
    o.status,
    s.supplier_name
FROM latest_orders o
JOIN products p ON o.product_id = p.product_id
JOIN suppliers s ON o.supplier_id = s.supplier_id
WHERE rn = 1
ORDER BY o.order_date DESC;



-- SECTION 5: ADVANCED CTEs & SUBQUERIES


-- Query 33: ABC Analysis — classify products by value
WITH product_value AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category,
        ROUND(SUM(o.quantity * o.unit_cost), 2) AS total_spend
    FROM products p
    JOIN orders o ON p.product_id = o.product_id
    GROUP BY p.product_id, p.product_name, p.category
),
ranked AS (
    SELECT *,
        SUM(total_spend) OVER () AS grand_total,
        SUM(total_spend) OVER (ORDER BY total_spend DESC) AS cumulative_spend,
        ROUND(SUM(total_spend) OVER (ORDER BY total_spend DESC) / 
              SUM(total_spend) OVER () * 100, 2) AS cumulative_pct
    FROM product_value
)
SELECT 
    product_name,
    category,
    total_spend,
    cumulative_pct,
    CASE 
        WHEN cumulative_pct <= 80 THEN 'A — Critical (80% value)'
        WHEN cumulative_pct <= 95 THEN 'B — Important (15% value)'
        ELSE 'C — Low Priority (5% value)'
    END AS abc_class
FROM ranked
ORDER BY total_spend DESC;


-- Query 34: Multi-CTE supply chain health report
WITH inventory_status AS (
    SELECT 
        p.product_id,
        p.product_name,
        p.category,
        SUM(i.quantity) AS current_stock,
        p.reorder_point,
        CASE WHEN SUM(i.quantity) < p.reorder_point THEN 1 ELSE 0 END AS needs_reorder
    FROM products p
    JOIN inventory i ON p.product_id = i.product_id
    GROUP BY p.product_id, p.product_name, p.category, p.reorder_point
),
order_status AS (
    SELECT 
        product_id,
        COUNT(*) AS pending_orders,
        SUM(quantity) AS pending_units
    FROM orders
    WHERE status IN ('Pending', 'In Transit')
    GROUP BY product_id
),
combined AS (
    SELECT 
        i.*,
        COALESCE(o.pending_orders, 0) AS pending_orders,
        COALESCE(o.pending_units, 0) AS pending_units
    FROM inventory_status i
    LEFT JOIN order_status o ON i.product_id = o.product_id
)
SELECT *,
    CASE 
        WHEN needs_reorder = 1 AND pending_orders = 0 THEN 'ORDER NOW'
        WHEN needs_reorder = 1 AND pending_orders > 0 THEN 'ORDER IN PROGRESS'
        ELSE 'STOCK OK'
    END AS action_required
FROM combined
ORDER BY needs_reorder DESC, current_stock ASC;

-- Query 35: Correlated subquery — products above avg category price
SELECT 
    p.product_name,
    p.category,
    p.unit_price,
    ROUND((SELECT AVG(p2.unit_price) FROM products p2 
           WHERE p2.category = p.category), 2) AS category_avg_price,
    ROUND(p.unit_price - (SELECT AVG(p2.unit_price) FROM products p2 
          WHERE p2.category = p.category), 2) AS above_avg_by
FROM products p
WHERE p.unit_price > (
    SELECT AVG(p2.unit_price) FROM products p2 
    WHERE p2.category = p.category
)
ORDER BY above_avg_by DESC;

-- Query 36: Rolling 3-month spend per supplier
WITH monthly_supplier_spend AS (
    SELECT 
        s.supplier_name,
        DATE_TRUNC('month', o.order_date) AS month,
        ROUND(SUM(o.quantity * o.unit_cost), 2) AS monthly_spend
    FROM suppliers s
    JOIN orders o ON s.supplier_id = o.supplier_id
    GROUP BY s.supplier_name, month
)
SELECT 
    supplier_name,
    month,
    monthly_spend,
    ROUND(AVG(monthly_spend) OVER (
        PARTITION BY supplier_name
        ORDER BY month
		 ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS rolling_3month_avg
FROM monthly_supplier_spend
ORDER BY supplier_name, month;

-- Query 37: Reorder forecast — when will stock run out?
WITH consumption_rate AS (
    SELECT 
        o.product_id,
        ROUND(SUM(o.quantity) / 
              NULLIF(MAX(o.order_date) - MIN(o.order_date), 0), 2) AS daily_consumption
    FROM orders o
    WHERE status = 'Delivered'
    GROUP BY o.product_id
),
stock_levels AS (
    SELECT 
        product_id,
        SUM(quantity) AS current_stock
    FROM inventory
    GROUP BY product_id
)
SELECT 
    p.product_name,
    p.category,
    sl.current_stock,
    COALESCE(cr.daily_consumption, 1) AS daily_consumption,
    ROUND(sl.current_stock / NULLIF(cr.daily_consumption, 0), 0) AS days_until_stockout,
    CURRENT_DATE + ROUND(sl.current_stock / NULLIF(cr.daily_consumption, 0), 0)::INTEGER AS stockout_date,
    s.supplier_name,
    s.lead_time_days
FROM products p
JOIN stock_levels sl ON p.product_id = sl.product_id
LEFT JOIN consumption_rate cr ON p.product_id = cr.product_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
ORDER BY days_until_stockout ASC
LIMIT 15;

-- Query 38: EXISTS — suppliers with delayed deliveries
SELECT DISTINCT
    s.supplier_id,
    s.supplier_name,
    s.country,
    s.rating,
    s.lead_time_days
FROM suppliers s
WHERE EXISTS (
    SELECT 1 FROM orders o
    WHERE o.supplier_id = s.supplier_id
    AND o.status = 'Delivered'
    AND (o.delivery_date - o.order_date) > s.lead_time_days
)
ORDER BY s.rating ASC;

-- Query 39: NOT EXISTS — suppliers with perfect delivery
SELECT DISTINCT
    s.supplier_id,
    s.supplier_name,
    s.country,
    s.rating
FROM suppliers s
WHERE NOT EXISTS (
    SELECT 1 FROM orders o
    WHERE o.supplier_id = s.supplier_id
    AND o.status = 'Delivered'
    AND (o.delivery_date - o.order_date) > s.lead_time_days
)
AND EXISTS (SELECT 1 FROM orders o2 WHERE o2.supplier_id = s.supplier_id)
ORDER BY s.rating DESC;

-- Query 40: Complete supply chain summary report
SELECT 'SUPPLY CHAIN HEALTH REPORT' AS metric, '' AS value
UNION ALL SELECT '━━━━━━━━━━━━━━━━━━━━━━━━━━━━', ''
UNION ALL SELECT 'Total Products', COUNT(*)::TEXT FROM products
UNION ALL SELECT 'Total Suppliers', COUNT(*)::TEXT FROM suppliers
UNION ALL SELECT 'Total Orders', COUNT(*)::TEXT FROM orders
UNION ALL SELECT 'Pending Orders', COUNT(*)::TEXT FROM orders WHERE status = 'Pending'
UNION ALL SELECT 'In Transit Orders', COUNT(*)::TEXT FROM orders WHERE status = 'In Transit'
UNION ALL SELECT 'Total Inventory Value', '$' || ROUND(SUM(i.quantity * p.unit_price), 2)::TEXT
    FROM inventory i JOIN products p ON i.product_id = p.product_id
UNION ALL SELECT 'Products Below Reorder', COUNT(*)::TEXT
    FROM (SELECT p.product_id FROM products p JOIN inventory i ON p.product_id = i.product_id
          GROUP BY p.product_id, p.reorder_point HAVING SUM(i.quantity) < p.reorder_point) sub
UNION ALL SELECT 'Avg Supplier Rating', ROUND(AVG(rating), 2)::TEXT FROM suppliers
UNION ALL SELECT 'Total Spend (All Orders)', '$' || ROUND(SUM(quantity * unit_cost), 2)::TEXT FROM orders;



SECTION 6 — EXPORT (41-42)
sql-- Query 41: Export reorder alerts


COPY (
    SELECT 
        p.product_name,
        p.category,
        SUM(i.quantity) AS current_stock,
        p.reorder_point,
        p.reorder_qty,
        s.supplier_name,
        s.lead_time_days,
        CURRENT_DATE + s.lead_time_days AS expected_delivery
    FROM products p
    JOIN inventory i ON p.product_id = i.product_id
    JOIN suppliers s ON p.supplier_id = s.supplier_id
    GROUP BY p.product_id, p.product_name, p.category, p.reorder_point,
             p.reorder_qty, s.supplier_name, s.lead_time_days
    HAVING SUM(i.quantity) < p.reorder_point
    ORDER BY current_stock ASC
)
TO 'C:/temp/reorder_alerts.csv'
DELIMITER ',' CSV HEADER;

-- Query 42: Export supplier performance
COPY (
    SELECT 
        s.supplier_name,
        s.country,
        s.rating,
        s.lead_time_days,
        COUNT(o.order_id) AS total_orders,
        ROUND(SUM(o.quantity * o.unit_cost), 2) AS total_spend
    FROM suppliers s
    LEFT JOIN orders o ON s.supplier_id = o.supplier_id
    GROUP BY s.supplier_id, s.supplier_name, s.country, s.rating, s.lead_time_days
    ORDER BY total_spend DESC
)
TO 'C:/temp/supplier_performance.csv'
DELIMITER ',' CSV HEADER;

SELECT 'Supply Chain Analysis Complete!' AS status;