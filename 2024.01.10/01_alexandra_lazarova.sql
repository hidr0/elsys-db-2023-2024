SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone LONG NOT NULL
);

INSERT INTO Doctor (name, email, phone)
VALUES
    ('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
    ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
    ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
    ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
    ('Dr. John Davis', 'john.davis@clinic.com', '555-0202'),
    ('Dr. John Davis123', 'john.da123vis@clinic.com', '555123-0202');

CREATE TABLE Specialization (
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialization VARCHAR(100) NOT NULL
);

INSERT INTO Specialization (specialization)
VALUES
    ('Orthopedics'),
    ('General Medicine'),
    ('Dermatology'),
    ('Pediatrics');

CREATE TABLE DoctorSpecialization (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    specialization_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

INSERT INTO DoctorSpecialization (doctor_id, specialization_id)
VALUES
    (1, 4), -- Dr. Sarah Connor - Pediatrics
    (2, 3), -- Dr. Lucy Liu - Dermatology
    (3, 1), -- Dr. Omar Sharif - Orthopedics
    (4, 2), -- Dr. Emily White - General Medicine
    (5, 2); -- Dr. John Davis - General Medicine

CREATE TABLE Appointment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reason TEXT NOT NULL,
    date DATETIME NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

INSERT INTO Appointment (reason, date, doctor_id)
VALUES
    ('Follow-up Visit', '2024-01-20 14:00', 1),
    ('Initial Consultation', '2024-01-22 09:30', 2),
    ('Routine Checkup', '2024-01-25 16:00', 3),
    ('Vaccination', '2024-01-28 10:00', 4),
    ('Annual Physical Exam', '2024-01-30 11:00', 5),
    ('Follow-up Visit', '2024-02-01 14:00', 1),
    ('Initial Consultation', '2023-01-01', 2);


CREATE TABLE Patient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    phone LONG NOT NULL,
    appointment_id INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(id)
);

INSERT INTO Patient (name, birthdate, gender, phone, appointment_id)
VALUES
    ('Carlos Ray', '1988-03-15', 'M', '555-0103', 1),
    ('Diana Grace', '1992-07-24', 'F', '555-0104', 2),
    ('Ethan Hunt', '1979-11-02', 'M', '555-0105', 3),
    ('Alice Johnson', '1990-05-21', 'F', '555-0101', 4),
    ('Bob Smitnikov', '1985-08-30', 'F', '555-0107', 6),
    ('Alexander Lazarkov', '1985-08-30', 'F', '555-0107', 7),
    ('Bob Smith', '1985-08-30', 'M', '555-0102', 5);

    -- SELECT * FROM Doctor;
    -- SELECT * FROM Specialization;
    -- SELECT * FROM DoctorSpecialization;
    -- SELECT * FROM Appointment;
    -- SELECT * FROM Patient;

   -- Find all appointments scheduled for a specific patient by name. [Patient.name, Appointment.date, Appointment.reason]
    SELECT Patient.name, Appointment.date, Appointment.reason
    FROM Patient
    JOIN Appointment ON Patient.appointment_id = Appointment.id;

    -- List all doctors with a specific specialization, such as 'Cardiology'. [Doctor.name]
    SELECT Doctor.name
    FROM Doctor
    JOIN DoctorSpecialization ON Doctor.id = DoctorSpecialization.doctor_id
    JOIN Specialization ON DoctorSpecialization.specialization_id = Specialization.id
    WHERE Specialization.specialization = 'Pediatrics';

    -- Count the number of appointments each doctor has. [Doctor.name, Count]
    SELECT Doctor.name, COUNT(Appointment.id) AS 'Count'
    FROM Doctor
    JOIN Appointment ON Doctor.id = Appointment.doctor_id
    GROUP BY Doctor.name;

    -- Retrieve the details of the next 5 appointments scheduled in the clinic. [Appointment.date, Appointment. reason, Patient.name, Doctor.name]
    SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name
    FROM Appointment
    JOIN Patient ON Appointment.id = Patient.appointment_id
    JOIN Doctor ON Appointment.doctor_id = Doctor.id
    ORDER BY Appointment.date
    LIMIT 5;

    -- Delete all appointments on 2023-01-01
    UPDATE Patient
	SET appointment_id = NULL
	WHERE appointment_id IN (
		SELECT id
		FROM Appointment
		WHERE DATE(date) = '2023-01-01'
	);
    DELETE FROM Appointment
    WHERE Appointment.date = '2023-01-01';
    SELECT * FROM Appointment;

    -- Update all patients with "kov" in the name to have a gender "M".

    SELECT * FROM Patient;
    UPDATE Patient
    SET gender = 'M'
    WHERE name LIKE '%kov%';

    SELECT * FROM Patient;