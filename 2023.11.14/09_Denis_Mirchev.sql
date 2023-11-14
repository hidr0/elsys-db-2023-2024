DROP DATABASE IF EXISTS CarShow;
CREATE DATABASE CarShow;
USE CarShow;

CREATE TABLE Cars (
    model VARCHAR(255),
    make VARCHAR(255),
    year INT,
    color VARCHAR(255)
);

CREATE TABLE Drivers (
    name VARCHAR(255),
    license_number VARCHAR(20),
    experience_years INT
);

-- (0) 
INSERT INTO Cars (model, make, year, color) VALUES
('Car1Model', 'Car1Make', 2012, 'Black'),
('Car2Model', 'Car2Make', 2015, 'White'),
('Car3Model', 'Car3Make', 2018, 'Red'),
('Car4Model', 'Car4Make', 2005, 'Blue'),
('Car5Model', 'Car5Make', 2020, 'White');

INSERT INTO Drivers (name, license_number, experience_years) VALUES
('John', 'A12345', 7),
('Pesho', 'B67890', 4),
('Maria', 'C54321', 6),
('Alex', 'A98765', 2),
('Sophia', 'D87654', 8);

-- (1)
SELECT model FROM Cars WHERE year > 2010;
SELECT name FROM Drivers WHERE experience_years > 5;
SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- (2)
UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

-- (3)
DELETE FROM Cars WHERE year < (YEAR(CURDATE()) - 20);

-- (6)
SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';
SELECT model FROM Cars WHERE model LIKE 'A%';
SELECT * FROM Drivers WHERE name LIKE '%John%';

-- (7)
SELECT model FROM Cars ORDER BY year DESC LIMIT 1;
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;
SELECT AVG(year) FROM Cars;

-- (8)
SELECT * FROM Cars ORDER BY year ASC LIMIT 1;
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;