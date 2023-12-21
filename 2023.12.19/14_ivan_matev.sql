DROP DATABASE IF EXISTS realEstateMarket;
CREATE DATABASE realEstateMarket;
USE realEstateMarket;

CREATE TABLE Person (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    phone_number VARCHAR(14) NOT NULL CHECK(phone_number LIKE '+359%'),
    email VARCHAR(50) NOT NULL CHECK(email LIKE '%@%')
);

CREATE TABLE Address (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    zip_code VARCHAR(4) NOT NULL
);

CREATE TABLE RealEstateAgent (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE House (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price FLOAT NOT NULL CHECK(price > 0),
    agent_id INT NOT NULL, 
    address_id INT NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES RealEstateAgent(id),
    FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE PersonHouse (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    house_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (house_id) REFERENCES House(id)
);

INSERT INTO Person (name, phone_number, email)
VALUES	('kris', '+359111111111', 'kris@bait.bg'),
		('mladen', '+359222222222', 'mladen@dengi.com'),
		('ivan', '+359333333333','ivan@peti.ru');

INSERT INTO Address (city, zip_code)
VALUES	('Sofia', '1001'),
		('Plovdiv', '2222'),
		('Turgovishte', '7777');

INSERT INTO RealEstateAgent (name)
VALUES	('Emba'),
		('Stef'),
		('Kalo');


INSERT INTO House (price, agent_id, address_id)
VALUES	(89450, 1, 1),
		(750000, 1, 2),
        (66999, 3, 3),
        (1234567, 2, 3);

INSERT INTO PersonHouse (person_id, house_id) 
VALUES	(1, 1),
		(1, 4),
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
