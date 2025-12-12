SELECT
  ge.name AS genre,
  ROUND(
    AVG(
      CASE
        WHEN ga.year = 2011 THEN ga.critic_score
      END
    ),
    2
  ) AS score_2011,
  ROUND(
    AVG(
      CASE
        WHEN ga.year = 2012 THEN ga.critic_score
      END
    ),
    2
  ) AS score_2012,
  ROUND(
    AVG(
      CASE
        WHEN ga.year = 2013 THEN ga.critic_score
      END
    ),
    2
  ) AS score_2013,
  ROUND(
    AVG(
      CASE
        WHEN ga.year = 2014 THEN ga.critic_score
      END
    ),
    2
  ) AS score_2014,
  ROUND(
    AVG(
      CASE
        WHEN ga.year = 2015 THEN ga.critic_score
      END
    ),
    2
  ) AS score_2015
FROM
  genres AS ge
  JOIN games AS ga ON ge.genre_id = ga.genre_id
GROUP BY
  ge.name
ORDER BY
  ge.name;

-- AVG 함수는 기본적으로 NULL 값을 제외하고 계산함.
-- ROUND 함수는 소수점 반올림 함수임. 두 번째 인자는 반올림할 자리 수.
-- JOIN은 꼭 ON과 함께 사용해야 함.