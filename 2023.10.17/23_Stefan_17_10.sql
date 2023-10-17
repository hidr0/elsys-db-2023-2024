-- 1
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- 2
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription VARCHAR(255)
);

-- 3
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('Sarah', 'Britman', '1998-09-21', '456 Birch Lane'),
    ('Michael', 'jordan', '2000-04-12', '789 Maple Street'),
    ('ivet', 'petrova', '1999-12-05', '123 Oak Avenue'),
    ('natalia', 'petrova', '2001-08-15', NULL),
    ('oliva', 'jey', '2002-06-02', '890 Pine Road');

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('bio', 'Lizards and mushrooms.'),
    ('OS', 'Homework.'),
    ('MAT', 'Examples.');

-- 4
SELECT * FROM Students WHERE Address = '123 Oak Avenue';
SELECT * FROM Students WHERE FirstName = 'oliva' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'OS' OR CourseName = 'bio';
SELECT * FROM Students WHERE Address IS NULL;

-- 5
UPDATE Students SET Address = 'new' WHERE StudentID = 3;

-- 6
DELETE FROM Courses WHERE CourseID = 1;
