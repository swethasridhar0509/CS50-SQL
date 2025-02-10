--write a SQL query to find the 10 least expensive players per hit in 2001.

SELECT
     "p"."first_name",
     "p"."last_name",
     ("s"."salary"/ "perf"."H") as "dollars per hit"
FROM "players" "p"
JOIN "performances" "perf" ON "p"."id" = "perf"."player_id"
JOIN "salaries" "s" ON "s"."player_id" = "perf"."player_id" AND "s"."year" = "perf"."year"
WHERE "perf"."H" > 0 AND "perf"."year" = 2001
ORDER BY "dollars per hit" ASC, "p"."first_name" ASC, "p"."last_name" ASC
LIMIT 10;
