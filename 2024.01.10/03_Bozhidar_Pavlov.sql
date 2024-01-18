drop database if exists hospital;
create database hospital;
use hospital;
set SQL_SAFE_UPDATES=0;

create table doctors (
	id serial primary key,
	name varchar(255) not null,
    email varchar(255) not null check (email like '%@%'),
    phone varchar(13) not null
);

create table specialisations (
	id serial primary key,
	specialisation varchar(255) not null
);

create table doctors_specialisations (
	id serial primary key,
    doctor_id bigint unsigned not null,
    specialisation_id bigint unsigned not null,
    unique (doctor_id, specialisation_id),
    foreign key (doctor_id) references doctors (id),
    foreign key (specialisation_id) references specialisations(id)
);

create table patients (
	id serial primary key,
    name varchar(255) not null,
    birthdate date not null,
    gender enum('M', 'F'),
    phone varchar(13) not null
);

create table appointments (
	id serial primary key,
    date datetime not null,
    reason text,
    doctor_id bigint unsigned not null,
    patient_id bigint unsigned not null,
    foreign key (doctor_id) references doctors(id),
    foreign key (patient_id) references patients(id)
);

insert into patients(name, birthdate, gender, phone)
values
	('Carlos Ray', '1988-03-15', 'M', '555-0103'),
    ('Diana Grace', '1992-07-24', 'F', '555-0104'),
    ('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
    ('Alice Johnson', '1990-05-21', 'F', '555-0101'),
    ('Bob Smith', '1985-08-30', 'M', '555-0102');

    
insert into doctors(name, email, phone)
values
    ('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
    ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
    ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
    ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
    ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

insert into specialisations(specialisation)
values
	('Orthopedics'),
    ('General Medicine'),
    ('Dermatology'),
    ('Pediatrics');

insert into doctors_specialisations(doctor_id, specialisation_id)
values
	(1, 4),
    (2, 3),
    (3, 1),
    (4, 2),
    (5, 2);
    
insert into appointments(patient_id, doctor_id, date, reason)
values
	(1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
	(2, 2, '2024-01-22 09:30', 'Initial Consultation'),
	(3, 3, '2024-01-25 16:00', 'Routine Checkup'),
	(4, 4, '2024-01-28 10:00', 'Vaccination'),
	(5, 5, '2024-01-30 11:00', 'Annual Physical Exam');

-- Find all appointments scheduled for a specific patient by name.
select patients.name, appointments.date, appointments.reason from appointments
left join patients on appointments.patient_id = patients.id
where patients.name = 'Carlos Ray';

-- List all doctors with a specific specialisation, such as 'Cardiology'
select d.name from doctors as d
left join doctors_specialisations as ds on ds.doctor_id = d.id
left join specialisations as s on ds.specialisation_id = s.id
where s.specialisation = 'Cardiology';

-- Count the number of appointments each doctor has
select doctors.name, count(appointments.id) from doctors
left join appointments on appointments.doctor_id = doctors.id
group by doctors.id;

-- Retrieve the details of the next 5 appointments scheduled in the clinic
select a.date, a.reason, p.name, d.name from appointments as a
left join patients as p on a.patient_id = p.id
left join doctors as d on a.doctor_id = d.id
where date > now()
order by date asc
limit 5;

-- Delete all appointments on 2023-01-01
delete from appointments
where date = '2023-01-01';

-- Change the gender to M for all patients with names ending in kov
update patients
set gender = 'M'
where name like '%kov';
