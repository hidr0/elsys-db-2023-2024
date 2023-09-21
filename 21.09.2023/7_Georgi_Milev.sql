-- 1;
drop database if exists georgi;
-- 2;
Create  database georgi;
-- 3;
use dnevnik;
-- 4,5;
create table dnevnik (
	years int,
    Firstname varchar(255),
    LastName varchar(255)
    );

-- 6;
insert into dnevnik (ID,Firstname,Lastname)
values (16,'Sasho','Petrov');
insert into dnevnik (ID,Firstname,Lastname)
values (14,'Gosho','Ivanov');
insert into dnevnik (ID,Firstname,Lastname)
values (15,'Pesho','Todorov');

