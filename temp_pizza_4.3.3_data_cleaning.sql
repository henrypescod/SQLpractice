/*
SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM public.customer;
*/

/*
SELECT coupon_date,
	EXTRACT('year' FROM coupon_date) AS year,
	EXTRACT('month' FROM coupon_date) AS month,
	EXTRACT('day' FROM coupon_date) AS day
FROM public.coupon
*/
/*
SELECT first_name::TEXT, last_name::TEXT
FROM public.customer;
*/
/*
SELECT DISTINCT last_name
FROM public.customer;*/
/*
SELECT first_name, last_name, COUNT(*)
FROM public.customer
GROUP BY first_name, last_name
HAVING COUNT(*)>1

SELECT date_order, coupon_id, COUNT(*)
FROM public.sales
GROUP BY date_order, coupon_id
HAVING COUNT(*)>1

SELECT order_id, customer_id, COUNT(*)
FROM public.pizza
GROUP BY order_id, customer_id
HAVING COUNT(*)>1
*/
/*
ALTER TABLE pizza
 ALTER COLUMN type TYPE VARCHAR(50);

SELECT *
FROM public.pizza*/

ALTER TABLE pizza
 RENAME COLUMN type TO toppings;

SELECT *
FROM public.pizza

ALTER TABLE pizza
 RENAME COLUMN p_id TO pizza_id;

SELECT *
FROM public.pizza