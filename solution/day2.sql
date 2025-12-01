SELECT
  measured_at as good_day
FROM
  measurements
WHERE
  MONTH(measured_at) = 12
  AND pm2_5 <= 9
ORDER BY
  good_day ASC