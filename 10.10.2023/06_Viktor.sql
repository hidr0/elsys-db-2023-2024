DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABlE Students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    age INT 
);

INSERT INTO Students(name) VALUES("Misho bezgodini");
INSERT INTO Students(name, age) VALUES("IWANK I", 5);
INSERT INTO Students(name, age) VALUES("Misho", 26);
INSERT INTO Students(name, age) VALUES("Gosho", 20);
INSERT INTO Students(name, age) VALUES("Pepi", 21);
INSERT INTO Students(name, age) VALUES("Stefi", 24);
INSERT INTO Students(name, age) VALUES("Jori Floyd", 67);
INSERT INTO Students(name, age) VALUES("Kongar-ol Ondar", 62);

-- vrushta godinite na uchenicite ,podredeni po ime otzad napred po azbuchen red
SELECT age FROM Students ORDER BY name DESC;

-- vrushta uchenicite s id-ta ot 6 do 9 podredeni po vuzrast vyv vyzhodqsht red
SELECT * FROM Students WHERE id < 10 AND id > 5 ORDER BY age ASC;

-- vrushta imenata na uchenicite chieto id e poveche ot 3, a poleto za godini ne e prazno
SELECT name FROM Students WHERE id > 3 AND age IS NOT NULL;