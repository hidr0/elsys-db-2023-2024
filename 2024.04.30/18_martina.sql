drop database if exists Music;
create database Music;
use Music;

create table Artist(
	id int not null auto_increment primary key,
    name varchar(100) not null,
    email varchar(100) not null
);

insert into Artist(name, email) values("Jorge Rivera-Herrans", "jorge@yahoo.com");
insert into Artist(name, email) values("Talya Sindel", "talyas@gmail.com");

create table Label(
	id int not null primary key auto_increment,
    artist_id int unique not null,
    name varchar(100) not null,
    adress varchar(100) not null,
    foreign key (artist_id) references Artist(id)
);

insert into Label(name, adress, artist_id) values("Good Music Ent.", "New York", 1);
insert into Label(name, adress, artist_id) values("Happy Face", "New York", 2);

create table Song(
	id int not null primary key auto_increment,
    uid varchar(128) not null,
    name varchar(100) not null,
    metadata json not null,
    created_at timestamp default current_timestamp
);

insert into Song(uid, name, metadata) values(uuid(), "Done For", 
'{
	"title": "Done For",
    "duration": "2:27",
    "release_date": "2024-2-14",
    "genres": ["pop", "edm"],
    "album": {
		"title": "EPIC: The Circe Saga",
        "release_year": "2024",
        "label": "Good Music Ent.",
        "formats": ["ep", "digital"]
	}
}'
);

insert into Song(uid, name, metadata) values(uuid(), "There Are Other Ways", 
'{
	"title": "There Are Other Ways",
    "duration": "3:27",
    "release_date": "2024-2-14",
    "genres": ["pop", "edm", "ambient"],
    "album": {
		"title": "EPIC: The Circe Saga",
        "release_year": "2024",
        "label": "Good Music Ent.",
        "formats": ["ep", "digital"]
	}
}'
);

insert into Song(uid, name, metadata) values(uuid(), "Just A Man", 
'{
	"title": "Just A Man",
    "duration": "2:30",
    "release_date": "2022-12-25",
    "genres": ["pop", "alternative rock"],
    "album": {
		"title": "EPIC: The Troy Saga",
        "release_year": "2022",
        "label": "Good Music Ent.",
        "formats": ["ep", "digital"]
	}
}'
);

create table ArtistSongs(
	id int not null primary key auto_increment,
    artist_id int unique not null,
    song_id int unique not null,
    foreign key (artist_id) references Artist(id),
    foreign key (song_id) references Song(id)
);

insert into ArtistSongs(artist_id, song_id) values(1, 1);
insert into ArtistSongs(artist_id, song_id) values(1, 2);
insert into ArtistSongs(artist_id, song_id) values(2, 1);
insert into ArtistSongs(artist_id, song_id) values(2, 2);
insert into ArtistSongs(artist_id, song_id) values(3, 1);

create table Genre(
	id int not null primary key auto_increment,
    name varchar(50)
);

insert into Genre(name) values("pop");
insert into Genre(name) values("edm");
insert into Genre(name) values("ambient");
insert into Genre(name) values("alternative rock");

create table SongGenre(
	id int not null primary key auto_increment,
    song_id int unique not null,
    genre_id int unique not null,
    foreign key (song_id) references Song(id),
    foreign key (genre_id) references Genre(id)
);

insert into SongGenre(song_id, genre_id) values(1, 1);
insert into SongGenre(song_id, genre_id) values(1, 2);
insert into SongGenre(song_id, genre_id) values(2, 1);
insert into SongGenre(song_id, genre_id) values(2, 2);
insert into SongGenre(song_id, genre_id) values(2, 3);
insert into SongGenre(song_id, genre_id) values(3, 1);
insert into SongGenre(song_id, genre_id) values(3, 4);

-- nqmashe vreme za querytata