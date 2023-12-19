DROP DATABASE IF EXISTS houses;
CREATE DATABASE houses;
USE houses;

CREATE TABLE Person (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL CHECK(phone LIKE "+359%" AND length(phone) = 13),
    email VARCHAR(50) NOT NULL CHECK(email LIKE "%@%")
);

CREATE TABLE RealEstateAgent (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL	
);

CREATE TABLE Address (
	id INT AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(50) NOT NULL,
    zip_code INT
);

CREATE TABLE House (
	id INT AUTO_INCREMENT PRIMARY KEY,
	agent_id INT,
    address_id INT,    
    price FLOAT CHECK(price > 0),
    
    FOREIGN KEY(address_id) REFERENCES Address(id),
	FOREIGN KEY(agent_id) REFERENCES RealEstateAgent(id)
);

CREATE TABLE PersonHouse (
	id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    house_id INT,

	FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (house_id) REFERENCES House(id),
    CONSTRAINT seen UNIQUE(person_id, house_id)
);

INSERT INTO RealEstateAgent (name) VALUES ('Agent 007'), ('Agent 07');

INSERT INTO Person (name, phone, email) VALUES
	('Misho Kirilov', '+359189263509', 'MK@elsys.com'),
    ('Sedef Geirgiev', '+359817257027', 'SedG@gmail.com'),
	('Emo Kostadinov', '+359123456789','EmoK@gmail.com'),
	('Kriskata Bate', '+359987654321', 'KrisB@gmail.com');

INSERT INTO Address (city, zip_code) VALUES
    ('Sofia', 16191), ('Bansko', 35378), ('Shampansko', 55339);

INSERT INTO House (agent_id, address_id, price) VALUES
    (1, 1, 399000), (1, 2, 400000), (2, 3, 989000), (2, 1, 750000);

INSERT INTO PersonHouse (person_id, house_id) VALUES
    (3, 1), (4, 2), (3, 3), (4, 3);
    
-- 1
SELECT Person.name, AVG(House.price) FROM House
LEFT JOIN PersonHouse ON House.id = PersonHouse.house_id
LEFT JOIN Person ON PersonHouse.person_id = Person.id
GROUP BY Person.name;

-- 2
SELECT RealEstateAgent.name, MAX(House.price) FROM RealEstateAgent
LEFT JOIN House ON RealEstateAgent.id = House.agent_id
GROUP BY RealEstateAgent.name;

-- 3
SELECT Person.name, Address.city, Address.zip_code
FROM Person LEFT JOIN PersonHouse ON Person.id = PersonHouse.person_id
LEFT JOIN House ON PersonHouse.house_id = House.id
LEFT JOIN Address ON House.address_id = Address.id;
