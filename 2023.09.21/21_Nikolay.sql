-- (1) Проверяваме дали базата съществува 
	DROP DATABASE IF EXISTS school;
-- (2) Създавам база данни 
	CREATE DATABASE school;
-- (3) Използваме базата от (2)
	USE school;
-- (4) Създаваме таблица
-- (5) Добавяме колони
	CREATE TABLE students (
		FirstName varchar(255),
		Age int
	);
-- (6) Добавяме редове
	INSERT INTO students
    values("Nikolay",17);
    
    INSERT INTO students
    values("Petar",13);
    
    INSERT INTO students
    values("Gosho",11);
    
    INSERT INTO students
    values("Luka",7);
    
-- (7) Проверяваме го
	SELECT * FROM students;