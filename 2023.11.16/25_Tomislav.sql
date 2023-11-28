DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;

USE ComputerStore;

CREATE TABLE Products (
    id int primary key AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    price float,
    stock_quantity INT,
    category ENUM( "laptop", "desktop", "tablet")
);

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("MacBook Pro 889", "very fast", 1770, 42, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("MacBook 11", "very fast", 340, 49, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Acer Pro X34", "very slow", 567, 49, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Acer Pro &66", "very slow", 567, 49, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Model 234", "very slow", 670, 10, "desktop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Ipad Pro Max", "super good and afordable", 700, 83, "tablet");
    
CREATE TABLE Customers (
    id int primary key AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);

INSERT INTO Customers(full_name, email, address) 
	VALUES("Tomislav Rusev", "rusevtomy@gmail.com", "Sofia");

CREATE TABLE Orders (
    id int primary key AUTO_INCREMENT,
    customer_id INT,
    order_date datetime,
    total_amount INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

INSERT INTO Orders(order_date, customer_id, total_amount) 
	VALUES("2023-01-01 00:00:12", 1, 7200);
    
INSERT INTO Orders(order_date, customer_id, total_amount) 
	VALUES("2023-11-16 00:00:12", 1, 7200);
    
SELECT * FROM Products
WHERE category = "laptop" AND price > 1000;

SELECT name FROM Products 
WHERE stock_quantity = 0;

UPDATE Products
SET stock_quantity = stock_quantity + 50
WHERE id = 2;

DELETE FROM Products
WHERE stock_quantity = 0;

SELECT * FROM Orders
WHERE order_date > CURDATE() - interval 30 day;

SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (1,7);

SELECT DISTINCT address, full_name FROM Customers;

SELECT * FROM Products
ORDER BY price DESC
LIMIT 10;

SELECT SUM(price) category FROM Products
GROUP BY category;

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT Customers.id as "CustomerId", order_date, total_amount, full_name, address FROM Orders
LEFT JOIN Customers
ON Customers.id = Orders.customer_id;

SELECT *
FROM Products
WHERE name LIKE '%Gaming%';

SELECT *
FROM Customers
WHERE full_name LIKE 'J%';



