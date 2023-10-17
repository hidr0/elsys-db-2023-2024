Drop database if exists class;
CREATE DATABASE class;
USE class;
CREATE TABLE studentNames(
	studentName varchar(255),
    studentId int
);
INSERT INTO studentNames(studentName)
VALUES
("Ivan"),
("Pethrovka");
SELECT * FROM studentNames;