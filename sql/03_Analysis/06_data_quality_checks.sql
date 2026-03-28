-- -------------------------------
-- UPDATED DATA QUALITY CHECKS (8 TESTS)
-- -------------------------------

-- 1. Business Logic: Negative Revenue
SELECT 'Negative Revenue' AS test_name,
       COUNT(*) AS result_count
FROM sales
WHERE revenue < 0

UNION ALL

-- 2. Uniqueness: Duplicate Sale IDs
SELECT 'Duplicate Sales IDs' AS test_name,
       COUNT(*) - COUNT(DISTINCT sale_id) AS result_count
FROM sales

UNION ALL

-- 3. Calendar Integrity: Sales with no matching Date in Time Dimension
SELECT 'Sales Outside Calendar Range' AS test_name,
       COUNT(*) AS result_count
FROM sales
WHERE date NOT IN (SELECT date FROM time_dimension)

UNION ALL

-- 4. Completeness: Missing IDs in Sales
SELECT 'Null IDs in Sales' AS test_name,
       COUNT(*) AS result_count
FROM sales
WHERE customer_id IS NULL
   OR product_id IS NULL
   OR employee_id IS NULL

UNION ALL

-- 5. Referential Integrity: Customers without Region
SELECT 'Customers with Invalid Region' AS test_name,
       COUNT(*) AS result_count
FROM customers c
LEFT JOIN regions r ON c.region_id = r.region_id
WHERE r.region_id IS NULL

UNION ALL

-- 6. Referential Integrity: Employees without Region
SELECT 'Employees with Invalid Region' AS test_name,
       COUNT(*) AS result_count
FROM employees e
LEFT JOIN regions r ON e.region_id = r.region_id
WHERE r.region_id IS NULL

UNION ALL

-- 7. Completeness: Products without Category/Price/Cost
SELECT 'Products Missing Info' AS test_name,
       COUNT(*) AS result_count
FROM products
WHERE product_name IS NULL
   OR category IS NULL
   OR price IS NULL
   OR cost IS NULL

UNION ALL

-- 8. Customer-Employee-Region Consistency
SELECT 'Sales with mismatched customer/employee regions' AS test_name,
       COUNT(*) AS result_count
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN employees e ON s.employee_id = e.employee_id
WHERE c.region_id <> e.region_id;