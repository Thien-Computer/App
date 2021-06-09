-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ass2
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
-- Table structure for table `banggia`
--

DROP TABLE IF EXISTS `banggia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banggia` (
  `gia_xebus` int NOT NULL,
  `day_in_week` int NOT NULL,
  `day_last_week` int NOT NULL,
  `month_one` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banggia`
--

LOCK TABLES `banggia` WRITE;
/*!40000 ALTER TABLE `banggia` DISABLE KEYS */;
INSERT INTO `banggia` VALUES (5000,30000,40000,280000);
/*!40000 ALTER TABLE `banggia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuyenxe`
--

DROP TABLE IF EXISTS `chuyenxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyenxe` (
  `id_tuyen` varchar(4) NOT NULL,
  `stt` int NOT NULL,
  PRIMARY KEY (`id_tuyen`,`stt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenxe`
--

LOCK TABLES `chuyenxe` WRITE;
/*!40000 ALTER TABLE `chuyenxe` DISABLE KEYS */;
INSERT INTO `chuyenxe` VALUES ('B001',1),('B001',2),('B001',3),('B001',4),('B001',5),('B002',1),('B002',2),('B002',3),('B002',4),('T002',1),('T002',2),('T002',3),('T002',4);
/*!40000 ALTER TABLE `chuyenxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduong`
--

DROP TABLE IF EXISTS `conduong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conduong` (
  `id_cd` varchar(6) NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  PRIMARY KEY (`id_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduong`
--

LOCK TABLES `conduong` WRITE;
/*!40000 ALTER TABLE `conduong` DISABLE KEYS */;
INSERT INTO `conduong` VALUES ('CD1','Nguyen Anh Thu'),('CD10','Tran Hung Dao'),('CD2','Truong Trinh'),('CD3','Luy Ban Bich'),('CD4','Hong Bang'),('CD5','Cong Hoa'),('CD6','Nam ki Khoi Nghia'),('CD7','Duong 3/2'),('CD8','Au Co'),('CD9','Nguyen Van Troi');
/*!40000 ALTER TABLE `conduong` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `id_conduong` BEFORE INSERT ON `conduong` FOR EACH ROW BEGIN
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.conduong;
  SET NEW.id_cd = CONCAT('CD',CAST(total + 1 AS CHAR));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `doanduong`
--

DROP TABLE IF EXISTS `doanduong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doanduong` (
  `id_gl1` varchar(10) NOT NULL,
  `id_gl2` varchar(10) NOT NULL,
  `id_cd` varchar(10) NOT NULL,
  `stt` int NOT NULL,
  `length` DECIMAL(6,2) DEFAULT NULL,
  KEY `fk_gl1` (`id_gl1`),
  KEY `fk_gl2` (`id_gl2`),
  KEY `fk_cd` (`id_cd`),
  CONSTRAINT `fk_cd` FOREIGN KEY (`id_cd`) REFERENCES `conduong` (`id_cd`),
  CONSTRAINT `fk_gl1` FOREIGN KEY (`id_gl1`) REFERENCES `giaolo` (`id_gl`),
  CONSTRAINT `fk_gl2` FOREIGN KEY (`id_gl2`) REFERENCES `giaolo` (`id_gl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doanduong`
--

LOCK TABLES `doanduong` WRITE;
/*!40000 ALTER TABLE `doanduong` DISABLE KEYS */;
INSERT INTO `doanduong` VALUES ('GL1','GL2','CD1',1,1.50),('GL2','GL3','CD2',1,2.00),('GL3','GL4','CD2',2,4.00),('GL4','GL5','CD2',3,3.00),('GL5','GL6','CD2',4,3.50),('GL6','GL7','CD8',1,5.20),('GL7','GL8','CD8',2,4.30),('GL8','GL9','CD7',4,0.50),('GL10','GL11','CD5',1,6.50),('GL11','GL12','CD9',3,3.50),('GL12','GL13','CD7',5,0.80);
/*!40000 ALTER TABLE `doanduong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ga_tram`
--

DROP TABLE IF EXISTS `ga_tram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ga_tram` (
  `id_gatram` varchar(7) NOT NULL,
  `address` varchar(50) NOT NULL,
  `name_gatram` varchar(30) DEFAULT NULL,
  `ga_tram` tinyint(1) DEFAULT NULL,
  `id_gl1` varchar(6) NOT NULL,
  `id_gl2` varchar(6) NOT NULL,
  PRIMARY KEY (`id_gatram`),
  KEY `fk_gl1_gatram` (`id_gl1`),
  KEY `fk_gl2_gatram` (`id_gl2`),
  CONSTRAINT `fk_gl1_gatram` FOREIGN KEY (`id_gl1`) REFERENCES `giaolo` (`id_gl`),
  CONSTRAINT `fk_gl2_gatram` FOREIGN KEY (`id_gl2`) REFERENCES `giaolo` (`id_gl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ga_tram`
--

LOCK TABLES `ga_tram` WRITE;
/*!40000 ALTER TABLE `ga_tram` DISABLE KEYS */;
INSERT INTO `ga_tram` VALUES ('BT00001','26 Nguyen Anh Thu','Nga Tu Nuoc Da',0,'GL1','GL2'),('BT00002','687 Trường Chinh','Bến Xe An Sương',0,'GL2','GL3'),('BT00003','26/19C Trường Chinh','Kcn Tân Bình',0,'GL3','GL4'),('BT00004','47 Au Co','Vong xoay Le Dai Thanh',0,'GL4','GL5'),('BT00005','76 Hong Bang','Cau vuot Cay Go',0,'GL6','GL7'),('BT00006','182 Tran Hung Dao','Ben xe Cho Lon',0,'GL8','GL9'),('BT00007','247 Hoàng Văn Thụ','Bảo Tàng Miền Đông',0,'GL9','GL10'),('BT00008','24 Nam Kỳ Khởi Nghĩa,','Điện Biên Phủ',0,'GL10','GL11'),('BT00009','94 - 96 Lê Lai','Khách Sạn New World',0,'GL11','GL12'),('BT00010','200 Lê Lai','Bến Xe Buýt Sài Gòn',0,'GL12','GL13');
/*!40000 ALTER TABLE `ga_tram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghe_gas_tram`
--

DROP TABLE IF EXISTS `ghe_gas_tram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghe_gas_tram` (
  `id_tuyen` varchar(4) NOT NULL,
  `stt` int NOT NULL,
  `id_gatram` varchar(7) NOT NULL,
  `stt_tramdung` int NOT NULL,
  `time_begin` time NOT NULL,
  `time_stop` time NOT NULL,
  PRIMARY KEY (`id_tuyen`,`stt`,`id_gatram`),
  KEY `id_gatram` (`id_gatram`),
  CONSTRAINT `ghe_gas_tram_ibfk_1` FOREIGN KEY (`id_tuyen`, `stt`) REFERENCES `chuyenxe` (`id_tuyen`, `stt`),
  CONSTRAINT `ghe_gas_tram_ibfk_2` FOREIGN KEY (`id_gatram`) REFERENCES `ga_tram` (`id_gatram`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe_gas_tram`
--

LOCK TABLES `ghe_gas_tram` WRITE;
/*!40000 ALTER TABLE `ghe_gas_tram` DISABLE KEYS */;
INSERT INTO `ghe_gas_tram` VALUES ('B001',1,'BT00001',1,'08:00:00','08:00:05'),('B001',1,'BT00002',2,'09:00:00','09:00:05'),('B001',1,'BT00003',3,'10:00:00','10:00:05'),('B001',1,'BT00004',4,'11:00:00','11:00:05'),('B001',1,'BT00005',5,'12:00:00','12:00:05'),('B001',1,'BT00006',6,'13:01:00','14:02:00'),('B001',2,'BT00001',1,'08:10:00','08:10:05'),('B001',2,'BT00002',2,'09:10:00','09:10:05'),('B001',2,'BT00003',3,'10:10:00','10:10:05'),('B001',2,'BT00004',4,'11:10:00','11:10:05'),('B001',2,'BT00005',5,'12:10:00','12:10:05'),('B002',1,'BT00001',1,'06:06:00','07:07:00'),('B002',1,'BT00002',2,'07:09:00','20:19:00'),('B002',1,'BT00003',3,'09:28:00','22:24:00');
/*!40000 ALTER TABLE `ghe_gas_tram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giaolo`
--

DROP TABLE IF EXISTS `giaolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaolo` (
  `id_gl` varchar(6) NOT NULL DEFAULT '0',
  `l_at` DECIMAL(10,3) NOT NULL,
  `l_ong` DECIMAL(10,3) NOT NULL,
  PRIMARY KEY (`id_gl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaolo`
--

LOCK TABLES `giaolo` WRITE;
/*!40000 ALTER TABLE `giaolo` DISABLE KEYS */;
INSERT INTO `giaolo` VALUES ('GL1',10.870229,106.618561),('GL10',10.760264,106.653297),('GL11',10.801151,106.662956),('GL12',10.791866,106.681686),('GL13',10.785155,106.689011),('GL2',10.855292,106.607208),('GL3',10.843123,106.615242),('GL4',10.820410,106.630539),('GL5',10.807593,106.634598),('GL6',10.801871,106.636726),('GL7',10.785994,106.641632),('GL8',10.769016,106.651817),('GL9',10.762135,106.656944);
/*!40000 ALTER TABLE `giaolo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `id_giaolo` BEFORE INSERT ON `giaolo` FOR EACH ROW BEGIN
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.giaolo;
  SET NEW.id_gl = CONCAT('GL',CAST(total + 1 AS CHAR));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hanhkhach`
--

DROP TABLE IF EXISTS `hanhkhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hanhkhach` (
  `id_hanhkhach` varchar(8) NOT NULL,
  `cmnd_cccd` varchar(12) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  PRIMARY KEY (`id_hanhkhach`),
  UNIQUE KEY `cmnd_cccd` (`cmnd_cccd`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hanhkhach`
--

LOCK TABLES `hanhkhach` WRITE;
/*!40000 ALTER TABLE `hanhkhach` DISABLE KEYS */;
INSERT INTO `hanhkhach` VALUES ('KH000001','251281888','Giang Vien','0862669124','nam','thienpham@gmail.com','2001-04-30'),('KH000002','251254888','Giang Vien','0862669123','nam','hongkhanh@gmail.com','2001-04-03'),('KH000003','211254888','sinh vien','0862769123','nam','hongkhanh@gmail.com','2001-04-03'),('KH000004','211254881','sinh vien','0862769121','nam','name@gmail.com','2001-05-03'),('KH000005','255554566','Bảo vệ','0862665466','nữ','nhanvien43@gmail.com','2000-03-22'),('KH000006','255434566','Thanh Tra','0862654366','nữ','nhanvien35@gmail.com','2033-03-22'),('KH000007','2432234566','Sinh vien','0864354366','nữ','nhanvien435@gmail.com','2022-03-22'),('KH000008','24325353566','Sinh vien','032354366','nữ','nhanvien12@gmail.com','2432-03-22'),('KH000009','2443353566','Sinh vien','032868366','nữ','nhanvien16@gmail.com','2452-03-22');
/*!40000 ALTER TABLE `hanhkhach` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `id_hanhkhac` BEFORE INSERT ON `hanhkhach` FOR EACH ROW BEGIN
 
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.hanhkhach;
   
  SET NEW.id_hanhkhach = CONCAT('KH', LPAD(CAST(total + 1 AS CHAR),6,'0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id_nhanvien` varchar(6) NOT NULL,
  `type_job` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `phone_public` varchar(11) DEFAULT NULL,
  `phone_private` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_nhanvien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('NV0001','ke toan','2001-02-03','nhanvien@gmail.com','nu','023556455','03565654'),('NV0002','ke toan','1998-02-03','nhanvien1@gmail.com','nu','02545546455','0345454654'),('NV0003','ke toan','1998-02-03','nhanvien1@gmail.com','nu','02545546455','0345454654'),('NV0004','ke toan','1998-02-03','nhanvien1@gmail.com','nu','02545546455','0345454654'),('NV0005','ke toan','1998-02-03','nhanvien1@gmail.com','nu','02545546455','0345454654'),('NV0006','ke toan','1998-02-03','nhanvien1@gmail.com','nu','02545546455','0345454654');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `id_nhanvien` BEFORE INSERT ON `nhanvien` FOR EACH ROW BEGIN
 
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.nhanvien;
   
  SET NEW.id_nhanvien = CONCAT('NV', LPAD(CAST(total + 1 AS CHAR),4,'0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `thetu`
--

DROP TABLE IF EXISTS `thetu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thetu` (
  `id_thetu` varchar(8) NOT NULL,
  `buy_at` datetime NOT NULL,
  `id_hanhkhach` varchar(8) NOT NULL,
  PRIMARY KEY (`id_thetu`),
  KEY `id_hanhkhach` (`id_hanhkhach`),
  CONSTRAINT `thetu_ibfk_1` FOREIGN KEY (`id_hanhkhach`) REFERENCES `hanhkhach` (`id_hanhkhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thetu`
--

LOCK TABLES `thetu` WRITE;
/*!40000 ALTER TABLE `thetu` DISABLE KEYS */;
INSERT INTO `thetu` VALUES ('TT000001','2021-05-22 00:00:00','KH000001'),('TT000002','2021-05-22 00:00:00','KH000002'),('TT000003','2021-05-22 00:00:00','KH000003'),('TT000004','2021-05-22 00:00:00','KH000004'),('TT000005','2021-05-22 00:00:00','KH000001');
/*!40000 ALTER TABLE `thetu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `id_thetu` BEFORE INSERT ON `thetu` FOR EACH ROW BEGIN
 
   DECLARE total INT DEFAULT 0;
   SELECT COUNT(*) INTO total
   FROM ass2.thetu; 
  SET NEW.id_thetu = CONCAT('TT', LPAD(CAST(total + 1 AS CHAR),6,'0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tuyenbus`
--

DROP TABLE IF EXISTS `tuyenbus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyenbus` (
  `No_id` int NOT NULL AUTO_INCREMENT,
  `id_tuyen` varchar(4) NOT NULL,
  PRIMARY KEY (`No_id`),
  KEY `fk_tuyen` (`id_tuyen`),
  CONSTRAINT `fk_tuyen` FOREIGN KEY (`id_tuyen`) REFERENCES `tuyenxe` (`id_tuyen`),
  CONSTRAINT `check_tuyen` CHECK ((`id_tuyen` like _utf8mb4'B%'))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyenbus`
--

LOCK TABLES `tuyenbus` WRITE;
/*!40000 ALTER TABLE `tuyenbus` DISABLE KEYS */;
INSERT INTO `tuyenbus` VALUES (1,'B001'),(2,'B001'),(4,'B001'),(9,'B001'),(3,'B002'),(8,'B002'),(5,'B003'),(6,'B003'),(7,'B003');
/*!40000 ALTER TABLE `tuyenbus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuyentau`
--

DROP TABLE IF EXISTS `tuyentau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyentau` (
  `id_tau` varchar(1) NOT NULL,
  `name_tau` varchar(30) NOT NULL,
  `dongia` int DEFAULT NULL,
  `id_tuyen` varchar(4) NOT NULL,
  PRIMARY KEY (`id_tau`),
  UNIQUE KEY `name_tau` (`name_tau`),
  KEY `fk_tuyentau` (`id_tuyen`),
  CONSTRAINT `fk_tuyentau` FOREIGN KEY (`id_tuyen`) REFERENCES `tuyenxe` (`id_tuyen`),
  CONSTRAINT `check_tuyentau` CHECK ((`id_tuyen` like _utf8mb4'T%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyentau`
--

LOCK TABLES `tuyentau` WRITE;
/*!40000 ALTER TABLE `tuyentau` DISABLE KEYS */;
INSERT INTO `tuyentau` VALUES ('A','Bitis',20000,'T001'),('B','Chùa Vĩnh Phước',10000,'T001'),('C','Hong Kong',250000,'T002'),('D','Chế Lan Viên',25000,'T001'),('E','Thượng Uyển',30000,'T003'),('G','Bac Kinh',100000,'T003');
/*!40000 ALTER TABLE `tuyentau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuyenxe`
--

DROP TABLE IF EXISTS `tuyenxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyenxe` (
  `id_tuyen` varchar(4) NOT NULL,
  PRIMARY KEY (`id_tuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyenxe`
--

LOCK TABLES `tuyenxe` WRITE;
/*!40000 ALTER TABLE `tuyenxe` DISABLE KEYS */;
INSERT INTO `tuyenxe` VALUES ('B001'),('B002'),('B003'),('B004'),('B005'),('T001'),('T002'),('T003'),('T004'),('T005');
/*!40000 ALTER TABLE `tuyenxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve`
--

DROP TABLE IF EXISTS `ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve` (
  `id_ve` varchar(16) NOT NULL,
  `loai_ve` int NOT NULL,
  `gia_ve` int ,
  `buy_at` datetime DEFAULT NULL,
  `id_hanhkhach` varchar(8) NOT NULL,
  PRIMARY KEY (`id_ve`),
  CONSTRAINT `ve_chk_1` CHECK ((`loai_ve` < 3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve`
--

LOCK TABLES `ve` WRITE;
/*!40000 ALTER TABLE `ve` DISABLE KEYS */;
INSERT INTO `ve` VALUES ('VD24052021172427',2,30000,'2021-05-24 17:24:27','KH000002'),('VD25052021100523',2,30000,'2021-05-25 10:05:23','KH000004'),('VD25052021100530',2,30000,'2021-05-25 10:05:30','KH000005'),('VD25052021100535',2,30000,'2021-05-25 10:05:35','KH000002'),('VD25052021100539',2,30000,'2021-05-25 10:05:39','KH000004'),('VM25052021103034',1,280000,'2021-05-25 10:30:34','KH000001'),('VM25052021103038',1,280000,'2021-05-25 10:30:38','KH000002'),('VM25052021103041',1,280000,'2021-05-25 10:30:41','KH000003'),('VM25052021103044',1,280000,'2021-05-25 10:30:44','KH000004'),('VM25052021103047',1,280000,'2021-05-25 10:30:47','KH000005'),('VO25052021103228',0,5000,'2021-05-25 10:32:28','KH000001'),('VO25052021103232',0,5000,'2021-05-25 10:32:32','KH000002'),('VO25052021103241',0,5000,'2021-05-25 10:32:41','KH000003'),('VO25052021103245',0,5000,'2021-05-25 10:32:45','KH000004'),('VO25052021103248',0,5000,'2021-05-25 10:32:48','KH000005');
/*!40000 ALTER TABLE `ve` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_giave` BEFORE INSERT ON `ve` FOR EACH ROW BEGIN
   DECLARE loai int  ; 
    DECLARE mot int  ;  
    DECLARE hai int  ; 
     DECLARE ba int  ; 
       DECLARE bon int  ; 
       DECLARE key_ve varchar(1) ; 
    
	set loai = new.loai_ve;
    select gia_xebus,day_in_week,day_last_week,month_one into mot,hai,ba,bon
    from banggia;
	 if (loai=1) then 
		 set new.gia_ve = bon; 
         set key_ve = 'M';
		elseif (loai=2 and DAYNAME(now())= 'Sunday') then 
		 set new.gia_ve = ba;
         set key_ve = 'D';
         elseif (loai=2 ) then 
		 set new.gia_ve = hai;
          set key_ve = 'D';
		else 
		 set new.gia_ve = mot;
         set key_ve = 'O';
    end if ;
     set new.buy_at = DATE_FORMAT( CURRENT_TIMESTAMP(),'%Y-%m-%d %H:%i:%s');
     set new.id_ve =  concat('V',key_ve,DATE_FORMAT( CURRENT_TIMESTAMP(),'%d%m%Y%H%i%s'));
   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ve_1ngay`
--

DROP TABLE IF EXISTS `ve_1ngay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve_1ngay` (
  `id_ve` varchar(16) NOT NULL,
  `used_at` date NOT NULL,
  PRIMARY KEY (`id_ve`),
  CONSTRAINT `ve_1ngay_ibfk_1` FOREIGN KEY (`id_ve`) REFERENCES `ve` (`id_ve`),
  CONSTRAINT `ve_1ngay_chk_1` CHECK ((`id_ve` like _utf8mb4'VD%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve_1ngay`
--

LOCK TABLES `ve_1ngay` WRITE;
/*!40000 ALTER TABLE `ve_1ngay` DISABLE KEYS */;
INSERT INTO `ve_1ngay` VALUES ('VD24052021172427','2021-05-29'),('VD25052021100523','2021-05-22'),('VD25052021100530','2021-05-23'),('VD25052021100535','2021-05-26'),('VD25052021100539','2021-05-29');
/*!40000 ALTER TABLE `ve_1ngay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ve_1ngay_action`
--

DROP TABLE IF EXISTS `ve_1ngay_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve_1ngay_action` (
  `id_ve` varchar(16) NOT NULL,
  `id_tuyen` varchar(4) NOT NULL,
  `id_gatram_len` varchar(7) NOT NULL,
  `id_gatram_xuong` varchar(7) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  KEY `id_ve` (`id_ve`),
  KEY `id_tuyen` (`id_tuyen`),
  KEY `id_gatram_len` (`id_gatram_len`),
  KEY `id_gatram_xuong` (`id_gatram_xuong`),
  CONSTRAINT `ve_1ngay_action_ibfk_1` FOREIGN KEY (`id_ve`) REFERENCES `ve_1ngay` (`id_ve`),
  CONSTRAINT `ve_1ngay_action_ibfk_2` FOREIGN KEY (`id_tuyen`) REFERENCES `tuyenxe` (`id_tuyen`),
  CONSTRAINT `ve_1ngay_action_ibfk_3` FOREIGN KEY (`id_gatram_len`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `ve_1ngay_action_ibfk_4` FOREIGN KEY (`id_gatram_xuong`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `ve_1ngay_action_chk_1` CHECK ((`time_in` < `time_out`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve_1ngay_action`
--

LOCK TABLES `ve_1ngay_action` WRITE;
/*!40000 ALTER TABLE `ve_1ngay_action` DISABLE KEYS */;
INSERT INTO `ve_1ngay_action` VALUES ('VD24052021172427','B001','BT00001','BT00004','07:24:34','08:24:34'),('VD25052021100523','B001','BT00001','BT00004','08:30:00','09:30:00'),('VD25052021100523','B001','BT00005','BT00006','10:30:00','11:30:00'),('VD25052021100535','B001','BT00004','BT00007','15:30:00','16:30:00'),('VD25052021100535','B001','BT00002','BT00003','18:30:00','19:30:00');
/*!40000 ALTER TABLE `ve_1ngay_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vele`
--

DROP TABLE IF EXISTS `vele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vele` (
  `id_ve` varchar(16) NOT NULL,
  `id_tuyen` varchar(4) NOT NULL,
  `used_at` date NOT NULL,
  `id_gatram_len` varchar(7) NOT NULL,
  `id_gatram_xuong` varchar(7) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  PRIMARY KEY (`id_ve`),
  KEY `id_tuyen` (`id_tuyen`),
  KEY `id_gatram_len` (`id_gatram_len`),
  KEY `id_gatram_xuong` (`id_gatram_xuong`),
  CONSTRAINT `vele_ibfk_1` FOREIGN KEY (`id_ve`) REFERENCES `ve` (`id_ve`),
  CONSTRAINT `vele_ibfk_2` FOREIGN KEY (`id_tuyen`) REFERENCES `tuyenxe` (`id_tuyen`),
  CONSTRAINT `vele_ibfk_3` FOREIGN KEY (`id_gatram_len`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `vele_ibfk_4` FOREIGN KEY (`id_gatram_xuong`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `vele_chk_1` CHECK ((`id_ve` like _utf8mb4'VO%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vele`
--

LOCK TABLES `vele` WRITE;
/*!40000 ALTER TABLE `vele` DISABLE KEYS */;
INSERT INTO `vele` VALUES ('VO25052021103228','B001','2021-05-29','BT00002','BT00005','07:09:00','08:09:00'),('VO25052021103232','B001','2021-05-29','BT00002','BT00005','07:09:00','08:09:00'),('VO25052021103241','B001','2021-05-29','BT00002','BT00005','07:09:00','08:09:00'),('VO25052021103245','B001','2021-05-25','BT00003','BT00004','08:09:00','12:09:00'),('VO25052021103248','B001','2021-05-22','BT00003','BT00004','08:09:00','12:09:00');
/*!40000 ALTER TABLE `vele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vethang`
--

DROP TABLE IF EXISTS `vethang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vethang` (
  `id_ve` varchar(16) NOT NULL,
  `id_tuyen` varchar(4) NOT NULL,
  `id_gatram1` varchar(7) NOT NULL,
  `id_gatram2` varchar(7) NOT NULL,
  PRIMARY KEY (`id_ve`),
  KEY `id_tuyen` (`id_tuyen`),
  KEY `id_gatram1` (`id_gatram1`),
  KEY `id_gatram2` (`id_gatram2`),
  CONSTRAINT `vethang_ibfk_1` FOREIGN KEY (`id_ve`) REFERENCES `ve` (`id_ve`),
  CONSTRAINT `vethang_ibfk_2` FOREIGN KEY (`id_tuyen`) REFERENCES `tuyenxe` (`id_tuyen`),
  CONSTRAINT `vethang_ibfk_3` FOREIGN KEY (`id_gatram1`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `vethang_ibfk_4` FOREIGN KEY (`id_gatram2`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `vethang_chk_1` CHECK ((`id_ve` like _utf8mb4'VM%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vethang`
--

LOCK TABLES `vethang` WRITE;
/*!40000 ALTER TABLE `vethang` DISABLE KEYS */;
INSERT INTO `vethang` VALUES ('VM25052021103034','B001','BT00001','BT00003'),('VM25052021103038','B001','BT00001','BT00005'),('VM25052021103041','B001','BT00004','BT00002'),('VM25052021103044','B001','BT00004','BT00002'),('VM25052021103047','B001','BT00006','BT00003');
/*!40000 ALTER TABLE `vethang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vethang_action`
--

DROP TABLE IF EXISTS `vethang_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vethang_action` (
  `id_ve` varchar(16) NOT NULL,
  `used_at` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `id_gatram_len` varchar(7) NOT NULL,
  `id_gatram_xuong` varchar(7) NOT NULL,
  KEY `id_ve` (`id_ve`),
  KEY `id_gatram_len` (`id_gatram_len`),
  KEY `id_gatram_xuong` (`id_gatram_xuong`),
  CONSTRAINT `vethang_action_ibfk_1` FOREIGN KEY (`id_ve`) REFERENCES `vethang` (`id_ve`),
  CONSTRAINT `vethang_action_ibfk_2` FOREIGN KEY (`id_gatram_len`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `vethang_action_ibfk_3` FOREIGN KEY (`id_gatram_xuong`) REFERENCES `ga_tram` (`id_gatram`),
  CONSTRAINT `vethang_action_chk_1` CHECK ((`time_in` < `time_out`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vethang_action`
--

LOCK TABLES `vethang_action` WRITE;
/*!40000 ALTER TABLE `vethang_action` DISABLE KEYS */;
INSERT INTO `vethang_action` VALUES ('VM25052021103047','2021-05-29','07:09:00','08:09:00','BT00006','BT00003'),('VM25052021103047','2021-05-25','07:09:00','08:09:00','BT00006','BT00003'),('VM25052021103047','2021-05-22','07:09:00','08:09:00','BT00006','BT00003'),('VM25052021103047','2021-05-28','07:09:00','08:09:00','BT00006','BT00003'),('VM25052021103041','2021-05-24','07:09:00','08:09:00','BT00004','BT00002'),('VM25052021103041','2021-05-21','07:09:00','08:09:00','BT00004','BT00002'),('VM25052021103041','2021-05-25','07:09:00','08:09:00','BT00004','BT00002'),('VM25052021103041','2021-05-27','07:09:00','08:09:00','BT00004','BT00002'),('VM25052021103041','2021-05-21','07:09:00','08:09:00','BT00004','BT00002');
/*!40000 ALTER TABLE `vethang_action` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_gatram` BEFORE INSERT ON `vethang_action` FOR EACH ROW BEGIN 
	 DECLARE id_1 varchar(7) ;
      DECLARE id_2 varchar(7) ;
	SELECT id_gatram1,id_gatram2 INTO id_1,id_2
    from vethang
    where id_ve = new.id_ve ;  
     IF (  NOT id_1=new.id_gatram_len OR  NOT id_2 = new.id_gatram_xuong) THEN
       set new.id_ve = '0';
	ELSE 
		set new.id_ve = new.id_ve;
    END IF; 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `work_at`
--

DROP TABLE IF EXISTS `work_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_at` (
  `id_nhanvien` varchar(6) NOT NULL,
  `id_gatram` varchar(7) NOT NULL,
  PRIMARY KEY (`id_nhanvien`),
  CONSTRAINT `work_at_ibfk_1` FOREIGN KEY (`id_nhanvien`) REFERENCES `nhanvien` (`id_nhanvien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_at`
--

LOCK TABLES `work_at` WRITE;
/*!40000 ALTER TABLE `work_at` DISABLE KEYS */;
INSERT INTO `work_at` VALUES ('NV0001','BT00001'),('NV0002','BT00001'),('NV0003','BT00001'),('NV0004','BT00001');
/*!40000 ALTER TABLE `work_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ass2'
--

--
-- Dumping routines for database 'ass2'
--
/*!50003 DROP PROCEDURE IF EXISTS `chuyenxe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `chuyenxe`( 
)
BEGIN
	select id_tuyen,max(stt) as `sum` from chuyenxe
    group by id_tuyen;
    
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ghe_tram` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ghe_tram`(  
 IN input_idtuyen VARCHAR(4),
 In input_stt int 
)
BEGIN
	select g.stt_tramdung, g.id_gatram,gt.name_gatram , g.time_begin,g.time_stop from ghe_gas_tram g
    join ga_tram gt on g.id_gatram = gt.id_gatram
    where g.id_tuyen = input_idtuyen and g.stt = input_stt
    group by g.stt_tramdung;
    
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lotrinh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lotrinh`(
    IN input_idtuyen VARCHAR(4)   
)
BEGIN 
    SELECT  group_concat(name_gatram) as `Lộ Trình`  FROM ass2.ghe_gas_tram GGT 
    join ga_tram GT on GGT.id_gatram = GT.id_gatram
    where GGT.stt= 1 and input_idtuyen = GGT.id_tuyen;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `thongkeluotnguoi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `thongkeluotnguoi`(
    IN input_idtuyen VARCHAR(4), 
    in input_daybegin date ,
    in input_dayend date 
    
)
BEGIN
	 select  date_format(op.used_at,'%d/%m/%Y') as Ngay, sum(op.soluot) as`So luot` from (
    select used_at  , count(used_at) as soluot
     from vele
     where id_tuyen = input_idtuyen and used_at between input_daybegin and input_dayend
     group by used_at 
     union all
     select used_at, count(used_at)  
     from vethang_action
     join vethang on vethang_action.id_ve = vethang.id_ve 
     where vethang.id_tuyen = input_idtuyen and used_at between input_daybegin and input_dayend
     group by used_at  
	 union all
    select d.used_at, count(ac.id_ve) 
    from ve_1ngay d 
    join ve_1ngay_action ac on   ac.id_ve =d.id_ve 
	where ac.id_tuyen = input_idtuyen and used_at between input_daybegin and input_dayend
    group by used_at) as op
    group by Ngay
    order by Ngay
    ;
    
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08  9:43:18
