SET SQL_SAFE_UPDATES=0;

DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;


-- Table creation
CREATE TABLE Doctor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) CHECK(email LIKE '%@%') NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Patient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Appointment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    reason TEXT,
    doctor_id INT,
    patient_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (patient_id) REFERENCES Patient(id)
);

CREATE TABLE Specialization (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE DoctorSpecializations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
	specialization_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

-- Dummy data insertion
INSERT INTO Patient (name, birthdate, gender, phone)
VALUES 
('Carlos Ray', '1988-03-15', 'M', '555-0103'),
('Diana Grace', '1992-07-24', 'F', '555-0104'),
('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
('Alice Johnson', '1990-05-21', 'F', '555-0101'),
('Bob Smith', '1985-08-30', 'M', '555-0102'),
('Marian Petkov', '1983-09-23', 'F', '555-0106'),
('Maria Petkova', '1982-08-24', 'F', '555-0107');

INSERT INTO Doctor (name, email, phone)
VALUES 
('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

INSERT INTO Specialization (name)
VALUES 
('Orthopedics'),
('General Medicine'),
('Dermatology'),
('Pediatrics');

INSERT INTO DoctorSpecializations (doctor_id, specialization_id)
VALUES 
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 2);

INSERT INTO Appointment (patient_id, doctor_id, date, reason)
VALUES 
(1, 1, '2024-01-20', 'Follow-up Visit'),
(2, 2, '2024-01-22', 'Initial Consultation'),
(3, 3, '2024-01-25', 'Routine Checkup'),
(4, 4, '2024-01-28', 'Vaccination'),
(3, 4, '2024-02-12', 'Vaccination'),
(2, 4, '2024-02-15', 'Vaccination'),
(5, 5, '2023-01-01', 'Annual Physical Exam');

-- (1) Patient appointments
SELECT Patient.name AS Patient, Appointment.date AS Appointment, Appointment.reason AS Reason
FROM Patient
JOIN Appointment ON Patient.id = Appointment.patient_id;
-- WHERE Patient.name = 'Bob Smith';

-- (2) Doctors by specialization
SELECT Doctor.name AS Doctor
FROM Doctor
JOIN DoctorSpecializations ON Doctor.id = DoctorSpecializations.doctor_id
JOIN Specialization ON DoctorSpecializations.specialization_id = Specialization.id
WHERE Specialization.name = 'Orthopedics';

-- (3) Number of appointments for each doctor
SELECT Doctor.name AS Doctor, COUNT(Appointment.id) AS `Number of Appointments`
FROM Doctor
LEFT JOIN Appointment ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.id;


-- (4) Next 5 appointments
SELECT Appointment.date AS Date, Appointment.reason AS Reason, Patient.name AS Patient, Doctor.name AS Doctor
FROM Appointment
JOIN Patient ON Appointment.patient_id = Patient.id
JOIN Doctor ON Appointment.doctor_id = Doctor.id
WHERE Appointment.date >= CURDATE()
ORDER BY Appointment.date
LIMIT 5;

-- (5) Delete all appointments on 2023-01-01
DELETE FROM Appointment
WHERE DATE(Appointment.date) = '2023-01-01';

SELECT * FROM Appointment;

-- (6) Updating each patient to have correct gender
UPDATE Patient
SET gender = 'M' WHERE name Like '%kov'; -- '%kov%' doesn't make sense here

SELECT * FROM Patient;