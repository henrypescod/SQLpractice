/* 
LSE Data Analytics Online Career Accelerator
DA101: Data Analytics for Business 

Demonstration video: Introduction to basic SQL commands in pgAdmin

-------------------------------------------------------------------

This is a demonstration of the basic SQL commands in pgAdmin.
In this demonstration, you'll learn:
 - how to create a new table with SQL syntax
 - how to query a table with SQL syntax
 - how to import a CSV file into pgAdmin.

-------------------------------------------------------------------
*/

-- 1. Create a new table.

-- The spaces at the beginning of the lines are only for demonstration
-- purposes. 
CREATE TABLE customer(
    customer_id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone INTEGER,
    coupon_id INTEGER,
    pizza_id INTEGER);
-- Highlight the syntax, and press run.


-------------------------------------------------------------------

-- 2. Query the new table.

SELECT * FROM public.customer;
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 3. Create a second table.

-- The spaces at the beginning of the lines are only for demonstration
-- purposes. 
CREATE TABLE pizza(
    p_id BIGSERIAL PRIMARY KEY,
    pizza_id INTEGER,
    size CHAR(10),
    type CHAR(30),
    customer_id INTEGER,
    order_id INTEGER);
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 4. Query the new table.

SELECT * FROM public.pizza;
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 5. Create a third table.

-- The spaces at the beginning of the lines are only for demonstration
-- purposes. 
CREATE TABLE coupon(
    coupon_id BIGSERIAL PRIMARY KEY,
    coupon_amount INTEGER,
    coupon_date DATE,
    order_id INTEGER);
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 6. Query the new table.

SELECT * FROM public.coupon;
-- Highlight the syntax, and press run.

------------------------------------------------------------------

-- 7. Create a fourth table.

-- The spaces at the beginning of the lines are only for demonstration
-- purposes. 
CREATE TABLE orders(
    order_id BIGSERIAL PRIMARY KEY,
    date_order CHAR(20),
    customer_id INTEGER,
    coupon_id INTEGER,
    order_amount INTEGER);
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 8. Query the new table.

SELECT * FROM public.orders;
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 9. Import the data from the CSV files.

-- If you encounter an error message when importing a CSV
-- to the table in pgAdmin, you may need to select the columns
-- to import manually. 



------------------------------------------------------------------

-- 10. Query the tables.

SELECT * FROM public.coupon;
-- Highlight the syntax, and press run.

SELECT * FROM public.customer;
-- Highlight the syntax, and press run.

SELECT * FROM public.orders;
-- Highlight the syntax, and press run.

SELECT * FROM public.pizza;
-- Highlight the syntax, and press run.


------------------------------------------------------------------

-- 11. Remember to save your work.


------------------------------------------------------------------