
-- 1
drop database if exists gosho;

-- 2
create database gosho; 


-- 3
Use gosho;

-- 4, 5
CREATE TABLE TableName (
    age INT,
    _name varchar(10)
);

-- 6
INSERT INTO TableName (age, _name) VALUES (17, 'Stefan');
INSERT INTO TableName (age, _name) VALUES (2, 'Emil');

-- 7
SELECT * FROM TableName;


