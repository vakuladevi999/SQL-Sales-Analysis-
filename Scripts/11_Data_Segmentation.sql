-- =================
-- Data Segmentation
-- =================

/* Segment products into cost ranges and count 
how many products fall into each segment. */

WITH CTE AS (
SELECT
    product_key,
    product_name,
    cost,
    CASE 
        WHEN cost < 100 THEN 'Below 100'
        WHEN cost BETWEEN 100 AND 500 THEN '100-500'
        WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
    ELSE 'Above 1000'
    END AS Cost_range
FROM dim_products )

SELECT
    Cost_range,
    COUNT(*) AS Total_Products
FROM CTE
GROUP BY Cost_range
ORDER BY Total_Products DESC;

/* Group Customers into three segments based on their spending behaviour:
- VIP: Customers with at least 12 months of history and spending more than 5000.
- Regular: Customers with at least 12 months of history and spending less than 5000.
- New: Customers with a lifespan less than 12 months. */

WITH CTE AS (
SELECT
    customer_key,
    SUM(sales_amount) AS total_amount,
    DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) AS life_span
FROM fact_sales
GROUP BY customer_key )

, CTE2 AS (
SELECT
    *,
    CASE 
        WHEN total_amount > 5000 AND life_span >= 12 THEN 'VIP'
        WHEN total_amount < 5000 AND life_span >= 12 THEN 'Regular'
    ELSE 'New Customer'
    END AS customer_category
FROM CTE)

SELECT
    Customer_category,
    COUNT(*) AS Total_Customers
FROM CTE2
GROUP BY Customer_category;
    