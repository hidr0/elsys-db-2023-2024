-- create database
DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

-- create table
DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(255),
    Make VARCHAR(255),
    Year INT,
    Color VARCHAR(255)
);

-- create table
DROP TABLE IF EXISTS Drivers;
CREATE TABLE Drivers (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    License_number VARCHAR(255),
    Experience_years INT
);

-- insert data into table
INSERT INTO Cars (Model, Make, Year, Color)
VALUES 
    ('Model1', 'Make1', 1999, 'Blue'),
    ('Model2', 'Make2', 2005, 'White'),
    ('Model3', 'Make3', 2010, 'Purple'),
    ('Model4', 'Make4', 2008, 'Black'),
    ('Model5', 'Make5', 2023, 'White');

-- insert data into table
INSERT INTO Drivers (Name, License_number, Experience_years)
VALUES
    ('Mecho Mladshi', 'ABC123', 1),
    ('Gusko Guskov', 'DEF456', 8),
    ('Pesho', 'A12345', 5),
    ('Ali Lazarova', 'A98765', 17),
    ('Tom Tom', 'XYZ789', 3);

-- some queries
SELECT * FROM Cars WHERE Year > 2010;
SELECT * FROM Drivers WHERE Experience_years > 5;
SELECT Make, Model FROM Cars WHERE Color = 'Black' OR Color = 'White';	

-- update
UPDATE Drivers SET Experience_years = Experience_years + 1 WHERE Name = 'Pesho';

-- delete
DELETE FROM Cars WHERE Year < 2003;

-- some queries
SELECT * FROM Drivers WHERE experience_years < 2 OR license_number LIKE 'A%';
SELECT model FROM Cars WHERE model LIKE 'A%';
SELECT * FROM Drivers WHERE name LIKE '%John%';
SELECT model FROM Cars WHERE year = (SELECT MAX(year) FROM Cars);
SELECT COUNT(*) FROM Drivers WHERE experience_years > 3;
SELECT AVG(year) AS average_year FROM Cars;
SELECT * FROM Cars WHERE year = (SELECT MIN(year) FROM Cars);

-- order
SELECT * FROM Drivers WHERE name LIKE '%z%' ORDER BY experience_years ASC LIMIT 1;