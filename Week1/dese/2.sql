--write a SQL query to find the names of districts that are no longer operational.

SELECT "name"
FROM "districts"
WHERE "name" LIKE '%(non-op)%';
