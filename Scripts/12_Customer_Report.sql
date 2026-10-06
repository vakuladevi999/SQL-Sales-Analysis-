/*
========================
Customer Report
========================

Purpose:
This report consolidates key customer metrics and behaviors.

Highlights:
1. Gathers essential customer information.
2. Segments customers into categories(VIP, Regular, New) and age groups.
3. Calculates customer-level metrics:
   - Total Orders
   - Total Sales
   - Total Quantity Purchased
   - Total Products Purchased
   - Customer Lifespan
4. Calculates important KPIs:
   - Recency
   - Average Order Value
   - Average Monthly Spend
*/
-- ===============
-- CustomerMeteics
-- ===============

WITH CustomersMetrics AS (
SELECT
	C.customer_key,
	CONCAT(C.first_name,' ',C.last_name) AS customer_name,
	COUNT(S.order_number) AS total_orders,
	SUM(S.sales_amount) AS total_sales,
	SUM(S.quantity) AS total_quantity,
	COUNT(S.product_key) AS total_products,
	DATEDIFF(MONTH,MIN(S.order_date),MAX(S.order_date)) AS customer_lifespan_in_months,
	DATEDIFF(MONTH,MAX(S.order_date),GETDATE()) AS recencymonths,
	DATEDIFF(YEAR,C.birthdate,GETDATE()) AS customer_age,
	SUM(S.sales_amount) / COUNT(S.order_number) AS average_order_value,
	SUM(S.sales_amount) / NULLIF(DATEDIFF(MONTH,MIN(S.order_date),MAX(S.order_date)),0) AS average_monthly_spend
FROM dim_customers AS C
LEFT JOIN fact_sales AS S
ON S.customer_key = C.customer_key
GROUP BY 
	C.customer_key,
	C.first_name,
	C.last_name,
	C.birthdate ),

	-- ===============
	-- CustomerSegment
	-- ===============

	CustomerSegment AS (
	SELECT
		customer_key,
		CASE
			WHEN total_sales > 5000 AND customer_lifespan_in_months >= 12 THEN 'VIP'
			WHEN total_sales < 5000 AND customer_lifespan_in_months >= 12 THEN 'Regular'
			ELSE 'New'
		END AS customer_segment
	FROM CustomersMetrics),

	-- ================
	-- CustomerAgeGroup
	-- ================

	CustomerAgeGroup AS (
		SELECT
			customer_key,
			CASE
				WHEN customer_age < 20 THEN 'Below 20'
				WHEN customer_age BETWEEN 20 AND 29 THEN '20-29'
				WHEN customer_age BETWEEN 30 AND 39 THEN '30-39'
				WHEN customer_age BETWEEN 40 AND 49 THEN '40-49'
				WHEN customer_age BETWEEN 50 AND 59 THEN '50-59'
				ELSE '60+'
			END AS customer_age_group
		FROM CustomersMetrics )

-- ==============
-- CustomerReport
-- ==============

SELECT
	CM.customer_key,
	CM.customer_name,
	CM.customer_age,
	CA.customer_age_group,
	CM.customer_lifespan_in_months,
	CM.recencymonths,
	CM.total_orders,
	CM.total_sales,
	CM.total_quantity,
	CM.total_products,
	CM.average_order_value,
	CM.average_monthly_spend,
	CS.customer_segment
FROM CustomersMetrics AS CM
JOIN CustomerSegment AS CS
ON CM.customer_key = CS.customer_key
JOIN CustomerAgeGroup AS CA
ON CM.customer_key = CA.customer_key;