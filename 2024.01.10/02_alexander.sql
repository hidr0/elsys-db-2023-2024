SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS name;
CREATE DATABASE name;
USE name;

CREATE TABLE Doctor(
    id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null,
    phone varchar(100) not null
);
CREATE TABLE Specialisation(
    id int primary key auto_increment,
    specialisation varchar(100)
);
CREATE TABLE Patient(
    id int primary key auto_increment,
    name varchar(100) not null,
    birthdate DATE not null,
    gender ENUM("M","F"),
    phone varchar(100) not null
);
CREATE TABLE Appointment(
    id int primary key auto_increment,
    date DATE,
    reason TEXT,
    patient_id int,
    foreign key(patient_id) references Patient(id),
    doctor_id int,
    foreign key(doctor_id) references Doctor(id)
);
CREATE TABLE DoctorSpecialisations(
    id int primary key auto_increment,
    specialisation_id int,
    foreign key(specialisation_id) references Specialisation(id),
    doctor_id int,
    foreign key(doctor_id) references Doctor(id)
);

INSERT INTO Patient(name, birthdate, gender, phone) 
VALUES ("Carlos Ray", "1988-03-15", "M", "555-0103");

INSERT INTO Doctor(name, email, phone) 
VALUES ("Sarah Connor", "sarah.com", 555-0203);

INSERT INTO Specialisation(specialisation) 
VALUES ("Cardiology");

INSERT INTO DoctorSpecialisations (specialisation_id, doctor_id)
VALUES (1,1);

INSERT INTO Appointment (date, reason, patient_id, doctor_id)
VALUES ("2023-01-01", "no reason", 1, 1),
("2025-01-02", "no reason as well", 1, 1);


-- 1
SELECT Patient.name, Appointment.date, Appointment.reason FROM Patient
LEFT JOIN Appointment ON Appointment.patient_id = Patient.id;

-- 2
SELECT Doctor.name FROM Doctor
LEFT JOIN DoctorSpecialisations on doctor_id = Doctor.id
LEFT JOIN Specialisation on specialisation_id = Specialisation.id
WHERE Specialisation.specialisation LIKE "Cardiology";

-- 3 
SELECT Doctor.name, COUNT(Appointment.id) FROM Doctor
LEFT JOIN Appointment on doctor_id = Doctor.id
GROUP BY Doctor.name;

-- 4
SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name FROM Appointment
LEFT JOIN Patient on patient_id = Patient.id
LEFT JOIN Doctor on doctor_id = Doctor.id
WHERE date > DATE(NOW())
ORDER BY Appointment.date ASC
LIMIT 5;

-- 5
DELETE FROM Appointment
WHERE date = DATE("2023-01-01");

SELECT * FROM Appointment;

-- 6
UPDATE Patient SET Patient.gender = "M" where Patient.name like "%kov%";
