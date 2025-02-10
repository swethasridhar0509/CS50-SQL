-- write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.

SELECT "teams"."name", SUM("performances"."H") AS "total hits"
FROM "performances"
JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "performances"."team_id"
ORDER BY "Total Hits" DESC
LIMIT 5;
