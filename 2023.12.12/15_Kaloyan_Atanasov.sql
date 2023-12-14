DROP DATABASE IF EXISTS HOTEL;
CREATE DATABASE HOTEL;
USE HOTEL;

CREATE TABLE Hotel(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    phone varchar(255) NOT NULL,
	street varchar(255)	NOT NULL
);

INSERT INTO Hotel(name, phone, street) VALUES("RAMADA", "0123456", "Plovdiv, ul. Maria Luisa 15");
INSERT INTO Hotel(name, phone, street) VALUES("Continental", "0654321", "New York, W 44th st");

CREATE TABLE Rooms(
	
);