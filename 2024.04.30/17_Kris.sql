DROP DATABASE IF EXISTS music_store;
CREATE DATABASE music_store;
USE music_store;

CREATE TABLE Label (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL
);

INSERT INTO Label (name, address) 
VALUES  ('Record Label', '123 Music St, City, Country'),
		('Indie Label', '456 Indie St, City, Country');

CREATE TABLE Song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    metadata JSON,
    uid varchar(36) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Song (title, uid, metadata) 
VALUES 	('First Song', UUID(), '{ "title": "Imagine", "duration": "3:03", "release_date": "1971-10-11", "genres": [ "Soft rock", "Pop" ], "album": { "title": "Imagine", "release_year": 1971, "label": "Apple Records", "formats": [ "LP", "CD", "Digital" ] } }'),
		('Another Song', UUID(), null),
		('Hit Song', UUID(), '{ "album": { "formats": ["LP", "CD"] } }'),
        ('A Song', UUID(), '{ "album": { "formats": ["LPCD", "Digital"] } }');

CREATE TABLE Artist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL CHECK(email LIKE '%@%.%' AND email NOT LIKE '%[^a-zA-Z0-9@._-]%'),
	label_id INT NOT NULL,
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

INSERT INTO Artist (name, email, label_id) 
VALUES 	('John Doe', 'johndoe@example.com', 1),
		('Jane Smith', 'jane_smith@example.com', 2);

CREATE TABLE ArtistSong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (song_id) REFERENCES Song(id),
    CONSTRAINT unique_id UNIQUE(artist_id, song_id)
);

INSERT INTO ArtistSong (artist_id, song_id) 
VALUES 	(2, 1),
		(1, 2),
		(2, 3);

CREATE TABLE Genre (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO Genre (name) 
VALUES 	('Pop'),
		('Rock'),
		('Hip-hop');

CREATE TABLE SongGenre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT NOT NULL,
	genre_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    CONSTRAINT unique_id UNIQUE(song_id, genre_id)
);

INSERT INTO SongGenre (song_id, genre_id) 
VALUES 	(1, 1),
		(2, 2),
		(3, 3);

SELECT * FROM Song 
WHERE JSON_EXTRACT(metadata, '$.album.formats');

SELECT * FROM Song 
WHERE JSON_EXTRACT(metadata, '$.album.formats') LIKE '%"LP"%';

SELECT Label.name FROM Label
LEFT JOIN Artist ON Label.id = Artist.label_id
LEFT JOIN ArtistSong ON Artist.id = ArtistSong.artist_id
LEFT JOIN Song ON ArtistSong.song_id = Song.id
ORDER BY Song.created_at ASC LIMIT 1;

SELECT Label.name, COUNT(*) FROM Label
LEFT JOIN Artist ON Label.id = Artist.label_id
LEFT JOIN ArtistSong ON Artist.id = ArtistSong.artist_id
LEFT JOIN Song ON ArtistSong.song_id = Song.id
GROUP BY Label.name;

SELECT Artist.name FROM Artist
LEFT JOIN ArtistSong ON Artist.id = ArtistSong.artist_id
LEFT JOIN SongGenre ON ArtistSong.song_id = SongGenre.song_id
GROUP BY Artist.name
ORDER BY COUNT(DISTINCT SongGenre.genre_id) DESC LIMIT 1;