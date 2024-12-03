--- Created table for the cleaned marketing data --
CREATE TABLE Marketing_clean(
customer_Id SERIAL PRIMARY KEY,
Year_Birth INTEGER,
Education VARCHAR (50),
Marital_Status VARCHAR (50),
Income NUMERIC(6,0),
Monthly_Income_k NUMERIC(4,2),
Kidhome INTEGER,
Teenhome INTEGER,
Total_kids INTEGER,
Dt_Customer TIMESTAMP,
Day_since_last_purchase INTEGER,
Sales_on_drinks INTEGER,
Sales_on_Vegetables INTEGER,
Sales_on_Meat INTEGER,
Sales_on_Fish INTEGER,
Sales_on_Chocolates INTEGER,
Sales_on_commodities INTEGER,
Total_sales INTEGER,
NumDeals INTEGER,
No_of_sales_online INTEGER,
No_of_sales_in_store INTEGER,
No_of_purchases INTEGER,
NumVisits INTEGER,
Response INTEGER,
Complain INTEGER,
Country VARCHAR (50),
Count_success INTEGER,
Age INTEGER;

--- Created table for the cleaned ad data --
CREATE TABLE ad_clean(C
customer_Id SERIAL PRIMARY KEY,
Bulkmail_ad INTEGER,
Twitter_ad INTEGER,
Instagram_ad INTEGER,
Facebook_ad INTEGER,
Brochure_ad INTEGER);

*/
Write SQL queries to format, transform, validate, and analyse the data to determine which products sell the best and whether that varies based on demographic factors, by determining:
Q1: the total spend per country

SELECT Country, SUM(total_sales) AS Total_spend_per_country
FROM public.Marketing_and_ad_clean
	GROUP BY country
	ORDER BY Total_spend_per_country DESC;

Q2: the total spend per product per country

SELECT Country, 
SUM(sales_on_drinks) AS Total_liquor_spend,
SUM(sales_on_vegetables) AS Total_veg_spend,
SUM(sales_on_meat) AS Total_meat_spend,
SUM(sales_on_fish) AS Total_fish_spend, 
SUM(sales_on_chocolates) AS Total_choc_spend,
SUM(sales_on_commodities) AS Total_comm_spend,
SUM(total_sales) AS Total_spend_per_country
FROM public.Marketing_and_ad_clean
GROUP BY country
ORDER BY Total_spend_per_country DESC;

SUM(sales_on_vegetables)
	GROUP BY country
	ORDER BY Total_spend_per_country DESC;
	
Q3: which products are the most popular in each country

SELECT *
FROM public.Marketing_and_ad_clean
LIMIT 100;

SELECT Country 
	,'Liquor' product_type
		,SUM(sales_on_drinks) 
	FROM public.Marketing_and_ad_clean
GROUP BY Country
UNION ALL
SELECT Country
	,'Vegetables' product_type
		,SUM(sales_on_vegetables)
	FROM public.Marketing_and_ad_clean
GROUP BY Country
UNION ALL
SELECT Country 
	,'Meat' product_type
		,SUM(sales_on_meat)
	FROM public.Marketing_and_ad_clean
GROUP BY Country
UNION ALL
SELECT Country
	,'Fish' product_type
	,SUM(sales_on_fish) 
FROM public.Marketing_and_ad_clean
GROUP BY Country
UNION ALL
SELECT Country 
	,'Chocolates' product_type
	,SUM(sales_on_chocolates)
	FROM public.Marketing_and_ad_clean
GROUP BY Country
UNION ALL
SELECT Country 
	,'Commodities' product_type
	,SUM(sales_on_commodities)
FROM public.Marketing_and_ad_clean
GROUP BY Country
ORDER BY Country
	,product_type;

Q4: which products are the most popular based on marital status

SELECT marital_status 
	,'Liquor' product_type
		,SUM(sales_on_drinks) 
	FROM public.Marketing_and_ad_clean
GROUP BY marital_status 
UNION ALL
SELECT marital_status 
	,'Vegetables' product_type
		,SUM(sales_on_vegetables)
	FROM public.Marketing_and_ad_clean
GROUP BY marital_status 
UNION ALL
SELECT marital_status  
	,'Meat' product_type
		,SUM(sales_on_meat)
	FROM public.Marketing_and_ad_clean
GROUP BY marital_status 
UNION ALL
SELECT marital_status 
	,'Fish' product_type
	,SUM(sales_on_fish) 
FROM public.Marketing_and_ad_clean
GROUP BY marital_status 
UNION ALL
SELECT marital_status  
	,'Chocolates' product_type
	,SUM(sales_on_chocolates)
	FROM public.Marketing_and_ad_clean
GROUP BY marital_status 
UNION ALL
SELECT marital_status 
	,'Commodities' product_type
	,SUM(sales_on_commodities)
FROM public.Marketing_and_ad_clean
GROUP BY marital_status 
ORDER BY marital_status 
	,product_type;
	
Q5: which products are the most popular based on whether or not there are children or teens in the home.

SELECT total_kids 
	,'Liquor' product_type
		,SUM(sales_on_drinks) 
	FROM public.Marketing_and_ad_clean
GROUP BY total_kids 
UNION ALL
SELECT total_kids 
	,'Vegetables' product_type
		,SUM(sales_on_vegetables)
	FROM public.Marketing_and_ad_clean
GROUP BY total_kids 
UNION ALL
SELECT total_kids  
	,'Meat' product_type
		,SUM(sales_on_meat)
	FROM public.Marketing_and_ad_clean
GROUP BY total_kids 
UNION ALL
SELECT total_kids 
	,'Fish' product_type
	,SUM(sales_on_fish) 
FROM public.Marketing_and_ad_clean
GROUP BY total_kids 
UNION ALL
SELECT total_kids  
	,'Chocolates' product_type
	,SUM(sales_on_chocolates)
	FROM public.Marketing_and_ad_clean
GROUP BY total_kids 
UNION ALL
SELECT total_kids 
	,'Commodities' product_type
	,SUM(sales_on_commodities)
FROM public.Marketing_and_ad_clean
GROUP BY total_kids 
ORDER BY total_kids 
	,product_type; */



/*
ALTER TABLE Marketing_and_ad_clean
ALTER COLUMN Monthly_Income_k type numeric (4,2);

ALTER TABLE Marketing_and_ad_clean
ALTER COLUMN dt_customer TYPE TIMESTAMP USING dt_customer::timestamp without time zone;

ALTER TABLE Marketing_and_ad_clean
ALTER COLUMN dt_customer TYPE TIMESTAMP USING to_timestamp(dt_customer);

SET datestyle = 'ISO, DMY';

SELECT *
FROM public.Marketing_and_ad_clean
*/
/*
