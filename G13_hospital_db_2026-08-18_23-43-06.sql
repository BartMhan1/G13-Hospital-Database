-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: viaduct.proxy.rlwy.net    Database: G13_hospital_db
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `G13_hospital_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `G13_hospital_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `G13_hospital_db`;

--
-- Table structure for table `G13_admissions`
--

DROP TABLE IF EXISTS `G13_admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_admissions` (
  `admission_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `bed_number` varchar(20) NOT NULL,
  `admission_date` date NOT NULL,
  `discharge_date` date DEFAULT NULL,
  `admission_status` varchar(20) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `G13_admissions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `G13_patients` (`patient_id`),
  CONSTRAINT `G13_admissions_chk_1` CHECK ((`daily_rate` >= 0)),
  CONSTRAINT `G13_admissions_chk_2` CHECK (((`discharge_date` is null) or (`discharge_date` >= `admission_date`)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_admissions`
--

LOCK TABLES `G13_admissions` WRITE;
/*!40000 ALTER TABLE `G13_admissions` DISABLE KEYS */;
INSERT INTO `G13_admissions` VALUES (1,4,'WARD-A1','BED-01','2026-08-11','2026-08-14','Discharged','General Ward',120.00),(2,6,'WARD-B1','BED-03','2026-08-12',NULL,'Admitted','Cardiac Ward',180.00),(3,8,'WARD-C1','BED-02','2026-08-13','2026-08-15','Discharged','Orthopedic Ward',160.00),(4,10,'WARD-A2','BED-04','2026-08-14',NULL,'Admitted','General Ward',120.00),(5,13,'WARD-B2','BED-05','2026-08-16',NULL,'Admitted','Cardiac Ward',180.00);
/*!40000 ALTER TABLE `G13_admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_appointments`
--

DROP TABLE IF EXISTS `G13_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(20) NOT NULL,
  `consultation_fee` decimal(10,2) NOT NULL,
  `appointment_type` varchar(50) NOT NULL,
  `reason_for_visit` varchar(255) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`appointment_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `G13_appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `G13_patients` (`patient_id`),
  CONSTRAINT `G13_appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `G13_doctors` (`doctor_id`),
  CONSTRAINT `G13_appointments_chk_1` CHECK ((`consultation_fee` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_appointments`
--

LOCK TABLES `G13_appointments` WRITE;
/*!40000 ALTER TABLE `G13_appointments` DISABLE KEYS */;
INSERT INTO `G13_appointments` VALUES (1,1,1,'2026-08-10','09:00:00','Completed',180.00,'General Consultation','Fever and headache','2026-08-16 21:29:04'),(2,2,2,'2026-08-10','10:00:00','Completed',260.00,'Specialist Review','Chest discomfort','2026-08-16 15:37:18'),(3,3,5,'2026-08-11','08:30:00','Completed',200.00,'Follow-up','Diabetes review','2026-08-16 15:37:18'),(4,4,4,'2026-08-11','11:30:00','Completed',230.00,'Specialist Review','Knee pain','2026-08-16 15:37:18'),(5,9,3,'2026-08-12','09:30:00','Completed',150.00,'Pediatric Consultation','Child cough','2026-08-16 15:37:18'),(6,6,2,'2026-08-12','13:00:00','Completed',260.00,'Follow-up','Blood pressure review','2026-08-16 15:37:18'),(7,7,1,'2026-08-13','10:30:00','Completed',180.00,'General Consultation','Malaria symptoms','2026-08-16 15:37:18'),(8,8,4,'2026-08-13','14:00:00','Completed',230.00,'Specialist Review','Back pain','2026-08-16 15:37:18'),(9,9,3,'2026-08-14','08:00:00','Completed',150.00,'Pediatric Consultation','School health review','2026-08-16 15:37:18'),(10,10,6,'2026-08-14','11:00:00','Completed',170.00,'Laboratory Review','Lab test review','2026-08-16 15:37:18'),(11,11,5,'2026-08-15','09:00:00','Completed',200.00,'Follow-up','Migraine review','2026-08-16 15:37:18'),(12,12,1,'2026-08-15','10:00:00','Completed',180.00,'General Consultation','Routine checkup','2026-08-16 15:37:18'),(13,13,2,'2026-08-16','09:30:00','Scheduled',260.00,'Specialist Review','Heart palpitation','2026-08-16 15:37:18'),(14,14,6,'2026-08-16','12:00:00','Scheduled',170.00,'Laboratory Review','Blood test consultation','2026-08-16 15:37:18'),(15,9,3,'2026-08-17','13:30:00','Scheduled',150.00,'Pediatric Consultation','Pediatric review','2026-08-16 15:37:18'),(16,1,5,'2026-08-18','08:45:00','Scheduled',200.00,'Follow-up','Follow-up check','2026-08-16 15:37:18'),(17,2,4,'2026-08-18','15:00:00','Scheduled',230.00,'Specialist Review','Shoulder injury','2026-08-16 15:37:18'),(18,3,2,'2026-08-19','09:15:00','Cancelled',260.00,'Specialist Review','Cardiology follow-up','2026-08-16 15:37:18'),(19,4,1,'2026-08-19','12:30:00','No Show',180.00,'General Consultation','General review','2026-08-16 15:37:18'),(20,5,6,'2026-08-20','10:45:00','Scheduled',170.00,'Laboratory Review','Laboratory report explanation','2026-08-16 15:37:18');
/*!40000 ALTER TABLE `G13_appointments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_update_appointment_timestamp` BEFORE UPDATE ON `G13_appointments` FOR EACH ROW BEGIN
    SET NEW.last_updated = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `G13_doctor_user_map`
--

DROP TABLE IF EXISTS `G13_doctor_user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_doctor_user_map` (
  `mysql_username` varchar(100) NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`mysql_username`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `G13_doctor_user_map_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `G13_doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_doctor_user_map`
--

LOCK TABLES `G13_doctor_user_map` WRITE;
/*!40000 ALTER TABLE `G13_doctor_user_map` DISABLE KEYS */;
INSERT INTO `G13_doctor_user_map` VALUES ('g13_doctor_daniel',1),('g13_doctor_priscilla',2),('g13_doctor_michael',3),('g13_doctor_linda',4),('g13_doctor_samuel',5),('g13_doctor_rebecca',6);
/*!40000 ALTER TABLE `G13_doctor_user_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_doctors`
--

DROP TABLE IF EXISTS `G13_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_doctors` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `years_experience` int NOT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `license_number` (`license_number`),
  CONSTRAINT `G13_doctors_chk_1` CHECK ((`years_experience` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_doctors`
--

LOCK TABLES `G13_doctors` WRITE;
/*!40000 ALTER TABLE `G13_doctors` DISABLE KEYS */;
INSERT INTO `G13_doctors` VALUES (1,'Daniel','Amoah','Family Medicine','0273000001','daniel.amoah@gmail.com','G13-MDC-001',9),(2,'Priscilla','Tetteh','Cardiology','0273000002','priscilla.tetteh@gmail.com','G13-MDC-002',12),(3,'Michael','Osei','Pediatrics','0273000003','michael.osei@gmail.com','G13-MDC-003',7),(4,'Linda','Appiah','Orthopedics','0273000004','linda.appiah@gmail.com','G13-MDC-004',10),(5,'Samuel','Kumi','Internal Medicine','0273000005','samuel.kumi@gmail.com','G13-MDC-005',8),(6,'Rebecca','Ansah','Clinical Pathology','0273000006','rebecca.ansah@gmail.com','G13-MDC-006',6);
/*!40000 ALTER TABLE `G13_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_medications`
--

DROP TABLE IF EXISTS `G13_medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_medications` (
  `medication_id` int NOT NULL AUTO_INCREMENT,
  `medication_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `manufacturer` varchar(100) NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`medication_id`),
  CONSTRAINT `G13_medications_chk_1` CHECK ((`price` >= 0)),
  CONSTRAINT `G13_medications_chk_2` CHECK ((`stock_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_medications`
--

LOCK TABLES `G13_medications` WRITE;
/*!40000 ALTER TABLE `G13_medications` DISABLE KEYS */;
INSERT INTO `G13_medications` VALUES (1,'Paracetamol 500mg','Pain and fever relief tablet',1.50,500,'Ernest Chemists','2027-09-30'),(2,'Artemether Lumefantrine','Antimalarial tablet course',35.00,120,'Danadams Pharmaceuticals','2027-04-30'),(3,'Amoxicillin 500mg','Antibiotic capsule',3.20,300,'Pharmanova Ghana','2027-01-31'),(4,'Amlodipine 5mg','Blood pressure control tablet',2.75,220,'Kama Health Services','2028-02-28'),(5,'Metformin 500mg','Diabetes control tablet',2.10,250,'Entrance Pharmaceuticals','2028-03-31'),(6,'Ibuprofen 400mg','Anti-inflammatory pain tablet',2.00,200,'Ernest Chemists','2027-11-30'),(7,'Salbutamol Inhaler','Asthma relief inhaler',45.00,80,'GlaxoSmithKline','2027-06-30'),(8,'Ferrous Sulphate','Iron supplement tablet',1.80,260,'Pharmanova Ghana','2028-01-31'),(9,'Cetirizine 10mg','Allergy relief tablet',1.60,180,'Kama Health Services','2027-10-31'),(10,'Omeprazole 20mg','Acid reflux capsule',2.50,210,'Entrance Pharmaceuticals','2027-12-31');
/*!40000 ALTER TABLE `G13_medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_patients`
--

DROP TABLE IF EXISTS `G13_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `registration_date` date NOT NULL DEFAULT (curdate()),
  `blood_group` varchar(5) DEFAULT NULL,
  `emergency_contact` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_patients`
--

LOCK TABLES `G13_patients` WRITE;
/*!40000 ALTER TABLE `G13_patients` DISABLE KEYS */;
INSERT INTO `G13_patients` VALUES (1,'Joseph','Lartey Kojo','2002-04-13','Male','0241000001','01245683b.lartey@gmail.com','House 12, Nii Sai Road, East Legon, Accra','2026-07-01','O+','0242000001'),(2,'Munkaila','Iddrisu','1999-11-25','Male','0241000002','01246794b.iddrisu@gmail.com','Plot 8, La Bawaleshie Road, East Legon, Accra','2026-07-02','A+','0242000002'),(3,'Prince','Ayaata Awenanyame Kwame','2001-03-31','Male','0241000003','01242653b.prince@gmail.com','House 21, Mensah Wood Avenue, Adenta, Accra','2026-07-03','B+','0242000003'),(4,'Oheneba','Safo Kwasi','2000-12-17','Male','0241000004','01244318b.safo@gmail.com','No. 5, Kanda Highway, Kanda, Accra','2026-07-04','AB+','0242000004'),(5,'David','Asemtia','2002-06-21','Male','0241000005','01245005b.david@gmail.com','House 14, Dansoman High Street, Dansoman, Accra','2026-07-05','O-','0242000005'),(6,'Gabriel','Fosu','2001-01-30','Male','0241000006','01240873b.gabriel@gmail.com','Plot 32, Spintex Road, Baatsona, Accra','2026-07-06','A-','0242000006'),(7,'Oswin','Agbanu','2000-09-14','Male','0241000007','01246496b.oswin@gmail.com','House 9, Osu Oxford Street, Osu, Accra','2026-07-07','B-','0242000007'),(8,'Bartholomew','Boare','2001-05-19','Male','0241000008','01244946b.boare@gmail.com','No. 18, Ringway Crescent, Osu, Accra','2026-07-08','O+','0242000008'),(9,'Adwoa','Nyarko','2015-10-10','Female','0241000009','adwoa.nyarko@gmail.com','House 6, Teshie Nungua Estate, Teshie, Accra','2026-07-09','AB-','0242000009'),(10,'Kwesi','Bonsu','1979-08-04','Male','0241000010','kwesi.bonsu@gmail.com','Plot 45, Community 18 Road, Spintex, Accra','2026-07-10','A+','0242000010'),(11,'Afia','Arthur','1991-02-26','Female','0241000011','afia.arthur@gmail.com','House 27, Lagos Avenue, East Legon, Accra','2026-07-11','O+','0242000011'),(12,'Nana','Darko','1986-07-12','Male','0241000012','nana.darko@gmail.com','No. 11, Ashaley Botwe School Junction, Accra','2026-07-12','B+','0242000012'),(13,'Mansa','Amoako','2001-03-31','Female','0241000013','mansa.amoako@gmail.com','Plot 3, Ashaiman Lebanon Zone, Accra','2026-07-13','A-','0242000013'),(14,'Fiifi','Quartey','1994-12-06','Male','0241000014','fiifi.quartey@gmail.com','House 17, Sakumono Estate Road, Accra','2026-07-14','O-','0242000014'),(15,'Adwoa','Nyarko','2015-10-10','Female','0241000009','adwoa.nyarko.duplicate@gmail.com','House 10, Trade Fair Road, La, Accra','2026-07-15','AB-','0242000015');
/*!40000 ALTER TABLE `G13_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_payments`
--

DROP TABLE IF EXISTS `G13_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `appointment_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `transaction_reference` varchar(100) DEFAULT NULL,
  `insurance_covered_amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `transaction_reference` (`transaction_reference`),
  KEY `patient_id` (`patient_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `G13_payments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `G13_patients` (`patient_id`),
  CONSTRAINT `G13_payments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `G13_appointments` (`appointment_id`),
  CONSTRAINT `G13_payments_chk_1` CHECK ((`amount` >= 0)),
  CONSTRAINT `G13_payments_chk_2` CHECK ((`insurance_covered_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_payments`
--

LOCK TABLES `G13_payments` WRITE;
/*!40000 ALTER TABLE `G13_payments` DISABLE KEYS */;
INSERT INTO `G13_payments` VALUES (1,1,1,180.00,'2026-08-10','NHIS','Paid','G13-PAY-0001',120.00),(2,2,2,260.00,'2026-08-10','Mobile Money','Paid','G13-PAY-0002',0.00),(3,3,3,200.00,'2026-08-11','Insurance','Paid','G13-PAY-0003',150.00),(4,4,4,230.00,'2026-08-11','Card','Paid','G13-PAY-0004',0.00),(5,9,5,150.00,'2026-08-12','NHIS','Paid','G13-PAY-0005',100.00),(6,6,6,260.00,'2026-08-12','Insurance','Paid','G13-PAY-0006',180.00),(7,7,7,180.00,'2026-08-13','Cash','Paid','G13-PAY-0007',0.00),(8,8,8,230.00,'2026-08-13','Mobile Money','Paid','G13-PAY-0008',0.00),(9,9,9,150.00,'2026-08-14','NHIS','Paid','G13-PAY-0009',90.00),(10,10,10,170.00,'2026-08-14','Cash','Paid','G13-PAY-0010',0.00),(11,11,11,200.00,'2026-08-15','Mobile Money','Paid','G13-PAY-0011',0.00),(12,12,12,180.00,'2026-08-15','NHIS','Paid','G13-PAY-0012',120.00),(13,13,13,260.00,'2026-08-16','Insurance','Pending','G13-PAY-0013',180.00),(14,14,14,170.00,'2026-08-16','Cash','Pending','G13-PAY-0014',0.00),(15,9,15,150.00,'2026-08-17','NHIS','Pending','G13-PAY-0015',100.00),(16,1,16,200.00,'2026-08-18','Mobile Money','Pending','G13-PAY-0016',0.00),(17,2,17,230.00,'2026-08-18','Card','Pending','G13-PAY-0017',0.00),(18,3,18,0.00,'2026-08-19','Insurance','Cancelled','G13-PAY-0018',0.00),(19,4,19,0.00,'2026-08-19','Cash','Waived','G13-PAY-0019',0.00),(20,5,20,170.00,'2026-08-20','Mobile Money','Pending','G13-PAY-0020',0.00);
/*!40000 ALTER TABLE `G13_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_prescriptions`
--

DROP TABLE IF EXISTS `G13_prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_prescriptions` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `medication_id` int NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `instructions` varchar(255) DEFAULT NULL,
  `quantity_prescribed` int NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `medication_id` (`medication_id`),
  CONSTRAINT `G13_prescriptions_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `G13_appointments` (`appointment_id`),
  CONSTRAINT `G13_prescriptions_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `G13_medications` (`medication_id`),
  CONSTRAINT `G13_prescriptions_chk_1` CHECK ((`quantity_prescribed` > 0)),
  CONSTRAINT `G13_prescriptions_chk_2` CHECK (((`end_date` is null) or (`end_date` >= `start_date`)))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_prescriptions`
--

LOCK TABLES `G13_prescriptions` WRITE;
/*!40000 ALTER TABLE `G13_prescriptions` DISABLE KEYS */;
INSERT INTO `G13_prescriptions` VALUES (1,1,2,'4 tablets','Twice daily','2026-08-10','2026-08-12','Take after meals and complete full dose.',24),(2,1,1,'1 tablet','Three times daily','2026-08-10','2026-08-12','Take only when feverish.',9),(3,3,5,'1 tablet','Twice daily','2026-08-11','2026-09-10','Take with meals.',60),(4,4,6,'1 tablet','Twice daily','2026-08-11','2026-08-15','Take after meals.',10),(5,5,9,'1 tablet','Once daily','2026-08-12','2026-08-16','Take at night.',5),(6,6,4,'1 tablet','Once daily','2026-08-12','2026-09-10','Take every morning.',30),(7,7,2,'4 tablets','Twice daily','2026-08-13','2026-08-15','Complete the course.',24),(8,8,6,'1 tablet','Twice daily','2026-08-13','2026-08-17','Avoid taking on an empty stomach.',10),(9,10,8,'1 tablet','Once daily','2026-08-14','2026-09-13','Take after lunch.',30),(10,11,1,'1 tablet','When needed','2026-08-15','2026-08-21','Use when headache starts.',14),(11,12,10,'1 capsule','Once daily','2026-08-15','2026-08-21','Take before breakfast if needed.',7),(12,2,1,'1 tablet','When needed','2026-08-10','2026-08-13','Use for mild chest discomfort only after review.',6);
/*!40000 ALTER TABLE `G13_prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `G13_treatments`
--

DROP TABLE IF EXISTS `G13_treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `G13_treatments` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int NOT NULL,
  `treatment_name` varchar(100) NOT NULL,
  `treatment_description` varchar(255) DEFAULT NULL,
  `treatment_date` date NOT NULL,
  `treatment_status` varchar(30) NOT NULL,
  `follow_up_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`treatment_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `G13_treatments_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `G13_appointments` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `G13_treatments`
--

LOCK TABLES `G13_treatments` WRITE;
/*!40000 ALTER TABLE `G13_treatments` DISABLE KEYS */;
INSERT INTO `G13_treatments` VALUES (1,1,'Antimalarial Therapy','Rapid malaria test was positive and medication was prescribed.','2026-08-10','Completed',1),(2,2,'ECG Review','ECG requested after patient complained of chest discomfort.','2026-08-10','Completed',1),(3,3,'Diabetes Management','Blood sugar record reviewed and medication adherence discussed.','2026-08-11','Completed',1),(4,4,'Joint Pain Management','Knee examined and physiotherapy advice given.','2026-08-11','Completed',1),(5,5,'Respiratory Care','Cough assessed and cold medication prescribed.','2026-08-12','Completed',0),(6,6,'Hypertension Review','Blood pressure checked and lifestyle advice provided.','2026-08-12','Completed',1),(7,7,'Malaria Treatment','Symptoms matched malaria and antimalarial medication was issued.','2026-08-13','Completed',0),(8,8,'Back Pain Therapy','Lower back strain diagnosed and pain relief recommended.','2026-08-13','Completed',1),(9,9,'School Medical Screening','Routine examination completed with no serious issue found.','2026-08-14','Completed',0),(10,10,'Laboratory Interpretation','Low hemoglobin level explained to patient.','2026-08-14','Completed',1),(11,11,'Migraine Management','Migraine triggers discussed and pain control plan given.','2026-08-15','Completed',1),(12,12,'Preventive Health Check','Vital signs were stable and preventive advice was given.','2026-08-15','Completed',0);
/*!40000 ALTER TABLE `G13_treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_doctor_schedule`
--

DROP TABLE IF EXISTS `vw_doctor_schedule`;
/*!50001 DROP VIEW IF EXISTS `vw_doctor_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_doctor_schedule` AS SELECT 
 1 AS `doctor_id`,
 1 AS `doctor_name`,
 1 AS `appointment_id`,
 1 AS `appointment_date`,
 1 AS `appointment_time`,
 1 AS `status`,
 1 AS `patient_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_patient_appointments`
--

DROP TABLE IF EXISTS `vw_patient_appointments`;
/*!50001 DROP VIEW IF EXISTS `vw_patient_appointments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_patient_appointments` AS SELECT 
 1 AS `patient_name`,
 1 AS `appointment_date`,
 1 AS `doctor_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'G13_hospital_db'
--

--
-- Dumping routines for database 'G13_hospital_db'
--

--
-- Current Database: `G13_hospital_db`
--

USE `G13_hospital_db`;

--
-- Final view structure for view `vw_doctor_schedule`
--

/*!50001 DROP VIEW IF EXISTS `vw_doctor_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_doctor_schedule` AS select `d`.`doctor_id` AS `doctor_id`,concat(`d`.`first_name`,' ',`d`.`last_name`) AS `doctor_name`,`a`.`appointment_id` AS `appointment_id`,`a`.`appointment_date` AS `appointment_date`,`a`.`appointment_time` AS `appointment_time`,`a`.`status` AS `status`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `patient_name` from (((`G13_appointments` `a` join `G13_doctors` `d` on((`a`.`doctor_id` = `d`.`doctor_id`))) join `G13_patients` `p` on((`a`.`patient_id` = `p`.`patient_id`))) join `G13_doctor_user_map` `m` on((`d`.`doctor_id` = `m`.`doctor_id`))) where (`m`.`mysql_username` = substring_index(user(),'@',1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_patient_appointments`
--

/*!50001 DROP VIEW IF EXISTS `vw_patient_appointments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_patient_appointments` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `patient_name`,`a`.`appointment_date` AS `appointment_date`,concat(`d`.`first_name`,' ',`d`.`last_name`) AS `doctor_name` from ((`G13_appointments` `a` join `G13_patients` `p` on((`a`.`patient_id` = `p`.`patient_id`))) join `G13_doctors` `d` on((`a`.`doctor_id` = `d`.`doctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-18 23:44:06
