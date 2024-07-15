CREATE DATABASE OPERATORS;
USE OPERATORS;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    discount DECIMAL(10, 2)
);

select * from sales;

INSERT INTO sales (sale_id, product_id, quantity, price_per_unit, discount) VALUES
(1, 101, 10, 15.00, 2.00),
(2, 102, 5, 25.00, 5.00),
(3, 103, 8, 30.00, 3.00),
(4, 104, 3, 45.00, 4.50);

-- Calculate the total revenue before discount for each sale.
SELECT sale_id, (quantity * price_per_unit) AS total_revenue
FROM sales;

-- Calculate the net revenue after applying the discount.
SELECT sale_id, (quantity * price_per_unit)-discount AS total_revenue_after_disc
FROM sales;

-- Calculate the total revenue before discount.
SELECT sale_id, quantity, price_per_unit, (quantity * price_per_unit) AS total_revenue_before_discount
FROM sales;

-- Calculate the average price per unit for each sale after discount.
SELECT sale_id, quantity, price_per_unit, discount, ((quantity * price_per_unit - discount) / quantity) AS average_price_per_unit_after_discount
FROM sales;

-- Find out which sales have an odd quantity
SELECT sale_id, quantity
FROM sales
WHERE quantity % 2 != 0;

-- BIT OPERATOR

CREATE TABLE user_permissions (
    user_id INT PRIMARY KEY,
    permissions INT
);


INSERT INTO user_permissions (user_id, permissions) VALUES
(1, 1),  -- Read
(2, 2),  -- Write
(3, 4),  -- Execute
(4, 8),  -- Delete
(5, 3),  -- Read and Write
(6, 7),  -- Read, Write, and Execute
(7, 15); -- All permissions (Read, Write, Execute, Delete)

select * from user_permissions;

SELECT user_id, permissions, (permissions & 1) AS has_read_permission
FROM user_permissions
WHERE (permissions & 1) = 1;

UPDATE user_permissions
SET permissions = permissions | 8
WHERE (permissions & 2) = 2;


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    quantity INT
);

INSERT INTO products (product_id, product_name, price, quantity) VALUES
(1, 'Laptop', 1200.00, 10),
(2, 'Mouse', 25.00, 100),
(3, 'Keyboard', 45.00, 50),
(4, 'Monitor', 300.00, 20),
(5, 'Headphones', 150.00, 75);

select * from products;

-- Find the product with the exact price of $300.00.
SELECT product_id, product_name, price
FROM products
WHERE price = 300.00;

-- Find all products priced above $100.00.
SELECT product_id, product_name, price
FROM products
WHERE price > 100.00;

-- Find all products priced below $50.00.
SELECT product_id, product_name, price
FROM products
WHERE price < 50.00;

-- Find all products priced at least $150.00.
SELECT product_id, product_name, price
FROM products
WHERE price >= 150.00;

-- Find all products priced at most $45.00.
SELECT product_id, product_name, price
FROM products
WHERE price <= 45.00;

-- Find all products not priced at $25.00.
SELECT product_id, product_name, price
FROM products
WHERE price <> 25.00;










