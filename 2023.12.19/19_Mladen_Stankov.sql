DROP DATABASE IF EXISTS real_estate;
CREATE DATABASE real_estate;

USE real_estate;

CREATE TABLE person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256) NOT NULL UNIQUE,
    phone_number VARCHAR(256) CHECK (phone_number LIKE "+359%" AND LENGTH(phone_number) = 13),
    email_address VARCHAR(256) CHECK (email_address LIKE "%@%")
);

CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(256) NOT NULL,
    zip_code INT
);

CREATE TABLE real_estate_agent (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256) UNIQUE NOT NULL
);

CREATE TABLE house (
    id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10, 2) CHECK (price > 0),
    address_id INT UNIQUE NOT NULL,
    real_estate_agent_id INT,
    FOREIGN KEY(address_id) REFERENCES address(id),
    FOREIGN KEY(real_estate_agent_id) REFERENCES real_estate_agent(id)
);

CREATE TABLE viewing (
    id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL,
    house_id INT NOT NULL,
    FOREIGN KEY(person_id) REFERENCES person(id),
    FOREIGN KEY(house_id) REFERENCES house(id),
    CONSTRAINT unique_ids UNIQUE(person_id, house_id)
);

INSERT INTO person (name, phone_number, email_address) VALUES
    ('John Doe', '+359123456789', 'john.doe@example.com'),
    ('Jane Smith', '+359987654321', 'jane.smith@example.com'),
    ('Alice Johnson', '+359111223344', 'alice.johnson@example.com'),
    ('Bob Williams', '+359555666777', 'bob.williams@example.com'),
    ('Eva Davis', '+359999888777', 'eva.davis@example.com'),
    ('Michael Taylor', '+359333444555', 'michael.taylor@example.com'),
    ('Olivia Brown', '+359666777888', 'olivia.brown@example.com');

INSERT INTO real_estate_agent (name) VALUES
    ('Emily White'),
    ('James Anderson'),
    ('Sophia Martinez');

INSERT INTO address (city, zip_code) VALUES
    ('Sunnydale', 12345),
    ('Maplewood', 67890),
    ('Lakeview', 54321),
    ('Hillside', 98765),
    ('Rivertown', 13579);

INSERT INTO house (price, address_id, real_estate_agent_id) VALUES
    (200000.00, 1, 1),
    (300000.00, 2, 2),
    (250000.00, 3, 3),
    (400000.00, 4, 1),
    (350000.00, 5, 3);

INSERT INTO viewing (person_id, house_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 2),
    (3, 3),
    (5, 5),
    (6, 1),
    (6, 2),
    (6, 3),
    (6, 4),
    (7, 2);
    
-- Изведете средната стойност на къщите, които е гледал всеки човек
SELECT person.name, AVG(house.price) FROM viewing
LEFT JOIN person
ON viewing.person_id = person.id
LEFT JOIN house
ON viewing.house_id = house.id
GROUP BY person.id;

-- Изведете най-високата цена за къщите, които предлага всеки агент
SELECT real_estate_agent.name, MAX(house.price) FROM house
LEFT JOIN real_estate_agent
ON house.real_estate_agent_id = real_estate_agent.id
GROUP BY real_estate_agent.id;

-- Изведете всички адреси на които е бил всеки човек
SELECT person.name, CONCAT(address.city, " ", address.zip_code) AS full_adress FROM viewing
LEFT JOIN person
ON viewing.person_id = person.id
LEFT JOIN house
ON viewing.house_id = house.id
LEFT JOIN address
ON house.address_id = address.id

