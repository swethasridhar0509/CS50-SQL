SELECT "d"."name", "exp"."per_pupil_expenditure", "s_eval"."exemplary"
FROM "districts" "d"
JOIN "expenditures" "exp" ON "exp"."district_id" = "d"."id"
JOIN "staff_evaluations" "s_eval" ON "s_eval"."district_id" = "d"."id"
WHERE "d"."type" = 'Public School District' AND "exp"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
) AND "s_eval"."exemplary" > (
    SELECT AVG("exemplary")
    FROM "staff_evaluations"
)
ORDER BY "s_eval"."exemplary" DESC, "exp"."per_pupil_expenditure" DESC;
