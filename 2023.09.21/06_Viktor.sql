/* (1) */
drop database if exists class;

/* (2) */
create database class;

/* (3) */
use class;

/* (4, 5) */
create table students (
	FullName varchar(255) not null,
    Age int not null
);

/* (6) */
insert into students (FullName, Age)
values ("Ivan I", 12);
insert into students (FullName, Age)
values ("Ivan II", 46);

/* (7) */
select * from class.students;