-- (1)
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;


-- (2)
CREATE TABLE Students(
	StudentId int PRIMARY KEY auto_increment,
    FirstName varchar(123),
    LastName varchar(123),
    Address varchar(321),
    DOB date
);


CREATE TABLE Courses (
	CourseID int PRIMARY KEY auto_increment,
    CourseName varchar(123),
    CourseDescription varchar(321)
);

-- (3)
insert into Students(FirstName, LastName, DOB, Address) 
	values("John", "Jones", "1985-02-24", "ul. iskar 89");
insert into Students(FirstName, LastName, DOB, Address) 
	values("John", "Sulivan", "2006-10-03", "ndk typer shit");
insert into Students(FirstName, LastName, DOB, Address) 
	values("Boris", "Boris", "1789-03-12", "sveta troica mizeren kvartal");
insert into Students(FirstName, LastName, DOB, Address) 
	values("Ish", "Smith", "2001-07-19", "123 Elm Street");
insert into Students(FirstName, LastName, DOB, Address) 
	values("Jane", "Doe", "1998-04-30", "123 Elm Street");
    
insert into Courses (CourseName, CourseDescription) 
	values('Mathematics', 'Cifri and shit');
insert into Courses (CourseName, CourseDescription) 
	values('History', 'Kolko chesto mislish rimskata imperia');
insert into Courses (CourseName, CourseDescription) 
	values('Physical Education', '20 licevi');

SELECT * FROM Students 
WHERE Address = '123 Elm Street';

SELECT * FROM Students 
WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses 
WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students 
WHERE Address IS NULL;

UPDATE Students 
SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' 
WHERE CourseName = 'Mathematics';

DELETE FROM Students 
WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses WHERE CourseName = 'Physical Education';