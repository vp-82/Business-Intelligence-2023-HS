WITH
  CustomerSpending AS (
  SELECT
    customerid,
    SUM(unitprice * orderqty) AS total_spending
  FROM
    `adventureworks.dwh_sales_data`
  GROUP BY
    customerid ),
  PercentileRanks AS (
  SELECT
    PERCENT_RANK() OVER (ORDER BY total_spending) AS percentile_rank,
    customerid,
    total_spending
  FROM
    CustomerSpending )
SELECT
  CASE
    WHEN percentile_rank <= 0.25 THEN '1 - Low Spender'
    WHEN percentile_rank <= 0.50 THEN '2 - Medium Spender'
    WHEN percentile_rank <= 0.75 THEN '3 - High Spender'
  ELSE
  '4 - Top Spender'
END
  AS spending_category,
  COUNT(*) AS customer_count
FROM
  PercentileRanks
GROUP BY
  spending_category
ORDER BY
  spending_category