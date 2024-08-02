create database clauses;
use clauses;


CREATE TABLE student_scores (
    student_id INT PRIMARY KEY,
    score INT
);

INSERT INTO student_scores (student_id, score) VALUES
(1, 95),
(2, 85),
(3, 75),
(4, 65),
(5, 50);




CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_type VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_type) VALUES
(101, 'Regular'),
(102, 'Premium'),
(103, 'VIP'),
(104, 'Regular'),
(105, 'VIP');


CREATE TABLE people (
    person_id INT PRIMARY KEY,
    age INT
);

INSERT INTO people (person_id, age) VALUES
(201, 0),
(202, 1),
(203, 5),
(204, 13),
(205, 30);







CREATE TABLE events (
    event_id INT PRIMARY KEY,
    day_of_week VARCHAR(50)
);

INSERT INTO events (event_id, day_of_week) VALUES
(301, 'Monday'),
(302, 'Friday'),
(303, 'Saturday'),
(304, 'Sunday'),
(305, 'Wednesday');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_code VARCHAR(10)
);

INSERT INTO products (product_id, product_code) VALUES
(401, 'A1'),
(402, 'B2'),
(403, 'C3'),
(404, 'D4'),
(405, 'E5');






-- 1. Determine Grade Level Based on Score

SELECT student_id, 
       score,
       CASE 
           WHEN score >= 90 THEN 'A'
           WHEN score >= 80 THEN 'B'
           WHEN score >= 70 THEN 'C'
           WHEN score >= 60 THEN 'D'
           ELSE 'F'
       END AS grade
FROM student_scores;


--  2. Assign Discount Rate Based on Customer Type

SELECT customer_id,
       customer_type,
       CASE customer_type
           WHEN 'Regular' THEN 0.05
           WHEN 'Premium' THEN 0.10
           WHEN 'VIP' THEN 0.20
           ELSE 0.0
       END AS discount_rate
FROM customers;

-- 3. Categorize Age Groups

SELECT person_id,
       age,
       CASE 
           WHEN age = 0 THEN 'Infant'
           WHEN age = 1 THEN 'Toddler'
           WHEN age BETWEEN 2 AND 4 THEN 'Toddler'
           WHEN age BETWEEN 5 AND 12 THEN 'Child'
           WHEN age BETWEEN 13 AND 17 THEN 'Teenager'
           ELSE 'Adult'
       END AS age_group
FROM people;

-- Identify Day Type Based on Day of the Week

SELECT event_id,
       day_of_week,
       CASE day_of_week
           WHEN 'Monday' THEN 'Weekday'
           WHEN 'Tuesday' THEN 'Weekday'
           WHEN 'Wednesday' THEN 'Weekday'
           WHEN 'Thursday' THEN 'Weekday'
           WHEN 'Friday' THEN 'Weekday'
           WHEN 'Saturday' THEN 'Weekend'
           WHEN 'Sunday' THEN 'Weekend'
           ELSE 'Unknown'
       END AS day_type
FROM events;

-- 5. Assign Product Category Based on Product Code

SELECT product_id,
       product_code,
       CASE product_code
           WHEN 'A1' THEN 'Electronics'
           WHEN 'B2' THEN 'Books'
           WHEN 'C3' THEN 'Clothing'
           WHEN 'D4' THEN 'Furniture'
           ELSE 'Other'
       END AS product_category
FROM products;

use classicmodels;

SELECT productCode, productName, 
CASE productLine
when  'Classic Cars' then 'Classic' 
when 'Motorcycles' then 'Motorcycles'
when 'Planes' then 'Planes'
else 'other'
END AS productClassification
FROM products;


show tables;
select* from customers;

select customerName,country,
case country
when 'USA' or 'Canada' then 'North America'
when 'France' or 'Germany' then 'Europe' 
when 'Japan' or 'China' then 'Asia'
else 'Other' 
END AS region 
from customers;



-- 10 Practice question 




