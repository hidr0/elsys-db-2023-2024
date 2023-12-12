DROP DATABASE IF EXISTS hotels;
CREATE DATABASE hotels;
USE hotels;

CREATE TABLE Hotel(
    id int PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200),
    Phone_Number VARCHAR(200),
    Street VARCHAR(200) not null
);

CREATE TABLE Person(
    id int PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200)
);

CREATE TABLE Rooms(
    id int PRIMARY KEY AUTO_INCREMENT,
    Floor int CHECK(Floor > 0),
    Name VARCHAR(200),
    hotel_id int not null,
    FOREIGN KEY(hotel_id) REFERENCES Hotel(id)
);

CREATE TABLE Reservation(
    id int PRIMARY KEY AUTO_INCREMENT,
    room_id int not null,
    FOREIGN KEY(room_id) REFERENCES Rooms(id),
    person_id int not null,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

-- INSERT statements for Hotel table
INSERT INTO Hotel (Name, Phone_Number, Street) VALUES ('Hotel A', '123456789', '123 Main Street');
INSERT INTO Hotel (Name, Phone_Number, Street) VALUES ('Hotel B', '987654321', '456 Elm Street');

-- INSERT statements for Person table
INSERT INTO Person (Name) VALUES ('John Doe');
INSERT INTO Person (Name) VALUES ('Jane Smith');

-- INSERT statements for Rooms table
INSERT INTO Rooms (Floor, Name, hotel_id) VALUES (1, 'Room 101', 1);
INSERT INTO Rooms (Floor, Name, hotel_id) VALUES (2, 'Room 202', 1);
INSERT INTO Rooms (Floor, Name, hotel_id) VALUES (1, 'Room 103', 2);
INSERT INTO Rooms (Floor, Name, hotel_id) VALUES (2, 'Room 204', 2);

-- INSERT statements for Reservation table
INSERT INTO Reservation (room_id, person_id) VALUES (1, 1);
INSERT INTO Reservation (room_id, person_id) VALUES (2, 2);
INSERT INTO Reservation (room_id, person_id) VALUES (3, 1);
INSERT INTO Reservation (room_id, person_id) VALUES (4, 2);


-- number of visitors per hotel
SELECT hotel_id, COUNT(DISTINCT(person_id))
FROM Reservation
JOIN Rooms ON Rooms.id = Reservation.room_id
GROUP BY hotel_id;

-- hotel without visitors
SELECT Hotel.* 
FROM Reservation
RIGHT JOIN Rooms ON Rooms.id = Reservation.room_id
RIGHT JOIN Hotel ON Hotel.id = Rooms.hotel_id
WHERE Reservation.id IS NULL -- this works because I'm right joining above
GROUP BY Hotel.id;

-- [Hotel, Room, Person] for every person
SELECT Hotel.*, Rooms.*, Person.*
FROM Person
LEFT JOIN Reservation ON Reservation.person_id = Person.id
LEFT JOIN Rooms ON Rooms.id = Reservation.room_id
LEFT JOIN Hotel ON Hotel.id = Rooms.hotel_id;
