DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(64),
    age int
);

INSERT INTO Students(name) VALUES("Adam");
INSERT INTO Students(name, age) VALUES("Niki",17);
INSERT INTO Students(name, age) VALUES("Pesho",27);
INSERT INTO Students(name, age) VALUES("Alex",15);
INSERT INTO Students(name, age) VALUES("Marto",18);

SELECT * FROM Students;
SELECT name, age FROM Students;
SELECT age, name FROM Students;
SELECT name, age, age, name FROM Students;


SELECT * FROM Students
WHERE age > 16;

SELECT * FROM Students
WHERE age > 20 OR age < 16
ORDER BY age ASC;

SELECT * FROM Students
WHERE NOT age = 17
ORDER BY age DESC;

SELECT * FROM Students
WHERE age IS NULL;

SELECT * FROM Students
WHERE age IS NOT NULL;


-- Извежда цялата таблица и данните са подредени в низходящ ред на имената
SELECT * FROM Students 
ORDER BY name DESC; 

-- Извежда цялата таблица, където годините са по-големи от 16 или са NULL
SELECT * FROM Students
WHERE age > 16 OR age IS NULL;

-- Извежда цялата таблица, където годините са по-малки или равни на 18 и ги подрежда в възходящ ред
SELECT * FROM Students
WHERE age <= 18
ORDER BY age ASC;