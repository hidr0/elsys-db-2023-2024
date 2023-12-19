DROP DATABASE IF EXISTS Houses;
CREATE DATABASE Houses;
USE Houses;

CREATE TABLE Person
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
    phone_number VARCHAR(20) CHECK (phone_number LIKE '+359%' AND LENGTH(phone_number) = 13),
    email_address VARCHAR(100) CHECK(email_address LIKE '%@%')
);

INSERT INTO Person(name, phone_number, email_address) VALUES ("Pesho", "+359888888888", "abvgd@gmail.com");
INSERT INTO Person(name, phone_number, email_address) VALUES ("Gosho", "+359889999999", "abvgde123@gmail.com");
INSERT INTO Person(name, phone_number, email_address) VALUES ("Tosho", "+359887777777", "tosho@gmail.com");
INSERT INTO Person(name, phone_number, email_address) VALUES ("Misho", "+359881234567", "12345@gmail.com");

CREATE TABLE Address
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(50) NOT NULL,
    zip_code VARCHAR(50)
);

INSERT INTO Address(city, zip_code) VALUES('Sofia', "asdf");
INSERT INTO Address(city, zip_code) VALUES('Plovdiv', "ghjk");
INSERT INTO Address(city, zip_code) VALUES('Varna', "zxcv");
INSERT INTO Address(city, zip_code) VALUES('Burgas', "bnml");
INSERT INTO Address(city, zip_code) VALUES('Pleven', "qwer");

CREATE TABLE RealEstateAgents
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO RealEstateAgents(name) VALUES('Agent1');
INSERT INTO RealEstateAgents(name) VALUES('Agent2');
INSERT INTO RealEstateAgents(name) VALUES('Agent3');

CREATE TABLE House
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    price INT CHECK(price > 0),
    address_id INT NOT NULL UNIQUE,
    FOREIGN KEY(address_id) REFERENCES Address(id),
    real_estate_agents_id INT NOT NULL,
    FOREIGN KEY(real_estate_agents_id) REFERENCES RealEstateAgents(id)
);

INSERT INTO House(price, address_id, real_estate_agents_id) VALUES(200000, 1, 3);
INSERT INTO House(price, address_id, real_estate_agents_id) VALUES(300000, 2, 2);
INSERT INTO House(price, address_id, real_estate_agents_id) VALUES(400000, 3, 1);
INSERT INTO House(price, address_id, real_estate_agents_id) VALUES(250000, 4, 2);
INSERT INTO House(price, address_id, real_estate_agents_id) VALUES(500000, 5, 1);

CREATE TABLE HousePerson
(
	visited DATE,
	person_id INT,
    house_id INT,
    PRIMARY KEY(person_id, house_id),
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (house_id) REFERENCES House(id)
);

INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 1, 1);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 1, 2);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 2, 1);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 2, 3);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 3, 2);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 3, 4);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 4, 5);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 4, 1);
INSERT INTO HousePerson(visited, person_id, house_id) VALUES('2023-12-19', 4, 2);


SELECT HousePerson.person_id, Person.name, AVG(House.price) FROM HousePerson
LEFT JOIN Person ON HousePerson.person_id = Person.id
LEFT JOIN House ON HousePerson.house_id = House.id
GROUP BY HousePerson.person_id, Person.name;

SELECT RealEstateAgents.id, RealEstateAgents.name, MAX(House.price) FROM RealEstateAgents
LEFT JOIN House ON House.real_estate_agents_id = RealEstateAgents.id
GROUP BY RealEstateAgents.id, RealEstateAgents.name;

SELECT HousePerson.person_id, Person.name, Address.city, Address.zip_code FROM HousePerson
LEFT JOIN House ON HousePerson.house_id = House.id
LEFT JOIN Person ON HousePerson.person_id = Person.id
LEFT JOIN Address ON House.address_id = Address.id