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

-- Insert products
INSERT INTO Products(name, description, price, stock_quantity, category) 
VALUES  ("Macbook Pro 8GB", "Very fast laptop", 960, 42, "laptop"),
		("Macbook Pro 16GB", "Very fast laptop", 3600, 10, "laptop"),
		("Macbook Pro 64GB", "Very fast laptop", 7200, 0, "laptop"),
        ("Asus TUF Gaming F17", "Fastest laptop", 3400, 4, "laptop"),
        ("Ipad Air II", "The tablet of tablets", 1000, 1, "tablet");
    
CREATE TABLE Customers(
	id int primary key AUTO_INCREMENT,
    full_name varchar(200),
    email varchar(200),
    address varchar(200)
);

-- Insert customers
INSERT INTO Customers(full_name, email, address)
VALUES  ("Mihail Kirilov", "mkirilov@elsys-bg.org", "TUES"),
		("Mihail Kirilov 2.0", "mkirilov2@elsys-bg.org", "TUES"),
        ("Mihail Kirilov 3.0", "mkirilov3@elsys-bg.org", "Mladost"),
		("Jack Lantern", "jackLan@elsys-bg.org", "Lulin 2");

CREATE TABLE Orders(
	id int primary key AUTO_INCREMENT,
    order_date datetime,
    total_amount int,
    customer_id int,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)	
);

-- Insert orders
INSERT INTO Orders(order_date, total_amount, customer_id)
VALUES ("2023-01-01 00:00:12", 7200, 1),
	   ("2023-11-16 00:00:12", 7200, 1);

-- Retrieve all products in the 'Laptop' category that are priced above $1000.
SELECT * FROM Products WHERE category = "laptop" AND price < 1000;

-- Retrieve the names of all products that are out of stock.
SELECT name FROM Products  WHERE stock_quantity = 0;

-- List the details of orders placed in the last 30 days.
SELECT * FROM Orders WHERE order_date > CURDATE() - interval 30 day;

-- Update the stock quantity of a specific product after a new shipment arrives.
UPDATE Products SET stock_quantity = 3 WHERE id = 1;

-- Delete all products that have been discontinued and are no longer in stock.
DELETE FROM Products WHERE stock_quantity = 0;

-- List all orders placed on weekends.
SELECT * FROM Orders WHERE DAYOFWEEK(order_date) IN (1, 7);

-- Display a list of unique customer addresses.
SELECT DISTINCT address, full_name from Customers;

-- List the top 3 most expensive products, sorted by price in descending order.
SELECT * FROM Products ORDER BY price DESC LIMIT 3;

-- Select product names that contain the word 'Gaming'.
SELECT name FROM Products WHERE name LIKE '%Gaming%';

-- Find customer names that start with the letter 'J'.
SELECT full_name FROM Customers WHERE full_name LIKE 'J%';