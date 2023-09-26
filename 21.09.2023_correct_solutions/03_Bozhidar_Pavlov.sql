-- (1) Проверяваме дали базата данни съществува
drop database if exists students;

-- (2) Създаваме база данни
create database students;

-- (3) Използваме базата от (2)
use students;

-- (4) Създаваме таблици
-- (5) Добавяме колони
create table students(
	id serial primary key,
	name varchar(255),
	age smallint
);

-- (6) Добавяме редове
insert into students(name, age)
values
	("Мишо", 2),
	("Иван", 3);

-- (7) Проверяваме го
show tables;
select * from students;
