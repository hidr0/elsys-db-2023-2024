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


INSERT INTO Cars (model, make, year, color)
VALUES
('Civic', 'Honda', 2012, 'Blue'),
('Camry', 'Toyota', 2015, 'White'),
('Mustang', 'Ford', 2018, 'Red'),
('Accord', 'Honda', 2013, 'Black'),
('Fusion', 'Ford', 2017, 'Silver');

-- Insert 5 drivers
INSERT INTO Drivers (name, license_number, experience_years)
VALUES
('John Doe', 'ABC123', 6),
('Jane Smith', 'XYZ456', 4),
('Pesho', 'DEF789', 8),
('Alice Johnson', 'ABC789', 2),
('Bob Thompson', 'XYZ123', 3);

-- 1
SELECT model
FROM Cars
WHERE year > 2010;

-- 1
SELECT name
FROM Drivers
WHERE experience_years > 5;

-- 1
SELECT make, model
FROM Cars
WHERE color IN ('Black', 'White');

-- 2
UPDATE Drivers
SET experience_years = experience_years + 1
WHERE name = 'Pesho';

-- 3
DELETE FROM Cars
WHERE year < (YEAR(CURDATE()) - 20);

-- 6
SELECT *
FROM Cars
WHERE color = 'Red' OR year > 2015;

-- 6
SELECT *
FROM Drivers
WHERE experience_years < 2 OR license_number LIKE 'A%';

-- 6
SELECT model
FROM Cars
WHERE model LIKE 'A%';

-- 6
SELECT *
FROM Drivers
WHERE name LIKE '%John%';

-- 7
SELECT model
FROM Cars
WHERE year = (SELECT MAX(year) FROM Cars);

-- 7
SELECT COUNT(*)
FROM Drivers
WHERE experience_years > 3;

-- 7
SELECT AVG(year) AS average_year
FROM Cars;

-- 8
SELECT *
FROM Cars
ORDER BY year
LIMIT 1;

-- 8
SELECT *
FROM Drivers
WHERE name LIKE '%z%'
ORDER BY experience_years DESC
LIMIT 1;
