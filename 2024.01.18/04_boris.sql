DROP DATABASE IF EXISTS gym;
CREATE DATABASE gym;
USE gym;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Therapists (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Teams (
	id INT AUTO_INCREMENT PRIMARY KEY,
    coach_id INT NOT NULL UNIQUE,
    
    name VARCHAR(100) NOT NULL,
    founded_year INT NOT NULL CHECK(founded_year > 1900),
    home_city VARCHAR(100) NOT NULL
    
    -- FOREIGN KEY (coach_id) REFERENCES Coaches(id)
);

CREATE TABLE Coaches (
	id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    years INT NOT NULL,
    
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE TrainingSessions (
	id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
	when_ DATETIME NOT NULL,
    location TEXT NOT NULL,
    
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Players (
	id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK(age > 0),
    position ENUM("Forward", "Goalkeeper", "Defence") NOT NULL,
    
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

CREATE TABLE Massages (
	id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
	date DATE NOT NULL,
    time TIME NOT NULL,
    
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists(id)
);


-- Insert Teams
INSERT INTO Teams (coach_id, name, founded_year, home_city)
VALUES
    (1, 'Dragons', 1998, 'Metropolis'),
    (2, 'Warriors', 2003, 'Gotham'),
    (3, 'Titans', 2005, 'Central City');

-- Insert Coaches
INSERT INTO Coaches (team_id, name, years)
VALUES
    (1, 'Sarah Connor', 5),
    (2, 'John Smith', 8),
    (3, 'Elena Rodriguez', 6);
    
ALTER TABLE Teams
ADD CONSTRAINT coach_id FOREIGN KEY(coach_id) 
    REFERENCES Coaches(id);

-- Insert Players
INSERT INTO Players (team_id, name, age, position)
VALUES
    (1, 'Mike Johnson', 25, 'Forward'),
    (2, 'Alex Green', 22, 'Goalkeeper'),
    (3, 'Olivia White', 23, 'Forward'),
    (3, 'Benjamin Stone', 29, 'Defence'),
    (1, 'Luna Smith', 26, 'Goalkeeper'),
    (2, 'David King', 27, 'Forward');

-- Insert Therapists
INSERT INTO Therapists (name)
VALUES
    ('Emily White'),
    ('John Davis'),
    ('Sophia Martinez');
    
    -- Insert Massages
INSERT INTO Massages (player_id, therapist_id, date, time)
VALUES
    (1, 1, "2024-05-15", "14:00"),
    (2, 2, "2024-05-16", "15:00"),
    (3, 1, '2024-05-17', '16:30'),
    (4, 3, '2024-05-18', '14:45'),
    (5, 2, '2024-05-19', '18:00'),
    (1, 3, '2024-05-20', '12:15');
    
-- Insert Training Sessions
INSERT INTO TrainingSessions (team_id, when_, location)
VALUES
    (2, '2023-02-15 10:00:00', 'Metropolis Training Ground'),
    (2, '2023-02-16 09:00:00', 'Gotham City Field'),
    (1, '2022-02-18 14:30:00', 'Atlantis Training Ground'),
    (1, '2022-02-19 11:00:00', 'Star City Field'),
    (1, '2023-02-20 15:45:00', 'Asgard Training Arena'),
    (2, '2022-02-21 09:30:00', 'Metropolis Training Facility'),
    (3, '2021-02-21 09:30:00', 'Metropolis Training Facility');


-- List all Training sessions for all teams [Location, when, team.name, coach.name] - OK
SELECT TS.location, TS.when_, Teams.name, Coaches.name
FROM Teams
LEFT JOIN TrainingSessions AS TS ON TS.team_id = Teams.id
RIGHT JOIN Coaches ON Coaches.team_id = Teams.id;


-- List all Team that do not have any training sessions. [team.name] - OK
SELECT Teams.name
FROM Teams
LEFT JOIN TrainingSessions AS TS ON TS.team_id = Teams.id
WHERE TS.team_id IS NULL;


-- List all therapy sessions for a player [Player.name, massage.date, Therapist.name] - OK
SELECT P.name, M.date, T.name
FROM Players AS P
LEFT JOIN Massages AS M ON M.player_id = P.id
LEFT JOIN Therapists AS T ON T.id = M.therapist_id;


-- List all the Therapists for the "Warriors" - OK
SELECT T.name
FROM Teams
LEFT JOIN Players ON Players.team_id = Teams.id
LEFT JOIN Massages AS M ON M.player_id = Players.id
LEFT JOIN Therapists AS T ON M.therapist_id = T.id
WHERE Teams.name LIKE "Warriors";


-- Count the number of training sessions each team has in Feb 2022. - OK
SELECT T.name, COUNT(TS.when_)
FROM Teams AS T
LEFT JOIN TrainingSessions AS TS ON T.id = TS.team_id
WHERE TS.when_ >= "2022-02-01" AND TS.when_ <= "2022-02-28"
GROUP BY T.name;


-- Get the name of the oldest team. - OK
SELECT Teams.name
FROM Teams
ORDER BY Teams.founded_year ASC
LIMIT 1;

-- Get the average team age of all teams. - OK
SELECT AVG(P.age)
FROM Teams AS T
LEFT JOIN Players AS P ON T.id = P.team_id
GROUP BY T.name;

-- List the team name and average team age of all players.[Name, average age]
SELECT T.name, AVG(P.age)
FROM Players AS P
LEFT JOIN Teams AS T ON T.id = P.team_id
GROUP BY T.name;
