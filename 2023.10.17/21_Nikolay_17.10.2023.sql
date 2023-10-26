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


-- The SQL script you provided performs the following tasks:

-- 1. **Database Creation**:
--     - If `SchoolDB` exists, it's dropped.
--     - A new database `SchoolDB` is created and set as the active database. **✔️**

-- 2. **Table Creation**:
--     - Creates the `Students` and `Courses` tables with appropriate columns. **✔️**

-- 3. **Data Insertion**:
--     - Inserts eight students into the `Students` table. **✔️**
--     - Inserts five courses into the `Courses` table. **✔️**

-- 4. **Data Retrieval**:
--     - Fetches the student living at "Elm Street 123". **✔️**
--     - Retrieves students named 'John' with a DOB after December 31, 2000. **✔️**
--     - Retrieves courses named 'Mathematics' or 'History'. **✔️**
--     - Retrieves students without an address. **✔️**

-- 5. **Data Update**:
--     - Updates the address of the student with `StudentId = 3`. **✔️**
--     - Updates the description of the 'Mathematics' course. **✔️**

-- 6. **Data Deletion**:
--     - Deletes the student named 'Jane Doe'. **✔️**
--     - Deletes the course named 'Physical Education'. **✔️**

-- 7. **Table Modification**:
--     - Adds an 'Email' column to the `Students` table. **✔️**
--     - Updates emails for the students with specific `StudentId`s. **✔️**

-- **Summary**: 
-- The script appears to be accurate and comprehensive. It's well-structured and performs a variety of SQL operations that are error-free based on the provided SQL. 

-- **Grade**: 100/100.
