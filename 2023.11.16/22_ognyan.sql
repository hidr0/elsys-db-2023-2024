DROP DATABASE IF EXISTS `ComputerStore`;
CREATE DATABASE `ComputerStore`;
USE `ComputerStore`;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT,
    category ENUM("Laptop", "Desktop", "Tablet", "Phone")
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(100)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    order_date DATETIME,
    total_amount DECIMAL(10, 2)
);
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    quantity INT,
    price DECIMAL(10, 2)
);

-- 4.
INSERT INTO Customers VALUES (1, "John Doe", "johnyy@gmail.com", "Sofia");
INSERT INTO Orders VALUES (1, 1, "2020-11-16 12:00:00", 100);
INSERT INTO Products VALUES (1, "Laptop", "Lenovo", 1001, 10, "Laptop");
INSERT INTO OrderDetails VALUES (1, 1, 1, 1000);

-- 1.
SELECT * FROM Products WHERE price > 1000 AND category = "Laptop";
SELECT full_name, email
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(*) > 3
);
SELECT name FROM Products WHERE stock_quantity = 0;
SELECT * FROM Orders WHERE order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- 2.
UPDATE Products SET stock_quantity = stock_quantity + 10 WHERE product_id = 1;

-- 3.
DELETE FROM Products WHERE stock_quantity = 0;

-- 17.
SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (1,7);
-- there is no way to do that

-- 13.
SELECT DISTINCT address FROM Customers;
SELECT * FROM Products ORDER BY price DESC LIMIT 10;

-- 14.
SELECT name FROM Products WHERE name LIKE "%Gaming%";
SELECT full_name FROM Customers WHERE full_name LIKE "J%";

-- 7.
SELECT category, AVG(price)
FROM Products
GROUP BY category;
SELECT MONTH(order_date), COUNT(*) FROM Orders GROUP BY MONTH(order_date);
SELECT category, MAX(price) AS max_price
FROM Products
GROUP BY category;
SELECT SUM(Products.price * Products.stock_quantity) AS total_revenue
FROM Products
JOIN OrderDetails ON Products.product_id = OrderDetails.product_id
WHERE category = 'Desktop';

-- 6.
SELECT Customers.customer_id, SUM(total_amount) FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY Customers.customer_id;
SELECT * FROM Products WHERE product_id NOT IN (SELECT product_id FROM OrderDetails);
SELECT Orders.*, OrderDetails.*, full_name, Products.name FROM Orders JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Products ON OrderDetails.product_id = Products.product_id;
SELECT Customers.* FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id JOIN Products ON OrderDetails.product_id = Products.product_id WHERE category != "Tablet";