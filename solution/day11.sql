SELECT
  CASE
    WHEN day IN ('Sat', 'Sun') THEN 'weekend'
    ELSE 'weekday'
  END AS week,
  SUM(total_bill) AS sales
FROM
  tips
GROUP BY
  week
ORDER BY
  sales DESC;

-- 주말과 평일 구분 (CASE문 활용)
-- CASE문 사용법
-- CASE
--   WHEN 조건1 THEN 결과1
--   WHEN 조건2 THEN 결과2
--   ...
--   ELSE 결과N
-- END  AS 별칭

