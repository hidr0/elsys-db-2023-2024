DROP DATABASE IF EXISTS Realestate;
CREATE DATABASE Realestate;
USE Realestate;

CREATE TABLE Person (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15) CHECK (PhoneNumber LIKE '+359%' AND LENGTH(PhoneNumber) = 11),
    EmailAddress VARCHAR(255) CHECK (EmailAddress LIKE '%@%')
);

CREATE TABLE Address (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(255),
    ZipCode VARCHAR(10)
);

CREATE TABLE RealEstateAgents (
	ID INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    Name Varchar(255)
);

CREATE TABLE House (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Price INT CHECK (Price > 0),
    AgentID INT,
    AddressID INT,
    FOREIGN KEY (AgentID) REFERENCES RealEstateAgents(ID),
    FOREIGN KEY (AddressID) REFERENCES Address(ID)
);

CREATE TABLE PersonHouse (
	ID INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    PersonID INT,
    HouseID INT,
    FOREIGN KEY (PersonID) REFERENCES Person(ID),
    FOREIGN KEY (HouseID) REFERENCES House(ID)
);

INSERT INTO Person (Name, PhoneNumber, EmailAddress) VALUES
    ('John Doe', '+3591234567', 'john.doe@example.com'),
    ('Jane Smith', '+3599876543', 'jane.smith@example.com'),
    ('Bob Johnson', '+3595555555', 'bob.johnson@example.com');

INSERT INTO Address (City, ZipCode) VALUES
    ('City1', '12345'),
    ('City2', '67890'),
    ('City3', '54321');

INSERT INTO RealEstateAgents (Name) VALUES
    ('Agent1'),
    ('Agent2'),
    ('Agent3');

INSERT INTO House (Price, AgentID, AddressID) VALUES
    (150000, 1, 1),
    (200000, 2, 2),
    (180000, 3, 3);

INSERT INTO PersonHouse (PersonID, HouseID) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3);

-- (1)
SELECT PersonHouse.PersonID, Person.Name, AVG(House.Price) AS AverageHousePrice
FROM PersonHouse
JOIN Person ON PersonHouse.PersonID = Person.ID
JOIN House ON PersonHouse.HouseID = House.ID
GROUP BY PersonHouse.PersonID, Person.Name;

-- (2)
SELECT RealEstateAgents.ID, RealEstateAgents.Name, MAX(House.Price) AS HighestHousePrice
FROM House
JOIN RealEstateAgents ON House.AgentID = RealEstateAgents.ID
GROUP BY RealEstateAgents.ID, RealEstateAgents.Name;

-- (3)
SELECT Person.ID, Person.Name, Address.ID, Address.City, Address.ZipCode
FROM PersonHouse
JOIN Person ON PersonHouse.PersonID = Person.ID
JOIN House ON PersonHouse.HouseID = House.ID
JOIN Address ON House.AddressID = Address.ID;
