CREATE DATABASE  IF NOT EXISTS `sem4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci */;
USE `sem4`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sem4
-- ------------------------------------------------------
-- Server version	5.7.31-log

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `license_plates` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `driver` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `driver_number` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `shool_id` bigint(20) DEFAULT NULL,
  `person_group_id` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`license_plates`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES ('','','',_binary '',0,NULL),('29C2-017.34','Nguyễn Đoan Hạnh','0362655899',_binary '\0',1,NULL),('29C2-017.78','Vũ Văn Hóa Cập','0856546454',_binary '\0',1,NULL),('30E1-056.78','Nguyến Đoan Hạnh','0966977669',_binary '\0',1,NULL),('34R4-087.00','Vũ Trọng Phụng','0951532499',_binary '\0',1,NULL),('69R4-047.76','Tôn Ngộ Không','0951532455',_binary '',1,NULL),('78R4-087.00','Nguyễn Chí Thanh','0951599499',_binary '',1,NULL),('78R4-087.10','Hạnh Họe','',_binary '',1,NULL),('89D2-047.76','Nguyễn Thị Nhung','0967532455',_binary '',1,NULL),('89E2-047.76','Nguyễn Thị Lành','0957532455',_binary '',1,NULL),('99R4-3331','Nguyen Tuan Hai','0959999988',_binary '',1,NULL),('99R4-33317','Nguyen Tuan Tien Tới','0959999777',_binary '',1,NULL),('99R4-333177','Nguyen Tuan Hai 2','0959999911666',_binary '\0',1,NULL),('99S4-97006','Mac','09467542344',_binary '',1,NULL),('99S4-9796','Jack','0959999966',_binary '\0',1,NULL),('99S4-9996','Sơn Tùng MTP','09599999696',_binary '',1,NULL),('99S4-9999','Quang Trung','0959999999',_binary '\0',1,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in_records`
--

DROP TABLE IF EXISTS `check_in_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `record_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in_records`
--

LOCK TABLES `check_in_records` WRITE;
/*!40000 ALTER TABLE `check_in_records` DISABLE KEYS */;
INSERT INTO `check_in_records` VALUES (1,9876,'2021-01-03 15:55:38',NULL,NULL,1),(2,9876,'2021-01-03 15:58:12',NULL,NULL,1),(3,9876,'2021-01-03 16:00:23',NULL,NULL,1),(4,9876,'2021-01-03 16:02:16',NULL,NULL,1),(5,9876,'2021-01-03 16:02:58',NULL,NULL,1),(6,9876,'2021-01-03 16:03:11',NULL,NULL,1),(7,9876,'2021-01-03 16:03:39',NULL,NULL,1);
/*!40000 ALTER TABLE `check_in_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `school_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,_binary '','1b',1,2);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_student`
--

DROP TABLE IF EXISTS `class_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_student`
--

LOCK TABLES `class_student` WRITE;
/*!40000 ALTER TABLE `class_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_action`
--

DROP TABLE IF EXISTS `menu_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `order_by` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `url_string` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_action`
--

LOCK TABLES `menu_action` WRITE;
/*!40000 ALTER TABLE `menu_action` DISABLE KEYS */;
INSERT INTO `menu_action` VALUES (1,'fa-user-o','User manager',NULL,'test'),(2,'fa-university','School manager',NULL,'test');
/*!40000 ALTER TABLE `menu_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (1,1,1);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_teacher'),(2,'ROLE_parents'),(3,'ROLE_admin'),(4,'ROLE_superAdmin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `time_study` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK251hwtk4rvkoblr76wknh8v41` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'C4 Trần Huy Liệu, Giảng Võ, Ba Đình, Hà Nội',_binary '','Tiểu học Kim Đồng 2','2020-12-27 15:41:51','07:30');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `car_id` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `class_id` bigint(20) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `parents_id` bigint(20) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `school_id` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `person_id` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `face_id` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9877 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (9876,'Mac Thai To, Cau Giay','29C2-017.34',1,'2020-02-09 00:00:00','Daisy Nguyen','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '',1,'0966977669','1',NULL,'54077641-9d73-44c7-acb7-8747f674ddcf',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,4);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_school`
--

DROP TABLE IF EXISTS `user_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_school` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_school`
--

LOCK TABLES `user_school` WRITE;
/*!40000 ALTER TABLE `user_school` DISABLE KEYS */;
INSERT INTO `user_school` VALUES (1,1,1);
/*!40000 ALTER TABLE `user_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateofbirth` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKp1x4e0cw4bj0jdpj2326ydbpl` (`email`,`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'admin@gmail.com',NULL,NULL,_binary '','$2a$10$VElftezCxdfFiQ1txpla3O38mjuJP//q0yDsFMUyYmS4q5XYKrQL6','0398682575','2020-12-27 15:41:28','superAdmin','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-03 23:56:49
