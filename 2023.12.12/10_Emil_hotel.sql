DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;

CREATE TABLE Hotel(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
    phone VARCHAR(50),
    street VARCHAR(50)
);

CREATE TABLE Room(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    floor INT CHECK(floor > 0),
    hotel_id INT NOT NULL,
	FOREIGN KEY(hotel_id) REFERENCES Hotel(id)
);

CREATE TABLE Person(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE PersonRoom(
	room_id INT,
    FOREIGN KEY(room_id) REFERENCES Room(id),
    person_id INT,
	FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person(name) VALUES ("Misho"), ("Emo"), ("Sedef"), ("Kriskatabate"), ("Davy Jones");

INSERT INTO Hotel(name, phone, street) VALUES
("Pirin golf", "1234567890", "street1"),
("Rila", "0987654321", "street2"),
("Borovets Hills", "0123456789", "street3"),
("Sunshine", "12345098761", "street4");

INSERT INTO Room(name, floor, hotel_id) VALUES
("Room 1", 1, 1), ("Room 2", 2, 1), 
("Room 11", 1, 2), ("Room 12", 2, 2),
("Room 21", 3, 3), ("Room 22", 4, 3), 
("Room 31", 11, 4), ("Room 32", 9, 5);

INSERT INTO PersonRoom(room_id, person_id) VALUES
(1, 1), (2, 1), (3, 2), (5, 3);

-- 1
SELECT Hotel.name, COUNT(DISTINCT person.name) FROM Hotel
LEFT JOIN Room ON Hotel.id = Room.hotel_id
LEFT JOIN PersonRoom ON Room.id = PersonRoom.room_id
LEFT JOIN Person ON PersonRoom.person_id = Person.id
GROUP BY Hotel.name ORDER BY COUNT(DISTINCT Person.id) DESC LIMIT 20;

-- 2
SELECT Hotel.name FROM Hotel
LEFT JOIN Room ON Hotel.id = Room.hotel_id
LEFT JOIN PersonRoom ON Room.id = PersonRoom.room_id
LEFT JOIN Person ON PersonRoom.person_id = Person.id
WHERE COUNT (Person.id) = 0
GROUP BY Hotel.name LIMIT 20;

-- 3
SELECT Hotel.name, Room.name, Person.name FROM Person
LEFT JOIN PersonRoom ON Person.id = PersonRoom.person_id
LEFT JOIN Room on PersonRoom.room_id = Room.id
LEFT JOIN Hotel on Room.hotel_id = Hotel.id LIMIT 20;
