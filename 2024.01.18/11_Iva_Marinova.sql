DROP DATABASE IF EXISTS Sport;
CREATE DATABASE Sport;
USE Sport;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Coach
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    years INT NOT NULL CHECK(years >= 0)
);

INSERT INTO Coach (name, years) VALUES ('Sarah Connor', 15);
INSERT INTO Coach (name, years) VALUES ('John Smith', 1);
INSERT INTO Coach (name, years) VALUES ('Petko', 7);

CREATE TABLE Teams
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    founded_year INT NOT NULL CHECK(founded_year > 1900), 
    home_city VARCHAR(100) NOT NULL,
    coach_id INT NOT NULL,
    FOREIGN KEY (coach_id) REFERENCES Coach(id),
    UNIQUE(coach_id)
);

INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES ('Dragons', 1998, 'Metropolis', 1);
INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES ('Warriors', 2003, 'Gotham', 2);
INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES ('TEAM', 2006, 'Sofia', 3);

CREATE TABLE TrainingSessions
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	date_time DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions (date_time, location, team_id) VALUES ('2024-05-15 10:00', 'Metropolis Training Ground', 1);
INSERT INTO TrainingSessions (date_time, location, team_id) VALUES ('2024-05-16 09:00', 'Gotham City Field', 2);
INSERT INTO TrainingSessions (date_time, location, team_id) VALUES ('2022-02-10 10:00', 'Metropolis Training Ground', 1);
INSERT INTO TrainingSessions (date_time, location, team_id) VALUES ('2022-02-12 09:00', 'Gotham City Field', 2);
INSERT INTO TrainingSessions (date_time, location, team_id) VALUES ('2022-02-13 10:00', 'Metropolis Training Ground', 2);

CREATE TABLE Players
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK(age >= 0),
    position ENUM('Forward', 'Goalkeeper', 'Defence') NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO Players (name, age, position, team_id) VALUES ('Mike Johnson', 25, 'Forward', 1);
INSERT INTO Players (name, age, position, team_id) VALUES ('Alex Green', 22, 'Goalkeeper', 2);

CREATE TABLE Therapist
(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Therapist (name) VALUES ('Emily White');
INSERT INTO Therapist (name) VALUES ('John Davis');
INSERT INTO Therapist (name) VALUES ('Ivancho Ivanov');

CREATE TABLE Massage
(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    players_id INT NOT NULL,
    therapist_id INT NOT NULL,
    date_time DATETIME NOT NULL,
    FOREIGN KEY (players_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(id)
);

INSERT INTO Massage (players_id, therapist_id, date_time) VALUES (1, 1, '2024-05-15 14:00');
INSERT INTO Massage (players_id, therapist_id, date_time) VALUES (2, 2, '2024-05-16 15:00');
INSERT INTO Massage (players_id, therapist_id, date_time) VALUES (2, 3, '2024-05-16 15:00');

-- 1. List all Training sessions for all teams [Location, when, team.name, coach.name]
SELECT TrainingSessions.location, TrainingSessions.date_time, Teams.name, Coach.name FROM TrainingSessions
LEFT JOIN Teams ON TrainingSessions.team_id = Teams.id
LEFT JOIN Coach ON Teams.coach_id = Coach.id;

-- 2. List all Team that do not have any training sessions. [team.name]
SELECT Teams.name FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.id IS NULL;

-- 3. List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT Players.name, Massage.date_time, Therapist.name FROM Massage
LEFT JOIN Players ON Massage.players_id = Players.id
LEFT JOIN Therapist ON Massage.therapist_id = Therapist.id;

-- 4. List all the Therapists for the "Warriors"
SELECT Therapist.name FROM Therapist
LEFT JOIN Massage ON Therapist.id = Massage.therapist_id
LEFT JOIN Players ON Massage.players_id = Players.id
LEFT JOIN Teams ON Players.team_id = Teams.id
WHERE Teams.name = 'Warriors';

-- 5. Count the number of training sessions each team has in Feb 2022.
SELECT Teams.name, COUNT(TrainingSessions.id) FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE MONTH(TrainingSessions.date_time) = 2 AND YEAR(TrainingSessions.date_time) = 2022
GROUP BY Teams.name;

-- 6. Get the name of the oldest team.
SELECT name FROM Teams 
ORDER BY founded_year 
LIMIT 1;

-- 7. Get the average team age of all teams.
SELECT AVG(YEAR(CURDATE()) - founded_year) FROM Teams;

-- 8. List the team name and average team age of all players.[Name, average age]
SELECT Teams.name, AVG(Players.age) FROM Teams
LEFT JOIN Players ON Teams.id = Players.team_id
GROUP BY Teams.name;