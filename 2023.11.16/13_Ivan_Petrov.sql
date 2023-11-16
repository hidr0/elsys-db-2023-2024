-- Create the ComputerStore database
DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

-- Products: Stores information about computers for sale
CREATE TABLE Products (
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
	("IPad Air II", "The tablet of tablets", 1000, 1, "tablet");


-- Stores information about customers
CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(100)
);

INSERT INTO Customers(full_name, email, address) VALUES
	("Bay Ganyo", "bayganyo@abv.bg", "Chicago");


-- Orders: Stores information about customer orders
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME,
    total_amount INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

INSERT Orders(order_date, total_amount, customer_id) VALUES
	("2023-01-01 00:00:12", 7200, 1);


-- 1
SELECT * FROM Products WHERE category LIKE "laptop" AND price >= 1000;
SELECT name FROM Products WHERE stock_quantity <= 0;
SELECT * FROM Orders WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 2
UPDATE Products SET stock_quantity = stock_quantity + 20 WHERE name LIKE "Macbook Pro 64GB";

-- 3
DELETE FROM Products WHERE stock_quantity <= 0;

-- 17
SELECT * FROM Orders WHERE WEEKDAY(order_date) IN (5, 6);

-- 13
SELECT DISTINCT address FROM Customers;
SELECT * FROM Products ORDER BY price DESC LIMIT 3;

-- 7
SELECT SUM(price), category FROM Products GROUP BY category;
SELECT MAX(price), category FROM Products GROUP BY category;
SELECT * FROM Orders LEFT JOIN Customers ON Orders.customer_id = Customers.id;