/* 
LSE Data Analytics Online Career Accelerator
DA101: Data Analytics for Business 

Demonstration video: Create and update a database with SQL commands in pgAdmin

--------------------------------------------------------------------------------

This is a demonstration of how to create and update a database with SQL commands
in pgAdmin. In this demonstration, you'll learn:
 - how to create a temporary database
 - how to write queries to alter the database.
 

--------------------------------------------------------------------------------
*/

-- 1. Create a temporary database in SQL Shell (psql).

CREATE DATABASE temp_pizza WITH TEMPLATE take_a_slice OWNER postgres;
-- Copy and paste this syntax into your SQL Shell, and press run.


--------------------------------------------------------------------------------

-- 2. Change the column name of pizza_id to pizza in the pizza table.

ALTER TABLE public.pizza
RENAME COLUMN pizza_id TO pizza;

SELECT * FROM public.pizza;
-- Highlight the syntax and press run.


---------------------------------------------------------------------------------

-- 3. Change the column name of pizza_id to pizza in the customer table.

ALTER TABLE public.customer
RENAME COLUMN pizza_id TO pizza;

SELECT * FROM public.customer;
-- Highlight the syntax and press run.


----------------------------------------------------------------------------------

-- 4. Change orders table to sales.

ALTER TABLE orders
RENAME TO sales;

SELECT * FROM public.sales;
-- Highlight the syntax and press run.


----------------------------------------------------------------------------------

-- 5. Add the column customer_id to the coupon table.

ALTER TABLE coupon
ADD customer_id INTEGER;

SELECT * FROM public.coupon;
-- Highlight the syntax and press run.


----------------------------------------------------------------------------------

-- 6. Remember to save your work.


----------------------------------------------------------------------------------