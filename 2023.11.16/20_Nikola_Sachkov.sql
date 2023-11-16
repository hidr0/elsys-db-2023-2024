DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;

USE ComputerStore;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    price float,
    stock_quantity INT,
    category ENUM( "laptop", "desktop", "tablet")
);

INSERT INTO Products(name, description, price, stock_quantity, category)
VALUES("MacBook Pro 889", "very fast laptop", 1770, 42, "laptop");
    
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);

INSERT INTO Customers(full_name, email, address) 
    VALUES("Nikola Sachkov", "nikola.sachkov@gmail.com", "Sofia");

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date datetime,
    total_amount int,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-01-01 00:00:12", 7200, 1);
    
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-11-16 00:00:12", 10000, 1);
    
SELECT * FROM Products WHERE category = "laptop" and price > 1000;

SELECT full_name, email
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 3
);

SELECT name FROM Products WHERE stock_quantity = 1;

UPDATE Products SET stock_quantity = 20 WHERE product_id = 1;

SELECT * FROM Orders
WHERE order_date > CURDATE() - interval 30 day;

SELECT * FROM Orders WHERE DAYOFWEEK(order_date) IN (1,1);

SELECT DISTINCT address FROM Customers;

SELECT * FROM Products ORDER BY price DESC LIMIT 10;

SELECT SUM(price) category FROM Products GROUP BY category;

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT * FROM Orders
LEFT JOIN Customers ON Customers.customer_id = Orders.customer_id
LIMIT 0, 1000;

SELECT name FROM Products WHERE name LIKE '%Gaming%';

SELECT full_name FROM Customers WHERE full_name LIKE 'J%';
