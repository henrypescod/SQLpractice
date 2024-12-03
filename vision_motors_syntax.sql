SHOW datestyle;


DROP TABLE IF EXISTS order_detail;


SET datestyle = 'ISO, DMY';


CREATE TABLE order_detail(
order_id INTEGER,
customer_id INTEGER,
purchase_date TIMESTAMP,
car_make VARCHAR (30),
car_model_year INTEGER,
purchase_price NUMERIC (8,2));

-- join the tables

SELECT * 
FROM customer_detail 
INNER JOIN order_detail
ON customer_detail.customer_id = order_detail.customer_id

---note on datew format, needed to change format of date column to yyyy-mm-dd

-- Q1 The number of cars purchased by 'repeat customers' in 2019 
--(Consider which columns to query and how to count customers and set dates in which to work between)--

SELECT COUNT("orderId"), "customerId", "purchase_date"
FROM public."order_detail"
INNER JOIN public.customer_detail
USING "CustomerId"
WHERE "purchase_date" = 2019
GROUP BY "customer_id)
ORDER BY "OrderId"
UNION ALL;

SELECT customer_id, COUNT(order_id) AS number_of_cars, SUM(COUNT(order_id)) OVER () AS total_cars_purchased
FROM public.customer_detail
INNER JOIN order_detail
USING (customer_id)
WHERE purchase_date >= '2019-01-01' AND purchase_date <= '2019-12-31'
GROUP BY customer_id
HAVING COUNT(order_id) > 1
ORDER BY customer_id DESC;

-- Q2 The list of Ford and Toyota vehicles purchased (Consider which column to query to find the car brands you need).

SELECT order_id, car_make, purchase_date
FROM public.order_detail
WHERE car_make = 'Ford' OR car_make = 'Toyota'
ORDER BY order_id DESC;


---5.2.2 

Q1 What are the names of all the customers by car make?

SELECT t1.column1, t1.column2, t2.column1 
FROM public.table1 t1
FULL JOIN table2 t2 ON t1.column3 = t2.column3;

SELECT od.car_make, c.customer_name
FROM public.order_detail od
FULL JOIN customer_detail c ON od.customer_id = c.customer_id
GROUP BY od.car_make, c.customer_name
ORDER BY car_make;


Q2 Can you identify the customers who have not purchased a car? 

SELECT c.customer_id, c.customer_name, COUNT(od.order_id) AS no_of_purchases
FROM public.order_detail od
FULL JOIN customer_detail c ON od.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(od.order_id) = 0
ORDER BY c.customer_name;

--module solution
SELECT od.car_make
       ,STRING_AGG(DISTINCT cd.customer_name, ', ' ORDER BY cd.customer_name) customer_name
 FROM public.order_detail od
     FULL OUTER JOIN public.customer_detail cd ON cd.customer_id = od.customer_id
GROUP BY od.car_make
ORDER BY 1;
