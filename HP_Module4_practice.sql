/*
SELECT "FirstName", "LastName", "Phone"
	FROM public."Customer"
	WHERE "Phone" IS NOT NULL;
*/
/*
SELECT "TrackId"
	FROM public."Track"
	WHERE "Composer" IS NULL;
*/
/*
SELECT "FirstName", "LastName"
	FROM public."Customer"
	WHERE "FirstName"
	IN ('Mark');
*/
/*
SELECT "FirstName", "LastName"
	FROM public."Customer"
	WHERE "CustomerId" = 42;
*/
/*
SELECT "Title"
	FROM public."Employee"
	WHERE "Address"
	LIKE '7727B%';
*/
/*
SELECT Count(*)
	FROM public."Customer"
	Where "PostalCode" IS NULL;
*/

/*
SELECT SUM("Total")
	FROM public."Invoice"
	WHERE "InvoiceDate" 
	BETWEEN '2009-03-01' AND '2009-03-31';
*/

/*
SELECT COUNT("ArtistId")
	FROM public."Artist";
*/

/*
SELECT SUM("Total")
FROM public."Invoice"
*/

/*
SELECT MAX("Total")
FROM public."Invoice"
*/

/*To calculate the number of invoices, minimum amount, maximum amount, average amount, sum of the amount, and total orders, use the following syntax.*/ 

/*
SELECT COUNT(*) AS "Total",
	MIN("Total") AS Min_Amount,
	MAX("Total") AS Max_Amount,
	AVG("Total") AS Average_Amount,
	SUM("Total") AS Sum_of_Amount
	FROM public."Invoice";
*/

/*
SELECT COUNT("TrackId")
From public."Track"
WHERE "AlbumId" = 1
*/

/*
SELECT "AlbumId", COUNT("TrackId")
FROM public."Track"
GROUP BY "AlbumId"
*/
/*
SELECT "AlbumId", COUNT("TrackId") AS "Tracks"
FROM public."Track"
GROUP BY "AlbumId"
HAVING COUNT ("TrackId")>=20
*/
SELECT "AlbumId", COUNT("TrackId") AS "Tracks"
FROM public."Track"
GROUP BY "AlbumId"
ORDER By "Tracks" ASC
	
	