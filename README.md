# Advanced-SQL-Sales-Performance-Analysis-Walmart

<img src="Images/Walmart%20Sales%20Analytics%20with%20MySQL.png" alt="Walmart_Sales_Analytics_with_SQL.png" width="600" height="500">

## Link- Sales Performance Analysis of Walmart Stores Using Advanced MySQL

[ProjectTask](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/WalmartStores_Project.pdf)

[Datasetcsv](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/Walmartsales%20Dataset%20-%20walmartsales.csv)

[WalmartSalesAnalysis](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/WalmartSalesAnalysis%20README.md)

[MySQL](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/WalmartProjectSQL.sql)

[PowerPointPresentation](https://github.com/SatishKumar-ds93/Advanced-SQL-Sales-Performance-Analysis-Walmart/blob/main/walmart_ppt.pptx)

# Summary & Business Problem
Walmart operates across multiple cities and branches, generating thousands of daily retail transactions. To stay competitive and optimize store operations, leadership needs data-driven answers to critical business questions regarding **branch growth, product profitability, customer segmentation, and anomalies**.

Using **MySQL 8.0**, I analyzed **1,000 historical transaction records** across three branches (A, B, and C) to uncover actionable insights that drive revenue growth, customer retention, and fraud/outlier detection.

---

## Tech Stack & Database Architecture

* **Database Management:** MySQL Workbench 8.0 (CTEs, Window Functions `LAG()`, `ROW_NUMBER()`, Subqueries, Aggregations, Date/Time Functions)
* **Data Visualization & Reporting:** Microsoft Excel & PowerPoint


### Database Schema (`walmart_dataset.wsales`)

The dataset was imported into a structured relational table (`wsales`) with strict `NOT NULL` constraints and `Invoice_ID` as the `PRIMARY KEY`:

* **Transaction Details:** `Invoice_ID`, `Date`, `Time`, `Payment`
* **Store & Product Info:** `Branch`, `City`, `Product_line`, `Unit_price`, `Quantity`
* **Financial Metrics:** `Tax`, `Total`, `cogs`, `gross_margin_pct`, `gross_income`
* **Customer Profile:** `Customer_ID`, `Customer_type`, `Gender`, `Rating`


## Key Analytical Insights (10 Business Tasks)

### 1. Branch Growth & Profitability

* **Top Branch by Sales Growth (Task 1):** Using Common Table Expressions (CTEs) and the `LAG()` window function, **Branch A** emerged as the top growth performer. After a dip in February 2019 (-22.82%), Branch A rebounded with a **26.15% month-over-month surge in March 2019** (averaging **1.67%** overall growth).

* **Most Profitable Product Lines by Branch (Task 2):** Profitability varies significantly by location:

  * **Branch C:** *Food and Beverages* led with **$1,130** in gross income.
  * **Branch A:** *Home and Lifestyle* generated **$1,066** in gross income.
  * **Branch B:** *Health and Beauty* topped the branch at **$952** in gross income.


### 2. Customer Segmentation & Loyalty

* **Spending Tiers (Task 3):** Customers were segmented using `CASE` statements into three tiers based on total cumulative spend (ranging from **$17,656 to $26,634**):

  * **High Spenders (>$23,456):** Exclusive VIP tier (led by Customer ID 8).
  * **Medium Spenders ($20,556 – $23,456):** Core revenue-driving segment.
  * **Low Spenders (<$20,556):** Growth opportunity segment.

* **Top 5 Revenue Contributors (Task 9):** Customer **ID 8** is Walmart's #1 revenue generator (**$26,634.34**), followed closely by Customer **ID 3** (**$23,402.26**) and Customer **ID 2** (**$23,392.28**).

* **High Repeat Purchase Rate (Task 8):** Using `DATEDIFF()` and `LAG()`, analysis revealed exceptional short-term retention—all 15 tracked customer IDs made **65 to 66 repeat purchases within 30-day windows**.

* **Preferences by Membership Status (Task 7):** Using `ROW_NUMBER() OVER (PARTITION BY Customer_type)`, **Members** spend most on *Food and Beverages* (**$31,361**), whereas **Normal (non-member)** shoppers favor *Electronic Accessories* (**$29,840**).


### 3. Operational & Demographic Trends

* **Sales Anomaly Detection (Task 4):** By comparing individual invoice totals against product-line averages, outlier transactions exceeding a **50% deviation** were flagged (e.g., Invoice `860-79-0874` in Fashion Accessories at **$1,043** vs. the **$305.04** category average).

* **Localized Payment Preferences (Task 5):** Digital wallets dominate urban hubs—**E-wallet** is the #1 payment method in **Yangon (126 transactions)** and **Mandalay (113 transactions)**, while **Cash** remains king in **Naypyitaw (124 transactions)**.

* **Gender Sales Distribution (Task 6):** **Female shoppers drive 52%** of overall sales volume compared to **48% for Male shoppers**, outperforming males in both January ($59,140 vs. $57,154) and February ($56,328 vs. $40,885).

* **Peak Shopping Days (Task 10):** Using `DAYNAME()`, **Saturday** is the highest-grossing day of the week (**$56,120.81**), followed by **Tuesday ($51,482.25)**, while **Monday** experiences the lowest foot traffic (**$37,899.08**).

---

## Strategic Recommendations for Walmart

1. **Replicate Branch A's Q1 Playbook:** Audit Branch A’s March 2019 promotional and inventory strategies (26.15% growth) and deploy them across Branches B and C.

2. **Convert Normal Shoppers to Members:** Offer targeted membership sign-up discounts at checkout for customers buying *Electronic Accessories*, their top-preferred category.

3. **Optimize Staffing & Promotions by Day:** Increase floor staffing and flash deals on **Saturdays** to maximize peak traffic, and introduce "Monday Motivation" bundle discounts to lift the slowest day of the week.

4. **Tailor Regional Checkout Campaigns:** Partner with E-wallet providers for cashback offers in **Yangon and Mandalay**, while maintaining streamlined cash-handling lanes in **Naypyitaw**.

5. **VIP Retention Program:** Reward the Top 5 customers (especially Customer ID 8) with early access to seasonal sales to protect high-tier revenue.

