DROP DATABASE IF EXISTS Hotel;
CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE Hotel(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    phone_number VARCHAR(255),
    street VARCHAR(255)
);

INSERT INTO Hotel(name, phone_number, street) VALUES
    ("hell", "1234", "Mladost 4, bl 437"),
    ("Malinova dolina", "5678","Malinova Dolina, bl 70");

CREATE TABLE Person(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Person(name) VALUES
    ("Misho"),
    ("Strahil");

CREATE TABLE Room(
    id INT PRIMARY KEY AUTO_INCREMENT,
    floor INT CHECK(floor > 0),
    name VARCHAR(255) NOT NULL,
    hotel_id INT NOT NULL,
    FOREIGN KEY(hotel_id) REFERENCES Hotel(id)
);

INSERT INTO Room(floor, name, hotel_id) VALUES
    (2, "Math", 1),
    (3, "Bazi Danni", 2);

CREATE TABLE Reservations(
    id INT PRIMARY KEY AUTO_INCREMENT,
    room_id INT NOT NULL,
    person_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Room(id),
    FOREIGN KEY (person_id) REFERENCES Person(id)
);

INSERT INTO Reservations(room_id, person_id) VALUES
    (1,1),
    (1,2);

SELECT * FROM Hotel;
SELECT * FROM Person;
SELECT * FROM Room;

-- How many visitors per hotel?
SELECT Hotel.name, COUNT(Person.id) FROM Hotel
LEFT JOIN Room ON Room.hotel_id = Hotel.id
LEFT JOIN Reservations ON Reservations.room_id = Room.id
LEFT JOIN Person ON Person.id = Reservations.person_id
GROUP BY Hotel.name;

-- Visitorless
SELECT Hotel.name, COUNT(Person.id) FROM Hotel
LEFT JOIN Room ON Room.hotel_id = Hotel.id
LEFT JOIN Reservations ON Reservations.room_id = Room.id
LEFT JOIN Person ON Person.id = Reservations.person_id
GROUP BY Hotel.name
HAVING COUNT(Person.id) = 0;

-- Stats per person
SELECT Hotel.name AS Hotel, Room.name AS Room, Person.name FROM Person
LEFT JOIN Reservations ON Person.id = Reservations.person_id
LEFT JOIN Room ON Reservations.room_id = Room.id
LEFT JOIN Hotel ON Room.hotel_id = Hotel.id;