DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

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

INSERT INTO Cars (model, make, year, color) VALUES
('Zafira', 'Opel', 2013, 'Grey'),
('Colt', 'Mitsubishi', 2015, 'Red'),
('Passat', 'Volkswagen', 2019, 'Green'),
('Sonata', 'Hunday', 2012, 'Blue'),
('A4', 'Audi', 2007, 'White');

INSERT INTO Drivers (name, license_number, experience_years) VALUES
('Ivan', 'CB2345CH', 6),
('Gogo John', 'CB8659CH', 3),
('Pesho', 'CB1855TX', 7),
('Maria', 'CB2783BB', 2),
('Alekz', 'CB0984XT', 4);

SELECT model FROM Cars WHERE year > 2010;

SELECT name FROM Drivers WHERE experience_years > 5;

SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

DELETE FROM Cars WHERE year < (YEAR(CURDATE()) - 20);

SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;

SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';

SELECT model FROM Cars WHERE model LIKE 'A%';

SELECT * FROM Drivers WHERE name LIKE '%John%';

SELECT model FROM Cars WHERE year = (SELECT MAX(year) FROM Cars);

SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;

SELECT AVG(year) FROM Cars;

SELECT * FROM Cars WHERE year = (SELECT MIN(year) FROM Cars);

SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;
