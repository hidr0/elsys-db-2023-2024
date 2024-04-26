DROP DATABASE IF EXISTS music_app;
CREATE DATABASE IF NOT EXISTS music_app;

USE music_app;


CREATE TABLE IF NOT EXISTS song (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    uid VARCHAR(256) UNIQUE NOT NULL,
    metadata JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS genre (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS label (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256) UNIQUE NOT NULL,
    address VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256) UNIQUE NOT NULL,
    email VARCHAR(256) UNIQUE NOT NULL CHECK(email LIKE '%@%.%' AND email NOT LIKE '%[^a-zA-Z0-9@._-]%'),
    label_id INT,

    FOREIGN KEY (label_id) REFERENCES label(id)
);  

CREATE TABLE IF NOT EXISTS artist_song (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist_id INT,
    song_id INT,

    FOREIGN KEY (artist_id) REFERENCES artist(id),
    FOREIGN KEY (song_id) REFERENCES song(id),

    CONSTRAINT unique_ids UNIQUE (artist_id, song_id)
);

CREATE TABLE IF NOT EXISTS song_genre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_id INT,
    genre_id INT,

    FOREIGN KEY (song_id) REFERENCES song(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id),

    CONSTRAINT unique_ids UNIQUE (song_id, genre_id)
);

INSERT INTO song (title, uid, metadata) 
VALUES     ('First Song', UUID(), '{ "title": "Imagine", "duration": "3:03", "release_date": "1971-10-11", "genres": [ "Soft rock", "Pop" ], "album": { "title": "Imagine", "release_year": 1971, "label": "Apple Records", "formats": [ "LP", "CD", "Digital" ] } }'),
        ('Another Song', UUID(), null),
        ('Hit Song', UUID(), '{ "album": { "formats": ["LP", "CD"] } }'),
        ('A Song', UUID(), '{ "album": { "formats": ["CD", "Digital"] } }');

INSERT INTO label (name, address) 
VALUES  ('Record Label', '123 Music St, City, Country'),
        ('Indie Label', '456 Indie St, City, Country');

INSERT INTO artist (name, email, label_id) 
VALUES     ('John Doe', 'johndoe@example.com', 1),
        ('Jane Smith', 'jane_smith@example.com', 2);

INSERT INTO artist_song (artist_id, song_id) 
VALUES     (1, 1),
        (1, 2),
        (2, 3);

INSERT INTO genre (name) 
VALUES     ('Pop'),
        ('Rock'),
        ('Hip-hop');

INSERT INTO song_genre (song_id, genre_id) 
VALUES     (1, 1),
        (2, 2),
        (3, 3);