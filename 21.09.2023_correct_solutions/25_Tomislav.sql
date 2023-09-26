drop database if exists students; -- (1)
create database students; -- (2)

USE students; -- (3)

-- (4) (5)
CREATE TABLE table_name(
	id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL, 
    age int NOT NULL
);

-- (6)

INSERT INTO students(name, age) VALUES("Tomsiav", 17);
INSERT INTO students(name, age) VALUES("Kolio", 69);
INSERT INTO students(name, age) VALUES("Joana", 12);

-- (7) 
SELECT * FROM students; 


