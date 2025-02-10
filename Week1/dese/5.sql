--write a SQL query to find cities with 3 or fewer public schools. 

SELECT "city", COUNT("type") AS "Public School Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "Public School Count" <= 3
ORDER BY "Public School Count" DESC, "city" ASC;
