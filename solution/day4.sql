SELECT
  customer_id
FROM
  records
WHERE
  order_date >= '2020-12-01'
  AND order_date < '2021-01-01'
GROUP BY
  customer_id
HAVING
  SUM(sales) >= 1000;