DROP DATABASE IF EXISTS Tournament;
CREATE DATABASE Tournament;
USE Tournament;

SET SQL_SAFE_UPDATES=0;
CREATE TABLE Coach(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    years INT NOT NULL
);

INSERT INTO Coach(name, years) VALUES("Sarah Connor", 34);
INSERT INTO Coach(name, years) VALUES("John Smith", 47);

CREATE TABLE Teams(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    founded_year INT NOT NULL CHECK(founded_year > 1900),
    home_city VARCHAR(200) NOT NULL,
    coach_id INT NOT NULL UNIQUE,
    FOREIGN KEY(coach_id) REFERENCES Coach(id)
);

INSERT INTO Teams(name, founded_year, home_city, coach_id) VALUES("Dragons", 1998, "Metropolis", 1);
INSERT INTO Teams(name, founded_year, home_city, coach_id) VALUES("Warriors", 2003, "Gotham", 2);

CREATE TABLE TrainingSessions(
	id INT PRIMARY KEY AUTO_INCREMENT,
	whens DATETIME,
    location VARCHAR(200) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions(whens, location, team_id) VALUES('2022-02-15 10:00', "Metropolis Training Ground", 1);
INSERT INTO TrainingSessions(whens, location, team_id) VALUES('2024-05-16 09:00', "Gotham City Field", 2);

CREATE TABLE Players(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    age INT NOT NULL CHECK(age > 0),
    position ENUM("Forward", "GoalKeeper", "Defence"),
    team_id INT NOT NULL,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);

INSERT INTO Players(name, age, position, team_id) VALUES("Mike Johnson", 25, "Forward", 1);
INSERT INTO Players(name, age, position, team_id) VALUES("Alex Green", 22, "Goalkeeper", 2);

CREATE TABLE Therapist(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL
);

INSERT INTO Therapist(name) VALUES("Emily White");
INSERT INTO Therapist(name) VALUES("John Davis");

CREATE TABLE TherapistPlayers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    massage DATETIME NOT NULL,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    FOREIGN KEY(player_id) REFERENCES Players(id),
    FOREIGN KEY(therapist_id) REFERENCES Therapist(id)
);

INSERT INTO TherapistPlayers(massage, player_id, therapist_id) VALUES('2024-05-15 14:00', 1, 1);
INSERT INTO TherapistPlayers(massage, player_id, therapist_id) VALUES('2024-05-16 15:00', 2, 2);
INSERT INTO TherapistPlayers(massage, player_id, therapist_id) VALUES('2024-05-16 15:00', 2, 1);
-- 1

SELECT TS.location, TS.whens, T.name, C.name FROM TrainingSessions AS TS
LEFT JOIN Teams AS T ON TS.team_id = T.id
LEFT JOIN Coach AS C ON T.coach_id = C.id;

-- 2

SELECT T.name FROM Teams AS T
LEFT JOIN TrainingSessions AS TS ON TS.team_id = T.id
WHERE TS.team_id IS NULL;

-- 3

SELECT P.name, TP.massage, Th.name FROM TherapistPlayers AS TP
LEFT JOIN Players AS P ON P.id = TP.player_id
LEFT JOIN Therapist AS Th ON Th.id = TP.therapist_id;

-- 4

SELECT Th.name FROM Therapist AS Th
LEFT JOIN TherapistPlayers AS TP ON TP.therapist_id = Th.id
LEFT JOIN Players AS P ON P.id = TP.player_id
LEFT JOIN Teams AS T ON P.team_id = T.id
WHERE T.name = 'Warriors';

-- 5
SELECT T.name, COUNT(TS.id) FROM Teams AS T
LEFT JOIN TrainingSessions AS TS ON T.id = TS.team_id
WHERE MONTH(TS.whens) = 2 AND YEAR(TS.whens) = 2022
GROUP BY T.id;

-- 6
SELECT T.name FROM Teams AS T
ORDER BY founded_year ASC
LIMIT 1;

-- 7
SELECT AVG(2024 - founded_year) AS AverageAge FROM Teams;

-- 8
SELECT T.name, AVG(P.age) FROM Teams AS T
LEFT JOIN Players AS P ON P.team_id = T.id
GROUP BY T.id;
