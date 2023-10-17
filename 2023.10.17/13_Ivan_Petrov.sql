DROP DATABASE IF EXISTS SchoolDB;
-- Create the SchoolDB database
CREATE DATABASE SchoolDB;

-- Use the SchoolDB database
USE SchoolDB;

-- pravi se tabicata s uchenicite
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100)
);

-- pravi se tablica s predmetite
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription VARCHAR(200)
);

-- slaga se data v students
INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES
    ('John', 'Doe', '2002-05-15', '123 Elm Street'),
    ('Jane', 'Doe', '1998-09-22', '456 Oak Avenue'),
    ('Alice', 'Smith', '2003-02-18', '123 Elm Street'),
    ('Bob', 'Johnson', '2000-11-30', '789 Maple Lane'),
    ('John', 'Smith', '1999-03-10', '123 Elm Street');

-- slaga se data v bazata danni 
INSERT INTO Courses (CourseName, CourseDescription) VALUES
    ('Mathematics', 'An advanced math course'),
    ('History', 'A study of historical events'),
    ('Science', 'Basic science principles');

-- vzima se tiq koito jiveqt na 123 Elm Street
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- vzimat se tezi koito sa rodeni sled 2000
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

-- vziat se vs s mat i istoriq
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- uchecite s prazen adres
SELECT * FROM Students WHERE Address IS NULL;

-- Updatetvat se tezzi sus id 3
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Updatetva se opisanieta na mat
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

-- triqt se tezi s ime Jane Doe
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

-- maha se predmeta Physical Education
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- tezi s id 1 i 2 se slga email
ALTER TABLE Students ADD Email VARCHAR(100);
UPDATE Students SET Email = 'john.doe@email.com' WHERE StudentID IN (1, 2);