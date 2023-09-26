-- (1)
drop database if exists uchenici;

-- (2)
create database uchenici;

-- (3) (new)
use uchenici;

-- (4) (5)
create table uchenici(
	id int auto_increment primary key,
    name varchar(256),
    age int
);

-- (6)
insert into students(name, age)
values ("grisho", 19);

insert into students(name, age)
values ("mayura", 18);

insert into students(name, age)
values ("pesho", 17);

insert into students(name, age)
values ("gosho", 17);

-- (7)
select * from uchenici;