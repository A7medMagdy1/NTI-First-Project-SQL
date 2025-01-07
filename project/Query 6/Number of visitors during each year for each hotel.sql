-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

-------------------------------------------------------------------------------------

-- Number of visitors during each year for each hotel
SELECT  
    arrival_date_year, 
    hotel,
    SUM(adults) AS "total_adults", 
    SUM(children) AS "total_children", 
    SUM(babies) AS "total_babies",
    SUM(adults + children + babies) AS "total_visitors"
FROM hotels
GROUP BY hotel, arrival_date_year
ORDER BY arrival_date_year;
-- This query calculates the total number of adults, children, and babies, as well as the total visitors for each hotel by year.
/*
City Hotels vs. Resort Hotels:
City Hotels consistently attract more visitors, especially adults, compared to Resort Hotels.
Resort Hotels attract a slightly higher proportion of families (children and babies).
Growth and Decline:

Visitor numbers surged in 2019 for both hotel types but declined in 2020, likely due to travel restrictions or reduced demand caused by global events.
Data Integrity Issue:

The "hotel" category in 2019 seems anomalous. This should be investigated and corrected if it is a data entry error.
Recommendations:

City Hotels: Focus on adult-centric promotions, business travelers, and events.
Resort Hotels: Target families with tailored packages and activities.
Address data quality issues to ensure accurate analysis in future reporting.