📊 SQL Sales Analysis Project

📌 Project Overview

This project is a comprehensive Sales Data Analysis project using SQL, designed to analyze sales performance, customer behavior, product performance, and business trends.

The project uses three relational tables:

- 🛒 Sales Data — transaction-level sales information
- 👥 Customers Data — customer demographics and details
- 📦 Products Data — product and category information

The main objective of this project is to transform raw transactional data into meaningful business insights using SQL.

---

🎯 Project Objectives

The project focuses on answering important business questions such as:

- How is the business performing over time?
- Which products generate the most revenue?
- Which categories contribute the most to sales?
- Who are the most valuable customers?
- How are customers segmented?
- Which products and customers are underperforming?
- How does sales performance change over time?
- What percentage of total sales comes from each category?
- What are the cumulative sales trends?
- How do current sales compare with previous periods?

---

🗂️ Database Structure

The project contains three main tables:

1. 🛒 Sales Table

Contains transaction-level sales information.

Typical information includes:

- Order ID
- Customer ID
- Product ID
- Order Date
- Quantity
- Sales Amount

2. 👥 Customers Table

Contains customer-related information.

Typical information includes:

- Customer ID
- Customer Name
- Age
- Gender
- Location
- Other customer attributes

3. 📦 Products Table

Contains product information.

Typical information includes:

- Product ID
- Product Name
- Category
- Subcategory
- Unit Price
- Other product attributes

🔗 Relationships

Customers
    │
    │ Customer_ID
    ▼
Sales
    │
    │ Product_ID
    ▼
Products

---

🧠 SQL Concepts Used

This project demonstrates a wide range of SQL concepts used in real-world data analysis.

Basic SQL

- "SELECT"
- "WHERE"
- "DISTINCT"
- "ORDER BY"
- "TOP"
- "COUNT"
- "COUNT(DISTINCT ...)"

Aggregations

- "SUM()"
- "COUNT()"
- "AVG()"
- "MIN()"
- "MAX()"

Grouping & Filtering

- "GROUP BY"
- "HAVING"

Window Functions

- "ROW_NUMBER()"
- "RANK()"
- "DENSE_RANK()"
- "SUM() OVER()"
- "AVG() OVER()"
- "LAG() OVER()"

Advanced SQL

- Subqueries
- Common Table Expressions ("CTEs")
- Joins
- Conditional logic
- Aggregations
- Date-based analysis
- Customer and product segmentation

---

📈 Analysis Performed

The project is organized into multiple analytical sections.

1️⃣ Database Exploration

Explored the overall database structure and examined:

- Available tables
- Number of records
- Columns and data types
- Primary business entities
- Relationships between tables

Goal: Understand the structure and contents of the database before performing analysis.

---

2️⃣ Dimensions Exploration

Analyzed important categorical dimensions such as:

- Customers
- Products
- Categories
- Subcategories
- Locations

Used "DISTINCT", "COUNT", and grouping techniques to understand the variety and distribution of dimensions.

---

3️⃣ Date Exploration

Performed date-based analysis to understand:

- First and latest order dates
- Order date range
- Yearly trends
- Monthly trends
- Sales activity across different periods

This helps identify business growth and seasonal patterns.

---

4️⃣ Measures Exploration

Calculated important business metrics such as:

- Total Sales
- Total Quantity Sold
- Total Orders
- Total Customers
- Average Sales
- Average Order Value
- Number of Products

These metrics provide a high-level overview of business performance.

---

5️⃣ Magnitude Analysis

Analyzed the magnitude of business performance across different dimensions.

Examples:

- Sales by category
- Sales by product
- Sales by customer
- Quantity sold by category
- Orders by customer

This helps identify the largest contributors to the business.

---

6️⃣ Ranking Analysis

Used SQL ranking functions to identify top and bottom performers.

Implemented:

ROW_NUMBER()
RANK()
DENSE_RANK()

Examples:

- Top-selling products
- Top customers
- Highest-revenue categories
- Best-performing products within categories

This section demonstrates practical use of SQL Window Functions.

---

7️⃣ Changing Over Time

Analyzed how business performance changes over time.

Examples:

- Year-over-year sales
- Monthly sales trends
- Customer growth
- Product sales trends

Used date functions and aggregation techniques to identify changes in business performance.

---

8️⃣ Cumulative Analysis

Performed cumulative calculations using window functions.

Examples:

- Running total sales
- Cumulative revenue
- Cumulative quantity sold
- Contribution of sales over time

Example concept:

SUM(sales_amount) OVER (
    ORDER BY order_date
)

This helps understand how revenue accumulates throughout the period.

---

9️⃣ Performance Analysis

Compared the performance of different entities and time periods.

Examples:

- Current year vs previous year
- Current month vs previous month
- Product performance over time
- Customer performance over time

Used:

LAG()

and other window functions to perform comparative analysis.

---

🔟 Part-to-Whole Analysis

Analyzed how individual categories, products, and customers contribute to total business performance.

Examples:

- Category percentage of total sales
- Product contribution to total revenue
- Customer contribution to total sales

This helps identify the areas that have the greatest impact on overall revenue.

---

1️⃣1️⃣ Data Segmentation

Segmented customers and products into meaningful business groups.

Customer Segmentation

Customers can be classified based on:

- Total spending
- Number of orders
- Purchase frequency
- Customer value

Example segments:

VIP Customers
Regular Customers
New Customers

Product Segmentation

Products can also be categorized based on:

- Revenue
- Sales volume
- Performance

This allows businesses to focus on their most valuable customer and product segments.

---

👥 1️⃣2️⃣ Customer Report

Created a detailed customer-level report containing important customer metrics such as:

- Customer ID
- Customer Name
- Age
- Total Orders
- Total Sales
- Total Quantity Purchased
- Average Order Value
- Customer Segment
- Customer Age Group

The report provides a consolidated view of customer purchasing behavior and value.

---

📦 1️⃣3️⃣ Product Report

Created a detailed product-level report containing metrics such as:

- Product ID
- Product Name
- Category
- Subcategory
- Total Orders
- Total Quantity Sold
- Total Revenue
- Average Selling Price
- Product Performance
- Product Rank

This report helps identify high-performing and low-performing products.

---

🔍 Key SQL Techniques Demonstrated

The project demonstrates how SQL can be used for an end-to-end analytical workflow:

Raw Data
    ↓
Database Exploration
    ↓
Dimension & Date Exploration
    ↓
Measure Calculation
    ↓
Magnitude Analysis
    ↓
Ranking Analysis
    ↓
Time-Series Analysis
    ↓
Cumulative Analysis
    ↓
Performance Analysis
    ↓
Part-to-Whole Analysis
    ↓
Customer & Product Segmentation
    ↓
Final Customer & Product Reports
    ↓
Business Insights

---

💡 Business Questions Answered

Some of the major business questions addressed in this project include:

Sales

- What is the total revenue generated?
- How many orders were placed?
- How much quantity was sold?
- What is the average order value?
- How are sales changing over time?

Products

- Which products generate the highest revenue?
- Which products sell the most units?
- Which categories perform the best?
- Which products are underperforming?
- What percentage of total revenue does each product contribute?

Customers

- Who are the highest-value customers?
- Which customers generate the most revenue?
- How many orders does each customer place?
- Which customers are VIP, Regular, or New?
- What is the average spending per customer?

Performance

- How does current performance compare with previous periods?
- What are the cumulative sales trends?
- Which categories contribute the most to total revenue?
- Which customers and products have the greatest business impact?

---

🛠️ Tools & Technologies

Tool| Purpose
SQL| Data analysis & business queries
SQL Server| Database & query execution
Git| Version control
GitHub| Project documentation & code sharing

---

📁 Project Structure

SQL-Sales-Analysis/
│
├── README.md
│
├── datasets/
│   ├── sales.csv
│   ├── customers.csv
│   └── products.csv
│
├── sql/
│   ├── 01_database_exploration.sql
│   ├── 02_dimensions_exploration.sql
│   ├── 03_date_exploration.sql
│   ├── 04_measures_exploration.sql
│   ├── 05_magnitude_analysis.sql
│   ├── 06_ranking_analysis.sql
│   ├── 07_changing_over_time.sql
│   ├── 08_cumulative_analysis.sql
│   ├── 09_performance_analysis.sql
│   ├── 10_part_to_whole.sql
│   ├── 11_data_segmentation.sql
│   ├── 12_customer_report.sql
│   └── 13_product_report.sql
│
└── results/
    └── analysis_results/

---

🚀 Skills Demonstrated

Through this project, I strengthened my ability to:

- Analyze relational databases
- Explore and understand datasets
- Write structured SQL queries
- Aggregate large datasets
- Analyze business metrics
- Perform customer analysis
- Perform product analysis
- Perform time-series analysis
- Use SQL Window Functions
- Rank business entities
- Compare current and previous performance
- Calculate cumulative metrics
- Perform segmentation
- Build analytical reports
- Translate business questions into SQL queries

---

📌 Project Outcome

This project demonstrates how SQL can be used not only to retrieve data, but also to perform complete business analysis.

Starting from database exploration, the project progresses through descriptive analysis, ranking, time-based analysis, cumulative calculations, performance comparison, segmentation, and finally customer and product reporting.

The project helped build practical experience in converting raw sales data into actionable business insights using SQL.

---

⭐ Conclusion

This project represents an end-to-end SQL analysis workflow covering both fundamental and advanced SQL concepts.

It demonstrates practical knowledge of:

SQL Fundamentals → Aggregations → Window Functions → CTEs → Subqueries → Time-Series Analysis → Segmentation → Business Reporting

«SQL is not just about querying data — it is about asking the right business questions and turning data into insights.»

---

👨‍💻 Author

D Khyathi Vardhan Reddy

📍 India
💻 Python | SQL | Data Analytics | Django

🔗 GitHub: "Khyathi231"

---

⭐ If you find this project useful, feel free to star the repository!
