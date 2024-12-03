---LEFT JOIN

SELECT c."CustomerId", "FirstName", "LastName",
SUM(i."Total") AS total
FROM public."Invoice" i
LEFT JOIN public."Customer" c
ON i."CustomerId" = c."CustomerId"
GROUP BY c."CustomerId"
ORDER BY total DESC;

--RIGHT JOIN

SELECT g."GenreId", g."Name" AS genre, t."Name" AS track, "Composer"
FROM Public."Genre" g
RIGHT JOIN public."Track" t
USING ("GenreId")
WHERE g."Name" = 'Rock'
ORDER BY g."GenreId" DESC
LIMIT 15; 

--FULL JOIN

SELECT i."InvoiceId", "InvoiceDate", "Total", il."UnitPrice", "Quantity"
FROM public."Invoice" i
FULL JOIN public."InvoiceLine" il
USING ("InvoiceId") 
WHERE i."InvoiceDate" BETWEEN '2009-01-01' AND '2009-02-01'
ORDER BY i."InvoiceDate"
LIMIT 15; 

