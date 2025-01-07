-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

--------------------------------------------------------------------------------------

-- Identify factors that significantly impact hotel revenue annually
SELECT 
    arrival_date_year,
    hotel, 
    market_segment, 
    meal,
    SUM(stays_in_week_nights + stays_in_weekend_nights) AS "nights_booked", 
    CONCAT('$', CAST(ROUND(SUM(adr), 2) AS VARCHAR)) AS revenue
FROM hotels
GROUP BY arrival_date_year, hotel, market_segment, meal
ORDER BY arrival_date_year, hotel, revenue DESC;
-- This query evaluates the impact of hotel type, market segment, and meals on revenue annually.
/*
Online TA (BB meal plan) is consistently the most profitable segment for both City and Resort Hotels across all years, reflecting a reliance on online travel agencies for bookings.
Groups and Offline TA/TO segments also contribute heavily, especially in BB and HB meal plans.
Direct bookings are steadily growing, particularly in Resort Hotels, highlighting the importance of direct marketing strategies.
The year 2020 saw a drop in overall volume, but higher ADR (Average Daily Rate) likely maintained strong revenues for key segments.