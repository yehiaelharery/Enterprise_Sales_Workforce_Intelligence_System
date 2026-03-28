SELECT year,
       month_name,
       SUM(revenue) AS monthly_revenue,
       SUM(profit) AS monthly_profit
FROM v_enterprise_sales_analytics
GROUP BY year, month_name
ORDER BY year, month_name;