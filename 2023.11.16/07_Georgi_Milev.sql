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
CREATE TABLE IF NOT EXISTS Customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS Orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date datetime,
    total_amount int,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)
);
INSERT INTO Products (name, description, price, stock_quantity, category)
VALUES
    ('Laptop Model A', 'High-performance laptop with advanced features', 1299.99, 50, 'laptop'),
    ('Desktop PC Pro', 'Powerful desktop computer for professional use', 1499.99, 30, 'desktop'),
    ('Tablet Slim X', 'Slim and lightweight tablet for casual users', 499.99, 20, 'tablet'),
    ('Laptop UltraBook', 'Ultra-thin and portable laptop for on-the-go use', 899.99, 40, 'laptop');
    
    
INSERT INTO Customers (full_name, email, address)
VALUES
    ('Petar', 'petar@example.com', 'lulin'),
    ('Viktor', 'viktor@example.com', 'nadezhda'),
    ('Georgi', 'georgi@example.com', 'drujba'),
    ('Boris', 'boris@example.com', 'mladost');
    
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES
    ("2023-08-11 00:09:00", 7200, 1),
	("2023-12-17 00:08:00", 10000, 1);  
  

SELECT * FROM Products 
WHERE category = "laptop" AND price > 1000;

SELECT name FROM Products 
WHERE stock_quantity = 0;

SELECT * FROM Orders 
WHERE order_date > DATE_SUB(CURDATE(), INTERVAL 30 DAY);

UPDATE Products SET stock_quantity = stock_quantity + 7 
WHERE id = 1;

DELETE FROM Products 
WHERE stock_quantity = 0;

SELECT * FROM Orders 
WHERE DAYOFWEEK(order_date) IN (1, 7);

SELECT DISTINCT address FROM Customers;

SELECT * FROM Products ORDER BY price DESC LIMIT 10;

SELECT name FROM Products 
WHERE name LIKE '%Gaming%';

SELECT full_name FROM Customers 
WHERE full_name LIKE 'J%';

SELECT category, AVG(price) AS avg_price FROM Products GROUP BY category;

SELECT MAX(price), category FROM Products GROUP BY category;

SELECT * FROM Orders LEFT JOIN Customers ON Customers.id = Orders.customer_id; 