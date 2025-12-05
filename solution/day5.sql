SELECT
  CASE
    WHEN total_bill >= 25 THEN 2
    WHEN total_bill >= 15 THEN 1
    ELSE 0
  END AS stamp,
  COUNT(*) AS count_bill
FROM
  tips
GROUP BY
  stamp
ORDER BY
  stamp ASC;

-- 영수 금액이 25달러 이상이면 스탬프 2개, 15달러 이상이면 스탬프 1개, 이외에는 0개
-- IF문보다 CASE문을 사용하는 것이 SQL에서 더 적합함.