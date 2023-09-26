-- 1;
drop database if exists dnevnik;
-- 2;
Create  database dnevnik;
-- 3;
use dnevnik;
-- 4,5;
create table dnevnik (
	id serial primary key,
    firstname varchar(255),
    lastName varchar(255)
    );

-- 6;
insert into dnevnik (firstname,lastname)
values ('Sasho','Petrov');
insert into dnevnik (firstname,lastname)
values ('Gosho','Ivanov');
insert into dnevnik (firstname,lastname)
values ('Pesho','Todorov');

-- 7;
select * from dnevnik;
