-- Database: solid_waste

SELECT 
    "MyDimDate".year,
    "DimStation".city,
    "DimStation".station_id,
    SUM("FactTrips".waste_colleted) AS total_waste_collected
FROM 
    public."FactTrips" "FactTrips"
JOIN 
    public."MyDimDate" "MyDimDate" ON "FactTrips".date_id = "MyDimDate".date_id
JOIN 
    public."DimStation" "DimStation" ON "FactTrips".station_id = "DimStation".station_id
GROUP BY 
    ROLLUP("MyDimDate".year, "DimStation".city, "DimStation".station_id)
ORDER BY 
    "MyDimDate".year, "DimStation".city, "DimStation".station_id;
