-- 1. Your colleague is preparing a map of all public schools in Massachusetts. Write a SQL query to find the names and cities of all public schools in Massachusetts.
    -- Keep in mind that not all schools in the schools table are considered traditional public schools. Massachusetts also recognizes charter schools, which (according to DESE!) are considered distinct.

SELECT "name", "city"
FROM "schools"
WHERE "type" = 'Public School';

-- 2. Your team is working on archiving old data. Write a SQL query to find the names of districts that are no longer operational.
    -- Districts that are no longer operational have “(non-op)” at the end of their name.

SELECT "name"
FROM "districts"
WHERE "name" LIKE '%(non-op)%';

-- 3. The Massachusetts Legislature would like to learn how much money, on average, districts spent per-pupil last year. Write a SQL query to find the average per-pupil expenditure. Name the column “Average District Per-Pupil Expenditure”.
    -- Note the per_pupil_expenditure column in the expenditures table contains the average amount, per pupil, each district spent last year. You’ve been asked to find the average of this set of averages, weighting all districts equally regardless of their size.

SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
FROM "expenditures";

-- 4. Some cities have more public schools than others. Write a SQL query to find the 10 cities with the most public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.

SELECT "city", COUNT("type") AS "Public School Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "Public School Count" DESC, "city" ASC
LIMIT 10;

-- 5. DESE would like you to determine in what cities additional public schools might be needed. Write a SQL query to find cities with 3 or fewer public schools. Your query should return the names of the cities and the number of public schools within them, ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.

SELECT "city", COUNT("type") AS "Public School Count"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "Public School Count" <= 3
ORDER BY "Public School Count" DESC, "city" ASC;

-- 6. DESE wants to assess which schools achieved a 100% graduation rate. Write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.

SELECT "sch"."name"
FROM "schools" "sch"
JOIN "graduation_rates" "grates" ON "grates"."school_id" = "sch"."id"
WHERE "grates"."graduated" = 100;

-- 7. DESE is preparing a report on schools in the Cambridge school district. Write a SQL query to find the names of schools (public or charter!) in the Cambridge school district. Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”

SELECT "sch"."name"
FROM "districts" "d"
JOIN "schools" "sch" ON "sch"."district_id" = "d"."id"
WHERE "d"."name" = 'Cambridge';

-- 8. A parent wants to send their child to a district with many other students. Write a SQL query to display the names of all school districts and the number of pupils enrolled in each.

SELECT "d"."name", "exp"."pupils"
FROM "districts" "d"
JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id";

-- 9. Another parent wants to send their child to a district with few other students. Write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).

SELECT "d"."name"
FROM "districts" "d"
JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id"
ORDER BY "exp"."pupils" ASC
LIMIT 1;

-- 10. In Massachusetts, school district expenditures are in part determined by local taxes on property (e.g., home) values. Write a SQL query to find the 10 public school districts with the highest per-pupil expenditures. Your query should return the names of the districts and the per-pupil expenditure for each.

SELECT "d"."name", "exp"."per_pupil_expenditure"
FROM "districts" "d"
JOIN "expenditures" "exp" ON "d"."id" = "exp"."district_id"
WHERE "d"."type" = 'Public School District'
ORDER BY "exp"."per_pupil_expenditure" DESC
LIMIT 10;

-- 11. Is there a relationship between school expenditures and graduation rates? Write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate. Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
-- You should assume a school spends the same amount per-pupil their district as a whole spends.

SELECT "sch"."name", "exp"."per_pupil_expenditure", "grates"."graduated"
FROM "districts" "d"
JOIN "schools" "sch" ON "sch"."district_id" = "d"."id"
JOIN "graduation_rates" "grates" ON "grates"."school_id" = "sch"."id"
JOIN "expenditures" "exp" ON "exp"."district_id" = "d"."id"
ORDER BY "exp"."per_pupil_expenditure" DESC, "sch"."name" ASC;

-- 12. A parent asks you for advice on finding the best public school districts in Massachusetts. Write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”. Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary. Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).

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

-- 13. Write a SQL query to answer a question you have about the data! The query should:
    -- Involve at least one JOIN or subquery
    -- Profiency analysis of staff under each district type.

SELECT "d"."type", ROUND(AVG("s_eval"."proficient"), 2) AS "Average Proficiency of Staff"
FROM "districts" "d"
JOIN "staff_evaluations" "s_eval" ON "d"."id" = "s_eval"."district_id"
WHERE NOT ("d"."name" LIKE '%no-op%') AND "s_eval"."proficient" IS NOT NULL
GROUP BY "d"."type"
ORDER BY "Average Proficiency of Staff" DESC;

-- +------------------------+------------------------------+
-- |          type          | Average Proficiency of Staff |
-- +------------------------+------------------------------+
-- | Public School District | 81.36                        |
-- | Charter District       | 61.64                        |
-- +------------------------+------------------------------+