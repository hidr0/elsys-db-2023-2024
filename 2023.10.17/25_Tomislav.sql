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

-- Let's grade the SQL script:

-- 1. **Database Creation**:
--     - Successful creation of the database: **10/10**.
--     - However, after creating the database `SchoolDB`, the `USE` statement tries to use a different database `classwork3`. This is an error: **-5 points**.

-- 2. **Table Creation**:
--     - Creation of the `Students` table: **9/10**. One point is deducted for using the datatype `int` for DOB. This is unconventional and makes it hard to understand the date format.
--     - Creation of the `Courses` table: **10/10**.

-- 3. **Data Insertion**:
--     - Insertion of records into the `Students` table: **10/10**.
--     - Insertion of records into the `Courses` table: **10/10**.

-- 4. **Data Retrieval**:
--     - Retrieval of students living at '123 Elm Street': **10/10**.
--     - Retrieval of students named 'John' born after the year 2000: **10/10** (however the unconventional date format was used correctly).
--     - Retrieval of specific courses: **9/10**. One point is deducted since the course "History" wasn't inserted, so its inclusion in the retrieval seems redundant.
--     - Retrieval of students with NULL addresses: **10/10**.

-- 5. **Data Update**:
--     - Updating student data (address): **10/10**.
--     - Updating course data (course description): **10/10**.

-- 6. **Data Deletion**:
--     - Deleting the 'Jane Doe' student record: **10/10**.
--     - Deleting the 'Physical Education' course: **10/10**.

-- 7. **Table Alteration & Further Data Update**:
--     - Addition of an Email column to the `Students` table: **10/10**.
--     - Updating Email for specific students: **10/10**.

-- **Total Score: 93/100**.

-- Comments: The primary issues with this script are the use of an unconventional datatype for DOB and the discrepancy between the database creation and usage. Addressing these would make the script near perfect.


