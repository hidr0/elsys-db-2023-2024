-- 1 create DB
DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;
-- 2 create tables
CREATE TABLE Students(
	StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName TINYTEXT,
    LastNAME TINYTEXT,
    DOB DATE,
    Address TINYTEXT
);
CREATE TABLE Courses(
	CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName TINYTEXT,
    CourseDescription TEXT
);
-- 3 insert data (very creative data, def writen manualy)
INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
('Jane', 'Doe', '1998-05-15', '123 Elm Street'),
('Alice', 'Smith', '2000-09-20', NULL),
('Michael', 'Johnson', '1999-03-10', '789 Oak Street'),
('Jhon', 'Davis', '2001-07-02', '123 Elm Street'),
('William', 'Brown', '1997-12-08', '234 Main Street');
INSERT INTO Courses (CourseName, CourseDescription)
VALUES
('Mathematics', 'Basic introduction to mathematics.'),
('History', 'Exploring world history through the ages.'),
('Programming 101', 'Advanced programming concepts and techniques.'),
('Physical Education', 'PE');
-- 4 retrieving the data
SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'Jhon' AND DOB >= '2001-01-01';
SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';
SELECT * FROM Students WHERE Address IS NULL;
-- 5 updateing the dataing
UPDATE Students
SET Address = '456 Oak Avenue'
WHERE StudentID = 3;

UPDATE Courses
SET CourseDescription = CONCAT(CourseDescription, ' An introduction to basic algebra and geometry.')
WHERE CourseName = "Mathematics";

DELETE FROM Students WHERE CONCAT(FirstName, '', LastName) = 'Jane Doe';
DELETE FROM Courses WHERE CourseName = "Physical Education";
-- 6 bonus round 
ALTER TABLE Students
ADD COLUMN Email TINYTEXT;

UPDATE Students
SET Email = 'something@google.kom'
WHERE StudentID = 1;

UPDATE Students
SET Email = 'something_else@bing.org'
WHERE StudentID = 2;

SELECT * FROM Students;

-- **Grading and Feedback**

-- Let's break down the provided solution according to the tasks:

-- 1. **Creation of Database:**
--    - Drops the `SchoolDB` database if it exists, creates it anew, and sets it for subsequent operations. **✔️**

-- 2. **Creation of Tables:**
--    - Both `Students` and `Courses` tables are created as outlined in the assignment with suitable data types and constraints. Using `TINYTEXT` for names and addresses is unorthodox as it lacks some optimizations present for other text types like `VARCHAR`, but it should still work. **✔️**

-- 3. **Data Insertion:**
--    - Five students and four courses are inserted into their respective tables. The comments added some humor to the "creative" manual data insertion. **✔️**

-- 4. **Data Retrieval:**
--    - The query to fetch students living at "123 Elm Street" is accurate. **✔️**
--    - The query to retrieve students named "Jhon" born on or after 2001 is correct. Note the typo in 'Jhon' rather than the more common 'John'. **✔️**
--    - The query for fetching courses named "Mathematics" or "History" is accurate. **✔️**
--    - The query to fetch students with a `NULL` address is correct. **✔️**

-- 5. **Data Updating:**
--    - The address of the student with `StudentID = 3` is updated as specified. **✔️**
--    - The description of the "Mathematics" course is updated by appending to the existing description using the `CONCAT()` function. This approach maintains the original description while adding the specified text, which is a good touch. **✔️**

-- 6. **Data Deletion:**
--    - There's a slight issue in the query that attempts to delete a student named "Jane Doe". The `CONCAT` function has an extra pair of quotes which may prevent the operation from matching the name correctly. Instead, it should be `CONCAT(FirstName, ' ', LastName) = 'Jane Doe'`. **❌**
--    - The "Physical Education" course is correctly deleted. **✔️**

-- 7. **Bonus Task:**
--    - The `ALTER TABLE` operation adds an `Email` column to the `Students` table. **✔️**
--    - The email addresses for students with `StudentID = 1` and `StudentID = 2` are updated correctly. **✔️**
--    - A final select statement displays the contents of the `Students` table. **✔️**

-- **Summary:** 

-- The solution is well-structured, organized, and follows the task requirements closely. Most operations are correct, with just one minor oversight in the deletion task. 

-- **Grade:** 98/100 (Deduction due to the deletion error)

-- Good work!
