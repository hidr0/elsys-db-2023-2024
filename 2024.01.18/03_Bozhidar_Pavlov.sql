set SQL_SAFE_UPDATES=0;
drop database if exists football;
create database football;
use football;

create table coaches (
	id serial primary key,
	name varchar(255) not null,
    years int unsigned not null
);

create table teams (
	id serial primary key,
    name varchar(255) not null,
    founded_year int unsigned not null check (founded_year > 1900),
    home_city varchar(255) not null,
    coach_id bigint unsigned not null unique,
    foreign key (coach_id) references coaches(id)
);

create table therapists (
	id serial primary key,
    name varchar(255) not null
);

create table players (
	id serial primary key,
	name varchar(255) not null,
    age int unsigned not null check (age > 0),
    position enum("Forward", "Goalkeeper", "Defence"), -- FIXME: typo in "Defense" (assignment)
    team_id bigint unsigned not null,
    foreign key (team_id) references teams(id)
);

create table massages (
	id serial primary key,
    player_id bigint unsigned not null,
    therapist_id bigint unsigned not null,
    when_ datetime,
    unique (player_id, therapist_id),
    foreign key (player_id) references players(id),
    foreign key (therapist_id) references therapists(id)
);

create table training_sessions (
	id serial primary key,
    when_ datetime,
    location varchar(255) not null,
    team_id bigint unsigned not null,
    foreign key (team_id) references teams(id)
);

insert into coaches(name, years)
values
	('Sarah Connor', 24),
    ('John Smith', 37),
    ('Bozho', 18),
    ('Ot dneska trenior', 1);

insert into teams(name, coach_id, founded_year, home_city)
values
	('Dragons', 1, 1998, 'Metropolis'),
	('Warriors', 2, 2003, 'Gotham'),
    ('Bozho\'s Team', 3, 2024, 'Sofia'),
    ('Brand new team', 4, 2024, 'Lyulin');

insert into players(name, age, position, team_id)
values
	('Mike Johnson', 25, 'Forward', 1),
	('Alex Green', 22, 'Goalkeeper', 2),
    ('Bozho Pak', 18, 'Goalkeeper', 3);

insert into training_sessions(when_, location, team_id)
values
	('2024-05-15 10:00', 'Metropolis Training Ground', 1),
	('2024-05-16 09:00', 'Gotham City Field', 2),
    ('2024-05-17 09:00', 'Gotham City Field', 2);

insert into therapists(name)
values ('Emily White'), ('John Davis');

insert into massages(when_, player_id, therapist_id)
values
	('2024-05-15 14:00', 1, 1),
	('2024-05-16 15:00', 2, 2);

-- 1) List all Training sessions for all teams [Location, when, team.name, coach.name]
select location, when_, t.name, c.name
from teams as t
left join training_sessions as ts on ts.id = t.id
left join coaches as c on c.id = t.coach_id;

-- 2) List all Team that do not have any training sessions. [team.name]
select t.name
from teams as t
left join training_sessions as ts on t.id = ts.team_id
where ts.id is null;

-- 3) List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
select p.name, m.when_, t.name
from players as p
left join massages as m on m.player_id = p.id
left join therapists as t on m.therapist_id = t.id;

-- 4) List all the Therapists for the "Warriors"
select th.name
from therapists as th
left join massages as m on m.therapist_id = th.id
left join players as p on m.player_id = p.id
left join teams as t on p.team_id = t.id
where t.name = 'Warriors';

-- 5) Count the number of training sessions each team has in Feb 2022.
select t.name, count(ts.id)
from training_sessions as ts 
inner join teams as t on t.id = ts.team_id
where month(ts.when_) = 2 and year(ts.when_) = 2022
group by t.id;

-- 6) Get the name of the oldest team
select name
from teams
order by founded_year asc
limit 1;

-- 7) Get the average age of all teams
select avg(year(now()) - founded_year) from teams;

-- 8) List the team name and average age of all players [Name, average age]
select t.name, avg(p.age)
from teams as t
left join players as p on p.team_id = t.id
group by t.id;