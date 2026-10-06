-- =====================
-- Database Exploration
-- =====================

SELECT 
	TABLE_NAME,
	COLUMN_NAME,
	DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
	'dim_sales',
	'dim_products',
	'dim_customers' );