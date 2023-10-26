drop database if exists SchoolDB;
create database SchoolDB;
use SchoolDB;

create table Students (
	StudentID int primary key auto_increment,
    FirstName varchar(100), 
    LastName varchar(100),
    DOB int,
    Adress varchar(256)
);

create table Courses (
	CourseID int primary key auto_increment,
    CourseName varchar(50),
    CourseDescription varchar(256)
);

insert into Students(FirstName, LastName, DOB) values("penka", "lyubenova", 20040528);
insert into Students(FirstName, LastName, DOB) values("lyubo", "georgiev", 20030930);
insert into Students(FirstName, LastName, DOB, Adress) 
	values("pesho", "yordanov", 20050310, "ul. mariq luiza 35");
insert into Students(FirstName, LastName, DOB, Adress) 
	values("gosho", "yordanov", 20050310, "ul. mariq luiza 35");
insert into Students(FirstName, LastName, DOB, Adress) 
	values("bobi", "angelov", 20011204, "ul. sveta troica 61");
    
insert into Courses(CourseName) values("math"); 
insert into Courses(CourseName, CourseDescription) 
	values("it", "shte uchim broini sistemi"); 
insert into Courses(CourseName, CourseDescription) 
	values("bazi danni", "shte izuchavame mysql"); 
    
select * from Students where Adress = 'ul. mariq luiza 35';

select * from Students where FirstName = 'pesho' and DOB > 20010000;

select * from Courses where CourseName = 'math' or 'history';

select * from Students where Adress is null;

update Students set Adress = 'ul. nikolai kopernik 24' where StudentID = 2;

update Courses set CourseDescription = 'shte se zapoznaem sys stereometriq' where CourseName = 'math';

delete from Students where FirstName = 'lyubo';

delete from Courses where CourseName = 'it';

alter table Students add Email varchar(100);

update Students set Email = 'penkal@gmail.com' where StudentID = 1;

update Students set Email = 'lyubo3009@yahoo.com' where StudentID = 2;


-- Let's review the SQL script you provided:

-- 1. **Database Creation**:
--     - The existing `SchoolDB` database is dropped if it exists.
--     - A new database `SchoolDB` is created and set as the active database. **✔️**

-- 2. **Table Creation**:
--     - The `Students` table is created with columns: StudentID, FirstName, LastName, DOB (as an integer, which is an unusual choice for a date format but it's valid), and Adress (a typo in the column name). **✔️** with a note about the unusual date format and typo.
--     - The `Courses` table is created with columns: CourseID, CourseName, and CourseDescription. **✔️**

-- 3. **Data Insertion**:
--     - Five students are inserted into the `Students` table. The data provided seems to fit the structure of the table. **✔️**
--     - Three courses are inserted into the `Courses` table. **✔️**

-- 4. **Data Retrieval**:
--     - It fetches students living at 'ul. mariq luiza 35'. **✔️**
--     - Retrieves students named 'pesho' with DOB after January 1, 2001. **✔️**
--     - There's an error in fetching courses named 'math' or 'history'. The correct syntax should be:
--       ```sql
--       SELECT * FROM Courses WHERE CourseName = 'math' OR CourseName = 'history';
--       ```
--       Instead of using `OR` with just 'history'. **❌**
--     - Retrieves students without an address. **✔️**

-- 5. **Data Update**:
--     - The address of the student with `StudentID = 2` is updated. **✔️**
--     - The description of the 'math' course is updated. **✔️**

-- 6. **Data Deletion**:
--     - The student named 'lyubo' is deleted. **✔️**
--     - The 'it' course is deleted. **✔️**

-- 7. **Table Modification**:
--     - An 'Email' column is added to the `Students` table. **✔️**
--     - Emails are updated for students with specific StudentIDs. The second update for `StudentID = 2` won't work as expected since the student with that ID was deleted in step 6. **❌ for the second update**

-- **Summary**:
-- The script is mostly correct, with a couple of errors to note:
-- 1. The typo in the column name 'Adress' (it's usually spelled 'Address').
-- 2. The unusual choice of storing dates as integers.
-- 3. An error in the data retrieval of courses named 'math' or 'history'.
-- 4. The second email update which won't work as expected due to the deletion of the student.

-- **Grade**: 85/100 due to the mentioned errors.
