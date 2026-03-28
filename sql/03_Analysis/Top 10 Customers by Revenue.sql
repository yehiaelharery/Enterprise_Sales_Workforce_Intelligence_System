SELECT customer_name,
       customer_segment,
       SUM(revenue) AS total_revenue,
       SUM(profit) AS total_profit
FROM v_enterprise_sales_analytics
GROUP BY customer_name, customer_segment
ORDER BY total_revenue DESC
LIMIT 10;