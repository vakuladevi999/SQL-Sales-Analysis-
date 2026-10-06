-- ===================
-- Cumulative Analysis
-- ===================

-- Calculate the total sales per month and the running total sales over time.

SELECT
	*,
	SUM(total_sales) OVER(PARTITION BY YEAR(order_year) ORDER BY order_year) AS running_total_sales
FROM (
	SELECT
		DATETRUNC(MONTH,order_date) AS order_year,
		SUM(sales_amount) AS total_sales
	FROM fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(MONTH,order_date)
)t