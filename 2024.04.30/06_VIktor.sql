DROP DATABASE IF EXISTS Music;

CREATE DATABASE Music;

USE Music;

CREATE TABLE Label (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE Artist (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    email_address VARCHAR(255) UNIQUE NOT NULL CHECK(email_address LIKE "%@%" AND email_address NOT LIKE "%[^a-zA-Z0-9@._-]%"),
	label_id INT NOT NULL,
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE Song (
	id INT PRIMARY KEY AUTO_INCREMENT,
	uid VARCHAR(36) NOT NULL,
	name VARCHAR(255) NOT NULL,
    metadata JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Genre (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE SongGenre (
	id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id)
);

CREATE TABLE ArtistSong (
	id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (artist_id) REFERENCES Artist(id)
);

INSERT INTO Label (name, address) VALUES 
('Universal Music Group', 'Los Angeles, CA'),
('Sony Music Entertainment', 'New York, NY'),
('Atlantic Records', 'New York, NY'),
('Big Machine Records', 'Nashville, TN'),
('EMI Records', 'London, UK'),
('DGC Records', 'Los Angeles, CA'),
('Warner Bros. Records', 'Burbank, CA');

INSERT INTO Artist (name, email_address, label_id) VALUES
('Ed Sheeran', 'ed@example.com', 1),
('Taylor Swift', 'taylor@example.com', 2),
('Queen', 'queen@example.com', 3),
('Nirvana', 'nirvana@example.com', 4),
('Linkin Park', 'linkinpark@example.com', 5);

INSERT INTO Song (uid, name, metadata) VALUES
(UUID(), 'Shape of You', '{
  "title": "Shape of You",
  "duration": "3:54",
  "release_date": "2017-01-06",
  "genres": [
    "Pop",
    "R&B"
  ],
  "album": {
    "title": "÷",
    "release_year": 2017,
    "label": "Atlantic Records",
    "formats": [
      "CD",
      "Digital"
    ]
  }
}'),
(UUID(), 'Love Story', '{
  "title": "Love Story",
  "duration": "3:56",
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
}'),
(UUID(), 'Bohemian Rhapsody', '{
  "title": "Bohemian Rhapsody",
  "duration": "5:55",
  "release_date": "1975-10-31",
  "genres": [
    "Rock",
    "Pop"
  ],
  "album": {
    "title": "A Night at the Opera",
    "release_year": 1975,
    "label": "EMI Records",
    "formats": [
      "LP",
      "CD",
      "Digital"
    ]
  }
}'),
(UUID(), 'Smells Like Teen Spirit', '{
  "title": "Smells Like Teen Spirit",
  "duration": "5:01",
  "release_date": "1991-09-10",
  "genres": [
    "Grunge",
    "Rock"
  ],
  "album": {
    "title": "Nevermind",
    "release_year": 1991,
    "label": "DGC Records",
    "formats": [
      "CD",
      "Cassette",
      "LP"
    ]
  }
}'),
(UUID(), 'Numb', '{
  "title": "Numb",
  "duration": "3:07",
  "release_date": "2003-09-08",
  "genres": [
    "Alternative Rock",
    "Nu Metal"
  ],
  "album": {
    "title": "Meteora",
    "release_year": 2003,
    "label": "Warner Bros. Records",
    "formats": [
      "CD",
      "Digital"
    ]
  }
}');

INSERT INTO Genre (name) VALUES
('Pop'),
('Country'),
('Rock'),
('Grunge'),
('Alternative Rock'),
('R&B'),
('Soft rock'),
('Nu Metal');

INSERT INTO SongGenre (song_id, genre_id) VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 1),
(3, 3),
(3, 1),
(4, 3),
(4, 4),
(5, 5),
(5, 8);

INSERT INTO ArtistSong (song_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


SELECT * FROM Song WHERE metadata IS NOT NULL;

SELECT s.*
FROM Song s
WHERE JSON_EXTRACT(s.metadata, '$.album.formats[*]') LIKE '%"LP"%';

SELECT l.name AS Name
FROM Label l
JOIN Artist a ON l.id = a.label_id
JOIN ArtistSong ast ON a.id = ast.artist_id
JOIN Song s ON ast.song_id = s.id
ORDER BY s.created_at ASC
LIMIT 1;

SELECT l.name AS Lable, COUNT(DISTINCT s.id) AS SongCount
FROM Label l
LEFT JOIN Artist a ON l.id = a.label_id
LEFT JOIN ArtistSong ast ON a.id = ast.artist_id
LEFT JOIN Song s ON ast.song_id = s.id
GROUP BY l.id;

SELECT a.name AS Artist, COUNT(DISTINCT sg.genre_id) AS GenreCount
FROM Artist a
LEFT JOIN ArtistSong ast ON ast.artist_id = a.id
LEFT JOIN SongGenre sg ON sg.song_id = ast.song_id
GROUP BY a.id
ORDER BY GenreCount DESC
LIMIT 1;
