DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

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
    CourseDescription TEXT
);

INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('John', 'Doe', '2002-03-15', '123 Elm Street'),
    ('Jane', 'Smith', '1999-05-22', '456 Oak Avenue'),
    ('John', 'Johnson', '2001-08-10', '123 Elm Street'),
    ('Mary', 'Johnson', '2003-01-30', '789 Maple Lane'),
    ('Michael', 'Brown', '2000-06-05', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An introductory course in basic algebra.'),
    ('History', 'A survey of world history.'),
    ('Physics', 'Principles of classical mechanics.');

SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';
SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';
DELETE FROM Courses WHERE CourseName = 'Physical Education';

ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students
SET Email = 'john.doe@example.com'
WHERE StudentID IN (1, 2);