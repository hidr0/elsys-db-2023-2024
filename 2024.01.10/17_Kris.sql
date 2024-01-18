DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Patient (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL, 
    gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    phone VARCHAR(8) NOT NULL
);

INSERT INTO Patient (name, birthdate, gender, phone) 
VALUES	('Carlos Ray', '1988-03-15', 'M', '555-0103'),
		('Diana Grace', '1992-07-24', 'F', '555-0104'),
		('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
		('Alice Johnkov', '1990-01-21', 'F', '555-0151'),
        ('Bobina Petkov', '1990-02-21', 'F', '555-0131'),
        ('Alice Johnson', '1990-05-21', 'F', '555-0101'),
		('Bob Smith', '1985-08-30', 'M', '555-0102');
        
SELECT * FROM Patient;

CREATE TABLE Doctor (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    email VARCHAR(50) CHECK (Email LIKE '%@%'),
    phone VARCHAR(8) NOT NULL
);

INSERT INTO Doctor (name, email, phone) 
VALUES	('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
		('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
		('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
		('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
		('Dr. John Davis', 'john.davis@clinic.com', '555-0202');
        
SELECT * FROM Doctor;

CREATE TABLE Appointment (
	id INT AUTO_INCREMENT PRIMARY KEY,
	date DATE NOT NULL,
    reason TEXT,
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

INSERT INTO Appointment (date, reason, patient_id, doctor_id) 
VALUES	('2023-01-01', 'Follow-up Visit', 1, 1),
		('2023-01-01', 'Follow-up Visit', 2, 4),
		('2024-01-20', 'Follow-up Visit', 1, 1),
		('2024-01-22', 'Initial Consultation', 2, 2), 
		('2024-01-25', 'Routine Checkup', 3, 3),
		('2024-01-28', 'Vaccination', 3, 4),
		('2024-01-30', 'Annual Physical Exam', 5, 2),
        ('2024-02-1', 'Annual Physical Exam', 3, 2),
        ('2024-02-5', 'Follow-up Visit', 2, 3);

SELECT * FROM Appointment;

CREATE TABLE Specialization (
	id INT AUTO_INCREMENT PRIMARY KEY,
    specialization TEXT
);

INSERT INTO Specialization (specialization) 
VALUES	('Orthopedics'),
		('General Medicine'),
		('Dermatology'),
		('Pediatrics'),
        ('Cardiology');
        
SELECT * FROM Specialization;

CREATE TABLE DoctorSpecialization (
	id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    spec_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (spec_id) REFERENCES Specialization(id)
);

INSERT INTO DoctorSpecialization (doctor_id, spec_id) 
VALUES	(1, 4),
		(2, 3),
		(3, 1),
        (3, 5),
		(4, 2),
		(5, 2);
        
SELECT * FROM DoctorSpecialization;

-- 1
SELECT Patient.name, Appointment.date, Appointment.reason 
FROM Appointment
LEFT JOIN Patient ON Patient.id = Appointment.patient_id;

-- 2
SELECT Doctor.name
FROM DoctorSpecialization
LEFT JOIN Doctor ON Doctor.id = DoctorSpecialization.doctor_id
LEFT JOIN Specialization ON Specialization.id = DoctorSpecialization.spec_id
WHERE Specialization.specialization = 'Cardiology';

-- 3
SELECT Doctor.name, COUNT(Appointment.id)
FROM Appointment
LEFT JOIN Doctor ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.id;

-- 4
SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name
FROM Appointment
LEFT JOIN Patient ON Appointment.patient_id = Patient.id
LEFT JOIN Doctor ON Appointment.doctor_id = Doctor.id
WHERE Appointment.date >= CURRENT_DATE
ORDER BY Appointment.date LIMIT 5;

-- 5
DELETE FROM Appointment WHERE date = '2023-01-01';
SELECT * FROM Appointment;

-- 6
UPDATE Patient SET gender = 'M' WHERE name LIKE '%kov';
SELECT * FROM Patient;