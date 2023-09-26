-- 1;
DROP DATABASE IF EXISTS gosho;

-- 2;
CREATE database gosho;

-- 3;
USE gosho;

-- 4,5;
CREATE TABLE dnevnik (
	id int AUTO_INCREMENT PRIMARY KEY,
	years int,
	FirstName varchar(100)
);

-- 6;
insert into dnevnik (years,FirstName) values(15, 'Ivan');
insert into dnevnik (years,FirstName) values(14, 'Petur');

-- 7;
SELECT * FROM dnevnik;
