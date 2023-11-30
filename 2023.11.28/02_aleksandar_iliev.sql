DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

CREATE TABLE Person(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE
);

CREATE TABLE Pet(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    breed ENUM("Gloden", "Frenchie", "Labrador", "Husky"),
    person_id INT NOT NULL UNIQUE,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person(name) VALUES
    ("Misho"),
    ("Nasko"),
    ("Dimitar"),
    ("Georgi");

INSERT INTO Pet(name, breed, person_id) VALUES
    ("Chocho", "Labrador", 1),
    ("Doger", "Labrador", 1),
    ("Shaq", "Husky", 3),
    ("Bau Bau", "Frenchie", 2);

SELECT * FROM Person;
SELECT * FROM Pet;

-- le no dog :'(
SELECT Person.name FROM Person
LEFT JOIN Pet ON Pet.person_id = Person.id
WHERE Pet.id IS NULL;

-- le dog B)
SELECT DISTINCT Person.name, COUNT(Pet.id) FROM Person
LEFT JOIN Pet ON Pet.person_id = Person.id
WHERE Pet.id IS NOT NULL
GROUP BY Person.name;
