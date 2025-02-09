
-- *** The Lost Letter ***

--To find the sender Address ID from the addresses table.
SELECT "id"
FROM "addresses"
WHERE "address" = '900 Somerville Avenue'; -- 432

--To find the package id using the sender address id and contents from the package table.
SELECT "id"
FROM "packages"
WHERE "from_address_id" = 432
AND "contents" LIKE '%Congratulatory%letter%'; --384

--To find the to address id using the package id and the action from the scans table.
SELECT "address_id"
FROM "scans"
WHERE "package_id" = 384
AND "action" = 'Drop'; --854

--To find the type and address of the to address using the id from the scans tables.
SELECT "address", "type"
FROM "addresses"
WHERE "id" = 854; --Residential --2 Finnigan Street

SELECT "address", "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
            )
        AND "contents" LIKE '%Congratulatory%letter%'
    )
    AND "action" = 'Drop'
);


-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

