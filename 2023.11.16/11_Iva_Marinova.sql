DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE IF NOT EXISTS Products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR(255),
    price float,
    stock_quantity INT,
    category ENUM("laptop", "desktop", "tablet")
);

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 8gb", "Very fast", 3200, 42, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 16gb", "Very fast", 3600, 10, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 64gb", "Very fast", 7200, 1, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 696gb", "Very fast", 7200, 0, "desktop");

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Gaming Ipad Air 2", "The tablet of tablets", 1000, 1, "tablet");
  
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Lenovo Gaming", "A not very fast", 900, 12, "laptop");
    
CREATE TABLE IF NOT EXISTS Customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);
    
INSERT INTO Customers(full_name, email, address)
	VALUES("Iva Marinova", "iva@tues.bg", "Mazeto na 9ti blok tu");

INSERT INTO Customers(full_name, email, address)
	VALUES("Nikola", "n@tues.bg", "Mazeto na 9ti blok tu");
    
INSERT INTO Customers(full_name, email, address)
	VALUES("Denis", "d@tues.bg", "Mazeto na 9ti blok tu");
    
INSERT INTO Customers(full_name, email, address)
	VALUES("ALi", "a@tues.bg", "Mladost");
    
CREATE TABLE IF NOT EXISTS Orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date datetime,
    total_amount int,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)
);

INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-01-01 00:00:12", 7200, 1);
  
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-11-16 00:00:12", 10000, 1);  
  
-- Retrieve all products in the 'Laptop' category priced above $1000
SELECT * FROM Products 
WHERE category = "laptop" AND price > 1000;

-- Retrieve names of products that are out of stock
SELECT name FROM Products 
WHERE stock_quantity = 0;

-- List details of orders placed in the last 30 days
SELECT * FROM Orders 
WHERE order_date > DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Update the stock quantity of a specific product after a new shipment arrives
UPDATE Products SET stock_quantity = stock_quantity + 7 
WHERE id = 1;

-- Delete all discontinued and out-of-stock products
DELETE FROM Products 
WHERE stock_quantity = 0;

-- List all orders placed on weekends
SELECT * FROM Orders 
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- Display a list of unique customer addresses
SELECT DISTINCT address FROM Customers;

-- List the top 10 most expensive products, sorted by price in descending order
SELECT * FROM Products ORDER BY price DESC LIMIT 10;

-- Select product names that contain the word 'Gaming'
SELECT name FROM Products 
WHERE name LIKE '%Gaming%';

-- Find customer names that start with the letter 'J'
SELECT full_name FROM Customers 
WHERE full_name LIKE 'J%';

-- Determine the average price of products in each category
SELECT category, AVG(price) AS avg_price FROM Products GROUP BY category;

-- Find the most expensive product in each category
SELECT MAX(price), category FROM Products GROUP BY category;

-- Join
SELECT * FROM Orders LEFT JOIN Customers ON Customers.id = Orders.customer_id; 