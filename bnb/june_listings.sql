--view table for all vacant listings and the number of days
--in june of 2023 that they remained vacant.

CREATE VIEW "june_vacancies" AS
SELECT "listing_id" AS "id", "property_type", "host_name", COUNT("available") AS "days_vacant", "available"
FROM "availabilities"
JOIN "listings" ON "listings"."id" = "availabilities"."listing_id"
GROUP BY "listing_id"
HAVING "availabilities"."available" = 'TRUE'
AND "availabilities"."date" BETWEEN '2023-06-01' AND '2023-06-30';
