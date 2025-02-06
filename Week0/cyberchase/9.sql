--Write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.


SELECT COUNT(id) AS "number of episodes"
FROM "episodes"
WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';
