DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE Products(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	description VARCHAR(256),
    price INT,
    stock_quantity INT,
	category ENUM("laptop", "desktop", "tablet")
);

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 4GB", "Slow", 960, 12, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 8GB", "Very fast", 3200, 42, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 16GB", "Very fast", 3600, 10, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 24GB", "Very fast", 7200, 1, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Macbook Pro 32GB", "Very fast", 7800, 0, "laptop");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Ipad Air II", "The tablet ot tablets", 2400, 5, "tablet");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Gaming Razer III", "Very fast", 6000, 8, "laptop");
    
UPDATE Products
SET stock_quantity = 100
WHERE id = 1;

DELETE FROM Products
WHERE stock_quantity = 0;

SELECT name FROM Products
WHERE name LIKE("Gaming%");

CREATE TABLE Customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(50),
    address VARCHAR(50)
);

INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov", "mkirilov@elsys-bg.org", "TUES");

INSERT INTO Customers(full_name, email, address)
	VALUES("Jihail Kirilov 1", "mkirilov@elsys-bg.org", "TUES");

INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov 2", "mkirilov@elsys-bg.org", "TUES");
    
INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov 2", "mkirilov@elsys-bg.org", "Mladost");
    
SELECT DISTINCT address, full_name FROM Customers;

SELECT * FROM Customers
WHERE full_name LIKE("J%");

CREATE TABLE Orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    total_amount INT,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers (id)
);

INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-01-01 00:00:12", 7200, 1);
    
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-11-16 00:00:12", 10000, 4);
    
SELECT * FROM Products
WHERE category = "laptop" AND price < 1000;

SELECT name FROM Products
WHERE stock_quantity = 0;

SELECT * FROM Orders
WHERE order_date < "2023-10-16";

SELECT * FROM Orders
WHERE DATEDIFF(order_date, CURDATE()) > 30;

SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (1,7);

-- List the top 3 most expensive products, sorted by price in descending order.
SELECT * FROM Products
ORDER BY price asc
LIMIT 3;

-- Determine the average price of products in each category.
SELECT SUM(price), category FROM Products
GROUP BY category;



    