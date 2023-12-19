DROP DATABASE IF EXISTS housing;
CREATE DATABASE housing;
USE housing;

CREATE TABLE Person (
	id int AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) not null,
    phone VARCHAR(13) not null CHECK(phone LIKE "+359%" AND length(phone) = 13),
    email VARCHAR(50) not null CHECK(email LIKE "%@%")
);

CREATE TABLE RealEstateAgent (
	id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) UNIQUE NOT NULL	
);

CREATE TABLE Address (
	id int auto_increment primary key,
	city varchar(50) not null,
    zip_code int
);

CREATE TABLE House (
	id int AUTO_INCREMENT PRIMARY KEY,
	agent_id int,
    address_id int,
    
    price float CHECK(price > 0),
    
    FOREIGN KEY(address_id) REFERENCES Address(id),
	FOREIGN KEY(agent_id) REFERENCES RealEstateAgent(id)
);

CREATE TABLE PersonHouse (
	id int AUTO_INCREMENT PRIMARY KEY,
    person_id int,
    house_id int,

	FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (house_id) REFERENCES House(id),
    CONSTRAINT seen UNIQUE(person_id, house_id)
);


INSERT INTO RealEstateAgent (name) VALUES
    ('Agent 1'),
    ('Agent 2');

INSERT INTO Person (name, phone, email) VALUES
    ('John Doe', '+359123456789', 'john.doe@example.com'),
    ('Jane Smith', '+359987654321', 'jane.smith@example.com'),
    ('Bob Johnson', '+359555555555', 'bob.johnson@example.com'),
    ('Alice Brown', '+359777777777', 'alice.brown@example.com'),
    ('Charlie White', '+359333333333', 'charlie.white@example.com'),
    ('Eva Black', '+359666666666', 'eva.black@example.com');

INSERT INTO Address (city, zip_code) VALUES
    ('City A', 12345),
    ('City B', 56789),
    ('City C', 10101),
    ('City D', 20202);

INSERT INTO House (agent_id, address_id, price) VALUES
    (1, 1, 250000),
    (1, 2, 350000),
    (2, 3, 500000),
    (2, 4, 600000);

INSERT INTO PersonHouse (person_id, house_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (6, 2),
    (1, 3),
    (2, 4),
    (3, 1),
    (4, 2),
    (5, 3),
    (6, 4);
    

-- (1) Човек - средна цена на всички къщи
SELECT Person.name, avg(House.price)
FROM House
LEFT JOIN PersonHouse ON House.id = PersonHouse.house_id
LEFT JOIN Person ON PersonHouse.person_id = Person.id
GROUP BY Person.name
ORDER BY avg(House.price) DESC;

-- (2) Най-висока цена, която предлага всеки агент
SELECT RealEstateAgent.name, max(House.price)
FROM RealEstateAgent
LEFT JOIN House ON RealEstateAgent.id = House.agent_id
GROUP BY RealEstateAgent.name
ORDER BY max(House.price) DESC;

-- (3) Човек - всички адреси
SELECT Person.name, Address.city, Address.zip_code
FROM Person LEFT JOIN PersonHouse ON Person.id = PersonHouse.person_id
LEFT JOIN House ON PersonHouse.house_id = House.id
LEFT JOIN Address ON House.address_id = Address.id;