--Q1. Which tracks appeared in the most playlists? How many playlists did they appear in?

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
ORDER BY COUNT(tracks.name) DESC
LIMIT 20;
--If we are strictly talking about number of appearances of a Song/Track in playlists, 2 Minutes to Midnight is the winner
--However, this song has 5 separate TrackIDs and is in the music playlist multiple times.
--There would need to be some de-duplication first to find the true, unduplicated number of tracks in playlists.Name


--Q2. Which track generated the most revenue? Which album? Which genre?
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
SELECT genres.name, tracks.genreid, ROUND(SUM(invoice_items.quantity*invoice_items.UnitPrice),2) AS "Sales by Genre"
FROM tracks
INNER JOIN  invoice_items ON invoice_items.TrackId = tracks.TrackId
INNER JOIN genres ON genres.genreid = tracks.genreid
GROUP BY tracks.genreid
ORDER BY "Sales by Genre" desc
LIMIT 15;

--Q3. Which countries have the highest sales revenue? 
--What percent of total revenue does each country make up?
SELECT 
	BillingCountry, 
	SUM(Total) AS "Country Sales", 
	ROUND(100*SUM(Total)/(SELECT SUM(Total) FROM invoices), 2)  as "Percent Revenue"
FROM invoices
GROUP BY BillingCountry
ORDER BY "Percent Revenue" desc
LIMIT 15;

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

--Q5 Do longer or shorter length albums tend to generate more revenue?

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
--A5 Generating the table above shows the list of albums by number of tracks sorted high to low. 
--A Pearson's R correlation was done to find whether the length of an album tends to generate more sales.
--Album Length and Sales were found to be strongly correlated r(304) = .81, P < .001

--Q6. Is the number of times a track appears in a playlist a good indicator of sales?
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

--A6. Generally, the lower the number of playlist appearances by a track, the higher the sales figures.

--Q7. How much revenue is generated each year, and what is its percent change from the previous year?

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

