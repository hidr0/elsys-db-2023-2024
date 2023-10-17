DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

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

INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('Iva', 'Marinova', '2006-6-22', '123 Elm Street'),
    ('Jane', 'Doe', '2000-01-12', '123 Elm Street'),
    ('John', 'Rusev', '2007-01-12', 'Sofia'),
    ('Nikola', 'Nikolov', '1980-08-01', 'Varna'),
    ('Tommy', 'Tomev', '1970-12-02', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Physical education', 'Lets be healthy!'),
    ('History', 'What happened is important'),
    ('Mathematics', 'We do not know what is happening !'),
    ('Science', 'Explore your dreams');

SELECT * FROM Students 
WHERE Address = '123 Elm Street';

SELECT * FROM Students
WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses 
WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students 
WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' 
WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.'
WHERE CourseName = 'Mathematics' AND CourseID = (SELECT CourseID FROM (SELECT CourseID FROM Courses WHERE CourseName = 'Mathematics' LIMIT 1) AS subquery);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Students 
WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses 
WHERE CourseName = 'Physical Education';

ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students SET Email = 'john.doe@example.com'
WHERE StudentID = 1 || StudentID = 2;

SET SQL_SAFE_UPDATES = 1;
DESCRIBE Students;
