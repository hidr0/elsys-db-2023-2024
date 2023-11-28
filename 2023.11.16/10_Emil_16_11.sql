-- Scenario

DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(100),
    price FLOAT,
    stock_quantity INT,
    category ENUM("laptop", "desktop", "tablet") 
);

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook PRO 16GB", "fast", 900, 24, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook PRO 32GB", "fast", 1400, 20, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook PRO 64GB", "fast", 1800, 12, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Mac PRO", "very fast", 1000, 24, "desktop");
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("IPAD", "fast", 800, 240, "tablet");

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200),
    email VARCHAR(200),
    address VARCHAR(200)
);

INSERT INTO Customers (full_name, email, address)
	VALUES 
	('Misho Kirilov', 'MK@elsys.com', '123 tues'),
    ('Sedef Geirgiev', 'SedG@gmail.com', '123 tues'),
	('Emo Kostadinov', 'EmoK@gmail.com', '123 sofia');

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME,
    total_amount INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2023-01-01', 1500);

CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 4

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, '2023-8-22', 1500);

-- 1

SELECT * FROM Products
WHERE category = 'Laptop' AND price > 1000;

SELECT name FROM Products WHERE stock_quantity = 0;
SELECT * FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY;

-- 2

UPDATE Products
SET stock_quantity = stock_quantity + 50
WHERE product_id = 101;

-- 3

DELETE FROM Products
WHERE stock_quantity = 0;

-- 17

SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- 13

SELECT DISTINCT address FROM Customers;
SELECT * FROM Products
ORDER BY price DESC
LIMIT 3;

-- 14

SELECT * FROM Products
WHERE name LIKE '%Gaming%';
SELECT * FROM Customers
WHERE full_name LIKE 'J%';

-- 7

SELECT category, AVG(price) as avg_price
FROM Products
GROUP BY category;
SELECT MONTH(order_date) as month, COUNT(*) as total_orders
FROM Orders
GROUP BY MONTH(order_date);
SELECT category, MAX(price) as max_price
FROM Products
GROUP BY category;
SELECT SUM(price) as total_revenue
FROM OrderDetails
WHERE product_id IN (SELECT product_id FROM Products WHERE category = 'Desktop');
