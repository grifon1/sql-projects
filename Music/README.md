# Analyzing Media Sales Data #

This project is designed to demonstrate the fundamental understanding of SQL using SQLite

The original project requirements may be found [here](https://discuss.codecademy.com/t/data-science-independent-project-2-explore-a-sample-database/419945).

The `chinook` database (.db) file needed for this project may be downloaded from this repository as well. Below is a relational database map for the `chinook` database to refer to throughout this project.

![music database](https://www.sqlitetutorial.net/wp-content/uploads/2015/11/sqlite-sample-database-color.jpg "Relational database map for 'chinook' media sales ")

## Objective ##

You are the lead data analyst for a popular music and media store. Help them analyze their sales and service.

## Tasks ##
------------
1. Which tracks appeared in the most playlists? How many playlists did they appear in?

    Code:
    ```
    --Exploring the tracks table to get our bearings.
    --3503 track ids, A few songs, like 2 Seconds to Midnight and 1° De Julho are in the tracks table multiple times with multiple trackid's.

    SELECT name, trackid
    FROM tracks
    ORDER BY name asc;

    --We join the tracks and playlist_track tables on TrackId
    SELECT tracks.name, COUNT(*) AS "Track Count"
    FROM playlist_track
    INNER JOIN tracks 
        ON tracks.TrackId = playlist_track.TrackId
    GROUP BY tracks.name
    ORDER BY COUNT(tracks.name) DESC;
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### Strictly speaking about the song itself, 2 Minutes to Midnight is the winner, showing up 13 times in all the playlists. However, this song has 5 separate TrackIDs. This could mean it appears in several albums, such as a remastered album, a greatest hits album, etc, and may have different audio quality among the different TrackIDs, which would be important for a media company. ###

    Name|Track Count
    ---| ---
    2 Minutes To Midnight|	13
    Wrathchild|	12
    The Trooper|	12
    The Number Of The Beast|	12
    Iron Maiden|	12
    Hallowed Be Thy Name|	12
    Fear Of The Dark|	11
    The Evil That Men Do|	10
    Sanctuary|	10
    Running Free|	10
    Wasting Love|	9
    Tailgunner|	9
    Release|	9
    From Here To Eternity|	9
    Be Quick Or Be Dead|	9
    Afraid To Shoot Strangers|	9
    The Clairvoyant|	8
    Midnight|	8
    Intro|	8
    Heaven Can Wait|	8


    </p>
    </details>
---
2. Which track generated the most revenue? Which album? Which genre?

    Code:
    ```
    --Which track generated the most revenue?
    SELECT tracks.name, SUM(invoice_items.quantity*invoice_items.UnitPrice) AS "Sales by Track"
    FROM invoice_items
    INNER JOIN  tracks ON tracks.TrackId = invoice_items.TrackId
    GROUP BY tracks.trackid
    ORDER BY "Sales by Track" desc
    LIMIT 15;

    --Which album generated the most revenue?
    SELECT albums.title, tracks.albumid, SUM(invoice_items.quantity*invoice_items.UnitPrice) AS "Sales by Album"
    FROM tracks
    INNER JOIN  invoice_items ON invoice_items.TrackId = tracks.TrackId
    INNER JOIN albums ON albums.albumid = tracks.albumid
    GROUP BY tracks.albumid
    ORDER BY "Sales by Album" desc
    LIMIT 15;

    --Which genre generated the most revenue?
    SELECT genres.name, tracks.genreid, SUM(invoice_items.quantity*invoice_items.UnitPrice) AS "Sales by Genre"
    FROM tracks
    INNER JOIN  invoice_items ON invoice_items.TrackId = tracks.TrackId
    INNER JOIN genres ON genres.genreid = tracks.genreid
    GROUP BY tracks.genreid
    ORDER BY "Sales by Genre" desc
    LIMIT 15;
    ```

    <details> <summary> Click here for top track sales results</summary> 
    <p>

    ### The top sales by track/episode are in an 8-way tie  between a variety of different TV episodes. ###

    Name|Sales by Track
    ---| ---
    The Woman King|	3.98
    The Fix|	3.98
    Walkabout|	3.98
    Hot Girl|	3.98
    Gay Witch Hunt|	3.98
    Phyllis's Wedding|	3.98
    How to Stop an Exploding Man|	3.98
    Pilot|	3.98
    Occupation / Precipice|	1.99
    Exodus, Pt. 1|	1.99
    Exodus, Pt. 2|	1.99
    Collaborators|	1.99
    Hero|	1.99
    Unfinished Business|	1.99
    The Passage|	1.99

    </p>
    </details>

    <details> <summary> Click here for top album sales results</summary> 
    <p>

    ### The album/tv series with the highest sales was Season 1 of Battlestar Galactica. ###

    Title|AlbumId|Sales by Album
    ---| --- | ---
    Battlestar Galactica (Classic), Season 1|	253|	35.82
    The Office, Season 3|	251|	31.84
    Minha Historia|	23|	26.73
    Heroes, Season 1|	228|	25.87
    Lost, Season 2|	231|	25.87
    Greatest Hits|	141|	25.74
    Unplugged|	73|	24.75
    Battlestar Galactica, Season 3|	227|	23.88
    Lost, Season 3|	229|	21.89
    Acústico|	224|	21.78
    Lost, Season 1|	230|	19.9
    Greatest Kiss|	37|	19.8
    Prenda Minha|	21|	18.81
    Chronicle, Vol. 2|	55|	18.81
    My Generation - The Very Best Of The Who|	221|	18.81


    </p>
    </details>

    <details> <summary> Click here for top genre sales results</summary> 
    <p>

    ### The genre with the highest sales was Rock. ###

    Name|GenreId|Sales by Genre
    ---| --- | ---
    Rock|	1|	826.65
    Latin|	7|	382.14
    Metal|	3|	261.36
    Alternative & Punk|	4|	241.56
    TV Shows|	19|	93.53
    Jazz|	2|	79.2
    Blues|	6|	60.39
    Drama|	21|	57.71
    R&B/Soul|	14|	40.59
    Classical|	24|	40.59
    Sci Fi & Fantasy|	20|	39.8
    Reggae|	8|	29.7
    Pop|	9|	27.72
    Soundtrack|	10|	19.8
    Comedy|	22|	17.91

    </p>
    </details>
----
3. Which countries have the highest sales revenue? What percent of total revenue does each country make up?

    Code:
    ```
    SELECT 
        BillingCountry, 
        SUM(Total) AS "Country Sales", 
        ROUND(100*SUM(Total)/(SELECT SUM(Total) FROM invoices), 2)  as "Percent Revenue"
    FROM invoices
    GROUP BY BillingCountry
    ORDER BY "Percent Revenue" desc
    LIMIT 15;
    ```

    <details> <summary> Click here results</summary> 
    <p>

    ### The US has the highest sales revenue followed by Canada and France. ###

    BillingCountry|Country Sales|Percent Revenue
    ---| --- | ---
    USA|	523.06|	22.46
    Canada|	303.96|	13.05
    France|	195.1|	8.38
    Brazil|	190.1|	8.16
    Germany|	156.48|	6.72
    United Kingdom|	112.86|	4.85
    Czech Republic|	90.24|	3.88
    Portugal|	77.24|	3.32
    India|	75.26|	3.23
    Chile|	46.62|	2
    Ireland|	45.62|	1.96
    Hungary|	45.62|	1.96
    Austria|	42.62|	1.83
    Finland|	41.62|	1.79
    Netherlands|	40.62|	1.74


    </p>
    </details>
----
4. How many customers did each employee support? What is the average revenue and total sales for each salesperson?

    Code:
    ```
    --Q4.1 How many customers did each employee support? 
    SELECT 
        customers.SupportRepId, 
        employees.LastName, 
        employees.FirstName, 
        COUNT(customers.Customerid) AS CustomersSupported
    FROM customers
    INNER JOIN employees
        ON employees.employeeid = customers.supportrepid
    GROUP BY customers.SupportRepId;

    --Q4.2 What is the average revenue and total sales for each salesperson?
    WITH RevenuebyCustomer AS
        (SELECT 
            SUM(total) AS "CustomerPurchases",
            invoices.customerid, 
            customers.SupportRepId , 
            COUNT(invoiceID) AS "InvoiceCount"
        FROM invoices 
        INNER JOIN customers
            ON customers.customerID = invoices.customerid
        GROUP BY invoices.customerid)
    SELECT EmployeeId, LastName, FirstName, SUM(CustomerPurchases) AS "Total Sales by Employee", ROUND(AVG(CustomerPurchases), 2) AS "AverageSales"
    FROM employees
    INNER JOIN RevenuebyCustomer
        ON RevenueByCustomer.SupportRepId = employees.employeeid
    GROUP BY employees.EmployeeId;
    ```
    
    <details> <summary> Click here customer support results</summary> 
    <p>

    ### Our employee Jane supported the most customers ###

    SuportRepId|	LastName|	FirstName|	CustomersSupported
    ---|	---|	---|	---
    3|	Peacock|	Jane|	21
    4|	Park|	Margaret|	20
    5|	Johnson|	Steve|	18

    </p>
    </details>

    <details> <summary> Click here salesperson revenue results</summary> 
    <p>

    ### Our employee Jane has the highest sales revenue of the sales staff. ###

    EmployeeId|	LastName|	FirstName|	Total Sales by Employee|	AverageSales
    ---|	---|	---|	---|	---
    3|	Peacock|	Jane|	833.04|	39.67
    4|	Park|	Margaret|	775.4|	38.77
    5|	Johnson|	Steve|	720.16|	40.01



    </p>
    </details>
----
5. Do longer or shorter length albums tend to generate more revenue?

    Code:
    ```
    --We create the temporary table AlbumTracks which contains a track count, album title, and albumId
    WITH AlbumTracks AS
        (SELECT 
            albums.AlbumId, 
            albums.title AS AlbumTitle, 
            COUNT(tracks.name) AS NumberOfTracks
        FROM albums
        INNER JOIN tracks
            ON tracks.albumid = albums.albumid
        GROUP BY albums.Albumid
        ORDER BY NumberOfTracks DESC
        )

    --We then join the AlbumTracks table to the tracks table then invoice_items table to get Album sales
    --Because of how the database is structured, we need to "jump" a few times using different keys to eventually
    --join the albumid with the invoice table
    SELECT 
        tracks.albumid, 
        AlbumTitle, 
        NumberOfTracks, 
        SUM(invoice_items.quantity*invoice_items.UnitPrice) AS "Sales of Album"
    FROM tracks
    INNER JOIN invoice_items
        ON invoice_items.TrackId = tracks.TrackId
    INNER JOIN AlbumTracks
        ON AlbumTracks.AlbumId = tracks.AlbumId
    GROUP BY tracks.AlbumId
    ORDER BY NumberOfTracks DESC;
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### Below is the truncated results table. While we can make a general observation about the relationship of the number of tracks in an album to its sales using this table, we do not have statistics to back us. ###

    ### A Pearson's R correlation was done to find whether the length of an album tends to generate more sales. Album length and sales were found to be strongly positively correlated r(304) = .81, P < .001 ###

    AlbumId|	AlbumTitle|	NumberOfTracks|	Sales of Album
    ---|	---|	---|	---
    141|	Greatest Hits|	57|	25.74
    23|	Minha Historia|	34|	26.73
    73|	Unplugged|	30|	24.75
    229|	Lost, Season 3|	26|	21.89
    230|	Lost, Season 1|	25|	19.9
    251|	The Office, Season 3|	25|	31.84
    83|	My Way: The Best Of Frank Sinatra [Disc 1]|	24|	9.9
    231|	Lost, Season 2|	24|	25.87
    253|	Battlestar Galactica (Classic), Season 1|	24|	35.82
    24|	Afrociberdelia|	23|	15.84
    228|	Heroes, Season 1|	23|	25.87
    255|	Instant Karma: The Amnesty International Campaign to Save Darfur|	23|	15.84
    51|	Up An' Atom|	22|	16.83
    224|	Acústico|	22|	21.78
    250|	The Office, Season 2|	22|	11.94
    39|	International Superhits|	21|	17.82
    167|	Acústico MTV|	21|	17.82
    37|	Greatest Kiss|	20|	19.8
    54|	Chronicle, Vol. 1|	20|	17.82
    55|	Chronicle, Vol. 2|	20|	18.81
    115|	Sex Machine|	20|	11.88
    221|	My Generation - The Very Best Of The Who|	20|	18.81
    227|	Battlestar Galactica, Season 3|	19|	23.88
    248|	Ao Vivo [IMPORT]|	19|	8.91
    258|	House of Pain|	19|	7.92


    </p>
    </details>
----
6. Is the number of times a track appears in a playlist a good indicator of sales?

    Code:
    ```
    WITH PlaylistTracks AS
        (SELECT 
            tracks.name AS TrackTitle, 
            COUNT(playlist_track.playlistid) AS "Number Of Playlist Appearances", 
            playlist_track.trackid
        FROM tracks
        INNER JOIN playlist_track
            ON playlist_track.trackid = tracks.trackid
        GROUP BY tracks.trackid
        ORDER BY "Number Of Playlist Appearances" DESC
        )
    SELECT 
        "Number Of Playlist Appearances", 
        ROUND(SUM(invoice_items.quantity*invoice_items.UnitPrice), 2) AS "Sales of Track"
    FROM tracks
    INNER JOIN invoice_items
        ON invoice_items.TrackId = tracks.TrackId
    INNER JOIN PlaylistTracks
        ON PlaylistTracks.TrackId = tracks.TrackId
    GROUP BY "Number Of Playlist Appearances"
    ORDER BY "Number Of Playlist Appearances" DESC;
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### Generally, the lower the number of playlist appearances by a track, the higher the sales figures. ###

    Number Of Playlist Appearances|	Sales of Track
    ---|	---
    5| 23.76
    4| 36.63
    3| 936.54
    2| 1331.67

    </p>
    </details>
----
7. How much revenue is generated each year, and what is its percent change from the previous year?

    Code:
    ```
    --We make a temp table with the current year, revenue for the year, 
    --and the previous year to use for previous year revenue calculations
    WITH YearlyRevenue AS
        (SELECT 
            CAST(STRFTIME('%Y', InvoiceDate) AS INT) AS "CurrentYear", 
            CAST(STRFTIME('%Y', InvoiceDate) AS INT) - 1 AS "PreviousYear", 
            SUM(TOTAL) AS "RevenueforYear"
        FROM invoices
        GROUP BY CurrentYear
        ORDER BY CurrentYear DESC
        )
    --We can do a table self join to have the previous and current year's revenue on the same line.
    --Notice that we are joining on the CurrentYear and PreviousYear columns to force the revenue to show up "1 year late" on the results table. 
    --There is no data for 2008 in the dataset which explains why there is no percent change between 2008 and 2009.
    SELECT 
        curr.PreviousYear, 
        prev.RevenueForYear AS "Previous Year's Revenue", 
        curr.CurrentYear, 
        curr.RevenueForYear, 
        ROUND((((curr.RevenueForYear-prev.RevenueForYear)/(prev.RevenueForYear))*100),1) AS "Percent Change from Previous Year"
    FROM YearlyRevenue curr
    LEFT JOIN YearlyRevenue prev
        ON prev.CurrentYear = curr.PreviousYear;
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### There was a 5.6% drop in revenue from 2012 to 2013. Variable names can get confusing when doing a self join, so be sure to make descriptive alias's.  ###

    PreviousYear|	Previous Year's Revenue|	CurrentYear|	RevenueforYear|	Percent Change from Previous Year
    ---|	---|	---|	---|	---
    2012|	477.53|	2013|	450.58|	-5.6
    2011|	469.58|	2012|	477.53|	1.7
    2010|	481.45|	2011|	469.58|	-2.5
    2009|	449.46|	2010|	481.45|	7.1
    2008|	|	2009|	449.46|	


    </p>
    </details>
