DROP DATABASE IF EXISTS real_estate;
CREATE DATABASE real_estate;
USE real_estate;

CREATE TABLE Person(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) UNIQUE NOT NULL,
    phone_number varchar(14) check(phone_number LIKE "+359%"),
    email_address varchar(50) check(email_address LIKE "%@%")
); 
INSERT INTO Person(name, phone_number, email_address) VALUES ("Niki","+3598181881","email1@alabala.bg");
INSERT INTO Person(name, phone_number, email_address) VALUES ("Bobi","+3598234321","email2@alabala.bg");
INSERT INTO Person(name, phone_number, email_address) VALUES ("Koce","+3598156751","email3@alabala.bg");
INSERT INTO Person(name, phone_number, email_address) VALUES ("Stefan","+3599395951","email4@alabala.bg");

SELECT * FROM Person;

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    city varchar(50) NOT NULL,
    zip_code int
);
INSERT INTO Address(city,zip_code) VALUES("Sofia",1700);
INSERT INTO Address(city,zip_code) VALUES("Plovdiv",1771);
INSERT INTO Address(city,zip_code) VALUES("Burgas",3011);
INSERT INTO Address(city,zip_code) VALUES("Varna",876);

SELECT * FROM Address;

CREATE TABLE RealEstateAgents(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) UNIQUE NOT NULL
);
INSERT INTO RealEstateAgents(name) VALUES("Ivan Ivanov");
INSERT INTO RealEstateAgents(name) VALUES("Petkan Petkov");
INSERT INTO RealEstateAgents(name) VALUES("Rangel Angelov");

SELECT * FROM RealEstateAgents;

CREATE TABLE House(
	id int PRIMARY KEY AUTO_INCREMENT,
    price int check(price>0),
    address_id int unique,
    FOREIGN KEY(address_id) REFERENCES Address(id),
    real_estate_agent_id int,
    FOREIGN KEY(real_estate_agent_id) REFERENCES RealEstateAgents(id)
);
INSERT INTO House(price,address_id,real_estate_agent_id) VALUES(130000,1,1);
INSERT INTO House(price,address_id,real_estate_agent_id) VALUES(131231,2,2);
INSERT INTO House(price,address_id,real_estate_agent_id) VALUES(186994,3,3);
INSERT INTO House(price,address_id,real_estate_agent_id) VALUES(874883,4,1);

SELECT * FROM House;

CREATE TABLE Person_House(
	id int PRIMARY KEY AUTO_INCREMENT,
    view_date date,
    person_id int,
    FOREIGN KEY (person_id) REFERENCES Person(id),
    house_id int,
    FOREIGN KEY (house_id) REFERENCES House(id),
    UNIQUE(person_id,house_id)
);

INSERT INTO Person_House(view_date,person_id,house_id) VALUES ("31.12.2022",1,4);
INSERT INTO Person_House(view_date,person_id,house_id) VALUES ("21.11.2022",2,1);
INSERT INTO Person_House(view_date,person_id,house_id) VALUES ("06.06.2022",1,2);
INSERT INTO Person_House(view_date,person_id,house_id) VALUES ("11.11.2022",3,3);
INSERT INTO Person_House(view_date,person_id,house_id) VALUES ("05.05.2011",4,2);

SELECT * FROM Person_House;

-- Изведете средната стойност на къщите, които е гледал всеки човек
SELECT Person.name, AVG(House.price) FROM Person
LEFT JOIN Person_House
ON Person_House.person_id = Person.id
LEFT JOIN House
ON Person_House.house_id = House.id
GROUP BY Person.name;

-- Изведете най-високата цена на къща, която предлага всеки агент

SELECT RealEstateAgents.name, MAX(House.price) FROM RealEstateAgents
LEFT JOIN House
ON RealEstateAgents.id = House.real_estate_agent_id
GROUP BY RealEstateAgents.name;

-- Изведете всички адреси на които е бил всеки човек
SELECT Person.name, Address.city, Address.zip_code FROM Person
LEFT JOIN Person_House
ON Person_House.person_id = Person.id
LEFT JOIN House
ON Person_House.house_id = House.id
LEFT JOIN Address
ON House.address_id = Address.id;