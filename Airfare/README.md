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

    ### WestJet (WN) appears most frequently as the carrier with the lowest fare ###
    Frequency Airline is Largest Market Share | carrier_lg
    ---|---
    23659 | WN

    </p>
    </details>
6. How many instances are there where the carrier with the largest  market share is not the carrier with the lowest fare?

    Code:
    ```
    SELECT carrier_lg, carrier_low, fare_lg-fare_low
    FROM airfare
    WHERE carrier_lg != carrier_low;
    ```
    <details> <summary> Click here for results</summary> 
    <p>

    ### There are 59851 instances where the carrier with the largest market share is NOT the carrier with the lowest fare. This accounts for about 66% of flights in the dataset. ###
    Frequency Airline is Largest Market Share | carrier_lg
    ---|---
    23659 | WN

    </p>
    </details>

    * What is the average difference in this fare?
* What is the percent change in average fare from 2007 to 2017 by flight?
    * What about from 1997 to 2017?
    * How would you describe the overall trend in airfares from 1997 to 2017? Now comparing 2007 to 2017?
* What is the average fare for each quarter? 
    * Which quarter of the year has the highest overall average fare? 
    * Which quarter has the lowest fare?
* Considering only the flights that have data available on all 4 quarters of the year, which quarter has the highest overall average fare?
    * Which quarter has the lowest overall average fare?