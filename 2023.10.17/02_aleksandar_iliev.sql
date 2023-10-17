-- 1 create DB
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;
-- 2 create tables
CREATE TABLE Students(
	StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName TINYTEXT,
    LastNAME TINYTEXT,
    DOB DATE,
    Address TINYTEXT
);
CREATE TABLE Courses(
	CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName TINYTEXT,
    CourseDescription TEXT
);
-- 3 insert data (very creative data, def writen manualy)
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
('Jane', 'Doe', '1998-05-15', '123 Elm Street'),
('Alice', 'Smith', '2000-09-20', NULL),
('Michael', 'Johnson', '1999-03-10', '789 Oak Street'),
('Jhon', 'Davis', '2001-07-02', '123 Elm Street'),
('William', 'Brown', '1997-12-08', '234 Main Street');
INSERT INTO Courses (CourseName, CourseDescription)
VALUES
('Mathematics', 'Basic introduction to mathematics.'),
('History', 'Exploring world history through the ages.'),
('Programming 101', 'Advanced programming concepts and techniques.'),
('Physical Education', 'PE');
-- 4 retrieving the data
SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'Jhon' AND DOB >= '2001-01-01';
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';
SELECT * FROM Students WHERE Address IS NULL;
-- 5 updateing the dataing
UPDATE Students
SET Address = '456 Oak Avenue'
WHERE StudentID = 3;

UPDATE Courses
SET CourseDescription = CONCAT(CourseDescription, ' An introduction to basic algebra and geometry.')
WHERE CourseName = "Mathematics";

DELETE FROM Students WHERE CONCAT(FirstName, '', LastName) = 'Jane Doe';
DELETE FROM Courses WHERE CourseName = "Physical Education";
-- 6 bonus round 
ALTER TABLE Students
ADD COLUMN Email TINYTEXT;

UPDATE Students
SET Email = 'something@google.kom'
WHERE StudentID = 1;

UPDATE Students
SET Email = 'something_else@bing.org'
WHERE StudentID = 2;

SELECT * FROM Students;