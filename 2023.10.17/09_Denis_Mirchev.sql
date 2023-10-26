-- (1)
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- (2)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DOB DATE,
    Address VARCHAR(255)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(255),
    CourseDescription VARCHAR(255)
);

-- (3)
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('John', 'Smith', '2002-03-15', '123 Elm Street'),
    ('Jane', 'Doe', '1999-06-22', '456 Oak Avenue'),
    ('Mary', 'Johnson', '2001-07-10', '123 Elm Street'),
    ('David', 'Wilson', '2000-11-30', '789 Maple Lane'),
    ('Sarah', 'Brown', '2003-05-05', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An introduction to basic algebra and geometry.'),
    ('History', 'Exploring world history'),
    ('Science', 'Understanding the principles of physics');

-- (4)
SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'John' AND DOB >= '2001-01-01';
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';
SELECT * FROM Students WHERE Address IS NULL;

-- (5)
UPDATE Students
SET Address = '456 Oak Avenue'
WHERE StudentID = 3;

UPDATE Courses
SET CourseDescription = 'An introduction to basic algebra and geometry.'
WHERE CourseName = 'Mathematics';

-- (6)
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- (7)
ALTER TABLE Students
ADD Email VARCHAR(255);

UPDATE Students
SET Email = 'john.smith@example.com'
WHERE StudentID = 1;

UPDATE Students
SET Email = 'jane.doe@example.com'
WHERE StudentID = 2;

-- Let's review and grade the provided SQL code based on the assignment:

-- 1. **Database Creation**:
--    - The code correctly creates the `SchoolDB` database, deletes it first if it exists, and then sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with the necessary columns. **✔️**
--    - The `Courses` table is also correctly defined. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are inserted into the `Students` table. All given values are correct and match the assignment. **✔️**
--    - Three courses are inserted into the `Courses` table. All given values are correct and match the assignment. **✔️**

-- 4. **Data Retrieval**:
--    - The query correctly retrieves students residing at '123 Elm Street'. **✔️**
--    - It correctly retrieves students named 'John' born on or after the year 2001. **✔️**
--    - The query correctly retrieves the courses 'Mathematics' and 'History'. **✔️**
--    - It correctly retrieves students without an address. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is correctly updated. **✔️**
--    - The description of the 'Mathematics' course is correctly updated. **✔️**

-- 6. **Data Deletion**:
--    - The student named 'Jane Doe' is correctly deleted from the database. **✔️**
--    - The `DELETE` command for the 'Physical Education' course will not delete any record since that course was not initially inserted. It doesn't raise an error, but it's an unnecessary command. **❌**

-- 7. **Bonus Task**:
--    - The `Email` column is added to the `Students` table without issues. **✔️**
--    - The emails for students with `StudentID = 1` and `StudentID = 2` are correctly updated. **✔️**

-- **Summary**:
-- The script is very well constructed and almost completely matches the assignment. Only a minor inconsistency in the deletion step prevents it from being perfect.

-- **Grade**: 98/100

-- Areas of Improvement:
-- - Align data manipulation commands (like DELETE) with the previously inserted data to avoid redundancy or unnecessary commands.
