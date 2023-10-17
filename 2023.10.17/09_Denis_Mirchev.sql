-- (1)
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- (2)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DOB DATE,
    Address VARCHAR(255)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(255),
    CourseDescription VARCHAR(255)
);

-- (3)
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('John', 'Smith', '2002-03-15', '123 Elm Street'),
    ('Jane', 'Doe', '1999-06-22', '456 Oak Avenue'),
    ('Mary', 'Johnson', '2001-07-10', '123 Elm Street'),
    ('David', 'Wilson', '2000-11-30', '789 Maple Lane'),
    ('Sarah', 'Brown', '2003-05-05', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An introduction to basic algebra and geometry.'),
    ('History', 'Exploring world history'),
    ('Science', 'Understanding the principles of physics');

-- (4)
SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'John' AND DOB >= '2001-01-01';
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';
SELECT * FROM Students WHERE Address IS NULL;

-- (5)
UPDATE Students
SET Address = '456 Oak Avenue'
WHERE StudentID = 3;

UPDATE Courses
SET CourseDescription = 'An introduction to basic algebra and geometry.'
WHERE CourseName = 'Mathematics';

-- (6)
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- (7)
ALTER TABLE Students
ADD Email VARCHAR(255);

UPDATE Students
SET Email = 'john.smith@example.com'
WHERE StudentID = 1;

UPDATE Students
SET Email = 'jane.doe@example.com'
WHERE StudentID = 2;