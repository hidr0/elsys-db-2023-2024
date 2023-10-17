drop database if exists classwork3;
create database classwork3;
use classwork3;

create table students(
id int primary key auto_increment,
name varchar (64),
age int
);

insert into students(name) values("Misho");
insert into students(name, age) values("Diju", 26);
insert into students(name, age) values("Gosho", 22);
insert into students(name, age) values("a", 25);
insert into students(name, age) values("c", 23);
insert into students(name, age) values("Pepi", 21);
insert into students(name, age) values("Stefi", 24);

select * from students
Where 20 < age and 26 > age;

select * from students
Where not (age=20);


select * from students
Where not (age=20)
order by age asc;



 -- да са четни подредени НАДОЛУ
select * from students
Where not (age%2=1)
order by age desc;

 -- да са НЕчетни подредени НАДОЛУ
select * from students
Where not (age%2=0)
order by age desc;

 -- да са четни подредени НАГОРЕ
select * from students
Where not (age%2=1)
order by age desc;

 -- да са НЕчетни подредени НАГОРЕ
select * from students
Where not (age%2=0)
order by age asc;