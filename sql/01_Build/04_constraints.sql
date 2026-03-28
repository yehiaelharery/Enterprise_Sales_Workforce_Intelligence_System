-- =========================
-- CONSTRAINTS
-- =========================

-- Customers → Regions
ALTER TABLE customers 
ADD CONSTRAINT fk_customer_region 
FOREIGN KEY (region_id) REFERENCES regions(region_id);

-- Employees → Regions
ALTER TABLE employees 
ADD CONSTRAINT fk_employee_region 
FOREIGN KEY (region_id) REFERENCES regions(region_id);

-- Sales → Products
ALTER TABLE sales 
ADD CONSTRAINT fk_product 
FOREIGN KEY (product_id) REFERENCES products(product_id);

-- Sales → Customers
ALTER TABLE sales 
ADD CONSTRAINT fk_customer 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

-- Sales → Employees
ALTER TABLE sales 
ADD CONSTRAINT fk_employee 
FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

-- Sales → Time
ALTER TABLE sales 
ADD CONSTRAINT fk_sales_date 
FOREIGN KEY (date) REFERENCES time_dimension(date);


-- =========================
-- INDEXES (PERFORMANCE 🔥)
-- =========================

CREATE INDEX idx_sales_customer ON sales(customer_id);
CREATE INDEX idx_sales_product ON sales(product_id);
CREATE INDEX idx_sales_employee ON sales(employee_id);
CREATE INDEX idx_sales_date ON sales(date);