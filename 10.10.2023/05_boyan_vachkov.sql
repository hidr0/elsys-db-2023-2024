DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(64),
    age int
);

INSERT INTO Students(name) VALUES("mishobezgodini");
INSERT INTO Students(name, age) VALUES("misho", 26);
INSERT INTO Students(name, age) VALUES("Gosho", 20);
INSERT INTO Students(name, age) VALUES("pesho", 18);
INSERT INTO Students(name, age) VALUES("sho", 26);

SELECT * FROM Students;
SELECT name, age FROM Students;
SELECT name, age, name FROM Students;
SELECT name, age, age, age FROM Students;

-- select the columns which ages are greater than 18 and the order the names and ages in an ascending order
SELECT * FROM Students
WHERE (age > 18)
ORDER BY age AND name ASC;

-- select and order the columns which are not empty.
SELECT * FROM Students
WHERE (NOT (age = NULL), NOT(name = NULL))
ORDER BY age AND name ASC;

-- select any column which has the name - Gosho
SELECT * FROM Students
WHERE (name = "Gosho");










