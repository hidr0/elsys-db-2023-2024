drop database if exists db;
create database db;
use db;


create table Labels (
	id int auto_increment primary key,
    name varchar(64) not null,
    address varchar(128) not null
);

create table Artists (
	id int auto_increment primary key,
    label_id int,
    foreign key(label_id) references Labels(id),
    name varchar(64) not null,
    email varchar(128) not null check(email like '%@%')
);

create table Songs (
	id int auto_increment primary key,
    name varchar(64) not null,
    uuid varchar(36) not null,	
    metadata json default null,
    created_at datetime not null default now()
);

create table Genres (
	id int auto_increment primary key,
    name varchar(64) not null
);

create table ArtistSongs (
	id int auto_increment primary key,
	artist_id int,
    song_id int,
    foreign key(artist_id) references Artists(id),
    foreign key(song_id) references Songs(id),
    unique(artist_id, song_id)
);

create table SongGenres (
	id int auto_increment primary key,
    song_id int,
    genre_id int,
    foreign key(song_id) references Songs(id),
    foreign key(genre_id) references Genres(id),
    unique(song_id, genre_id)
);


insert into Labels(name, address) VALUE ('Apple Records', '3 Savile Row');

insert into Genres (name) VALUES
('Soft Rock'),
('Pop');

insert into Artists(label_id, name, email) VALUE (1, "John Lennon", "john.lennon@gmail.com");

insert into Songs(name, uuid, metadata) VALUE ("Imagine", UUID(),
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
}'
);

insert into Songs(name, uuid) VALUE ("Whatever Gets You Through the Night", UUID());	

insert into ArtistSongs (artist_id, song_id) VALUES
(1, 1),
(1, 2);

insert into SongGenres (song_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

-- Songs with metadata:
select * from Songs where metadata is not null;


-- Songs with LP as an album format:
select * from Songs where
metadata is not null and
JSON_SEARCH(metadata, 'one', 'LP') is not null;
 