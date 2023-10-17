DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Students(
	StudentId int PRIMARY KEY AUTO_INCREMENT,
    FirstName varchar(64),
    LastName varchar(64),
    DOB date,
    Address varchar(100)
);

CREATE TABLE Courses(
	CourseID int PRIMARY KEY AUTO_INCREMENT,
	CourseName varchar(64),
    CourseDescription varchar(255)
);

INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("Petar","Petrov","2002-11-11","bul.Vitoshka 34");
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("John","Ivanov","2006-01-23","ul.Lege 17");
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("Georgi","Georgiev","1999-06-04","ul.Denkoglu 101");
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("Danail","Zhelev","2012-08-17","Elm Street 123");
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("John","Stoyanov","1951-12-29","bul.Boris Stefanov 11"); 
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("Alex","Doychinov","2000-01-01","bul.Vitoshka 34");
INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES("Jane","Doe","1999-01-01","bul.Vitoshka 240");
INSERT INTO Students(FirstName, LastName, DOB) VALUES("Alek","Dimitrov","2007-11-01");

INSERT INTO Courses(CourseName,CourseDescription) VALUES("Mathematics","Geometry and algebra");
INSERT INTO Courses(CourseName,CourseDescription) VALUES("History","Learning bulgarian history");
INSERT INTO Courses(CourseName,CourseDescription) VALUES("Physical Education","Football and baseball");
INSERT INTO Courses(CourseName,CourseDescription) VALUES("Biology","Genetics and anatomy");
INSERT INTO Courses(CourseName,CourseDescription) VALUES("BEL","Learning bulgarian literature");


SELECT * FROM Students WHERE Address = "Elm Street 123";
SELECT * FROM Students WHERE FirstName = "John" AND DOB>"2000-12-31";
SELECT * FROM Courses WHERE CourseName = "Mathematics" OR CourseName = "History";
SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students
SET Address = "456 Oak Avenue"
WHERE StudentId = 3;

UPDATE Courses
SET CourseDescription = "An introduction to basic algebra and geometry."
WHERE CourseName = "Mathematics";

DELETE FROM Students WHERE FirstName = "Jane" AND LastName = "Doe";

DELETE FROM Courses WHERE CourseName = "Physical Education";

ALTER TABLE Students
ADD COLUMN Email varchar(100);

UPDATE Students
SET Email = "ppetrov@bgmail.bg"
WHERE StudentId = 1;

UPDATE Students
SET Email = "jivanov@bgmail.bg"
WHERE StudentId = 2;
