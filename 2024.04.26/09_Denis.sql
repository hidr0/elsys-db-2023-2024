DROP DATABASE IF EXISTS MusicLabel;
CREATE DATABASE MusicLabel;
USE MusicLabel;

CREATE TABLE Artist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Label (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(id)
);

CREATE TABLE Song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    metadata JSON NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ArtistSong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    song_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (song_id) REFERENCES Song(id)
);

CREATE TABLE Genre (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);

CREATE TABLE SongGenre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT,
    genre_id INT,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    UNIQUE(song_id, genre_id)
);


INSERT INTO Song (uuid, name, metadata) VALUES (
    UUID(),
    'Imagine',
    '{
        "title": "Imagine",
        "duration": "3:03",
        "release_date": "1971-10-11",
        "genres": ["Soft rock", "Pop"],
        "album": {
          "title": "Imagine",
          "release_year": 1971,
          "label": "Apple Records",
        "formats": ["LP", "CD", "Digital"]
        }
    }'
);

INSERT INTO Genre (name) VALUES ('Soft rock'), ('Pop');

INSERT INTO SongGenre (song_id, genre_id) VALUES (1, 1), (1, 2);

SELECT * FROM Song
WHERE JSON_CONTAINS_PATH(metadata, 'one', '$.album');

SELECT * FROM Song
WHERE JSON_CONTAINS(metadata->'$.album.formats', '"LP"');

