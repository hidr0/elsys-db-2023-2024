-- Създаване на базата данни
CREATE DATABASE SchoolDB;

-- Използване на базата данни
USE SchoolDB;

-- Създаване на таблицата "Students"
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100),
);

-- Създаване на таблицата "Courses"
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription TEXT
);

-- Вмъкване на данни в таблицата "Students"
INSERT INTO Students (FirstName, LastName, DOB, Address, Email) VALUES
('John', 'Doe', '2001-05-15', '123 Elm Street'),
('Jane', 'Smith', '1999-08-10', '123 Elm Street'),
('Michael', 'Johnson', '2002-03-20', '456 Oak Avenue'),
('Sarah', 'Williams', '2000-12-05', NULL),
('John', 'Brown', '2003-02-18', '789 Maple Drive');

-- Вмъкване на данни в таблицата "Courses"
INSERT INTO Courses (CourseName, CourseDescription) VALUES
('Mathematics', 'An introduction to basic algebra and geometry.'),
('History', 'A survey of world history events.'),
('Chemistry', 'Fundamental principles of chemistry.');

-- Извличане на студентите, които живеят на "123 Elm Street"
SELECT * FROM Students WHERE Address = '123 Elm Street';

-- Извличане на студентите на име "John", родени след 2000 година
SELECT * FROM Students WHERE FirstName = 'John' AND DOB > '2000-01-01';

-- Извличане на курсовете "Mathematics" или "History"
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

-- Извличане на студентите с адрес NULL
SELECT * FROM Students WHERE Address IS NULL;

-- Обновяване на адреса на студента с ID = 3
UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

-- Изтриване на студент с име "Jane Doe"
DELETE FROM Students WHERE FirstName = 'Jane' AND LastName = 'Smith';

-- Изтриване на курса "Physical Education"
DELETE FROM Courses WHERE CourseName = 'Physical Education';

-- Добавяне на новата колона "Email" към таблицата "Students"
ALTER TABLE Students ADD COLUMN Email VARCHAR(100);

-- Обновяване на записите на студентите с ID = 1 и 2 с имейл адреси
UPDATE Students SET Email = 'john.doe@example.com' WHERE StudentID = 1;
UPDATE Students SET Email = 'jane.smith@example.com' WHERE StudentID = 2;


-- Your SQL script does the following:

-- 1. **Database Creation**:
--     - Creates a new database named `SchoolDB` and sets it as the current database.

-- 2. **Table Creation**:
--     - Creates a `Students` table. 
--     - Creates a `Courses` table. 

-- 3. **Data Insertion**:
--     - Inserts 5 student records into the `Students` table.
--     - Inserts 3 course records into the `Courses` table.

-- 4. **Data Retrieval**:
--     - Retrieves students living at '123 Elm Street'.
--     - Retrieves students named 'John' who were born after January 1, 2000.
--     - Retrieves courses named 'Mathematics' or 'History'.
--     - Retrieves students who don't have an address specified.

-- 5. **Data Update**:
--     - Updates the address for the student with `StudentID = 3`.

-- 6. **Data Deletion**:
--     - Deletes the student named 'Jane Smith'.
--     - Tries to delete a course named 'Physical Education', but this course does not exist in your inserted data.

-- 7. **Table Alteration**:
--     - Adds a new column `Email` to the `Students` table.

-- 8. **Further Data Update**:
--     - Updates the email address for two students.

-- **Issues**:
-- 1. There's a comma at the end of the columns list in the `Students` table definition, which would cause a syntax error. Remove the trailing comma after the `Address VARCHAR(100)` line.
   
-- 2. You have a mismatch in your operations. You are trying to insert an `Email` column into `Students` before you've actually created that column. The INSERT statement for students tries to insert into an 'Email' column that doesn't exist yet.
   
-- 3. You're trying to delete from a course named 'Physical Education' that doesn't exist in the data you've inserted.

-- **Recommendations**:
-- 1. Remove the trailing comma in the `Students` table definition.
-- 2. Either move the `ALTER TABLE Students ADD COLUMN Email VARCHAR(100);` statement to be before the student insertion or remove the `Email` from the student insertion statement.
-- 3. You might want to remove the DELETE statement for 'Physical Education' or add an INSERT statement that adds this course if the intent is to demonstrate a DELETE operation.

-- Once these issues are addressed, your script should run without errors.
