DROP DATABASE IF EXISTS Football;
CREATE DATABASE Football;
USE Football;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Coach (
    coach_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    years INT NOT NULL
);
	
CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    home_city VARCHAR(50) NOT NULL,
    coach_id INT,
    FOREIGN KEY (coach_id) REFERENCES Coach(coach_id)
);

CREATE TABLE TrainingSessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    session_datetime DATETIME NOT NULL,
    location VARCHAR(50) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    position ENUM('Forward', 'Goalkeeper', 'Defense') NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Therapist (
    therapist_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Therapy (
    therapy_id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT,
    therapist_id INT,
    therapy_datetime DATETIME NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(therapist_id)
);

INSERT INTO Coach (name, years)
VALUES
  ('Sarah Connor', 10),
  ('John Smith', 8);
  
INSERT INTO Teams (name, coach_id, founded_year, home_city)
VALUES
  ('Dragons', (SELECT coach_id FROM Coach WHERE name = 'Sarah Connor'), 1998, 'Metropolis'),
  ('Warriors', (SELECT coach_id FROM Coach WHERE name = 'John Smith'), 2003, 'Gotham');

INSERT INTO Players (name, age, position, team_id)
VALUES
  ('Mike Johnson', 25, 'Forward', (SELECT team_id FROM Teams WHERE name = 'Dragons')),
  ('Alex Green', 22, 'Goalkeeper', (SELECT team_id FROM Teams WHERE name = 'Warriors'));

INSERT INTO TrainingSessions (session_datetime, location, team_id)
VALUES
  ('2024-05-15 10:00:00', 'Metropolis Training Ground', (SELECT team_id FROM Teams WHERE name = 'Dragons')),
  ('2024-05-16 09:00:00', 'Gotham City Field', (SELECT team_id FROM Teams WHERE name = 'Warriors'));
  
INSERT INTO Therapist (name)
VALUES
  ('Emily White'),
  ('John Davis');
  
INSERT INTO Therapy (therapy_datetime, player_id, therapist_id)
VALUES
  ('2024-05-15 14:00:00', (SELECT player_id FROM Players WHERE name = 'Mike Johnson'), (SELECT therapist_id FROM Therapist WHERE name = 'Emily White')),
  ('2024-05-16 15:00:00', (SELECT player_id FROM Players WHERE name = 'Alex Green'), (SELECT therapist_id FROM Therapist WHERE name = 'John Davis'));

-- List all Training sessions for all teams [Location, when, team.name, coach.name]
SELECT 
    TrainingSessions.location,
    TrainingSessions.session_datetime,
    Teams.name AS team_name,
    Coach.name AS coach_name
FROM TrainingSessions
LEFT JOIN Teams ON TrainingSessions.team_id = Teams.team_id
LEFT JOIN Coach ON Teams.coach_id = Coach.coach_id;

-- List all Team that do not have any training sessions. [team.name]
SELECT Teams.name
FROM Teams
LEFT JOIN TrainingSessions ON Teams.team_id = TrainingSessions.team_id
WHERE TrainingSessions.session_id IS NULL;

-- List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT 
    Players.name AS player_name,
    Therapy.therapy_datetime AS massage_date,
    Therapist.name AS therapist_name
FROM Therapy
LEFT JOIN Players ON Therapy.player_id = Players.player_id
LEFT JOIN Therapist ON Therapy.therapist_id = Therapist.therapist_id;

-- List all the Therapists for the "Warriors"
SELECT
    Therapist.name
FROM Therapy
LEFT JOIN Players ON Therapy.player_id = Players.player_id
LEFT JOIN Teams ON Players.team_id = Teams.team_id
LEFT JOIN Therapist ON Therapy.therapist_id = Therapist.therapist_id
WHERE Teams.name = 'Warriors';

-- Count the number of training sessions each team has in Feb 2022.
SELECT 
    Teams.name AS team_name,
    COUNT(TrainingSessions.session_id) AS num_training_sessions
FROM Teams
LEFT JOIN TrainingSessions ON Teams.team_id = TrainingSessions.team_id
AND YEAR(TrainingSessions.session_datetime) = 2022 AND MONTH(TrainingSessions.session_datetime) = 2
GROUP BY Teams.name;

-- Get the name of the oldest team.
SELECT 
    Teams.name AS oldest_team_name
FROM Teams
ORDER BY Teams.founded_year
LIMIT 1;

-- Get the average team age of all teams.
SELECT
    AVG(2024 - Teams.founded_year) AS average_team_age
FROM Teams;

-- List the team name and average team age of all players.[Name, average age]
SELECT 
    Teams.name AS team_name,
    AVG(Players.age) AS average_team_age
FROM Teams
LEFT JOIN Players ON Teams.team_id = Players.team_id
GROUP BY Teams.name;

