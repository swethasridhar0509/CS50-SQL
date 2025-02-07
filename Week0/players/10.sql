--Write SQL query to answer a question of your choice. This query should:
--Make use of AS to rename a column
--Involve at least condition, using WHERE
--Sort by at least one column using ORDER BY
--This query returns the number of players debuted each year

SELECT strftime('%Y', "debut") as "debut year", COUNT("id") as "number of players"
FROM "players"
WHERE "debut year" IS NOT NULL
GROUP BY "debut year"
ORDER BY "number of players" DESC;