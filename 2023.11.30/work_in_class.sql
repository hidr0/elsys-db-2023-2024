DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE Authors(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL check(length(name) > 3),
    email varchar(100) NOT NULL UNIQUE,
    birthdate date NOT NULL
);

INSERT INTO Authors(name, email, birthdate) VALUES("John Doe", "johndoe@example.com", "1975-04-12");
INSERT INTO Authors(name, email, birthdate) VALUES("Jane Smith", "janesmith@example.com", "1980-11-23");

CREATE TABLE AuthorDetails(
	id int PRIMARY KEY AUTO_INCREMENT,
    biography text,
    awards text
);
