-- ====================
-- Measures Exploration
-- ====================

-- Find the Total Sales
SELECT 'TotalSales' AS MeasureName ,SUM(Sales_Amount) AS 'MeasureValue' FROM fact_sales

UNION ALL
-- Find how many items are sold
SELECT 'TotalQuantity',SUM(Quantity) FROM fact_sales

UNION ALL
-- Find the average selling price
SELECT 'AveraePrice',AVG(Price) FROM fact_sales

UNION ALL
-- Find the Total number of Orders
SELECT 'TotalOrders',COUNT(DISTINCT order_number) FROM fact_sales

UNION ALL
-- Find the Total number of Products
SELECT 'TotalProducts',COUNT(Product_key) FROM fact_sales

UNION ALL
-- Find the Total number of Customers
SELECT 'TotalCustomers',COUNT(Customer_Key) FROM fact_sales




