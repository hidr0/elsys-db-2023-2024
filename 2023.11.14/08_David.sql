-- Task 0: Insert 5 cars and 5 drivers
INSERT INTO Cars (model, make, year, color)
VALUES
  ('Civic', 'Honda', 2012, 'Blue'),
  ('Camry', 'Toyota', 2015, 'White'),
  ('Mustang', 'Ford', 2018, 'Red'),
  ('Accord', 'Honda', 2010, 'Black'),
  ('F-150', 'Ford', 2020, 'Silver');

INSERT INTO Drivers (name, license_number, experience_years)
VALUES
  ('John Doe', 'ABC123', 7),
  ('Alice Smith', 'XYZ789', 4),
  ('Bob Johnson', 'DEF456', 10),
  ('Pesho', 'GHI789', 3),
  ('Maria Rodriguez', 'JKL012', 6);

-- Task 1: Retrieve all car models made after the year 2010
SELECT model FROM Cars WHERE year > 2010;

-- Find the names of drivers who have more than 5 years of experience
SELECT name FROM Drivers WHERE experience_years > 5;

-- Display the make and model of cars that are either black or white
SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- Task 2: Update the experience years of a driver with the name 'Pesho' by increasing it by 1 year
UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = 'Pesho';

-- Task 3: Delete records of cars that are older than 20 years
DELETE FROM Cars WHERE year < YEAR(CURDATE()) - 20;

-- Task 6: Find all cars that are either red or have been manufactured after 2015
SELECT * FROM Cars WHERE color = 'Red' OR year > 2015;

-- List drivers who have either less than 2 years of experience or hold a license number starting with 'A'
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';

-- Retrieve all car models whose name starts with 'A'
SELECT model FROM Cars WHERE model LIKE 'A%';

-- Find all drivers whose names contain the substring 'John'
SELECT * FROM Drivers WHERE name LIKE '%John%';

-- Task 7: Find the car model with the maximum year (most recent)
SELECT model FROM Cars WHERE year = (SELECT MAX(year) FROM Cars);

-- Count the number of drivers with more than 3 years of experience
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;

-- Calculate the average year of all the cars (i.e., the average manufacturing year)
SELECT AVG(year) FROM Cars;

-- Task 8: Retrieve the oldest car in the database
SELECT * FROM Cars WHERE year = (SELECT MIN(year) FROM Cars);

-- Retrieve the youngest driver who has a "z" in the name in the database
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years DESC LIMIT 1;
