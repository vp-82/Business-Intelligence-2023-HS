### Visualization Exercise: Google Data Studio

## Overview

In this exercise, you'll utilize Google Data Studio to create visual representations of the insights derived from SQL queries. The aim is to transform the analyzed data into meaningful visualizations that can effectively communicate the findings to a non-technical audience.

## Visualization Suggestions

### Exercise 1: Analyzing Product Sales

**Objective:** Visualize the top-selling products.

**Visualization Suggestion:** 
- **Bar Chart**: Use a bar chart to display the 'TotalSoldQuantity' for the top 10 'ProductName'. 

**Steps:**
1. Use 'ProductName' on the x-axis and 'TotalSoldQuantity' on the y-axis.
2. Sort the bars based on 'TotalSoldQuantity' in descending order.
3. Use data labels to display the exact quantity sold.

### Exercise 2: Customer Purchasing Analysis

**Objective:** Identify top-spending customers.

**Visualization Suggestion:** 
- **Table**: Use a table to neatly display the 'CustomerID', 'CompanyName', and 'TotalSpent' side by side.

**Steps:**
1. Display 'CustomerID' and 'CompanyName' as dimensions.
2. Show 'TotalSpent' as a metric and format it as a currency.
3. Highlight the top spender using conditional formatting.

### Exercise 3: Supplier Analysis

**Objective:** Analyze supplier product contributions and units supplied.

**Visualization Suggestion:** 
- **Combo Chart**: Use a combo chart to visualize 'NumberOfProducts' and 'TotalUnitsSupplied' per supplier.

**Steps:**
1. Use 'CompanyName' on the x-axis.
2. Use 'NumberOfProducts' and 'TotalUnitsSupplied' on the dual y-axes.
3. Use bars for 'NumberOfProducts' and a line for 'TotalUnitsSupplied'.

### Exercise 4: Monthly Sales Analysis

**Objective:** Explore monthly sales trends.

**Visualization Suggestion:** 
- **Time Series Chart**: Use a time series chart to visualize 'MonthlySales' over different months and years.

**Steps:**
1. Create a new field combining 'Year' and 'Month' to create a YYYY-MM format date field.
2. Use the new date field on the x-axis and 'MonthlySales' on the y-axis.
3. Optionally, use a trend line to showcase the overall sales trend.

### Exercise 5: Employee Sales Performance

**Objective:** Evaluate the sales performance of employees.

**Visualization Suggestion:** 
- **Stacked Column Chart**: Use a stacked column chart to represent 'TotalUnitsSold' and 'NumberOfOrders' per employee.

**Steps:**
1. Use 'EmployeeName' on the x-axis.
2. Use 'TotalUnitsSold' and 'NumberOfOrders' as stacked columns on the y-axis.
3. Use distinct colors for the two metrics to differentiate them.

## Task: Create a Data Studio Report

1. **Connect Data**: Connect your wide tables from BigQuery to Google Data Studio.
2. **Create Visualizations**: Develop the suggested visualizations for each exercise.
3. **Organize Dashboard**: Combine the visualizations to form a comprehensive dashboard.
4. **Share & Gather Insights**: Share your dashboard and collaborate with peers to gather insights.
   
## Note
Ensure that the visualizations are interactive, clear, and self-explanatory. Add necessary labels, legends, and titles to provide context to the viewers.
