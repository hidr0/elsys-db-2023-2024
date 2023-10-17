CREATE DATABASE SchoolDB;

CREATE TABLE Students(
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(255)
);

CREATE TABLE Courses(
	CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription VARCHAR(255)
);

INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES
('Ivan', 'Petrov', '2006-01-01', '123 Elm Street'),
('Ajvan', 'Pethrov', '1906-08-01', 'Stambolijski'),
('Ajvar', 'Marev', '1996-02-01', 'Stambolijski 1'),
('Ihtiman', 'Pethrovka', '1986-01-03', 'Stambolijski 2'),
('Vanka', 'Petrovka', '1976-11-07', 'Stambolijski 3');

INSERT INTO Courses(CourseName, CourseDescription) VALUES
('Math', 'Algebra and geometry'),
('BG', 'Pravila na pravopis'),
('Programming', 'Introduction to databases');

SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'Ivan' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'Math' OR 'BG';
SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students
SET Address = '456 Oak Avenue'
WHERE StudentID = 3;

UPDATE Students
SET CourseDescription = 'An introduction to basic algebra and geometry.'
WHERE CourseName = 'Math';

DELETE FROM Student
WHERE FirstName = 'Ivan' AND LastName = 'Petrov';

DELETE FROM Courses
WHERE CourseName = 'Programming';

ALTER TABLE Students
ADD Email VARCHAR(255);

UPDATE Students
SET Email = 'ivan.petrov@mail.com'
WHERE StudentID = 1;

UPDATE Students
SET Email = 'ivan.petrovka@mail.com'
WHERE StudentID = 2;
