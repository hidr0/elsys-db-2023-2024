DROP DATABASE IF EXISTS sClass;
CREATE DATABASE sClass;
USE sClass;

CREATE TABLE sClass (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200),
  age INT
);

INSERT INTO sClass(name, age) VALUES ("Georgi", 26);
INSERT INTO sClass(name, age) VALUES ("Boqn", 26);
INSERT INTO sClass(name, age) VALUES ("Niki", 26);
INSERT INTO sClass(name, age) VALUES ("Emo", 26);

SELECT * FROM sClass;