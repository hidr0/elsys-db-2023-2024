DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

CREATE TABLE Cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255),
    make VARCHAR(255),
    year INT,
    color VARCHAR(255)
);

CREATE TABLE Drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    license_number VARCHAR(255),
    experience_years INT
);

INSERT INTO Cars (model, make, year, color) VALUES
('Civic', 'Honda', 2015, 'Black'),
('Camry', 'Toyota', 2002, 'White'),
('Phantom', 'Rolls-Royce', 2017, 'Silver'),
('AModel T', 'Ford', 1925, 'Red'),
('Mustang', 'Ford', 2022, 'White');

INSERT INTO Drivers (name, license_number, experience_years) VALUES
('Aliz', '123ABC00', 0),
('Deniz John', '987MNB11', 3),
('Iva', 'A278QAZ9', 1),
('Kolio', '592RFV88', 20),
('Pesho', '167ZJK66', 9);

SELECT model FROM Cars
WHERE year > 2010;

SELECT name FROM Drivers 
WHERE experience_years > 5;

SELECT make, model FROM Cars 
WHERE color IN ('Black', 'White');

UPDATE Drivers SET experience_years = experience_years + 1 
WHERE name = 'Pesho';

DELETE FROM Cars 
WHERE year < YEAR(NOW()) - 20;

SELECT * FROM Cars 
WHERE color = 'Red' OR year > 2015;

SELECT * FROM Drivers 
WHERE experience_years < 2 OR license_number LIKE 'A%';

SELECT model FROM Cars 
WHERE model LIKE 'A%';

SELECT * FROM Drivers 
WHERE name LIKE '%John%';

SELECT model FROM Cars 
WHERE year = (SELECT MAX(year) FROM Cars);

SELECT COUNT(*) FROM Drivers 
WHERE experience_years > 3;

SELECT AVG(year) FROM Cars;

SELECT * FROM Cars 
WHERE year = (SELECT MIN(year) FROM Cars);

SELECT * FROM Drivers 
WHERE name LIKE '%z%' 
ORDER BY experience_years 
DESC LIMIT 1;