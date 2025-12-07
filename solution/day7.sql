SELECT
  measured_at as date_alert
FROM
  (
    SELECT
      measured_at,
      pm10 AS pm_today,
      LAG(pm10, 1) OVER (
        ORDER BY
          measured_at
      ) AS pm_yesterday,
      LAG(pm10, 2) OVER (
        ORDER BY
          measured_at
      ) AS pm_2daysago
    FROM
      measurements
  ) d
WHERE
  d.pm_today >= 30
  AND d.pm_today > d.pm_yesterday
  AND d.pm_yesterday > d.pm_2daysago
  
  -- LAG 함수
  -- LAG는 이전 행의 값을 가져옴.
  -- 첫 번째 인자는 컬럼명, 두 번째 인자는 몇 행 이전인지.

  -- ORDER BY가 있는 이유
  -- 이전이 무엇인지 기준이 없으면 의미가 없음.

  -- from 서브쿼리 : 괄호 안의 SELECT 결과를 앞으로 d라는 이름의 테이블로 간주하겠다