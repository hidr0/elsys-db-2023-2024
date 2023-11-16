-- Create Database "CarManagment"
DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

-- Create Table "Cars"
CREATE TABLE Cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(31),
    make VARCHAR(31),
    year INT,
    color VARCHAR(31)
);

-- Create Table "Drivers"
CREATE TABLE Drivers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(31),
    license_number VARCHAR(31),
    experience_years INT
);


-- ASSIGNMENT TASKS:
-- 0. INSERT INTO Query:
-- Insert 5 cars:
INSERT INTO Cars (model, make, year, color) VALUES ("Accord", "Honda", 2023, "Silver");
INSERT INTO Cars (model, make, year, color) VALUES ("Mustang", "Ford", 1980, "Red");
INSERT INTO Cars (model, make, year, color) VALUES ("Camry", "Toyota", 2000, "Blue");
INSERT INTO Cars (model, make, year, color) VALUES ("Civic", "Honda", 2015, "White");
INSERT INTO Cars (model, make, year, color) VALUES ("Escalade", "Cadillac", 2010, "Black");

-- Insert 5 drivers:
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Hamilton", "ABC123ABC", 13);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Perez", "555555555", 1);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("John Doe", "000000000", 19);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Pesho", "676706767", 10);
INSERT INTO Drivers (name, license_number, experience_years) VALUES ("Janez Doe", "999999999", 4);


-- 1.
-- Retrieve all car models made after the year 2010.
SELECT model FROM Cars WHERE year > 2010;

-- Find the names of drivers who have more than 5 years of experience.
SELECT name FROM Drivers WHERE experience_years > 5;

-- Display the make and model of cars that are either black or white.
SELECT model, make FROM Cars WHERE color LIKE "black" OR color LIKE "white";


-- 2.
-- Update the experience years of a driver with the name 'Pesho' by increasing it by 1 year.
UPDATE Drivers SET experience_years = experience_years + 1 WHERE name = "Pesho";


-- 3.
-- Delete records of cars that are older than 20 years.
DELETE FROM Cars WHERE (YEAR(CURDATE()) - year) > 20;


-- 6.
-- Find all cars that are either red or have been manufactured after 2015.
SELECT * FROM Cars WHERE color = "red" OR year > 2015;

-- List drivers who have either less than 2 years of experience or hold a license number starting with 'A'.
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE "A%";

-- Retrieve all car models whose name starts with 'A'.
SELECT * FROM Cars WHERE model LIKE "A%";

-- Find all drivers whose names contain the substring 'John'.
SELECT * FROM Drivers WHERE name LIKE "%John%";


-- 7.
-- Find the car model with the maximum year (most recent).
SELECT * FROM Cars ORDER BY year DESC LIMIT 1;

-- Count the number of drivers with more than 3 years of experience.
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;

-- Calculate the average year of all the cars (i.e., the average manufacturing year).
SELECT AVG(year) FROM Cars;


-- 8.
-- Retrieve the oldest car in the database.
SELECT * FROM Cars ORDER BY year ASC LIMIT 1;

-- Retrieve the youngers driver who has a "z" in the name in the database.
SELECT * FROM Drivers WHERE name LIKE "%z%" ORDER BY experience_years ASC LIMIT 1;