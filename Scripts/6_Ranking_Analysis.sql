-- ================
-- Ranking Analysis
-- ================

-- Which 5 products genereted the higest revenue?

SELECT TOP 5
	P.product_name,
	SUM(S.Sales_Amount) AS TotalAmount
FROM fact_sales AS S
JOIN dim_products AS P
ON S.product_key = P.product_key
GROUP BY P.product_name
ORDER BY TotalAmount DESC;

-- What are the 5 worst performing products in terms of sales?

SELECT TOP 5
	P.product_name,
	SUM(S.Sales_Amount) AS TotalAmount
FROM fact_sales AS S
JOIN dim_products AS P
ON S.product_key = P.product_key
GROUP BY P.product_name
ORDER BY TotalAmount ;

-- Find the top 10 customers who have generated the highest revenue

SELECT TOP 10
	customer_key,
	SUM(Sales_Amount) AS TotalAmount
FROM fact_sales
GROUP BY customer_key
ORDER BY TotalAmount DESC;

-- The 3 customers with the fewest orders placed

SELECT TOP 3
	customer_key,
	COUNT(DISTINCT order_number) AS TotalOrders
FROM fact_sales
GROUP BY customer_key
ORDER BY TotalOrders;
