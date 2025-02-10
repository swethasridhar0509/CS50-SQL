-- SELECT "name", "city"
-- FROM "schools"
-- WHERE "type" = 'Public School';

-- SELECT "name"
-- FROM "districts"
-- WHERE "name" LIKE '%(non-op)%';

-- SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
-- FROM "expenditures";

-- SELECT "city", COUNT("type") AS "Public School Count"
-- FROM "schools"
-- WHERE "type" = 'Public School'
-- GROUP BY "city"
-- ORDER BY "Public School Count" DESC, "city" ASC
-- LIMIT 10;

-- SELECT "city", COUNT("type") AS "Public School Count"
-- FROM "schools"
-- WHERE "type" = 'Public School'
-- GROUP BY "city"
-- HAVING "Public School Count" <= 3
-- ORDER BY "Public School Count" DESC, "city" ASC;

-- SELECT "sch"."name"
-- FROM "schools" "sch"
-- JOIN "graduation_rates" "grates" ON "grates"."school_id" = "sch"."id"
-- WHERE "graduated" = 100;

-- SELECT "sch"."name"
-- FROM "districts" "d"
-- JOIN "schools" "sch" ON "sch"."district_id" = "d"."id"
-- WHERE "d"."name" = 'Cambridge';

-- SELECT "d"."name", "exp"."pupils"
-- FROM "districts" "d"
-- JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id";

-- SELECT "d"."name"
-- FROM "districts" "d"
-- JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id"
-- ORDER BY "exp"."pupils" ASC
-- LIMIT 1;

-- SELECT "d"."name", "exp"."per_pupil_expenditure"
-- FROM "districts" "d"
-- JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id"
-- WHERE "d"."type" = 'Public School District'
-- ORDER BY "exp"."per_pupil_expenditure" DESC
-- LIMIT 10;

-- SELECT "sch"."name", "exp"."per_pupil_expenditure", "grates"."graduated"
-- FROM "districts" "d"
-- JOIN "schools" "sch" ON "sch"."district_id" = "d"."id"
-- JOIN "graduation_rates" "grates" ON "grates"."school_id" = "sch"."id"
-- JOIN "expenditures" "exp" ON "exp"."district_id" = "d"."id"
-- ORDER BY "exp"."per_pupil_expenditure" DESC, "sch"."name" ASC;

-- SELECT "d"."name", "exp"."per_pupil_expenditure", "s_eval"."exemplary"
-- FROM "districts" "d"
-- JOIN "expenditures" "exp" ON "exp"."district_id" = "d"."id"
-- JOIN "staff_evaluations" "s_eval" ON "s_eval"."district_id" = "d"."id"
-- WHERE "d"."type" = 'Public School District'
-- ORDER BY "s_eval"."exemplary" DESC, "exp"."per_pupil_expenditure" DESC;

--Which district has highly proficient staff

-- SELECT "d"."type", ROUND(AVG("s_eval"."proficient"), 2) AS "Average Proficiency of Staff"
-- FROM "districts" "d"
-- JOIN "staff_evaluations" "s_eval" ON "d"."id" = "s_eval"."district_id"
-- WHERE NOT ("d"."name" LIKE '%no-op%') AND "s_eval"."proficient" IS NOT NULL
-- GROUP BY "d"."type"
-- ORDER BY "Average Proficiency of Staff" DESC;
