-- Question 1
SELECT G13_patients.patient_id,
CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS full_name,
COUNT(G13_appointments.appointment_id) AS total_appointments,
AVG(G13_appointments.consultation_fee) AS average_consultation_fee
FROM G13_patients
JOIN G13_appointments
ON G13_patients.patient_id = G13_appointments.patient_id
GROUP BY G13_patients.patient_id;

-- Question 2
SELECT G13_doctors.doctor_id, CONCAT(G13_doctors.first_name, ' ', G13_doctors.last_name) AS full_name,
G13_doctors.specialization,
SUM(G13_appointments.consultation_fee) AS total_revenue,
COUNT(G13_appointments.appointment_id) AS number_of_appointment
FROM G13_doctors
JOIN G13_appointments
ON G13_doctors.doctor_id = G13_appointments.doctor_id
WHERE G13_appointments.status = 'Completed'
GROUP BY G13_doctors.doctor_id
ORDER BY total_revenue DESC
LIMIT 1;

-- QUESTION 3
SELECT G13_appointments.appointment_id,
CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS patient_name,
CONCAT(G13_doctors.first_name, ' ', G13_doctors.last_name) AS doctor_name,
G13_appointments.appointment_date,
G13_appointments.appointment_time,
G13_appointments.status
FROM G13_appointments
JOIN G13_patients
ON G13_appointments.patient_id = G13_patients.patient_id
JOIN G13_doctors
ON G13_appointments.doctor_id = G13_doctors.doctor_id
WHERE G13_appointments.appointment_date >= DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY)
AND G13_appointments.appointment_date < DATE_ADD(DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY), INTERVAL 7 DAY)
ORDER BY G13_appointments.appointment_date;
