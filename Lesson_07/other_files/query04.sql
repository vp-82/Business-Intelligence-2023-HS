SELECT
  CASE
    WHEN listprice < 100 THEN '1 - Under $100'
    WHEN listprice >= 100 AND listprice < 500 THEN '2 - $100 to $499'
    WHEN listprice >= 500 AND listprice < 1000 THEN '3 - $500 to $999'
    ELSE '4 - Over $1000'
  END AS price_range,
  COUNT(*) AS product_count
FROM
  `adventureworks.dwh_sales_data`
GROUP BY
  price_range
ORDER BY
  price_range