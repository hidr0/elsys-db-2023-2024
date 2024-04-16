DROP DATABASE IF EXISTS TeamManagement;
CREATE DATABASE TeamManagement;
USE TeamManagement;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Coaches (
  coach_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  years INT NOT NULL
);

CREATE TABLE Teams (
  team_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  founded_year INT NOT NULL CHECK (founded_year > 1900),
  home_city VARCHAR(255) NOT NULL,
  coach_id INT UNIQUE,
  FOREIGN KEY (coach_id) REFERENCES Coaches(coach_id)
);

CREATE TABLE Players (
  player_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  age INT NOT NULL CHECK (age > 0),
  position ENUM('Forward', 'Goalkeeper', 'Defence'),
  team_id INT NOT NULL,
  FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);	

CREATE TABLE Training_Sessions (
  session_id INT PRIMARY KEY AUTO_INCREMENT,
  session_datetime DATETIME,
  location VARCHAR(255) NOT NULL,
  team_id INT NOT NULL,
  FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Therapists (
  therapist_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE Massages (
  massage_id INT PRIMARY KEY AUTO_INCREMENT,
  appointment_datetime DATETIME NOT NULL,
  player_id INT NOT NULL,
  therapist_id INT NOT NULL,
  FOREIGN KEY (player_id) REFERENCES Players(player_id),
  FOREIGN KEY (therapist_id) REFERENCES Therapists(therapist_id)
);

INSERT INTO Coaches (name, years) VALUES
  ('Sarah Connor', 5),
  ('John Smith', 10),
  ('Coach Levski', 15),
  ('Coach CSKA', 12); 

INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES
  ('Dragons', 1998, 'Metropolis', 1),
  ('Warriors', 2003, 'Gotham', 2),
  ('Levski', 2000, 'Sofia', 3),
  ('CSKA', 2001, 'Sofia', 4);

INSERT INTO Players (name, age, position, team_id) VALUES
  ('Mike Johnson', 25, 'Forward', 1),
  ('Alex Green', 22, 'Goalkeeper', 2);

INSERT INTO Training_Sessions (session_datetime, location, team_id) VALUES
  ('2024-05-15 10:00:00', 'Metropolis Training Ground', 1),
  ('2024-05-16 09:00:00', 'Gotham City Field', 2),
  ('2022-02-16 09:00:00', 'Metropolis Training Ground', 3);

INSERT INTO Therapists (name) VALUES
  ('Emily White'),
  ('John Davis');

INSERT INTO Massages (appointment_datetime, player_id, therapist_id) VALUES
  ('2024-05-15 14:00:00', 1, 1),
  ('2024-05-16 15:00:00', 2, 2);
  
SELECT ts.location, ts.session_datetime AS 'when', t.name AS 'team.name', c.name AS 'coach.name'
FROM Training_Sessions ts
LEFT JOIN Teams t ON ts.team_id = t.team_id
LEFT JOIN Coaches c ON t.coach_id = c.coach_id;

SELECT t.name AS 'team.name'
FROM Teams t
LEFT JOIN Training_Sessions ts ON t.team_id = ts.team_id
WHERE ts.session_id IS NULL;

SELECT p.name AS 'Player.name', m.appointment_datetime AS 'massage.date', th.name AS 'Therapist.name'
FROM Massages m
LEFT JOIN Players p ON m.player_id = p.player_id
LEFT JOIN Therapists th ON m.therapist_id = th.therapist_id;

SELECT th.name
FROM Therapists th
LEFT JOIN Massages m ON th.therapist_id = m.therapist_id
LEFT JOIN Players p ON m.player_id = p.player_id
WHERE p.team_id = (SELECT team_id FROM Teams WHERE name = 'Warriors');

SELECT t.name AS 'team.name', COUNT(ts.session_id) AS 'session_count'
FROM Teams t
LEFT JOIN Training_Sessions ts ON t.team_id = ts.team_id
WHERE MONTH(ts.session_datetime) = 2 AND YEAR(ts.session_datetime) = 2022
GROUP BY t.name;

SELECT name AS 'Oldest Team'
FROM Teams
ORDER BY founded_year ASC
LIMIT 1;

SELECT AVG(2024 - founded_year) AS 'average_team_age'
FROM Teams;

SELECT t.name AS 'Name', AVG(p.age) AS 'average_age'
FROM Teams t
LEFT JOIN Players p ON t.team_id = p.team_id
GROUP BY t.name;
