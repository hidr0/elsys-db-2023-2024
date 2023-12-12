DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;


CREATE TABLE Hotel(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
    phone VARCHAR(15),
    street VARCHAR(50)
);

CREATE TABLE Room(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
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


INSERT INTO Person(name) VALUES
("John Doe"), ("Blackbeard"), ("Katerina"), ("Martin"), ("Davy Jones");

INSERT INTO Hotel(name, phone, street) VALUES
("Cool Hotel", "0333555888", "Elm Street"),
("Jazzy Hotel", "0000000000", "Tzar Boris III"),
("Neon Hotel", "0123456789", "Silk Road"),
("Sad Hotel", "0987654321", "Street A"),
("Rude Hotel", "1029384756", "Street Z");

INSERT INTO Room(name, floor, hotel_id) VALUES
("Room 1", 5, 1), ("Room 2", 2, 1), ("Room ABC", 9, 2), ("Room 2A1", 21, 2), ("Room 7", 1, 2),
("Room 29", 29, 3), ("Room 0xFF", 256, 3), ("Room -1", 65536, 4), ("Room 4", 8, 4), ("Room ASD", 13, 5);

INSERT INTO PersonRoom(room_id, person_id) VALUES
(1, 1), (2, 1), (3, 1), (5, 1),
(6, 3), (7, 2), (8, 5), (9, 2);


-- Колко посетители има всеки хотел:
SELECT Hotel.name, COUNT(DISTINCT person.name) FROM Hotel
LEFT JOIN Room ON Hotel.id = Room.hotel_id
LEFT JOIN PersonRoom ON Room.id = PersonRoom.room_id
LEFT JOIN Person ON PersonRoom.person_id = Person.id
GROUP BY Hotel.name
ORDER BY COUNT(DISTINCT Person.id) DESC
LIMIT 20;

-- Хотели без посетители:
SELECT Hotel.name FROM Hotel
LEFT JOIN Room ON Hotel.id = Room.hotel_id
LEFT JOIN PersonRoom ON Room.id = PersonRoom.room_id
LEFT JOIN Person ON PersonRoom.person_id = Person.id
GROUP BY Hotel.name
HAVING COUNT(Person.id) = 0
LIMIT 20;


-- [ хотел, стая, човек ] за всеки човек
SELECT Hotel.name, Room.name, Person.name FROM Person
LEFT JOIN PersonRoom ON Person.id = PersonRoom.person_id
LEFT JOIN Room on PersonRoom.room_id = Room.id
LEFT JOIN Hotel on Room.hotel_id = Hotel.id
LIMIT 20;
