--Question 1: What is the total per invoice per customer? Include the first and last name of the customer.

SELECT c."CustomerId", CONCAT("FirstName",' ', "LastName"), i."InvoiceId", i."Total" AS Invoice_total
FROM public."Invoice" i
LEFT JOIN public."Customer" c
ON i."CustomerId" = c."CustomerId"
GROUP BY c."CustomerId", i."Total", i."InvoiceId"
ORDER BY Invoice_total DESC;

--- proposed solution in the module
SELECT c."CustomerId", "FirstName", "LastName", i."Total"
FROM public."Customer" c
LEFT JOIN public."Invoice" i
ON i."CustomerId" = c."CustomerId"
ORDER BY i."Total" DESC
LIMIT 15;


--Question 2: Can you provide a list of tracks and composers sorted by genre? 

--my solution
SELECT g."Name" AS Genre, t."GenreId", t."Name" AS Track, "Composer" 
FROM public."Genre" g
LEFT JOIN public."Track" t
ON g."GenreId" = t."GenreId"
GROUP BY t."GenreId", g."Name", t."Name", t."Composer"
ORDER BY t."GenreId" DESC;

--module solution
SELECT g."GenreId", g."Name" AS "Genre", t."Name", "Composer"
FROM public."Track" t
LEFT JOIN public."Genre" g
USING ("GenreId")
ORDER BY g."GenreId" DESC
LIMIT 15;

--RIGHT JOIN practice
--Q3 Can you generate a list of tracks and composers in the rock genre?

SELECT g."Name" AS "Genre", t."Name" AS Track, "Composer"
FROM public."Track" t
RIGHT JOIN public."Genre" g
ON g."GenreId" = t."GenreId"
WHERE g."Name" = 'Rock'
ORDER BY "Genre" DESC
LIMIT 15;

---module solution
SELECT g."Name", "GenreId", t."Name" AS "track", "Composer"
FROM public."Genre" g
RIGHT JOIN public."Track" t
USING ("GenreId")
WHERE g."Name"='Rock'
ORDER BY g."GenreId" DESC
LIMIT 15;

--Q4 - How would you query the Chinook database to prepare a table that lists the invoices by date? Include the total amount, unit price, and quantity for each invoice.

SELECT t1.column1, t1.column2, t2.column1 
FROM public.table1 t1
FULL JOIN table2 t2 ON t1.column3 = t2.column3;

SELECT i."InvoiceDate",i."InvoiceId",il."Quantity",il."UnitPrice",i."Total" AS total_amount
FROM public."Invoice" i
FULL JOIN "InvoiceLine" il ON i."InvoiceId" = il."InvoiceId";
