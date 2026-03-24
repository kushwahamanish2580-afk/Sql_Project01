-- data base creation
CREATE DATABASE Retail_sales;

-- table creation	
use Retail_sales;
create table Sales_analysis
(
		transactions_id	INT	primary Key,
        sale_date date,
        Sale_time time,
        customer_id	int,
        gender varchar (10),
        age	int,
        category varchar(15),	
        quantiy	int,
        price_per_unit float,
        cogs	float,
		total_sale float
);

select * FROM Sales_analysis;
-- data imported
SELECT COUNT(*) FROM sales_analysis;
-- data cleaning 
select * FROM Sales_analysis
where 
	"transactions_id" IS Null
	or
    "sale_date" is null
    or
    "Sale_time" is null
    or
    "gender" is null
    or
    "age" is null
    or
    "category" is null
    or
    "quantity" is null
    or
    "price_per_unit" is null
    or
    "cogs" is null
    or
    "total_sale" is null;

-- Data Exploration

-- How many sales we have?

SELECT COUNT(*) as total_sale FROM sales_analysis;

-- How many uniuque customers we have ?

Select count(distinct customer_id) as total_sale from sales_analysis;


-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM
        sales_analysis
		WHERE
        sale_date="2022-11-05";

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022

SELECT *
FROM sales_analysis
WHERE category = 'Clothing'
AND quantiy>=3
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.


SELECT category,
       SUM(total_sale) AS total_sales
FROM sales_analysis
GROUP BY category
ORDER BY total_sales;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT category, avg(age) 
FROM sales_analysis
WHERE category="Beauty";


-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM sales_analysis
WHERE total_sale>1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT category,
       gender,
       SUM(transactions_id) AS total_transactions
FROM sales_analysis
GROUP BY category, gender
ORDER BY gender;


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.

SELECT 
    year,
    month,
    avg_sale
FROM
(
    SELECT 
        year,
        month,
        avg_sale,
        RANK() OVER (PARTITION BY year ORDER BY avg_sale DESC) AS rnk
    FROM
    (
        SELECT 
            EXTRACT(YEAR FROM sale_date) AS year,
            EXTRACT(MONTH FROM sale_date) AS month,
            AVG(total_sale) AS avg_sale
        FROM sales_analysis
        GROUP BY year, month
    ) t
) t1
WHERE rnk = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT customer_id,
       sum(total_sale) as total_sale
FROM sales_analysis
GROUP BY customer_id
ORDER BY total_sale DESC
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT category,
count(distinct(customer_id)) as unique_customer_id
FROM sales_analysis
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sales
AS
(
SELECT *,
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) <12 THEN "Morning"
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN "Afternoon"
        ELSE "Evening"
        END as Shift
FROM sales_analysis
)
SELECT Shift,
      count(*) as total_orders
FROM hourly_sales
GROUP BY Shift;


-- End Of the Project.
