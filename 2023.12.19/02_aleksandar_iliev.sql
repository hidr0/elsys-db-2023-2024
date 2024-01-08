DROP DATABASE IF EXISTS housing;
CREATE DATABASE housing;
USE housing;

CREATE TABLE RealEstateAgents(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE House(
    id INT PRIMARY KEY AUTO_INCREMENT,
    price INT CHECK(price > 0),
    real_estate_id INT,
    FOREIGN KEY(real_estate_id) REFERENCES RealEstateAgents(id)
);

CREATE TABLE Address(
    id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(255) NOT NULL,
    zip_code VARCHAR(4),
    house_id INT UNIQUE,
    FOREIGN KEY(house_id) REFERENCES House(id)
);

CREATE TABLE Person(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(255) CHECK(phone_number LIKE '+359%' AND LENGTH(phone_number) = 10),
    email VARCHAR(255) CHECK(email LIKE '%@%')
);

CREATE TABLE HouseToPerson(
    id INT PRIMARY KEY AUTO_INCREMENT,
    house_id INT,
    person_id INT,
    date DATE,
    CONSTRAINT seen_once UNIQUE(house_id, person_id),
    FOREIGN KEY(house_id) REFERENCES House(id),
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

-- Avg house price per person

SELECT Person.name, AVG(House.price) FROM Person
LEFT JOIN HouseToPerson ON person_id = Person.id
LEFT JOIN House ON house_id = House.id
GROUP BY Person.id;

-- Max price seen by each agent

SELECT RealEstateAgents.name, MAX(House.price) FROM RealEstateAgents
LEFT JOIN House ON real_estate_id = RealEstateAgents.id
GROUP BY RealEstateAgents.id;

--  Addresses per person

SELECT Person.name, Address.* FROM Person
LEFT JOIN HouseToPerson ON person_id = Person.id
LEFT JOIN House ON house_id = House.id
LEFT JOIN Address ON Address.house_id = House.id;