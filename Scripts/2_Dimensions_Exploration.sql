-- ======================
-- Dimensions Exploration
-- ======================

-- Explore All Countries our customers come from.

SELECT DISTINCT Country FROM dim_customers;

-- Explore All Categories "The major Divisions"

SELECT DISTINCT Category, subcategory, product_name FROM dim_products
ORDER BY category, subcategory, product_name;