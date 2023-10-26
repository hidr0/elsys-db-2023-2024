DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

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
    ('John', 'Doe', '2002-03-15', '123 Elm Street'),
    ('Jane', 'Smith', '1999-05-22', '456 Oak Avenue'),
    ('John', 'Johnson', '2001-08-10', '123 Elm Street'),
    ('Mary', 'Johnson', '2003-01-30', '789 Maple Lane'),
    ('Michael', 'Brown', '2000-06-05', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An introductory course in basic algebra.'),
    ('History', 'A survey of world history.'),
    ('Physics', 'Principles of classical mechanics.');

SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';
SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';
DELETE FROM Courses WHERE CourseName = 'Physical Education';

ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students
SET Email = 'john.doe@example.com'
WHERE StudentID IN (1, 2);


-- The SQL script you've provided seems to be well-structured, but let's go through each part and verify its accuracy:

-- 1. **Database Creation**:
--     - The existing `SchoolDB` database is dropped if it exists.
--     - A new database `SchoolDB` is created and set as the active database. **✔️**

-- 2. **Table Creation**:
--     - The `Students` and `Courses` tables are created with appropriate columns. **✔️**

-- 3. **Data Insertion**:
--     - Five students are inserted into the `Students` table. **✔️**
--     - Three courses are inserted into the `Courses` table. **✔️**

-- 4. **Data Retrieval**:
--     - It fetches students living at '123 Elm Street'. **✔️**
--     - Retrieves students named 'John' with DOB after January 1, 2000. **✔️**
--     - Retrieves courses named 'Mathematics' or 'History'. **✔️**
--     - Retrieves students without an address. **✔️**

-- 5. **Data Update**:
--     - The address of the student with `StudentID = 3` is updated. **✔️**
--     - The description of the 'Mathematics' course is updated. **✔️**

-- 6. **Data Deletion**:
--     - The student named 'Jane Doe' is deleted. **✔️**
--     - There's an attempt to delete the 'Physical Education' course, but it was not inserted in the first place, so this DELETE command will not remove any records. **❌** This isn't a script-breaking error, but it does indicate a discrepancy between the data you intended to create and the data you intended to delete.

-- 7. **Table Modification**:
--     - An 'Email' column is added to the `Students` table. **✔️**
--     - Emails are updated for students with specific StudentIDs. **✔️**

-- **Summary**: 
-- The script appears to be almost entirely correct, with only one minor discrepancy. The attempt to delete a course that was never added might indicate that there was a change in plans or a minor oversight during the script's creation.

-- **Grade**: 98/100 due to the mentioned discrepancy.
