-- Checking if database exists
DROP DATABASE IF EXISTS gosho;
-- Creating database
CREATE DATABASE gosho;
-- Using database
USE gosho;
-- Creating table
CREATE TABLE  People (
	PersonName varchar(255),
    PersonAge int
);
-- Add rows
INSERT INTO People (PersonName, PersonAge)
VALUES ('Mladen Stankov', 20);
-- Checking table
SELECT * FROM gosho.people
