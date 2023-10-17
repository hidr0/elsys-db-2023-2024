-- Създаване на база данни, ако няма така (1)
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;


-- Създаване на двете таблици, ако не съществуват (2)
CREATE TABLE IF NOT EXISTS Students(
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	FirstName varchar(31),
    LastName varchar(31),
    DOB DATE,
    Address varchar(63)
);

CREATE TABLE IF NOT EXISTS Courses(
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name varchar(31),
    Description varchar(63)
);


-- Добавяне на данни в таблиците (3)
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES
("Boris", "Johnson", "2000-12-12", "123 Elm Street"),
("John", "Johnson", "2004-4-7", "123 Elm Street"),
("John", "Stalin", "1800-5-26", "ADDRESS #3"),
("Jane", "Doe", "1998-1-8", NULL),
("Michelangelo", "Buonarroti", "1475-3-6", NULL);

INSERT INTO Courses(Name, Description) VALUES
("Mathematics", "Linear Algebra"),
("History", "Middle Age History"),
("Physical Education", "Sports");


-- Извличане на данни от таблците (4)
SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'John' AND DOB >= '2000-1-1';
SELECT * FROM Courses WHERE Name = 'Mathematics' OR Name = 'History';
SELECT * FROM Students WHERE Address IS NULL;


-- Обновявне на данни то таблиците (5)
UPDATE Students SET Address = '456 Oak Avenue'
WHERE ID = 3;

UPDATE Courses SET Description = 'An introduction to basic algebra and geometry'
WHERE Name = 'Mathematics';


-- Изтриване на данни от таблиците (6)
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';
DELETE FROM Courses WHERE Name = 'Physical Education';


-- Бонус задача (7)
ALTER TABLE Students ADD Email varchar(63);

UPDATE Students SET Email = 'very.cool.e-mail@abv.bg'
WHERE ID = 1 OR ID = 2;


-- Проверка на таблиците, за да сме сигурни, че работи
SELECT * FROM Students;
SELECT * FROM Courses;