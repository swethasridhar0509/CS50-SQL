--write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate.

SELECT "sch"."name", "exp"."per_pupil_expenditure", "grates"."graduated"
FROM "districts" "d"
JOIN "schools" "sch" ON "sch"."district_id" = "d"."id"
JOIN "graduation_rates" "grates" ON "grates"."school_id" = "sch"."id"
JOIN "expenditures" "exp" ON "exp"."district_id" = "d"."id"
ORDER BY "exp"."per_pupil_expenditure" DESC, "sch"."name" ASC;
