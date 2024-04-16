SET SQL_SAFE_UPDATES=0;

DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;
USE Test;


CREATE TABLE Coach (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL
);

CREATE TABLE Teams (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK(founded_year > 1900),
	home_city VARCHAR(255) NOT NULL,
    coach_id INT NOT NULL UNIQUE,
    FOREIGN KEY (coach_id) REFERENCES Coach(id)
);

CREATE TABLE TrainingSessions (
	koga DATETIME,
    location TEXT NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Players (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK(age > 0),
    position ENUM("Forward", "Goalkeeper", "Defence"),
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Therapist (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Massages (
	appointment_date DATETIME NOT NULL,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(id)
);

INSERT INTO Coach (name, years) VALUES
("Sarah Connor", 19),
("John Smith", 7);

INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES
("Dragons", 1988, "Metropolis", 1),
("Warriors", 2003, "Gotham", 2);

INSERT INTO Players (name, age, position, team_id) VALUES
("Mike Johnson", 25, "Forward", 1),
("Alex Green", 22, "Goalkeeper", 2);

INSERT INTO TrainingSessions (koga, location, team_id) VALUES
("2024-05-15 10:00:00", "Metropolis Training Ground", 2),
("2024-05-16 09:00:00", "Gotham City Field", 1);

INSERT INTO THERAPIST (name) VALUES
("Emily White"),
("John Davis");

INSERT INTO Massages (appointment_date, player_id, therapist_id) VALUES
("2024-05-15 14:00:00", 1, 1),
("2024-05-16 15:00:00", 2, 2);

-- 1
SELECT ts.location, ts.koga AS koga, t.name AS team_name, c.name AS coach_id
FROM TrainingSessions ts
JOIN Teams t ON ts.team_id = t.id
JOIN Coach c ON t.coach_id = c.id;

-- 2
SELECT t.name
FROM Teams t
LEFT JOIN TrainingSessions ts ON t.id = ts.team_id
WHERE ts.team_id IS NULL;

-- 3
SELECT p.name AS player_name, m.appointment_date AS massage_date, t.name AS therapist_name
FROM Players p
LEFT JOIN Massages m ON m.player_id = p.id
LEFT JOIN Therapist t ON m.therapist_id = t.id;

-- 4
SELECT Therapist.name FROM Therapist
LEFT JOIN Massages m ON m.therapist_id = Therapist.id
LEFT JOIN Players p ON m.player_id = p.id
WHERE p.team_id = 1;

-- 5
SELECT t.name AS team_name, COUNT(ts.team_id) AS session_count
FROM Teams t
LEFT JOIN TrainingSessions ts ON t.id = ts.team_id
WHERE ts.koga >= '2022-02-01' AND ts.koga < '2022-03-01'
GROUP BY t.name;

-- 6
SELECT name FROM Teams
ORDER BY founded_year ASC
LIMIT 1;

-- 7
SELECT AVG(YEAR(CURDATE()) - founded_year) AS average_team_age
FROM Teams;

-- 8
SELECT team_id, AVG(age) AS average_age
FROM Players
GROUP BY team_id;
