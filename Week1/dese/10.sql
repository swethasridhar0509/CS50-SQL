--write a SQL query to find the 10 public school districts with the highest per-pupil expenditures.

SELECT "d"."name", "exp"."per_pupil_expenditure"
FROM "districts" "d"
JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id"
WHERE "d"."type" = 'Public School District'
ORDER BY "exp"."per_pupil_expenditure" DESC
LIMIT 10;
