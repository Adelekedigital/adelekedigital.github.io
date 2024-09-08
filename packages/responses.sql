
-- *** The Lost Letter ***
-- first step = get sender info such as id using sender's provided address
        SELECT "ID" FROM "ADDRESSES" WHERE "ADDRESS" = '900 Somerville Avenue';
-- Second step: use sender id and the package content to get package ID
        SELECT "ID" FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" = 432 AND "CONTENTS" LIKE '%CONGRAT%';
-- Last step: use package id to get receiver info including address and address type
        SELECT * FROM "ADDRESSES" WHERE "ID" =
            (SELECT "TO_ADDRESS_ID" FROM "PACKAGES" WHERE "ID" =
                (SELECT "PACKAGE_ID" FROM "SCANS" WHERE "PACKAGE_ID"= 384
                    )
            );
--Final result: ADDRESS = 2 finnigan street, ADDRESS TYPE: Residential


-- *** The Devious Delivery ***
-- First step= We understand the package as no "From" address. we use that hint to find package ID with no "from" address.
SELECT * FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" IS NULL;
-- Second step: Use the "to address" from package ID to identify delivery information from the scan table.
SELECT * FROM "ADDRESSES" WHERE "ID" =
        (SELECT "TO_ADDRESS_ID" FROM "PACKAGES" WHERE "TO_ADDRESS_ID" = 50);
SELECT * FROM "SCANS" WHERE "PACKAGE_ID" =
        (SELECT "ID" FROM "PACKAGES" WHERE "ID" = 5098);
SELECT * FROM "ADDRESSES" WHERE "ID" =
        (SELECT "ADDRESS_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "ID" FROM "PACKAGES" WHERE "CONTENTS" = 'Duck debugger'
                )
        );

SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "TO_ADDRESS_ID" FROM "PACKAGES" WHERE "ID" = (
                        SELECT "PACKAGE_ID" FROM "SCANS" WHERE "PACKAGE_ID" = 5098
                )
        );

--Final result: ADDRESS = 123 Sesame street, ADDRESS TYPE: Residential

-- *** The Forgotten Gift ***
--First step = use available information like "to" and "from" information to get both from and "to" id
SELECT * FROM "ADDRESSES" WHERE "ADDRESS" = '728 Maple Place';
SELECT * FROM "ADDRESSES" WHERE "ADDRESS" = '109 Tileston Street';
--Second Step = Use the "from" id to identify package content
SELECT * FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" = 9873;
SELECT * FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" = (SELECT "ID" FROM "ADDRESSES" WHERE "ID" = 9873);
--Third step: use the the package id to identify delivery address.
SELECT * FROM "SCANS" WHERE "PACKAGE_ID" = 9523;
-- Fourth step: we have a problem from step 3. Result brought 3 different scans. Let's find the hidden address.
SELECT * FROM "ADDRESSES" WHERE "ID" = (SELECT "ADDRESS_ID" FROM "SCANS" WHERE "ADDRESS_ID" = 9873 OR 7432 OR 7432);
SELECT * FROM "DRIVERS" WHERE "ID" =11;

SELECT * FROM "DRIVERS" WHERE "ID" =
        (SELECT "DRIVER_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "ID" FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" = (
                        SELECT "ID" FROM "ADDRESSES" WHERE "ADDRESS" = '728 Maple Place' AND '109 Tileston Street'
                        )
                )
        );

--CONFIRMATION CODE v

SELECT * FROM "PACKAGES" WHERE "ID" =
(SELECT "PACKAGE_ID" FROM "SCANS" WHERE "DRIVER_ID" = (
                SELECT "ID" FROM "DRIVERS" WHERE "ID" = 11
        )
);

SELECT * FROM "DRIVERS" WHERE "ID" =
        (SELECT "DRIVER_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "ID" FROM "PACKAGES" WHERE "CONTENTS" = 'Flowers'
                )
        );



SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ID" FROM "PACKAGES" WHERE "ID" = (
                SELECT "PACKAGE_ID" FROM "SCANS" WHERE "PACKAGE_ID" = 5098
        )
);


SELECT * FROM "ADDRESSES" WHERE "ID" =348; -- 3RD

SELECT * FROM "SCANS" WHERE "PACKAGE_ID" = 5098; --2ND

SELECT * FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" IS NULL; --1ST


SELECT * FROM "SCANS"
        JOIN "PACKAGES" ON
                "PACKAGES"."ID", "PACKAGE_ID"."SCANS";

SELECT * FROM "SCANS"
       NATURAL JOIN "PACKAGES";

SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ID" FROM "PACKAGES" WHERE "ID" = (
                SELECT "PACKAGE_ID" FROM "SCANS" WHERE "PACKAGE_ID" = 5098
        )
);


SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "PACKAGE_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "FROM_ADDRESS_ID" FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" IS NULL
        )
);


SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ADDRESS_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "ID" FROM "PACKAGES" WHERE "ID" = 5098
        )
);

SELECT * FROM "PACKAGES" WHERE "ID" = (
        SELECT "PACKAGE_ID" FROM "SCANS" WHERE "PACKAGE_ID" = 5098
);

SELECT * FROM "ADDRESSES" WHERE "ID" = (

);
SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ADDRESS_ID" FROM "SCANS" WHERE "PACKAGE_ID" = 5098
);

SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ADDRESS_ID" FROM "SCANS" WHERE "PACKAGE_ID" = 5098 );

SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ADDRESS_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "ID" FROM "PACKAGES" WHERE "CONTENTS" = 'Duck debugger'
        )
);

SELECT * FROM "SCANS"
        JOIN "PACKAGES" ON "PACKAGES.ID" = "SCANS"."PACKAGE_ID";


SELECT * FROM "PACKAGES"
        JOIN "SCANS" ON "SCANS"."PACKAGE_ID" = "PACKAGES.ID";



SELECT * FROM "SCANS" WHERE "PACKAGE_ID" = (
        SELECT "ID" FROM "PACKAGES" WHERE "TO_ADDRESS_ID" = (
                SELECT "ID" FROM "ADDRESSES" WHERE "ID" = 50
        )
);

SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT
);

SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "TO_ADDRESS_ID" FROM "PACKAGES" WHERE "ID" = (
                SELECT "PACKAGE_ID" FROM "SCANS" WHERE "ID" = 30140
        )
);

(
SELECT * FROM "ADDRESSES" WHERE "ID" = (
        SELECT "ADDRESS_ID" FROM "SCANS" WHERE "PACKAGE_ID" = (
                SELECT "ID" FROM "PACKAGES" WHERE "TO_ADDRESS_ID" = 50
        )

);

SELECT * FROM "ADDRESSES"
        JOIN "SCANS" ON "SCANS"."ADDRESS_ID" = "ADDRESSES"."ID";




SELECT * FROM "ADDRESSES" WHERE "ADDRESS" = '728 Maple Place';

SELECT * FROM "PACKAGES" WHERE "FROM_ADDRESS_ID" = 9873;

SELECT * FROM "SCANS" WHERE "PACKAGE_ID" = 9523;

SELECT * FROM "DRIVERS" WHERE "ID" = 17;
