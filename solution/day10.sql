SELECT DISTINCT
  a.id AS id,
  a.name AS name,
  GROUP_CONCAT(
    r.medal
    ORDER BY
      r.medal SEPARATOR ','
  ) AS medals
FROM
  athletes AS a
  JOIN records AS r ON a.id = r.athlete_id
  JOIN events AS e ON r.event_id = e.id
  JOIN teams AS t ON r.team_id = t.id
  JOIN games AS g ON r.game_id = g.id
WHERE
  e.event = 'Volleyball Women''s Volleyball'
  AND t.team = 'KOR'
  AND g.year <= 2016
  AND r.medal IS NOT NULL
GROUP BY
  a.id,
  a.name;

-- GROUP_CONCAT 사용법
-- GROUP_CONCAT(컬럼명 ORDER BY 정렬기준 SEPARATOR '구분자')