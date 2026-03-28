-- =========================
-- ANALYTICS VIEW
-- =========================

CREATE OR REPLACE VIEW v_enterprise_sales_analytics AS
SELECT 
    s.sale_id,
    s.date,

    -- Customer
    c.customer_name,
    c.segment AS customer_segment,
    c.has_sales,

    -- Region
    r.region_name AS region,
    r.lat,
    r.lon,

    -- Product
    p.product_name,
    p.category,

    -- Employee
    e.employee_name,

    -- Time
    t.month_name,
    t.year,
    t.day_type,

    -- Measures
    s.quantity,
    s.revenue,
    s.profit,

    -- Margin %
    CASE 
        WHEN s.revenue > 0 
        THEN ROUND((s.profit / s.revenue) * 100, 2)
        WHEN s.revenue < 0 
        THEN -100
        ELSE 0 
    END AS gross_margin_pct,

    -- Transaction Type
    CASE 
        WHEN s.quantity < 0 THEN 'Return'
        ELSE 'Sale'
    END AS transaction_type,

    -- Avg Price Per Unit
    CASE 
        WHEN s.quantity != 0 
        THEN ROUND(s.revenue / s.quantity, 2)
        ELSE 0 
    END AS avg_price_per_unit

FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id
LEFT JOIN regions r ON c.region_id = r.region_id
JOIN products p ON s.product_id = p.product_id
JOIN employees e ON s.employee_id = e.employee_id
JOIN time_dimension t ON s.date = t.date;