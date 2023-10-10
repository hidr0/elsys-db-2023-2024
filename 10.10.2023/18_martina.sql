drop database if exists classwork3;
create database classwork3;
use classwork3;

create table Students(
	id int primary key auto_increment,
    name varchar(64),
    age int
);

insert into Students(name) values("typak");
insert into Students(name, age) values ("grisho", 19);
insert into Students(name, age) values("pesho", 17);
insert into Students(name, age) values("gosho", 17);
insert into Students(name, age) values("mayura", 18);
insert into Students(name, age) values("???", 16);


select * from Students;
select name, age from Students;
select age, name from Students;
select age, age, age, name from Students;

select * from Students where age >= 18;

select * from Students where age < 18 and age > 16;

select * from Students where not age = 19 order by age asc;

select * from Students where not age = 19 order by age desc;

select * from Students where age is null;

select * from Students where age is not null;

-- избираме всички ученици, които имат възраст
select name from Students where age is not null;

-- избираме всички ученици, които имат име
select age from Students where name is not null;

-- избираме всички имена на ученици, които имат години и ги сортираме от най-голям към най-малък
select name from Students where age is not null order by age desc;
