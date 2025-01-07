-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

----------------------------------------------------------------------------------

-- Compare hotel revenues during official holidays to regular days
SELECT
    arrival_date_year,
    ROUND(AVG(stays_in_week_nights), 2) AS "average_book_week_nights", 
    ROUND(AVG(stays_in_week_nights * adr), 0) AS "revenue(average_book_week_nights)",
    ROUND(AVG(stays_in_weekend_nights), 2) AS "average_book_weekend_nights",
    ROUND(AVG(stays_in_weekend_nights * adr), 0) AS "revenue(average_book_weekend_nights)"
FROM hotels
GROUP BY arrival_date_year 
ORDER BY arrival_date_year ASC;
-- This query calculates the average number of bookings and revenues for both weekdays and weekends, grouped by year.
/*
2020 recorded the highest revenue despite the pandemic, likely due to increased prices (ADR) or shifts in booking patterns.
2019 showed a general decline in both average bookings and revenue compared to 2018.
These insights can guide a better understanding of annual booking and revenue trends, helping improve pricing strategies and marketing efforts.