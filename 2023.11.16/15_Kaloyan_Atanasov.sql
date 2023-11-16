DROP DATABASE IF EXISTS ComputerStore;

CREATE DATABASE ComputerStore;

USE ComputerStore;

CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price FLOAT,
    stock_quantity INT,
    category ENUM("Laptop", "Desktop", "Tablet")
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount FLOAT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price FLOAT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (name, description, price, stock_quantity, category)
VALUES ('Acer Predator', 'High-performance laptop', 1200.00, 20, 'Laptop'),
	   ('HP', 'Office-work laptop', 900.00, 20, 'Laptop'),
       ('Lenovo', 'Office desktop computer', 800.00, 15, 'Desktop'),
       ('HP', 'Office desktop computer', 1000.00, 15, 'Desktop'),
       ('Lenovo', 'Office desktop computer', 800.00, 15, 'Desktop'),
       ('Ipad', 'Compact tablet for on-the-go', 400.00, 30, 'Tablet');

INSERT INTO Customers (full_name, email, address)
VALUES ('Petkan Debilov', 'p.debilov@mail.com', 'ul. Bunishte 15, Petrohanche'),
       ('Galab Perushinkov', 'galab.peru@mail.com', 'ul. Gnezdo 29, Kukusharnik');

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2023-11-16', 1200.00),
       (2, '2023-11-15', 800.00);

INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 1200.00),
       (2, 2, 2, 400.00),
       (2, 3, 1, 400.00);

-- 4
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2023-11-16', 1500);

-- 4
INSERT INTO OrderDetails (order_id, product_id, quantity, price)
VALUES (LAST_INSERT_ID(), 1, 2, 750), (LAST_INSERT_ID(), 2, 1, 500);

-- 1 - Retrieve all products in the 'Laptop' category that are priced above $1000.
SELECT * FROM Products
WHERE category = 'Laptop' AND price > 1000;

-- 1 - Retrieve the names of all products that are out of stock.
SELECT name FROM Products
WHERE stock_quantity = 0;

-- 1 - List the details of orders placed in the last 30 days.
SELECT * FROM Orders
WHERE order_date < '2022-10-16';

-- 2 - Update the stock quantity of a specific product after a new shipment arrives.
UPDATE Products
SET stock_quantity = stock_quantity + 50
WHERE product_id = 1;

-- 3 - Delete all products that have been discontinued and are no longer in stock.
DELETE FROM Products
WHERE stock_quantity = 0;

-- 17 - List all orders placed on weekends
SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- 13 - Display a list of unique customer addresses.
SELECT DISTINCT address FROM Customers;

-- 13 - List the top 10 most expensive products, sorted by price in descending order.
SELECT * FROM Products
ORDER BY price DESC
LIMIT 10;

-- 14 - Select product names that contain the word 'Gaming'.
SELECT * FROM Products
WHERE name LIKE '%Gaming%';

-- 14 - Find customer names that start with the letter 'J'.
SELECT * FROM Customers
WHERE full_name LIKE 'J%';

-- 7 - Determine the average price of products in each category.
SELECT category, AVG(price) AS avg_price
FROM Products
GROUP BY category;

-- 7 - Count the total number of orders placed each month.
SELECT MONTH(order_date) AS month, COUNT(order_id) AS order_count
FROM Orders
GROUP BY month;

-- 7 - Find the most expensive product in each category.
SELECT category, MAX(price) AS max_price
FROM Products
GROUP BY category;
