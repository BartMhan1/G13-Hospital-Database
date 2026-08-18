USE G13_hospital_db;

-- QUESTION 4

SELECT
    G13_patients.patient_id,
    CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS patient_name,
    G13_patients.registration_date
FROM G13_patients
LEFT JOIN G13_appointments
    ON G13_patients.patient_id = G13_appointments.patient_id
WHERE G13_appointments.appointment_id IS NULL;



-- QUESTION 5

SELECT
    MONTH(G13_appointments.appointment_date) AS appointment_month,
    COUNT(G13_appointments.appointment_id) AS total_appointments,
    SUM(G13_appointments.consultation_fee) AS total_revenue,
    AVG(G13_appointments.consultation_fee) AS average_appointment_fee
FROM G13_appointments
GROUP BY MONTH(G13_appointments.appointment_date)
ORDER BY appointment_month;



-- QUESTION 6

SELECT
    G13_appointments.appointment_id,
    CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS patient_name,
    CONCAT(G13_doctors.first_name, ' ', G13_doctors.last_name) AS doctor_name,
    G13_doctors.specialization,
    G13_appointments.appointment_date,
    G13_appointments.status,
    G13_appointments.consultation_fee
FROM G13_appointments
JOIN G13_patients
    ON G13_appointments.patient_id = G13_patients.patient_id
JOIN G13_doctors
    ON G13_appointments.doctor_id = G13_doctors.doctor_id
ORDER BY G13_appointments.appointment_id;
-- The first JOIN connects each appointment to its patient.
-- The second JOIN connects each appointment to its doctor.


-- QUESTION 7

SELECT
    G13_patients.*,
    duplicate_list.duplicate_count
FROM G13_patients
JOIN (
    SELECT
        first_name,
        last_name,
        phone_number,
        COUNT(*) AS duplicate_count
    FROM G13_patients
    GROUP BY first_name, last_name, phone_number
    HAVING COUNT(*) > 1
) AS duplicate_list
    ON G13_patients.first_name = duplicate_list.first_name
    AND G13_patients.last_name = duplicate_list.last_name
    AND G13_patients.phone_number = duplicate_list.phone_number;
