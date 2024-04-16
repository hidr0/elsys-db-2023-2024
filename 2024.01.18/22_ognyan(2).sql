DROP DATABASE IF EXISTS football;
CREATE DATABASE football;
USE football;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    home_city VARCHAR(255) NOT NULL
);

CREATE TABLE TrainingSessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `when` DATETIME,
    location VARCHAR(255) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Coach (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL,
    team_id INT NOT NULL UNIQUE,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position ENUM('Forward', 'Goalkeeper', 'Defence'),
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Therapist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Massages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `when` DATETIME,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(id)
);

-- - **Teams**:
--   - Team Name: Dragons, Coach Name: Sarah Connor, Founded Year: 1998, Home City: Metropolis
--   - Team Name: Warriors, Coach Name: John Smith, Founded Year: 2003, Home City: Gotham

INSERT INTO Teams (name, founded_year, home_city) VALUES
    ('Dragons', 1998, 'Metropolis'),
    ('Warriors', 2003, 'Gotham');
INSERT INTO Coach (name, years, team_id) VALUES
    ('Sarah Connor', 2, 1),
    ('John Smith', 3, 2);

-- - **Players**:
--   - Player Name: Mike Johnson, Age: 25, Position: Forward, Team: Dragons
--   - Player Name: Alex Green, Age: 22, Position: Goalkeeper, Team: Warriors

INSERT INTO Players (name, age, position, team_id) VALUES
    ('Mike Johnson', 25, 'Forward', 1),
    ('Alex Green', 22, 'Goalkeeper', 2);

-- - **Training Sessions**:
--   - Session Date: 2024-05-15, Time: '10:00', Location: Metropolis Training Ground, Team: Dragons
--   - Session Date: 2024-05-16, Time: '09:00', Location: Gotham City Field, Team: Warriors

INSERT INTO TrainingSessions (`when`, location, team_id) VALUES
    ('2024-05-15 10:00', 'Metropolis Training Ground', 1),
    ('2024-05-16 09:00', 'Gotham City Field', 2);

-- - **Massages**:
--   - Appointment Date: 2024-05-15, Time: '14:00', Player: Mike Johnson, Therapist: Emily White
--   - Appointment Date: 2024-05-16, Time: '15:00', Player: Alex Green, Therapist: John Davis

INSERT INTO Therapist (name) VALUES
    ('Emily White'),
    ('John Davis');

INSERT INTO Massages (`when`, player_id, therapist_id) VALUES
    ('2024-05-15 14:00', 1, 1),
    ('2024-05-16 15:00', 2, 2);

-- - List all Training sessions for all teams [Location, when, team.name, coach.name]
SELECT location, `when`, Teams.name, Coach.name
FROM TrainingSessions
JOIN Teams ON Teams.id = TrainingSessions.team_id
JOIN Coach ON Coach.team_id = Teams.id;
-- - List all Team that do not have any training sessions. [team.name]
SELECT Teams.name
FROM Teams
LEFT JOIN TrainingSessions ON TrainingSessions.team_id = Teams.id
WHERE TrainingSessions.id IS NULL;
-- - List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT Players.name, DATE(Massages.`when`), Therapist.name
FROM Massages
JOIN Players ON Players.id = Massages.player_id
JOIN Therapist ON Therapist.id = Massages.therapist_id
WHERE Players.id = 1;
-- - List all the Therapists for the "Warriors"
SELECT Therapist.*
FROM Therapist
JOIN Massages ON Massages.therapist_id = Therapist.id
JOIN Players ON Players.id = Massages.player_id
JOIN Teams ON Teams.id = Players.team_id
WHERE Teams.name = 'Warriors';
-- - Count the number of training sessions each team has in Feb 2022.
SELECT team_id, COUNT(*)
FROM TrainingSessions
WHERE `when` BETWEEN '2022-02-01' AND '2022-02-28'
GROUP BY team_id;
-- - Get the name of the oldest team.
SELECT name
FROM Teams
WHERE founded_year = (SELECT MIN(founded_year) FROM Teams);
-- - Get the average team age of all teams.
SELECT AVG(YEAR(CURDATE()) - founded_year)
FROM Teams; 
-- - List the team name and average team age of all players.[Name, average age]
SELECT Teams.name, AVG(age)
FROM Teams
JOIN Players ON Players.team_id = Teams.id
GROUP BY Teams.id;