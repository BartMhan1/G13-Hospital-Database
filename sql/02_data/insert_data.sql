USE G13_hospital_db;


INSERT INTO G13_patients
    (first_name, last_name, date_of_birth, gender, phone_number, email, address, registration_date, blood_group, emergency_contact)
VALUES
    ('Joseph', 'Lartey Kojo', '2002-04-13', 'Male', '0241000001', '01245683b.lartey@g13hospital.com', 'Group member index 01245683B', '2026-07-01', 'O+', '0242000001'),
    ('Munkaila', 'Iddrisu', '1999-11-25', 'Male', '0241000002', '01246794b.iddrisu@g13hospital.com', 'Group member index 01246794B', '2026-07-02', 'A+', '0242000002'),
    ('Prince', 'Ayaata Awenanyame Kwame', '2001-03-31', 'Male', '0241000003', '01242653b.prince@g13hospital.com', 'Group member index 01242653B', '2026-07-03', 'B+', '0242000003'),
    ('Oheneba', 'Safo Kwasi', '2000-12-17', 'Male', '0241000004', '01244318b.safo@g13hospital.com', 'Group member index 01244318B', '2026-07-04', 'AB+', '0242000004'),
    ('David', 'Asemtia', '2002-06-21', 'Male', '0241000005', '01245005b.david@g13hospital.com', 'Group member index 01245005B', '2026-07-05', 'O-', '0242000005'),
    ('Gabriel', 'Fosu', '2001-01-30', 'Male', '0241000006', '01240873b.gabriel@g13hospital.com', 'Group member index 01240873B', '2026-07-06', 'A-', '0242000006'),
    ('Oswin', 'Agbanu', '2000-09-14', 'Male', '0241000007', '01246496b.oswin@g13hospital.com', 'Group member index 01246496B', '2026-07-07', 'B-', '0242000007'),
    ('Bartholomew', 'Boare', '2001-05-19', 'Male', '0241000008', '01244946b.boare@g13hospital.com', 'Group member index 01244946B', '2026-07-08', 'O+', '0242000008'),
    ('Adwoa', 'Nyarko', '2005-10-10', 'Female', '0241000009', 'adwoa.nyarko@g13hospital.com', 'Teshie, Accra', '2026-07-09', 'AB-', '0242000009'),
    ('Kwesi', 'Bonsu', '1979-08-04', 'Male', '0241000010', 'kwesi.bonsu@g13hospital.com', 'Spintex, Accra', '2026-07-10', 'A+', '0242000010'),
    ('Afia', 'Arthur', '1991-02-26', 'Female', '0241000011', 'afia.arthur@g13hospital.com', 'East Legon, Accra', '2026-07-11', 'O+', '0242000011'),
    ('Nana', 'Darko', '1986-07-12', 'Male', '0241000012', 'nana.darko@g13hospital.com', 'Kasoa, Central Region', '2026-07-12', 'B+', '0242000012'),
    ('Mansa', 'Amoako', '2001-03-31', 'Female', '0241000013', 'mansa.amoako@g13hospital.com', 'Ashaiman, Tema', '2026-07-13', 'A-', '0242000013'),
    ('Fiifi', 'Quartey', '1994-12-06', 'Male', '0241000014', 'fiifi.quartey@g13hospital.com', 'Sakumono, Tema', '2026-07-14', 'O-', '0242000014'),
    ('Yaa', 'Frimpong', '2008-05-22', 'Female', '0241000015', 'yaa.frimpong@g13hospital.com', 'North Kaneshie, Accra', '2026-07-15', 'AB+', '0242000015');


INSERT INTO G13_doctors
    (first_name, last_name, specialization, phone_number, email, license_number, years_experience)
VALUES
    ('Daniel', 'Amoah', 'Family Medicine', '0273000001', 'daniel.amoah@g13hospital.com', 'G13-MDC-001', 9),
    ('Priscilla', 'Tetteh', 'Cardiology', '0273000002', 'priscilla.tetteh@g13hospital.com', 'G13-MDC-002', 12),
    ('Michael', 'Osei', 'Pediatrics', '0273000003', 'michael.osei@g13hospital.com', 'G13-MDC-003', 7),
    ('Linda', 'Appiah', 'Orthopedics', '0273000004', 'linda.appiah@g13hospital.com', 'G13-MDC-004', 10),
    ('Samuel', 'Kumi', 'Internal Medicine', '0273000005', 'samuel.kumi@g13hospital.com', 'G13-MDC-005', 8),
    ('Rebecca', 'Ansah', 'Clinical Pathology', '0273000006', 'rebecca.ansah@g13hospital.com', 'G13-MDC-006', 6);

-- Insert exactly 20 appointments distributed across all doctors and patients.
INSERT INTO G13_appointments
    (patient_id, doctor_id, appointment_date, appointment_time, status, consultation_fee, appointment_type, reason_for_visit)
VALUES
    (1, 1, '2026-08-10', '09:00:00', 'Completed', 180.00, 'General Consultation', 'Fever and headache'),
    (2, 2, '2026-08-10', '10:00:00', 'Completed', 260.00, 'Specialist Review', 'Chest discomfort'),
    (3, 5, '2026-08-11', '08:30:00', 'Completed', 200.00, 'Follow-up', 'Diabetes review'),
    (4, 4, '2026-08-11', '11:30:00', 'Completed', 230.00, 'Specialist Review', 'Knee pain'),
    (5, 3, '2026-08-12', '09:30:00', 'Completed', 150.00, 'Pediatric Consultation', 'Child cough'),
    (6, 2, '2026-08-12', '13:00:00', 'Completed', 260.00, 'Follow-up', 'Blood pressure review'),
    (7, 1, '2026-08-13', '10:30:00', 'Completed', 180.00, 'General Consultation', 'Malaria symptoms'),
    (8, 4, '2026-08-13', '14:00:00', 'Completed', 230.00, 'Specialist Review', 'Back pain'),
    (9, 3, '2026-08-14', '08:00:00', 'Completed', 150.00, 'Pediatric Consultation', 'School health review'),
    (10, 6, '2026-08-14', '11:00:00', 'Completed', 170.00, 'Laboratory Review', 'Lab test review'),
    (11, 5, '2026-08-15', '09:00:00', 'Completed', 200.00, 'Follow-up', 'Migraine review'),
    (12, 1, '2026-08-15', '10:00:00', 'Completed', 180.00, 'General Consultation', 'Routine checkup'),
    (13, 2, '2026-08-16', '09:30:00', 'Scheduled', 260.00, 'Specialist Review', 'Heart palpitation'),
    (14, 6, '2026-08-16', '12:00:00', 'Scheduled', 170.00, 'Laboratory Review', 'Blood test consultation'),
    (15, 3, '2026-08-17', '13:30:00', 'Scheduled', 150.00, 'Pediatric Consultation', 'Pediatric review'),
    (1, 5, '2026-08-18', '08:45:00', 'Scheduled', 200.00, 'Follow-up', 'Follow-up check'),
    (2, 4, '2026-08-18', '15:00:00', 'Scheduled', 230.00, 'Specialist Review', 'Shoulder injury'),
    (3, 2, '2026-08-19', '09:15:00', 'Cancelled', 260.00, 'Specialist Review', 'Cardiology follow-up'),
    (4, 1, '2026-08-19', '12:30:00', 'No Show', 180.00, 'General Consultation', 'General review'),
    (5, 6, '2026-08-20', '10:45:00', 'Scheduled', 170.00, 'Laboratory Review', 'Laboratory report explanation');


INSERT INTO G13_treatments
    (appointment_id, treatment_name, treatment_description, treatment_date, treatment_status, follow_up_required)
VALUES
    (1, 'Antimalarial Therapy', 'Rapid malaria test was positive and medication was prescribed.', '2026-08-10', 'Completed', TRUE),
    (2, 'ECG Review', 'ECG requested after patient complained of chest discomfort.', '2026-08-10', 'Completed', TRUE),
    (3, 'Diabetes Management', 'Blood sugar record reviewed and medication adherence discussed.', '2026-08-11', 'Completed', TRUE),
    (4, 'Joint Pain Management', 'Knee examined and physiotherapy advice given.', '2026-08-11', 'Completed', TRUE),
    (5, 'Respiratory Care', 'Cough assessed and cold medication prescribed.', '2026-08-12', 'Completed', FALSE),
    (6, 'Hypertension Review', 'Blood pressure checked and lifestyle advice provided.', '2026-08-12', 'Completed', TRUE),
    (7, 'Malaria Treatment', 'Symptoms matched malaria and antimalarial medication was issued.', '2026-08-13', 'Completed', FALSE),
    (8, 'Back Pain Therapy', 'Lower back strain diagnosed and pain relief recommended.', '2026-08-13', 'Completed', TRUE),
    (9, 'School Medical Screening', 'Routine examination completed with no serious issue found.', '2026-08-14', 'Completed', FALSE),
    (10, 'Laboratory Interpretation', 'Low hemoglobin level explained to patient.', '2026-08-14', 'Completed', TRUE),
    (11, 'Migraine Management', 'Migraine triggers discussed and pain control plan given.', '2026-08-15', 'Completed', TRUE),
    (12, 'Preventive Health Check', 'Vital signs were stable and preventive advice was given.', '2026-08-15', 'Completed', FALSE);


INSERT INTO G13_medications
    (medication_name, description, price, stock_quantity, manufacturer, expiry_date)
VALUES
    ('Paracetamol 500mg', 'Pain and fever relief tablet', 1.50, 500, 'Ernest Chemists', '2027-09-30'),
    ('Artemether Lumefantrine', 'Antimalarial tablet course', 35.00, 120, 'Danadams Pharmaceuticals', '2027-04-30'),
    ('Amoxicillin 500mg', 'Antibiotic capsule', 3.20, 300, 'Pharmanova Ghana', '2027-01-31'),
    ('Amlodipine 5mg', 'Blood pressure control tablet', 2.75, 220, 'Kama Health Services', '2028-02-28'),
    ('Metformin 500mg', 'Diabetes control tablet', 2.10, 250, 'Entrance Pharmaceuticals', '2028-03-31'),
    ('Ibuprofen 400mg', 'Anti-inflammatory pain tablet', 2.00, 200, 'Ernest Chemists', '2027-11-30'),
    ('Salbutamol Inhaler', 'Asthma relief inhaler', 45.00, 80, 'GlaxoSmithKline', '2027-06-30'),
    ('Ferrous Sulphate', 'Iron supplement tablet', 1.80, 260, 'Pharmanova Ghana', '2028-01-31'),
    ('Cetirizine 10mg', 'Allergy relief tablet', 1.60, 180, 'Kama Health Services', '2027-10-31'),
    ('Omeprazole 20mg', 'Acid reflux capsule', 2.50, 210, 'Entrance Pharmaceuticals', '2027-12-31');

-- Extra data for the remaining tables in the actual G13 schema.
INSERT INTO G13_prescriptions
    (appointment_id, medication_id, dosage, frequency, start_date, end_date, instructions, quantity_prescribed)
VALUES
    (1, 2, '4 tablets', 'Twice daily', '2026-08-10', '2026-08-12', 'Take after meals and complete full dose.', 24),
    (1, 1, '1 tablet', 'Three times daily', '2026-08-10', '2026-08-12', 'Take only when feverish.', 9),
    (3, 5, '1 tablet', 'Twice daily', '2026-08-11', '2026-09-10', 'Take with meals.', 60),
    (4, 6, '1 tablet', 'Twice daily', '2026-08-11', '2026-08-15', 'Take after meals.', 10),
    (5, 9, '1 tablet', 'Once daily', '2026-08-12', '2026-08-16', 'Take at night.', 5),
    (6, 4, '1 tablet', 'Once daily', '2026-08-12', '2026-09-10', 'Take every morning.', 30),
    (7, 2, '4 tablets', 'Twice daily', '2026-08-13', '2026-08-15', 'Complete the course.', 24),
    (8, 6, '1 tablet', 'Twice daily', '2026-08-13', '2026-08-17', 'Avoid taking on an empty stomach.', 10),
    (10, 8, '1 tablet', 'Once daily', '2026-08-14', '2026-09-12', 'Take after lunch.', 30),
    (11, 1, '1 tablet', 'When needed', '2026-08-15', '2026-08-21', 'Use when headache starts.', 14),
    (12, 10, '1 capsule', 'Once daily', '2026-08-15', '2026-08-21', 'Take before breakfast if needed.', 7),
    (2, 1, '1 tablet', 'When needed', '2026-08-10', '2026-08-13', 'Use for mild chest discomfort only after review.', 6);

INSERT INTO G13_payments
    (patient_id, appointment_id, amount, payment_date, payment_method, payment_status, transaction_reference, insurance_covered_amount)
VALUES
    (1, 1, 180.00, '2026-08-10', 'NHIS', 'Paid', 'G13-PAY-0001', 120.00),
    (2, 2, 260.00, '2026-08-10', 'Mobile Money', 'Paid', 'G13-PAY-0002', 0.00),
    (3, 3, 200.00, '2026-08-11', 'Insurance', 'Paid', 'G13-PAY-0003', 150.00),
    (4, 4, 230.00, '2026-08-11', 'Card', 'Paid', 'G13-PAY-0004', 0.00),
    (5, 5, 150.00, '2026-08-12', 'NHIS', 'Paid', 'G13-PAY-0005', 100.00),
    (6, 6, 260.00, '2026-08-12', 'Insurance', 'Paid', 'G13-PAY-0006', 180.00),
    (7, 7, 180.00, '2026-08-13', 'Cash', 'Paid', 'G13-PAY-0007', 0.00),
    (8, 8, 230.00, '2026-08-13', 'Mobile Money', 'Paid', 'G13-PAY-0008', 0.00),
    (9, 9, 150.00, '2026-08-14', 'NHIS', 'Paid', 'G13-PAY-0009', 90.00),
    (10, 10, 170.00, '2026-08-14', 'Cash', 'Paid', 'G13-PAY-0010', 0.00),
    (11, 11, 200.00, '2026-08-15', 'Mobile Money', 'Paid', 'G13-PAY-0011', 0.00),
    (12, 12, 180.00, '2026-08-15', 'NHIS', 'Paid', 'G13-PAY-0012', 120.00),
    (13, 13, 260.00, '2026-08-16', 'Insurance', 'Pending', 'G13-PAY-0013', 180.00),
    (14, 14, 170.00, '2026-08-16', 'Cash', 'Pending', 'G13-PAY-0014', 0.00),
    (15, 15, 150.00, '2026-08-17', 'NHIS', 'Pending', 'G13-PAY-0015', 100.00);

INSERT INTO G13_admissions
    (patient_id, room_number, bed_number, admission_date, discharge_date, admission_status, room_type, daily_rate)
VALUES
    (4, 'WARD-A1', 'BED-01', '2026-08-11', '2026-08-14', 'Discharged', 'General Ward', 120.00),
    (6, 'WARD-B1', 'BED-03', '2026-08-12', NULL, 'Admitted', 'Cardiac Ward', 180.00),
    (8, 'WARD-C1', 'BED-02', '2026-08-13', '2026-08-15', 'Discharged', 'Orthopedic Ward', 160.00),
    (10, 'WARD-A2', 'BED-04', '2026-08-14', NULL, 'Admitted', 'General Ward', 120.00),
    (13, 'WARD-B2', 'BED-05', '2026-08-16', NULL, 'Admitted', 'Cardiac Ward', 180.00);
