-- (1) Проверяваме дали базата съществува 
	DROP DATABASE IF EXISTS school;
-- (2) Създавам база данни 
	CREATE DATABASE school;
-- (3) Използваме базата от (2)
	USE school;
-- (4) Създаваме таблица
-- (5) Добавяме колони
	CREATE TABLE students (
		id int AUTO_INCREMENT PRIMARY KEY,
		firstName varchar(200),
		age int
	);
-- (6) Добавяме редове
	INSERT INTO students(firstName, age) VALUES("Nikolay",17);
    INSERT INTO students(firstName, age) VALUES("Petar",13);
    INSERT INTO students(firstName, age) VALUES("Gosho",11);
    INSERT INTO students(firstName, age) VALUES("Luka",7);
    
-- (7) Проверяваме го
	SELECT * FROM students;