-- Database Scenario
DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE Products(
	id int primary key AUTO_INCREMENT,
    name varchar(100),
    description varchar(255),
    price float,
    stock_quantity int,
    category ENUM("laptop", "desktop", "tablet")
);

CREATE TABLE Customers(
	id int primary key AUTO_INCREMENT,
    full_name varchar(200),
    email varchar(200),
    address varchar(200)
);

CREATE TABLE Orders(
	id int primary key AUTO_INCREMENT,
    order_date datetime,
    total_amount int,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)	
);

-- 4
INSERT INTO Products(name, description, price, stock_quantity, category) 
VALUES  ("Macbook Pro 8GB", "Very fast laptop", 960, 42, "laptop"),
		("Macbook Pro 16GB", "Very fast laptop", 3600, 10, "laptop"),
		("Macbook Pro 64GB", "Very fast laptop", 7200, 0, "laptop"),
        ("Asus TUF Gaming F17", "Fastest laptop", 3400, 4, "laptop"),
        ("Custom Build", "Best Desktop", 10000, 1, "desktop"),
        ("Ipad Air II", "The tablet of tablets", 1000, 1, "tablet");
        
INSERT INTO Customers(full_name, email, address)
VALUES  ("Mihail Kirilov", "mkirilov@elsys-bg.org", "TUES"),
		("Mihail Kirilov 2.0", "mkirilov2@elsys-bg.org", "TUES"),
        ("Mihail Kirilov 3.0", "mkirilov3@elsys-bg.org", "Mladost"),
		("Jack Lantern", "jackLan@elsys-bg.org", "Lulin 2");

INSERT INTO Orders(order_date, total_amount, customer_id)
VALUES ("2023-01-01 00:00:12", 7200, 1),
	   ("2023-11-16 00:00:12", 7200, 1);
       
-- 1
SELECT * FROM Products WHERE category = "laptop" AND price > 1000;
SELECT name FROM Products WHERE stock_quantity = 0;
SELECT * FROM Orders WHERE order_date > CURDATE() - INTERVAL 30 DAY;

-- 2
UPDATE Products SET stock_quantity = 3 WHERE id = 1;

-- 3
DELETE FROM Products WHERE stock_quantity = 0;

-- 17
SELECT * FROM Orders WHERE DAYOFWEEK(order_date) IN (6, 7);

-- 13
SELECT DISTINCT address FROM Customers;
SELECT * FROM Products ORDER BY price DESC;

-- 14
SELECT * FROM Products WHERE name LIKE "%Gaming%";
SELECT full_name FROM Customers WHERE full_name LIKE 'J%';

-- 7
SELECT category, AVG(price) FROM Products GROUP BY category;
SELECT MONTH(order_date) AS month, COUNT(*) AS total_amount FROM Orders GROUP BY MONTH(order_date);

-- 6
SELECT Customers.id as "CustomerId", order_date, total_amount, full_name, address FROM Orders
LEFT JOIN Customers
ON Customers.id = Orders.customer_id;
