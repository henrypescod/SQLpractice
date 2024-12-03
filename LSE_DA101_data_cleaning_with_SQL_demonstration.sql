/* 
LSE Data Analytics Online Career Accelerator
DA101: Data Analytics for Business 

Demonstration video: Data cleaning with SQL commands in pgAdmin

--------------------------------------------------------------------------------

This is a demonstration of how to perform data cleaning with SQL commands in
pgAdmin. In this demonstration, you'll learn:
 - how to change column names
 - how to change data types.
 

--------------------------------------------------------------------------------
*/

-- 1. What are the full names of the customers?

SELECT CONCAT(first_name, ' ', last_name) AS full_names
FROM public.customer;
-- Highlight the syntax, and press run.


--------------------------------------------------------------------------------

-- 2. How does one split the coupon date into the year, month, and day?

SELECT coupon_date,
    EXTRACT('year' FROM coupon_date) AS year,
    EXTRACT('month' FROM coupon_date) AS month,
    EXTRACT('day' FROM coupon_date) AS day
FROM public.coupon;
-- Highlight the syntax, and press run.


---------------------------------------------------------------------------------

-- 3. How does one change the data type from varying character to text?

SELECT first_name::TEXT, last_name::TEXT
FROM public.customer;
-- Highlight the syntax, and press run.


----------------------------------------------------------------------------------

-- 4. Are there unique surnames in the table?

SELECT DISTINCT last_name
FROM public.customer;
-- Highlight the syntax, and press run.


----------------------------------------------------------------------------------

-- 5. Are there any duplicate rows?

SELECT first_name, last_name, COUNT(*)
FROM public.customer
GROUP BY first_name, last_name
HAVING COUNT(*) >1;
-- Highlight the syntax, and press run.

SELECT date_order, coupon_id, COUNT(*)
FROM public.sales
GROUP BY date_order, coupon_id
HAVING COUNT(*) >1;
-- Highlight the syntax, and press run.

SELECT pizza, p_id, COUNT(*)
FROM public.pizza
GROUP BY pizza, p_id
HAVING COUNT(*) >1;
-- Highlight the syntax, and press run.

SELECT coupon_date, coupon_id, COUNT(*)
FROM public.coupon
GROUP BY coupon_date, coupon_id
HAVING COUNT(*) >1;
-- Highlight the syntax,and press run.


----------------------------------------------------------------------------------

-- 6. Remember to save your work


----------------------------------------------------------------------------------