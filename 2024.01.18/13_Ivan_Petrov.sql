DROP DATABASE IF EXISTS Sportteams;
CREATE DATABASE Sportteams;
USE Sportteams;


CREATE TABLE Team(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    home_city VARCHAR(255) NOT NULL
);

CREATE TABLE Coach(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL,
    home_city VARCHAR(255) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(id)
);

CREATE TABLE Player(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position ENUM("Forward", "Goalkeeper", "Defance") NOT NULL,
    team_id INT,
    FOREIGN KEY(team_id) REFERENCES Team(id)
);

CREATE TABLE Therapist(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE TrainingSession(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_time DATETIME,
    location VARCHAR(255) NOT NULL, 
    team_id INT,
    coach_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(id),
    FOREIGN KEY (coach_id) REFERENCES Coach(id)
);

CREATE TABLE Massage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATETIME,
    player_id INT,
    therapist_id INT,
    FOREIGN KEY (player_id) REFERENCES Player(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(id)
);

INSERT INTO Team (name, founded_year, home_city) VALUES
('Dragons', 1998, 'Metropolis'),
('Warriors', 2003, 'Gotham');

INSERT INTO Coach (name, years, home_city, team_id) VALUES
('Sarah Connor', 5, 'Metropolis', 1),
('John Smith', 8, 'Gotham', 2);

INSERT INTO Player (name, age, position, team_id) VALUES
('Mike Johnson', 25, 'Forward', 1),
('Alex Green', 22, 'Goalkeeper', 2);

INSERT INTO TrainingSession (date_time, location, team_id, coach_id) VALUES
('2024-05-15 10:00:00', 'Metropolis Training Ground', 1, 1),
('2024-05-16 09:00:00', 'Gotham City Field', 2, 2);

INSERT INTO Therapist (name) VALUES
('Emily White'),
('John Davis');

INSERT INTO Massage (date, player_id, therapist_id) VALUES
('2024-05-15 14:00:00', 1, 1),
('2024-05-16 15:00:00', 2, 2);


-- 1
SELECT TrainingSession.location, TrainingSession.date_time AS session_date_time, Team.name AS team_name, Coach.name AS coach_name
FROM TrainingSession
JOIN Team ON TrainingSession.team_id = Team.id 
JOIN Coach ON TrainingSession.coach_id = Coach.id;

-- 2
SELECT name AS team_name
FROM Team
WHERE id NOT IN(SELECT DISTINCT team_id FROM TrainingSession);

-- 3 
SELECT Player.name AS player_name, Massage.date AS massage_date, Therapist.name AS therapist_name
FROM Massage
JOIN Player ON Massage.player_id = Player.id
JOIN Therapist ON Massage.therapist_id = Therapist.id;

-- 4
SELECT DISTINCT Therapist.name AS therapist_name 
FROM Therapist 
JOIN Massage ON Therapist.id = Massage.therapist_id
JOIN Player ON Massage.player_id = Player.id
JOIN Team ON Player.team_id = Team.id
WHERE Team.name = "Warriors";

-- 5
SELECT Team.name AS team_name, COUNT(TrainingSession.id) AS number_of_sessions 
FROM Team
LEFT JOIN TrainingSession ON Team.id = TrainingSession.team_id AND MONTH(TrainingSession.date_time) = 2 AND YEAR(TrainingSession.date_time) = 2022
GROUP BY Team.name;

-- 6
SELECT name AS oldest_team_name
FROM Team
ORDER BY founded_year ASC 
LIMIT 1;

-- 7
SELECT AVG(Team.founded_year) AS average_team_age
FROM Team;

-- 8
SELECT Team.name AS team_name, AVG(Player.age) AS average_age_by_team
FROM Team
JOIN Player ON Team.id = Player.team_id
GROUP BY Team.name;

