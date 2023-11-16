DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    price FLOAT,
    stock_quantity INT,
    category ENUM("laptop", "dekstop", "tablet")
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATETIME,
    total_amount INT
);

INSERT INTO Products(name, description, price, stock_quantity, category)
VALUES("MackBook 4gb", "Shit laptop", 3000, 30, "laptop"),
	("MackBook 8gb", "Big Shit laptop", 3200, 17, "laptop"),
	("MackBook 16gb", "Ultra Shit laptop", 3700, 8, "laptop"),
	("MackBook 32gb", "Mega Shit laptop", 4300, 0, "laptop"),
    ("ACer Aspire V15", "Good laptop, fair price", 810, 21, "laptop"),
    ("Razer Gaming Laptop", "laptop for games", 2430, 12, "laptop");

INSERT INTO Customers(full_name, email, address) 
VALUES("Batman", "lidl@bat.man", "navsqkude"),
	("Jacob Vazovski", "brrr@gmail.com", "Sofia");

INSERT INTO Orders(order_date, total_amount, customer_id) VALUES("2023-01-01 00:00:12", 7200, 1);

SELECT * FROM Products
WHERE category = "laptop" AND price < 1000;

SELECT name FROM Products 
WHERE stock_quantity = 0;

SELECT * FROM Orders
WHERE order_date < "2023-10-16";

SELECT * FROM Orders
WHERE order_date > CURDATE() - interval 30 day;

SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (1,7);

SELECT DISTINCT address, full_name from Customers;

SELECT * FROM Products ORDER BY price desc LIMIT 3;

SELECT SUM(price), category FROM Products
GROUP BY category;

SELECT * FROM Customers;
SELECT * FROM Orders;

-- 2
UPDATE Products 
SET stock_quantity = stock_quantity + 5 
WHERE product_id = 2;

-- 3
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Products WHERE stock_quantity = 0;
SET SQL_SAFE_UPDATES = 1;

-- 14
SELECT name FROM Products WHERE name LIKE '%Gaming%';
SELECT full_name FROM Customers WHERE full_name LIKE 'J%';
