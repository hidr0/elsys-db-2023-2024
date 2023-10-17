-- (1) Проверяваме дали базата данни съществува
drop database if exists Students;

-- (2) Създаваме база данни
create database Students;

-- (3) Използваме базата данни от (2)
use Students;

-- (4) Създаваме таблица
-- (5) Добавяме колони
create table Students(
	id int unsigned auto_increment primary key,
    name  varchar(256),
    age int
);

-- (6) Добавяме редове
insert into Students(name, age) values ("Zhoro", 14);
insert into Students(name, age) values ("Vankata", 18);

-- (7) Проверяваме го
select * from Students;

