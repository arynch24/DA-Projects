

select * from catalog_sales limit 5;
select * from store_sales limit 5;
select * from web_sales limit 5;

select distinct i_category from item ;
select * from item ;

-- 1. Total Sales by Product Category: 
-- Question: Calculate the total sales revenue for each product category across all channels.

SELECT i.i_category, 
SUM((cs.cs_quantity * cs.cs_sales_price)+(ss.ss_quantity*ss.ss_sales_price)+(ws.ws_quantity*ws.ws_sales_price)) AS total_sales
FROM item i
JOIN catalog_sales cs ON i.i_item_sk = cs.cs_item_sk
JOIN store_sales ss ON i.i_item_sk = ss.ss_item_sk
JOIN web_sales ws ON i.i_item_sk = ws.ws_item_sk
GROUP BY i.i_category;


-- 2. Sales Trend Over Time: 
-- Question: Analyze monthly sales trends for the past two years.

select * from date_dim 
order by d_date desc;

WITH SalesData AS (
    SELECT 
        CONCAT(MONTHNAME(dd.d_date), ' ', YEAR(dd.d_date)) AS f_date,
        YEAR(dd.d_date) AS year,
        MONTH(dd.d_date) AS month,
        SUM((cs.cs_quantity * cs.cs_sales_price)+(ss.ss_quantity*ss.ss_sales_price)+(ws.ws_quantity*ws.ws_sales_price)) AS total_sales
    FROM 
        date_dim dd 
    JOIN 
        catalog_sales cs 
    ON 
        dd.d_date_sk = cs.cs_sold_date_sk
    JOIN 
        store_sales ss 
    ON 
        dd.d_date_sk = ss.ss_sold_date_sk
    JOIN 
        web_sales ws 
    ON 
        dd.d_date_sk = ws.ws_sold_date_sk
    WHERE 
        YEAR(dd.d_date) IN (1999, 2000)
    GROUP BY 
        CONCAT(MONTHNAME(dd.d_date), ' ', YEAR(dd.d_date)),
        YEAR(dd.d_date),
        MONTH(dd.d_date)
)
SELECT *
FROM SalesData
ORDER BY 
    year, month;


-- 3. Top10Best-Selling Products: 
-- Question: Identify the top 10 best-selling products by total revenue.

select * from item;

SELECT i.i_product_name, 
SUM((cs.cs_quantity * cs.cs_sales_price)+(ss.ss_quantity*ss.ss_sales_price)+(ws.ws_quantity*ws.ws_sales_price)) AS total_sales
FROM item i
JOIN catalog_sales cs ON i.i_item_sk = cs.cs_item_sk
JOIN store_sales ss ON i.i_item_sk = ss.ss_item_sk
JOIN web_sales ws ON i.i_item_sk = ws.ws_item_sk
GROUP BY i.i_product_name
ORDER BY total_sales desc limit 10;


-- 4. Sales by Region: 
-- Question: Calculate the total sales revenue by region for each sales channel.

select * from customer_address;

-- TAKEN REGION AS CITYS

--CATALOG SALES

SELECT ca.ca_city, SUM(cs.cs_quantity * cs.cs_sales_price) AS total_sales
FROM customer_address ca
JOIN catalog_sales cs ON ca.ca_address_sk = cs.cs_bill_addr_sk
GROUP BY ca.ca_city;

--STORE SALES

SELECT ca.ca_city, SUM(ss.ss_quantity * ss.ss_sales_price) AS total_sales
FROM customer_address ca
JOIN store_sales ss ON ca.ca_address_sk = ss.ss_addr_sk
GROUP BY ca.ca_city;

--WEB SALES

SELECT ca.ca_city, SUM(ws.ws_quantity * ws.ws_sales_price) AS total_sales
FROM customer_address ca
JOIN web_sales ws ON ca.ca_address_sk = ws.ws_bill_addr_sk
GROUP BY ca.ca_city;



-- 5. Year-over-Year Sales Growth: 
-- Question: Compare the year-over-year sales growth for the current and previous year.

WITH SalesData AS (
    SELECT 
        YEAR(dd.d_date) AS year,
        SUM((cs.cs_quantity * cs.cs_sales_price)+(ss.ss_quantity*ss.ss_sales_price)+(ws.ws_quantity*ws.ws_sales_price)) AS total_sales
    FROM date_dim dd 
    JOIN catalog_sales cs ON dd.d_date_sk = cs.cs_sold_date_sk
    JOIN store_sales ss ON dd.d_date_sk = ss.ss_sold_date_sk
    JOIN web_sales ws ON dd.d_date_sk = ws.ws_sold_date_sk
    WHERE YEAR(dd.d_date) IN (1999, 2000)
    GROUP BY YEAR(dd.d_date)
)
SELECT *
FROM SalesData
ORDER BY 
    year;


-- 6. Sales Contribution by Channel: 
-- Question: Determine the contribution of each sales channel (store, catalog, online) to the overall sales.

select (cs_quantity * cs_sales_price) from catalog_sales;





