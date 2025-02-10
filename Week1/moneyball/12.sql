SELECT "first_name", "last_name"
FROM (
    SELECT "id", "first_name", "last_name"
    FROM (
        SELECT
            "p"."id",
            "p"."first_name",
            "p"."last_name"
        FROM "players" "p"
        JOIN "performances" "perf" ON "perf"."player_id" = "p"."id"
        JOIN "salaries" "s" ON "s"."player_id" = "p"."id" AND "s"."year" = "perf"."year"
        WHERE "perf"."year" = 2001 AND "perf"."H" > 0
        ORDER BY ("s"."salary" / "perf"."H") ASC, "p"."id" ASC
        LIMIT 10
        )

    INTERSECT

    SELECT "id", "first_name", "last_name"
    FROM (
        SELECT
            "p"."id",
            "p"."first_name",
            "p"."last_name"
        FROM "players" "p"
        JOIN "performances" "perf" ON "perf"."player_id" = "p"."id"
        JOIN "salaries" "s" ON "s"."player_id" = "p"."id" AND "s"."year" = "perf"."year"
        WHERE "perf"."year" = 2001 AND "perf"."RBI" > 0
        ORDER BY ("s"."salary" / "perf"."RBI") ASC, "p"."id" ASC
        LIMIT 10
        )
);
