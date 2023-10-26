
-- New database creation (1)
DROP DATABASE IF EXISTS SchoolDB;

CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Table creation (2)
CREATE TABLE Students (
StudentID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(255),
LastName VARCHAR(255),
DOB DATE, 
Address VARCHAR(255)
);

CREATE TABLE Courses (
CourseID INT AUTO_INCREMENT PRIMARY KEY,
CourseName VARCHAR(255),
CourseDescription VARCHAR(255)
);

-- Data insertion (3)
INSERT INTO Students (FirstName, LastName, DOB, Address) VALUES 
('John', 'Smith', '2000-05-15', '123 Elm Street, Anytown'), 
('Sarah', 'Johnson', '2001-08-22', '456 Elm Avenue, Anothercity'),
('Michael', 'Davis', '1999-12-10', '789 Oak Lane, Sometown'),
('Emily', 'Brown', '2002-03-30', '101 Pine Road, Yourtown'),
('James', 'Wilson', '2003-07-05', '555 Cedar Drive, Hometown');

INSERT INTO Courses (CourseName, CourseDescription) VALUES
('History', 'An introductory course in history covering major historical events and civilizations.'),
('Mathematics', 'An introductory course in mathematics covering algebra, calculus, and mathematical principles.'),
('Physical Education', 'A physical education course focusing on fitness, sports, and overall well-being.');

-- Data retrieaval (4)
SELECT * FROM Students WHERE Address='123 Elm Street';
SELECT * FROM Students WHERE FirstName='John' AND DOB>'2000-01-01';
SELECT * FROM Courses WHERE CourseName='Mathematics' OR CourseName='History';
SELECT * FROM Students WHERE Address IS NULL;

-- Updating data (5)
UPDATE Students SET Address='456 Oak Avenue' WHERE StudentID=3;
UPDATE Courses SET CourseDescription='An introduction to basic algebra and geometry.' WHERE CourseName='Mathematics';

-- Deleting data (6)
DELETE FROM Students WHERE FirstName='Jane' AND LastName='Doe';
DELETE FROM Courses WHERE CourseName='Physical Education';

-- Bonus task 
ALTER TABLE Students ADD Email VARCHAR(255);
UPDATE Students SET Email = 'johndoe@example.com' WHERE StudentID = 1;
UPDATE Students SET Email = 'sarahjohnson@example.com' WHERE StudentID = 2;


-- Let's evaluate the provided SQL script:

-- 1. **Database Creation**:
--    - The script successfully checks if the `SchoolDB` database exists, drops it if necessary, creates a new `SchoolDB` database, and sets it as the active database. **✔️**

-- 2. **Table Creation**:
--    - The `Students` table is appropriately defined with columns: StudentID, FirstName, LastName, DOB, and Address. **✔️**
--    - The `Courses` table is also aptly defined with columns: CourseID, CourseName, and CourseDescription. **✔️**

-- 3. **Data Insertion**:
--    - Five student records are entered into the `Students` table. All the values appear to be accurate and fit the prescribed format and data types. **✔️**
--    - Three courses are inserted into the `Courses` table, with values that match the specified data types. **✔️**

-- 4. **Data Retrieval**:
--    - The script fetches students with the address '123 Elm Street'. **✔️**
--    - It retrieves students named 'John' born after January 1, 2000. **✔️**
--    - It pulls records from the `Courses` table with course names 'Mathematics' or 'History'. **✔️**
--    - It fetches students without an address. In this particular dataset, no students have null addresses, so the result set would be empty. **✔️**

-- 5. **Data Update**:
--    - The address of the student with `StudentID = 3` is correctly updated. **✔️**
--    - The description of the 'Mathematics' course is also updated successfully. **✔️**

-- 6. **Data Deletion**:
--    - The script aims to delete a student named 'Jane Doe'. However, there is no 'Jane Doe' in the initial data insertion, which means this query will have no effect on the data. **❌** *(but not incorrect in structure)*
--    - The delete statement successfully removes the 'Physical Education' course. **✔️**

-- 7. **Table Modification**:
--    - An 'Email' column is added to the `Students` table. **✔️**
--    - Emails are correctly updated for the students with `StudentID = 1` and `StudentID = 2`. **✔️**

-- **Summary**: The script is generally well-structured and properly accomplishes most of the given tasks. The only point of concern is the deletion of 'Jane Doe', who doesn't exist in the dataset. This doesn't introduce any error, but it's unnecessary.

-- **Grade**: 98/100 (The structure and commands are all correct, but one deletion is unnecessary given the provided dataset.)
