--Exploration
--How many public schools are in each zip code? In each state?

--Number of public high schools by zip code
SELECT COUNT(*) AS "Number of Public High Schools", zip_code FROM highschool
GROUP BY zip_code
ORDER BY 1 desc;

--Number of public high schools by state
SELECT COUNT(*) AS "Number of Public High Schools", state_code FROM highschool
GROUP BY state_code
ORDER BY 1 desc;

--Locale_code recoding
SELECT school_name, locale_code,

CASE WHEN locale_code <= 13 THEN 'City'
	WHEN locale_code <= 23 THEN 'Suburb'
	WHEN locale_code <= 33 THEN 'Town'
	WHEN locale_code <= 43 THEN 'Rural'
	
END Urban_Type,

CASE WHEN locale_code <=23 THEN

	CASE substr(locale_code, 2, 2)
	WHEN '1' THEN 'Large'
	WHEN '2' THEN 'Midsize'
	WHEN '3' THEN 'Small'
	END

	WHEN locale_code >= 31 THEN
	CASE substr(locale_code, 2,2)
	WHEN '1' THEN 'Fringe'
	WHEN '2' THEN 'Distant'
	WHEN '3' THEN 'Remote'
	ELSE 'missing data'
	END

END AS Urban_Size
FROM highschool;

--What is the Minimum, maximum, and average median_household_income of the nation? For each state?

--National median household income stats
SELECT 
	ROUND(MIN(median_household_income)) AS 'Minimum Median Income', 
	ROUND(AVG(median_household_income)) AS 'Average Median Income', 
	ROUND(MAX(median_household_income)) AS 'Maximum Median Income'
FROM census
WHERE median_household_income != 'NULL';

--State by state median household income stats
SELECT 
	state_code AS State, 
	MIN(median_household_income) AS 'Minimum Median Income', 
	ROUND(AVG(median_household_income), 0) AS 'Average Median Income', 
	MAX(median_household_income) AS 'Maximum Median Income'
FROM census
WHERE median_household_income != 'NULL'
GROUP BY state_code;

--Do characteristics of the zip code area (such as median household income) affect students' performance in school?

--The view below shows only schools that have data for math and reading proficiencies AND have median household income for that zip code.
CREATE VIEW income
AS
SELECT school_name, highschool.state_code, highschool.zip_code, median_household_income, pct_proficient_math, pct_proficient_reading
FROM highschool
INNER JOIN census ON census.zip_code = highschool.zip_code
WHERE census.median_household_income != 'NULL' AND highschool.pct_proficient_math != 'NULL' AND highschool.pct_proficient_reading != 'NULL';

SELECT * FROM income;
	
--Using the income view, we categorize median household income into low, medium, and high, 
--include math and reading scores, then group by the categorized income range.

SELECT
CASE
WHEN (median_household_income < 50000) THEN 'Low Income'
WHEN (median_household_income BETWEEN 50000 AND 100000) THEN 'Middle Income'
WHEN (median_household_income > 100000) THEN 'High Income'
END Income_Range,

ROUND(AVG(pct_proficient_math), 2) AS 'Average Math Scores', 
ROUND(AVG(pct_proficient_reading), 2) AS 'Average Reading Scores'

FROM income
GROUP BY Income_Range
ORDER BY 'Average Math Scores';

--On average, do students perform better on the math or reading exam? 
--Find the number of states where students do better on the math exam, and vice versa.

--On average, students perform better on the reading exam
SELECT 
	ROUND(AVG(pct_proficient_math),2) AS 'Avg Math Score', 
	ROUND(AVG(pct_proficient_reading),2) AS 'Avg Reading Score' 
FROM highschool;

--The query below produces the 6 States, Iowa, Indiana, Maryland, South Carolina, Texas, and Wyoming 
--where average state math scores are higher than the average state reading scores
SELECT state_code, ROUND(AVG(pct_proficient_math),2) AS 'Average State Math Score', ROUND(AVG(pct_proficient_reading), 2) AS 'Average State Reading Score'
FROM highschool 
GROUP BY state_code
HAVING AVG(pct_proficient_math) > AVG(pct_proficient_reading)
ORDER BY 'Average State Math Score';

--The query below produces the states where students performed better on reading than on math.
SELECT state_code, ROUND(AVG(pct_proficient_math),2) AS 'Average State Math Score', ROUND(AVG(pct_proficient_reading), 2) AS 'Average State Reading Score'
FROM highschool 
GROUP BY state_code
HAVING AVG(pct_proficient_math) < AVG(pct_proficient_reading)
ORDER BY 'Average State Reading Score';

--As a combined query, however:
WITH highest_results AS(
SELECT state_code AS 'State', ROUND(AVG(pct_proficient_math),2) AS 'Math Scores', ROUND(AVG(pct_proficient_reading),2) AS 'Reading Scores',
CASE
	WHEN (AVG(pct_proficient_math) > AVG(pct_proficient_reading)) THEN 'Math'
	WHEN (AVG(pct_proficient_math) < AVG(pct_proficient_reading)) THEN 'Reading'
	ELSE 'No Exam Data'
	END AS "Math vs. Reading"
FROM highschool GROUP BY state_code)

SELECT COUNT(*) as 'Number of States', "Math vs. Reading"
FROM highest_results
GROUP BY "Math vs. Reading";


-----------------What is the average proficiency on state assessment exams for each zip code, and how do they compare to other zip codes in the same state?
WITH state_avg AS (
	SELECT highschool.state_code, ROUND(MIN(pct_proficient_math),2) AS 'State Minimum Math Score', ROUND(AVG(pct_proficient_math),2) AS 'State Average Math Score', ROUND(MAX(pct_proficient_math),2) AS 'State Maximum Math Score', ROUND(MIN(pct_proficient_reading),2) AS 'State Minimum Reading Score',  ROUND(AVG(pct_proficient_reading),2) AS 'State Average Reading Score', ROUND(MAX(pct_proficient_reading),2) AS 'State Maximum Reading Score'
	FROM highschool
	WHERE pct_proficient_math != 'NULL' AND pct_proficient_reading != 'NULL'
	GROUP BY highschool.state_code
	)
SELECT highschool.state_code, zip_code, pct_proficient_math AS 'Math Score of Zip Code', pct_proficient_reading AS 'Reading Score of Zip Code', state_avg.'State Minimum Math Score', state_avg.'State Average Math Score', state_avg.'State Maximum Math Score', state_avg.'State Minimum Reading Score', state_avg.'State Average Reading Score', state_avg.'State Maximum Reading Score'
FROM highschool
INNER JOIN state_avg ON state_avg.state_code = highschool.state_code
GROUP BY highschool.zip_code
ORDER BY highschool.state_code, zip_code;

----------------
