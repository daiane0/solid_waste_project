-- Database: solid_waste


SELECT "DimStation".station_id,
       "DimTruck".truck_type,
       SUM("FactTrips".waste_colleted) AS total_waste_collected
FROM public."FactTrips" LEFT JOIN public."DimStation" ON "FactTrips".station_id = "DimStation".station_id
LEFT JOIN public."DimTruck" ON "FactTrips".truck_id = "DimTruck".truck_id
GROUP BY ( "DimStation".station_id, "DimTruck".truck_type);
