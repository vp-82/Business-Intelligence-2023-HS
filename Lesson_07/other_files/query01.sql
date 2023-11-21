CREATE OR REPLACE TABLE
  `adventureworks.dwh_sales_data` AS
WITH
  salesorder AS(
  SELECT
    soh.salesorderid,
    soh.orderdate,
    soh.totaldue,
    sod.salesorderdetailid,
    sod.productid,
    sod.orderqty,
    CAST(sod.unitprice AS NUMERIC) AS unitprice,
    CAST(sod.unitpricediscount AS NUMERIC) AS unitpricediscount,
    CAST(p.listprice AS NUMERIC) as listprice,
    p.category_name
  FROM
    `adventureworks.salesorderdetail` sod
  JOIN
    `adventureworks.salesorderheader` soh
  ON
    sod.salesorderid = soh.salesorderid
  JOIN
    `adventureworks.dwh_product_with_reviews` p
  ON
    sod.productid = p.productid)
SELECT
  *
FROM
  salesorder