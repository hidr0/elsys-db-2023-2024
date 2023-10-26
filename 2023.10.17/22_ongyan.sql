-- 1
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;

-- 2
USE SchoolDB;
CREATE TABLE Students(
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(65),
    LastName VARCHAR(65),
    DOB DATE,
    Address VARCHAR(255)
);
CREATE TABLE Courses( 
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(65),
    CourseDescription VARCHAR(255)
);

-- 3
INSERT INTO Students(StudentID, FirstName, LastName, DOB) VALUES (1, 'Misho', 'Mishov', '1995-10-10');
INSERT INTO Students VALUES (2, 'John', 'Goshov', '1995-10-10', '123 Elm Street');
INSERT INTO Students(StudentID, FirstName, LastName, DOB) VALUES (3, 'Pepi', 'Pepiev', '1995-10-10');
INSERT INTO Students VALUES (4, 'Jane', 'Doe', '1995-10-10', 'Sofia');
INSERT INTO Students VALUES (5, 'John', 'Mishov', '2001-10-10', '123 Elm Street');
INSERT INTO Courses VALUES (1, 'Mathematics', 'Mathematics');
INSERT INTO Courses VALUES (2, 'Biology', 'Biology');
INSERT INTO Courses VALUES (3, 'Physical Education', 'Chemistry');

-- 4
SELECT * FROM Students WHERE Address = "123 Elm Street";
SELECT * FROM Students WHERE FirstName = "John" AND YEAR(DOB) >= 2000;
SELECT * FROM Courses WHERE CourseName = "Mathematics" OR CourseName = "History";
SELECT * FROM Students WHERE Address IS NULL;

-- 5
UPDATE Students SET Address = "456 Oak Avenue" WHERE StudentID = 3;
UPDATE Courses SET CourseDescription = CONCAT(CourseDescription, ". An introduction to basic algebra and geometry") WHERE CourseName = "Mathematics";

-- 6
DELETE FROM Students WHERE FirstName = "Jane" AND LastName = "Doe";
DELETE FROM Courses WHERE CourseName = "Physical Education";

-- Bonus
ALTER TABLE Students ADD COLUMN Email VARCHAR(255);
UPDATE Students SET Email = CONCAT(FirstName, LastName, "@gmail.com") WHERE StudentID = 1 OR StudentID = 2;

-- This SQL script performs the following operations:

-- 1. **Database Creation**:
--     - Drops the `SchoolDB` database if it exists.
--     - Creates a new database named `SchoolDB` and sets it as the current database. **✔️**

-- 2. **Table Creation**:
--     - Creates two tables: `Students` and `Courses` with their respective columns. **✔️**

-- 3. **Data Insertion**:
--     - Inserts five students into the `Students` table. Note: You've directly specified the `StudentID` which is usually not recommended for `AUTO_INCREMENT` fields unless you have a specific reason.
--     - Inserts three courses into the `Courses` table. Again, you've directly specified the `CourseID`. **✔️**

-- 4. **Data Retrieval**:
--     - Retrieves students living at "123 Elm Street". **✔️**
--     - Retrieves students named 'John' who were born in or after the year 2000. **✔️**
--     - Retrieves courses named 'Mathematics' or 'History'. (Note: You don't have a course named 'History', so only 'Mathematics' will be returned.) **✔️**
--     - Retrieves students who don't have an address specified. **✔️**

-- 5. **Data Update**:
--     - Changes the address for the student with `StudentID = 3`. **✔️**
--     - Updates the description for the 'Mathematics' course by appending more details to the existing description. **✔️**

-- 6. **Data Deletion**:
--     - Deletes the student named 'Jane Doe'. **✔️**
--     - Deletes the 'Physical Education' course. (Note: The course description you provided for 'Physical Education' is 'Chemistry', which might be an error.) **✔️**

-- 7. **Table Modification**:
--     - Adds an 'Email' column to the `Students` table. **✔️**
--     - Generates emails for students with `StudentID = 1` and `StudentID = 2` using their first and last names. **✔️**

-- **Summary**: 
-- The script appears to be clear, structured, and achieves its desired operations. It showcases various SQL operations and uses different techniques like the `CONCAT` function to achieve specific results. There's a possible oversight in the course description of 'Physical Education', but apart from that, everything looks good. 

-- **Grade**: 98/100 (just because of the possible oversight in course descriptions).
