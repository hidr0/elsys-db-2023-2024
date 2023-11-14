DROP DATABASE IF EXISTS CarManagement;
CREATE DATABASE CarManagement; 
USE CarManagement;

CREATE TABLE Cars(
	id int PRIMARY KEY AUTO_INCREMENT,
    model varchar(50),
    make varchar(50),
    year int, 
    color varchar(30)
);

CREATE TABLE Drivers(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(50),
    license_number varchar(50), 
    experience_years int
);

INSERT INTO Cars(model,make,year,color) 
VALUES("A", "Mercedes",1989,"red"),
	  ("B", "Mercedes",2011,"white"),
	  ("C", "Audi",2002,"black"),
	  ("D", "BMW",2021,"green"),
	  ("A", "Alfa Romeo",1923,"red");
      
INSERT INTO Drivers(name,license_number,experience_years) 
VALUES("Johnathan", "A19449",3),
	  ("Pesho","B24011",5),
	  ("Gosho", "A982",25),
	  ("Doncho", "29821",6),
      ("Bozhko", "23451",8),
      ("Bozhan", "9876",2),
	  ("Johan", "40123",2);
-- 1
SELECT model FROM Cars WHERE year>2010;
SELECT name FROM Drivers WHERE experience_years>5;
SELECT make,model FROM Cars WHERE color="white" OR color="black";

-- 2
UPDATE Drivers
SET experience_years = experience_years+1
WHERE name = "Pesho";

-- 3
DELETE FROM Cars WHERE 2023-year>20;

-- 6
SELECT * FROM Cars WHERE color="red" OR year>2015;
SELECT * FROM Drivers WHERE experience_years<2 OR license_number LIKE "A%";
SELECT * FROM Cars WHERE model LIKE "A%";
SELECT * FROM Drivers WHERE name LIKE "John%";

-- 7
SELECT * FROM Cars ORDER BY year DESC LIMIT 1;
SELECT COUNT(*) FROM Drivers WHERE experience_years>3;
SELECT AVG(year) FROM Cars;

-- 8
SELECT * FROM Cars ORDER BY year ASC LIMIT 1;
SELECT * FROM Drivers WHERE name LIKE "%z%" ORDER BY experience_years ASC LIMIT 1 ;

