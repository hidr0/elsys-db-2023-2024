-- (1) Проверяваме дали базата данни съществува
drop database if exists students;

-- (2) Създаваме база данни
create database students;

-- (3) Използваме базата данни от (2)
use students;

-- (4) Създаваме таблица
-- (5) Добавяме колони
create table students(
	id int unsigned primary key auto_increment,
    name  varchar(256),
    age int
);

-- (6) Добавяме редове
insert into students(name, age) 
values ("Zhoro", 14), ("Vankata", 18);

-- (7) Проверяваме го
describe students;
select * from students;

