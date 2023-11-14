DROP DATABASE IF EXISTS CarManagement; 
CREATE DATABASE CarManagement;
USE CarManagement;

CREATE TABLE Cars (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255),
    make VARCHAR(255),
    year INT,
    color VARCHAR(255)
);

CREATE TABLE Drivers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    license_number VARCHAR(255),
    experience_years INT
);

-- 0 INSERT INTO
INSERT INTO Cars (model, make, year, color)
VALUES ('Civic', 'Honda', 2015, 'Black'),
       ('Accord', 'Honda', 2018, 'White'),
       ('CR-V', 'Honda', 2012, 'Red'),
       ('Camry', 'Toyota', 2002, 'Blue'),
       ('F-150', 'Ford', 2020, 'Silver');

INSERT INTO Drivers (name, license_number, experience_years)
VALUES ('John Jones', 'ABC123', 7),
       ('Jane Watson', 'XYZ456', 3),
       ('Pesho', 'DEF789', 6),
       ('Maria Sharapova', 'GHI101', 2),
       ('Zac Efron', 'A123BC', 1);
       
-- 1.
SELECT model FROM Cars WHERE year > 2010;

SELECT name FROM Drivers WHERE experience_years > 5;

SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- 2.
UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

-- 3.
DELETE FROM Cars WHERE year < YEAR(NOW()) - 20;

-- 6.
SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;

SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';

SELECT model FROM Cars WHERE model LIKE 'A%';

SELECT * FROM Drivers WHERE name LIKE '%John%';

-- 7
SELECT model FROM Cars ORDER BY year DESC LIMIT 1;

SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;

SELECT ROUND(AVG(year)) AS average_year FROM Cars;

-- 8.
SELECT * FROM Cars ORDER BY year LIMIT 1;

SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;
