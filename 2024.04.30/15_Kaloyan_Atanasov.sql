SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS Songs;
CREATE DATABASE Songs;
USE Songs;

CREATE TABLE Label(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL
);

CREATE TABLE Artist(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255),
    email varchar(255),
    label_id int NOT NULL UNIQUE,
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE Genre(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255)
);

CREATE TABLE Song(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255),
    created_at DATETIME NOT NULL DEFAULT (NOW()),
    matadata JSON
);

CREATE TABLE Songs_Genre(
	id int PRIMARY KEY AUTO_INCREMENT,
    song_id int NOT NULL UNIQUE,
    genre_id int NOT NULL UNIQUE,
	FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

CREATE TABLE Songs_Artist(
	id int PRIMARY KEY AUTO_INCREMENT,
    song_id int NOT NULL UNIQUE,
    artist_id int NOT NULL UNIQUE,
	FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (artist_id) REFERENCES Artist(id)
);