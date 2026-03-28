SELECT product_name,
       SUM(CASE WHEN quantity < 0 THEN revenue ELSE 0 END) AS total_returns,
       SUM(CASE WHEN quantity < 0 THEN profit ELSE 0 END) AS profit_loss
FROM v_enterprise_sales_analytics
GROUP BY product_name
ORDER BY total_returns ASC
LIMIT 10;