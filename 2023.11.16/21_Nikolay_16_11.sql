DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE Products(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100), 
    description varchar(255), 
    price float,
    stock_quantity int, 
    category ENUM("laptop","desktop","tablet")
);

INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Mac 1", "Slow computer", 364, 1, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 8GB", "Fast laptop", 3640, 42, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 16GB", "Faster laptop", 3740.5, 10, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Gaming Macbook Pro 64GB", "More faster laptop", 5200.65, 1, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 96GB", "Fastest laptop", 7200.65, 0, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Ipad Air II", "The tablet of tablets", 1543, 10, "tablet");
    

CREATE TABLE Customers(
	id int primary key AUTO_INCREMENT,
    full_name varchar(200),
    email varchar(200),
    address varchar(200)
);

INSERT INTO Customers(full_name, email, address)
	VALUES("Boris Macaron", "bmacarron@mon-bg.uk", "The White House");
INSERT INTO Customers(full_name, email, address)
	VALUES("Boris Macaron", "bmacarron@abv.bg", "The White House");
INSERT INTO Customers(full_name, email, address)
	VALUES("Jemanuel Johnson", "ejohnson@mon-bg.fr", "The Great Chinese Wall");
    

CREATE TABLE Orders(
	id int primary key AUTO_INCREMENT,
    order_date datetime,
    total_amount int,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)
);

SELECT * FROM Customers;
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-01-01 00:00:12", 7200, 1);
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-11-11 12:34:56", 2000, 1);
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2013-11-21 21:47:32", 1540, 2);    
INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2016-02-12 01:42:56", 1540, 2);    
    
SELECT * FROM Products WHERE category="laptop" AND PRICE > 1000;

SELECT name FROM Products WHERE stock_quantity = 0;

SELECT * FROM Orders WHERE datediff(curdate(),order_date)<30;

UPDATE Products
SET stock_quantity = stock_quantity + 5
WHERE name = "Mac 1";

DELETE FROM Products WHERE stock_quantity = 0;
    
SELECT * FROM Orders
WHERE DAYOFWEEK(order_date) IN (6,7);

SELECT DISTINCT full_name,address FROM Customers;


SELECT * FROM PRODUCTS
ORDER BY price DESC
LIMIT 2;

SELECT SUM(price), category FROM Products
GROUP BY category;

SELECT name FROM Products WHERE name LIKE "Gaming%";
SELECT full_name FROM Customers WHERE full_name LIKE "J%";

SELECT COUNT(order_date), month(order_date) FROM Orders GROUP BY month(order_date) ORDER BY month(order_date);