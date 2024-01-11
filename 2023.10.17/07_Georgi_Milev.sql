INSERT INTO Cars (model, make, year, color) VALUES
('Corolla', 'Toyota', 2012, 'Black'),
('Civic', 'Honda', 2015, 'White'),
('Mustang', 'Ford', 2020, 'Red'),
('M5', 'Bmw', 2006, 'Blue'),
('s600', 'Mercedes', 1997, 'Black');

INSERT INTO Drivers (name, license_number, experience_years) VALUES
('John Smith', 'ABC123', 6),
('Alice Johnson', 'DEF456', 3),
('Pesho', 'GHI789', 7),
('Mary Brown', 'JKL012', 2),
('Bob Miller', 'MNO345', 4);

SELECT model FROM Cars WHERE year > 2010;

SELECT name FROM Drivers WHERE experience_years > 5;

SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

DELETE FROM Cars WHERE year < YEAR(CURDATE()) - 20;

SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';
SELECT model FROM Cars WHERE model LIKE 'A%';
SELECT * FROM Drivers WHERE name LIKE '%John%';

SELECT model FROM Cars WHERE year = (SELECT MAX(year) FROM Cars);

SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;

SELECT AVG(year) FROM Cars;

SELECT * FROM Cars ORDER BY year ASC LIMIT 1;
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;
