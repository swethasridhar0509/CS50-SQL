--1. Write a SQL query to list the titles of all episodes in Cyberchase’s original season, Season 1.

SELECT "title"
FROM "episodes"
WHERE "season" = 1;

--2. List the season number of, and title of, the first episode of every season.

SELECT "season", "title"
FROM "episodes"
WHERE "episode_in_season" = 1;

--3. Find the production code for the episode “Hackerized!”.

SELECT "Production_code"
FROM "episodes"
WHERE "title" = 'Hackerized!';

--4. Write a query to find the titles of episodes that do not yet have a listed topic.

SELECT "title"
FROM "episodes"
WHERE "topic" IS NULL;

--5. Find the title of the holiday episode that aired on December 31st, 2004.

SELECT "title"
FROM "episodes"
WHERE "air_date" = '2004-12-31';

--6. List the titles of episodes from season 6 (2008) that were released early, in 2007.

SELECT "title"
FROM "episodes"
WHERE season = 6 AND "air_date" LIKE '2007%';

--7. Write a SQL query to list the titles and topics of all episodes teaching fractions.

SELECT "title", "topic"
FROM "episodes"
WHERE "topic" LIKE '%Fractions%';

--8. Write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023, inclusive.
--You might find it helpful to know you can use BETWEEN with dates, such as BETWEEN '2000-01-01' AND '2000-12-31'.

SELECT COUNT(id) AS "number of episodes"
FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';

--9. Write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.

SELECT COUNT(id) AS "number of episodes"
FROM "episodes"
WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';

--10. Write a SQL query to list the ids, titles, and production codes of all episodes. Order the results by production code, from earliest to latest.

SELECT "id", "title", "production_code"
FROM "episodes"
ORDER BY "production_code" ASC;

--11. List the titles of episodes from season 5, in reverse alphabetical order.

SELECT "title"
FROM "episodes"
WHERE "season" = 5
ORDER BY "title" DESC;

--12. Count the number of unique episode titles.

SELECT COUNT(DISTINCT title) AS "number of unique episodes"
FROM "episodes";

--13. Write a SQL query to explore a question of your choice. This query should:
--Involve at least one condition, using WHERE with AND or OR

SELECT *
FROM "episodes"
WHERE ("season" = 5 OR "season" = 7) AND "topic" LIKE '%Math%';

--Additional

-- Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States.
-- Your query should output a table with a single column for the title of each episode.
-- Try to find a better solution than LIKE if you can!

SELECT "title", "air_date"
FROM "episodes"
WHERE strftime('%m', "air_date") = '12';

-- Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
-- Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year

SELECT
strftime('%Y', "air_date") AS "year",
MIN(strftime('%m-%d', "air_date")) AS "earliest date"
FROM "episodes"
GROUP BY strftime('%Y', "air_date");.
