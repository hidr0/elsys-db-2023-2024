SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;


CREATE TABLE Doctor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL CHECK (email LIKE '%@%'),
    phone VARCHAR(20) NOT NULL
);

INSERT INTO Doctor (name, email, phone)
VALUES('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
    ('Dr. Lucy Liu', 'lucy.liu@clinic.com', 'Phone: 555-0204'),
    ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
    ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
    ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');
    
CREATE TABLE Patient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    phone VARCHAR(20) NOT NULL
);

INSERT INTO Patient (name, birthdate, gender, phone)
VALUES('Carlos Ray', '1988-03-15', 'Male', '555-0103'),
    ('Diana Grace', '1992-07-24', 'Female', '555-0104'),
    ('Ethan Hunt', '1979-11-02', 'Male', '555-0105'),
    ('Gosho Petkov', '1990-05-21', 'Female', '555-0101'),
    ('Bob Smith', '1985-08-30', 'Male', '555-0102');
    
CREATE TABLE Appointment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATE NOT NULL,
    reason VARCHAR(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

INSERT INTO Appointment(patient_id, doctor_id, date, reason)
VALUES(1, 1, '2024-01-20', 'Follow-up Visit'),
    (2, 2, '2024-01-22', 'Initial Consultation'),
    (3, 3, '2024-01-25', 'Routine Checkup'),
    (4, 4, '2024-01-28', 'Vaccination'),
    (5, 1, '2023-01-01', 'Annual Physical Exam');


CREATE TABLE Specialisation(
	id INT AUTO_INCREMENT PRIMARY KEY,
    specialisation VARCHAR(255) NOT NULL
);

INSERT INTO Specialisation(specialisation)
VALUES('Orthopedics'),
    ('General Medicine'),
    ('Dermatology'),
    ('Pediatrics');
    
CREATE TABLE DoctorSpecialization (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    specialisation_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialisation_id) REFERENCES Specialisation(id)
);

INSERT INTO DoctorSpecialization(doctor_id, specialisation_id)
VALUES(1, 1),
	(2, 4),
	(3, 2),
	(5, 1);
    
-- 1
SELECT Patient.name, Appointment.date, Appointment.reason FROM Patient
LEFT JOIN Appointment ON Patient.id = Appointment.patient_id;

-- 2
SELECT Doctor.name, Specialisation.specialisation FROM DoctorSpecialization
LEFT JOIN Doctor ON DoctorSpecialization.doctor_id = Doctor.id
LEFT JOIN Specialisation ON DoctorSpecialization.specialisation_id = Specialisation.id
WHERE Specialisation.specialisation = 'Orthopedics';

-- 3
SELECT Doctor.name, COUNT(Appointment.id) FROM Doctor
LEFT JOIN Appointment ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.name;

-- 4
SELECT Appointment.date, Appointment.reason, Doctor.name, Patient.name FROM Appointment
LEFT JOIN Doctor ON Appointment.doctor_id = Doctor.id
LEFT JOIN Patient ON Appointment.patient_id = Patient.id
ORDER BY Appointment.date LIMIT 5;

-- 5
DELETE FROM Appointment
WHERE date = '2023-01-01';

-- za proverka na minaloto
SELECT * FROM Appointment;

-- 6
UPDATE Patient SET gender = 'Male'
WHERE name LIKE '%kov';

-- proverka
SELECT Patient.name, Patient.gender FROM Patient
WHERE name LIKE '%kov';