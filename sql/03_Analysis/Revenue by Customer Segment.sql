SELECT customer_segment,
       SUM(revenue) AS total_revenue,
       SUM(profit) AS total_profit,
       COUNT(DISTINCT customer_id) AS customer_count
FROM v_enterprise_sales_analytics
GROUP BY customer_segment
ORDER BY total_revenue DESC;