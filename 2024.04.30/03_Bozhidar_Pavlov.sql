drop database if exists `спотифай`;
create database `спотифай`;
use `спотифай`;

create table labels (
	id serial primary key,
    uuid binary(16) unique not null default (uuid_to_bin(uuid())),
    name varchar(255) not null,
    address text not null,
    created_at datetime not null default (now())
);

create table artists (
	id serial primary key,
    uuid binary(16) unique not null default (uuid_to_bin(uuid())),
    name varchar(255) not null,
    email varchar(255) not null,
    label_id bigint unsigned not null,
    created_at datetime not null default(now()),
    foreign key (label_id) references labels (id)
);

create table songs (
	id serial primary key,
    uuid binary(16) unique not null default (uuid_to_bin(uuid())),
    name varchar(255) not null,
    metadata json,
    created_at datetime not null default (now())
);

create table genres (
	id serial primary key,
    uuid binary(16) unique not null default (uuid_to_bin(uuid())),
    name varchar(255) not null
);

create table songs_genres (
    id serial primary key,
    song_id bigint unsigned not null,
    genre_id bigint unsigned not null,
    foreign key (song_id) references songs(id),
    foreign key (genre_id) references genres(id),
    unique (song_id, genre_id)
);

create table artists_songs (
    id serial primary key,
    artist_id bigint unsigned not null,
    song_id bigint unsigned not null,
    foreign key (artist_id) references artists(id),
    foreign key (song_id) references songs(id),
    unique (artist_id, song_id)
);

insert into labels (name, address) values ('Apple Records', '123 Apple St, London');
insert into artists (name, email, label_id) values ('John Lennon', 'john@example.com', (select id from labels where name = 'Apple Records'));
insert into songs (name, metadata)
values ('Imagine', 
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
}');

insert into labels (name, address) values ('EMI Records', '456 EMI St, London');

insert into artists (name, email, label_id) values ('Paul McCartney', 'paul@example.com', (select id from labels where name = 'EMI Records'));
insert into artists (name, email, label_id) values ('George Harrison', 'george@example.com', (select id from labels where name = 'EMI Records'));
insert into artists (name, email, label_id) values ('Ringo Starr', 'ringo@example.com', (select id from labels where name = 'EMI Records'));

insert into songs (name, metadata)
values ('Yesterday', 
'{
  "title": "Yesterday",
  "duration": "2:05",
  "release_date": "1965-09-13",
  "genres": [
    "Rock",
    "Pop"
  ],
  "album": {
    "title": "Help!",
    "release_year": 1965,
    "label": "EMI Records",
    "formats": [
      "LP",
      "CD"
    ]
  }
}');

insert into songs (name, metadata)
values ('Let It Be', 
'{
  "title": "Let It Be",
  "duration": "3:50",
  "release_date": "1970-03-06",
  "genres": [
    "Rock",
    "Gospel"
  ],
  "album": {
    "title": "Let It Be",
    "release_year": 1970,
    "label": "EMI Records",
    "formats": [
      "LP",
      "CD",
      "Digital"
    ]
  }
}');

insert into genres (name) values ('Rock');
insert into genres (name) values ('Gospel');

insert into songs_genres (song_id, genre_id) values (2, 1);
insert into songs_genres (song_id, genre_id) values (3, 1);
insert into songs_genres (song_id, genre_id) values (3, 2);

-- Insert additional records into artists_songs
insert into artists_songs (artist_id, song_id) values (2, 2);
insert into artists_songs (artist_id, song_id) values (3, 3);
insert into artists_songs (artist_id, song_id) values (4, 3);

-- 1) Query-та от 26/04/2024
-- 1.1) Return the songs which have metadata.album
select * from songs where json_extract(metadata, '$.album') is not null;

-- 1.2) Return the songs which have metadata albums formats and one of the formats is "LP"
select * from songs where json_extract(metadata, '$.album.formats') like '%LP%';

-- 2) Query-та от 30/04/2024
-- 2.1) Кой е label-ът с най-стари песни?

select l.* from labels l
left join artists a on a.label_id = l.id
left join artists_songs asng on asng.artist_id = a.id
left join songs s on s.id = asng.song_id
where s.id is not null
group by l.id
order by min(s.created_at)
limit 1;

-- 2.2) За всеки label: [Име, Бр. Песни]
select l.name, count(asng.id) from labels l
left join artists a on a.label_id = l.id
left join artists_songs asng on asng.artist_id = a.id
group by l.id;

-- 2.3) Изпълнител с най-много различни жанрове
select a.* from artists a
left join artists_songs asng on asng.artist_id = a.id
left join songs_genres sg on sg.song_id = asng.song_id
group by a.id
order by count(sg.id) desc
limit 1;