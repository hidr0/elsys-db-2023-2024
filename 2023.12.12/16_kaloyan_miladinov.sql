DROP DATABASE IF EXISTS Hotel_Db;
CREATE DATABASE Hotel_Db;
USE Hotel_Db;

CREATE TABLE Hotel
(
	Id     INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Name   VARCHAR(255) NOT NULL,
	Phone  VARCHAR(255) NOT NULL,
	Street VARCHAR(255) NOT NULL
);

CREATE TABLE Rooms
(
	Id      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Floor   INT          NOT NULL CHECK ( Floor > 0 ),
	Name    VARCHAR(255) NOT NULL,
	Hotelid INT          NOT NULL,
	FOREIGN KEY (Hotelid) REFERENCES Hotel (Id)
);

CREATE TABLE Person
(
	Id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(255) NOT NULL
);

CREATE TABLE Reservation
(
	Id       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Personid INT NOT NULL,
	Roomid   INT NOT NULL,
	FOREIGN KEY (Personid) REFERENCES Person (Id),
	FOREIGN KEY (Roomid) REFERENCES Rooms (Id)
);

-- Table population
INSERT INTO Hotel (Name, Phone, Street)
VALUES ('Hilton', '123456789', 'Hilton street'),
	   ('Metropolitan', '987654321', 'Metropolitan street'),
	   ('TUES', '876543210', 'Studentski grad');

INSERT INTO Person (Name)
VALUES ('John'),
	   ('Jane'),
	   ('Jack'),
	   ('Jill'),
	   ('James');

INSERT INTO Rooms (Floor, Name, Hotelid)
VALUES (1, '101', 1),
	   (1, '102', 1),
	   (2, '201', 1),
	   (2, '202', 1),
	   (1, '101', 2),
	   (1, '102', 2),
	   (2, '201', 2),
	   (2, '202', 2);

INSERT INTO Reservation (Personid, Roomid)
VALUES (1, 1),
	   (2, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (1, 5),
	   (2, 6),
	   (3, 7),
	   (4, 6),
	   (4, 8),
	   (5, 8);

-- Number of guests per hotel
SELECT Hotel.Name, COUNT(DISTINCT Personid) AS 'Number of guests'
FROM Hotel
		 JOIN Rooms ON Hotel.Id = Rooms.Hotelid
		 JOIN Reservation ON Rooms.Id = Reservation.Roomid
GROUP BY Hotel.Id;

-- Return the hotels with no reservations
SELECT Hotel.Name
FROM Hotel
		 LEFT JOIN Rooms ON Hotel.Id = Rooms.Hotelid
		 LEFT JOIN Reservation ON Rooms.Id = Reservation.Roomid
WHERE Reservation.Id IS NULL;

-- Information for every guest
SELECT Hotel.Name, Room.Name, Person.Name
FROM Person
		 JOIN Reservation ON Person.Id = Reservation.Personid
		 JOIN Rooms Room ON Reservation.Roomid = Room.Id
		 JOIN Hotel ON Room.Hotelid = Hotel.Id;