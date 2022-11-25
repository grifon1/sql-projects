--Airfare contains the airfare data covering the top 1,000 contiguous state-city pair markets.
--Dataset exploration--


--Range of years: 1996 to 2018
SELECT Year FROM airfare
GROUP BY Year;

--Which are the shortest and longest-distanced flights? Between which 2 cities are they?
--Longest flight from Miami, FL to Seattle, WA. This flight is 2724 miles.
SELECT city1, city2, nsmiles
FROM airfare
ORDER BY nsmiles DESC
LIMIT 1;

--Shortest flight from Los Angeles, CA to San Diego, CA. This flight is 109 miles.
SELECT city1, city2, nsmiles
FROM airfare
ORDER BY nsmiles ASC
LIMIT 1;

--How many distinct cities are represented in the data (regardless of whether it is the source or destination)?
--There are 163 distinct cities in the dataset using the UNION function.
SELECT city1
FROM airfare
UNION
SELECT city2
FROM airfare;

--Which airline appears most frequently as the carrier with the lowest fare (carrier_low)? 
--WestJet appears most frequently as the carrier with the lowest fare.
SELECT COUNT(carrier_low) AS "Frequency Airline is Lowest Fare", carrier_low
FROM airfare
GROUP BY carrier_low
ORDER BY "Frequency Airline is Lowest Fare" DESC
LIMIT 1;

--Which airline appears most frequently as the airline with the largest market share (carrier_lg)?
--WestJet appears most frequently as the largest market share.
SELECT COUNT(carrier_lg) AS "Frequency Airline is Largest Market Share", carrier_lg
FROM airfare
GROUP BY carrier_lg
ORDER BY "Frequency Airline is Largest Market Share" DESC
LIMIT 1;

--How many instances are there where the carrier with the largest market share is NOT the carrier with the lowest fare? 
--There are 59851 instances where the carrier with the largest market share is NOT the carrier with the lowest fare. This accounts for about 66% of flights in the dataset.
SELECT Count(*) AS "Frequency Airline is Largest Market Share but NOT lowest fare"
FROM airfare
WHERE carrier_lg != carrier_low;

--This code will give all 59851 instances in the above scenario, the largest market share carrier, the lowest fare carrier, and their difference in fare
SELECT carrier_lg, carrier_low, fare_lg-fare_low AS "Fare difference"
FROM airfare
WHERE carrier_lg != carrier_low;


--What is the average difference in fare in the above scenario?
--The average difference in fare is $49.46
SELECT ROUND(AVG(fare_lg-fare_low), 2) AS "Average difference in fare"
FROM airfare 
WHERE carrier_lg != carrier_low;

--What is the percent change in average fare from 2007 to 2017 by flight?
--How about from 1997 to 2017?

-- Subquery: Annual avg fares by Flight for 97, 07, 17 --
WITH 
	Seventeen AS(
		SELECT
			citymarketid_1|| '-' || citymarketid_2 AS Flight,
			ROUND(AVG(fare),0) AS avgf17
		FROM airfare
		WHERE Year = 2017
		GROUP BY Flight
		),

	Seven AS(
		SELECT
			citymarketid_1|| '-' || citymarketid_2 AS Flight,
			ROUND(AVG(fare),0) AS avgf07
		FROM airfare
		WHERE Year = 2007
		GROUP BY Flight
		),
	
	NinetySeven AS(
		SELECT
			citymarketid_1|| '-' || citymarketid_2 AS Flight,
			ROUND(AVG(fare),0) AS avgf97
		FROM airfare 
		WHERE Year = 1997
		GROUP BY Flight
		)

	-- Main query: Output all 3 years by Flight --
SELECT
	NinetySeven.Flight,
	avgf97,
	avgf07,
	avgf17,
	ROUND((avgf17 - avgf07) / avgf07 * 100,1) AS '% Change 2007 vs. 2017',
	ROUND((avgf17 - avgf97) / avgf97 * 100,1) AS '% Change 1997 vs. 2017'
	
FROM
	NinetySeven 
	LEFT JOIN Seven
		ON NinetySeven.Flight = Seven.Flight
	LEFT JOIN Seventeen
		ON Seven.Flight = Seventeen.Flight
	LIMIT 10;
	

--How would you describe the overall trend in airfares from 1997 to 2017, as compared to 2007 and 2017?
--On average across all flights, the fares increased by $9 from '97 to '07 and $35 from '07 to '17.
SELECT Year, ROUND(AVG(fare), 2) AS "Avg Fare"
FROM airfare
WHERE Year = 1997
UNION
SELECT Year, ROUND(AVG(fare), 2) AS "Avg Fare"
FROM airfare
WHERE Year = 2007
UNION
SELECT Year, ROUND(AVG(fare), 2) AS "Avg Fare"
FROM airfare
WHERE Year = 2017

--Considering only the flights that have data available for all 4 quarters of the year,
--What is the average fare for each quarter? Which quarter of the year has the highest overall average fare? Lowest?

--Query steps:
	--Give me a list of unique flights that have flights going all 4 quarters. Cut out any flights that don't have data in each quarter
	--Match the flight year variable from the main table to this new list of flights that have flights in all 4 quarters.
	--Show  the average fare of each flight grouped first by year, then specific flight (from origin city to destination city), then by quarter
	--ONLY OF those flights that have data for all 4 quarters. Then order them sequentially by year, then quarter.
	
WITH
fourqtrflight (Year, flight, flight_year, quarter) AS(
	SELECT 
		year,
		citymarketid_1|| '-' || citymarketid_2,
		citymarketid_1|| '-' || citymarketid_2 ||'_'|| year,
		quarter
	FROM airfare
	GROUP BY 2,1
	HAVING COUNT(DISTINCT quarter) = 4
),
final(year, flight, quarter, fare) AS(
	SELECT airfare.year, fourqtrflight.flight, airfare.quarter, airfare.fare
	FROM airfare
	JOIN fourqtrflight
	ON airfare.flight_year = fourqtrflight.flight_year)

SELECT Quarter, ROUND(AVG(fare), 2) as AvgFare 
FROM final
GROUP BY Quarter
ORDER BY Quarter;

--Adjusting query to include Yearly breakdown of average fare by quarter.
WITH
fourqtrflight (Year, flight, flight_year, quarter) AS(
	SELECT 
		year,
		citymarketid_1|| '-' || citymarketid_2,
		citymarketid_1|| '-' || citymarketid_2 ||'_'|| year,
		quarter
	FROM airfare
	GROUP BY 2,1
	HAVING COUNT(DISTINCT quarter) = 4
),
final(year, flight, quarter, fare) AS(
	SELECT airfare.year, fourqtrflight.flight, airfare.quarter, airfare.fare
	FROM airfare
	JOIN fourqtrflight
	ON airfare.flight_year = fourqtrflight.flight_year)

SELECT Year, Quarter, ROUND(AVG(fare), 2) as AvgFare 
FROM final
GROUP BY Year, Quarter
ORDER BY Year;

--Adjusting query to show on a flight-by-flight basis the average quarterly fare by year.
WITH
fourqtrflight (Year, flight, flight_year, quarter) AS(
	SELECT 
		year,
		citymarketid_1|| '-' || citymarketid_2,
		citymarketid_1|| '-' || citymarketid_2 ||'_'|| year,
		quarter
	FROM airfare
	GROUP BY 2,1
	HAVING COUNT(DISTINCT quarter) = 4
),
final(year, flight, quarter, fare) AS(
	SELECT airfare.year, fourqtrflight.flight, airfare.quarter, airfare.fare
	FROM airfare
	JOIN fourqtrflight
	ON airfare.flight_year = fourqtrflight.flight_year)

SELECT flight, year, Quarter, ROUND(AVG(fare), 2) as AvgFare 
FROM final
GROUP BY flight, year, Quarter
ORDER BY flight, year
LIMIT 40;