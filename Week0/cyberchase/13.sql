--Write a SQL query to list all the episodes in season 5 and 7 that teaches about Math.

SELECT *
FROM "episodes"
WHERE ("season" = 5 OR "season" = 7) AND "topic" LIKE '%Math%';
