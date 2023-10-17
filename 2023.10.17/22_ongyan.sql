-- 1
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;

-- 2
USE SchoolDB;
CREATE TABLE Students(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(65),
    LastName VARCHAR(65),
    DOB DATE,
    Address VARCHAR(255)
);
CREATE TABLE Courses( 
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(65),
    CourseDescription VARCHAR(255)
);

-- 3
INSERT INTO Students(StudentID, FirstName, LastName, DOB) VALUES (1, 'Misho', 'Mishov', '1995-10-10');
INSERT INTO Students VALUES (2, 'John', 'Goshov', '1995-10-10', '123 Elm Street');
INSERT INTO Students(StudentID, FirstName, LastName, DOB) VALUES (3, 'Pepi', 'Pepiev', '1995-10-10');
INSERT INTO Students VALUES (4, 'Jane', 'Doe', '1995-10-10', 'Sofia');
INSERT INTO Students VALUES (5, 'John', 'Mishov', '2001-10-10', '123 Elm Street');
INSERT INTO Courses VALUES (1, 'Mathematics', 'Mathematics');
INSERT INTO Courses VALUES (2, 'Biology', 'Biology');
INSERT INTO Courses VALUES (3, 'Physical Education', 'Chemistry');

-- 4
SELECT * FROM Students WHERE Address = "123 Elm Street";
SELECT * FROM Students WHERE FirstName = "John" AND YEAR(DOB) >= 2000;
SELECT * FROM Courses WHERE CourseName = "Mathematics" OR CourseName = "History";
SELECT * FROM Students WHERE Address IS NULL;

-- 5
UPDATE Students SET Address = "456 Oak Avenue" WHERE StudentID = 3;
UPDATE Courses SET CourseDescription = CONCAT(CourseDescription, ". An introduction to basic algebra and geometry") WHERE CourseName = "Mathematics";

-- 6
DELETE FROM Students WHERE FirstName = "Jane" AND LastName = "Doe";
DELETE FROM Courses WHERE CourseName = "Physical Education";

-- Bonus
ALTER TABLE Students ADD COLUMN Email VARCHAR(255);
UPDATE Students SET Email = CONCAT(FirstName, LastName, "@gmail.com") WHERE StudentID = 1 OR StudentID = 2;