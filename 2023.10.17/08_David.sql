-- Create the SchoolDB database
CREATE DATABASE SchoolDB;

-- Switch to the SchoolDB database
USE SchoolDB;

-- Create the Students table
CREATE TABLE Students (
  StudentID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DOB DATE,
  Address VARCHAR(100),
  Email VARCHAR(100)
);

-- Create the Courses table
CREATE TABLE Courses (
  CourseID INT AUTO_INCREMENT PRIMARY KEY,
  CourseName VARCHAR(100),
  CourseDescription TEXT
);

-- Insert students
INSERT INTO Students (FirstName, LastName, DOB, Address, Email)
VALUES
  ('John', 'Doe', '2001-02-15', '123 Elm Street', NULL),
  ('Jane', 'Doe', '1999-11-30', '123 Elm Street', NULL),
  ('Alice', 'Smith', '2003-04-18', '456 Oak Avenue', NULL),
  ('Bob', 'Johnson', '2002-09-05', '789 Maple Lane', NULL),
  ('Mary', 'Brown', '2000-07-22', NULL, NULL);

-- Insert courses
INSERT INTO Courses (CourseName, CourseDescription)
VALUES
  ('Mathematics', 'An introductory course in algebra and geometry'),
  ('History', 'A comprehensive overview of world history'),
  ('Science', 'Exploring various branches of scientific knowledge');

-- Retrieve all students who live at "123 Elm Street"
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- Retrieve all students named "John" who were born after 2000
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

-- Retrieve all courses named "Mathematics" or "History"
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- Retrieve all students whose address is NULL
SELECT * FROM Students WHERE Address IS NULL;

-- Update the address of the student with StudentID = 3 to "456 Oak Avenue"
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Update the course description of "Mathematics"
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

-- Delete the student record of anyone named "Jane Doe"
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

-- Delete the course named "Physical Education" (if it exists)
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Add a new column "Email" to the Students table
ALTER TABLE Students
ADD Email VARCHAR(100);

-- Update the records for students with StudentID = 1 and StudentID = 2 to add email addresses
UPDATE Students
SET Email = 'john.doe@example.com'
WHERE StudentID IN (1, 2);


-- Let's review the provided SQL code:

-- 1. **Database Creation**:
--    - The code creates the `SchoolDB` database and sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is created with appropriate columns including `Email` which was initially set in the bonus task of the previous example. **✔️**
--    - The `Courses` table is also correctly defined. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are inserted into the `Students` table with some having `NULL` addresses and emails. **✔️**
--    - Three courses are inserted into the `Courses` table. **✔️**

-- 4. **Data Retrieval**:
--    - Retrieves students residing at '123 Elm Street'. **✔️**
--    - Retrieves students named 'John' born after the year 2000. **✔️**
--    - Retrieves the courses 'Mathematics' and 'History'. **✔️**
--    - Retrieves students without an address. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is correctly updated. **✔️**
--    - The description of the 'Mathematics' course is correctly updated. **✔️**

-- 6. **Data Deletion**:
--    - The student named 'Jane Doe' is correctly deleted from the database. **✔️**
--    - No 'Physical Education' course was initially inserted, so the DELETE statement would not find a match and no action will be taken. It's an inconsistency in the provided script. **❌**

-- 7. **Bonus Task (However, this was done at the start)**:
--    - You're attempting to add the `Email` column again to the `Students` table, but this column was already defined when creating the table. This would lead to an error. **❌**
--    - The emails for students with `StudentID = 1` and `StudentID = 2` are correctly updated. **✔️**

-- **Summary**:
-- The script mainly works as expected, with the exception of a redundant ALTER TABLE command and an inconsistent DELETE statement. 

-- If this were based on the previous grading structure:
-- **Grade**: 88/100

-- Areas of Improvement:
-- - Ensure that the sequence of commands does not lead to redundancy (like adding an already present column).
-- - Align data manipulation commands (like DELETE) with the previously inserted data.
