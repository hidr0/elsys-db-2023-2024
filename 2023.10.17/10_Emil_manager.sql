-- 1

DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- 2

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DOB DATE,
    Address VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    CourseDescription TEXT
);

-- 3

INSERT INTO Students (FirstName, LastName, DOB, Address) 
VALUES ('Emil', 'Kostadinov', '2006-07-12', 'Mala koria 21'),
       ('Mihail', 'Kirilov', '2000-11-01', 'Manastirski livadi'),
       ('Kris', 'Petkov', '2006-05-21', 'Lulin 7'),
       ('Vikito', 'Velkov', '2006-04-20', 'Sveta troica');

INSERT INTO Courses (CourseName, CourseDescription) 
VALUES ('Database', 'Database creation and uses.'),
       ('PE', 'Physical exercises and muscle development through sports.'),
       ('Software development', 'Study of the ways to develop sofware services.');

-- 4

SELECT * FROM Students WHERE Address = 'Mala koria 21';
SELECT * FROM Students WHERE FirstName = 'Emil' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'Database' OR CourseName = 'Software developmenet';
SELECT * FROM Students WHERE Address IS NULL;

-- 5

UPDATE Students SET Address = 'Ovcha Kupel 2' WHERE StudentID = 1;
UPDATE Courses SET CourseDescription = 'Chill and play some sports.' WHERE CourseName = 'PE';

-- 6

DELETE FROM Students WHERE FirstName = 'Viktor' AND LastName = 'Velkov';
DELETE FROM Courses WHERE CourseName = 'Software development';

-- 7

ALTER TABLE Students ADD COLUMN Email VARCHAR(100);
UPDATE Students SET Email = 'emil.m.kostadinov.2020@elsys-bg.org' WHERE StudentID = 1;
UPDATE Students SET Email = 'mkirilov@elsys-bg.org' WHERE StudentID = 2;


-- Let's review and grade the provided SQL code based on the assignment:

-- 1. **Database Creation**:
--    - The code correctly creates the `SchoolDB` database, deletes it first if it exists, and then sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with the necessary columns. **✔️**
--    - The `Courses` table is also correctly defined. **✔️**

-- 3. **Data Insertion**:
--    - Four student records are inserted into the `Students` table. All given values are correct and match the assignment. **✔️**
--    - Three courses are inserted into the `Courses` table. All given values are correct and match the assignment. **✔️**

-- 4. **Data Retrieval**:
--    - The query correctly retrieves students residing at 'Mala koria 21'. **✔️**
--    - It correctly retrieves students named 'Emil' born after the year 2000. **✔️**
--    - There's a typo in the course name 'Software developmenet' instead of 'Software development'. This query will return no results due to the typo. **❌**
--    - It correctly retrieves students without an address. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 1` is correctly updated. **✔️**
--    - The description of the 'PE' course is correctly updated. **✔️**

-- 6. **Data Deletion**:
--    - There's a typo in the student's first name. It's written 'Vikito' in the insertion but 'Viktor' in the deletion. The record won't be deleted due to this typo. **❌**
--    - The 'Software development' course is correctly deleted from the database. **✔️**

-- 7. **Bonus Task**:
--    - The `Email` column is added to the `Students` table without issues. **✔️**
--    - The emails for students with `StudentID = 1` and `StudentID = 2` are correctly updated. **✔️**

-- **Summary**:
-- The script is well constructed but contains two critical typos that affect the correct behavior in retrieving and deleting records.

-- **Grade**: 94/100

-- Areas of Improvement:
-- - Double-check the values and names used in the script to ensure consistency, especially when referring to previously inserted data.
-- - Make sure to test each query to confirm it behaves as expected.
