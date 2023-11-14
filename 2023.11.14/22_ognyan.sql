DROP DATABASE IF EXISTS `CarManagement`;
CREATE DATABASE `CarManagement`;
USE `CarManagement`;

CREATE TABLE Cars (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    model VARCHAR(100),
    make VARCHAR(100),
    year INT,
    color VARCHAR(100)
);
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    license_number VARCHAR(100),
    experience_years INT
);

-- 0.
INSERT INTO Cars (model, make, year, color) VALUES ("Corolla", "Toyota", 2009, "silver");
INSERT INTO Cars (model, make, year, color) VALUES ("Camry", "Toyota", 2019, "white");
INSERT INTO Cars (model, make, year, color) VALUES ("Accord", "Honda", 2003, "black");
INSERT INTO Cars (model, make, year, color) VALUES ("Fiesta", "Ford", 1999, "red");
INSERT INTO Cars (model, make, year, color) VALUES ("Accord", "Honda", 2010, "red");
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("John", "123456789", 5);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Jane", "987654321", 1);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Hazel", "123123123", 6);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Pesho", "A321321321", 1);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Lorenzo", "456456456", 4);

-- 1.
SELECT model FROM Cars WHERE year > 2010;
SELECT name FROM Drivers WHERE experience_years > 5;
SELECT make, model FROM Cars WHERE color = "black" OR color = "white";

-- 2.
UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = "Pesho";

-- 3.
DELETE FROM Cars WHERE YEAR(CURDATE()) - year > 20;

-- 6.
SELECT * FROM Cars WHERE color = "red" OR year > 2015;
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE "A%";
SELECT * FROM Cars WHERE model LIKE "A%";
SELECT * FROM Drivers WHERE name LIKE "%John%";

-- 7.
SELECT * FROM Cars ORDER BY year DESC LIMIT 1;
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;
SELECT AVG(year) FROM Cars;

-- 8.
SELECT * FROM Cars ORDER BY year ASC LIMIT 1;
SELECT * FROM Drivers WHERE name LIKE "%z%" ORDER BY experience_years ASC LIMIT 1;