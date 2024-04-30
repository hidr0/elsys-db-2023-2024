DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
USE music;

CREATE TABLE labels
(
    id      BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    name    VARCHAR(255)           NOT NULL,
    address TEXT                   NOT NULL
);

CREATE TABLE artists
(
    id       BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    name     VARCHAR(255)           NOT NULL,
    email    VARCHAR(255)           NOT NULL,
    label_id BINARY(16)             NOT NULL,
    FOREIGN KEY (label_id) REFERENCES labels (id)
);

CREATE TABLE songs
(
    id         BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    name       VARCHAR(255)           NOT NULL,
    metadata   JSON,
    created_at DATETIME               NOT NULL DEFAULT (NOW())
);

CREATE TABLE artistssongs
(
    id        BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    artist_id BINARY(16)             NOT NULL,
    song_id   BINARY(16)             NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (id),
    FOREIGN KEY (song_id) REFERENCES songs (id),
    UNIQUE (artist_id, song_id)
);

CREATE TABLE genres
(
    id   BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    name VARCHAR(255)           NOT NULL
);

CREATE TABLE songgenres
(
    id       BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    song_id  BINARY(16)             NOT NULL,
    genre_id BINARY(16)             NOT NULL,
    FOREIGN KEY (song_id) REFERENCES songs (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    UNIQUE (song_id, genre_id)
);

CREATE TABLE artistlabels
(
    id        BINARY(16) PRIMARY KEY NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    artist_id BINARY(16)             NOT NULL,
    label_id  BINARY(16)             NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (id),
    FOREIGN KEY (label_id) REFERENCES labels (id),
    UNIQUE (artist_id, label_id)
);

INSERT INTO labels (name, address)
VALUES ('Apple Records', '123 Apple St, London'),
       ('Capitol Records', '123 Capitol St, Los Angeles');

INSERT INTO artists (name, email, label_id)
VALUES ('John Lennon', 'john@example.com', (SELECT id FROM labels WHERE name = 'Apple Records')),
       ('Freddie Mercury', 'freddie@example.com', (SELECT id FROM labels WHERE name = 'Capitol Records'));

INSERT INTO genres (name)
VALUES ('Soft rock'),
       ('Pop'),
       ('Rock'),
       ('Progressive rock');

INSERT INTO songs (name, metadata)
VALUES ('Imagine',
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
        }'),
       ('Hey Jude',
        '{
          "title": "Hey Jude",
          "duration": "7:11",
          "release_date": "1968-08-26",
          "genres": [
            "Rock",
            "Pop"
          ],
          "album": {
            "title": "The Beatles",
            "release_year": 1968,
            "label": "Apple Records",
            "formats": [
              "LP",
              "CD",
              "Digital"
            ]
          }
        }');

INSERT INTO artistssongs (artist_id, song_id)
VALUES ((SELECT id FROM artists WHERE name = 'John Lennon'), (SELECT id FROM songs WHERE name = 'Imagine')),
       ((SELECT id FROM artists WHERE name = 'John Lennon'), (SELECT id FROM songs WHERE name = 'Hey Jude'));


INSERT INTO songgenres (song_id, genre_id)
VALUES ((SELECT id FROM songs WHERE name = 'Imagine'), (SELECT id FROM genres WHERE name = 'Soft rock')),
       ((SELECT id FROM songs WHERE name = 'Imagine'), (SELECT id FROM genres WHERE name = 'Pop')),
       ((SELECT id FROM songs WHERE name = 'Hey Jude'), (SELECT id FROM genres WHERE name = 'Rock')),
       ((SELECT id FROM songs WHERE name = 'Hey Jude'), (SELECT id FROM genres WHERE name = 'Pop'));

INSERT INTO songs (name, metadata)
VALUES ('Bohemian Rhapsody',
        '{
          "title": "Bohemian Rhapsody",
          "duration": "5:55",
          "release_date": "1975-10-31",
          "genres": [
            "Rock",
            "Progressive rock"
          ],
          "album": {
            "title": "A Night at the Opera",
            "release_year": 1975,
            "label": "Apple Records",
            "formats": [
              "CD",
              "Digital"
            ]
          }
        }');

INSERT INTO artistssongs (artist_id, song_id)
VALUES ((SELECT id FROM artists WHERE name = 'Freddie Mercury'),
        (SELECT id FROM songs WHERE name = 'Bohemian Rhapsody'));

INSERT INTO songgenres (song_id, genre_id)
VALUES ((SELECT id FROM songs WHERE name = 'Bohemian Rhapsody'),
        (SELECT id FROM genres WHERE name = 'Rock')),
       ((SELECT id FROM songs WHERE name = 'Bohemian Rhapsody'),
        (SELECT id FROM genres WHERE name = 'Progressive rock'));


-- Query 5, всички песни с метаданни
SELECT *
FROM songs
WHERE metadata IS NOT NULL;

-- Query 6, всички песни със формат LP
SELECT *
FROM songs
WHERE JSON_EXTRACT(metadata, '$.album.formats') LIKE '%LP%';

-- 1 ва задача, лейбълът с най-стара песен
SELECT labels.name
FROM songs
         JOIN labels ON labels.name = JSON_UNQUOTE(JSON_EXTRACT(songs.metadata, '$.album.label'))
ORDER BY JSON_EXTRACT(songs.metadata, '$.release_date') ASC
LIMIT 1;

-- 2 ра задача, всички лейбъли с брой песни
SELECT labels.name, COUNT(songs.id) AS song_count
FROM songs
         RIGHT JOIN labels ON labels.name = JSON_UNQUOTE(JSON_EXTRACT(songs.metadata, '$.album.label'))
GROUP BY labels.name;

-- 3 та задача, изпълнителя с най-много различни жанрове
SELECT artists.name AS genre_count
FROM artists
         JOIN artistssongs ON artistssongs.artist_id = artists.id
         JOIN songs ON songs.id = artistssongs.song_id
         JOIN songgenres ON songgenres.song_id = songs.id
         JOIN genres ON genres.id = songgenres.genre_id
GROUP BY artists.name
ORDER BY COUNT(DISTINCT genres.name) DESC
LIMIT 1;
