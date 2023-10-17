-- (1)
drop database if exists children;  
-- (2)
create database children;
-- (3)
use children;
-- (4) (5) 
create table students(
	name tinytext,
    age tinyint
);
-- (6) 
insert into students values("Gosho", 127);
insert into students values("Pesho", 12);
-- (7) gosho is about 127 i think
