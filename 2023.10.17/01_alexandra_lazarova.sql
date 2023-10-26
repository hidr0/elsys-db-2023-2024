DROP DATABASE IF EXISTS SchoolDB;
CREATE DATABASE SchoolDB;
USE SchoolDB;

DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(100),
    Email VARCHAR(100)
);

DROP TABLE IF EXISTS Courses;
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT
);

INSERT INTO Students (FirstName, LastName, DOB, Address)
VALUES
    ('Ali', 'Lazarova', '2006-02-17', '123 Elm Street'),
    ('Iva', 'Marinova', '2006-06-22', '234rp'),
    ('Zlati', 'Antov', '2004-07-29', '123 Elm Street'),
    ('Kati', 'Dimitrova', '2005-06-12', '456zatvor'),
    ('Andi', 'Gotiniq', '2003-10-30', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Mathematics', 'An advanced course in mathematics.'),
    ('History', 'A comprehensive study of world history.'),
    ('Science', 'Exploring the wonders of the natural world.');

SELECT * FROM Students WHERE Address = '123 Elm Street';

SELECT * FROM Students WHERE FirstName = 'Zlati' AND DOB > '2000-01-01';

SELECT * FROM Courses WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.' WHERE CourseName = 'Mathematics';

DELETE FROM Students WHERE FirstName = 'Zlati' AND LastName = 'Antov';

DELETE FROM Courses WHERE CourseName = 'Physical Education';

ALTER TABLE Students ADD COLUMN Email VARCHAR(100);

UPDATE Students
SET Email = 'ali@example.com'
WHERE StudentID IN (1, 2);

-- Grading and Feedback

-- Overall, the solution you've provided follows the specifications provided in the assignment tasks quite closely. Here's the feedback:

-- Creation of Database and Tables:
-- The script first checks if the database SchoolDB exists and drops it if it does. Then, it proceeds to create the SchoolDB database and sets it as the default for subsequent operations. This approach ensures a fresh start every time the script is run. ✔️
-- The Students and Courses tables are created as specified, with appropriate data types and constraints. ✔️
-- Insertion of Data:
-- Data insertion for both the Students and Courses tables is correct. Five students and three courses are inserted as described in the tasks. ✔️
-- Data Retrieval:
-- The query to fetch students living at "123 Elm Street" is accurate. ✔️
-- The query to retrieve students named "Zlati" born after 2000 is correct. ✔️
-- The query for fetching courses named "Mathematics" or "History" is accurate. ✔️
-- The query to fetch students with a NULL address is correct. ✔️
-- Data Update:
-- The update for the address of the student with StudentID = 3 is correct. ✔️
-- The update for the course description of "Mathematics" matches the task's requirement. ✔️
-- Data Deletion:
-- The student named "Zlati Antov" is correctly deleted. ✔️
-- There's a minor issue in the deletion task. The script attempts to delete a course named "Physical Education", but this course wasn't added in the data insertion step. Therefore, this operation would have no effect. ❌
-- Bonus Task:
-- The ALTER TABLE operation adds an Email column to the Students table as specified. ✔️
-- The update operation to set email addresses for students with StudentID = 1 and StudentID = 2 is accurate. ✔️
-- Summary:

-- The solution is very well-structured, and the SQL commands are appropriately written. Most tasks are correctly implemented. One minor error was noticed in the deletion task, where an attempt to delete a non-existent course was made. Make sure to double-check the requirements and the implemented solution to ensure every task is addressed accurately.

-- Grade: 98/100 (Deduction due to the deletion error)

-- Great job!
