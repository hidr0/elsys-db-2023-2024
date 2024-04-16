DROP DATABASE IF EXISTS Teams;
CREATE DATABASE Teams;
USE Teams;

CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    home_city VARCHAR(255) NOT NULL
);

CREATE TABLE Coaches (
    coach_id INT PRIMARY KEY AUTO_INCREMENT,
    coach_name VARCHAR(255) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position ENUM('Forward', 'Goalkeeper', 'Defence') NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Therapists (
    therapist_id INT PRIMARY KEY AUTO_INCREMENT,
    therapist_name VARCHAR(255) NOT NULL
);

CREATE TABLE TrainingSessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    session_date DATE NOT NULL,
    session_time TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE TeamTrainingSessions (
    team_id INT,
    session_id INT,
    PRIMARY KEY (team_id, session_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (session_id) REFERENCES TrainingSessions(session_id)
);

CREATE TABLE PlayerMassages (
    player_id INT,
    therapist_id INT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    PRIMARY KEY (player_id, therapist_id, appointment_date, appointment_time),
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (therapist_id) REFERENCES Therapists(therapist_id)
);

INSERT INTO Teams (team_name, founded_year, home_city) VALUES
    ('Dragons', 1998, 'Metropolis'),
    ('Warriors', 2003, 'Gotham');

INSERT INTO Coaches (coach_name, team_id) VALUES
    ('Sarah Connor', 1),
    ('John Smith', 2);

INSERT INTO Players (player_name, age, position, team_id) VALUES
    ('Mike Johnson', 25, 'Forward', 1),
    ('Alex Green', 22, 'Goalkeeper', 2);

INSERT INTO TrainingSessions (session_date, session_time, location, team_id) VALUES
    ('2024-05-15', '10:00', 'Metropolis Training Ground', 1),
    ('2024-05-16', '09:00', 'Gotham City Field', 2);

INSERT INTO Therapists (therapist_name) VALUES
    ('Emily White'),
    ('John Davis');

INSERT INTO PlayerMassages (player_id, therapist_id, appointment_date, appointment_time) VALUES
    (1, 1, '2024-05-15', '14:00'),
    (2, 2, '2024-05-16', '15:00');

SELECT
    ts.location,
    ts.session_date AS when,
    t.team_name,
    c.coach_name
FROM
    TrainingSessions ts
JOIN Teams t ON ts.team_id = t.team_id
JOIN Coaches c ON t.team_id = c.team_id;

SELECT
    t.team_name
FROM
    Teams t
LEFT JOIN TrainingSessions ts ON t.team_id = ts.team_id
WHERE
    ts.session_id IS NULL;

SELECT
    p.player_name,
    pm.appointment_date AS massage_date,
    th.therapist_name
FROM
    PlayerMassages pm
JOIN Players p ON pm.player_id = p.player_id
JOIN Therapists th ON pm.therapist_id = th.therapist_id;

SELECT
    th.therapist_name
FROM
    Teams t
JOIN Players p ON t.team_id = p.team_id
JOIN PlayerMassages pm ON p.player_id = pm.player_id
JOIN Therapists th ON pm.therapist_id = th.therapist_id
WHERE
    t.team_name = 'Warriors';

SELECT
    t.team_name,
    COUNT(ts.session_id) AS session_count
FROM
    Teams t
LEFT JOIN TrainingSessions ts ON t.team_id = ts.team_id
WHERE
    ts.session_date BETWEEN '2022-02-01' AND '2022-02-28'
GROUP BY
    t.team_name;

SELECT
    team_name
FROM
    Teams
ORDER BY
    founded_year
LIMIT 1;

SELECT
    AVG(p.age) AS average_team_age
FROM
    Teams t
JOIN Players p ON t.team_id = p.team_id;

SELECT
    t.team_name,
    AVG(p.age) AS average_age
FROM
    Teams t
JOIN Players p ON t.team_id = p.team_id
GROUP BY
    t.team_name;
