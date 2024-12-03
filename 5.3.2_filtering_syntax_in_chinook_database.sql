SELECT ar."ArtistId", "Name", "Title"
FROM public."Album" al
INNER JOIN public."Artist" ar 
ON ar."ArtistId" = al."ArtistId"
ORDER BY "Name" 
LIMIT 15;

-- Q2
SELECT "CustomerId", "FirstName", "LastName", "Country", "Total"
FROM public."Customer"
INNER JOIN "Invoice"
USING ("CustomerId")
WHERE "Total" > 10
ORDER BY "Total" DESC;