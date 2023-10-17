-- Create the SchoolDB database
CREATE DATABASE SchoolDB;

-- Switch to the SchoolDB database
USE SchoolDB;

-- Create the Students table
CREATE TABLE Students (
  StudentID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DOB DATE,
  Address VARCHAR(100),
  Email VARCHAR(100)
);

-- Create the Courses table
CREATE TABLE Courses (
  CourseID INT AUTO_INCREMENT PRIMARY KEY,
  CourseName VARCHAR(100),
  CourseDescription TEXT
);

-- Insert students
INSERT INTO Students (FirstName, LastName, DOB, Address, Email)
VALUES
  ('John', 'Doe', '2001-02-15', '123 Elm Street', NULL),
  ('Jane', 'Doe', '1999-11-30', '123 Elm Street', NULL),
  ('Alice', 'Smith', '2003-04-18', '456 Oak Avenue', NULL),
  ('Bob', 'Johnson', '2002-09-05', '789 Maple Lane', NULL),
  ('Mary', 'Brown', '2000-07-22', NULL, NULL);

-- Insert courses
INSERT INTO Courses (CourseName, CourseDescription)
VALUES
  ('Mathematics', 'An introductory course in algebra and geometry'),
  ('History', 'A comprehensive overview of world history'),
  ('Science', 'Exploring various branches of scientific knowledge');

-- Retrieve all students who live at "123 Elm Street"
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- Retrieve all students named "John" who were born after 2000
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

-- Retrieve all courses named "Mathematics" or "History"
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- Retrieve all students whose address is NULL
SELECT * FROM Students WHERE Address IS NULL;

-- Update the address of the student with StudentID = 3 to "456 Oak Avenue"
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Update the course description of "Mathematics"
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

-- Delete the student record of anyone named "Jane Doe"
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

-- Delete the course named "Physical Education" (if it exists)
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Add a new column "Email" to the Students table
ALTER TABLE Students
ADD Email VARCHAR(100);

-- Update the records for students with StudentID = 1 and StudentID = 2 to add email addresses
UPDATE Students
SET Email = 'john.doe@example.com'
WHERE StudentID IN (1, 2);
