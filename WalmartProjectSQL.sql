CREATE database walmart_dataset;

USE walmart_dataset;

CREATE TABLE wsales(
Invoice_ID VARCHAR(50) NOT NULL PRIMARY KEY,
Branch VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,
Customer_type VARCHAR(30) NOT NULL,
Gender VARCHAR(10) NOT NULL,
Product_line VARCHAR(50) NOT NULL,
Unit_price DECIMAL(10, 2) NOT NULL,
Quantity INT(20) NOT NULL,
Tax DECIMAL (10, 2) NOT NULL,
Total DECIMAL(10) NOT NULL,
Date DATE NOT NULL,
Time TIME NOT NULL,
Payment VARCHAR(20) NOT NULL,
cogs DECIMAL(10) NOT NULL,
gross_margin_pct DECIMAL(10),
gross_income DECIMAL(10) NOT NULL,
Rating DECIMAL(4) NOT NULL,
Customer_ID (50) NOT NULL
);


SELECT * FROM walmart_dataset.wsales;

USE walmart_dataset;

SELECT * FROM walmart_dataset.wsales;


## Task 1: Identifying the Top Branch by Sales Growth Rate
-- Walmart wants to identify which branch has exhibited the highest sales growth over time. 
-- Analyze the total sales for each branch and compare the growth rate across months to find the top performer.

-------- Total Sales by Each Branch per Month

SELECT Branch, 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
    SUM(Total) AS Total_Sales
FROM wsales
GROUP BY Branch, Month
ORDER BY Branch, Month;

WITH MonthlySales AS(
    SELECT Branch, 
        DATE_FORMAT(Date, '%Y-%m') AS Month, 
        SUM(Total) AS Total_Sales
    FROM wsales
    GROUP BY Branch, Month
)

-- Growth Rate

SELECT Branch, Month, 
    Total_Sales,
    (Total_Sales - LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month)) / LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month) 
    AS Growth_Rate
FROM MonthlySales
ORDER BY Branch, Month;

-- Branch with Highest Growth Rate

SELECT * FROM walmart_dataset.wsales;

WITH MonthlySales AS (
    SELECT 
        Branch, 
        DATE_FORMAT(Date, '%Y-%m') AS Month, 
        SUM(Total) AS Total_Sales
    FROM 
        wsales
    GROUP BY 
        Branch, 
        Month
),

GrowthRates AS (
    SELECT 
        Branch, 
        Month, 
        (Total_Sales - LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month)) / LAG(Total_Sales) OVER (PARTITION BY Branch ORDER BY Month) 
        AS Growth_Rate
    FROM 
        MonthlySales
)

-- Average Growth Rate by Branch A
SELECT 
    Branch, 
    AVG(Growth_Rate) AS Avg_Growth_Rate
FROM 
    GrowthRates
GROUP BY 
    Branch
ORDER BY 
    Avg_Growth_Rate DESC
LIMIT 1;



SELECT * FROM walmart_dataset.wsales;

## Task 2: Finding the Most Profitable Product Line for Each Branch
-- Walmart needs to determine which product line contributes the highest profit to each branch.
-- The profit margin should be calculated based on the difference between the gross income and cost of goods sold.

-- Calcultion of profit(gross_income) which is equal to the difference between total(cogs+tax5%) and revenue or cogs(unit price x quantity)

USE walmart_dataset; 
 
SELECT 
    Branch,
    Product_line,
    SUM(gross_income) AS Total_Profit
FROM wsales
GROUP BY Branch, Product_line
ORDER BY Branch, Total_Profit DESC;

-- To Find the Maximum Profit each Branch:

WITH ProfitData AS (
    SELECT 
        Branch,
        Product_line,
        SUM(gross_income) AS Total_Profit
    FROM wsales
    GROUP BY Branch, Product_line
)

-- Highest Profit Product Line

SELECT 
    Branch,
    Product_line,
    Total_Profit
FROM ProfitData
WHERE (Branch, Total_Profit) IN (
    SELECT 
        Branch,
        MAX(Total_Profit)
    FROM ProfitData
    GROUP BY Branch
);


SELECT * FROM walmart_dataset.wsales;

## Task 3: Analyzing Customer Segmentation Based on Spending
-- Walmart wants to segment customers based on their average spending behavior. 
-- Classify customers into three tiers: High, Medium, and Low spenders based on their total purchase amounts.

-- average spending by customer

SELECT
  Customer_ID,
  AVG(Total) AS avg_spending
  FROM wsales
GROUP BY Customer_ID;

-- TotalSpending by customer

SELECT
  Customer_ID,
  SUM(Total) AS total_spending
  FROM wsales
GROUP BY Customer_ID;

-- -- Classify customers into three tiers: High, Medium, and Low spenders 

WITH customer_spending AS ( 
 SELECT Customer_ID, round(SUM(Total),2) AS TotalSpending
    FROM wsales
    GROUP BY Customer_ID
)

SELECT Customer_ID, TotalSpending,
    CASE 
        WHEN TotalSpending < 20556 THEN 'Low'
        WHEN TotalSpending BETWEEN 20556 AND 23456 THEN 'Medium'
        ELSE 'High'
    END AS Tiers
FROM customer_spending;


SELECT * FROM walmart_dataset.wsales;

## Task 4: Detecting Anomalies in Sales Transactions
-- Walmart suspects that some transactions have unusually high or low sales compared to the average for the product line. 
-- Identify these anomalies

-- Calculate average sales per product line

WITH AvgSales AS (
    SELECT 
        Product_line, 
        AVG(Total) AS Avg_Sales
    FROM 
        wsales
    GROUP BY 
        Product_line
)

-- compare average sales with deviation

SELECT 
    ws.Invoice_ID, 
    ws.Branch, 
    ws.City, 
    ws.Product_line, 
    ws.Total,
    avg.Avg_Sales,
    (ws.Total - avg.Avg_Sales) / avg.Avg_Sales AS Deviation
FROM 
    wsales AS ws

JOIN 
    AvgSales AS avg 
ON ws.Product_line = avg.Product_line
WHERE 
    ABS((ws.Total - avg.Avg_Sales) / avg.Avg_Sales) > 0.5
ORDER BY 
    Deviation DESC;
    
-- Noted: ABS referes to Absolute non-negative number value which is equql to Total - Avg Sales/ Avg Sales or (Deviation) > 0.5


SELECT * FROM walmart_dataset.wsales;

## Task 5: Most Popular Payment Method by City
-- Walmart needs to determine the most popular payment method in each city to tailor marketing strategies

WITH RankedPayments AS (
    SELECT City, Payment, 
        COUNT(*) AS Payment_Count,
        ROW_NUMBER() OVER (PARTITION BY City ORDER BY COUNT(*) DESC) AS rn
    FROM 
        wsales
    GROUP BY 
        City, Payment
)
-- Popular Payment method and Top City
SELECT 
    City, 
    Payment, 
    Payment_Count
FROM 
    RankedPayments
WHERE 
    rn = 1;



SELECT * FROM walmart_dataset.wsales;

## Task 6: Monthly Sales Distribution by Gender
-- Walmart wants to understand the sales distribution between male and female customers on a monthly basis.

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
    Gender, 
    SUM(Total) AS Total_Sales
FROM 
    wsales
GROUP BY 
    Month, 
    Gender
ORDER BY 
    Month, 
    Gender;

-- Bonus Highest Monthly Distribution by Gender

SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
    Gender, 
    SUM(Total) AS Total_Sales
FROM 
    wsales
GROUP BY 
    Month, 
    Gender
ORDER BY 
    Month, 
    Gender ASC
LIMIT 2;


SELECT * FROM walmart_dataset.wsales;

## Task 7: Best Product Line by Customer Type
-- Walmart wants to know which product lines are preferred by different customer types(Member vs. Normal).

WITH BestProductLine AS(
SELECT 
    Customer_type, 
    Product_line, 
    SUM(Total) AS Total_Sales,
    ROW_NUMBER() OVER (PARTITION BY Customer_type ORDER BY SUM(Total) DESC) AS rn
FROM 
    wsales
GROUP BY 
    Customer_type, 
    Product_line
)

SELECT 
	Customer_type,
    Product_line,
    Total_Sales
FROM
	BestProductLine
WHERE
		rn=1;



SELECT * FROM walmart_dataset.wsales;

## Task 8: Identifying Repeat Customers
-- Walmart needs to identify customers who made repeat purchases within a specific time frame (e.g., within 30 days).


SELECT DISTINCT Customer_ID
FROM (
SELECT Customer_ID,
Date,
LAG(Date) OVER (PARTITION BY Customer_ID ORDER BY Date) AS prev_purchase_date
FROM wsales
) 

-- within 30 days
AS subquery
WHERE DATEDIFF(Date, prev_purchase_date) <= 30 AND prev_purchase_date IS NOT NULL;

-- repeat purchase within 30 days

SELECT Customer_ID,
COUNT(*) AS repeat_purchase_count
FROM (
SELECT 
Customer_ID,
Date,
LAG(Date) OVER (PARTITION BY Customer_ID ORDER BY Date) AS prev_purchase_date
FROM wsales
) 

-- purchase count by each cutsomer

AS subquery
WHERE DATEDIFF(Date, prev_purchase_date) <= 30 AND prev_purchase_date IS NOT NULL
GROUP BY Customer_ID;




SELECT * FROM walmart_dataset.wsales;

## Task 9: Finding Top 5 Customers by Sales Volume
-- Walmart wants to reward its top 5 customers who have generated the most sales Revenue

SELECT 
    Customer_ID, 
    SUM(Total) AS Total_Sales
FROM 
    wsales
GROUP BY 
    Customer_ID
ORDER BY 
    Total_Sales DESC
LIMIT 5;



SELECT * FROM walmart_dataset.wsales;

## Task 10: Analyzing Sales Trends by Day of the Week (6 Marks)
-- Walmart wants to analyze the sales patterns to determine which day of the week brings the highest sales.

SELECT 
    DAYNAME(Date) AS Day_of_Week, 
    SUM(Total) AS Total_Sales
FROM 
    wsales
GROUP BY 
    Day_of_Week
ORDER BY 
    FIELD(Day_of_Week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');


-- Highest sales in weekdays

SELECT
    DAYNAME(Date) AS Day_of_Week,
    SUM(Total) AS Total_Sales
FROM walmart_dataset.wsales
GROUP BY DAYNAME(Date)
ORDER BY Total_Sales DESC
LIMIT 1;


----------------------- END ----------------------------------------