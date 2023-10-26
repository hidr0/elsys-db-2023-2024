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
-- (4)
SELECT * FROM Students 
WHERE Address = '123 Elm Street';

SELECT * FROM Students 
WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses 
WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students 
WHERE Address IS NULL;

-- (5)
UPDATE Students 
SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' 
WHERE CourseName = 'Mathematics';

-- (6)
DELETE FROM Students 
WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Let's review and grade the provided SQL script:

-- 1. **Database Creation**:
--    - The script correctly creates the `SchoolDB` database, deletes it first if it exists, and then sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with necessary columns: StudentId, FirstName, LastName, Address, and DOB. **✔️**
--    - The `Courses` table is correctly defined with necessary columns: CourseID, CourseName, and CourseDescription. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are inserted into the `Students` table. All values are correct and match the assignment. **✔️**
--    - Three courses are inserted into the `Courses` table. All given values are correct and match the assignment. **✔️**

-- 4. **Data Retrieval**:
--    - The query correctly retrieves students residing at '123 Elm Street'. **✔️**
--    - It correctly retrieves students named 'John' born after the year 2000. **✔️**
--    - It correctly retrieves records from the `Courses` table with course names 'Mathematics' or 'History'. **✔️**
--    - It correctly retrieves students without an address. In this particular dataset, no student is without an address, so it will return an empty set, but the logic is correct. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is correctly updated. **✔️**
--    - The description of the 'Mathematics' course is correctly updated. **✔️**

-- 6. **Data Deletion**:
--    - It correctly deletes the student named 'Jane Doe'. **✔️**
--    - The delete statement correctly deletes the course named 'Physical Education'. **✔️**

-- **Note**: The SQL script includes some unconventional (and informal) descriptions in values (e.g., "Cifri and shit" and "20 licevi"), which are not typical in a professional or academic environment. When preparing SQL scripts or data for real-world situations or presentations, it's essential to use clear and appropriate descriptions and comments.

-- **Summary**:
-- The script is well-structured and correctly executes all the specified tasks.

-- **Grade**: 100/100

-- Recommendation:
-- - Always use appropriate language and descriptions, especially in a professional or academic setting. The choice of words in the course descriptions is unprofessional.
