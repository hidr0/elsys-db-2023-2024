DROP DATABASE IF EXISTS SchoolDB;

-- Create a New Database
CREATE DATABASE SchoolDB;

USE SchoolDB;

-- Create Tables
CREATE TABLE Students (
    StudentID int AUTO_INCREMENT PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    DOB DATE,
    Address varchar(255)
);

CREATE TABLE Courses (
    CourseID int AUTO_INCREMENT PRIMARY KEY,
    CourseName varchar(255),
    CourseDescription varchar(255)
);

-- Insert Data
INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES
('Ivan', 'Pethrovka', '2001/9/11', '123 Elm Street'),
('Ivan', 'Mateevich', '1939/1/9', '123 Elm Street'),
('Dragan', 'Draganov', '2019/12/24', '456 Oak Avenue'),
('Petkan', 'Debilov', '2005/9/5', NULL),
('Broski', 'Uspasov', '2020/2/20', '789 Maple Lane');

INSERT INTO Courses (CourseName, CourseDescription) VALUES
('Mathematics', 'Basic arithmetic operations'),
('History', 'A study of historical events'),
('PE', 'Physical fitness and health');

-- Retrieve Data
SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'Ivan' AND DOB > '2000/1/1';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

-- Update Data
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = CONCAT(CourseDescription, ' An introduction to basic algebra and geometry.')
WHERE CourseName = 'Mathematics';

-- Delete Data
DELETE FROM Students WHERE FirstName = 'Dragan' AND LastName = 'Draganov';

DELETE FROM Courses WHERE CourseName = 'PE';



-- Let's break down and grade the provided SQL script:

-- 1. **Database Creation**:
--    - The script correctly starts by checking if the `SchoolDB` database exists and drops it if it does. Then, it creates the `SchoolDB` database and sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with the necessary columns: StudentID, FirstName, LastName, DOB, and Address. **✔️**
--    - The `Courses` table is also correctly defined with the necessary columns: CourseID, CourseName, and CourseDescription. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are inserted into the `Students` table. All values seem correct, fitting the given format and data types. **✔️**
--    - Three courses are inserted into the `Courses` table. Again, all values are accurate and adhere to the specified data types. **✔️**

-- 4. **Data Retrieval**:
--    - The query correctly retrieves students residing at '123 Elm Street'. **✔️**
--    - It correctly retrieves students named 'Ivan' born after the year 2000. **✔️**
--    - It correctly retrieves records from the `Courses` table with course names 'Mathematics' or 'History'. **✔️**
--    - It correctly retrieves students without an address (in this case, one student). **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is correctly updated. **✔️**
--    - The description of the 'Mathematics' course is correctly updated, appending the new text to the original description using the `CONCAT` function. **✔️**

-- 6. **Data Deletion**:
--    - It correctly deletes the student named 'Dragan Draganov'. **✔️**
--    - The delete statement correctly deletes the course named 'PE'. **✔️**

-- **Note**: One of the student last names, "Debilov", may be viewed as inappropriate or offensive in some contexts, especially in Slavic languages where it might translate to something negative. It's essential to be mindful and respectful when creating example data.

-- **Summary**:
-- The script is well-structured and correctly executes all the specified tasks.

-- **Grade**: 100/100

-- Recommendation:
-- - Always use appropriate and respectful naming and descriptions, especially in a professional or academic setting.
