-- (1)
drop database if exists students;

-- (2) 
create database student;

-- (3)
use students;
-- (4, 5)
create table students (
	id int auto_increment primary key,
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
select * from students;