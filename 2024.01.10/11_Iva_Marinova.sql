DROP DATABASE IF EXISTS Clinic;
CREATE DATABASE Clinic;
USE Clinic;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Doctor
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL CHECK(length(name) > 3),
    email VARCHAR(100) NOT NULL CHECK(email LIKE '%@%'),
    phone VARCHAR(10) NOT NULL
);

INSERT INTO Doctor (name, email, phone) VALUES ('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203');
INSERT INTO Doctor (name, email, phone) VALUES ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204');
INSERT INTO Doctor (name, email, phone) VALUES ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205');
INSERT INTO Doctor (name, email, phone) VALUES ('Dr. Emily White', 'emily.white@clinic.com', '555-0201');
INSERT INTO Doctor (name, email, phone) VALUES ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

CREATE TABLE Specialization
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialization VARCHAR(100) NOT NULL
);

INSERT INTO Specialization (specialization) VALUES ('Orthopedics');
INSERT INTO Specialization (specialization) VALUES ('General Medicine');
INSERT INTO Specialization (specialization) VALUES ('Dermatology');
INSERT INTO Specialization (specialization) VALUES ('Pediatrics');
INSERT INTO Specialization (specialization) VALUES ('Cardiology');

CREATE TABLE DoctorSpecialization
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialization_id INT,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES (1, 4);
INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES (2, 3);
INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES (3, 1);
INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES (4, 1);
INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES (5, 5);

CREATE TABLE Patient
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    gender VARCHAR(1) NOT NULL CHECK(gender IN ('M', 'F')),
    phone VARCHAR(20) NOT NULL
);

INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Carlos Ray', '1988-03-15', 'M', '555-0103');
INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Diana Grace', '1992-07-24', 'F', '555-0104');
INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Ethan Hunt', '1979-11-02', 'M', '555-0105');
INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Alice Johnso', '1990-05-21', 'F', '555-0101');
INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Bob Smith', '1985-08-30', 'F', '555-0102');
INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Pernikov Ivanov', '1985-09-30', 'F', '586-0102');

CREATE TABLE Appointment
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE NOT NULL,
    reason VARCHAR(255),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (1, 1, '2024-01-20 14:00', 'Follow-up Visit');
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (2, 2, '2024-01-22 09:30', 'Initial Consultation');
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (3, 3, '2024-01-25 16:00', 'Routine Checkup');
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (4, 3, '2024-01-28 10:00', 'Vaccination');
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (5, 5, '2024-01-30 11:00', 'Annual Physical Exam');
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (5, 3, '2024-02-20 10:00', 'Annual Physical Exam');
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES (1, 1, '2023-01-01 10:00', 'Annual Physical Exam');

-- Queries
-- 1. Find all appointments for one patient by name
SELECT Patient.name, Appointment.date, Appointment.reason FROM Appointment
LEFT JOIN Patient ON Appointment.patient_id = Patient.id
WHERE Patient.name = 'Bob Smith';

-- 2. List all doctors with specific specialization
SELECT Doctor.name FROM Doctor
LEFT JOIN DoctorSpecialization ON Doctor.id = DoctorSpecialization.doctor_id
LEFT JOIN Specialization ON DoctorSpecialization.specialization_id = Specialization.id
WHERE Specialization.specialization = 'Cardiology';

-- 3. Count number of appoinment each doctor has
SELECT Doctor.name, COUNT(Appointment.id) FROM Doctor
LEFT JOIN Appointment ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.id;

-- 4. Retrieve details of the next 5 appointments 
SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name FROM Appointment
LEFT JOIN Patient ON Appointment.patient_id = Patient.id
LEFT JOIN Doctor ON Appointment.doctor_id = Doctor.id
WHERE Appointment.date > NOW() ORDER BY Appointment.date LIMIT 5;

-- 5. Deleet all appoinments on 2023-01-01
DELETE FROM Appointment 
WHERE DATE(date) = '2023-01-01';
SELECT * FROM Appointment;

-- 6. Update all patients with "kov" in the name to have "M" gender
UPDATE Patient SET gender = 'M'
WHERE name LIKE '%kov%';
SELECT * FROM Patient;