# Exercise: Visualizing Sales Data in Looker Studio

## Objectives
- Craft SQL queries to gather sales data by state/province and analyze monthly sales trends.
- Utilize Looker Studio to create visual representations of this data.

## Instructions

### Part 1: SQL Query for State/Province Sales Data
Write a SQL query to calculate the total sales data by state/province within the United States, including the subtotal, taxes, and freight charges.

#### Query Skeleton
```sql
SELECT
  -- Placeholder for the state/province column (replace with actual column name)
  SUM(CAST([SUBTOTAL_COLUMN] AS FLOAT64)) AS total_subtotal,
  -- Additional placeholders for tax, freight, and total sales (replace with actual column names and calculations)
FROM
  `adventureworks.[SALES_TABLE]` AS soh
-- Placeholder for the JOIN statement (replace with the actual JOIN clause)
-- Placeholder for the WHERE clause to filter for 'United States'
-- Placeholder for the GROUP BY clause (replace with actual column name)
```

**Concepts to Learn**:
- **CAST**: Sometimes data is stored as text (strings) even though it represents numbers (like money). `CAST` is used to change the data into a number so that you can perform calculations on it.
- **SUM**: This is an aggregation function that adds up all the values in a column, giving you a total.
- **INNER JOIN**: This combines rows from two tables based on a related column between them, in this case, matching address IDs with sales orders.
- **WHERE**: This clause filters the data to return only the rows that meet certain criteria, like orders from 'United States'.
- **GROUP BY**: This is used when you're using aggregation functions like `SUM`, to specify which columns to summarize data by, such as by each state/province.

### Part 2: SQL Query for Monthly Sales Trend Analysis
Construct a query to determine the sales trends over time, broken down by month and year.

#### Query Skeleton
```sql
SELECT
  EXTRACT(YEAR FROM [ORDER_DATE_COLUMN]) AS order_year,
  EXTRACT(MONTH FROM [ORDER_DATE_COLUMN]) AS order_month,
  -- Placeholder for the SUM function to aggregate monthly sales (replace with actual column names and calculations)
FROM
  `adventureworks.[SALES_TABLE]`
-- Placeholder for the GROUP BY clause (replace with actual column names)
-- Placeholder for the ORDER BY clause (replace with actual column names)
```

**Concepts to Learn**:
- **EXTRACT**: This function is used to get a specific part of a date, such as the year or month, from a date column.
- **ORDER BY**: This arranges your data in a particular order, typically chronological for date fields.

### Part 3: Visualizing Results in Looker Studio
After running your queries in BigQuery, use Looker Studio to visualize the data and draw insights.

1. **Run Query**: Execute your queries in BigQuery to verify they produce the correct results.
2. **Looker Studio Integration**: Directly from BigQuery, navigate to "Explore Data" and select "Explore with Looker Studio" to send your data to Looker Studio for visualization.

**Working with Looker Studio**:
- **Chart Selection**: In Looker Studio, choose the appropriate chart types from the menu to best represent your data, such as Geo Maps or Line Charts.
- **Dimensions and Metrics**: Use dimensions to categorize your data (like dates or categories) and metrics to measure them (like sales totals).
- **Chart Customization**: Customize your charts with various styling options to make your data clear and impactful.

## Deliverables
- **Complete the SQL queries by replacing placeholders with correct SQL statements and column names.**
- **In Looker Studio, create a Geo Map chart to visualize sales by state/province and a Line Chart to visualize the monthly sales trend.**

![Geo Map](./Lesson_05/images/geo-map.png "Geo Map")
![Line Chart](./Lesson_05/images/line-chart.png "Line Chart")