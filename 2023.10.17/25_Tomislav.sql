DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE classwork3;

CREATE TABLE Students(
	StudentID int PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(64),
    LastName varchar(64),
    DOB int,
	Adress varchar(100)
);

CREATE TABLE Courses(
	CourseID int PRIMARY KEY AUTO_INCREMENT,
    CourseName varchar(64),
    CourseDescription varchar(200)
);



INSERT INTO Students(FirstName, LastName, DOB, Adress) VALUES("Tomi", "Rusev", 2006, "Ul. Varna 34");
INSERT INTO Students(FirstName, LastName, DOB, Adress) VALUES("Iva", "Marinova", 2006, "Ul. Ravno Pole 2");
INSERT INTO Students(FirstName, LastName, DOB, Adress) VALUES("John", "Sachkov", 2005, "Ul. Nzkakste 3");
INSERT INTO Students(FirstName, LastName, DOB, Adress) VALUES("Jane", "Doe", 2006, "123 Elm Street");
INSERT INTO Students(FirstName, LastName, DOB, Adress) VALUES("Aleksadrovich", "Lazarovich", 2007, "Ul. Varna 34");
INSERT INTO Courses(CourseName, CourseDescription) VALUES("Mathematics", "We sum and divide numbers");
INSERT INTO Courses(CourseName, CourseDescription) VALUES("English", "We read in english");
INSERT INTO Courses(CourseName, CourseDescription) VALUES("Physical Education", "We exercise");

SELECT * FROM Students 
WHERE Adress = "123 Elm Street";

SELECT * FROM Students 
WHERE FirstName = "John" AND DOB > 2000;

SELECT * FROM Courses 
WHERE CourseName = "Mathematics" OR CourseName = "History";

SELECT * FROM Students 
WHERE Adress IS NULL;

UPDATE Students SET Adress = "456 Oak Avenue" 
WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = "An introduction to basic algebra and geometry" 
WHERE CourseName = "Mathematics";

DELETE FROM Students 
WHERE FirstName = "Jane" AND LastName = "Doe";

DELETE FROM Courses 
WHERE CourseName = "Physical Education";

ALTER TABLE Students ADD Email varchar(100);

UPDATE Students SET Email = "tomi@example.com" 
WHERE StudentID IN (1, 2);




