-- ================
-- Date Exploration
-- ================

-- Find the date of the first and last order.
-- How many years of sales are available.

SELECT
	MIN(Order_Date) AS First_Order_Date,
	MAX(Order_Date) AS Last_Order_Date,
	DATEDIFF(YEAR,MIN(Order_Date),MAX(Order_Date)) AS Order_Range_Years
FROM fact_sales;

-- Find the youngest and the oldest customer.

SELECT
	MIN(Birthdate) AS Oldest_Birthdate,
	DATEDIFF(YEAR,MIN(Birthdate),GETDATE()) AS Oldest_Age,
	MAX(Birthdate) AS Youngest_Birthdate,
	DATEDIFF(YEAR,MAX(Birthdate),GETDATE()) AS Youngest_Age
FROM dim_customers;