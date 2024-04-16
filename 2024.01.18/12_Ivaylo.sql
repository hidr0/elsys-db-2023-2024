DROP DATABASE IF EXISTS soccer;
CREATE DATABASE soccer;
USE soccer;


CREATE TABLE Coach (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    years INT NOT NULL CHECK (years >= 0)
);

INSERT INTO Coach (name, years) VALUES 
('Sarah Connor', 35),
('John Smith', 40);

CREATE TABLE Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    founded_year INT NOT NULL CHECK (founded_year >= 1900),
    home_city VARCHAR(50) NOT NULL,
    coach_id INT NOT NULL UNIQUE,
    FOREIGN KEY (coach_id) REFERENCES Coach (id)
);

INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES 
('Dragons', 1998, 'Metropolis', 1),
('Warriors', 2003, 'Gotham', 2);

CREATE TABLE TrainingSessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_time DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams (id)
);

INSERT INTO TrainingSessions (date_time, location, team_id) VALUES 
('2024-05-15 10:00:00', 'Metropolis Training Ground', 1),
('2024-05-16 09:00:00', 'Gotham City Field', 2);

CREATE TABLE Players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 0),
    position ENUM('Forward', 'GoalKeeper', 'Defence') NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams (id)
);

INSERT INTO Players (name, age, position, team_id) VALUES 
('Mike Johnson', 25, 'Forward', 1),
('Alex Green', 22, 'Goalkeeper', 2);

CREATE TABLE Therapists(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO Therapists (name) VALUES 
('Emily White'),
('John Davis');

CREATE TABLE Massages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    appointment DATETIME NOT NULL,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players (id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists (id)
);

INSERT INTO Massages (appointment, player_id, therapist_id) VALUES 
('2024-05-15 14:00:00', 1, 1),
('2024-05-16 15:00:00', 2, 2);


-- List all Training sessions for all teams [Location, when, team.name, coach.name]
SELECT TrainingSessions.location, TrainingSessions.date_time, Teams.name AS team_name, Coach.name AS coach_name
FROM TrainingSessions
JOIN Teams ON TrainingSessions.team_id = Teams.id
JOIN Coach ON Teams.coach_id = Coach.id;

-- List all Team that do not have any training sessions. [team.name]
SELECT Teams.name
FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.id IS NULL;

-- List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT Players.name AS player_name, Massages.appointment, Therapists.name AS therapist_name
FROM Massages
JOIN Players ON Massages.player_id = Players.id
JOIN Therapists ON Massages.therapist_id = Therapists.id;

-- List all the Therapists for the "Warriors"
SELECT Therapists.name
FROM Massages
JOIN Players ON Massages.player_id = Players.id
JOIN Therapists ON Massages.therapist_id = Therapists.id
JOIN Teams ON Players.team_id = Teams.id
WHERE Teams.name = 'Warriors';

-- Count the number of training sessions each team has in Feb 2022.
SELECT Teams.name, COUNT(TrainingSessions.id) AS num_training_sessions
FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.date_time >= '2022-02-01' AND TrainingSessions.date_time < '2022-03-01'
GROUP BY Teams.id;

-- Get the name of the oldest team.
SELECT Teams.name
FROM Teams
ORDER BY Teams.founded_year ASC
LIMIT 1;

-- Get the average team age of all teams.
SELECT AVG(YEAR(CURRENT_DATE) - Teams.founded_year) AS avg_team_age
FROM Teams;

-- List the team name and average player age of all teams. [Team Name, Average Player Age]
SELECT Teams.name AS team_name, AVG(YEAR(CURRENT_DATE) - Players.age) AS avg_player_age
FROM Teams
JOIN Players ON Teams.id = Players.team_id
GROUP BY Teams.id;
