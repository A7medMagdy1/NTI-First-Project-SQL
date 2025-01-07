-- This view combines data from the years 2018, 2019, and 2020 into a single dataset.
-- Create a view combining data from multiple years
CREATE VIEW hotels AS
SELECT * FROM year2018
UNION ALL
SELECT * FROM year2019
UNION ALL
SELECT * FROM year2020;

----------------------------------------------------------------------------------------

-- Calculate the profit percentage for each month across all years
-- This query calculates the monthly revenue for each year by summing up the revenue generated by both weekday and weekend stays.
SELECT 
    arrival_date_year, 
    arrival_date_month,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr), 0) AS revenue
FROM hotels
GROUP BY arrival_date_month, arrival_date_year
ORDER BY arrival_date_year, arrival_date_month;
/*
Peak Travel Months:
August consistently delivers the highest revenue across all years.
Other high-performing months include July, June, and September, aligning with typical summer vacation periods.
Seasonality:

Winter (December, January): Revenue tends to be the lowest, except for anomalies like December 2019.
Spring (March, April, May): Moderate to strong revenue performance, likely reflecting the start of the travel season.
Year-on-Year Growth:

Revenue increases significantly from 2018 to 2019, especially in high-demand months like August.
2020 shows resilience in months like April and summer despite potential disruptions (e.g., COVID-19).
Recommendations:

Focus on promotions and package deals during low-revenue months like January and December to boost bookings.
Optimize pricing for peak months (August, July) to maximize revenue while maintaining occupancy.
