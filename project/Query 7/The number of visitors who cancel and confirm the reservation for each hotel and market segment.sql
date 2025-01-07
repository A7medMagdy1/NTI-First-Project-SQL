-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;
-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.

----------------------------------------------------------------------------------

-- The number of visitors who cancel and confirm the reservation for each hotel and market segment
SELECT 
    hotel,
    market_segment,
    SUM(CASE WHEN is_canceled = 1 THEN 1 ELSE 0 END) AS "canceled",
    SUM(CASE WHEN is_canceled = 0 THEN 1 ELSE 0 END) AS "not_canceled"
FROM hotels
GROUP BY hotel, market_segment
ORDER BY canceled DESC , Not_canceled DESC;
-- This query calculates the total number of canceled and non-canceled reservations for each hotel and market segment.

/*
Market Segment Performance:
Online TA is the largest segment for both hotel types but has a higher cancellation rate in City Hotels.
Direct bookings are the most reliable across both hotel types.
Cancellation Trends:

Group bookings have a high cancellation rate in City Hotels.
Resort Hotels have a better balance of canceled vs. not-canceled bookings compared to City Hotels.
Recommendations:

City Hotels: Focus on reducing cancellations for group bookings by improving booking terms or offering incentives.
Resort Hotels: Enhance marketing efforts for Offline TA/TO and Direct segments due to their strong performance.
General: Investigate and clean up anomalous entries in the "Undefined" and "hotel" categories.