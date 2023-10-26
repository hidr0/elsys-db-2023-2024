CREATE DATABASE SchoolDB;

CREATE TABLE Students(
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Address VARCHAR(255)
);

CREATE TABLE Courses(
	CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDescription VARCHAR(255)
);

INSERT INTO Students(FirstName, LastName, DOB, Address) VALUES
('Ivan', 'Petrov', '2006-01-01', '123 Elm Street'),
('Ajvan', 'Pethrov', '1906-08-01', 'Stambolijski'),
('Ajvar', 'Marev', '1996-02-01', 'Stambolijski 1'),
('Ihtiman', 'Pethrovka', '1986-01-03', 'Stambolijski 2'),
('Vanka', 'Petrovka', '1976-11-07', 'Stambolijski 3');

INSERT INTO Courses(CourseName, CourseDescription) VALUES
('Math', 'Algebra and geometry'),
('BG', 'Pravila na pravopis'),
('Programming', 'Introduction to databases');

SELECT * FROM Students WHERE Address = '123 Elm Street';
SELECT * FROM Students WHERE FirstName = 'Ivan' AND DOB > '2000-01-01';
SELECT * FROM Courses WHERE CourseName = 'Math' OR 'BG';
SELECT * FROM Students WHERE Address IS NULL;

UPDATE Students
SET Address = '456 Oak Avenue'
WHERE StudentID = 3;

UPDATE Students
SET CourseDescription = 'An introduction to basic algebra and geometry.'
WHERE CourseName = 'Math';

DELETE FROM Student
WHERE FirstName = 'Ivan' AND LastName = 'Petrov';

DELETE FROM Courses
WHERE CourseName = 'Programming';

ALTER TABLE Students
ADD Email VARCHAR(255);

UPDATE Students
SET Email = 'ivan.petrov@mail.com'
WHERE StudentID = 1;

UPDATE Students
SET Email = 'ivan.petrovka@mail.com'
WHERE StudentID = 2;


-- Your script is mostly well-structured and follows the guidelines of the assignment. Here are the detailed observations and suggestions for each section of your script based on the given assignment:

-- 1. **Create a New Database**:
--    - The `CREATE DATABASE SchoolDB;` statement is correct and fulfills the requirement of creating a new database named `SchoolDB`.

-- 2. **Create Tables**:
--    - The `CREATE TABLE` statements for `Students` and `Courses` are correct with appropriate data types and primary keys as per the assignment.

-- 3. **Insert Data**:
--    - The `INSERT INTO` statements are correct and insert the specified number of records into the `Students` and `Courses` tables.

-- 4. **Retrieve Data**:
--    - The `SELECT` statements are almost correct. However, there's a mistake in the third `SELECT` statement:
--      ```sql
--      SELECT * FROM Courses WHERE CourseName = 'Math' OR 'BG';
--      ```
--      It should be corrected to:
--      ```sql
--      SELECT * FROM Courses WHERE CourseName = 'Math' OR CourseName = 'BG';
--      ```

-- 5. **Update Data**:
--    - The first `UPDATE` statement is correct, but the second `UPDATE` statement attempts to update the `Courses` table using incorrect column names and table name. It should be corrected to:
--      ```sql
--      UPDATE Courses
--      SET CourseDescription = 'An introduction to basic algebra and geometry.'
--      WHERE CourseName = 'Math';
--      ```

-- 6. **Delete Data**:
--    - The first `DELETE` statement is correct, but it has a typo in the table name. It should be `Students` instead of `Student`. It should be corrected to:
--      ```sql
--      DELETE FROM Students
--      WHERE FirstName = 'Ivan' AND LastName = 'Petrov';
--      ```
--    - The second `DELETE` statement is correct and will delete the course named 'Programming'.

-- 7. **Bonus Task**:
--    - The `ALTER TABLE` statement is correct and will add an `Email` column to the `Students` table.
--    - The subsequent `UPDATE` statements are correct and will update the email addresses for students with `StudentID = 1` and `StudentID = 2`.

-- Overall, your script performs the tasks as required by the assignment, with a few minor errors that need correction. It demonstrates a good understanding of SQL and database management. Once the mentioned errors are corrected, it would fully comply with the given assignment tasks.
-- 85 out of 100.
