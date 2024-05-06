DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
USE music;

CREATE TABLE Artist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255)
);

CREATE TABLE Label (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE Genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uuid VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    metadata JSON NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    artist_id INT,
    label_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE SongGenre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT,
    genre_id INT,
    UNIQUE (song_id, genre_id),
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

INSERT INTO Artist (name, email_address) VALUES ('Ariana Grande', 'ag@gmail.com');
INSERT INTO Artist (name, email_address) VALUES ('Ivancho', 'ivancho@gmail.com');
INSERT INTO Artist (name, email_address) VALUES ('Sabrina', 'sabrina@gmail.com');

INSERT INTO Label (name, address) VALUES ('VEVO', 'Bulgaria Bulevard');
INSERT INTO Label (name, address) VALUES ('Kvartalna muzika', 'Sofia');

INSERT INTO Genre (name) VALUES ('Pop'); 
INSERT INTO Genre (name) VALUES ('Rock');


-- 4 - Insert given JSON in the metadata of the song
INSERT INTO Song (uuid, name, metadata, artist_id, label_id) VALUES (
    UUID(),
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
    1, 
    1
);

INSERT INTO Song (uuid, name, metadata, artist_id, label_id) VALUES (
    UUID(),
    'Espresso',
    '{
        "title": "Espresso",
        "duration": "2:55",
        "release_date": "2024-04-20",
        "genres": ["Pop"],
        "album": {
            "title": "Espresso",
            "release_year": 2024,
            "label": "VEVO",
            "formats": [
			  "CD"
			]
        }
    }',
    3,
    1
);


INSERT INTO SongGenre (song_id, genre_id) VALUES (1, 1);

-- 5 - Return the songs which have metadata
-- {
--   "album": ...
-- }

SELECT *
FROM Song
WHERE JSON_CONTAINS_PATH(metadata, 'one', '$.album') = 1;


-- 6 - Return the songs which have metadata albums formats and one of the formats is "LP"
-- {
--   {
--   "album": {
--     "formats": ["LP"...]
--   }
-- }

SELECT *
FROM Song
WHERE JSON_CONTAINS(metadata, '"LP"', '$.album.formats');


