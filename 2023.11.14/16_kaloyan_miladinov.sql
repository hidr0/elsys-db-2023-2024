DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

CREATE TABLE Cars(
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	model VARCHAR(255),
	make VARCHAR(255),
	year INT,
	color VARCHAR(255)
);

CREATE TABLE Drivers( 
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
	name VARCHAR(255),
	license_number VARCHAR(255),
	experience_years INT
);

-- Cars table inserting
INSERT INTO Cars (model, make, year, color) VALUES
('Civic', 'Honda', 2005, 'Blue'),
('Camry', 'Toyota', 2021, 'Silver'),
('Mustang', 'Ford', 2014, 'Red'),
('Accord', 'Honda', 2019, 'White'),
('Cruze', 'Chevrolet', 2023, 'Black');

-- Drivers table inserting
INSERT INTO Drivers (name, license_number, experience_years) VALUES
('Gosho', 'ABC123', 6),
('Pesho', 'DEF456', 3),
('George Johnson', 'GHI789', 8),
('Tosho', 'JKL012', 2),
('John', 'MNO345', 5);

-- Task 1
SELECT model FROM Cars WHERE year > 2010;
SELECT name FROM Drivers WHERE experience_years > 5;
SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- Task 2
UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

-- Task 3
DELETE FROM Cars WHERE (YEAR(CURDATE()) - year) > 20;

-- Task 6
SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';
SELECT model FROM Cars WHERE model LIKE 'A%';
SELECT * FROM Drivers WHERE name LIKE '%John%';

-- Task 7
SELECT model FROM Cars ORDER BY year DESC LIMIT 1;
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;
SELECT AVG(year) FROM Cars;

-- Task 8
SELECT * FROM Cars ORDER BY year ASC LIMIT 1;
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;
