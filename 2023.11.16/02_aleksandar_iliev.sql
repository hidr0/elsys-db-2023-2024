DROP DATABASE IF EXISTS ComputerStore;
CREATE DATABASE ComputerStore;
USE ComputerStore;

CREATE TABLE Products(
    product_id INT AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    price INT,
    stock_quantity INT,
    category ENUM("laptop", "desktop", "tablet"),
    PRIMARY KEY (product_id)
);
CREATE TABLE Customers(
    customer_id INT AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    PRIMARY KEY (customer_id)
);

CREATE TABLE Orders(
    order_id INT AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    PRIMARY KEY (order_id)
);

CREATE TABLE OrderDetails(
    order_id INT,
    product_id INT,
    quantity INT,
    price INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- filler data
INSERT INTO Products(name, description, price, stock_quantity, category)
    VALUES
    ("Macbook1", "Very fast", 699, 13, "laptop"),
    ("Macbook2", "Very fast", 699, 13, "laptop"),
    ("Macbook3", "Very fast", 699, 0, "laptop"),
    ("Macbook4", "Very fast", 1799, 13, "laptop"),
    ("MacGamingbook5", "Very fast", 699, 1, "laptop");

INSERT INTO Customers(full_name, email, address)
    VALUES 
    ("Joe Biden", "joe@biden.usa", "your walls");

-- insert a new order
INSERT INTO OrderDetails(customer_id, order_date, total_amount) 
    VALUES
    (0, "2020-09-11", 699);

INSERT INTO Orders(order_id, product_id, quanitity, price) 
    VALUES
    (0, 1, 7, 7 * 699);

-- selecting stuff
SELECT * FROM Products WHERE price > 1000 AND category = "laptop";

SELECT name FROM Products WHERE stock_quantity = 0;

SELECT * FROM Orders WHERE order_date < "2023-10-16"; -- 30 days thing

-- update query
UPDATE Products
    SET stock_quantity = 100
    WHERE name = "Macbook4";

-- delete
DELETE FROM Products WHERE stock_quantity = 0;

-- weekend
SELECT * FROM Orders WHERE DAYOFWEEK(order_date) IN (1,7);

-- distinct and order by
SELECT DISTINCT address FROM Customers;

SELECT * FROM Products
ORDER BY price DESC
LIMIT 10;

-- like
SELECT name FROM Products
WHERE name LIKE "%Gaming%";

SELECT full_name FROM Customers
WHERE full_name LIKE "J%";
