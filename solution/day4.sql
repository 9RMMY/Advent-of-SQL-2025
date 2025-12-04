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

-- GROUP BY는 SUM, COUNT, AVG 같은 집계 함수를 사용할 수 없음.
-- HAVING 절은 GROUP BY로 그룹화된 결과에 조건을 적용할 때 사용됨.