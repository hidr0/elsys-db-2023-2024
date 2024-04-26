DROP DATABASE IF EXISTS Music;
CREATE DATABASE Music;
USE Music;

CREATE TABLE Label(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) not null,
    address varchar(255)
);
INSERT INTO Label(name,address) VALUES ("Krisko Beats", "Sofia");
INSERT INTO Label(name) VALUES ("Univesal music");
CREATE TABLE Artist(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) not null,
    email_address varchar(255) check(email_address LIKE "%@%"),
    label_id int,
    FOREIGN KEY(label_id) REFERENCES Label(id)
);
INSERT INTO Artist(name) VALUES("Queen");
INSERT INTO Artist(name,email_address,label_id) VALUES("Eminem", "slimshady@gmail.com",2);
INSERT INTO Artist(name,email_address,label_id) VALUES("Shakira", "zaminamina@waka.com",1);
SELECT * FROM Artist;
CREATE TABLE Song(
	id int PRIMARY KEY AUTO_INCREMENT,
    uuid varchar(255) not null,
    name varchar(255) not null,
    metadata json,
    created_at datetime not null DEFAULT now()
);
INSERT INTO Song(name,metadata,uuid) VALUES("Slim Shady", '{"album":"The real slim shady"}',uuid());
INSERT INTO Song(name,uuid) VALUES("Hips don't lie",uuid());
INSERT INTO Song(name,uuid) VALUES("Bohemian rhapsody",uuid());
INSERT INTO Song(name,metadata,uuid) VALUES("Imagine", '
{
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
}',uuid());
SELECT * FROM Song;

CREATE TABLE ArtistSong(
	id int PRIMARY KEY AUTO_INCREMENT,
    artist_id int not null,
    song_id int not null,
    FOREIGN KEY(artist_id) REFERENCES Artist(id),
    FOREIGN KEY(song_id) REFERENCES Song(id),
    UNIQUE(artist_id,song_id)
);
INSERT INTO ArtistSong(artist_id,song_id) VALUES(1,3);
INSERT INTO ArtistSong(artist_id,song_id) VALUES(2,1);
INSERT INTO ArtistSong(artist_id,song_id) VALUES(3,2);
-- INSERT INTO ArtistSong(artist_id,song_id) VALUES(1,2);

CREATE TABLE Genre(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255)
);
INSERT INTO Genre(name) VALUES("Pop");
INSERT INTO Genre(name) VALUES("Rock");
INSERT INTO Genre(name) VALUES("Jazz");
INSERT INTO Genre(name) VALUES("R&B");
SELECT * FROM Genre;
CREATE TABLE SongGenre(
	id int PRIMARY KEY AUTO_INCREMENT,
    genre_id int not null,
    song_id int not null,
    FOREIGN KEY(genre_id) REFERENCES Genre(id),
    FOREIGN KEY(song_id) REFERENCES Song(id),
    UNIQUE(genre_id,song_id)
);
INSERT INTO SongGenre(genre_id,song_id) VALUES(1,1);
INSERT INTO SongGenre(genre_id,song_id) VALUES(2,1);
INSERT INTO SongGenre(genre_id,song_id) VALUES(1,2);
INSERT INTO SongGenre(genre_id,song_id) VALUES(1,3);
INSERT INTO SongGenre(genre_id,song_id) VALUES(2,2);
-- INSERT INTO SongGenre(genre_id,song_id) VALUES(1,1);

-- Return the songs which have metadata
SELECT * FROM Song where metadata is not null;

-- Return the songs which have metadata albums formats and one of the formats is "LP"
SELECT * FROM Song 
where JSON_EXTRACT(metadata,'$.album.formats') LIKE "%LP%"; 