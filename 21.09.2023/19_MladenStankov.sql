-- Checking if database exists
DROP DATABASE IF EXISTS gosho;
-- Creating database
CREATE DATABASE gosho;
-- Using database
USE gosho;
-- Creating table
CREATE TABLE  People (
    id int AUTO_INCREMENT PRIMARY KEY,
    PersonName varchar(255),
    PersonAge int
);
-- Add rows
INSERT INTO People (PersonName, PersonAge) VALUES ('Mladen Stankov', 20);
INSERT INTO People (PersonName, PersonAge) VALUES ('Ivan Debel', 23);
INSERT INTO People (PersonName, PersonAge) VALUES ('Kriza', 211);
-- Checking table
SELECT * FROM gosho.people
