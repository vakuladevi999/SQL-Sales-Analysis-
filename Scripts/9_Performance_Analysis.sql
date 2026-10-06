-- ====================
-- Performance Analysis
-- ====================
/* Analyze the yearly performance of products by comparing their sales
   to both its average saes performance and the previous year's sales. */

WITH CTE AS (
SELECT
	P.product_name,
	YEAR(S.order_date) AS order_year,
	SUM(S.sales_amount) AS total_sales
FROM fact_sales AS S
JOIN dim_products AS P
ON S.product_key = P.product_key
WHERE S.order_date IS NOT NULL
GROUP BY 
	P.product_name,
	YEAR(S.order_date) )

	SELECT *,
		LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year ) AS previous_yearsales,
		total_sales - LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year ) AS diff_py,
		CASE
			WHEN total_sales > LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year ) THEN 'Increase'
			WHEN total_sales < LAG(total_sales) OVER(PARTITION BY product_name ORDER BY order_year ) THEN 'Decrease'
		ELSE 'No change'
		END AS Category,
		AVG(total_sales) OVER(PARTITION BY product_name ) AS average_sales,
		total_sales - AVG(total_sales) OVER(PARTITION BY product_name ) AS diff_avg,
		CASE 
			WHEN total_sales > AVG(total_sales) OVER(PARTITION BY product_name ) THEN 'Above Average'
			WHEN total_sales < AVG(total_sales) OVER(PARTITION BY product_name ) THEN 'Below Average' 
		ELSE 'Average'
	END AS Category
	FROM CTE
	ORDER BY product_name,order_year;
