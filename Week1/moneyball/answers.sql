-- 1. You should start by getting a sense for how average player salaries have changed over time. 
    -- Write a SQL query to find the average player salary by year.
    -- Sort by year in descending order.
    -- Round the salary to two decimal places and call the column “average salary”.
    -- Your query should return a table with two columns, one for year and one for average salary.

SELECT "year", ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;

-- 2. Your general manager (i.e., the person who makes decisions about player contracts) asks you whether the team should trade a current player for Cal Ripken Jr., a star player who’s likely nearing his retirement. 
    -- Write a SQL query to find Cal Ripken Jr.’s salary history.
    -- Sort by year in descending order.
    -- Your query should return a table with two columns, one for year and one for salary.

SELECT "year", "salary"
FROM "salaries"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
)
ORDER BY "year" DESC;

-- 3. Your team is going to need a great home run hitter. Ken Griffey Jr., a long-time Silver Slugger and Gold Glove award winner, might be a good prospect. 
    -- Write a SQL query to find Ken Griffey Jr.’s home run history.
    -- Sort by year in descending order.
    -- Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
    -- Your query should return a table with two columns, one for year and one for home runs.

SELECT "year", "HR"
FROM "performances"
WHERE "player_id" = (
    SELECT "id"
    FROM "players"
    WHERE "first_name" = 'Ken' AND "last_name" = 'Griffey' AND "birth_year" = 1969
)
ORDER BY "year" DESC;

-- 4. You need to make a recommendation about which players the team should consider hiring. With the team’s dwindling budget, the general manager wants to know which players were paid the lowest salaries in 2001. 
    -- write a SQL query to find the 50 players paid the least in 2001.
    -- Sort players by salary, lowest to highest.
    -- If two players have the same salary, sort alphabetically by first name and then by last name.
    -- If two players have the same first and last name, sort by player ID.
    -- Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.

SELECT "players"."first_name", "players"."last_name", "salaries"."salary"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001
ORDER BY "salaries"."salary" ASC, "players"."first_name" ASC, "players"."last_name" ASC
LIMIT 50;

-- 5. It’s a bit of a slow day in the office. Though Satchel no longer plays.
    -- Write a SQL query to find all teams that Satchel Paige played for.
    -- Your query should return a table with a single column, one for the name of the teams.

SELECT "teams"."name"
FROM "teams"
JOIN "performances" ON "performances"."team_id" = "teams"."id"
JOIN "players" ON "performances"."player_id" = "players"."id"
WHERE "players"."first_name" = 'Satchel' AND "players"."last_name" = 'Paige';

-- 6. Which teams might be the biggest competition for the A’s this year? 
    -- Write a SQL query to return the top 5 teams, sorted by the total number of hits by players in 2001.
    -- Call the column representing total hits by players in 2001 “total hits”.
    -- Sort by total hits, highest to lowest.
    -- Your query should return two columns, one for the teams’ names and one for their total hits in 2001.

SELECT "teams"."name", SUM("performances"."H") AS "total hits"
FROM "performances"
JOIN "teams" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "performances"."team_id"
ORDER BY "Total Hits" DESC
LIMIT 5;

-- 7. You need to make a recommendation about which player (or players) to avoid recruiting. 
    -- Write a SQL query to find the name of the player who’s been paid the highest salary, of all time, in Major League Baseball.
    -- Your query should return a table with two columns, one for the player’s first name and one for their last name.

SELECT "first_name", "last_name"
FROM "players"
WHERE "id" = (
    SELECT "player_id" FROM "salaries"
    ORDER BY "salary" DESC
    LIMIT 1
);

-- 8. How much would the A’s need to pay to get the best home run hitter this past season? 
    -- Write a SQL query to find the 2001 salary of the player who hit the most home runs in 2001.
    -- Your query should return a table with one column, the salary of the player.

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

-- 9. What salaries are other teams paying? 
    -- Write a SQL query to find the 5 lowest paying teams (by average salary) in 2001.
    -- Round the average salary column to two decimal places and call it “average salary”.
    -- Sort the teams by average salary, least to greatest.
    -- Your query should return a table with two columns, one for the teams’ names and one for their average salary.

SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS "average salary"
FROM "teams"
JOIN "salaries" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "salaries"."team_id"
ORDER BY "average salary" ASC
LIMIT 5;

--10. The general manager has asked you for a report which details each player’s name, their salary for each year they’ve been playing, and their number of home runs for each year they’ve been playing. To be precise, the table should include:
    -- All player’s first names
    -- All player’s last names
    -- All player’s salaries
    -- All player’s home runs
    -- The year in which the player was paid that salary and hit those home runs
    -- Write a query to return just such a table.
    -- Your query should return a table with five columns, per the above.
    -- Order the results, first and foremost, by player’s IDs (least to greatest).
    -- Order rows about the same player by year, in descending order.
    -- Consider a corner case: suppose a player has multiple salaries or performances for a given year. Order them first by number of home runs, in descending order, followed by salary, in descending order.
    -- Be careful to ensure that, for a single row, the salary’s year and the performance’s year match.

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

-- 11. You need a player that can get hits. Who might be the most underrated? 
    -- Write a SQL query to find the 10 least expensive players per hit in 2001.
    -- Your query should return a table with three columns, one for the players’ first names, one of their last names, and one called “dollars per hit”.
    -- You can calculate the “dollars per hit” column by dividing a player’s 2001 salary by the number of hits they made in 2001. Recall you can use AS to rename a column.
    -- Dividing a salary by 0 hits will result in a NULL value. Avoid the issue by filtering out players with 0 hits.
    -- Sort the table by the “dollars per hit” column, least to most expensive. If two players have the same “dollars per hit”, order by first name, followed by last name, in alphabetical order.
    -- Ensure that the salary’s year and the performance’s year match.
    -- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.

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

-- 12. Hits are great, but so are RBIs! 
    -- Write a SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
    -- Your query should return a table with two columns, one for the players’ first names and one of their last names.
    -- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
    -- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
    -- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).

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
        ORDER BY ("s"."salary" / "perf"."H") ASC
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
        ORDER BY ("s"."salary" / "perf"."RBI") ASC
        LIMIT 10
        )
ORDER BY "id"
);
