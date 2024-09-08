
-- View table containing all listing available dates

CREATE VIEW "available" AS
SELECT "Listing_id" AS "id", "property_type", "host_name", "date", "available"
FROM "availabilities"
JOIN "listings" ON "listings"."id"="availabilities"."listing_id"
WHERE "available" = 'TRUE';
