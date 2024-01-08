DROP DATABASE IF EXISTS people;
CREATE DATABASE people;
USE people;

CREATE TABLE Person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15) CHECK (phone_number LIKE '+359__________'),
    email_address VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    zip_code VARCHAR(10) CHECK (zip_code REGEXP '^[0-9]+$')
);

CREATE TABLE RealEstateAgents (
    agent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE House (
    house_id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10, 2) CHECK (price > 0),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
	agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES RealEstateAgents(agent_id)
);

CREATE TABLE PersonHouse (
    person_id INT,
    house_id INT,
    visitation_date DATE,
    PRIMARY KEY (person_id, house_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (house_id) REFERENCES House(house_id)
);

SELECT AVG(H.price) FROM PersonHouse PH
JOIN House H ON PH.house_id = H.house_id
WHERE PH.person_id = 1;

SELECT RH.agent_id, MAX(H.price) FROM House H
JOIN RealEstateAgents RH ON H.agent_id = RH.agent_id
GROUP BY RH.agent_id;

SELECT A.* FROM PersonHouse PH
JOIN House H ON PH.house_id = H.house_id
JOIN Address A ON H.address_id = A.address_id
WHERE PH.person_id = 1;
