SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS team;
CREATE DATABASE team;
USE team;

CREATE TABLE Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    founded_year INT NOT NULL,
    home_city VARCHAR(50) NOT NULL
);

CREATE TABLE Coach(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    years INT CHECK (years >= 0) NOT NULL,
    team_id INT UNIQUE NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (Age >= 0) NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE TrainingSessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Therapists(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Massage (
    id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists(id)
);

INSERT INTO Teams (name, founded_year, home_city) VALUES
    ('Dragons', 1998, 'Metropolis'),
    ('Warriors', 2003, 'Gotham'),
    ('ManUtd', 1902, 'Manchester');

INSERT INTO Coach (name, years, team_id) VALUES
    ('Sarah Connor', 10, 1),
    ('John Smith', 8, 2);

INSERT INTO Players (name, age, position, team_id) VALUES
    ('Mike Johnson', 25, 'Forward', 1),
    ('Alex Green', 22, 'Goalkeeper', 2),
    ('Klay Thompson', 33, 'Point Guard', 2);

INSERT INTO TrainingSessions (date, location, team_id) VALUES
    ('2024-05-15 10:00:00', 'Metropolis Training Ground', 1),
    ('2024-05-16 09:00:00', 'Gotham City Field', 2),
    ('2022-02-14 21:21:21', 'Gotham City Field', 2);

INSERT INTO Therapists (name) VALUES
    ('Emily White'),
    ('John Davis');

INSERT INTO Massage (date, player_id, therapist_id) VALUES
    ('2024-05-15 14:00:00', 1, 1),
    ('2024-05-16 15:00:00', 2, 2),
    ('2024-05-18 16:10:00', 2, 1); 
    
-- 1
SELECT TrainingSessions.location, TrainingSessions.date, Teams.name, Coach.name FROM TrainingSessions
LEFT JOIN Teams ON TrainingSessions.team_id = Teams.id
LEFT JOIN Coach ON Teams.id = Coach.team_id;

-- 2
SELECT Teams.name FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.id IS NULL;

-- 3
SELECT Players.name, Massage.date, Therapists.name FROM Massage
LEFT JOIN Players ON Massage.player_id = Players.id
LEFT JOIN Therapists ON Massage.therapist_id = Therapists.id;

-- 4 
SELECT Therapists.name FROM Massage
LEFT JOIN Players ON Massage.player_id = Players.id
LEFT JOIN Teams ON Players.team_id = Teams.id
LEFT JOIN Therapists ON Massage.therapist_id = Therapists.id
WHERE Teams.name = 'Warriors';

-- 5
SELECT Teams.name, COUNT(IF(YEAR(TrainingSessions.date) = 2022 AND MONTH(TrainingSessions.date) = 2, 1, NULL)) AS "TrainingSessions in FEB 2022"   FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
GROUP BY Teams.name;

-- 6
SELECT name FROM Teams
ORDER BY founded_year ASC LIMIT 1;

-- 7
SELECT AVG(YEAR(CURDATE()) - founded_year) FROM Teams;

-- 8
SELECT Teams.name, AVG(Players.age) FROM Teams
LEFT JOIN Players ON Teams.id = Players.team_id
GROUP BY Teams.name;