-- 1
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- 2
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

-- 3
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('Sarah', 'Britman', '1998-09-21', '456 Birch Lane'),
    ('Michael', 'jordan', '2000-04-12', '789 Maple Street'),
    ('ivet', 'petrova', '1999-12-05', '123 Oak Avenue'),
    ('natalia', 'petrova', '2001-08-15', NULL),
    ('oliva', 'jey', '2002-06-02', '890 Pine Road');

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('bio', 'Lizards and mushrooms.'),
    ('OS', 'Homework.'),
    ('MAT', 'Examples.');

-- 4
SELECT * FROM Students WHERE Address = '123 Oak Avenue';
SELECT * FROM Students WHERE FirstName = 'oliva' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'OS' OR CourseName = 'bio';
SELECT * FROM Students WHERE Address IS NULL;

-- 5
UPDATE Students SET Address = 'new' WHERE StudentID = 3;

-- 6
DELETE FROM Courses WHERE CourseID = 1;

-- This SQL script performs the following operations:

-- 1. **Database Creation**:
--     - Drops the `SchoolDB` database if it exists.
--     - Creates a new database named `SchoolDB` and sets it as the current database. **✔️**

-- 2. **Table Creation**:
--     - Creates two tables: `Students` and `Courses`, both with their respective columns. **✔️**

-- 3. **Data Insertion**:
--     - Inserts five students into the `Students` table with varying attributes, one of which has a `NULL` address.
--     - Inserts three courses into the `Courses` table. **✔️**

-- 4. **Data Retrieval**:
--     - Retrieves students living at '123 Oak Avenue'. **✔️**
--     - Retrieves students named 'oliva' born after January 1, 2000. **✔️**
--     - Retrieves courses with the names 'OS' or 'bio'. **✔️**
--     - Retrieves students who don't have an address specified. **✔️**

-- 5. **Data Update**:
--     - Updates the address of the student with `StudentID = 3` to 'new'. **✔️**

-- 6. **Data Deletion**:
--     - Deletes the course with `CourseID = 1`. **✔️**

-- **Observations**:

-- - Consistent and neat formatting with distinct numbered sections, which improves readability.
-- - Uses a variety of SQL operations demonstrating a comprehensive understanding of the operations.
-- - Naming convention: You might want to consider using descriptive table and column names. For example, instead of 'bio', 'OS', and 'MAT', you might use 'Biology', 'OperatingSystems', and 'Mathematics' for clarity. Similarly, typically table and column names, as well as values inserted into the table, start with an uppercase letter (e.g., 'Ivet' instead of 'ivet'). But this can depend on the specific naming conventions of a project or organization.

-- **Grade**: 95/100 (A few points were deducted for the naming conventions). 

-- Overall, it's a well-structured script!
