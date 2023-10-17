-- Създаване на базата данни
CREATE DATABASE SchoolDB;

-- Използване на базата данни
USE SchoolDB;

-- Създаване на таблицата "Students"
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100),
);

-- Създаване на таблицата "Courses"
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription TEXT
);

-- Вмъкване на данни в таблицата "Students"
INSERT INTO Students (FirstName, LastName, DOB, Address, Email) VALUES
('John', 'Doe', '2001-05-15', '123 Elm Street'),
('Jane', 'Smith', '1999-08-10', '123 Elm Street'),
('Michael', 'Johnson', '2002-03-20', '456 Oak Avenue'),
('Sarah', 'Williams', '2000-12-05', NULL),
('John', 'Brown', '2003-02-18', '789 Maple Drive');

-- Вмъкване на данни в таблицата "Courses"
INSERT INTO Courses (CourseName, CourseDescription) VALUES
('Mathematics', 'An introduction to basic algebra and geometry.'),
('History', 'A survey of world history events.'),
('Chemistry', 'Fundamental principles of chemistry.');

-- Извличане на студентите, които живеят на "123 Elm Street"
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- Извличане на студентите на име "John", родени след 2000 година
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

-- Извличане на курсовете "Mathematics" или "History"
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- Извличане на студентите с адрес NULL
SELECT * FROM Students WHERE Address IS NULL;

-- Обновяване на адреса на студента с ID = 3
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Изтриване на студент с име "Jane Doe"
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Smith';

-- Изтриване на курса "Physical Education"
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Добавяне на новата колона "Email" към таблицата "Students"
ALTER TABLE Students ADD COLUMN Email VARCHAR(100);

-- Обновяване на записите на студентите с ID = 1 и 2 с имейл адреси
UPDATE Students SET Email = 'john.doe@example.com' WHERE StudentID = 1;
UPDATE Students SET Email = 'jane.smith@example.com' WHERE StudentID = 2;
