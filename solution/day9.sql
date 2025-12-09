SELECT DISTINCT
  a.id AS id,
  a.name AS name
FROM
  athletes AS a
  JOIN records AS r ON a.id = r.athlete_id
  JOIN events AS e ON r.event_id = e.id
  JOIN teams AS t ON r.team_id = t.id
  JOIN games AS g ON r.game_id = g.id
WHERE
  e.event = 'Volleyball Women''s Volleyball'
  AND t.team = 'KOR'
  -- 2회 이상 연속 출전한 선수
  AND a.id IN (
    SELECT
      athlete_id
    FROM
      (
        SELECT
          r2.athlete_id,
          g2.year,
          LAG(g2.year) OVER (
            PARTITION BY
              r2.athlete_id
            ORDER BY
              g2.year
          ) AS prev_year
        FROM
          records AS r2
          JOIN events AS e2 ON r2.event_id = e2.id
          JOIN teams AS t2 ON r2.team_id = t2.id
          JOIN games AS g2 ON r2.game_id = g2.id
        WHERE
          e2.event = 'Volleyball Women''s Volleyball'
          AND t2.team = 'KOR'
      ) AS seq
    WHERE
      prev_year IS NOT NULL
      AND year - prev_year = 4
  );


-- event와 team 조건이 두 번 사용되는 이유는 1)결과로 나올 선수 필터 2)연속 출전(LAG) 계산 시 불필요한 출전 기록이 섞이는 걸 방지하기 위해
-- LAG 함수는 윈도우 함수, 동일 선수의 이전 출전 연도를 가져와 현재 연도와 비교하기 위해 사용됨