DROP DATABASE IF EXISTS Car_manager;
CREATE DATABASE Car_manager;
USE Car_manager;

CREATE TABLE Cars (
    model VARCHAR(40),
    make VARCHAR(40),
    year INT,
    color VARCHAR(40)
);

CREATE TABLE Drivers (
    name VARCHAR(40),
    license_number VARCHAR(20),
    experience_years INT
);

INSERT INTO Cars (model, make, year, color) VALUES
('W222 - S class', 'Mercedes', 2015, 'Grey'),
('M8 Coupe F92', 'BMW', 2019, 'White'),
('Audi S8', 'Audi', 2020, 'Green'),
('Panamera Turbo S', 'Porsche', 2012, 'Black'),
('Koenigsegg Agera', 'Koenigsegg', 2018, 'Red');

INSERT INTO Drivers (name, license_number, experience_years) VALUES
('Stoyan Stoyanov', 'A12345', 10),
('Stefan Georgiev', 'B67890', 3),
('Georgi Milev', 'C54321', 10),
('Boyan Vachkov', 'A98765', 6),
('Nikolay Mutavchiev', 'D87654', 1);

SELECT model
FROM Cars
WHERE year > 2010;

SELECT name
FROM Drivers
WHERE experience_years > 5;

SELECT make, model
FROM Cars
WHERE color IN ('Black', 'White');

UPDATE Drivers
SET experience_years = experience_years + 1
WHERE name = 'Pesho';

DELETE FROM Cars
WHERE year < YEAR(CURDATE()) - 20;

SELECT *
FROM Cars
WHERE color = 'Red' OR year > 2015;

SELECT *
FROM Drivers
WHERE experience_years < 2 OR license_number LIKE 'A%';

SELECT model
FROM Cars
WHERE model LIKE 'A%';

SELECT *
FROM Drivers
WHERE name LIKE '%John%';

SELECT model
FROM Cars
WHERE year = (SELECT MAX(year) FROM Cars);

SELECT COUNT(*)
FROM Drivers
WHERE experience_years > 3;

SELECT AVG(year) AS average_year
FROM Cars;

SELECT *
FROM Cars
ORDER BY year
LIMIT 1;

SELECT *
FROM Drivers
WHERE name LIKE '%z%'
ORDER BY experience_years DESC
LIMIT 1;
