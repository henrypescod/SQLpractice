/* 
LSE Data Analytics Online Career Accelerator
DA101: Data Analytics for Business 

Demonstration video: Aggregating and grouping data with SQL commands in pgAdmin

--------------------------------------------------------------------------------

This is a demonstration on aggregating and grouping data with SQL commands in 
pgAdmin. In this demonstration, you'll learn the answers to:
 - What were the income and sales figures for Saturday and Sunday?
 - How many customers should be called for collecting feedback from gourmet pizzas?
 - How many customers have the $10 coupon?
 - How many customers bought pizzas with mushrooms?

--------------------------------------------------------------------------------
*/

-- 1. What were the income and sales figures for Saturday and Sunday?

SELECT
COUNT(*) AS total,
MIN(order_amount) AS min_amount,
MAX(order_amount) AS max_amount,
    AVG(order_amount) AS average_amount,
    SUM(order_amount) AS sum_of_amount
FROM public.orders
WHERE date_order BETWEEN 'saturday' AND 'sunday';
-- Highlight the syntax and press run.


--------------------------------------------------------------------------------

-- 2. How many customers should be called for collecting feedback from gourmet pizzas?

SELECT pizza_id, COUNT(type)
FROM public.pizza
WHERE pizza_id > 105
GROUP BY pizza_id
ORDER BY pizza_id;
-- Highlight the syntax and press run.


---------------------------------------------------------------------------------

-- 3. How many customers have the $10 coupon?

SELECT coupon_id
FROM public.customer
WHERE coupon_id IN (
      SELECT coupon_id
      FROM public.coupon
      WHERE coupon_amount = 10)
GROUP BY coupon_id
ORDER BY coupon_id DESC;
-- Highlight the syntax and press run.


----------------------------------------------------------------------------------

-- 4. How many customers bought pizzas with mushrooms?

SELECT pizza_id
FROM public.pizza
WHERE pizza_id IN (
      SELECT pizza_id
      FROM public.customer
      WHERE pizza_id = 108)
ORDER BY pizza_id;
-- Highlight the syntax and press run.


----------------------------------------------------------------------------------

-- 5. Remember to save your work.


------------------------------------------------------------------