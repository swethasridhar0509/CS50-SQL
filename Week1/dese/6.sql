--write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

SELECT "sch"."name"
FROM "schools" "sch"
JOIN "graduation_rates" "grates" ON "grates"."school_id" = "sch"."id"
WHERE "grates"."graduated" = 100;
