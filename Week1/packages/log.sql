
-- *** The Lost Letter ***

--To find the address and its type.

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
); --2 Finnigan Street --Residential

-- *** The Devious Delivery ***

--To find the contents of the Devious Delivery

SELECT "contents"
FROM "packages"
WHERE "from_address_id" IS NULL; --Duck debugger

--To find the type of address the Devious Delivery end up

SELECT "type"
FROM "addresses"
WHERE "id" = (
    SELECT "address_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" IS NULL
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
); --Police Station

-- *** The Forgotten Gift ***

--To find the content of the forgotten gift.

SELECT "contents"
FROM "packages"
WHERE "from_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE address = '109 Tileston Street'
)
AND "to_address_id" = (
    SELECT "id"
    FROM "addresses"
    WHERE address = '728 Maple Place'
); --Flowers

--To find who has the package now

SELECT "name"
FROM "drivers"
WHERE "id" = (
    SELECT "driver_id"
    FROM "scans"
    WHERE "package_id" = (
        SELECT "id"
        FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE address = '109 Tileston Street'
        )
        AND "to_address_id" = (
            SELECT "id"
            FROM "addresses"
            WHERE address = '728 Maple Place'
        )
    )
    ORDER BY "timestamp" DESC
    LIMIT 1
); 

--Mikel

