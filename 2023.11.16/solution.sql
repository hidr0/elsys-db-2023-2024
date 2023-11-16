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
	VALUES("Macbook Pro 8GB", "Very fast laptop", 3200, 42, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 16GB", "Very fast laptop", 3600, 10, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 64GB", "Very fast laptop", 7200, 1, "laptop");
INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Macbook Pro 96GB", "Very fast laptop", 7200, 0, "laptop");

INSERT INTO Products(name, description, price, stock_quantity, category) 
	VALUES("Ipad Air II", "The tablet of tablets", 1000, 1, "tablet");