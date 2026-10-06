/*
==============
Product Report
==============
Purpose: This report consolidates key product metrics and behaviors.

Highlights:
    1. Gathers essential fields such as product name, category, subcategory, and cost.
    2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total customers (unique)
       - lifespan (in months)
    4. Calculates valuable KPIs:
       - recency (months since last sale)
       - average order revenue (AOR)
       - average monthly revenue */

-- ==============
-- ProductMetrics
-- ==============

WITH ProductMetrics AS (
SELECT
    P.product_id,
    P.product_name,
    P.category,
    P.subcategory,
    P.cost,
    COUNT(S.order_number) AS total_orders,
    SUM(S.sales_amount) AS total_sales,
    SUM(S.quantity) AS total_quantity,
    DATEDIFF(MONTH,MIN(S.order_date),MAX(S.order_date)) AS lifespan,
    DATEDIFF(MONTH,MAX(S.order_date),GETDATE()) recency,
    SUM(S.sales_amount) / COUNT(S.order_number) AS average_order_value,
    SUM(S.sales_amount) / DATEDIFF(MONTH,MIN(S.order_date),MAX(S.order_date)) AS average_monthly_revenue
FROM dim_products AS P
LEFT JOIN fact_sales AS S
ON P.product_key = S.product_key
GROUP BY 
    P.product_id,
    P.product_name,
    P.category,
    P.subcategory,
    P.cost ),
        -- =============
        -- ProductSegment
        -- ==============
        ProductSegment AS (
        SELECT
            product_id,
            CASE 
                WHEN total_sales > 1000000 THEN 'High-performance'
                WHEN total_sales > 500000 THEN 'Mid-performance'
                ELSE 'Low-performance'
            END AS ProductSegment
        FROM ProductMetrics )

-- ==============
-- Product Report
-- ==============
SELECT
    PM.*,
    PS.ProductSegment
FROM ProductMetrics AS PM
JOIN ProductSegment AS PS
ON PM.product_id = PS.product_id;

