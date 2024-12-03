-- Enter the following syntax for INNER JOIN. 
-- Note that the alias for the tables was used and the result table will be limited to 15 rows
SELECT ar."ArtistId", "Name", "Title"
FROM public."Artist" ar
INNER JOIN public."Album" al
USING ("ArtistId")
ORDER BY ar."Name"
LIMIT 15;


-- Enter the following more advanced syntax for INNER JOIN. 
-- Take note that the CONCAT function was used to combine the customer’s first and last names 
-- and returns them as full names.
SELECT CONCAT("FirstName",' ',"LastName") AS "FullName", "Country", "Total"
FROM public."Invoice" i
INNER JOIN public."Customer" c using ("CustomerId")
WHERE i."Total" > 10
ORDER BY i."Total" DESC
LIMIT 15;


-- Enter the following syntax to find the invoices created for January 2009 using an INNER JOIN. 
-- Note that the WHERE clause indicates the dates with the BETWEEN function.
SELECT i."InvoiceId", "InvoiceDate", "Total", il."UnitPrice", "Quantity"
FROM public."Invoice" i
INNER JOIN public."InvoiceLine" il
USING ("InvoiceId")
WHERE i."InvoiceDate" BETWEEN '2009-01-01' AND '2009-02-01'
ORDER BY i."InvoiceDate" DESC
LIMIT 15;


--How will you create a single table with the spend per customer?
SELECT public."Customer"."CustomerId", "FirstName", "LastName", total_table."total_spent"
FROM public."Customer"
INNER JOIN (SELECT SUM("Total") AS total_spent, "CustomerId"
			FROM "Invoice"
			GROUP BY "CustomerId") AS total_table
ON public."Customer"."CustomerId" = total_table."CustomerId"
ORDER BY total_spent ASC
LIMIT 10;

--What will be the unique identifier for joining the Customer table with the Invoice table?
--Can you identify the top 10 customers (by name) who spent the least?
/*
CREATE TABLE new_records AS
SELECT c."CustomerId", "FirstName", "LastName", i."Total"     
FROM public."Customer" c
INNER JOIN public."Invoice" i
ON c."CustomerId" = i."CustomerId"
WHERE i."Total" < 5
ORDER BY i."Total" DESC;

SELECT * FROM public.new_records;
*/

-- List 15 different albums and their respective artists.

SELECT a."AlbumId", a."Title", ar."Name" 
FROM public."Album" a
INNER JOIN public."Artist" ar
ON a."ArtistId" = ar."ArtistId"
ORDER BY ar."Name"
LIMIT 15;

SELECT ar."ArtistId", "Name", "Title"
FROM public."Artist" ar
INNER JOIN public."Album" al
ON ar."ArtistId" = al."ArtistId"
ORDER BY ar."Name"
LIMIT 15;


-- Identify the customers who spend more than US$10. Include their country.

SELECT CONCAT("FirstName",' ',"LastName") AS "FullName", "Country", "Total"
FROM public."Invoice" i
INNER JOIN public."Customer" c using ("CustomerId")
WHERE i."Total" > 10
ORDER BY i."Total" DESC;

SELECT c."CustomerId", "FirstName", "LastName", "Country", "Total"
FROM public."Customer" c
INNER JOIN "Invoice" i
ON c."CustomerId" = i."CustomerId"
WHERE i."Total" > 10
ORDER BY i."Total"
LIMIT 15;

-- Provide a list of 15 different tracks. Include the album, artist, and genre.

SELECT a."AlbumId", a."Title", ar."Name", ge. "Name" 
FROM public."Album" a
INNER JOIN public."Artist" ar
ON a."ArtistId" = ar."ArtistId"
ORDER BY a."AlbumId"
LIMIT 15;

SELECT ar."ArtistId", ar."Name" AS artist, al."Title" AS album_name, 
t."GenreId", t."Name" AS track, g."Name" AS genre 
FROM public."Artist" ar
INNER JOIN public."Album" al
ON ar."ArtistId" = al."ArtistId"
INNER JOIN public."Track" t
ON al."AlbumId" = t."AlbumId"
INNER JOIN public."Genre" g
ON t."GenreId" = g."GenreId"
ORDER BY g."Name"
LIMIT 15;