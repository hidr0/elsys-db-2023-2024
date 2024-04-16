SET SQL_SAFE_UPDATES=0;

DROP DATABASE IF EXISTS name;
CREATE DATABASE name;
USE name;

CREATE TABLE Teams(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    founded_year INT NOT NULL CHECK(founded_year > 1900),
    home_city VARCHAR(100) NOT NULL
);

CREATE TABLE TrainingSessions(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);

CREATE TABLE Coach(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    years INT NOT NULL,
    team_id INT NOT NULL UNIQUE,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);

CREATE TABLE Players(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position ENUM("Forward","Goalkeeper","Defence"),
    team_id INT NOT NULL,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);

CREATE TABLE Therapist(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Massage(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    player_id INT NOT NULL,
    FOREIGN KEY(player_id) REFERENCES Players(id),
    therapist_id INT NOT NULL,
    FOREIGN KEY(therapist_id) REFERENCES Therapist(id)
);

-- 1 all sessions for all teams
SELECT location, date, Teams.name, Coach.name FROM Teams
LEFT JOIN Coach ON Coach.team_id = Teams.id
LEFT JOIN TrainingSessions ON TrainingSessions.team_id = Teams.id;

-- 2 all teams with 0 sessions
SELECT Teams.name FROM Teams
LEFT JOIN TrainingSessions ON TrainingSessions.team_id = Teams.id
WHERE TrainingSessions.id IS NULL;

-- 3 all therapy for specific player(s)
SELECT Players.name, Massage.date, Therapist.name FROM Players
LEFT JOIN Massage ON player_id = Players.id
LEFT JOIN Therapist ON therapist_id = Therapist.id
WHERE Players.name = 'Pele'; -- remove line to list all players

-- 4 all therapists for team "Warriors"
SELECT Therapist.name FROM Teams
LEFT JOIN Players ON Players.team_id = Teams.id
LEFT JOIN Massage ON Massage.player_id = Players.id
LEFT JOIN Therapist ON Massage.therapist_id = Therapist.id
WHERE Teams.name LIKE "Warriors";

-- 5 number of sessions per team during Feb 2022
SELECT Teams.name, COUNT(TrainingSessions.id) FROM Teams
LEFT JOIN TrainingSessions ON team_id = Teams.id
WHERE MONTH(date) = 02 AND YEAR(date) = 2022
GROUP BY Teams.name;

-- 6 name of the oldest team
SELECT Teams.name FROM Teams
ORDER BY founded_year ASC
LIMIT 1;

-- 7 avg team age of all teams
SELECT AVG(Players.age) FROM Teams
LEFT JOIN Players on Players.team_id = Teams.id;

-- 8 team name and avg team age per player
SELECT Teams.name, AVG(Players.age) FROM Teams
LEFT JOIN Players on Players.team_id = Teams.id
GROUP BY Teams.name;

