--write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.

SELECT "salary"
FROM "salaries"
WHERE "player_id" = (
    SELECT "player_id"
    FROM "performances"
    WHERE "HR" = (
        SELECT MAX("HR")
        FROM "performances"
        WHERE "year" = 2001
    )
) AND "year" = 2001;
