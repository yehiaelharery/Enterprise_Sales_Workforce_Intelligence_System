SELECT category,
       ROUND(SUM(profit) / NULLIF(SUM(revenue),0) * 100, 2) AS gross_margin_pct
FROM v_enterprise_sales_analytics
GROUP BY category
ORDER BY gross_margin_pct DESC;