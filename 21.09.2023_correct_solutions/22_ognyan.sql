drop database if exists db;
-- (1)

-- (2)
create database db;

-- (3)
use db;

-- (4), (5)
create table students (
	name varchar(255)
);

-- (6)
insert into students(name) values ("Gosho");
insert into students(name) values ("Pesho");
insert into students(name) values ("Kircho");
insert into students(name) values ("Christopher Balkanski");

-- (7)

select * from students;
