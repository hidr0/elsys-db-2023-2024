SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS football_club;
CREATE DATABASE football_club;
USE football_club;

CREATE TABLE Coaches (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL
);

INSERT INTO Coaches (name, years) VALUES 
('Sarah Connor', 40),
('John Smith', 45),
('Gosho Goshov', 30),
('Alex Ivanov', 25);

CREATE TABLE Teams (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    home_city VARCHAR(255) NOT NULL,
    coach_id INT UNIQUE NOT NULL,
    FOREIGN KEY (coach_id) REFERENCES Coaches(id)
);

INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES
('Dragons', 1998, 'Metropolis', 1),
('Warriors', 2003, 'Gotham', 2),
('Zuburite', 1980, 'Sofia', 3),
('Peshovcite', 1975, 'Varna', 4);

CREATE TABLE Players (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position ENUM('Forward', 'Goalkeeper', 'Defence') NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO Players (name, age, position, team_id) VALUES
('Mike Johnson', 25, 'Forward', 1),
('Alex Green', 22, 'Goalkeeper', 2),
('Ivan Ivanov', 30, 'Defence', 3),
('Georgi Georgiev', 27, 'Forward', 3),
('Dwayne Johnson', 29, 'Goalkeeper', 4),
('Corey Taylor', 26, 'Forward', 4);

CREATE TABLE Therapists (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

INSERT INTO Therapists (name) VALUES
('Emily White'),
('John Davis'),
('Terap Evtimov'),
('Misho Mishov');

CREATE TABLE Massages (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    appointment_datetime DATETIME NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists(id)
);

INSERT INTO Massages (appointment_datetime, player_id, therapist_id) VALUES
('2024-05-15 14:00:00', 1, 1),
('2024-05-16 15:00:00', 2, 2),
('2024-02-15 14:00:00', 3, 3),
('2024-02-16 15:30:00', 4, 4),
('2024-03-01 10:10:00', 1, 2),
('2024-03-05 11:00:00', 2, 1);

CREATE TABLE TrainingSessions (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    whens DATETIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions (whens, location, team_id) VALUES
('2024-05-15 10:00:00', 'Metropolis Training Ground', 1),
('2024-05-16 09:00:00', 'Gotham City Field', 2),
('2022-02-10 10:00:00', 'Sofia Arena', 3),
('2022-02-20 09:00:00', 'Varna Stadium', 2),
('2024-06-15 10:00:00', 'Sofia Arena', 3),
('2024-06-16 09:00:00', 'Varna Stadium', 1);

-- List all Training sessions for all teams
SELECT ts.location, ts.whens, t.name AS team_name, c.name AS coach_name
FROM TrainingSessions ts
JOIN Teams t ON ts.team_id = t.id
JOIN Coaches c ON t.coach_id = c.id;

-- List all Teams that do not have any training sessions
SELECT t.name
FROM Teams t
LEFT JOIN TrainingSessions ts ON t.id = ts.team_id
WHERE ts.id IS NULL;

-- List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT p.name, m.appointment_datetime AS massage_date, th.name AS therapist_name
FROM Massages m
JOIN Players p ON m.player_id = p.id
JOIN Therapists th ON m.therapist_id = th.id
WHERE p.name = 'Mike Johnson';

-- List all the Therapists for the "Warriors"
SELECT th.name
FROM Therapists th
JOIN Massages m ON th.id = m.therapist_id
JOIN Players p ON m.player_id = p.id
JOIN Teams t ON p.team_id = t.id
WHERE t.name = 'Warriors';

-- Count the number of training sessions each team has in Feb 2022
SELECT t.name, COUNT(ts.id) AS session_count
FROM Teams t
JOIN TrainingSessions ts ON t.id = ts.team_id
WHERE MONTH(ts.whens) = 2 AND YEAR(ts.whens) = 2022
GROUP BY t.name;

-- Get the name of the oldest team
SELECT t.name
FROM Teams t
ORDER BY t.founded_year ASC
LIMIT 1;

-- Get the average team age of all teams
SELECT AVG(YEAR(CURRENT_DATE) - t.founded_year) AS average_age
FROM Teams t;

-- List the team name and average team age of all players. [Name, average age]
SELECT t.name AS team_name, AVG(p.age) AS average_player_age
FROM Teams t
JOIN Players p ON t.id = p.team_id
GROUP BY t.name;