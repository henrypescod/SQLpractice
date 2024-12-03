-- Q1: Which social media platform (Twitter, Instagram, or Facebook) is the most effective method of advertising in each country? 
-- (In this case, consider the total number of lead conversions as a measure of effectiveness).

SELECT country, 
SUM(twitter_ad) AS no_leads_twitter, 
SUM(instagram_ad) AS no_leads_insta, 
SUM(facebook_ad) AS no_leads_FB
FROM marketing_and_ad_clean
GROUP BY country
ORDER BY no_leads_insta DESC;


Q2: Which social media platform is the most effective method of advertising based on marital status? 
(In this case, consider the total number of lead conversions as a measure of effectiveness).

SELECT marital_status, 
SUM(twitter_ad) AS no_leads_twitter, 
SUM(instagram_ad) AS no_leads_insta, 
SUM(facebook_ad) AS no_leads_FB,
FROM marketing_and_ad_clean
GROUP BY marital_status
ORDER BY no_leads_insta DESC;

Q3: Which social media platform(s) seem(s) to be the most effective per country? 
(In this case, assume that purchases were in some way influenced by lead conversions from a campaign). 
Hint: You’ll want to generate the amount spent per product type per country and include a total of the ads for each of the social media platforms. 
Then, review the output to determine whether there is anything interesting related to the amount spent per product in each country and which social media platforms were used for advertising.

SELECT country, 
SUM(twitter_ad) AS no_leads_twitter, 
SUM(instagram_ad) AS no_leads_insta, 
SUM(facebook_ad) AS no_leads_FB,
SUM(sales_on_drinks) AS drinks_sales,
SUM(sales_on_meat) AS meat_sales,
SUM(sales_on_fish) AS fish_sales,
SUM(sales_on_chocolates) AS chocolate_sales,
SUM(sales_on_commodities) AS commodities_sales
FROM marketing_and_ad_clean
GROUP BY country
ORDER BY no_leads_insta DESC;

could be modified to:

SELECT 
    country, 
    SUM(twitter_ad) AS no_leads_twitter, 
    SUM(instagram_ad) AS no_leads_insta, 
    SUM(facebook_ad) AS no_leads_FB,
    SUM(sales_on_drinks) AS drinks_sales,
    SUM(sales_on_meat) AS meat_sales,
    SUM(sales_on_fish) AS fish_sales,
    SUM(sales_on_chocolates) AS chocolate_sales,
    SUM(sales_on_commodities) AS commodities_sales,
    SUM(twitter_ad + instagram_ad + facebook_ad) AS total_leads
FROM 
    marketing_and_ad_clean
GROUP BY 
    country
ORDER BY 
    total_leads DESC;

And modified further to add a ratio of total leads to total sales

SELECT 
    country, 
    SUM(twitter_ad) AS no_leads_twitter, 
    SUM(instagram_ad) AS no_leads_insta, 
    SUM(facebook_ad) AS no_leads_FB,
    SUM(sales_on_drinks) AS drinks_sales,
    SUM(sales_on_meat) AS meat_sales,
    SUM(sales_on_fish) AS fish_sales,
    SUM(sales_on_chocolates) AS chocolate_sales,
    SUM(sales_on_commodities) AS commodities_sales,
    SUM(twitter_ad + instagram_ad + facebook_ad) AS total_leads,
    CASE 
        WHEN SUM(twitter_ad + instagram_ad + facebook_ad) > 0 
        THEN SUM(sales_on_drinks + sales_on_meat + sales_on_fish + sales_on_chocolates + sales_on_commodities) / SUM(twitter_ad + instagram_ad + facebook_ad)
        ELSE 0
    END AS leads_to_sales_ratio
FROM 
    marketing_and_ad_clean
GROUP BY 
    country
ORDER BY 
    total_leads DESC;
