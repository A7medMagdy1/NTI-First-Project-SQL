-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

----------------------------------------------------------------------------------

-- Find out more: Customer type confirms or cancels the reservation based on the waiting list for each hotel
SELECT 
    hotel, 
    customer_type, 
    SUM(days_in_waiting_list) AS days_in_waiting_list,  
    SUM(previous_bookings_not_canceled) AS previous_bookings_not_canceled, 
    SUM(previous_cancellations) AS previous_cancellations
FROM hotels
GROUP BY customer_type, hotel 
ORDER BY previous_bookings_not_canceled DESC, previous_cancellations DESC;
-- This query analyzes the relationship between customer type and reservation behavior (confirmed or canceled) for each hotel, based on the waiting list, previous bookings, and cancellations.
/*
City Hotel has high demand and cancellation rates, particularly among transient customers and transient parties.
Resort Hotel shows lower waiting time and cancellations for most customer types, but transient customers have a higher cancellation rate.
Contract and Group customers generally show lower cancellation rates and less waiting time across both hotels.