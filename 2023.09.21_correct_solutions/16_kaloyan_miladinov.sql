-- (1) Proverqvane dali sushtestvuva i ako da se trie
drop database if exists students;
-- (2) Suzdavane na db, ako ne sushtestvuva
create database students;
-- (3) Izpolzvane na db
use students;
-- (4, 5) Suzdavane na tablica
create table if not exists students(
id int auto_increment primary key, 
firstname char(255), 
lastname char(255), 
age int
);
-- (6) Vmukvane na danni
insert into students (firstname, lastname, age) values ("Georgi", "Ivanov", 17);
insert into students (firstname, lastname, age) values ("Ivan", "Georgiev", 16);
-- (7) Proverqvane
select * from students;
select * from students where firstname = "Ivan"