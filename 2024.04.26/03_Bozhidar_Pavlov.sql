drop database if exists `спотифай`;
create database `спотифай`;
use `спотифай`;

create table labels (
    id binary(16) unique not null default (uuid_to_bin(uuid())),
    name varchar(255) not null,
    address text not null
);

create table artists (
    id binary(16) primary key not null default (uuid_to_bin(uuid())),
    name varchar(255) not null,
    email varchar(255) not null,
    label_id binary(16) not null,
    foreign key (label_id) references labels (id)
);

create table songs (
    id binary(16) primary key not null default (uuid_to_bin(uuid())),
    name varchar(255) not null,
    metadata json,
    created_at datetime not null default (now())
);

create table genres (
    id binary(16) primary key not null default (uuid_to_bin(uuid())),
    name varchar(255) not null
);

create table songs_genres (
    id serial primary key,
    song_id binary(16) not null,
    genre_id binary(16) not null,
    foreign key (song_id) references songs(id),
    foreign key (genre_id) references genres(id),
    unique (song_id, genre_id)
);

create table artists_labels (
    id serial primary key,
    artist_id binary(16) not null,
    label_id binary(16) not null,
    foreign key (artist_id) references artists(id),
    foreign key (label_id) references labels(id),
    unique (artist_id, label_id)
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

-- Return the songs which have metadata
select * from songs where metadata is not null;

-- Return the songs which have metadata albums formats and one of the formats is "LP"
select * from songs where json_extract(metadata, '$.album.formats') like '%LP%';
