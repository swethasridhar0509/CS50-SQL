--Profiency analysis of staff under each district type.

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

