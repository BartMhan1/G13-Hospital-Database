USE G13_hospital_db;


/* =========================================================
   PATIENTS
   Exactly 15 patient records
   ========================================================= */

INSERT INTO G13_patients
    (
        first_name,
        last_name,
        date_of_birth,
        gender,
        phone_number,
        email,
        address,
        registration_date,
        blood_group,
        emergency_contact
    )
VALUES
    (
        'Joseph',
        'Lartey Kojo',
        '2002-04-13',
        'Male',
        '0241000001',
        '01245683b.lartey@gmail.com',
        'House 12, Nii Sai Road, East Legon, Accra',
        '2026-07-01',
        'O+',
        '0242000001'
    ),

    (
        'Munkaila',
        'Iddrisu',
        '1999-11-25',
        'Male',
        '0241000002',
        '01246794b.iddrisu@gmail.com',
        'Plot 8, La Bawaleshie Road, East Legon, Accra',
        '2026-07-02',
        'A+',
        '0242000002'
    ),

    (
        'Prince',
        'Ayaata Awenanyame Kwame',
        '2001-03-31',
        'Male',
        '0241000003',
        '01242653b.prince@gmail.com',
        'House 21, Mensah Wood Avenue, Adenta, Accra',
        '2026-07-03',
        'B+',
        '0242000003'
    ),

    (
        'Oheneba',
        'Safo Kwasi',
        '2000-12-17',
        'Male',
        '0241000004',
        '01244318b.safo@gmail.com',
        'No. 5, Kanda Highway, Kanda, Accra',
        '2026-07-04',
        'AB+',
        '0242000004'
    ),

    (
        'David',
        'Asemtia',
        '2002-06-21',
        'Male',
        '0241000005',
        '01245005b.david@gmail.com',
        'House 14, Dansoman High Street, Dansoman, Accra',
        '2026-07-05',
        'O-',
        '0242000005'
    ),

    (
        'Gabriel',
        'Fosu',
        '2001-01-30',
        'Male',
        '0241000006',
        '01240873b.gabriel@gmail.com',
        'Plot 32, Spintex Road, Baatsona, Accra',
        '2026-07-06',
        'A-',
        '0242000006'
    ),

    (
        'Oswin',
        'Agbanu',
        '2000-09-14',
        'Male',
        '0241000007',
        '01246496b.oswin@gmail.com',
        'House 9, Osu Oxford Street, Osu, Accra',
        '2026-07-07',
        'B-',
        '0242000007'
    ),

    (
        'Bartholomew',
        'Boare',
        '2001-05-19',
        'Male',
        '0241000008',
        '01244946b.boare@gmail.com',
        'No. 18, Ringway Crescent, Osu, Accra',
        '2026-07-08',
        'O+',
        '0242000008'
    ),

    (
        'Adwoa',
        'Nyarko',
        '2015-10-10',
        'Female',
        '0241000009',
        'adwoa.nyarko@gmail.com',
        'House 6, Teshie Nungua Estate, Teshie, Accra',
        '2026-07-09',
        'AB-',
        '0242000009'
    ),

    (
        'Kwesi',
        'Bonsu',
        '1979-08-04',
        'Male',
        '0241000010',
        'kwesi.bonsu@gmail.com',
        'Plot 45, Community 18 Road, Spintex, Accra',
        '2026-07-10',
        'A+',
        '0242000010'
    ),

    (
        'Afia',
        'Arthur',
        '1991-02-26',
        'Female',
        '0241000011',
        'afia.arthur@gmail.com',
        'House 27, Lagos Avenue, East Legon, Accra',
        '2026-07-11',
        'O+',
        '0242000011'
    ),

    (
        'Nana',
        'Darko',
        '1986-07-12',
        'Male',
        '0241000012',
        'nana.darko@gmail.com',
        'No. 11, Ashaley Botwe School Junction, Accra',
        '2026-07-12',
        'B+',
        '0242000012'
    ),

    (
        'Mansa',
        'Amoako',
        '2001-03-31',
        'Female',
        '0241000013',
        'mansa.amoako@gmail.com',
        'Plot 3, Ashaiman Lebanon Zone, Accra',
        '2026-07-13',
        'A-',
        '0242000013'
    ),

    (
        'Fiifi',
        'Quartey',
        '1994-12-06',
        'Male',
        '0241000014',
        'fiifi.quartey@gmail.com',
        'House 17, Sakumono Estate Road, Accra',
        '2026-07-14',
        'O-',
        '0242000014'
    ),

    (
        'Adwoa',
        'Nyarko',
        '2015-10-10',
        'Female',
        '0241000009',
        'adwoa.nyarko.duplicate@gmail.com',
        'House 10, Trade Fair Road, La, Accra',
        '2026-07-15',
        'AB-',
        '0242000015'
    );


/* =========================================================
   DOCTORS
   Exactly 6 doctors with different specializations
   ========================================================= */

INSERT INTO G13_doctors
    (
        first_name,
        last_name,
        specialization,
        phone_number,
        email,
        license_number,
        years_experience
    )
VALUES
    (
        'Daniel',
        'Amoah',
        'Family Medicine',
        '0273000001',
        'daniel.amoah@gmail.com',
        'G13-MDC-001',
        9
    ),

    (
        'Priscilla',
        'Tetteh',
        'Cardiology',
        '0273000002',
        'priscilla.tetteh@gmail.com',
        'G13-MDC-002',
        12
    ),

    (
        'Michael',
        'Osei',
        'Pediatrics',
        '0273000003',
        'michael.osei@gmail.com',
        'G13-MDC-003',
        7
    ),

    (
        'Linda',
        'Appiah',
        'Orthopedics',
        '0273000004',
        'linda.appiah@gmail.com',
        'G13-MDC-004',
        10
    ),

    (
        'Samuel',
        'Kumi',
        'Internal Medicine',
        '0273000005',
        'samuel.kumi@gmail.com',
        'G13-MDC-005',
        8
    ),

    (
        'Rebecca',
        'Ansah',
        'Clinical Pathology',
        '0273000006',
        'rebecca.ansah@gmail.com',
        'G13-MDC-006',
        6
    );
    


/* =========================================================
   APPOINTMENTS
   Exactly 20 appointments distributed across doctors
   and all 15 patient records
   ========================================================= */

INSERT INTO G13_appointments
    (
        patient_id,
        doctor_id,
        appointment_date,
        appointment_time,
        status,
        consultation_fee,
        appointment_type,
        reason_for_visit
    )
VALUES
    (
        1,
        1,
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        '09:00:00',
        'Completed',
        180.00,
        'General Consultation',
        'Fever and headache'
    ),

    (
        2,
        2,
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        '10:00:00',
        'Completed',
        260.00,
        'Specialist Review',
        'Chest discomfort'
    ),

    (
        3,
        5,
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        '08:30:00',
        'Completed',
        200.00,
        'Follow-up',
        'Diabetes review'
    ),

    (
        4,
        4,
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        '11:30:00',
        'Completed',
        230.00,
        'Specialist Review',
        'Knee pain'
    ),

    (
        9,
        3,
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        '09:30:00',
        'Completed',
        150.00,
        'Pediatric Consultation',
        'Child cough'
    ),

    (
        6,
        2,
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        '13:00:00',
        'Completed',
        260.00,
        'Follow-up',
        'Blood pressure review'
    ),

    (
        7,
        1,
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        '10:30:00',
        'Completed',
        180.00,
        'General Consultation',
        'Malaria symptoms'
    ),

    (
        8,
        4,
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        '14:00:00',
        'Completed',
        230.00,
        'Specialist Review',
        'Back pain'
    ),

    (
        9,
        3,
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        '08:00:00',
        'Completed',
        150.00,
        'Pediatric Consultation',
        'School health review'
    ),

    (
        10,
        6,
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        '11:00:00',
        'Completed',
        170.00,
        'Laboratory Review',
        'Lab test review'
    ),

    (
        11,
        5,
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        '09:00:00',
        'Completed',
        200.00,
        'Follow-up',
        'Migraine review'
    ),

    (
        12,
        1,
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        '10:00:00',
        'Completed',
        180.00,
        'General Consultation',
        'Routine checkup'
    ),

    (
        13,
        2,
        CURDATE(),
        '09:30:00',
        'Scheduled',
        260.00,
        'Specialist Review',
        'Heart palpitation'
    ),

    (
        14,
        6,
        CURDATE(),
        '12:00:00',
        'Scheduled',
        170.00,
        'Laboratory Review',
        'Blood test consultation'
    ),

    (
        15,
        3,
        DATE_ADD(CURDATE(), INTERVAL 1 DAY),
        '13:30:00',
        'Scheduled',
        150.00,
        'Pediatric Consultation',
        'Pediatric review'
    ),

    (
        1,
        5,
        DATE_ADD(CURDATE(), INTERVAL 2 DAY),
        '08:45:00',
        'Scheduled',
        200.00,
        'Follow-up',
        'Follow-up check'
    ),

    (
        2,
        4,
        DATE_ADD(CURDATE(), INTERVAL 2 DAY),
        '15:00:00',
        'Scheduled',
        230.00,
        'Specialist Review',
        'Shoulder injury'
    ),

    (
        3,
        2,
        DATE_ADD(CURDATE(), INTERVAL 3 DAY),
        '09:15:00',
        'Cancelled',
        260.00,
        'Specialist Review',
        'Cardiology follow-up'
    ),

    (
        4,
        1,
        DATE_ADD(CURDATE(), INTERVAL 3 DAY),
        '12:30:00',
        'No Show',
        180.00,
        'General Consultation',
        'General review'
    ),

    (
        5,
        6,
        DATE_ADD(CURDATE(), INTERVAL 4 DAY),
        '10:45:00',
        'Scheduled',
        170.00,
        'Laboratory Review',
        'Laboratory report explanation'
    );


/* =========================================================
   TREATMENTS
   Exactly 12 treatments linked to appointments
   ========================================================= */

INSERT INTO G13_treatments
    (
        appointment_id,
        treatment_name,
        treatment_description,
        treatment_date,
        treatment_status,
        follow_up_required
    )
VALUES
    (
        1,
        'Antimalarial Therapy',
        'Rapid malaria test was positive and medication was prescribed.',
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        'Completed',
        TRUE
    ),

    (
        2,
        'ECG Review',
        'ECG requested after patient complained of chest discomfort.',
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        'Completed',
        TRUE
    ),

    (
        3,
        'Diabetes Management',
        'Blood sugar record reviewed and medication adherence discussed.',
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        'Completed',
        TRUE
    ),

    (
        4,
        'Joint Pain Management',
        'Knee examined and physiotherapy advice given.',
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        'Completed',
        TRUE
    ),

    (
        5,
        'Respiratory Care',
        'Cough assessed and cold medication prescribed.',
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        'Completed',
        FALSE
    ),

    (
        6,
        'Hypertension Review',
        'Blood pressure checked and lifestyle advice provided.',
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        'Completed',
        TRUE
    ),

    (
        7,
        'Malaria Treatment',
        'Symptoms matched malaria and antimalarial medication was issued.',
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        'Completed',
        FALSE
    ),

    (
        8,
        'Back Pain Therapy',
        'Lower back strain diagnosed and pain relief recommended.',
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        'Completed',
        TRUE
    ),

    (
        9,
        'School Medical Screening',
        'Routine examination completed with no serious issue found.',
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        'Completed',
        FALSE
    ),

    (
        10,
        'Laboratory Interpretation',
        'Low hemoglobin level explained to patient.',
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        'Completed',
        TRUE
    ),

    (
        11,
        'Migraine Management',
        'Migraine triggers discussed and pain control plan given.',
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'Completed',
        TRUE
    ),

    (
        12,
        'Preventive Health Check',
        'Vital signs were stable and preventive advice was given.',
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'Completed',
        FALSE
    );


/* =========================================================
   MEDICATIONS
   Exactly 10 medications
   ========================================================= */

INSERT INTO G13_medications
    (
        medication_name,
        description,
        price,
        stock_quantity,
        manufacturer,
        expiry_date
    )
VALUES
    (
        'Paracetamol 500mg',
        'Pain and fever relief tablet',
        1.50,
        500,
        'Ernest Chemists',
        '2027-09-30'
    ),

    (
        'Artemether Lumefantrine',
        'Antimalarial tablet course',
        35.00,
        120,
        'Danadams Pharmaceuticals',
        '2027-04-30'
    ),

    (
        'Amoxicillin 500mg',
        'Antibiotic capsule',
        3.20,
        300,
        'Pharmanova Ghana',
        '2027-01-31'
    ),

    (
        'Amlodipine 5mg',
        'Blood pressure control tablet',
        2.75,
        220,
        'Kama Health Services',
        '2028-02-28'
    ),

    (
        'Metformin 500mg',
        'Diabetes control tablet',
        2.10,
        250,
        'Entrance Pharmaceuticals',
        '2028-03-31'
    ),

    (
        'Ibuprofen 400mg',
        'Anti-inflammatory pain tablet',
        2.00,
        200,
        'Ernest Chemists',
        '2027-11-30'
    ),

    (
        'Salbutamol Inhaler',
        'Asthma relief inhaler',
        45.00,
        80,
        'GlaxoSmithKline',
        '2027-06-30'
    ),

    (
        'Ferrous Sulphate',
        'Iron supplement tablet',
        1.80,
        260,
        'Pharmanova Ghana',
        '2028-01-31'
    ),

    (
        'Cetirizine 10mg',
        'Allergy relief tablet',
        1.60,
        180,
        'Kama Health Services',
        '2027-10-31'
    ),

    (
        'Omeprazole 20mg',
        'Acid reflux capsule',
        2.50,
        210,
        'Entrance Pharmaceuticals',
        '2027-12-31'
    );


/* =========================================================
   PRESCRIPTIONS
   ========================================================= */

INSERT INTO G13_prescriptions
    (
        appointment_id,
        medication_id,
        dosage,
        frequency,
        start_date,
        end_date,
        instructions,
        quantity_prescribed
    )
VALUES
    (
        1,
        2,
        '4 tablets',
        'Twice daily',
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        'Take after meals and complete full dose.',
        24
    ),

    (
        1,
        1,
        '1 tablet',
        'Three times daily',
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        'Take only when feverish.',
        9
    ),

    (
        3,
        5,
        '1 tablet',
        'Twice daily',
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        DATE_ADD(CURDATE(), INTERVAL 25 DAY),
        'Take with meals.',
        60
    ),

    (
        4,
        6,
        '1 tablet',
        'Twice daily',
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'Take after meals.',
        10
    ),

    (
        5,
        9,
        '1 tablet',
        'Once daily',
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        CURDATE(),
        'Take at night.',
        5
    ),

    (
        6,
        4,
        '1 tablet',
        'Once daily',
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        DATE_ADD(CURDATE(), INTERVAL 25 DAY),
        'Take every morning.',
        30
    ),

    (
        7,
        2,
        '4 tablets',
        'Twice daily',
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'Complete the course.',
        24
    ),

    (
        8,
        6,
        '1 tablet',
        'Twice daily',
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        DATE_ADD(CURDATE(), INTERVAL 1 DAY),
        'Avoid taking on an empty stomach.',
        10
    ),

    (
        10,
        8,
        '1 tablet',
        'Once daily',
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        DATE_ADD(CURDATE(), INTERVAL 28 DAY),
        'Take after lunch.',
        30
    ),

    (
        11,
        1,
        '1 tablet',
        'When needed',
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        DATE_ADD(CURDATE(), INTERVAL 5 DAY),
        'Use when headache starts.',
        14
    ),

    (
        12,
        10,
        '1 capsule',
        'Once daily',
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        DATE_ADD(CURDATE(), INTERVAL 5 DAY),
        'Take before breakfast if needed.',
        7
    ),

    (
        2,
        1,
        '1 tablet',
        'When needed',
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        'Use for mild chest discomfort only after review.',
        6
    );


/* =========================================================
   PAYMENTS
   ========================================================= */

INSERT INTO G13_payments
    (
        patient_id,
        appointment_id,
        amount,
        payment_date,
        payment_method,
        payment_status,
        transaction_reference,
        insurance_covered_amount
    )
VALUES
    (
        1,
        1,
        180.00,
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        'NHIS',
        'Paid',
        'G13-PAY-0001',
        120.00
    ),

    (
        2,
        2,
        260.00,
        DATE_SUB(CURDATE(), INTERVAL 6 DAY),
        'Mobile Money',
        'Paid',
        'G13-PAY-0002',
        0.00
    ),

    (
        3,
        3,
        200.00,
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        'Insurance',
        'Paid',
        'G13-PAY-0003',
        150.00
    ),

    (
        4,
        4,
        230.00,
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        'Card',
        'Paid',
        'G13-PAY-0004',
        0.00
    ),

    (
        9,
        5,
        150.00,
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        'NHIS',
        'Paid',
        'G13-PAY-0005',
        100.00
    ),

    (
        6,
        6,
        260.00,
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        'Insurance',
        'Paid',
        'G13-PAY-0006',
        180.00
    ),

    (
        7,
        7,
        180.00,
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        'Cash',
        'Paid',
        'G13-PAY-0007',
        0.00
    ),

    (
        8,
        8,
        230.00,
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        'Mobile Money',
        'Paid',
        'G13-PAY-0008',
        0.00
    ),

    (
        9,
        9,
        150.00,
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        'NHIS',
        'Paid',
        'G13-PAY-0009',
        90.00
    ),

    (
        10,
        10,
        170.00,
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        'Cash',
        'Paid',
        'G13-PAY-0010',
        0.00
    ),

    (
        11,
        11,
        200.00,
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'Mobile Money',
        'Paid',
        'G13-PAY-0011',
        0.00
    ),

    (
        12,
        12,
        180.00,
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'NHIS',
        'Paid',
        'G13-PAY-0012',
        120.00
    ),

    (
        13,
        13,
        260.00,
        CURDATE(),
        'Insurance',
        'Pending',
        'G13-PAY-0013',
        180.00
    ),

    (
        14,
        14,
        170.00,
        CURDATE(),
        'Cash',
        'Pending',
        'G13-PAY-0014',
        0.00
    ),

    (
        15,
        15,
        150.00,
        DATE_ADD(CURDATE(), INTERVAL 1 DAY),
        'NHIS',
        'Pending',
        'G13-PAY-0015',
        100.00
    ),

    (
        1,
        16,
        200.00,
        DATE_ADD(CURDATE(), INTERVAL 2 DAY),
        'Mobile Money',
        'Pending',
        'G13-PAY-0016',
        0.00
    ),

    (
        2,
        17,
        230.00,
        DATE_ADD(CURDATE(), INTERVAL 2 DAY),
        'Card',
        'Pending',
        'G13-PAY-0017',
        0.00
    ),

    (
        3,
        18,
        0.00,
        DATE_ADD(CURDATE(), INTERVAL 3 DAY),
        'Insurance',
        'Cancelled',
        'G13-PAY-0018',
        0.00
    ),

    (
        4,
        19,
        0.00,
        DATE_ADD(CURDATE(), INTERVAL 3 DAY),
        'Cash',
        'Waived',
        'G13-PAY-0019',
        0.00
    ),

    (
        5,
        20,
        170.00,
        DATE_ADD(CURDATE(), INTERVAL 4 DAY),
        'Mobile Money',
        'Pending',
        'G13-PAY-0020',
        0.00
    );


/* =========================================================
   ADMISSIONS
   ========================================================= */

INSERT INTO G13_admissions
    (
        patient_id,
        room_number,
        bed_number,
        admission_date,
        discharge_date,
        admission_status,
        room_type,
        daily_rate
    )
VALUES
    (
        4,
        'WARD-A1',
        'BED-01',
        DATE_SUB(CURDATE(), INTERVAL 5 DAY),
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        'Discharged',
        'General Ward',
        120.00
    ),

    (
        6,
        'WARD-B1',
        'BED-03',
        DATE_SUB(CURDATE(), INTERVAL 4 DAY),
        NULL,
        'Admitted',
        'Cardiac Ward',
        180.00
    ),

    (
        8,
        'WARD-C1',
        'BED-02',
        DATE_SUB(CURDATE(), INTERVAL 3 DAY),
        DATE_SUB(CURDATE(), INTERVAL 1 DAY),
        'Discharged',
        'Orthopedic Ward',
        160.00
    ),

    (
        10,
        'WARD-A2',
        'BED-04',
        DATE_SUB(CURDATE(), INTERVAL 2 DAY),
        NULL,
        'Admitted',
        'General Ward',
        120.00
    ),

    (
        13,
        'WARD-B2',
        'BED-05',
        CURDATE(),
        NULL,
        'Admitted',
        'Cardiac Ward',
        180.00
    );
    
    SELECT * FROM G13_patients;
    SELECT * FROM G13_doctors;
    SELECT * FROM G13_appointments;
    SELECT * FROM G13_treatments;
    SELECT * FROM G13_medications;
    SELECT * FROM G13_prescriptions;
    SELECT * FROM G13_payments;
    SELECT * FROM G13_admissions;
