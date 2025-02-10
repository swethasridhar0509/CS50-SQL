--write a SQL query to find the 10 cities with the most public schools.

SELECT "city", COUNT("type") AS "Public School Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Public School Count" DESC, "city" ASC
LIMIT 10;
