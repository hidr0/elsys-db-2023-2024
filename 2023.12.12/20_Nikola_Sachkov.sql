DROP DATABASE IF EXISTS Hotel;
CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE Hotel(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    phone_number VARCHAR(15),
    street VARCHAR(255)
);

CREATE TABLE Rooms(
	id INT PRIMARY KEY AUTO_INCREMENT,
	floor INT UNSIGNED,
    name VARCHAR(255),
    hotel_id INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(id),
    CHECK (floor > 0)
);

CREATE TABLE Person(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

CREATE TABLE PersonRooms(
	id INT PRIMARY KEY AUTO_INCREMENT,
	person_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(id),
    room_id INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);

INSERT INTO Hotel(name, phone_number, street)
VALUES 	("Grand", "854695059", "ul. Vila"),
		("Finlandia", "039949223", "ul. Cherna"),
		("Orlovets", "7341233829", "bul. Bqla");
        

INSERT INTO Rooms(floor, name, hotel_id)
VALUES	(1, "101", 1),
		(2, "201", 1),
        (1, "105", 2),
        (3, "304", 3),
        (8, "803", 3);

INSERT INTO Person(name)
VALUES 	("Nikola"),
		("Pesho"),
        ("Ivan"),
        ("Mitko");

INSERT INTO PersonRooms(person_id, room_id)
VALUES	(1, 1),
		(2, 1),
        (3, 2),
        (1, 4),
        (3, 4),
        (4, 5);

-- Колко посетители има всеки хотел?
SELECT Hotel.name, COUNT(Person.id) FROM Hotel
LEFT JOIN Rooms ON Rooms.hotel_id = Hotel.id
LEFT JOIN PersonRooms ON PersonRooms.room_id = Rooms.id
LEFT JOIN Person ON PersonRooms.person_id = Person.id
GROUP BY Hotel.id;

-- Извадете хотела без посетители.
SELECT Hotel.name FROM Hotel
LEFT JOIN Rooms ON Rooms.hotel_id = Hotel.id
LEFT JOIN PersonRooms ON PersonRooms.room_id = Rooms.id
LEFT JOIN Person ON PersonRooms.person_id = Person.id
GROUP BY Hotel.id
HAVING COUNT(Person.id) = 0;

-- [Хотел, Стая, Човек] за всеки човек
SELECT Hotel.name, Rooms.name, Person.name FROM Person
LEFT JOIN PersonRooms ON PersonRooms.person_id = Person.id
LEFT JOIN Rooms ON PersonRooms.room_id = Rooms.id
LEFT JOIN Hotel ON Rooms.hotel_id = Hotel.id;