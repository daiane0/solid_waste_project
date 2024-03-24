SELECT 
    "MyDimDate".year,
    "dimStation".city,
    "dimStation".station_id,
    AVG("FactTrips".waste_colleted) AS average_waste_colleted
FROM 
    public."FactTrips" "factTrips"
JOIN 
    public."MyDimDate" "MyDimDate" ON "factTrips".date_id = "MyDimDate".date_id
JOIN 
    public."DimStation" "dimStation" ON "factTrips".station_id = "dimStation".station_id
GROUP BY 
    CUBE("MyDimDate".year, "dimStation".city, "dimStation".station_id)
ORDER BY 
    "MyDimDate".year, "dimStation".city, "dimStation".station_id;
