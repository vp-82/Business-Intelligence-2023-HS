# Exercise: Create a Sales Data Warehouse Table in BigQuery

## Objectives

- Understand and apply the concept of creating a Data Warehouse (DWH) table in SQL.
- Learn about and use Common Table Expressions (CTEs) in SQL queries.
- Explore the creation of a sales DWH table in BigQuery.
- Complete a skeleton SQL statement to create a DWH table in BigQuery.

## Instructions

### Part 1: Creating a Sales Data Warehouse Table

You will create a Data Warehouse table named `dwh_sales_data` in the `adventureworks` dataset. The table should be created using CTEs to organize the data from various source tables.

**Skeleton:**
```sql
CREATE OR REPLACE TABLE `adventureworks.dwh_sales_data` AS
WITH
  salesorder AS (
    -- Complete the CTE definition here; join salesorderheader, salesorderdetail and dwh_product_with_reviews tables
  )
SELECT
  -- Specify the columns to be included in the final table
FROM
  salesorder;
```

**Your Task:**
Using the provided skeleton, complete the CTE and SELECT statement to create the `dwh_sales_data` table with the specified columns from the `salesorderdetail`, `salesorderheader` and `dwh_product_with_reviews` tables.

Update the script for the `dwh_product_with_reviews` table and convert string fields to numbers where appropriate.
``` sql
 CREATE OR REPLACE TABLE `adventureworks.dwh_product_with_reviews` AS
 ...
    CAST(p.standardcost AS NUMERIC) AS standardcost,
    CAST(p.listprice AS NUMERIC) AS listprice,
...
 ```

---

### Part 2: Revenue Analysis Query

Your task is to write a SQL query that compares various revenue metrics for each year. You will calculate the actual revenue, potential revenue at list price, total discounts given, and revenue loss from the list price.

**Skeleton:**
```sql
SELECT
  EXTRACT(YEAR FROM orderdate) AS year,
  -- Calculate actual revenue
  -- Calculate potential revenue at list price
  -- Calculate total discount given
  -- Calculate revenue loss from list price
FROM
  `adventureworks.dwh_sales_data`
GROUP BY
  year
ORDER BY
  year;
```

**Your Task:**
Complete the query to calculate the required revenue metrics. **Once the query is executed, use Looker Studio to create a bar chart visualizing these metrics by year.**

---

### Part 3: Understanding Date Calculations in SQL

SQL date functions allow you to calculate the duration between two dates, which is essential for analyzing time-related data. Handling NULL values is also crucial, as they can affect the accuracy of your calculations.

**Syntax:**
```sql
SELECT
  DATE_DIFF(date1, date2, interval) AS duration
FROM table
WHERE conditions;
```

**Example:**
To calculate the number of days a product was on sale, you would subtract the sale start date from the sale end date:

```sql
SELECT
  ProductID,
  DATE_DIFF(SaleEndDate, SaleStartDate, DAY) AS DaysOnSale
FROM Products
WHERE SaleEndDate IS NOT NULL;
```

---

### Part 4: Calculating Product Listing Durations

Your task is to calculate the shortest and longest durations for which products were listed in the `dwh_product_with_reviews` table.

**Skeleton:**
```sql
SELECT
  -- Calculate the shortest listing duration
  -- Calculate the longest listing duration
FROM
  `adventureworks.dwh_product_with_reviews`
WHERE
  -- Ensure only products with a defined end date are considered
```

**Your Task:**
Complete the query to find the shortest and longest product listing durations, ensuring you handle NULL values appropriately.

---

### Part 5: Understanding Binning in SQL

Binning, or bucketing, is a process of dividing continuous data into discrete ranges, which helps in data categorization and summarization.

**Syntax:**
```sql
SELECT
  CASE
    WHEN condition THEN 'Label'
    -- Additional conditions
    ELSE 'OtherLabel'
  END AS bin_column,
  COUNT(*) AS metric
FROM table
GROUP BY bin_column;
```

**Example:**
To create bins for age groups, you might categorize ages into 'Youth', 'Adult', and 'Senior':

```sql
SELECT
  CASE
    WHEN age < 18 THEN 'Youth'
    WHEN age BETWEEN 18 AND 64 THEN 'Adult'
    ELSE 'Senior'
  END AS AgeGroup,
  COUNT(*) AS Count
FROM People
GROUP BY AgeGroup;
```

---

### Part 6: Binning Product Price Ranges

Your task is to categorize products into different price ranges and then visualize the distribution of products across these ranges using Looker Studio.

**Skeleton:**
```sql
SELECT
  CASE
    -- Define price range conditions
  END AS price_range,
  COUNT(*) AS product_count
FROM
  `adventureworks.dwh_product_with_reviews`
GROUP BY
  price_range
ORDER BY
  price_range;
```

**Your Task:**
Complete the query to create bins for different product price ranges. **Then, use Looker Studio to create a visualization that shows the distribution of products in each price range.**

