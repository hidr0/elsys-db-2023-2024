-- (1) Create a new database
drop database if exists SchoolDB;
create database SchoolDB;
use SchoolDB;

-- (2) Create tables
create table Students (
    StudentID serial primary key,
    FirstName varchar(255),
    LastName varchar(255),
    DOB date,
    Address varchar(255)
);

create table Courses (
    CourseID serial primary key,
    CourseName varchar(255),
    CourseDescription varchar(255)
);

-- (3) Insert data
insert into Students (FirstName, LastName, DOB, Address)
values
    ('John', 'Smith', '2002-03-15', '123 Elm Street'),
    ('Jane', 'Doe', '1999-06-22', '456 Oak Avenue'),
    ('Mary', 'Johnson', '2001-07-10', '123 Elm Street'),
    ('David', 'Wilson', '2000-11-30', '789 Maple Lane'),
    ('Sarah', 'Brown', '2003-05-05', NULL);

insert into Courses (CourseName, CourseDescription)
values
    ('Mathematics', 'An introduction to basic algebra and geometry.'),
    ('History', 'Exploring world history'),
    ('Science', 'Understanding the principles of physics');

-- (4) Retrieve data
select * from Students where Address = '123 Elm Street';
select * from Students where FirstName = 'John' and DOB >= '2001-01-01';
select * from Courses where CourseName = 'Mathematics' or CourseName = 'History';
select * from Students where Address is null;

-- (5) Update Data
update Students
set Address = '456 Oak Avenue'
where StudentID = 3;

update Courses
set CourseDescription = 'An introduction to basic algebra and geometry.'
where CourseName = 'Mathematics';

-- (6) Delete Data
delete from Students where FirstName = 'Jane' and LastName = 'Doe';

-- (7) Bonus Task: Alter table and updates
alter table Students
add Email varchar(255);

update Students
set Email = 'john.smith@example.com'
where StudentID = 1;

update Students
set Email = 'jane.doe@example.com'
where StudentID = 2;


-- **Grading and Feedback**

-- Let's assess the provided solution step by step:

-- 1. **Creation of Database:**
--    - Drops the `SchoolDB` database if it exists, creates it anew, and uses it for subsequent operations. **✔️**

-- 2. **Creation of Tables:**
--    - `Students` and `Courses` tables are created with appropriate fields. The use of `serial` indicates a PostgreSQL database, as this datatype is specific to PostgreSQL and is used for auto-incrementing integer columns. **✔️**

-- 3. **Data Insertion:**
--    - Five student records and three course records are correctly inserted into their respective tables. **✔️**

-- 4. **Data Retrieval:**
--    - Fetches students living at "123 Elm Street" correctly. **✔️**
--    - Retrieves students named "John" born on or after 2001 correctly. **✔️**
--    - Accurately fetches courses named "Mathematics" or "History". **✔️**
--    - Correctly fetches students with a `NULL` address. **✔️**

-- 5. **Data Update:**
--    - The address of the student with `StudentID = 3` is updated as specified. **✔️**
--    - The description of the "Mathematics" course is updated, but it's redundant since the description being set is the same as the one inserted earlier. While not wrong, this may be unnecessary unless there was an expectation of a different description initially. **✔️**

-- 6. **Data Deletion:**
--    - The student named "Jane Doe" is correctly deleted from the database. **✔️**

-- 7. **Bonus Task:**
--    - The `ALTER TABLE` operation adds an `Email` column to the `Students` table. **✔️**
--    - The email addresses for students with `StudentID = 1` and `StudentID = 2` are updated correctly. However, note that `StudentID = 2` corresponds to 'Jane Doe' who was deleted in the previous step, so this update operation would not affect any rows. **✔️**

-- **Summary:** 

-- The solution is comprehensive, clear, and meets the task requirements. There's a minor oversight in updating the email for a deleted student.

-- **Grade:** 99/100 (One point deduction due to the redundant update for a deleted student)

-- Well done!
