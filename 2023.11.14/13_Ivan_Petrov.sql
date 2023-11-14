DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

CREATE TABLE IF NOT EXISTS Cars (
    model VARCHAR(50),
    make VARCHAR(50),
    year INT,
    color VARCHAR(50)
);

CREATE TABLE Drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    license_plate VARCHAR(10),
    num_of_exp_years INT
);

INSERT INTO Cars (model, make, year, color) VALUES
('Model1', 'Make1', 2015, 'Black'),
('Model2', 'Make2', 2018, 'White'),
('Model3', 'Make3', 2012, 'Red'),
('Model4', 'Make4', 2005, 'Blue'),
('Model5', 'Make5', 2020, 'White');

INSERT INTO Drivers (name, license_plate, num_of_exp_years) VALUES
('John Doe', 'ABC123', 7),
('Jane Smith', 'XYZ456', 3),
('Pesho', 'DEF789', 6),
('Alice Johnson', 'ABC987', 1),
('Bob Williams', 'XYZ321', 4);

-- 1
SELECT model FROM Cars WHERE year > 2010;
SELECT name FROM Drivers WHERE num_of_exp_years > 5;
SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- 2
UPDATE Drivers SET num_of_exp_years = num_of_exp_years + 1 WHERE name = 'Pesho';

-- 3
DELETE FROM Cars WHERE year < (YEAR(CURDATE()) - 20);

-- 6
SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;
SELECT * FROM Drivers WHERE num_of_exp_years < 2 OR license_plate LIKE 'A%';
SELECT * FROM Drivers WHERE name LIKE '%John%';

-- 7
SELECT model FROM Cars ORDER BY year DESC LIMIT 1;
SELECT COUNT(*) FROM Drivers WHERE num_of_exp_years > 3;
SELECT AVG(year) FROM Cars;

-- 8
SELECT * FROM Cars ORDER BY year ASC LIMIT 1;
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY num_of_exp_years DESC LIMIT 1;
