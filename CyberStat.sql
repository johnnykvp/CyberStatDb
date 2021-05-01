-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: CyberStat
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Breach`
--

DROP TABLE IF EXISTS `Breach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Breach` (
  `BreachID` int NOT NULL AUTO_INCREMENT,
  `BreachType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BreachID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Breach`
--

LOCK TABLES `Breach` WRITE;
/*!40000 ALTER TABLE `Breach` DISABLE KEYS */;
INSERT INTO `Breach` VALUES (1,'Ransomware'),(2,'Phishing'),(3,'Device theft'),(4,'N/A');
/*!40000 ALTER TABLE `Breach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Date`
--

DROP TABLE IF EXISTS `Date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Date` (
  `DateID` int NOT NULL AUTO_INCREMENT,
  `IncidentDate` date DEFAULT NULL,
  `DateAdded` date DEFAULT NULL,
  PRIMARY KEY (`DateID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Date`
--

LOCK TABLES `Date` WRITE;
/*!40000 ALTER TABLE `Date` DISABLE KEYS */;
INSERT INTO `Date` VALUES (1,'2020-05-14','2021-02-25'),(2,'2020-09-18','2021-02-25'),(3,'2020-08-05','2021-02-25'),(4,'2020-11-18','2021-02-25'),(7,'2020-04-09','2021-04-02'),(8,'2020-05-28','2021-04-02'),(9,'2020-04-11','2021-04-02'),(10,'2020-07-08','2021-04-16'),(11,'2020-09-12','2021-04-16'),(12,'2020-03-06','2021-04-16'),(13,'2020-06-17','2021-04-16');
/*!40000 ALTER TABLE `Date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incident`
--

DROP TABLE IF EXISTS `Incident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Incident` (
  `IncidentID` int NOT NULL AUTO_INCREMENT,
  `Victim` enum('Patients','Insiders','Both') DEFAULT NULL,
  `VictimEstimate` varchar(45) DEFAULT NULL,
  `CostEstimate` varchar(45) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `FK_OrgID` int DEFAULT NULL,
  `FK_BreachID` int DEFAULT NULL,
  `FK_DateID` int DEFAULT NULL,
  `FK_LinkID` int DEFAULT NULL,
  PRIMARY KEY (`IncidentID`),
  KEY `FK_OrgID_idx` (`FK_OrgID`),
  KEY `FK_BreachID_idx` (`FK_BreachID`),
  KEY `FK_DateID_idx` (`FK_DateID`),
  KEY `FK_LinkID_idx` (`FK_LinkID`),
  CONSTRAINT `FK_BreachID` FOREIGN KEY (`FK_BreachID`) REFERENCES `Breach` (`BreachID`),
  CONSTRAINT `FK_DateID` FOREIGN KEY (`FK_DateID`) REFERENCES `Date` (`DateID`),
  CONSTRAINT `FK_LinkID` FOREIGN KEY (`FK_LinkID`) REFERENCES `Link` (`LinkID`),
  CONSTRAINT `FK_OrgID` FOREIGN KEY (`FK_OrgID`) REFERENCES `Organization` (`OrgID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incident`
--

LOCK TABLES `Incident` WRITE;
/*!40000 ALTER TABLE `Incident` DISABLE KEYS */;
INSERT INTO `Incident` VALUES (3,'Both','4 million','$6 million','Names, contact info, health details compromised.',1,1,1,1),(4,'Patients','1 million','N/A','Health info, payment card numbers compromised.',2,2,2,2),(5,'Patients','829,454','N/A','Health info, SSNs, payment card numbers compromised.',3,1,3,3),(6,'Patients','654,000','N/A','Personal info, Medicaid ID numbers compromised.',4,3,4,4),(7,'Patients','640,000','$99 million','SSNs, diagnosis codes, contact info compromised.',5,1,7,5),(8,'Patients','550,000','N/A','Employee credentials, W-2 info, patient SSNs, treatment info compromised.',7,3,8,6),(9,'Both','365,000','N/A','Employee credentials, W-2 info, patient SSNs, treatment info compromised.',8,1,9,7),(10,'Patients','308,169','N/A','Patient records compromised.',9,1,10,8),(11,'Patients','295,617','$1 million','Contact info, SSNs, Medicaid numbers, diagnosis codes compromised.',10,4,11,9),(12,'Patients','287,876','N/A','SSNs, health insurance data, treatment info compromised.',11,2,12,10),(13,'Both','1,290,876','N/A','SSNs, liscense numbers, medical/treatment info compromised.',12,2,13,11);
/*!40000 ALTER TABLE `Incident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Link`
--

DROP TABLE IF EXISTS `Link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Link` (
  `LinkID` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) DEFAULT NULL,
  `FK_SourceID` int DEFAULT NULL,
  PRIMARY KEY (`LinkID`),
  KEY `FK_SourceID_idx` (`FK_SourceID`),
  CONSTRAINT `FK_SourceID` FOREIGN KEY (`FK_SourceID`) REFERENCES `Source` (`SourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Link`
--

LOCK TABLES `Link` WRITE;
/*!40000 ALTER TABLE `Link` DISABLE KEYS */;
INSERT INTO `Link` VALUES (1,'https://healthitsecurity.com/news/the-10-biggest-healthcare-data-breaches-of-2020',1),(2,'https://www.hipaajournal.com/dental-care-alliance-data-breach-impacts-more-than-1-million-patients/',2),(3,'https://healthitsecurity.com/news/luxottica-data-leaked-by-hackers-after-ransomware-attack-breach',1),(4,'https://healthitsecurity.com/healthcare-information-security-interviews',1),(5,'https://www.hipaajournal.com/florida-orthopaedic-institute-facing-class-action-lawsuit-over-ransomware-attack/',2),(6,'https://www.databreachtoday.com/business-associate-incidents-added-to-breach-tally-a-14456',5),(7,'https://healthitsecurity.com/news/ransomware-attack-on-magellan-health-results-in-data-exfiltration',1),(8,'https://www.hipaajournal.com/up-to-308000-patients-potentially-affected-by-baton-rouge-clinic-ransomware-attack/',2),(9,'https://www.infosecurity-magazine.com/news/aspenpointe-cyber-attack/',6),(10,'https://healthitsecurity.com/news/patient-breach-victims-file-lawsuits-against-assured-imaging-bjc-health',1),(11,'https://www.hipaajournal.com/email-account-breaches-reported-by-meharry-medical-college-and-mednax-services/',2);
/*!40000 ALTER TABLE `Link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organization` (
  `OrgID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `OrgType` enum('Association','Consulting','Doctor''s Office','Government','Hospital','Information Sharing/Analysis','Insurance/Plan Provider','Distributor','Nursing Home','Other','Pharma','Telehealth','University Medical Center','Urgent Care') DEFAULT NULL,
  PRIMARY KEY (`OrgID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,'Blackbaud','Other'),(2,'DCA Alliance','Association'),(3,'Luxottica','Distributor'),(4,'Health Share of Oregon','Insurance/Plan Provider'),(5,'Florida Orthopaedic Institute','Association'),(7,'Elite Emergency Physicians','Insurance/Plan Provider'),(8,'Magellan Health','Insurance/Plan Provider'),(9,'Baton Rouge Clinic','Doctor\'s Office'),(10,'AspenPointe','Other'),(11,'BJC Health System','Association'),(12,'Mednax Services','Association');
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Source`
--

DROP TABLE IF EXISTS `Source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Source` (
  `SourceID` int NOT NULL AUTO_INCREMENT,
  `Domain` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Source`
--

LOCK TABLES `Source` WRITE;
/*!40000 ALTER TABLE `Source` DISABLE KEYS */;
INSERT INTO `Source` VALUES (1,'HealthITSecurity'),(2,'HIPAAJournal'),(5,'DataBreachToday'),(6,'InfoSecurityMagazine');
/*!40000 ALTER TABLE `Source` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-01  0:49:39
