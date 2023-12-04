WITH MonthlySales AS (
  SELECT
    FORMAT_TIMESTAMP('%Y-%m', orderdate) AS year_month,
    SUM(CAST(totaldue AS FLOAT64)) AS total_sales
  FROM
    `adventureworks.dwh_sales_data`
  GROUP BY
    year_month
)
SELECT
  year_month,
  ROUND(total_sales, 2) AS total_sales,
  ROUND(LAG(total_sales) OVER (ORDER BY year_month), 2) AS previous_month_sales,
  ROUND(((total_sales - LAG(total_sales) OVER (ORDER BY year_month)) / LAG(total_sales) OVER (ORDER BY year_month)) * 100, 2) AS growth_rate
FROM
  MonthlySales
ORDER BY
  year_month;
