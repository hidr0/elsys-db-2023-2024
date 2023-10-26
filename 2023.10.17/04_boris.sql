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

-- Оценка и обратна връзка

-- Нека да прегледаме предоставеното решение стъпка по стъпка:

-- Създаване на база данни:
-- Изтрива SchoolDB базата данни, ако съществува, след което я създава отново и я използва за следващите операции. ✔️
-- Създаване на таблици:
-- Таблиците Students и Courses се създават с подходящи полета. Използването на ключовата дума IF NOT EXISTS е добра практика, за да се предотврати грешка, ако таблицата вече съществува. ✔️
-- Добавяне на данни:
-- Пет студентски записа и три курсови записа се добавят правилно в съответните таблици. ✔️
-- Извличане на данни:
-- Правилно извлича студентите, живеещи на адрес "123 Elm Street". ✔️
-- Извлича студентите на име "John", родени след 2000 година. ✔️
-- Правилно извлича курсовете "Mathematics" и "History". ✔️
-- Правилно извлича студентите без адрес. ✔️
-- Обновяване на данни:
-- Адресът на студента с ID = 3 се обновява правилно. ✔️
-- Описанието на курса по "Mathematics" се обновява правилно. ✔️
-- Изтриване на данни:
-- Студентката на име "Jane Doe" правилно се изтрива от базата данни. ✔️
-- Курсът по "Physical Education" също се изтрива правилно. ✔️
-- Бонус задача:
-- Добавяне на колона Email към таблицата Students. ✔️
-- Правилно обновление на имейлите на студентите с ID = 1 и ID = 2. ✔️
-- Обобщение:

-- Решението е изчерпателно, ясно и отговаря на изискванията на задачата.

-- Оценка: 100/100

-- Много добре свършена работа!
