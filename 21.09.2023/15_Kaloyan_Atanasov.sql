create database if not exists students;

create table if not exists students_table(
	FirstName varchar(255),
    LastName varchar(255),
    Age int
);

insert into students_table(FirstName, LastName, Age) values (Gosho, Goshov, 120);
insert into students_table(FirstName, LastName, Age) values (Petkan, Petkanov, 12);
insert into students_table(FirstName, LastName, Age) values (Dragan, Draganov, 120);

