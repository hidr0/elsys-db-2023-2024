SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS Training;
CREATE DATABASE Training;
USE Training;

CREATE TABLE Coaches(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    years int NOT NULL
);

INSERT INTO Coaches(name, years) VALUES("Sarah Connor", 4);
INSERT INTO Coaches(name, years) VALUES("Jhon Smith", 14);

CREATE TABLE Teams(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    founded_year int NOT NULL CHECK (founded_year > 1900),
    home_city varchar(100) NOT NULL,
    coach_id int NOT NULL UNIQUE,
    FOREIGN KEY (coach_id) REFERENCES Coaches(id)
);

INSERT INTO Teams(name, founded_year, home_city, coach_id) VALUES("Dragons", 1998, "Metropolis", 1);
INSERT INTO Teams(name, founded_year, home_city, coach_id) VALUES("Warriors", 2003, "Gotham", 2);

CREATE TABLE TrainingSessions(
	id int PRIMARY KEY AUTO_INCREMENT,
    location varchar(100) NOT NULL UNIQUE,
    datetime DATETIME NOT NULL,
    team_id int NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions(location, datetime, team_id) VALUES("Metropolis training ground", ' 2024-05-15 10:00', 1);
INSERT INTO TrainingSessions(location, datetime, team_id) VALUES("Gotham City Field", ' 2024-05-16 09:00', 2);

CREATE TABLE Players(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int NOT NULL CHECK (age > 0),
    position varchar(20) NOT NULL CHECK (position = "Forward" OR position = "Goalkeeper" OR position = "Defence"),	
    team_id int NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO Players(name, age, position, team_id) VALUES("Mike Johnson", 25, "Forward", 1);
INSERT INTO Players(name, age, position, team_id) VALUES("Alex Green", 22, "Goalkeeper", 2);

CREATE TABLE Therapists(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL
);

INSERT INTO Therapists(name) VALUES("Emily White");
INSERT INTO Therapists(name) VALUES("Jhon Davis");

CREATE TABLE Massages(
	id int PRIMARY KEY AUTO_INCREMENT,
    datetime DATETIME NOT NULL,
    player_id int NOT NULL,
    therapist_id int NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists(id)
);

INSERT INTO Massages(datetime, player_id, therapist_id) VALUES("2024-05-15 14:00", 1, 1);
INSERT INTO Massages(datetime, player_id, therapist_id) VALUES("2024-05-15 14:00", 2, 2);

-- List all Training sessions for all teams [Location, when, team.name, coach.name]
SELECT TrainingSessions.location, TrainingSessions.datetime AS date_time, Teams.name AS team_name, Coaches.name AS coach_name
FROM TrainingSessions
JOIN Teams ON TrainingSessions.id = Teams.id
JOIN Coaches ON Teams.coach_id = Coaches.id;

-- List all Team that do not have any training sessions. [team.name]
SELECT Teams.name
FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.id IS NULL;

-- List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT Players.name AS player_name, Massages.datetime AS massage_date, Therapists.name AS therapist_name
FROM Massages
JOIN Players ON Massages.player_id = Players.id
JOIN Therapists ON Massages.therapist_id = Therapists.id;

-- List all the Therapists for the "Warriors"
SELECT Therapists.name
FROM Therapists
JOIN Massages ON Therapists.id = Massages.therapist_id
JOIN Players ON Massages.player_id = Players.id
JOIN Teams ON Players.team_id = Teams.id
WHERE Teams.name = "Warriors";

-- Count the number of training sessions each team has in Feb 2022.
SELECT Teams.name AS team_name, COUNT(TrainingSessions.id) AS sessions
FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.datetime >= '2022-02-01' AND TrainingSessions.datetime < '2022-03-01'
GROUP BY Teams.name;

-- Get the name of the oldest team.
SELECT name
FROM Teams
ORDER BY founded_year ASC
LIMIT 1;

-- List the team name and average team age of all players.[Name, average age]
SELECT Teams.name AS team_name, AVG(Players.age) AS average_team_age
FROM Teams
JOIN Players ON Teams.id = Players.team_id
GROUP BY Teams.name;