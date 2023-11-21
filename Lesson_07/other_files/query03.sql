SELECT
  MIN(DATE_DIFF(sellenddate, sellstartdate, DAY)) AS shortest_availability_days,
  MAX(DATE_DIFF(sellenddate, sellstartdate, DAY)) AS longest_availability_days
FROM
  `adventureworks.dwh_product_with_reviews`
WHERE
  sellenddate IS NOT NULL