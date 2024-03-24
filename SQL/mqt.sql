CREATE MATERIALIZED VIEW "max_waste_stats" AS
SELECT
    "DimStation".city,
    "FactTrips".station_id,
    "DimTruck".truck_type,
    MAX("FactTrips".waste_colleted) AS max_waste_colleted
FROM
    public."FactTrips"
JOIN
    public."DimStation" ON "FactTrips".station_id = "DimStation".station_id
JOIN
    public."DimTruck" ON "FactTrips".truck_id = "DimTruck".truck_id
GROUP BY
    "DimStation".city,
    "FactTrips".station_id,
    "DimTruck".truck_type;
