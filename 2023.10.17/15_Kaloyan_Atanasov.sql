DROP DATABASE IF EXISTS SchoolDB;

-- Create a New Database
CREATE DATABASE SchoolDB;

USE SchoolDB;

-- Create Tables
CREATE TABLE Students (
    StudentID int AUTO_INCREMENT PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    DOB DATE,
    Address varchar(255)
);

CREATE TABLE Courses (
    CourseID int AUTO_INCREMENT PRIMARY KEY,
    CourseName varchar(255),
    CourseDescription varchar(255)
);

-- Insert Data
INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES
('Ivan', 'Pethrovka', '2001/9/11', '123 Elm Street'),
('Ivan', 'Mateevich', '1939/1/9', '123 Elm Street'),
('Dragan', 'Draganov', '2019/12/24', '456 Oak Avenue'),
('Petkan', 'Debilov', '2005/9/5', NULL),
('Broski', 'Uspasov', '2020/2/20', '789 Maple Lane');

INSERT INTO Courses (CourseName, CourseDescription) VALUES
('Mathematics', 'Basic arithmetic operations'),
('History', 'A study of historical events'),
('PE', 'Physical fitness and health');

-- Retrieve Data
SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'Ivan' AND DOB > '2000/1/1';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

-- Update Data
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = CONCAT(CourseDescription, ' An introduction to basic algebra and geometry.')
WHERE CourseName = 'Mathematics';

-- Delete Data
DELETE FROM Students WHERE FirstName = 'Dragan' AND LastName = 'Draganov';

DELETE FROM Courses WHERE CourseName = 'PE';