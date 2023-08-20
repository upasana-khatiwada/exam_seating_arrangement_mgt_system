-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: seating_arrangement_system
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `seatplan`
--

DROP TABLE IF EXISTS `seatplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seatplan` (
  `student_id` int NOT NULL,
  `student_name` varchar(45) DEFAULT NULL,
  `hall_info` varchar(45) DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  `seat_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatplan`
--

LOCK TABLES `seatplan` WRITE;
/*!40000 ALTER TABLE `seatplan` DISABLE KEYS */;
INSERT INTO `seatplan` VALUES (5300,'Student797','A-1',100,'A5Y'),(5301,'Student2182','A-1',100,'B5X'),(5302,'Student8519','A-1',102,'A1X'),(5303,'Student6050','A-1',100,'A3X'),(5304,'Student4692','A-1',100,'A5X'),(5305,'Student5312','A-1',101,'B1Y'),(5306,'Student2484','A-1',103,'A3Y'),(5307,'Student6485','A-1',103,'A5Y'),(5308,'Student4973','A-1',100,'B4Y'),(5309,'Student5412','A-1',101,'B3X'),(5310,'Student2140','A-1',100,'B2X'),(5311,'Student4466','A-1',102,'A5Y'),(5312,'Student5912','A-1',101,'A5Y'),(5313,'Student6160','A-1',103,'A4X'),(5314,'Student3066','A-1',100,'A1X'),(5315,'Student6852','A-1',101,'A3Y'),(5316,'Student5061','A-1',100,'A4Y'),(5317,'Student4748','A-1',100,'A1Y'),(5318,'Student8559','A-1',101,'B5Y'),(5319,'Student8550','A-1',103,'A5X'),(5320,'Student7074','A-1',100,'A2Y'),(5321,'Student9722','A-1',102,'B1X'),(5322,'Student7390','A-1',102,'B3Y'),(5323,'Student7781','A-1',102,'B5Y'),(5324,'Student6738','A-1',101,'B2Y'),(5325,'Student348','A-1',101,'B5X'),(5326,'Student1527','A-1',102,'A4Y'),(5327,'Student6591','A-1',102,'A3X'),(5328,'Student8375','A-1',101,'A1X'),(5329,'Student2100','A-1',101,'B3Y'),(5330,'Student5378','A-1',102,'B1Y'),(5331,'Student592','A-1',102,'B2Y'),(5400,'Student4833','A-1',102,'B2X'),(5401,'Student6164','A-1',101,'B2X'),(5402,'Student6319','A-1',102,'A2X'),(5403,'Student3104','A-1',101,'A2X'),(5404,'Student6564','A-1',102,'A1Y'),(5405,'Student3510','A-1',100,'B5Y'),(5406,'Student7855','A-1',100,'B1X'),(5407,'Student8749','A-1',101,'A3X'),(5408,'Student179','A-1',101,'A1Y'),(5409,'Student4651','A-1',101,'A5X'),(5410,'Student2715','A-1',101,'A4X'),(5411,'Student9625','A-1',100,'B3X'),(5412,'Student9978','A-1',101,'A4Y'),(5413,'Student1015','A-1',100,'A4X'),(5414,'Student5142','A-1',101,'A2Y'),(5415,'Student2668','A-1',102,'A2Y'),(5416,'Student7913','A-1',100,'A3Y'),(5417,'Student1564','A-1',102,'B5X'),(5418,'Student4078','A-1',102,'A3Y'),(5419,'Student5700','A-1',101,'B4X'),(5420,'Student6268','A-1',100,'B4X'),(5421,'Student4240','A-1',100,'B1Y'),(5422,'Student2397','A-1',101,'B4Y'),(5423,'Student9265','A-1',102,'B4Y'),(5424,'Student9135','A-1',102,'B4X'),(5425,'Student7878','A-1',102,'A4X'),(5426,'Student1987','A-1',102,'B3X'),(5427,'Student6300','A-1',100,'B2Y'),(5428,'Student5541','A-1',100,'A2X'),(5429,'Student8805','A-1',100,'B3Y'),(5430,'Student7403','A-1',102,'A5X'),(5431,'Student601','A-1',101,'B1X');
/*!40000 ALTER TABLE `seatplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-20 12:56:06
