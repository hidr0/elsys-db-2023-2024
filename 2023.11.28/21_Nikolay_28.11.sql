DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

CREATE TABLE Person(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30) UNIQUE
);
CREATE TABLE Dog(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30),
    breed ENUM("Golden", "Dakel", "Mops","Husky"),
    person_id int not null,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person(name) VALUES("Misho");
INSERT INTO Person(name) VALUES("Ivan");
INSERT INTO Person(name) VALUES("Boris");
INSERT INTO Person(name) VALUES("Stefan");
INSERT INTO Person(name) VALUES("Georgi");

INSERT INTO Dog(name,breed,person_id) VALUES("Rex","Golden",1);
INSERT INTO Dog(name,breed,person_id) VALUES("Pow Pow","Golden",1);
INSERT INTO Dog(name,breed,person_id) VALUES("Johnny","Husky",1);
INSERT INTO Dog(name,breed,person_id) VALUES("BaoMao","Mops",4);
INSERT INTO Dog(name,breed,person_id) VALUES("Jimmy","Dakel",2);

SELECT * FROM Person;
SELECT * FROM Dog;

SELECT * FROM Dog
LEFT JOIN Person
ON Dog.person_id = Person.id;

SELECT Person.name FROM Person
LEFT JOIN Dog
ON Dog.person_id = Person.id
WHERE Dog.id IS NULL;

SELECT COUNT(DISTINCT Person.name) FROM Dog
LEFT JOIN Person
ON Dog.person_id = Person.id;

SELECT Person.name, CONCAT(Dog.breed,"->",Count(Dog.id)) FROM Person
LEFT JOIN Dog ON Person.id = Dog.person_id
GROUP BY Person.name, Dog.breed;