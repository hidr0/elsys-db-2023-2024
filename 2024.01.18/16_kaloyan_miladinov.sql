SET SQL_SAFE_UPDATES = 0;

DROP DATABASE IF EXISTS SportsTraining;
CREATE DATABASE SportsTraining;
USE SportsTraining;


-- Table creation
CREATE TABLE Coaches
(
    id    INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name  VARCHAR(255)          NOT NULL,
    years INT CHECK (years > 0) NOT NULL
);

CREATE TABLE Teams
(
    id           INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name         VARCHAR(255)                     NOT NULL,
    founded_year YEAR CHECK (founded_year > 1900) NOT NULL,
    home_city    VARCHAR(255)                     NOT NULL,
    coach_id     INT UNIQUE                       NOT NULL,
    FOREIGN KEY (coach_id) REFERENCES Coaches (id)
);

CREATE TABLE TrainingSessions
(
    id       INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `when`   DATETIME,
    location VARCHAR(255) NOT NULL,
    team_id  INT          NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams (id)
);

CREATE TABLE Players
(
    id       INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name     VARCHAR(255)        NOT NULL,
    age      INT CHECK (age > 0) NOT NULL,
    position ENUM ('Forward', 'Goalkeeper', 'Defense'),
    team_id  INT                 NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams (id)
);

CREATE TABLE Therapists
(
    id   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Therapies
(
    id           INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `when`       DATETIME NOT NULL,
    player_id    INT      NOT NULL,
    therapist_id INT      NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players (id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists (id)
);

-- Dummy data insertion
INSERT INTO Coaches (name, years)
VALUES ('Sarah Connor', 5),
       ('John Smith', 8),
       ('John Doe', 2),
       ('Jane Doe', 1);

INSERT INTO Teams (name, founded_year, home_city, coach_id)
VALUES ('Dragons', 1998, 'Metropolis', 1),
       ('Warriors', 2003, 'Gotham', 2),
       ('Titans', 2000, 'Gotham', 3),
       ('Eagles', 2005, 'Metropolis', 4);

INSERT INTO Players (name, age, position, team_id)
VALUES ('Mike Johnson', 25, 'Forward', 1),
       ('John Smith', 30, 'Defense', 1),
       ('Alex Green', 22, 'Goalkeeper', 2);

INSERT INTO TrainingSessions (`when`, location, team_id)
VALUES ('2022-02-15', 'Metropolis Training Ground', 1),
       ('2022-02-19', 'Metropolis Training Ground', 1),
       ('2022-02-16', 'Gotham City Field', 2),
       ('2024-03-01', 'Gotham City Field', 2);

INSERT INTO Therapists (name)
VALUES ('Emily White'),
       ('John Davis'),
       ('John Doe');

INSERT INTO Therapies (`when`, player_id, therapist_id)
VALUES ('2024-05-15 14:00', 1, 1),
       ('2024-05-17 15:00', 1, 1),
       ('2024-05-16 15:00', 2, 2),
       ('2024-05-16 15:00', 3, 3);


-- (1)
SELECT ts.location AS Location, ts.`when`, t.name AS team, c.name AS coach
FROM Teams t
         LEFT JOIN TrainingSessions ts ON t.id = ts.team_id
         LEFT JOIN Coaches c ON t.coach_id = c.id ORDER BY ts.`when` DESC;


-- (2)
SELECT t.name AS `TEAMS WITHOUT TRAINING SESSIONS`
FROM Teams t
         LEFT JOIN TrainingSessions ts ON t.id = ts.team_id
WHERE ts.id IS NULL;

-- (3)
SELECT p.name, thrps.`when`, th.name AS therapist
FROM Therapies thrps
         JOIN Players p ON thrps.player_id = p.id
         JOIN Therapists th ON thrps.therapist_id = th.id
WHERE p.name = 'Mike Johnson';

-- (4)
SELECT DISTINCT th.name AS therapist
FROM Therapies thrps
         JOIN Players p ON thrps.player_id = p.id
         JOIN Teams t ON p.team_id = t.id
         JOIN Therapists th ON thrps.therapist_id = th.id
WHERE t.name = 'Warriors';

-- (5)
SELECT t.name AS team_name, COUNT(ts.id) AS session_count
FROM Teams t
         LEFT JOIN TrainingSessions ts ON t.id = ts.team_id AND YEAR(ts.`when`) = 2022 AND MONTH(ts.`when`) = 2
GROUP BY t.id;

-- (6)
SELECT name AS `OLDEST TEAM`
FROM Teams
ORDER BY founded_year
LIMIT 1;

-- (7)
SELECT AVG(p.age) AS `AVERAGE AGE`
FROM Teams t
         JOIN Players p ON t.id = p.team_id;

-- (8)
SELECT t.name, AVG(p.age) AS `AVERAGE AGE`
FROM Teams t
         LEFT JOIN Players p ON t.id = p.team_id
GROUP BY t.id;