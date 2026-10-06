-- =====================
-- Part to Hole Analysis
-- =====================

-- Which categories contribute the most to overall sales?

SELECT
	P.category,
	ROUND(CAST(SUM(S.sales_amount) AS FLOAT) / SUM(SUM(S.sales_amount)) OVER() * 100,2) AS percentage_of_total
FROM fact_sales AS S
JOIN dim_products AS P
ON S.product_key = P.product_key
GROUP BY P.category
ORDER BY ROUND(CAST(SUM(S.sales_amount) AS FLOAT) / SUM(SUM(S.sales_amount)) OVER() * 100,2) DESC;
