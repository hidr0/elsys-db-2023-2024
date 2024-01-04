DROP DATABASE IF EXISTS RealEstate;
CREATE DATABASE RealEstate;
USE RealEstate;

CREATE TABLE Person (
    person_id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15) CHECK (phone_number LIKE '+359%'),
    email VARCHAR(255) CHECK (email LIKE '%@%')
);

CREATE TABLE RealEstateAgent (
    agent_id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    zipcode VARCHAR(10) NOT NULL
);

CREATE TABLE House (
    house_id INT PRIMARY KEY,
    price INT NOT NULL CHECK(price > 0),
    address_id INT UNIQUE,
    agent_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (agent_id) REFERENCES RealEstateAgent(agent_id)
);


CREATE TABLE Visit (
    person_id INT,
    house_id INT,
    visit_date DATE,
    visit_id INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (house_id) REFERENCES House(house_id)
);

INSERT INTO Person (person_id, name, phone_number, email) VALUES
    (1, 'Tomi', '+35993843234', 'tomi.rusev@gmail.com'),
    (2, 'Iva', '+359987654321', 'iva.kartechnicata@gmail.com'),
    (3, 'Denis', '+359639445832', 'denis.p@gmail.com'),
    (4, 'Sashka', '+359112465432', 'ali.laz@gmail.com'),
    (5, 'Nikola', '+35949287878', 'grizzly.bear@gmail.com');

-- RealEstateAgent
INSERT INTO RealEstateAgent (agent_id, name) VALUES
    (1, 'Sasho'),
    (2, 'Pesho'),
    (3, 'Stani'),
    (4, 'Gari'),
    (5, 'Nina');

-- Address
INSERT INTO Address (address_id, city, zipcode) VALUES
    (1, 'Sofia', '12345'),
    (2, 'Bansko', '54321'),
    (3, 'Varna', '67890'),
    (4, 'Sofia', '11111'),
    (5, 'Burgas', '99999');

-- House
INSERT INTO House (house_id, price, address_id, agent_id) VALUES
    (1, 12565, 1, 1),
    (2, 43945, 2, 2),
    (3, 18345, 3, 3),
    (4, 26749, 4, 4),
    (5, 12492, 5, 5);

-- Visit
INSERT INTO Visit (person_id, house_id, visit_date) VALUES
    (1, 1, '2024-01-12'),
    (1, 2, '2024-03-23'),
    (2, 2, '2024-03-25'),
    (3, 3, '2024-08-13'),
    (4, 4, '2024-11-17');
    
SELECT Visit.person_id, Person.name, AVG(House.price) FROM Visit
JOIN Person ON Visit.person_id = Person.person_id
JOIN House ON Visit.house_id = House.house_id
GROUP BY Visit.person_id, Person.name;

SELECT RealEstateAgent.agent_id, RealEstateAgent.name, MAX(House.price) FROM House
JOIN RealEstateAgent ON House.agent_id = RealEstateAgent.agent_id
GROUP BY RealEstateAgent.agent_id, RealEstateAgent.name;

SELECT Person.name, Address.city, Address.zipcode FROM Person
JOIN Visit ON Person.person_id = Visit.person_id
JOIN House ON Visit.house_id = House.house_id
JOIN Address ON House.address_id = Address.address_id
GROUP BY Person.person_id, Person.name, Address.city, Address.zipcode;