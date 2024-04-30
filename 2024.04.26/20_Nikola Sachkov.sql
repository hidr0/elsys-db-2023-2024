DROP DATABASE IF EXISTS Playlist;
CREATE DATABASE Playlist;
USE Playlist;

CREATE TABLE Label (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    UNIQUE(uuid)
);

CREATE TABLE Genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    UNIQUE(uuid)
);

CREATE TABLE Artist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255),
    label_uuid CHAR(36),
    FOREIGN KEY (label_uuid) REFERENCES Label(uuid) ON DELETE SET NULL,
    UNIQUE(uuid)
);

CREATE TABLE Song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid CHAR(36) NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NOT NULL,
    metadata JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    artist_uuid CHAR(36),
    FOREIGN KEY (artist_uuid) REFERENCES Artist(uuid) ON DELETE CASCADE,
    UNIQUE(uuid)
);

CREATE TABLE SongGenre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_uuid CHAR(36),
    genre_uuid CHAR(36),
    FOREIGN KEY (song_uuid) REFERENCES Song(uuid) ON DELETE CASCADE,
    FOREIGN KEY (genre_uuid) REFERENCES Genre(uuid) ON DELETE CASCADE,
    UNIQUE(song_uuid, genre_uuid)
);

INSERT INTO Artist (name, email_address, label_uuid) VALUES (
  'Artist Name',
  'artist@example.com',
  (SELECT uuid FROM Label WHERE name = 'Label Name')
  );

INSERT INTO Song (name, metadata, artist_uuid) VALUES (
  'Imagine',
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
  }',
  (SELECT uuid FROM Artist WHERE name = 'Artist Name')
);

SELECT * FROM Song WHERE JSON_EXTRACT(metadata, '$.album') IS NOT NULL;

SELECT * FROM Song WHERE JSON_CONTAINS(metadata, '"LP"', '$.album.formats');