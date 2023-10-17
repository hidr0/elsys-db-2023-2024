-- Create a new database and select it
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Create Students and Courses tables
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

-- Insert data into Students and Courses tables
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('John', 'Ivanov', '2001-03-15', '123 Elm Street'),
    ('John', 'Stoilov', '1998-07-21', '456 Oak Avenue'),
    ('John', 'Lilov', '2002-11-09', '123 Elm Street'),
    ('Joe', 'Biden', '1001-09-11', NULL),
    ('Jane', 'Doe', '2003-12-21', '789 Cedar Lane');

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'Introduction to Vectors'),
    ('Psysical Education', 'Football'),
    ('Computer Science', 'Introduction to arrays');

-- Retrieve data
SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

-- Update data
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry' WHERE CourseName = 'Mathematics';

-- Delete data
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Bonus Task: Add Email column and update records
ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students
SET Email = 'john@elsys-bg.org'
WHERE StudentID IN (1, 2);

SELECT * FROM Students
