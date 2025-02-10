--write a SQL query to display the names of all school districts and the number of pupils enrolled in each.

SELECT "d"."name", "exp"."pupils"
FROM "districts" "d"
JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id";
