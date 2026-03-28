SELECT employee_name,
       SUM(revenue) AS total_sales,
       SUM(profit) AS total_profit
FROM v_enterprise_sales_analytics
GROUP BY employee_name
ORDER BY total_sales DESC;

