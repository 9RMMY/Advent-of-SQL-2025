SELECT
  c.customer_id
FROM
  customer c
JOIN
  rental r ON c.customer_id = r.customer_id
WHERE
  c.active = 1
GROUP BY
  c.customer_id
HAVING
  COUNT(r.rental_id) >= 35;
