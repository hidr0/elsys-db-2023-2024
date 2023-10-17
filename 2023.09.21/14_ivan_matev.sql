-- 1. Proverka za sushtestvuvane
Drop database if exists gosho;
-- 2. Suzdavane na databaza 
create database gosho;
-- 3. Izpolzvane na databaza 
use gosho;
-- 4. suzadavane na datbaza + 5. Dobavqne na koloni
CREATE TABLE Students (
    Age int,
    Student_Name varchar(255)
);
-- 6. Insert 
INSERT INTO Students  
(Age, Student_Name)  
VALUES  
(17, "Ivan");
-- 7. Proverqvame 
SELECT * FROM gosho.students;