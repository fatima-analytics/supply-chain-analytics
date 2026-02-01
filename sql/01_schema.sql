-- ============================
-- TABLE: warehouses
-- ============================
CREATE TABLE warehouses (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(100),
    city VARCHAR(50)
);

-- ============================
-- TABLE: suppliers
-- ============================
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50)
);

-- ============================
-- TABLE: products
-- ============================
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price NUMERIC(10,2),
    supplier_id INT REFERENCES suppliers(supplier_id)
);

-- ============================
-- TABLE: customers
-- ============================
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

-- ============================
-- TABLE: inventory
-- ============================
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    quantity INT
);

-- ============================
-- TABLE: orders
-- ============================
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);

-- ============================
-- TABLE: order_items
-- ============================
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price NUMERIC(10,2)
);

-- ============================
-- TABLE: stock_movements
-- ============================
CREATE TABLE stock_movements (
    movement_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    warehouse_id INT REFERENCES warehouses(warehouse_id),
    movement_type VARCHAR(10), -- IN / OUT
    quantity INT,
    movement_date DATE
);
