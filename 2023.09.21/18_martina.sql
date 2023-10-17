drop database if exists gosho;
create database gosho;

-- (1)
drop database if exists students;
-- (2) 
create database student;
-- (3)
-- select * from students;
-- (4, 5)
create table students (
	name varchar(255),
    age int
);
-- (6)
insert into students
values ("grisho", 19);

insert into students
values ("mayura", 18);

insert into students 
values ("pesho", 17);

insert into students
values ("gosho", 17);
-- (7)
select * from students 
where age is not null;