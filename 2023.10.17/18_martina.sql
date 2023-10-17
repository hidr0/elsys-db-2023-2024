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