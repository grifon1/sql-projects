# Analyzing Airfare Data #

This project is designed to demonstrate the fundamental understanding of SQL using SQLite

The original project requirements may be found [here](https://discuss.codecademy.com/t/data-science-independent-project-5-analyze-airfare-data/419949).

## Objective ##
--------------------
As the data analyst of a major airline, you are presented with airfare data of the top 1,000 contiguous state city-pair markets. Today we will help them analyze this data and identify trends.

## Tasks ##
--------------------
### Exploration ###
1. What range of years are represented in the data?

    Code: 
    ```
    SELECT Year FROM airfare
    GROUP BY Year;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### The airfare dataset has flights between 1996 and 2018 ###

    Row|Year
    ---| ---
    1  | 1996
    2  | 1997
    3  | 1998
    4  |  1999
    5   | 2000
     6|   2001
     7|   2002
     8|   2003
     9|   2004
     10|   2005
     11|   2006
     12|   2007
     13|   2008
     14|   2009
     15|   2010
     16|   2011
     17|   2012
     18|   2013
     19|   2014
     20|   2015
     21|   2016
     22|   2017
     23|   2018
    </p>
    </details>

2.  What are the shortest and longest-distanced flights, and between which two cities are they?

    Code: 
    ```
    SELECT city1, city2, nsmiles
    FROM airfare
    ORDER BY nsmiles DESC
    LIMIT 1;

    SELECT city1, city2, nsmiles
    FROM airfare
    ORDER BY nsmiles ASC
    LIMIT 1;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### The longest flight is from Miami, FL to Seattle, WA at 2724 miles ###

    city1|city2|nsmiles
    ---| --- | ---
    Miami, FL (Metropolitan Area)|	Seattle, WA|	2724

    ### The shortest flight is from Los Angeles, CA to San Diego, CA ###

    city1|city2|nsmiles
    ---| --- | ---
    Los Angeles, CA (Metropolitan Area)|	San Diego, CA|	109
    </p>
    </details>
3. How many distinct cities are represented in the data?

    Code:
    ```
    SELECT city1
    FROM airfare
    UNION
    SELECT city2
    FROM airfare;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### There are 163 distinct cities in the dataset using the UNION function ###


    |city1|
    |-----|
    Albany, NY
    Albuquerque, NM
    Allentown/Bethlehem/Easton, PA
    Amarillo, TX
    Appleton, WI
    Asheville, NC
    Aspen, CO
    Atlanta, GA (Metropolitan Area)
    Atlantic City, NJ
    Austin, TX
    Bangor, ME
    Baton Rouge, LA
    Bellingham, WA
    Bend/Redmond, OR
    Billings, MT
    Birmingham, AL
    Bismarck/Mandan, ND
    Bloomington/Normal, IL
    Boise, ID
    Boston, MA (Metropolitan Area)
    Bozeman, MT
    Buffalo, NY
    Bullhead City, AZ
    Burlington, VT
    Cedar Rapids/Iowa City, IA
    Charleston, SC
    Charlotte, NC
    Chattanooga, TN
    Chicago, IL
    Cincinnati, OH
    Cleveland, OH (Metropolitan Area)
    Colorado Springs, CO
    Columbia, SC
    Columbus, OH
    Concord, NC
    Corpus Christi, TX
    Dallas/Fort Worth, TX
    Dayton, OH
    Daytona Beach, FL
    Denver, CO
    Des Moines, IA
    Detroit, MI
    Durango, CO
    Eagle, CO
    El Paso, TX
    Eugene, OR
    Eureka/Arcata, CA
    Fargo, ND
    Farmington, NM
    Fayetteville, AR
    Flint, MI
    Fort Collins/Loveland, CO
    Fort Myers, FL
    Fort Wayne, IN
    Fresno, CA
    Grand Forks, ND
    Grand Rapids, MI
    Great Falls, MT
    Green Bay, WI
    Greensboro/High Point, NC
    Greenville/Spartanburg, SC
    Gulfport/Biloxi, MS
    Harlingen/San Benito, TX
    Harrisburg, PA
    Hartford, CT
    Houston, TX
    Huntsville, AL
    Indianapolis, IN
    Jackson, WY
    Jackson/Vicksburg, MS
    Jacksonville, FL
    Kalispell, MT
    Kansas City, MO
    Key West, FL
    Knoxville, TN
    Lansing, MI
    Laredo, TX
    Las Vegas, NV
    Latrobe, PA
    Lexington, KY
    Lincoln, NE
    Little Rock, AR
    Los Angeles, CA (Metropolitan Area)
    Louisville, KY
    Lubbock, TX
    Madison, WI
    Martha's Vineyard, MA
    Medford, OR
    Melbourne, FL
    Memphis, TN
    Miami, FL (Metropolitan Area)
    Midland/Odessa, TX
    Milwaukee, WI
    Minneapolis/St. Paul, MN
    Minot, ND
    Mission/McAllen/Edinburg, TX
    Missoula, MT
    Mobile, AL
    Myrtle Beach, SC
    Nantucket, MA
    Nashville, TN
    New Orleans, LA
    New York City, NY (Metropolitan Area)
    Niagara Falls, NY
    Norfolk, VA (Metropolitan Area)
    Oklahoma City, OK
    Omaha, NE
    Orlando, FL
    Palm Springs, CA
    Panama City, FL
    Pasco/Kennewick/Richland, WA
    Pensacola, FL
    Peoria, IL
    Philadelphia, PA
    Phoenix, AZ
    Pittsburgh, PA
    Plattsburgh, NY
    Portland, ME
    Portland, OR
    Portsmouth, NH
    Provo, UT
    Punta Gorda, FL
    Quad Cities, IL (Metropolitan Area)
    Raleigh/Durham, NC
    Reno, NV
    Richmond, VA
    Roanoke, VA
    Rochester, NY
    Rockford, IL
    Sacramento, CA
    Saginaw/Bay City/Midland, MI
    Salinas/Monterey, CA
    Salt Lake City, UT
    San Antonio, TX
    San Diego, CA
    San Francisco, CA (Metropolitan Area)
    Sanford, FL
    Santa Barbara, CA
    Santa Rosa, CA
    Sarasota/Bradenton, FL
    Savannah, GA
    Seattle, WA
    Shreveport, LA
    Sioux Falls, SD
    South Bend, IN
    Spokane, WA
    Springfield, MO
    St. Louis, MO
    Steamboat Springs, CO
    Stockton, CA
    Syracuse, NY
    Tallahassee, FL
    Tampa, FL (Metropolitan Area)
    Toledo, OH
    Trenton, NJ
    Tucson, AZ
    Tulsa, OK
    Valparaiso, FL
    Washington, DC (Metropolitan Area)
    West Palm Beach/Palm Beach, FL
    Wichita, KS
    Wilmington, DE
    Wilmington, NC

    </p>
    </details>
### Analysis ###
4. Which airline appears most frequently as the carrier  with the lowest fare (i.e. `carrier_low`)?
    
    Code:
    ```
    SELECT COUNT(carrier_low) AS "Frequency Airline is Lowest Fare", carrier_low
    FROM airfare
    GROUP BY carrier_low
    ORDER BY "Frequency Airline is Lowest Fare" DESC
    LIMIT 1;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### WestJet (WN) appears most frequently as the carrier with the lowest fare ###
    Frequency Airline is Lowest Fare | carrier_low
    ---|---
    29652 | WN

    </p>
    </details>

5. What about the airline with the largest market share (i.e. `carrier_lg`)?
    
    Code:
    ```
    SELECT COUNT(carrier_lg) AS "Frequency Airline is Largest Market Share", carrier_lg
    FROM airfare
    GROUP BY carrier_lg
    ORDER BY "Frequency Airline is Largest Market Share" DESC
    LIMIT 1;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### WestJet (WN) appears most frequently as the carrier with the largest market share ###
    Frequency Airline is Largest Market Share | carrier_lg
    ---|---
    23659 | WN

    </p>
    </details>
6. How many instances are there where the carrier with the largest  market share is not the carrier with the lowest fare?

    Code:
    ```
    SELECT Count(*) AS "Frequency Airline is Largest Market Share but NOT lowest fare"
    FROM airfare
    WHERE carrier_lg != carrier_low;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### There are 59851 instances where the carrier with the largest market share is NOT the carrier with the lowest fare. This accounts for about 66% of flights in the dataset. ###
    |Frequency Airline is Largest Market Share but NOT lowest fare |
    |---|
    |59851|

    </p>
    </details>

7. What is the average difference in fare in the scenario from Question 6?

    Code:
    ```
    SELECT ROUND(AVG(fare_lg-fare_low), 2) AS "Average difference in fare"
    FROM airfare 
    WHERE carrier_lg != carrier_low;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### The average difference in fare between the carrier with the largest market share and the carrier with the lowest fare is $49.46  ###
    |Average difference in fare|
    |---|
    |49.46|

    </p>
    </details>
8. What is the percent change in average fare from 2007 to 2017 by flight? 1997 to 2007?

    Code:
    ```
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
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### Below are the first 10 flights, their average fare for 1997, 2007, and 2017, plus the percent change between 1997 and 2007 to 2017. ###
    Flight|avgf97|avgf07|avgf17|% Change 2007 vs. 2017|% Change 1997 vs. 2017
    ---| --- | --- | --- | --- | ---
    30135-30977 |275.0  | NULL  | NULL  | NULL  |NULL
    30135-31454	|132.0  | NULL  | NULL  | NULL	|NULL	
    30140-30194	|95.0	|132.0	|209.0	|58.3	|120.0
    30140-30325	|139.0	|148.0	|179.0	|20.9	|28.8
    30140-30397	|187.0	|274.0	|266.0	|-2.9	|42.2
    30140-30423	|132.0	|176.0	|203.0	|15.3	|53.8
    30140-30466	|74.0	|94.0	|158.0	|68.1	|113.5
    30140-30559	|147.0	|195.0	|189.0	|-3.1	|28.6
    30140-30615	|73.0	|NULL   |NULL   |NULL   |NULL
    30140-30721	|237.0	|262.0	|287.0	|9.5	|21.1
    </p>
    </details>
   
9. How would you describe the overall trend in airfares from 1997 to 2017? Now comparing 2007 to 2017?

    Code:
    ```
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
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### On average across all flights, the fares increased by $9 from '97 to '07 and $35 from '07 to '17.  ###
    Year|Avg Fare
    ---| ---
    1997|176.74
    2007|183.12
    2017| 218.34

    </p>
    </details>

10. Considering flights that have data for all 4 quarters, what is the average fare for each quarter? Which quarter has the highest average fare? Lowest?

    Code:
    ```
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
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### Below is the average fare for each quarter, combining all years together, using only flights that had data from each quarter. The first quarter has the highest average fare while the third quarter has the lowest average fare.  ###
    Quarter|AvgFare
    ---| ---
    1|195.42
    2|192.84
    3|189.29
    4|189.57

    </p>
    </details>

    
    ----
     * We can adjust the code from Question 10 to break down the average fare per quarter by year. 

        * Code:
     ```
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
    ```
    * <details> <summary> Click here for results</summary> 
        <p>

        ### Below is the average fare for each quarter, stratified by year, using only flights that had data from each quarter.   ###
        year|quarter|AvgFare
        ---| ---| ---
        1996	|1	|178.03
        1996	|2	|170.04
        1996	|3	|168.96
        1996	|4	|169.76
        1997	|1	|179.28
        1997	|2	|176.47
        1997	|3	|172.91
        1997	|4	|179.44
        1998	|1	|191.0
        1998	|2	|181.52
        1998	|3	|179.39
        1998	|4	|178.93
        1999	|1	|193.57
        1999	|2	|186.62
        1999	|3	|180.61
        1999	|4	|179.41
        2000	|1	|196.59
        2000	|2	|190.36
        2000	|3	|189.22
        2000	|4	|188.49
        2001	|1	|197.15
        2001	|2	|180.36
        2001	|3	|166.05
        2001	|4	|161.84
        2002	|1	|177.36
        2002	|2	|172.76
        2002	|3	|164.25
        2002	|4	|166.59
        2003	|1	|176.89
        2003	|2	|169.85
        2003	|3	|168.55
        2003	|4	|169.94
        2004	|1	|179.67
        2004	|2	|170.11
        2004	|3	|162.91
        2004	|4	|162.86
        2005	|1	|167.15
        2005	|2	|169.41
        2005	|3	|167.42
        2005	|4	|173.26
        2006	|1	|179.93
        2006	|2	|188.64
        2006	|3	|183.02
        2006	|4	|175.63
        2007	|1	|179.49
        2007	|2	|181.77
        2007	|3	|180.93
        2007	|4	|182.63
        2008	|1	|187.9
        2008	|2	|191.79
        2008	|3	|197.54
        2008	|4	|190.91
        2009	|1	|175.41
        2009	|2	|167.64
        2009	|3	|170.53
        2009	|4	|180.1
        2010	|1	|189.3
        2010	|2	|193.7
        2010	|3	|192.25
        2010	|4	|189.94
        2011	|1	|204.97
        2011	|2	|210.53
        2011	|3	|205.24
        2011	|4	|210.87
        2012	|1	|219.1
        2012	|2	|222.36
        2012	|3	|211.7
        2012	|4	|214.77
        2013	|1	|219.82
        2013	|2	|218.95
        2013	|3	|225.58
        2013	|4	|220.84
        2014	|1	|228.2
        2014	|2	|231.77
        2014	|3	|230.04
        2014	|4	|227.69
        2015	|1	|233.21
        2015	|2	|228.8
        2015	|3	|222.89
        2015	|4	|217.27
        2016	|1	|223.96
        2016	|2	|218.39
        2016	|3	|215.88
        2016	|4	|215.83
        2017	|1	|221.63
        2017	|2	|221.11
        2017	|3	|208.84
        2017	|4	|213.85

        </p>
        </details>


     * In addition, we can break this information down on a flight-by-flight basis for more granular analysis. Let's see what that would look like:

    Code:
    ```
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
    ```

    * <details> <summary> Click here for results</summary> 
        <p>

        ### Grouped by the unique flight variable we created from the first temporary table, we can see a historical view of each flight's average fare over the years.  ###

        flight|year|quarter|AvgFare
        --- | --- | --- | ---
        30135-30977	|1996	|1|	274.24
        30135-30977	|1996	|2|	261.11
        30135-30977	|1996	|3|	260.73
        30135-30977	|1996	|4|	260.58
        30135-31454	|1996	|1|	198.67
        30135-31454	|1996	|2|	183.75
        30135-31454	|1996	|3|	191.51
        30135-31454	|1996	|4|	180.23
        30135-31454	|1997	|1|	212.17
        30135-31454	|1997	|2|	106.52
        30135-31454	|1997	|3|	99.39
        30135-31454	|1997	|4|	111.61
        30135-31454	|1998	|1|	122.88
        30135-31454	|1998	|2|	109.75
        30135-31454	|1998	|3|	104.36
        30135-31454	|1998	|4|	116.23
        30135-31454	|1999	|1|	127.63
        30135-31454	|1999	|2|	110.04
        30135-31454	|1999	|3|	104.6
        30135-31454	|1999	|4|	114.75
        30135-31454	|2000	|1|	130.32
        30135-31454	|2000	|2|	126.52
        30135-31454	|2000	|3|	111.29
        30135-31454	|2000	|4|	118.69
        30135-31454	|2001	|1|	117.48
        30135-31454	|2001	|2|	110.47
        30135-31454	|2001	|3|	104.61
        30135-31454	|2001	|4|	113.39
        30135-31454	|2010	|1|	115.77
        30135-31454	|2010	|2|	106.18
        30135-31454	|2010	|3|	104.8
        30135-31454	|2010	|4|	113.22
        30135-31454	|2011	|1|	119.16
        30135-31454	|2011	|2|	128.3
        30135-31454	|2011	|3|	125.82
        30135-31454	|2011	|4|	140.95
        30135-31454	|2012	|1|	135.85
        30135-31454	|2012	|2|	139.95
        30135-31454	|2012	|3|	125.29
        30135-31454	|2012	|4|	135.57

        </p>
        </details>