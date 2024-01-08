DROP DATABASE IF EXISTS Agency;
CREATE DATABASE Agency;
USE Agency;

CREATE TABLE Person (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE '+359%'),
    Email VARCHAR(255) NOT NULL UNIQUE CHECK (Email LIKE '%@%')
);

CREATE TABLE RealEstateAgent (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Address (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	City VARCHAR(255) NOT NULL,
    ZipCode INT NOT NULL
);

CREATE TABLE House (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    AddressID INT UNIQUE,
    FOREIGN KEY (AddressID) REFERENCES Address(ID),
    AgentID INT,
    FOREIGN KEY (AgentID) REFERENCES RealEstateAgent(ID),
	Price INT NOT NULL CHECK (Price > 0)
);

CREATE TABLE Visit (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE,
    HouseID INT NOT NULL,
    FOREIGN KEY (HouseID) REFERENCES House(ID),
    PersonID INT NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person(ID),
    CONSTRAINT UniqueHousePerson UNIQUE (HouseID, PersonID)
);

INSERT INTO Person (Name, PhoneNumber, Email) VALUES ('Cristiano Orlando', '+359666666666', 'cro@orlandovskaposhta.orl');
INSERT INTO Person (Name, PhoneNumber, Email) VALUES ('Random Brodqr ot ulicata', '+359000000000', 'randombrodqr@elsys-bg.org');
INSERT INTO Person (Name, PhoneNumber, Email) VALUES ('Megic i memendems', '+359123456789', 'megicimemendems@gmail.com');

INSERT INTO RealEstateAgent (Name) VALUES ('Jon Bol');
INSERT INTO RealEstateAgent (Name) VALUES ('Erol Metin');
INSERT INTO RealEstateAgent (Name) VALUES ('Christian Eriksen');

INSERT INTO Address (City, ZipCode) VALUES ('Sveta Troica', '1309');
INSERT INTO Address (City, ZipCode) VALUES ('Sofia', '1000');
INSERT INTO Address (City, ZipCode) VALUES ('Chiprovci', '1231');
INSERT INTO Address (City, ZipCode) VALUES ('Kremikovci', '1820');
INSERT INTO Address (City, ZipCode) VALUES ('Barnaul', '656000');

INSERT INTO House (Price, AddressID, AgentID) VALUES (100000, 1, 1);
INSERT INTO House (Price, AddressID, AgentID) VALUES (700900, 2, 1);
INSERT INTO House (Price, AddressID, AgentID) VALUES (67899, 3, 1);
INSERT INTO House (Price, AddressID, AgentID) VALUES (80000, 4, 2);
INSERT INTO House (Price, AddressID, AgentID) VALUES (100000, 5, 3);

INSERT INTO Visit (Date, HouseID, PersonID) VALUES ('2006-10-5', 1, 1);
INSERT INTO Visit (Date, HouseID, PersonID) VALUES ('2010-6-18', 2, 3);
INSERT INTO Visit (Date, HouseID, PersonID) VALUES ('2006-10-5', 2, 1);
INSERT INTO Visit (Date, HouseID, PersonID) VALUES ('2010-6-18', 5, 1);


SELECT V.PersonID, P.Name, AVG(H.Price) AS 'Average Price'
FROM Visit V
JOIN Person P ON V.PersonID = P.ID
JOIN House H ON V.HouseID = H.ID
GROUP BY V.PersonID, P.Name;

SELECT REA.ID, REA.Name, MAX(H.Price) AS 'Max Price'
FROM House H
JOIN RealEstateAgent REA ON H.AgentID = REA.ID
GROUP BY REA.ID;

SELECT P.Name, H.ID AS 'House ID', A.City, A.ZipCode, V.Date
FROM Visit V
JOIN Person P ON V.PersonID = P.ID
JOIN House H ON V.HouseID = H.ID
JOIN Address A ON H.AddressID = A.ID;