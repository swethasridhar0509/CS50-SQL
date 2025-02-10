--write a SQL query to find the names of schools (public or charter!) in the Cambridge school district

SELECT "sch"."name"
FROM "districts" "d"
JOIN "schools" "sch" ON "sch"."district_id" = "d"."id"
WHERE "d"."name" = 'Cambridge';
