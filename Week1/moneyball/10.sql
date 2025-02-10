SELECT
    "p"."first_name",
    "p"."last_name",
    "s"."salary",
    "perf"."HR" as "home_runs",
    "s"."year" as "salary_year"
FROM "players" "p"
JOIN "performances" "perf" ON "perf"."player_id" = "p"."id"
JOIN "salaries" "s" ON "s"."player_id" = "perf"."player_id" AND "s"."year" = "perf"."year"
ORDER BY "p"."id" ASC, "perf"."year" DESC, "home_runs" DESC, "s"."salary" DESC;

