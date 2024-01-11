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

INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES
('Paul', 'Walker', '2001-05-15', '123 Elm Street'),
('Jane', 'Doe', '1999-09-20', '456 Oak Avenue'),
('Peter', 'Adams', '2002-03-10', '123 Elm Street'),
('Alex', 'Smith', '2000-11-28', NULL),
('Viktor', 'Johnson', '1998-07-05', '789 Apple Drive');


INSERT INTO Courses (CourseName, CourseDescription) VALUES
('Mathematics', 'Course for the mathematical concepts and solving problems.'),
('History', 'Course for the historical events and their impact.'),
('Physics', 'Course for the principles of physics.');


SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01' ;

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;


UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe' ;

DELETE FROM Courses WHERE CourseName = 'Physical Education';
