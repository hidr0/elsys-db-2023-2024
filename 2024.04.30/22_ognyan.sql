DROP DATABASE IF EXISTS songs;
CREATE DATABASE songs;
USE songs;

CREATE TABLE Label (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Artist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    label_id INT,
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE Song (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    metadata JSON NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    uuid VARCHAR(36) NOT NULL
);

CREATE TABLE Song_Artist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    UNIQUE (song_id, artist_id)
);

CREATE TABLE Genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Song_Genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    UNIQUE (song_id, genre_id)
);

INSERT INTO Label (name, address) VALUES ('Sony Music', 'New York, NY');
INSERT INTO Label (name, address) VALUES ('Universal Music', 'Santa Monica, CA');
INSERT INTO Label (name, address) VALUES ('Warner Music', 'Los Angeles, CA');

INSERT INTO Artist (name, email_address, label_id) VALUES ('Adele', 'adele@gmail.com', 1);
INSERT INTO Artist (name, email_address, label_id) VALUES ('Ed Sheeran', 'ed@gmail.com', 2);
INSERT INTO Artist (name, email_address, label_id) VALUES ('Taylor Swift', 'ts@gmail.com', 3);

INSERT INTO Song (name, metadata, uuid) VALUES ('Imagine', '{
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
}', UUID());
SELECT SLEEP(1);
INSERT INTO Song (name, metadata, uuid) VALUES ('Shape of You', '{
  "title": "Shape of You",
  "duration": "3:53",
  "release_date": "2017-01-06",
  "genres": [
    "Pop",
    "Dancehall"
  ]
}', UUID());
SELECT SLEEP(1);
INSERT INTO Song (name, metadata, uuid) VALUES ('Love Story', '{
  "title": "Love Story",
  "duration": "3:55",
  "release_date": "2008-09-12",
  "genres": [
    "Country",
    "Pop"
  ],
  "album": {
    "title": "Fearless",
    "release_year": 2008,
    "label": "Big Machine Records",
    "formats": [
      "CD",
      "Digital"
    ]
  }
}', UUID());

INSERT INTO Song_Artist (song_id, artist_id) VALUES (1, 1);
INSERT INTO Song_Artist (song_id, artist_id) VALUES (2, 2);
INSERT INTO Song_Artist (song_id, artist_id) VALUES (3, 3);
INSERT INTO Song_Artist (song_id, artist_id) VALUES (1, 3);

INSERT INTO Genre (name) VALUES ('Soft rock');
INSERT INTO Genre (name) VALUES ('Pop');
INSERT INTO Genre (name) VALUES ('Dancehall');
INSERT INTO Genre (name) VALUES ('Country');

INSERT INTO Song_Genre (song_id, genre_id) VALUES (1, 1);
INSERT INTO Song_Genre (song_id, genre_id) VALUES (1, 2);
INSERT INTO Song_Genre (song_id, genre_id) VALUES (2, 2);
INSERT INTO Song_Genre (song_id, genre_id) VALUES (2, 3);
INSERT INTO Song_Genre (song_id, genre_id) VALUES (3, 2);
INSERT INTO Song_Genre (song_id, genre_id) VALUES (3, 4);



SELECT Song.*
FROM Song
WHERE JSON_CONTAINS_PATH(Song.metadata, 'one', '$.album') = 1;

SELECT Song.*
FROM Song
WHERE JSON_CONTAINS_PATH(Song.metadata, 'one', '$.album.formats') = 1 
AND JSON_CONTAINS(Song.metadata, '["LP"]', '$.album.formats');

SELECT Label.name AS Name
FROM Song
LEFT JOIN Song_Artist ON Song.id = Song_Artist.song_id
LEFT JOIN Artist ON Song_Artist.artist_id = Artist.id
LEFT JOIN Label ON Artist.label_id = Label.id
ORDER BY Song.created_at ASC
LIMIT 1;

SELECT Label.name AS Name, COUNT(*) AS Count
FROM Song
LEFT JOIN Song_Artist ON Song.id = Song_Artist.song_id
LEFT JOIN Artist ON Song_Artist.artist_id = Artist.id
LEFT JOIN Label ON Artist.label_id = Label.id
GROUP BY Label.id;

SELECT Artist.name AS Name
FROM Song
LEFT JOIN Song_Artist ON Song.id = Song_Artist.song_id
LEFT JOIN Artist ON Song_Artist.artist_id = Artist.id
GROUP BY Artist.id
ORDER BY COUNT(*) DESC
LIMIT 1;