DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;


CREATE TABLE Students(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200),
    age int
);

INSERT INTO Students(name) VALUES("Iva bez godini");
INSERT INTO Students(name, age) VALUES("Iva", 17);

INSERT INTO Students(name, age) VALUES("Ali", 22);
INSERT INTO Students(name, age) VALUES("Tomi", 25);
INSERT INTO Students(name, age) VALUES("Denis", 8);

SELECT * FROM Students
WHERE NOT (age = 22)
ORDER BY age ASC;

SELECT * FROM Students
WHERE NOT (age = 22)
ORDER BY age DESC;

SELECT * FROM Students
WHERE age IS NOT NULL;

SELECT * FROM Students
WHERE age IS NULL;

-- Printing all students not named Iva
SELECT * FROM Students
WHERE name != "Iva";

-- Printing all students of legal age
SELECT * FROM Students
WHERE age > 18;

-- Printing all students with id > 2
SELECT * FROM Students
WHERE id > 2;

-- Printing all students with an id that's an even number
SELECT * FROM Students
WHERE (id % 2) = 0;