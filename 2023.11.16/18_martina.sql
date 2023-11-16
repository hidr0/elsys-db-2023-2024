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
    
    
CREATE TABLE Customers(
	id int primary key AUTO_INCREMENT,
    full_name varchar(200),
    email varchar(200),
    address varchar(200)
);

INSERT INTO Customers(full_name, email, address)
	VALUES("pesho petrov", "ppetrov@elsys-bg.org", "TUES");
    
    INSERT INTO Customers(full_name, email, address)
	VALUES("pesho grigorov", "pgrigorov@elsys-bg.org", "TUES");
    
    INSERT INTO Customers(full_name, email, address)
	VALUES("grisho ivailov", "givailov@elsys-bg.org", "TUES");
    
    INSERT INTO Customers(full_name, email, address)
	VALUES("gosho petrov", "gpetrov@elsys-bg.org", "Mladost");
    
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
	VALUES("2023-11-16 00:00:47", 10000, 4);

-- Retrieve all products in the 'Laptop' category that are priced above $1000.
SELECT * FROM Products WHERE category = "laptop" AND price < 1000;

-- Retrieve the names of all products that are out of stock.
SELECT name FROM Products WHERE stock_quantity = 0;

-- List the details of orders placed in the last 30 days.
SELECT * FROM Orders WHERE order_date < "2023-10-16";
SELECT * FROM Orders WHERE order_date > CURDATE() - interval 30 day;

-- Update the stock quantity of a specific product after a new shipment arrives.
update Products set stock_quantity = 15 where name = "Macbook Pro 96GB";

-- Delete all products that have been discontinued and are no longer in stock.
delete from Products where stock_quantity = 0;

-- Select product names that contain the word 'Gaming'.
select * from Products where name like "%Macbook%";

-- Find customer names that start with the letter 'J'.
select * from Customers where full_name like "%p%";

SELECT * FROM Orders WHERE DAYOFWEEK(order_date) IN (1,7);

-- Display a list of unique customer addresses.
SELECT DISTINCT address, full_name from Customers;

-- List the top 3 most expensive products, sorted by price in descending order.
SELECT * FROM Products ORDER BY price asc LIMIT 3;

-- Determine the average price of products in each category.
SELECT SUM(price), category FROM Products GROUP BY category;

SELECT * FROM Customers;
SELECT * FROM Orders;

-- Как да извадим кой човек е нарпавил коя поръчка.
SELECT Customers.id as "CustomerId", order_date, total_amount, full_name, address FROM Orders
LEFT JOIN Customers ON Customers.id = Orders.customer_id;