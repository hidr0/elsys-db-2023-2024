DROP DATABASE IF EXISTS city;
CREATE DATABASE city;
USE city;

CREATE TABLE Person (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    phone_number VARCHAR(14) NOT NULL CHECK(phone_number LIKE '+359%'),
    email VARCHAR(50) NOT NULL CHECK(email LIKE '%@%')
);

INSERT INTO Person (name, phone_number, email)
VALUES	('az', '+359887546780', 'az@oblak.bg'),
		('ti', '+359877211226', 'ti@oblak.bg'),
		('toj', '+359888548209','toj@oblak.bg');

CREATE TABLE Address (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    zip_code VARCHAR(4) NOT NULL
);

INSERT INTO Address (city, zip_code)
VALUES	('Sofia', '1234'),
		('Varna', '5678'),
		('burgas', '9090');

CREATE TABLE RealEstateAgent (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

INSERT INTO RealEstateAgent (name)
VALUES	('az'),
		('ti'),
		('tim');

CREATE TABLE House (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price FLOAT NOT NULL CHECK(price > 0),
    agent_id INT NOT NULL, 
    address_id INT NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES RealEstateAgent(id),
    FOREIGN KEY (address_id) REFERENCES Address(id)
);

INSERT INTO House (price, agent_id, address_id)
VALUES	(120000, 1, 2),
		(200000, 2, 1),
        (160000, 3, 3),
        (100000, 2, 3);

CREATE TABLE PersonHouse (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    house_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (house_id) REFERENCES House(id)
);

INSERT INTO PersonHouse (person_id, house_id) 
VALUES	(1, 1),
		(1, 3),
		(2, 2),
		(3, 3);

-- Изведете средната стойност на къщите, които е гледал всеки човек
SELECT Person.name, AVG(House.price) FROM Person
LEFT JOIN PersonHouse 
ON PersonHouse.person_id = Person.id
LEFT JOIN House
ON PersonHouse.house_id = House.id
GROUP BY Person.id;

-- Изведете най-високата цена на къща, която предлага всеки агент
SELECT RealEstateAgent.name, MAX(House.price) FROM RealEstateAgent
LEFT JOIN House
ON RealEstateAgent.id = House.agent_id
GROUP BY RealEstateAgent.id;


-- Изведете всички адреси на които е бил всеки човек
SELECT Person.name, Address.city, Address.zip_code FROM Person
LEFT JOIN PersonHouse
ON PersonHouse.person_id = Person.id
LEFT JOIN House
ON PersonHouse.house_id = House.id
LEFT JOIN Address
ON House.address_id = Address.id;