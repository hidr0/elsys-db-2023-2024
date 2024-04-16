DROP DATABASE IF EXISTS Football;
CREATE DATABASE Football;
USE Football;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    coach_name VARCHAR(255) NOT NULL,
    home_city VARCHAR(255) NOT NULL
);
CREATE TABLE Coaches (
    coach_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL,
    home_city VARCHAR(255) NOT NULL,
    team_id INT UNIQUE,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position VARCHAR(20) CHECK (position IN ('Forward', 'Goalkeeper', 'Defence')),
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE TrainingSessions (
    session_id INT PRIMARY KEY,
    session_date DATE NOT NULL,
    session_time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Therapists (
    therapist_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Massages (
    massage_id INT PRIMARY KEY,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists(therapist_id)
);

INSERT INTO Teams VALUES (1, 'Dragons', 1998, 'Sarah Connor', 'Metropolis');
INSERT INTO Teams VALUES (2, 'Warriors', 2003, 'John Smith', 'Gotham');

INSERT INTO Players VALUES (1, 'Mike Johnson', 25, 'Forward', 1);
INSERT INTO Players VALUES (2, 'Alex Green', 22, 'Goalkeeper', 2);

INSERT INTO TrainingSessions VALUES (1, '2024-05-15', '10:00', 'Metropolis Training Ground', 1);
INSERT INTO TrainingSessions VALUES (2, '2024-05-16', '09:00', 'Gotham City Field', 2);

INSERT INTO Therapists VALUES (1, 'Emily White');
INSERT INTO Therapists VALUES (2, 'John Davis');

INSERT INTO Massages VALUES (1, '2024-05-15', '14:00', 1, 1);
INSERT INTO Massages VALUES (2, '2024-05-16', '15:00', 2, 2);

-- Queries

-- List all Training sessions for all teams
SELECT TS.session_date, TS.session_time, TS.location, T.name AS team_name, T.coach_name
FROM TrainingSessions TS
JOIN Teams T ON TS.team_id = T.team_id;

-- List all Teams that do not have any training sessions
SELECT name AS team_name
FROM Teams
WHERE team_id NOT IN (SELECT DISTINCT team_id FROM TrainingSessions);

-- List all therapy sessions for a player
SELECT P.name AS player_name, M.appointment_date, M.appointment_time, T.name AS therapist_name
FROM Massages M
JOIN Players P ON M.player_id = P.player_id
JOIN Therapists T ON M.therapist_id = T.therapist_id;

-- List all Therapists for the "Warriors"
SELECT T.name AS therapist_name
FROM Therapists T
JOIN Massages M ON T.therapist_id = M.therapist_id
JOIN Players P ON M.player_id = P.player_id
JOIN Teams TM ON P.team_id = TM.team_id
WHERE TM.name = 'Warriors';

-- Count the number of training sessions each team has in Feb 2022 (assuming there is data for Feb 2022)
SELECT T.name AS team_name, COUNT(TS.session_id) AS session_count
FROM Teams T
LEFT JOIN TrainingSessions TS ON T.team_id = TS.team_id
WHERE TS.session_date BETWEEN '2022-02-01' AND '2022-02-29'
GROUP BY T.name;

-- Get the name of the oldest team
SELECT name AS team_name
FROM Teams
ORDER BY founded_year ASC
LIMIT 1;

-- Get the average age of all players in each team
SELECT AVG(YEAR(CURDATE()) - T.founded_year) AS average_team_age
FROM Teams T;



-- List the team name and average team age of all teams
SELECT T.name AS team_name, AVG(P.age) AS average_team_age
FROM Teams T
JOIN Players P ON T.team_id = P.team_id
GROUP BY T.name;
