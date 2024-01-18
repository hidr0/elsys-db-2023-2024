SET SQL_SAFE_UPDATES=0;

DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;

USE hospital;

CREATE TABLE doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL CHECK (email LIKE "%@%"),
    phone VARCHAR(256) NOT NULL
);

CREATE TABLE patient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM("M", "F"),
    phone VARCHAR(256) NOT NULL
);

CREATE TABLE appointment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    reason TEXT,
    doctor_id INT,
    patient_id INT,
    FOREIGN KEY(doctor_id) REFERENCES doctor(id),
    FOREIGN KEY(patient_id) REFERENCES patient(id)
);

CREATE TABLE specialisation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialisation TEXT NOT NULL
);

CREATE TABLE doctor_specialisation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    specialisation_id INT,
    FOREIGN KEY(doctor_id) REFERENCES doctor(id),
    FOREIGN KEY(specialisation_id) REFERENCES specialisation(id)
);

INSERT INTO patient (name, birthdate, gender, phone) VALUES
    ('Carlos Ray', '1988-03-15', 'M', '555-0103'),
    ('Diana Grace', '1992-07-24', 'F', '555-0104'),
    ('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
    ('Alice Johnson', '1990-05-21', 'F', '555-0101'),
    ('Bob Smith', '1985-08-30', 'M', '555-0102');

INSERT INTO doctor (name, email, phone) VALUES
    ('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
    ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
    ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
    ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
    ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

INSERT INTO specialisation (specialisation) VALUES
    ('Orthopedics'),
    ('General Medicine'),
    ('Dermatology'),
    ('Pediatrics');

INSERT INTO doctor_specialisation (doctor_id, specialisation_id) VALUES
    (1, 4),
    (2, 3),
    (3, 1),
    (4, 2),
    (5, 2);

INSERT INTO appointment (patient_id, doctor_id, date, reason) VALUES
    (1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
    (2, 2, '2024-01-22 09:30', 'Initial Consultation'),
    (3, 3, '2024-01-25 16:00', 'Routine Checkup'),
    (4, 4, '2024-01-28 10:00', 'Vaccination'),
    (5, 5, '2024-01-30 11:00', 'Annual Physical Exam');


-- 1
SELECT patient.name, appointment.date, appointment.reason FROM appointment
LEFT JOIN patient
ON appointment.patient_id = patient.id
ORDER BY patient.name;

-- 2
SELECT doctor.name FROM doctor_specialisation
LEFT JOIN doctor
ON doctor_specialisation.doctor_id = doctor.id
LEFT JOIN specialisation
ON doctor_specialisation.specialisation_id = specialisation.id
WHERE specialisation.specialisation = "Cardiology";

-- 3
SELECT doctor.name, COUNT(appointment.id) FROM appointment
LEFT JOIN doctor
ON appointment.doctor_id = doctor.id
GROUP BY doctor.name;

-- 4
SELECT appointment.date, appointment.reason, patient.name, doctor.name FROM appointment
LEFT JOIN patient
ON appointment.patient_id = patient.id
LEFT JOIN doctor
ON appointment.doctor_id = doctor.id
WHERE appointment.date >= CURRENT_TIMESTAMP
ORDER BY appointment.date
LIMIT 5;

-- 5
DELETE FROM appointment
WHERE date LIKE "2023-01-01%";

-- 6
UPDATE patient
SET gender = 'M'
WHERE name LIKE "%kov%";