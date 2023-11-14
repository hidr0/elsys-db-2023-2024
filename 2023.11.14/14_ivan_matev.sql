DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement;

USE CarManagement;

CREATE TABLE Cars (
    carID INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(256),
    make VARCHAR(256),
    carYear INT,
    color VARCHAR(256)
);

CREATE TABLE Drivers (
    driverID INT AUTO_INCREMENT PRIMARY KEY,
    driverName VARCHAR(256),
    licenseNumber VARCHAR(256),
    yearsExperience INT
);

-- 0.
INSERT INTO Cars (model, make, carYear, color)
VALUES 
  ('Continental', 'Lincoln', 1970, 'Black'),
  ('Civic', 'Honda', 2012, 'Red'),
  ('Acura', 'Toyota', 2004, 'White'),
  ('E36', 'BMW', 1997, 'Blue'),
  ('CLE', 'Mercedes', 2020, 'Black');

INSERT INTO Drivers (driverName, licenseNumber, yearsExperience)
VALUES
  ('John Doe', 'ABC123', 7),
  ('Jane Smith z', 'XYZ456', 3),
  ('Pesho', 'DEF789', 6),
  ('Maria Johnson', 'GHI012', 2),
  ('Alex Brown', 'A123YZ', 1);
  
-- 1.
SELECT model FROM Cars WHERE carYear > 2010;

SELECT driverName FROM Drivers WHERE yearsExperience > 5;

SELECT make, model FROM Cars WHERE color IN ('Black', 'White');

-- 2.
UPDATE Drivers SET yearsExperience = yearsExperience + 1 WHERE driverName = 'Pesho' LIMIT 1;

-- 3.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Cars WHERE carYear < (YEAR(CURRENT_DATE) - 20);
SET SQL_SAFE_UPDATES = 1;

-- 6. (shoto nqma 4 i 5)
SELECT * FROM Cars WHERE color = 'Red' OR carYear > 2015;

SELECT * FROM Drivers WHERE yearsExperience < 2 OR licenseNumber LIKE 'A%';

SELECT model FROM Cars WHERE model LIKE 'A%';

SELECT * FROM Drivers WHERE driverName LIKE '%John%';

-- 7.
SELECT model FROM Cars ORDER BY carYear DESC LIMIT 1;

SELECT COUNT(*) FROM Drivers WHERE yearsExperience > 3;

SELECT AVG(carYear) AS average_year FROM Cars;

-- 8.
SELECT * FROM Cars ORDER BY carYear
LIMIT 1;

SELECT * FROM Drivers WHERE driverName LIKE '%z%' ORDER BY yearsExperience DESC LIMIT 1;