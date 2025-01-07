-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

---------------------------------------------------------------------------------------------

-- Determine the most requested type of food in every hotel (City Hotel, Hotel, Resort Hotel)
WITH meals AS (
    SELECT 
        hotel,  
        SUM(CASE WHEN meal = 'BB' THEN 1 ELSE 0 END) AS "meal(bb)",
        SUM(CASE WHEN meal = 'FB' THEN 1 ELSE 0 END) AS "meal(fb)",
        SUM(CASE WHEN meal = 'HB' THEN 1 ELSE 0 END) AS "meal(hb)",
        SUM(CASE WHEN meal = 'SC' THEN 1 ELSE 0 END) AS "meal(sc)",
        COUNT(meal) AS "total meals"
    FROM hotels
    WHERE meal IS NOT NULL
    GROUP BY hotel
)
SELECT * 
FROM meals 
ORDER BY hotel;
-- This query creates a temporary table to calculate the total requests for each meal type per hotel. The final SELECT retrieves the data sorted by hotel.
/*The results show that the most requested meal is the “BB” meal. The total number of meals ordered is as follows:
	•	City Hotel: 85,488 meals
	•	Resort Hotel: 45,552 meals
	•	Hotel: 4 meals