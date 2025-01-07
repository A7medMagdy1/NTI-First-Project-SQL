-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

----------------------------------------------------------------------------------

-- Analyze factors affecting annual revenue
SELECT 
    reserved_room_type,                               
    COUNT(reservation_status) AS "reservation (check-out)",              
    ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights) * adr), 2) AS total_revenue, 
    ROUND(AVG((stays_in_week_nights + stays_in_weekend_nights) * adr), 2) AS avg_revenue_per_booking,
    arrival_date_year AS year
FROM hotels
WHERE reservation_status = 'Check-Out'  
GROUP BY reserved_room_type, arrival_date_year                        
ORDER BY reserved_room_type ASC, total_revenue DESC, arrival_date_year ASC;
-- This query analyzes revenue by room type and year, focusing on completed reservations and calculating total and average revenue per booking.
/*
1- Revenue Growth: Despite fluctuations in reservations, most room types show increasing average revenue per booking over time, reflecting better pricing or longer stays.
2- Room Type Performance: Room types A, D, and E are top performers in terms of total revenue and reservation count.
3- 2020 Trends: While total reservations dropped in 2020 (likely due to external factors like COVID-19), average revenue per booking increased across almost all room types, suggesting premium pricing or extended stays.