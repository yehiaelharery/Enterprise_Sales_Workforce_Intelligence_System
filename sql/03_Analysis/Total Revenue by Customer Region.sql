SELECT customer_region, SUM(revenue) AS total_revenue
FROM v_enterprise_sales_analytics
GROUP BY customer_region
ORDER BY total_revenue DESC;