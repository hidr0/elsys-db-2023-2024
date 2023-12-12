DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;

CREATE TABLE Hotel(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    phone_number  varchar(13),
    street varchar(100)
);
INSERT INTO Hotel(name,phone_number,street) VALUES("Hilton","0888123123","ul.Centralna 2");
INSERT INTO Hotel(name,phone_number,street) VALUES("Vega","0888321321","ul.GM.Dimitrov 713");
INSERT INTO Hotel(name,phone_number,street) VALUES("Paradise","0888717171","ul.Mini 0");
SELECT * FROM Hotel;

CREATE TABLE Rooms(
	id int PRIMARY KEY AUTO_INCREMENT,
    floor int check(floor>0),
    name varchar(30),
	hotel_id int not null,
    FOREIGN KEY(hotel_id) REFERENCES Hotel(id)
);
INSERT INTO Rooms(floor,name,hotel_id) VALUES (4,"A121",1);
INSERT INTO Rooms(floor,name,hotel_id) VALUES (2,"A113",2);
INSERT INTO Rooms(floor,name,hotel_id) VALUES (1,"B16",1);

SELECT *FROM Rooms;

CREATE TABLE Person(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30)
);

INSERT INTO Person(name) VALUES ("Nikolay");
INSERT INTO Person(name) VALUES ("Kostadin");
INSERT INTO Person(name) VALUES ("Trafalgar");
INSERT INTO Person(name) VALUES ("Stefan");

SELECT * FROM Person;

CREATE TABLE Person_Room(
	id int PRIMARY KEY AUTO_INCREMENT,
    room_id int not null,
    FOREIGN KEY(room_id) REFERENCES Rooms(id),
    person_id int not null,
    FOREIGN KEY(person_id) REFERENCES Person(id)
);

INSERT INTO Person_Room(room_id,person_id) VALUES (1,2);
INSERT INTO Person_Room(room_id,person_id) VALUES (1,1);
INSERT INTO Person_Room(room_id,person_id) VALUES (2,2);
INSERT INTO Person_Room(room_id,person_id) VALUES (3,3);

SELECT Hotel.name, COUNT(Person.id) FROM Hotel
LEFT JOIN Rooms 
on Hotel.id = Rooms.hotel_id
LEFT JOIN Person_Room
on Rooms.id = Person_Room.room_id
LEFT JOIN Person 
on Person_Room.person_id = Person.id
GROUP BY Hotel.name; 

SELECT Hotel.name FROM Hotel
LEFT JOIN Rooms 
on Hotel.id = Rooms.hotel_id
LEFT JOIN Person_Room
on Rooms.id = Person_Room.room_id
LEFT JOIN Person 
on Person_Room.person_id = Person.id
GROUP BY Hotel.name
HAVING COUNT(Person.id) = 0; 

SELECT Hotel.name, Rooms.name, Person.name FROM Person
LEFT JOIN Person_Room
on Person.id = Person_Room.person_id
LEFT JOIN Rooms
on Person_Room.room_id = Rooms.id
LEFT JOIN Hotel
on Rooms.hotel_id = Hotel.id;
