DROP DATABASE IF EXISTS SchoolDB;
-- Create the SchoolDB database
CREATE DATABASE SchoolDB;

-- Use the SchoolDB database
USE SchoolDB;

-- pravi se tabicata s uchenicite
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100)
);

-- pravi se tablica s predmetite
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription VARCHAR(200)
);

-- slaga se data v students
INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES
    ('John', 'Doe', '2002-05-15', '123 Elm Street'),
    ('Jane', 'Doe', '1998-09-22', '456 Oak Avenue'),
    ('Alice', 'Smith', '2003-02-18', '123 Elm Street'),
    ('Bob', 'Johnson', '2000-11-30', '789 Maple Lane'),
    ('John', 'Smith', '1999-03-10', '123 Elm Street');

-- slaga se data v bazata danni 
INSERT INTO Courses (CourseName, CourseDescription) VALUES
    ('Mathematics', 'An advanced math course'),
    ('History', 'A study of historical events'),
    ('Science', 'Basic science principles');

-- vzima se tiq koito jiveqt na 123 Elm Street
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- vzimat se tezi koito sa rodeni sled 2000
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

-- vziat se vs s mat i istoriq
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- uchecite s prazen adres
SELECT * FROM Students WHERE Address IS NULL;

-- Updatetvat se tezzi sus id 3
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Updatetva se opisanieta na mat
UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

-- triqt se tezi s ime Jane Doe
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Doe';

-- maha se predmeta Physical Education
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- tezi s id 1 i 2 se slga email
ALTER TABLE Students ADD Email VARCHAR(100);
UPDATE Students SET Email = 'john.doe@email.com' WHERE StudentID IN (1, 2);


-- Let's review and grade the provided SQL code:

-- 1. **Database Creation**:
--    - The script correctly creates the `SchoolDB` database, deletes it first if it exists, and then sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with the necessary columns. **✔️**
--    - The `Courses` table is also correctly defined. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are inserted into the `Students` table. All values are correct and match the assignment. Note: There are two students named 'John' (one 'John Doe' and one 'John Smith'), which is fine since the table can hold multiple records with the same name. **✔️**
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
--    - The delete statement for the course named 'Physical Education' won't delete any records since that course name doesn't exist in the table. There's no logical error in the script, but this line won't have any effect. **(Neutral: No points added or deducted)**

-- 7. **Table Alteration and Data Update**:
--    - The `Email` column is added to the `Students` table. **✔️**
--    - The `Email` is updated for the students with `StudentID = 1` and `StudentID = 2`. **✔️**

-- **Summary**:
-- The script is mostly correct, with one superfluous deletion line that doesn't impact the database.

-- **Grade**: 99/100

-- Areas of Improvement:
-- - Always ensure that if a DELETE command (or any command) is included in the script, the relevant data or condition should exist in the database. If not, it might lead to confusion for anyone reviewing or maintaining the script.
