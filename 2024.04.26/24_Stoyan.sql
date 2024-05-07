DROP DATABASE IF EXISTS music_store;
CREATE DATABASE music_store;
USE music_store;

CREATE TABLE Label (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL
);

INSERT INTO Label (name, address) 
VALUES  ('New Record Label', '789 Music St, City, Country'),
        ('New Indie Label', '101 Indie St, City, Country');

CREATE TABLE Song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    metadata JSON,
    uid VARCHAR(36) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Song (title, uid, metadata) 
VALUES  ('Imagine', UUID(), '{"title": "Imagine", "duration": "3:03", "release_date": "1971-10-11", "genres": ["Soft rock", "Jazz"], "album": {"title": "Imagine", "release_year": 1971, "label": "New Record Label", "formats": ["LP", "CD", "Digital"]}}'),
        ('My Song', UUID(), null),
        ('Famous Hit', UUID(), '{"album": {"formats": ["LP", "CD"]}}'),
        ('Another Hit', UUID(), '{"album": {"formats": ["LP", "CD", "Digital"]}}');

CREATE TABLE Artist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%.%' AND email NOT LIKE '%[^a-zA-Z0-9@._-]%'),
    label_id INT NOT NULL,
    FOREIGN KEY (label_id) REFERENCES Label(id)
);

INSERT INTO Artist (name, email, label_id) 
VALUES  ('Michael Thompson', 'michael@example.com', 1),
        ('Samantha Green', 'samantha@example.com', 2);

CREATE TABLE ArtistSong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (song_id) REFERENCES Song(id)
);

INSERT INTO ArtistSong (artist_id, song_id) 
VALUES  ((SELECT id FROM Artist WHERE name = 'Michael Thompson'), (SELECT id FROM Song WHERE title = 'Imagine')),
        ((SELECT id FROM Artist WHERE name = 'Michael Thompson'), (SELECT id FROM Song WHERE title = 'Another Hit'));

CREATE TABLE Genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO Genre (name) 
VALUES  ('Pop'),
        ('Blues'),
        ('Funk');

CREATE TABLE SongGenre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES Song(id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    CONSTRAINT unique_id UNIQUE(song_id, genre_id)
);

INSERT INTO SongGenre (song_id, genre_id) 
VALUES  ((SELECT id FROM Song WHERE title = 'Imagine'), (SELECT id FROM Genre WHERE name = 'Pop')),
        ((SELECT id FROM Song WHERE title = 'My Song'), (SELECT id FROM Genre WHERE name = 'Blues')),
        ((SELECT id FROM Song WHERE title = 'Famous Hit'), (SELECT id FROM Genre WHERE name = 'Funk')),
        ((SELECT id FROM Song WHERE title = 'Another Hit'), (SELECT id FROM Genre WHERE name = 'Pop'));

SELECT * FROM Song WHERE metadata IS NOT NULL;
SELECT * FROM Song WHERE JSON_CONTAINS_PATH(metadata, 'one', '$.album');
SELECT * FROM Song WHERE JSON_CONTAINS_PATH(metadata, 'one', '$.album.formats') AND JSON_EXTRACT(metadata, '$.album.formats') LIKE '%"LP"%';
