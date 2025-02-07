--Write a SQL query to find the players who played their final game in the MLB in 2022. Sort the results alphabetically by first name, then by last name.

SELECT "first_name", "last_name"
FROM "players"
WHERE strftime('%Y', "final_game") = '2022'
ORDER BY "first_name" ASC, "last_name" ASC;
