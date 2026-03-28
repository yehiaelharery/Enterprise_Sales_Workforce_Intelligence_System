-- =========================
-- CREATE TABLES
-- =========================

-- 1. Regions Dimension
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE,
    lat NUMERIC(10, 6),
    lon NUMERIC(10, 6),
    multiplier NUMERIC(5, 2)
);

-- 2. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT NOT NULL,
    region_id INT,
    industry TEXT,
    segment TEXT,
    has_sales BOOLEAN
);

-- 3. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    price NUMERIC(10, 2),
    cost NUMERIC(10, 2)
);

-- 4. Employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name TEXT,
    department TEXT,
    region_id INT
);

-- 5. Sales (Fact Table)
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    date DATE,
    product_id INT,
    customer_id INT,
    employee_id INT,
    quantity INT,
    discount NUMERIC(5, 2),
    revenue NUMERIC(15, 2),
    profit NUMERIC(15, 2)
);