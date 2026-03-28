SELECT product_name,
       SUM(revenue) AS total_revenue
FROM v_enterprise_sales_analytics
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;