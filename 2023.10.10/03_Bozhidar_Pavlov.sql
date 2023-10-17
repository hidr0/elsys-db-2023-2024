drop database if exists classwork3;
create database classwork3;
use classwork3;

create table students(
    id serial primary key,
    name varchar(64),
    age int,
    num_frogs tinyint default 2
);

insert into students(name)
values
    ("Misho bez godini");

insert into students(name, age)
values
    ("Misho", 26),
    ("Gosho", 20),
    ("Pepi", 21),
    ("Stefi", 24),
    ("Ivan", 15);

select * from students;
select name, age from students;
select age, name from students;
select age, age, age, age, age+1 from students;

select if(age<18, 18-age, null) as years_until_18
from students;

select *
from students
where age < 20 or age > 23;

select *
from students
where age != 20
order by age DESC;

select name
from students
where age is null;

select name
from students
where not age is null;

-- Всичките ученици, чиито имена имат със 17 букви повече от възрастта им, подредени лексикографски по име
select *
from students
where length(name) + 17 = age
order by name asc;

-- По едно изречение на всеки ученик, подредени по възраст в низходящ ред
select concat(name, " is ", age, if(age != 1, " years old", "year old"), ".")
from students
order by age desc;

-- Хиперлинк към страницата на всеки един ученик в staging сървъра, подредени по id, които имат години
select concat("https://staging.elsys-bg.org/years/2023/students/", id)
from students
where age is not null
order by id;

-- Броя на учениците по най-оптималния начин (https://youtu.be/H6juZ8c_Nu8)
select count(*)
from students;

insert into students (name, age, num_frogs)
values ("Aleksandra", 17, 35);

-- Всички ученици, които имат с 18 повече жаби, отколкото възрастта им
select name
from students
where num_frogs = age + 18
order by
    name desc,
    age asc;
