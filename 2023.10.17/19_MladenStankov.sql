-- Create a new database and select it
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Create Students and Courses tables
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
    CourseDescription VARCHAR(255)
);

-- Insert data into Students and Courses tables
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('John', 'Ivanov', '2001-03-15', '123 Elm Street'),
    ('John', 'Stoilov', '1998-07-21', '456 Oak Avenue'),
    ('John', 'Lilov', '2002-11-09', '123 Elm Street'),
    ('Joe', 'Biden', '1001-09-11', NULL),
    ('Jane', 'Doe', '2003-12-21', '789 Cedar Lane');

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'Introduction to Vectors'),
    ('Psysical Education', 'Football'),
    ('Computer Science', 'Introduction to arrays');

-- Retrieve data
SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

-- Update data
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry' WHERE CourseName = 'Mathematics';

-- Delete data
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Bonus Task: Add Email column and update records
ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students
SET Email = 'john@elsys-bg.org'
WHERE StudentID IN (1, 2);

SELECT * FROM Students



-- Let's review the SQL script you provided:

-- 1. **Database Creation**:
--     - The existing `SchoolDB` database is dropped if it exists.
--     - A new database `SchoolDB` is created and set as the active database. **✔️**

-- 2. **Table Creation**:
--     - The `Students` and `Courses` tables are created with appropriate columns. **✔️**

-- 3. **Data Insertion**:
--     - Five students are inserted into the `Students` table. The data provided seems to fit the structure of the table. **✔️**
--     - Three courses are inserted into the `Courses` table. There's a minor typo in "Physical Education" as "Psysical Education". **❌**

-- 4. **Data Retrieval**:
--     - It fetches students living at '123 Elm Street'. **✔️**
--     - Retrieves students named 'John' with DOB after January 1, 2000. **✔️**
--     - There's an error in fetching courses named 'Mathematics' or 'History'. The code tries to fetch 'History', which wasn't inserted into the table. However, the command will run successfully, just might not return what was expected. **❌**
--     - Retrieves students without an address. **✔️**

-- 5. **Data Update**:
--     - The address of the student with `StudentID = 3` is updated. **✔️**
--     - The description of the 'Mathematics' course is updated. **✔️**

-- 6. **Data Deletion**:
--     - The student named 'Jane Doe' is deleted. **✔️**
--     - The 'Physical Education' course is attempted to be deleted, but due to the typo in its insertion, this statement won't delete any records. **❌**

-- 7. **Table Modification**:
--     - An 'Email' column is added to the `Students` table. **✔️**
--     - Emails are updated for students with specific StudentIDs. **✔️**
--     - All students are selected to be displayed. **✔️**

-- **Summary**:
-- The script is mostly correct. There are minor errors, like the typo in the course name and the attempt to select a non-existent course.

-- **Grade**: 90/100 due to the mentioned errors.
