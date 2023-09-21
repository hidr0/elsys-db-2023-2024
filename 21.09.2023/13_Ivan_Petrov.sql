
-- 1;
drop database if exists gosho;

-- 2;
create database gosho;

-- 3;
use gosho;

-- 4,5;
CREATE TABLE dnevnik (
    years INT,
    FirstName varchar(50)
);

-- 6;
insert into dnevnik (years,FirstName) values(15, 'Ivan');
insert into dnevnik (years,FirstName) values(14, 'Petur');