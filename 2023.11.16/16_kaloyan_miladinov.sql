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


INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 8GB", "Very fast laptop", 960, 42, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 16GB", "Very fast laptop", 3600, 10, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 64GB", "Very fast laptop", 7200, 1, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 96GB", "Very fast laptop", 7200, 0, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Ipad Air II", "The tablet of tablets", 1000, 1, "tablet");
    
INSERT INTO Products(name, description, price, stock_quantity, category)
	VALUES("Gaming Laptop 3000", "Very laptopy, very gamingy", 1600, 20, "laptop");
    
    
CREATE TABLE Customers(
	id int primary key AUTO_INCREMENT,
    full_name varchar(200),
    email varchar(200),
    address varchar(200)
);

INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov 1", "mkirilov@elsys-bg.org", "TUES");
    
    INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov 1", "mkirilov@elsys-bg.org", "TUES");
    
    INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov 2", "mkirilov@elsys-bg.org", "TUES");
    
    INSERT INTO Customers(full_name, email, address)
	VALUES("Mihail Kirilov 2", "mkirilov@elsys-bg.org", "Mladost");
    
    INSERT INTO Customers(full_name, email, address)
    VALUES("Jamaica man", "jamaica@man7.org", "Jamaica");
    
CREATE TABLE Orders(
	id int primary key AUTO_INCREMENT,
    order_date datetime,
    total_amount int,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)	
);

INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-01-01 00:00:12", 7200, 1);
    
    INSERT INTO Orders(order_date, total_amount, customer_id)
	VALUES("2023-11-16 00:00:12", 10000, 4);

-- Update query (2)  Ipad Restocking
UPDATE Products SET stock_quantity = stock_quantity + 10 WHERE id = 5;
 
-- Delete query (3) 
DELETE FROM Products WHERE stock_quantity = 0;

-- Using LIKE for Pattern Matching (14)
SELECT name FROM Products WHERE name LIKE "%Gaming%";
SELECT full_name FROM Customers WHERE full_name LIKE "J%";

-- Aggregate Functions and GROUP BY (7.2) 
SELECT MONTH(order_date) AS month, COUNT(id) AS total_orders FROM Orders GROUP BY month;