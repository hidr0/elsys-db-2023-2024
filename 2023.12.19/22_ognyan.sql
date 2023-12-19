DROP DATABASE IF EXISTS houseseeing;
CREATE DATABASE houseseeing;
USE houseseeing;

CREATE TABLE Person(
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL UNIQUE,
    phone_number VARCHAR(200) CHECK(LENGTH(phone_number) = 13 AND phone_number LIKE '+359%'),
    email_address VARCHAR(200) CHECK(email_address LIKE '%@%')
);

CREATE TABLE RealEstateAgents(
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Address(
    id int PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(200) NOT NULL,
    zip_code VARCHAR(200)
);

CREATE TABLE House(
    id int PRIMARY KEY AUTO_INCREMENT,
    price int CHECK(price > 0),
    address_id int UNIQUE,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

CREATE TABLE Viewing(
    id int PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    house_id int NOT NULL,
    FOREIGN KEY(house_id) REFERENCES House(id),
    person_id int NOT NULL,
    FOREIGN KEY(person_id) REFERENCES Person(id),
    CONSTRAINT unique_house_person UNIQUE(house_id, person_id)
);


INSERT INTO Person (name, phone_number, email_address) VALUES ('John Doe', '+359888888888', 'john.doe@example.com');
INSERT INTO Person (name, phone_number, email_address) VALUES ('Jane Smith', '+359999999999', 'jane.smith@example.com');

INSERT INTO RealEstateAgents (name) VALUES ('Agent 1');
INSERT INTO RealEstateAgents (name) VALUES ('Agent 2');

INSERT INTO Address (city, zip_code) VALUES ('New York', '10001');
INSERT INTO Address (city, zip_code) VALUES ('Los Angeles', '90001');

INSERT INTO House (price, address_id) VALUES (100000, 1);
INSERT INTO House (price, address_id) VALUES (200000, 2);

INSERT INTO Viewing (date, house_id, person_id) VALUES ('2023-12-20', 1, 1);
INSERT INTO Viewing (date, house_id, person_id) VALUES ('2023-12-21', 2, 2);


SELECT Person.name, AVG(price)
FROM Viewing
JOIN House ON House.id = Viewing.house_id
RIGHT JOIN Person ON Person.id = Viewing.person_id
GROUP BY Person.name;

SELECT name, MAX(price)
FROM RealEstateAgents
LEFT JOIN House ON House.id = RealEstateAgents.id
GROUP BY name;

SELECT Person.name, Address.*
FROM Viewing
JOIN House ON House.id = Viewing.house_id
RIGHT JOIN Person ON Person.id = Viewing.person_id
LEFT JOIN Address ON Address.id = House.address_id;