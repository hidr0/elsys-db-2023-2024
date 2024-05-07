SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS musicIndustry;
CREATE DATABASE musicIndustry;
USE musicIndustry;

CREATE TABLE Label (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    uuid VARCHAR(36) NOT NULL
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
    metadata JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE SongArtist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT,
    artist_id INT,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (artist_id) REFERENCES Artist(id)
);

CREATE TABLE SongGenre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT,
    genre_id INT,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

INSERT INTO Label (name, address, uuid) VALUES
('Drake Lable', 'Toronto', UUID()),
('Kanye', 'Nz brat', UUID());

INSERT INTO Artist (name, email_address, label_id) VALUES
('4batz', 'industry@plant.com', 1),
('Ye', 'ye@west.com', 2),
('Drake', 'drizzy@aubrey.com', 1),
('Sleepy Hallow', 'sleepy@abv.bg', 2);

INSERT INTO Song (name, metadata) VALUES
('Imagine', '{
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
}'),
('Anxiety', '{
  "title": "Anxiety",
  "duration": "3:03",
  "release_date": "2023-10-11",
  "genres": [
    "Rap",
    "Rnb"
  ],
  "album": {
    "title": "Boy meets world",
    "release_year": 2023
  }
}'),
("Random", '{}');

INSERT INTO Genre (name) VALUES
('Soft rock'),
('Pop'),
('Rap'),
('Rnb');

INSERT INTO SongArtist (song_id, artist_id) VALUES
(1, 1),
(1, 3),
(2, 4),
(3, 2);

INSERT INTO SongGenre (song_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 3);

SELECT * FROM Song 
WHERE JSON_CONTAINS_PATH(metadata, 'one', '$.album');
 -- tova one tursi pone vednuj dali ima pone edno
SELECT * FROM Song
WHERE JSON_CONTAINS(metadata->'$.album.formats', '["LP"]');
 -- -> vzima dannite ot json-a
 
 -- 1
SELECT Label.name FROM Label
LEFT JOIN Artist ON Label.id = Artist.label_id
LEFT JOIN SongArtist ON Artist.id = SongArtist.artist_id
LEFT JOIN Song ON SongArtist.song_id = Song.id
ORDER BY Song.created_at ASC LIMIT 1;

-- 2
SELECT Label.name, COUNT(DISTINCT Song.id) AS Count  FROM Label
LEFT JOIN Artist ON Label.id = Artist.label_id
LEFT JOIN SongArtist ON Artist.id = SongArtist.artist_id
LEFT JOIN Song ON SongArtist.song_id = Song.id
GROUP BY Label.name;

