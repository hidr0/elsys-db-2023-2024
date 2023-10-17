-- 1

DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- 2

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DOB DATE,
    Address VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    CourseDescription TEXT
);

-- 3

INSERT INTO Students (FirstName, LastName, DOB, Address) 
VALUES ('Emil', 'Kostadinov', '2006-07-12', 'Mala koria 21'),
       ('Mihail', 'Kirilov', '2000-11-01', 'Manastirski livadi'),
       ('Kris', 'Petkov', '2006-05-21', 'Lulin 7'),
       ('Vikito', 'Velkov', '2006-04-20', 'Sveta troica');

INSERT INTO Courses (CourseName, CourseDescription) 
VALUES ('Database', 'Database creation and uses.'),
       ('PE', 'Physical exercises and muscle development through sports.'),
       ('Software development', 'Study of the ways to develop sofware services.');

-- 4

SELECT * FROM Students WHERE Address = 'Mala koria 21';
SELECT * FROM Students WHERE FirstName = 'Emil' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'Database' OR CourseName = 'Software developmenet';
SELECT * FROM Students WHERE Address IS NULL;

-- 5

UPDATE Students SET Address = 'Ovcha Kupel 2' WHERE StudentID = 1;
UPDATE Courses SET CourseDescription = 'Chill and play some sports.' WHERE CourseName = 'PE';

-- 6

DELETE FROM Students WHERE FirstName = 'Viktor' AND LastName = 'Velkov';
DELETE FROM Courses WHERE CourseName = 'Software development';

-- 7

ALTER TABLE Students ADD COLUMN Email VARCHAR(100);
UPDATE Students SET Email = 'emil.m.kostadinov.2020@elsys-bg.org' WHERE StudentID = 1;
UPDATE Students SET Email = 'mkirilov@elsys-bg.org' WHERE StudentID = 2;
