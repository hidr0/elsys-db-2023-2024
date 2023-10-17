DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100),
    Email VARCHAR(100)
);

DROP TABLE IF EXISTS Courses;
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT
);

INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('Ali', 'Lazarova', '2006-02-17', '123 Elm Street'),
    ('Iva', 'Marinova', '2006-06-22', '234rp'),
    ('Zlati', 'Antov', '2004-07-29', '123 Elm Street'),
    ('Kati', 'Dimitrova', '2005-06-12', '456zatvor'),
    ('Andi', 'Gotiniq', '2003-10-30', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An advanced course in mathematics.'),
    ('History', 'A comprehensive study of world history.'),
    ('Science', 'Exploring the wonders of the natural world.');

SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'Zlati' AND DOB > '2000-01-01';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

DELETE FROM Students WHERE FirstName = 'Zlati' AND LastName = 'Antov';

DELETE FROM Courses WHERE CourseName = 'Physical Education';

ALTER TABLE Students ADD COLUMN Email VARCHAR(100);

UPDATE Students
SET Email = 'ali@example.com'
WHERE StudentID IN (1, 2);
