
-- New database creation (1)
DROP DATABASE IF EXISTS SchoolDB;

CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Table creation (2)
CREATE TABLE Students (
StudentID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
DOB DATE, 
Address VARCHAR(255)
);

CREATE TABLE Courses (
CourseID INT AUTO_INCREMENT PRIMARY KEY,
CourseName VARCHAR(255),
CourseDescription VARCHAR(255)
);

-- Data insertion (3)
INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES 
('John', 'Smith', '2000-05-15', '123 Elm Street, Anytown'), 
('Sarah', 'Johnson', '2001-08-22', '456 Elm Avenue, Anothercity'),
('Michael', 'Davis', '1999-12-10', '789 Oak Lane, Sometown'),
('Emily', 'Brown', '2002-03-30', '101 Pine Road, Yourtown'),
('James', 'Wilson', '2003-07-05', '555 Cedar Drive, Hometown');

INSERT INTO Courses (CourseName, CourseDescription) VALUES
('History', 'An introductory course in history covering major historical events and civilizations.'),
('Mathematics', 'An introductory course in mathematics covering algebra, calculus, and mathematical principles.'),
('Physical Education', 'A physical education course focusing on fitness, sports, and overall well-being.');

-- Data retrieaval (4)
SELECT * FROM Students WHERE Address='123 Elm Street';
SELECT * FROM Students WHERE FirstName='John' AND DOB>'2000-01-01';
SELECT * FROM Courses WHERE CourseName='Mathematics' OR CourseName='History';
SELECT * FROM Students WHERE Address IS NULL;

-- Updating data (5)
UPDATE Students SET Address='456 Oak Avenue' WHERE StudentID=3;
UPDATE Courses SET CourseDescription='An introduction to basic algebra and geometry.' WHERE CourseName='Mathematics';

-- Deleting data (6)
DELETE FROM Students WHERE FirstName='Jane' AND LastName='Doe';
DELETE FROM Courses WHERE CourseName='Physical Education';

-- Bonus task 
ALTER TABLE Students ADD Email VARCHAR(255);
UPDATE Students SET Email = 'johndoe@example.com' WHERE StudentID = 1;
UPDATE Students SET Email = 'sarahjohnson@example.com' WHERE StudentID = 2;