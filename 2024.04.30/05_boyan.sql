DROP DATABASE IF EXISTS MusicPlayer;
CREATE DATABASE MusicPlayer;
USE MusicPlayer;

CREATE TABLE Label(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(100)
);

INSERT INTO Label(name, address) VALUES
("Timbaland", "USA"),
("Coldplay", "USA"),
("Ypsurt", "Bulgaria");

CREATE TABLE Artist(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50) CHECK(email LIKE '%@%'),
    label_id INT,
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

INSERT INTO Artist(name, email, label_id) VALUES
("Justin Timberlake", "justin@gmail.com", 1),
("Ico Hazarta", "ico777@gmail.com", 3);
INSERT INTO Artist(name, email) VALUES
("Usher", "ush@gmail.com");


CREATE TABLE Song(
	id INT PRIMARY KEY AUTO_INCREMENT,
    uuid CHAR(36) NOT NULL,
    name VARCHAR(50),
    metadata JSON,
    created_at DATETIME NOT NULL DEFAULT now()
);

INSERT INTO Song(uuid, name, metadata)
VALUES(UUID(), "Imagine", 
'{
  "title": "Imagine",
  "duration": "3:03",
  "release_date": "1971-10-11",
  "genres": [
    "Soft rock",
    "Pop"
  ],
  "album": {
    "title": "Imagine",
    "release_year": 1971,
    "label": "Apple Records",
    "formats": [
      "LP",
      "CD",
      "Digital"
    ]
  }
}'
);
INSERT INTO Song(uuid, name) VALUES
(UUID(), "More"),
(UUID(), "Stressed Out"),
(UUID(), "La La La"),
(UUID(), "Bravo");

SELECT * FROM Song;

CREATE TABLE ArtistsSongs(
	artist_id INT,
    song_id INT,
    PRIMARY KEY (artist_id, song_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
	FOREIGN KEY (song_id) REFERENCES Song(id)
);

INSERT INTO ArtistsSongs(artist_id, song_id) VALUES
(3, 2),
(2, 5);

CREATE TABLE Genre(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30)
);

INSERT INTO Genre(name) VALUES
("2000s"),
("Rap"),
("Pop");

CREATE TABLE SongGenre(
	song_id INT,
    genre_id INT,
    PRIMARY KEY (song_id, genre_id),
	FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

INSERT INTO SongGenre(song_id, genre_id) VALUES
(1, 3),
(2, 1),
(5, 2);

-- Queries --

SELECT * FROM Song WHERE metadata IS NOT NULL;

SELECT * FROM Song WHERE JSON_CONTAINS(metadata, '{"album": {"formats": ["LP"]}}', '$');





