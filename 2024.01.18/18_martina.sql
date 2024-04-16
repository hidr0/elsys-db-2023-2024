drop database if exists Trainings;
create database Trainings;
use Trainings;

create table Teams(
	id int primary key auto_increment,
    name varchar(100) not null,
    founded_year int not null check(founded_year > 1900),
    home_city varchar(50) not null
);

insert into Teams(name, founded_year, home_city) values ("Dragons", 1998, "Metropolis");
insert into Teams(name, founded_year, home_city) values ("Warriors", 2003, "Gotham");

create table Coach(
	id int primary key auto_increment,
    name varchar(100) not null,
    years int not null,
    team_id int not null unique,
    foreign key (team_id) references Teams(id)
);

insert into Coach(name, years, team_id) values("Sarah Connor", 47, 1);
insert into Coach(name, years, team_id) values("John Smith", 53, 2);

create table TrainingSessions(
	id int primary key auto_increment,
    time datetime unique,
    location varchar(100) not null,
    team_id int not null,
    foreign key (team_id) references Teams(id)
);

insert into TrainingSessions(time, location, team_id) values("2024-05-15 10:00", "Metropolis Training Ground", 1);
insert into TrainingSessions(time, location, team_id) values("2024-05-16 09:00", "Gotham City Field", 2);

create table Players(
	id int primary key auto_increment,
    name varchar(50) not null,
    age int not null check(age > 0),
    position enum("Forward", "Goalkeeper", "Defence"),
    team_id int not null,
    foreign key (team_id) references Teams(id)
);

insert into Players(name, age, position, team_id) values("Mike Johnson", 25, "Forward", 1);
insert into Players(name, age, position, team_id) values("John Smith", 23, "Goalkeeper", 1);
insert into Players(name, age, position, team_id) values("Will Jackson", 24, "Defence", 2);
insert into Players(name, age, position, team_id) values("Alex Green", 22, "Goalkeeper", 2);

create table Therapist(
	id int primary key auto_increment,
    name varchar(50) not null
);

insert into Therapist(name) values("Emily White");
insert into Therapist(name) values("John Davis");

create table Massages(
	id int primary key auto_increment,
    time datetime,
    player_id int not null,
    therapist_id int not null,
    foreign key (player_id) references Players(id),
    foreign key (therapist_id) references Therapist(id)
);

insert into Massages(time, player_id, therapist_id) values("2024-05-15 14:00", 1, 1);
insert into Massages(time, player_id, therapist_id) values("2024-05-16 15:00", 2, 2);

-- query 1 - List all Training sessions for all teams [Location, when, team.name, coach.name]
select TS.location, TS.time, T.name, C.name from TrainingSessions as TS
left join Teams as T on TS.team_id = T.id 
left join Coach as C on C.team_id = T.id;

-- query 2 - List all Team that do not have any training sessions. [team.name]


-- query 3 - List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
select P.name, M.time, T.name from Massages as M
left join Players as P on M.player_id = P.id
left join Therapist as T on M.therapist_id = T.id;

-- query 4 - List all the Therapists for the "Warriors"
select T.name from Therapist as T 
left join Massages as M on M.therapist_id = T.id
left join Players as P on M.player_id = P.id where P.team_id = 2;

-- query 5 - Count the number of training sessions each team has in Feb 2022.


-- query 6 - Get the name of the oldest team.
select * from Teams order by founded_year asc limit 1;

-- query 7 - Get the average team age of all teams.
select avg(2024 - T.founded_year) from Teams as T;

-- query 8 - List the team name and average team age of all players.[Name, average age]
select T.name, avg(P.age) from Teams as T
left join Players as P on P.team_id = T.id;
