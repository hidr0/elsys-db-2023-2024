DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Doctor (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL CHECK (email LIKE '%@%'),
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Specialization (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Patient (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,	
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE Appointment (
    id INT PRIMARY KEY,
    date DATE NOT NULL,
    reason VARCHAR(255),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

CREATE TABLE DoctorSpecialization (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

INSERT INTO Doctor (id, name, email, phone) VALUES
(1, 'Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
(2, 'Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
(3, 'Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
(4, 'Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
(5, 'Dr. John Davis', 'john.davis@clinic.com', '555-0202');

INSERT INTO Specialization (id, name) VALUES
(1, 'Orthopedics'),
(2, 'General Medicine'),
(3, 'Dermatology'),
(4, 'Pediatrics');

INSERT INTO Patient (id, name, birthdate, gender, phone) VALUES
(1, 'Carlos Ray', '1988-03-15', 'M', '555-0103'),
(2, 'Diana Grace', '1992-07-24', 'F', '555-0104'),
(3, 'Ethan Hunt', '1979-11-02', 'M', '555-0105'),
(4, 'Alice Johnson', '1990-05-21', 'F', '555-0101'),
(5, 'Bob Smith', '1985-08-30', 'M', '555-0102');

INSERT INTO Appointment (id, patient_id, doctor_id, date, reason) VALUES
(1, 1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
(2, 2, 2, '2024-01-22 09:30', 'Initial Consultation'),
(3, 3, 3, '2024-01-25 16:00', 'Routine Checkup'),
(4, 4, 4, '2024-01-28 10:00', 'Vaccination'),
(5, 5, 5, '2024-01-30 11:00', 'Annual Physical Exam');

INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES 
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 2);

-- 1 
SELECT Patient.name, Appointment.date, Appointment.reason   
FROM Patient
JOIN Appointment ON Patient.id = Appointment.patient_id
WHERE Patient.name = "Carlos Ray";

-- 2 
SELECT Doctor.name 
FROM Doctor 
JOIN DoctorSpecialization ON Doctor.id = DoctorSpecialization.doctor_id
JOIN Specialization ON DoctorSpecialization.specialization_id = Specialization.id
WHERE Specialization.name = "Dermatology";

-- 3 
SELECT Doctor.name, COUNT(Appointment.id) AS appointment_count
FROM Doctor
LEFT JOIN Appointment ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.name;

-- 4 
SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name
FROM Appointment 
JOIN Patient ON Appointment.patient_id = Patient.id
JOIN Doctor ON Appointment.doctor_id = Doctor.id
ORDER BY Appointment.date
LIMIT 5;

-- 5 
DELETE FROM Appointment 
WHERE date = "2023-01-01" ;

-- 6
UPDATE Patient
SET gender = "M"
WHERE name LIKE "%kov%";



