-- Create the ComputerStore database
DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

-- Products: Stores information about computers for sale
CREATE TABLE IF NOT EXISTS Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    price FLOAT,
    stock_quantity INT,
    category ENUM("laptop", "desktop", "tablet")
);

INSERT INTO Products(name, description, price, stock_quantity, category) VALUES
	("Macbook Pro 8GB", "Very fast laptop", 400, 42, "laptop"),
	("Macbook Pro 16GB", "Very fast laptop", 3600, 10, "laptop"),
	("Macbook Pro 64GB", "Very fast laptop", 800, 1, "laptop"),
	("Macbook Pro 96GB", "Very fast laptop", 7200, 0, "laptop"),
	("IPad Air II", "The tablet of tablets", 1000, 1, "tablet"),
	("Gaming Computer", "Best gaming computer ever", 3000, 1, "desktop");


-- Stores information about customers
CREATE TABLE IF NOT EXISTS Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(100)
);

INSERT INTO Customers(full_name, email, address) VALUES
	("Bay Ganyo", "bayganyo@abv.bg", "Chicago"),
	("Jacob", "123@example.com", "Burgas");


-- Orders: Stores information about customer orders
CREATE TABLE IF NOT EXISTS Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME,
    total_amount INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

INSERT Orders(order_date, total_amount, customer_id) VALUES
	("2023-01-01 00:00:12", 7200, 1);


-- 1. SELECT Queries:
-- Retrieve all products in the 'Laptop' category that are priced above $1000.
SELECT * FROM Products WHERE category LIKE "laptop" AND price >= 1000;

-- Retrieve the names of all products that are out of stock.
SELECT name FROM Products WHERE stock_quantity <= 0;

-- List the details of orders placed in the last 30 days.
SELECT * FROM Orders WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 17. Date and Time Functions:
-- List all orders placed on weekends.
SELECT * FROM Orders WHERE WEEKDAY(order_date) IN (5, 6);

-- 13. Using DISTINCT and ORDER BY:
-- Display a list of unique customer addresses.
SELECT DISTINCT address FROM Customers;

-- List the top 3 most expensive products, sorted by price in descending order.
SELECT * FROM Products ORDER BY price DESC LIMIT 3;

-- 7. Aggregate Functions and GROUP BY:
-- Determine the average price of products in each category.
SELECT SUM(price), category FROM Products GROUP BY category;

-- Find the most expensive product in each category.
SELECT MAX(price), category FROM Products GROUP BY category;

-- Which person which order?
SELECT * FROM Orders LEFT JOIN Customers ON Orders.customer_id = Customers.id;


-- 2. UPDATE Query:
-- Update the stock quantity of a specific product after a new shipment arrives.
UPDATE Products SET stock_quantity = stock_quantity + 20 WHERE name LIKE "Macbook Pro 64GB";

-- 3. DELETE Query:
-- Delete all products that have been discontinued and are no longer in stock.
DELETE FROM Products WHERE stock_quantity <= 0;

-- 7. Count the total number of orders placed each month.
SELECT COUNT(*), MONTHNAME(order_date) FROM Orders GROUP BY MONTHNAME(order_date);

-- 14. Using LIKE for Pattern Matching:
-- Select product names that contain the word 'Gaming'.
SELECT name FROM Products WHERE name LIKE "%Gaming%";

-- Find customer names that start with the letter 'J'.
SELECT full_name FROM Customers WHERE full_name LIKE "J%";
