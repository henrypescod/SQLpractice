--overall question - What are the reasons why some customers received corrupt tracks when they placed their orders?

--Q1 - Are there any tracks with bytes = 0 which would indicate a corrupt file?

SELECT *
FROM public."Track"
WHERE "Bytes" = 0
ORDER BY "Bytes" ASC;

-- Q2 - What are all the possible media types? Are there any media types that could indicate a corrupt file??

SELECT *
FROM public."MediaType"
ORDER BY "MediaTypeId" DESC;


--Q3 - how many orders were made for each type of media file?

SELECT mt."MediaTypeId", mt."Name" AS Media_Type, 
COUNT (il."InvoiceId") AS No_of_orders
FROM public."MediaType" mt
JOIN public."Track" t USING ("MediaTypeId")
JOIN public."InvoiceLine" il USING ("TrackId") 
GROUP BY mt."MediaTypeId", mt."Name"
ORDER BY No_of_orders DESC;

--Q4 - show all orders that included media types 4 & 5, including customer name, country, phone number track names and invoice id's

SELECT mt."MediaTypeId", mt."Name" AS Media_Type, t."Name" AS Track, il."InvoiceId", i."CustomerId", CONCAT(c."FirstName",' ',c."LastName"),c."Country",c."Phone",c."Email"
FROM public."MediaType" mt
JOIN public."Track" t USING ("MediaTypeId")
JOIN public."InvoiceLine" il USING ("TrackId") 
JOIN public."Invoice" i USING ("InvoiceId")
JOIN public."Customer" c USING ("CustomerId")
WHERE mt."MediaTypeId" IN('4','5')
GROUP BY mt."MediaTypeId", mt."Name", t."Name", il."InvoiceId", i."CustomerId", CONCAT(c."FirstName",' ',c."LastName"),c."Country",c."Phone",c."Email"
ORDER BY "MediaTypeId" DESC;

-- Q - is there an artist id with very few purchases that might be corrupt?

SELECT mt."MediaTypeId", mt."Name" AS Media_Type, ar."ArtistId", ar."Name" AS artist_name,
COUNT (il."InvoiceId") AS No_of_orders
FROM public."MediaType" mt
JOIN public."Track" t USING ("MediaTypeId")
JOIN public."InvoiceLine" il USING ("TrackId")
JOIN public."Album" al USING ("AlbumId")
JOIN public."Artist" ar USING ("ArtistId")
GROUP BY mt."MediaTypeId", mt."Name", ar."ArtistId", ar."Name"
ORDER BY No_of_orders ASC;

