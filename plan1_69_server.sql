-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 103.104.73.221    Database: plan1_69
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actions` varchar(255) NOT NULL,
  `status` varchar(25) DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'list','1'),(2,'add','1'),(3,'edit','1'),(4,'delete','1'),(5,'upload','1'),(6,'preprocess','1'),(7,'deleteall','1'),(8,'view','1'),(9,'download','1'),(10,'reupload','1'),(11,'header','1'),(12,'approve','1'),(13,'cancel','1'),(14,'export','1'),(15,'print','1'),(16,'assignUser','1'),(17,'branchUserEdit','1'),(18,'preferences','1'),(20,'search','1'),(21,'share','1'),(22,'playVideo','1'),(23,'comment','1');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_details`
--

DROP TABLE IF EXISTS `address_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `address` longtext,
  `city_id` bigint DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `gstin` varchar(45) DEFAULT NULL,
  `module_id` bigint NOT NULL,
  `ref_doc` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_type_addressDetails_idx` (`type_id`),
  KEY `FK_module_addressDetails_idx` (`module_id`),
  KEY `FK_employee_addressDetails_idx` (`ref_doc`),
  KEY `FK_user_addressDetails_createdBy_idx` (`created_by`),
  KEY `FK_user_addressDetails_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_addressDetails_idx` (`company_id`),
  KEY `FK_branch_addressDetails_idx` (`branch_id`),
  CONSTRAINT `FK_branch_addressDetails` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_addressDetails` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_employee_addressDetails` FOREIGN KEY (`ref_doc`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_module_addressDetails` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_type_addressDetails` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_user_addressDetails_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_addressDetails_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_details`
--

LOCK TABLES `address_details` WRITE;
/*!40000 ALTER TABLE `address_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_config`
--

DROP TABLE IF EXISTS `approval_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint NOT NULL,
  `type_id` bigint NOT NULL,
  `bulk_approval` tinyint DEFAULT '0',
  `line_item_approval` tinyint DEFAULT '0',
  `approval_base` varchar(45) DEFAULT NULL,
  `custom_field_id` bigint DEFAULT NULL,
  `approval_count` int DEFAULT NULL,
  `min_approvals` int DEFAULT NULL,
  `approval_system` enum('parallel','sequential') DEFAULT 'sequential',
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `status` bigint DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `FK_module_approvalConfig_idx` (`module_id`),
  KEY `FK_type_approvalConfig_idx` (`type_id`),
  KEY `FK_users_approvalConfig_createdBy_idx` (`created_by`),
  KEY `FK_users_approvalConfig_modifiedBy_idx` (`modified_by`),
  CONSTRAINT `FK_module_approvalConfig` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_type_approvalConfig` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_users_approvalConfig_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_users_approvalConfig_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_config`
--

LOCK TABLES `approval_config` WRITE;
/*!40000 ALTER TABLE `approval_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_details`
--

DROP TABLE IF EXISTS `approval_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approval_date` datetime DEFAULT NULL,
  `approval_status` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `ref_doc_id` bigint DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `module_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `from_user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_statusDetails_approvalDetails_idx` (`approval_status`),
  CONSTRAINT `FK_statusDetails_approvalDetails` FOREIGN KEY (`approval_status`) REFERENCES `status_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_details`
--

LOCK TABLES `approval_details` WRITE;
/*!40000 ALTER TABLE `approval_details` DISABLE KEYS */;
INSERT INTO `approval_details` VALUES (1,'2020-11-11 15:31:45',8,1,2,'This is approval',1,132,5,5),(3,'2020-11-11 15:48:27',11,2,2,'This is approval',1,132,7,1),(4,'2020-11-11 18:14:14',11,1,3,'This is returned',1,132,1,7),(5,'2020-11-11 18:22:15',11,1,5,'This is returned',1,132,5,1),(6,'2020-11-11 18:34:06',8,1,5,'This is returned',1,132,5,1),(7,'2020-11-11 18:35:03',8,2,5,'This is returned',1,132,7,1);
/*!40000 ALTER TABLE `approval_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_group`
--

DROP TABLE IF EXISTS `approval_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `approval_group_name` varchar(100) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_approvalGroup_createdBy_idx` (`created_by`),
  KEY `FK_users_approvalGroup_modifiedBy_idx` (`modified_by`),
  CONSTRAINT `FK_users_approvalGroup_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_users_approvalGroup_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_group`
--

LOCK TABLES `approval_group` WRITE;
/*!40000 ALTER TABLE `approval_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_group_users`
--

DROP TABLE IF EXISTS `approval_group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_group_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_approvalGroup_groupUser_idx` (`group_id`),
  KEY `FK_user_groupUsers_idx` (`user_id`),
  CONSTRAINT `FK_approvalGroup_groupUser` FOREIGN KEY (`group_id`) REFERENCES `approval_group` (`id`),
  CONSTRAINT `FK_user_groupUsers` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_group_users`
--

LOCK TABLES `approval_group_users` WRITE;
/*!40000 ALTER TABLE `approval_group_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_level_users`
--

DROP TABLE IF EXISTS `approval_level_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_level_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_level_levelUsers_idx` (`parent_id`),
  KEY `FK_users_levelUsers_idx` (`user_id`),
  CONSTRAINT `FK_approvalLevels_levelUsers` FOREIGN KEY (`parent_id`) REFERENCES `approval_levels` (`id`),
  CONSTRAINT `FK_users_levelUsers` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_level_users`
--

LOCK TABLES `approval_level_users` WRITE;
/*!40000 ALTER TABLE `approval_level_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_level_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_levels`
--

DROP TABLE IF EXISTS `approval_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_levels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL,
  `level_name` varchar(150) DEFAULT NULL,
  `min_range` varchar(180) DEFAULT NULL,
  `max_range` varchar(180) DEFAULT NULL,
  `department_wise` tinyint DEFAULT '0',
  `approval_type` varchar(45) DEFAULT NULL COMMENT 'AG - Approval Group\nRM - Reporting Manager\nIU - Individual Users',
  `min_approval_from_group` int DEFAULT NULL,
  `approval_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_approvalConfig_approvalLevel_idx` (`parent_id`),
  KEY `FK_approvalGroup_approvalUser_idx` (`approval_group_id`),
  CONSTRAINT `FK_approvalConfig_approvalLevel` FOREIGN KEY (`parent_id`) REFERENCES `approval_config` (`id`),
  CONSTRAINT `FK_approvalGroup_approvalUser` FOREIGN KEY (`approval_group_id`) REFERENCES `approval_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_levels`
--

LOCK TABLES `approval_levels` WRITE;
/*!40000 ALTER TABLE `approval_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` bigint NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `city_id` bigint NOT NULL,
  `pin_code` int NOT NULL,
  `status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'Active',
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_area_pincode_idx` (`pin_code`,`area`),
  KEY `FK_user_area_createdBy` (`created_by`),
  KEY `FK_user_area_modifiedBy` (`modified_by`),
  CONSTRAINT `FK_user_area_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_area_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_test_questionnaire_mapping`
--

DROP TABLE IF EXISTS `assessment_test_questionnaire_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_test_questionnaire_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessment_test_id` bigint DEFAULT NULL,
  `questionnaire_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_test_id` (`assessment_test_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `assessment_test_questionnaire_mapping_ibfk_1` FOREIGN KEY (`assessment_test_id`) REFERENCES `assessment_tests` (`id`),
  CONSTRAINT `assessment_test_questionnaire_mapping_ibfk_2` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_test_questionnaire_mapping`
--

LOCK TABLES `assessment_test_questionnaire_mapping` WRITE;
/*!40000 ALTER TABLE `assessment_test_questionnaire_mapping` DISABLE KEYS */;
INSERT INTO `assessment_test_questionnaire_mapping` VALUES (39,NULL,21),(40,NULL,22),(41,7,20),(42,7,27),(43,8,26),(44,8,31);
/*!40000 ALTER TABLE `assessment_test_questionnaire_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment_tests`
--

DROP TABLE IF EXISTS `assessment_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_tests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `time_duration_policy` varchar(45) DEFAULT NULL,
  `time_out_duration` varchar(45) DEFAULT NULL,
  `enable_negetive_marking` tinyint DEFAULT NULL,
  `test_pass_percentage` double DEFAULT NULL,
  `total_question` int DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `job_profile_id` bigint DEFAULT NULL,
  `enable_web_cam` tinyint DEFAULT NULL,
  `enable_anti_cheating` tinyint DEFAULT NULL,
  `take_introduction_video` tinyint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  KEY `job_profile_id` (`job_profile_id`),
  CONSTRAINT `assessment_tests_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `assessment_tests_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `assessment_tests_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `assessment_tests_ibfk_4` FOREIGN KEY (`job_profile_id`) REFERENCES `job_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_tests`
--

LOCK TABLES `assessment_tests` WRITE;
/*!40000 ALTER TABLE `assessment_tests` DISABLE KEYS */;
INSERT INTO `assessment_tests` VALUES (5,'Java Developer Trainee Test','0','60',0,70,30,2,22,1,1,1,NULL,'2021-01-16 16:43:04',NULL,'2021-07-06 12:58:17',NULL,NULL),(6,'Test','0','50',1,50,21,2,18,1,1,1,NULL,'2021-07-16 00:01:46',NULL,'2021-07-16 00:01:46',NULL,NULL),(7,'hr assessment','1','2',0,70,30,2,18,1,1,1,NULL,'2021-07-24 17:10:17',NULL,'2021-07-29 20:11:22',NULL,NULL),(8,'test','1','1',0,50,20,2,19,1,1,1,NULL,'2021-08-01 15:28:57',NULL,'2021-08-07 10:44:26',NULL,NULL);
/*!40000 ALTER TABLE `assessment_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'ROLE_SUPERADMIN'),(2,'ROLE_ADMIN'),(4,'ROLE_USER'),(10,'ROLE_USER'),(11,'ROLE_USER'),(12,'ROLE_USER'),(13,'ROLE_USER'),(14,'ROLE_USER'),(34,'ROLE_USER'),(35,'ROLE_USER'),(36,'ROLE_USER'),(37,'ROLE_USER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_details`
--

DROP TABLE IF EXISTS `bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(180) NOT NULL,
  `address` longtext,
  `city_id` bigint DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `ifsc_code` varchar(45) DEFAULT NULL,
  `swift_code` varchar(45) DEFAULT NULL,
  `ac_no` varchar(45) NOT NULL,
  `module_id` bigint DEFAULT NULL,
  `ref_id` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `status` bigint DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bankName_acNo_idx` (`bank_name`,`ac_no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_details`
--

LOCK TABLES `bank_details` WRITE;
/*!40000 ALTER TABLE `bank_details` DISABLE KEYS */;
INSERT INTO `bank_details` VALUES (9,'SBI ','H-141',133230,248007,'SBIN001','123456','34859785466',112,9,'2021-08-02 15:55:57',NULL,'2021-08-02 15:55:57',NULL,NULL,NULL,NULL),(10,'OBC','H-141',133230,248007,'OBC100','1234569','34859687499',112,9,'2021-08-02 15:57:24',NULL,'2021-08-02 15:57:24',NULL,NULL,NULL,NULL),(11,'AXIS','H-141',132005,248007,'AXIS100','123456','3495975688',112,10,'2021-08-02 16:02:03',NULL,'2021-08-02 16:02:03',NULL,NULL,NULL,NULL),(12,'SBI','H-141',133230,248007,'SBIN001','12345656','34869484766',112,16,'2021-08-03 20:44:05',NULL,'2021-08-03 20:44:05',NULL,NULL,NULL,NULL),(13,'SBI','H-141 Noida 63',133230,2090115,'SBIN001','1234565','34859875455',124,NULL,'2021-08-07 09:49:50',NULL,'2021-08-07 01:57:51',NULL,NULL,NULL,NULL),(14,'SBI','H-141 Noida 63',133230,2090115,'SBIN001','123456','31857945844',112,18,'2021-08-07 09:52:01',NULL,'2021-08-07 09:52:01',NULL,NULL,NULL,NULL),(15,'SBI','H-141 Noida 63',133230,2090115,'SBI0001','123456','34899786466',124,NULL,'2021-08-07 11:27:51',NULL,'2021-08-07 02:03:34',NULL,NULL,NULL,NULL),(16,'SBI','H-141 Noida 63',133230,2090115,'SBIN001','123456','34759485766',124,30,'2021-08-07 11:33:35',NULL,'2021-08-07 11:33:35',NULL,NULL,NULL,NULL),(17,' Kotak Mahindra Bank','Noida, Sec-18 India(Uttar Pradesh-201301)',133230,201301,' KKBK0000181','KKBKINBBCPC',' 0211266004',112,19,'2021-08-09 18:28:45',NULL,'2021-08-09 18:28:45',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bank_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` bigint NOT NULL,
  `branch_code` varchar(45) DEFAULT NULL,
  `branch_name` varchar(200) DEFAULT NULL,
  `short_name` varchar(45) DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `address` text,
  `pincode` int DEFAULT NULL,
  `reporting_branch` bigint DEFAULT NULL,
  `description` longtext,
  `contact_person` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `parent_company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_branch_company_idx` (`branch_name`,`company_id`),
  UNIQUE KEY `UK_shortName_companyId` (`short_name`,`company_id`),
  KEY `FK_user_branch_createdBy_idx` (`created_by`),
  KEY `FK_user_branch_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_branch_idx` (`company_id`),
  KEY `FK_branch_branch_idx` (`reporting_branch`),
  KEY `FK_type_branch_idx` (`type`),
  KEY `FK_zone_branch_idx` (`zone_id`),
  KEY `FK_branch_branch_branchId_idx` (`branch_id`),
  CONSTRAINT `FK_branch_branch` FOREIGN KEY (`reporting_branch`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_branch_branch_branchId` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_branch` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_type_branch` FOREIGN KEY (`type`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_user_branch_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_branch_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_zone_branch` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,1,'BH0001','Noida','ND',NULL,1,'fjhf',201301,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2020-10-12 18:12:23',1,'2021-08-09 09:18:12',1,1,NULL),(27,1,'BH0002','br','hj',NULL,131679,'H-141 Noida 63',2090115,1,'Brachh','AmanManullyupdates','shivittech123@gmail.com',9149065796,9149065796,NULL,2,1,'2021-07-24 16:44:25',1,'2021-08-09 09:35:53',1,1,NULL),(29,8,'BH0003','AmazonWareHouseNoida','AwsWareHouse',NULL,133230,'H-141 Noida 63',2090115,1,'All about Noida Brach','Deeapika Sharma','shivittech123@gmail.com',9149065796,9149065796,NULL,1,1,'2021-07-27 18:21:40',1,'2021-08-09 09:18:12',1,1,NULL),(30,8,'BH0004','Test Branch','Demo',6,131679,'H-141 Noida 63',2090115,1,'Warehouse Branch','a a Katiyar','shivittech123@gmail.com',9149065796,9149065796,NULL,2,1,'2021-08-01 14:57:25',1,'2021-08-09 09:18:12',1,1,NULL);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_contact_details`
--

DROP TABLE IF EXISTS `branch_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_contact_details` (
  `id` bigint NOT NULL,
  `branch_id` bigint DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `designation_id` bigint DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_contact_details`
--

LOCK TABLES `branch_contact_details` WRITE;
/*!40000 ALTER TABLE `branch_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_user_role`
--

DROP TABLE IF EXISTS `branch_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_action_id` bigint NOT NULL,
  `branch_user_assign_id` bigint NOT NULL,
  `company_id` bigint DEFAULT NULL,
  `permission` tinyint DEFAULT '0',
  `role_id` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_userBranch_branchUserRole_idx` (`branch_user_assign_id`),
  KEY `FK_branch_branchUserRole_idx` (`branch_id`),
  KEY `FK_role_branchUserRole_idx` (`role_id`),
  KEY `FK_user_branchUserRole_createdBy_idx` (`created_by`),
  KEY `FK_user_branchUserRole_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_branchUserRole_idx` (`company_id`),
  KEY `FK_moduleAction_branchUserRole_idx` (`module_action_id`),
  CONSTRAINT `FK_branch_branchUserRole` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_branchUserRole` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_moduleAction_branchUserRole` FOREIGN KEY (`module_action_id`) REFERENCES `module_actions_mapping` (`id`),
  CONSTRAINT `FK_role_branchUserRole` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_user_branchUserRole_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_branchUserRole_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_userBranch_branchUserRole` FOREIGN KEY (`branch_user_assign_id`) REFERENCES `user_branch_assign` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_user_role`
--

LOCK TABLES `branch_user_role` WRITE;
/*!40000 ALTER TABLE `branch_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buttons`
--

DROP TABLE IF EXISTS `buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buttons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `button_name` varchar(255) DEFAULT NULL,
  `button_class` varchar(255) DEFAULT NULL,
  `action_id` bigint DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `purpose` varchar(45) DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `status_details_id` bigint DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `created_by` bigint DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT '1',
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `branch_id` bigint DEFAULT '1',
  `company_id` bigint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_action_button_idx` (`action_id`),
  KEY `FK_statusDetails_button_idx` (`status_details_id`),
  CONSTRAINT `FK_action_button` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`),
  CONSTRAINT `FK_statusDetails_button` FOREIGN KEY (`status_details_id`) REFERENCES `status_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buttons`
--

LOCK TABLES `buttons` WRITE;
/*!40000 ALTER TABLE `buttons` DISABLE KEYS */;
INSERT INTO `buttons` VALUES (1,'Add More','btn-info',2,NULL,'form',1,NULL,'btn',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(2,'Edit','info font-medium-1 mr-2',3,'fas fa-edit','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(3,'Prefference','icons font-medium-1',18,'ft-settings','form',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(4,'Delete','danger font-medium-1 mr-2',4,'ft-trash-2','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(5,'Upload','icons font-medium-1',5,'ft-upload','form',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(6,'View','success font-medium-1 mr-2',8,'fas fa-eye','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(7,'Back','btn-danger',NULL,'ft-corner-up-left','form',1,NULL,'btn',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(8,'Submit','btn-success',NULL,'fa fa  fa-check-square-o','form',1,4,'btn',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(9,'Clear','btn-danger',NULL,'ft-x','form',1,NULL,'btn',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(10,'Search','icons search ft-search font-medium-1',20,'ft-search','form',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(11,'Apply','btn-success',NULL,'ft-search','form',1,NULL,'btn',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(12,'Share','info font-medium-1 mr-2',21,'ft-share-2','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(13,'Download','icons font-medium-1',9,'ft-download','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(14,'Play','icons font-medium-1',22,'fas fa-play mx-1','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(15,'Update','btn-success',NULL,'fa fa  fa-check-square-o','form',1,NULL,'btn',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1),(16,'Comment','icons font-medium-1',23,'ft-message-square','list',1,NULL,'icon',1,'2021-04-12 11:35:51',1,'2021-04-12 11:35:51',1,1);
/*!40000 ALTER TABLE `buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(65) NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `status` bigint NOT NULL,
  `verification_token` varchar(100) DEFAULT NULL,
  `otp` varchar(100) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `login_type` bigint DEFAULT NULL,
  `candidate_id` bigint DEFAULT NULL,
  `candidate_status` varchar(45) DEFAULT NULL,
  `introVideo` varchar(45) DEFAULT NULL,
  `intro_video_file_content_type` varchar(45) DEFAULT NULL,
  `intro_video_file_name` varchar(45) DEFAULT NULL,
  `intro_video_file_size` varchar(45) DEFAULT NULL,
  `resume_file_content_type` varchar(45) DEFAULT NULL,
  `resume_file_name` varchar(45) DEFAULT NULL,
  `resume_file_size` varchar(45) DEFAULT NULL,
  `candiateApplication_id` bigint DEFAULT NULL,
  `assessment_test_status` varchar(45) DEFAULT NULL,
  `assessment_test_score` varchar(45) DEFAULT NULL,
  `total_experience_unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,'Shivit Technologies Digital','digitalmarketing@shivit.com','91490657936',24,'766cfe45-1ba3-4742-ab48-1a428e9e4c46',NULL,NULL,NULL,'2021-08-05 00:00:00',NULL,NULL,'VERIFIED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_application`
--

DROP TABLE IF EXISTS `candidate_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint DEFAULT NULL,
  `job_posting_id` bigint DEFAULT NULL,
  `applied_date` datetime DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `applied_through` varchar(45) DEFAULT NULL,
  `resume` varchar(45) DEFAULT NULL,
  `resume_file_name` varchar(45) DEFAULT NULL,
  `resume_file_size` varchar(45) DEFAULT NULL,
  `resume_file_content_type` varchar(45) DEFAULT NULL,
  `introVideo` varchar(45) DEFAULT NULL,
  `intro_video_file_name` varchar(45) DEFAULT NULL,
  `intro_video_file_size` varchar(45) DEFAULT NULL,
  `intro_video_file_content_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_application`
--

LOCK TABLES `candidate_application` WRITE;
/*!40000 ALTER TABLE `candidate_application` DISABLE KEYS */;
INSERT INTO `candidate_application` VALUES (1,NULL,14,'2021-08-08 00:00:00',26,NULL,NULL,'new Resume(1).pdf','57854','application/pdf',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `candidate_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_assessments`
--

DROP TABLE IF EXISTS `candidate_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_assessments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `application_id` bigint DEFAULT NULL,
  `assessment_id` bigint DEFAULT NULL,
  `module_id` bigint DEFAULT NULL,
  `assessment_status` bigint DEFAULT NULL,
  `assessment_date` datetime DEFAULT NULL,
  `total_time_taken` time DEFAULT NULL,
  `total_marks` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_assessments`
--

LOCK TABLES `candidate_assessments` WRITE;
/*!40000 ALTER TABLE `candidate_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_assessments_answers`
--

DROP TABLE IF EXISTS `candidate_assessments_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_assessments_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_assessment_id` bigint DEFAULT NULL,
  `answer` bigint DEFAULT NULL,
  `marks` bigint DEFAULT NULL,
  `time_taken` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_assessments_answers`
--

LOCK TABLES `candidate_assessments_answers` WRITE;
/*!40000 ALTER TABLE `candidate_assessments_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_assessments_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_experience`
--

DROP TABLE IF EXISTS `candidate_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `job_role` varchar(45) DEFAULT NULL,
  `job_profile` longtext,
  `current_employer` tinyint DEFAULT '0',
  `job_type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_experience`
--

LOCK TABLES `candidate_experience` WRITE;
/*!40000 ALTER TABLE `candidate_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_profile`
--

DROP TABLE IF EXISTS `candidate_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint DEFAULT NULL,
  `permanent_address` text,
  `city_id` bigint DEFAULT NULL,
  `current_address` text,
  `is_same_to_permanent` tinyint DEFAULT '0',
  `father_name` varchar(200) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `total_experience` int DEFAULT NULL,
  `experience_unit` bigint DEFAULT NULL,
  `current_ctc` double(21,2) DEFAULT NULL,
  `expected_ctc` double(21,2) DEFAULT NULL,
  `marital_status` int DEFAULT NULL,
  `profile_title` varchar(200) DEFAULT NULL,
  `allow_sms` tinyint DEFAULT '1',
  `allow_email` tinyint DEFAULT '1',
  `gender` int DEFAULT NULL,
  `total_experience_unit` varchar(45) DEFAULT NULL,
  `relavant_experience` bigint DEFAULT NULL,
  `relavant_experience_unit` varchar(45) DEFAULT NULL,
  `permanent_country_id` int DEFAULT NULL,
  `permanent_state_id` int DEFAULT NULL,
  `permanent_pincode` int DEFAULT NULL,
  `current_address_copy1` varchar(45) DEFAULT NULL,
  `current_country_id` int DEFAULT NULL,
  `current_state_id` int DEFAULT NULL,
  `current_city_id` int DEFAULT NULL,
  `current_pincode` int DEFAULT NULL,
  `is_same_to_permanent_copy1` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_profile`
--

LOCK TABLES `candidate_profile` WRITE;
/*!40000 ALTER TABLE `candidate_profile` DISABLE KEYS */;
INSERT INTO `candidate_profile` VALUES (1,1,'h-141',NULL,NULL,NULL,NULL,NULL,111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,101,NULL,209115,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `candidate_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_qualification`
--

DROP TABLE IF EXISTS `candidate_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_qualification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` bigint DEFAULT NULL,
  `degree` bigint DEFAULT NULL,
  `Board` bigint DEFAULT NULL,
  `college_name` varchar(200) DEFAULT NULL,
  `start_year` int DEFAULT NULL,
  `end_year` int DEFAULT NULL,
  `percentage` float(10,2) DEFAULT NULL,
  `cgpi` float(10,2) DEFAULT NULL,
  `persuing` tinyint DEFAULT '0',
  `major_subjects` text,
  `candidate_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_qualification`
--

LOCK TABLES `candidate_qualification` WRITE;
/*!40000 ALTER TABLE `candidate_qualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_skill_experience`
--

DROP TABLE IF EXISTS `candidate_skill_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_skill_experience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mandatory_skill_id` bigint NOT NULL,
  `have_skill` tinyint NOT NULL,
  `experience` decimal(3,0) DEFAULT NULL,
  `experience_in` varchar(100) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `candidate_reg_id` bigint DEFAULT NULL,
  `candidate_application_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_skill_experience`
--

LOCK TABLES `candidate_skill_experience` WRITE;
/*!40000 ALTER TABLE `candidate_skill_experience` DISABLE KEYS */;
INSERT INTO `candidate_skill_experience` VALUES (4,32,1,NULL,'MONTH','',NULL,1),(5,33,1,NULL,'MONTH','',NULL,1),(6,35,1,NULL,'MONTH','',NULL,1);
/*!40000 ALTER TABLE `candidate_skill_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_verification_tokens`
--

DROP TABLE IF EXISTS `candidate_verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_verification_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `candidate_verification_tokens_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_verification_tokens`
--

LOCK TABLES `candidate_verification_tokens` WRITE;
/*!40000 ALTER TABLE `candidate_verification_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate_verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_posting_id` bigint NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(65) NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `resume_file_name` varchar(256) DEFAULT NULL,
  `assessment_test_status` varchar(100) NOT NULL DEFAULT 'Fail',
  `assessment_test_score` varchar(100) DEFAULT NULL,
  `applied_date` date NOT NULL,
  `status` bigint NOT NULL DEFAULT '1',
  `apply_source` varchar(100) DEFAULT NULL,
  `candidate_status` varchar(100) DEFAULT NULL,
  `resume_file_content_type` varchar(100) DEFAULT NULL,
  `resume_file_size` bigint DEFAULT NULL,
  `intro_video_file_name` varchar(100) DEFAULT NULL,
  `intro_video_file_content_type` varchar(100) DEFAULT NULL,
  `intro_video_file_size` bigint DEFAULT NULL,
  `total_experience` decimal(10,0) DEFAULT NULL,
  `total_experience_unit` varchar(100) DEFAULT NULL,
  `relavant_experience` decimal(10,0) DEFAULT NULL,
  `relavant_experience_unit` varchar(100) DEFAULT NULL,
  `permanent_address` varchar(200) DEFAULT NULL,
  `permanent_city_id` int DEFAULT NULL,
  `permanent_pincode` int DEFAULT NULL,
  `same_as_permanent_address` tinyint DEFAULT NULL,
  `current_address` varchar(100) DEFAULT NULL,
  `current_city_id` int DEFAULT NULL,
  `current_pincode` int DEFAULT NULL,
  `cover_letter` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_posting_id` (`job_posting_id`,`name`,`email`),
  UNIQUE KEY `intro_video_file_name_UNIQUE` (`intro_video_file_name`),
  UNIQUE KEY `resume_file_name_UNIQUE` (`resume_file_name`),
  KEY `fk_candidates_1_idx` (`job_posting_id`),
  CONSTRAINT `fk_candidates_1` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (98,14,'ANSHUL','avnps98@hotmail.com','8800102596',NULL,'TestNotTakenYet',NULL,'2021-01-27',24,'Unknown','VERIFIED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,14,'Sachin Singh','sachinsingh.sk13@gmail.com','7982858206',NULL,'TestNotTakenYet',NULL,'2021-01-27',23,'Unknown','REGISTERED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,14,'Shivam Sharma','sachin.kumar@shivit.in','7503935107','100Shivam Sharma94Sachin SinghNitin_Roy_1.pdf','TestNotTakenYet',NULL,'2021-01-27',24,'Unknown','VERIFIED','application/pdf',33024,'100Shivam Sharma100-Shivam Sharma- Wed Jan 27 2021','video/x-matroska;codecs=avc1,opus',3011593,2,'MONTH',3,'MONTH','85 Sanjay Colony',4,201007,1,'85 Sanjay Colony',5,201007,'<p>this is my cover letter</p>'),(101,15,'ANSHUL','avnps98@yahoo.com','8800102596',NULL,'TestNotTakenYet',NULL,'2021-04-19',24,'Unknown','VERIFIED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,17,'archna','archna.zadoo@shivit.com','9818101107',NULL,'TestNotTakenYet',NULL,'2021-07-09',23,'Unknown','REGISTERED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_point`
--

DROP TABLE IF EXISTS `check_list_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_list_point` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `mandatory` int NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsfef8cdokxd44n7wtagf4snmv` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_point`
--

LOCK TABLES `check_list_point` WRITE;
/*!40000 ALTER TABLE `check_list_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_list_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_points_details`
--

DROP TABLE IF EXISTS `check_list_points_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_list_points_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `check_list_point_id` bigint NOT NULL,
  `checked` int NOT NULL,
  `document_id` bigint NOT NULL,
  `document_no` bigint NOT NULL,
  `module_id` int DEFAULT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_points_details`
--

LOCK TABLES `check_list_points_details` WRITE;
/*!40000 ALTER TABLE `check_list_points_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_list_points_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` bigint NOT NULL AUTO_INCREMENT,
  `city_code` varchar(255) DEFAULT NULL,
  `city_name` varchar(180) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `std_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `UK_stateId_cityName` (`city_name`,`state_id`),
  KEY `FK_state_city` (`state_id`),
  CONSTRAINT `FK_state_city` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,NULL,'North and Middle Andaman',NULL,1,1,NULL),(2,NULL,'South Andaman',NULL,1,1,NULL),(3,NULL,'Nicobar',NULL,1,1,NULL),(4,NULL,'Adilabad',NULL,2,1,NULL),(5,NULL,'Anantapur',NULL,2,1,NULL),(6,NULL,'Chittoor',NULL,2,1,NULL),(7,NULL,'East Godavari',NULL,2,1,NULL),(8,NULL,'Guntur',NULL,2,1,NULL),(9,NULL,'Hyderabad',NULL,2,1,NULL),(10,NULL,'Kadapa',NULL,2,1,NULL),(11,NULL,'Karimnagar',NULL,2,1,NULL),(12,NULL,'Khammam',NULL,2,1,NULL),(13,NULL,'Krishna',NULL,2,1,NULL),(14,NULL,'Kurnool',NULL,2,1,NULL),(15,NULL,'Mahbubnagar',NULL,2,1,NULL),(16,NULL,'Medak',NULL,2,1,NULL),(17,NULL,'Nalgonda',NULL,2,1,NULL),(18,NULL,'Nellore',NULL,2,1,NULL),(19,NULL,'Nizamabad',NULL,2,1,NULL),(20,NULL,'Prakasam',NULL,2,1,NULL),(21,NULL,'Rangareddi',NULL,2,1,NULL),(22,NULL,'Srikakulam',NULL,2,1,NULL),(23,NULL,'Vishakhapatnam',NULL,2,1,NULL),(24,NULL,'Vizianagaram',NULL,2,1,NULL),(25,NULL,'Warangal',NULL,2,1,NULL),(26,NULL,'West Godavari',NULL,2,1,NULL),(27,NULL,'Anjaw',NULL,3,1,NULL),(28,NULL,'Changlang',NULL,3,1,NULL),(29,NULL,'East Kameng',NULL,3,1,NULL),(30,NULL,'Lohit',NULL,3,1,NULL),(31,NULL,'Lower Subansiri',NULL,3,1,NULL),(32,NULL,'Papum Pare',NULL,3,1,NULL),(33,NULL,'Tirap',NULL,3,1,NULL),(34,NULL,'Dibang Valley',NULL,3,1,NULL),(35,NULL,'Upper Subansiri',NULL,3,1,NULL),(36,NULL,'West Kameng',NULL,3,1,NULL),(37,NULL,'Barpeta',NULL,4,1,NULL),(38,NULL,'Bongaigaon',NULL,4,1,NULL),(39,NULL,'Cachar',NULL,4,1,NULL),(40,NULL,'Darrang',NULL,4,1,NULL),(41,NULL,'Dhemaji',NULL,4,1,NULL),(42,NULL,'Dhubri',NULL,4,1,NULL),(43,NULL,'Dibrugarh',NULL,4,1,NULL),(44,NULL,'Goalpara',NULL,4,1,NULL),(45,NULL,'Golaghat',NULL,4,1,NULL),(46,NULL,'Hailakandi',NULL,4,1,NULL),(47,NULL,'Jorhat',NULL,4,1,NULL),(48,NULL,'Karbi Anglong',NULL,4,1,NULL),(49,NULL,'Karimganj',NULL,4,1,NULL),(50,NULL,'Kokrajhar',NULL,4,1,NULL),(51,NULL,'Lakhimpur',NULL,4,1,NULL),(52,NULL,'Marigaon',NULL,4,1,NULL),(53,NULL,'Nagaon',NULL,4,1,NULL),(54,NULL,'Nalbari',NULL,4,1,NULL),(55,NULL,'North Cachar Hills',NULL,4,1,NULL),(56,NULL,'Sibsagar',NULL,4,1,NULL),(57,NULL,'Sonitpur',NULL,4,1,NULL),(58,NULL,'Tinsukia',NULL,4,1,NULL),(59,NULL,'Araria',NULL,5,1,NULL),(60,NULL,'Aurangabad',NULL,5,1,NULL),(61,NULL,'Banka',NULL,5,1,NULL),(62,NULL,'Begusarai',NULL,5,1,NULL),(63,NULL,'Bhagalpur',NULL,5,1,NULL),(64,NULL,'Bhojpur',NULL,5,1,NULL),(65,NULL,'Buxar',NULL,5,1,NULL),(66,NULL,'Darbhanga',NULL,5,1,NULL),(67,NULL,'Purba Champaran',NULL,5,1,NULL),(68,NULL,'Gaya',NULL,5,1,NULL),(69,NULL,'Gopalganj',NULL,5,1,NULL),(70,NULL,'Jamui',NULL,5,1,NULL),(71,NULL,'Jehanabad',NULL,5,1,NULL),(72,NULL,'Khagaria',NULL,5,1,NULL),(73,NULL,'Kishanganj',NULL,5,1,NULL),(74,NULL,'Kaimur',NULL,5,1,NULL),(75,NULL,'Katihar',NULL,5,1,NULL),(76,NULL,'Lakhisarai',NULL,5,1,NULL),(77,NULL,'Madhubani',NULL,5,1,NULL),(78,NULL,'Munger',NULL,5,1,NULL),(79,NULL,'Madhepura',NULL,5,1,NULL),(80,NULL,'Muzaffarpur',NULL,5,1,NULL),(81,NULL,'Nalanda',NULL,5,1,NULL),(82,NULL,'Nawada',NULL,5,1,NULL),(83,NULL,'Patna',NULL,5,1,NULL),(84,NULL,'Purnia',NULL,5,1,NULL),(85,NULL,'Rohtas',NULL,5,1,NULL),(86,NULL,'Saharsa',NULL,5,1,NULL),(87,NULL,'Samastipur',NULL,5,1,NULL),(88,NULL,'Sheohar',NULL,5,1,NULL),(89,NULL,'Sheikhpura',NULL,5,1,NULL),(90,NULL,'Saran',NULL,5,1,NULL),(91,NULL,'Sitamarhi',NULL,5,1,NULL),(92,NULL,'Supaul',NULL,5,1,NULL),(93,NULL,'Siwan',NULL,5,1,NULL),(94,NULL,'Vaishali',NULL,5,1,NULL),(95,NULL,'Pashchim Champaran',NULL,5,1,NULL),(96,NULL,'Bastar',NULL,7,1,NULL),(97,NULL,'Bilaspur',NULL,7,1,NULL),(98,NULL,'Dantewada',NULL,7,1,NULL),(99,NULL,'Dhamtari',NULL,7,1,NULL),(100,NULL,'Durg',NULL,7,1,NULL),(101,NULL,'Jashpur',NULL,7,1,NULL),(102,NULL,'Janjgir-Champa',NULL,7,1,NULL),(103,NULL,'Korba',NULL,7,1,NULL),(104,NULL,'Koriya',NULL,7,1,NULL),(105,NULL,'Kanker',NULL,7,1,NULL),(106,NULL,'Kawardha',NULL,7,1,NULL),(107,NULL,'Mahasamund',NULL,7,1,NULL),(108,NULL,'Raigarh',NULL,7,1,NULL),(109,NULL,'Rajnandgaon',NULL,7,1,NULL),(110,NULL,'Raipur',NULL,7,1,NULL),(111,NULL,'Surguja',NULL,7,1,NULL),(112,NULL,'Diu',NULL,9,1,NULL),(113,NULL,'Daman',NULL,9,1,NULL),(114,NULL,'Central Delhi',NULL,10,1,NULL),(115,NULL,'East Delhi',NULL,10,1,NULL),(116,NULL,'New Delhi',NULL,10,1,NULL),(117,NULL,'North Delhi',NULL,10,1,NULL),(118,NULL,'North East Delhi',NULL,10,1,NULL),(119,NULL,'North West Delhi',NULL,10,1,NULL),(120,NULL,'South Delhi',NULL,10,1,NULL),(121,NULL,'South West Delhi',NULL,10,1,NULL),(122,NULL,'West Delhi',NULL,10,1,NULL),(123,NULL,'North Goa',NULL,11,1,NULL),(124,NULL,'South Goa',NULL,11,1,NULL),(125,NULL,'Ahmedabad',NULL,12,1,NULL),(126,NULL,'Amreli District',NULL,12,1,NULL),(127,NULL,'Anand',NULL,12,1,NULL),(128,NULL,'Banaskantha',NULL,12,1,NULL),(129,NULL,'Bharuch',NULL,12,1,NULL),(130,NULL,'Bhavnagar',NULL,12,1,NULL),(131,NULL,'Dahod',NULL,12,1,NULL),(132,NULL,'The Dangs',NULL,12,1,NULL),(133,NULL,'Gandhinagar',NULL,12,1,NULL),(134,NULL,'Jamnagar',NULL,12,1,NULL),(135,NULL,'Junagadh',NULL,12,1,NULL),(136,NULL,'Kutch',NULL,12,1,NULL),(137,NULL,'Kheda',NULL,12,1,NULL),(138,NULL,'Mehsana',NULL,12,1,NULL),(139,NULL,'Narmada',NULL,12,1,NULL),(140,NULL,'Navsari',NULL,12,1,NULL),(141,NULL,'Patan',NULL,12,1,NULL),(142,NULL,'Panchmahal',NULL,12,1,NULL),(143,NULL,'Porbandar',NULL,12,1,NULL),(144,NULL,'Rajkot',NULL,12,1,NULL),(145,NULL,'Sabarkantha',NULL,12,1,NULL),(146,NULL,'Surendranagar',NULL,12,1,NULL),(147,NULL,'Surat',NULL,12,1,NULL),(148,NULL,'Vadodara',NULL,12,1,NULL),(149,NULL,'Valsad',NULL,12,1,NULL),(150,NULL,'Ambala',NULL,13,1,NULL),(151,NULL,'Bhiwani',NULL,13,1,NULL),(152,NULL,'Faridabad',NULL,13,1,NULL),(153,NULL,'Fatehabad',NULL,13,1,NULL),(154,NULL,'Gurgaon',NULL,13,1,NULL),(155,NULL,'Hissar',NULL,13,1,NULL),(156,NULL,'Jhajjar',NULL,13,1,NULL),(157,NULL,'Jind',NULL,13,1,NULL),(158,NULL,'Karnal',NULL,13,1,NULL),(159,NULL,'Kaithal',NULL,13,1,NULL),(160,NULL,'Kurukshetra',NULL,13,1,NULL),(161,NULL,'Mahendragarh',NULL,13,1,NULL),(162,NULL,'Mewat',NULL,13,1,NULL),(163,NULL,'Panchkula',NULL,13,1,NULL),(164,NULL,'Panipat',NULL,13,1,NULL),(165,NULL,'Rewari',NULL,13,1,NULL),(166,NULL,'Rohtak',NULL,13,1,NULL),(167,NULL,'Sirsa',NULL,13,1,NULL),(168,NULL,'Sonepat',NULL,13,1,NULL),(169,NULL,'Yamuna Nagar',NULL,13,1,NULL),(170,NULL,'Palwal',NULL,13,1,NULL),(171,NULL,'Bilaspur',NULL,14,1,NULL),(172,NULL,'Chamba',NULL,14,1,NULL),(173,NULL,'Hamirpur',NULL,14,1,NULL),(174,NULL,'Kangra',NULL,14,1,NULL),(175,NULL,'Kinnaur',NULL,14,1,NULL),(176,NULL,'Kulu',NULL,14,1,NULL),(177,NULL,'Lahaul and Spiti',NULL,14,1,NULL),(178,NULL,'Mandi',NULL,14,1,NULL),(179,NULL,'Shimla',NULL,14,1,NULL),(180,NULL,'Sirmaur',NULL,14,1,NULL),(181,NULL,'Solan',NULL,14,1,NULL),(182,NULL,'Una',NULL,14,1,NULL),(183,NULL,'Anantnag',NULL,15,1,NULL),(184,NULL,'Badgam',NULL,15,1,NULL),(185,NULL,'Bandipore',NULL,15,1,NULL),(186,NULL,'Baramula',NULL,15,1,NULL),(187,NULL,'Doda',NULL,15,1,NULL),(188,NULL,'Jammu',NULL,15,1,NULL),(189,NULL,'Kargil',NULL,15,1,NULL),(190,NULL,'Kathua',NULL,15,1,NULL),(191,NULL,'Kupwara',NULL,15,1,NULL),(192,NULL,'Leh',NULL,15,1,NULL),(193,NULL,'Poonch',NULL,15,1,NULL),(194,NULL,'Pulwama',NULL,15,1,NULL),(195,NULL,'Rajauri',NULL,15,1,NULL),(196,NULL,'Srinagar',NULL,15,1,NULL),(197,NULL,'Samba',NULL,15,1,NULL),(198,NULL,'Udhampur',NULL,15,1,NULL),(199,NULL,'Bokaro',NULL,16,1,NULL),(200,NULL,'Chatra',NULL,16,1,NULL),(201,NULL,'Deoghar',NULL,16,1,NULL),(202,NULL,'Dhanbad',NULL,16,1,NULL),(203,NULL,'Dumka',NULL,16,1,NULL),(204,NULL,'Purba Singhbhum',NULL,16,1,NULL),(205,NULL,'Garhwa',NULL,16,1,NULL),(206,NULL,'Giridih',NULL,16,1,NULL),(207,NULL,'Godda',NULL,16,1,NULL),(208,NULL,'Gumla',NULL,16,1,NULL),(209,NULL,'Hazaribagh',NULL,16,1,NULL),(210,NULL,'Koderma',NULL,16,1,NULL),(211,NULL,'Lohardaga',NULL,16,1,NULL),(212,NULL,'Pakur',NULL,16,1,NULL),(213,NULL,'Palamu',NULL,16,1,NULL),(214,NULL,'Ranchi',NULL,16,1,NULL),(215,NULL,'Sahibganj',NULL,16,1,NULL),(216,NULL,'Seraikela and Kharsawan',NULL,16,1,NULL),(217,NULL,'Pashchim Singhbhum',NULL,16,1,NULL),(218,NULL,'Ramgarh',NULL,16,1,NULL),(219,NULL,'Bidar',NULL,17,1,NULL),(220,NULL,'Belgaum',NULL,17,1,NULL),(221,NULL,'Bijapur',NULL,17,1,NULL),(222,NULL,'Bagalkot',NULL,17,1,NULL),(223,NULL,'Bellary',NULL,17,1,NULL),(224,NULL,'Bangalore Rural District',NULL,17,1,NULL),(225,NULL,'Bangalore Urban District',NULL,17,1,NULL),(226,NULL,'Chamarajnagar',NULL,17,1,NULL),(227,NULL,'Chikmagalur',NULL,17,1,NULL),(228,NULL,'Chitradurga',NULL,17,1,NULL),(229,NULL,'Davanagere',NULL,17,1,NULL),(230,NULL,'Dharwad',NULL,17,1,NULL),(231,NULL,'Dakshina Kannada',NULL,17,1,NULL),(232,NULL,'Gadag',NULL,17,1,NULL),(233,NULL,'Gulbarga',NULL,17,1,NULL),(234,NULL,'Hassan',NULL,17,1,NULL),(235,NULL,'Haveri District',NULL,17,1,NULL),(236,NULL,'Kodagu',NULL,17,1,NULL),(237,NULL,'Kolar',NULL,17,1,NULL),(238,NULL,'Koppal',NULL,17,1,NULL),(239,NULL,'Mandya',NULL,17,1,NULL),(240,NULL,'Mysore',NULL,17,1,NULL),(241,NULL,'Raichur',NULL,17,1,NULL),(242,NULL,'Shimoga',NULL,17,1,NULL),(243,NULL,'Tumkur',NULL,17,1,NULL),(244,NULL,'Udupi',NULL,17,1,NULL),(245,NULL,'Uttara Kannada',NULL,17,1,NULL),(246,NULL,'Ramanagara',NULL,17,1,NULL),(247,NULL,'Chikballapur',NULL,17,1,NULL),(248,NULL,'Yadagiri',NULL,17,1,NULL),(249,NULL,'Alappuzha',NULL,18,1,NULL),(250,NULL,'Ernakulam',NULL,18,1,NULL),(251,NULL,'Idukki',NULL,18,1,NULL),(252,NULL,'Kollam',NULL,18,1,NULL),(253,NULL,'Kannur',NULL,18,1,NULL),(254,NULL,'Kasaragod',NULL,18,1,NULL),(255,NULL,'Kottayam',NULL,18,1,NULL),(256,NULL,'Kozhikode',NULL,18,1,NULL),(257,NULL,'Malappuram',NULL,18,1,NULL),(258,NULL,'Palakkad',NULL,18,1,NULL),(259,NULL,'Pathanamthitta',NULL,18,1,NULL),(260,NULL,'Thrissur',NULL,18,1,NULL),(261,NULL,'Thiruvananthapuram',NULL,18,1,NULL),(262,NULL,'Wayanad',NULL,18,1,NULL),(263,NULL,'Alirajpur',NULL,20,1,NULL),(264,NULL,'Anuppur',NULL,20,1,NULL),(265,NULL,'Ashok Nagar',NULL,20,1,NULL),(266,NULL,'Balaghat',NULL,20,1,NULL),(267,NULL,'Barwani',NULL,20,1,NULL),(268,NULL,'Betul',NULL,20,1,NULL),(269,NULL,'Bhind',NULL,20,1,NULL),(270,NULL,'Bhopal',NULL,20,1,NULL),(271,NULL,'Burhanpur',NULL,20,1,NULL),(272,NULL,'Chhatarpur',NULL,20,1,NULL),(273,NULL,'Chhindwara',NULL,20,1,NULL),(274,NULL,'Damoh',NULL,20,1,NULL),(275,NULL,'Datia',NULL,20,1,NULL),(276,NULL,'Dewas',NULL,20,1,NULL),(277,NULL,'Dhar',NULL,20,1,NULL),(278,NULL,'Dindori',NULL,20,1,NULL),(279,NULL,'Guna',NULL,20,1,NULL),(280,NULL,'Gwalior',NULL,20,1,NULL),(281,NULL,'Harda',NULL,20,1,NULL),(282,NULL,'Hoshangabad',NULL,20,1,NULL),(283,NULL,'Indore',NULL,20,1,NULL),(284,NULL,'Jabalpur',NULL,20,1,NULL),(285,NULL,'Jhabua',NULL,20,1,NULL),(286,NULL,'Katni',NULL,20,1,NULL),(287,NULL,'Khandwa',NULL,20,1,NULL),(288,NULL,'Khargone',NULL,20,1,NULL),(289,NULL,'Mandla',NULL,20,1,NULL),(290,NULL,'Mandsaur',NULL,20,1,NULL),(291,NULL,'Morena',NULL,20,1,NULL),(292,NULL,'Narsinghpur',NULL,20,1,NULL),(293,NULL,'Neemuch',NULL,20,1,NULL),(294,NULL,'Panna',NULL,20,1,NULL),(295,NULL,'Rewa',NULL,20,1,NULL),(296,NULL,'Rajgarh',NULL,20,1,NULL),(297,NULL,'Ratlam',NULL,20,1,NULL),(298,NULL,'Raisen',NULL,20,1,NULL),(299,NULL,'Sagar',NULL,20,1,NULL),(300,NULL,'Satna',NULL,20,1,NULL),(301,NULL,'Sehore',NULL,20,1,NULL),(302,NULL,'Seoni',NULL,20,1,NULL),(303,NULL,'Shahdol',NULL,20,1,NULL),(304,NULL,'Shajapur',NULL,20,1,NULL),(305,NULL,'Sheopur',NULL,20,1,NULL),(306,NULL,'Shivpuri',NULL,20,1,NULL),(307,NULL,'Sidhi',NULL,20,1,NULL),(308,NULL,'Singrauli',NULL,20,1,NULL),(309,NULL,'Tikamgarh',NULL,20,1,NULL),(310,NULL,'Ujjain',NULL,20,1,NULL),(311,NULL,'Umaria',NULL,20,1,NULL),(312,NULL,'Vidisha',NULL,20,1,NULL),(313,NULL,'Ahmednagar',NULL,21,1,NULL),(314,NULL,'Akola',NULL,21,1,NULL),(315,NULL,'Amrawati',NULL,21,1,NULL),(316,NULL,'Aurangabad',NULL,21,1,NULL),(317,NULL,'Bhandara',NULL,21,1,NULL),(318,NULL,'Beed',NULL,21,1,NULL),(319,NULL,'Buldhana',NULL,21,1,NULL),(320,NULL,'Chandrapur',NULL,21,1,NULL),(321,NULL,'Dhule',NULL,21,1,NULL),(322,NULL,'Gadchiroli',NULL,21,1,NULL),(323,NULL,'Gondiya',NULL,21,1,NULL),(324,NULL,'Hingoli',NULL,21,1,NULL),(325,NULL,'Jalgaon',NULL,21,1,NULL),(326,NULL,'Jalna',NULL,21,1,NULL),(327,NULL,'Kolhapur',NULL,21,1,NULL),(328,NULL,'Latur',NULL,21,1,NULL),(329,NULL,'Mumbai City',NULL,21,1,NULL),(330,NULL,'Mumbai suburban',NULL,21,1,NULL),(331,NULL,'Nandurbar',NULL,21,1,NULL),(332,NULL,'Nanded',NULL,21,1,NULL),(333,NULL,'Nagpur',NULL,21,1,NULL),(334,NULL,'Nashik',NULL,21,1,NULL),(335,NULL,'Osmanabad',NULL,21,1,NULL),(336,NULL,'Parbhani',NULL,21,1,NULL),(337,NULL,'Pune',NULL,21,1,NULL),(338,NULL,'Raigad',NULL,21,1,NULL),(339,NULL,'Ratnagiri',NULL,21,1,NULL),(340,NULL,'Sindhudurg',NULL,21,1,NULL),(341,NULL,'Sangli',NULL,21,1,NULL),(342,NULL,'Solapur',NULL,21,1,NULL),(343,NULL,'Satara',NULL,21,1,NULL),(344,NULL,'Thane',NULL,21,1,NULL),(345,NULL,'Wardha',NULL,21,1,NULL),(346,NULL,'Washim',NULL,21,1,NULL),(347,NULL,'Yavatmal',NULL,21,1,NULL),(348,NULL,'Bishnupur',NULL,22,1,NULL),(349,NULL,'Churachandpur',NULL,22,1,NULL),(350,NULL,'Chandel',NULL,22,1,NULL),(351,NULL,'Imphal East',NULL,22,1,NULL),(352,NULL,'Senapati',NULL,22,1,NULL),(353,NULL,'Tamenglong',NULL,22,1,NULL),(354,NULL,'Thoubal',NULL,22,1,NULL),(355,NULL,'Ukhrul',NULL,22,1,NULL),(356,NULL,'Imphal West',NULL,22,1,NULL),(357,NULL,'East Garo Hills',NULL,23,1,NULL),(358,NULL,'East Khasi Hills',NULL,23,1,NULL),(359,NULL,'Jaintia Hills',NULL,23,1,NULL),(360,NULL,'Ri-Bhoi',NULL,23,1,NULL),(361,NULL,'South Garo Hills',NULL,23,1,NULL),(362,NULL,'West Garo Hills',NULL,23,1,NULL),(363,NULL,'West Khasi Hills',NULL,23,1,NULL),(364,NULL,'Aizawl',NULL,24,1,NULL),(365,NULL,'Champhai',NULL,24,1,NULL),(366,NULL,'Kolasib',NULL,24,1,NULL),(367,NULL,'Lawngtlai',NULL,24,1,NULL),(368,NULL,'Lunglei',NULL,24,1,NULL),(369,NULL,'Mamit',NULL,24,1,NULL),(370,NULL,'Saiha',NULL,24,1,NULL),(371,NULL,'Serchhip',NULL,24,1,NULL),(372,NULL,'Dimapur',NULL,25,1,NULL),(373,NULL,'Kohima',NULL,25,1,NULL),(374,NULL,'Mokokchung',NULL,25,1,NULL),(375,NULL,'Mon',NULL,25,1,NULL),(376,NULL,'Phek',NULL,25,1,NULL),(377,NULL,'Tuensang',NULL,25,1,NULL),(378,NULL,'Wokha',NULL,25,1,NULL),(379,NULL,'Zunheboto',NULL,25,1,NULL),(380,NULL,'Angul',NULL,26,1,NULL),(381,NULL,'Boudh',NULL,26,1,NULL),(382,NULL,'Bhadrak',NULL,26,1,NULL),(383,NULL,'Bolangir',NULL,26,1,NULL),(384,NULL,'Bargarh',NULL,26,1,NULL),(385,NULL,'Baleswar',NULL,26,1,NULL),(386,NULL,'Cuttack',NULL,26,1,NULL),(387,NULL,'Debagarh',NULL,26,1,NULL),(388,NULL,'Dhenkanal',NULL,26,1,NULL),(389,NULL,'Ganjam',NULL,26,1,NULL),(390,NULL,'Gajapati',NULL,26,1,NULL),(391,NULL,'Jharsuguda',NULL,26,1,NULL),(392,NULL,'Jajapur',NULL,26,1,NULL),(393,NULL,'Jagatsinghpur',NULL,26,1,NULL),(394,NULL,'Khordha',NULL,26,1,NULL),(395,NULL,'Kendujhar',NULL,26,1,NULL),(396,NULL,'Kalahandi',NULL,26,1,NULL),(397,NULL,'Kandhamal',NULL,26,1,NULL),(398,NULL,'Koraput',NULL,26,1,NULL),(399,NULL,'Kendrapara',NULL,26,1,NULL),(400,NULL,'Malkangiri',NULL,26,1,NULL),(401,NULL,'Mayurbhanj',NULL,26,1,NULL),(402,NULL,'Nabarangpur',NULL,26,1,NULL),(403,NULL,'Nuapada',NULL,26,1,NULL),(404,NULL,'Nayagarh',NULL,26,1,NULL),(405,NULL,'Puri',NULL,26,1,NULL),(406,NULL,'Rayagada',NULL,26,1,NULL),(407,NULL,'Sambalpur',NULL,26,1,NULL),(408,NULL,'Subarnapur',NULL,26,1,NULL),(409,NULL,'Sundargarh',NULL,26,1,NULL),(410,NULL,'Karaikal',NULL,27,1,NULL),(411,NULL,'Mahe',NULL,27,1,NULL),(412,NULL,'Puducherry',NULL,27,1,NULL),(413,NULL,'Yanam',NULL,27,1,NULL),(414,NULL,'Amritsar',NULL,28,1,NULL),(415,NULL,'Bathinda',NULL,28,1,NULL),(416,NULL,'Firozpur',NULL,28,1,NULL),(417,NULL,'Faridkot',NULL,28,1,NULL),(418,NULL,'Fatehgarh Sahib',NULL,28,1,NULL),(419,NULL,'Gurdaspur',NULL,28,1,NULL),(420,NULL,'Hoshiarpur',NULL,28,1,NULL),(421,NULL,'Jalandhar',NULL,28,1,NULL),(422,NULL,'Kapurthala',NULL,28,1,NULL),(423,NULL,'Ludhiana',NULL,28,1,NULL),(424,NULL,'Mansa',NULL,28,1,NULL),(425,NULL,'Moga',NULL,28,1,NULL),(426,NULL,'Mukatsar',NULL,28,1,NULL),(427,NULL,'Nawan Shehar',NULL,28,1,NULL),(428,NULL,'Patiala',NULL,28,1,NULL),(429,NULL,'Rupnagar',NULL,28,1,NULL),(430,NULL,'Sangrur',NULL,28,1,NULL),(431,NULL,'Ajmer',NULL,29,1,NULL),(432,NULL,'Alwar',NULL,29,1,NULL),(433,NULL,'Bikaner',NULL,29,1,NULL),(434,NULL,'Barmer',NULL,29,1,NULL),(435,NULL,'Banswara',NULL,29,1,NULL),(436,NULL,'Bharatpur',NULL,29,1,NULL),(437,NULL,'Baran',NULL,29,1,NULL),(438,NULL,'Bundi',NULL,29,1,NULL),(439,NULL,'Bhilwara',NULL,29,1,NULL),(440,NULL,'Churu',NULL,29,1,NULL),(441,NULL,'Chittorgarh',NULL,29,1,NULL),(442,NULL,'Dausa',NULL,29,1,NULL),(443,NULL,'Dholpur',NULL,29,1,NULL),(444,NULL,'Dungapur',NULL,29,1,NULL),(445,NULL,'Ganganagar',NULL,29,1,NULL),(446,NULL,'Hanumangarh',NULL,29,1,NULL),(447,NULL,'Juhnjhunun',NULL,29,1,NULL),(448,NULL,'Jalore',NULL,29,1,NULL),(449,NULL,'Jodhpur',NULL,29,1,NULL),(450,NULL,'Jaipur',NULL,29,1,NULL),(451,NULL,'Jaisalmer',NULL,29,1,NULL),(452,NULL,'Jhalawar',NULL,29,1,NULL),(453,NULL,'Karauli',NULL,29,1,NULL),(454,NULL,'Kota',NULL,29,1,NULL),(455,NULL,'Nagaur',NULL,29,1,NULL),(456,NULL,'Pali',NULL,29,1,NULL),(457,NULL,'Pratapgarh',NULL,29,1,NULL),(458,NULL,'Rajsamand',NULL,29,1,NULL),(459,NULL,'Sikar',NULL,29,1,NULL),(460,NULL,'Sawai Madhopur',NULL,29,1,NULL),(461,NULL,'Sirohi',NULL,29,1,NULL),(462,NULL,'Tonk',NULL,29,1,NULL),(463,NULL,'Udaipur',NULL,29,1,NULL),(464,NULL,'East Sikkim',NULL,30,1,NULL),(465,NULL,'North Sikkim',NULL,30,1,NULL),(466,NULL,'South Sikkim',NULL,30,1,NULL),(467,NULL,'West Sikkim',NULL,30,1,NULL),(468,NULL,'Ariyalur',NULL,31,1,NULL),(469,NULL,'Chennai',NULL,31,1,NULL),(470,NULL,'Coimbatore',NULL,31,1,NULL),(471,NULL,'Cuddalore',NULL,31,1,NULL),(472,NULL,'Dharmapuri',NULL,31,1,NULL),(473,NULL,'Dindigul',NULL,31,1,NULL),(474,NULL,'Erode',NULL,31,1,NULL),(475,NULL,'Kanchipuram',NULL,31,1,NULL),(476,NULL,'Kanyakumari',NULL,31,1,NULL),(477,NULL,'Karur',NULL,31,1,NULL),(478,NULL,'Madurai',NULL,31,1,NULL),(479,NULL,'Nagapattinam',NULL,31,1,NULL),(480,NULL,'The Nilgiris',NULL,31,1,NULL),(481,NULL,'Namakkal',NULL,31,1,NULL),(482,NULL,'Perambalur',NULL,31,1,NULL),(483,NULL,'Pudukkottai',NULL,31,1,NULL),(484,NULL,'Ramanathapuram',NULL,31,1,NULL),(485,NULL,'Salem',NULL,31,1,NULL),(486,NULL,'Sivagangai',NULL,31,1,NULL),(487,NULL,'Tiruppur',NULL,31,1,NULL),(488,NULL,'Tiruchirappalli',NULL,31,1,NULL),(489,NULL,'Theni',NULL,31,1,NULL),(490,NULL,'Tirunelveli',NULL,31,1,NULL),(491,NULL,'Thanjavur',NULL,31,1,NULL),(492,NULL,'Thoothukudi',NULL,31,1,NULL),(493,NULL,'Thiruvallur',NULL,31,1,NULL),(494,NULL,'Thiruvarur',NULL,31,1,NULL),(495,NULL,'Tiruvannamalai',NULL,31,1,NULL),(496,NULL,'Vellore',NULL,31,1,NULL),(497,NULL,'Villupuram',NULL,31,1,NULL),(498,NULL,'Dhalai',NULL,32,1,NULL),(499,NULL,'North Tripura',NULL,32,1,NULL),(500,NULL,'South Tripura',NULL,32,1,NULL),(501,NULL,'West Tripura',NULL,32,1,NULL),(502,NULL,'Almora',NULL,33,1,NULL),(503,NULL,'Bageshwar',NULL,33,1,NULL),(504,NULL,'Chamoli',NULL,33,1,NULL),(505,NULL,'Champawat',NULL,33,1,NULL),(506,NULL,'Dehradun',NULL,33,1,NULL),(507,NULL,'Haridwar',NULL,33,1,NULL),(508,NULL,'Nainital',NULL,33,1,NULL),(509,NULL,'Pauri Garhwal',NULL,33,1,NULL),(510,NULL,'Pithoragharh',NULL,33,1,NULL),(511,NULL,'Rudraprayag',NULL,33,1,NULL),(512,NULL,'Tehri Garhwal',NULL,33,1,NULL),(513,NULL,'Udham Singh Nagar',NULL,33,1,NULL),(514,NULL,'Uttarkashi',NULL,33,1,NULL),(515,NULL,'Agra',NULL,34,1,NULL),(516,NULL,'Allahabad',NULL,34,1,NULL),(517,NULL,'Aligarh',NULL,34,1,NULL),(518,NULL,'Ambedkar Nagar',NULL,34,1,NULL),(519,NULL,'Auraiya',NULL,34,1,NULL),(520,NULL,'Azamgarh',NULL,34,1,NULL),(521,NULL,'Barabanki',NULL,34,1,NULL),(522,NULL,'Badaun',NULL,34,1,NULL),(523,NULL,'Bagpat',NULL,34,1,NULL),(524,NULL,'Bahraich',NULL,34,1,NULL),(525,NULL,'Bijnor',NULL,34,1,NULL),(526,NULL,'Ballia',NULL,34,1,NULL),(527,NULL,'Banda',NULL,34,1,NULL),(528,NULL,'Balrampur',NULL,34,1,NULL),(529,NULL,'Bareilly',NULL,34,1,NULL),(530,NULL,'Basti',NULL,34,1,NULL),(531,NULL,'Bulandshahr',NULL,34,1,NULL),(532,NULL,'Chandauli',NULL,34,1,NULL),(533,NULL,'Chitrakoot',NULL,34,1,NULL),(534,NULL,'Deoria',NULL,34,1,NULL),(535,NULL,'Etah',NULL,34,1,NULL),(536,NULL,'Kanshiram Nagar',NULL,34,1,NULL),(537,NULL,'Etawah',NULL,34,1,NULL),(538,NULL,'Firozabad',NULL,34,1,NULL),(539,NULL,'Farrukhabad',NULL,34,1,NULL),(540,NULL,'Fatehpur',NULL,34,1,NULL),(541,NULL,'Faizabad',NULL,34,1,NULL),(542,NULL,'Gautam Buddha Nagar',NULL,34,1,NULL),(543,NULL,'Gonda',NULL,34,1,NULL),(544,NULL,'Ghazipur',NULL,34,1,NULL),(545,NULL,'Gorkakhpur',NULL,34,1,NULL),(546,NULL,'Ghaziabad',NULL,34,1,NULL),(547,NULL,'Hamirpur',NULL,34,1,NULL),(548,NULL,'Hardoi',NULL,34,1,NULL),(549,NULL,'Mahamaya Nagar',NULL,34,1,NULL),(550,NULL,'Jhansi',NULL,34,1,NULL),(551,NULL,'Jalaun',NULL,34,1,NULL),(552,NULL,'Jyotiba Phule Nagar',NULL,34,1,NULL),(553,NULL,'Jaunpur District',NULL,34,1,NULL),(554,NULL,'Kanpur Dehat',NULL,34,1,NULL),(555,NULL,'Kannauj',NULL,34,1,NULL),(556,NULL,'Kanpur Nagar',NULL,34,1,NULL),(557,NULL,'Kaushambi',NULL,34,1,NULL),(558,NULL,'Kushinagar',NULL,34,1,NULL),(559,NULL,'Lalitpur',NULL,34,1,NULL),(560,NULL,'Lakhimpur Kheri',NULL,34,1,NULL),(561,NULL,'Lucknow',NULL,34,1,NULL),(562,NULL,'Mau',NULL,34,1,NULL),(563,NULL,'Meerut',NULL,34,1,NULL),(564,NULL,'Maharajganj',NULL,34,1,NULL),(565,NULL,'Mahoba',NULL,34,1,NULL),(566,NULL,'Mirzapur',NULL,34,1,NULL),(567,NULL,'Moradabad',NULL,34,1,NULL),(568,NULL,'Mainpuri',NULL,34,1,NULL),(569,NULL,'Mathura',NULL,34,1,NULL),(570,NULL,'Muzaffarnagar',NULL,34,1,NULL),(571,NULL,'Pilibhit',NULL,34,1,NULL),(572,NULL,'Pratapgarh',NULL,34,1,NULL),(573,NULL,'Rampur',NULL,34,1,NULL),(574,NULL,'Rae Bareli',NULL,34,1,NULL),(575,NULL,'Saharanpur',NULL,34,1,NULL),(576,NULL,'Sitapur',NULL,34,1,NULL),(577,NULL,'Shahjahanpur',NULL,34,1,NULL),(578,NULL,'Sant Kabir Nagar',NULL,34,1,NULL),(579,NULL,'Siddharthnagar',NULL,34,1,NULL),(580,NULL,'Sonbhadra',NULL,34,1,NULL),(581,NULL,'Sant Ravidas Nagar',NULL,34,1,NULL),(582,NULL,'Sultanpur',NULL,34,1,NULL),(583,NULL,'Shravasti',NULL,34,1,NULL),(584,NULL,'Unnao',NULL,34,1,NULL),(585,NULL,'Varanasi',NULL,34,1,NULL),(586,NULL,'Birbhum',NULL,35,1,NULL),(587,NULL,'Bankura',NULL,35,1,NULL),(588,NULL,'Bardhaman',NULL,35,1,NULL),(589,NULL,'Darjeeling',NULL,35,1,NULL),(590,NULL,'Dakshin Dinajpur',NULL,35,1,NULL),(591,NULL,'Hooghly',NULL,35,1,NULL),(592,NULL,'Howrah',NULL,35,1,NULL),(593,NULL,'Jalpaiguri',NULL,35,1,NULL),(594,NULL,'Cooch Behar',NULL,35,1,NULL),(595,NULL,'Kolkata',NULL,35,1,NULL),(596,NULL,'Malda',NULL,35,1,NULL),(597,NULL,'Midnapore',NULL,35,1,NULL),(598,NULL,'Murshidabad',NULL,35,1,NULL),(599,NULL,'Nadia',NULL,35,1,NULL),(600,NULL,'North 24 Parganas',NULL,35,1,NULL),(601,NULL,'South 24 Parganas',NULL,35,1,NULL),(602,NULL,'Purulia',NULL,35,1,NULL),(603,NULL,'Uttar Dinajpur',NULL,35,1,NULL),(604,NULL,'Chandigarh',NULL,6,1,NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_generation`
--

DROP TABLE IF EXISTS `code_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_generation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint DEFAULT NULL,
  `custom_field_id` bigint DEFAULT NULL,
  `prefix` varchar(45) DEFAULT NULL,
  `other_prefix` varchar(45) DEFAULT NULL,
  `module_prefix` bigint DEFAULT NULL,
  `module_prefix_ref` bigint DEFAULT NULL,
  `delimiter` varchar(45) DEFAULT NULL,
  `start_from` varchar(45) DEFAULT NULL,
  `code_format` varchar(45) DEFAULT NULL,
  `char_count` int DEFAULT NULL,
  `code_base` varchar(45) DEFAULT NULL,
  `code_base_ref` bigint DEFAULT NULL,
  `fy_reset` tinyint DEFAULT '1',
  `status` varchar(45) DEFAULT 'Active',
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_custom_field_id` (`custom_field_id`),
  CONSTRAINT `fk_custom_field_id` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_generation`
--

LOCK TABLES `code_generation` WRITE;
/*!40000 ALTER TABLE `code_generation` DISABLE KEYS */;
INSERT INTO `code_generation` VALUES (1,112,2,'CP',NULL,0,NULL,NULL,'1','###1',6,'none',NULL,0,'1',1,'2020-12-16 12:04:18',1,'2021-07-14 14:54:45',1,1),(2,132,108,'ZN',NULL,0,NULL,NULL,'1','###1',6,'none',NULL,0,'1',1,'2020-12-16 12:04:18',1,'2021-07-14 14:54:45',1,1),(3,127,219,'EMP',NULL,0,NULL,NULL,'1','###1',7,'none',NULL,0,'1',1,'2020-12-16 12:04:18',1,'2021-07-14 14:54:45',1,1),(4,124,112,'BH',NULL,0,NULL,NULL,'1','###1',6,'none',NULL,0,'1',1,'2020-12-16 12:04:18',1,'2021-07-14 14:54:45',1,1),(5,129,198,'RL',NULL,0,NULL,NULL,'1','###1',6,'none',NULL,0,'1',1,'2021-08-02 09:43:59',1,'2021-08-02 09:43:59',1,1);
/*!40000 ALTER TABLE `code_generation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_reminders`
--

DROP TABLE IF EXISTS `common_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `common_reminders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint DEFAULT NULL,
  `doc_ref_id` bigint DEFAULT NULL,
  `remarks` varchar(600) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `posted_timestamp` datetime DEFAULT NULL,
  `reminder_timestamp` datetime DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `common_reminders_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_reminders`
--

LOCK TABLES `common_reminders` WRITE;
/*!40000 ALTER TABLE `common_reminders` DISABLE KEYS */;
INSERT INTO `common_reminders` VALUES (13,201,100,'Testing Comment',1,NULL,'2021-01-28 18:08:47','2021-01-28 18:08:47',NULL,NULL,'2021-01-28 18:08:47','2021-01-29 18:08:00',NULL),(14,201,100,'tfgrgfds',1,NULL,'2021-01-28 18:10:49','2021-01-28 18:10:49',NULL,NULL,'2021-01-28 18:10:49','2021-01-29 21:13:00',NULL),(15,201,99,'dfgdfsgds',1,NULL,'2021-01-28 18:11:11','2021-01-28 18:11:11',NULL,NULL,'2021-01-28 18:11:11','2021-01-29 18:11:00',NULL),(16,201,100,'test',1,NULL,'2021-01-28 18:14:02','2021-01-28 18:14:02',NULL,NULL,'2021-01-28 18:14:02','2021-02-01 20:16:00',NULL),(17,201,100,'How to Handle It',1,NULL,'2021-01-28 18:16:06','2021-01-28 18:16:06',NULL,NULL,'2021-01-28 18:16:06','2021-02-01 20:17:00',NULL),(18,201,100,'How to Handle It',1,NULL,'2021-01-28 18:16:35','2021-01-28 18:16:35',NULL,NULL,'2021-01-28 18:16:35','2021-01-28 21:19:00',NULL),(19,201,100,'dfjsofds',1,NULL,'2021-01-28 18:18:01','2021-01-28 18:18:01',NULL,NULL,'2021-01-28 18:18:01','2021-01-30 18:21:00',NULL),(20,201,100,'Full Stack Developer',1,NULL,'2021-01-28 18:19:21','2021-01-28 18:19:21',NULL,NULL,'2021-01-28 18:19:21','2021-02-06 21:19:00',NULL),(21,201,100,'Testing',1,NULL,'2021-01-28 18:20:25','2021-01-28 18:20:25',NULL,NULL,'2021-01-28 18:20:25','2021-01-29 22:24:00',NULL),(22,201,100,'sadfdswaf',1,NULL,'2021-01-28 18:20:38','2021-01-28 18:20:38',NULL,NULL,'2021-01-28 18:20:38','2021-02-06 22:24:00',NULL),(23,201,100,'sdfdsa',1,NULL,'2021-01-28 18:20:49','2021-01-28 18:20:49',NULL,NULL,'2021-01-28 18:20:49','2021-02-06 22:24:00',NULL),(24,201,100,'Hello World',1,NULL,'2021-01-28 18:22:30','2021-01-28 18:22:30',NULL,NULL,'2021-01-28 18:22:30','2021-02-10 22:00:00',NULL);
/*!40000 ALTER TABLE `common_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_code` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `address` longtext,
  `area_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `pin_code` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `msme_reg` enum('No','Yes') DEFAULT NULL,
  `msme_reg_no` varchar(100) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `gst_No` varchar(45) DEFAULT NULL,
  `pan_NO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_company_idx` (`company_name`),
  KEY `FK_area_company` (`area_id`),
  KEY `FK_user_company_createdBy` (`created_by`),
  KEY `FK_user_company_modifiedBy` (`modified_by`),
  KEY `FK_city_company_idx` (`city_id`),
  KEY `FK_company_company_idx` (`company_id`),
  KEY `FK_branch_company_idx` (`branch_id`),
  CONSTRAINT `FK_branch_company` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_user_company_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_company_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'CP0001','Shivit','NOIDA',NULL,133230,'info@shivit.com',7827230454,201301,2,'No',NULL,1,'2020-08-14 15:13:34',1,'2021-07-31 19:29:32',1,1,'987485748544','ALGPC2416B'),(9,'CP0002','BSI','NOIDA',NULL,133230,'info@bsi.com',NULL,248007,2,'No',NULL,1,'2021-08-02 15:55:57',1,'2021-08-02 15:57:24',1,1,'121313','DKGPK2648M'),(10,'CP0003','JellyBean','H-141',NULL,133230,'info@jelly.com',NULL,248007,2,'No',NULL,1,'2021-08-02 16:02:03',1,'2021-08-02 16:35:17',1,1,'09AASCS3558A1Z3','DKGPK2648M'),(11,'CP0004','BSIII',NULL,NULL,133230,'info@shivit.com',NULL,248007,1,'No',NULL,1,'2021-08-02 16:35:58',1,'2021-08-09 18:31:44',1,1,'09AASCS3558A1Z7','DKGPK2648M'),(12,'CP0005','BSIIIII','H-141',NULL,133230,'info@shivit.com',NULL,248007,1,'No',NULL,1,'2021-08-02 16:51:11',1,'2021-08-09 18:31:35',1,1,'09AASCS3558A1Z8','DKGPK2648M'),(14,'CP0006','ShivitDemo111','H-141',NULL,133230,'info@bsi.com',9149065796,209115,1,'No',NULL,1,'2021-08-03 10:17:01',1,'2021-08-09 18:31:02',1,1,'09AASCS3558A1Z7','DKGPK2648M'),(15,'CP0007','ShivitDemo121','H-141',NULL,57708,'info@bsi.com',NULL,209115,1,'No',NULL,1,'2021-08-03 10:34:41',1,'2021-08-09 18:30:48',1,1,'09AASCS3558A1Z7','DKGPK2648M'),(16,'CP0008','JellyBeanDemo','H-141',NULL,131675,'info@bsi.com',9149065796,209115,1,'No',NULL,1,'2021-08-03 20:44:05',1,'2021-08-09 18:29:27',1,1,'09AASCS3558A1Z7','DKGPK2648M'),(18,'CP0009','DAN','H-141 Noida 63',NULL,57623,'shivittech123@gmail.com',9149065796,2090115,1,'No',NULL,1,'2021-08-03 21:21:40',1,'2021-08-09 18:29:19',1,1,'09AASCS3558A1Z3','DKGPK2648M'),(19,'CP0010','Shivit Technologies Pvt. Ltd',NULL,NULL,133230,'hr@shivit.com',9818101107,201301,2,'No',NULL,1,'2021-08-09 18:28:45',1,'2021-08-09 18:28:45',1,1,'09AASCS3558A1Z7','DFGHJ0776D');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact_person` varchar(150) NOT NULL,
  `phone` int DEFAULT NULL,
  `mobile` int DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Active',
  `module_id` bigint NOT NULL,
  `ref_doc` bigint NOT NULL COMMENT 'It is reference id/row id of corresponding data in a module eg: -\n if a contact person is entered in Branch master then id of particular branch is saved in this column.',
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_refDoc_email` (`email`,`ref_doc`),
  KEY `FK_modules_contactDetails_idx` (`module_id`),
  KEY `FK_branch_contactDetails_idx` (`ref_doc`),
  KEY `FK_branch_contactDetails_branchId_idx` (`branch_id`),
  KEY `FK_company_contactDetails_companyId_idx` (`company_id`),
  KEY `FK_user_contactDetails_idx` (`created_by`),
  KEY `FK_user_contactDetails_modifiedBy_idx` (`modified_by`),
  CONSTRAINT `FK_branch_contactDetails_branchId` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_branch_contactDetails_refDoc` FOREIGN KEY (`ref_doc`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_contactDetails_companyId` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_company_contactDetails_refDoc` FOREIGN KEY (`ref_doc`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_modules_contactDetails` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_user_contactDetails_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_contactDetails_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `isd_code` varchar(255) DEFAULT NULL,
  `country_language` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AFG','Afghanistan',2,'93','Dari Persian',1),(2,'ALB','Albania',3,'355','Albanian',1),(3,'DZA','Algeria',38,'213','Arabic',1),(4,'ASM','American Samoa',138,'1684','N/A',1),(5,'AND','Andorra',42,'376','CatalÃƒÂ¡n ',1),(6,'AGO','Angola',5,'244','Portuguese',1),(7,'AIA','Anguilla',146,'1264','English',1),(8,'ATA','Antarctica',0,'672','N/A',1),(9,'ARG','Argentina',6,'54','Spanish',1),(10,'ARM','Armenia',4,'374','Armenian',1),(11,'ABW','Aruba',8,'297','N/A',1),(12,'AUS','Australia',7,'61','English',1),(13,'AUT','Austria',42,'43','German',1),(14,'AZE','Azerbaijan',9,'994','Azerbaijani Turkic',1),(15,'BHS','Bahamas',20,'1','English',1),(16,'BHR','Bahrain',14,'973','Arabic',1),(17,'BGD','Bangladesh',12,'880','Bangla',1),(18,'BRB','Barbados',11,'1','English',1),(19,'BLR','Belarus',23,'375','Belorussian',1),(20,'BEL','Belgium',42,'32','Dutch',1),(21,'BLZ','Belize',24,'501','English',1),(22,'BEN','Benin',146,'229','French',1),(23,'BMU','Bermuda',16,'1','N/A',1),(24,'BTN','Bhutan',21,'975','Dzongkha',1),(25,'BOL','Bolivia',18,'591','Spanish',1),(26,'BIH','Bosnia and Herzegovina',10,'387','Bosnian',1),(27,'BWA','Botswana',22,'267','Setswana',1),(28,'BRA','Brazil',19,'55','Portuguese',1),(29,'VGB','British Virgin Islands',19,'1284','N/A',1),(30,'BRN','Brunei',19,'673','Malay',1),(31,'BGR','Bulgaria',13,'359','Bulgarian',1),(32,'BFA','Burkina Faso',146,'226','French',1),(33,'BDI','Burundi',15,'257','Kirundi',1),(34,'KHM','Cambodia',69,'855','Khmer',1),(35,'CMR','Cameroon',145,'237','French',1),(36,'CAN','Canada',25,'1','English',1),(37,'CPV','Cape Verde',33,'238','Portuguese',1),(38,'CYM','Cayman Islands',73,'1345','N/A',1),(39,'CAF','Central African Republic',145,'236','French',1),(40,'CHL','Chile',28,'56','Spanish',1),(41,'CHN','China',29,'86','Chinese',1),(42,'COL','Colombia',30,'57','Spanish',1),(43,'COM','Comoros',69,'269','Arabic',1),(44,'COK','Cook Islands',100,'682','N/A',1),(45,'CRI','Costa Rica',31,'506','Spanish',1),(46,'HRV','Croatia',146,'385','Croatian',1),(47,'CUB','Cuba',32,'53','Spanish',1),(48,'CUW','Curacao',32,'599','N/A',1),(49,'CYP','Cyprus',42,'357','Greek',1),(50,'CZE','Czech Republic',34,'420','Czech',1),(51,'COD','Democratic Republic of Congo',34,'243','N/A',1),(52,'DNK','Denmark',36,'45','Danish',1),(53,'DJI','Djibouti',35,'253','Arabic',1),(54,'DMA','Dominica',146,'1','English',1),(55,'DOM','Dominican Republic',37,'1','Spanish',1),(56,'TLS','East Timor',37,'670','Tetum',1),(57,'ECU','Ecuador',138,'593','Spanish',1),(58,'EGY','Egypt',39,'20','Arabic',1),(59,'SLV','El Salvador',124,'503','Spanish',1),(60,'GNQ','Equatorial Guinea',145,'240','Spanish',1),(61,'ERI','Eritrea',40,'291','Afar',1),(62,'EST','Estonia',38,'372','Estonian',1),(63,'ETH','Ethiopia',41,'251','Amharic',1),(64,'FLK','Falkland Islands',41,'500','N/A',1),(65,'FRO','Faroe Islands',44,'298','N/A',1),(66,'FJI','Fiji',43,'679','English',1),(67,'FIN','Finland',42,'358','Finnish',1),(68,'FRA','France',42,'33','French',1),(69,'PYF','French Polynesia',147,'689','N/A',1),(70,'GAB','Gabon',145,'241','French',1),(71,'GMB','Gambia',49,'220','English',1),(72,'GEO','Georgia',46,'995','Georgian',1),(73,'DEU','Germany',42,'49','German',1),(74,'GHA','Ghana',46,'233','English',1),(75,'GIB','Gibraltar',48,'350','N/A',1),(76,'GRC','Greece',42,'30','Greek',1),(77,'GRL','Greenland',36,'299','N/A',1),(78,'GLP','Guadeloupe',42,'590','N/A',1),(79,'GUM','Guam',138,'1 671','N/A',1),(80,'GTM','Guatemala',51,'502','Spanish',1),(81,'GIN','Guinea',50,'224','French',1),(82,'GNB','Guinea-Bissau',51,'245','Portuguese',1),(83,'GUY','Guyana',52,'592','English',1),(84,'HTI','Haiti',56,'509','Creole',1),(85,'HND','Honduras',54,'504','Spanish',1),(86,'HKG','Hong Kong',53,'852','Thai',1),(87,'HUN','Hungary',57,'36','Magyar',1),(88,'ISL','Iceland',63,'354','Icelandic',1),(89,'IND','India',60,'91','Hindi, Oriya, Punjabi, Tamil, Telugu, Urdu, Kannada, Assamese, Sanskrit, Sindhi',1),(90,'IDN','Indonesia',58,'62','Bahasa Indonesia',1),(91,'IRN','Iran',62,'98','Persian',1),(92,'IRQ','Iraq',61,'964','Arabic',1),(93,'IRL','Ireland',42,'353','English',1),(94,'IMN','Isle of Man',42,'44','N/A',1),(95,'ISR','Israel',59,'972','Hebrew',1),(96,'ITA','Italy',42,'39','Italian',1),(97,'CIV','Ivory Coast',42,'225','N/A',1),(98,'JAM','Jamaica',64,'1','English',1),(99,'JPN','Japan',66,'81','Japanese',1),(100,'JOR','Jordan',65,'962','Arabic',1),(101,'KAZ','Kazakhstan',74,'7','Kazak',1),(102,'KEN','Kenya',67,'254','English',1),(103,'KIR','Kiribati',7,'686','English',1),(104,'XKX','Kosovo',71,'381','Albanian',1),(105,'KWT','Kuwait',72,'965','Arabic',1),(106,'KGZ','Kyrgyzstan',68,'996','Kyrgyz',1),(107,'LAO','Laos',75,'856','Lao',1),(108,'LVA','Latvia',42,'371','Latvian',1),(109,'LBN','Lebanon',76,'961','Arabic',1),(110,'LSO','Lesotho',79,'266','English',1),(111,'LBR','Liberia',78,'231','English',1),(112,'LBY','Libya',80,'218','Arabic',1),(113,'LIE','Liechtenstein',27,'423','German',1),(114,'LTU','Lithuania',79,'370','Lithuanian',1),(115,'LUX','Luxembourg',42,'352','Luxermbo',1),(116,'MAC','Macau',87,'853','N/A',1),(117,'MKD','Macedonia',87,'389','Macedoni',1),(118,'MDG','Madagascar',83,'261','Malagasy',1),(119,'MWI','Malawi',91,'265','Chichewa',1),(120,'MYS','Malaysia',93,'60','Bahasa Melayu',1),(121,'MDV','Maldives',90,'960','Maldivian Dhivehi',1),(122,'MLI','Mali',146,'223','French',1),(123,'MLT','Malta',88,'356','Maltese',1),(124,'MHL','Marshall Islands',138,'692','Marshalle',1),(125,'MRT','Mauritania',88,'222','Hassaniya Arabic',1),(126,'MUS','Mauritius',89,'230','Creole',1),(127,'MEX','Mexico',92,'52','Spanish',1),(128,'FSM','Micronesia',92,'691','English',1),(129,'MDA','Moldova',138,'373','Moldovan',1),(130,'MCO','Monaco',42,'377','French',1),(131,'MNG','Mongolia',86,'976','Mangolian',1),(132,'MNE','Montenegro',42,'382','Serbian',1),(133,'MSR','Montserrat',146,'1 664','N/A',1),(134,'MAR','Morocco',81,'212','Arabic',1),(135,'MOZ','Mozambique',93,'258','Portuguese',1),(136,'MMR','Myanmar [Burma]',93,'95','Burmese',1),(137,'NAM','Namibia',95,'264','English',1),(138,'NRU','Nauru',7,'674','Nauran',1),(139,'NPL','Nepal',99,'977','Nepali',1),(140,'NLD','Netherlands',42,'31','Dutch',1),(141,'NCL','New Caledonia',147,'687','English',1),(142,'NZL','New Zealand',100,'64','Spanish',1),(143,'NIC','Nicaragua',97,'505','French',1),(144,'NER','Niger',146,'227','English',1),(145,'NGA','Nigeria',96,'234','N/A',1),(146,'NIU','Niue',100,'683','N/A',1),(147,'NFK','Norfolk Island',100,'672','N/A',1),(148,'PRK','North Korea',100,'850','Korean',1),(149,'MNP','Northern Mariana Islands',138,'1 670','N/A',1),(150,'NOR','Norway',98,'47','BokmÃƒÂ¥l Norwegian',1),(151,'OMN','Oman',101,'968','Arabic',1),(152,'PAK','Pakistan',106,'92','Urdu',1),(153,'PLW','Palau',138,'680','Palauan',1),(154,'PAN','Panama',102,'507','Spanish',1),(155,'PNG','Papua New Guinea',104,'675','Tok Pisin',1),(156,'PRY','Paraguay',108,'595','Spanish',1),(157,'PER','Peru',103,'51','Spanish',1),(158,'PHL','Philippines',105,'63','Filipino',1),(159,'PCN','Pitcairn Islands',100,'870','N/A',1),(160,'POL','Poland',107,'48','Polish',1),(161,'PRT','Portugal',42,'351','Portuguese',1),(162,'PRI','Puerto Rico',138,'1','N/A',1),(163,'QAT','Qatar',109,'974','Arabic',1),(164,'COG','Republic of the Congo',109,'242','N/A',1),(165,'REU','Reunion',109,'262','N/A',1),(166,'ROU','Romania',109,'40','Romanian',1),(167,'RUS','Russia',109,'7','Russian',1),(168,'RWA','Rwanda',113,'250','Kinyarwanda',1),(169,'BLM','Saint BarthÃƒÂ©lemy',113,'590','N/A',1),(170,'SHN','Saint Helena',120,'290','N/A',1),(171,'KNA','Saint Kitts and Nevis',146,'1','English',1),(172,'LCA','Saint Lucia',146,'1','English',1),(173,'MAF','Saint Martin',146,'1 599','N/A',1),(174,'SPM','Saint Pierre and Miquelon',146,'508','N/A',1),(175,'VCT','Saint Vincent and the Grenadines',146,'1','English',1),(176,'WSM','Samoa',144,'685','Samoan',1),(177,'SMR','San Marino',42,'378','Italian',1),(178,'STP','Sao Tome and Principe',124,'239','Portuguese',1),(179,'SAU','Saudi Arabia',114,'966','Arabic',1),(180,'SEN','Senegal',146,'221','French',1),(181,'SRB','Serbia',31,'381','Serbian',1),(182,'SYC','Seychelles',116,'248','Seselwa Creole',1),(183,'SLE','Sierra Leone',121,'232','English',1),(184,'SGP','Singapore',119,'65','Mandarin',1),(185,'SVK','Slovakia',119,'421','Slovak',1),(186,'SVN','Slovenia',42,'386','Slovenian',1),(187,'SLB','Solomon Islands',115,'677','English',1),(188,'SOM','Somalia',122,'252','Somali',1),(189,'ZAF','South Africa',149,'27','IsiZulu',1),(190,'KOR','South Korea',149,'82','Korean',1),(191,'SSD','South Sudan',123,'211','English',1),(192,'ESP','Spain',42,'34','Castilian Spanish',1),(193,'LKA','Sri Lanka',77,'94','Sinhala',1),(194,'SDN','Sudan',116,'249','Arabic',1),(195,'SUR','Suriname',123,'597','Dutch',1),(196,'SWZ','Swaziland',126,'268','English',1),(197,'SWE','Sweden',118,'46','Swedish',1),(198,'CHE','Switzerland',27,'41','German',1),(199,'SYR','Syria',27,'963','Arabic',1),(200,'TWN','Taiwan',125,'886','Chinese',1),(201,'TJK','Tajikistan',128,'992','Tajik',1),(202,'TZA','Tanzania',135,'255','English',1),(203,'THA','Thailand',127,'66','Thai',1),(204,'TGO','Togo',146,'228','French',1),(205,'TKL','Tokelau',100,'690','Tongan',1),(206,'TTO','Trinidad and Tobago',133,'1','English',1),(207,'TUN','Tunisia',130,'216','Arabic',1),(208,'TUR','Turkey',132,'90','Turkish',1),(209,'TKM','Turkmenistan',128,'993','Turkmen',1),(210,'TUV','Tuvalu',7,'688','Tuvaluan',1),(211,'UGA','Uganda',137,'256','English',1),(212,'UKR','Ukraine',136,'380','Ukrainian',1),(213,'ARE','United Arab Emirates',1,'971','Arabic',1),(214,'GBR','United Kingdom',45,'44','English',1),(215,'USA','United States',138,'1','English',1),(216,'URY','Uruguay',139,'598','Spanish',1),(217,'UZB','Uzbekistan',140,'998','Uzbek',1),(218,'VUT','Vanuatu',143,'678','Bislama',1),(219,'VAT','Vatican',143,'39','Italian',1),(220,'VEN','Venezuela',141,'58','Spanish',1),(221,'VNM','Vietnam',142,'84','Vietnamese',1),(222,'ESH','Western Sahara',81,'212','Hassaniya Arabic',1),(223,'YEM','Yemen',148,'967','Arabic',1),(224,'ZMB','Zambia',150,'260','English',1),(225,'ZWE','Zimbabwe',150,'263','English',1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_data`
--

DROP TABLE IF EXISTS `custom_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint DEFAULT NULL,
  `document_id` bigint DEFAULT NULL,
  `field_data` longtext,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customFields_customFieldData` (`custom_field_id`),
  KEY `FK_user_customeFieldData_createdBy_idx` (`created_by`),
  KEY `FK_user_customeFieldData_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_customFieldData_idx` (`company_id`),
  KEY `FK_branch_customFieldData_idx` (`branch_id`),
  CONSTRAINT `FK_branch_customFieldData` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_customFieldData` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_customFields_customFieldData` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FK_user_customeFieldData_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_customeFieldData_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_data`
--

LOCK TABLES `custom_field_data` WRITE;
/*!40000 ALTER TABLE `custom_field_data` DISABLE KEYS */;
INSERT INTO `custom_field_data` VALUES (1,194,1,NULL,NULL,'2021-07-10 08:09:49',NULL,'2021-08-09 09:26:39',NULL,NULL),(4,194,NULL,NULL,NULL,'2021-08-02 06:25:57',NULL,'2021-08-02 06:25:57',NULL,NULL),(5,194,NULL,NULL,NULL,'2021-08-02 06:32:03',NULL,'2021-08-02 07:05:17',NULL,NULL),(6,194,NULL,NULL,NULL,'2021-08-02 07:05:57',NULL,'2021-08-09 09:01:44',NULL,NULL),(7,194,NULL,NULL,NULL,'2021-08-02 07:21:10',NULL,'2021-08-03 11:14:05',NULL,NULL),(8,194,NULL,NULL,NULL,'2021-08-03 00:47:00',NULL,'2021-08-07 00:22:00',NULL,NULL),(9,194,NULL,NULL,NULL,'2021-08-03 01:04:41',NULL,'2021-08-03 06:25:16',NULL,NULL),(10,194,NULL,NULL,NULL,'2021-08-03 11:14:04',NULL,'2021-08-07 02:03:34',NULL,NULL),(11,194,NULL,NULL,NULL,'2021-08-03 11:51:40',NULL,'2021-08-07 00:22:00',NULL,NULL),(12,194,19,NULL,NULL,'2021-08-09 08:58:44',NULL,'2021-08-09 08:58:44',NULL,NULL);
/*!40000 ALTER TABLE `custom_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_field_id` bigint DEFAULT NULL,
  `field_name` varchar(225) NOT NULL,
  `field_header` varchar(255) NOT NULL,
  `field_type` bigint NOT NULL,
  `is_mandatory` varchar(100) DEFAULT NULL,
  `error_message` text,
  `type` varchar(45) NOT NULL,
  `src_module` bigint DEFAULT NULL,
  `on_change` varchar(200) DEFAULT NULL,
  `on_click` varchar(200) DEFAULT NULL,
  `default_show` tinyint DEFAULT '1',
  `show_on` bigint DEFAULT '0',
  `entry_type` varchar(45) DEFAULT NULL,
  `module_id` bigint NOT NULL,
  `display_order` int NOT NULL,
  `data_src` varchar(45) DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `is_indexing` tinyint DEFAULT '0',
  `tooltip_type` varchar(45) DEFAULT NULL,
  `tooltip_title` varchar(255) DEFAULT NULL,
  `tooltip_content` varchar(255) DEFAULT NULL,
  `tootip_activation` varchar(50) DEFAULT NULL,
  `short_link` tinyint DEFAULT NULL,
  `field_indexing_id` bigint DEFAULT NULL,
  `short_link_enabled` tinyint DEFAULT '0',
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `folder_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fieldName_moduleId_idx` (`field_name`,`module_id`,`parent_field_id`),
  UNIQUE KEY `UK_fieldHeader_moduleId_idx` (`field_header`,`module_id`,`parent_field_id`),
  KEY `FK_fieldType_customFields` (`field_type`),
  KEY `Fk_modules_customFields_idx` (`module_id`),
  KEY `Fk_modules_customFields_idx1` (`src_module`),
  KEY `FK_fieldIndexing_customField_idx` (`field_indexing_id`),
  KEY `FK_branch_customField_idx` (`branch_id`),
  KEY `FK_company_customField_idx` (`company_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_branch_customField` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_customField` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_fieldIndexing_customField` FOREIGN KEY (`field_indexing_id`) REFERENCES `fields_indexing` (`id`),
  CONSTRAINT `FK_fieldType_customFields` FOREIGN KEY (`field_type`) REFERENCES `field_type` (`id`),
  CONSTRAINT `Fk_modules_customFields_moduleId` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=706 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,NULL,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',112,1,NULL,1,1,'popover','id','id','hover',0,1,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(2,NULL,'companyCode','Company Code',1,NULL,NULL,'AutoGenerate',NULL,NULL,NULL,1,0,'STD',112,2,NULL,1,1,'popover','Company Code','Company is a representive Code of a Company which is generating Automatically','hover',0,220,0,1,'2020-08-16 17:29:34',1,'2021-08-02 07:20:22',NULL,NULL,NULL),(3,NULL,'companyName','Company Name',1,'required','Please Enter Company Name','Manual',NULL,NULL,NULL,1,0,'STD',112,3,NULL,1,1,'popover','Company Name','Company is the Unique Name of the Company on Which GST and PAN are registered','hover',0,2,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(4,NULL,'address','Company Address',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,4,NULL,1,1,'popover','Company Address','Address of the company on which Company Name is Registered','hover',0,4,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(5,NULL,'countryId','Country',4,'required','Please Select Country','Manual',207,NULL,NULL,1,0,'STD',112,5,NULL,1,1,'popover','Country','Country of the Company','hover',0,7,0,1,'2020-08-16 17:29:34',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(6,NULL,'stateId','State',4,'required','Please Select State','Manual',208,'5',NULL,1,0,'STD',112,6,NULL,1,1,'popover','State','State of the compeny','hover',0,8,0,1,'2020-08-16 17:29:34',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(7,NULL,'cityId','City',4,'required','Please Select City','Manual',209,'6',NULL,1,0,'STD',112,7,NULL,1,1,'popover','City','City of the Company','hover',0,9,0,1,'2020-08-16 17:29:34',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(8,NULL,'companyEmail','Email',19,'required','Please Enter Email','Manual',NULL,NULL,NULL,1,0,'STD',112,8,NULL,1,1,'popover','Email','Email address of the company which is commonly used by the third parties for communication purpose','hover',0,3,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(9,NULL,'phone','Phone No',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,9,NULL,1,1,'popover','Phone No','Phone No of the company which is commonly used by the third parties for communication purpose','hover',0,11,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(10,NULL,'pinCode','Pincode',2,'required','Please Enter Pincode','Manual',135,NULL,NULL,1,0,'STD',112,10,NULL,1,0,'popover','Pincode','PinCode of the company for the respective address','hover',0,NULL,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(11,NULL,'panNo','PAN No',1,'required','Please Enter PAN No','Manual',NULL,NULL,NULL,1,0,'STD',112,11,NULL,1,1,'popover','PAN No','PAN No. of the Company on which company is registered','hover',0,10,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(12,NULL,'gstNo','GST No',1,'required','Please Enter GST No','Manual',NULL,NULL,NULL,1,0,'STD',112,12,NULL,1,1,'popover','GST No','GST No. of the Company on which Company is registered for GST TAx purpose','hover',0,5,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(13,NULL,'status','Status',3,'required','Please Select Status','Manual',NULL,NULL,NULL,1,0,'STD',112,13,NULL,1,1,'popover','Status','Status of the comapny weather company is currently Active or Inactive','hover',0,6,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(14,NULL,'msmeReg','MSME Reg. ?',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,14,NULL,1,0,'popover','MSME Reg.','Denotes weather the registered company is MSME or not','hover',0,NULL,0,1,'2020-08-16 17:29:34',1,'2020-12-28 13:47:42',NULL,NULL,NULL),(15,NULL,'msmeRegNo','MSME Reg No',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,14,NULL,1,0,'popover','MSME Reg No.','If Company is MSME Registered then it is required to enter the MSME Registration No. of the Company','hover',0,NULL,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(16,NULL,'attachments','Attachments',17,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,15,NULL,1,0,'popover','Attachments','Attachments if required any along with the company Details','hover',0,NULL,0,1,'2020-08-16 17:29:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(24,NULL,'bankDetails','Bank Details',14,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',112,16,NULL,1,0,'popover','Bank Details','Details of Bank along with Account Number for the Respective Company','hover',0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(25,NULL,'bankAccounts','Bank Account',15,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',112,17,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(26,25,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',112,1,NULL,1,1,NULL,NULL,NULL,NULL,0,21,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(27,25,'bankName','Bank Name',1,'required','Please Enter Bank Name','Manual',NULL,NULL,NULL,1,0,'STD',112,2,NULL,1,1,'popover','Bank Name','Name of the Bank should be entered in which the A/C No is registered','hover',0,12,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(28,25,'address','Address',11,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,3,NULL,1,1,'popover','Address','Address of the home banch of the Bank','hover',0,13,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(29,25,'countryId','Country',4,'required','Please Select Country','Manual',207,NULL,NULL,1,0,'STD',112,4,NULL,1,1,'popover','Country','Country of the home branch of the Bank','hover',0,14,0,1,'2020-08-28 14:41:34',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(30,25,'stateId','State',4,'required','Please Select State','Manual',208,'29',NULL,1,0,'STD',112,5,NULL,1,1,'popover','State','State of the home branch of the Bank','hover',0,15,0,1,'2020-08-28 14:41:34',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(31,25,'cityId','City',4,'required','Please Select City','Manual',209,'30',NULL,1,0,'STD',112,6,NULL,1,1,'popover','City','City of the home branch of the Bank','hover',0,16,0,1,'2020-08-28 14:41:34',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(32,25,'pincode','Pincode',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,7,NULL,1,1,'popover','Pincode','Pincode of the home branch of the Bank','hover',0,17,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(33,25,'acNo','A/C No',1,'required','Please Enter Account No','Manual',NULL,NULL,NULL,1,0,'STD',112,8,NULL,1,1,'popover','A/C No','A/C No. should be entered which is registered in the given Bank Name','hover',0,18,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(34,25,'ifscCode','IFSC Code',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,9,NULL,1,1,'popover','IFSC Code','IFSC Code of the home branch of the Bank','hover',0,19,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(35,25,'swiftCode','Swift Code',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',112,10,NULL,1,1,'popover','Swift Code','Swift Code of the home branch of the Bank','hover',0,20,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(36,NULL,'stdTable','Standard Fields',25,NULL,NULL,'Auto',112,NULL,NULL,1,0,'STD',119,1,NULL,1,0,'popover','Standard Fields','List of Standard Fields for the particular Module. User can change the following :- <br> <ol><li>Change The Field Labels</li><li>Remove or Apply The Validations</li><li>Activate or deactivate the Fields</li></ol>','hover',0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(37,NULL,'udfTable','Custom Fields',25,NULL,NULL,'Auto',112,NULL,NULL,1,0,'STD',119,2,NULL,1,0,'popover','User Defined Fields','List of User Defined Fields for the particular Module. User can add/edit User Defined fields','hover',0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(38,36,'options','Field Opt',15,NULL,NULL,'Manual',NULL,NULL,NULL,0,46,'STD',119,9,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(39,36,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',119,1,NULL,1,1,NULL,NULL,NULL,NULL,0,44,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(40,36,'parentFieldId','Parent Field',4,NULL,NULL,'Manual',119,'42',NULL,1,0,'STD',119,5,NULL,1,1,'popover','Parent Field','If the Field Type is Table then under that multiple fields can be possible.','hover',0,39,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(41,36,'fieldName','Field Name',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,3,NULL,1,1,'popover','Field Name','The Field Name Reprsents the Name of the object in the backend','hover',0,40,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(42,36,'module','Module Name',4,NULL,NULL,'Manual',120,NULL,NULL,1,0,'STD',119,4,NULL,1,1,NULL,NULL,NULL,NULL,0,41,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(43,36,'fieldHeader','Field Label',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,2,NULL,1,1,NULL,NULL,NULL,NULL,0,42,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(44,37,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',119,1,NULL,1,1,NULL,NULL,NULL,NULL,0,45,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(45,37,'fieldHeader','Field Label',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,3,NULL,1,1,NULL,NULL,NULL,NULL,0,46,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(46,36,'fieldType','Field Type',3,'required','Please Select Field Type','Manual',NULL,NULL,NULL,1,0,'STD',119,6,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-28 13:48:56',NULL,NULL,NULL),(47,37,'fieldType','Field Type',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,4,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(48,36,'isMandatory','Mandatory',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,10,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(49,38,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',119,1,NULL,1,1,NULL,NULL,NULL,NULL,0,22,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(50,38,'value','Value',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,2,NULL,1,1,NULL,NULL,NULL,NULL,0,23,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(51,38,'title','Title',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,3,NULL,1,1,NULL,NULL,NULL,NULL,0,24,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(52,38,'defaultValue','Default Value',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,4,NULL,1,1,NULL,NULL,NULL,NULL,0,25,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(53,38,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,5,NULL,1,1,NULL,NULL,NULL,NULL,0,26,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(54,36,'fieldOptions','Field Options',14,NULL,NULL,'Manual',NULL,NULL,NULL,0,46,'STD',119,8,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(55,36,'errorMessage','Error Message',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,11,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(56,36,'type','Type of Entry',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,12,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(57,36,'srcModule','Source Module',4,NULL,NULL,'Manual',120,NULL,NULL,1,0,'STD',119,7,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(58,36,'onChange','On Change Function',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,13,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(59,36,'onClick','On Click Function',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,14,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(60,36,'defaultShow','Show By Default',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,15,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(61,36,'showOn','Show On Change',4,NULL,NULL,'Manual',119,NULL,NULL,1,0,'STD',119,16,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(62,36,'entryType','Entry Type',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',119,17,'STD',1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(63,36,'displayOrder','Display Order',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,18,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(64,37,'entryType','Entry Type',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',119,7,'UDF',1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(65,37,'isMandatory','Mandatory',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,8,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(66,37,'options','Field Opt',15,NULL,NULL,'Manual',NULL,NULL,NULL,0,47,'STD',119,6,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(67,66,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',119,1,NULL,1,1,NULL,NULL,NULL,NULL,0,28,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(68,66,'value','Value',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,2,NULL,1,1,NULL,NULL,NULL,NULL,0,29,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(69,66,'title','Title',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,3,NULL,1,1,NULL,NULL,NULL,NULL,0,30,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(70,66,'defaultValue','Default Value',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,4,NULL,1,1,NULL,NULL,NULL,NULL,0,31,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(71,66,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,5,NULL,1,1,NULL,NULL,NULL,NULL,0,32,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(72,66,'customFieldId','Field Name',4,NULL,NULL,'Manual',119,NULL,NULL,1,0,'STD',119,6,NULL,1,1,NULL,NULL,NULL,NULL,0,33,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(73,37,'errorMessage','Error Message',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,9,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(76,36,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,19,NULL,1,1,NULL,NULL,NULL,NULL,0,43,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(77,37,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,10,NULL,1,1,NULL,NULL,NULL,NULL,0,49,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(78,36,'indexing','Shown On Index',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,29,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(80,36,'tooltipType','Tooltip Type',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,20,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(81,37,'tooltipType','Tooltip Type',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,11,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(82,36,'tooltipTitle','Tool Tip Title',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,21,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(83,37,'tooltipTitle','Tool Tip Title',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,12,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(84,36,'tooltipContent','Tool Tip Description',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,22,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(85,37,'tooltipContent','Tool Tip Description',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,13,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(86,36,'tooltipActivation','Tool Tip Activation',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,23,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(87,37,'tooltipActivation','Tool Tip Activation',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,14,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(88,36,'shortLink','Short Link',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,24,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(89,36,'fieldIndexingSec','Table Columns Detailing',14,NULL,NULL,'Manual',NULL,NULL,NULL,0,78,'STD',119,30,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(90,36,'shortLinkEnabled','Short Link Enabled',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,25,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(91,36,'fieldValidations','Field Validates',15,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,28,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(92,91,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',119,1,NULL,1,1,NULL,NULL,NULL,NULL,0,34,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(93,91,'validationName','Name Of Validation',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,2,NULL,1,1,NULL,NULL,NULL,NULL,0,35,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(94,91,'errorMessage','Error Message',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,3,NULL,1,1,NULL,NULL,NULL,NULL,0,36,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(95,91,'matchCase','Pattern/Length',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,4,NULL,1,1,NULL,NULL,NULL,NULL,0,37,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(96,91,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,5,NULL,1,1,NULL,NULL,NULL,NULL,0,38,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(97,37,'module','Module Name',4,NULL,NULL,'Manual',120,NULL,NULL,1,0,'STD',119,2,NULL,1,1,NULL,NULL,NULL,NULL,0,48,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(107,NULL,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',132,1,NULL,1,1,NULL,NULL,NULL,NULL,0,52,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(108,NULL,'zoneCode','Zone Code',1,NULL,NULL,'AutoGenerate',NULL,NULL,NULL,1,0,'STD',132,2,NULL,1,1,'popover','Zone Code','Zone code is System Generated Code. The Code Generation Pattern should be managed in ERP Settings',NULL,0,50,0,1,'2020-08-28 14:41:34',1,'2021-01-20 16:56:42',NULL,NULL,NULL),(109,NULL,'zoneName','Zone Name',1,'required','Please Enter Zone Name','Manual',NULL,NULL,NULL,1,0,'STD',132,3,NULL,1,1,'popover','Zone Name','Zone Name should be Enter by User accordingly.',NULL,0,51,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(110,NULL,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',132,4,NULL,1,1,'popover','Status','Status of the Zone weather Active or Inactive',NULL,0,53,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(111,NULL,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',124,1,NULL,1,1,NULL,NULL,NULL,NULL,0,54,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(112,NULL,'branchCode','Branch Code',1,NULL,NULL,'AutoGenerate',NULL,NULL,NULL,1,0,'STD',124,2,NULL,1,1,'popover','Branch Code','Code of the Branch which is a system generated code and can be managed in ERP Settings',NULL,0,56,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(113,NULL,'type','Branch Type',3,NULL,NULL,'Manual',203,NULL,NULL,1,0,'STD',124,3,NULL,1,1,'popover','Branch Type','Type of Branch i.e. weather it is HO, regional Office etc as defined by User',NULL,0,55,0,1,'2020-08-28 14:41:34',1,'2021-07-15 06:18:04',NULL,NULL,NULL),(114,NULL,'branchName','Branch Name',1,'required','Please Enter the Name of the Branch','Manual',NULL,NULL,NULL,1,0,'STD',124,4,NULL,1,1,'popover','Branch Name','Name of the Branch which is registered with the taxation',NULL,0,58,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(115,NULL,'shortName','Short Name',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,5,NULL,1,1,'popover','Short Name','Short name determines and identify the Branch so that user can determine or identify the branch by its short name. It should be unique',NULL,0,57,0,1,'2020-10-08 11:11:07',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(116,NULL,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,6,NULL,1,1,'popover','Status','Status of Branch weather branch is currently Active or Not',NULL,0,59,0,1,'2020-10-08 11:11:07',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(117,NULL,'zoneId','Zone',4,NULL,NULL,'Manual',132,NULL,NULL,1,0,'STD',124,7,NULL,1,0,'popover','Zone','Zone is only selectable only if Zone is enable. It indicates that the branch falls under which zone of the company',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(118,NULL,'countryId','Country',4,'required','Please Select Country','Manual',207,NULL,NULL,1,0,'STD',124,9,NULL,1,0,'popover','Country','User needs the Country of the branch in which branch exists ',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2021-07-10 04:53:03',NULL,NULL,NULL),(119,NULL,'stateId','State',4,'required','Please Select State','Manual',208,'118',NULL,1,0,'STD',124,10,NULL,1,0,'popover','State','User needs the State of the branch in which branch exists ',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2021-07-23 02:01:03',NULL,NULL,NULL),(120,NULL,'cityId','City',4,'required','Please Select City','Manual',209,'119',NULL,1,0,'STD',124,11,NULL,1,0,'popover','City','User needs the city of the branch in which branch exists ',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2021-07-23 02:01:03',NULL,NULL,NULL),(121,NULL,'pincode','Pincode',2,NULL,NULL,'Manual',135,NULL,NULL,1,0,'STD',124,12,NULL,1,0,'popover','Pincode','Pincode should be the code area code/pincode for the branch',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(122,NULL,'address','Address',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,8,NULL,1,0,'popover','Address','User may enter the full address of the branch without Country/State/City/pincode',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(123,NULL,'reportingBranch','Reporting Branch',4,NULL,NULL,'Manual',124,NULL,NULL,1,0,'STD',124,13,NULL,1,0,'popover','Reporting Branch','User may select the reporting branch i.e. the Branch under which the entered branch falls. If Branch is not under any branch then user need not required to select the Reporting Branch',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(124,NULL,'description','Branch Description',11,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,14,NULL,1,0,'popover','Branch Description','A Brief Description of the branch',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(125,NULL,'contacts','Contact Details',14,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,15,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(126,NULL,'contactPerson','Contact Person',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,16,NULL,1,0,'popover','Contact Person','Name of Contact Person which act as default contact of the Branch',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(127,NULL,'email','Email',19,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,17,NULL,1,0,'popover','Email','Email address of the contact person',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(128,NULL,'phone','Phone',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,18,NULL,1,0,'popover','Phone','LanLine phone of the Company related to the contact person',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(129,NULL,'mobile','Mobile',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,19,NULL,1,0,'popover','Mobile','Mobile number of the Company related to the contact person',NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(130,NULL,'website','Website',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,20,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(131,NULL,'contactDetails','Contact Details',15,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',124,21,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:48:16',NULL,NULL,NULL),(132,131,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',124,1,NULL,1,0,NULL,NULL,NULL,NULL,0,60,0,1,'2020-10-08 13:47:59',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(133,131,'contactPerson','Contact Person',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,2,NULL,1,0,'popover','Contact Person','More Contact Person','hover',0,61,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:42:14',NULL,NULL,NULL),(134,131,'phone','Phone',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,3,NULL,1,0,'popover','Phone','Phone Number of respective persons','hover',0,62,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:42:14',NULL,NULL,NULL),(135,131,'mobile','Mobile',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,4,NULL,1,0,'popover','Mobile','Mobile Number of respective persons','hover',0,63,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:42:14',NULL,NULL,NULL),(136,131,'email','Email',19,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,5,NULL,1,0,'popover','Email','Email address of respective persons','hover',0,64,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:42:14',NULL,NULL,NULL),(137,131,'department','Department',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,6,NULL,1,0,'popover','Department','Department of the respective persons','hover',0,65,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:42:14',NULL,NULL,NULL),(138,131,'designation','Designation',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,7,NULL,1,0,'popover','Designation','Designation of the respective persons','hover',0,66,0,1,'2020-10-08 13:47:59',1,'2021-08-10 00:42:14',NULL,NULL,NULL),(139,NULL,'bankDetails','Bank Details',14,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',124,22,NULL,1,0,'popover','Bank Details','Details of Bank along with Account Number for the Respective Company','hover',0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(140,NULL,'bankAccounts','Bank Account',15,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',124,23,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(141,140,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,1,0,'STD',124,1,NULL,1,0,NULL,NULL,NULL,NULL,0,21,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(142,140,'bankName','Bank Name',1,'required','Please Enter Bank Name','Manual',NULL,NULL,NULL,1,0,'STD',124,2,NULL,1,0,'popover','Bank Name','Name of the Bank should be entered in which the A/C No is registered','hover',0,12,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(143,140,'address','Address',11,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,3,NULL,1,0,'popover','Address','Address of the home banch of the Bank','hover',0,13,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(144,140,'countryId','Country',4,'required','Please Select Country','Manual',207,NULL,NULL,1,0,'STD',124,4,NULL,1,0,'popover','Country','Country of the home branch of the Bank','hover',0,14,0,1,'2020-08-28 14:41:34',1,'2021-07-23 01:55:16',NULL,NULL,NULL),(145,140,'stateId','State',4,'required','Please Select State','Manual',208,'144',NULL,1,0,'STD',124,5,NULL,1,0,'popover','State','State of the home branch of the Bank','hover',0,15,0,1,'2020-08-28 14:41:34',1,'2021-07-23 01:55:16',NULL,NULL,NULL),(146,140,'cityId','City',4,'required','Please Select City','Manual',209,'145',NULL,1,0,'STD',124,6,NULL,1,0,'popover','City','City of the home branch of the Bank','hover',0,16,0,1,'2020-08-28 14:41:34',1,'2021-07-23 01:55:16',NULL,NULL,NULL),(147,140,'pincode','Pincode',2,NULL,NULL,'Manual',135,NULL,NULL,1,0,'STD',124,7,NULL,1,0,'popover','Pincode','Pincode of the home branch of the Bank','hover',0,17,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(148,140,'acNo','A/C No',1,'required','Please Enter Account No','Manual',NULL,NULL,NULL,1,0,'STD',124,8,NULL,1,0,'popover','A/C No','A/C No. should be entered which is registered in the given Bank Name','hover',0,18,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(149,140,'ifscCode','IFSC Code',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,9,NULL,1,0,'popover','IFSC Code','IFSC Code of the home branch of the Bank','hover',0,19,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(150,140,'swiftCode','Swift Code',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',124,10,NULL,1,0,'popover','Swift Code','Swift Code of the home branch of the Bank','hover',0,20,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(158,NULL,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',125,1,NULL,1,1,NULL,NULL,NULL,NULL,0,70,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(159,NULL,'department','Department',1,'required','Please Enter Department Name','Manual',NULL,NULL,NULL,1,0,'STD',125,2,NULL,1,1,'popover','Department','Name of the Department','hover',0,71,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(160,NULL,'shortName','Short Name',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',125,3,NULL,1,1,'popover','Short Name','Short Name of development if applicable','hover',0,72,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(161,NULL,'description','Department Description',11,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',125,5,NULL,1,0,'popover','Description','Description of the Department, if required','hover',0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(163,NULL,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',125,4,NULL,1,1,NULL,NULL,NULL,NULL,0,77,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(164,NULL,'id','Sr. No.',18,NULL,NULL,'Auto',NULL,NULL,NULL,0,0,'STD',126,1,NULL,1,1,NULL,NULL,NULL,NULL,0,73,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(165,NULL,'designation','Designation',1,'required','Please Enter Designation Name','Manual',NULL,NULL,NULL,1,0,'STD',126,2,NULL,1,1,NULL,NULL,NULL,NULL,0,74,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(166,NULL,'shortName','Short Name',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',126,3,NULL,1,1,NULL,NULL,NULL,NULL,0,75,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(167,NULL,'description','Description',11,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',126,5,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(168,NULL,'status','Status',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',126,4,NULL,1,1,NULL,NULL,NULL,NULL,0,78,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(170,36,'fieldValidates','Field Validations',14,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,27,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(175,36,'fieldIndexing','Indexing Details',26,'Not Required',NULL,'Manual',NULL,NULL,NULL,0,78,'STD',119,31,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-15 12:18:28',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(176,175,'id','Sr. No.',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,0,0,'STD',119,1,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-15 12:31:02',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(177,175,'indexFieldName','Database Field Name',1,'required','Please Enter Field Name','Manual',NULL,NULL,NULL,1,0,'STD',119,2,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-15 17:40:18',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(178,175,'indexFieldHeader','Column Header',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-15 17:56:19',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(179,175,'fieldWidth','Field Width',2,'required','Please Enter Width','Manual',NULL,NULL,NULL,1,0,'STD',119,4,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-15 17:59:13',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(183,175,'sortable','Sortable',3,'required','Please Select Sortable','Manual',NULL,NULL,NULL,1,0,'STD',119,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-16 12:14:41',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(184,175,'filter','Filter Applicable?',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-16 12:24:50',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(185,175,'filterType','Filter Type',4,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-16 12:27:45',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(186,175,'hiddable','Hiddable?',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-16 12:42:27',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(187,175,'display','Display?',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-16 12:44:28',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(188,175,'displayOrder','Display Order',2,'required','Please Enter Display Order','Manual',NULL,NULL,NULL,1,0,'STD',119,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-16 12:46:10',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(192,37,'fieldOptions','Field Options',14,NULL,NULL,'Manual',NULL,NULL,NULL,0,47,'STD',119,5,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(193,37,'type','Type of Entry',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,15,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2020-08-28 14:41:34',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(194,NULL,'cINNo','CIN No.',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'UDF',112,18,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-17 14:56:27',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(195,37,'displayOrder','Display Order',2,'required','Please Enter Display Order','Manual',NULL,NULL,NULL,1,0,'STD',119,16,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-17 14:59:05',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(196,175,'dataFieldName','Data Field Name',1,'required','Please enter Data Field Name','Manual',NULL,NULL,NULL,1,0,'STD',119,0,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-21 11:36:47',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(197,NULL,'id','Sr. No.',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,0,'STD',129,1,NULL,1,1,'',NULL,NULL,'',0,91,0,1,'2020-10-22 18:04:44',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(198,NULL,'roleCode','Role Code',1,'Not Required',NULL,'AutoGenerate',NULL,NULL,NULL,1,0,'STD',129,2,NULL,1,1,'',NULL,NULL,'',0,92,0,1,'2020-10-22 18:53:18',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(199,NULL,'roleName','Role Name',1,'required','Please Enter Role Name','Manual',NULL,NULL,NULL,1,0,'STD',129,3,NULL,1,1,'popover','Role Name','Role name is required to get the basic identification of the Roles and permissions','hover',0,93,0,1,'2020-10-22 19:24:04',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(200,NULL,'roleDescription','Role Description',13,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',129,5,NULL,1,0,'popover','Role Description','It is required if user need to provide the brief description of Role','hover',0,NULL,0,1,'2020-10-22 19:25:28',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(201,NULL,'permission','Permissions',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',129,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-22 19:29:55',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(203,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',129,4,NULL,1,1,'',NULL,NULL,'',0,221,0,1,'2020-10-22 19:32:07',1,'2021-08-02 07:43:48',NULL,NULL,NULL),(204,NULL,'permissions','Role Permissions',15,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',129,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-22 19:33:28',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(205,204,'id','Sr. No.',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,0,'STD',129,1,NULL,1,1,'',NULL,NULL,'',0,94,0,1,'2020-10-22 19:35:00',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(206,204,'modulName','Modules',12,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',129,2,NULL,1,1,'',NULL,NULL,'',0,95,0,1,'2020-10-23 12:24:30',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(207,204,'permission','permission',27,'Not Required',NULL,'Manual',120,NULL,NULL,1,0,'STD',129,3,NULL,1,1,'',NULL,NULL,'',0,96,0,1,'2020-10-23 12:31:24',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(208,NULL,'designationId','Designation',4,'required','Please Select Designation','Manual',126,NULL,NULL,1,0,'STD',127,4,NULL,1,1,'',NULL,NULL,'',0,97,0,1,'2020-10-27 14:47:36',1,'2021-07-26 11:40:45',NULL,NULL,NULL),(209,NULL,'firstName','First Name',1,'required','Please Enter First Name','Manual',NULL,NULL,NULL,1,0,'STD',127,5,NULL,1,1,'',NULL,NULL,'',0,98,0,1,'2020-10-27 14:49:35',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(210,NULL,'middleName','Middle Name',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',127,6,NULL,1,1,'',NULL,NULL,'',0,99,0,1,'2020-10-27 14:50:44',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(211,NULL,'lastName','Last Name',1,'required','Please Enter Last Name','Manual',NULL,NULL,NULL,1,0,'STD',127,7,NULL,1,1,'',NULL,NULL,'',0,100,0,1,'2020-10-27 14:54:09',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(212,NULL,'fatherName','Father\'s Name',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',127,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 14:54:53',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(214,NULL,'reportingManager','Reporting Manager',4,'Not Required',NULL,'Manual',127,NULL,NULL,1,0,'STD',127,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 14:55:58',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(215,NULL,'dob','Date of Birth',5,'required','Please Select DOB','Manual',NULL,NULL,NULL,1,0,'STD',127,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 15:01:36',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(216,NULL,'joiningDate','Joining Date',5,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',127,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 15:02:16',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(217,NULL,'reportingBranch','Reporting Branch',4,NULL,NULL,'Manual',124,NULL,NULL,1,0,'STD',127,12,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 15:03:35',1,'2021-07-15 06:19:38',NULL,NULL,NULL),(218,NULL,'erpUser','Is ERP User?',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',127,13,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 15:05:31',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(219,NULL,'empCode','EMP Code',1,'Not Required',NULL,'AutoGenerate',NULL,NULL,NULL,1,0,'STD',127,2,NULL,1,1,'',NULL,NULL,'',0,101,0,1,'2020-10-27 16:07:26',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(220,NULL,'departmentId','Department',4,'required','Please Select Department','Manual',125,NULL,NULL,1,0,'STD',127,3,NULL,1,1,'',NULL,NULL,'',0,102,0,1,'2020-10-27 16:12:15',1,'2021-07-26 11:40:45',NULL,NULL,NULL),(221,NULL,'gender','Gender',3,'required','Please Select Gender','Manual',NULL,NULL,NULL,1,0,'STD',127,14,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-27 17:53:15',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(222,NULL,'status','Status',3,'required','Please Select Status','Manual',NULL,NULL,NULL,1,0,'STD',127,15,NULL,1,1,'',NULL,NULL,'',0,103,0,1,'2020-10-27 17:55:08',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(223,NULL,'id','Sr. No.',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,0,'STD',127,1,NULL,1,1,'',NULL,NULL,'',0,104,0,1,'2020-10-28 12:04:13',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(224,NULL,'id','Sr. No.',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,0,0,'STD',130,1,NULL,1,1,'',NULL,NULL,'',0,105,0,1,'2020-10-28 14:39:15',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(225,NULL,'username','Username',1,'required','Please Enter User Name','Manual',NULL,NULL,NULL,1,0,'STD',130,2,NULL,1,1,'',NULL,NULL,'',0,106,0,1,'2020-10-28 14:41:56',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(226,NULL,'password','Password',28,'required','Please Enter Password','Manual',NULL,NULL,NULL,1,0,'STD',130,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 15:25:14',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(227,NULL,'confimPassword','Confirm Password',28,'required','Please Enter Confirm Password','Manual',NULL,NULL,NULL,1,0,'STD',130,4,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 15:46:33',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(228,NULL,'email','Email',19,'required','Please Enter Email','Manual',NULL,NULL,NULL,1,0,'STD',130,5,NULL,1,1,'',NULL,NULL,'',0,107,0,1,'2020-10-28 18:48:58',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(229,NULL,'mobile','Mobile No.',2,'required','Please Enter Mobile Number','Manual',NULL,NULL,NULL,1,0,'STD',130,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 18:51:39',1,'2021-08-03 01:10:56',NULL,NULL,NULL),(230,36,'dataSource','Static Data',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',119,26,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 19:00:02',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(231,NULL,'passwordExpiry','Password Expiry (In Days)',2,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',130,7,'30',1,1,'',NULL,NULL,'',0,108,0,1,'2020-10-28 19:02:00',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(232,NULL,'status','Status',3,'required','Please Select Status','Manual',NULL,NULL,NULL,1,0,'STD',130,8,NULL,1,1,'',NULL,NULL,'',0,109,0,1,'2020-10-28 19:07:47',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(233,NULL,'employeeId','Employee',4,'Not Required',NULL,'Manual',127,NULL,NULL,1,0,'STD',130,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 19:09:44',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(234,NULL,'roleId','Role',4,'required','Please Select Roles','Manual',129,NULL,NULL,1,0,'STD',130,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 19:10:44',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(235,NULL,'branchAssignT','Assign Branch',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',130,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 19:11:16',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(236,NULL,'branchAssign','Branch Assign Table',15,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',130,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-28 19:11:46',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(237,236,'id','Sr. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',130,1,NULL,1,1,'',NULL,NULL,'',0,110,0,1,'2020-10-28 19:13:14',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(238,236,'branchId','Branch',4,'required','Please Select Branch','Manual',124,NULL,NULL,1,0,'STD',130,2,NULL,1,1,'',NULL,NULL,'',0,111,0,1,'2020-10-28 19:14:26',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(239,NULL,'uuid','UUID',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,0,'STD',130,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-10-29 16:47:13',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(332,NULL,'id','S.No.',2,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,0,'STD',183,0,NULL,1,1,'',NULL,NULL,'',0,224,0,1,'2020-11-06 15:48:06',1,'2021-08-03 01:33:31',NULL,NULL,NULL),(333,NULL,'question','Question Title',11,'required','Please Enter Question','Manual',NULL,NULL,NULL,1,0,'STD',183,1,NULL,1,1,'popover','Question Title','Title of the Question','hover',0,117,0,1,'2020-11-06 15:49:09',1,'2021-01-06 19:10:44',NULL,NULL,NULL),(334,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,6,NULL,1,1,'',NULL,NULL,'',0,119,0,1,'2020-11-06 15:49:46',1,'2021-01-04 16:37:22',NULL,NULL,NULL),(335,NULL,'difficultyLevel','Difficulty Level',3,'required','Please Select Difficulty Level','Manual',NULL,NULL,NULL,1,0,'STD',183,2,NULL,1,1,'popover','Question Difficulty','Difficulty level of the question.','hover',0,118,0,1,'2020-11-06 15:51:46',1,'2021-01-06 18:46:32',NULL,NULL,NULL),(336,NULL,'fieldType','Answer Field Type',3,'required','Please Select Answer Type','Manual',NULL,NULL,NULL,1,0,'STD',183,8,NULL,1,0,'popover','Answer Type','Answer type of this question','hover',0,NULL,0,1,'2020-11-06 15:53:40',1,'2021-01-16 11:59:08',NULL,NULL,NULL),(337,NULL,'answerExplanation','Answer Explanation',11,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,12,NULL,1,0,'popover','Answer Explaination','Explain the answer of this question','hover',0,NULL,0,1,'2020-11-09 14:14:12',1,'2021-01-16 11:49:27',NULL,NULL,NULL),(338,NULL,'options','Options',15,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,336,'STD',183,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-09 17:38:28',1,'2021-01-04 16:41:50',NULL,NULL,NULL),(339,338,'optionName','Option Name',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,2,NULL,1,1,'',NULL,NULL,'',0,120,0,1,'2020-11-09 18:01:45',1,'2021-01-04 16:18:19',NULL,NULL,NULL),(340,NULL,'optionsSection','Options',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,336,'STD',183,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-09 18:10:03',1,'2021-01-04 16:41:50',NULL,NULL,NULL),(341,338,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,5,NULL,1,1,'',NULL,NULL,'',0,121,0,1,'2020-11-09 18:12:52',1,'2021-01-04 16:18:19',NULL,NULL,NULL),(342,338,'correctOption','Is Correct Option',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,3,NULL,1,1,'',NULL,NULL,'',0,122,0,1,'2020-11-09 18:15:21',1,'2021-01-04 16:13:20',NULL,NULL,NULL),(348,NULL,'role','Role',1,'required','Please Select Categories','Manual',NULL,NULL,NULL,1,0,'STD',187,1,NULL,1,1,'popover','Role','Role of the employee','hover',0,124,0,1,'2020-11-18 13:12:40',1,'2021-01-16 12:18:24',NULL,NULL,NULL),(349,NULL,'industryTypeId','Industry Type',4,'required','Please select a industry type','Manual',181,NULL,NULL,1,0,'STD',187,2,NULL,1,1,'popover','Industry','Industry Type for this job role','hover',0,142,0,1,'2020-11-18 13:13:31',1,'2021-01-16 12:20:00',NULL,NULL,NULL),(350,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',187,5,NULL,1,1,'',NULL,NULL,'',0,125,0,1,'2020-11-18 13:25:46',1,'2021-07-27 00:41:08',NULL,NULL,NULL),(359,NULL,'id','ID',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',188,0,NULL,1,1,'',NULL,NULL,'',0,158,0,1,'2020-11-18 15:55:55',1,'2020-12-31 17:22:27',NULL,NULL,NULL),(360,NULL,'skill','Skill',1,'required','Please Enter The Skill Name','Manual',NULL,NULL,NULL,1,0,'STD',188,1,NULL,1,1,'popover','Name','Name of The Skill','hover',0,131,0,1,'2020-11-18 15:57:08',1,'2021-01-06 18:40:10',NULL,NULL,NULL),(361,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',188,2,NULL,1,1,'',NULL,NULL,'',0,132,0,1,'2020-11-18 15:58:30',1,'2020-12-16 19:00:36',NULL,NULL,NULL),(362,NULL,'skillIds','Skills',21,'required','Please select skills for this question','Manual',188,NULL,NULL,1,0,'STD',183,9,NULL,1,0,'popover','Skills','Select all the related skills to this question','hover',0,NULL,0,1,'2020-11-18 17:28:52',1,'2021-01-16 11:45:42',NULL,NULL,NULL),(363,NULL,'timeLimit','Time Limit (Sec.)',2,'required','Please give a time out duration for this question','Manual',NULL,NULL,NULL,1,0,'STD',183,3,NULL,1,0,'popover','Question Timeout Duration','How much time give to user to attempt this question (in seconds)','hover',0,NULL,0,1,'2020-11-19 11:31:47',1,'2021-01-06 18:51:02',NULL,NULL,NULL),(378,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',181,0,NULL,1,1,'',NULL,NULL,'',0,138,0,1,'2020-12-01 10:27:08',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(379,NULL,'name','Name',1,'required','Please Enter The Industry Type Name','Manual',NULL,NULL,NULL,1,0,'STD',181,1,NULL,1,1,'popover','Industry Type Name','Name of The Industry','hover',0,139,0,1,'2020-12-01 10:28:47',1,'2021-01-06 18:33:21',NULL,NULL,NULL),(380,NULL,'description','Description',11,'required','Please Give a brief description about this industry','Manual',NULL,NULL,NULL,1,0,'STD',181,3,NULL,1,1,'popover','Description','A Brief Description About this Industry','hover',0,140,0,1,'2020-12-01 10:29:49',1,'2021-01-06 18:37:11',NULL,NULL,NULL),(381,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',181,2,NULL,1,1,'',NULL,NULL,'',0,141,0,1,'2020-12-01 10:32:07',1,'2020-12-31 15:30:17',NULL,NULL,NULL),(382,NULL,'description','Description',11,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',187,4,NULL,1,1,'popover','Description','Describe the Job Role','hover',0,143,0,1,'2020-12-01 12:00:32',1,'2021-07-27 00:41:08',NULL,NULL,NULL),(383,NULL,'negetiveMarkFactor','Negetive Marking Factor',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,4,'0',1,0,'popover','Negetive Marking Factor','If negative marking is enabled in assessment test this is the factor decides how marks reduce','hover',0,144,0,1,'2020-12-01 12:50:44',1,'2021-01-06 19:07:23',NULL,NULL,NULL),(384,NULL,'marks','Marks',2,'required','Please Enter Question Marks','Manual',NULL,NULL,NULL,1,0,'STD',183,5,NULL,1,1,'popover','Question Marks','Weightage of this question in assessment','hover',0,184,0,1,'2020-12-01 12:51:49',1,'2021-01-16 11:28:58',NULL,NULL,NULL),(385,NULL,'description','Description',13,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,13,NULL,1,0,'popover','Description','A description about this question so candidate can easily understand this question','hover',0,NULL,0,1,'2020-12-01 12:53:15',1,'2021-01-16 11:52:33',NULL,NULL,NULL),(386,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',189,1,NULL,1,1,'',NULL,NULL,'',0,145,0,1,'2020-12-01 14:46:10',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(387,NULL,'title','Assessment Title',1,'required','Please enter the assessment title','Manual',NULL,NULL,NULL,1,0,'STD',189,2,NULL,1,1,'',NULL,NULL,'',0,146,0,1,'2020-12-01 14:47:56',1,'2021-01-16 12:40:05',NULL,NULL,NULL),(388,NULL,'timeDurationPolicy','Time Duration Policy',3,'required','Please select a time duration policy','Manual',NULL,NULL,NULL,1,0,'STD',189,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 14:50:23',1,'2021-01-16 12:40:05',NULL,NULL,NULL),(389,NULL,'timeOutDuration','Assessment Duration (In Minutes)',2,'required','Plese enter duration of this assessment','Manual',NULL,NULL,NULL,1,0,'STD',189,4,NULL,1,1,'',NULL,NULL,'',0,186,0,1,'2020-12-01 14:51:07',1,'2021-01-16 12:40:05',NULL,NULL,NULL),(390,NULL,'enableNegetiveMarking','Enable Negetive Marking',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',189,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 14:52:24',1,'2021-01-16 16:44:12',NULL,NULL,NULL),(391,NULL,'testPassPercentage','Test Pass Percentage',2,'required','Please enter test pass percentage','Manual',NULL,NULL,NULL,1,0,'STD',189,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 14:52:49',1,'2021-01-16 12:40:05',NULL,NULL,NULL),(392,NULL,'totalQuestions','Total Question',2,'required','Please enter total questions','Manual',NULL,NULL,NULL,1,0,'STD',189,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 14:53:53',1,'2021-01-16 12:44:41',NULL,NULL,NULL),(393,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',189,8,NULL,1,1,'',NULL,NULL,'',0,222,0,1,'2020-12-01 14:54:36',1,'2021-08-03 01:23:00',NULL,NULL,NULL),(394,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',182,1,NULL,1,1,'',NULL,NULL,'',0,147,0,1,'2020-12-01 16:05:52',1,'2020-12-30 12:10:34',NULL,NULL,NULL),(395,NULL,'jobTitle','Job Title',1,'required','Title of Job Profile','Manual',NULL,NULL,NULL,1,0,'STD',182,2,NULL,1,1,'popover','Job Title','Title of the Job Profile','hover',0,148,0,1,'2020-12-01 16:06:39',1,'2021-01-16 12:33:17',NULL,NULL,NULL),(396,NULL,'applicableDate','Applicable Date',5,'required','Mention a date this job profile is applicable for.','Manual',NULL,NULL,NULL,1,0,'STD',182,3,NULL,1,1,'',NULL,NULL,'',0,149,0,1,'2020-12-01 16:07:45',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(397,NULL,'industryTypeId','Industry Type',4,'required','Please select a industry type','Manual',181,NULL,NULL,1,0,'STD',182,4,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 16:08:32',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(398,NULL,'jobRoleId','Job Role',4,'required','Please select job role','Manual',187,NULL,NULL,1,0,'STD',182,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 16:09:09',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(399,NULL,'description','Description',13,'required','Please describe about this job profile','Manual',NULL,NULL,NULL,1,0,'STD',182,26,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 16:10:22',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(400,NULL,'skillIds','Skills',21,'required','Please mention the skills for this job role','Manual',188,NULL,NULL,1,0,'STD',187,3,NULL,1,0,'popover','Skills','Skills required for this job role','hover',0,NULL,0,1,'2020-12-01 17:55:13',1,'2021-01-16 12:20:00',NULL,NULL,NULL),(401,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',187,0,NULL,1,1,'',NULL,NULL,'',0,151,0,1,'2020-12-01 17:59:11',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(402,NULL,'jobProfileId','Job Role',4,'required','Please select a Job Profile','Manual',182,NULL,NULL,1,0,'STD',189,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-01 18:32:54',1,'2021-07-27 03:33:59',NULL,NULL,NULL),(403,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',182,6,NULL,1,1,'popover',NULL,NULL,'',0,216,0,1,'2020-12-02 10:19:38',1,'2021-07-27 03:40:14',NULL,NULL,NULL),(404,NULL,'minExperience','Min. Experience',2,'required','Please enter min experience','Manual',NULL,NULL,NULL,1,0,'STD',182,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:19:26',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(405,NULL,'noOfOpenings','Current Openings',2,'required','Please enter current openings for this job','Manual',NULL,NULL,NULL,1,0,'STD',182,7,'0',1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:20:24',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(406,NULL,'minSalary','Min. Salary',1,'required','Please enter min salary','Manual',NULL,NULL,NULL,1,0,'STD',182,12,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:20:55',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(407,NULL,'schedule','Schedule',3,'required','Please enter the schedule','Manual',NULL,NULL,NULL,1,0,'STD',182,15,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:22:00',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(408,NULL,'location','Location',1,'required','Please Enter Job Location','Manual',NULL,NULL,NULL,1,0,'STD',182,18,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:23:06',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(409,NULL,'jobType','Job Type',3,'required','Please Enter Job Type','Manual',NULL,NULL,NULL,1,0,'STD',182,17,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:23:57',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(410,NULL,'workFromHome','Work From Home',3,'Not Required','','Manual',NULL,NULL,NULL,1,0,'STD',182,16,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 12:25:31',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(411,NULL,'enableWebCam','Enable Web Cam',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',189,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-02 17:01:10',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(412,NULL,'enableAntiCheating','Enable Anti Cheating',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,0,411,'STD',189,11,NULL,1,0,'popover','Anti Cheating','When enabled, web cam takes pic of the candidate every 30 sec','hover',0,NULL,0,1,'2020-12-02 17:02:02',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(413,NULL,'takeIntroductionVideo','Take Introduction Video',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,0,411,'STD',189,12,NULL,1,0,'popover','Introduction Video','Take a 60 sec introduction video of candidate','hover',0,NULL,0,1,'2020-12-02 17:02:55',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(414,NULL,'description','Description',11,'required','Please Give a brief description about this skill','Manual',NULL,NULL,NULL,1,0,'STD',188,3,NULL,1,1,'popover','Description','A brief description about this skill ','hover',0,159,0,1,'2020-12-03 11:11:00',1,'2021-01-06 18:42:04',NULL,NULL,NULL),(416,NULL,'questionnaireIds','Questionnaire Mapping',21,'Not Required',NULL,'Manual',NULL,NULL,NULL,0,0,'STD',189,20,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-05 14:59:09',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(417,NULL,'id','S. No.',18,'Not Required',NULL,'Auto',NULL,NULL,NULL,1,0,'STD',190,1,NULL,1,1,'',NULL,NULL,'',0,226,0,1,'2020-12-10 14:39:10',1,'2021-08-03 01:44:46',NULL,NULL,NULL),(418,NULL,'question','Question',11,'required','Please enter the question','Manual',NULL,NULL,NULL,1,0,'STD',190,2,NULL,1,1,'popover','Question','Title of the question','hover',0,153,0,1,'2020-12-10 14:40:13',1,'2021-01-16 12:03:34',NULL,NULL,NULL),(419,NULL,'answerType','Answer Type',3,'required','Please Select Answer Type Of This Question','Manual',NULL,NULL,NULL,1,0,'STD',190,3,NULL,1,0,'popover','Answer Type','Answer Type for this question','hover',0,185,0,1,'2020-12-10 14:43:03',1,'2021-01-16 12:04:46',NULL,NULL,NULL),(420,NULL,'description','Description',13,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',190,10,NULL,1,0,'popover','Description','Describe this question so candidate can easily understand the question','hover',0,NULL,0,1,'2020-12-10 14:43:23',1,'2021-01-16 12:14:05',NULL,NULL,NULL),(421,NULL,'timeout','Time Out (sec.)',2,'required','Please Enter Time Out For This Question','Manual',NULL,NULL,NULL,1,0,'STD',190,4,NULL,1,0,'popover','Time Out','How much time candidate will get to attempt this question','hover',0,NULL,0,1,'2020-12-10 14:47:57',1,'2021-01-16 12:06:45',NULL,NULL,NULL),(424,NULL,'title','Module Title',1,'required','Please Enter Module Title','Manual',NULL,NULL,NULL,1,0,'STD',192,1,NULL,1,1,'',NULL,NULL,'',0,128,0,1,'2020-11-13 12:54:05',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(425,NULL,'path','Routing Path',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,2,NULL,1,1,'',NULL,NULL,'',0,129,0,1,'2020-11-13 13:04:19',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(426,NULL,'apiPath','API Path',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,3,NULL,1,1,'',NULL,NULL,'',0,130,0,1,'2020-11-13 13:04:46',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(427,NULL,'parentId','Parent Module',4,'Not Required',NULL,'Manual',120,NULL,NULL,1,0,'STD',192,4,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:06:36',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(428,NULL,'moduleType','Module Type',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:08:13',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(429,NULL,'icon','Icon',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:08:51',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(430,NULL,'moduleClass','Module class',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:09:36',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(431,NULL,'isExternalLink','Is External Link',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:11:16',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(432,NULL,'badge','Badge',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:12:51',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(433,NULL,'badgeClass','Badge Class',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:13:15',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(434,NULL,'formType','Form Type',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:13:55',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(435,NULL,'columns','Columns',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,12,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:14:19',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(436,NULL,'displayOrder','Display Order',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,13,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:15:10',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(437,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,14,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-13 13:16:02',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(438,NULL,'moduleActionMapping','Module Action Mapping',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,15,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-23 11:46:50',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(439,NULL,'actionMapping','Action Mapping',15,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,16,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-11-23 11:48:26',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(440,439,'actionId','Action',4,'Not Required',NULL,'Manual',194,NULL,NULL,1,0,'STD',192,2,NULL,1,1,'',NULL,NULL,'',0,154,0,1,'2020-11-23 11:49:49',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(441,439,'buttonId','Button',21,'Not Required',NULL,'Manual',193,NULL,NULL,1,0,'STD',192,3,NULL,1,1,'',NULL,NULL,'',0,155,0,1,'2020-11-23 11:51:02',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(442,439,'Id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,1,NULL,1,1,'',NULL,NULL,'',0,156,0,1,'2020-11-23 11:57:47',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(443,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',192,1,NULL,1,1,'',NULL,NULL,'',0,157,0,1,'2020-11-24 10:36:35',1,'2020-12-16 12:04:18',NULL,NULL,NULL),(449,NULL,'thinkTime','Think Time',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',190,6,NULL,1,0,'popover','Think Time','Time given for prepare the candidate for this question (if not given candidate won\'t get time to prepare for this question)','hover',0,NULL,0,1,'2020-12-14 11:54:48',1,'2021-01-16 12:09:48',NULL,NULL,NULL),(450,NULL,'maxAttempt','No Of Attempts',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',190,7,NULL,1,0,'popover','Max Attempts','How many times candidate can attempt this question (if not given, candidate will get only one attempt)','hover',0,NULL,0,1,'2020-12-14 11:55:25',1,'2021-01-16 12:09:48',NULL,NULL,NULL),(451,NULL,'maxSalary','Max. Salary',1,'required','Please enter max salary','Manual',NULL,NULL,NULL,1,0,'STD',182,13,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-14 12:30:39',1,'2021-01-16 12:28:53',NULL,NULL,NULL),(452,NULL,'maxExperience','Max. Experience',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',182,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-14 12:34:37',1,'2021-01-05 18:03:51',NULL,NULL,NULL),(453,NULL,'showSalaryToCandidates','Show Salary To Candidates?',31,'Not Required','','Manual',NULL,NULL,NULL,1,0,'STD',182,14,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-14 12:36:07',1,'2021-01-16 12:31:04',NULL,NULL,NULL),(458,NULL,'id','S. No.',18,'Not Required','Please Select Job Apply Type','Manual',NULL,NULL,NULL,1,0,'STD',197,1,NULL,1,1,'',NULL,NULL,'',0,217,0,1,'2020-12-28 12:07:15',1,'2021-07-29 05:29:17',NULL,NULL,NULL),(459,NULL,'jobApplyType','Job Apply Type',33,'required','Please Select Job Apply Type','Manual',NULL,NULL,NULL,1,0,'STD',197,2,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:13:23',1,'2021-07-29 10:16:48',NULL,NULL,NULL),(460,NULL,'interviewType','Interview Type',33,'required','Please Select Job Interview Type','Manual',NULL,NULL,NULL,1,0,'STD',197,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:15:28',1,'2021-07-29 10:16:48',NULL,NULL,NULL),(461,NULL,'interviewStartTime','Interview Start Time',7,'required','Please Enter Interview Start Time','Manual',NULL,NULL,NULL,1,0,'STD',197,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:16:11',1,'2021-01-16 12:54:25',NULL,NULL,NULL),(462,NULL,'interviewEndTime','Interview End Time',7,'required','Please Enter Interview End Time','Manual',NULL,NULL,NULL,1,0,'STD',197,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:16:42',1,'2021-01-16 12:54:25',NULL,NULL,NULL),(463,NULL,'interviewStartDate','Interview Start Date',5,'required','Please Enter Interview Start Date','Manual',NULL,NULL,NULL,1,0,'STD',197,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:17:09',1,'2021-01-16 12:54:25',NULL,NULL,NULL),(464,NULL,'interviewEndDate','Interview End Date',5,'required','Please Enter Interview End Date','Manual',NULL,NULL,NULL,1,0,'STD',197,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:17:44',1,'2021-01-16 12:54:25',NULL,NULL,NULL),(465,NULL,'venue','Venue',1,'required','Please Enter Venue','Manual',NULL,NULL,NULL,1,0,'STD',197,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:18:11',1,'2021-01-16 13:01:09',NULL,NULL,NULL),(466,NULL,'askGeneralQuestions','Ask General Questions',31,'Not Required','','Manual',NULL,NULL,NULL,1,0,'STD',197,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:19:01',1,'2021-01-16 13:01:09',NULL,NULL,NULL),(467,NULL,'jobProfileId','Job Profile',4,'required','Please select a job profile','Manual',182,NULL,NULL,1,0,'STD',197,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-28 12:20:14',1,'2021-07-20 11:11:03',NULL,NULL,NULL),(468,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,20,NULL,1,1,'',NULL,NULL,'',0,215,0,1,'2020-12-28 13:34:54',1,'2021-08-04 09:52:21',NULL,NULL,NULL),(470,NULL,'remarks','Remarks',11,'required','Please say something about this job posting','Manual',NULL,NULL,NULL,1,0,'STD',197,11,NULL,1,1,'',NULL,NULL,'',0,160,0,1,'2020-12-29 16:01:40',1,'2021-08-04 09:52:21',NULL,NULL,NULL),(471,NULL,'generalQuestionType','General Question Type',33,'required','Please mention if this is a interview question or general question','Manual',NULL,NULL,NULL,1,0,'STD',190,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-29 17:14:01',1,'2021-01-16 16:28:24',NULL,NULL,NULL),(472,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,1,NULL,1,1,'',NULL,NULL,'',0,161,0,1,'2020-12-29 17:30:23',1,'2021-01-01 16:40:12',NULL,NULL,NULL),(473,NULL,'questions','Questions',15,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-29 17:31:37',1,'2021-01-01 21:32:36',NULL,NULL,NULL),(474,NULL,'questionsSet','Add Questions',14,'Not Required',NULL,'Manual',210,'490',NULL,1,0,'STD',198,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-29 17:32:16',1,'2021-08-06 08:08:29',NULL,NULL,NULL),(475,473,'questionId','Question',4,'Not Required',NULL,'Manual',190,NULL,NULL,1,0,'STD',198,2,NULL,1,1,'',NULL,NULL,'',0,162,0,1,'2020-12-29 17:33:24',1,'2021-01-01 12:55:54',NULL,NULL,NULL),(476,NULL,'jobProfileId','Job Profile',4,'required','Please Select Job Profile','Manual',182,NULL,NULL,1,0,'STD',198,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-29 18:18:35',1,'2021-01-16 12:47:59',NULL,NULL,NULL),(477,473,'timeout','Timeout (Sec.)',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,3,NULL,1,1,'',NULL,NULL,'',0,163,0,1,'2020-12-29 18:25:17',1,'2021-01-01 12:55:54',NULL,NULL,NULL),(478,473,'thinkTime','Think Time (Sec.)',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,4,NULL,1,1,'',NULL,NULL,'',0,164,0,1,'2020-12-29 18:26:21',1,'2021-01-01 12:55:54',NULL,NULL,NULL),(479,473,'attempts','Attempts',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,5,NULL,1,1,'',NULL,NULL,'',0,165,0,1,'2020-12-29 18:27:26',1,'2021-01-01 12:55:54',NULL,NULL,NULL),(480,NULL,'questionSetName','Question Set Name',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,0,487,'STD',198,12,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-29 18:35:11',1,'2021-01-01 20:06:29',NULL,NULL,NULL),(481,NULL,'totalQuestions','Total Question',2,'required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,5,NULL,1,1,'',NULL,NULL,'',0,168,0,1,'2020-12-29 18:37:05',1,'2021-01-16 12:47:30',NULL,NULL,NULL),(482,NULL,'postingEndDate','Posting End Date',5,'required','Please enter a posting end date','Manual',NULL,NULL,NULL,1,0,'STD',197,12,NULL,1,0,'',NULL,NULL,'',0,187,0,1,'2020-12-30 10:48:50',1,'2021-01-16 13:01:09',NULL,NULL,NULL),(483,NULL,'shareableToken','Shareable Token',1,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',197,13,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2020-12-30 11:48:00',1,'2020-12-30 11:48:00',NULL,NULL,NULL),(484,NULL,'interviewName','Interview Name',1,'required','Please Enter Interview Name','Manual',NULL,NULL,NULL,1,0,'STD',198,2,NULL,1,1,'',NULL,NULL,'',0,167,0,1,'2021-01-01 12:42:11',1,'2021-01-16 12:47:30',NULL,NULL,NULL),(485,NULL,'webcamPermission','Webcam Permission Required',31,'required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,4,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-01 12:43:06',1,'2021-01-16 12:47:30',NULL,NULL,NULL),(486,473,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,1,NULL,1,1,'',NULL,NULL,'',0,166,0,1,'2021-01-01 12:56:58',1,'2021-01-01 12:56:58',NULL,NULL,NULL),(487,NULL,'createQuestionSet','Save as Question Set',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-01 13:27:12',1,'2021-01-01 20:06:29',NULL,NULL,NULL),(488,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,6,NULL,1,1,'',NULL,NULL,'',0,223,0,1,'2021-01-01 17:28:25',1,'2021-08-03 01:26:35',NULL,NULL,NULL),(489,NULL,'importFromQuestionSet','Import From Question Set',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',198,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-01 20:07:22',1,'2021-01-01 20:09:34',NULL,NULL,NULL),(490,NULL,'questionSetId','Question Set',4,'Not Required',NULL,'Manual',210,NULL,NULL,0,489,'STD',198,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-01 20:08:23',1,'2021-08-06 00:11:17',NULL,NULL,NULL),(493,NULL,'applyMandatorySkillsSection','Mandatory Skills to Apply',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,18,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-02 11:32:32',1,'2021-01-14 13:08:15',NULL,NULL,NULL),(494,NULL,'applyMandatorySkills','Apply Mandatory Skill',15,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,19,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-02 11:33:18',1,'2021-01-14 13:08:15',NULL,NULL,NULL),(495,494,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,1,NULL,1,1,'',NULL,NULL,'',0,170,0,1,'2021-01-02 11:34:15',1,'2021-01-16 16:59:00',NULL,NULL,NULL),(496,494,'skillId','Skill',4,'Not Required',NULL,'Manual',188,NULL,NULL,1,0,'STD',197,2,NULL,1,1,'',NULL,NULL,'',0,169,0,1,'2021-01-02 11:36:16',1,'2021-01-16 16:59:00',NULL,NULL,NULL),(497,494,'experienceRequired','Mininum Experience Required',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,3,NULL,1,1,'',NULL,NULL,'',0,171,0,1,'2021-01-02 12:03:01',1,'2021-01-02 15:25:54',NULL,NULL,NULL),(498,494,'mandatory','Mandatory',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,5,NULL,1,1,'',NULL,NULL,'',0,172,0,1,'2021-01-02 12:04:06',1,'2021-01-16 16:59:00',NULL,NULL,NULL),(499,NULL,'hiringRoundSection','Hiring Rounds',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',182,18,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-02 12:31:48',1,'2021-01-05 17:48:28',NULL,NULL,NULL),(500,NULL,'hiringRounds','Hiring Rounds',15,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',182,19,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-02 12:32:29',1,'2021-01-05 17:48:28',NULL,NULL,NULL),(501,500,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',182,1,NULL,1,1,'',NULL,NULL,'',0,173,0,1,'2021-01-02 12:33:18',1,'2021-01-02 12:33:18',NULL,NULL,NULL),(502,500,'roundName','Round Name',1,'required','Please enter name of this round','Manual',NULL,NULL,NULL,1,0,'STD',182,2,NULL,1,1,'',NULL,NULL,'',0,174,0,1,'2021-01-02 12:34:45',1,'2021-01-16 12:29:50',NULL,NULL,NULL),(503,500,'mode','Mode',3,'required','Please select mode of this round','Manual',NULL,NULL,NULL,1,0,'STD',182,3,NULL,1,1,'',NULL,NULL,'',0,175,0,1,'2021-01-02 12:35:50',1,'2021-01-16 12:29:50',NULL,NULL,NULL),(504,500,'employeeId','Responsible Person',4,'required','Please select a reponsible person','Manual',127,NULL,NULL,1,0,'STD',182,4,NULL,1,0,'',NULL,NULL,'',0,176,0,1,'2021-01-02 12:37:09',1,'2021-08-07 01:40:29',NULL,NULL,NULL),(505,494,'experienceCountUnit','Experience In',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,4,NULL,1,1,'',NULL,NULL,'',0,177,0,1,'2021-01-02 15:26:40',1,'2021-01-02 15:26:40',NULL,NULL,NULL),(506,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',203,1,NULL,1,1,'',NULL,NULL,'',0,178,0,1,'2021-01-04 11:48:46',1,'2021-01-04 13:05:52',NULL,NULL,NULL),(507,NULL,'type','Type',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',203,2,NULL,1,1,'',NULL,NULL,'',0,179,0,1,'2021-01-04 11:50:15',1,'2021-01-04 13:32:00',NULL,NULL,NULL),(508,NULL,'modulesId','Modules',21,'Not Required',NULL,'Manual',192,NULL,NULL,1,0,'STD',203,3,NULL,1,1,'',NULL,NULL,'',0,180,0,1,'2021-01-04 11:51:23',1,'2021-01-04 13:48:31',NULL,NULL,NULL),(509,NULL,'status','Status',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',203,4,NULL,1,1,'',NULL,NULL,'',0,181,0,1,'2021-01-04 11:54:33',1,'2021-01-04 11:54:49',NULL,NULL,NULL),(510,NULL,'questionCategoryTypeId','Question Category Type',4,'required','Please Select Question Category','Manual',203,NULL,NULL,1,0,'STD',183,7,NULL,1,0,'popover','Question Category','Category of this question','hover',0,NULL,0,1,'2021-01-04 15:02:33',1,'2021-01-16 11:36:46',NULL,NULL,NULL),(511,NULL,'questionCategoryTypeId','Question Category Type',4,'required','Please Select a category for this question','Manual',203,NULL,NULL,1,0,'STD',190,8,NULL,1,0,'popover','Question Category','Category of this question','hover',0,NULL,0,1,'2021-01-04 15:16:51',1,'2021-01-16 12:12:51',NULL,NULL,NULL),(512,338,'optionWeight','Option Weight',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,4,NULL,1,1,'',NULL,NULL,'',0,182,0,1,'2021-01-04 16:14:46',1,'2021-01-04 16:18:19',NULL,NULL,NULL),(513,338,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',183,1,NULL,1,1,'',NULL,NULL,'',0,183,0,1,'2021-01-04 16:15:42',1,'2021-01-04 16:15:42',NULL,NULL,NULL),(514,NULL,'minExperienceUnit','Min Experience In',3,'required','Please Select Experience Unit','Manual',NULL,NULL,NULL,1,0,'STD',182,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-05 17:52:44',1,'2021-01-16 12:30:20',NULL,NULL,NULL),(515,NULL,'maxExperienceUnit','Max Experience In',3,'required','Please Select Experience Unit','Manual',NULL,NULL,NULL,1,0,'STD',182,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-05 17:54:07',1,'2021-01-16 12:30:20',NULL,NULL,NULL),(516,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,1,NULL,1,1,'',NULL,NULL,'',0,188,0,1,'2021-01-11 11:54:42',1,'2021-01-11 11:54:42',NULL,NULL,NULL),(517,NULL,'name','Name',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,2,NULL,1,1,'',NULL,NULL,'',0,189,0,1,'2021-01-11 11:55:46',1,'2021-01-11 11:55:46',NULL,NULL,NULL),(518,NULL,'email','Email',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,3,NULL,1,1,'',NULL,NULL,'',0,190,0,1,'2021-01-11 11:56:49',1,'2021-01-11 11:56:49',NULL,NULL,NULL),(519,NULL,'contactNo','Contact No',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,4,NULL,1,1,'',NULL,NULL,'',0,191,0,1,'2021-01-11 11:58:06',1,'2021-08-07 10:19:16',NULL,NULL,NULL),(520,NULL,'jobPostingId','Job Posting',4,'Not Required',NULL,'Manual',197,NULL,NULL,1,0,'STD',201,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-11 12:01:01',1,'2021-01-11 12:01:01',NULL,NULL,NULL),(521,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',204,1,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-11 15:57:09',1,'2021-01-11 15:57:09',NULL,NULL,NULL),(522,NULL,'name','Name',1,'required','Please Enter Your Full Name','Manual',NULL,NULL,NULL,1,0,'STD',204,2,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-11 15:57:40',1,'2021-01-20 15:25:33',NULL,NULL,NULL),(523,NULL,'email','Email',1,'required','Please Enter Your Email','Manual',NULL,NULL,NULL,1,0,'STD',204,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-11 15:58:13',1,'2021-01-20 15:25:33',NULL,NULL,NULL),(524,NULL,'contactNo','Contact No',1,'required','Please Enter Your Mobile No','Manual',NULL,NULL,NULL,1,0,'STD',204,4,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-11 15:58:57',1,'2021-01-20 15:26:01',NULL,NULL,NULL),(525,NULL,'jobPostingId','Job Posting',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',204,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 12:37:47',1,'2021-01-12 13:00:43',NULL,NULL,NULL),(526,NULL,'applySource','Apply Source',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',204,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 15:42:18',1,'2021-01-12 15:42:18',NULL,NULL,NULL),(527,NULL,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,1,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 16:57:50',1,'2021-01-12 16:57:50',NULL,NULL,NULL),(528,NULL,'name','Name',1,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',205,2,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 16:58:12',1,'2021-01-12 17:41:28',NULL,NULL,NULL),(529,NULL,'email','Email',19,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',205,3,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 17:40:49',1,'2021-01-12 17:40:49',NULL,NULL,NULL),(530,NULL,'contactNo','Contact No',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 17:42:23',1,'2021-08-07 10:28:34',NULL,NULL,NULL),(531,NULL,'jobPostingId','Job Posting',18,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',205,5,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 17:45:23',1,'2021-01-12 17:46:43',NULL,NULL,NULL),(532,NULL,'applySource','Apply Source',18,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',205,6,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 17:46:26',1,'2021-01-12 17:46:26',NULL,NULL,NULL),(533,NULL,'skillExperience','Experience',15,'Not Required',NULL,'Manual',197,NULL,NULL,1,0,'STD',205,9,'applyMandatorySkills',1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-12 17:50:36',1,'2021-01-27 11:31:25',NULL,NULL,NULL),(534,533,'id','S. No.',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,1,NULL,1,1,'',NULL,NULL,'',0,193,0,1,'2021-01-13 12:07:11',1,'2021-01-13 17:56:22',NULL,NULL,NULL),(535,533,'mandatorySkillId','Skill',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,2,NULL,1,1,'',NULL,NULL,'',0,194,0,1,'2021-01-13 12:07:56',1,'2021-01-13 17:03:47',NULL,NULL,NULL),(536,533,'haveSkill','Have Skill',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,3,NULL,1,1,'',NULL,NULL,'',0,192,0,1,'2021-01-13 12:08:44',1,'2021-01-13 18:28:24',NULL,NULL,NULL),(537,533,'experience','Experience',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,4,NULL,1,1,'',NULL,NULL,'',0,195,0,1,'2021-01-13 12:20:18',1,'2021-01-20 16:09:23',NULL,NULL,NULL),(538,533,'experienceUnit','Experience In',3,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,5,NULL,1,1,'',NULL,NULL,'',0,196,0,1,'2021-01-13 12:24:59',1,'2021-01-13 12:24:59',NULL,NULL,NULL),(539,533,'comment','Comment',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,6,NULL,1,1,'',NULL,NULL,'',0,197,0,1,'2021-01-13 12:26:41',1,'2021-01-13 12:26:41',NULL,NULL,NULL),(540,NULL,'resume','Resume',17,'required','Please Upload Your Resume First','Manual',NULL,NULL,NULL,1,0,'STD',205,7,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-13 12:35:37',1,'2021-01-20 15:57:12',NULL,NULL,NULL),(541,NULL,'takeIntroductionVideo','Take Introduction Video',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',197,16,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-14 13:09:53',1,'2021-01-16 17:01:28',NULL,NULL,NULL),(542,NULL,'introVideoDuration','Introduction Video Duration (In Min.)',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,0,541,'STD',197,17,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-14 13:10:45',1,'2021-01-16 13:05:25',NULL,NULL,NULL),(543,NULL,'introVideoFilename','Intro Video Filename',18,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,9,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-14 16:11:37',1,'2021-01-14 16:11:37',NULL,NULL,NULL),(544,NULL,'status','Status',3,'required','Please Enter Status','Manual',NULL,NULL,NULL,1,0,'STD',190,9,NULL,1,1,NULL,NULL,NULL,NULL,0,225,0,1,'2021-01-04 15:16:51',1,'2021-08-03 01:38:12',NULL,NULL,NULL),(545,NULL,'status','Status',1,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',201,9,NULL,1,1,'',NULL,NULL,'',0,198,0,1,'2021-01-19 11:00:13',1,'2021-07-22 05:57:44',NULL,NULL,NULL),(546,NULL,'skillSummary','Skill Summary',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,8,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 11:32:21',1,'2021-01-27 11:32:21',NULL,NULL,NULL),(547,NULL,'permanentAddressSection','Permanent Address',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,10,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 12:47:39',1,'2021-01-27 12:50:41',NULL,NULL,NULL),(549,NULL,'permanentAddress','Address',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,11,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 12:51:06',1,'2021-01-27 12:51:06',NULL,NULL,NULL),(550,NULL,'permanentCityId','City',4,'Not Required',NULL,'Manual',209,'551',NULL,1,0,'STD',205,12,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:04:38',1,'2021-07-22 05:26:02',NULL,NULL,NULL),(551,NULL,'permanentStateId','State',4,'Not Required',NULL,'Manual',208,'552',NULL,1,0,'STD',205,13,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:05:24',1,'2021-07-22 05:26:02',NULL,NULL,NULL),(552,NULL,'permanentCountryId','Country',4,'Not Required',NULL,'Manual',207,NULL,NULL,1,0,'STD',205,14,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:06:24',1,'2021-01-27 13:36:21',NULL,NULL,NULL),(553,NULL,'currentAddressSection','Current Address',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,16,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:08:43',1,'2021-01-27 13:36:21',NULL,NULL,NULL),(554,NULL,'sameAsPermanentAddress','Same as Permanent Address',31,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,17,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:10:23',1,'2021-01-27 13:38:52',NULL,NULL,NULL),(555,NULL,'currentAddress','Address',1,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,554,'STD',205,18,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 12:51:06',1,'2021-01-27 14:00:31',NULL,NULL,NULL),(556,NULL,'currentCityId','City',4,'Not Required',NULL,'Manual',209,'557',NULL,1,554,'STD',205,19,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:04:38',1,'2021-07-22 05:26:02',NULL,NULL,NULL),(557,NULL,'currentStateId','State',4,'Not Required',NULL,'Manual',208,'558',NULL,1,554,'STD',205,20,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:05:24',1,'2021-07-22 05:26:02',NULL,NULL,NULL),(558,NULL,'currentCountryId','Country',4,'Not Required',NULL,'Manual',207,NULL,NULL,1,554,'STD',205,21,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:06:24',1,'2021-01-27 14:00:31',NULL,NULL,NULL),(559,NULL,'totalExperience','Total Experience',2,'required','Please Enter Your Experience','Manual',NULL,NULL,NULL,1,0,'STD',205,24,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:19:38',1,'2021-01-27 15:39:41',NULL,NULL,NULL),(560,NULL,'totalExperienceUnit','Total Experience In',3,'required','Please Select Unit','Manual',NULL,NULL,NULL,1,0,'STD',205,25,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:22:30',1,'2021-01-27 15:39:41',NULL,NULL,NULL),(561,NULL,'relavantExperience','Relavant Experience',2,'required','Please Enter Your Experience','Manual',NULL,NULL,NULL,1,0,'STD',205,26,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:25:06',1,'2021-01-27 15:39:41',NULL,NULL,NULL),(562,NULL,'relavantExperienceUnit','Relavant Experience In',3,'required','Please Select Unit','Manual',NULL,NULL,NULL,1,0,'STD',205,27,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:26:31',1,'2021-01-27 15:39:41',NULL,NULL,NULL),(563,NULL,'experienceSection','Experience',14,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,23,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:28:53',1,'2021-01-27 13:42:49',NULL,NULL,NULL),(564,NULL,'permanentPincode','Pincode',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,15,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:37:30',1,'2021-01-27 13:49:57',NULL,NULL,NULL),(565,NULL,'currentPincode','Pincode',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,554,'STD',205,22,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 13:41:48',1,'2021-01-27 14:00:31',NULL,NULL,NULL),(566,NULL,'coverLetter','Write a Cover Letter With Your Application',13,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',205,28,NULL,1,0,'',NULL,NULL,'',0,NULL,0,1,'2021-01-27 14:24:16',1,'2021-01-27 14:24:16',NULL,NULL,NULL),(567,NULL,'appliedDate','Applied Date',5,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,6,NULL,1,1,'',NULL,NULL,'',0,199,0,1,'2021-01-27 15:45:09',1,'2021-07-22 05:57:44',NULL,NULL,NULL),(568,NULL,'totalExperience','Total Experience',2,'Not Required',NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,7,NULL,1,1,'',NULL,NULL,'',0,200,0,1,'2021-01-27 15:52:01',1,'2021-07-22 05:57:44',NULL,NULL,NULL),(569,NULL,'totalExperienceUnit','Experience In',1,'Not Required',NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',201,8,NULL,1,1,'',NULL,NULL,'',0,201,0,1,'2021-01-27 15:53:21',1,'2021-07-22 05:57:44',NULL,NULL,NULL),(591,NULL,'JobPostingSkillSummarry','Job Posting Skill Summary',14,NULL,NULL,'AutoPopulate',197,'520',NULL,1,0,'STD',201,10,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-19 16:39:49',1,'2021-07-21 10:25:30',NULL,NULL,NULL),(653,NULL,'skillExperience','Experience',15,NULL,NULL,'Manual',197,NULL,NULL,1,0,'STD',201,19,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-19 20:51:48',1,'2021-07-19 20:51:48',NULL,NULL,NULL),(654,653,'id','Sr .No',18,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,20,NULL,1,0,NULL,NULL,NULL,NULL,0,207,0,1,'2021-07-20 10:00:27',1,'2021-07-20 10:00:27',NULL,NULL,NULL),(655,653,'mandatorySkillId','Skill',18,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,21,NULL,1,0,NULL,NULL,NULL,NULL,0,208,0,1,'2021-07-20 10:00:27',1,'2021-07-20 10:00:27',NULL,NULL,NULL),(656,653,'haveSkill','HaveSkill',31,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,22,NULL,1,0,NULL,NULL,NULL,NULL,0,212,0,1,'2021-07-20 10:00:27',1,'2021-07-20 10:00:27',NULL,NULL,NULL),(657,653,'experience','Experience',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,23,NULL,1,0,NULL,NULL,NULL,NULL,0,209,0,1,'2021-07-20 10:00:27',1,'2021-07-20 10:00:27',NULL,NULL,NULL),(658,653,'experienceUnit','Experience IN',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,24,NULL,1,0,NULL,NULL,NULL,NULL,0,210,0,1,'2021-07-20 10:00:27',1,'2021-07-20 10:00:27',NULL,NULL,NULL),(659,653,'comment','Comment',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,25,NULL,1,0,NULL,NULL,NULL,NULL,0,211,0,1,'2021-07-20 10:00:27',1,'2021-07-20 10:08:30',NULL,NULL,NULL),(666,NULL,'skillSummary','Skill Summary',14,NULL,NULL,'AutoPopulate',NULL,NULL,NULL,1,0,'STD',201,30,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 14:56:11',1,'2021-07-20 14:56:11',NULL,NULL,NULL),(672,NULL,'skillSummary','Skill Summary',15,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,31,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 15:39:40',1,'2021-07-20 15:39:40',NULL,NULL,NULL),(673,672,'id','Sr .No',18,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,32,NULL,1,0,NULL,NULL,NULL,NULL,0,207,0,1,'2021-07-20 15:40:58',1,'2021-07-20 15:40:58',NULL,NULL,NULL),(674,672,'mandatorySkillId','Skill',4,NULL,NULL,'Manual',188,NULL,NULL,1,0,'STD',201,33,NULL,1,0,NULL,NULL,NULL,NULL,0,208,0,1,'2021-07-20 15:40:58',1,'2021-07-20 15:49:38',NULL,NULL,NULL),(675,672,'experience','Experience',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,34,NULL,1,0,NULL,NULL,NULL,NULL,0,209,0,1,'2021-07-20 15:40:58',1,'2021-07-20 15:40:58',NULL,NULL,NULL),(676,672,'experienceUnit','Experience IN',3,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,35,NULL,1,0,NULL,NULL,NULL,NULL,0,210,0,1,'2021-07-20 15:40:58',1,'2021-07-20 15:40:58',NULL,NULL,NULL),(677,672,'comment','Comment',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,36,NULL,1,0,NULL,NULL,NULL,NULL,0,211,0,1,'2021-07-20 15:40:58',1,'2021-07-20 15:40:58',NULL,NULL,NULL),(678,NULL,'permanentAddress','Permanent Address',14,NULL,NULL,'Autopopulate',NULL,NULL,NULL,1,0,'STD',201,37,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:25:33',1,'2021-07-20 16:25:33',NULL,NULL,NULL),(679,NULL,'permanentAddress','Address',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,38,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 16:37:32',NULL,NULL,NULL),(680,NULL,'cityId','City',4,NULL,NULL,'Manual',209,'681',NULL,1,0,'STD',201,39,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:29:25',NULL,NULL,NULL),(681,NULL,'permanentStateId','State',4,NULL,NULL,'Manual',208,'682',NULL,1,0,'STD',201,40,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:29:25',NULL,NULL,NULL),(682,NULL,'permanentCountryId','Country',4,NULL,NULL,'Manual',207,NULL,NULL,1,0,'STD',201,41,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 16:46:51',NULL,NULL,NULL),(683,NULL,'permanentPincode','Pincode',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,42,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 16:46:51',NULL,NULL,NULL),(684,NULL,'currentAddress','currentAddress',14,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,43,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 16:43:52',NULL,NULL,NULL),(685,NULL,'isSameTOPermanent','isSameTOPermanent',31,NULL,NULL,'Manual',NULL,NULL,NULL,1,0,'STD',201,44,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 16:43:52',NULL,NULL,NULL),(686,NULL,'currentAddress','Address',1,NULL,NULL,'Manual',NULL,NULL,NULL,1,685,'STD',201,45,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:00:06',NULL,NULL,NULL),(687,NULL,'currentCityId','City',4,NULL,NULL,'Manual',209,'688',NULL,1,685,'STD',201,46,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:28:41',NULL,NULL,NULL),(688,NULL,'currentStateId','State',4,NULL,NULL,'Manual',208,'689',NULL,1,685,'STD',201,47,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:05:28',NULL,NULL,NULL),(689,NULL,'currentCountryId','Country',4,NULL,NULL,'Manual',207,NULL,NULL,1,685,'STD',201,48,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:00:06',NULL,NULL,NULL),(690,NULL,'currentPincode','Pincode',2,NULL,NULL,'Manual',NULL,NULL,NULL,1,685,'STD',201,49,NULL,1,0,NULL,NULL,NULL,NULL,0,NULL,0,1,'2021-07-20 16:37:32',1,'2021-07-20 17:00:06',NULL,NULL,NULL),(704,500,'hiringTypeId','Type',4,'required','Please Select Type','Manual',NULL,'503',NULL,1,0,'STD',182,5,NULL,1,1,' ',NULL,NULL,' ',0,218,0,1,'2021-07-31 11:11:22',1,'2021-07-31 12:39:39',NULL,NULL,NULL),(705,500,'question','Interview / Assessment',4,'required','Pleasec Select Test Set','Manual',NULL,'704',NULL,1,0,'STD',182,6,NULL,1,1,' ',NULL,NULL,' ',0,219,0,1,'2021-07-31 11:11:22',1,'2021-08-06 08:50:29',NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_sort`
--

DROP TABLE IF EXISTS `default_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_sort` (
  `id` bigint NOT NULL,
  `module_id` bigint DEFAULT NULL,
  `sort_order` enum('asc','desc') DEFAULT NULL,
  `field_indexing_id` int DEFAULT NULL,
  `sorting_name` varchar(180) DEFAULT NULL,
  `default_flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_sort`
--

LOCK TABLES `default_sort` WRITE;
/*!40000 ALTER TABLE `default_sort` DISABLE KEYS */;
INSERT INTO `default_sort` VALUES (1,112,'asc',2,'Sort By Company Name',1);
/*!40000 ALTER TABLE `default_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department` varchar(45) DEFAULT NULL,
  `short_name` varchar(45) DEFAULT NULL,
  `description` longtext,
  `status` bigint DEFAULT '1',
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_department_createdBy_idx` (`created_by`),
  KEY `FK_user_department_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_department_idx` (`company_id`),
  KEY `FK_branch_branchId_idx` (`branch_id`),
  CONSTRAINT `FK_branch_branchId` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_department` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_user_department_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_department_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Management','MGMT','Test',2,1,'2020-10-27 13:53:11',1,'2021-07-15 22:59:29',1,1),(2,'Test Deapartment','TD','Test Deapartment',1,1,'2021-07-15 22:54:00',1,'2021-08-09 18:48:29',1,1),(3,'Test Deapartment','TD','Test Department',1,1,'2021-07-15 22:54:24',1,'2021-08-09 18:48:23',1,1),(4,'Test Department','TD','Test Department',1,1,'2021-07-15 22:57:07',1,'2021-08-09 18:48:16',1,1),(5,'Hr','test','ffffff',1,1,'2021-07-16 10:12:02',1,'2021-08-09 18:47:55',1,1),(6,'COy','test','yhth',1,1,'2021-07-22 16:17:39',1,'2021-08-09 18:47:47',1,1),(7,'Chief Technology Officer','CTO','',2,1,'2021-07-22 16:17:50',1,'2021-08-09 18:59:52',1,1),(8,'Engineer','Engg',NULL,2,1,'2021-07-24 16:45:09',1,'2021-08-09 19:00:17',1,1),(9,'Human Resource','HR','Department of Human Resource and Devlopement',2,1,'2021-07-27 16:30:55',1,'2021-08-09 18:48:10',1,1),(10,'test1234','tes','testing',1,1,'2021-08-01 15:07:31',1,'2021-08-09 18:47:15',1,1),(11,'Information Technology','IT',' ERP Software Development',2,1,'2021-08-02 13:20:13',1,'2021-08-09 18:47:07',1,1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `designation` varchar(45) DEFAULT NULL,
  `short_name` varchar(45) DEFAULT NULL,
  `description` longtext,
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `status` bigint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_user_designation_createdBy_idx` (`created_by`),
  KEY `FK_user_designation_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_designation_idx` (`company_id`),
  KEY `FK_branch_designation_idx` (`branch_id`),
  CONSTRAINT `FK_branch_designation` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_designation` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_user_designation_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_designation_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'Manager','MGR',NULL,1,'2020-10-27 13:53:29',1,'2021-08-09 18:56:39',1,1,2),(2,'Executive',NULL,NULL,1,'2021-07-10 17:43:35',1,'2021-08-09 18:50:59',1,1,1),(3,'Executive','Exe','exe',1,'2021-07-10 17:43:50',1,'2021-07-10 17:44:08',1,1,2),(4,'Human Resource','HR','TEST HR',1,'2021-07-15 23:02:22',1,'2021-08-09 18:50:49',1,1,1),(5,'Director','Drctr','Director',1,'2021-07-24 16:46:05',1,'2021-08-09 18:50:32',1,1,2),(6,'Java Developer','JD','Java Developer Trainee',1,'2021-07-27 16:30:01',1,'2021-08-09 18:49:51',1,1,2),(7,'Cleaner','cl','cleaner',1,'2021-08-01 15:08:43',1,'2021-08-01 15:08:43',1,1,2),(8,'HR-CRM','HR','Hiring',1,'2021-08-02 13:20:57',1,'2021-08-02 13:21:14',1,1,2),(9,'Chief Technology Officer','CTO','A chief technology officer (CTO) is the executive in charge of an organization\'s technological needs as well as its research and development (R&D). ... The CTO usually reports directly to a company\'s chief information officer (CIO), but may also report to the chief executive officer (CEO) of the firm.',1,'2021-08-09 18:58:43',1,'2021-08-09 18:58:43',1,1,2);
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_metadata`
--

DROP TABLE IF EXISTS `device_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_metadata` (
  `id` bigint NOT NULL,
  `reg_key` varchar(50) DEFAULT NULL,
  `system_ip` varchar(50) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `device_details` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `last_logged_in` date DEFAULT NULL,
  `enabled` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_metadata`
--

LOCK TABLES `device_metadata` WRITE;
/*!40000 ALTER TABLE `device_metadata` DISABLE KEYS */;
INSERT INTO `device_metadata` VALUES (18,NULL,'18.218.95.179',1,'Chrome 87.0 - Windows 10.null','Columbus','2021-01-28',1),(20,NULL,'18.218.95.179',1,'Opera 72.0 - Windows 10.null','Columbus','2020-11-21',1),(21,NULL,'18.218.95.179',1,'Chrome 86.0 - Windows 10.null','Columbus','2020-11-26',1),(22,NULL,'18.218.95.179',1,'Chrome 86.0 - Linux null.null','Columbus','2020-12-14',1),(23,NULL,'18.218.95.179',1,'Chrome 80.0 - Linux null.null','Columbus','2021-01-01',1),(24,NULL,'18.218.95.179',1,'Opera 69.0 - Linux null.null','Columbus','2021-01-01',1),(25,NULL,'18.218.95.179',1,'Opera 73.0 - Windows 10.null','Columbus','2021-01-27',1),(26,NULL,'18.218.95.179',1,'Chrome 89.0 - Windows 10.null','Columbus','2021-04-19',1),(27,NULL,'18.218.95.179',1,'Chrome 90.0 - Windows 10.null','Columbus','2021-05-17',1),(28,NULL,'18.218.95.179',1,'Chrome 91.0 - Windows 10.null','Columbus','2021-07-23',1),(29,NULL,'18.218.95.179',1,'Chrome 91.0 - Mac OS X 10.15','Columbus','2021-07-06',1),(30,NULL,'18.218.95.179',1,'Chrome Mobile 91.0 - Android 8.1','Columbus','2021-07-15',0),(31,NULL,'18.218.95.179',1,'Chrome 92.0 - Windows 10.null','Columbus','2021-08-10',1),(32,NULL,'18.218.95.179',1,'Chrome Mobile 92.0 - Android 8.1','Columbus','2021-07-26',0),(33,NULL,'18.218.95.179',1,'Chrome 92.0 - Linux null.null','Columbus','2021-08-01',0);
/*!40000 ALTER TABLE `device_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_verification_otp`
--

DROP TABLE IF EXISTS `device_verification_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_verification_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `otp` varchar(45) DEFAULT NULL,
  `device_id` bigint DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deviceMetadata_deviceVerOtpFK_idx` (`device_id`),
  CONSTRAINT `deviceMetadata_deviceVerOtpFK` FOREIGN KEY (`device_id`) REFERENCES `device_metadata` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_verification_otp`
--

LOCK TABLES `device_verification_otp` WRITE;
/*!40000 ALTER TABLE `device_verification_otp` DISABLE KEYS */;
INSERT INTO `device_verification_otp` VALUES (1,'0086',18,'2020-11-22'),(3,'3666',20,'2020-11-22'),(4,'8415',21,'2020-11-24'),(5,'8085',22,'2020-12-11'),(6,'3850',23,'2021-01-02'),(7,'4077',24,'2021-01-02'),(8,'8444',25,'2021-01-28'),(9,'0195',26,'2021-04-13'),(10,'2711',27,'2021-05-18'),(11,'6664',28,'2021-07-03'),(12,'7403',29,'2021-07-07'),(13,'5078',30,'2021-07-16'),(14,'3264',31,'2021-07-23'),(15,'0795',32,'2021-07-27'),(16,'5946',33,'2021-08-02');
/*!40000 ALTER TABLE `device_verification_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_content`
--

DROP TABLE IF EXISTS `document_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_version_id` bigint DEFAULT NULL,
  `document_content` longblob,
  PRIMARY KEY (`id`),
  KEY `FK_documentVersion_documentContent_idx` (`document_version_id`),
  CONSTRAINT `FK_documentVersion_documentContent` FOREIGN KEY (`document_version_id`) REFERENCES `document_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_content`
--

LOCK TABLES `document_content` WRITE;
/*!40000 ALTER TABLE `document_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_folder`
--

DROP TABLE IF EXISTS `document_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_folder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(150) DEFAULT NULL,
  `parent_folder_id` bigint DEFAULT NULL,
  `module_id` bigint DEFAULT NULL,
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint NOT NULL,
  `branch_id` bigint NOT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_documentFolder_documentFolder_idx` (`parent_folder_id`),
  KEY `FK_user_documentFolder_createdBy_idx` (`created_by`),
  KEY `FK_user_documentFolder_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_documentFolder_idx` (`company_id`),
  KEY `FK_branch_documentFolder_idx` (`branch_id`),
  KEY `FK_modules_documentFolder_idx` (`module_id`),
  KEY `FK_statusDetails_documentFolder_idx` (`status`),
  CONSTRAINT `FK_branch_documentFolder` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_documentFolder` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_documentFolder_documentFolder` FOREIGN KEY (`parent_folder_id`) REFERENCES `document_folder` (`id`),
  CONSTRAINT `FK_modules_documentFolder` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_statusDetails_documentFolder` FOREIGN KEY (`status`) REFERENCES `document_folder` (`id`),
  CONSTRAINT `FK_user_documentFolder_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_documentFolder_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_folder`
--

LOCK TABLES `document_folder` WRITE;
/*!40000 ALTER TABLE `document_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_version`
--

DROP TABLE IF EXISTS `document_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `hash_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `revision_number` bigint NOT NULL DEFAULT '0',
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint NOT NULL,
  `branch_id` bigint NOT NULL,
  `status` bigint DEFAULT NULL,
  `reason_for_failure` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `FK_document_documentContent_idx` (`document_id`),
  KEY `FK_branch_documentContent_idx` (`branch_id`),
  KEY `FK_company_documentContent_idx` (`company_id`),
  KEY `FK_user_documentContent_createdBy_idx` (`created_by`),
  KEY `FK_user_documentContent_modifiedBy_idx` (`modified_by`),
  KEY `FK_statusDetails_documentVersion_idx` (`status`),
  CONSTRAINT `FK_branch_documentVersion` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_documentVersion` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_documenrts_documentVersion` FOREIGN KEY (`document_id`) REFERENCES `document_version` (`id`),
  CONSTRAINT `FK_statusDetails_documentVersion` FOREIGN KEY (`status`) REFERENCES `status_details` (`id`),
  CONSTRAINT `FK_user_documentVersion_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_documentVersion_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_version`
--

LOCK TABLES `document_version` WRITE;
/*!40000 ALTER TABLE `document_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_folder_id` bigint DEFAULT NULL,
  `type_id` bigint NOT NULL,
  `document_name` varchar(45) DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `ref_doc` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `branch_id` bigint NOT NULL,
  `status` bigint DEFAULT NULL,
  `filepath` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_user_document_createdBy_idx` (`created_by`),
  KEY `FK_user_document_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_document_idx` (`company_id`),
  KEY `FK_branch_document_idx` (`branch_id`),
  KEY `FK_documentFolder_document_idx` (`document_folder_id`),
  KEY `FK_company_document_ref_doc_idx` (`ref_doc`),
  KEY `FK_type_document_idx` (`type_id`),
  KEY `FK_statusDetails_documentVersion_idx` (`status`),
  CONSTRAINT `FK_branch_document` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_branch_document_ref_doc` FOREIGN KEY (`ref_doc`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_document` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_company_document_ref_doc` FOREIGN KEY (`ref_doc`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_documentFolder_document` FOREIGN KEY (`document_folder_id`) REFERENCES `document_folder` (`id`),
  CONSTRAINT `FK_employee_document` FOREIGN KEY (`ref_doc`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_statusDetails_document` FOREIGN KEY (`status`) REFERENCES `status_details` (`id`),
  CONSTRAINT `FK_type_document` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_user_document_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_document_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department_id` bigint NOT NULL,
  `designation_id` bigint NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `reporting_manager` bigint DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `reporting_branch` bigint DEFAULT NULL,
  `erp_user` tinyint DEFAULT '0',
  `emp_code` varchar(45) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employee_employee_idx` (`reporting_manager`),
  KEY `FK_department_employee_idx` (`department_id`),
  KEY `FK_designation_employee_idx` (`designation_id`),
  KEY `FK_user_employee_createdBy_idx` (`created_by`),
  KEY `FK_user_employee_modifiedBy_idx` (`modified_by`),
  KEY `FK_branch_employee_reportingBranch_idx` (`reporting_branch`),
  KEY `FK_branch_employee_branchId_idx` (`branch_id`),
  KEY `FK_company_employee_idx` (`company_id`),
  CONSTRAINT `FK_branch_employee_branchId` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_branch_employee_reportingBranch` FOREIGN KEY (`reporting_branch`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_employee` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_department_employee` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_designation_employee` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`id`),
  CONSTRAINT `FK_employee_employee` FOREIGN KEY (`reporting_manager`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_user_employee_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_employee_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,1,'Anshul','Chandra','Kumar',NULL,NULL,'1987-01-31',NULL,1,1,'EMP0001','M',2,1,'2020-10-28 11:46:24',1,'2021-07-15 23:05:50',1,1),(2,1,1,'Navinder','Singh',NULL,'Test',1,'1987-02-01',NULL,1,1,'EMP0002','M',1,1,'2020-10-28 11:46:24',1,'2021-07-15 06:27:46',NULL,NULL),(3,1,1,'Sanjay','Rai',NULL,'Test A',1,'1987-02-01',NULL,1,1,'EMP0003','M',1,1,'2020-10-28 11:46:24',1,'2021-07-15 06:27:46',NULL,NULL),(4,1,1,'Ankit','Panwar',NULL,'UH',1,'1987-02-01',NULL,1,1,'EMP0004','M',1,1,'2020-10-28 11:46:24',1,'2021-07-15 06:27:46',NULL,NULL),(5,1,1,'Sachin','Sharma',NULL,'IJK',1,'1987-02-01',NULL,1,1,'EMP0005','M',1,1,'2020-10-28 11:46:24',1,'2021-07-15 06:27:47',NULL,NULL),(6,1,1,'Archna','Zadoo',NULL,'AW',1,'1987-01-29',NULL,1,1,'EMP0006','F',2,1,'2020-10-28 11:46:24',1,'2021-07-15 23:05:15',1,1),(7,9,8,'Deepika','Verma','','Virendra mohan verma',10,'2021-02-11','2021-07-20',1,0,'EMP0007','F',2,1,'2021-07-27 16:32:35',1,'2021-08-09 19:02:36',1,1),(8,2,7,'Suman','kumar',NULL,NULL,NULL,'2021-03-01',NULL,NULL,1,'EMP0008','M',2,1,'2021-08-01 15:10:46',1,'2021-08-03 00:39:26',1,1),(9,11,3,'Aman','Katiyar',NULL,'fdret',1,'2021-08-15','2021-08-01',1,1,'EMP0009','F',2,1,'2021-08-02 13:39:01',1,'2021-08-07 09:53:02',1,1),(10,7,9,'Adish','Jain',NULL,NULL,NULL,'1983-01-01',NULL,NULL,0,'EMP0010','M',2,1,'2021-08-09 19:01:57',1,'2021-08-09 19:01:57',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_ip`
--

DROP TABLE IF EXISTS `enabled_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enabled_ip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `system_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_ip_UNIQUE` (`system_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_ip`
--

LOCK TABLES `enabled_ip` WRITE;
/*!40000 ALTER TABLE `enabled_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `enabled_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exception_developer_zone`
--

DROP TABLE IF EXISTS `exception_developer_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exception_developer_zone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exception_developer_zone`
--

LOCK TABLES `exception_developer_zone` WRITE;
/*!40000 ALTER TABLE `exception_developer_zone` DISABLE KEYS */;
INSERT INTO `exception_developer_zone` VALUES (17,0,NULL,NULL,NULL,NULL),(18,0,NULL,NULL,NULL,NULL),(19,0,NULL,NULL,NULL,NULL),(20,0,NULL,NULL,NULL,NULL),(21,0,NULL,NULL,NULL,NULL),(22,0,NULL,NULL,NULL,NULL),(23,0,NULL,NULL,NULL,NULL),(24,0,NULL,NULL,NULL,NULL),(25,0,NULL,NULL,NULL,NULL),(26,0,NULL,NULL,NULL,NULL),(27,0,NULL,NULL,NULL,NULL),(28,0,NULL,NULL,NULL,NULL),(29,0,NULL,NULL,NULL,NULL),(30,0,NULL,NULL,NULL,NULL),(31,0,NULL,NULL,NULL,NULL),(32,0,NULL,NULL,NULL,NULL),(33,0,NULL,NULL,NULL,NULL),(34,0,NULL,NULL,NULL,NULL),(35,0,NULL,NULL,NULL,NULL),(36,0,NULL,NULL,NULL,NULL),(37,0,NULL,NULL,NULL,NULL),(38,0,NULL,NULL,NULL,NULL),(39,0,NULL,NULL,NULL,NULL),(40,0,NULL,NULL,NULL,NULL),(41,0,NULL,NULL,NULL,NULL),(42,0,NULL,NULL,NULL,NULL),(43,0,NULL,NULL,NULL,NULL),(44,0,NULL,NULL,NULL,NULL),(45,0,NULL,NULL,NULL,NULL),(46,0,NULL,NULL,NULL,NULL),(47,0,NULL,NULL,NULL,NULL),(48,0,NULL,NULL,NULL,NULL),(49,0,NULL,NULL,NULL,NULL),(50,0,NULL,NULL,NULL,NULL),(51,0,NULL,NULL,NULL,NULL),(52,0,NULL,NULL,NULL,NULL),(53,0,NULL,NULL,NULL,NULL),(54,0,NULL,NULL,NULL,NULL),(55,0,NULL,NULL,NULL,NULL),(56,0,NULL,NULL,NULL,NULL),(57,0,NULL,NULL,NULL,NULL),(58,0,NULL,NULL,NULL,NULL),(59,0,NULL,NULL,NULL,NULL),(60,0,NULL,NULL,NULL,NULL),(61,0,NULL,NULL,NULL,NULL),(62,0,NULL,NULL,NULL,NULL),(63,0,NULL,NULL,NULL,NULL),(64,0,NULL,NULL,NULL,NULL),(65,0,NULL,NULL,NULL,NULL),(66,0,NULL,NULL,NULL,NULL),(67,0,NULL,NULL,NULL,NULL),(68,400,'Given info is not complete, or missing, Please check given info & try again','DATA_MISSING','/customfield/get/112','2020-08-19 16:41:14'),(69,400,'Given info is not complete, or missing, Please check given info & try again','DATA_MISSING','/customfield/get/112','2020-08-19 16:51:31'),(70,400,'Given info is not complete, or missing, Please check given info & try again','DATA_MISSING','/customfield/get/112','2020-08-19 16:59:21'),(71,500,'Sorry, something went wrong! please try again after some time','No enum constant com.sterp.multitenant.tenant.entity.StatusEnum.InActive; nested exception is java.lang.IllegalArgumentException: No enum constant com.sterp.multitenant.tenant.entity.StatusEnum.InActive','/company/list','2020-08-19 17:26:18'),(72,500,'Sorry, something went wrong! please try again after some time','java.io.IOException: An established connection was aborted by the software in your host machine','/module/getAllActive','2020-08-19 17:41:01'),(73,500,'Sorry, something went wrong! please try again after some time','java.io.IOException: An established connection was aborted by the software in your host machine','/customfield/get/112','2020-08-19 17:41:01'),(74,500,'Sorry, something went wrong! please try again after some time','Failed to convert value of type \'java.lang.String\' to required type \'int\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"','/customfield/get/undefined','2020-08-21 11:49:40'),(75,500,'Sorry, something went wrong! please try again after some time','Failed to convert value of type \'java.lang.String\' to required type \'int\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"','/customfield/get/undefined','2020-08-21 12:02:32'),(76,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-08-24 14:18:25'),(77,500,'Sorry, something went wrong! please try again after some time','No enum constant com.sterp.multitenant.tenant.settings.enumtype.FieldType.autoCompleterMultiSelect; nested exception is java.lang.IllegalArgumentException: No enum constant com.sterp.multitenant.tenant.settings.enumtype.FieldType.autoCompleterMultiSelect','/customfield/get/112','2020-08-25 15:49:53'),(78,404,'states not found for country id: 5','NOT_FOUND','/state/getAllActive/5','2020-08-25 18:19:53'),(79,404,'states not found for country id: 6','NOT_FOUND','/state/getAllActive/6','2020-08-25 18:20:17'),(80,404,'states not found for country id: 7','NOT_FOUND','/state/getAllActive/7','2020-08-25 18:20:31'),(81,404,'states not found for country id: 12','NOT_FOUND','/state/getAllActive/12','2020-08-25 18:21:12'),(82,404,'states not found for country id: 17','NOT_FOUND','/state/getAllActive/17','2020-08-25 18:21:32'),(83,404,'states not found for country id: 6','NOT_FOUND','/state/getAllActive/6','2020-08-25 18:23:06'),(84,404,'states not found for country id: 7','NOT_FOUND','/state/getAllActive/7','2020-08-25 18:23:11'),(85,404,'states not found for country id: 12','NOT_FOUND','/state/getAllActive/12','2020-08-25 18:23:22'),(86,404,'states not found for country id: 7','NOT_FOUND','/state/getAllActive/7','2020-08-25 18:26:24'),(87,404,'states not found for country id: 6','NOT_FOUND','/state/getAllActive/6','2020-08-25 18:27:27'),(88,404,'states not found for country id: 5','NOT_FOUND','/state/getAllActive/5','2020-08-25 18:27:42'),(89,404,'states not found for country id: 6','NOT_FOUND','/state/getAllActive/6','2020-08-25 18:44:09'),(90,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-04 14:59:09'),(91,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-04 15:00:12'),(92,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-04 15:00:37'),(93,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-04 15:01:45'),(94,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-04 15:08:08'),(95,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-04 15:10:05'),(96,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-05 13:33:38'),(97,400,'Session has been timed out!','BAD_REQUEST','/company/list','2020-09-09 17:42:08'),(98,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-09-09 17:42:41'),(99,500,'Sorry, something went wrong! please try again after some time','Failed to convert value of type \'java.lang.String\' to required type \'int\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"','/state/getAllActive/undefined','2020-09-09 18:55:05'),(100,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-10 10:33:29'),(101,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-10 10:33:35'),(102,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-10 10:39:02'),(103,404,'states not found for country id: 221','NOT_FOUND','/state/getAllActive/221','2020-09-10 10:39:22'),(104,404,'states not found for country id: 7','NOT_FOUND','/state/getAllActive/7','2020-09-10 10:41:29'),(105,404,'states not found for country id: 94','NOT_FOUND','/state/getAllActive/94','2020-09-10 10:41:39'),(106,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-11 17:37:24'),(107,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-11 17:42:55'),(108,413,'Please Upload File below 2 MB','File Size Exceeds','/company/add','2020-09-11 17:49:24'),(109,500,'Sorry, something went wrong! please try again after some time','Content type \'\' not supported','/company/add','2020-09-11 17:52:29'),(110,500,'Sorry, something went wrong! please try again after some time','Required request part \'object\' is not present','/company/add','2020-09-11 18:04:26'),(111,500,'Sorry, something went wrong! please try again after some time','Required request part \'object\' is not present','/company/add','2020-09-11 18:06:27'),(112,500,'Sorry, something went wrong! please try again after some time','Required request part \'object\' is not present','/company/add','2020-09-11 18:08:19'),(113,500,'Sorry, something went wrong! please try again after some time','error performing isolated work; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: error performing isolated work','/company/add','2020-09-11 18:17:05'),(114,500,'Sorry, something went wrong! please try again after some time','error performing isolated work; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: error performing isolated work','/company/add','2020-09-11 18:17:31'),(115,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/customfield/get/112','2020-09-24 16:13:58'),(116,500,'Sorry, something went wrong! please try again after some time','No enum constant com.sterp.multitenant.tenant.enumtype.YesNoEnum.0; nested exception is java.lang.IllegalArgumentException: No enum constant com.sterp.multitenant.tenant.enumtype.YesNoEnum.0','/company/list','2020-09-24 16:16:43'),(117,500,'Sorry, something went wrong! please try again after some time','No enum constant com.sterp.multitenant.tenant.enumtype.YesNoEnum.; nested exception is java.lang.IllegalArgumentException: No enum constant com.sterp.multitenant.tenant.enumtype.YesNoEnum.','/company/list','2020-09-24 16:22:41'),(118,500,'Sorry, something went wrong! please try again after some time','failed to lazily initialize a collection of role: com.sterp.multitenant.tenant.company.entity.Company.bankAccounts, could not initialize proxy - no Session','/company/get/3','2020-09-24 17:02:15'),(119,500,'Sorry, something went wrong! please try again after some time','failed to lazily initialize a collection of role: com.sterp.multitenant.tenant.company.entity.Company.bankAccounts, could not initialize proxy - no Session','/company/get/3','2020-09-24 17:03:55'),(120,500,'Sorry, something went wrong! please try again after some time','failed to lazily initialize a collection of role: com.sterp.multitenant.tenant.company.entity.Company.bankAccounts, could not initialize proxy - no Session','/company/get/3','2020-09-24 17:06:04'),(121,500,'Sorry, something went wrong! please try again after some time','Failed to convert value of type \'java.lang.String\' to required type \'int\'; nested exception is java.lang.NumberFormatException: For input string: \"undefined\"','/customfield/get/undefined','2020-09-25 17:07:25'),(122,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/customfield/get/119','2020-09-29 15:52:34'),(123,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-09-30 16:59:32'),(124,400,'Please define entry type to fetch Custom Field','BAD_REQUEST','/customfield/list','2020-10-01 13:36:45'),(125,400,'Session has been timed out!','BAD_REQUEST','/customfield/list','2020-10-01 17:21:00'),(126,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/api/auth/login','2020-10-03 17:38:50'),(127,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/api/auth/login','2020-10-03 17:39:10'),(128,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/api/auth/login','2020-10-06 17:30:42'),(129,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/api/auth/login','2020-10-07 11:46:47'),(130,500,'Sorry, something went wrong! please try again after some time','No enum constant com.sterp.multitenant.tenant.settings.enumtype.TooltipType.pop; nested exception is java.lang.IllegalArgumentException: No enum constant com.sterp.multitenant.tenant.settings.enumtype.TooltipType.pop','/customfield/get/124','2020-10-08 13:56:51'),(131,500,'Sorry, something went wrong! please try again after some time','No enum constant com.sterp.multitenant.tenant.settings.enumtype.TooltipType.pop; nested exception is java.lang.IllegalArgumentException: No enum constant com.sterp.multitenant.tenant.settings.enumtype.TooltipType.pop','/customfield/get/124','2020-10-08 13:57:00'),(132,500,'Sorry, something went wrong! please try again after some time','could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet','/company/list','2020-10-08 15:06:47'),(133,500,'Sorry, something went wrong! please try again after some time',NULL,'/api/auth/login','2020-10-12 18:01:49'),(134,500,'Sorry, something went wrong! please try again after some time','For input string: \"Active\"; nested exception is java.lang.NumberFormatException: For input string: \"Active\"','/api/auth/login','2020-10-12 18:27:22'),(135,500,'Sorry, something went wrong! please try again after some time','For input string: \"Active\"; nested exception is java.lang.NumberFormatException: For input string: \"Active\"','/api/auth/login','2020-10-12 18:30:45'),(136,500,'Sorry, something went wrong! please try again after some time','For input string: \"Active\"; nested exception is java.lang.NumberFormatException: For input string: \"Active\"','/api/auth/login','2020-10-12 18:33:52'),(137,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-10-12 18:41:52'),(138,500,'Sorry, something went wrong! please try again after some time','For input string: \"Active\"; nested exception is java.lang.NumberFormatException: For input string: \"Active\"','/api/auth/login','2020-10-12 18:42:42'),(139,500,'Sorry, something went wrong! please try again after some time','Request method \'GET\' not supported','/customfield/getSelectionList','2020-10-14 18:19:45'),(140,500,'Sorry, something went wrong! please try again after some time','Content type \'multipart/form-data;boundary=----WebKitFormBoundary0XAO9t6mMoEAd4jS;charset=UTF-8\' not supported','/customfield/add','2020-10-14 18:45:10'),(141,500,'Sorry, something went wrong! please try again after some time','Content type \'multipart/form-data;boundary=----WebKitFormBoundaryqbZf25fKHz9Bc546;charset=UTF-8\' not supported','/customfield/add','2020-10-14 18:51:25'),(142,500,'Sorry, something went wrong! please try again after some time','Content type \'multipart/form-data;boundary=----WebKitFormBoundary3nJkgCOFlXwz4hJG;charset=UTF-8\' not supported','/company/add','2020-10-14 18:58:51'),(143,500,'Sorry, something went wrong! please try again after some time','Required request part \'company\' is not present','/company/add','2020-10-14 19:01:28'),(144,500,'Sorry, something went wrong! please try again after some time','No value present','/customfield/get/174','2020-10-14 19:27:57'),(145,500,'Sorry, something went wrong! please try again after some time','Request method \'POST\' not supported','/customfield/getSelectionList','2020-10-15 12:13:54'),(146,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/customfield/add','2020-10-15 12:45:18'),(147,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/customfield/add','2020-10-15 12:46:49'),(148,500,'Sorry, something went wrong! please try again after some time',NULL,'/module/getAllActive','2020-10-15 18:42:07'),(149,500,'Sorry, something went wrong! please try again after some time','Handler dispatch failed; nested exception is java.lang.Error: Unresolved compilation problem: \n	The method findCustom(StatusEnum) in the type ModulesRepository is not applicable for the arguments (String, StatusEnum)\n','/module/getAllActive','2020-10-15 18:53:06'),(150,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-10-16 11:25:07'),(151,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/customfield/add','2020-10-16 11:54:07'),(152,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/customfield/add','2020-10-16 12:01:36'),(153,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/customfield/add','2020-10-16 12:03:46'),(154,500,'Sorry, something went wrong! please try again after some time','No value present','/customfield/get/188','2020-10-16 12:46:23'),(155,500,'Sorry, something went wrong! please try again after some time','No value present','/customfield/get/188','2020-10-16 12:46:40'),(156,500,'Sorry, something went wrong! please try again after some time','ModelMapper mapping errors:\r\n\r\n1) Converter org.modelmapper.internal.converter.NumberConverter@29834eef failed to convert java.lang.String to int.\r\n\r\n1 error','/customfield/getById/188','2020-10-16 14:40:42'),(157,500,'Sorry, something went wrong! please try again after some time','Request method \'PUT\' not supported','/customfield/update','2020-10-16 15:25:56'),(158,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/customfield/add','2020-10-17 14:46:12'),(159,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-10-17 15:38:24'),(160,500,'Sorry, something went wrong! please try again after some time','could not execute statement; nested exception is org.hibernate.exception.GenericJDBCException: could not execute statement','/company/add','2020-10-17 16:54:31'),(161,500,'Sorry, something went wrong! please try again after some time','could not execute statement; nested exception is org.hibernate.exception.GenericJDBCException: could not execute statement','/company/add','2020-10-17 16:57:54'),(162,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/company/add','2020-10-17 16:58:56'),(163,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/company/add','2020-10-17 16:59:55'),(164,400,'could not execute statement; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement','DATA_INVALID','/company/add','2020-10-17 17:01:00'),(165,500,'Sorry, something went wrong! please try again after some time','Bad credentials','/api/auth/login','2020-10-22 17:49:01');
/*!40000 ALTER TABLE `exception_developer_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type`
--

DROP TABLE IF EXISTS `field_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `backend_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type`
--

LOCK TABLES `field_type` WRITE;
/*!40000 ALTER TABLE `field_type` DISABLE KEYS */;
INSERT INTO `field_type` VALUES (1,'text','java.lang.String'),(2,'number','java.lang.Long'),(3,'select','java.lang.String'),(4,'autoCompleter','java.lang.Integer'),(5,'date','java.sql.Date'),(6,'dateRange','java.sql.Date'),(7,'time',''),(8,'timeRange',NULL),(9,'dateTime','java.sql.Timestamp'),(10,'dateTimeRange','java.sql.Timestamp'),(11,'textarea','java.lang.String'),(12,'spanText','java.lang.String'),(13,'textEditor','java.lang.String'),(14,'Section',''),(15,'table',NULL),(16,'radio','java.lang.Long'),(17,'file','org.springframework.web.multipart.MultipartFile'),(18,'hidden',NULL),(19,'email','java.lang.String'),(21,'multiSelect',NULL),(23,'multiFile',NULL),(24,'checkbox',NULL),(25,'tabs',NULL),(26,'object',NULL),(27,'multipleCheck',NULL),(28,'password',NULL),(29,'tag',NULL),(30,'slider',NULL),(31,'switch',NULL),(32,'wizardStep',NULL),(33,'cardSelection',NULL),(34,'audio',NULL),(35,'video',NULL);
/*!40000 ALTER TABLE `field_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_validations`
--

DROP TABLE IF EXISTS `field_validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_validations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint DEFAULT NULL,
  `validation_name` varchar(180) NOT NULL,
  `error_message` mediumtext NOT NULL,
  `status` varchar(45) NOT NULL,
  `match_case` longtext,
  `ref_custom_field_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_validationName_customFieldId` (`custom_field_id`,`validation_name`),
  CONSTRAINT `FK_customFields_fieldValidations` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_validations`
--

LOCK TABLES `field_validations` WRITE;
/*!40000 ALTER TABLE `field_validations` DISABLE KEYS */;
INSERT INTO `field_validations` VALUES (1,379,'maxlength','Maximum Length Reached','1','50',NULL),(2,379,'minlength','Name is too short','1','3',NULL),(3,380,'maxlength','Description is too long','1','500',NULL),(4,380,'minlength','Description is too short','1','15',NULL),(5,360,'maxlength','Skill name is too long','1','20',NULL),(6,360,'minlength','Skill name is too short','1','3',NULL),(7,414,'maxlength','Skill Description is too long','1','500',NULL),(8,414,'minlength','	Skill Description is too short','1','15',NULL),(11,383,'maxlength','Factor can not more than','1','1',NULL),(12,383,'minlength','Factor can not less 0.1','1','0',NULL),(15,524,'minlength','Mobile number can not less 10','1','10',NULL),(16,524,'maxlength','Mobile number can not more than twelve digits','1','12',NULL),(17,524,'pattern','Please enter valid mobile number','1','[6789][0-9]{9}',NULL),(18,523,'pattern','Please enter valid email address','1','^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$',NULL),(19,464,'datevalidation','Please enter Date greater than','1','greaterthan',463),(20,12,'pattern','Please enter valid gst number','1','\\d{2}[A-Z]{5}\\d{4}[A-Z]{1}[A-Z\\d]{1}[Z]{1}[A-Z\\d]{1}',NULL),(21,8,'pattern','Please enter valid email address','1','^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$',NULL),(22,228,'pattern','Please enter valid email address','1','^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$',NULL),(23,229,'pattern','Please enter valid mobile number','1','[6789][0-9]{9}',NULL);
/*!40000 ALTER TABLE `field_validations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_indexing`
--

DROP TABLE IF EXISTS `fields_indexing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields_indexing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `index_field_name` varchar(225) DEFAULT NULL,
  `index_field_header` varchar(225) DEFAULT NULL,
  `field_width` int DEFAULT NULL,
  `sortable` tinyint DEFAULT '1',
  `filter` tinyint DEFAULT '1',
  `filter_type` varchar(100) DEFAULT NULL,
  `hiddable` tinyint DEFAULT '1',
  `display` tinyint DEFAULT '1',
  `display_order` int DEFAULT NULL,
  `data_field_name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_indexing`
--

LOCK TABLES `fields_indexing` WRITE;
/*!40000 ALTER TABLE `fields_indexing` DISABLE KEYS */;
INSERT INTO `fields_indexing` VALUES (1,'id','S. No.',80,1,0,'2',0,1,1,'id'),(2,'companyName','Company Name',200,1,1,'1',0,1,2,'companyName'),(3,'companyEmail','Email Address',150,1,1,'19',1,1,3,'companyEmail'),(4,'address','Company Address',250,1,1,'1',1,1,4,'address'),(5,'gstNo','GST No',100,1,1,'1',1,1,5,'gstNo'),(6,'status','Status',150,1,1,'1',1,1,6,'status'),(7,'countryName','Country',100,0,1,'1',0,0,7,'countryName'),(8,'stateName','State',100,0,1,'1',0,0,8,'stateName'),(9,'cityName','City',100,0,1,'1',0,0,9,'cityName'),(10,'panNo','Pan No.',100,1,1,'1',1,1,10,'panNo'),(11,'phone','Phone No.',120,1,1,'1',1,1,11,'phone'),(12,'bankName',NULL,200,0,0,'1',0,1,2,NULL),(13,'address',NULL,300,0,0,'1',0,1,3,NULL),(14,'countryId',NULL,200,0,0,'1',0,1,4,NULL),(15,'stateId',NULL,200,0,0,'1',0,1,5,NULL),(16,'cityId',NULL,200,0,0,'1',0,1,6,NULL),(17,'pincode',NULL,200,0,0,'1',0,1,7,NULL),(18,'acNo',NULL,200,0,0,'1',0,1,8,NULL),(19,'ifscCode',NULL,200,0,0,'1',0,1,9,NULL),(20,'swiftCode',NULL,200,0,0,'1',0,1,10,NULL),(21,'id',NULL,80,0,0,'1',0,1,1,NULL),(22,'id',NULL,80,0,0,'1',0,1,1,NULL),(23,'value',NULL,100,0,0,'1',0,1,1,NULL),(24,'title',NULL,100,0,0,'1',0,1,1,NULL),(25,'defaultValue',NULL,100,0,0,'1',0,1,1,NULL),(26,'status','Status',100,0,0,'1',0,1,1,'statusDetail.description'),(27,'customfield',NULL,100,0,0,'1',0,1,1,NULL),(28,'id',NULL,80,0,0,'1',0,1,1,NULL),(29,'value',NULL,100,0,0,'1',0,1,1,NULL),(30,'title',NULL,100,0,0,'1',0,1,1,NULL),(31,'defaultValue',NULL,100,0,0,'1',0,1,1,NULL),(32,'status','Status',100,0,0,'1',0,1,1,'statusDetail.description'),(33,'customfield',NULL,100,0,0,'1',0,1,1,NULL),(34,'id',NULL,80,0,0,'1',0,1,1,NULL),(35,'validationName',NULL,100,0,0,'1',0,1,1,NULL),(36,'errorMessage',NULL,100,0,0,'1',0,1,1,NULL),(37,'matchCase',NULL,100,0,0,'1',0,1,1,NULL),(38,'status','Status',100,0,0,'1',0,1,1,'statusDetail.description'),(39,'parentFieldId','Parent Field Name',120,1,0,'1',1,1,2,NULL),(40,'fieldName','DB Field Name',120,1,0,'1',1,1,4,NULL),(41,'module','Module Name',120,1,0,'1',1,1,3,NULL),(42,'fieldHeader','Field Label Name',120,1,0,'1',1,1,5,NULL),(43,'status','Status',100,1,0,'1',1,1,6,'statusDetail.description'),(44,'id','Sr. No.',80,1,0,'1',0,1,1,'id'),(45,'id','Sr. No.',80,1,0,'1',0,1,1,NULL),(46,'fieldName','DB Field Name',120,1,0,'1',1,1,2,NULL),(47,'fieldHeader','Field Label Name',120,1,0,'1',1,1,3,NULL),(48,'module','Module Name',120,1,0,'1',1,1,4,NULL),(49,'status','Status',100,1,0,'1',1,1,5,'statusDetail.description'),(50,'zoneCode','Zone Code',120,1,0,'1',1,1,2,'zoneCode'),(51,'zoneName','Zone Name',120,1,0,'1',1,1,3,'zoneName'),(52,'id','Sr. No.',80,1,0,'1',1,1,1,'id'),(53,'status','Status',100,1,0,'1',1,1,4,'status'),(54,'id','Sr. No.',80,1,0,'1',1,1,1,'id'),(55,'type','Branch Type',120,1,0,'1',1,1,2,'typeDetail.type'),(56,'branchCode','Branch Code',120,1,0,'1',1,1,3,'branchCode'),(57,'shortName','Short Name',100,1,0,'1',1,1,4,'ShortName'),(58,'branchName','Branch Name',120,1,0,'1',1,1,5,'branchName'),(59,'status','Status',120,1,0,'1',1,1,6,'statusDetail.description'),(60,'id',NULL,80,0,0,'1',0,1,1,'id'),(61,'contactPerson',NULL,150,0,0,'1',0,1,2,'contactPerson'),(62,'phone',NULL,120,0,0,'1',0,1,3,'phone'),(63,'mobile',NULL,120,0,0,'1',0,1,4,'mobile'),(64,'email',NULL,150,0,0,'1',0,1,5,'email'),(65,'department',NULL,120,0,0,'1',0,1,6,'department'),(66,'designation',NULL,120,0,0,'1',0,1,7,'designation'),(67,'id','Sr. No.',80,1,0,'1',0,1,1,NULL),(68,'type','Type Name',120,1,0,'1',0,1,2,NULL),(69,'module','Module Name',120,1,0,'1',1,1,3,NULL),(70,'id','Sr. No.',80,1,0,'1',1,1,1,'id'),(71,'department','Department',120,1,0,'1',1,1,2,'department'),(72,'shortName','Short Name',100,1,0,'1',1,1,3,'shortName'),(73,'id','Sr. No.',80,1,0,'1',1,1,1,'id'),(74,'designation','Designation',120,1,0,'1',1,1,2,'designation'),(75,'shortName','Short Name',100,1,0,'1',1,1,3,'shortName'),(76,'status','Status',100,1,0,'1',1,1,4,'statusDetail.description'),(77,'status','Status',100,1,0,'1',1,1,4,'statusDetail.description'),(78,'status','Status',100,1,0,'1',1,1,4,'statusDetail.description'),(91,'id','Sr. No.',80,1,0,'1',0,1,1,'id'),(92,'roleCode','Role Code',120,1,1,'1',1,1,2,'roleCode'),(93,'roleName','Role Name',120,1,1,'1',1,1,3,'roleName'),(94,'id','',80,0,0,NULL,0,1,1,NULL),(95,'moduleActionId','',120,0,0,NULL,0,1,2,NULL),(96,'permission',NULL,300,0,0,NULL,0,1,3,NULL),(97,'designation','Designation',120,1,1,'1',1,1,4,'designation.designation'),(98,'firstName','First Name',120,1,1,'1',1,1,5,'firstName'),(99,'middleName','Middle Name',120,1,0,'1',1,1,6,'middleName'),(100,'lastName','Last Name',120,1,1,'1',1,1,7,'lastName'),(101,'empCode','Emp. Code.',120,1,1,'1',1,1,2,'empCode'),(102,'departmentId','Department',120,1,1,'1',1,1,3,'department.department'),(103,'status','Status',100,1,1,'1',1,1,8,'statusDetail.description'),(104,'id','Sr. No.',80,1,0,NULL,1,1,1,'id'),(105,'id','Sr. No.',80,1,0,NULL,0,1,1,'id'),(106,'username','Username',120,1,1,'1',1,1,2,'username'),(107,'email','Email',120,1,1,'1',1,1,4,'email'),(108,'passwordExpiry','Password Expiry (In Days)',80,1,1,'2',1,1,5,'passwordExpiry'),(109,'status','Status',100,1,1,'1',1,1,6,'statusDetail.description'),(110,'id',NULL,80,0,0,NULL,0,1,1,'id'),(111,'branchId',NULL,120,0,0,NULL,0,1,2,'branch.branchName'),(112,'industryType','Industry Type',120,1,1,'1',1,1,1,NULL),(113,'type','Industry Type',120,1,1,NULL,0,1,0,NULL),(114,'jobProfileName','Job Profile Name',120,1,1,NULL,0,1,1,NULL),(115,'status','Status',50,1,0,NULL,0,1,0,'statusDetail.description'),(116,'status','Status',50,1,0,NULL,0,1,3,'statusDetail.description'),(117,'question','Question',150,1,0,NULL,0,1,1,'question'),(118,'difficultyLevel','Difficulty Level',60,1,0,NULL,0,1,2,'difficultyLevel'),(119,'status','Status',50,1,0,NULL,0,1,3,'statusDetail.description'),(120,'optionName','Option Name',550,1,0,NULL,0,1,2,'optionName'),(121,'status','Status',100,1,0,NULL,0,1,5,'status'),(122,'correctOption','Correct Option',80,0,0,NULL,0,1,3,'correctOption'),(123,'','Question',0,1,0,NULL,0,0,0,NULL),(124,'role','Role',60,1,0,NULL,1,1,2,'role'),(125,'status','Status',50,1,0,NULL,1,1,5,'statusDetail.description'),(126,'id','ID',0,0,0,NULL,0,0,1,NULL),(127,'designation','Designation',120,0,0,NULL,0,1,1,NULL),(128,'date_expiry','Expiry Date',50,0,0,NULL,0,1,2,NULL),(129,'posted_date','Posted Date',50,0,0,NULL,0,1,3,NULL),(130,'status','Status',50,0,0,NULL,0,1,5,NULL),(131,'skill','Skill',100,0,0,NULL,0,1,1,NULL),(132,'status','Status',0,0,0,NULL,0,1,2,'statusDetail.description'),(133,'skill_id','Skill',60,0,0,NULL,0,1,1,NULL),(134,'question_quantity','Question Quantity',60,0,0,NULL,0,1,2,NULL),(135,'difficulty_level','Difficulty Level',50,0,0,NULL,0,1,4,NULL),(136,'time_out_duration','Time Out Duration',50,0,0,NULL,0,1,5,NULL),(137,'weight_per_question','Weight Per Question',50,0,0,NULL,0,1,6,NULL),(138,'id','S. No.',50,0,0,NULL,0,1,1,NULL),(139,'name','Type',50,0,0,NULL,0,1,2,'name'),(140,'description','Description',50,0,0,NULL,0,1,3,'description'),(141,'status','Status',50,0,0,NULL,0,1,4,'statusDetail.description'),(142,'industryTypeId','Industry Type',50,1,0,'1',1,1,4,'industryType.name'),(143,'description','Description',50,0,0,NULL,1,1,4,'description'),(144,'negetiveMarkFactor','Neagative Marks',50,0,0,NULL,0,1,4,'negetiveMarkFactor'),(145,'id','S. No',30,1,0,NULL,0,1,1,'id'),(146,'title','Title',80,1,0,NULL,1,1,2,'title'),(147,'id','S. No.',30,1,0,NULL,0,1,1,'id'),(148,'jobTitle','Job Title',80,1,0,NULL,1,1,2,'jobTitle'),(149,'applicableDate','Applicable Date',50,1,0,NULL,1,1,3,'applicableDate'),(151,'id','S. No.',10,1,0,NULL,0,1,1,'id'),(152,'id','S. No.',30,1,0,NULL,0,0,1,'id'),(153,'question','Question',80,1,0,NULL,0,1,2,'question'),(154,'action_id','Action',100,0,0,NULL,0,1,2,'actionId'),(155,'buttonId','Button',100,1,1,NULL,1,1,3,'Button'),(156,'id','S. No.',50,0,0,NULL,0,1,1,'id'),(157,'id','S. No.',50,0,0,NULL,0,1,1,'id'),(158,'id','S. No.',30,0,0,NULL,0,1,1,'id'),(159,'description','Description',0,0,0,NULL,0,1,3,'description'),(160,'remarks','Remarks',80,0,0,NULL,1,1,12,'remarks'),(161,'id','S. No.',30,1,0,NULL,0,1,1,'id'),(162,'questionId','Question',120,0,0,NULL,0,1,1,'question.question'),(163,'timeout','Timeout',60,0,0,NULL,0,1,2,'timeout'),(164,'thinkTime','Think Time',50,1,1,NULL,1,1,3,'thinkTime'),(165,'attempts','Attempts',50,0,1,NULL,1,0,4,'attempts'),(166,'id','S. No.',20,0,0,NULL,0,1,1,'id'),(167,'interviewName','Interview Name',300,1,0,NULL,1,1,2,'interviewName'),(168,'totalQuestions','Total Question',50,1,0,NULL,1,1,3,'totalQuestions'),(169,'skillId','Skill',30,0,0,NULL,0,1,2,'skill.skill'),(170,'id','S. No.',10,1,1,NULL,0,1,1,'id'),(171,'experienceRequired','Mininum Experience Required',30,0,0,NULL,0,1,3,'experienceRequired'),(172,'mandatory','Mandatory',30,0,0,NULL,0,1,4,'mandatory'),(173,'id','S. No.',10,0,0,NULL,0,1,1,'id'),(174,'roundName','Round Name',80,0,0,NULL,0,1,2,'roundName'),(175,'mode','Mode',50,0,0,NULL,0,1,3,'mode'),(176,'employeeId','Responsible Person',50,0,0,NULL,0,1,4,'responsiblePerson.firstName'),(177,'experienceCountUnit','Experience In',30,0,0,NULL,0,1,4,'experienceCountUnit'),(178,'id','S. No.',30,1,0,NULL,0,1,1,'id'),(179,'type','Type',30,1,0,NULL,1,1,2,'type'),(180,'modulesId','Modules',30,1,0,NULL,1,1,3,'title'),(181,'status','Status',30,1,0,NULL,1,1,4,'statusDetail.description'),(182,'optionWeight','Option Weight',120,0,0,NULL,0,1,4,'optionWeight'),(183,'id','S. No.',30,0,0,NULL,0,1,1,'id'),(184,'marks','Marks',40,1,0,NULL,0,1,3,'marks'),(185,'answerType','Answer Type',30,0,0,NULL,0,1,3,'answerType'),(186,'timeOutDuration','Assessment Duration (In Minutes)',40,1,0,NULL,1,1,4,'timeOutDuration'),(187,'postingEndDate','Posting End Date',40,0,0,NULL,0,1,3,'postingEndDate'),(188,'id','S. No.',20,0,0,NULL,0,1,1,'id'),(189,'name','Name',120,0,0,NULL,1,1,2,'name'),(190,'email','Email',120,0,0,NULL,1,1,3,'email'),(191,'contactNo','Contact No',100,0,0,NULL,0,1,4,'contactNo'),(192,'haveSkill','Have Skill',50,0,0,NULL,0,1,3,'haveSkill'),(193,'id','S. No.',10,0,0,NULL,0,1,1,'id'),(194,'mandatorySkillId','Skill',120,0,0,NULL,0,1,2,'mandatorySkillId'),(195,'experience','Experience',80,0,0,NULL,0,1,4,'experience'),(196,'experienceUnit','Experience In',80,1,1,NULL,1,1,5,'experienceUnit'),(197,'comment','Comment',240,1,1,NULL,1,1,6,'comment'),(198,'status','Status',50,0,0,NULL,1,1,9,'status'),(199,'appliedDate','Applied Date',80,0,0,NULL,1,1,6,'appliedDate'),(200,'totalExperience','Total Experience',80,0,0,NULL,1,1,7,'totalExperience'),(201,'totalExperienceUnit','Experience In',80,0,0,NULL,1,1,8,'totalExperienceUnit'),(202,'id','S. No.',15,0,0,NULL,0,1,1,NULL),(203,'skill','skill',140,0,0,NULL,0,1,2,NULL),(204,'comment','Comment',240,0,0,NULL,0,1,5,NULL),(205,'experience_required','Experience',80,0,0,NULL,0,1,4,NULL),(206,'experience_in','Experience In',80,0,0,NULL,0,1,3,NULL),(207,'id','S. No.',10,0,0,NULL,0,1,1,'id'),(208,'mandatorySkillId','Skill',120,0,0,NULL,0,1,2,'mandatorySkillId'),(209,'experience','Experience',80,0,0,'0',0,1,4,'experience'),(210,'experienceUnit','Experience In',80,1,1,NULL,1,1,5,'experienceUnit'),(211,'comment','Comment',240,1,1,NULL,1,1,6,'comment'),(212,'haveSkill','Have Skill',50,0,0,'',0,1,3,'haveSkill'),(213,'candidateId','Candidate Id',10,0,0,NULL,1,1,5,'candidateId'),(214,'jobPostingId','JobPostingId',10,0,0,NULL,1,1,6,'jobPostingId'),(215,'status','Status',80,1,0,NULL,1,1,2,'statusDetail.description'),(216,'status','Status',100,1,0,NULL,1,1,6,'statusDetail.description'),(217,'id','S. No.',15,0,0,NULL,0,1,1,'id'),(218,'hiringTypeId','Type',100,0,0,NULL,0,1,5,'hiringTypeId'),(219,'question','Interview / Assessment',200,0,0,'',0,1,6,'entity.name'),(220,'companyCode','Company Code',80,1,0,NULL,0,1,2,'companyCode'),(221,'status','Status',100,1,0,NULL,1,1,4,'statusDetail.description'),(222,'status','Status',100,1,0,'1',1,1,8,'statusDetail.description'),(223,'status','Status',100,1,0,'1',1,1,6,'statusDetail.description'),(224,'id','S. No.',15,1,0,NULL,0,1,1,'id'),(225,'status','Status',100,1,0,'1',0,1,6,'statusDetail.description'),(226,'id','S. No.',80,1,0,NULL,0,1,1,'id');
/*!40000 ALTER TABLE `fields_indexing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_question_sets`
--

DROP TABLE IF EXISTS `general_question_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_question_sets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  `status` bigint DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_question_sets`
--

LOCK TABLES `general_question_sets` WRITE;
/*!40000 ALTER TABLE `general_question_sets` DISABLE KEYS */;
INSERT INTO `general_question_sets` VALUES (8,'SET-DD',1,'2021-08-06 14:09:40',1,'2021-08-06 14:09:40',NULL,NULL,2),(9,'SET-A',1,'2021-08-06 14:34:14',1,'2021-08-06 14:34:14',NULL,NULL,2),(10,'SET-C',1,'2021-08-06 17:04:11',1,'2021-08-06 17:04:11',NULL,NULL,2);
/*!40000 ALTER TABLE `general_question_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_question_sets_question_mapping`
--

DROP TABLE IF EXISTS `general_question_sets_question_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_question_sets_question_mapping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `general_question_sets_id` bigint DEFAULT NULL,
  `general_question_id` bigint DEFAULT NULL,
  `attempts` int DEFAULT NULL,
  `think_time` int DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `status` bigint DEFAULT '4',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_question_sets_question_mapping`
--

LOCK TABLES `general_question_sets_question_mapping` WRITE;
/*!40000 ALTER TABLE `general_question_sets_question_mapping` DISABLE KEYS */;
INSERT INTO `general_question_sets_question_mapping` VALUES (1,3,13,10,10,1010,4),(2,3,13,10,10,10,4),(3,4,13,10,10,1010,4),(4,4,13,10,10,10,4),(5,5,13,10,10,1010,4),(6,5,13,10,10,10,4),(7,6,13,10,10,1010,4),(8,6,13,10,10,10,4),(9,7,14,10,10,10,4),(10,8,14,10,10,10,4),(11,8,14,10,1010,101,4),(12,9,14,10,10,10,4),(13,9,14,10,1010,101,4),(14,9,13,10,10,10,4),(15,10,14,10,10,10,4),(16,10,14,10,1010,101,4),(17,10,13,10,10,10,4),(18,10,13,10,10,10,4),(19,10,13,10,10,10,4);
/*!40000 ALTER TABLE `general_question_sets_question_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_questions`
--

DROP TABLE IF EXISTS `general_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_questions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(350) NOT NULL,
  `answer_type` varchar(100) NOT NULL,
  `description` text,
  `timeout` int NOT NULL,
  `max_attempt` int DEFAULT '1',
  `think_time` int DEFAULT '0',
  `status` bigint NOT NULL DEFAULT '1',
  `general_question_type` varchar(100) DEFAULT NULL,
  `question_category_type_id` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  `general_questions_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  KEY `question_category_type_id` (`question_category_type_id`),
  CONSTRAINT `general_questions_ibfk_1` FOREIGN KEY (`question_category_type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `general_questions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `general_questions_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `general_questions_ibfk_4` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `general_questions_ibfk_5` FOREIGN KEY (`question_category_type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_questions`
--

LOCK TABLES `general_questions` WRITE;
/*!40000 ALTER TABLE `general_questions` DISABLE KEYS */;
INSERT INTO `general_questions` VALUES (11,'Tell me about yourself?','text_box','<p>Hello World</p>',300,2,60,1,'InterviewQuestion',7,NULL,'2021-01-16 16:33:00',NULL,'2021-01-16 16:33:00',NULL,NULL,NULL),(12,'What you want to switch your job?','text_box','<p>Hello World</p>',600,2,120,2,'InterviewQuestion',7,NULL,'2021-01-16 16:33:55',NULL,'2021-01-16 16:41:33',NULL,NULL,NULL),(13,'Test question','text_box',NULL,20,1,20,2,'GeneralQuestion',5,NULL,'2021-07-15 23:36:52',NULL,'2021-07-15 23:36:52',NULL,NULL,NULL),(14,'what is your name?\nwhat is your current location?\nare you experienced or fresher?\nwhat is your salary expectation ?( if exp)\nwill you be comfortable to join us in noida sectoer 63','text_box',NULL,30,1,2,2,'InterviewQuestion',7,NULL,'2021-07-24 16:59:22',NULL,'2021-08-02 15:08:11',NULL,NULL,NULL),(15,'Interview Question','text_box','<p>Nothing but </p>',60,10,NULL,2,'InterviewQuestion',4,NULL,'2021-08-06 14:41:47',NULL,'2021-08-06 14:41:47',NULL,NULL,NULL);
/*!40000 ALTER TABLE `general_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` int NOT NULL,
  PRIMARY KEY (`next_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (38);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_type`
--

DROP TABLE IF EXISTS `industry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` bigint DEFAULT '1',
  `description` text,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `industry_type_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `industry_type_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `industry_type_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_type`
--

LOCK TABLES `industry_type` WRITE;
/*!40000 ALTER TABLE `industry_type` DISABLE KEYS */;
INSERT INTO `industry_type` VALUES (29,'Information Technology',2,'Information technology (IT) is the use of computers to store, retrieve, transmit, and manipulate data or information. ... The term is commonly used as a synonym for computers and computer networks, but it also encompasses other information distribution technologies such as television and telephones.',NULL,'2021-01-16 16:04:10',NULL,'2021-08-07 09:55:02',NULL,NULL);
/*!40000 ALTER TABLE `industry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_questions_mapping`
--

DROP TABLE IF EXISTS `interview_questions_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_questions_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `interview_id` bigint DEFAULT NULL,
  `general_question_id` bigint DEFAULT NULL,
  `think_time` int DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `attempts` int DEFAULT NULL,
  `status` bigint DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `interview_id` (`interview_id`),
  KEY `general_question_id` (`general_question_id`),
  CONSTRAINT `interview_questions_mapping_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `interviews` (`id`),
  CONSTRAINT `interview_questions_mapping_ibfk_2` FOREIGN KEY (`general_question_id`) REFERENCES `general_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_questions_mapping`
--

LOCK TABLES `interview_questions_mapping` WRITE;
/*!40000 ALTER TABLE `interview_questions_mapping` DISABLE KEYS */;
INSERT INTO `interview_questions_mapping` VALUES (34,10,11,10,10,10,4),(35,11,12,0,12,120,4),(36,11,12,12,12,12,4),(45,16,13,10,1010,10,4),(46,16,13,10,10,10,4),(47,17,14,10,10,10,4),(48,17,14,1010,101,10,4),(49,17,13,10,10,10,4),(50,17,13,10,10,10,4),(51,17,13,10,10,10,4);
/*!40000 ALTER TABLE `interview_questions_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `interview_name` varchar(100) NOT NULL,
  `webcam_permission` tinyint DEFAULT NULL,
  `total_questions` int NOT NULL,
  `job_profile_id` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  `general_question_sets_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  KEY `job_profile_id` (`job_profile_id`),
  CONSTRAINT `interviews_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `interviews_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `interviews_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `interviews_ibfk_4` FOREIGN KEY (`job_profile_id`) REFERENCES `job_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
INSERT INTO `interviews` VALUES (8,'Java Developer Trainee Interview',1,10,22,2,NULL,'2021-01-16 16:45:32',NULL,'2021-08-02 15:32:42',NULL,NULL,NULL),(9,'test',1,30,20,2,NULL,'2021-07-16 00:06:12',NULL,'2021-07-16 00:07:38',NULL,NULL,NULL),(10,'Hr crm',1,30,26,2,NULL,'2021-07-24 17:21:32',NULL,'2021-07-29 20:08:15',NULL,NULL,NULL),(11,'test123',1,12,19,2,NULL,'2021-08-01 15:31:02',NULL,'2021-08-05 17:04:39',NULL,NULL,NULL),(16,'Java Trainne',1,5,22,2,NULL,'2021-08-05 17:19:40',NULL,'2021-08-05 19:14:47',NULL,NULL,NULL),(17,'Java  Developer Interview',1,2,20,2,NULL,'2021-08-06 09:34:46',NULL,'2021-08-06 17:04:11',NULL,NULL,NULL);
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irb_document_folder`
--

DROP TABLE IF EXISTS `irb_document_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irb_document_folder` (
  `document_folder_id` int NOT NULL AUTO_INCREMENT,
  `parent_document_folder_id` int DEFAULT '0',
  `branch_id` bigint DEFAULT NULL,
  `document_folder_name` varchar(255) DEFAULT NULL,
  `folder_created_by_userid` bigint DEFAULT NULL,
  `folder_created_datetime` datetime DEFAULT NULL,
  `folder_modified_by_userid` bigint DEFAULT NULL,
  `folder_modified_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`document_folder_id`),
  KEY `FK_user_documentFolder_createdBy_idx` (`folder_created_by_userid`),
  KEY `FK_user_documentFolder_modified_idx` (`folder_modified_by_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irb_document_folder`
--

LOCK TABLES `irb_document_folder` WRITE;
/*!40000 ALTER TABLE `irb_document_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `irb_document_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irb_upload_document_version`
--

DROP TABLE IF EXISTS `irb_upload_document_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irb_upload_document_version` (
  `uploaded_document_version_id` int NOT NULL AUTO_INCREMENT,
  `uploaded_document_id` int DEFAULT NULL,
  `upload_document_Revision_Number` bigint DEFAULT '1',
  `upload_document_version_hashkey` varchar(255) DEFAULT NULL,
  `uploaded_by_userid` bigint DEFAULT NULL,
  `uploaded_datetime` datetime DEFAULT NULL,
  `upload_status` enum('Uploaded','UploadFailed') DEFAULT NULL,
  `reason_for_failure` text,
  `file_size` varchar(50) DEFAULT NULL,
  `file_first_cell_address` varchar(45) DEFAULT NULL,
  `file_last_cell_address` varchar(45) DEFAULT NULL,
  `file_total_value` double(21,2) DEFAULT NULL,
  `file_total_value_address` varchar(45) DEFAULT NULL,
  `preprocessed_by_userid` bigint DEFAULT NULL,
  `preprocessed_by_datetime` datetime DEFAULT NULL,
  `preprocessed_status` enum('Yes','No') DEFAULT 'No',
  `version_Used_In_Bill` tinyint DEFAULT '0',
  `is_original` enum('Yes','No') DEFAULT NULL,
  `page_no` int DEFAULT NULL,
  PRIMARY KEY (`uploaded_document_version_id`),
  KEY `Fk_uploadDocument_UploadDocumentVersion_idx` (`uploaded_document_id`),
  KEY `Fk_user_uploadedDocumentVersion_uploadedBy_idx` (`uploaded_by_userid`),
  KEY `Fk_user_uploadedDocumentVersion_processedBy_idx` (`preprocessed_by_userid`),
  CONSTRAINT `Fk_uploadDocument_UploadDocumentVersion` FOREIGN KEY (`uploaded_document_id`) REFERENCES `irb_upload_documents` (`uploaded_document_id`),
  CONSTRAINT `Fk_user_uploadedDocumentVersion_processedBy` FOREIGN KEY (`preprocessed_by_userid`) REFERENCES `user` (`id`),
  CONSTRAINT `Fk_user_uploadedDocumentVersion_uploadedBy` FOREIGN KEY (`uploaded_by_userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irb_upload_document_version`
--

LOCK TABLES `irb_upload_document_version` WRITE;
/*!40000 ALTER TABLE `irb_upload_document_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `irb_upload_document_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irb_upload_documents`
--

DROP TABLE IF EXISTS `irb_upload_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irb_upload_documents` (
  `uploaded_document_id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `document_folder_id` int DEFAULT NULL,
  PRIMARY KEY (`uploaded_document_id`),
  KEY `Fk_documentFolder_uploadDocuments_idx` (`document_folder_id`),
  CONSTRAINT `Fk_documentFolder_uploadDocuments` FOREIGN KEY (`document_folder_id`) REFERENCES `irb_document_folder` (`document_folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irb_upload_documents`
--

LOCK TABLES `irb_upload_documents` WRITE;
/*!40000 ALTER TABLE `irb_upload_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `irb_upload_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irb_uploaded_document_content`
--

DROP TABLE IF EXISTS `irb_uploaded_document_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irb_uploaded_document_content` (
  `uploaded_content_id` int NOT NULL AUTO_INCREMENT,
  `uploaded_document_version_id` int DEFAULT NULL,
  `document_content` longblob,
  PRIMARY KEY (`uploaded_content_id`),
  KEY `Fk_uploadDocumentVersion_uploadDocumentContent_idx` (`uploaded_document_version_id`),
  CONSTRAINT `Fk_uploadDocumentVersion_uploadDocumentContent` FOREIGN KEY (`uploaded_document_version_id`) REFERENCES `irb_upload_document_version` (`uploaded_document_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irb_uploaded_document_content`
--

LOCK TABLES `irb_uploaded_document_content` WRITE;
/*!40000 ALTER TABLE `irb_uploaded_document_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `irb_uploaded_document_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_posting_mandatory_skills_mapping`
--

DROP TABLE IF EXISTS `job_posting_mandatory_skills_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_posting_mandatory_skills_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_posting_id` bigint DEFAULT NULL,
  `skill_id` bigint DEFAULT NULL,
  `experience_required` int DEFAULT NULL,
  `experience_in` varchar(100) DEFAULT NULL,
  `mandatory` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_posting_mandatory_skills_mapping`
--

LOCK TABLES `job_posting_mandatory_skills_mapping` WRITE;
/*!40000 ALTER TABLE `job_posting_mandatory_skills_mapping` DISABLE KEYS */;
INSERT INTO `job_posting_mandatory_skills_mapping` VALUES (32,14,30,6,'MONTH',1),(33,14,31,9,'YEAR',1),(34,NULL,32,1,'YEAR',1),(35,14,32,1,'YEAR',1),(36,15,30,2,'MONTH',1),(37,15,32,4,'MONTH',1),(38,15,31,5,'YEAR',1),(39,NULL,30,4,'MONTH',1),(40,15,30,4,'MONTH',1),(41,16,37,2,'YEAR',1),(42,16,30,2,'YEAR',1),(43,16,24,2,'YEAR',1),(44,16,38,2,'YEAR',1),(45,17,37,1,'YEAR',1),(46,17,38,1,'YEAR',1),(47,17,30,1,'YEAR',1),(48,17,32,1,'YEAR',1),(49,17,13,6,'MONTH',0),(50,18,8,NULL,'MONTH',1),(51,19,16,0,'MONTH',0),(52,20,16,1,'MONTH',1);
/*!40000 ALTER TABLE `job_posting_mandatory_skills_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_postings`
--

DROP TABLE IF EXISTS `job_postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_postings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_apply_type` varchar(150) NOT NULL,
  `interview_type` varchar(150) NOT NULL,
  `interview_start_time` time DEFAULT NULL,
  `interview_end_time` time DEFAULT NULL,
  `interview_start_date` date DEFAULT NULL,
  `interview_end_date` date DEFAULT NULL,
  `venue` varchar(350) DEFAULT NULL,
  `ask_general_questions` tinyint DEFAULT NULL,
  `job_profile_id` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `shareable_token` text,
  `remarks` varchar(300) DEFAULT NULL,
  `posting_end_date` date DEFAULT NULL,
  `assessment_id` bigint DEFAULT NULL,
  `interview_id` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  `take_introduction_video` tinyint NOT NULL,
  `intro_video_duration` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_profile_id` (`job_profile_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `job_postings_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `job_postings_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `job_postings_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `job_postings_ibfk_4` FOREIGN KEY (`job_profile_id`) REFERENCES `job_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_postings`
--

LOCK TABLES `job_postings` WRITE;
/*!40000 ALTER TABLE `job_postings` DISABLE KEYS */;
INSERT INTO `job_postings` VALUES (14,'APPLY_ONLINE','OFFLINE_INTERVIEW','17:04:00','20:04:00','2021-01-20','2021-01-26','Shivit Technologies Pvt. Ltd.',0,19,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjE0LCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2MjgzMzM3MTUsImV4cCI6MTY0MzE3MzIwMH0.9DBcYwsevkl7g2HFVB8H9NWGUW0KuLn5EtAmclI3W6c','Java Developer Hiring Jan','2022-01-26',NULL,NULL,NULL,'2021-01-16 17:02:37',NULL,'2021-08-07 16:25:16',NULL,NULL,1,1),(15,'APPLY_ONLINE','OFFLINE_INTERVIEW','10:00:00','11:00:00','2021-01-18','2021-04-29','Shivit Technologies Pvt. Ltd.',0,19,1,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjE1LCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2MjYzMzg2NjQsImV4cCI6MTYyNzcwNDAwMH0.g3_ed2lsXuwin5PGqsfWmcERyNPDEi4-n4wFYt1495Q','new job post','2021-07-31',5,8,NULL,'2021-01-18 18:35:35',NULL,'2021-07-15 14:14:24',NULL,NULL,1,3),(16,'APPLY_ONLINE','ONLINE_ONE_WAY_INTERVIEW','01:18:00','02:00:00','2021-07-08','2021-07-08','online',1,18,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjE2LCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2MjU2Nzg3ODIsImV4cCI6MTYyNzcwNDAwMH0.CLZspfXaHHBxp9NTJ9Z8U_KBMoVdlAocsT2orLen49c','Test','2021-07-31',NULL,NULL,NULL,'2021-07-07 22:56:22',NULL,'2021-07-07 22:56:22',NULL,NULL,1,NULL),(17,'APPLY_ONLINE','OFFLINE_INTERVIEW','22:30:00','06:53:00','2021-07-07','2021-07-29','Offline',0,18,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjE3LCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2MjYzNzQ4MTQsImV4cCI6MTYyNzUzMTIwMH0.Myl1pc_pdPUwjj89rWUawzaRFAojBj3WlNf28gdmSic','Microservices knowledge preffered','2021-07-29',NULL,NULL,NULL,'2021-07-09 11:27:17',NULL,'2021-07-16 00:16:55',NULL,NULL,0,NULL),(18,'APPLY_ONLINE','OFFLINE_INTERVIEW','22:30:00','03:36:00','2021-12-07','2000-03-01','test',0,21,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjE4LCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2MjYzNzUwNTEsImV4cCI6MTQ0OTQ2NDQwMH0.C9MSWQVLJOAiW7aRU01yCgJWq9GZ4s4s-aICTRnRKxc','test','2015-12-07',6,8,NULL,'2021-07-16 00:20:51',NULL,'2021-07-16 00:20:51',NULL,NULL,1,120),(19,'APPLY_ONLINE','OFFLINE_INTERVIEW','22:30:00','23:30:00','2021-07-23','2021-07-23','Noida',1,26,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjE5LCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2Mjc1NjkzNzcsImV4cCI6MTYyNzAxMjgwMH0.sEzwpjrkhak1Ft5f-SShKOxTsyZn9O-3VOJc3sCT3iY','jhjgyuh','2021-07-23',7,10,NULL,'2021-07-24 17:43:50',NULL,'2021-07-29 20:06:17',NULL,NULL,1,1),(20,'APPLY_ONLINE','ONLINE_ONE_WAY_INTERVIEW','22:30:00','22:30:00','2021-08-12','2021-08-14','office',1,23,2,'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmtpdF8xIiwiYXVkIjoiNDgiLCJqb2JQb3N0aW5nSWQiOjIwLCJyZWdpc3RlclBhZ2VNb2R1bGVJZCI6IjIwNCIsInByb2ZpbGVDb21wbGV0ZU1vZHVsZUlkIjoiMjA1IiwiaXNzIjoiU2hpdml0IFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4iLCJpYXQiOjE2Mjc4MTIyNjUsImV4cCI6MTYyNzg3NjgwMH0.y1ZFakqKLyf4pfuRAHLwuGG6z8DCS_okUTHzwYKrINU','test','2021-08-02',7,9,NULL,'2021-08-01 15:34:26',NULL,'2021-08-01 15:34:26',NULL,NULL,1,1);
/*!40000 ALTER TABLE `job_postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_profiles`
--

DROP TABLE IF EXISTS `job_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_title` varchar(100) NOT NULL,
  `date_posted` date NOT NULL,
  `applicable_date` date NOT NULL,
  `description` text,
  `status` bigint DEFAULT '1',
  `industry_type_id` bigint DEFAULT NULL,
  `job_role_id` bigint DEFAULT NULL,
  `max_experience` int DEFAULT NULL,
  `no_of_openings` int DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `job_type` varchar(100) DEFAULT NULL,
  `work_from_home` varchar(100) DEFAULT NULL,
  `min_salary` varchar(200) DEFAULT NULL,
  `max_salary` varchar(200) DEFAULT NULL,
  `min_experience` int DEFAULT NULL,
  `show_salary_to_candidates` tinyint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  `min_experience_in` varchar(100) DEFAULT NULL,
  `max_experience_in` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  KEY `industry_type_id` (`industry_type_id`),
  KEY `job_role_id` (`job_role_id`),
  CONSTRAINT `job_profiles_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `job_profiles_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `job_profiles_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `job_profiles_ibfk_4` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_type` (`id`),
  CONSTRAINT `job_profiles_ibfk_5` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_profiles`
--

LOCK TABLES `job_profiles` WRITE;
/*!40000 ALTER TABLE `job_profiles` DISABLE KEYS */;
INSERT INTO `job_profiles` VALUES (18,'Java Developer Associate','2021-07-05','2021-07-08','<ul><li>Should be flexible and open to working in a challenging situation as the company is a start-up and is at the very initial stage.</li><li>Deeply in love with coding with strong analytical and problem-solving skills and should have experience in business application development.</li><li>Should have the urge to learn himself about new technologies and other important things related to projects.</li><li>&nbsp;Able to interact with Clients and fulfill their ongoing new requirements.</li></ul><p><span style=\"color: rgb(45, 45, 45);\">&nbsp;</span></p><p><span style=\"color: rgb(45, 45, 45);\">&nbsp;</span></p><p><br></p><p><strong style=\"color: rgb(45, 45, 45);\">Required Skills </strong></p><ul><li>Knowledge of Core Java, Advance Java, Mysql/Oracle, PL/SQL, Spring/Spring Boot/Struts, Hibernate, Rest/SOAP API, Angular JS(optional), Node JS, Boot Strap</li><li>Database administration - MySql/Oracle/BigData</li><li>SVN/GITHUB is a must</li><li>Good Communication (writing and verbal) Skills</li><li>Should able to work individually and can handle teams.</li></ul>',2,29,10,2,2,'Day Shift','Noida','Full Time','No','20000','32000',1,1,NULL,'2021-01-16 16:09:13',NULL,'2021-07-05 22:53:01',NULL,NULL,'YEAR','YEAR'),(19,'Senior Java Developer','2021-07-05','2021-07-08','<ul><li>&nbsp;Must-Have: core &amp; Advance Java, J2EE, SpringBoot, Hibernate,&nbsp;Microservices, System Architecture</li><li>&nbsp;Good OOPs concepts &amp; principles Understanding of MVC framework (like JSF/Struts/Spring).</li><li>&nbsp;Hands-on experience for code deployment across multiple environments.</li><li>&nbsp;Good hands-on knowledge of Microservices Architecture.</li><li>&nbsp;Good Understanding of Eureka Server, API Gateway, Active Directory.</li><li>&nbsp;Java persistence framework (like iBATIS /Mybatis /Hibernate/Apache/Junit etc).</li><li>&nbsp;Expertise in SQL and NoSQL databases.</li><li>&nbsp;Application server (WebSphere /Apache).</li><li>&nbsp;Basic configuration IDE (like RAD/Eclipse/IntelliJ).</li><li>&nbsp;Mark-up languages (like XML/JSON).</li><li>&nbsp;Good hands-on knowledge of Versioning tools &amp; Branching strategies (ClearCase/SVN/GIT/Bit Bucket).</li><li>&nbsp;Working knowledge of CI &amp; Build tools like Jenkins.</li><li>&nbsp;Maven Database Concepts &amp; SQL (using RDBMS like DB2/oracle).</li><li>&nbsp;Knowledge of SDLC (like Waterfall, Iterative, Agile, KANBAN)</li><li>&nbsp;Good knowledge of Angular8 and its deployment cycle and procedures.(Add on)</li><li>&nbsp;Good knowledge of DevOps.(Add on)</li><li>&nbsp;Good knowledge of Kafka. (Add on)</li><li>&nbsp;Good communication skills (Written &amp; Verbal)</li></ul><p><br></p>',2,29,12,4,1,'Day Shift','Noida','Full Time','No','30000','50000',2,1,NULL,'2021-01-16 16:11:01',NULL,'2021-07-05 22:59:40',NULL,NULL,'YEAR','YEAR'),(20,'Front End Developer','2021-07-05','2021-07-08','<p><strong>Responsibilities:</strong></p><ul><li>&nbsp;Determining the structure and design of web pages.</li><li>&nbsp;Ensuring user experience determines design choices.</li><li>&nbsp;Developing features to enhance the user experience.</li><li>&nbsp;Striking a balance between functional and aesthetic design.</li><li>&nbsp;Ensuring web design is optimized for smartphones.</li><li>&nbsp;Building reusable code for future use.</li><li>&nbsp;Optimizing web pages for maximum speed and scalability.</li><li>&nbsp;Utilizing a variety of markup languages to write web pages.</li><li>&nbsp;Maintaining brand consistency throughout the design.</li></ul><p>&nbsp;</p><p><strong>Requirements:</strong></p><ul><li>&nbsp;Degree in computer science or related field.</li><li>&nbsp;Understanding of key design principles.</li><li>&nbsp;Proficiency in HTML, CSS, JavaScript, Ajax Angular/REACT and jQuery.</li><li>&nbsp;Understanding of server-side CSS.</li><li>&nbsp;Experience with graphic design applications such as Adobe Illustrator.</li><li>&nbsp;Experience with responsive and adaptive design.</li><li>&nbsp;Understanding of SEO principles.</li><li>&nbsp;Good problem-solving skills.</li><li>&nbsp;Experience in Angular is added advantage.</li></ul>',2,29,13,2,1,'Day Shift','Noida','Full Time','No','16000','29000',1,1,NULL,'2021-07-05 22:59:14',NULL,'2021-07-05 23:00:01',NULL,NULL,'YEAR','YEAR'),(21,'Front End Trainee','2021-08-09','2021-07-06','<p><strong>Front End Developer Requirements:</strong></p><p><br></p><ul><li><span class=\"ql-font-serif\">&nbsp;Degree in computer science or related field.</span></li><li><span class=\"ql-font-serif\"> Understanding of key design principles.</span></li><li><span class=\"ql-font-serif\">&nbsp;Proficiency in</span><span style=\"background-color: rgb(0, 255, 255);\" class=\"ql-font-serif\">&nbsp;HTML, CSS, JavaScript, Ajax Angular/REACT and jQuery.</span></li><li><span class=\"ql-font-serif\">&nbsp;Understanding of server-side CSS.</span></li><li><span class=\"ql-font-serif\">&nbsp;Experience with graphic design applications such as Adobe Illustrator.</span></li><li><span class=\"ql-font-serif\">&nbsp;Experience with responsive and adaptive design.</span></li><li><span class=\"ql-font-serif\">&nbsp;Understanding of SEO principles.</span></li><li><span class=\"ql-font-serif\">&nbsp;Good problem-solving skills.</span></li><li><span class=\"ql-font-serif\">&nbsp;Experience in </span><span style=\"background-color: rgb(0, 255, 255);\" class=\"ql-font-serif\">Angular</span><span style=\"background-color: rgb(0, 255, 255); color: rgb(255, 255, 255);\" class=\"ql-font-serif\"> </span><span class=\"ql-font-serif\">is&nbsp;added advantage.</span></li></ul>',2,29,14,6,1,'Day Shift','Noida','Full Time','No','6000','10000',0,1,NULL,'2021-07-05 23:04:04',NULL,'2021-08-09 17:52:09',NULL,NULL,'MONTH','MONTH'),(22,'Java Developer Trainee','2021-08-09','2021-08-09','<ul><li>&nbsp;Must have-&nbsp;Core Java, Advance Java, HTML, JS, </li><li>&nbsp;Develop and unit-test, Integrate, deploy, maintain, and improve software</li><li>&nbsp;Collaborate with team members to achieve the objectives</li><li>Have knowledge with Spring framework, ideally Spring boot.</li></ul>',2,29,10,6,8,'Day Shift','Noida','Full Time','No','8000','10000',0,1,NULL,'2021-07-05 23:08:56',NULL,'2021-08-09 17:55:37',NULL,NULL,'MONTH','MONTH'),(23,'Content Marketer','2021-07-05','2021-07-07','<ul><li>Must have-&nbsp;Content Search, content Creation, knowledge of content marketing</li></ul>',2,29,16,1,0,'Day Shift','Noida','Full Time','No','5000','10000',0,1,NULL,'2021-07-05 23:13:04',NULL,'2021-07-05 23:13:04',NULL,NULL,'MONTH','YEAR'),(24,'Web designer','2021-07-05','2021-07-08','<p>HTML, Photoshop, Canva</p>',2,29,17,1,1,'Day Shift','Noida','Full Time','No','5000','10000',0,1,NULL,'2021-07-05 23:16:13',NULL,'2021-07-05 23:16:13',NULL,NULL,'MONTH','YEAR'),(25,'SEO/SMO Trainee','2021-08-09','2021-09-08','<ul><li> SEO OFF page/ ON page</li><li>&nbsp;Generating campaigns in social media marketing like Facebook Ads, Insta Ads</li><li>&nbsp;Managing Media accounts</li><li>&nbsp;Must have - Google Ad word, google webmaster, Keyword Analysis.</li></ul>',2,29,15,1,1,'Day Shift','Noida','Full Time','No','6000','10000',0,1,NULL,'2021-07-05 23:19:46',NULL,'2021-08-09 17:54:19',NULL,NULL,'MONTH','YEAR'),(26,'HR','2021-08-09','2021-08-09','<ul><li>Conduct the recruitment process</li><li>Be the first point of contact for all HR-related queries</li><li>Billing management for multiple things (phone, internet, F&amp;B)</li><li>Administer HR-related documentation, such as contracts of employment</li><li>Ensure the relevant HR database is up to date, accurate and complies with legislation</li><li>Maintaining the office decorum</li><li>Taking care of office inventory</li><li>New inquiry follow-ups and meeting schedules as per the CRM</li><li>Existing client followups</li><li>Payment follow-ups from the client</li></ul>',1,29,18,6,1,'Day Shift','Noida','Full Time','No','7000','12000',0,1,NULL,'2021-07-24 17:06:43',NULL,'2021-08-09 18:06:40',NULL,NULL,'MONTH','MONTH'),(27,'Java Devloper Trainee','2021-08-09','2021-07-18','<p>Demo</p>',1,29,10,1,5,'Day Shift','Noida','Full Time','No','6000','8000',0,0,NULL,'2021-07-27 17:49:47',NULL,'2021-08-09 17:55:51',NULL,NULL,'MONTH','YEAR');
/*!40000 ALTER TABLE `job_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_profiles_rounds_mapping`
--

DROP TABLE IF EXISTS `job_profiles_rounds_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_profiles_rounds_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_profile_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `round_name` varchar(100) DEFAULT NULL,
  `mode` varchar(100) DEFAULT NULL,
  `round_order` int DEFAULT NULL,
  `assessment_interview_id` bigint DEFAULT NULL,
  `hiring_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_profile_id` (`job_profile_id`),
  CONSTRAINT `job_profiles_rounds_mapping_ibfk_1` FOREIGN KEY (`job_profile_id`) REFERENCES `job_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_profiles_rounds_mapping`
--

LOCK TABLES `job_profiles_rounds_mapping` WRITE;
/*!40000 ALTER TABLE `job_profiles_rounds_mapping` DISABLE KEYS */;
INSERT INTO `job_profiles_rounds_mapping` VALUES (3,27,1,'HR','online',NULL,17,198),(4,21,7,'1','online',NULL,9,198);
/*!40000 ALTER TABLE `job_profiles_rounds_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_role_skills_mapping`
--

DROP TABLE IF EXISTS `job_role_skills_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_role_skills_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_role_id` bigint DEFAULT NULL,
  `skill_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_role_id` (`job_role_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `job_role_skills_mapping_ibfk_1` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`),
  CONSTRAINT `job_role_skills_mapping_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_role_skills_mapping`
--

LOCK TABLES `job_role_skills_mapping` WRITE;
/*!40000 ALTER TABLE `job_role_skills_mapping` DISABLE KEYS */;
INSERT INTO `job_role_skills_mapping` VALUES (72,12,8),(73,12,9),(74,12,10),(75,12,13),(76,12,15),(77,12,16),(78,12,24),(79,12,30),(80,12,32),(81,12,33),(82,12,36),(83,12,37),(84,12,38),(85,12,39),(86,12,40),(87,11,8),(88,11,9),(89,11,13),(90,11,15),(91,11,30),(92,11,31),(93,11,32),(94,11,37),(95,11,38),(96,11,39),(97,10,30),(98,10,31),(99,10,32),(100,10,37),(101,10,38),(102,13,15),(103,13,16),(104,13,19),(105,14,15),(106,14,19),(107,15,34),(108,15,35),(124,16,35),(129,18,9),(130,18,13),(131,18,16),(132,18,17),(133,17,23),(134,17,42);
/*!40000 ALTER TABLE `job_role_skills_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_roles`
--

DROP TABLE IF EXISTS `job_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `status` bigint DEFAULT '1',
  `description` text,
  `industry_type_id` bigint NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  KEY `industry_type_id` (`industry_type_id`),
  CONSTRAINT `job_roles_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `job_roles_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `job_roles_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `job_roles_ibfk_4` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_roles`
--

LOCK TABLES `job_roles` WRITE;
/*!40000 ALTER TABLE `job_roles` DISABLE KEYS */;
INSERT INTO `job_roles` VALUES (10,'Java Developer Trainee',2,'To take part in software and architectural development activities. Conduct software analysis, programming, testing, and debugging.',29,NULL,'2021-01-16 16:05:56',NULL,'2021-07-05 22:00:05',NULL,NULL),(11,'Java Associate Developer',2,'A Java developer is responsible for developing applications and software using the programming language Java. A Java developer is a specialized type of programmer who may collaborate with web developers and software engineers to integrate Java into business applications, software, and websites.',29,NULL,'2021-01-16 16:06:49',NULL,'2021-07-05 21:56:48',NULL,NULL),(12,'Senior Java Developer',2,'Senior java developer is a computer programmer with an extreme level of experience and all required skills. They build a java based application and software. They perform a certain type of task such as coding, bug solution, designing, and provide a path of the solution to junior java developers.',29,NULL,'2021-01-16 16:07:23',NULL,'2021-07-05 21:55:21',NULL,NULL),(13,'Front End Developer',2,'Front-end web development is the practice of converting data to a graphical interface, through the use of HTML, CSS, and JavaScript, so that users can view and interact with that data.',29,NULL,'2021-07-05 22:21:41',NULL,'2021-07-05 22:21:41',NULL,NULL),(14,'Front End Trainee',2,'A front end developer has one general responsibility: to ensure that website visitors can easily interact with the page. They do this through the combination of design, technology and programming to code a website\'s appearance, as well as taking care of debugging.',29,NULL,'2021-07-05 22:24:54',NULL,'2021-07-05 22:24:54',NULL,NULL),(15,'SEO/SMO',2,'Social media optimization is the use of a number of outlets and communities to generate publicity to increase the awareness of a product, service brand or event. SEO is the process of getting traffic from the free, organic, editorial, or natural search results on the search engines. Simply put, it\'s the name given to the activity that attempts to improve search engine rankings.',29,NULL,'2021-07-05 22:31:10',NULL,'2021-07-05 22:31:10',NULL,NULL),(16,'Content Writer/Marketer',1,'Content marketing is a form of marketing focused on creating, publishing, and distributing content for a targeted audience online',29,NULL,'2021-07-05 22:32:36',NULL,'2021-08-02 18:56:57',NULL,NULL),(17,'Web Designer',2,'Web designers plan, create and code internet sites and web pages, many of which combine text with sounds, pictures, graphics and video clips. A web designer is responsible for creating the design and layout of a website or web pages.',29,NULL,'2021-07-05 22:34:23',NULL,'2021-08-09 17:41:18',NULL,NULL),(18,'HR',2,'test',29,NULL,'2021-07-24 17:01:49',NULL,'2021-08-02 20:52:19',NULL,NULL);
/*!40000 ALTER TABLE `job_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_actions_mapping`
--

DROP TABLE IF EXISTS `module_actions_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_actions_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint DEFAULT NULL,
  `action_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_modules_actions` (`module_id`,`action_id`),
  KEY `fk_actions_moduleactions` (`action_id`),
  KEY `Fk_modules_moduleactions_idx` (`module_id`),
  CONSTRAINT `fk_actions_moduleactions` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`),
  CONSTRAINT `Fk_modules_moduleactions` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_actions_mapping`
--

LOCK TABLES `module_actions_mapping` WRITE;
/*!40000 ALTER TABLE `module_actions_mapping` DISABLE KEYS */;
INSERT INTO `module_actions_mapping` VALUES (1,4,1),(256,4,2),(511,4,3),(766,4,4),(1021,4,5),(1276,4,6),(1531,4,7),(1786,4,8),(2041,4,9),(2296,4,10),(2551,4,11),(2806,4,12),(3061,4,13),(3316,4,14),(3571,4,15),(2,5,1),(257,5,2),(512,5,3),(767,5,4),(1022,5,5),(1277,5,6),(1532,5,7),(1787,5,8),(2042,5,9),(2297,5,10),(2552,5,11),(2807,5,12),(3062,5,13),(3317,5,14),(3572,5,15),(3,6,1),(258,6,2),(513,6,3),(768,6,4),(1023,6,5),(1278,6,6),(1533,6,7),(1788,6,8),(2043,6,9),(2298,6,10),(2553,6,11),(2808,6,12),(3063,6,13),(3318,6,14),(3573,6,15),(4,7,1),(259,7,2),(514,7,3),(769,7,4),(1024,7,5),(1279,7,6),(1534,7,7),(1789,7,8),(2044,7,9),(2299,7,10),(2554,7,11),(2809,7,12),(3064,7,13),(3319,7,14),(3574,7,15),(5,8,1),(260,8,2),(515,8,3),(770,8,4),(1025,8,5),(1280,8,6),(1535,8,7),(1790,8,8),(2045,8,9),(2300,8,10),(2555,8,11),(2810,8,12),(3065,8,13),(3320,8,14),(3575,8,15),(6,9,1),(261,9,2),(516,9,3),(771,9,4),(1026,9,5),(1281,9,6),(1536,9,7),(1791,9,8),(2046,9,9),(2301,9,10),(2556,9,11),(2811,9,12),(3066,9,13),(3321,9,14),(3576,9,15),(7,11,1),(262,11,2),(517,11,3),(772,11,4),(1027,11,5),(1282,11,6),(1537,11,7),(1792,11,8),(2047,11,9),(2302,11,10),(2557,11,11),(2812,11,12),(3067,11,13),(3322,11,14),(3577,11,15),(8,12,1),(263,12,2),(518,12,3),(773,12,4),(1028,12,5),(1283,12,6),(1538,12,7),(1793,12,8),(2048,12,9),(2303,12,10),(2558,12,11),(2813,12,12),(3068,12,13),(3323,12,14),(3578,12,15),(9,13,1),(264,13,2),(519,13,3),(774,13,4),(1029,13,5),(1284,13,6),(1539,13,7),(1794,13,8),(2049,13,9),(2304,13,10),(2559,13,11),(2814,13,12),(3069,13,13),(3324,13,14),(3579,13,15),(10,14,1),(265,14,2),(520,14,3),(775,14,4),(1030,14,5),(1285,14,6),(1540,14,7),(1795,14,8),(2050,14,9),(2305,14,10),(2560,14,11),(2815,14,12),(3070,14,13),(3325,14,14),(3580,14,15),(11,15,1),(266,15,2),(521,15,3),(776,15,4),(1031,15,5),(1286,15,6),(1541,15,7),(1796,15,8),(2051,15,9),(2306,15,10),(2561,15,11),(2816,15,12),(3071,15,13),(3326,15,14),(3581,15,15),(12,16,1),(267,16,2),(522,16,3),(777,16,4),(1032,16,5),(1287,16,6),(1542,16,7),(1797,16,8),(2052,16,9),(2307,16,10),(2562,16,11),(2817,16,12),(3072,16,13),(3327,16,14),(3582,16,15),(13,18,1),(268,18,2),(523,18,3),(778,18,4),(1033,18,5),(1288,18,6),(1543,18,7),(1798,18,8),(2053,18,9),(2308,18,10),(2563,18,11),(2818,18,12),(3073,18,13),(3328,18,14),(3583,18,15),(14,19,1),(269,19,2),(524,19,3),(779,19,4),(1034,19,5),(1289,19,6),(1544,19,7),(1799,19,8),(2054,19,9),(2309,19,10),(2564,19,11),(2819,19,12),(3074,19,13),(3329,19,14),(3584,19,15),(15,20,1),(270,20,2),(525,20,3),(780,20,4),(1035,20,5),(1290,20,6),(1545,20,7),(1800,20,8),(2055,20,9),(2310,20,10),(2565,20,11),(2820,20,12),(3075,20,13),(3330,20,14),(3585,20,15),(16,23,1),(271,23,2),(526,23,3),(781,23,4),(1036,23,5),(1291,23,6),(1546,23,7),(1801,23,8),(2056,23,9),(2311,23,10),(2566,23,11),(2821,23,12),(3076,23,13),(3331,23,14),(3586,23,15),(17,24,1),(272,24,2),(527,24,3),(782,24,4),(1037,24,5),(1292,24,6),(1547,24,7),(1802,24,8),(2057,24,9),(2312,24,10),(2567,24,11),(2822,24,12),(3077,24,13),(3332,24,14),(3587,24,15),(18,25,1),(273,25,2),(528,25,3),(783,25,4),(1038,25,5),(1293,25,6),(1548,25,7),(1803,25,8),(2058,25,9),(2313,25,10),(2568,25,11),(2823,25,12),(3078,25,13),(3333,25,14),(3588,25,15),(19,26,1),(274,26,2),(529,26,3),(784,26,4),(1039,26,5),(1294,26,6),(1549,26,7),(1804,26,8),(2059,26,9),(2314,26,10),(2569,26,11),(2824,26,12),(3079,26,13),(3334,26,14),(3589,26,15),(20,27,1),(275,27,2),(530,27,3),(785,27,4),(1040,27,5),(1295,27,6),(1550,27,7),(1805,27,8),(2060,27,9),(2315,27,10),(2570,27,11),(2825,27,12),(3080,27,13),(3335,27,14),(3590,27,15),(21,28,1),(276,28,2),(531,28,3),(786,28,4),(1041,28,5),(1296,28,6),(1551,28,7),(1806,28,8),(2061,28,9),(2316,28,10),(2571,28,11),(2826,28,12),(3081,28,13),(3336,28,14),(3591,28,15),(22,29,1),(277,29,2),(532,29,3),(787,29,4),(1042,29,5),(1297,29,6),(1552,29,7),(1807,29,8),(2062,29,9),(2317,29,10),(2572,29,11),(2827,29,12),(3082,29,13),(3337,29,14),(3592,29,15),(23,30,1),(278,30,2),(533,30,3),(788,30,4),(1043,30,5),(1298,30,6),(1553,30,7),(1808,30,8),(2063,30,9),(2318,30,10),(2573,30,11),(2828,30,12),(3083,30,13),(3338,30,14),(3593,30,15),(24,31,1),(279,31,2),(534,31,3),(789,31,4),(1044,31,5),(1299,31,6),(1554,31,7),(1809,31,8),(2064,31,9),(2319,31,10),(2574,31,11),(2829,31,12),(3084,31,13),(3339,31,14),(3594,31,15),(25,32,1),(280,32,2),(535,32,3),(790,32,4),(1045,32,5),(1300,32,6),(1555,32,7),(1810,32,8),(2065,32,9),(2320,32,10),(2575,32,11),(2830,32,12),(3085,32,13),(3340,32,14),(3595,32,15),(26,33,1),(281,33,2),(536,33,3),(791,33,4),(1046,33,5),(1301,33,6),(1556,33,7),(1811,33,8),(2066,33,9),(2321,33,10),(2576,33,11),(2831,33,12),(3086,33,13),(3341,33,14),(3596,33,15),(27,34,1),(282,34,2),(537,34,3),(792,34,4),(1047,34,5),(1302,34,6),(1557,34,7),(1812,34,8),(2067,34,9),(2322,34,10),(2577,34,11),(2832,34,12),(3087,34,13),(3342,34,14),(3597,34,15),(28,35,1),(283,35,2),(538,35,3),(793,35,4),(1048,35,5),(1303,35,6),(1558,35,7),(1813,35,8),(2068,35,9),(2323,35,10),(2578,35,11),(2833,35,12),(3088,35,13),(3343,35,14),(3598,35,15),(29,36,1),(284,36,2),(539,36,3),(794,36,4),(1049,36,5),(1304,36,6),(1559,36,7),(1814,36,8),(2069,36,9),(2324,36,10),(2579,36,11),(2834,36,12),(3089,36,13),(3344,36,14),(3599,36,15),(30,37,1),(285,37,2),(540,37,3),(795,37,4),(1050,37,5),(1305,37,6),(1560,37,7),(1815,37,8),(2070,37,9),(2325,37,10),(2580,37,11),(2835,37,12),(3090,37,13),(3345,37,14),(3600,37,15),(31,38,1),(286,38,2),(541,38,3),(796,38,4),(1051,38,5),(1306,38,6),(1561,38,7),(1816,38,8),(2071,38,9),(2326,38,10),(2581,38,11),(2836,38,12),(3091,38,13),(3346,38,14),(3601,38,15),(32,39,1),(287,39,2),(542,39,3),(797,39,4),(1052,39,5),(1307,39,6),(1562,39,7),(1817,39,8),(2072,39,9),(2327,39,10),(2582,39,11),(2837,39,12),(3092,39,13),(3347,39,14),(3602,39,15),(33,40,1),(288,40,2),(543,40,3),(798,40,4),(1053,40,5),(1308,40,6),(1563,40,7),(1818,40,8),(2073,40,9),(2328,40,10),(2583,40,11),(2838,40,12),(3093,40,13),(3348,40,14),(3603,40,15),(34,42,1),(289,42,2),(544,42,3),(799,42,4),(1054,42,5),(1309,42,6),(1564,42,7),(1819,42,8),(2074,42,9),(2329,42,10),(2584,42,11),(2839,42,12),(3094,42,13),(3349,42,14),(3604,42,15),(35,43,1),(290,43,2),(545,43,3),(800,43,4),(1055,43,5),(1310,43,6),(1565,43,7),(1820,43,8),(2075,43,9),(2330,43,10),(2585,43,11),(2840,43,12),(3095,43,13),(3350,43,14),(3605,43,15),(36,44,1),(291,44,2),(546,44,3),(801,44,4),(1056,44,5),(1311,44,6),(1566,44,7),(1821,44,8),(2076,44,9),(2331,44,10),(2586,44,11),(2841,44,12),(3096,44,13),(3351,44,14),(3606,44,15),(37,45,1),(292,45,2),(547,45,3),(802,45,4),(1057,45,5),(1312,45,6),(1567,45,7),(1822,45,8),(2077,45,9),(2332,45,10),(2587,45,11),(2842,45,12),(3097,45,13),(3352,45,14),(3607,45,15),(38,46,1),(293,46,2),(548,46,3),(803,46,4),(1058,46,5),(1313,46,6),(1568,46,7),(1823,46,8),(2078,46,9),(2333,46,10),(2588,46,11),(2843,46,12),(3098,46,13),(3353,46,14),(3608,46,15),(39,47,1),(294,47,2),(549,47,3),(804,47,4),(1059,47,5),(1314,47,6),(1569,47,7),(1824,47,8),(2079,47,9),(2334,47,10),(2589,47,11),(2844,47,12),(3099,47,13),(3354,47,14),(3609,47,15),(40,48,1),(295,48,2),(550,48,3),(805,48,4),(1060,48,5),(1315,48,6),(1570,48,7),(1825,48,8),(2080,48,9),(2335,48,10),(2590,48,11),(2845,48,12),(3100,48,13),(3355,48,14),(3610,48,15),(41,49,1),(296,49,2),(551,49,3),(806,49,4),(1061,49,5),(1316,49,6),(1571,49,7),(1826,49,8),(2081,49,9),(2336,49,10),(2591,49,11),(2846,49,12),(3101,49,13),(3356,49,14),(3611,49,15),(42,50,1),(297,50,2),(552,50,3),(807,50,4),(1062,50,5),(1317,50,6),(1572,50,7),(1827,50,8),(2082,50,9),(2337,50,10),(2592,50,11),(2847,50,12),(3102,50,13),(3357,50,14),(3612,50,15),(43,51,1),(298,51,2),(553,51,3),(808,51,4),(1063,51,5),(1318,51,6),(1573,51,7),(1828,51,8),(2083,51,9),(2338,51,10),(2593,51,11),(2848,51,12),(3103,51,13),(3358,51,14),(3613,51,15),(44,54,1),(299,54,2),(554,54,3),(809,54,4),(1064,54,5),(1319,54,6),(1574,54,7),(1829,54,8),(2084,54,9),(2339,54,10),(2594,54,11),(2849,54,12),(3104,54,13),(3359,54,14),(3614,54,15),(45,55,1),(300,55,2),(555,55,3),(810,55,4),(1065,55,5),(1320,55,6),(1575,55,7),(1830,55,8),(2085,55,9),(2340,55,10),(2595,55,11),(2850,55,12),(3105,55,13),(3360,55,14),(3615,55,15),(46,56,1),(301,56,2),(556,56,3),(811,56,4),(1066,56,5),(1321,56,6),(1576,56,7),(1831,56,8),(2086,56,9),(2341,56,10),(2596,56,11),(2851,56,12),(3106,56,13),(3361,56,14),(3616,56,15),(47,57,1),(302,57,2),(557,57,3),(812,57,4),(1067,57,5),(1322,57,6),(1577,57,7),(1832,57,8),(2087,57,9),(2342,57,10),(2597,57,11),(2852,57,12),(3107,57,13),(3362,57,14),(3617,57,15),(48,58,1),(303,58,2),(558,58,3),(813,58,4),(1068,58,5),(1323,58,6),(1578,58,7),(1833,58,8),(2088,58,9),(2343,58,10),(2598,58,11),(2853,58,12),(3108,58,13),(3363,58,14),(3618,58,15),(49,59,1),(304,59,2),(559,59,3),(814,59,4),(1069,59,5),(1324,59,6),(1579,59,7),(1834,59,8),(2089,59,9),(2344,59,10),(2599,59,11),(2854,59,12),(3109,59,13),(3364,59,14),(3619,59,15),(50,60,1),(305,60,2),(560,60,3),(815,60,4),(1070,60,5),(1325,60,6),(1580,60,7),(1835,60,8),(2090,60,9),(2345,60,10),(2600,60,11),(2855,60,12),(3110,60,13),(3365,60,14),(3620,60,15),(51,61,1),(306,61,2),(561,61,3),(816,61,4),(1071,61,5),(1326,61,6),(1581,61,7),(1836,61,8),(2091,61,9),(2346,61,10),(2601,61,11),(2856,61,12),(3111,61,13),(3366,61,14),(3621,61,15),(52,62,1),(307,62,2),(562,62,3),(817,62,4),(1072,62,5),(1327,62,6),(1582,62,7),(1837,62,8),(2092,62,9),(2347,62,10),(2602,62,11),(2857,62,12),(3112,62,13),(3367,62,14),(3622,62,15),(53,63,1),(308,63,2),(563,63,3),(818,63,4),(1073,63,5),(1328,63,6),(1583,63,7),(1838,63,8),(2093,63,9),(2348,63,10),(2603,63,11),(2858,63,12),(3113,63,13),(3368,63,14),(3623,63,15),(54,64,1),(309,64,2),(564,64,3),(819,64,4),(1074,64,5),(1329,64,6),(1584,64,7),(1839,64,8),(2094,64,9),(2349,64,10),(2604,64,11),(2859,64,12),(3114,64,13),(3369,64,14),(3624,64,15),(55,65,1),(310,65,2),(565,65,3),(820,65,4),(1075,65,5),(1330,65,6),(1585,65,7),(1840,65,8),(2095,65,9),(2350,65,10),(2605,65,11),(2860,65,12),(3115,65,13),(3370,65,14),(3625,65,15),(56,66,1),(311,66,2),(566,66,3),(821,66,4),(1076,66,5),(1331,66,6),(1586,66,7),(1841,66,8),(2096,66,9),(2351,66,10),(2606,66,11),(2861,66,12),(3116,66,13),(3371,66,14),(3626,66,15),(57,67,1),(312,67,2),(567,67,3),(822,67,4),(1077,67,5),(1332,67,6),(1587,67,7),(1842,67,8),(2097,67,9),(2352,67,10),(2607,67,11),(2862,67,12),(3117,67,13),(3372,67,14),(3627,67,15),(58,69,1),(313,69,2),(568,69,3),(823,69,4),(1078,69,5),(1333,69,6),(1588,69,7),(1843,69,8),(2098,69,9),(2353,69,10),(2608,69,11),(2863,69,12),(3118,69,13),(3373,69,14),(3628,69,15),(59,70,1),(314,70,2),(569,70,3),(824,70,4),(1079,70,5),(1334,70,6),(1589,70,7),(1844,70,8),(2099,70,9),(2354,70,10),(2609,70,11),(2864,70,12),(3119,70,13),(3374,70,14),(3629,70,15),(60,71,1),(315,71,2),(570,71,3),(825,71,4),(1080,71,5),(1335,71,6),(1590,71,7),(1845,71,8),(2100,71,9),(2355,71,10),(2610,71,11),(2865,71,12),(3120,71,13),(3375,71,14),(3630,71,15),(61,72,1),(316,72,2),(571,72,3),(826,72,4),(1081,72,5),(1336,72,6),(1591,72,7),(1846,72,8),(2101,72,9),(2356,72,10),(2611,72,11),(2866,72,12),(3121,72,13),(3376,72,14),(3631,72,15),(62,74,1),(317,74,2),(572,74,3),(827,74,4),(1082,74,5),(1337,74,6),(1592,74,7),(1847,74,8),(2102,74,9),(2357,74,10),(2612,74,11),(2867,74,12),(3122,74,13),(3377,74,14),(3632,74,15),(63,75,1),(318,75,2),(573,75,3),(828,75,4),(1083,75,5),(1338,75,6),(1593,75,7),(1848,75,8),(2103,75,9),(2358,75,10),(2613,75,11),(2868,75,12),(3123,75,13),(3378,75,14),(3633,75,15),(64,77,1),(319,77,2),(574,77,3),(829,77,4),(1084,77,5),(1339,77,6),(1594,77,7),(1849,77,8),(2104,77,9),(2359,77,10),(2614,77,11),(2869,77,12),(3124,77,13),(3379,77,14),(3634,77,15),(65,78,1),(320,78,2),(575,78,3),(830,78,4),(1085,78,5),(1340,78,6),(1595,78,7),(1850,78,8),(2105,78,9),(2360,78,10),(2615,78,11),(2870,78,12),(3125,78,13),(3380,78,14),(3635,78,15),(66,80,1),(321,80,2),(576,80,3),(831,80,4),(1086,80,5),(1341,80,6),(1596,80,7),(1851,80,8),(2106,80,9),(2361,80,10),(2616,80,11),(2871,80,12),(3126,80,13),(3381,80,14),(3636,80,15),(67,81,1),(322,81,2),(577,81,3),(832,81,4),(1087,81,5),(1342,81,6),(1597,81,7),(1852,81,8),(2107,81,9),(2362,81,10),(2617,81,11),(2872,81,12),(3127,81,13),(3382,81,14),(3637,81,15),(68,82,1),(323,82,2),(578,82,3),(833,82,4),(1088,82,5),(1343,82,6),(1598,82,7),(1853,82,8),(2108,82,9),(2363,82,10),(2618,82,11),(2873,82,12),(3128,82,13),(3383,82,14),(3638,82,15),(69,83,1),(324,83,2),(579,83,3),(834,83,4),(1089,83,5),(1344,83,6),(1599,83,7),(1854,83,8),(2109,83,9),(2364,83,10),(2619,83,11),(2874,83,12),(3129,83,13),(3384,83,14),(3639,83,15),(70,86,1),(325,86,2),(580,86,3),(835,86,4),(1090,86,5),(1345,86,6),(1600,86,7),(1855,86,8),(2110,86,9),(2365,86,10),(2620,86,11),(2875,86,12),(3130,86,13),(3385,86,14),(3640,86,15),(71,87,1),(326,87,2),(581,87,3),(836,87,4),(1091,87,5),(1346,87,6),(1601,87,7),(1856,87,8),(2111,87,9),(2366,87,10),(2621,87,11),(2876,87,12),(3131,87,13),(3386,87,14),(3641,87,15),(72,88,1),(327,88,2),(582,88,3),(837,88,4),(1092,88,5),(1347,88,6),(1602,88,7),(1857,88,8),(2112,88,9),(2367,88,10),(2622,88,11),(2877,88,12),(3132,88,13),(3387,88,14),(3642,88,15),(73,89,1),(328,89,2),(583,89,3),(838,89,4),(1093,89,5),(1348,89,6),(1603,89,7),(1858,89,8),(2113,89,9),(2368,89,10),(2623,89,11),(2878,89,12),(3133,89,13),(3388,89,14),(3643,89,15),(74,90,1),(329,90,2),(584,90,3),(839,90,4),(1094,90,5),(1349,90,6),(1604,90,7),(1859,90,8),(2114,90,9),(2369,90,10),(2624,90,11),(2879,90,12),(3134,90,13),(3389,90,14),(3644,90,15),(75,92,1),(330,92,2),(585,92,3),(840,92,4),(1095,92,5),(1350,92,6),(1605,92,7),(1860,92,8),(2115,92,9),(2370,92,10),(2625,92,11),(2880,92,12),(3135,92,13),(3390,92,14),(3645,92,15),(76,93,1),(331,93,2),(586,93,3),(841,93,4),(1096,93,5),(1351,93,6),(1606,93,7),(1861,93,8),(2116,93,9),(2371,93,10),(2626,93,11),(2881,93,12),(3136,93,13),(3391,93,14),(3646,93,15),(77,94,1),(332,94,2),(587,94,3),(842,94,4),(1097,94,5),(1352,94,6),(1607,94,7),(1862,94,8),(2117,94,9),(2372,94,10),(2627,94,11),(2882,94,12),(3137,94,13),(3392,94,14),(3647,94,15),(78,96,1),(333,96,2),(588,96,3),(843,96,4),(1098,96,5),(1353,96,6),(1608,96,7),(1863,96,8),(2118,96,9),(2373,96,10),(2628,96,11),(2883,96,12),(3138,96,13),(3393,96,14),(3648,96,15),(79,97,1),(334,97,2),(589,97,3),(844,97,4),(1099,97,5),(1354,97,6),(1609,97,7),(1864,97,8),(2119,97,9),(2374,97,10),(2629,97,11),(2884,97,12),(3139,97,13),(3394,97,14),(3649,97,15),(80,98,1),(335,98,2),(590,98,3),(845,98,4),(1100,98,5),(1355,98,6),(1610,98,7),(1865,98,8),(2120,98,9),(2375,98,10),(2630,98,11),(2885,98,12),(3140,98,13),(3395,98,14),(3650,98,15),(81,99,1),(336,99,2),(591,99,3),(846,99,4),(1101,99,5),(1356,99,6),(1611,99,7),(1866,99,8),(2121,99,9),(2376,99,10),(2631,99,11),(2886,99,12),(3141,99,13),(3396,99,14),(3651,99,15),(82,100,1),(337,100,2),(592,100,3),(847,100,4),(1102,100,5),(1357,100,6),(1612,100,7),(1867,100,8),(2122,100,9),(2377,100,10),(2632,100,11),(2887,100,12),(3142,100,13),(3397,100,14),(3652,100,15),(83,101,1),(338,101,2),(593,101,3),(848,101,4),(1103,101,5),(1358,101,6),(1613,101,7),(1868,101,8),(2123,101,9),(2378,101,10),(2633,101,11),(2888,101,12),(3143,101,13),(3398,101,14),(3653,101,15),(84,102,1),(339,102,2),(594,102,3),(849,102,4),(1104,102,5),(1359,102,6),(1614,102,7),(1869,102,8),(2124,102,9),(2379,102,10),(2634,102,11),(2889,102,12),(3144,102,13),(3399,102,14),(3654,102,15),(85,103,1),(340,103,2),(595,103,3),(850,103,4),(1105,103,5),(1360,103,6),(1615,103,7),(1870,103,8),(2125,103,9),(2380,103,10),(2635,103,11),(2890,103,12),(3145,103,13),(3400,103,14),(3655,103,15),(86,104,1),(341,104,2),(596,104,3),(851,104,4),(1106,104,5),(1361,104,6),(1616,104,7),(1871,104,8),(2126,104,9),(2381,104,10),(2636,104,11),(2891,104,12),(3146,104,13),(3401,104,14),(3656,104,15),(87,105,1),(342,105,2),(597,105,3),(852,105,4),(1107,105,5),(1362,105,6),(1617,105,7),(1872,105,8),(2127,105,9),(2382,105,10),(2637,105,11),(2892,105,12),(3147,105,13),(3402,105,14),(3657,105,15),(88,106,1),(343,106,2),(598,106,3),(853,106,4),(1108,106,5),(1363,106,6),(1618,106,7),(1873,106,8),(2128,106,9),(2383,106,10),(2638,106,11),(2893,106,12),(3148,106,13),(3403,106,14),(3658,106,15),(89,107,1),(344,107,2),(599,107,3),(854,107,4),(1109,107,5),(1364,107,6),(1619,107,7),(1874,107,8),(2129,107,9),(2384,107,10),(2639,107,11),(2894,107,12),(3149,107,13),(3404,107,14),(3659,107,15),(90,108,1),(345,108,2),(600,108,3),(855,108,4),(1110,108,5),(1365,108,6),(1620,108,7),(1875,108,8),(2130,108,9),(2385,108,10),(2640,108,11),(2895,108,12),(3150,108,13),(3405,108,14),(3660,108,15),(91,112,1),(346,112,2),(601,112,3),(856,112,4),(1111,112,5),(1366,112,6),(1621,112,7),(1876,112,8),(2131,112,9),(2386,112,10),(2641,112,11),(2896,112,12),(3151,112,13),(3406,112,14),(3661,112,15),(3702,112,18),(95,118,1),(350,118,2),(605,118,3),(860,118,4),(1115,118,5),(1370,118,6),(1625,118,7),(1880,118,8),(2135,118,9),(2390,118,10),(2645,118,11),(2900,118,12),(3155,118,13),(3410,118,14),(3665,118,15),(96,119,1),(351,119,2),(606,119,3),(861,119,4),(1116,119,5),(1371,119,6),(1626,119,7),(1881,119,8),(2136,119,9),(2391,119,10),(2646,119,11),(2901,119,12),(3156,119,13),(3411,119,14),(3666,119,15),(97,120,1),(352,120,2),(607,120,3),(862,120,4),(1117,120,5),(1372,120,6),(1627,120,7),(1882,120,8),(2137,120,9),(2392,120,10),(2647,120,11),(2902,120,12),(3157,120,13),(3412,120,14),(3667,120,15),(98,123,1),(353,123,2),(608,123,3),(863,123,4),(1118,123,5),(1373,123,6),(1628,123,7),(1883,123,8),(2138,123,9),(2393,123,10),(2648,123,11),(2903,123,12),(3158,123,13),(3413,123,14),(3668,123,15),(99,124,1),(354,124,2),(609,124,3),(864,124,4),(1119,124,5),(1374,124,6),(1629,124,7),(1884,124,8),(2139,124,9),(2394,124,10),(2649,124,11),(2904,124,12),(3159,124,13),(3414,124,14),(3669,124,15),(100,125,1),(355,125,2),(610,125,3),(865,125,4),(1120,125,5),(1375,125,6),(1630,125,7),(1885,125,8),(2140,125,9),(2395,125,10),(2650,125,11),(2905,125,12),(3160,125,13),(3415,125,14),(3670,125,15),(101,126,1),(356,126,2),(611,126,3),(866,126,4),(1121,126,5),(1376,126,6),(1631,126,7),(1886,126,8),(2141,126,9),(2396,126,10),(2651,126,11),(2906,126,12),(3161,126,13),(3416,126,14),(3671,126,15),(102,127,1),(357,127,2),(612,127,3),(867,127,4),(1122,127,5),(1377,127,6),(1632,127,7),(1887,127,8),(2142,127,9),(2397,127,10),(2652,127,11),(2907,127,12),(3162,127,13),(3417,127,14),(3672,127,15),(103,128,1),(358,128,2),(613,128,3),(868,128,4),(1123,128,5),(1378,128,6),(1633,128,7),(1888,128,8),(2143,128,9),(2398,128,10),(2653,128,11),(2908,128,12),(3163,128,13),(3418,128,14),(3673,128,15),(104,129,1),(359,129,2),(614,129,3),(869,129,4),(1124,129,5),(1379,129,6),(1634,129,7),(1889,129,8),(2144,129,9),(2399,129,10),(2654,129,11),(2909,129,12),(3164,129,13),(3419,129,14),(3674,129,15),(105,130,1),(360,130,2),(615,130,3),(870,130,4),(1125,130,5),(1380,130,6),(1635,130,7),(1890,130,8),(2145,130,9),(2400,130,10),(2655,130,11),(2910,130,12),(3165,130,13),(3420,130,14),(3675,130,15),(106,131,1),(361,131,2),(616,131,3),(871,131,4),(1126,131,5),(1381,131,6),(1636,131,7),(1891,131,8),(2146,131,9),(2401,131,10),(2656,131,11),(2911,131,12),(3166,131,13),(3421,131,14),(3676,131,15),(107,132,1),(362,132,2),(617,132,3),(872,132,4),(1127,132,5),(1382,132,6),(1637,132,7),(1892,132,8),(2147,132,9),(2402,132,10),(2657,132,11),(2912,132,12),(3167,132,13),(3422,132,14),(3677,132,15),(118,145,1),(373,145,2),(628,145,3),(883,145,4),(1138,145,5),(1393,145,6),(1648,145,7),(1903,145,8),(2158,145,9),(2413,145,10),(2668,145,11),(2923,145,12),(3178,145,13),(3433,145,14),(3688,145,15),(119,146,1),(374,146,2),(629,146,3),(884,146,4),(1139,146,5),(1394,146,6),(1649,146,7),(1904,146,8),(2159,146,9),(2414,146,10),(2669,146,11),(2924,146,12),(3179,146,13),(3434,146,14),(3689,146,15),(120,147,1),(375,147,2),(630,147,3),(885,147,4),(1140,147,5),(1395,147,6),(1650,147,7),(1905,147,8),(2160,147,9),(2415,147,10),(2670,147,11),(2925,147,12),(3180,147,13),(3435,147,14),(3690,147,15),(121,148,1),(376,148,2),(631,148,3),(886,148,4),(1141,148,5),(1396,148,6),(1651,148,7),(1906,148,8),(2161,148,9),(2416,148,10),(2671,148,11),(2926,148,12),(3181,148,13),(3436,148,14),(3691,148,15),(122,150,1),(377,150,2),(632,150,3),(887,150,4),(1142,150,5),(1397,150,6),(1652,150,7),(1907,150,8),(2162,150,9),(2417,150,10),(2672,150,11),(2927,150,12),(3182,150,13),(3437,150,14),(3692,150,15),(123,151,1),(378,151,2),(633,151,3),(888,151,4),(1143,151,5),(1398,151,6),(1653,151,7),(1908,151,8),(2163,151,9),(2418,151,10),(2673,151,11),(2928,151,12),(3183,151,13),(3438,151,14),(3693,151,15),(124,153,1),(379,153,2),(634,153,3),(889,153,4),(1144,153,5),(1399,153,6),(1654,153,7),(1909,153,8),(2164,153,9),(2419,153,10),(2674,153,11),(2929,153,12),(3184,153,13),(3439,153,14),(3694,153,15),(125,154,1),(380,154,2),(635,154,3),(890,154,4),(1145,154,5),(1400,154,6),(1655,154,7),(1910,154,8),(2165,154,9),(2420,154,10),(2675,154,11),(2930,154,12),(3185,154,13),(3440,154,14),(3695,154,15),(126,155,1),(381,155,2),(636,155,3),(891,155,4),(1146,155,5),(1401,155,6),(1656,155,7),(1911,155,8),(2166,155,9),(2421,155,10),(2676,155,11),(2931,155,12),(3186,155,13),(3441,155,14),(3696,155,15),(127,156,1),(382,156,2),(637,156,3),(892,156,4),(1147,156,5),(1402,156,6),(1657,156,7),(1912,156,8),(2167,156,9),(2422,156,10),(2677,156,11),(2932,156,12),(3187,156,13),(3442,156,14),(3697,156,15),(128,157,1),(383,157,2),(638,157,3),(893,157,4),(1148,157,5),(1403,157,6),(1658,157,7),(1913,157,8),(2168,157,9),(2423,157,10),(2678,157,11),(2933,157,12),(3188,157,13),(3443,157,14),(3698,157,15),(129,158,1),(384,158,2),(639,158,3),(894,158,4),(1149,158,5),(1404,158,6),(1659,158,7),(1914,158,8),(2169,158,9),(2424,158,10),(2679,158,11),(2934,158,12),(3189,158,13),(3444,158,14),(3699,158,15),(130,159,1),(385,159,2),(640,159,3),(895,159,4),(1150,159,5),(1405,159,6),(1660,159,7),(1915,159,8),(2170,159,9),(2425,159,10),(2680,159,11),(2935,159,12),(3190,159,13),(3445,159,14),(3700,159,15),(4089,181,1),(4090,181,2),(4091,181,3),(4092,181,4),(4093,181,5),(4094,181,6),(4095,181,7),(4096,181,8),(4097,181,9),(4098,181,10),(4099,181,11),(4100,181,12),(4101,181,13),(4102,181,14),(4103,181,15),(4104,181,16),(4105,181,17),(4106,181,18),(3969,182,1),(3970,182,2),(3971,182,3),(3972,182,4),(3973,182,5),(3974,182,6),(3975,182,7),(3976,182,8),(3977,182,9),(3978,182,10),(3979,182,11),(3980,182,12),(3981,182,13),(3982,182,14),(3983,182,15),(3984,182,16),(3985,182,17),(3986,182,18),(4000,183,1),(4001,183,2),(4002,183,3),(4003,183,4),(4004,183,5),(4005,183,6),(4006,183,7),(4007,183,8),(4008,183,9),(4009,183,10),(4010,183,11),(4011,183,12),(4012,183,13),(4013,183,14),(4014,183,15),(4015,183,16),(4016,183,17),(4017,183,18),(4040,187,1),(4041,187,2),(4042,187,3),(4043,187,4),(4044,187,5),(4045,187,6),(4046,187,7),(4047,187,8),(4048,187,9),(4049,187,10),(4050,187,11),(4051,187,12),(4052,187,13),(4053,187,14),(4054,187,15),(4055,187,16),(4056,187,17),(4057,187,18),(4071,188,1),(4072,188,2),(4073,188,3),(4074,188,4),(4075,188,5),(4076,188,6),(4077,188,7),(4078,188,8),(4079,188,9),(4080,188,10),(4081,188,11),(4082,188,12),(4083,188,13),(4084,188,14),(4085,188,15),(4086,188,16),(4087,188,17),(4088,188,18),(4120,189,1),(4121,189,2),(4122,189,3),(4123,189,4),(4124,189,5),(4125,189,6),(4126,189,7),(4127,189,8),(4128,189,9),(4129,189,10),(4130,189,11),(4131,189,12),(4132,189,13),(4133,189,14),(4134,189,15),(4135,189,16),(4136,189,17),(4137,189,18),(4138,190,1),(4139,190,2),(4140,190,3),(4141,190,4),(4142,190,5),(4143,190,6),(4144,190,7),(4145,190,8),(4146,190,9),(4147,190,10),(4148,190,11),(4149,190,12),(4150,190,13),(4151,190,14),(4152,190,15),(4153,190,16),(4154,190,17),(4155,190,18),(4156,191,1),(4157,191,2),(4158,191,3),(4159,191,4),(4160,191,5),(4161,191,6),(4162,191,7),(4163,191,8),(4164,191,9),(4165,191,10),(4166,191,11),(4167,191,12),(4168,191,13),(4169,191,14),(4170,191,15),(4171,191,16),(4172,191,17),(4173,191,18),(4174,191,20),(4187,192,1),(4188,192,2),(4189,192,3),(4190,192,4),(4191,192,5),(4192,192,6),(4193,192,7),(4194,192,8),(4195,192,9),(4196,192,10),(4197,192,11),(4198,192,12),(4199,192,13),(4200,192,14),(4201,192,15),(4202,192,16),(4203,192,17),(4204,192,18),(4205,192,20),(4218,193,1),(4219,193,2),(4220,193,3),(4221,193,4),(4222,193,5),(4223,193,6),(4224,193,7),(4225,193,8),(4226,193,9),(4227,193,10),(4228,193,11),(4229,193,12),(4230,193,13),(4231,193,14),(4232,193,15),(4233,193,16),(4234,193,17),(4235,193,18),(4236,193,20),(4249,194,1),(4250,194,2),(4251,194,3),(4252,194,4),(4253,194,5),(4254,194,6),(4255,194,7),(4256,194,8),(4257,194,9),(4258,194,10),(4259,194,11),(4260,194,12),(4261,194,13),(4262,194,14),(4263,194,15),(4264,194,16),(4265,194,17),(4266,194,18),(4267,194,20),(4287,197,1),(4288,197,2),(4289,197,3),(4290,197,4),(4291,197,5),(4292,197,6),(4293,197,7),(4294,197,8),(4295,197,9),(4296,197,10),(4297,197,11),(4298,197,12),(4299,197,13),(4300,197,14),(4301,197,15),(4302,197,16),(4303,197,17),(4304,197,18),(4305,197,20),(4325,197,21),(4306,198,1),(4307,198,2),(4308,198,3),(4309,198,4),(4310,198,5),(4311,198,6),(4312,198,7),(4313,198,8),(4314,198,9),(4315,198,10),(4316,198,11),(4317,198,12),(4318,198,13),(4319,198,14),(4320,198,15),(4321,198,16),(4322,198,17),(4323,198,18),(4324,198,20),(4346,201,1),(4347,201,2),(4348,201,3),(4349,201,4),(4350,201,5),(4351,201,6),(4352,201,7),(4353,201,8),(4354,201,9),(4355,201,10),(4356,201,11),(4357,201,12),(4358,201,13),(4359,201,14),(4360,201,15),(4361,201,16),(4362,201,17),(4363,201,18),(4364,201,20),(4365,201,21),(4461,201,22),(4555,201,23),(4377,202,1),(4378,202,2),(4379,202,3),(4380,202,4),(4381,202,5),(4382,202,6),(4383,202,7),(4384,202,8),(4385,202,9),(4386,202,10),(4387,202,11),(4388,202,12),(4389,202,13),(4390,202,14),(4391,202,15),(4392,202,16),(4393,202,17),(4394,202,18),(4395,202,20),(4396,202,21),(4326,203,1),(4327,203,2),(4328,203,3),(4329,203,4),(4330,203,5),(4331,203,6),(4332,203,7),(4333,203,8),(4334,203,9),(4335,203,10),(4336,203,11),(4337,203,12),(4338,203,13),(4339,203,14),(4340,203,15),(4341,203,16),(4342,203,17),(4343,203,18),(4344,203,20),(4345,203,21),(4409,204,1),(4410,204,2),(4411,204,3),(4412,204,4),(4413,204,5),(4414,204,6),(4415,204,7),(4416,204,8),(4417,204,9),(4418,204,10),(4419,204,11),(4420,204,12),(4421,204,13),(4422,204,14),(4423,204,15),(4424,204,16),(4425,204,17),(4426,204,18),(4427,204,20),(4428,204,21),(4441,205,1),(4442,205,2),(4443,205,3),(4444,205,4),(4445,205,5),(4446,205,6),(4447,205,7),(4448,205,8),(4449,205,9),(4450,205,10),(4451,205,11),(4452,205,12),(4453,205,13),(4454,205,14),(4455,205,15),(4456,205,16),(4457,205,17),(4458,205,18),(4459,205,20),(4460,205,21),(4462,207,1),(4463,207,2),(4464,207,3),(4465,207,4),(4466,207,5),(4467,207,6),(4468,207,7),(4469,207,8),(4470,207,9),(4471,207,10),(4472,207,11),(4473,207,12),(4474,207,13),(4475,207,14),(4476,207,15),(4477,207,16),(4478,207,17),(4479,207,18),(4480,207,20),(4481,207,21),(4482,207,22),(4493,208,1),(4494,208,2),(4495,208,3),(4496,208,4),(4497,208,5),(4498,208,6),(4499,208,7),(4500,208,8),(4501,208,9),(4502,208,10),(4503,208,11),(4504,208,12),(4505,208,13),(4506,208,14),(4507,208,15),(4508,208,16),(4509,208,17),(4510,208,18),(4511,208,20),(4512,208,21),(4513,208,22),(4524,209,1),(4525,209,2),(4526,209,3),(4527,209,4),(4528,209,5),(4529,209,6),(4530,209,7),(4531,209,8),(4532,209,9),(4533,209,10),(4534,209,11),(4535,209,12),(4536,209,13),(4537,209,14),(4538,209,15),(4539,209,16),(4540,209,17),(4541,209,18),(4542,209,20),(4543,209,21),(4544,209,22);
/*!40000 ALTER TABLE `module_actions_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_button_mapping`
--

DROP TABLE IF EXISTS `module_button_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_button_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_action_id` bigint DEFAULT NULL,
  `button_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_button_buttonModule_idx` (`button_id`),
  KEY `FK_moduleAction_buttonModule_idx` (`module_action_id`),
  CONSTRAINT `FK_button_buttonModule` FOREIGN KEY (`button_id`) REFERENCES `buttons` (`id`),
  CONSTRAINT `FK_moduleAction_buttonModule` FOREIGN KEY (`module_action_id`) REFERENCES `module_actions_mapping` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_button_mapping`
--

LOCK TABLES `module_button_mapping` WRITE;
/*!40000 ALTER TABLE `module_button_mapping` DISABLE KEYS */;
INSERT INTO `module_button_mapping` VALUES (1,91,1),(2,91,2),(3,91,3),(4,91,6),(5,346,7),(6,346,8),(7,107,1),(8,107,2),(9,107,3),(10,107,6),(11,362,7),(12,362,8),(13,617,7),(14,617,15),(15,601,7),(16,601,15),(17,99,1),(18,99,2),(19,99,3),(20,99,6),(21,354,7),(22,354,8),(23,609,7),(24,609,15),(25,100,1),(26,100,2),(27,100,3),(28,100,6),(29,355,7),(30,355,8),(31,610,7),(32,610,15),(33,101,1),(34,101,2),(35,101,3),(36,101,6),(37,356,7),(38,356,8),(39,611,7),(40,611,15),(41,102,1),(42,102,2),(43,102,3),(44,102,6),(45,357,7),(46,357,8),(47,612,7),(48,612,15),(49,104,1),(50,104,2),(51,104,3),(52,104,6),(53,359,7),(54,359,8),(55,614,7),(56,614,15),(57,105,1),(58,105,2),(59,105,3),(60,105,6),(61,360,7),(62,360,8),(63,615,7),(64,615,15),(66,96,1),(67,96,2),(68,96,3),(69,96,6),(70,351,7),(71,351,8),(72,606,7),(73,606,15),(186,3969,1),(187,3969,2),(188,3969,3),(189,3969,6),(190,3970,7),(191,3970,8),(192,3971,7),(193,3971,15),(194,4000,1),(195,4000,2),(196,4000,3),(197,4000,6),(198,4001,7),(199,4001,8),(200,4002,7),(201,4002,15),(210,4040,1),(211,4040,2),(212,4040,3),(213,4040,6),(214,4041,7),(215,4041,8),(216,4042,7),(217,4042,15),(218,4071,1),(219,4071,2),(220,4071,3),(221,4071,6),(222,4072,7),(223,4072,8),(224,4073,7),(225,4073,15),(226,4089,1),(227,4089,2),(228,4089,3),(229,4090,7),(230,4090,8),(231,4091,7),(232,4091,15),(233,4120,1),(234,4120,2),(235,4120,3),(236,4120,6),(237,4121,7),(238,4121,8),(239,4122,7),(240,4122,15),(241,4138,1),(242,4138,2),(243,4138,3),(244,4138,6),(245,4139,7),(246,4139,8),(247,4140,7),(248,4140,15),(249,4156,1),(250,4156,2),(251,4156,3),(252,4156,6),(253,4157,7),(254,4157,8),(255,4158,7),(256,4158,15),(257,4187,1),(258,4187,2),(259,4187,3),(260,4187,6),(261,4188,7),(262,4188,8),(263,4189,7),(264,4189,15),(265,4218,1),(266,4218,2),(267,4218,3),(268,4218,6),(269,4219,7),(270,4219,8),(271,4220,7),(272,4220,15),(273,4089,6),(274,4287,1),(275,4287,2),(276,4287,3),(277,4287,6),(278,4288,7),(279,4288,8),(280,4289,7),(281,4289,15),(282,4306,1),(283,4306,2),(284,4306,3),(285,4306,6),(286,4307,7),(287,4307,8),(288,4308,7),(289,4308,15),(290,4287,12),(291,4326,1),(292,4326,2),(293,4326,3),(294,4326,6),(295,4327,7),(296,4327,8),(297,4328,7),(298,4328,15),(299,4346,1),(300,4346,2),(301,4346,3),(302,4346,6),(303,4347,7),(304,4347,8),(305,4348,7),(306,4348,15),(307,4377,1),(308,4377,2),(309,4377,3),(310,4377,6),(311,4378,7),(312,4378,8),(313,4379,7),(314,4379,15),(315,4409,1),(316,4409,2),(317,4409,3),(318,4409,6),(320,4410,8),(322,4411,15),(323,4441,1),(324,4441,2),(325,4441,3),(326,4441,6),(328,4442,8),(330,4443,15),(331,4346,13),(332,4346,14),(333,1786,7),(334,1787,7),(335,1788,7),(336,1789,7),(337,1790,7),(338,1791,7),(339,1792,7),(340,1793,7),(341,1794,7),(342,1795,7),(343,1796,7),(344,1797,7),(345,1798,7),(346,1799,7),(347,1800,7),(348,1801,7),(349,1802,7),(350,1803,7),(351,1804,7),(352,1805,7),(353,1806,7),(354,1807,7),(355,1808,7),(356,1809,7),(357,1810,7),(358,1811,7),(359,1812,7),(360,1813,7),(361,1814,7),(362,1815,7),(363,1816,7),(364,1817,7),(365,1818,7),(366,1819,7),(367,1820,7),(368,1821,7),(369,1822,7),(370,1823,7),(371,1824,7),(372,1825,7),(373,1826,7),(374,1827,7),(375,1828,7),(376,1829,7),(377,1830,7),(378,1831,7),(379,1832,7),(380,1833,7),(381,1834,7),(382,1835,7),(383,1836,7),(384,1837,7),(385,1838,7),(386,1839,7),(387,1840,7),(388,1841,7),(389,1842,7),(390,1843,7),(391,1844,7),(392,1845,7),(393,1846,7),(394,1847,7),(395,1848,7),(396,1849,7),(397,1850,7),(398,1851,7),(399,1852,7),(400,1853,7),(401,1854,7),(402,1855,7),(403,1856,7),(404,1857,7),(405,1858,7),(406,1859,7),(407,1860,7),(408,1861,7),(409,1862,7),(410,1863,7),(411,1864,7),(412,1865,7),(413,1866,7),(414,1867,7),(415,1868,7),(416,1869,7),(417,1870,7),(418,1871,7),(419,1872,7),(420,1873,7),(421,1874,7),(422,1875,7),(423,1876,7),(424,1880,7),(425,1881,7),(426,1882,7),(427,1883,7),(428,1884,7),(429,1885,7),(430,1886,7),(431,1887,7),(432,1888,7),(433,1889,7),(434,1890,7),(435,1891,7),(436,1892,7),(437,1903,7),(438,1904,7),(439,1905,7),(440,1906,7),(441,1907,7),(442,1908,7),(443,1909,7),(444,1910,7),(445,1911,7),(446,1912,7),(447,1913,7),(448,1914,7),(449,1915,7),(450,3976,7),(451,4007,7),(452,4047,7),(453,4078,7),(454,4096,7),(455,4127,7),(456,4145,7),(457,4163,7),(458,4194,7),(459,4225,7),(460,4256,7),(461,4294,7),(462,4313,7),(463,4333,7),(464,4353,7),(465,4384,7),(466,4416,7),(467,4448,7),(588,4346,16);
/*!40000 ALTER TABLE `module_button_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `display_order` int DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `parent_id` bigint DEFAULT NULL,
  `path` text,
  `api_path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `class` text,
  `is_external_link` tinyint DEFAULT '0',
  `module_type` varchar(255) DEFAULT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `badge_class` varchar(255) DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL,
  `columns` int DEFAULT '2',
  `server_class_name` varchar(45) DEFAULT NULL,
  `list_type` varchar(255) DEFAULT NULL,
  `created_by` bigint DEFAULT '1',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT '1',
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `branch_id` bigint DEFAULT '1',
  `company_id` bigint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,3,0,NULL,NULL,NULL,'Dashboard','ft-home','has-sub',0,'DashBoard',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(2,1,0,1,'/dashboard/dashboard1',NULL,'Dashboard 1','ft-arrow-right submenu-icon',NULL,0,'DashBoard',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(3,2,0,1,'/dashboard/dashboard2',NULL,'Dashboard 2','ft-arrow-right submenu-icon',NULL,0,'Dashboard',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(4,15,0,NULL,'/inbox',NULL,'Email','ft-mail',NULL,0,'Apps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(5,16,0,NULL,'/chat',NULL,'Chat','ft-message-square',NULL,0,'Apps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(6,17,0,NULL,'/chat-ngrx',NULL,'Chat NgRx','ft-message-square',NULL,0,'Apps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(7,18,0,NULL,'/taskboard',NULL,'Task Board','ft-file-text',NULL,0,'Apps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(8,19,0,NULL,'/taskboard-ngrx',NULL,'Task Board NgRx','ft-file-text',NULL,0,'Apps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(9,20,0,NULL,'/calendar',NULL,'Calendar','ft-calendar',NULL,0,'Apps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(10,21,0,NULL,NULL,NULL,'UI Kit','ft-aperture','has-sub',0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(11,1,0,10,'/uikit/grids',NULL,'Grid','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(12,2,0,10,'/uikit/typography',NULL,'Typography','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(13,3,0,10,'/uikit/syntaxhighlighter',NULL,'Syntax Highlighter','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(14,4,0,10,'/uikit/helperclasses',NULL,'Helper Classes','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(15,5,0,10,'/uikit/textutilities',NULL,'Text Utilities','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(16,6,0,10,'/uikit/colorpalettes',NULL,'Color Palette','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(17,7,0,10,NULL,NULL,'Icons','ft-arrow-right submenu-icon','has-sub',0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(18,1,1,17,'/uikit/feather',NULL,'Feather Icon','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(19,2,0,17,'/uikit/font-awesome',NULL,'Font Awesom Icon','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(20,3,0,17,'/uikit/simple-line',NULL,'Simple Line Icon','ft-arrow-right submenu-icon',NULL,0,'UI Kit',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(21,22,0,NULL,NULL,NULL,'Components','ft-box','has-sub',0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(22,1,0,21,NULL,NULL,'Bootstrap','ft-arrow-right submenu-icon','has-sub',0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(23,1,0,22,'/components/buttons',NULL,'Buttons','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(24,2,0,22,'/components/ng-buttons',NULL,'NG Buttons','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(25,3,0,22,'/components/alerts',NULL,'Alerts','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(26,4,0,22,'/components/badges',NULL,'Badges','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(27,5,0,22,'/components/dropdowns',NULL,'Dropdowns','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(28,6,0,22,'/components/media',NULL,'Media Objects','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(29,7,0,22,'/components/pagination',NULL,'Pagination','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(30,8,0,22,'/components/progress',NULL,'Progress Bars','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(31,9,0,22,'/components/models',NULL,'Modals','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(32,10,0,22,'/components/collapse',NULL,'Collapse','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(33,11,0,22,'/components/lists',NULL,'List','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(34,12,0,22,'/components/accordion',NULL,'Accordion','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(35,13,0,22,'/components/carousel',NULL,'Carousel','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(36,14,0,22,'/components/popover',NULL,'Popover','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(37,15,0,22,'/components/rating',NULL,'Rating','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(38,16,0,22,'/components/tabs',NULL,'Tabs','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(39,17,0,22,'/components/tooltip',NULL,'Tooltip','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(40,18,0,22,'/components/typeahead',NULL,'Typehead','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(41,2,0,21,NULL,NULL,'Extra','ft-arrow-right submenu-icon','has-sub',0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(42,1,0,41,'/components/sweetalerts',NULL,'Sweet Alert','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(43,2,0,41,'/components/toastr',NULL,'Toastr','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(44,3,0,41,'/components/nouislider',NULL,'NoUI Slider','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(45,4,0,41,'/components/upload',NULL,'Upload','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(46,5,0,41,'/components/dragndrop',NULL,'Drag and Drop','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(47,6,0,41,'/components/tour',NULL,'Tour','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(48,7,0,41,'/components/player',NULL,'Media Player','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(49,8,0,41,'/components/cropper',NULL,'Image Cropper','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(50,9,0,41,'/components/avatar',NULL,'Avatar','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(51,10,0,41,'/components/swiper',NULL,'Swiper','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(52,23,0,NULL,NULL,NULL,'Forms','ft-edit','has-sub',0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(53,1,0,52,NULL,NULL,'Elements','ft-arrow-right submenu-icon','has-sub',0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(54,1,0,53,'/forms/inputs',NULL,'Inputs','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(55,2,0,53,'/forms/input-groups',NULL,'Input Goups','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(56,3,0,53,'/forms/radio',NULL,'Radio','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(57,4,0,53,'/forms/checkbox',NULL,'Checkbox','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(58,5,0,53,'/forms/switch',NULL,'Switch','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(59,6,0,53,'/forms/select',NULL,'Select','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(60,7,0,53,'/forms/editor',NULL,'Editor','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(61,8,0,53,'/forms/tags',NULL,'tags','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(62,9,0,53,'/forms/datepicker',NULL,'Datepicker','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(63,10,0,53,'/forms/timepicker',NULL,'TimePicker','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(64,2,0,52,'/forms/layout',NULL,'Layouts','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(65,3,0,52,'/forms/sampleForm',NULL,'Sample Form','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(66,4,0,52,'/forms/validation',NULL,'Validation','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(67,5,0,52,'/forms/archwizard',NULL,'Wizard','ft-arrow-right submenu-icon',NULL,0,'Forms',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(68,24,0,NULL,NULL,NULL,'Tables','ft-grid','has-sub',0,'Tables',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(69,1,0,68,'/tables/basic',NULL,'Basic','ft-arrow-right submenu-icon',NULL,0,'Tables',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(70,2,0,68,'/tables/extended',NULL,'Extended','ft-arrow-right submenu-icon',NULL,0,'Tables',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(71,3,0,68,'/tables/tables',NULL,'Angular','ft-arrow-right submenu-icon',NULL,0,'Tables',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(72,25,0,NULL,'/datatables',NULL,'Data Tables','ft-layout',NULL,0,'Tables',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(73,26,0,NULL,NULL,NULL,'Cards','ft-layers','has-sub',0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(74,1,0,73,'/cards/basic',NULL,'Basic Cards','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(75,2,0,73,'/cards/advanced',NULL,'Advances Cards','ft-arrow-right submenu-icon',NULL,0,'Components',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(76,27,0,NULL,NULL,NULL,'Maps','ft-map','has-sub',0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(77,1,0,76,'/maps/google',NULL,'Google Map','ft-arrow-right submenu-icon',NULL,0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(78,2,0,76,'/maps/fullscreen',NULL,'Full Screen Map','ft-arrow-right submenu-icon',NULL,0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(79,28,0,NULL,NULL,NULL,'Charts','ft-bar-chart-2','has-sub',0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(80,1,0,79,'/charts/chartjs',NULL,'ChartJs','ft-arrow-right submenu-icon',NULL,0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(81,2,0,79,'/charts/chartist',NULL,'Chartist','ft-arrow-right submenu-icon',NULL,0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(82,3,0,79,'/charts/apex',NULL,'Apex','ft-arrow-right submenu-icon',NULL,0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(83,4,0,79,'/charts/ngx',NULL,'NGX','ft-arrow-right submenu-icon',NULL,0,'Charts & Maps',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(84,29,0,NULL,NULL,NULL,'Pages','ft-copy','has-sub',0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(85,1,0,84,NULL,NULL,'Authentication','ft-arrow-right submenu-icon','has-sub',0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(86,1,0,85,'/pages/forgotpassword',NULL,'Forgot Password','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(87,2,0,85,'/pages/login',NULL,'Login','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(88,3,0,85,'/pages/register',NULL,'Register','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(89,4,0,85,'/pages/lockscreen',NULL,'Lock Screen','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(90,2,0,84,'/pages/horizontaltimeline',NULL,'Horizontal Timeline','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(91,3,0,84,NULL,NULL,'Vertical Timeline','ft-arrow-right submenu-icon','has-sub',0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(92,1,0,91,'/pages/timeline-vertical-center',NULL,'Center','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(93,2,0,91,'/pages/timeline-vertical-left',NULL,'Left','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(94,3,0,91,'/pages/timeline-vertical-right',NULL,'Right','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(95,4,0,84,NULL,NULL,'Users','ft-arrow-right submenu-icon','has-sub',0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(96,1,0,95,'/pages/users-list',NULL,'List','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(97,2,0,95,'/pages/users-view',NULL,'View','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(98,3,0,95,'/pages/users-edit',NULL,'Edit','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(99,5,0,84,'/pages/account-settings',NULL,'Account Settings','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(100,6,0,84,'/pages/profile',NULL,'User Profile','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(101,7,0,84,'/pages/invoice',NULL,'Invoice','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(102,8,0,84,'/pages/error',NULL,'Error','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(103,9,0,84,'/pages/comingsoon',NULL,'Coming Soon','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(104,10,0,84,'/pages/maintenance',NULL,'Maintenance','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(105,11,0,84,'/pages/gallery',NULL,'Gallery','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(106,12,0,84,'/pages/search',NULL,'Search','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(107,13,0,84,'/pages/faq',NULL,'FAQ','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(108,14,0,84,'/pages/kb',NULL,'Knowlege Base','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(109,30,0,NULL,'https://pixinvent.com/apex-angular-4-bootstrap-admin-template/documentation',NULL,'Documentation','ft-book',NULL,1,'Extra',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(110,31,0,NULL,'https://pixinvent.ticksy.com/',NULL,'Support','ft-life-buoy',NULL,1,'Extra',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:13:45',1,1),(111,4,1,NULL,NULL,NULL,'Admin Setup','ft-package','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(112,1,1,111,'/application/customDataTable','company','Company','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(117,1,1,NULL,NULL,NULL,'ERP Settings','fa-th-list','has-sub',0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(118,2,1,117,NULL,NULL,'Company Master',NULL,NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(119,1,1,117,'/customfields','customfield','Fields management','fa-layers',NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(120,3,1,117,'/module','module','Module Management','fa-layers',NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(121,1,1,NULL,'https://docs.google.com/spreadsheets/d/1z4FfYESmLUXTXTeR9M9keZKF5Kz0Bk2RHNCn7QstWY8/edit?ts=5f19dc23#gid=1445642778',NULL,'MiniERP Timelines','ft-file-text',NULL,1,'Extra',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(122,2,1,NULL,'https://docs.google.com/document/d/1yz04xsrsIsj7qUAf52suPR0fsTHHxGAdlAGnhfxiFAc/edit',NULL,'MiniERP Document','icon-docs',NULL,1,'Extra',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(123,2,1,111,'/statutorydetails','statutorydetails','Statutory Details','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(124,4,1,111,'/application/customDataTable','branch','Branch','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(125,5,1,111,'/application/customDataTable','department','Department','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(126,6,1,111,'/application/customDataTable','designation','Designation','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(127,7,1,111,'/application/customDataTable','employee','Employee','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(128,8,1,111,'/statutoryModule','statutorymodule','Statutory Module Mapping','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(129,9,1,111,'/application/customDataTable','role','Role Management','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(130,10,1,111,'/application/customDataTable','api/user','User Master','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 13:00:02',1,1),(131,11,1,111,'/branchUserRole','branchuserrole','Branch User Role','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(132,3,1,111,'/application/customDataTable','zone','Zones','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(145,1,1,152,'/itemgroup','itemgroup','Item Group','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(146,2,1,152,'/servicegroup','servicegroup','Service Group','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(147,3,1,152,'/custgroup','customergroup','Customer Group','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(148,4,1,152,'/vendgroup','vendgroup','Vendor Group','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(149,2,1,144,NULL,NULL,'Item Specification','ft-arrow-right submenu-icon','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(150,1,1,149,'/spectitle','spectitle','Specs Label','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(151,2,1,149,'/specdata','specdata','Specs Master','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(152,1,1,144,NULL,NULL,'Groups','ft-arrow-right submenu-icon','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(153,3,1,144,'/items','items','Items','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(154,4,1,144,'/services','services','Services','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(155,5,1,144,'/bom','bom','Bill of Material','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(156,6,1,144,'/customer','customer','Customers','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(157,7,1,144,'/vendor','vendor','Vendors','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(158,8,1,144,'/exphead','exphead','Expense Head','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(159,9,1,144,'/itemlocation','itemlocation','Item Location','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(161,5,1,85,'/pages/subdomain','subdomain','Subdomain','ft-arrow-right submenu-icon',NULL,0,'Pages',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(162,6,1,117,'/generalSettings',NULL,'Company Level Settings','fa-cog',NULL,0,'Settings',NULL,NULL,'vertical',1,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(163,1,1,167,'/smtpSettings',NULL,'Email SMTP Settings','ft-aperture','',0,'Settings',NULL,NULL,'horizontal',1,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(165,2,1,167,'/pushNotifications',NULL,'Push Notifications','ft-aperture',NULL,0,'Settings',NULL,NULL,'vertical',1,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(167,2,1,NULL,NULL,NULL,'General Settings','fa-th-list','has-sub',0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(168,3,1,167,'/whatsappPushMessages',NULL,'WhatsApp Push Messages','fa-th-list','',0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(169,2,1,117,NULL,NULL,'New Module Management','fa-th-list','has-sub',0,'Settings',NULL,NULL,'vertical',1,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(180,6,1,NULL,NULL,NULL,'Libraries','icon-doc','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-08-06 07:29:15',1,1),(181,1,1,180,'/application/customCardList','industry-types','Industry Types','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'card-list',1,'2021-04-12 11:33:58',1,'2021-04-19 08:35:20',1,1),(182,2,1,199,'/application/customDataTable','job-profiles','Job Descriptions','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:52:20',1,1),(183,3,1,180,'/application/customDataTable','assessment-questionnaires','Assessment Questions','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:52:20',1,1),(187,1,1,199,'/application/customDataTable','job-roles','Job Roles','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'card-list',1,'2021-04-12 11:33:58',1,'2021-04-19 08:52:20',1,1),(188,2,1,180,'/application/customCardList','skills','Skills','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'card-list',1,'2021-04-12 11:33:58',1,'2021-04-19 08:50:27',1,1),(189,3,1,199,'/application/customDataTable','assessment-tests','Assessment Tests','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:53:25',1,1),(190,4,1,180,'/application/customDataTable','general-questions','General Questions','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:52:20',1,1),(191,6,1,NULL,NULL,NULL,'Module Setup','fa-th-list','has-sub',0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(192,1,1,191,'/moduleEntries','module','Module Entries','fa-th-list',NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(193,2,1,191,'/buttons','buttons','Buttons','fa-th-list',NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(194,3,1,191,NULL,'actions','Actions','fa-th-list',NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(195,4,1,191,NULL,'statusDetails','Status Details','fa-th-list',NULL,0,'Settings',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(197,5,1,199,'/application/customDataTable','jobPosting','Job Postings','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:52:20',1,1),(198,4,1,199,'/application/customDataTable','interview','Interviews','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:53:25',1,1),(199,6,1,NULL,NULL,NULL,'Job Profiles','ft-list','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(200,7,1,NULL,NULL,NULL,'Candidates','ft-user','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-12 12:33:07',1,1),(201,1,1,200,'/application/customDataTable','candidates','Candidates Applications','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 08:53:25',1,1),(202,2,0,200,'/results','results','Results','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:15:23',1,1),(203,12,1,111,'/application/customDataTable','type','Type','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 11:51:35',1,1),(204,1,1,NULL,'/portal/candidate-registration','candidates','Application Form','ft-arrow-right submenu-icon',NULL,0,'Portal',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:28:23',1,1),(205,1,1,NULL,'/portal/candidate-profile-complete-form','candidates','Complete Your Application','ft-arrow-right submenu-icon',NULL,0,'Portal',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-04-12 11:33:58',1,'2021-04-19 14:28:23',1,1),(206,5,0,NULL,NULL,NULL,'Standard Masters','ft-package','has-sub',0,'Master',NULL,NULL,'horizontal',2,NULL,NULL,1,'2021-04-12 11:33:58',1,'2021-04-19 14:15:23',1,1),(207,3,1,206,'/country','country','Country','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,NULL,1,'2021-04-12 11:33:58',1,'2021-07-10 05:31:43',1,1),(208,4,1,206,'/state','state','State','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,NULL,1,'2021-04-12 11:33:58',1,'2021-07-10 05:31:43',1,1),(209,5,1,206,'/city','city','City','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,NULL,1,'2021-04-12 11:33:58',1,'2021-07-10 05:31:43',1,1),(210,5,1,180,'/questionSet','questionSet','Question Set','ft-arrow-right submenu-icon',NULL,0,'Master',NULL,NULL,'horizontal',2,NULL,'pagination',1,'2021-08-03 18:29:33',1,'2021-08-03 18:36:19',1,1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification_date` datetime DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `ref_doc_id` bigint DEFAULT NULL,
  `ref_type` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `module_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'2020-11-11 15:09:02',1,2,'Approval',0,132,5),(2,'2020-11-11 15:09:02',1,2,'Approval',0,132,6),(3,'2020-11-11 15:32:42',2,2,'Approval',0,132,7),(4,'2020-11-11 15:32:42',2,2,'Approval',0,132,8),(6,'2020-11-11 15:48:27',2,2,'Recheck',0,132,1),(7,'2020-11-11 18:02:04',1,3,'Approved',1,132,1),(8,'2020-11-11 18:02:04',1,3,'Approved',1,132,5),(9,'2020-11-11 18:02:04',1,3,'Approved',1,132,6),(10,'2020-11-11 18:14:14',1,3,'Returned',1,132,7),(11,'2020-11-11 18:20:59',1,5,'Approval',0,132,5),(12,'2020-11-11 18:20:59',1,5,'Approval',0,132,6),(13,'2020-11-11 18:22:15',1,5,'Returned',1,132,1),(14,'2020-11-11 18:32:57',1,5,'Approval',0,132,5),(15,'2020-11-11 18:32:57',1,5,'Approval',0,132,6),(16,'2020-11-11 18:34:06',2,5,'Approval',0,132,7),(17,'2020-11-11 18:34:06',2,5,'Approval',0,132,8);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `default_value` tinyint DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `custom_field_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_customFields_options` (`custom_field_id`),
  CONSTRAINT `FK_customFields_options` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'2','Active',1,1,13),(2,'1','Inactive',0,1,13),(3,'Yes','Yes',0,1,14),(4,'No','No',1,1,14),(5,'1','Text',0,1,46),(6,'2','Number',0,1,46),(7,'3','Select',0,1,46),(8,'4','Auto Completer',0,1,46),(9,'5','Date',0,1,46),(10,'6','Date Range',0,1,46),(11,'7','Time',0,1,46),(12,'8','Time Range',0,1,46),(13,'9','Date Time',0,1,46),(14,'10','Date Time Range',0,1,46),(15,'11','Text Area',0,1,46),(16,'12','Static Text',0,1,46),(17,'13','Text Editor',0,1,46),(18,'14','Section',0,1,46),(19,'15','Table',0,1,46),(20,'16','Radio',0,1,46),(21,'17','File Uploader',0,1,46),(22,'18','Hidden',0,1,46),(23,'19','Email',0,1,46),(24,'21','Multi-Select',0,1,46),(25,'23','Multi-File Uploader',0,1,46),(26,'24','Check Box',0,1,46),(27,'25','Tabs',0,1,46),(28,'1','Text',1,1,47),(29,'2','Number',0,1,47),(30,'3','Select',0,1,47),(31,'5','Date',0,1,47),(32,'7','Time',0,1,47),(33,'11','Textarea',0,1,47),(34,'19','Email',0,1,47),(35,'false','No',0,1,52),(36,'true','Yes',1,1,52),(37,'2','Active',1,1,53),(38,'1','Inactive',0,1,53),(39,'Not Required','No',1,1,48),(40,'required','Yes',0,1,48),(41,'Auto','Auto',0,1,56),(42,'Manual','Manual',1,1,56),(43,'AutoGenerate','Auto Generate',0,1,56),(44,'AutoPopulate','Auto Populate',0,1,56),(45,'true','Yes',1,1,60),(46,'false','No',0,1,60),(49,'Not Required','No',1,1,65),(50,'required','Yes',0,1,65),(51,'2','Active',1,1,76),(52,'1','Inactive',0,1,76),(53,'2','Active',1,1,77),(54,'1','Inactive',0,1,77),(55,'false','No',1,1,78),(56,'true','Yes',0,1,78),(59,'popover','Pop Over',0,1,80),(60,'popover','Pop Over',0,1,81),(61,'hover','On Hover',0,1,86),(62,'hover','On Hover',0,1,87),(63,'false','No',1,1,88),(64,'true','Yes',0,1,88),(65,'false','No',1,1,90),(66,'true','Yes',0,1,90),(67,'maxlength','Maximum Length',0,1,93),(68,'minlength','Minimum Length',0,1,93),(69,'pattern','Pattern Match',0,1,93),(70,'2','Active',1,1,96),(71,'1','Inactive',0,1,96),(72,'2','Active',1,1,110),(73,'1','Inactive',0,1,110),(74,'2','Active',1,1,116),(75,'1','Inactive',0,1,116),(78,'2','Active',1,1,163),(79,'1','Inactive',0,1,163),(80,'2','Active',1,1,168),(81,'1','Inactive',0,1,168),(85,'true','Yes',0,1,183),(86,'false','No',0,1,183),(87,'true','Yes',0,1,184),(88,'false','No',0,1,184),(89,'1','Text',0,1,185),(90,'2','Number',0,1,185),(91,'true','Yes',0,1,186),(92,'false','No',0,1,186),(93,'true','Yes',0,1,187),(94,'false','No',0,1,187),(95,'Auto','Auto',0,1,193),(96,'Manual','Manual',1,1,193),(97,'AutoGenerate','Auto Generate',0,1,193),(98,'AutoPopulate','Auto Populate',0,1,193),(99,'26','Object',0,1,46),(100,'27','MultipleCheck Box',0,1,46),(101,'2','Active',1,1,203),(102,'1','Inactive',0,1,203),(103,'false','No',1,1,218),(104,'true','Yes',0,1,218),(105,'M','Male',0,1,221),(106,'F','Female',0,1,221),(107,'T','Trans-Gender',0,1,221),(108,'2','Active',1,1,222),(109,'1','Inactive',0,1,222),(110,'28','Password',0,1,46),(111,'passwordMatchValidator','Password Match Validation',0,1,93),(112,'2','Active',1,1,232),(113,'1','Inactive',0,1,232),(130,'Beginner','Beginner',1,1,335),(131,'Intermediate','Intermediate',0,1,335),(132,'3','Single Select',0,1,336),(133,'21','Multi Select',0,1,336),(134,'1','Text Input',1,1,336),(135,'Expert','Expert',0,1,335),(139,'2','Active',1,1,334),(140,'1','Inactive',0,1,334),(141,'2','Active',1,1,341),(142,'1','Inactive',0,1,341),(143,'true','Yes',1,1,342),(144,'false','No',0,1,342),(145,'2','Active',1,1,350),(146,'1','Inactive',0,1,350),(149,'2','Active',1,1,361),(150,'1','Inactive',0,1,361),(158,'2','Active',1,1,381),(159,'1','Inactive',0,1,381),(160,'WholeQuestionSet','Whole Question Set',1,1,388),(161,'PerQuestion','Per Question',0,1,388),(162,'true','Yes',1,1,390),(163,'false','No',0,1,390),(164,'2','Active',1,1,393),(165,'1','Inactive',0,1,393),(166,'2','Active',1,1,403),(167,'1','Inactive',0,1,403),(168,'3 Months','3 Months',0,1,404),(169,'6 Month','6 Month',0,1,404),(170,'1 Year','1 Year',1,1,404),(171,'2 Years','2 Years',0,1,404),(172,'3 Years','3 Years',0,1,404),(173,'5 Years','5 Years',0,1,404),(174,'6-7 Years','6 - 7 Years',0,1,404),(175,'Day Shift','Day Shift',1,1,407),(176,'Night Shift','Night Shift',0,1,407),(177,'Full Time','Full Time',1,1,409),(178,'Part Time','Part Time',0,1,409),(179,'Yes, Due to Covid 19','Yes, Due To Covid 19',0,1,410),(180,'No','No',1,1,410),(181,'Yes','Yes',0,1,410),(182,'29','Tag',0,1,46),(183,'30','Slider',0,1,46),(184,'true','Yes',1,1,411),(185,'false','No',0,1,411),(186,'true','Yes',1,1,412),(187,'false','No',0,1,412),(188,'true','Yes',1,1,413),(189,'false','No',0,1,413),(190,'31','Switch',0,1,46),(191,'text_box','Text Box',1,1,419),(192,'video_input','Video Input',0,1,419),(193,'audio_input','Audio Input',0,1,419),(199,'32','Wizard Step',0,1,46),(200,'WALKIN','Walkin',1,1,459),(201,'APPLY_ONLINE','Apply Online',1,1,459),(202,'APPLY_WITH_ASSESSMENT','Apply With Assessment',1,1,459),(203,'OFFLINE_INTERVIEW','Offline Interview',1,1,460),(204,'ONLINE_ONE_WAY_INTERVIEW','Online One Way Interview',0,1,460),(205,'2','Active',1,1,468),(206,'1','Inactive',0,1,468),(207,'33','Card Selector',0,1,46),(210,'InterviewQuestion','Interview Question',1,1,471),(211,'GeneralQuestion','General Question',0,1,471),(212,'2','Active',1,1,488),(213,'1','Inactive',0,1,488),(214,'true','Yes',1,1,498),(215,'false','No',0,1,498),(216,'offline','Offline',0,1,503),(217,'online','Online',1,1,503),(218,'MONTH','Month',1,1,505),(219,'YEAR','Year',0,1,505),(220,'2','Active',1,1,509),(221,'1','Inactive',0,1,509),(222,'MONTH','Month',1,1,514),(223,'YEAR','Year',0,1,514),(224,'MONTH','Month',1,1,515),(225,'YEAR','Year',0,1,515),(226,'MONTH','Month',1,1,538),(227,'YEAR','Year',0,1,538),(228,'34','Audio',0,1,336),(229,'35','Video',0,1,336),(230,'2','Active',1,1,544),(231,'1','Inactive',0,1,544),(232,'MONTH','Month',1,1,560),(233,'YEAR','Year',0,1,560),(234,'MONTH','Month',1,1,562),(235,'YEAR','Year',0,1,562),(236,'MONTH','Month',0,1,658),(237,'YEAR','Year',0,1,658),(238,'MONTH','Month',0,1,676),(239,'YEAR','Year',0,1,676),(242,'198','Interview',0,1,704),(243,'189','Assessment',0,1,704),(244,'telephonic','Telephonic',0,1,704),(245,'faceToface','FaceToFace',0,1,704);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_mappings`
--

DROP TABLE IF EXISTS `questionnaire_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_mappings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_profile_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL,
  `question_quantity` int NOT NULL,
  `difficulty_level` varchar(60) NOT NULL,
  `time_out_duration` int DEFAULT NULL,
  `weight_per_question` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_mappings_1_idx` (`job_profile_id`),
  KEY `fk_question_mappings_2_idx` (`skill_id`),
  CONSTRAINT `fk_question_mappings_1` FOREIGN KEY (`job_profile_id`) REFERENCES `job_profiles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_question_mappings_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_mappings`
--

LOCK TABLES `questionnaire_mappings` WRITE;
/*!40000 ALTER TABLE `questionnaire_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaire_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_options`
--

DROP TABLE IF EXISTS `questionnaire_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionnaire_id` bigint DEFAULT NULL,
  `option_name` varchar(1000) DEFAULT NULL,
  `status` bigint DEFAULT '1',
  `correct_option` tinyint DEFAULT NULL,
  `option_weight` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_options`
--

LOCK TABLES `questionnaire_options` WRITE;
/*!40000 ALTER TABLE `questionnaire_options` DISABLE KEYS */;
INSERT INTO `questionnaire_options` VALUES (19,20,'int myArray [] = {1, 3, 5}; ',1,1,NULL),(20,20,'int myArray [] [] = {1,2,3,4}; ',1,0,NULL),(21,20,'int [] myArray = (5, 4, 3); ',1,0,NULL),(22,20,' int [] myArray = {“1”, “2”, “3”};',1,0,NULL),(23,21,'array',1,1,NULL),(24,21,'goto',1,0,NULL),(25,21,'null',1,0,NULL),(26,21,'int',1,0,NULL),(27,31,'14',2,1,1),(28,31,'12',2,1,1),(29,32,'test',2,0,1),(30,33,'YEs',2,1,-3),(31,34,'Data hinding+ abstraction',2,1,1);
/*!40000 ALTER TABLE `questionnaire_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_settings`
--

DROP TABLE IF EXISTS `questionnaire_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_custom_field` (`custom_field_id`),
  KEY `FK_user_questionnaireSettings_createdBy_idx` (`created_by`),
  KEY `FK_user_questionnaireSettings_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_questionnaireSettings_idx` (`company_id`),
  KEY `FK_branch_questionnaireSettings_idx` (`branch_id`),
  CONSTRAINT `FK_branch_questionnaireSettings` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_questionnaireSettings` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_custom_field` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`),
  CONSTRAINT `FK_user_questionnaireSettings_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_questionnaireSettings_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_settings`
--

LOCK TABLES `questionnaire_settings` WRITE;
/*!40000 ALTER TABLE `questionnaire_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaire_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_skills_mapping`
--

DROP TABLE IF EXISTS `questionnaire_skills_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_skills_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionnaire_id` bigint DEFAULT NULL,
  `skill_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_skills_mapping`
--

LOCK TABLES `questionnaire_skills_mapping` WRITE;
/*!40000 ALTER TABLE `questionnaire_skills_mapping` DISABLE KEYS */;
INSERT INTO `questionnaire_skills_mapping` VALUES (93,20,30),(94,21,30),(95,22,30),(96,23,30),(97,23,32),(98,24,30),(99,24,32),(100,25,30),(101,25,32),(102,26,30),(103,26,32),(104,27,8),(105,27,9),(106,27,24),(107,27,39),(108,27,32),(109,27,30),(110,28,32),(111,31,30),(112,31,39),(113,31,37),(114,32,10),(115,33,37),(116,33,36),(117,34,30),(118,34,32),(119,34,37),(120,34,39),(121,34,41),(122,34,15);
/*!40000 ALTER TABLE `questionnaire_skills_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaires`
--

DROP TABLE IF EXISTS `questionnaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaires` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `difficulty_level` varchar(100) NOT NULL,
  `question_type` varchar(100) NOT NULL,
  `question` varchar(500) NOT NULL,
  `description` mediumtext,
  `status` bigint DEFAULT '1',
  `answer_explanation` text,
  `time_limit` int DEFAULT NULL,
  `negetive_mark_factor` double NOT NULL DEFAULT '0',
  `marks` int NOT NULL,
  `question_category_type_id` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  KEY `question_category_type_id` (`question_category_type_id`),
  CONSTRAINT `questionnaires_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `questionnaires_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `questionnaires_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `questionnaires_ibfk_4` FOREIGN KEY (`question_category_type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaires`
--

LOCK TABLES `questionnaires` WRITE;
/*!40000 ALTER TABLE `questionnaires` DISABLE KEYS */;
INSERT INTO `questionnaires` VALUES (20,'Beginner','3','Which of the below is valid way to instantiate an array in java?','<p>Description of the question to the candidate</p>',1,'Answer Explaination ',30,0,10,5,NULL,'2021-01-16 16:19:12',NULL,'2021-07-06 13:36:24',NULL,NULL),(21,'Beginner','3','Which of the below are reserved keyword in Java?',NULL,2,'Answer Explaination',30,0,10,5,NULL,'2021-01-16 16:21:18',NULL,'2021-07-06 13:36:13',NULL,NULL),(22,'Intermediate','35','How you deal with work pressure?','<p>Description</p>',2,'Answer Explation',300,0,15,7,NULL,'2021-01-16 16:22:43',NULL,'2021-04-19 12:13:36',NULL,NULL),(23,'Beginner','1','What is inheritance in Java?',NULL,2,NULL,60,0,2,5,NULL,'2021-07-06 13:24:56',NULL,'2021-07-06 13:24:56',NULL,NULL),(24,'Beginner','1','What is collection in java? Explain with example',NULL,2,NULL,120,0,2,5,NULL,'2021-07-06 13:26:15',NULL,'2021-07-06 13:26:15',NULL,NULL),(25,'Beginner','1','How to initialize array in java?',NULL,2,NULL,120,0,2,5,NULL,'2021-07-06 13:27:04',NULL,'2021-07-06 13:27:04',NULL,NULL),(26,'Beginner','1',' Why multiple inheritance is not supported in java?',NULL,2,NULL,120,0,2,5,NULL,'2021-07-06 13:29:56',NULL,'2021-07-06 13:29:56',NULL,NULL),(27,'Intermediate','1','What is the base class for all the classes?',NULL,2,NULL,120,0,2,5,NULL,'2021-07-06 13:35:52',NULL,'2021-07-06 13:35:52',NULL,NULL),(28,'Beginner','1','Test question',NULL,2,NULL,60,0,2,4,NULL,'2021-07-15 23:30:13',NULL,'2021-07-15 23:30:13',NULL,NULL),(31,'Beginner','21','if one person do the work in 10 days, two person will take time..?',NULL,2,'All about the maths reasioning',60,0,50,4,NULL,'2021-07-24 16:57:28',NULL,'2021-07-27 18:03:12',NULL,NULL),(32,'Beginner','21','test',NULL,2,'x',12,0,12,6,NULL,'2021-08-01 15:18:48',NULL,'2021-08-01 15:18:48',NULL,NULL),(33,'Beginner','3','Question Demo',NULL,2,'Demo',60,0,60,5,NULL,'2021-08-02 13:53:05',NULL,'2021-08-02 13:53:05',NULL,NULL),(34,'Beginner','3','What is Encapsulation','<p>All about the Core java</p>',2,'binding the data as well as protect the data from unauthorised user',60,1,50,4,NULL,'2021-08-02 15:02:49',NULL,'2021-08-07 09:56:40',NULL,NULL);
/*!40000 ALTER TABLE `questionnaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_action_id` bigint DEFAULT NULL,
  `permission` tinyint DEFAULT '0',
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_roles_rolePermission` (`role_id`),
  KEY `FK_moduleActions_rolePermission_idx` (`module_action_id`),
  CONSTRAINT `FK_moduleActions_rolePermission` FOREIGN KEY (`module_action_id`) REFERENCES `module_actions_mapping` (`id`),
  CONSTRAINT `Fk_roles_rolePermission` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8825 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1,1,NULL),(2,2,1,NULL),(3,3,1,NULL),(4,4,1,NULL),(5,5,1,NULL),(6,6,1,NULL),(7,7,1,NULL),(8,8,1,NULL),(9,9,1,NULL),(10,10,1,NULL),(11,11,1,NULL),(12,12,1,NULL),(13,13,1,10),(14,14,1,NULL),(15,15,1,NULL),(16,16,1,NULL),(17,17,1,NULL),(18,18,1,NULL),(19,19,1,NULL),(20,20,1,NULL),(21,21,1,NULL),(22,22,1,NULL),(23,23,1,NULL),(24,24,1,NULL),(25,25,1,NULL),(26,26,1,NULL),(27,27,1,NULL),(28,28,1,NULL),(29,29,1,NULL),(30,30,1,NULL),(31,31,1,NULL),(32,32,1,NULL),(33,33,1,NULL),(34,34,1,NULL),(35,35,1,NULL),(36,36,1,NULL),(37,37,1,NULL),(38,38,1,NULL),(39,39,1,NULL),(40,40,1,NULL),(41,41,1,NULL),(42,42,1,NULL),(43,43,1,NULL),(44,44,1,NULL),(45,45,1,NULL),(46,46,1,NULL),(47,47,1,NULL),(48,48,1,NULL),(49,49,1,NULL),(50,50,1,NULL),(51,51,1,NULL),(52,52,1,NULL),(53,53,1,NULL),(54,54,1,NULL),(55,55,1,NULL),(56,56,1,NULL),(57,57,1,NULL),(58,58,1,NULL),(59,59,1,NULL),(60,60,1,NULL),(61,61,1,NULL),(62,62,1,NULL),(63,63,1,NULL),(64,64,1,NULL),(65,65,1,NULL),(66,66,1,NULL),(67,67,1,NULL),(68,68,1,NULL),(69,69,1,NULL),(70,70,1,NULL),(71,71,1,NULL),(72,72,1,NULL),(73,73,1,NULL),(74,74,1,NULL),(75,75,1,NULL),(76,76,1,NULL),(77,77,1,NULL),(78,78,1,NULL),(79,79,1,NULL),(80,80,1,NULL),(81,81,1,NULL),(82,82,1,NULL),(83,83,1,NULL),(84,84,1,NULL),(85,85,1,NULL),(86,86,1,NULL),(87,87,1,NULL),(88,88,1,NULL),(89,89,1,NULL),(90,90,1,NULL),(91,91,1,10),(95,95,1,10),(96,96,1,10),(97,97,1,10),(98,98,1,10),(99,99,1,10),(100,100,1,10),(101,101,1,10),(102,102,1,10),(103,103,1,10),(104,104,1,10),(105,105,1,10),(106,106,1,10),(107,107,1,10),(118,118,1,10),(119,119,1,10),(120,120,1,10),(121,121,1,10),(122,122,1,10),(123,123,1,10),(124,124,1,10),(125,125,1,10),(126,126,1,10),(127,127,1,10),(128,128,1,10),(129,129,1,10),(130,130,1,10),(132,256,1,NULL),(133,257,1,NULL),(134,258,1,NULL),(135,259,1,NULL),(136,260,1,NULL),(137,261,1,NULL),(138,262,1,NULL),(139,263,1,NULL),(140,264,1,NULL),(141,265,1,NULL),(142,266,1,NULL),(143,267,1,NULL),(144,268,1,10),(145,269,1,NULL),(146,270,1,NULL),(147,271,1,NULL),(148,272,1,NULL),(149,273,1,NULL),(150,274,1,NULL),(151,275,1,NULL),(152,276,1,NULL),(153,277,1,NULL),(154,278,1,NULL),(155,279,1,NULL),(156,280,1,NULL),(157,281,1,NULL),(158,282,1,NULL),(159,283,1,NULL),(160,284,1,NULL),(161,285,1,NULL),(162,286,1,NULL),(163,287,1,NULL),(164,288,1,NULL),(165,289,1,NULL),(166,290,1,NULL),(167,291,1,NULL),(168,292,1,NULL),(169,293,1,NULL),(170,294,1,NULL),(171,295,1,NULL),(172,296,1,NULL),(173,297,1,NULL),(174,298,1,NULL),(175,299,1,NULL),(176,300,1,NULL),(177,301,1,NULL),(178,302,1,NULL),(179,303,1,NULL),(180,304,1,NULL),(181,305,1,NULL),(182,306,1,NULL),(183,307,1,NULL),(184,308,1,NULL),(185,309,1,NULL),(186,310,1,NULL),(187,311,1,NULL),(188,312,1,NULL),(189,313,1,NULL),(190,314,1,NULL),(191,315,1,NULL),(192,316,1,NULL),(193,317,1,NULL),(194,318,1,NULL),(195,319,1,NULL),(196,320,1,NULL),(197,321,1,NULL),(198,322,1,NULL),(199,323,1,NULL),(200,324,1,NULL),(201,325,1,NULL),(202,326,1,NULL),(203,327,1,NULL),(204,328,1,NULL),(205,329,1,NULL),(206,330,1,NULL),(207,331,1,NULL),(208,332,1,NULL),(209,333,1,NULL),(210,334,1,NULL),(211,335,1,NULL),(212,336,1,NULL),(213,337,1,NULL),(214,338,1,NULL),(215,339,1,NULL),(216,340,1,NULL),(217,341,1,NULL),(218,342,1,NULL),(219,343,1,NULL),(220,344,1,NULL),(221,345,1,NULL),(222,346,1,10),(226,350,1,10),(227,351,1,10),(228,352,1,10),(229,353,1,10),(230,354,1,10),(231,355,1,10),(232,356,1,10),(233,357,1,10),(234,358,1,10),(235,359,1,10),(236,360,1,10),(237,361,1,10),(238,362,1,10),(249,373,1,10),(250,374,1,10),(251,375,1,10),(252,376,1,10),(253,377,1,10),(254,378,1,10),(255,379,1,10),(256,380,1,10),(257,381,1,10),(258,382,1,10),(259,383,1,10),(260,384,1,10),(261,385,1,10),(263,511,1,NULL),(264,512,1,NULL),(265,513,1,NULL),(266,514,1,NULL),(267,515,1,NULL),(268,516,1,NULL),(269,517,1,NULL),(270,518,1,NULL),(271,519,1,NULL),(272,520,1,NULL),(273,521,1,NULL),(274,522,1,NULL),(275,523,1,10),(276,524,1,NULL),(277,525,1,NULL),(278,526,1,NULL),(279,527,1,NULL),(280,528,1,NULL),(281,529,1,NULL),(282,530,1,NULL),(283,531,1,NULL),(284,532,1,NULL),(285,533,1,NULL),(286,534,1,NULL),(287,535,1,NULL),(288,536,1,NULL),(289,537,1,NULL),(290,538,1,NULL),(291,539,1,NULL),(292,540,1,NULL),(293,541,1,NULL),(294,542,1,NULL),(295,543,1,NULL),(296,544,1,NULL),(297,545,1,NULL),(298,546,1,NULL),(299,547,1,NULL),(300,548,1,NULL),(301,549,1,NULL),(302,550,1,NULL),(303,551,1,NULL),(304,552,1,NULL),(305,553,1,NULL),(306,554,1,NULL),(307,555,1,NULL),(308,556,1,NULL),(309,557,1,NULL),(310,558,1,NULL),(311,559,1,NULL),(312,560,1,NULL),(313,561,1,NULL),(314,562,1,NULL),(315,563,1,NULL),(316,564,1,NULL),(317,565,1,NULL),(318,566,1,NULL),(319,567,1,NULL),(320,568,1,NULL),(321,569,1,NULL),(322,570,1,NULL),(323,571,1,NULL),(324,572,1,NULL),(325,573,1,NULL),(326,574,1,NULL),(327,575,1,NULL),(328,576,1,NULL),(329,577,1,NULL),(330,578,1,NULL),(331,579,1,NULL),(332,580,1,NULL),(333,581,1,NULL),(334,582,1,NULL),(335,583,1,NULL),(336,584,1,NULL),(337,585,1,NULL),(338,586,1,NULL),(339,587,1,NULL),(340,588,1,NULL),(341,589,1,NULL),(342,590,1,NULL),(343,591,1,NULL),(344,592,1,NULL),(345,593,1,NULL),(346,594,1,NULL),(347,595,1,NULL),(348,596,1,NULL),(349,597,1,NULL),(350,598,1,NULL),(351,599,1,NULL),(352,600,1,NULL),(353,601,1,10),(357,605,1,10),(358,606,1,10),(359,607,1,10),(360,608,1,10),(361,609,1,10),(362,610,1,10),(363,611,1,10),(364,612,1,10),(365,613,1,10),(366,614,1,10),(367,615,1,10),(368,616,1,10),(369,617,1,10),(380,628,1,10),(381,629,1,10),(382,630,1,10),(383,631,1,10),(384,632,1,10),(385,633,1,10),(386,634,1,10),(387,635,1,10),(388,636,1,10),(389,637,1,10),(390,638,1,10),(391,639,1,10),(392,640,1,10),(394,766,1,NULL),(395,767,1,NULL),(396,768,1,NULL),(397,769,1,NULL),(398,770,1,NULL),(399,771,1,NULL),(400,772,1,NULL),(401,773,1,NULL),(402,774,1,NULL),(403,775,1,NULL),(404,776,1,NULL),(405,777,1,NULL),(406,778,1,10),(407,779,1,NULL),(408,780,1,NULL),(409,781,1,NULL),(410,782,1,NULL),(411,783,1,NULL),(412,784,1,NULL),(413,785,1,NULL),(414,786,1,NULL),(415,787,1,NULL),(416,788,1,NULL),(417,789,1,NULL),(418,790,1,NULL),(419,791,1,NULL),(420,792,1,NULL),(421,793,1,NULL),(422,794,1,NULL),(423,795,1,NULL),(424,796,1,NULL),(425,797,1,NULL),(426,798,1,NULL),(427,799,1,NULL),(428,800,1,NULL),(429,801,1,NULL),(430,802,1,NULL),(431,803,1,NULL),(432,804,1,NULL),(433,805,1,NULL),(434,806,1,NULL),(435,807,1,NULL),(436,808,1,NULL),(437,809,1,NULL),(438,810,1,NULL),(439,811,1,NULL),(440,812,1,NULL),(441,813,1,NULL),(442,814,1,NULL),(443,815,1,NULL),(444,816,1,NULL),(445,817,1,NULL),(446,818,1,NULL),(447,819,1,NULL),(448,820,1,NULL),(449,821,1,NULL),(450,822,1,NULL),(451,823,1,NULL),(452,824,1,NULL),(453,825,1,NULL),(454,826,1,NULL),(455,827,1,NULL),(456,828,1,NULL),(457,829,1,NULL),(458,830,1,NULL),(459,831,1,NULL),(460,832,1,NULL),(461,833,1,NULL),(462,834,1,NULL),(463,835,1,NULL),(464,836,1,NULL),(465,837,1,NULL),(466,838,1,NULL),(467,839,1,NULL),(468,840,1,NULL),(469,841,1,NULL),(470,842,1,NULL),(471,843,1,NULL),(472,844,1,NULL),(473,845,1,NULL),(474,846,1,NULL),(475,847,1,NULL),(476,848,1,NULL),(477,849,1,NULL),(478,850,1,NULL),(479,851,1,NULL),(480,852,1,NULL),(481,853,1,NULL),(482,854,1,NULL),(483,855,1,NULL),(484,856,1,10),(488,860,1,10),(489,861,1,10),(490,862,1,10),(491,863,1,10),(492,864,1,10),(493,865,1,10),(494,866,1,10),(495,867,1,10),(496,868,1,10),(497,869,1,10),(498,870,1,10),(499,871,1,10),(500,872,1,10),(511,883,1,10),(512,884,1,10),(513,885,1,10),(514,886,1,10),(515,887,1,10),(516,888,1,10),(517,889,1,10),(518,890,1,10),(519,891,1,10),(520,892,1,10),(521,893,1,10),(522,894,1,10),(523,895,1,10),(525,1021,1,NULL),(526,1022,1,NULL),(527,1023,1,NULL),(528,1024,1,NULL),(529,1025,1,NULL),(530,1026,1,NULL),(531,1027,1,NULL),(532,1028,1,NULL),(533,1029,1,NULL),(534,1030,1,NULL),(535,1031,1,NULL),(536,1032,1,NULL),(537,1033,1,10),(538,1034,1,NULL),(539,1035,1,NULL),(540,1036,1,NULL),(541,1037,1,NULL),(542,1038,1,NULL),(543,1039,1,NULL),(544,1040,1,NULL),(545,1041,1,NULL),(546,1042,1,NULL),(547,1043,1,NULL),(548,1044,1,NULL),(549,1045,1,NULL),(550,1046,1,NULL),(551,1047,1,NULL),(552,1048,1,NULL),(553,1049,1,NULL),(554,1050,1,NULL),(555,1051,1,NULL),(556,1052,1,NULL),(557,1053,1,NULL),(558,1054,1,NULL),(559,1055,1,NULL),(560,1056,1,NULL),(561,1057,1,NULL),(562,1058,1,NULL),(563,1059,1,NULL),(564,1060,1,NULL),(565,1061,1,NULL),(566,1062,1,NULL),(567,1063,1,NULL),(568,1064,1,NULL),(569,1065,1,NULL),(570,1066,1,NULL),(571,1067,1,NULL),(572,1068,1,NULL),(573,1069,1,NULL),(574,1070,1,NULL),(575,1071,1,NULL),(576,1072,1,NULL),(577,1073,1,NULL),(578,1074,1,NULL),(579,1075,1,NULL),(580,1076,1,NULL),(581,1077,1,NULL),(582,1078,1,NULL),(583,1079,1,NULL),(584,1080,1,NULL),(585,1081,1,NULL),(586,1082,1,NULL),(587,1083,1,NULL),(588,1084,1,NULL),(589,1085,1,NULL),(590,1086,1,NULL),(591,1087,1,NULL),(592,1088,1,NULL),(593,1089,1,NULL),(594,1090,1,NULL),(595,1091,1,NULL),(596,1092,1,NULL),(597,1093,1,NULL),(598,1094,1,NULL),(599,1095,1,NULL),(600,1096,1,NULL),(601,1097,1,NULL),(602,1098,1,NULL),(603,1099,1,NULL),(604,1100,1,NULL),(605,1101,1,NULL),(606,1102,1,NULL),(607,1103,1,NULL),(608,1104,1,NULL),(609,1105,1,NULL),(610,1106,1,NULL),(611,1107,1,NULL),(612,1108,1,NULL),(613,1109,1,NULL),(614,1110,1,NULL),(615,1111,1,10),(619,1115,1,10),(620,1116,1,10),(621,1117,1,10),(622,1118,1,10),(623,1119,1,10),(624,1120,1,10),(625,1121,1,10),(626,1122,1,10),(627,1123,1,10),(628,1124,1,10),(629,1125,1,10),(630,1126,1,10),(631,1127,1,10),(642,1138,1,10),(643,1139,1,10),(644,1140,1,10),(645,1141,1,10),(646,1142,1,10),(647,1143,1,10),(648,1144,1,10),(649,1145,1,10),(650,1146,1,10),(651,1147,1,10),(652,1148,1,10),(653,1149,1,10),(654,1150,1,10),(656,1276,1,NULL),(657,1277,1,NULL),(658,1278,1,NULL),(659,1279,1,NULL),(660,1280,1,NULL),(661,1281,1,NULL),(662,1282,1,NULL),(663,1283,1,NULL),(664,1284,1,NULL),(665,1285,1,NULL),(666,1286,1,NULL),(667,1287,1,NULL),(668,1288,1,10),(669,1289,1,NULL),(670,1290,1,NULL),(671,1291,1,NULL),(672,1292,1,NULL),(673,1293,1,NULL),(674,1294,1,NULL),(675,1295,1,NULL),(676,1296,1,NULL),(677,1297,1,NULL),(678,1298,1,NULL),(679,1299,1,NULL),(680,1300,1,NULL),(681,1301,1,NULL),(682,1302,1,NULL),(683,1303,1,NULL),(684,1304,1,NULL),(685,1305,1,NULL),(686,1306,1,NULL),(687,1307,1,NULL),(688,1308,1,NULL),(689,1309,1,NULL),(690,1310,1,NULL),(691,1311,1,NULL),(692,1312,1,NULL),(693,1313,1,NULL),(694,1314,1,NULL),(695,1315,1,NULL),(696,1316,1,NULL),(697,1317,1,NULL),(698,1318,1,NULL),(699,1319,1,NULL),(700,1320,1,NULL),(701,1321,1,NULL),(702,1322,1,NULL),(703,1323,1,NULL),(704,1324,1,NULL),(705,1325,1,NULL),(706,1326,1,NULL),(707,1327,1,NULL),(708,1328,1,NULL),(709,1329,1,NULL),(710,1330,1,NULL),(711,1331,1,NULL),(712,1332,1,NULL),(713,1333,1,NULL),(714,1334,1,NULL),(715,1335,1,NULL),(716,1336,1,NULL),(717,1337,1,NULL),(718,1338,1,NULL),(719,1339,1,NULL),(720,1340,1,NULL),(721,1341,1,NULL),(722,1342,1,NULL),(723,1343,1,NULL),(724,1344,1,NULL),(725,1345,1,NULL),(726,1346,1,NULL),(727,1347,1,NULL),(728,1348,1,NULL),(729,1349,1,NULL),(730,1350,1,NULL),(731,1351,1,NULL),(732,1352,1,NULL),(733,1353,1,NULL),(734,1354,1,NULL),(735,1355,1,NULL),(736,1356,1,NULL),(737,1357,1,NULL),(738,1358,1,NULL),(739,1359,1,NULL),(740,1360,1,NULL),(741,1361,1,NULL),(742,1362,1,NULL),(743,1363,1,NULL),(744,1364,1,NULL),(745,1365,1,NULL),(746,1366,1,10),(750,1370,1,10),(751,1371,1,10),(752,1372,1,10),(753,1373,1,10),(754,1374,1,10),(755,1375,1,10),(756,1376,1,10),(757,1377,1,10),(758,1378,1,10),(759,1379,1,10),(760,1380,1,10),(761,1381,1,10),(762,1382,1,10),(773,1393,1,10),(774,1394,1,10),(775,1395,1,10),(776,1396,1,10),(777,1397,1,10),(778,1398,1,10),(779,1399,1,10),(780,1400,1,10),(781,1401,1,10),(782,1402,1,10),(783,1403,1,10),(784,1404,1,10),(785,1405,1,10),(787,1531,1,NULL),(788,1532,1,NULL),(789,1533,1,NULL),(790,1534,1,NULL),(791,1535,1,NULL),(792,1536,1,NULL),(793,1537,1,NULL),(794,1538,1,NULL),(795,1539,1,NULL),(796,1540,1,NULL),(797,1541,1,NULL),(798,1542,1,NULL),(799,1543,1,10),(800,1544,1,NULL),(801,1545,1,NULL),(802,1546,1,NULL),(803,1547,1,NULL),(804,1548,1,NULL),(805,1549,1,NULL),(806,1550,1,NULL),(807,1551,1,NULL),(808,1552,1,NULL),(809,1553,1,NULL),(810,1554,1,NULL),(811,1555,1,NULL),(812,1556,1,NULL),(813,1557,1,NULL),(814,1558,1,NULL),(815,1559,1,NULL),(816,1560,1,NULL),(817,1561,1,NULL),(818,1562,1,NULL),(819,1563,1,NULL),(820,1564,1,NULL),(821,1565,1,NULL),(822,1566,1,NULL),(823,1567,1,NULL),(824,1568,1,NULL),(825,1569,1,NULL),(826,1570,1,NULL),(827,1571,1,NULL),(828,1572,1,NULL),(829,1573,1,NULL),(830,1574,1,NULL),(831,1575,1,NULL),(832,1576,1,NULL),(833,1577,1,NULL),(834,1578,1,NULL),(835,1579,1,NULL),(836,1580,1,NULL),(837,1581,1,NULL),(838,1582,1,NULL),(839,1583,1,NULL),(840,1584,1,NULL),(841,1585,1,NULL),(842,1586,1,NULL),(843,1587,1,NULL),(844,1588,1,NULL),(845,1589,1,NULL),(846,1590,1,NULL),(847,1591,1,NULL),(848,1592,1,NULL),(849,1593,1,NULL),(850,1594,1,NULL),(851,1595,1,NULL),(852,1596,1,NULL),(853,1597,1,NULL),(854,1598,1,NULL),(855,1599,1,NULL),(856,1600,1,NULL),(857,1601,1,NULL),(858,1602,1,NULL),(859,1603,1,NULL),(860,1604,1,NULL),(861,1605,1,NULL),(862,1606,1,NULL),(863,1607,1,NULL),(864,1608,1,NULL),(865,1609,1,NULL),(866,1610,1,NULL),(867,1611,1,NULL),(868,1612,1,NULL),(869,1613,1,NULL),(870,1614,1,NULL),(871,1615,1,NULL),(872,1616,1,NULL),(873,1617,1,NULL),(874,1618,1,NULL),(875,1619,1,NULL),(876,1620,1,NULL),(877,1621,1,10),(881,1625,1,10),(882,1626,1,10),(883,1627,1,10),(884,1628,1,10),(885,1629,1,10),(886,1630,1,10),(887,1631,1,10),(888,1632,1,10),(889,1633,1,10),(890,1634,1,10),(891,1635,1,10),(892,1636,1,10),(893,1637,1,10),(904,1648,1,10),(905,1649,1,10),(906,1650,1,10),(907,1651,1,10),(908,1652,1,10),(909,1653,1,10),(910,1654,1,10),(911,1655,1,10),(912,1656,1,10),(913,1657,1,10),(914,1658,1,10),(915,1659,1,10),(916,1660,1,10),(918,1786,1,NULL),(919,1787,1,NULL),(920,1788,1,NULL),(921,1789,1,NULL),(922,1790,1,NULL),(923,1791,1,NULL),(924,1792,1,NULL),(925,1793,1,NULL),(926,1794,1,NULL),(927,1795,1,NULL),(928,1796,1,NULL),(929,1797,1,NULL),(930,1798,1,10),(931,1799,1,NULL),(932,1800,1,NULL),(933,1801,1,NULL),(934,1802,1,NULL),(935,1803,1,NULL),(936,1804,1,NULL),(937,1805,1,NULL),(938,1806,1,NULL),(939,1807,1,NULL),(940,1808,1,NULL),(941,1809,1,NULL),(942,1810,1,NULL),(943,1811,1,NULL),(944,1812,1,NULL),(945,1813,1,NULL),(946,1814,1,NULL),(947,1815,1,NULL),(948,1816,1,NULL),(949,1817,1,NULL),(950,1818,1,NULL),(951,1819,1,NULL),(952,1820,1,NULL),(953,1821,1,NULL),(954,1822,1,NULL),(955,1823,1,NULL),(956,1824,1,NULL),(957,1825,1,NULL),(958,1826,1,NULL),(959,1827,1,NULL),(960,1828,1,NULL),(961,1829,1,NULL),(962,1830,1,NULL),(963,1831,1,NULL),(964,1832,1,NULL),(965,1833,1,NULL),(966,1834,1,NULL),(967,1835,1,NULL),(968,1836,1,NULL),(969,1837,1,NULL),(970,1838,1,NULL),(971,1839,1,NULL),(972,1840,1,NULL),(973,1841,1,NULL),(974,1842,1,NULL),(975,1843,1,NULL),(976,1844,1,NULL),(977,1845,1,NULL),(978,1846,1,NULL),(979,1847,1,NULL),(980,1848,1,NULL),(981,1849,1,NULL),(982,1850,1,NULL),(983,1851,1,NULL),(984,1852,1,NULL),(985,1853,1,NULL),(986,1854,1,NULL),(987,1855,1,NULL),(988,1856,1,NULL),(989,1857,1,NULL),(990,1858,1,NULL),(991,1859,1,NULL),(992,1860,1,NULL),(993,1861,1,NULL),(994,1862,1,NULL),(995,1863,1,NULL),(996,1864,1,NULL),(997,1865,1,NULL),(998,1866,1,NULL),(999,1867,1,NULL),(1000,1868,1,NULL),(1001,1869,1,NULL),(1002,1870,1,NULL),(1003,1871,1,NULL),(1004,1872,1,NULL),(1005,1873,1,NULL),(1006,1874,1,NULL),(1007,1875,1,NULL),(1008,1876,1,10),(1012,1880,1,10),(1013,1881,1,10),(1014,1882,1,10),(1015,1883,1,10),(1016,1884,1,10),(1017,1885,1,10),(1018,1886,1,10),(1019,1887,1,10),(1020,1888,1,10),(1021,1889,1,10),(1022,1890,1,10),(1023,1891,1,10),(1024,1892,1,10),(1035,1903,1,10),(1036,1904,1,10),(1037,1905,1,10),(1038,1906,1,10),(1039,1907,1,10),(1040,1908,1,10),(1041,1909,1,10),(1042,1910,1,10),(1043,1911,1,10),(1044,1912,1,10),(1045,1913,1,10),(1046,1914,1,10),(1047,1915,1,10),(1049,2041,1,NULL),(1050,2042,1,NULL),(1051,2043,1,NULL),(1052,2044,1,NULL),(1053,2045,1,NULL),(1054,2046,1,NULL),(1055,2047,1,NULL),(1056,2048,1,NULL),(1057,2049,1,NULL),(1058,2050,1,NULL),(1059,2051,1,NULL),(1060,2052,1,NULL),(1061,2053,1,10),(1062,2054,1,NULL),(1063,2055,1,NULL),(1064,2056,1,NULL),(1065,2057,1,NULL),(1066,2058,1,NULL),(1067,2059,1,NULL),(1068,2060,1,NULL),(1069,2061,1,NULL),(1070,2062,1,NULL),(1071,2063,1,NULL),(1072,2064,1,NULL),(1073,2065,1,NULL),(1074,2066,1,NULL),(1075,2067,1,NULL),(1076,2068,1,NULL),(1077,2069,1,NULL),(1078,2070,1,NULL),(1079,2071,1,NULL),(1080,2072,1,NULL),(1081,2073,1,NULL),(1082,2074,1,NULL),(1083,2075,1,NULL),(1084,2076,1,NULL),(1085,2077,1,NULL),(1086,2078,1,NULL),(1087,2079,1,NULL),(1088,2080,1,NULL),(1089,2081,1,NULL),(1090,2082,1,NULL),(1091,2083,1,NULL),(1092,2084,1,NULL),(1093,2085,1,NULL),(1094,2086,1,NULL),(1095,2087,1,NULL),(1096,2088,1,NULL),(1097,2089,1,NULL),(1098,2090,1,NULL),(1099,2091,1,NULL),(1100,2092,1,NULL),(1101,2093,1,NULL),(1102,2094,1,NULL),(1103,2095,1,NULL),(1104,2096,1,NULL),(1105,2097,1,NULL),(1106,2098,1,NULL),(1107,2099,1,NULL),(1108,2100,1,NULL),(1109,2101,1,NULL),(1110,2102,1,NULL),(1111,2103,1,NULL),(1112,2104,1,NULL),(1113,2105,1,NULL),(1114,2106,1,NULL),(1115,2107,1,NULL),(1116,2108,1,NULL),(1117,2109,1,NULL),(1118,2110,1,NULL),(1119,2111,1,NULL),(1120,2112,1,NULL),(1121,2113,1,NULL),(1122,2114,1,NULL),(1123,2115,1,NULL),(1124,2116,1,NULL),(1125,2117,1,NULL),(1126,2118,1,NULL),(1127,2119,1,NULL),(1128,2120,1,NULL),(1129,2121,1,NULL),(1130,2122,1,NULL),(1131,2123,1,NULL),(1132,2124,1,NULL),(1133,2125,1,NULL),(1134,2126,1,NULL),(1135,2127,1,NULL),(1136,2128,1,NULL),(1137,2129,1,NULL),(1138,2130,1,NULL),(1139,2131,1,10),(1143,2135,1,10),(1144,2136,1,10),(1145,2137,1,10),(1146,2138,1,10),(1147,2139,1,10),(1148,2140,1,10),(1149,2141,1,10),(1150,2142,1,10),(1151,2143,1,10),(1152,2144,1,10),(1153,2145,1,10),(1154,2146,1,10),(1155,2147,1,10),(1166,2158,1,10),(1167,2159,1,10),(1168,2160,1,10),(1169,2161,1,10),(1170,2162,1,10),(1171,2163,1,10),(1172,2164,1,10),(1173,2165,1,10),(1174,2166,1,10),(1175,2167,1,10),(1176,2168,1,10),(1177,2169,1,10),(1178,2170,1,10),(1180,2296,1,NULL),(1181,2297,1,NULL),(1182,2298,1,NULL),(1183,2299,1,NULL),(1184,2300,1,NULL),(1185,2301,1,NULL),(1186,2302,1,NULL),(1187,2303,1,NULL),(1188,2304,1,NULL),(1189,2305,1,NULL),(1190,2306,1,NULL),(1191,2307,1,NULL),(1192,2308,1,10),(1193,2309,1,NULL),(1194,2310,1,NULL),(1195,2311,1,NULL),(1196,2312,1,NULL),(1197,2313,1,NULL),(1198,2314,1,NULL),(1199,2315,1,NULL),(1200,2316,1,NULL),(1201,2317,1,NULL),(1202,2318,1,NULL),(1203,2319,1,NULL),(1204,2320,1,NULL),(1205,2321,1,NULL),(1206,2322,1,NULL),(1207,2323,1,NULL),(1208,2324,1,NULL),(1209,2325,1,NULL),(1210,2326,1,NULL),(1211,2327,1,NULL),(1212,2328,1,NULL),(1213,2329,1,NULL),(1214,2330,1,NULL),(1215,2331,1,NULL),(1216,2332,1,NULL),(1217,2333,1,NULL),(1218,2334,1,NULL),(1219,2335,1,NULL),(1220,2336,1,NULL),(1221,2337,1,NULL),(1222,2338,1,NULL),(1223,2339,1,NULL),(1224,2340,1,NULL),(1225,2341,1,NULL),(1226,2342,1,NULL),(1227,2343,1,NULL),(1228,2344,1,NULL),(1229,2345,1,NULL),(1230,2346,1,NULL),(1231,2347,1,NULL),(1232,2348,1,NULL),(1233,2349,1,NULL),(1234,2350,1,NULL),(1235,2351,1,NULL),(1236,2352,1,NULL),(1237,2353,1,NULL),(1238,2354,1,NULL),(1239,2355,1,NULL),(1240,2356,1,NULL),(1241,2357,1,NULL),(1242,2358,1,NULL),(1243,2359,1,NULL),(1244,2360,1,NULL),(1245,2361,1,NULL),(1246,2362,1,NULL),(1247,2363,1,NULL),(1248,2364,1,NULL),(1249,2365,1,NULL),(1250,2366,1,NULL),(1251,2367,1,NULL),(1252,2368,1,NULL),(1253,2369,1,NULL),(1254,2370,1,NULL),(1255,2371,1,NULL),(1256,2372,1,NULL),(1257,2373,1,NULL),(1258,2374,1,NULL),(1259,2375,1,NULL),(1260,2376,1,NULL),(1261,2377,1,NULL),(1262,2378,1,NULL),(1263,2379,1,NULL),(1264,2380,1,NULL),(1265,2381,1,NULL),(1266,2382,1,NULL),(1267,2383,1,NULL),(1268,2384,1,NULL),(1269,2385,1,NULL),(1270,2386,1,10),(1274,2390,1,10),(1275,2391,1,10),(1276,2392,1,10),(1277,2393,1,10),(1278,2394,1,10),(1279,2395,1,10),(1280,2396,1,10),(1281,2397,1,10),(1282,2398,1,10),(1283,2399,1,10),(1284,2400,1,10),(1285,2401,1,10),(1286,2402,1,10),(1297,2413,1,10),(1298,2414,1,10),(1299,2415,1,10),(1300,2416,1,10),(1301,2417,1,10),(1302,2418,1,10),(1303,2419,1,10),(1304,2420,1,10),(1305,2421,1,10),(1306,2422,1,10),(1307,2423,1,10),(1308,2424,1,10),(1309,2425,1,10),(1311,2551,1,NULL),(1312,2552,1,NULL),(1313,2553,1,NULL),(1314,2554,1,NULL),(1315,2555,1,NULL),(1316,2556,1,NULL),(1317,2557,1,NULL),(1318,2558,1,NULL),(1319,2559,1,NULL),(1320,2560,1,NULL),(1321,2561,1,NULL),(1322,2562,1,NULL),(1323,2563,1,10),(1324,2564,1,NULL),(1325,2565,1,NULL),(1326,2566,1,NULL),(1327,2567,1,NULL),(1328,2568,1,NULL),(1329,2569,1,NULL),(1330,2570,1,NULL),(1331,2571,1,NULL),(1332,2572,1,NULL),(1333,2573,1,NULL),(1334,2574,1,NULL),(1335,2575,1,NULL),(1336,2576,1,NULL),(1337,2577,1,NULL),(1338,2578,1,NULL),(1339,2579,1,NULL),(1340,2580,1,NULL),(1341,2581,1,NULL),(1342,2582,1,NULL),(1343,2583,1,NULL),(1344,2584,1,NULL),(1345,2585,1,NULL),(1346,2586,1,NULL),(1347,2587,1,NULL),(1348,2588,1,NULL),(1349,2589,1,NULL),(1350,2590,1,NULL),(1351,2591,1,NULL),(1352,2592,1,NULL),(1353,2593,1,NULL),(1354,2594,1,NULL),(1355,2595,1,NULL),(1356,2596,1,NULL),(1357,2597,1,NULL),(1358,2598,1,NULL),(1359,2599,1,NULL),(1360,2600,1,NULL),(1361,2601,1,NULL),(1362,2602,1,NULL),(1363,2603,1,NULL),(1364,2604,1,NULL),(1365,2605,1,NULL),(1366,2606,1,NULL),(1367,2607,1,NULL),(1368,2608,1,NULL),(1369,2609,1,NULL),(1370,2610,1,NULL),(1371,2611,1,NULL),(1372,2612,1,NULL),(1373,2613,1,NULL),(1374,2614,1,NULL),(1375,2615,1,NULL),(1376,2616,1,NULL),(1377,2617,1,NULL),(1378,2618,1,NULL),(1379,2619,1,NULL),(1380,2620,1,NULL),(1381,2621,1,NULL),(1382,2622,1,NULL),(1383,2623,1,NULL),(1384,2624,1,NULL),(1385,2625,1,NULL),(1386,2626,1,NULL),(1387,2627,1,NULL),(1388,2628,1,NULL),(1389,2629,1,NULL),(1390,2630,1,NULL),(1391,2631,1,NULL),(1392,2632,1,NULL),(1393,2633,1,NULL),(1394,2634,1,NULL),(1395,2635,1,NULL),(1396,2636,1,NULL),(1397,2637,1,NULL),(1398,2638,1,NULL),(1399,2639,1,NULL),(1400,2640,1,NULL),(1401,2641,1,10),(1405,2645,1,10),(1406,2646,1,10),(1407,2647,1,10),(1408,2648,1,10),(1409,2649,1,10),(1410,2650,1,10),(1411,2651,1,10),(1412,2652,1,10),(1413,2653,1,10),(1414,2654,1,10),(1415,2655,1,10),(1416,2656,1,10),(1417,2657,1,10),(1428,2668,1,10),(1429,2669,1,10),(1430,2670,1,10),(1431,2671,1,10),(1432,2672,1,10),(1433,2673,1,10),(1434,2674,1,10),(1435,2675,1,10),(1436,2676,1,10),(1437,2677,1,10),(1438,2678,1,10),(1439,2679,1,10),(1440,2680,1,10),(1442,2806,1,NULL),(1443,2807,1,NULL),(1444,2808,1,NULL),(1445,2809,1,NULL),(1446,2810,1,NULL),(1447,2811,1,NULL),(1448,2812,1,NULL),(1449,2813,1,NULL),(1450,2814,1,NULL),(1451,2815,1,NULL),(1452,2816,1,NULL),(1453,2817,1,NULL),(1454,2818,1,10),(1455,2819,1,NULL),(1456,2820,1,NULL),(1457,2821,1,NULL),(1458,2822,1,NULL),(1459,2823,1,NULL),(1460,2824,1,NULL),(1461,2825,1,NULL),(1462,2826,1,NULL),(1463,2827,1,NULL),(1464,2828,1,NULL),(1465,2829,1,NULL),(1466,2830,1,NULL),(1467,2831,1,NULL),(1468,2832,1,NULL),(1469,2833,1,NULL),(1470,2834,1,NULL),(1471,2835,1,NULL),(1472,2836,1,NULL),(1473,2837,1,NULL),(1474,2838,1,NULL),(1475,2839,1,NULL),(1476,2840,1,NULL),(1477,2841,1,NULL),(1478,2842,1,NULL),(1479,2843,1,NULL),(1480,2844,1,NULL),(1481,2845,1,NULL),(1482,2846,1,NULL),(1483,2847,1,NULL),(1484,2848,1,NULL),(1485,2849,1,NULL),(1486,2850,1,NULL),(1487,2851,1,NULL),(1488,2852,1,NULL),(1489,2853,1,NULL),(1490,2854,1,NULL),(1491,2855,1,NULL),(1492,2856,1,NULL),(1493,2857,1,NULL),(1494,2858,1,NULL),(1495,2859,1,NULL),(1496,2860,1,NULL),(1497,2861,1,NULL),(1498,2862,1,NULL),(1499,2863,1,NULL),(1500,2864,1,NULL),(1501,2865,1,NULL),(1502,2866,1,NULL),(1503,2867,1,NULL),(1504,2868,1,NULL),(1505,2869,1,NULL),(1506,2870,1,NULL),(1507,2871,1,NULL),(1508,2872,1,NULL),(1509,2873,1,NULL),(1510,2874,1,NULL),(1511,2875,1,NULL),(1512,2876,1,NULL),(1513,2877,1,NULL),(1514,2878,1,NULL),(1515,2879,1,NULL),(1516,2880,1,NULL),(1517,2881,1,NULL),(1518,2882,1,NULL),(1519,2883,1,NULL),(1520,2884,1,NULL),(1521,2885,1,NULL),(1522,2886,1,NULL),(1523,2887,1,NULL),(1524,2888,1,NULL),(1525,2889,1,NULL),(1526,2890,1,NULL),(1527,2891,1,NULL),(1528,2892,1,NULL),(1529,2893,1,NULL),(1530,2894,1,NULL),(1531,2895,1,NULL),(1532,2896,1,10),(1536,2900,1,10),(1537,2901,1,10),(1538,2902,1,10),(1539,2903,1,10),(1540,2904,1,10),(1541,2905,1,10),(1542,2906,1,10),(1543,2907,1,10),(1544,2908,1,10),(1545,2909,1,10),(1546,2910,1,10),(1547,2911,1,10),(1548,2912,1,10),(1559,2923,1,10),(1560,2924,1,10),(1561,2925,1,10),(1562,2926,1,10),(1563,2927,1,10),(1564,2928,1,10),(1565,2929,1,10),(1566,2930,1,10),(1567,2931,1,10),(1568,2932,1,10),(1569,2933,1,10),(1570,2934,1,10),(1571,2935,1,10),(1573,3061,1,NULL),(1574,3062,1,NULL),(1575,3063,1,NULL),(1576,3064,1,NULL),(1577,3065,1,NULL),(1578,3066,1,NULL),(1579,3067,1,NULL),(1580,3068,1,NULL),(1581,3069,1,NULL),(1582,3070,1,NULL),(1583,3071,1,NULL),(1584,3072,1,NULL),(1585,3073,1,10),(1586,3074,1,NULL),(1587,3075,1,NULL),(1588,3076,1,NULL),(1589,3077,1,NULL),(1590,3078,1,NULL),(1591,3079,1,NULL),(1592,3080,1,NULL),(1593,3081,1,NULL),(1594,3082,1,NULL),(1595,3083,1,NULL),(1596,3084,1,NULL),(1597,3085,1,NULL),(1598,3086,1,NULL),(1599,3087,1,NULL),(1600,3088,1,NULL),(1601,3089,1,NULL),(1602,3090,1,NULL),(1603,3091,1,NULL),(1604,3092,1,NULL),(1605,3093,1,NULL),(1606,3094,1,NULL),(1607,3095,1,NULL),(1608,3096,1,NULL),(1609,3097,1,NULL),(1610,3098,1,NULL),(1611,3099,1,NULL),(1612,3100,1,NULL),(1613,3101,1,NULL),(1614,3102,1,NULL),(1615,3103,1,NULL),(1616,3104,1,NULL),(1617,3105,1,NULL),(1618,3106,1,NULL),(1619,3107,1,NULL),(1620,3108,1,NULL),(1621,3109,1,NULL),(1622,3110,1,NULL),(1623,3111,1,NULL),(1624,3112,1,NULL),(1625,3113,1,NULL),(1626,3114,1,NULL),(1627,3115,1,NULL),(1628,3116,1,NULL),(1629,3117,1,NULL),(1630,3118,1,NULL),(1631,3119,1,NULL),(1632,3120,1,NULL),(1633,3121,1,NULL),(1634,3122,1,NULL),(1635,3123,1,NULL),(1636,3124,1,NULL),(1637,3125,1,NULL),(1638,3126,1,NULL),(1639,3127,1,NULL),(1640,3128,1,NULL),(1641,3129,1,NULL),(1642,3130,1,NULL),(1643,3131,1,NULL),(1644,3132,1,NULL),(1645,3133,1,NULL),(1646,3134,1,NULL),(1647,3135,1,NULL),(1648,3136,1,NULL),(1649,3137,1,NULL),(1650,3138,1,NULL),(1651,3139,1,NULL),(1652,3140,1,NULL),(1653,3141,1,NULL),(1654,3142,1,NULL),(1655,3143,1,NULL),(1656,3144,1,NULL),(1657,3145,1,NULL),(1658,3146,1,NULL),(1659,3147,1,NULL),(1660,3148,1,NULL),(1661,3149,1,NULL),(1662,3150,1,NULL),(1663,3151,1,10),(1667,3155,1,10),(1668,3156,1,10),(1669,3157,1,10),(1670,3158,1,10),(1671,3159,1,10),(1672,3160,1,10),(1673,3161,1,10),(1674,3162,1,10),(1675,3163,1,10),(1676,3164,1,10),(1677,3165,1,10),(1678,3166,1,10),(1679,3167,1,10),(1690,3178,1,10),(1691,3179,1,10),(1692,3180,1,10),(1693,3181,1,10),(1694,3182,1,10),(1695,3183,1,10),(1696,3184,1,10),(1697,3185,1,10),(1698,3186,1,10),(1699,3187,1,10),(1700,3188,1,10),(1701,3189,1,10),(1702,3190,1,10),(1704,3316,1,NULL),(1705,3317,1,NULL),(1706,3318,1,NULL),(1707,3319,1,NULL),(1708,3320,1,NULL),(1709,3321,1,NULL),(1710,3322,1,NULL),(1711,3323,1,NULL),(1712,3324,1,NULL),(1713,3325,1,NULL),(1714,3326,1,NULL),(1715,3327,1,NULL),(1716,3328,1,10),(1717,3329,1,NULL),(1718,3330,1,NULL),(1719,3331,1,NULL),(1720,3332,1,NULL),(1721,3333,1,NULL),(1722,3334,1,NULL),(1723,3335,1,NULL),(1724,3336,1,NULL),(1725,3337,1,NULL),(1726,3338,1,NULL),(1727,3339,1,NULL),(1728,3340,1,NULL),(1729,3341,1,NULL),(1730,3342,1,NULL),(1731,3343,1,NULL),(1732,3344,1,NULL),(1733,3345,1,NULL),(1734,3346,1,NULL),(1735,3347,1,NULL),(1736,3348,1,NULL),(1737,3349,1,NULL),(1738,3350,1,NULL),(1739,3351,1,NULL),(1740,3352,1,NULL),(1741,3353,1,NULL),(1742,3354,1,NULL),(1743,3355,1,NULL),(1744,3356,1,NULL),(1745,3357,1,NULL),(1746,3358,1,NULL),(1747,3359,1,NULL),(1748,3360,1,NULL),(1749,3361,1,NULL),(1750,3362,1,NULL),(1751,3363,1,NULL),(1752,3364,1,NULL),(1753,3365,1,NULL),(1754,3366,1,NULL),(1755,3367,1,NULL),(1756,3368,1,NULL),(1757,3369,1,NULL),(1758,3370,1,NULL),(1759,3371,1,NULL),(1760,3372,1,NULL),(1761,3373,1,NULL),(1762,3374,1,NULL),(1763,3375,1,NULL),(1764,3376,1,NULL),(1765,3377,1,NULL),(1766,3378,1,NULL),(1767,3379,1,NULL),(1768,3380,1,NULL),(1769,3381,1,NULL),(1770,3382,1,NULL),(1771,3383,1,NULL),(1772,3384,1,NULL),(1773,3385,1,NULL),(1774,3386,1,NULL),(1775,3387,1,NULL),(1776,3388,1,NULL),(1777,3389,1,NULL),(1778,3390,1,NULL),(1779,3391,1,NULL),(1780,3392,1,NULL),(1781,3393,1,NULL),(1782,3394,1,NULL),(1783,3395,1,NULL),(1784,3396,1,NULL),(1785,3397,1,NULL),(1786,3398,1,NULL),(1787,3399,1,NULL),(1788,3400,1,NULL),(1789,3401,1,NULL),(1790,3402,1,NULL),(1791,3403,1,NULL),(1792,3404,1,NULL),(1793,3405,1,NULL),(1794,3406,1,10),(1798,3410,1,10),(1799,3411,1,10),(1800,3412,1,10),(1801,3413,1,10),(1802,3414,1,10),(1803,3415,1,10),(1804,3416,1,10),(1805,3417,1,10),(1806,3418,1,10),(1807,3419,1,10),(1808,3420,1,10),(1809,3421,1,10),(1810,3422,1,10),(1821,3433,1,10),(1822,3434,1,10),(1823,3435,1,10),(1824,3436,1,10),(1825,3437,1,10),(1826,3438,1,10),(1827,3439,1,10),(1828,3440,1,10),(1829,3441,1,10),(1830,3442,1,10),(1831,3443,1,10),(1832,3444,1,10),(1833,3445,1,10),(1835,3571,1,NULL),(1836,3572,1,NULL),(1837,3573,1,NULL),(1838,3574,1,NULL),(1839,3575,1,NULL),(1840,3576,1,NULL),(1841,3577,1,NULL),(1842,3578,1,NULL),(1843,3579,1,NULL),(1844,3580,1,NULL),(1845,3581,1,NULL),(1846,3582,1,NULL),(1847,3583,1,10),(1848,3584,1,NULL),(1849,3585,1,NULL),(1850,3586,1,NULL),(1851,3587,1,NULL),(1852,3588,1,NULL),(1853,3589,1,NULL),(1854,3590,1,NULL),(1855,3591,1,NULL),(1856,3592,1,NULL),(1857,3593,1,NULL),(1858,3594,1,NULL),(1859,3595,1,NULL),(1860,3596,1,NULL),(1861,3597,1,NULL),(1862,3598,1,NULL),(1863,3599,1,NULL),(1864,3600,1,NULL),(1865,3601,1,NULL),(1866,3602,1,NULL),(1867,3603,1,NULL),(1868,3604,1,NULL),(1869,3605,1,NULL),(1870,3606,1,NULL),(1871,3607,1,NULL),(1872,3608,1,NULL),(1873,3609,1,NULL),(1874,3610,1,NULL),(1875,3611,1,NULL),(1876,3612,1,NULL),(1877,3613,1,NULL),(1878,3614,1,NULL),(1879,3615,1,NULL),(1880,3616,1,NULL),(1881,3617,1,NULL),(1882,3618,1,NULL),(1883,3619,1,NULL),(1884,3620,1,NULL),(1885,3621,1,NULL),(1886,3622,1,NULL),(1887,3623,1,NULL),(1888,3624,1,NULL),(1889,3625,1,NULL),(1890,3626,1,NULL),(1891,3627,1,NULL),(1892,3628,1,NULL),(1893,3629,1,NULL),(1894,3630,1,NULL),(1895,3631,1,NULL),(1896,3632,1,NULL),(1897,3633,1,NULL),(1898,3634,1,NULL),(1899,3635,1,NULL),(1900,3636,1,NULL),(1901,3637,1,NULL),(1902,3638,1,NULL),(1903,3639,1,NULL),(1904,3640,1,NULL),(1905,3641,1,NULL),(1906,3642,1,NULL),(1907,3643,1,NULL),(1908,3644,1,NULL),(1909,3645,1,NULL),(1910,3646,1,NULL),(1911,3647,1,NULL),(1912,3648,1,NULL),(1913,3649,1,NULL),(1914,3650,1,NULL),(1915,3651,1,NULL),(1916,3652,1,NULL),(1917,3653,1,NULL),(1918,3654,1,NULL),(1919,3655,1,NULL),(1920,3656,1,NULL),(1921,3657,1,NULL),(1922,3658,1,NULL),(1923,3659,1,NULL),(1924,3660,1,NULL),(1925,3661,1,10),(1929,3665,1,10),(1930,3666,1,10),(1931,3667,1,10),(1932,3668,1,10),(1933,3669,1,10),(1934,3670,1,10),(1935,3671,1,10),(1936,3672,1,10),(1937,3673,1,10),(1938,3674,1,10),(1939,3675,1,10),(1940,3676,1,10),(1941,3677,1,10),(1952,3688,1,10),(1953,3689,1,10),(1954,3690,1,10),(1955,3691,1,10),(1956,3692,1,10),(1957,3693,1,10),(1958,3694,1,10),(1959,3695,1,10),(1960,3696,1,10),(1961,3697,1,10),(1962,3698,1,10),(1963,3699,1,10),(1964,3700,1,10),(2048,1614,0,NULL),(2049,2345,0,NULL),(2050,3139,0,NULL),(2052,821,0,NULL),(2053,25,0,NULL),(2054,310,0,NULL),(2055,1290,0,NULL),(2056,2848,0,NULL),(2058,1294,0,NULL),(2059,2577,0,NULL),(2060,1617,0,NULL),(2061,883,0,11),(2062,586,0,NULL),(2063,2095,0,NULL),(2064,105,0,11),(2066,2587,0,NULL),(2067,2668,0,11),(2068,278,0,NULL),(2069,2115,0,NULL),(2070,1394,0,11),(2071,125,0,11),(2072,63,0,NULL),(2074,2838,0,NULL),(2076,319,0,NULL),(2077,2862,0,NULL),(2078,839,0,NULL),(2079,11,0,NULL),(2080,1915,0,11),(2081,259,0,NULL),(2082,2354,0,NULL),(2083,3141,0,NULL),(2084,1826,0,NULL),(2086,3096,0,NULL),(2087,2340,0,NULL),(2088,99,0,11),(2089,3600,0,NULL),(2090,1800,0,NULL),(2091,1034,0,NULL),(2092,1802,0,NULL),(2093,3124,0,NULL),(2094,2822,0,NULL),(2095,3078,0,NULL),(2096,1280,0,NULL),(2097,1653,0,11),(2099,124,0,11),(2100,2929,0,11),(2102,3583,0,11),(2103,530,0,NULL),(2105,3406,0,11),(2106,1908,0,11),(2107,3113,0,NULL),(2108,2344,0,NULL),(2109,2163,0,11),(2110,887,0,11),(2111,791,0,NULL),(2112,2888,0,NULL),(2113,3324,0,NULL),(2114,60,0,NULL),(2116,1827,0,NULL),(2117,869,0,11),(2118,2400,0,11),(2119,1043,0,NULL),(2120,2089,0,NULL),(2121,43,0,NULL),(2122,2653,0,11),(2123,3357,0,NULL),(2124,2614,0,NULL),(2125,33,0,NULL),(2126,585,0,NULL),(2127,2854,0,NULL),(2128,39,0,NULL),(2129,345,0,NULL),(2130,3688,0,11),(2132,2927,0,11),(2133,2910,0,11),(2134,260,0,NULL),(2135,3071,0,NULL),(2136,784,0,NULL),(2137,3358,0,NULL),(2139,2324,0,NULL),(2140,3581,0,NULL),(2141,2368,0,NULL),(2142,3146,0,NULL),(2143,533,0,NULL),(2144,837,0,NULL),(2145,3385,0,NULL),(2147,2566,0,NULL),(2148,1849,0,NULL),(2149,2630,0,NULL),(2150,3442,0,11),(2151,2865,0,NULL),(2152,9,0,NULL),(2153,2647,0,11),(2154,2131,0,11),(2155,1067,0,NULL),(2156,2170,0,11),(2157,824,0,NULL),(2158,854,0,NULL),(2159,885,0,11),(2160,571,0,NULL),(2162,2067,0,NULL),(2163,1120,0,11),(2164,3422,0,11),(2165,556,0,NULL),(2166,1795,0,NULL),(2167,296,0,NULL),(2168,1874,0,NULL),(2169,1544,0,NULL),(2170,3098,0,NULL),(2171,1840,0,NULL),(2172,2580,0,NULL),(2173,827,0,NULL),(2174,818,0,NULL),(2175,2121,0,NULL),(2176,3106,0,NULL),(2177,2397,0,11),(2178,2832,0,NULL),(2179,1824,0,NULL),(2181,598,0,NULL),(2182,2589,0,NULL),(2183,584,0,NULL),(2184,1108,0,NULL),(2185,1092,0,NULL),(2186,3615,0,NULL),(2187,119,0,11),(2188,567,0,NULL),(2189,3373,0,NULL),(2190,3329,0,NULL),(2191,1814,0,NULL),(2192,1078,0,NULL),(2193,823,0,NULL),(2194,863,0,11),(2195,2159,0,11),(2196,638,0,11),(2197,1554,0,NULL),(2198,2402,0,11),(2199,1881,0,11),(2200,851,0,NULL),(2201,3589,0,NULL),(2202,3068,0,NULL),(2203,258,0,NULL),(2204,838,0,NULL),(2205,261,0,NULL),(2206,2302,0,NULL),(2207,3657,0,NULL),(2208,292,0,NULL),(2209,1309,0,NULL),(2210,2886,0,NULL),(2211,1036,0,NULL),(2212,2343,0,NULL),(2213,2395,0,11),(2214,1044,0,NULL),(2216,525,0,NULL),(2217,2399,0,11),(2218,3614,0,NULL),(2219,1578,0,NULL),(2220,22,0,NULL),(2221,2304,0,NULL),(2222,3128,0,NULL),(2223,2046,0,NULL),(2224,2305,0,NULL),(2226,2573,0,NULL),(2228,270,0,NULL),(2229,3155,0,11),(2230,2598,0,NULL),(2231,797,0,NULL),(2233,3062,0,NULL),(2234,542,0,NULL),(2236,130,0,11),(2237,517,0,NULL),(2238,1095,0,NULL),(2239,1539,0,NULL),(2240,1027,0,NULL),(2241,3390,0,NULL),(2242,2328,0,NULL),(2243,1295,0,NULL),(2244,3587,0,NULL),(2245,2833,0,NULL),(2246,2603,0,NULL),(2247,3418,0,11),(2248,3396,0,NULL),(2250,3598,0,NULL),(2251,2363,0,NULL),(2252,2045,0,NULL),(2253,3125,0,NULL),(2254,578,0,NULL),(2255,1869,0,NULL),(2256,3591,0,NULL),(2257,356,0,11),(2258,2911,0,11),(2259,1559,0,NULL),(2260,2568,0,NULL),(2261,561,0,NULL),(2262,1081,0,NULL),(2263,849,0,NULL),(2264,532,0,NULL),(2266,1122,0,11),(2267,2592,0,NULL),(2268,2555,0,NULL),(2269,833,0,NULL),(2270,2349,0,NULL),(2271,2129,0,NULL),(2272,385,0,11),(2273,65,0,NULL),(2274,77,0,NULL),(2275,1298,0,NULL),(2276,2889,0,NULL),(2277,2108,0,NULL),(2279,540,0,NULL),(2280,2333,0,NULL),(2281,1121,0,11),(2282,2812,0,NULL),(2283,8,0,NULL),(2284,346,1,11),(2285,2347,0,NULL),(2287,3661,0,11),(2288,3595,0,NULL),(2289,634,0,11),(2290,2930,0,11),(2291,834,0,NULL),(2292,613,0,11),(2293,1101,0,NULL),(2294,1022,0,NULL),(2296,2068,0,NULL),(2297,357,0,11),(2298,2599,0,NULL),(2299,1346,0,NULL),(2300,579,0,NULL),(2301,1532,0,NULL),(2302,3378,0,NULL),(2303,1074,0,NULL),(2304,2348,0,NULL),(2306,1371,0,11),(2307,3092,0,NULL),(2308,3094,0,NULL),(2309,1593,0,NULL),(2310,1845,0,NULL),(2311,1637,0,11),(2312,813,0,NULL),(2313,1576,0,NULL),(2314,595,0,NULL),(2316,2168,0,11),(2317,3069,0,NULL),(2318,2080,0,NULL),(2320,1866,0,NULL),(2321,1061,0,NULL),(2322,2051,0,NULL),(2323,6,0,NULL),(2324,1793,0,NULL),(2325,1086,0,NULL),(2326,820,0,NULL),(2327,636,0,11),(2328,1821,0,NULL),(2331,2635,0,NULL),(2333,2827,0,NULL),(2334,2118,0,NULL),(2335,609,0,11),(2336,848,0,NULL),(2337,766,1,NULL),(2338,588,0,NULL),(2339,2935,0,11),(2340,1139,0,11),(2341,3067,0,NULL),(2342,1788,0,NULL),(2343,3599,0,NULL),(2344,599,0,NULL),(2345,2073,0,NULL),(2346,3395,0,NULL),(2347,3349,0,NULL),(2348,1380,0,11),(2349,786,0,NULL),(2350,2615,0,NULL),(2351,3080,0,NULL),(2352,38,0,NULL),(2353,3101,0,NULL),(2354,3632,0,NULL),(2355,2358,0,NULL),(2356,2561,0,NULL),(2357,2863,0,NULL),(2358,606,0,11),(2359,547,0,NULL),(2360,1856,0,NULL),(2361,3326,0,NULL),(2362,1320,0,NULL),(2363,1049,0,NULL),(2364,336,0,NULL),(2365,892,0,11),(2366,2835,0,NULL),(2367,3181,0,11),(2368,85,0,NULL),(2369,802,0,NULL),(2372,2139,0,11),(2373,1575,0,NULL),(2374,257,0,NULL),(2375,3607,0,NULL),(2376,3150,0,NULL),(2377,2383,0,NULL),(2379,2649,0,11),(2380,796,0,NULL),(2381,361,0,11),(2382,2558,0,NULL),(2383,2633,0,NULL),(2384,362,0,11),(2386,2601,0,NULL),(2388,7,0,NULL),(2389,2560,0,NULL),(2390,3693,0,11),(2391,778,0,11),(2392,3321,0,NULL),(2393,1867,0,NULL),(2394,1123,0,11),(2395,1289,0,NULL),(2396,326,0,NULL),(2397,1798,0,11),(2399,1830,0,NULL),(2400,2100,0,NULL),(2401,341,0,NULL),(2402,2334,0,NULL),(2403,1144,0,11),(2404,2858,0,NULL),(2405,3392,0,NULL),(2406,629,0,11),(2407,1583,0,NULL),(2408,1880,0,11),(2409,2556,0,NULL),(2410,1794,0,NULL),(2411,1541,0,NULL),(2412,279,0,NULL),(2413,3571,0,NULL),(2414,1097,0,NULL),(2415,3375,0,NULL),(2416,3668,0,11),(2417,2880,0,NULL),(2418,2061,0,NULL),(2419,1628,0,11),(2420,1065,0,NULL),(2421,1079,0,NULL),(2422,2839,0,NULL),(2423,1050,0,NULL),(2424,1143,0,11),(2425,2557,0,NULL),(2426,2807,0,NULL),(2427,3332,0,NULL),(2428,1398,0,11),(2429,1555,0,NULL),(2430,2350,0,NULL),(2431,383,0,11),(2432,2672,0,11),(2433,277,0,NULL),(2434,1606,0,NULL),(2436,3355,0,NULL),(2437,107,0,11),(2439,3397,0,NULL),(2440,2050,0,NULL),(2441,1577,0,NULL),(2442,3594,0,NULL),(2443,520,0,NULL),(2444,2128,0,NULL),(2445,2088,0,NULL),(2448,1548,0,NULL),(2449,2834,0,NULL),(2450,2166,0,11),(2451,3609,0,NULL),(2453,608,0,11),(2454,3673,0,11),(2455,780,0,NULL),(2456,3368,0,NULL),(2457,2360,0,NULL),(2459,1604,0,NULL),(2460,601,1,11),(2461,3164,0,11),(2462,1841,0,NULL),(2463,2934,0,11),(2464,2818,0,11),(2468,3103,0,NULL),(2469,3089,0,NULL),(2470,1546,0,NULL),(2471,1839,0,NULL),(2472,1535,0,NULL),(2473,20,0,NULL),(2475,334,0,NULL),(2476,311,0,NULL),(2477,106,0,11),(2478,96,0,11),(2479,3652,0,NULL),(2480,1831,0,NULL),(2481,847,0,NULL),(2482,1825,0,NULL),(2483,2320,0,NULL),(2484,2676,0,11),(2485,1338,0,NULL),(2486,1630,0,11),(2488,3640,0,NULL),(2489,3339,0,NULL),(2490,829,0,NULL),(2491,1023,0,NULL),(2492,3421,0,11),(2493,1029,0,NULL),(2494,2646,0,11),(2495,1587,0,NULL),(2496,2602,0,NULL),(2497,2044,0,NULL),(2498,1059,0,NULL),(2499,71,0,NULL),(2500,3655,0,NULL),(2501,3443,0,11),(2502,3619,0,NULL),(2503,1031,0,NULL),(2504,1103,0,NULL),(2505,118,0,11),(2506,790,0,NULL),(2507,1823,0,NULL),(2508,36,0,NULL),(2509,1567,0,NULL),(2510,2629,0,NULL),(2511,2885,0,NULL),(2512,607,0,11),(2513,1610,0,NULL),(2514,375,0,11),(2516,3144,0,NULL),(2517,2677,0,11),(2518,16,0,NULL),(2519,787,0,NULL),(2520,264,0,NULL),(2521,351,0,11),(2522,1566,0,NULL),(2523,3133,0,NULL),(2524,1109,0,NULL),(2525,564,0,NULL),(2527,3132,0,NULL),(2528,2675,0,11),(2529,87,0,NULL),(2530,271,0,NULL),(2531,2330,0,NULL),(2532,2117,0,NULL),(2533,2584,0,NULL),(2534,2868,0,NULL),(2535,2376,0,NULL),(2536,3401,0,NULL),(2537,3090,0,NULL),(2538,3135,0,NULL),(2539,289,0,NULL),(2540,3143,0,NULL),(2541,767,0,NULL),(2542,2077,0,NULL),(2543,3576,0,NULL),(2544,330,0,NULL),(2545,2124,0,NULL),(2546,803,0,NULL),(2547,3363,0,NULL),(2548,1560,0,NULL),(2549,3352,0,NULL),(2550,305,0,NULL),(2552,1374,0,11),(2553,1838,0,NULL),(2554,1888,0,11),(2555,554,0,NULL),(2556,2380,0,NULL),(2557,537,0,NULL),(2558,1146,0,11),(2559,3376,0,NULL),(2560,3160,0,11),(2561,3346,0,NULL),(2562,3617,0,NULL),(2563,2867,0,NULL),(2564,1609,0,NULL),(2565,291,0,NULL),(2566,3123,0,NULL),(2567,3334,0,NULL),(2569,1349,0,NULL),(2570,610,0,11),(2571,1868,0,NULL),(2572,1603,0,NULL),(2573,343,0,NULL),(2575,1797,0,NULL),(2576,2135,0,11),(2577,3656,0,NULL),(2579,2903,0,11),(2580,1069,0,NULL),(2581,3631,0,NULL),(2582,3389,0,NULL),(2583,3622,0,NULL),(2584,2823,0,NULL),(2585,1326,0,NULL),(2586,3118,0,NULL),(2587,852,0,NULL),(2588,3087,0,NULL),(2589,3692,0,11),(2590,2811,0,NULL),(2591,2609,0,NULL),(2593,799,0,NULL),(2594,1890,0,11),(2595,1076,0,NULL),(2596,327,0,NULL),(2597,275,0,NULL),(2599,2307,0,NULL),(2600,1910,0,11),(2601,2870,0,NULL),(2602,128,0,11),(2603,62,0,NULL),(2604,57,0,NULL),(2606,1620,0,NULL),(2607,1060,0,NULL),(2608,1334,0,NULL),(2609,3626,0,NULL),(2611,1072,0,NULL),(2612,2815,0,NULL),(2613,308,0,NULL),(2614,1819,0,NULL),(2615,3149,0,NULL),(2616,856,1,11),(2617,2146,0,11),(2618,1543,1,11),(2619,1660,0,11),(2621,322,0,NULL),(2622,1913,0,11),(2623,3400,0,NULL),(2624,1634,0,11),(2625,1100,0,NULL),(2626,381,0,11),(2627,2120,0,NULL),(2628,544,0,NULL),(2629,2393,0,11),(2630,3604,0,NULL),(2632,376,0,11),(2633,359,0,11),(2634,888,0,11),(2635,3333,0,NULL),(2636,2669,0,11),(2637,2553,0,NULL),(2638,3651,0,NULL),(2639,3359,0,NULL),(2640,3634,0,NULL),(2641,596,0,NULL),(2642,324,0,NULL),(2644,50,0,NULL),(2645,2382,0,NULL),(2647,3610,0,NULL),(2648,2933,0,11),(2649,1563,0,NULL),(2650,2593,0,NULL),(2651,553,0,NULL),(2652,1884,0,11),(2654,531,0,NULL),(2655,2384,0,NULL),(2656,2337,0,NULL),(2657,2632,0,NULL),(2658,3411,0,11),(2659,59,0,NULL),(2660,864,0,11),(2662,1362,0,NULL),(2663,2869,0,NULL),(2664,1792,0,NULL),(2665,2819,0,NULL),(2666,3343,0,NULL),(2668,299,0,NULL),(2669,2130,0,NULL),(2670,2323,0,NULL),(2671,1904,0,11),(2672,123,0,11),(2673,2313,0,NULL),(2674,2641,0,11),(2675,1096,0,NULL),(2676,265,0,NULL),(2677,2066,0,NULL),(2679,3580,0,NULL),(2680,3606,0,NULL),(2681,524,0,NULL),(2682,3340,0,NULL),(2683,1359,0,NULL),(2684,1307,0,NULL),(2685,1568,0,NULL),(2686,2859,0,NULL),(2688,1140,0,11),(2689,1291,0,NULL),(2690,2096,0,NULL),(2691,3676,0,11),(2692,1375,0,11),(2693,771,0,NULL),(2694,1299,0,NULL),(2695,2385,0,NULL),(2696,581,0,NULL),(2697,280,0,NULL),(2698,2586,0,NULL),(2700,1851,0,NULL),(2701,3579,0,NULL),(2702,3091,0,NULL),(2704,81,0,NULL),(2705,3639,0,NULL),(2706,2605,0,NULL),(2707,1846,0,NULL),(2708,2901,0,11),(2709,353,0,11),(2710,3647,0,NULL),(2711,2873,0,NULL),(2713,17,0,NULL),(2714,1381,0,11),(2715,4,0,NULL),(2716,269,0,NULL),(2717,53,0,NULL),(2718,558,0,NULL),(2719,2619,0,NULL),(2720,3384,0,NULL),(2721,3670,0,11),(2723,1615,0,NULL),(2724,3344,0,NULL),(2725,1858,0,NULL),(2726,3394,0,NULL),(2727,3437,0,11),(2728,1068,0,NULL),(2729,1317,0,NULL),(2730,2421,0,11),(2731,3337,0,NULL),(2732,614,0,11),(2733,2355,0,NULL),(2734,3391,0,NULL),(2736,3372,0,NULL),(2737,3180,0,11),(2739,3642,0,NULL),(2741,10,0,NULL),(2742,2590,0,NULL),(2743,2829,0,NULL),(2744,3131,0,NULL),(2745,2123,0,NULL),(2747,1906,0,11),(2749,3438,0,11),(2750,2928,0,11),(2751,3590,0,NULL),(2752,41,0,NULL),(2753,1791,0,NULL),(2754,1147,0,11),(2758,1058,0,NULL),(2759,1345,0,NULL),(2760,2378,0,NULL),(2761,1632,0,11),(2762,2362,0,NULL),(2763,29,0,NULL),(2764,861,0,11),(2765,538,0,NULL),(2766,886,0,11),(2767,3577,0,NULL),(2768,2562,0,NULL),(2769,2652,0,11),(2770,589,0,NULL),(2771,1588,0,NULL),(2773,3157,0,11),(2774,3151,0,11),(2775,1652,0,11),(2776,2314,0,NULL),(2778,263,0,NULL),(2779,273,0,NULL),(2781,2876,0,NULL),(2782,1402,0,11),(2783,3354,0,NULL),(2784,835,0,NULL),(2785,1562,0,NULL),(2786,2394,0,11),(2787,2564,0,NULL),(2788,1071,0,NULL),(2789,828,0,NULL),(2790,2810,0,NULL),(2791,1330,0,NULL),(2792,1341,0,NULL),(2793,535,0,NULL),(2794,871,0,11),(2795,1818,0,NULL),(2796,2628,0,NULL),(2797,2332,0,NULL),(2799,103,0,11),(2800,1619,0,NULL),(2801,2144,0,11),(2802,3066,0,NULL),(2803,1787,0,NULL),(2804,3365,0,NULL),(2805,2850,0,NULL),(2806,3114,0,NULL),(2807,1084,0,NULL),(2808,3064,0,NULL),(2809,1145,0,11),(2810,2361,0,NULL),(2812,2809,0,NULL),(2813,1806,0,NULL),(2814,3350,0,NULL),(2815,2847,0,NULL),(2816,1586,0,NULL),(2817,2596,0,NULL),(2818,2105,0,NULL),(2819,3575,0,NULL),(2820,1815,0,NULL),(2821,284,0,NULL),(2822,779,0,NULL),(2823,3628,0,NULL),(2824,3081,0,NULL),(2825,2563,1,11),(2826,3413,0,11),(2827,519,0,NULL),(2828,2098,0,NULL),(2829,3404,0,NULL),(2830,770,0,NULL),(2831,297,0,NULL),(2832,3602,0,NULL),(2833,2657,0,11),(2834,2138,0,11),(2837,2895,0,NULL),(2838,2576,0,NULL),(2839,3351,0,NULL),(2840,804,0,NULL),(2841,2059,0,NULL),(2842,1571,0,NULL),(2843,2373,0,NULL),(2844,1278,0,NULL),(2845,1627,0,11),(2846,3402,0,NULL),(2847,2837,0,NULL),(2848,1324,0,NULL),(2849,1142,0,11),(2850,2,0,NULL),(2851,3671,0,11),(2852,3612,0,NULL),(2853,1786,0,NULL),(2854,527,0,NULL),(2856,2075,0,NULL),(2857,822,0,NULL),(2858,1333,0,NULL),(2859,2552,0,NULL),(2860,2353,0,NULL),(2861,2853,0,NULL),(2862,3186,0,11),(2863,1631,0,11),(2864,893,0,11),(2865,1552,0,NULL),(2866,1605,0,NULL),(2867,1066,0,NULL),(2868,1073,0,NULL),(2869,1311,0,NULL),(2870,1104,0,NULL),(2871,3162,0,11),(2872,809,0,NULL),(2873,1848,0,NULL),(2874,3328,0,11),(2875,3178,0,11),(2876,344,0,NULL),(2877,1531,0,NULL),(2878,3,0,NULL),(2879,1353,0,NULL),(2880,321,0,NULL),(2881,3648,0,NULL),(2882,2390,0,11),(2884,522,0,NULL),(2885,565,0,NULL),(2886,58,0,NULL),(2887,3097,0,NULL),(2888,3072,0,NULL),(2889,782,0,NULL),(2891,2588,0,NULL),(2892,1088,0,NULL),(2893,2879,0,NULL),(2894,1574,0,NULL),(2895,798,0,NULL),(2896,83,0,NULL),(2897,1538,0,NULL),(2898,825,0,NULL),(2899,3341,0,NULL),(2900,801,0,NULL),(2901,1822,0,NULL),(2902,3645,0,NULL),(2904,1308,0,NULL),(2905,2671,0,11),(2906,1046,0,NULL),(2907,2840,0,NULL),(2910,2351,0,NULL),(2911,3122,0,NULL),(2912,1892,0,11),(2913,3572,0,NULL),(2914,2846,0,NULL),(2915,1039,0,NULL),(2916,774,0,NULL),(2917,1607,0,NULL),(2918,1914,0,11),(2920,1816,0,NULL),(2921,1648,0,11),(2922,1400,0,11),(2923,1304,0,NULL),(2924,1354,0,NULL),(2925,2906,0,11),(2927,1082,0,NULL),(2928,75,0,NULL),(2929,597,0,NULL),(2931,374,0,11),(2932,1356,0,NULL),(2934,3623,0,NULL),(2936,2570,0,NULL),(2937,1021,0,NULL),(2938,637,0,11),(2939,2160,0,11),(2940,2674,0,11),(2941,2551,0,NULL),(2943,1325,0,NULL),(2944,1801,0,NULL),(2945,2606,0,NULL),(2946,1366,0,11),(2947,2673,0,11),(2948,72,0,NULL),(2949,97,0,11),(2950,1276,0,NULL),(2951,3165,0,11),(2953,2828,0,NULL),(2954,2065,0,NULL),(2955,3330,0,NULL),(2956,1557,0,NULL),(2957,2849,0,NULL),(2958,1370,0,11),(2959,46,0,NULL),(2961,1075,0,NULL),(2962,1342,0,NULL),(2963,843,0,NULL),(2964,1889,0,11),(2965,795,0,NULL),(2966,2325,0,NULL),(2967,2064,0,NULL),(2968,2636,0,NULL),(2969,1650,0,11),(2970,2627,0,NULL),(2971,1399,0,11),(2972,3387,0,NULL),(2973,380,0,11),(2975,1118,0,11),(2976,811,0,NULL),(2977,2103,0,NULL),(2978,331,0,NULL),(2980,3079,0,NULL),(2982,3187,0,11),(2983,1150,0,11),(2985,3142,0,NULL),(2986,3145,0,NULL),(2987,617,0,11),(2988,2338,0,NULL),(2989,3076,0,NULL),(2990,1633,0,11),(2991,298,0,NULL),(2992,2379,0,NULL),(2993,3697,0,11),(2994,1558,0,NULL),(2995,2140,0,11),(2996,1594,0,NULL),(2997,1863,0,NULL),(2998,2297,0,NULL),(2999,2298,0,NULL),(3000,1843,0,NULL),(3001,3377,0,NULL),(3002,511,1,NULL),(3003,1828,0,NULL),(3004,1285,0,NULL),(3005,30,0,NULL),(3006,569,0,NULL),(3007,1847,0,NULL),(3008,318,0,NULL),(3009,563,0,NULL),(3010,2136,0,11),(3011,328,0,NULL),(3012,545,0,NULL),(3014,19,0,NULL),(3016,1817,0,NULL),(3017,1592,0,NULL),(3018,884,0,11),(3019,3356,0,NULL),(3020,1804,0,NULL),(3021,555,0,NULL),(3022,2604,0,NULL),(3023,1282,0,NULL),(3024,66,0,NULL),(3025,21,0,NULL),(3026,2370,0,NULL),(3027,2821,0,NULL),(3028,1284,0,NULL),(3029,3603,0,NULL),(3030,1331,0,NULL),(3031,1832,0,NULL),(3032,2126,0,NULL),(3034,3342,0,NULL),(3035,1570,0,NULL),(3036,2852,0,NULL),(3037,2296,0,NULL),(3039,2637,0,NULL),(3040,1125,0,11),(3042,1085,0,NULL),(3043,2070,0,NULL),(3044,52,0,NULL),(3045,79,0,NULL),(3046,3417,0,11),(3047,1533,0,NULL),(3048,2654,0,11),(3049,2342,0,NULL),(3050,320,0,NULL),(3051,568,0,NULL),(3052,1138,0,11),(3053,2057,0,NULL),(3054,1833,0,NULL),(3055,3119,0,NULL),(3056,2091,0,NULL),(3057,3637,0,NULL),(3058,373,0,11),(3059,814,0,NULL),(3060,3345,0,NULL),(3061,45,0,NULL),(3062,1303,0,NULL),(3063,562,0,NULL),(3064,1876,1,11),(3065,37,0,NULL),(3067,2420,0,11),(3068,339,0,NULL),(3069,23,0,NULL),(3071,1864,0,NULL),(3072,2843,0,NULL),(3073,56,0,NULL),(3074,3381,0,NULL),(3075,3320,0,NULL),(3076,276,0,NULL),(3077,1861,0,NULL),(3078,1292,0,NULL),(3079,18,0,NULL),(3080,2622,0,NULL),(3082,2893,0,NULL),(3083,1094,0,NULL),(3084,1579,0,NULL),(3085,2042,0,NULL),(3086,2924,0,11),(3087,3188,0,11),(3088,2047,0,NULL),(3089,3075,0,NULL),(3090,34,0,NULL),(3091,1636,0,11),(3092,1365,0,NULL),(3093,3104,0,NULL),(3096,1565,0,NULL),(3097,3419,0,11),(3098,2147,0,11),(3099,1883,0,11),(3100,1635,0,11),(3101,1808,0,NULL),(3102,3601,0,NULL),(3104,3700,0,11),(3105,2925,0,11),(3106,14,0,NULL),(3107,2912,0,11),(3108,3441,0,11),(3109,2639,0,NULL),(3110,534,0,NULL),(3111,2909,0,11),(3112,286,0,NULL),(3113,2125,0,NULL),(3114,2392,0,11),(3115,1545,0,NULL),(3116,573,0,NULL),(3117,3415,0,11),(3118,95,0,11),(3119,1860,0,NULL),(3120,2567,0,NULL),(3121,1608,0,NULL),(3122,76,0,NULL),(3123,1306,0,NULL),(3124,2892,0,NULL),(3125,3077,0,NULL),(3126,1042,0,NULL),(3127,2321,0,NULL),(3128,3158,0,11),(3129,2600,0,NULL),(3130,1625,0,11),(3131,2871,0,NULL),(3132,1859,0,NULL),(3133,2612,0,NULL),(3134,342,0,NULL),(3135,3410,0,11),(3136,304,0,NULL),(3137,288,0,NULL),(3138,2053,1,11),(3139,2060,0,NULL),(3140,3371,0,NULL),(3142,1328,0,NULL),(3143,2626,0,NULL),(3144,3331,0,NULL),(3145,1404,0,11),(3146,3636,0,NULL),(3147,3093,0,NULL),(3148,868,0,11),(3149,102,0,11),(3151,268,1,11),(3152,1316,0,NULL),(3153,1364,0,NULL),(3154,773,0,NULL),(3156,559,0,NULL),(3157,1790,0,NULL),(3158,2931,0,11),(3159,3183,0,11),(3160,2090,0,NULL),(3161,792,0,NULL),(3162,1056,0,NULL),(3163,548,0,NULL),(3164,350,0,11),(3165,1551,0,NULL),(3166,3364,0,NULL),(3167,3695,0,11),(3168,354,0,11),(3169,3433,0,11),(3170,129,0,11),(3171,800,0,NULL),(3172,89,0,NULL),(3173,1885,0,11),(3174,2104,0,NULL),(3175,2857,0,NULL),(3176,3335,0,NULL),(3177,2624,0,NULL),(3178,526,0,NULL),(3179,2808,0,NULL),(3180,3369,0,NULL),(3181,3588,0,NULL),(3183,2620,0,NULL),(3184,2300,0,NULL),(3185,630,0,11),(3186,3120,0,NULL),(3187,2836,0,NULL),(3188,1105,0,NULL),(3190,55,0,NULL),(3191,772,0,NULL),(3192,1351,0,NULL),(3193,1099,0,NULL),(3194,3166,0,11),(3195,2595,0,NULL),(3196,2611,0,NULL),(3197,32,0,NULL),(3198,808,0,NULL),(3199,549,0,NULL),(3202,2591,0,NULL),(3203,1811,0,NULL),(3204,2656,0,11),(3205,2856,0,NULL),(3206,317,0,NULL),(3207,1393,0,11),(3208,285,0,NULL),(3209,514,0,NULL),(3210,1305,0,NULL),(3211,2861,0,NULL),(3213,550,0,NULL),(3214,47,0,NULL),(3215,639,0,11),(3216,1812,0,NULL),(3217,3317,0,NULL),(3218,2401,0,11),(3219,24,0,NULL),(3220,2306,0,NULL),(3221,2167,0,11),(3222,2655,0,11),(3223,3436,0,11),(3224,329,0,NULL),(3225,536,0,NULL),(3226,1337,0,NULL),(3227,2110,0,NULL),(3228,523,1,11),(3229,2049,0,NULL),(3230,1098,0,NULL),(3231,1855,0,NULL),(3232,2377,0,NULL),(3234,605,0,11),(3235,1045,0,NULL),(3236,2308,1,11),(3237,2617,0,NULL),(3238,2816,0,NULL),(3239,3618,0,NULL),(3240,69,0,NULL),(3241,2063,0,NULL),(3243,360,0,11),(3245,2613,0,NULL),(3246,325,0,NULL),(3247,1809,0,NULL),(3248,3649,0,NULL),(3249,3085,0,NULL),(3250,1302,0,NULL),(3251,1807,0,NULL),(3252,1119,0,11),(3253,1556,0,NULL),(3254,789,0,NULL),(3255,272,0,NULL),(3256,1854,0,NULL),(3257,256,1,NULL),(3258,2572,0,NULL),(3259,3694,0,11),(3260,2127,0,NULL),(3261,3338,0,NULL),(3262,1382,0,11),(3263,3367,0,NULL),(3264,516,0,NULL),(3266,3593,0,NULL),(3267,2891,0,NULL),(3268,1296,0,NULL),(3269,600,0,NULL),(3270,2651,0,11),(3271,1035,0,NULL),(3272,3584,0,NULL),(3273,2041,0,NULL),(3275,1602,0,NULL),(3276,2579,0,NULL),(3277,1319,0,NULL),(3279,2851,0,NULL),(3281,2069,0,NULL),(3282,3105,0,NULL),(3283,1026,0,NULL),(3284,2610,0,NULL),(3285,333,0,NULL),(3286,1287,0,NULL),(3287,82,0,NULL),(3288,551,0,NULL),(3289,3630,0,NULL),(3290,1148,0,11),(3291,1564,0,NULL),(3292,2364,0,NULL),(3293,2825,0,NULL),(3294,3316,0,NULL),(3295,2162,0,11),(3296,2416,0,11),(3297,2084,0,NULL),(3298,1907,0,11),(3299,64,0,NULL),(3300,312,0,NULL),(3301,2830,0,NULL),(3302,1281,0,NULL),(3303,515,0,NULL),(3304,2831,0,NULL),(3305,1070,0,NULL),(3306,1322,0,NULL),(3307,2680,0,11),(3308,2585,0,NULL),(3309,1621,0,11),(3310,1909,0,11),(3311,3111,0,NULL),(3312,3674,0,11),(3313,1315,0,NULL),(3314,1107,0,NULL),(3317,1629,0,11),(3318,3185,0,11),(3319,1857,0,NULL),(3320,2315,0,NULL),(3321,2119,0,NULL),(3322,1842,0,NULL),(3323,2419,0,11),(3324,870,0,11),(3325,1054,0,NULL),(3326,3156,0,11),(3327,1852,0,NULL),(3328,2299,0,NULL),(3329,28,0,NULL),(3330,126,0,11),(3331,612,0,11),(3332,1834,0,NULL),(3334,3147,0,NULL),(3335,26,0,NULL),(3336,3635,0,NULL),(3339,1584,0,NULL),(3340,817,0,NULL),(3341,2900,0,11),(3342,2106,0,NULL),(3343,2093,0,NULL),(3344,2112,0,NULL),(3345,1569,0,NULL),(3346,2081,0,NULL),(3347,281,0,NULL),(3348,512,0,NULL),(3349,3638,0,NULL),(3350,44,0,NULL),(3351,2164,0,11),(3352,3412,0,11),(3353,1040,0,NULL),(3354,2365,0,NULL),(3355,3361,0,NULL),(3356,2141,0,11),(3357,67,0,NULL),(3358,323,0,NULL),(3359,2413,0,11),(3360,302,0,NULL),(3361,3102,0,NULL),(3363,889,0,11),(3364,853,0,NULL),(3365,1126,0,11),(3366,2826,0,NULL),(3367,1844,0,NULL),(3368,570,0,NULL),(3369,378,0,11),(3371,2371,0,NULL),(3372,335,0,NULL),(3374,1363,0,NULL),(3376,2303,0,NULL),(3377,2079,0,NULL),(3378,88,0,NULL),(3379,266,0,NULL),(3380,1310,0,NULL),(3381,2099,0,NULL),(3382,1063,0,NULL),(3383,895,0,11),(3384,306,0,NULL),(3385,267,0,NULL),(3386,1601,0,NULL),(3387,1025,0,NULL),(3388,3388,0,NULL),(3389,3380,0,NULL),(3390,2116,0,NULL),(3391,872,0,11),(3395,591,0,NULL),(3396,867,0,11),(3397,3675,0,11),(3398,776,0,NULL),(3399,3163,0,11),(3401,557,0,NULL),(3402,560,0,NULL),(3403,575,0,NULL),(3404,2087,0,NULL),(3405,2878,0,NULL),(3406,1882,0,11),(3407,3624,0,NULL),(3409,1591,0,NULL),(3410,894,0,11),(3411,3319,0,NULL),(3412,3348,0,NULL),(3413,1886,0,11),(3415,632,0,11),(3416,3586,0,NULL),(3417,3420,0,11),(3418,1327,0,NULL),(3419,98,0,11),(3420,587,0,NULL),(3421,2341,0,NULL),(3422,70,0,NULL),(3423,3439,0,11),(3424,815,0,NULL),(3425,1829,0,NULL),(3426,2874,0,NULL),(3427,1561,0,NULL),(3428,1891,0,11),(3430,127,0,11),(3431,1657,0,11),(3432,518,0,NULL),(3433,3444,0,11),(3434,2375,0,NULL),(3435,775,0,NULL),(3436,3629,0,NULL),(3437,3625,0,NULL),(3438,2415,0,11),(3439,2114,0,NULL),(3440,3182,0,11),(3441,1124,0,11),(3442,3613,0,NULL),(3443,1352,0,NULL),(3444,1361,0,NULL),(3445,543,0,NULL),(3446,1357,0,NULL),(3448,1048,0,NULL),(3450,1836,0,NULL),(3451,2855,0,NULL),(3452,1093,0,NULL),(3453,3353,0,NULL),(3454,1585,0,NULL),(3455,855,0,NULL),(3456,352,0,11),(3458,2335,0,NULL),(3459,2597,0,NULL),(3461,2366,0,NULL),(3462,2165,0,11),(3463,1087,0,NULL),(3464,1358,0,NULL),(3465,2559,0,NULL),(3466,1611,0,NULL),(3467,355,0,11),(3468,3445,0,11),(3469,840,0,NULL),(3470,583,0,NULL),(3471,1052,0,NULL),(3472,2083,0,NULL),(3473,3383,0,NULL),(3474,2424,0,11),(3475,2369,0,NULL),(3477,2872,0,NULL),(3478,1549,0,NULL),(3480,2336,0,NULL),(3481,2875,0,NULL),(3482,1659,0,11),(3483,3585,0,NULL),(3484,2864,0,NULL),(3485,2113,0,NULL),(3486,1348,0,NULL),(3487,3597,0,NULL),(3488,2082,0,NULL),(3489,1312,0,NULL),(3490,1117,0,11),(3492,1871,0,NULL),(3495,315,0,NULL),(3496,3643,0,NULL),(3498,3073,0,11),(3499,788,0,NULL),(3500,2071,0,NULL),(3501,2616,0,NULL),(3502,1590,0,NULL),(3503,3061,0,NULL),(3504,1789,0,NULL),(3505,2107,0,NULL),(3506,3659,0,NULL),(3508,2824,0,NULL),(3509,2625,0,NULL),(3510,2058,0,NULL),(3511,54,0,NULL),(3512,1355,0,NULL),(3513,3574,0,NULL),(3514,2574,0,NULL),(3515,1321,0,NULL),(3517,313,0,NULL),(3518,1862,0,NULL),(3519,3416,0,11),(3520,3608,0,NULL),(3521,2169,0,11),(3522,566,0,NULL),(3523,2607,0,NULL),(3524,1379,0,11),(3525,1297,0,NULL),(3526,1038,0,NULL),(3527,2575,0,NULL),(3528,2907,0,11),(3529,3596,0,NULL),(3530,2317,0,NULL),(3531,2678,0,11),(3532,1339,0,NULL),(3533,3099,0,NULL),(3534,2396,0,11),(3535,1,1,NULL),(3536,2640,0,NULL),(3537,3379,0,NULL),(3538,3698,0,11),(3539,777,0,NULL),(3540,3323,0,NULL),(3541,1550,0,NULL),(3542,1870,0,NULL),(3544,2346,0,NULL),(3545,3386,0,NULL),(3546,2052,0,NULL),(3548,1110,0,NULL),(3549,2102,0,NULL),(3550,865,0,11),(3551,2565,0,NULL),(3552,3088,0,NULL),(3553,2608,0,NULL),(3554,316,0,NULL),(3556,2594,0,NULL),(3557,1037,0,NULL),(3559,300,0,NULL),(3560,2331,0,NULL),(3561,1032,0,NULL),(3562,2422,0,11),(3564,90,0,NULL),(3565,2352,0,NULL),(3566,51,0,NULL),(3567,631,0,11),(3568,3108,0,NULL),(3569,2932,0,11),(3570,2845,0,NULL),(3571,781,0,NULL),(3572,309,0,NULL),(3574,2645,0,11),(3575,3325,0,NULL),(3576,2904,0,11),(3577,1403,0,11),(3578,810,0,NULL),(3579,1805,0,NULL),(3580,1596,0,NULL),(3581,3405,0,NULL),(3583,358,0,11),(3584,3116,0,NULL),(3586,2842,0,NULL),(3587,842,0,NULL),(3588,1301,0,NULL),(3589,819,0,NULL),(3590,301,0,NULL),(3592,582,0,NULL),(3593,2137,0,11),(3594,3616,0,NULL),(3595,1905,0,11),(3596,3129,0,NULL),(3597,2884,0,NULL),(3598,1903,0,11),(3599,1626,0,11),(3600,2086,0,NULL),(3601,1536,0,NULL),(3602,295,0,NULL),(3603,1581,0,NULL),(3604,1405,0,11),(3606,862,0,11),(3608,1373,0,11),(3609,3434,0,11),(3610,1091,0,NULL),(3611,2679,0,11),(3612,3393,0,NULL),(3613,3667,0,11),(3616,3109,0,NULL),(3617,2841,0,NULL),(3618,3140,0,NULL),(3619,860,0,11),(3620,2161,0,11),(3622,3327,0,NULL),(3623,633,0,11),(3624,1810,0,NULL),(3625,12,0,NULL),(3626,592,0,NULL),(3627,2339,0,NULL),(3628,1360,0,NULL),(3629,86,0,NULL),(3630,3190,0,11),(3631,2844,0,NULL),(3632,3611,0,NULL),(3633,1912,0,11),(3634,546,0,NULL),(3635,3336,0,NULL),(3636,120,0,11),(3637,80,0,NULL),(3638,2055,0,NULL),(3639,1875,0,NULL),(3640,2926,0,11),(3641,2158,0,11),(3642,2881,0,NULL),(3643,1024,0,NULL),(3644,2817,0,NULL),(3645,1799,0,NULL),(3646,2650,0,11),(3647,3399,0,NULL),(3648,1106,0,NULL),(3652,846,0,NULL),(3653,3161,0,11),(3655,1396,0,11),(3656,2329,0,NULL),(3657,3107,0,NULL),(3658,3650,0,NULL),(3659,3699,0,11),(3660,2316,0,NULL),(3661,3660,0,NULL),(3663,2054,0,NULL),(3664,1372,0,11),(3665,2111,0,NULL),(3666,3653,0,NULL),(3667,1401,0,11),(3668,2423,0,11),(3669,1057,0,NULL),(3670,3084,0,NULL),(3671,1090,0,NULL),(3672,3398,0,NULL),(3673,3184,0,11),(3674,3605,0,NULL),(3675,2043,0,NULL),(3677,337,0,NULL),(3678,1597,0,NULL),(3679,3159,0,11),(3681,1572,0,NULL),(3682,3065,0,NULL),(3683,1343,0,NULL),(3684,768,0,NULL),(3685,1340,0,NULL),(3686,3179,0,11),(3687,1053,0,NULL),(3688,122,0,11),(3690,1318,0,NULL),(3691,2301,0,NULL),(3692,1589,0,NULL),(3693,3654,0,NULL),(3694,1853,0,NULL),(3695,3578,0,NULL),(3696,3126,0,NULL),(3697,283,0,NULL),(3698,806,0,NULL),(3699,1540,0,NULL),(3700,3633,0,NULL),(3701,3440,0,11),(3702,3696,0,11),(3703,5,0,NULL),(3705,1064,0,NULL),(3706,2374,0,NULL),(3707,611,0,11),(3708,1850,0,NULL),(3710,1335,0,NULL),(3711,2634,0,NULL),(3712,303,0,NULL),(3713,1534,0,NULL),(3714,2670,0,11),(3716,1116,0,11),(3717,1288,1,11),(3718,2359,0,NULL),(3719,2386,0,11),(3720,2074,0,NULL),(3721,1314,0,NULL),(3722,294,0,NULL),(3723,2905,0,11),(3724,2581,0,NULL),(3725,2890,0,NULL),(3726,1618,0,NULL),(3728,3138,0,NULL),(3729,845,0,NULL),(3730,1612,0,NULL),(3731,1111,0,11),(3732,1813,0,NULL),(3734,3115,0,NULL),(3735,2312,0,NULL),(3736,42,0,NULL),(3737,2072,0,NULL),(3738,1149,0,11),(3739,580,0,NULL),(3741,3189,0,11),(3742,1141,0,11),(3743,340,0,NULL),(3744,3167,0,11),(3745,1835,0,NULL),(3746,2326,0,NULL),(3747,572,0,NULL),(3748,1542,0,NULL),(3749,3322,0,NULL),(3750,891,0,11),(3752,785,0,NULL),(3753,1553,0,NULL),(3754,1887,0,11),(3755,2894,0,NULL),(3756,1655,0,11),(3757,1329,0,NULL),(3758,384,0,11),(3759,3374,0,NULL),(3760,2145,0,11),(3761,2569,0,NULL),(3762,3621,0,NULL),(3764,121,0,11),(3765,1286,0,NULL),(3766,2078,0,NULL),(3767,282,0,NULL),(3768,1062,0,NULL),(3769,1300,0,NULL),(3770,830,0,NULL),(3771,807,0,NULL),(3772,1055,0,NULL),(3773,2076,0,NULL),(3775,61,0,NULL),(3776,1377,0,11),(3777,1600,0,NULL),(3778,616,0,11),(3779,2381,0,NULL),(3780,3677,0,11),(3781,13,1,11),(3782,3130,0,NULL),(3783,3083,0,NULL),(3784,1865,0,NULL),(3785,2356,0,NULL),(3786,1277,0,NULL),(3787,1573,0,NULL),(3788,2122,0,NULL),(3789,2908,0,11),(3790,3347,0,NULL),(3791,1616,0,NULL),(3793,3070,0,NULL),(3794,1654,0,11),(3795,3689,0,11),(3796,890,0,11),(3797,1293,0,NULL),(3798,2092,0,NULL),(3799,1102,0,NULL),(3800,541,0,NULL),(3802,590,0,NULL),(3803,1041,0,NULL),(3804,826,0,NULL),(3806,100,0,11),(3807,2571,0,NULL),(3808,3074,0,NULL),(3809,2143,0,11),(3810,1599,0,NULL),(3811,1030,0,NULL),(3812,513,0,NULL),(3813,3112,0,NULL),(3814,850,0,NULL),(3815,2425,0,11),(3816,539,0,NULL),(3817,2398,0,11),(3818,73,0,NULL),(3819,2887,0,NULL),(3820,40,0,NULL),(3821,2583,0,NULL),(3822,576,0,NULL),(3823,3582,0,NULL),(3824,2085,0,NULL),(3825,574,0,NULL),(3826,3620,0,NULL),(3827,3086,0,NULL),(3828,2882,0,NULL),(3829,628,0,11),(3830,2618,0,NULL),(3831,2418,0,11),(3832,3095,0,NULL),(3833,2902,0,11),(3834,1803,0,NULL),(3835,2638,0,NULL),(3836,1872,0,NULL),(3837,377,0,11),(3838,816,0,NULL),(3839,3121,0,NULL),(3840,2621,0,NULL),(3841,3641,0,NULL),(3842,2391,0,11),(3843,1127,0,11),(3844,48,0,NULL),(3845,2883,0,NULL),(3846,1376,0,11),(3847,31,0,NULL),(3848,1077,0,NULL),(3849,2318,0,NULL),(3850,1033,1,11),(3851,1613,0,NULL),(3853,594,0,NULL),(3854,2357,0,NULL),(3855,1598,0,NULL),(3857,1323,0,NULL),(3859,2623,0,NULL),(3860,2094,0,NULL),(3861,379,0,11),(3862,3690,0,11),(3864,1115,0,11),(3865,1395,0,11),(3866,307,0,NULL),(3867,1279,0,NULL),(3868,2877,0,NULL),(3869,2048,0,NULL),(3870,552,0,NULL),(3871,769,0,NULL),(3872,2554,0,NULL),(3875,2923,0,11),(3876,635,0,11),(3877,293,0,NULL),(3878,521,0,NULL),(3879,2097,0,NULL),(3880,2142,0,11),(3881,529,0,NULL),(3883,2806,0,NULL),(3884,3318,0,NULL),(3885,3691,0,11),(3886,3665,0,11),(3887,1547,0,NULL),(3888,3117,0,NULL),(3889,1051,0,NULL),(3890,1796,0,NULL),(3891,805,0,NULL),(3892,382,0,11),(3893,831,0,NULL),(3895,1089,0,NULL),(3896,2820,0,NULL),(3897,3137,0,NULL),(3898,91,1,11),(3899,1347,0,NULL),(3900,2062,0,NULL),(3901,3136,0,NULL),(3902,2311,0,NULL),(3903,812,0,NULL),(3904,2814,0,NULL),(3905,794,0,NULL),(3906,78,0,NULL),(3907,3063,0,NULL),(3908,1332,0,NULL),(3909,2109,0,NULL),(3910,3644,0,NULL),(3911,1820,0,NULL),(3912,3435,0,11),(3913,68,0,NULL),(3914,3573,0,NULL),(3915,338,0,NULL),(3917,866,0,11),(3918,3366,0,NULL),(3919,3403,0,NULL),(3920,1047,0,NULL),(3921,274,0,NULL),(3922,2896,0,11),(3923,15,0,NULL),(3924,2367,0,NULL),(3925,1873,0,NULL),(3926,1378,0,11),(3927,3127,0,NULL),(3930,3672,0,11),(3931,1651,0,11),(3932,314,0,NULL),(3933,3382,0,NULL),(3934,1911,0,11),(3935,3100,0,NULL),(3937,1537,0,NULL),(3938,2860,0,NULL),(3939,2414,0,11),(3940,332,0,NULL),(3941,1649,0,11),(3942,3627,0,NULL),(3943,3646,0,NULL),(3944,74,0,NULL),(3945,1313,0,NULL),(3946,3360,0,NULL),(3947,2631,0,NULL),(3948,2648,0,11),(3949,1336,0,NULL),(3951,287,0,NULL),(3952,2578,0,NULL),(3953,1837,0,NULL),(3954,2372,0,NULL),(3955,49,0,NULL),(3956,1344,0,NULL),(3957,2101,0,NULL),(3958,640,0,11),(3959,27,0,NULL),(3960,2310,0,NULL),(3961,3658,0,NULL),(3963,593,0,NULL),(3965,2813,0,NULL),(3966,1283,0,NULL),(3967,2056,0,NULL),(3968,1350,0,NULL),(3969,1582,0,NULL),(3970,35,0,NULL),(3971,1397,0,11),(3972,3414,0,11),(3973,2866,0,NULL),(3974,1656,0,11),(3975,262,0,NULL),(3976,783,0,NULL),(3977,2319,0,NULL),(3978,1080,0,NULL),(3979,2309,0,NULL),(3981,3134,0,NULL),(3982,3666,0,11),(3983,1595,0,NULL),(3984,844,0,NULL),(3985,1028,0,NULL),(3986,3669,0,11),(3987,3082,0,NULL),(3989,2582,0,NULL),(3990,3362,0,NULL),(3991,290,0,NULL),(3992,3370,0,NULL),(3993,1083,0,NULL),(3994,2327,0,NULL),(3995,841,0,NULL),(3996,793,0,NULL),(3997,577,0,NULL),(3998,3148,0,NULL),(3999,615,0,11),(4001,528,0,NULL),(4002,104,0,11),(4003,84,0,NULL),(4004,2322,0,NULL),(4005,1580,0,NULL),(4006,101,0,11),(4007,3592,0,NULL),(4008,3110,0,NULL),(4009,1658,0,11),(4010,836,0,NULL),(4011,2417,0,11),(4012,832,0,NULL),(6114,3702,0,10),(6362,3969,1,10),(6363,3970,1,10),(6364,3971,1,10),(6365,3972,1,10),(6366,3973,1,10),(6367,3974,1,10),(6368,3975,1,10),(6369,3976,1,10),(6370,3977,1,10),(6371,3978,1,10),(6372,3979,1,10),(6373,3980,1,10),(6374,3981,1,10),(6375,3982,1,10),(6376,3983,1,10),(6377,3984,1,10),(6378,3985,1,10),(6379,3986,1,10),(6393,4000,1,10),(6394,4001,1,10),(6395,4002,1,10),(6396,4003,1,10),(6397,4004,1,10),(6398,4005,1,10),(6399,4006,1,10),(6400,4007,1,10),(6401,4008,1,10),(6402,4009,1,10),(6403,4010,1,10),(6404,4011,1,10),(6405,4012,1,10),(6406,4013,1,10),(6407,4014,1,10),(6408,4015,1,10),(6409,4016,1,10),(6410,4017,1,10),(6429,4045,1,10),(6430,4040,1,10),(6431,4051,1,10),(6432,4050,1,10),(6433,4041,1,10),(6434,4043,1,10),(6435,4047,1,10),(6436,4054,1,10),(6437,4044,1,10),(6438,4057,1,10),(6439,4048,1,10),(6440,4042,1,10),(6441,4056,1,10),(6442,4049,1,10),(6443,4046,1,10),(6444,4052,1,10),(6445,4055,1,10),(6446,4053,1,10),(6447,4074,1,10),(6448,4088,1,10),(6449,4079,1,10),(6450,4076,1,10),(6451,4082,1,10),(6452,4083,1,10),(6453,4078,1,10),(6454,4072,1,10),(6455,4073,1,10),(6456,4081,1,10),(6457,4086,1,10),(6458,4075,1,10),(6459,4085,1,10),(6460,4080,1,10),(6461,4084,1,10),(6462,4071,1,10),(6463,4077,1,10),(6464,4087,1,10),(6465,4089,1,10),(6466,4090,1,10),(6467,4091,1,10),(6468,4092,1,10),(6469,4093,1,10),(6470,4094,1,10),(6471,4095,1,10),(6472,4096,1,10),(6473,4097,1,10),(6474,4098,1,10),(6475,4099,1,10),(6476,4100,1,10),(6477,4101,1,10),(6478,4102,1,10),(6479,4103,1,10),(6480,4104,1,10),(6481,4105,1,10),(6482,4106,1,10),(6496,4120,1,10),(6497,4121,1,10),(6498,4122,1,10),(6499,4123,1,10),(6500,4124,1,10),(6501,4125,1,10),(6502,4126,1,10),(6503,4127,1,10),(6504,4128,1,10),(6505,4129,1,10),(6506,4130,1,10),(6507,4131,1,10),(6508,4132,1,10),(6509,4133,1,10),(6510,4134,1,10),(6511,4135,1,10),(6512,4136,1,10),(6513,4137,1,10),(6514,4138,1,10),(6515,4139,1,10),(6516,4140,1,10),(6517,4141,1,10),(6518,4142,1,10),(6519,4143,1,10),(6520,4144,1,10),(6521,4145,1,10),(6522,4146,1,10),(6523,4147,1,10),(6524,4148,1,10),(6525,4149,1,10),(6526,4150,1,10),(6527,4151,1,10),(6528,4152,1,10),(6529,4153,1,10),(6530,4154,1,10),(6531,4155,1,10),(6532,4156,1,NULL),(6533,4157,1,NULL),(6534,4158,1,NULL),(6535,4159,1,NULL),(6536,4160,1,NULL),(6537,4161,1,NULL),(6538,4162,1,NULL),(6539,4163,1,NULL),(6540,4164,1,NULL),(6541,4165,1,NULL),(6542,4166,1,NULL),(6543,4167,1,NULL),(6544,4168,1,NULL),(6545,4169,1,NULL),(6546,4170,1,NULL),(6547,4171,1,NULL),(6548,4172,1,NULL),(6549,4173,1,NULL),(6550,4174,1,NULL),(6563,4187,1,10),(6564,4188,1,10),(6565,4189,1,10),(6566,4190,1,10),(6567,4191,1,10),(6568,4192,1,10),(6569,4193,1,10),(6570,4194,1,10),(6571,4195,1,10),(6572,4196,1,10),(6573,4197,1,10),(6574,4198,1,10),(6575,4199,1,10),(6576,4200,1,10),(6577,4201,1,10),(6578,4202,1,10),(6579,4203,1,10),(6580,4204,1,10),(6581,4205,1,10),(6594,4218,1,10),(6595,4219,1,10),(6596,4220,1,10),(6597,4221,1,10),(6598,4222,1,10),(6599,4223,1,10),(6600,4224,1,10),(6601,4225,1,10),(6602,4226,1,10),(6603,4227,1,10),(6604,4228,1,10),(6605,4229,1,10),(6606,4230,1,10),(6607,4231,1,10),(6608,4232,1,10),(6609,4233,1,10),(6610,4234,1,10),(6611,4235,1,10),(6612,4236,1,10),(6625,4249,1,10),(6626,4250,1,10),(6627,4251,1,10),(6628,4252,1,10),(6629,4253,1,10),(6630,4254,1,10),(6631,4255,1,10),(6632,4256,1,10),(6633,4257,1,10),(6634,4258,1,10),(6635,4259,1,10),(6636,4260,1,10),(6637,4261,1,10),(6638,4262,1,10),(6639,4263,1,10),(6640,4264,1,10),(6641,4265,1,10),(6642,4266,1,10),(6643,4267,1,10),(6644,4298,1,10),(6645,4297,1,10),(6646,4304,1,10),(6647,4302,1,10),(6648,4305,1,10),(6649,4293,1,10),(6650,4296,1,10),(6651,4295,1,10),(6652,4294,1,10),(6653,4291,1,10),(6654,4289,1,10),(6655,4299,1,10),(6656,4288,1,10),(6657,4292,1,10),(6658,4300,1,10),(6659,4301,1,10),(6660,4290,1,10),(6661,4287,1,10),(6662,4303,1,10),(6663,4308,1,10),(6664,4317,1,10),(6665,4309,1,10),(6666,4323,1,10),(6667,4314,1,10),(6668,4320,1,10),(6669,4321,1,10),(6670,4310,1,10),(6671,4311,1,10),(6672,4312,1,10),(6673,4324,1,10),(6674,4313,1,10),(6675,4307,1,10),(6676,4318,1,10),(6677,4316,1,10),(6678,4322,1,10),(6679,4319,1,10),(6680,4315,1,10),(6681,4306,1,10),(6682,4325,1,10),(6683,4328,1,10),(6684,4326,1,10),(6685,4339,1,10),(6686,4332,1,10),(6687,4344,1,10),(6688,4337,1,10),(6689,4333,1,10),(6690,4329,1,10),(6691,4330,1,10),(6692,4340,1,10),(6693,4341,1,10),(6694,4331,1,10),(6695,4343,1,10),(6696,4342,1,10),(6697,4327,1,10),(6698,4334,1,10),(6699,4345,1,10),(6700,4335,1,10),(6701,4338,1,10),(6702,4336,1,10),(6703,4386,1,NULL),(6704,4359,1,10),(6705,4383,1,NULL),(6706,4396,1,NULL),(6707,4384,1,NULL),(6708,4349,1,10),(6709,4350,1,10),(6710,4357,1,10),(6711,4347,1,10),(6712,4389,1,NULL),(6713,4361,1,10),(6714,4395,1,NULL),(6715,4354,1,10),(6716,4385,1,NULL),(6717,4377,1,NULL),(6718,4392,1,NULL),(6719,4387,1,NULL),(6720,4353,1,10),(6721,4380,1,NULL),(6722,4381,1,NULL),(6723,4348,1,10),(6724,4352,1,10),(6725,4382,1,NULL),(6726,4358,1,10),(6727,4378,1,NULL),(6728,4356,1,10),(6729,4362,1,10),(6730,4391,1,NULL),(6731,4364,1,10),(6732,4363,1,10),(6733,4360,1,10),(6734,4365,1,10),(6735,4346,1,10),(6736,4351,1,10),(6737,4394,1,NULL),(6738,4388,1,NULL),(6739,4390,1,NULL),(6740,4379,1,NULL),(6741,4355,1,10),(6742,4393,1,NULL),(6743,4409,1,10),(6744,4414,1,10),(6745,4420,1,10),(6746,4421,1,10),(6747,4418,1,10),(6748,4427,1,10),(6749,4415,1,10),(6750,4413,1,10),(6751,4425,1,10),(6752,4428,1,10),(6753,4423,1,10),(6754,4417,1,10),(6755,4426,1,10),(6756,4411,1,10),(6757,4416,1,10),(6758,4419,1,10),(6759,4412,1,10),(6760,4410,1,10),(6761,4422,1,10),(6762,4424,1,10),(6763,4441,1,10),(6764,4442,1,10),(6765,4443,1,10),(6766,4444,1,10),(6767,4445,1,10),(6768,4446,1,10),(6769,4447,1,10),(6770,4448,1,10),(6771,4449,1,10),(6772,4450,1,10),(6773,4451,1,10),(6774,4452,1,10),(6775,4453,1,10),(6776,4454,1,10),(6777,4455,1,10),(6778,4456,1,10),(6779,4457,1,10),(6780,4458,1,10),(6781,4459,1,10),(6782,4460,1,10),(6783,4461,1,10),(6787,4462,1,10),(6788,4463,1,10),(6789,4464,1,10),(6790,4465,1,10),(6791,4466,1,10),(6792,4467,1,10),(6793,4468,1,10),(6794,4469,1,10),(6795,4470,1,10),(6796,4471,1,10),(6797,4472,1,10),(6798,4473,1,10),(6799,4474,1,10),(6800,4475,1,10),(6801,4476,1,10),(6802,4477,1,10),(6803,4478,1,10),(6804,4479,1,10),(6805,4480,1,10),(6806,4481,1,10),(6807,4482,1,10),(6818,4493,1,10),(6819,4494,1,10),(6820,4495,1,10),(6821,4496,1,10),(6822,4497,1,10),(6823,4498,1,10),(6824,4499,1,10),(6825,4500,1,10),(6826,4501,1,10),(6827,4502,1,10),(6828,4503,1,10),(6829,4504,1,10),(6830,4505,1,10),(6831,4506,1,10),(6832,4507,1,10),(6833,4508,1,10),(6834,4509,1,10),(6835,4510,1,10),(6836,4511,1,10),(6837,4512,1,10),(6838,4513,1,10),(6849,4524,1,10),(6850,4525,1,10),(6851,4526,1,10),(6852,4527,1,10),(6853,4528,1,10),(6854,4529,1,10),(6855,4530,1,10),(6856,4531,1,10),(6857,4532,1,10),(6858,4533,1,10),(6859,4534,1,10),(6860,4535,1,10),(6861,4536,1,10),(6862,4537,1,10),(6863,4538,1,10),(6864,4539,1,10),(6865,4540,1,10),(6866,4541,1,10),(6867,4542,1,10),(6868,4543,1,10),(6869,4544,1,10),(6880,4555,1,10),(6881,4309,0,11),(6882,4364,0,11),(6883,4046,0,11),(6884,4338,0,11),(6885,4222,0,11),(6886,4294,0,11),(6887,4421,0,11),(6888,4539,0,11),(6889,3985,0,11),(6890,4512,0,11),(6891,4452,0,11),(6892,4444,0,11),(6893,3970,0,11),(6894,4016,0,11),(6895,4352,0,11),(6896,3982,0,11),(6897,4251,0,11),(6898,4348,0,11),(6899,4443,0,11),(6900,4218,0,11),(6901,4097,0,11),(6902,4322,0,11),(6903,4297,0,11),(6904,4146,0,11),(6905,4422,0,11),(6906,4091,0,11),(6907,4140,0,11),(6908,4048,0,11),(6909,4197,0,11),(6910,4334,0,11),(6911,4324,0,11),(6912,4456,0,11),(6913,4310,0,11),(6914,4445,0,11),(6915,4265,0,11),(6916,4312,0,11),(6917,4459,0,11),(6918,4259,0,11),(6919,4499,0,11),(6920,4341,0,11),(6921,4252,0,11),(6922,4317,0,11),(6923,4011,0,11),(6924,4415,0,11),(6925,4052,0,11),(6926,4123,0,11),(6927,4287,0,11),(6928,4007,0,11),(6929,4319,0,11),(6930,4084,0,11),(6931,4301,0,11),(6932,4416,0,11),(6933,4361,0,11),(6934,4198,0,11),(6935,4121,0,11),(6936,4508,0,11),(6937,4057,0,11),(6938,4095,0,11),(6939,4419,0,11),(6940,4136,0,11),(6941,4075,0,11),(6942,4349,0,11),(6943,4315,0,11),(6944,3976,0,11),(6945,4412,0,11),(6946,4524,0,11),(6947,4077,0,11),(6948,4343,0,11),(6949,4423,0,11),(6950,3978,0,11),(6951,4328,0,11),(6952,4229,0,11),(6953,4441,0,11),(6954,4303,0,11),(6955,4139,0,11),(6956,4050,0,11),(6957,4418,0,11),(6958,4090,0,11),(6959,3980,0,11),(6960,4525,0,11),(6961,4073,0,11),(6962,4450,0,11),(6963,4253,0,11),(6964,3984,0,11),(6965,4458,0,11),(6966,3973,0,11),(6967,4448,0,11),(6968,4538,0,11),(6969,4454,0,11),(6970,4293,0,11),(6971,4288,0,11),(6972,4223,0,11),(6973,4344,0,11),(6974,4424,0,11),(6975,4464,0,11),(6976,4466,0,11),(6977,4006,0,11),(6978,4480,0,11),(6979,4510,0,11),(6980,4094,0,11),(6981,4128,0,11),(6982,4331,0,11),(6983,4154,0,11),(6984,4479,0,11),(6985,4221,0,11),(6986,4455,0,11),(6987,4469,0,11),(6988,4017,0,11),(6989,4541,0,11),(6990,4325,0,11),(6991,4337,0,11),(6992,4496,0,11),(6993,4533,0,11),(6994,4005,0,11),(6995,4013,0,11),(6996,4055,0,11),(6997,4329,0,11),(6998,4129,0,11),(6999,4475,0,11),(7000,4250,0,11),(7001,4509,0,11),(7002,4289,0,11),(7003,4105,0,11),(7004,4096,0,11),(7005,3969,0,11),(7006,4249,0,11),(7007,3971,0,11),(7008,4227,0,11),(7009,4135,0,11),(7010,4467,0,11),(7011,4081,0,11),(7012,4504,0,11),(7013,4511,0,11),(7014,4461,0,11),(7015,4255,0,11),(7016,4537,0,11),(7017,4235,0,11),(7018,4078,0,11),(7019,4000,0,11),(7020,4236,0,11),(7021,4144,0,11),(7022,4127,0,11),(7023,4125,0,11),(7024,4053,0,11),(7025,4106,0,11),(7026,4460,0,11),(7027,4420,0,11),(7028,4311,0,11),(7029,4200,0,11),(7030,4220,0,11),(7031,4482,0,11),(7032,4205,0,11),(7033,4087,0,11),(7034,4143,0,11),(7035,4228,0,11),(7036,4307,0,11),(7037,4082,0,11),(7038,4342,0,11),(7039,4357,0,11),(7040,4047,0,11),(7041,4365,0,11),(7042,4494,0,11),(7043,4503,0,11),(7044,4291,0,11),(7045,4413,0,11),(7046,4132,0,11),(7047,4040,0,11),(7048,4261,0,11),(7049,4468,0,11),(7050,4258,0,11),(7051,4327,0,11),(7052,4148,0,11),(7053,4015,0,11),(7054,4339,0,11),(7055,4326,0,11),(7056,4122,0,11),(7057,4193,0,11),(7058,4356,0,11),(7059,4474,0,11),(7060,4313,0,11),(7061,3972,0,11),(7062,4532,0,11),(7063,4447,0,11),(7064,4204,0,11),(7065,4076,0,11),(7066,4231,0,11),(7067,3983,0,11),(7068,4543,0,11),(7069,4507,0,11),(7070,4351,0,11),(7071,4335,0,11),(7072,4318,0,11),(7073,4130,0,11),(7074,4085,0,11),(7075,4071,0,11),(7076,4363,0,11),(7077,4041,0,11),(7078,4529,0,11),(7079,4345,0,11),(7080,4347,0,11),(7081,4049,0,11),(7082,4299,0,11),(7083,4449,0,11),(7084,4099,0,11),(7085,4534,0,11),(7086,4264,0,11),(7087,4150,0,11),(7088,4332,0,11),(7089,4476,0,11),(7090,4056,0,11),(7091,4528,0,11),(7092,4257,0,11),(7093,4333,0,11),(7094,4457,0,11),(7095,4196,0,11),(7096,4093,0,11),(7097,4501,0,11),(7098,4014,0,11),(7099,4362,0,11),(7100,4320,0,11),(7101,4292,0,11),(7102,4088,0,11),(7103,4234,0,11),(7104,4531,0,11),(7105,4316,0,11),(7106,4481,0,11),(7107,4463,0,11),(7108,4298,0,11),(7109,4425,0,11),(7110,4233,0,11),(7111,4340,0,11),(7112,4544,0,11),(7113,4074,0,11),(7114,4145,0,11),(7115,4354,0,11),(7116,4502,0,11),(7117,4305,0,11),(7118,3986,0,11),(7119,4194,0,11),(7120,4043,0,11),(7121,4505,0,11),(7122,4473,0,11),(7123,4472,0,11),(7124,4414,0,11),(7125,4072,0,11),(7126,4044,0,11),(7127,4535,0,11),(7128,4446,0,11),(7129,4417,0,11),(7130,4428,0,11),(7131,4330,0,11),(7132,4506,0,11),(7133,4451,0,11),(7134,4353,0,11),(7135,4256,0,11),(7136,4314,0,11),(7137,4188,0,11),(7138,4142,0,11),(7139,4411,0,11),(7140,4226,0,11),(7141,4465,0,11),(7142,4152,0,11),(7143,4001,0,11),(7144,4131,0,11),(7145,4497,0,11),(7146,4300,0,11),(7147,4290,0,11),(7148,4045,0,11),(7149,4080,0,11),(7150,4409,0,11),(7151,3979,0,11),(7152,4336,0,11),(7153,4086,0,11),(7154,4009,0,11),(7155,4225,0,11),(7156,4155,0,11),(7157,4147,0,11),(7158,4527,0,11),(7159,4254,0,11),(7160,4526,0,11),(7161,4263,0,11),(7162,4295,0,11),(7163,4296,0,11),(7164,4192,0,11),(7165,4267,0,11),(7166,4500,0,11),(7167,4477,0,11),(7168,4002,0,11),(7169,4083,0,11),(7170,4410,0,11),(7171,4530,0,11),(7172,4195,0,11),(7173,4542,0,11),(7174,4137,0,11),(7175,4493,0,11),(7176,4003,0,11),(7177,4202,0,11),(7178,4442,0,11),(7179,3702,0,11),(7180,4089,0,11),(7181,4513,0,11),(7182,4187,0,11),(7183,4138,0,11),(7184,4133,0,11),(7185,4079,0,11),(7186,4266,0,11),(7187,4355,0,11),(7188,4103,0,11),(7189,4149,0,11),(7190,4201,0,11),(7191,4126,0,11),(7192,4536,0,11),(7193,4426,0,11),(7194,4189,0,11),(7195,4101,0,11),(7196,4478,0,11),(7197,4141,0,11),(7198,4054,0,11),(7199,4360,0,11),(7200,4042,0,11),(7201,4102,0,11),(7202,4304,0,11),(7203,4350,0,11),(7204,4308,0,11),(7205,4224,0,11),(7206,4010,0,11),(7207,4153,0,11),(7208,4190,0,11),(7209,4151,0,11),(7210,4191,0,11),(7211,4124,0,11),(7212,4232,0,11),(7213,4262,0,11),(7214,3974,0,11),(7215,4470,0,11),(7216,4092,0,11),(7217,3981,0,11),(7218,4498,0,11),(7219,4453,0,11),(7220,4051,0,11),(7221,4427,0,11),(7222,4260,0,11),(7223,4098,0,11),(7224,3977,0,11),(7225,4302,0,11),(7226,4230,0,11),(7227,4199,0,11),(7228,4540,0,11),(7229,4359,0,11),(7230,4321,0,11),(7231,4346,0,11),(7232,4358,0,11),(7233,3975,0,11),(7234,4462,0,11),(7235,4306,0,11),(7236,4008,0,11),(7237,4323,0,11),(7238,4134,0,11),(7239,4495,0,11),(7240,4004,0,11),(7241,4203,0,11),(7242,4012,0,11),(7243,4471,0,11),(7244,4100,0,11),(7245,4120,0,11),(7246,4104,0,11),(7247,4219,0,11),(7248,4555,0,11),(7249,130,0,13),(7250,1374,0,13),(7251,1405,0,13),(7252,4352,0,13),(7253,383,0,13),(7254,1659,0,13),(7255,4235,0,13),(7256,3163,0,13),(7257,1889,0,13),(7258,4017,0,13),(7259,358,0,13),(7260,628,0,13),(7261,2906,0,13),(7262,4263,0,13),(7263,2158,0,13),(7264,4500,0,13),(7265,4259,0,13),(7266,4131,0,13),(7267,4001,0,13),(7268,4300,0,13),(7269,1651,0,13),(7270,4474,0,13),(7271,4327,0,13),(7272,4535,0,13),(7273,4509,0,13),(7274,4543,0,13),(7275,4508,0,13),(7276,4102,0,13),(7277,4351,0,13),(7278,4091,0,13),(7279,4227,0,13),(7280,4335,0,13),(7281,4531,0,13),(7282,4538,0,13),(7283,4221,0,13),(7284,374,0,13),(7285,1115,0,13),(7286,4339,0,13),(7287,1635,0,13),(7288,4423,0,13),(7289,4329,0,13),(7290,2641,0,13),(7291,2678,0,13),(7292,3443,0,13),(7293,2308,0,13),(7294,615,0,13),(7295,1142,0,13),(7296,1402,0,13),(7297,3985,0,13),(7298,3406,0,13),(7299,2143,0,13),(7300,4330,0,13),(7301,1124,0,13),(7302,4042,0,13),(7303,4198,0,13),(7304,4252,0,13),(7305,4318,0,13),(7306,2402,0,13),(7307,4542,0,13),(7308,2165,0,13),(7309,1657,0,13),(7310,1906,0,13),(7311,4134,0,13),(7312,4290,0,13),(7313,3977,0,13),(7314,4095,0,13),(7315,4447,0,13),(7316,1393,0,13),(7317,382,0,13),(7318,4323,0,13),(7319,4501,0,13),(7320,4260,0,13),(7321,4410,0,13),(7322,3676,0,13),(7323,1033,1,13),(7324,4100,0,13),(7325,2818,0,13),(7326,385,0,13),(7327,3328,0,13),(7328,4544,0,13),(7329,3439,0,13),(7330,2420,0,13),(7331,4085,0,13),(7332,354,0,13),(7333,4345,0,13),(7334,3986,0,13),(7335,2652,0,13),(7336,2905,0,13),(7337,1892,0,13),(7338,4224,0,13),(7339,2169,0,13),(7340,2400,0,13),(7341,3155,0,13),(7342,4422,0,13),(7343,2140,0,13),(7344,4309,0,13),(7345,1403,0,13),(7346,4094,0,13),(7347,2422,0,13),(7348,4331,0,13),(7349,607,0,13),(7350,4506,0,13),(7351,4128,0,13),(7352,611,0,13),(7353,4012,0,13),(7354,3445,0,13),(7355,4305,0,13),(7356,4232,0,13),(7357,4443,0,13),(7358,4256,0,13),(7359,1903,0,13),(7360,3415,0,13),(7361,1111,0,13),(7362,384,0,13),(7363,1656,0,13),(7364,4463,0,13),(7365,861,0,13),(7366,1881,0,13),(7367,862,0,13),(7368,268,0,13),(7369,4348,0,13),(7370,2679,0,13),(7371,2164,0,13),(7372,4009,0,13),(7373,103,0,13),(7374,2924,0,13),(7375,886,0,13),(7376,4011,0,13),(7377,1885,0,13),(7378,1138,0,13),(7379,1141,0,13),(7380,3696,0,13),(7381,3669,0,13),(7382,1905,0,13),(7383,4072,0,13),(7384,4459,0,13),(7385,4424,0,13),(7386,636,0,13),(7387,4479,0,13),(7388,3668,0,13),(7389,2136,0,13),(7390,4049,0,13),(7391,4453,0,13),(7392,4320,0,13),(7393,4189,0,13),(7394,4470,0,13),(7395,4413,0,13),(7396,4097,0,13),(7397,4051,0,13),(7398,4055,0,13),(7399,104,0,13),(7400,4416,0,13),(7401,3073,1,13),(7402,4045,0,13),(7403,4503,0,13),(7404,346,0,13),(7405,4005,0,13),(7406,3167,0,13),(7407,613,0,13),(7408,1632,0,13),(7409,4087,0,13),(7410,4454,0,13),(7411,3700,0,13),(7412,4357,0,13),(7413,127,0,13),(7414,1380,0,13),(7415,4127,0,13),(7416,3440,0,13),(7417,4446,0,13),(7418,3410,0,13),(7419,4187,0,13),(7420,101,0,13),(7421,4142,0,13),(7422,891,0,13),(7423,4448,0,13),(7424,4249,0,13),(7425,3971,0,13),(7426,1394,0,13),(7427,1883,0,13),(7428,4088,0,13),(7429,3689,0,13),(7430,4254,0,13),(7431,4456,0,13),(7432,4513,0,13),(7433,4529,0,13),(7434,4442,0,13),(7435,3416,0,13),(7436,1904,0,13),(7437,4076,0,13),(7438,4363,0,13),(7439,605,0,13),(7440,3667,0,13),(7441,4015,0,13),(7442,1629,0,13),(7443,3984,0,13),(7444,4090,0,13),(7445,2424,0,13),(7446,3159,0,13),(7447,4359,0,13),(7448,4192,0,13),(7449,1116,0,13),(7450,4306,0,13),(7451,4462,0,13),(7452,3978,0,13),(7453,3417,0,13),(7454,4512,0,13),(7455,1396,0,13),(7456,4312,0,13),(7457,2901,0,13),(7458,375,0,13),(7459,612,0,13),(7460,1891,0,13),(7461,3693,0,13),(7462,4190,0,13),(7463,99,0,13),(7464,2394,0,13),(7465,1912,0,13),(7466,4205,0,13),(7467,3976,0,13),(7468,1653,0,13),(7469,2415,0,13),(7470,4236,0,13),(7471,4530,0,13),(7472,4350,0,13),(7473,778,0,13),(7474,1147,0,13),(7475,4532,0,13),(7476,3183,0,13),(7477,1288,0,13),(7478,4000,0,13),(7479,4056,0,13),(7480,1148,0,13),(7481,4098,0,13),(7482,2563,0,13),(7483,1397,0,13),(7484,4122,0,13),(7485,4466,0,13),(7486,4441,0,13),(7487,2390,0,13),(7488,4356,0,13),(7489,4078,0,13),(7490,4498,0,13),(7491,2929,0,13),(7492,4316,0,13),(7493,1123,0,13),(7494,2401,0,13),(7495,3690,0,13),(7496,4478,0,13),(7497,3688,0,13),(7498,128,0,13),(7499,2160,0,13),(7500,4450,0,13),(7501,2927,0,13),(7502,614,0,13),(7503,4421,0,13),(7504,2139,0,13),(7505,4229,0,13),(7506,2680,0,13),(7507,3699,0,13),(7508,4307,0,13),(7509,3436,0,13),(7510,4086,0,13),(7511,3161,0,13),(7512,1884,0,13),(7513,380,0,13),(7514,1117,0,13),(7515,4203,0,13),(7516,4151,0,13),(7517,350,0,13),(7518,3697,0,13),(7519,2656,0,13),(7520,2928,0,13),(7521,121,0,13),(7522,1627,0,13),(7523,4155,0,13),(7524,4353,0,13),(7525,3444,0,13),(7526,2655,0,13),(7527,1398,0,13),(7528,3166,0,13),(7529,609,0,13),(7530,4053,0,13),(7531,4231,0,13),(7532,4362,0,13),(7533,4047,0,13),(7534,632,0,13),(7535,4014,0,13),(7536,3670,0,13),(7537,4315,0,13),(7538,3671,0,13),(7539,1126,0,13),(7540,4002,0,13),(7541,4126,0,13),(7542,2671,0,13),(7543,860,0,13),(7544,361,0,13),(7545,376,0,13),(7546,1911,0,13),(7547,872,0,13),(7548,4540,0,13),(7549,3420,0,13),(7550,1913,0,13),(7551,3969,0,13),(7552,4219,0,13),(7553,1371,0,13),(7554,4555,0,13),(7555,1625,0,13),(7556,1543,0,13),(7557,4008,0,13),(7558,3414,0,13),(7559,4295,0,13),(7560,1880,0,13),(7561,4255,0,13),(7562,4288,0,13),(7563,4258,0,13),(7564,4200,0,13),(7565,3665,0,13),(7566,2934,0,13),(7567,4222,0,13),(7568,1798,0,13),(7569,4347,0,13),(7570,4526,0,13),(7571,4287,0,13),(7572,3419,0,13),(7573,2910,0,13),(7574,4332,0,13),(7575,2657,0,13),(7576,2903,0,13),(7577,3180,0,13),(7578,1634,0,13),(7579,4138,0,13),(7580,3422,0,13),(7581,2674,0,13),(7582,4150,0,13),(7583,3666,0,13),(7584,4006,0,13),(7585,616,0,13),(7586,125,0,13),(7587,2931,0,13),(7588,3970,0,13),(7589,3178,0,13),(7590,4148,0,13),(7591,98,0,13),(7592,2144,0,13),(7593,3972,0,13),(7594,4048,0,13),(7595,3677,0,13),(7596,4267,0,13),(7597,4354,0,13),(7598,1887,0,13),(7599,2654,0,13),(7600,1621,0,13),(7601,4342,0,13),(7602,2907,0,13),(7603,4191,0,13),(7604,3975,0,13),(7605,4418,0,13),(7606,2668,0,13),(7607,4230,0,13),(7608,1888,0,13),(7609,2930,0,13),(7610,4046,0,13),(7611,2392,0,13),(7612,4291,0,13),(7613,4495,0,13),(7614,3982,0,13),(7615,2395,0,13),(7616,4340,0,13),(7617,4140,0,13),(7618,1150,0,13),(7619,3437,0,13),(7620,4003,0,13),(7621,4464,0,13),(7622,123,0,13),(7623,3189,0,13),(7624,4257,0,13),(7625,2416,0,13),(7626,4145,0,13),(7627,633,0,13),(7628,4101,0,13),(7629,4425,0,13),(7630,4427,0,13),(7631,4465,0,13),(7632,2146,0,13),(7633,4141,0,13),(7634,856,0,13),(7635,2646,0,13),(7636,4461,0,13),(7637,106,0,13),(7638,892,0,13),(7639,2141,0,13),(7640,4358,0,13),(7641,4414,0,13),(7642,523,0,13),(7643,4264,0,13),(7644,4533,0,13),(7645,4089,0,13),(7646,1650,0,13),(7647,4013,0,13),(7648,1649,0,13),(7649,2419,0,13),(7650,2645,0,13),(7651,3411,0,13),(7652,4077,0,13),(7653,4360,0,13),(7654,4152,0,13),(7655,4044,0,13),(7656,4120,0,13),(7657,863,0,13),(7658,3182,0,13),(7659,871,0,13),(7660,610,0,13),(7661,4343,0,13),(7662,4084,0,13),(7663,4052,0,13),(7664,1395,0,13),(7665,4266,0,13),(7666,4468,0,13),(7667,4525,0,13),(7668,4409,0,13),(7669,2413,0,13),(7670,4106,0,13),(7671,4504,0,13),(7672,4296,0,13),(7673,129,0,13),(7674,640,0,13),(7675,1399,0,13),(7676,2161,0,13),(7677,2138,0,13),(7678,1910,0,13),(7679,3583,0,13),(7680,1637,0,13),(7681,1372,0,13),(7682,890,0,13),(7683,4083,0,13),(7684,1143,0,13),(7685,3188,0,13),(7686,1876,0,13),(7687,4261,0,13),(7688,4507,0,13),(7689,2162,0,13),(7690,2418,0,13),(7691,4124,0,13),(7692,381,0,13),(7693,2053,1,13),(7694,3675,0,13),(7695,4218,0,13),(7696,2147,0,13),(7697,3157,0,13),(7698,3672,0,13),(7699,3190,0,13),(7700,3435,0,13),(7701,2168,0,13),(7702,4534,0,13),(7703,4314,0,13),(7704,2923,0,13),(7705,3160,0,13),(7706,3162,0,13),(7707,894,0,13),(7708,356,0,13),(7709,893,0,13),(7710,95,0,13),(7711,4304,0,13),(7712,3692,0,13),(7713,4233,0,13),(7714,2911,0,13),(7715,2170,0,13),(7716,3184,0,13),(7717,4250,0,13),(7718,4074,0,13),(7719,4301,0,13),(7720,4040,0,13),(7721,1125,0,13),(7722,4415,0,13),(7723,1120,0,13),(7724,2414,0,13),(7725,2421,0,13),(7726,4364,0,13),(7727,2163,0,13),(7728,4234,0,13),(7729,4149,0,13),(7730,2647,0,13),(7731,3165,0,13),(7732,4188,0,13),(7733,4328,0,13),(7734,884,0,13),(7735,887,0,13),(7736,1377,0,13),(7737,1118,0,13),(7738,4365,0,13),(7739,360,0,13),(7740,4289,0,13),(7741,2900,0,13),(7742,4473,0,13),(7743,1146,0,13),(7744,1886,0,13),(7745,4153,0,13),(7746,3674,0,13),(7747,4303,0,13),(7748,4223,0,13),(7749,1404,0,13),(7750,1378,0,13),(7751,4193,0,13),(7752,4444,0,13),(7753,4228,0,13),(7754,3418,0,13),(7755,4004,0,13),(7756,4225,0,13),(7757,864,0,13),(7758,2399,0,13),(7759,3694,0,13),(7760,4334,0,13),(7761,1631,0,13),(7762,868,0,13),(7763,4537,0,13),(7764,4092,0,13),(7765,1633,0,13),(7766,4494,0,13),(7767,3158,0,13),(7768,2669,0,13),(7769,357,0,13),(7770,97,0,13),(7771,2386,0,13),(7772,4539,0,13),(7773,2904,0,13),(7774,4147,0,13),(7775,1890,0,13),(7776,2397,0,13),(7777,4297,0,13),(7778,4253,0,13),(7779,4096,0,13),(7780,3691,0,13),(7781,4417,0,13),(7782,2393,0,13),(7783,1652,0,13),(7784,885,0,13),(7785,102,0,13),(7786,634,0,13),(7787,2935,0,13),(7788,4265,0,13),(7789,2926,0,13),(7790,869,0,13),(7791,1400,0,13),(7792,601,0,13),(7793,4121,0,13),(7794,1628,0,13),(7795,4136,0,13),(7796,4093,0,13),(7797,4324,0,13),(7798,1122,0,13),(7799,4204,0,13),(7800,4451,0,13),(7801,2650,0,13),(7802,4196,0,13),(7803,4071,0,13),(7804,2675,0,13),(7805,1370,0,13),(7806,352,0,13),(7807,3442,0,13),(7808,4505,0,13),(7809,2396,0,13),(7810,4294,0,13),(7811,3434,0,13),(7812,120,0,13),(7813,126,0,13),(7814,4043,0,13),(7815,4452,0,13),(7816,1144,0,13),(7817,1375,0,13),(7818,3979,0,13),(7819,4344,0,13),(7820,4502,0,13),(7821,895,0,13),(7822,1660,0,13),(7823,4346,0,13),(7824,4457,0,13),(7825,4299,0,13),(7826,2167,0,13),(7827,2649,0,13),(7828,1140,0,13),(7829,4321,0,13),(7830,4476,0,13),(7831,1373,0,13),(7832,4420,0,13),(7833,637,0,13),(7834,124,0,13),(7835,4197,0,13),(7836,4336,0,13),(7837,629,0,13),(7838,4524,0,13),(7839,4057,0,13),(7840,4322,0,13),(7841,4445,0,13),(7842,4510,0,13),(7843,3186,0,13),(7844,4455,0,13),(7845,4458,0,13),(7846,1909,0,13),(7847,2398,0,13),(7848,4251,0,13),(7849,4460,0,13),(7850,4541,0,13),(7851,865,0,13),(7852,4333,0,13),(7853,119,0,13),(7854,4311,0,13),(7855,1382,0,13),(7856,373,0,13),(7857,2670,0,13),(7858,4139,0,13),(7859,1648,0,13),(7860,4480,0,13),(7861,2909,0,13),(7862,3438,0,13),(7863,4341,0,13),(7864,355,0,13),(7865,617,0,13),(7866,4105,0,13),(7867,1379,0,13),(7868,4010,0,13),(7869,100,0,13),(7870,1376,0,13),(7871,2145,0,13),(7872,122,0,13),(7873,4481,0,13),(7874,4349,0,13),(7875,377,0,13),(7876,3181,0,13),(7877,4075,0,13),(7878,4146,0,13),(7879,1630,0,13),(7880,2933,0,13),(7881,4428,0,13),(7882,1139,0,13),(7883,2896,0,13),(7884,4073,0,13),(7885,4154,0,13),(7886,353,0,13),(7887,635,0,13),(7888,1636,0,13),(7889,2131,0,13),(7890,3983,0,13),(7891,4471,0,13),(7892,3441,0,13),(7893,4123,0,13),(7894,4293,0,13),(7895,4103,0,13),(7896,1914,0,13),(7897,1366,0,13),(7898,4081,0,13),(7899,4325,0,13),(7900,4099,0,13),(7901,4497,0,13),(7902,3151,0,13),(7903,4319,0,13),(7904,4511,0,13),(7905,638,0,13),(7906,4194,0,13),(7907,4317,0,13),(7908,4527,0,13),(7909,1907,0,13),(7910,3973,0,13),(7911,4302,0,13),(7912,2676,0,13),(7913,4326,0,13),(7914,2653,0,13),(7915,4477,0,13),(7916,3187,0,13),(7917,105,0,13),(7918,4133,0,13),(7919,4310,0,13),(7920,4137,0,13),(7921,4195,0,13),(7922,4496,0,13),(7923,3412,0,13),(7924,3695,0,13),(7925,4475,0,13),(7926,4130,0,13),(7927,359,0,13),(7928,4262,0,13),(7929,4199,0,13),(7930,3673,0,13),(7931,1908,0,13),(7932,4337,0,13),(7933,3156,0,13),(7934,362,0,13),(7935,4355,0,13),(7936,888,0,13),(7937,1658,0,13),(7938,2417,0,13),(7939,4007,0,13),(7940,4412,0,13),(7941,118,0,13),(7942,4054,0,13),(7943,4201,0,13),(7944,4469,0,13),(7945,1119,0,13),(7946,3661,0,13),(7947,4129,0,13),(7948,4298,0,13),(7949,4482,0,13),(7950,2925,0,13),(7951,630,0,13),(7952,2425,0,13),(7953,351,0,13),(7954,889,0,13),(7955,4419,0,13),(7956,3698,0,13),(7957,631,0,13),(7958,4472,0,13),(7959,1654,0,13),(7960,4292,0,13),(7961,91,0,13),(7962,2902,0,13),(7963,379,0,13),(7964,1381,0,13),(7965,4041,0,13),(7966,2423,0,13),(7967,4082,0,13),(7968,1401,0,13),(7969,3433,0,13),(7970,3974,0,13),(7971,4202,0,13),(7972,2672,0,13),(7973,867,0,13),(7974,2908,0,13),(7975,4426,0,13),(7976,2677,0,13),(7977,3185,0,13),(7978,4144,0,13),(7979,4132,0,13),(7980,3421,0,13),(7981,2137,0,13),(7982,4338,0,13),(7983,1121,0,13),(7984,3702,0,13),(7985,1127,0,13),(7986,1149,0,13),(7987,866,0,13),(7988,4135,0,13),(7989,2648,0,13),(7990,4361,0,13),(7991,378,0,13),(7992,2391,0,13),(7993,4536,0,13),(7994,96,0,13),(7995,1915,0,13),(7996,4050,0,13),(7997,4104,0,13),(7998,3980,0,13),(7999,3164,0,13),(8000,3179,0,13),(8001,4313,0,13),(8002,4079,0,13),(8003,2142,0,13),(8004,4449,0,13),(8005,2651,0,13),(8006,4016,0,13),(8007,2912,0,13),(8008,13,1,13),(8009,4499,0,13),(8010,1626,0,13),(8011,107,0,13),(8012,4411,0,13),(8013,2932,0,13),(8014,870,0,13),(8015,1655,0,13),(8016,4143,0,13),(8017,608,0,13),(8018,4125,0,13),(8019,1882,0,13),(8020,4308,0,13),(8021,2166,0,13),(8022,4467,0,13),(8023,4493,0,13),(8024,4080,0,13),(8025,4220,0,13),(8026,4528,0,13),(8027,3413,0,13),(8028,2135,0,13),(8029,606,0,13),(8030,883,0,13),(8031,1145,0,13),(8032,3981,0,13),(8033,2673,0,13),(8034,2159,0,13),(8035,639,0,13),(8036,4226,0,13),(8037,4539,0,14),(8038,374,0,14),(8039,4139,0,14),(8040,102,0,14),(8041,3437,0,14),(8042,4199,0,14),(8043,4125,0,14),(8044,3187,0,14),(8045,4014,0,14),(8046,4335,0,14),(8047,3414,0,14),(8048,4455,0,14),(8049,4364,0,14),(8050,639,0,14),(8051,4220,0,14),(8052,2391,0,14),(8053,4296,0,14),(8054,1120,0,14),(8055,4348,0,14),(8056,4421,0,14),(8057,3984,0,14),(8058,353,0,14),(8059,638,0,14),(8060,2165,0,14),(8061,379,0,14),(8062,4017,0,14),(8063,3185,0,14),(8064,2679,0,14),(8065,4290,0,14),(8066,3438,0,14),(8067,4103,0,14),(8068,2675,0,14),(8069,2900,0,14),(8070,4289,0,14),(8071,4426,0,14),(8072,103,0,14),(8073,4478,0,14),(8074,1903,0,14),(8075,4349,0,14),(8076,4256,0,14),(8077,4225,0,14),(8078,3184,0,14),(8079,3160,0,14),(8080,4363,0,14),(8081,1123,0,14),(8082,1399,0,14),(8083,4498,0,14),(8084,380,0,14),(8085,2818,1,14),(8086,629,0,14),(8087,2422,0,14),(8088,1149,0,14),(8089,2392,0,14),(8090,2680,0,14),(8091,4537,0,14),(8092,1915,0,14),(8093,605,0,14),(8094,883,0,14),(8095,4047,0,14),(8096,856,0,14),(8097,1628,0,14),(8098,3419,0,14),(8099,4332,0,14),(8100,612,0,14),(8101,123,0,14),(8102,4258,0,14),(8103,1885,0,14),(8104,4461,0,14),(8105,1146,0,14),(8106,4132,0,14),(8107,4195,0,14),(8108,4327,0,14),(8109,4236,0,14),(8110,4464,0,14),(8111,352,0,14),(8112,1910,0,14),(8113,1127,0,14),(8114,1906,0,14),(8115,2425,0,14),(8116,4457,0,14),(8117,4362,0,14),(8118,1650,0,14),(8119,3980,0,14),(8120,4299,0,14),(8121,1122,0,14),(8122,4334,0,14),(8123,360,0,14),(8124,2928,0,14),(8125,4346,0,14),(8126,3676,0,14),(8127,4148,0,14),(8128,4308,0,14),(8129,4314,0,14),(8130,4310,0,14),(8131,2656,0,14),(8132,3178,0,14),(8133,4303,0,14),(8134,4534,0,14),(8135,608,0,14),(8136,2935,0,14),(8137,4505,0,14),(8138,4417,0,14),(8139,4524,0,14),(8140,96,0,14),(8141,2907,0,14),(8142,2641,0,14),(8143,4446,0,14),(8144,2647,0,14),(8145,4146,0,14),(8146,4005,0,14),(8147,2138,0,14),(8148,633,0,14),(8149,126,0,14),(8150,4312,0,14),(8151,1144,0,14),(8152,607,0,14),(8153,4481,0,14),(8154,4330,0,14),(8155,3186,0,14),(8156,4137,0,14),(8157,4288,0,14),(8158,1372,0,14),(8159,4477,0,14),(8160,1654,0,14),(8161,872,0,14),(8162,268,1,14),(8163,1660,0,14),(8164,2166,0,14),(8165,4145,0,14),(8166,3167,0,14),(8167,860,0,14),(8168,100,0,14),(8169,2671,0,14),(8170,4002,0,14),(8171,3675,0,14),(8172,3983,0,14),(8173,4318,0,14),(8174,4003,0,14),(8175,4445,0,14),(8176,3418,0,14),(8177,4504,0,14),(8178,888,0,14),(8179,4324,0,14),(8180,4253,0,14),(8181,1883,0,14),(8182,119,0,14),(8183,357,0,14),(8184,4049,0,14),(8185,4291,0,14),(8186,127,0,14),(8187,3978,0,14),(8188,1371,0,14),(8189,3179,0,14),(8190,4480,0,14),(8191,4328,0,14),(8192,4093,0,14),(8193,2390,0,14),(8194,1888,0,14),(8195,3422,0,14),(8196,4048,0,14),(8197,4506,0,14),(8198,4422,0,14),(8199,2910,0,14),(8200,4533,0,14),(8201,2141,0,14),(8202,1405,0,14),(8203,4230,0,14),(8204,4102,0,14),(8205,4055,0,14),(8206,3673,0,14),(8207,2424,0,14),(8208,1798,1,14),(8209,1629,0,14),(8210,4359,0,14),(8211,4353,0,14),(8212,4358,0,14),(8213,2146,0,14),(8214,3162,0,14),(8215,4409,0,14),(8216,4529,0,14),(8217,130,0,14),(8218,4006,0,14),(8219,4509,0,14),(8220,4526,0,14),(8221,884,0,14),(8222,4321,0,14),(8223,1890,0,14),(8224,2158,0,14),(8225,4007,0,14),(8226,1621,0,14),(8227,4475,0,14),(8228,4266,0,14),(8229,2417,0,14),(8230,4101,0,14),(8231,4080,0,14),(8232,4459,0,14),(8233,2678,0,14),(8234,1884,0,14),(8235,373,0,14),(8236,892,0,14),(8237,4191,0,14),(8238,356,0,14),(8239,1370,0,14),(8240,3976,0,14),(8241,107,0,14),(8242,4086,0,14),(8243,4130,0,14),(8244,4091,0,14),(8245,4544,0,14),(8246,1630,0,14),(8247,3665,0,14),(8248,4508,0,14),(8249,4264,0,14),(8250,4448,0,14),(8251,4428,0,14),(8252,3691,0,14),(8253,3180,0,14),(8254,4525,0,14),(8255,4131,0,14),(8256,4531,0,14),(8257,3690,0,14),(8258,889,0,14),(8259,4201,0,14),(8260,2924,0,14),(8261,1288,1,14),(8262,3669,0,14),(8263,2161,0,14),(8264,4443,0,14),(8265,4343,0,14),(8266,1126,0,14),(8267,4233,0,14),(8268,4300,0,14),(8269,2145,0,14),(8270,1914,0,14),(8271,4474,0,14),(8272,4076,0,14),(8273,4336,0,14),(8274,378,0,14),(8275,2911,0,14),(8276,4079,0,14),(8277,2649,0,14),(8278,4267,0,14),(8279,4326,0,14),(8280,2159,0,14),(8281,4051,0,14),(8282,1366,0,14),(8283,4449,0,14),(8284,1373,0,14),(8285,2053,1,14),(8286,4472,0,14),(8287,4249,0,14),(8288,2399,0,14),(8289,4470,0,14),(8290,3671,0,14),(8291,4149,0,14),(8292,1400,0,14),(8293,1142,0,14),(8294,4000,0,14),(8295,1913,0,14),(8296,4322,0,14),(8297,614,0,14),(8298,3445,0,14),(8299,2143,0,14),(8300,1148,0,14),(8301,636,0,14),(8302,4254,0,14),(8303,1891,0,14),(8304,2164,0,14),(8305,2414,0,14),(8306,2646,0,14),(8307,3420,0,14),(8308,4052,0,14),(8309,4193,0,14),(8310,4223,0,14),(8311,613,0,14),(8312,3159,0,14),(8313,4293,0,14),(8314,3667,0,14),(8315,3689,0,14),(8316,2137,0,14),(8317,4198,0,14),(8318,4476,0,14),(8319,4232,0,14),(8320,4329,0,14),(8321,350,0,14),(8322,894,0,14),(8323,1889,0,14),(8324,4337,0,14),(8325,1909,0,14),(8326,4082,0,14),(8327,4187,0,14),(8328,381,0,14),(8329,362,0,14),(8330,1892,0,14),(8331,4126,0,14),(8332,1907,0,14),(8333,4097,0,14),(8334,1140,0,14),(8335,1653,0,14),(8336,4196,0,14),(8337,4151,0,14),(8338,2423,0,14),(8339,4129,0,14),(8340,4154,0,14),(8341,383,0,14),(8342,4262,0,14),(8343,1404,0,14),(8344,4360,0,14),(8345,4454,0,14),(8346,2308,1,14),(8347,4150,0,14),(8348,120,0,14),(8349,4311,0,14),(8350,4530,0,14),(8351,2645,0,14),(8352,1401,0,14),(8353,4342,0,14),(8354,4495,0,14),(8355,3692,0,14),(8356,4542,0,14),(8357,1393,0,14),(8358,4152,0,14),(8359,1908,0,14),(8360,1912,0,14),(8361,355,0,14),(8362,2413,0,14),(8363,887,0,14),(8364,2415,0,14),(8365,4423,0,14),(8366,3979,0,14),(8367,104,0,14),(8368,1636,0,14),(8369,4092,0,14),(8370,3412,0,14),(8371,2909,0,14),(8372,2170,0,14),(8373,4319,0,14),(8374,4221,0,14),(8375,4142,0,14),(8376,2933,0,14),(8377,3985,0,14),(8378,885,0,14),(8379,3189,0,14),(8380,4357,0,14),(8381,4224,0,14),(8382,4456,0,14),(8383,1380,0,14),(8384,4535,0,14),(8385,4499,0,14),(8386,4350,0,14),(8387,3700,0,14),(8388,4083,0,14),(8389,2676,0,14),(8390,4122,0,14),(8391,3434,0,14),(8392,4419,0,14),(8393,4458,0,14),(8394,1403,0,14),(8395,1382,0,14),(8396,630,0,14),(8397,124,0,14),(8398,1145,0,14),(8399,1117,0,14),(8400,2147,0,14),(8401,4415,0,14),(8402,1381,0,14),(8403,4416,0,14),(8404,118,0,14),(8405,2677,0,14),(8406,3977,0,14),(8407,4261,0,14),(8408,4543,0,14),(8409,3440,0,14),(8410,4444,0,14),(8411,1377,0,14),(8412,4143,0,14),(8413,4333,0,14),(8414,3975,0,14),(8415,2932,0,14),(8416,523,1,14),(8417,2648,0,14),(8418,4073,0,14),(8419,3156,0,14),(8420,4420,0,14),(8421,98,0,14),(8422,4121,0,14),(8423,4141,0,14),(8424,4528,0,14),(8425,4473,0,14),(8426,4450,0,14),(8427,4465,0,14),(8428,2905,0,14),(8429,4536,0,14),(8430,2140,0,14),(8431,2906,0,14),(8432,2135,0,14),(8433,4088,0,14),(8434,3413,0,14),(8435,2162,0,14),(8436,4098,0,14),(8437,628,0,14),(8438,4410,0,14),(8439,4015,0,14),(8440,2131,0,14),(8441,4493,0,14),(8442,3971,0,14),(8443,4467,0,14),(8444,4469,0,14),(8445,2674,0,14),(8446,1648,0,14),(8447,4306,0,14),(8448,1394,0,14),(8449,4012,0,14),(8450,2903,0,14),(8451,4447,0,14),(8452,3583,1,14),(8453,3161,0,14),(8454,1379,0,14),(8455,3699,0,14),(8456,4259,0,14),(8457,870,0,14),(8458,4424,0,14),(8459,4255,0,14),(8460,1118,0,14),(8461,4004,0,14),(8462,346,0,14),(8463,4356,0,14),(8464,4414,0,14),(8465,4425,0,14),(8466,1402,0,14),(8467,4532,0,14),(8468,4512,0,14),(8469,4365,0,14),(8470,3073,1,14),(8471,3190,0,14),(8472,1397,0,14),(8473,4511,0,14),(8474,4218,0,14),(8475,1657,0,14),(8476,4265,0,14),(8477,1658,0,14),(8478,2167,0,14),(8479,2144,0,14),(8480,384,0,14),(8481,2650,0,14),(8482,1652,0,14),(8483,105,0,14),(8484,864,0,14),(8485,4555,0,14),(8486,2419,0,14),(8487,1655,0,14),(8488,862,0,14),(8489,125,0,14),(8490,4338,0,14),(8491,4316,0,14),(8492,359,0,14),(8493,4013,0,14),(8494,129,0,14),(8495,2136,0,14),(8496,1119,0,14),(8497,2142,0,14),(8498,1886,0,14),(8499,4500,0,14),(8500,4197,0,14),(8501,4496,0,14),(8502,3694,0,14),(8503,4468,0,14),(8504,4123,0,14),(8505,4228,0,14),(8506,4188,0,14),(8507,4203,0,14),(8508,1904,0,14),(8509,351,0,14),(8510,3435,0,14),(8511,4510,0,14),(8512,4072,0,14),(8513,3674,0,14),(8514,891,0,14),(8515,1116,0,14),(8516,2416,0,14),(8517,3697,0,14),(8518,4301,0,14),(8519,3164,0,14),(8520,4094,0,14),(8521,4096,0,14),(8522,4045,0,14),(8523,4451,0,14),(8524,1395,0,14),(8525,382,0,14),(8526,2168,0,14),(8527,865,0,14),(8528,895,0,14),(8529,4133,0,14),(8530,1375,0,14),(8531,4313,0,14),(8532,2396,0,14),(8533,4463,0,14),(8534,4229,0,14),(8535,3436,0,14),(8536,2139,0,14),(8537,4054,0,14),(8538,4135,0,14),(8539,2912,0,14),(8540,601,0,14),(8541,4138,0,14),(8542,2652,0,14),(8543,3970,0,14),(8544,4482,0,14),(8545,4042,0,14),(8546,3441,0,14),(8547,4074,0,14),(8548,4235,0,14),(8549,4189,0,14),(8550,385,0,14),(8551,3410,0,14),(8552,3411,0,14),(8553,1631,0,14),(8554,4219,0,14),(8555,4155,0,14),(8556,4056,0,14),(8557,3668,0,14),(8558,4075,0,14),(8559,2398,0,14),(8560,2931,0,14),(8561,4317,0,14),(8562,1378,0,14),(8563,4502,0,14),(8564,1625,0,14),(8565,4307,0,14),(8566,3986,0,14),(8567,4205,0,14),(8568,1627,0,14),(8569,4540,0,14),(8570,867,0,14),(8571,4124,0,14),(8572,4453,0,14),(8573,4352,0,14),(8574,4252,0,14),(8575,3443,0,14),(8576,1121,0,14),(8577,4538,0,14),(8578,4050,0,14),(8579,4104,0,14),(8580,1376,0,14),(8581,4140,0,14),(8582,2934,0,14),(8583,2421,0,14),(8584,1150,0,14),(8585,2657,0,14),(8586,866,0,14),(8587,3969,0,14),(8588,1880,0,14),(8589,4001,0,14),(8590,122,0,14),(8591,358,0,14),(8592,634,0,14),(8593,4044,0,14),(8594,3166,0,14),(8595,4144,0,14),(8596,376,0,14),(8597,4053,0,14),(8598,2169,0,14),(8599,4200,0,14),(8600,4016,0,14),(8601,4260,0,14),(8602,4297,0,14),(8603,4347,0,14),(8604,4287,0,14),(8605,4147,0,14),(8606,1139,0,14),(8607,4084,0,14),(8608,4442,0,14),(8609,2393,0,14),(8610,128,0,14),(8611,2653,0,14),(8612,4340,0,14),(8613,2673,0,14),(8614,4057,0,14),(8615,4071,0,14),(8616,869,0,14),(8617,2654,0,14),(8618,3661,0,14),(8619,4077,0,14),(8620,3439,0,14),(8621,4298,0,14),(8622,1876,0,14),(8623,3974,0,14),(8624,1635,0,14),(8625,1398,0,14),(8626,101,0,14),(8627,4250,0,14),(8628,4136,0,14),(8629,4501,0,14),(8630,4507,0,14),(8631,3981,0,14),(8632,3677,0,14),(8633,2163,0,14),(8634,1656,0,14),(8635,4497,0,14),(8636,1115,0,14),(8637,4527,0,14),(8638,4503,0,14),(8639,4153,0,14),(8640,4194,0,14),(8641,2902,0,14),(8642,615,0,14),(8643,4412,0,14),(8644,2926,0,14),(8645,4089,0,14),(8646,893,0,14),(8647,4090,0,14),(8648,2908,0,14),(8649,4106,0,14),(8650,2401,0,14),(8651,1141,0,14),(8652,4251,0,14),(8653,4257,0,14),(8654,1543,1,14),(8655,4202,0,14),(8656,97,0,14),(8657,1125,0,14),(8658,106,0,14),(8659,2394,0,14),(8660,3433,0,14),(8661,4263,0,14),(8662,3696,0,14),(8663,3702,0,14),(8664,3688,0,14),(8665,1634,0,14),(8666,2923,0,14),(8667,354,0,14),(8668,632,0,14),(8669,2929,0,14),(8670,3972,0,14),(8671,886,0,14),(8672,4323,0,14),(8673,1138,0,14),(8674,3670,0,14),(8675,4095,0,14),(8676,3666,0,14),(8677,4040,0,14),(8678,4320,0,14),(8679,4325,0,14),(8680,2904,0,14),(8681,4344,0,14),(8682,1651,0,14),(8683,4010,0,14),(8684,2397,0,14),(8685,2925,0,14),(8686,4234,0,14),(8687,863,0,14),(8688,3672,0,14),(8689,3163,0,14),(8690,617,0,14),(8691,2901,0,14),(8692,4418,0,14),(8693,3151,0,14),(8694,2655,0,14),(8695,1111,0,14),(8696,4085,0,14),(8697,4361,0,14),(8698,640,0,14),(8699,121,0,14),(8700,4100,0,14),(8701,4315,0,14),(8702,3157,0,14),(8703,1626,0,14),(8704,4452,0,14),(8705,2160,0,14),(8706,4304,0,14),(8707,13,1,14),(8708,361,0,14),(8709,2386,0,14),(8710,890,0,14),(8711,2651,0,14),(8712,1033,1,14),(8713,2400,0,14),(8714,4227,0,14),(8715,609,0,14),(8716,4105,0,14),(8717,4231,0,14),(8718,4345,0,14),(8719,611,0,14),(8720,1637,0,14),(8721,3417,0,14),(8722,4192,0,14),(8723,2669,0,14),(8724,4204,0,14),(8725,1396,0,14),(8726,2896,0,14),(8727,861,0,14),(8728,3695,0,14),(8729,3155,0,14),(8730,1887,0,14),(8731,3188,0,14),(8732,4413,0,14),(8733,4460,0,14),(8734,2927,0,14),(8735,2418,0,14),(8736,4127,0,14),(8737,606,0,14),(8738,4427,0,14),(8739,2668,0,14),(8740,377,0,14),(8741,99,0,14),(8742,4043,0,14),(8743,4078,0,14),(8744,4471,0,14),(8745,3982,0,14),(8746,3416,0,14),(8747,868,0,14),(8748,4513,0,14),(8749,4339,0,14),(8750,2420,0,14),(8751,3973,0,14),(8752,95,0,14),(8753,4294,0,14),(8754,4009,0,14),(8755,4302,0,14),(8756,4441,0,14),(8757,4541,0,14),(8758,4190,0,14),(8759,4011,0,14),(8760,4411,0,14),(8761,3182,0,14),(8762,3444,0,14),(8763,4046,0,14),(8764,3406,0,14),(8765,635,0,14),(8766,4295,0,14),(8767,871,0,14),(8768,4134,0,14),(8769,3158,0,14),(8770,91,0,14),(8771,637,0,14),(8772,1374,0,14),(8773,3328,1,14),(8774,4462,0,14),(8775,4099,0,14),(8776,2402,0,14),(8777,1143,0,14),(8778,4309,0,14),(8779,610,0,14),(8780,1882,0,14),(8781,4351,0,14),(8782,3698,0,14),(8783,4494,0,14),(8784,1911,0,14),(8785,4008,0,14),(8786,4120,0,14),(8787,1124,0,14),(8788,1659,0,14),(8789,1649,0,14),(8790,4226,0,14),(8791,1633,0,14),(8792,1147,0,14),(8793,3442,0,14),(8794,4331,0,14),(8795,3421,0,14),(8796,3181,0,14),(8797,4128,0,14),(8798,2670,0,14),(8799,3415,0,14),(8800,1905,0,14),(8801,4087,0,14),(8802,2930,0,14),(8803,2672,0,14),(8804,4479,0,14),(8805,4222,0,14),(8806,4292,0,14),(8807,2395,0,14),(8808,4466,0,14),(8809,3693,0,14),(8810,616,0,14),(8811,4305,0,14),(8812,4341,0,14),(8813,631,0,14),(8814,4081,0,14),(8815,1632,0,14),(8816,4354,0,14),(8817,4355,0,14),(8818,3165,0,14),(8819,375,0,14),(8820,778,1,14),(8821,3183,0,14),(8822,1881,0,14),(8823,4041,0,14),(8824,2563,1,14);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` bigint NOT NULL DEFAULT '1',
  `role_code` varchar(255) DEFAULT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_roleName_company_idx` (`company_id`,`role_name`),
  KEY `Fk_user_roles_createdBy` (`created_by`),
  KEY `Fk_user_roles_modifiedBy` (`modified_by`),
  KEY `FK_company_roles_idx` (`company_id`),
  KEY `FK_branch_roles_idx` (`branch_id`),
  CONSTRAINT `FK_branch_roles` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_roles` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `Fk_user_roles_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `Fk_user_roles_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (10,2,'RL0121',NULL,'Admin',1,'2020-10-12 12:51:35',1,'2021-08-03 20:27:11',1,1),(11,2,'RL0122',NULL,'Test',NULL,'2020-10-23 14:08:52',1,'2021-08-03 14:42:17',1,1),(13,2,'RL0123',NULL,'Deamon',1,'2021-08-02 20:33:03',1,'2021-08-03 04:40:01',1,1),(14,2,'RL0124','<p>Java Trainne</p>','Trainne',1,'2021-08-03 14:43:05',1,'2021-08-07 18:22:56',1,1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_filter`
--

DROP TABLE IF EXISTS `screen_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_filter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `field_indexing_id` int DEFAULT NULL,
  `module_id` bigint DEFAULT NULL,
  `filter_value` varchar(45) DEFAULT NULL,
  `filter_range` varchar(45) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '1',
  `sort_flag` tinyint DEFAULT '0',
  `sort_order` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_filter`
--

LOCK TABLES `screen_filter` WRITE;
/*!40000 ALTER TABLE `screen_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `skill` varchar(100) NOT NULL,
  `status` bigint DEFAULT '1',
  `description` text,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `skills_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `skills_ibfk_3` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (8,'Collection Framework',2,NULL,NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(9,'Multi Threading',2,NULL,NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(10,'Java 8',2,'Java 8 got released on March 18, 2014. There are several new features that are introduced in this release. I have covered all the Java 8 features in the separate guides. Here are the links to all the Java 8 tutorials in the systematic order:',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(11,'Java 8 Streams',1,'Stream API which is another new feature of java 8. All the classes and interfaces of this API is in the java.util.stream package. By using streams we can perform various aggregate operations on the data returned from collections, arrays, Input/Output operations.',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(12,'Java Inheritance',1,'Inheritance in Java is a mechanism in which one object acquires all the properties and behaviors of a parent object. ... The idea behind inheritance in Java is that you can create new classes that are built upon existing classes.',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(13,'Spring Security',2,'Spring Security is a framework which provides various security features like: authentication, authorization to create secure Java Enterprise Applications.\n\nIt is a sub-project of Spring framework which was started in 2003 by Ben Alex. Later on, in 2004, It was released under the Apache License as Spring Security 2.0.0.',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(14,'Spring MVC',1,'\nnext →← prev\nSpring MVC Tutorial\nA Spring MVC is a Java framework which is used to build web applications. It follows the Model-View-Controller design pattern. It implements all the basic features of a core spring framework like Inversion of Control, Dependency Injection.',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(15,'jQuery',2,NULL,NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(16,'Angular 8',2,NULL,NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(17,'Java 9 Feature',2,NULL,NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(18,'fsdfa',2,'fdasfdas',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(19,'[New] Java',2,'Basic Java Skill',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(20,'[New] Javascript',2,'basic javascript',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(21,'[New] Python',2,'basic of python',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(22,'SEO',2,'Search engine optimization is the process of improving the quality and quantity of website traffic to a website or a web page from search engines. SEO targets unpaid traffic rather than direct traffic or paid traffic.',NULL,'2021-01-16 16:04:39',NULL,'2021-08-09 17:37:58',NULL,NULL),(23,'HTML Developer',2,'HTML Developer',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(24,'spring boot',2,'spring boot ',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(30,'Core Java',2,'Core Java: Core Java is the part of Java programming language that is used for creating or developing a general-purpose application. ... To develop general purpose applications. To develop online application and mobile application.',NULL,'2021-01-16 16:04:39',NULL,'2021-01-16 16:04:39',NULL,NULL),(31,'MySQL',2,'MySQL is an open-source relational database management system. Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter, and \"SQL\", the abbreviation for Structured Query Language. Wikipedia',NULL,'2021-01-16 16:04:56',NULL,'2021-01-16 16:04:56',NULL,NULL),(32,'Advance Java',2,'It is a part of Java programming language. It is an advanced technology or advance version of Java specially designed to develop web-based, network-centric or enterprise applications. It includes the concepts like Servlet, JSP, JDBC, RMI, Socket programming, etc. It is a specialization in specific domain',NULL,'2021-01-16 16:05:17',NULL,'2021-01-16 16:05:17',NULL,NULL),(33,'RabbitMQ',2,'RabbitMQ is an open-source message-broker software that originally implemented the Advanced Message Queuing Protocol and has since been extended with a plug-in architecture to support Streaming Text Oriented Messaging Protocol, MQ Telemetry Transport, and other protocols',NULL,'2021-05-28 16:30:06',NULL,'2021-05-28 16:30:06',NULL,NULL),(34,'SEO',2,'Search engine optimization is the process of improving the quality and quantity of website traffic to a website or a web page from search engines. SEO targets unpaid traffic rather than direct traffic or paid traffic',NULL,'2021-05-28 17:13:15',NULL,'2021-05-28 17:13:15',NULL,NULL),(35,'SMO',2,'Social media optimization is the use of a number of outlets and communities to generate publicity to increase the awareness of a product, service brand or event',NULL,'2021-05-28 17:14:09',NULL,'2021-05-28 17:14:09',NULL,NULL),(36,'Kafka',2,'Apache Kafka is a framework implementation of a software bus using stream-processing. It is an open-source software platform developed by the Apache Software Foundation written in Scala and Java. The project aims to provide a unified, high-throughput, low-latency platform for handling real-time data feeds',NULL,'2021-05-28 17:16:18',NULL,'2021-05-28 17:16:18',NULL,NULL),(37,'Spring/ Spring Boot',2,'The Spring Framework is an application framework and inversion of control container for the Java platform. The framework\'s core features can be used by any Java application, but there are extensions for building web applications on top of the Java EE platform',NULL,'2021-05-28 17:17:21',NULL,'2021-05-28 17:17:21',NULL,NULL),(38,'Hibernate',2,'Hibernate ORM is an object–relational mapping tool for the Java programming language. It provides a framework for mapping an object-oriented domain model to a relational database.',NULL,'2021-05-28 17:17:51',NULL,'2021-05-28 17:17:51',NULL,NULL),(39,'MySql',2,'MySQL is an open-source relational database management system. Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter, and \"SQL\", the abbreviation for Structured Query Language.',NULL,'2021-05-28 17:18:20',NULL,'2021-05-28 17:18:20',NULL,NULL),(40,'Oracle Database',2,'Oracle Database is a multi-model database management system produced and marketed by Oracle Corporation. It is a database commonly used for running online transaction processing, data warehousing and mixed database workloads.',NULL,'2021-05-28 17:18:55',NULL,'2021-08-02 14:43:37',NULL,NULL),(41,'html',2,'The HyperText Markup Language, or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript.',NULL,'2021-07-24 16:52:35',NULL,'2021-08-09 17:36:51',NULL,NULL),(42,'CSS',2,'CSS is the acronym of “Cascading Style Sheets”. CSS is a computer language for laying out and structuring web pages (HTML or XML). This language contains coding elements and is composed of these “cascading style sheets” which are equally called CSS files (. css).',NULL,'2021-08-09 17:35:10',NULL,'2021-08-09 17:35:10',NULL,NULL);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smtp_settings`
--

DROP TABLE IF EXISTS `smtp_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smtp_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `is_auth` tinyint DEFAULT NULL,
  `socket_factory_port` int DEFAULT NULL,
  `socket_factory_class` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `is_SSL` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smtp_settings`
--

LOCK TABLES `smtp_settings` WRITE;
/*!40000 ALTER TABLE `smtp_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `smtp_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `short_name` varchar(180) DEFAULT NULL,
  `state_code` varchar(180) DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `is_ut` tinyint DEFAULT '0',
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `UK_countryId_stateName` (`country_id`,`state_name`),
  UNIQUE KEY `UK_countryId_stateCode` (`country_id`,`state_code`),
  CONSTRAINT `FK_country_state` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,89,'Kashmiri,Dogri,Hindi,Punjabi,Marathi','JK','1','Jammu & Kashmir',1,1),(2,89,'Hindi,Punjabi,Dogri,Kashmiri,Dogri','HP','2','Himachal Pradesh',1,0),(3,89,'Punjabi,Hindi,Urdu,Bengali,English','PB','3','Punjab',1,0),(4,89,'Hindi (including the Garhwali, Kumaoni, and Jaunsari Dialects),Urdu,Punjabi,Bengali,Nepali','UK','5','Uttarakhand',1,0),(5,89,'Hindi,Punjabi,Urdu,Bengali,Nepali','HR','6','Haryana',1,0),(6,89,'Hindi (Rajasthani),Punjabi,Urdu,Sindhi,Gujarati','RJ','8','Rajasthan',1,0),(7,89,'Hindi (including Awadhi, Bhojpuri, Braj Bhasha and Khari Boli dialects),Urdu,Punjabi,Bengali,Maithili','UP','9','Uttar Pradesh',1,0),(8,89,'Hindi (Bhojpuri and Magadhi Dialects),Maithili,Urdu,Bengali,Santali','BR','10','Bihar',1,0),(9,89,'Nepali,Hindi,Bengali,Assamese,Bodo','SK','11','Sikkim',1,0),(10,89,'Nishi,Adi,Bengali,Nepali,Hindi','AR','12','Arunachal Pradesh',1,0),(11,89,'Naga Languages,English,Hindi,Assamese,Manipuri','NL','13','Nagaland',1,0),(12,89,'Manipuri,Bengali,Hindi,Nepali,Assamese','MN','14','Manipur',1,0),(13,89,'Mizo,English,Hindi,Manipuri,Chakma','MZ','15','Mizoram',1,0),(14,89,'Bengali,Kokborok,Assamese,English,Manipuri','TR','16','Tripura',1,0),(15,89,'Kashi,Garo,Bengali,Assamese,English','ML','17','Meghalaya',1,0),(16,89,'Assamese,Bengali,Hindi,Bodo,Nepali','AS','18','Assam',1,0),(17,89,'Bengali,Hindi,Urdu,Oriya,Nepali','WB','19','West Bengal',1,0),(18,89,'Hindi (Bhojpuri, Magadhi,and Nagpuri Dialects).,Maithali,Santhali,Urdu,Bengali','JH','20','Jharkhand',1,0),(19,89,'Oriya,Bengali,Telugu,Hindi,Santali','OR','21','Orissa',1,0),(20,89,'Hindi (Chhattisgarhi),Oriya,Telugu,Bengali,Marathi','CG','22','Chhattisgarh',1,0),(21,89,'Hindi,Marathi,Urdu,Sindhi,Gujarati','MP','23','Madhya Pradesh',1,0),(22,89,'Gujarati,Hindi,Marathi,Rajasthani,;GJ','GJ','24','Gujarat',1,0),(23,89,'Gujarati,Hindi,Marathi,Bengali,Oriya','DD','25','Daman & Diu',1,0),(24,89,'Gujarati,Hindi,Konkani,Marathi,Malayalam','DH','26','Dadra & Nagar Haveli',1,1),(25,89,'Marathi,Hindi,Telugu,Gujarati,Kannada','MH','27','Maharashtra',1,0),(26,89,'Telugu,Urdu,Tamil,Kannada,Oriya','AP','28','Andhra Pradesh',1,0),(27,89,'Kannada,Urdu,Telugu,Tamil,Marathi','KA','29','Karnataka',1,0),(28,89,'Konkani,Marathi,Hindi,Kannada,Urdu','GA','30','Goa',1,0),(29,89,'Malayalam,Tamil,Konkani,Hindi,Gujarati','LD','31','Lakshadweep',1,1),(30,89,'Malayalam,Tamil,Kannada,Konkani,Telugu','KL','32','Kerala',1,0),(31,89,'Tamil,Telugu,Kannada,Hindi,Malayalam','TN','33','Tamil Nadu',1,0),(32,89,'Bengali,Hindi,Tamil,Telugu,Malayalam','AN','35','Andaman & Nicobar Islands',1,1),(33,89,'Telugu,Urdu,Marathi,Kannada,Hindi','TG','36','Telengana',1,0),(34,89,'Punjabi, Hindi, Haryanvi','CH','04','Chandigarh',1,1),(35,89,'Hindi','DL','07','Delhi',1,1),(36,89,'Ladakhi, Tibetan, Urdu, Balti','LA','38','Ladakh',1,1),(37,89,'French, Tamil, Telugu, Malayalam','PY','34','Puducherry',1,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_details`
--

DROP TABLE IF EXISTS `status_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `class_style` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_details`
--

LOCK TABLES `status_details` WRITE;
/*!40000 ALTER TABLE `status_details` DISABLE KEYS */;
INSERT INTO `status_details` VALUES (1,0,'Inactive','status-inactive'),(2,1,'Active','status-active'),(3,3,'Draft','status-draft'),(4,4,'Submitted','status-submitted'),(5,5,'Verified','status-verified'),(6,6,'Canceled','status-canceled'),(7,7,'Paid','status-paid'),(8,8,'Approved','status-approved'),(9,9,'Rejected','status-rejected'),(10,10,'Partialy Approved','status-partiallyapproved'),(11,11,'Returned','status-returned'),(12,12,'Revised','status-revised'),(13,13,'Amended','status-amended'),(14,14,'Deleted','status-deleted'),(15,15,'Terminated','status-terminated'),(16,16,'Expired','status-expired'),(17,17,'Trial','status-trial'),(18,18,'Hold','status-hold'),(19,19,'Self Approved','status-selfapproved'),(20,20,'Uploaded',NULL),(21,21,'Upload Failed',NULL),(22,22,'Rename',NULL),(23,23,'Verification Pending',NULL),(24,24,'Verified',NULL),(25,25,'Shortlisted',NULL),(26,26,'Rejected',NULL);
/*!40000 ALTER TABLE `status_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statutory_data`
--

DROP TABLE IF EXISTS `statutory_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statutory_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_statutory_mapping_id` bigint NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `document_ref` bigint DEFAULT NULL,
  `effective_from_date` date DEFAULT NULL,
  `efffective_to_date` date DEFAULT NULL,
  `ref_doc` bigint NOT NULL,
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_moduleStatutory_statutoryData_idx` (`module_statutory_mapping_id`),
  KEY `FK_document_statutoryData_idx` (`document_ref`),
  KEY `FK_company_statutoryData_refDoc_idx` (`ref_doc`),
  KEY `FK_company_dtatutoryData_companyId_idx` (`company_id`),
  KEY `FK_branch_statutoryData_branchId_idx` (`branch_id`),
  KEY `FK_user_statutoryData_createdBy_idx` (`created_by`),
  KEY `FK_user_statutoryData_modifiedBy_idx` (`modified_by`),
  CONSTRAINT `FK_branch_statutoryData_branchId` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_branch_statutoryData_refDoc` FOREIGN KEY (`ref_doc`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_statutoryData_companyId` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_company_statutoryData_refDoc` FOREIGN KEY (`ref_doc`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_document_statutoryData` FOREIGN KEY (`document_ref`) REFERENCES `documents` (`id`),
  CONSTRAINT `FK_employee_statutoryData` FOREIGN KEY (`ref_doc`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_moduleStatutory_statutoryData` FOREIGN KEY (`module_statutory_mapping_id`) REFERENCES `statutory_details_modules_mapping` (`id`),
  CONSTRAINT `FK_user_statutoryData_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_statutoryData_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statutory_data`
--

LOCK TABLES `statutory_data` WRITE;
/*!40000 ALTER TABLE `statutory_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `statutory_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statutory_details`
--

DROP TABLE IF EXISTS `statutory_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statutory_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label_name` varchar(45) DEFAULT NULL,
  `upload_required` tinyint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_statutoryDetails_createdBy_idx` (`created_by`),
  KEY `FK_user_statutoryDetails_idx` (`modified_by`),
  KEY `FK_company_statutoryDetails_idx` (`company_id`),
  KEY `FK_branch_statutoryDetails_idx` (`branch_id`),
  KEY `FK_type_statutoryDetails_idx` (`type_id`),
  CONSTRAINT `FK_branch_statutoryDetails` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_statutoryDetails` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_type_statutoryDetails` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `FK_user_statutoryDetails` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_statutoryDetails_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statutory_details`
--

LOCK TABLES `statutory_details` WRITE;
/*!40000 ALTER TABLE `statutory_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `statutory_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statutory_details_modules_mapping`
--

DROP TABLE IF EXISTS `statutory_details_modules_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statutory_details_modules_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint DEFAULT NULL,
  `statutoryDetails_label_id` bigint DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_module_statutoryModule_idx` (`module_id`),
  KEY `FK_statutoryField_statutoryModule_idx` (`statutoryDetails_label_id`),
  KEY `FK_user_statutoryModule_createdBy_idx` (`created_by`),
  KEY `FK_user_statutoryModule_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_statutoryModule_idx` (`company_id`),
  KEY `FK_branch_statutoryModule_idx` (`branch_id`),
  CONSTRAINT `FK_branch_statutoryModule` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_company_statutoryModule` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_module_statutoryModule` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  CONSTRAINT `FK_statutoryField_statutoryModule` FOREIGN KEY (`statutoryDetails_label_id`) REFERENCES `statutory_details` (`id`),
  CONSTRAINT `FK_user_statutoryModule_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_statutoryModule_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statutory_details_modules_mapping`
--

LOCK TABLES `statutory_details_modules_mapping` WRITE;
/*!40000 ALTER TABLE `statutory_details_modules_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `statutory_details_modules_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `module_id` bigint DEFAULT NULL,
  `status` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'HO',1,'2020-10-12 18:06:07',1,'2021-07-23 09:55:30',NULL,NULL,124,2),(4,'Reasoning',1,'2021-01-04 13:55:43',1,'2021-04-19 11:52:48',NULL,NULL,183,2),(5,'Coding',1,'2021-01-04 15:04:28',1,'2021-04-19 11:52:48',NULL,NULL,183,2),(6,'Aptitude',1,'2021-01-04 15:04:45',1,'2021-04-19 11:52:48',NULL,NULL,183,2),(7,'Behavioural',1,'2021-01-04 15:05:02',1,'2021-07-23 10:50:14',NULL,NULL,183,2),(8,'Warehouse',1,'2021-07-24 16:49:18',1,'2021-07-31 05:29:00',NULL,NULL,183,2),(9,'Demo',1,'2021-07-31 14:56:21',1,'2021-07-31 19:30:45',NULL,NULL,182,2),(10,'manufacturing',1,'2021-08-02 13:46:07',1,'2021-08-02 13:46:07',NULL,NULL,NULL,2),(11,'manufacturing',1,'2021-08-03 16:27:44',1,'2021-08-03 16:27:44',NULL,NULL,NULL,2),(12,'DemoBranch',1,'2021-08-05 15:52:32',1,'2021-08-07 14:37:14',NULL,NULL,NULL,2),(13,'Warehouse',1,'2021-08-07 14:25:40',1,'2021-08-07 14:25:40',NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_module_mapping`
--

DROP TABLE IF EXISTS `type_module_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_module_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `module_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `type_module_mapping_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `type_module_mapping_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_module_mapping`
--

LOCK TABLES `type_module_mapping` WRITE;
/*!40000 ALTER TABLE `type_module_mapping` DISABLE KEYS */;
INSERT INTO `type_module_mapping` VALUES (3,4,183),(4,4,190),(5,5,183),(6,5,190),(7,6,183),(8,6,190),(9,7,183),(10,7,190),(11,1,124),(12,7,124),(13,8,124),(14,9,182),(15,10,145),(16,11,118),(17,11,119),(18,11,120),(19,11,121),(20,12,124),(21,13,119),(22,12,126);
/*!40000 ALTER TABLE `type_module_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password_expiry` int DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `first_login` tinyint DEFAULT '1',
  `provider` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'local',
  `default_login_branch_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FK_roles_user` (`role_id`),
  KEY `FK_employee_user_idx` (`employee_id`),
  CONSTRAINT `FK_employee_user` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_roles_user` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,1,'shivittech123@gmail.com',8449492938,'$2a$10$k6WmOxlYODPcFfSquYSIa.1LSWNuadKXQDExwr9K8jAtSKO21qiVi',1,2,'ankit_1','MSC8FCS1C6GCXMCF5CK5CV6CIEC5XC76C3KCT8CSRCZHCFH',NULL,10,0,'local',1,1,'2020-08-14 15:13:34','2021-07-22 01:03:31',NULL),(5,NULL,1,'avnps98@yahoo.com',5655554876,'$2a$10$fTQT/DcXmRFVp7jGGf9tauOIP3S5nimhocuqZgqwIqcXubqPekt3C',30,2,'avnps98','Zv2M3OSifKBS7rf9woepPv19IL43EW',1,11,0,'local',1,2,'2020-10-29 11:18:03','2021-04-12 12:34:50',1),(6,NULL,1,'test@yahoo.com',8455555412,'$2a$10$3vioMtLxPZWizi7sFLdR/OukI8EHvGoEpWFKs9ZLdbJ6b9UcLolt6',30,2,'testuser','8LQUhzisP3G4QFuU8wYp8MwdUoiDDb',1,11,0,'local',1,3,'2020-10-29 11:55:01','2021-04-12 12:34:50',1),(7,NULL,1,'avnps@yahoo.com',4837564786,'$2a$10$MA8owoSiSo4OSOAAUBeC6uUsDZNG/poYwe0Xu4VVnqzz4OliOvNAy',30,2,'ankit','Qa4RdfwCCFyMlRMnKzG8LUQ3ilRzBs',1,11,0,'local',1,4,'2020-10-29 12:03:55','2021-04-12 12:34:50',1),(8,NULL,1,'avnps98@test.com',1234567890,'$2a$10$b7rznpDxGi1vhNMqi9Xd7.aemtP2Oo8TBERsBgfOK7EqH72IHlY3.',30,2,'sanjay.rai','i2oEVThkYL6blQ5QMTMXZGyERpU3D9',1,11,1,'local',1,5,'2020-10-29 12:33:14','2021-04-12 12:34:50',1),(9,NULL,1,'a@a.com',8010089911,'$2a$10$Ys1V16HWqA68Zw0iKwbdr.ZeLm/CTBMwY1Daojy9n4SCOe7SftZji',30,2,'testadmin','lbic83oBCiKowjGAGubIqNuazPrx1t',1,11,0,'local',1,6,'2020-11-02 05:49:49','2021-07-30 10:38:27',1),(10,NULL,1,'hr@shivit.com',9818101107,'$2a$10$GlQCgXDmFSw4ashoDWV.w.P3oTYcQmDXCbMxhFiyaiSpQbG3Lmcpe',30,2,'deepikaverma','0mu83rfN341PMtJrXHcb97H0RWlrL7',1,11,1,'local',30,1,'2021-08-02 13:43:34','2021-08-02 13:43:34',1),(11,NULL,1,'amankatiyar73@gmail.com',9149065797,'$2a$10$bsIVm7FBugAx1OMFmrrbtu38AxYy54j.o585rEzeMxv5MMg.cePc6',30,2,'aman_!','mhk8LTWjUGFi8FZlWy2XKhm5ClJmwE',1,11,0,'local',1,8,'2021-08-02 17:07:17','2021-08-02 17:52:52',1),(12,NULL,1,'amankatiyar455@gmail.com',9149065796,'$2a$10$LHgXN/i4Sk5ItPX2aKCQjusO5xeRFnpHSdaRH34L1bUUJgNl9.KGa',30,2,'aman_123','KCFAoTv3vYVnF8OyXExp4plBBlCynz',1,13,1,'local',1,8,'2021-08-02 18:19:18','2021-08-02 18:19:18',1),(13,NULL,1,'amankatiyar788@gmail.com',9149065796,'$2a$10$/DfkMA9yIU9iZltvi72hxegVNbKgWSnM8ZSKbpD6V9xOpDH9chTwy',30,2,'aman24324235','25xzaZxlZcLEyFl1Mrcozrgbkf1ga0',1,13,1,'local',1,6,'2021-08-02 20:51:40','2021-08-02 20:51:40',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authority`
--

DROP TABLE IF EXISTS `user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authority` (
  `user_id` bigint NOT NULL,
  `authority_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`authority_id`),
  KEY `FK_authority_userAuthority` (`authority_id`),
  CONSTRAINT `FK_authority_userAuthority` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`),
  CONSTRAINT `FK_user_userAuthority` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authority`
--

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;
INSERT INTO `user_authority` VALUES (1,1),(6,11),(7,12),(10,34),(12,36),(13,37);
/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_branch_assign`
--

DROP TABLE IF EXISTS `user_branch_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_branch_assign` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_userBranch_idx` (`user_id`),
  KEY `FK_branch_userBranch_idx` (`branch_id`),
  CONSTRAINT `FK_branch_userBranch` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  CONSTRAINT `FK_user_userBranch` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_branch_assign`
--

LOCK TABLES `user_branch_assign` WRITE;
/*!40000 ALTER TABLE `user_branch_assign` DISABLE KEYS */;
INSERT INTO `user_branch_assign` VALUES (5,1,1),(16,9,1),(17,10,30),(18,11,1),(19,12,1),(20,13,1);
/*!40000 ALTER TABLE `user_branch_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `zone_code` varchar(45) DEFAULT NULL,
  `zone_name` varchar(45) NOT NULL,
  `description` longtext,
  `status` bigint NOT NULL DEFAULT '1',
  `created_by` bigint NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint NOT NULL,
  `modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_id` bigint DEFAULT NULL,
  `branch_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_zone_createdBy_idx` (`created_by`),
  KEY `FK_user_zone_modifiedBy_idx` (`modified_by`),
  KEY `FK_company_zone_idx` (`company_id`),
  CONSTRAINT `FK_company_zone` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_user_zone_createdBy` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_user_zone_modifiedBy` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (6,'ZN0001','Test Zone',NULL,2,1,'2021-07-15 22:44:04',1,'2021-07-15 22:44:04',1,'1'),(13,'ZN0002','East west',NULL,2,1,'2021-08-09 18:44:07',1,'2021-08-09 18:44:47',1,'1');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'plan1_69'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-10 10:44:29
