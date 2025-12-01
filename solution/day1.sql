select
  title,
  year,
  rotten_tomatoes
from
  movies
where
  title like '%Love%'
  OR title LIKE '%love%'
ORDER BY
  rotten_tomatoes DESC,
  year DESC