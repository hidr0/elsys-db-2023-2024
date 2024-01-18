SET SQL_SAFE_UPDATES=0;

DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Patient(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    phone VARCHAR(15) NOT NULL
);

INSERT INTO Patient(name, birthdate, gender, phone) VALUES
("Carlos Ray", "1988-03-15", "M", "555-0103"),
("Diana Grace", "1992-07-24", "F", "555-0104"),
("Ethan Hunt", "1979-11-02", "M", "555-0105"),
("Alice Johnson", "1990-05-21", "F", "555-0101"),
("Bob Smith", "1985-08-30", "M", "555-0102");

CREATE TABLE Doctor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL CHECK ( email LIKE '%@%'  ),
    phone VARCHAR(15) NOT NULL
);

INSERT INTO Doctor(name, email, phone) VALUES
("Dr. Sarah Connor", "sarah.connor@clinic.com", "555-0203"),
("Dr. Lucy Liu", "lucy.liu@clinic.com", "555-0204"),
("Dr. Omar Sharif", "omar.sharif@clinic.com", "555-0205"),
("Dr. Emily White", "emily.white@clinic.com", "555-0201"),
("Dr. John Davis", "john.davis@clinic.com", "555-0202");

CREATE TABLE Appointment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATETIME NOT NULL,
    reason TEXT NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    doctor_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);

INSERT INTO Appointment(date, reason, patient_id, doctor_id) VALUES
("2024-01-20 14:00", "Follow-up Visit", 1, 1),
("2024-01-22 09:30", "Initial Consultation", 2, 2),
("2024-01-25 16:00", "Routine Checkup", 3, 3),
("2024-01-28 10:00", "Vaccination", 4, 4),
("2024-01-30 11:00", "Annual Physical Exam", 5, 5);

CREATE TABLE Specializations(
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialisation VARCHAR(255) NOT NULL
);

INSERT INTO Specializations(specialisation) VALUES
("Orthopedics"),
("General Medicine"),
("Dermatology"),
("Pediatrics");

CREATE TABLE DoctorSpecializations(
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    specialization_id INT NOT NULL,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(id)
);

INSERT INTO DoctorSpecializations(doctor_id, specialization_id) VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 2);

# Find all appointments scheduled for a specific patient by name
SELECT Patient.name, Appointment.date, Appointment.reason FROM Appointment
LEFT JOIN Patient on Appointment.patient_id = Patient.id;

# List all doctors with a specific specialization
SELECT Doctor.name FROM Doctor
LEFT JOIN DoctorSpecializations on Doctor.id = DoctorSpecializations.doctor_id
LEFT JOIN Specializations on DoctorSpecializations.specialization_id = Specializations.id
WHERE Specializations.specialisation = "Cardiology";

# Count the number of appointments each doctor has
SELECT Doctor.name, COUNT(Appointment.id) AS "Number of appointments" FROM Doctor
LEFT JOIN Appointment on Doctor.id = Appointment.doctor_id
GROUP BY Doctor.name;

# Retrieve the details of the next 5 appointments scheduled in the clinic
SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name FROM Appointment
LEFT JOIN Patient on Appointment.patient_id = Patient.id
LEFT JOIN Doctor on Appointment.doctor_id = Doctor.id
ORDER BY Appointment.date
LIMIT 5;

# Delete all appointments on 2023-01-01
DELETE FROM Appointment WHERE Appointment.date LIKE "2023-01-01%";

# Update all patients with "kov" in the name to have a gender "M"
UPDATE Patient SET Patient.gender = "M" WHERE Patient.name LIKE "%kov%";
