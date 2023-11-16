DROP DATABASE IF EXISTS CarManagment;
CREATE DATABASE CarManagment;
USE CarManagment;

CREATE TABLE Cars(
	id INT AUTO_INCREMENT PRIMARY KEY,
	model VARCHAR(256),
    make VARCHAR(256),
    year INT,
    color VARCHAR(256)
);

CREATE TABLE Drivers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256),
    license_number VARCHAR(256),
    experience_years INT
);

INSERT INTO Cars(model, make, year, color)
VALUES ("XC40", "Volvo", 2019, "white");
INSERT INTO Cars(model, make, year, color)
VALUES ("CX-3", "Mazda", 2021, "blue");
INSERT INTO Cars(model, make, year, color)
VALUES ("SX4", "Suzuki", 2017, "gray");
INSERT INTO Cars(model, make, year, color)
VALUES ("Explorer", "Ford", 1991, "red");
INSERT INTO Cars(model, make, year, color)
VALUES ("X7", "BMW", 2018, "black");

INSERT INTO Drivers(name, license_number, experience_years)
VALUES ("Sarah Johnson", "X987-ABCD", 8);
INSERT INTO Drivers(name, license_number, experience_years)
VALUES ("James Rodriguez", "Y654-EFGH", 5);
INSERT INTO Drivers(name, license_number, experience_years)
VALUES ("John Smith", "Z321-IJKL", 3);
INSERT INTO Drivers(name, license_number, experience_years)
VALUES ("Michael Wang", "W876-MNOP", 6);
INSERT INTO Drivers(name, license_number, experience_years)
VALUES ("Pesho Perkovz", "V543-QRST", 1);

SELECT * FROM Cars
WHERE year > 2010;

SELECT * FROM Drivers
WHERE experience_years > 5;

SELECT * FROM Cars
WHERE color IN("black", "white");

SET SQL_SAFE_UPDATES = 0;
UPDATE Drivers
SET experience_years = experience_years + 1
WHERE name = "Pesho";

DELETE FROM Cars
WHERE 2023 - year > 20;

SELECT * FROM Cars
WHERE color = "red" OR year > 2015;

SELECT * FROM Drivers
WHERE experience_years < 2 OR license_number LIKE ("A%");

DELETE FROM Cars
WHERE model LIKE ("A%");

SELECT * FROM Drivers
WHERE name LIKE ("John%d");

SELECT MAX(year)
FROM Cars;

SELECT COUNT(*) FROM Drivers
WHERE experience_years > 3;

SELECT AVG(year)
FROM Cars;

DELETE FROM Cars
ORDER BY year ASC LIMIT 1;

DELETE FROM Drivers
WHERE name LIKE ("%z")
ORDER BY experience_years ASC LIMIT 1;



