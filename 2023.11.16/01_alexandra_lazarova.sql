-- create database
DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

-- create tables
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    price FLOAT,
    stock_quantity INT,
    category ENUM("laptop", "desktop", "tablet")
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME,
    total_amount INT,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)
);

-- insert data into tables
INSERT INTO Products (name, description, price, stock_quantity, category)
VALUES 
    ('Macbook Pro 8GB', 'Very fast laptop', 3200, '0', "laptop"),
    ('Macbook Pro 16GB', 'Very fast laptop', 3500, '10', "laptop"),
    ('Macbook Pro 8GB', 'Very fast laptop', 3200, '42', "laptop"),
    ('Lenovo', 'laptop', 900, '23', "laptop"),
    ("Ipad Air II", 'The tablet of tablets', 3200, '15', "tablet");

INSERT INTO Customers (full_name, email, address)
VALUES
    ('Mecho Mladshi', 'mecho.mechov@email.bg', "wallstreet12"),
    ('Gusko Guskov', 'guskata123@vba.gb', "umecho12"),
    ('Gusko Guskov', 'guskata123@vba.gb', "umecho12"),
    ('Gusko Guskov', 'guskata123@vba.gb', "umecho12");
    
INSERT INTO Orders (order_date, total_amount, customer_id)
VALUES
	('2023-11-16 00:00:21', 2000, 1),
    ('2023-01-01 00:00:21', 6000, 1);

-- some queries
SELECT * FROM Products WHERE category = "laptop" AND price > 1000;

SELECT name FROM Products WHERE stock_quantity = 0;

SELECT * FROM Orders WHERE order_date > CURDATE() - INTERVAL 30 DAY;

SELECT * FROM Orders WHERE DAYOFWEEK(order_date) IN (1, 7);	

SELECT DISTINCT address FROM Customers;

SELECT * FROM Products ORDER BY price DESC LIMIT 3;

SELECT SUM(price), category FROM Products GROUP BY category;

SELECT MAX(price), category FROM Products GROUP BY category;

-- pokazno za JOIN
SELECT * FROM Orders LEFT JOIN Customers ON Customers.id = Orders.customer_id; 

-- update
UPDATE Products SET stock_quantity = stock_quantity + 25 WHERE id = 1;

-- delete
DELETE FROM Products WHERE stock_quantity = 0;

-- more queries
SELECT name FROM Products WHERE name LIKE '%Gaming%';

SELECT full_name FROM Customers WHERE full_name LIKE 'J%';

SELECT MONTH(order_date) AS month, COUNT(*) AS total_amount FROM Orders GROUP BY MONTH(order_date);