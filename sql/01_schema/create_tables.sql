CREATE DATABASE G13_hospital_db;
USE G13_hospital_db;
SELECT DATABASE();

CREATE TABLE G13_patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(255),
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    blood_group VARCHAR(5),
    emergency_contact VARCHAR(20)
);
DESCRIBE G13_patients;

CREATE TABLE G13_doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    years_experience INT NOT NULL,
    
    CHECK (years_experience >= 0)
);
DESCRIBE G13_doctors;

CREATE TABLE G13_appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    consultation_fee DECIMAL(10,2) NOT NULL,
    appointment_type VARCHAR(50) NOT NULL,
    reason_for_visit VARCHAR(255),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (patient_id)
        REFERENCES G13_patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES G13_doctors(doctor_id),

    CHECK (consultation_fee >= 0)
);
DESCRIBE G13_appointments;

CREATE TABLE G13_treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    treatment_name VARCHAR(100) NOT NULL,
    treatment_description VARCHAR(255),
    treatment_date DATE NOT NULL,
    treatment_status VARCHAR(30) NOT NULL,
    follow_up_required BOOLEAN NOT NULL DEFAULT FALSE,

    FOREIGN KEY (appointment_id)
        REFERENCES G13_appointments(appointment_id)
);
 DESCRIBE G13_treatments;
 
 CREATE TABLE G13_medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    medication_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    manufacturer VARCHAR(100) NOT NULL,
    expiry_date DATE NOT NULL,

    CHECK (price >= 0),
    CHECK (stock_quantity >= 0)
);
DESCRIBE G13_medications;

CREATE TABLE G13_prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    medication_id INT NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    instructions VARCHAR(255),
    quantity_prescribed INT NOT NULL,

    FOREIGN KEY (appointment_id)
        REFERENCES G13_appointments(appointment_id),

    FOREIGN KEY (medication_id)
        REFERENCES G13_medications(medication_id),

    CHECK (quantity_prescribed > 0),
    CHECK (end_date IS NULL OR end_date >= start_date)
);
DESCRIBE G13_prescriptions;

CREATE TABLE G13_payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    transaction_reference VARCHAR(100) UNIQUE,
    insurance_covered_amount DECIMAL(10,2) DEFAULT 0.00,

    FOREIGN KEY (patient_id)
        REFERENCES G13_patients(patient_id),

    FOREIGN KEY (appointment_id)
        REFERENCES G13_appointments(appointment_id),

    CHECK (amount >= 0),
    CHECK (insurance_covered_amount >= 0)
);
DESCRIBE G13_payments;

CREATE TABLE G13_admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    bed_number VARCHAR(20) NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE,
    admission_status VARCHAR(20) NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    daily_rate DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (patient_id)
        REFERENCES G13_patients(patient_id),

    CHECK (daily_rate >= 0),
    CHECK (
        discharge_date IS NULL
        OR discharge_date >= admission_date
    )
);
DESCRIBE G13_admissions;

CREATE TABLE IF NOT EXISTS G13_doctor_user_map (
    mysql_username VARCHAR(100) PRIMARY KEY,
    doctor_id INT NOT NULL,

    FOREIGN KEY (doctor_id)
        REFERENCES G13_doctors(doctor_id)
);
DESCRIBE G13_doctor_user_map;

SHOW TABLES;