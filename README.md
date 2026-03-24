# Sql_Project01

🛒 Retail Sales Analysis – SQL Project
📌 Project Overview

This project focuses on Retail Sales Data Analysis using SQL.
The objective is to perform data cleaning, exploration, and business analysis to extract meaningful insights from transactional retail data.

The project demonstrates strong understanding of:

✅ SQL Database Creation
✅ Data Cleaning
✅ Aggregations & Grouping
✅ Window Functions
✅ Business Problem Solving using SQL

🗂️ Database & Table Structure
📍 Database

Retail_sales

📍 Table

Sales_analysis

Column Name	Data Type	Description
transactions_id	INT (PK)	Unique transaction ID
sale_date	DATE	Date of sale
sale_time	TIME	Time of sale
customer_id	INT	Unique customer ID
gender	VARCHAR	Customer gender
age	INT	Customer age
category	VARCHAR	Product category
quantiy	INT	Quantity sold
price_per_unit	FLOAT	Price per item
cogs	FLOAT	Cost of goods sold
total_sale	FLOAT	Total transaction value
🧹 Data Cleaning

Checked for NULL values across all important columns such as:

Transaction ID
Sale Date & Time
Customer Details
Product Category
Sales Metrics

Ensured dataset quality before performing analysis.

🔍 Data Exploration
✔ Total Number of Sales
SELECT COUNT(*) FROM sales_analysis;
✔ Unique Customers
SELECT COUNT(DISTINCT customer_id) FROM sales_analysis;
📊 Business Problems Solved
⭐ Q1 — Sales on Specific Date

Retrieve all transactions made on 5th Nov 2022

⭐ Q2 — High Quantity Clothing Sales

Transactions where:

Category = Clothing
Quantity ≥ 3
Month = Nov 2022
⭐ Q3 — Total Sales by Category

Helps identify top performing product categories

⭐ Q4 — Average Age (Beauty Category Customers)**

Understand target customer demographics

⭐ Q5 — High Value Transactions

Transactions where Total Sale > 1000

Useful for identifying premium customers / bulk purchases

⭐ Q6 — Transactions by Gender & Category

Analyze shopping behaviour segmentation

⭐ Q7 — Best Selling Month in Each Year ⭐

Used Window Function (RANK) to identify:

Monthly average sales
Best performing month per year
⭐ Q8 — Top 5 Customers by Sales

Identified highest revenue generating customers

⭐ Q9 — Unique Customers per Category

Understand category reach & customer diversity

⭐ Q10 — Sales Shift Analysis 🌅🌞🌙

Sales categorized into:

Shift	Time
Morning	Before 12
Afternoon	12 – 17
Evening	After 17

Helps in store staffing & peak hour planning

🛠️ Tools & Technologies
SQL (MySQL Compatible Queries)
Window Functions
CTE (Common Table Expressions)
Aggregate Functions
📈 Key Insights

✨ Clothing & Beauty categories showed strong customer activity
✨ Peak sales hours identified through shift analysis
✨ Top customers contributed significantly to revenue
✨ Monthly trend analysis helped identify seasonal performance

🚀 How to Use
Create Database
Create Table using provided schema
Import Retail Sales Dataset
Run queries sequentially
👨‍💻 Author

Manish Kushwaha
Aspiring Data Analyst
