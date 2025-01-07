-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

----------------------------------------------------------------------------------

-- The time of the year has the most demand for the month
SELECT 
    hotel, 
    arrival_date_month, 
    SUM(stays_in_week_nights) AS stays_in_week_nights, 
    SUM(stays_in_weekend_nights) AS stays_in_weekend_nights
FROM 
    hotels
GROUP BY 
    hotel, arrival_date_month
ORDER BY 
    stays_in_week_nights DESC, 
    stays_in_weekend_nights DESC;
/*
Resort Hotel in August had the highest number of stays with 25,349 week nights and 9,742 weekend nights, followed closely by City Hotel in August with 23,715 week nights and 8,706 weekend nights.
Resort Hotel in July had 20,702 week nights and 8,038 weekend nights.
City Hotel in July had 19,828 week nights and 8,155 weekend nights.
The City Hotel had more week nights in the summer months (August, July) and a generally higher number of weekend nights compared to other months.
Other months like September, October, and May show a mix of both hotel types but with smaller values for stays in week and weekend nights.

The hotel entry for January with just 6 stays in week nights and 1 stay in weekend nights likely indicates incomplete or special data related to a certain hotel not categorized in the usual hotel types (like a missing or unidentified hotel record).