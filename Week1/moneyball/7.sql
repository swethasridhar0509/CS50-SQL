--write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.

SELECT "first_name", "last_name"
FROM "players"
WHERE "id" = (
    SELECT "player_id" FROM "salaries"
    ORDER BY "salary" DESC
    LIMIT 1
);
