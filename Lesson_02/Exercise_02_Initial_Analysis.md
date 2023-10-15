# SQL Exercises on Sales Database

## Overview
In this exercise, you will explore a database related to sales, which contains various entities like products, orders, customers, suppliers, and employees. Through a series of SQL exercises, you'll derive insights related to sales performance, customer behavior, and supply management.

## Exercise 1: Analyzing Product Sales
### Objective
Understand which products are the best sellers and in which quantity they are being sold.

### Query
```sql
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSoldQuantity
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductName
ORDER BY 
    TotalSoldQuantity DESC
LIMIT 
    10;
```
### Expected Outcome
A list of the top 10 best-selling products and the quantity in which they were sold.

## Exercise 2: Customer Purchasing Analysis
### Objective
Identify the customers who are spending the most.

### Query
```sql
SELECT 
    c.CustomerID,
    c.CompanyName,
    SUM(od.UnitPrice * od.Quantity) AS TotalSpent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    c.CustomerID, c.CompanyName
ORDER BY 
    TotalSpent DESC
LIMIT 
    5;
```
### Expected Outcome
A list of the top 5 customers who have spent the most, including their total spending.

## Exercise 3: Supplier Analysis
### Objective
Identify which suppliers have the most products in the store and which of them are supplied the most.

### Query
```sql
SELECT 
    s.SupplierID,
    s.CompanyName,
    COUNT(DISTINCT p.ProductID) AS NumberOfProducts,
    SUM(od.Quantity) AS TotalUnitsSupplied
FROM 
    Suppliers s
JOIN 
    Products p ON s.SupplierID = p.SupplierID
JOIN 
    OrderDetails od ON p.ProductID = od.ProductID
GROUP BY 
    s.SupplierID, s.CompanyName
ORDER BY 
    NumberOfProducts DESC, TotalUnitsSupplied DESC
LIMIT 
    5;
```
### Expected Outcome
A list of the top 5 suppliers based on the number of distinct products they supply and the total units supplied.

## Exercise 4: Monthly Sales Analysis
### Objective
Understand the monthly sales trends.

### Query
```sql
SELECT 
    EXTRACT(YEAR FROM o.OrderDate) AS Year,
    EXTRACT(MONTH FROM o.OrderDate) AS Month,
    SUM(od.UnitPrice * od.Quantity) AS MonthlySales
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;
```
### Expected Outcome
Monthly sales amounts, which can be utilized to analyze the sales trend over time.

## Exercise 5: Employee Sales Performance
### Objective
Evaluate the sales performance of employees.

### Query
```sql
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    COUNT(DISTINCT o.OrderID) AS NumberOfOrders,
    SUM(od.Quantity) AS TotalUnitsSold
FROM 
    Employees e
JOIN 
    Orders o ON e.EmployeeID = o.EmployeeID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    TotalUnitsSold DESC
LIMIT 
    5;
```
### Expected Outcome
Identify the top 5 employees who have sold the most units.

## Note
- Ensure that the field names and table names used in the SQL queries match with the actual schema in BigQuery.
- Validate the queries with the actual data to ensure they execute correctly and provide the expected insights.

## Submission
Submit the SQL queries along with the derived insights and observations from the expected outcomes.

Happy Querying!
