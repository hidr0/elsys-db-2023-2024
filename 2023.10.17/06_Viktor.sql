-- 1
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- 2
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(50),
    CourseDescription TEXT
);

-- 3
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('John', 'Doe', '2005-05-10', '123 Elm Street'),
    ('Jane', 'Doe', '1998-02-15', '456 Oak Avenue'),
    ('Alice', 'Smith', '2002-09-20', '123 Elm Street'),
    ('Bob', 'Johnson', '1999-11-30', '789 Maple Lane'),
    ('Eva', 'Brown', '2001-07-03', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An introductory course to basic algebra.'),
    ('History', 'A survey of world history.'),
    ('Physical Education', 'A course focusing on physical fitness.');

-- 4
SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

-- 5
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

-- 6
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Bonus
ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students
SET Email = 'john.doe@example.com'
WHERE StudentID IN (1, 2);