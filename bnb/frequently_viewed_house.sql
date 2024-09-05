--view table for 100 most frequently reviewed listings,
--sorted from most to least frequently reviewed.

CREATE VIEW "frequently_reviewed" AS
SELECT "listing_id" AS "id", "property_type", "host_name", count("reviews") AS "reviews"
FROM "reviews"
JOIN "listings" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listing_id"
ORDER BY "reviews" DESC, "property_type", "host_name"
LIMIT 100;
