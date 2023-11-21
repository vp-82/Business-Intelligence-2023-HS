SELECT
  EXTRACT(YEAR
  FROM
    orderdate) AS year,
  SUM(unitprice * orderqty) AS actual_revenue,
  SUM(listprice * orderqty) AS potential_revenue_at_listprice,
  SUM(unitprice * orderqty * unitpricediscount) AS total_discount,
  SUM(listprice * orderqty) - SUM(unitprice * orderqty) AS revenue_loss_from_listprice
FROM
  `adventureworks.dwh_sales_data`
GROUP BY
  year
ORDER BY
  year