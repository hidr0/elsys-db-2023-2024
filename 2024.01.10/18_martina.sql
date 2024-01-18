drop database if exists Doctors;
create database Doctors;
use Doctors;

create table Doctor(
	id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null check(email like "%@%"),
    phone varchar(15) not null
);

insert into Doctor(name, email, phone) values("Dr. Sarah Connor", "sarah.connor@clinic.com", "555-0203");
insert into Doctor(name, email, phone) values("Dr. Lucy Liu", "lucy.liu@clinic.com", "555-0204");
insert into Doctor(name, email, phone) values("Dr. Omar Sharif", "omar.sharif@clinic.com", "555-0205");
insert into Doctor(name, email, phone) values("Dr. Emily White", "emily.white@clinic.com", "555-0201");
insert into Doctor(name, email, phone) values("Dr. John Davis", "john.davis@clinic.com", "555-0202");

create table Specializations(
	id int primary key auto_increment,
    specialization varchar(50) not null
);

insert into Specializations(specialization) values("Orthopedics");
insert into Specializations(specialization) values("General Medicine");
insert into Specializations(specialization) values("Dermatology");
insert into Specializations(specialization) values("Pediatrics");

create table DoctorSpecializations(
	id int primary key auto_increment,
    doctor_id int not null,
    spec_id int not null,
    foreign key (doctor_id) references Doctor(id),
    foreign key (spec_id) references Specializations(id)
);

insert into DoctorSpecializations(doctor_id, spec_id) values(1, 4);
insert into DoctorSpecializations(doctor_id, spec_id) values(2, 3);
insert into DoctorSpecializations(doctor_id, spec_id) values(2, 4);
insert into DoctorSpecializations(doctor_id, spec_id) values(3, 1);
insert into DoctorSpecializations(doctor_id, spec_id) values(4, 2);
insert into DoctorSpecializations(doctor_id, spec_id) values(5, 2);
insert into DoctorSpecializations(doctor_id, spec_id) values(5, 1);

create table Patient(
	id int primary key auto_increment,
    name varchar(100) not null,
    birthdate date not null,
    gender enum("M","F"),
    phone varchar(15) not null
);

insert into Patient(name, birthdate, gender, phone) values("Carlos Ray", "1988-03-15", "M", "555-0103");
insert into Patient(name, birthdate, gender, phone) values("Diana Grace", "1992-07-24", "F", "555-0104");
insert into Patient(name, birthdate, gender, phone) values("Ethan Hunt", "1979-11-02", "M", "555-0105");
insert into Patient(name, birthdate, gender, phone) values("Alice Johnson", "1990-05-21", "F", "555-0101");
insert into Patient(name, birthdate, gender, phone) values("Bob Smith", "1985-08-30", "M", "555-0102");

create table Appointment(
	id int primary key auto_increment,
    date date not null,
    reason varchar(200),
    doctor_id int not null,
    patient_id int not null,
    foreign key (doctor_id) references Doctor(id),
    foreign key (patient_id) references Patient(id)
);

insert into Appointment(patient_id, doctor_id, date, reason) values(1, 1, "2024-01-20", "Follow-up visit");
insert into Appointment(patient_id, doctor_id, date, reason) values(2, 2, "2024-01-22", "Initial Consultation");
insert into Appointment(patient_id, doctor_id, date, reason) values(3, 3, "2024-01-25", "Routine Checkup");
insert into Appointment(patient_id, doctor_id, date, reason) values(4, 4, "2024-01-28", "Vaccination");
insert into Appointment(patient_id, doctor_id, date, reason) values(5, 5, "2024-01-30", "Annual Physical Exam");
insert into Appointment(patient_id, doctor_id, date, reason) values(3, 5, "2024-01-23", "Prescription");
insert into Appointment(patient_id, doctor_id, date, reason) values(2, 4, "2024-02-01", "Chekup on my kid");

-- query 1
select P.name, A.date, A.reason from Patient as P
left join Appointment as A on A.patient_id = P.id
where P.name like "Alice Johnson";

-- query 2 
select D.name from DoctorSpecializations as DS
left join Doctor as D on DS.doctor_id = D.id
where DS.spec_id = 2;

-- query 3
select D.name, count(A.doctor_id) from Appointment as A 
left join Doctor as D on A.doctor_id = D.id group by D.id;

-- query 4
select A.date, A.reason, P.name, D.name from Appointment as A
left join Patient as P on A.patient_id = P.id 
left join Doctor as D on A.doctor_id = D.id
where A.date < "2024-01-23";

-- query 5
delete from Appointment as A where A.date = "2024-01-20";

-- query 6
update Patient set gender = "M" where name like "%kov%";