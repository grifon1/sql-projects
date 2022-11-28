# Analyzing Education Data #

This project is designed to demonstrate the fundamental understanding of SQL using SQLite

The original project requirements may be found [here](https://discuss.codecademy.com/t/data-science-independent-project-3-education-census-data/419947).

The raw data needed to complete this project (`public_hx_data.csv` and `census_data.csv`) may also be downloaded from this repository.

## Objective ##
---------------------------
Your advice is needed by a team of policymakers seeking to make more informed decisions on education. Help them investigate how external factors such as socioeconomic status may influence performance in state assessment exams for public high school students.

## Tasks ##
------------------
### Exploration ###
1. How many public high schools are in each zip code? In each state?

    Code:
    ```
    --Number of public high schools by zip code
    SELECT COUNT(*) AS "Number of Public High Schools", zip_code FROM highschool
    GROUP BY zip_code
    ORDER BY 1 desc;

    --Number of public high schools by state
    SELECT COUNT(*) AS "Number of Public High Schools", state_code FROM highschool
    GROUP BY state_code
    ORDER BY 1 desc;
    ```
    <details> <summary> Click here for zip code results</summary> 
    <p>

    ### The zip code with the most public schools is the Lower East Side of New York City. Results past 50 rows have been truncated ###

    Number of Public High Schools|zip_code
    ---| ---
    11|	10002
    10|	11101
    9|	60623
    9|	11236
    9|	10473
    9|	10456
    8|	85364
    8|	75203
    8|	43232
    8|	11201
    8|	10463
    8|	10457
    8|	10019
    8|	10011
    7|	90011
    7|	85282
    7|	60608
    7|	48197
    7|	11211
    7|	10468
    7|	10467
    7|	10458
    7|	10451
    7|	10023
    7|	10003
    6|	95127
    6|	92101
    6|	91340
    6|	90063
    6|	90026
    6|	88001
    6|	85705
    6|	85353
    6|	85308
    6|	85283
    6|	85051
    6|	85032
    6|	60624
    6|	38116
    6|	37209
    6|	11221
    6|	11203
    6|	10459
    5|	98003
    5|	97071
    5|	92392
    5|	92345
    5|	90280
    5|	90255
    5|	90065
    </p>
    </details>

    <details> <summary> Click here for state-level results</summary> 
    <p>

    ### The state with the most public schools is California followed by Texas. ###

    Number of Public High Schools|zip_code
    ---| ---
    1294|	CA
    1199|	TX
    933|	NY
    770|	OH
    704|	IL
    597|	MI
    592|	PA
    493|	FL
    487|	MO
    477|	NC
    461|	OK
    440|	WI
    420|	MN
    418|	AZ
    399|	GA
    363|	WA
    355|	IN
    352|	NJ
    340|	TN
    309|	VA
    308|	KS
    299|	IA
    292|	MA
    283|	CO
    275|	AL
    271|	AR
    268|	NE
    229|	OR
    219|	LA
    208|	KY
    204|	SC
    199|	MS
    185|	MD
    173|	NM
    170|	CT
    168|	MT
    164|	ND
    162|	SD
    160|	PR
    141|	UT
    113|	ID
    109|	ME
    103|	WV
    96|	NV
    92|	NH
    63|	WY
    50|	AK
    48|	RI
    45|	VT
    39|	HI
    28|	DE
    28|	DC
    18|	BI
    6|	GU
    4|	VI
    </p>
    </details>

2. The `locale_code` column in the high school data corresponds to various levels of urbanization as listed below. Recode the high school data according to the chart.

    locale_text|locale_code(locale_size)
    ---|---
    City|11 (Large), 12 (Midsize), 13 (Small)
    Suburb|21 (Large), 22 (Midsize), 23 (Small)
    Town|31 (Fringe), 32 (Distant), 33 (Remote)
    Rural| 41 (Fringe), 42 (Distant), 43 (Remote) 

    Code:
    ```
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
    ```
3. What is the minimum, maximum, and average `median_household_income` of the nation? For each state?

    Code:
    ```
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
    ```
    <details> <summary> Click here for national income results</summary> 
    <p>

    ### National median household income ###

    Minimum Median Income|Average Median Income|Maximum Median Income
    ---| --- | ---
    2499.0|54683.0|250,001.0

    </p>
    </details>

    <details> <summary> Click here for state-level income results</summary> 
    <p>

    ### State-level median household income ###

    State|Minimum Median Income|Average Median Income|Maximum Median Income
    ---|---| --- | ---
    AK|	16667|	52698|	170329
    AL|	2499|	42463|	203083
    AR|	14479|	39648|	99205
    AZ|	11384|	48603|	129564
    CA|	2499|	65725|	250001
    CO|	13750|	58976|	194750
    CT|	11755|	84021|	218152
    DC|	30665|	81712|	165425
    DE|	26810|	62800|	140400
    FL|	2499|	50791|	232500
    GA|	9063|	46022|	146361
    HI|	26719|	63465|	121307
    IA|	16604|	55250|	127173
    ID|	17969|	46226|	98438
    IL|	10268|	57986|	211023
    IN|	14554|	52101|	152404
    KS|	7167|	52219|	147717
    KY|	10881|	41600|	250001
    LA|	2499|	44324|	113292
    MA|	2499|	78935|	191744
    MD|	20341|	81828|	250001
    ME|	25625|	50198|	157607
    MI|	13964|	50745|	134283
    MN|	19198|	58601|	161500
    MO|	7895|	46788|	155387
    MS|	14643|	37546|	110101
    MT|	8681|	47455|	126250
    NC|	14387|	46171|	130868
    ND|	24211|	61042|	130625
    NE|	18604|	54679|	136917
    NH|	21802|	69986|	175714
    NJ|	15855|	87140|	250001
    NM|	12470|	40831|	142679
    NV|	23477|	57735|	140523
    NY|	12454|	65675|	250001
    OH|	8775|	51915|	250001
    OK|	2499|	45947|	152875
    OR|	10036|	49635|	113182
    PA|	8889|	55033|	211442
    PR|	6989|	19599|	66063
    RI|	28901|	72048|	230052
    SC|	3333|	42827|	129792
    SD|	13036|	52589|	102778
    TN|	11958|	44284|	130386
    TX|	13105|	53722|	250001
    UT|	22986|	59423|	127847
    VA|	13375|	60531|	215122
    VT|	16212|	57163|	123783
    WA|	12500|	58388|	182604
    WI|	14148|	55252|	123750
    WV|	9544|	40879|	104000
    WY|	23516|	58285|	97933

    </p>
    </details>

4. Do characteristics of the zip-code area, such as median household income, influence students' performance in high school? Let's divide income into ranges (e.g., <$50k, $50k-$100k, $100k+).

    Code:
    ```
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
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### Generally, the higher the income, the better high school students are in math and reading state assessments. ###

    * We could do a Pearson's Correlation to see exactly how related math and reading scores are to income if SQLite had that function.

    Income_Range|Average Math Scores|Average Reading Scores
    ---| --- | ---
    High Income|	68.0|	77.07
    Low Income|43.74|55.13
    Middle Income|52.36|64.14

    </p>
    </details>

5. On average, do students perform better on the math or reading exam? Find the number of states where students do better on the math exam, and vice versa.

    Code:
    ```
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
    ```

    <details> <summary> Click here for overall reading versus math exam results</summary> 
    <p>

    ### On average, students performed better on the reading exam. ###

    Avg Math Score|Avg Reading Score
    ---| ---
    46.31|57.42

    </p>
    </details>

    <details> <summary> Click here for the list of states where students scored higher on math than reading </summary> 
    <p>

    ### Only six states had average math scores higher than the average reading score. ###

    state_code|Average State Math Score|Average State Reading Score
    ---| --- | ---
    IA|	83.61|	79.95
    IN|	80.89|	77.19
    MD|	85.16|	81.24
    SC|	84.19|	76.53
    TX|	73.5|	69.51
    WY|	36.71|	30.34


    </p>
    </details>

    <details> <summary> Click here for the list of states where students scored higher on reading than math </summary> 
    <p>

    ### The majority of states tested higher on reading than on math. ###

    state_code|Average State Math Score|Average State Reading Score
    ---| --- | ---
    AK|	24.65|	33.58
    AL|	17.08|	54.7
    AR|	17.35|	33.9
    AZ|	32.06|	42.21
    CA|	27.87|	55.99
    CO|	21.83|	37.97
    CT|	29.42|	52.51
    DC|	8.95|	25.31
    DE|	21.54|	46.27
    FL|	41.03|	52.57
    GA|	28.77|	32.3
    HI|	26.53|	50.47
    ID|	28.91|	59.39
    IL|	15.2|	33.08
    KS|	23.37|	31.16
    KY|	37.8|	57.42
    LA|	53.28|	67.85
    MA|	73.81|	90.08
    ME|	24.37|	46.23
    MI|	25.15|	47.34
    MN|	42.42|	54.39
    MO|	52.8|	71.55
    MS|	22.36|	44.24
    MT|	20.41|	57.08
    NC|	40.85|	52.05
    ND|	24.63|	52.37
    NE|	64.28|	72.59
    NH|	33.29|	58.06
    NJ|	18.85|	37.46
    NM|	11.58|	31.81
    NY|	90.85|	91.63
    OH|	79.54|	85.62
    OK|	68.22|	77.24
    OR|	28.12|	67.61
    PA|	63.52|	72.14
    PR|	7.74|	37
    RI|	14.96|	32.94
    SD|	35.27|	59.51
    TN|	51.53|	44.35
    UT|	31.98|	88.62
    VA|	78.63|	54.2
    VI|	8.62|	52.37
    VT|	33.12|	46.86
    WA|	26.58|	47.33
    WI|	35.34|	44.91
    WV|	18.58|	47.1


    </p>
    </details>

    <details> <summary> Click here for the results of the combined query </summary> 
    <p>

    ### 3 states had no exam data, but 6 had math scores greater than their reading score. ###
  

    Number of States|Math vs. Reading
    ---| ---
    6| Math
    3| No Exam Data
    46| Reading

    </p>
    </details>
6. What is the average proficiency on state assessment exams for each zip code, and how do they compare to other zip codes in the same state?

    Code:
    ```
    --First, we make a temporary table of Math and Reading scores by state where any schools without math and reading scores are excluded.
    WITH state_avg AS (
        SELECT 
            highschool.state_code, 
            ROUND(MIN(pct_proficient_math),2) AS 'State Minimum Math Score', 
            ROUND(AVG(pct_proficient_math),2) AS 'State Average Math Score', 
            ROUND(MAX(pct_proficient_math),2) AS 'State Maximum Math Score', 
            ROUND(MIN(pct_proficient_reading),2) AS 'State Minimum Reading Score',  
            ROUND(AVG(pct_proficient_reading),2) AS 'State Average Reading Score', 
            ROUND(MAX(pct_proficient_reading),2) AS 'State Maximum Reading Score'
        FROM highschool
        WHERE pct_proficient_math != 'NULL' AND pct_proficient_reading != 'NULL'
        GROUP BY highschool.state_code
        )
    --Next, we join the state average test scores table with the zip code-level highschool assessments to see how more local
    --highschools compare to the rest of the state.
    SELECT 
        highschool.state_code, 
        zip_code, 
        ROUND((pct_proficient_math), 1) AS 'Math Score of Zip Code', 
        ROUND((pct_proficient_reading), 1) AS 'Reading Score of Zip Code', 
        state_avg.'State Minimum Math Score', 
        state_avg.'State Average Math Score', 
        state_avg.'State Maximum Math Score', 
        state_avg.'State Minimum Reading Score', 
        state_avg.'State Average Reading Score', 
        state_avg.'State Maximum Reading Score'
    FROM highschool
    INNER JOIN state_avg ON state_avg.state_code = highschool.state_code
    GROUP BY highschool.zip_code
    ORDER BY highschool.state_code, zip_code;
    ```

    <details> <summary> Click here for results </summary> 
    <p>

    ### Below are the truncated results showing only Alaskan zip codes. With these results, we could show policymakers in the state which zip codes may need more funding or to start focused education initiatives in different parts of the state. ###


    state_code|zip_code|Math Score of Zip Code|Reading Score of Zip Code|State Minimum Math Score|State Average Math Score|State Maximum Math Score|State Minimum Reading Score|State Average Reading Score|State Maximum Reading Score
    --- | --- | --- | ---| --- | --- | --- | --- | --- | ---
    AK|	99502|	28|	32|	7.5|	24.65|	47|	10|	33.58|	75
    AK|	99503|	47|	67|	7.5|	24.65|	47|	10|	33.58|	76
    AK|	99504|	20|	17|	7.5|	24.65|	47|	10|	33.58|	77
    AK|	99507|	27|	31|	7.5|	24.65|	47|	10|	33.58|	78
    AK|	99508|	20|	24|	7.5|	24.65|	47|	10|	33.58|	79
    AK|	99516|	37|	45|	7.5|	24.65|	47|	10|	33.58|	80
    AK|	99517|	24|	30|	7.5|	24.65|	47|	10|	33.58|	81
    AK|	99557|	25|	25|	7.5|	24.65|	47|	10|	33.58|	82
    AK|	99559|	17|	17|	7.5|	24.65|	47|	10|	33.58|	83
    AK|	99567|	33|	37|	7.5|	24.65|	47|	10|	33.58|	84
    AK|	99574|	24.5|	24.5|	7.5|	24.65|	47|	10|	33.58|	85
    AK|	99577|	40|	45|	7.5|	24.65|	47|	10|	33.58|	86
    AK|	99588|	24.5|	34.5|	7.5|	24.65|	47|	10|	33.58|	87
    AK|	99603|	32|	52|	7.5|	24.65|	47|	10|	33.58|	88
    AK|	99607|	10|	10|	7.5|	24.65|	47|	10|	33.58|	89
    AK|	99611|	27|	37|	7.5|	24.65|	47|	10|	33.58|	90
    AK|	99615|	23|	41|	7.5|	24.65|	47|	10|	33.58|	91
    AK|	99633|	10|	10|	7.5|	24.65|	47|	10|	33.58|	92
    AK|	99645|	24|	36|	7.5|	24.65|	47|	10|	33.58|	93
    AK|	99652|	12|	22|	7.5|	24.65|	47|	10|	33.58|	94
    AK|	99654|	24|	26|	7.5|	24.65|	47|	10|	33.58|	95
    AK|	99664|	22|	42|	7.5|	24.65|	47|	10|	33.58|	96
    AK|	99669|	17|	32|	7.5|	24.65|	47|	10|	33.58|	97
    AK|	99676|	32|	52|	7.5|	24.65|	47|	10|	33.58|	98
    AK|	99685|	44.5|	44.5|	7.5|	24.65|	47|	10|	33.58|	99
    AK|	99686|	27|	47|	7.5|	24.65|	47|	10|	33.58|	100
    AK|	99701|	26|	30|	7.5|	24.65|	47|	10|	33.58|	101
    AK|	99702|	27|	47|	7.5|	24.65|	47|	10|	33.58|	102
    AK|	99705|	12|	30|	7.5|	24.65|	47|	10|	33.58|	103
    AK|	99709|	32|	43|	7.5|	24.65|	47|	10|	33.58|	104
    AK|	99723|	22|	17|	7.5|	24.65|	47|	10|	33.58|	105
    AK|	99737|	37|	42|	7.5|	24.65|	47|	10|	33.58|	106
    AK|	99741|	7.5|	12|	7.5|	24.65|	47|	10|	33.58|	107
    AK|	99762|	12|	22|	7.5|	24.65|	47|	10|	33.58|	108
    AK|	99801|	41|	38|	7.5|	24.65|	47|	10|	33.58|	109
    AK|	99827|	24.5|	34.5|	7.5|	24.65|	47|	10|	33.58|	110
    AK|	99829|	10|	10|	7.5|	24.65|	47|	10|	33.58|	111
    AK|	99833|	42|	37|	7.5|	24.65|	47|	10|	33.58|	112
    AK|	99835|	27|	27|	7.5|	24.65|	47|	10|	33.58|	113
    AK|	99901|	32|	41|	7.5|	24.65|	47|	10|	33.58|	114
    AK|	99921|	24.5|	44.5|	7.5|	24.65|	47|	10|	33.58|	115
    AK|	99926|	15|	15|	7.5|	24.65|	47|	10|	33.58|	116
    AK|	99929|	24.5|	34.5|	7.5|	24.65|	47|	10|	33.58|	117


    </p>
    </details>