DROP DATABASE IF EXISTS stoyan_class;
CREATE DATABASE stoyan_class;
USE stoyan_class;

CREATE TABLE students_in_class(
  id int AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  age int
);

INSERT INTO students_in_class(name, age) VALUES("Georgi", 26);
INSERT INTO students_in_class(name, age) VALUES("Boqn", 26);
INSERT INTO students_in_class(name, age) VALUES("Niki", 26);
INSERT INTO students_in_class(name, age) VALUES("Emo", 26);
SELECT * FROM students_in_class;