DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

CREATE TABLE Person(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) unique
);

CREATE TABLE Dog(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) unique,
    breed ENUM("Golden", "Frenchie", "Labrador", "Husky"),
    person_id int not null,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person(name) VALUES("Misho");
INSERT INTO Person(name) VALUES("Nakso");
INSERT INTO Person(name) VALUES("Dimitar");
INSERT INTO Person(name) VALUES("Georgi");


INSERT INTO DOG(name, breed, person_id) VALUES("Chocho", "Labrador", 1);
INSERT INTO DOG(name, breed, person_id) VALUES("Pow pow", "Golden", 1);
INSERT INTO DOG(name, breed, person_id) VALUES("GG", "Golden", 1);
INSERT INTO DOG(name, breed, person_id) VALUES("Shaq", "Husky", 3);
INSERT INTO DOG(name, breed, person_id) VALUES("Bau bau", "Frenchie", 2);



Select * from Person;
Select * from Dog;



SELECT * FROM Dog
LEFT JOIN Person
ON Dog.person_id = Person.id;

SELECT * FROM Person
RIGHT JOIN Dog
ON Dog.person_id = Person.id;


SELECT * FROM Person
LEFT JOIN Dog
ON Dog.person_id = Person.id;

-- All people that do not have dogs.
SELECT Person.name FROM Person
LEFT JOIN Dog
ON Dog.person_id = Person.id
WHERE Dog.id IS NULL;

-- How many people have a dog
SELECT COUNT(DISTINCT Person.name) FROM Dog
LEFT JOIN Person
ON Dog.person_id = Person.id;

-- How many dogs has each person
SELECT Person.name, Count(Dog.id) FROM Person
LEFT JOIN DOG ON Person.id = Dog.person_id
GROUP BY Person.name;

SELECT Person.name, Dog.breed, Count(Dog.id) FROM Person
LEFT JOIN DOG ON Person.id = Dog.person_id
GROUP BY Person.name, Dog.breed;

Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'zoo.DOG.name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
