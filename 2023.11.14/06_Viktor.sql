-- Database Scenario
DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;
USE CarManagement;

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars (
    CarID INT AUTO_INCREMENT PRIMARY KEY,
    Model VARCHAR(255),
    Make VARCHAR(255),
    Year INT,
    Color VARCHAR(255)
);

DROP TABLE IF EXISTS Drivers;
CREATE TABLE Drivers (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    LicenseNumber VARCHAR(255) NOT NULL,
    ExperienceYears INT 
);

-- 0
INSERT INTO Cars (Model, Make, Year, Color)
VALUES 
    ('Golf 1', 'Volkswagen', 1999, 'Black'),
    ('Golf 3', 'Volkswagen', 2005, 'Grey'),
    ('Kona', 'Hiunday', 2022, 'Blue'),
    ('Passat', 'Volkswagen', 2008, 'Red'),
    ('Model S', 'Tesla', 2023, 'Green');
    
INSERT INTO Drivers (Name, LicenseNumber, ExperienceYears)
VALUES 
    ('Ronaldo', 'CB7777CP', 22),
    ('Ivan I', 'CB1111OH', 1),
    ('Ivan V', 'CB5555II', 11),
    ('Bartholomeu I', 'CB6412BB', 40),
    ('Pesho', 'CB7810MH', 9);
    
-- 1
SELECT * FROM Cars WHERE Year > 2010;
SELECT * FROM Drivers WHERE ExperienceYears > 5;
SELECT Make, Model FROM Cars WHERE Color = 'Black' OR Color = 'White';	

-- 2
UPDATE Drivers SET ExperienceYears = ExperienceYears + 1 WHERE Name = 'Pesho';

-- 3
DELETE FROM Cars WHERE Year < 2003;

-- 6
SELECT * FROM Cars WHERE Color = 'Red' OR Year > 2015;
SELECT * FROM Drivers WHERE ExperienceYears < 2 OR LicenseNumber LIKE 'A%';
SELECT Model FROM Cars WHERE Model LIKE 'A%';
SELECT * FROM Drivers WHERE Name LIKE '%John%';

-- 7
SELECT Model FROM Cars ORDER BY Year DESC LIMIT 1;
SELECT COUNT(*) FROM Drivers WHERE ExperienceYears > 3;
SELECT ROUND(AVG(Year)) AS AverageYear FROM Cars;

-- 8
SELECT * FROM Cars ORDER BY Year LIMIT 1;
SELECT * FROM Drivers WHERE Name LIKE '%z%' ORDER BY ExperienceYears LIMIT 1;