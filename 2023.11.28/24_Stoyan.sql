DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

CREATE TABLE Person(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) unique
);    

CREATE TABLE Pet(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) unique,
    breed Enum("Golden retriever","Rottweiler","Labrador", "Pug"),
    person_id int not null,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person(name) VALUES("Misho");
INSERT INTO Person(name) VALUES("Stoyan");
INSERT INTO Person(name) VALUES("Simeon");
INSERT INTO Person(name) VALUES("Uoan");

INSERT INTO Pet(name, breed, person_id) VALUES("Reksi", "Labrador",1);
INSERT INTO Pet(name, breed, person_id) VALUES("Jax", "Pug",1);
INSERT INTO Pet(name, breed, person_id) VALUES("Naiden", "Golden retriever",3);
INSERT INTO Pet(name, breed, person_id) VALUES("Dworsy", "Rottweiler",2);

Select * FROM Person;
Select * FROM Pet;

Select * FROM Pet
Left JOIN PERSON
ON Pet.person_id = Person.id;

SELECT PERSON.name FROM Person
LEFT JOIN Pet
ON Pet.person_id = Person.id
WHERE Pet.id IS NULL;
