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
	VALUES("Mihail Kirilov", "mkirilov@elsys-bg.org", "TUES");
    
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
	VALUES("2023-11-16 00:00:12", 7200, 1);

-- Retrieve all products in the 'Laptop' category that are priced above $1000.
-- SELECT * FROM Products
-- WHERE category = "laptop" AND price < 1000;


-- Retrieve the names of all products that are out of stock.
-- SELECT name FROM Products 
-- WHERE stock_quantity = 0;


-- List the details of orders placed in the last 30 days.
-- SELECT * FROM Orders
-- WHERE order_date < "2023-10-16";