DROP DATABASE IF EXISTS classwork;
CREATE DATABASE classwork;
USE classwork;

CREATE TABLE Students(
	id int primary key auto_increment,
	name varchar(64),
    age int
);
INSERT INTO Students(name) VALUES("Ivan");
INSERT INTO Students(name,age) VALUES("Gosho",26);
INSERT INTO Students(name,age) VALUES("Pepi",24);
INSERT INTO Students(name,age) VALUES("Stefi",27);
INSERT INTO Students(name,age) VALUES("Sasho",25);
INSERT INTO Students(name,age) VALUES("Bobi",22);
INSERT INTO Students(name,age) VALUES("Misho",23);

SELECT * from Students
WHERE age <26 AND age >23;
-- четни години
SELECT * FROM Students
WHERE age % 2 = 0;
-- по възраст
SELECT * FROM Students
ORDER BY age;
-- ако се казват Gosho
SELECT * FROM Students
WHERE name = "Gosho";
