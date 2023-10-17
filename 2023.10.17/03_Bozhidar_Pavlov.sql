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
