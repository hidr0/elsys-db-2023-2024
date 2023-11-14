-- Scenario
DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

CREATE TABLE Cars (
    model VARCHAR(255) NOT NULL,
    make VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(255) NOT NULL,
    PRIMARY KEY (model, make)
);

CREATE TABLE Drivers (
    name VARCHAR(255) NOT NULL,
    license_number VARCHAR(20) NOT NULL,
    experience_years INT NOT NULL,
    PRIMARY KEY (license_number)
);

-- 0

INSERT INTO Cars (model, make, year, color)
VALUES ('Y', 'Tesla', 2021, 'White'),
       ('Supra MK4', 'Toyota', 2006, 'White'),
       ('GTR', 'Nissan', 2020, 'Black'),
       ('Golf', 'Volkswagen', 2000, 'Red'),
       ('Civic', 'Honda', 2006, 'Grey');

INSERT INTO Drivers (name, license_number, experience_years)
VALUES ('Emil Kostadinov', 'CB7777PK', 1),
       ('John Aleksandrov', 'CB1100KH', 3),
       ('Pesho', 'CB2897TB', 12),
       ('Panam Davidski', 'A1020KO', 1),
       ('Zuri Ivanov', 'KH3487CE', 5);
       
-- 1

SELECT model FROM Cars WHERE year > 2010;
SELECT name FROM Drivers WHERE experience_years > 5;
SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- 2

UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

-- 3

DELETE FROM Cars WHERE year < YEAR(CURDATE()) - 20; -- CURDATE vzima segashnata godina => ot segashnata godina vadim 20 i poluchavame dali e < ili > ot godinata na pravene

-- 6

SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';
SELECT model FROM Cars WHERE model LIKE 'A%';
SELECT * FROM Drivers WHERE name LIKE '%John%';

-- 7

SELECT make, model FROM Cars WHERE year = (SELECT MAX(year) FROM Cars);
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;
SELECT AVG(year) FROM Cars;

-- 8

SELECT * FROM Cars WHERE year = (SELECT MIN(year) FROM Cars);
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;
