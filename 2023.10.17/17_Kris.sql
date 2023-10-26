-- Check if database exists
DROP DATABASE IF EXISTS SchoolDB;

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
  Address VARCHAR(100)
);

-- Create the Courses table
CREATE TABLE Courses (
  CourseID INT AUTO_INCREMENT PRIMARY KEY,
  CourseName VARCHAR(100),
  CourseDescription TEXT
);

-- Insert students
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
  ('Kriskata', 'Bate', '2006-05-21', '123 Elm Street'),
  ('Jane', 'Doe', '2000-03-30', 'Nqkyde drugade'),
  ('John', 'Li', '2021-02-18', 'Tam nqkyde'),
  ('Sorry', 'Bate', '2004-12-05', '123 Elm Street'),
  ('John', 'Henry', '1992-08-24', NULL);

-- Insert courses
INSERT INTO Courses (CourseName, CourseDescription)
VALUES
  ('Physical Education', 'An introductory to training.'),
  ('History', 'An introductory to the world history.'),
  ('Mathematics', 'An introductory to football.');

-- Retrieve all students who live at "123 Elm Street"
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- Retrieve all students named "John" who were born after 2000
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '1999-12-31';

-- Retrieve all courses named "Mathematics" or "History"
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- Retrieve all students whose address is NULL
SELECT * FROM Students WHERE Address IS NULL;

-- Update the address of the student with StudentID = 3 to "456 Oak Avenue"
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Update the course description of "Mathematics"
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry' WHERE CourseName = 'Mathematics';

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

-- Let's analyze the provided SQL script:

-- 1. **Database Creation**:
--    - It checks if the `SchoolDB` database exists, and if so, it drops it.
--    - A new database named `SchoolDB` is created, and it's then set as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with the columns: StudentID, FirstName, LastName, DOB, and Address. **✔️**
--    - The `Courses` table is correctly defined with the columns: CourseID, CourseName, and CourseDescription. **✔️**

-- 3. **Data Insertion**:
--    - Five students are inserted into the `Students` table. The data seems to fit the structure of the table. **✔️**
--    - Three courses are inserted into the `Courses` table. However, the description for the 'Mathematics' course seems to be mismatched, as it refers to "football" instead of something math-related. **❌**

-- 4. **Data Retrieval**:
--    - It fetches students living at '123 Elm Street'. **✔️**
--    - It retrieves students named 'John' born after December 31, 1999. **✔️**
--    - It fetches courses named 'Mathematics' or 'History'. **✔️**
--    - It retrieves students without an address. Given the data, it will return the student named 'John Henry'. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is updated. **✔️**
--    - The description of the 'Mathematics' course is updated, which corrects the mismatched description from earlier. **✔️**

-- 6. **Data Deletion**:
--    - The student named 'Jane Doe' is deleted. **✔️**
--    - The 'Physical Education' course is deleted. **✔️**

-- 7. **Table Modification**:
--    - An 'Email' column is added to the `Students` table. **✔️**
--    - Emails are set for the students with `StudentID = 1` and `StudentID = 2`. **✔️**

-- **Summary**: The script accomplishes most tasks properly. There's a slight mismatch in the initial description of the 'Mathematics' course, which is later corrected. The data modification, deletion, and table alterations are all accurate.

-- **Grade**: 98/100 (Everything is correct with the exception of the initial mismatched course description.)
