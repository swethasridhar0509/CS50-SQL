--write a SQL query to find the 5 lowest paying teams (by average salary) in 2001.

SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary"
FROM "teams"
JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "salaries"."team_id"
ORDER BY "average salary" ASC
LIMIT 5;


