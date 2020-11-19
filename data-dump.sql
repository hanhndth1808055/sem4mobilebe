-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: sem4
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `license_plates` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `driver` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `driver_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `garage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_student_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shool_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `car_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`license_plates`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_active` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKk9k2qotp6nupi0e2ahpl0bhrp` (`name`),
  UNIQUE KEY `UKbv7j7opq5tqp3tf91vi315ro9` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_student`
--

DROP TABLE IF EXISTS `class_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(20) DEFAULT NULL,
  `student_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_action`
--

LOCK TABLES `menu_action` WRITE;
/*!40000 ALTER TABLE `menu_action` DISABLE KEYS */;
INSERT INTO `menu_action` VALUES (1,'Manager User',NULL,'/users','fa fa-user'),(2,'Manager School',NULL,'/schools','fa fa-university'),(3,'Manager Car',NULL,'/cars','fa fa-bus'),(4,'Manager Student',NULL,'/students','fa fa-users'),(5,'Manager Teacher',NULL,'/teachers','fa fa-universal-access'),(6,'Manager File',NULL,'/files','fa fa-folder-open-o');
/*!40000 ALTER TABLE `menu_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (1,1,4),(2,2,4),(3,3,4),(4,4,4),(5,5,4),(6,4,1),(7,1,3),(8,3,3),(9,4,3),(10,5,3),(11,6,4);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_teacher'),(2,'ROLE_parents'),(3,'ROLE_principal'),(4,'ROLE_superAdmin'),(11,'All');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cars_of_school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `students_of_school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher_of_school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_study` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK251hwtk4rvkoblr76wknh8v41` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES ('string','Số 5 quang trung , Hà Đông , Hà Nội','string','Trường Tiểu Học Quang Trung Hà Đông','string','string','08:00',NULL),('THKĐHN','C4 Trần Huy Liệu, Giảng Võ, Ba Đình, Hà Nội','THKĐHN_car1','Trường Tiểu Học Kim Đồng Hà Nội','string','string','07:30','2020-01-01 00:00:00'),('TTHA',' Đ. Hoàng Minh Giám, Trung Hoà, Cầu Giấy, Hà Nội','','Trường Tiểu Học Amstedam','','',' 07:30','2020-02-01 00:00:00'),('TTHCG','Cầu Giấy , Hà Nội','','Trường Tiểu Học Cầu Giấy','','','07:30','2020-01-10 00:00:00'),('TTHCS','Thanh xuân, Nam Từ Liêm , Hà nội','','Trường Tiểu Học Chúc Sơn','','','08:00','2020-03-01 00:00:00'),('TTHCSHM','Hoàng Mai ,Hà Nội','','Trường Trung Học Cơ Sở Hoàng Mai','','','07:30',NULL),('TTHCSXMA','Xuân Mai , Chương Mỹ ,Hà Nội',NULL,'Trường Trung Học Cơ Sở Xuân Mai A',NULL,NULL,'07:00',NULL),('TTHCVAHD','Số 5 tô hiệu , Hà Đông , Hà Nội','string','Trường Tiểu Học Chu Văn An Hà Đông','string','string','08:00','2020-03-02 00:00:00'),('Tthđn','Số 8 tô hiệu, hà đông , hà nội','','Trường tiểu học đại nam','','','08:00','2020-01-20 00:00:00'),('TTHF','Cầu giấy , Hà Nội','','Trường Tiểu Học FPT','','','07:30','2020-01-22 00:00:00'),('TTHF2','Hòa Lạc , Hà Nội','','Trường Tiểu Học FPT 2','','','07:30',NULL),('TTHHC','Cầu Giấy ,Hà Nội','','Trường Tiểu Học Hoàng Cầu','','','08:30','2020-04-30 00:00:00'),('TTHNT1','Thanh xuân , Hà Nội','','Trường Tiểu Học Nguyễn Trãi 1','','','07:30',NULL),('TTHNT2','Thanh Xuân , Hà Nội','','Trường Tiểu Học Nguyễn Trãi 2','','','07:31',NULL),('TTHNTHĐ','Số 156 Trần Phú  , Hà Đông , Hà Nội','string','Trường Tiểu Học Nguyễn Trãi Hà Đông','string','string','08:00','2020-02-25 00:00:00'),('TTHNTL','Nam Từ Liêm , Hà Nội','','Trường Tiểu Học Nam Từ Liêm','','','07:30',NULL),('TTHPL','văn phú, hà đông, hà nội','','Trường Tiểu Học Phú La','','','07:30','2020-04-01 00:00:00'),('TTHTĐT','Cầu Giấy , Hà Nội','','Trường Tiểu Học Tôn Đức Thắng','','','08:00','2020-05-06 00:00:00'),('TTHTĐT2','Hà Đông , Hà Nội','','Trường Tiểu Học Tôn Đức Thắng 2','','','07:30',NULL),('TTHV','Nam Từ Liêm, Hà Nội','','Trường Tiểu Học VinSchool','','','08:00','2020-04-01 00:00:00');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `car_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `parents_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points_start` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('ĐP20150919000000','Lò Đúc, Hà Nội','THKĐHN_car1','2015-09-19 00:00:00','Đức Phúc','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','ĐP_1','032420309','Lò Đúc, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('LTTb20150201000000','P. Tố Hữu, Trung Văn, Từ Liêm, Hà Nội, Vietnam','THKĐHN_car1','2015-02-01 00:00:00','Linh Thị Tung bay','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','LTTb_3','012456789','P. Tố Hữu, Trung Văn, Từ Liêm, Hà Nội, Vietnam','THKĐHN','THKĐHN_class1',NULL),('LVL20151119000000','Yên nghĩa, Hà đông, Hà Nội','THKĐHN_car1','2015-11-19 00:00:00','Lê Văn Luyện','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','LVL_1','032410309','Yên nghĩa, Hà đông, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('MLR20150214000000','Đâu cũng được, Hà Nội','THKĐHN_car1','2015-02-14 00:00:00','Mệt Lắm Rồi','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','MLR_4','032411109','Đâu cũng được, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('MNH20150201000000','Hà Đông, Hà Nội','THKĐHN_car1','2015-02-01 00:00:00','Mai Nghỉ Học','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','MNH_4','012451719','Hà Đông, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('MS20150919000000','Không biết có ở Việt Nam không','THKĐHN_car1','2015-09-19 00:00:00','Mr Siro','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','MS_3','032420309','Mỹ Đình, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('MTT20150201000000','Ba Đình, Hà Nội','THKĐHN_car1','2015-02-01 00:00:00','Mai Thị Thúy','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','MTT_5','012451789','Ba Đình, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('NT20150402000000','20 Nguyễn Trãi, Thanh Xuân, Hà Nội','THKĐHN_car1','2015-04-02 00:00:00','Ngọc Trinh','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','NT_4','012411709','20 Nguyễn Trãi, Thanh Xuân, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('NTML20150219000000','Phố cổ, Hà Nội','THKĐHN_car1','2015-02-19 00:00:00','Nguyễn Thị Mỹ Linh','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','NTML_3','032411309','Phố cổ, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('NTN20151219000000','Gia Lâm, Hà Nội','THKĐHN_car1','2015-12-19 00:00:00','Nốt Tên Này','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','NTN_3','032410309','Gia Lâm, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('PĐD20161201000000','P. Tố Hữu, Trung Văn, Từ Liêm, Hà Nội, Vietnam','THKĐHN_car1','2016-12-01 00:00:00','Phạm Đình Duy','male','Giáp Bát, Hoàng Mai, Hà Nội',_binary '','PĐD_1','0398682575','Giáp Bát, Hoàng Mai, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('QTP20150101000000','Đường 19/5, P. Văn Quán, Hà Đông, Hà Nội, Việt Nam','THKĐHN_car1','2015-01-01 00:00:00','Quách Thị Phụng','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','QTP_3','0123456789','Đường 19/5, P. Văn Quán, Hà Đông, Hà Nội, Việt Nam','THKĐHN','THKĐHN_class1',NULL),('s119960928142404','string','string','1996-09-28 14:24:05','st 12345','string','string',_binary '','s1_2','0398682575','string','THKĐHN','string',NULL),('s119980519000000','string','string','1998-05-19 00:00:00','st 123456','string','string',_binary '','s1_5','0398682575','string','THKĐHN','string',NULL),('SNG20150401000000','Ỷ la, dương nội, Hà Đông, Hà Nội','THKĐHN_car1','2015-04-01 00:00:00','Sau Này Giàu','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','SNG_4','012411719','Ỷ la, dương nội, Hà Đông, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('TA20150401000000','Thanh Xuân, Hà Nội','THKĐHN_car1','2015-04-01 00:00:00','Trâm Anh','female','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','TA_4','012411709','Thanh Xuân, Hà Nội','THKĐHN','THKĐHN_class1',NULL),('TD20151120000000','Văn Miếu, Hà Nội','THKĐHN_car1','2015-11-20 00:00:00','Trần Dần','male','https://www.iconfinder.com/data/icons/eldorado-user/40/user-512.png',_binary '','TD_1','032110309','Văn Miếu, Hà Nội','THKĐHN','THKĐHN_class1',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (9,1),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(12,3),(8,4),(11,4),(12,4);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accessto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usercode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'[All]',NULL,'duy124@gmail.com','',NULL,_binary '','$2a$10$nBzK80Rq/Bahu.VtetlMu.Vt2LbtSLvCIiMnZgpIRSWs4Vok0S4wm','superAdmin','duy',NULL,NULL,NULL),(9,'[All]',NULL,'teacher@gmail.com','',NULL,_binary '','$2a$10$o14o87PPrNb45E9bM2QgNOA.bHYBxnhoGmwtsOoYB5L1UuelyhASe','teacher','teacher',NULL,NULL,NULL),(10,'[All]',NULL,'parent@gmail.com','',NULL,_binary '','$2a$10$2u9vsFWkybHTqBDeaj2pIeocDDKBwErp0gTsEXfk0rn.Ui8DSdpye','parents','parent',NULL,NULL,NULL),(11,'[all]',NULL,'duy@gmail.com','string',NULL,_binary '','$2a$10$6vJgcuUxmcim7/LZp2ZBn..vN4LZjHQJiFJMAHkKSBwkjq5T/aun2','admin','duy',NULL,NULL,NULL),(12,'[All]',NULL,'superadmin4@gmail.com','',NULL,_binary '','$2a$10$40HdEELc01vW.3J2vifaReEZ4VT22PzclLyNAm.eG1fb/yIWu/dcC','superAdmin','admin','admin',NULL,398682575),(13,NULL,NULL,NULL,'{student_id=QTP20150101000000}',NULL,_binary '','$2a$10$7KCeu.JSSrC0jDjEqjAJ6ur4uAUDXbcWrMhkeuXm2PTBcYDqmm9U2','parents','QTP20150101000000','QTP_1',NULL,NULL),(14,NULL,NULL,NULL,'{student_id=LTTb20150201000000}',NULL,_binary '','$2a$10$9tQFmZeEQBzjTrbyQyNEte0K0y2ScThK69JISuCNfPgZC77W.9nt.','parents','LTTb20150201000000','LTTb_1',NULL,NULL),(15,NULL,NULL,NULL,'{student_id=P?D20161201000000}',NULL,_binary '','$2a$10$4T.NUCfVknvyrUA7GizayuQRXJlFtuSrPqWMxFcypbIXQyi1ahmDq','parents','P?D20161201000000','P?D_1',NULL,NULL),(16,NULL,NULL,NULL,'{student_id=MTT20150201000000}',NULL,_binary '','$2a$10$OjZKOGcisigf9rNxRhgYH.9h7c/cm0rbTM6AlO.Zfp3IUYt0A2Lk2','parents','MTT20150201000000','MTT_1',NULL,NULL),(17,NULL,NULL,NULL,'{student_id=MNH20150201000000}',NULL,_binary '','$2a$10$Rq/2AViQzDdhL3/jo17j9O8rnRj.g4kXBs.M01AwfsHjQvkyG2ZDu','parents','MNH20150201000000','MNH_1',NULL,NULL),(18,NULL,NULL,NULL,'{student_id=SNG20150401000000}',NULL,_binary '','$2a$10$8bvy9FUl36ROxyS/MqUVdOB.RrrXpTyd6Y/LYRdGv.TJlhrRfHy4e','parents','SNG20150401000000','SNG_1',NULL,NULL),(19,NULL,NULL,NULL,'{student_id=TA20150401000000}',NULL,_binary '','$2a$10$Tfa7X9uKL3J5r3jk30FUkeEhjTrSdzkHKRAjjhb7x0vVm.Z6M/822','parents','TA20150401000000','TA_1',NULL,NULL),(20,NULL,NULL,NULL,'{student_id=NT20150402000000}',NULL,_binary '','$2a$10$h1kgU89Z7Y6sIueaoO/rxOUY1ou7THpZWWfLZCR5GnPD3T4T6r3Wa','parents','NT20150402000000','NT_1',NULL,NULL),(21,NULL,NULL,NULL,'{student_id=APT20150202000000}',NULL,_binary '','$2a$10$p/PknmV9.W/d.dd6g5ug2uPQMm949Y/4O/LWi5OA9rUOaAVbnfhZu','parents','APT20150202000000','APT_1',NULL,NULL),(22,NULL,NULL,NULL,'{student_id=MLR20150214000000}',NULL,_binary '','$2a$10$mhJix1IeFDIjY8sxZC0IuOM94UjXjc8WapcFlY2UOi4xGV.TfA4Le','parents','MLR20150214000000','MLR_1',NULL,NULL),(23,NULL,NULL,NULL,'{student_id=NTML20150219000000}',NULL,_binary '','$2a$10$N509bjgwPhOnuNgUCH1YKuJtfRNBS/t9I2OThL1XQzyp3gdjtcCcm','parents','NTML20150219000000','NTML_1',NULL,NULL),(24,NULL,NULL,NULL,'{student_id=?HP20150319000000}',NULL,_binary '','$2a$10$gRcblnf53VkUApAS8QWIy.N.cYTNwNC9Oh7zL7/S3.DYPX1lt46Uu','parents','?HP20150319000000','?HP_1',NULL,NULL),(25,NULL,NULL,NULL,'{student_id=?P20150919000000}',NULL,_binary '','$2a$10$fXlDXeC9fSHXcbzMT.6D4ODjzLVt6mJxHCLDNqJf5mibOi4DyFpgu','parents','?P20150919000000','?P_1',NULL,NULL),(26,NULL,NULL,NULL,'{student_id=MS20150919000000}',NULL,_binary '','$2a$10$37DsoeizoEtKtGq4/AXIX.BY6SSgyrdLPkFbo5SK0dQn1PNwFnofu','parents','MS20150919000000','MS_1',NULL,NULL),(27,NULL,NULL,NULL,'{student_id=NTN20151219000000}',NULL,_binary '','$2a$10$FUf080KBNlxgoSgqMHR5Z.T2jnIyT82vtTIBEN/6iWJRtJKu4Qx4K','parents','NTN20151219000000','NTN_1',NULL,NULL),(28,NULL,NULL,NULL,'{student_id=s19960928142405}',NULL,_binary '','$2a$10$Jain/RP.tzMnVIY5cnHFI.WUl/Ct4zyWhrZEhPxXo9EPeE6ojGnkK','parents','s19960928142405','s_1',NULL,NULL),(29,NULL,NULL,NULL,'{student_id=s19960928142405}',NULL,_binary '','$2a$10$vuLJVM6deEmWGVi0N2EDxeZjpbPwSpdcXfkqcUNhjLW8AUZNCLoey','parents','s19960928142405','s_2',NULL,NULL),(30,NULL,NULL,NULL,'{student_id=MTT20150201000000}',NULL,_binary '','$2a$10$SXUidJq15fyzuKLnnpC3cusA5fueNh3IRWuPCRD.v4g7VzA3pV7nO','parents','MTT20150201000000','MTT_2',NULL,NULL),(31,NULL,NULL,NULL,'{student_id=P?D20161201000000}',NULL,_binary '','$2a$10$5L3t0eAmT5g4bYqpxvfYmeE5UcxaBBylMkcuUY4aAMFkvMrkRsdje','parents','P?D20161201000000','P?D_2',NULL,NULL),(32,NULL,NULL,NULL,'{student_id=MNH20150201000000}',NULL,_binary '','$2a$10$ABUbyfgGYLaFIlSD8gNDKehoGGeOY7TU5H6aClBgR/Or3riDF7QJS','parents','MNH20150201000000','MNH_2',NULL,NULL),(33,NULL,NULL,NULL,'{student_id=QTP20150101000000}',NULL,_binary '','$2a$10$TKWIUKloFvm2jzUBV98Et.8p19PmPyVHsTVFlXiVUcK2ycpQu8xx.','parents','QTP20150101000000','QTP_2',NULL,NULL),(34,NULL,NULL,NULL,'{student_id=SNG20150401000000}',NULL,_binary '','$2a$10$YAKgf5u.eDZJBJwt4SS8p.Z2mucPChbYy81tPsfJOJNVmeLThAdPy','parents','SNG20150401000000','SNG_2',NULL,NULL),(35,NULL,NULL,NULL,'{student_id=TA20150401000000}',NULL,_binary '','$2a$10$ZonCymnD4nqLFmxZZVBdQOnyRZjfOsPI5u8/NF9QOPXbKcPDGbQyC','parents','TA20150401000000','TA_2',NULL,NULL),(36,NULL,NULL,NULL,'{student_id=NT20150402000000}',NULL,_binary '','$2a$10$NhyaKSvVKfBfnoyxlU.T3emMMAfqeGp9.Eg3pqaasmlFI00pkqVaW','parents','NT20150402000000','NT_2',NULL,NULL),(37,NULL,NULL,NULL,'{student_id=APT20150202000000}',NULL,_binary '','$2a$10$MDJaH5qChWjSaMNBfMen2.YOKCio4GVqSQbMJhHyvq7K4.2HcDgGS','parents','APT20150202000000','APT_2',NULL,NULL),(38,NULL,NULL,NULL,'{student_id=MLR20150214000000}',NULL,_binary '','$2a$10$wDiJdxPpiksStol07gyhCOtiHazKBvAfwEmDJNZtSS07.bWJV5Qc.','parents','MLR20150214000000','MLR_2',NULL,NULL),(39,NULL,NULL,NULL,'{student_id=LTTb20150201000000}',NULL,_binary '','$2a$10$CU1.KH9sEfZHe1KGmSgdk.HOUqzxkkV7eg6YAKT8F2a5l6w7WglJG','parents','LTTb20150201000000','LTTb_2',NULL,NULL),(40,NULL,NULL,NULL,'{student_id=P?D20161201000000}',NULL,_binary '','$2a$10$2/oTI0cLoZ1DbhTXfSouLug9FVbB7sty2YeqhI4QlmBjlDlR8kqu2','parents','P?D20161201000000','P?D_3',NULL,NULL),(41,NULL,NULL,NULL,'{student_id=MNH20150201000000}',NULL,_binary '','$2a$10$wcL5eX8UyXItl5o/q95i4OzSgUKK7ivGYpIv8b.XgrfYq0GRhwMBG','parents','MNH20150201000000','MNH_3',NULL,NULL),(42,NULL,NULL,NULL,'{student_id=SNG20150401000000}',NULL,_binary '','$2a$10$ppvb13Ve.aC9BdZ7cI0fVO9zqhjAR8IRDLUPbAmG8EPQ99hW7CXom','parents','SNG20150401000000','SNG_3',NULL,NULL),(43,NULL,NULL,NULL,'{student_id=TA20150401000000}',NULL,_binary '','$2a$10$WdadqMpGp8sreJVj/rwmTepLU.ocz8UWgTfeRaHwOFdlov6n005QS','parents','TA20150401000000','TA_3',NULL,NULL),(44,NULL,NULL,NULL,'{student_id=NT20150402000000}',NULL,_binary '','$2a$10$eNQ7XSq/6Z8n5U2moyVRW.kT64bdxDDMx5ulspCDehHm6Thq6KfG.','parents','NT20150402000000','NT_3',NULL,NULL),(45,NULL,NULL,NULL,'{student_id=APT20150202000000}',NULL,_binary '','$2a$10$jVeSkeR.SY6qjbQD2V3X7Oc/Sowik0MebTgMXO0Fk/XQfoop9gdS6','parents','APT20150202000000','APT_3',NULL,NULL),(46,NULL,NULL,NULL,'{student_id=MLR20150214000000}',NULL,_binary '','$2a$10$mWGhAQp5gOh0czjhFQ8jZ.IAPXkplnn6C9pwbKwrRzXq0.ZYSlYkm','parents','MLR20150214000000','MLR_3',NULL,NULL),(47,NULL,NULL,NULL,'{student_id=NTML20150219000000}',NULL,_binary '','$2a$10$NGhvxhr1tqmwj4VJe4OoFuedCGyo1wdfBYjoS357hvf6qgaWrTyrS','parents','NTML20150219000000','NTML_2',NULL,NULL),(48,NULL,NULL,NULL,'{student_id=?HP20150319000000}',NULL,_binary '','$2a$10$7/7gRqLnYQm6lKu4o2jrne4.CL0F1jqhncBLys8xeP/SQR2w3ckQO','parents','?HP20150319000000','?HP_2',NULL,NULL),(49,NULL,NULL,NULL,'{student_id=?P20150919000000}',NULL,_binary '','$2a$10$V0uO04JEPrSireXxI.1pYOBvf0lUPrcwWkmOVbQS0eG3b9vJYS5Am','parents','?P20150919000000','?P_2',NULL,NULL),(50,NULL,NULL,NULL,'{student_id=MS20150919000000}',NULL,_binary '','$2a$10$Y5zquI2YHTl8z/6jBvCmauVYBSU4feUVz/RqtXO7HL/5rS3GkSw9i','parents','MS20150919000000','MS_2',NULL,NULL),(51,NULL,NULL,NULL,'{student_id=NTN20151219000000}',NULL,_binary '','$2a$10$PZMLWVpgOzqpOXqOb0kFdOji3XpPCFPZ2UnHlNpR.ImfczCcbx3hm','parents','NTN20151219000000','NTN_2',NULL,NULL),(52,NULL,NULL,NULL,'{student_id=MTT20150201000000}',NULL,_binary '','$2a$10$RpLr7sd2vSxmQfmTGKVFguwhd1HeSZsZTizzqUXqkKrUIkMG.DTIy','parents','MTT20150201000000','MTT_3',NULL,NULL),(53,NULL,NULL,NULL,'{student_id=MTT20150201000000}',NULL,_binary '','$2a$10$ubDpC/u.OXFCIYnz6CRkJuwoSXlumgzzoF4d/UmsDTx8C3MJijOlG','parents','MTT20150201000000','MTT_4',NULL,NULL),(54,NULL,NULL,NULL,'{student_id=MTT20150201000000}',NULL,_binary '','$2a$10$EAIaSpgvXfYmBM4MU5i2/eLoQaQ3yFp9xWQWN1bKruzHoq824AFOu','parents','MTT20150201000000','MTT_5',NULL,NULL),(55,NULL,NULL,NULL,'{student_id=PĐD20161201000000}',NULL,_binary '','$2a$10$V7X7K4iRhTIQqx2H5GTveukbyz0MpnfjcnygC1coBmv/APcElAhl2','parents','PĐD20161201000000','PĐD_1',NULL,NULL),(56,NULL,NULL,NULL,'{student_id=MNH20150201000000}',NULL,_binary '','$2a$10$BsNIAJYN5tbWCxSuUpARMeuUTsarUVDWTWEEIukhENqYayIZkJdnu','parents','MNH20150201000000','MNH_4',NULL,NULL),(57,NULL,NULL,NULL,'{student_id=QTP20150101000000}',NULL,_binary '','$2a$10$s.GLv7lLQpLagpNZGJCSYeCVrR7Z8AFa3zfsAoxN7x4y3XqHlbuQW','parents','QTP20150101000000','QTP_3',NULL,NULL),(58,NULL,NULL,NULL,'{student_id=SNG20150401000000}',NULL,_binary '','$2a$10$K0hDyroMDUioKN2tMk6kAuL8dPbr6T5i5iqZbP0gUfk0NH4qJuATC','parents','SNG20150401000000','SNG_4',NULL,NULL),(59,NULL,NULL,NULL,'{student_id=TA20150401000000}',NULL,_binary '','$2a$10$AT1KWkCXX4s1CgD4kV3Pi.iAgeFHjzmwvgSrbgoMRvdesf1i3uMeS','parents','TA20150401000000','TA_4',NULL,NULL),(60,NULL,NULL,NULL,'{student_id=NT20150402000000}',NULL,_binary '','$2a$10$9UV5/sxGYUtFwig65jdoEOWSLOqVmXyGXQyg0R6u6jq3s8Ifsb.fK','parents','NT20150402000000','NT_4',NULL,NULL),(61,NULL,NULL,NULL,'{student_id=APT20150202000000}',NULL,_binary '','$2a$10$8TgSMTi6PmuWRlW/Ob437eEHwadP6FlZrCEGALpOA.D80EHhCzefe','parents','APT20150202000000','APT_4',NULL,NULL),(62,NULL,NULL,NULL,'{student_id=MLR20150214000000}',NULL,_binary '','$2a$10$M1kJNp3vnt/4Pm2lF73rteVvv7SmI5k0WerkJOUBgSLT.LD6p7cP.','parents','MLR20150214000000','MLR_4',NULL,NULL),(63,NULL,NULL,NULL,'{student_id=LTTb20150201000000}',NULL,_binary '','$2a$10$TBcXiGusgSXs/NzSDLLnD.pXSJtic8B98yFUAFwB1nzKO5qtZLk3C','parents','LTTb20150201000000','LTTb_3',NULL,NULL),(64,NULL,NULL,NULL,'{student_id=NTML20150219000000}',NULL,_binary '','$2a$10$F/RhBhQf.Z/2oKsAa/vtpu7j79rjvS8kIbqfUwYmAWUX0nFAZqpUW','parents','NTML20150219000000','NTML_3',NULL,NULL),(65,NULL,NULL,NULL,'{student_id=ĐHP20150319000000}',NULL,_binary '','$2a$10$i5DWm4G46d2CgXIJx5pKqe4M2RS5kz3fiU.CDdMTGk6S5JtAW2RI.','parents','ĐHP20150319000000','ĐHP_1',NULL,NULL),(66,NULL,NULL,NULL,'{student_id=ĐP20150919000000}',NULL,_binary '','$2a$10$/0i8dRu49iSAZBiI6eMov.5RFuWSyOJN9N.x3jO9E/qlWlzAynswO','parents','ĐP20150919000000','ĐP_1',NULL,NULL),(67,NULL,NULL,NULL,'{student_id=MS20150919000000}',NULL,_binary '','$2a$10$QWReAzbG00kMebyfm3/ggOo7HAu.JqvIdWWjK4oeBcbzBxfBdEZ6K','parents','MS20150919000000','MS_3',NULL,NULL),(68,NULL,NULL,NULL,'{student_id=NTN20151219000000}',NULL,_binary '','$2a$10$ywkK2WpLhe7/vjnwy.KdfeG0zsBSVvCVEP4fqIupix/NBEbx3TGyC','parents','NTN20151219000000','NTN_3',NULL,NULL),(69,NULL,NULL,NULL,'{student_id=LVL20151119000000}',NULL,_binary '','$2a$10$.JFUwxqSubaZIvf7IZYAWOltSK0qksEXL522j0I8PQznfJNhY2W52','parents','LVL20151119000000','LVL_1',NULL,NULL),(70,NULL,NULL,NULL,'{student_id=BL20151126000000}',NULL,_binary '','$2a$10$rUTSDhEeevA5xuM3b5CIYeo.ZfdlP7ccj1MKNHFd6lXyG/tMlG1iG','parents','BL20151126000000','BL_1',NULL,NULL),(71,NULL,NULL,NULL,'{student_id=TD20151120000000}',NULL,_binary '','$2a$10$Wtb6YlOjMr3VkyvNlwDhgecfLRcd.YcBhiZod2/TgxTWbj3ERevfC','parents','TD20151120000000','TD_1',NULL,NULL),(72,NULL,NULL,NULL,'{student_id=NTN20151219000001}',NULL,_binary '','$2a$10$O9.YDv6S9/n9bv7a5Tf3IO1fyobhcZZ/rTb6FtvvHiun7WuCDOM8a','parents','NTN20151219000001','NTN_4',NULL,NULL),(73,NULL,NULL,NULL,'{student_id=APT20150202000001}',NULL,_binary '','$2a$10$QI1U5ryNEUvIkwtHXZjkceBnnXTTINegP7vy/CHHUlnvI9EbFUvkC','parents','APT20150202000001','APT_5',NULL,NULL),(74,NULL,NULL,NULL,'{student_id=APT20150202000001}',NULL,_binary '','$2a$10$cv3IexwrS/uZ5/1zzCxboOu.BD5CbaPv41r3f4t6V8XVTBdu5VjUG','parents','APT20150202000001','APT_6',NULL,NULL),(75,NULL,NULL,NULL,'{student_id=s119960928142404}',NULL,_binary '','$2a$10$oaDM4ERzhbSrBjg6d05neO6351NoZ2vn/bWNEds0RuAaw2NcVNggS','parents','s119960928142404','s1_1',NULL,NULL),(76,NULL,NULL,NULL,'{student_id=BL20151126000001}',NULL,_binary '','$2a$10$7ACTiMOyQEWyi3Hb1ep/s.jX6Cm/5X7rxWJqzb/B3/lVhYvcjzDKm','parents','BL20151126000001','BL_2',NULL,NULL),(77,NULL,NULL,NULL,'{student_id=BL20151126000001}',NULL,_binary '','$2a$10$ee2QRC.2B/F.RDKOS3dFluRtRr.0CIIhbfloXFWV7PadXLYIwvk1i','parents','BL20151126000001','BL_3',NULL,NULL),(78,NULL,NULL,NULL,'{student_id=s119960928142404}',NULL,_binary '','$2a$10$c6pflFNyQgteQvz06yFl4Oj/olm63hh1fsYNqyCxR/C3QruRTd1Di','parents','s119960928142404','s1_2',NULL,NULL),(79,NULL,NULL,NULL,'{student_id=s119960928142405}',NULL,_binary '','$2a$10$d3pi8Q90CKgTGczKQy/wEeMpU7ldVx9rh.vW7ORLSCJjiyrp2a/ti','parents','s119960928142405','s1_3',NULL,NULL),(80,NULL,NULL,NULL,'{student_id=s119960928142405}',NULL,_binary '','$2a$10$Y/5Ozy51D8Wlc4rNFLbSv.LlqTAzp8cgSvSkPfvzMIi8YC0kZNiZa','parents','s119960928142405','s1_4',NULL,NULL),(81,NULL,NULL,NULL,'{student_id=s119980519000000}',NULL,_binary '','$2a$10$VsirqMAjLslCzFiwRBcz8Oj7qNTu/NzIqOrk9H5TRSpHHSjzlciua','parents','s119980519000000','s1_5',NULL,NULL),(82,NULL,NULL,NULL,'{student_id=N19980915000000}',NULL,_binary '','$2a$10$Xq0NeWYVM67pOzJnfIIS1.78RHY3ZbDdOLvWAgjuB5FlAYYrRJ6T.','parents','N19980915000000','N_1',NULL,NULL);
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

-- Dump completed on 2020-11-16 13:32:35
