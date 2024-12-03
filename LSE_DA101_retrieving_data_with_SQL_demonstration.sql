/* 
LSE Data Analytics Online Career Accelerator
DA101: Data Analytics for Business 

Demonstration video: Retrieving data with SQL commands in pgAdmin

-------------------------------------------------------------------

This is a demonstration of how to retrieve data with SQL commands in
pgAdmin. In this demonstration, you'll extract data to:
 - compile a list of customers and their coupon numbers
 - retrieve details of customers who have coupon numbers from 40 to 65
 - retrieve coupon details of the first 10 customers.


-------------------------------------------------------------------
*/

-- 1. Compile a list of customers and their coupon numbers.

SELECT first_name, last_name, phone, coupon_id
FROM public.customer;
-- Highlight the syntax, and press run.
    

-------------------------------------------------------------------

-- 2. Retract customer details for coupon number 40 to 65.

SELECT first_name, last_name, phone, coupon_id
FROM public.customer
WHERE coupon_id BETWEEN 40 AND 65
ORDER BY coupon_id DESC;
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 3. Select the first 10 customers.

SELECT first_name, last_name, phone, coupon_id
FROM public.customer
WHERE coupon_id BETWEEN 40 AND 65
ORDER BY coupon_id DESC
LIMIT 10;
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 4. Determine the income recorded on/for Monday.

SELECT DISTINCT date_order, order_amount
FROM public.orders
WHERE date_order = 'monday';
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 5. Remember to save your work.


------------------------------------------------------------------