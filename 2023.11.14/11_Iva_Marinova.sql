DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

CREATE TABLE IF NOT EXISTS Cars (
    model VARCHAR(255),
    make VARCHAR(255),
    year INT,
    color VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Drivers (
    name VARCHAR(255),
    license_number VARCHAR(255),
    experience_years INT
);

INSERT INTO Cars (model, make, year, color) VALUES
('Super', 'metal', 2000, 'Black'),
('Ultra', 'metal', 1990, 'White'),
('Turbo', 'wood', 2015, 'Yellow'),
('Extra', 'not metal', 2010, 'Blue'),
('Model', 'paper', 2023, 'Red');

INSERT INTO Drivers (name, license_number, experience_years) VALUES
('Iva', 'AB1222BA', 17),
('Max', 'BC1542BA', 6),
('John', 'AB1222HA', 4),
('Zarka', 'CJ1298BA', 1),
('Pesho', 'AB0922HA', 2);

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
WHERE year < (YEAR(CURDATE()) - 20);

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

SELECT *
FROM Cars
ORDER BY year DESC LIMIT 1;

SELECT COUNT(*)
FROM Drivers
WHERE experience_years > 3;

SELECT AVG(year) AS average_year
FROM Cars;

SELECT *
FROM Cars
ORDER BY year ASC LIMIT 1;

SELECT *
FROM Drivers
WHERE name LIKE '%z%'
ORDER BY experience_years DESC
LIMIT 1;
