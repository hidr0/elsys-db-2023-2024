DROP DATABASE IF EXISTS hotels;
CREATE DATABASE hotels;
USE hotels;

CREATE TABLE Hotel (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	street VARCHAR(255) NOT NULL
);

CREATE TABLE Room (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	floor INT NOT NULL CHECK ( Floor > 0 ),
	name VARCHAR(100) NOT NULL,
	hotel_id INT NOT NULL,
	FOREIGN KEY (hotel_id) REFERENCES Hotel(id)
);

CREATE TABLE Person (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE Reservation (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	person_id INT NOT NULL,
	room_id INT NOT NULL,
	FOREIGN KEY (person_id) REFERENCES Person(id),
	FOREIGN KEY (room_id) REFERENCES Room(id)
);

INSERT INTO Hotel (name, phone, street)
VALUES ('Hilton Sofia', '0887238019', 'ul. Astana'),
	   ('Grand Hotel Millennium Sofia', '0877639103', 'bul. Bulgaria'),
	   ('Hotel Marinela Sofia', '0877530330', 'bul. Djeims Baucher');

INSERT INTO Person (name)
VALUES ('Kriskata'),
	   ('Vankeca'),
	   ('Nikicha');

INSERT INTO Room (floor, name, hotel_id)
VALUES (1, '101', 1),
	   (1, '102', 1),
	   (2, '201', 1),
	   (2, '202', 1),
	   (1, '101', 2),
	   (1, '102', 2),
	   (2, '201', 2),
	   (2, '202', 2);

INSERT INTO Reservation (person_id, room_id)
VALUES 	(1, 1),
		(1, 3),
		(2, 2),
		(2, 4),
		(3, 5),
		(3, 6);

-- Посетители за всеки хотел
SELECT Hotel.name, COUNT(DISTINCT person_id) FROM Hotel
JOIN Room ON Hotel.id = Room.hotel_id
JOIN Reservation ON Room.id = Reservation.room_id
GROUP BY Hotel.id;

-- Хотели без посетители
SELECT Hotel.name FROM Hotel
LEFT JOIN Room ON Room.hotel_id = Hotel.id
LEFT JOIN Reservation ON Reservation.room_id = Room.id
LEFT JOIN Person ON Reservation.person_id = Person.id
GROUP BY Hotel.id HAVING COUNT(Person.id) = 0;

-- [Хотел, Стая, Човек] за всеки човек
SELECT Hotel.name, Room.name, Person.name FROM Person
JOIN Reservation ON Person.id = Reservation.person_id
JOIN Room ON Reservation.room_id = Room.id
JOIN Hotel ON Room.hotel_id = Hotel.id;