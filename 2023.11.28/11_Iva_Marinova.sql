DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

CREATE TABLE Person(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) unique
);


CREATE TABLE Dog(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20),
    breed ENUM("Golden", "Frenchie", "Labrador", "Husky"),
    person_id int not null,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person(name) VALUES("Misho");
INSERT INTO Person(name) VALUES("Nasko");
INSERT INTO Person(name) VALUES("Dimitar");
INSERT INTO Person(name) VALUES("Georgi");

INSERT INTO Dog(name, breed, person_id) VALUES("Chocho", "Labrador", 1);
INSERT INTO Dog(name, breed, person_id) VALUES("Shaq", "Husky", 3);
INSERT INTO Dog(name, breed, person_id) VALUES("Bau Bau", "Frenchie", 2);

SELECT * FROM Dog
LEFT JOIN Person
On Dog.person_id = Person_id;

-- All people that do not have dogs

SELECT Person.name FROM Person
LEFT JOIN Dog
ON Dog.person_id = Person.id
WHERE Dog.id IS NOT NULL;

SELECT Person.name FROM Dog
LEFT JOIN Person
ON Dog.person_id = Person.id;

SELECT * FROM Person
LEFT JOIN Dog ON Person.id = Dog.person_id
GROUP BY Person.name;
