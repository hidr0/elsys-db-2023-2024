DROP DATABASE IF EXISTS realEstate;
CREATE DATABASE realEstate;
USE realEstate;

CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15) CHECK (phone_number LIKE '+359%'),
    email_address VARCHAR(255) CHECK (email_address LIKE '%@%')
);

CREATE TABLE Address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255),
    zip_code VARCHAR(10)
);

CREATE TABLE realEstateAgents (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE House (
    id INT AUTO_INCREMENT PRIMARY KEY,
    price INT CHECK (price > 0),
    agent_id INT,
    address_id INT,
    FOREIGN KEY (agent_id) REFERENCES realEstateAgents(id),
    FOREIGN KEY (address_id) REFERENCES Address(id)
);

CREATE TABLE PersonHouse (
	id INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    house_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (house_id) REFERENCES House(id)
);

INSERT INTO Person (name, phone_number, email_address) VALUES
    ('Nikola', '+35911111111', 'nik.sach@gmail.com'),
    ('Zhoro', '+3592222222', 'zhoro.zhorev@gamil.com'),
    ('Ivan', '+35933333333', 'ivan.ivanov@gmail.com');

INSERT INTO Address (city, zip_code) VALUES
    ('Sofia', '1000'),
    ('Bozhurishte', '2227'),
    ('Varna', '9000');

INSERT INTO realEstateAgents (name) VALUES
    ('Misho'),
    ('Pesho'),
    ('Emo');

INSERT INTO House (price, agent_id, address_id) VALUES
    (200000, 1, 1),
    (400000, 2, 2),
    (600000, 3, 3);

INSERT INTO PersonHouse (person_id, house_id) VALUES
    (1, 1),
    (2, 2),
    (3, 2),
    (3, 3);

-- 1. Извадете средната цена на къщите, които е гледал всеки човек
SELECT PersonHouse.person_id, Person.name, AVG(House.price) AS AverageHouseprice FROM PersonHouse
JOIN Person ON PersonHouse.person_id = Person.id
JOIN House ON PersonHouse.house_id = House.id
GROUP BY PersonHouse.person_id, Person.name;

-- 2. Изведете най-високата цена за къщите, които предлага всеки агент
SELECT realEstateAgents.id, realEstateAgents.name, MAX(House.price) AS HighestHouseprice FROM House
JOIN realEstateAgents ON House.agent_id= realEstateAgents.id
GROUP BY realEstateAgents.id, realEstateAgents.name;

-- 3. Изведете всички адреси, на които е бил всеки човек
SELECT Person.id, Person.name, Address.id, Address.city, Address.zip_code FROM PersonHouse
JOIN Person ON PersonHouse.person_id = Person.id
JOIN House ON PersonHouse.house_id = House.id
JOIN Address ON House.address_id = Address.id;