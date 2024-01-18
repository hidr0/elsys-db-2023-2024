DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Patients (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM("Male", "Female"),
    phone VARCHAR(13) NOT NULL
);

CREATE TABLE Doctors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL CHECK(email LIKE "%@%"),
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Specialisations (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE DoctorSpecialisations (
	id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    specialisation_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id),
    FOREIGN KEY (specialisation_id) REFERENCES Specialisations(id)
);

CREATE TABLE Appointments (
	id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATETIME NOT NULL,
    reason TEXT,
	FOREIGN KEY (patient_id) REFERENCES Patients(id),
	FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);


INSERT INTO Specialisations(name) VALUES
("Orthopedics"),
("General Medicine"),
("Dermatology"),
("Pediatrics");

INSERT INTO Patients(name, birthdate, gender, phone) VALUES
("Carlos Ray", "1988-03-15", "Male", "555-0103"),
("Diana Grace", "1992-07-24", "Female", "555-0104"),
("Ethan Hunt", "1979-11-02", "Male", "555-0105"),
("Alice Johnson", "1990-05-21", "Female", "555-0101"),
("Bob Smith", "1985-08-30", "Male", "555-0102"),
("Petyr Petkov", "1999-05-05", "Female", "555-0109");  -- for last query

INSERT INTO Doctors(name, email, phone) VALUES
("Dr. Sarah Connor", "sarah.connor@clinic.com", "555-0203"),
("Dr. Lucy Liu", "lucy.liu@clinic.com", "555-0204"),
("Dr. Omar Sharif", "omar.sharif@clinic.com", "555-0205"),
("Dr. Emily White", "emily.white@clinic.com", "555-0201"),
("Dr. John Davis", "john.davis@clinic.com", "555-0202");

INSERT INTO DoctorSpecialisations(doctor_id, specialisation_id) VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 2);

INSERT INTO Appointments(patient_id, doctor_id, date, reason) VALUES
(1, 1, "2024-01-20 14:00", "Follow-up Visit"),
(1, 1, "2023-01-01 19:00", "First Visit"),
(2, 2, "2024-01-22 09:30", "Initial Consultation"),
(3, 3, "2024-01-25 16:00", "Routine Checkup"),
(4, 4, "2024-01-28 10:00", "Vaccination"),
(5, 5, "2024-01-30 11:00", "Annual Physical Exam No.1"),
(5, 5, "2024-07-01 17:30", "Annual Physical Exam No.2");


-- All appointments scheduled for a specific patient by name
-- [Patient.name, Appointment.date, Appointment.reason]
SELECT Patients.name, A.date, A.reason
FROM Patients
LEFT JOIN Appointments AS A ON Patients.id = A.patient_id;


-- List all doctors with a specific specialisation, such as 'Cardiology' (General medicine in query)
-- [Doctor.name]
-- 'General Medicine' instead of 'Cardiology' in example
SELECT Doctors.name
FROM Doctors
LEFT JOIN DoctorSpecialisations AS DS ON Doctors.id = DS.doctor_id
LEFT JOIN Specialisations AS S ON DS.specialisation_id = S.id
WHERE S.name LIKE "General Medicine";


-- Count the number of appointments each doctor has
-- [Doctor.name, Count]
SELECT Doctors.name, COUNT(A.doctor_id)
FROM Doctors
LEFT JOIN Appointments AS A ON Doctors.id = A.doctor_id
GROUP BY Doctors.name;


-- Retrieve the details of the next 5 appointments scheduled in the clinic
-- [Appointment.date, Appointment.reason, Patient.name, Doctor.name]
-- (Only retrieves appointments after the current time)
SELECT A.date, A.reason, P.name, D.name
FROM Appointments AS A
LEFT JOIN Patients AS P ON A.patient_id = P.id
RIGHT JOIN Doctors AS D ON A.doctor_id = D.id
WHERE A.date > NOW()
ORDER BY A.date - NOW() ASC
LIMIT 5;


-- Delete all appointments on 2023-01-01
SELECT COUNT(*) FROM Appointments;  -- 7
DELETE FROM Appointments AS A WHERE A.date LIKE "%2023-01-01%";
SELECT COUNT(*) FROM Appointments;  -- 6


-- Update all patients with 'kov' in the end of the name to have a gender "Male"
SELECT Patients.name, Patients.gender FROM Patients;
UPDATE Patients AS P SET P.gender = "Male" WHERE P.name LIKE "%kov";
SELECT Patients.name, Patients.gender FROM Patients;