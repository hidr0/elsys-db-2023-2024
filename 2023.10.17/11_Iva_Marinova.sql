DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

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
    ('Iva', 'Marinova', '2006-6-22', '123 Elm Street'),
    ('Jane', 'Doe', '2000-01-12', '123 Elm Street'),
    ('John', 'Rusev', '2007-01-12', 'Sofia'),
    ('Nikola', 'Nikolov', '1980-08-01', 'Varna'),
    ('Tommy', 'Tomev', '1970-12-02', NULL);

INSERT INTO Courses (CourseName, CourseDescription)
VALUES
    ('Physical education', 'Lets be healthy!'),
    ('History', 'What happened is important'),
    ('Mathematics', 'We do not know what is happening !'),
    ('Science', 'Explore your dreams');

SELECT * FROM Students 
WHERE Address = '123 Elm Street';

SELECT * FROM Students
WHERE FirstName = 'John' AND DOB > '2000-01-01';

SELECT * FROM Courses 
WHERE CourseName = 'Mathematics' OR CourseName = 'History';

SELECT * FROM Students 
WHERE Address IS NULL;

UPDATE Students SET Address = '456 Oak Avenue' 
WHERE StudentID = 3;

UPDATE Courses SET CourseDescription = 'An introduction to basic algebra and geometry.'
WHERE CourseName = 'Mathematics' AND CourseID = (SELECT CourseID FROM (SELECT CourseID FROM Courses WHERE CourseName = 'Mathematics' LIMIT 1) AS subquery);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Students 
WHERE FirstName = 'Jane' AND LastName = 'Doe';

DELETE FROM Courses 
WHERE CourseName = 'Physical Education';

ALTER TABLE Students ADD Email VARCHAR(100);

UPDATE Students SET Email = 'john.doe@example.com'
WHERE StudentID = 1 || StudentID = 2;

SET SQL_SAFE_UPDATES = 1;
DESCRIBE Students;

-- Let's review and grade the provided SQL code based on the assignment:

-- 1. **Database Creation**:
--    - The code correctly creates the `school` database, deletes it first if it exists, and then sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is correctly defined with the necessary columns. **✔️**
--    - The `Courses` table is also correctly defined. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are inserted into the `Students` table. All given values are correct and match the assignment. **✔️**
--    - Four courses are inserted into the `Courses` table. All given values are correct and match the assignment. **✔️**

-- 4. **Data Retrieval**:
--    - The query correctly retrieves students residing at '123 Elm Street'. **✔️**
--    - It correctly retrieves students named 'John' born after the year 2000. **✔️**
--    - It correctly retrieves records from `Courses` table with course names 'Mathematics' or 'History'. **✔️**
--    - It correctly retrieves students without an address. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is correctly updated. **✔️**
--    - The description of the 'Mathematics' course is correctly updated using a subquery to avoid the MySQL error of updating a table while selecting from the same table. This is a more advanced solution and works perfectly. **✔️**

-- 6. **Data Deletion**:
--    - It correctly deletes the student with the first name 'Jane' and last name 'Doe'. **✔️**
--    - The course name in the deletion query is 'Physical Education' while in the insertion it was 'Physical education'. The casing is different which means the delete statement will not delete any records. **❌**

-- 7. **Table Alteration and Data Update**:
--    - The `Email` column is added to the `Students` table. **✔️**
--    - The `Email` is updated for the students with `StudentID = 1` and `StudentID = 2`. However, the logical OR (`||`) operator in SQL is typically represented by the `OR` keyword, not `||`. This mistake might lead to unexpected results. **❌**

-- 8. **Miscellaneous**:
--    - The `SET SQL_SAFE_UPDATES` command is used to temporarily disable the safe update mode in MySQL, which is good for avoiding accidental updates or deletions without a WHERE clause specifying a key column. It's then re-enabled after the operations. **✔️**
--    - The `DESCRIBE Students;` command is used at the end, presumably to confirm the structure of the `Students` table after all operations, which is good for debugging. **✔️**

-- **Summary**:
-- The script is well structured, but there are a couple of issues to be aware of, specifically in data deletion and the logical OR operator.

-- **Grade**: 93/100

-- Areas of Improvement:
-- - Double-check the values and names used in the script to ensure consistency.
-- - Use the `OR` keyword for logical OR operations in SQL instead of `||`.
-- - Always be cautious when toggling `SQL_SAFE_UPDATES`, as it can lead to unintended consequences if not used carefully.
