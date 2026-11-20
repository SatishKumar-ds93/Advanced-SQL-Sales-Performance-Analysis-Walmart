# Walmart Sales Performance Analysis Using Advanced MySQL

![](Images/Walmart_Sales_Performance_Dashboard.jpg)

## Introduction

Walmart, a major retail chain, operates across several cities, offering a wide range of products. The dataset provided contains detailed transaction data, including customer demographics, product lines, sales figures, and payment methods. This project will use advanced SQL techniques to uncover actionable insights into sales performance, customer behavior, and operational efficiencies

## 1. Project Overview

In this project, I performed a **Sales Performance Analysis of Walmart Stores using Advanced MySQL Techniques** to explore historical sales transactions, identify business trends, and answer important business questions.

The project focuses on analyzing sales performance across different branches, understanding customer spending patterns, evaluating product profitability, identifying unusual transactions, and discovering purchasing trends.

Using MySQL, I transformed transactional data into meaningful business insights and presented the findings through Excel charts and a PowerPoint presentation.

---

## 2. Business Problem

Walmart operates across multiple cities and offers different product categories to customers with varying purchasing preferences.

**Business Objective:** Analyze historical Walmart sales transactions using advanced SQL queries to identify actionable insights that can support better business decisions, improve sales strategies, and enhance customer engagement.

The business needs to understand:

- Which branch demonstrates the strongest sales growth?
- Which product lines contribute the most profit to each branch?
- Who are the high-value customers?
- Are there unusual or potentially suspicious sales transactions?
- Which payment methods are preferred in different cities?
- How do purchasing patterns differ between male and female customers?
- Which products are preferred by members and normal customers?
- Which customers make repeat purchases?
- Who are the top revenue-generating customers?
- Which days of the week generate the highest sales?


---

## 3. Project Objectives

The primary objectives of this project are:

1. Analyze branch-wise sales performance and monthly growth.
2. Identify the most profitable product line for each branch.
3. Segment customers based on their purchasing behavior.
4. Detect unusual sales transactions using statistical techniques.
5. Identify popular payment methods across different cities.
6. Analyze monthly sales distribution by gender.
7. Understand product preferences across customer types.
8. Identify customers making repeat purchases within 30 days.
9. Find the top five customers based on sales revenue.
10. Analyze sales trends across different days of the week.

---

## 4. Tools and Technologies

| Tool | Purpose |
| :--- | :--- |
| **MySQL** | Database creation, data management, SQL querying, and analysis |
| **MySQL Workbench** | Database administration and executing SQL queries |
| **Microsoft Excel** | Data visualization, charts, and graphical representation |
| **Microsoft PowerPoint** | Presenting analytical findings and business insights |

### SQL Techniques Used

- Database and table creation
- Data importing and exploration
- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY` , `LIMIT`
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`
- `JOIN` operations
- Subqueries and Common Table Expressions (CTEs), where applicable
- Window functions, where applicable `LAG`
- `CASE` statements
- Date and time functions `DATE`
- Statistical calculations
- Customer segmentation
- Sales growth calculations
- Anomaly detection


---

## 5. Dataset Description
The project uses the Walmart sales transaction dataset containing **1,000 records**.

The dataset includes transaction-level information related to:

- Invoice ID
- Branch
- City
- Customer type
- Gender
- Product line
- Unit price
- Quantity
- Tax
- Total sales
- Date and time
- Payment method
- Cost of goods sold
- Gross income
- Rating

Each `Invoice ID` represents a unique transaction identifier. The dataset provides information about customer demographics, product categories, transaction values, and payment preferences.

**Dataset source:** [Walmartsales_Dataset](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/Walmartsales%20Dataset%20-%20walmartsales.csv)

---

## 6. Database Preparation and Data Import

The first step was to create a MySQL database and import the Walmart sales CSV file.

### Step 1: Create Database
```sql
CREATE DATABASE walmart_dataset;
```

![](Images/create%20dataset.png)

### Step 2: Select Database
```sql
USE walmart_dataset;
```

### Step 3: Create Table

I created a table named `wsales` to store the Walmart sales transaction records.

![](Images/create%20table.png)


### Step 4: Import CSV File

Imported the Walmart sales dataset into MySQL Workbench.

![](Images/import%20dataset.png)

### Step 5: Verify Imported Records
```sql
SELECT *
FROM walmart_dataset.wsales;
```
The database successfully imported **1,000 transaction records**.

---

![](Images/table%20insert.png)


## 7. TASK: 

Solution of Task 1 to 10

### Task 1: Identifying the Top Branch by Sales Growth Rate

- **Business Question:** Which Walmart branch experienced the highest sales growth over the observed months?
- **Analysis:** Calculated total sales for each branch across January, February, and March, then compared monthly sales growth rates.
- **Queries:**

  - Total Sales

![](Images/Task1%20Total%20Montly%20sales%20by%20each%20Branch.png)

  - Average growth rate

![](Images/Task1%20average%20growth%20rate%20by%20A.png)

  - Highest Growth Rate

![](Images/Task1%20highest%20growth%20rate.png)

- **Key Findings:**
  - Branch A recorded the highest reported monthly growth rate.
  - Its March 2019 growth rate was approximately **26.15%**.
- **Business Recommendation:** Investigate the factors behind Branch A's growth and evaluate whether its successful sales strategies can be replicated across other branches.


### Task 2: Finding the Most Profitable Product Line for Each Branch

- **Business Question:** Which product line contributes the highest profit to each branch?
- **Analysis:** Compared gross income and cost of goods sold to evaluate product-level profitability across the branches.
- **Queries:**

![](Images/Task2%20highest%20profit%20by%20each%20branch%20of%20product%20line.png)

- **Key Findings:**

| Branch | Top Product Line | Reported Value |
| :--- | :--- | :--- |
| **A** | Home and Lifestyle | 1,066 |
| **B** | Health and Beauty | 952 |
| **C** | Food and Beverages | 1,130 |

- **Business Recommendation:** Evaluate product-level costs, pricing, and gross income to identify opportunities for improving profitability.

### Task 3: Analyzing Customer Segmentation Based on Spending

- **Business Question:** How can customers be classified according to their total purchasing amounts?
- **Analysis:** Aggregated customer purchase amounts and classified customers into three spending categories:
  - High Spenders
  - Medium Spenders
  - Low Spenders
- **Queries**:

  - Total Spending by Customer

![](Images/Task3%20total%20spending%20by%20customer.png)

  - Average Spending by Customer

![](Images/Task3%20avg%20spending%20by%20customer.png)

  - Tier wise Customer Segmentation

![](Images/Task3%20tier%20wise%20customer%20segment.png)

- **Key Finding:** The analysis identified different spending levels, with the highest reported individual customer spending of approximately **$26,634**.
- **Business Recommendation:** Develop targeted loyalty programs, personalized offers, and retention campaigns for high-value customers.

### Task 4: Detecting Anomalies in Sales Transactions

- **Business Question:** Are there transactions with unusually high or low sales compared with their product-line averages?
- **Analysis:** Compared individual transaction amounts against product-line averages and standard deviations to identify unusual observations.
- **Queries**:

![](Images/Task4%20anomolies%20compared%20to%20the%20average%20sales%20for%20the%20product%20line.png)


- **Key Finding:** One highlighted transaction was identified as an anomaly:
  - **Invoice ID:** `283-26-5248`
  - **Product Line:** Food and Beverages
  - **Sales Amount:** $1,034.46
  - **Product-Line Average:** $323.64
  - **Standard Deviation:** $236.76
- **Business Recommendation:** Review unusually large transactions to determine whether they represent bulk purchases, exceptional customer behavior, or possible data-quality issues.

### Task 5: Most Popular Payment Method by City

- **Business Question:** Which payment methods are most frequently used by customers in different cities?
- **Analysis:** Grouped transactions by city and payment method and compared transaction frequencies.
- **Queries**:

![](Images/Task5%20most%20popular%20payment%20method%20in%20each%20city.png)

- **Key Findings:**

| City | Most Popular Payment Method | Transactions |
| :--- | :--- | :--- |
| **Mandalay** | E-wallet | 113 |
| **Naypyitaw** | Cash | 124 |
| **Yangon** | E-wallet | 126 |

- **Business Recommendation:** Optimize payment-related promotions and customer convenience according to regional payment preferences.

### Task 6: Monthly Sales Distribution by Gender

- **Business Question:** How does monthly sales revenue differ between male and female customers?
- **Analysis:** Grouped total sales by month and gender to understand differences in purchasing patterns.
- **Queries**:

  - Monthly sales by Gender

![](Images/Task6%20montly%20total%20sales%20dsitribution%20by%20gender.png)

  - Highest monthly sales by Gender

![](Images/Task6%20highes%20monthly%20sales%20distribution%20by%20gender.png)

- **Key Findings:**
  - **January:** Female sales were **$59,140**, compared with male sales of **$57,154**.
  - **February:** Female sales were **$56,328**, compared with male sales of **$40,885**.
  - **March:** Male sales were **$57,052**, compared with female sales of **$52,411**.
  - Overall, female customers contributed approximately **52%** of reported sales.
- **Business Recommendation:** Use gender-based purchasing trends as one input when developing customer-focused marketing campaigns, without relying on gender alone for customer targeting.

### Task 7: Best Product Line by Customer Type

- **Business Question:** Which product lines are preferred by Member and Normal customers?
- **Analysis:** Compared sales across product lines for the two customer categories.
- **Queries**:

  - Best Product Line By Customer Type

![](Images/Task7%20best%20product%20line%20total%20sales%20with%20customer%20type.png)

  - Best Product Line Member vs Normal

![](Images/Task7%20best%20product%20line%20total%20sales%20with%20customer%20type.png)

- **Key Findings:**

| Customer Type | Top Product Line | Reported Sales |
| :--- | :--- | :--- |
| **Member** | Food and Beverages | $31,357.62 |
| **Normal** | Electronic Accessories | $29,839.04 |

- **Business Recommendation:** Develop targeted product promotions and member-exclusive offers based on observed purchasing preferences.

### Task 8: Identifying Repeat Customers

- **Business Question:** Which customers made multiple purchases within a 30-day period?
- **Analysis:** Examined customer transaction dates and identified repeat purchases within the specified timeframe.
- **Queries**:

![](Images/Task8%20customers%20repeat%20purchases%20within%2030%20days.png)

- **Key Findings:**
  - **Customer group 1–10:** 66 reported repeat purchases.
  - **Customer group 11–15:** 65 reported repeat purchases.
- **Business Recommendation:** Identify customers with consistent purchasing behavior and introduce loyalty incentives to encourage continued engagement.

### Task 9: Finding Top 5 Customers by Sales Volume

- **Business Question:** Who are the five highest revenue-generating customers?
- **Analysis:** Aggregated total sales revenue by customer and ranked customers based on their contribution.
- **Queries**:

![](Images/Task9%20top%205%20customers%20revnue%20generate%20sales%20volume.png)

- **Key Findings:**

| Customer ID | Total Sales |
| :--- | :--- |
| **8** | $26,634.34 |
| **3** | $23,402.26 |
| **2** | $23,392.28 |
| **15** | $22,674.46 |
| **1** | $22,634.55 |

- **Business Recommendation:** Recognize high-value customers through loyalty rewards, personalized promotions, and retention initiatives.

### Task 10: Analyzing Sales Trends by Day of the Week

- **Business Question:** Which days of the week generate the highest sales revenue?
- **Analysis:** Extracted the day of the week from transaction dates and calculated total sales for each day.
- **Queries**:

  - Days of Week

![](Images/Task10%20day%20of%20week%20wise%20total%20sales.png)

  - Highest Sales Day

![](Images/Task10%20highest%20sales%20day.png)

- **Key Findings:**

| Day | Reported Total Sales |
| :--- | :--- |
| **Saturday** | $56,120.81 |
| **Tuesday** | $51,482.25 |
| **Thursday** | $45,349.25 |
| **Sunday** | $44,457.89 |
| **Friday** | $43,926.34 |
| **Wednesday** | $43,731.14 |
| **Monday** | $37,899.08 |

- **Business Recommendation:** Consider increasing promotional activities, inventory availability, and operational readiness on high-sales days, particularly Saturdays.

---

## 8. Overall Business Insights

The analysis provides several useful observations:

1. **Branch Performance:** Branch A demonstrated a strong reported monthly sales growth rate.
2. **Product Profitability:** Different branches have different leading product lines, highlighting the importance of branch-level product strategies.
3. **Customer Segmentation:** Customer spending patterns provide opportunities for targeted marketing and loyalty programs.
4. **Anomaly Detection:** Unusual transaction values can help identify records requiring further investigation.
5. **Payment Preferences:** Payment behavior differs across cities.
6. **Customer Behavior:** Gender and customer-type analysis provides additional perspectives on purchasing patterns.
7. **Customer Retention:** Repeat purchases and high-value customers offer opportunities to strengthen customer relationships.
8. **Weekly Sales Trends:** Saturday recorded the highest reported sales, while Monday recorded the lowest.

---

## 9. Business Recommendations

Based on the analysis, the following actions could help improve retail performance:

- Replicate successful branch-level sales strategies where appropriate.
- Review product profitability and optimize product-level pricing and costs.
- Introduce customer segmentation-based loyalty programs.
- Investigate unusual sales transactions and improve data-quality monitoring.
- Customize payment promotions according to city-level preferences.
- Develop targeted product campaigns based on customer purchasing behavior.
- Encourage repeat purchases through customer retention initiatives.
- Plan staffing, promotions, and inventory according to weekly sales trends.

---

## 10. Project Conclusion

This project demonstrates how SQL can be used to convert raw retail transaction data into meaningful business insights.

By analyzing 1,000 Walmart sales transactions, I explored branch performance, product profitability, customer segmentation, transaction anomalies, payment preferences, repeat purchases, top customers, and weekly sales trends.

The project strengthened my practical understanding of MySQL database management, advanced SQL querying, analytical thinking, and business problem-solving.

It also demonstrated the importance of connecting technical SQL analysis with business objectives and communicating findings through visual presentations.


## Additional Task: Interactive Sales Dashboard Creation Using Microsoft Excel

### 1. Overview

[Walmart Dashboard](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/Images/Walmart_Sales_Performance_Dashboard.jpg)

After completing the Walmart Sales Performance Analysis using advanced MySQL queries, I extended the project by creating an additional sales performance dashboard using **Microsoft Excel**.

This dashboard was not part of the original project requirements. I independently performed this additional task to transform the SQL analysis results into a more visual and interactive reporting solution.

The objective was to convert the analytical results exported from MySQL into structured Excel data, prepare the data using **Power Query**, summarize key business metrics using **PivotTables**, and present the findings through charts and a consolidated dashboard.

---

### 2. Tools and Technologies

[Walmart Dashboard Excel](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/Walmart_Sales_Performance_Dashboard.xlsx)

- **MySQL:** Extracted and analyzed Walmart sales data using SQL queries.
- **Microsoft Excel:** Imported and organized the SQL query results.
- **Power Query Editor:** Prepared, cleaned, and transformed the exported data.
- **PivotTables:** Summarized sales performance across different business dimensions.
- **PivotCharts / Excel Charts:** Visualized important business metrics and trends.
- **Excel Dashboard:** Consolidated the analysis into a visual reporting interface.


---

### 3. Dashboard Development Workflow

The dashboard was developed through the following steps:

#### Step 1: Export SQL Analysis Results

After completing the MySQL analysis tasks, I exported the corresponding query results into Excel for further analysis and visualization.

#### Step 2: Data Preparation Using Power Query

- Imported the exported SQL result files into Excel.
- Checked column names, data types, and data consistency.
- Applied the required data transformation and cleaning steps.
- Prepared structured datasets for PivotTable analysis.

#### Step 3: Create PivotTables

Created PivotTables to summarize the SQL analysis results and organize the data into meaningful business categories, including sales trends, customer segments, gender-wise sales, product-line performance, and customer rankings.

#### Step 4: Create PivotCharts and Visualizations

Used Excel charts to represent the summarized results and make the findings easier to understand.

#### Step 5: Design the Dashboard

Combined the key visualizations into a consolidated dashboard using a Walmart-inspired **blue and yellow** colour theme.

---

### 4. Dashboard Components and Business Metrics

The dashboard presents the following key analysis areas:

| Dashboard Component | Business Purpose |
| :--- | :--- |
| **Sales by Day of Week** | Identify the highest and lowest sales days. |
| **Sales Distribution by Gender** | Compare male and female customer sales. |
| **Branch-wise Product-Line Contribution** | Compare the leading product-line values reported for each branch. |
| **Customer Spending Segments** | Understand the distribution of high, medium, and low spending segments. |
| **Top 5 Customers by Sales** | Identify the highest revenue-generating customers. |
| **Average Sales by Product Line** | Compare average sales performance across product categories. |

---

### 5. Key Benefits of the Additional Dashboard

- Converted SQL query outputs into visual business reports.
- Improved the presentation and interpretation of analytical findings.
- Demonstrated the use of Power Query for data preparation.
- Applied PivotTables to summarize business data.
- Used charts to communicate sales trends and customer behaviour.
- Extended the original SQL project into a practical reporting and business intelligence workflow.

---

### 6. Project Extension: From SQL Analysis to Excel Reporting

This additional task demonstrates how SQL analysis can be extended into an Excel-based reporting workflow:

`MySQL` ➔ `Excel Export` ➔ `Power Query` ➔ `PivotTables` ➔ `PivotCharts` ➔ `Sales Dashboard`

The combined project demonstrates practical skills in data extraction, data preparation, aggregation, visualization, and business reporting.

---

### 7. Deliverable

- **Excel Dashboard:** `Walmart_Sales_Performance_Dashboard.xlsx`
- **Dashboard Sheets:** `Dashboard`, `Chart_Data`, and `Read_Me`
- **Project Analysis:** MySQL query solutions and PowerPoint presentation

> **Note:** The Excel dashboard is an additional deliverable created beyond the original MySQL project requirements.

------------------------------------ END --------------------------------------------------------
