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
insert into Labels(name, address) VALUE ('Atlantic Records', '	1633 Broadway Fl 10, New York, New York 10019, US');

insert into Genres (name) VALUES
('Soft Rock'),
('Pop'),
('Hard Rock'),
('Rock and Roll'),
('Blues Rock');


insert into Artists(label_id, name, email) VALUE (1, "John Lennon", "john.lennon@gmail.com");
insert into Artists(label_id, name, email) VALUE (2, "AC/DC", "ac_dc@gmail.com");

insert into Songs(name, uuid, metadata) VALUE ("Imagine", UUID(),
'{
  "title": "Imagine",
  "duration": "3:03",
  "release_date": "1971-10-11",
  "genres": [
    "Soft Rock",
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

insert into Songs(name, uuid, metadata) value ("Highway to Hell", UUID(),
'{
	"title": "Highway to Hell",
    "duration": "3:27",
    "release_date": "1979-7-27",
	"genres": [
	  "Hard Rock",
	  "Rock and Roll",
      "Blues Rock"
	],
	"album": {
	  "title": "Highway to Hell",
	  "release_year": 1979,
	  "label": "Atlantic Records",
	    "formats": [
		  "LP",
		  "CD"
		]
	}
}');

insert into Songs(name, uuid, metadata) value ("Thunderstruck", UUID(),
'{
	"title": "Thunderstruck",
    "duration": "4:52",
    "release_date": "1990-9-10",
	"genres": [
	  "Hard Rock",
	  "Rock and Roll",
      "Blues Rock"
	],
	"album": {
	  "title": "The Razors Edge",
	  "release_year": 1990,
	  "label": "Atlantic Records",
	    "formats": [
		  "CD",
          "Digital"
		]
	}
}');

insert into ArtistSongs (artist_id, song_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

insert into SongGenres (song_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 3),
(4, 4),
(4, 5);


-- Songs with album metadata:
select * from Songs where
metadata is not null and
JSON_EXTRACT(metadata, "$.album") is not null;

-- Songs with LP as an album format:
select * from Songs where
metadata is not null and
JSON_EXTRACT(metadata, "$.album.formats") like '%\"LP\"%';

-- Label with oldest song
select L.name from Labels as L
left join Artists as A on L.id = A.label_id
left join ArtistSongs as AS_ on A.id = AS_.artist_id
left join Songs as S on S.id = AS_.song_id
where S.metadata -> "$.release_date" is not null
order by date(S.metadata -> "$.release_date") asc
limit 1;

-- Number of songs for every label
select L.name, COUNT(S.id) from Labels as L
left join Artists as A on L.id = A.label_id
left join ArtistSongs as AS_ on A.id = AS_.artist_id
left join Songs as S on S.id = AS_.song_id
group by L.name;


-- Artists with the highest amount of unique genres
select A.name from Artists as A
left join ArtistSongs as AS_ on A.id = AS_.artist_id
left join Songs as S on S.id = AS_.song_id
left join SongGenres as SG on SG.song_id = S.id
left join Genres as G on G.id = SG.genre_id
group by A.name
order by COUNT(distinct G.name) desc
limit 1;