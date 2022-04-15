CREATE DATABASE  IF NOT EXISTS `championsleague` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `championsleague`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: championsleague
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `CityID` int NOT NULL,
  `CityName` varchar(45) NOT NULL,
  `Countries_countryID` int NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `fk_Cities_Countries1_idx` (`Countries_countryID`),
  CONSTRAINT `fk_Cities_Countries1` FOREIGN KEY (`Countries_countryID`) REFERENCES `countries` (`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Munich',1),(2,'Madrid',2),(3,'Salzburg',3),(4,'Moscow',4),(5,'Monchengladbach',1),(6,'Donetsk',5),(7,'Milan',6),(8,'Manchester',7),(9,'Porto',8),(10,'Marseille',10),(11,'Piraeus',9),(12,'Liverpool',7),(13,'Bergamo',6),(14,'Amsterdam',11),(15,'Herning',12),(16,'London',7),(17,'Seville',2),(18,'Krasnodar',4),(19,'Rennes',10),(20,'Dortmund',1),(21,'Rome',6),(22,'Brugges',13),(23,'St.Petersbourg',4),(24,'Turin',6),(25,'Barcelona',2),(26,'Kiev',5),(27,'Budapest',14),(28,'Paris',10),(29,'Leipzig',1),(30,'Basaksehir',15);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `countryID` int NOT NULL,
  `CoutryInitials` varchar(45) NOT NULL,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'DE'),(2,'ES'),(3,'AT'),(4,'RU'),(5,'UA'),(6,'IT'),(7,'UK'),(8,'PT'),(9,'GR'),(10,'FR'),(11,'NL'),(12,'DK'),(13,'BE'),(14,'HU'),(15,'TR');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_c`
--

DROP TABLE IF EXISTS `groups_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_c` (
  `GroupID` tinyint NOT NULL,
  `GroupName` varchar(1) NOT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_c`
--

LOCK TABLES `groups_c` WRITE;
/*!40000 ALTER TABLE `groups_c` DISABLE KEYS */;
INSERT INTO `groups_c` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H');
/*!40000 ALTER TABLE `groups_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `matchID` smallint NOT NULL,
  `Date` date NOT NULL,
  `round` int NOT NULL,
  PRIMARY KEY (`matchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2020-10-20',1),(2,'2020-10-20',1),(3,'2020-10-20',1),(4,'2020-10-20',1),(5,'2020-10-20',1),(6,'2020-10-20',1),(7,'2020-10-20',1),(8,'2020-10-20',1),(9,'2020-10-21',1),(10,'2020-10-21',1),(11,'2020-10-21',1),(12,'2020-10-21',1),(13,'2020-10-21',1),(14,'2020-10-21',1),(15,'2020-10-21',1),(16,'2020-10-21',1),(17,'2020-10-27',2),(18,'2020-10-27',2),(19,'2020-10-27',2),(20,'2020-10-27',2),(21,'2020-10-27',2),(22,'2020-10-27',2),(23,'2020-10-27',2),(24,'2020-10-27',2),(25,'2020-10-28',2),(26,'2020-10-28',2),(27,'2020-10-28',2),(28,'2020-10-28',2),(29,'2020-10-28',2),(30,'2020-10-28',2),(31,'2020-10-28',2),(32,'2020-10-28',2),(33,'2020-11-03',3),(34,'2020-11-03',3),(35,'2020-11-03',3),(36,'2020-11-03',3),(37,'2020-11-03',3),(38,'2020-11-03',3),(39,'2020-11-03',3),(40,'2020-11-03',3),(41,'2020-11-04',3),(42,'2020-11-04',3),(43,'2020-11-04',3),(44,'2020-11-04',3),(45,'2020-11-04',3),(46,'2020-11-04',3),(47,'2020-11-04',3),(48,'2020-11-04',3),(49,'2020-11-24',4),(50,'2020-11-24',4),(51,'2020-11-24',4),(52,'2020-11-24',4),(53,'2020-11-24',4),(54,'2020-11-24',4),(55,'2020-11-24',4),(56,'2020-11-24',4),(57,'2020-11-25',4),(58,'2020-11-25',4),(59,'2020-11-25',4),(60,'2020-11-25',4),(61,'2020-11-25',4),(62,'2020-11-25',4),(63,'2020-11-25',4),(64,'2020-11-25',4),(65,'2020-12-01',5),(66,'2020-12-01',5),(67,'2020-12-01',5),(68,'2020-12-01',5),(69,'2020-12-01',5),(70,'2020-12-01',5),(71,'2020-12-01',5),(72,'2020-12-01',5),(73,'2020-12-02',5),(74,'2020-12-02',5),(75,'2020-12-02',5),(76,'2020-12-02',5),(77,'2020-12-02',5),(78,'2020-12-02',5),(79,'2020-12-02',5),(80,'2020-12-02',5),(81,'2020-12-08',6),(82,'2020-12-08',6),(83,'2020-12-08',6),(84,'2020-12-08',6),(85,'2020-12-08',6),(86,'2020-12-08',6),(87,'2020-12-08',6),(88,'2020-12-08',6),(89,'2020-12-09',6),(90,'2020-12-09',6),(91,'2020-12-09',6),(92,'2020-12-09',6),(93,'2020-12-09',6),(94,'2020-12-09',6),(95,'2020-12-09',6),(96,'2020-12-09',6);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchstatistics`
--

DROP TABLE IF EXISTS `matchstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchstatistics` (
  `matches_matchID` smallint NOT NULL,
  `score` varchar(8) NOT NULL,
  `ballPosession` varchar(10) NOT NULL,
  `shotsOnGoal` varchar(10) NOT NULL,
  `freekicks` varchar(45) NOT NULL,
  `corners` varchar(45) NOT NULL,
  `offsides` varchar(45) NOT NULL,
  PRIMARY KEY (`matches_matchID`),
  CONSTRAINT `fk_matchStatistics_matches1` FOREIGN KEY (`matches_matchID`) REFERENCES `matches` (`matchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchstatistics`
--

LOCK TABLES `matchstatistics` WRITE;
/*!40000 ALTER TABLE `matchstatistics` DISABLE KEYS */;
INSERT INTO `matchstatistics` VALUES (1,'1x2','51x49','3x3','13x15','8x4','0x3'),(2,'0x2','48x52','3x6','11x15','2x5','1x0'),(3,'1x1','60x40','7x3','10x22','3x2','0x3'),(4,'2x0','49x51','7x3','19x19','3x2','1x4'),(5,'1x2','59x41','5x6','15x10','11x8','3x2'),(6,'3x1','39x61','5x7','8x9','7x6','4x0'),(7,'0x0','44x56','4x2','10x13','2x5','1x1'),(8,'5x1','58x42','11x2','18x9','5x0','2x4'),(9,'2x2','52x48','7x3','16x17','8x3','0x0'),(10,'2x3','57x43','5x6','9x15','7x1','4x1'),(11,'1x0','53x47','3x2','14x19','2x3','7x1'),(12,'0x4','52x48','3x11','15x10','4x5','0x3'),(13,'3x1','65x35','6x2','3x15','4x1','0x0'),(14,'2x2','56x44','4x2','11x18','3x2','3x0'),(15,'4x0','60x40','5x1','18x9','6x7','1x5'),(16,'0x1','47x53','4x4','10x12','3x9','2x1'),(17,'0x0','43x57','1x4','17x5','2x6','0x3'),(18,'1x2','36x64','5x4','19x13','4x4','2x5'),(19,'0x3','37x63','2x4','14x8','1x5','3x5'),(20,'2x0','60x40','2x2','11x12','3x2','1x1'),(21,'2x0','45x55','5x3','21x13','4x9','0x4'),(22,'2x2','36x64','5x6','7x21','1x8','2x0'),(23,'3x2','51x49','8x3','16x16','9x5','2x2'),(24,'2x2','46x54','6x7','16x16','7x6','5x0'),(25,'0x4','33x67','4x8','15x12','6x4','2x3'),(26,'0x2','48x52','4x4','9x11','6x5','0x2'),(27,'1x0','62x38','7x2','19x20','11x0','6x0'),(28,'5x0','48x52','8x2','22x18','2x5','1x2'),(29,'0x2','48x52','0x5','16x20','1x4','3x0'),(30,'2x2','51x49','4x3','11x15','5x3','2x0'),(31,'2x0','65x35','6x0','7x8','8x1','1x2'),(32,'1x1','58x42','3x3','12x20','7x2','1x0'),(33,'0x6','55x45','1x9','18x7','3x6','0x4'),(34,'1x1','40x60','1x5','10x12','1x10','0x4'),(35,'2x6','41x59','11x9','14x18','10x3','7x2'),(36,'3x2','52x48','7x3','14x12','6x2','0x0'),(37,'1x2','46x54','4x4','22x19','3x3','1x4'),(38,'3x0','54x46','6x1','9x9','7x2','1x2'),(39,'3x0','42x58','4x0','19x18','3x6','5x1'),(40,'0x5','45x55','6x12','18x7','6x7','4x2'),(41,'1x1','48x52','2x3','9x20','3x3','5x0'),(42,'2x1','37x63','3x2','10x10','1x5','1x1'),(43,'3x2','61x39','12x3','14x11','6x4','0x2'),(44,'2x1','47x53','5x2','24x21','4x3','2x7'),(45,'1x4','48x52','3x8','13x8','2x1','0x2'),(46,'0x3','50x50','4x6','7x16','3x3','4x0'),(47,'3x0','57x43','4x2','9x16','2x3','4x3'),(48,'2x1','57x43','14x7','3x12','10x8','2x0'),(49,'1x2','51x49','5x5','11x13','11x3','0x2'),(50,'1x2','41x59','3x8','11x19','1x3','4x1'),(51,'1x0','41x59','3x3','18x14','2x6','0x1'),(52,'4x1','49x51','8x4','12x14','6x2','2x1'),(53,'3x1','48x52','7x5','12x9','6x2','2x0'),(54,'2x1','62x38','7x2','10x24','6x6','9x0'),(55,'0x4','37x63','3x7','7x12','2x6','3x1'),(56,'3x0','51x49','8x0','14x12','9x0','1x2'),(57,'0x1','44x56','0x10','9x13','0x4','3x1'),(58,'4x0','47x53','6x3','13x15','4x5','1x1'),(59,'0x2','55x45','2x4','16x20','3x2','3x1'),(60,'0x2','54x46','0x4','16x14','2x2','2x2'),(61,'0x2','42x58','1x5','10x6','2x6','0x0'),(62,'3x1','62x38','5x11','18x15','5x5','1x1'),(63,'0x0','59x41','5x1','10x21','16x1','3x2'),(64,'3x1','56x44','9x5','14x16','8x1','3x4'),(65,'2x0','44x56','4x7','18x10','2x11','0x3'),(66,'1x3','51x49','3x7','17x11','6x8','0x1'),(67,'2x1','54x46','5x2','20x12','6x3','1x7'),(68,'1x0','45x55','5x4','19x17','1x6','2x7'),(69,'0x0','36x64','1x5','17x10','0x11','0x4'),(70,'2x3','53x47','5x4','15x15','3x5','1x2'),(71,'1x1','43x57','3x3','12x11','3x4','3x0'),(72,'59x41','8x3','4x4','18x12','4x2','0x1'),(73,'1x0','45x55','3x5','22x11','10x7','0x0'),(74,'3x4','46x54','4x8','17x13','4x6','3x1'),(75,'0x4','55x45','3x7','16x10','3x7','1x1'),(76,'1x3','44x56','5x6','14x23','3x5','3x4'),(77,'3x0','53x47','6x3','12x11','8x5','3x0'),(78,'0x3','43x57','2x5','17x14','5x0','4x4'),(79,'1x1','53x47','4x6','7x6','1x6','0x1'),(80,'3x0','49x51','5x1','13x13','6x3','3x3'),(81,'1x2','45x55','4x6','14x13','6x8','5x1'),(82,'2x2','52x48','8x3','15x13','2x4','1x1'),(83,'1x3','50x50','6x5','11x18','10x2','1x2'),(84,'3x2','47x53','4x7','7x21','4x10','5x0'),(85,'1x0','43x57','2x2','18x16','2x5','2x0'),(86,'1x1','60x40','5x2','10x21','6x2','1x1'),(87,'0x3','57x43','7x4','16x10','5x1','3x1'),(88,'5x1','64x36','9x4','20x6','5x6','3x0'),(89,'1x1','52x48','6x4','13x12','9x3','5x3'),(90,'0x1','63x37','2x1','17x23','6x4','3x3'),(91,'0x2','56x44','2x4','11x16','7x2','2x0'),(92,'2x0','62x38','7x1','5x6','17x11','6x1'),(93,'0x2','54x46','1x3','20x15','4x4','4x2'),(94,'3x0','53x47','8x2','9x10','6x3','3x3'),(95,'0x0','54x46','4x3','10x16','13x0','4x1'),(96,'2x0','66x34','7x3','19x15','7x2','1x9');
/*!40000 ALTER TABLE `matchstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `stadiumID` tinyint NOT NULL,
  `StadiumName` varchar(45) NOT NULL,
  `Cities_CityID` int NOT NULL,
  `Capacity` int NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  PRIMARY KEY (`stadiumID`),
  KEY `fk_Stadiums_Cities1_idx` (`Cities_CityID`),
  CONSTRAINT `fk_Stadiums_Cities1` FOREIGN KEY (`Cities_CityID`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (1,'Allianz Arena',1,75000,48.2169,11.6195),(2,'Wanda Metropolitano',2,68456,48.2169,11.6195),(3,'Red Bull Arena',3,30188,40.4362,-3.60166),(4,'Lokomotiv Stadium',4,27320,55.8035,37.7388),(5,'Santiago Bernabeu',2,81044,40.453,-3.69052),(6,'Borussia-Park',5,59724,51.1746,6.38332),(7,'Donbass Arena',6,52187,48.0211,37.808),(8,'Giuseppe Meazza',7,80018,45.4781,9.12177),(9,'Etihad Stadium',8,55097,53.4831,-2.20258),(10,'Estádio do Dragão',9,50033,41.1618,-8.58578),(11,'Georgios Karaiskakis',11,32115,37.9466,23.6622),(12,'Stade Vélodrome',10,67394,43.2698,5.3937),(13,'Anfield',12,53394,53.4308,-2.96302),(14,'Atleti Azzurri d\'Italia',13,21300,45.7092,9.67866),(15,'Johan Cruyff Arena',14,55500,52.3144,4.93978),(16,'MCH Arena',15,11432,56.1168,8.94954),(17,'Stamford Bridge',16,41837,51.4817,-0.193145),(18,'Ramón Sánchez Pizjuán',17,43883,37.3841,-5.97288),(19,'Krasnodar Stadium',18,35074,45.045,39.0265),(20,'Roazhon Park',19,29778,48.1075,-1.71506),(21,'Signal Iduna Park',20,81365,51.4926,7.44967),(22,'Stadio Olimpico',21,72698,41.9341,12.4525),(23,'Jan Breydel Stadium',22,29042,51.1932,3.17783),(24,'Gazprom Arena',23,68000,59.9727,30.2192),(25,'Juventus Stadium',24,41507,45.1096,7.63905),(26,'Camp Nou',25,99354,41.3809,2.12063),(27,'Kyiv Olympic Stadium',26,70050,50.4334,30.5197),(28,'Groupama Arena',27,23698,47.4753,19.0931),(29,'Parc des Princes',28,47929,48.8414,2.25086),(30,'Red Bull Arena',29,47069,51.3458,12.3461),(31,'Old Trafford',8,76212,53.4598,-2.29523),(32,'Basaksehir Fatih Terim Stadium',30,17319,41.1228,28.8065);
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teammatches`
--

DROP TABLE IF EXISTS `teammatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teammatches` (
  `matches_matchID` smallint NOT NULL,
  `Teams_teamID` tinyint NOT NULL,
  `home` tinyint NOT NULL,
  PRIMARY KEY (`matches_matchID`,`Teams_teamID`),
  KEY `fk_teamMatches_Teams_idx` (`Teams_teamID`),
  KEY `fk_teamMatches_matches1_idx` (`matches_matchID`),
  CONSTRAINT `fk_teamMatches_matches1` FOREIGN KEY (`matches_matchID`) REFERENCES `matches` (`matchID`),
  CONSTRAINT `fk_teamMatches_Teams` FOREIGN KEY (`Teams_teamID`) REFERENCES `teams` (`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teammatches`
--

LOCK TABLES `teammatches` WRITE;
/*!40000 ALTER TABLE `teammatches` DISABLE KEYS */;
INSERT INTO `teammatches` VALUES (1,23,0),(1,24,1),(2,25,0),(2,27,1),(3,19,1),(3,20,0),(4,30,1),(4,32,0),(5,29,1),(5,31,0),(6,21,0),(6,22,1),(7,17,1),(7,18,0),(8,26,1),(8,28,0),(9,3,1),(9,4,0),(10,5,1),(10,7,0),(11,11,1),(11,12,0),(12,14,0),(12,16,1),(13,9,1),(13,10,0),(14,6,0),(14,8,1),(15,1,1),(15,2,0),(16,13,0),(16,15,1),(17,7,1),(17,8,0),(18,1,0),(18,4,1),(19,9,0),(19,12,1),(20,13,1),(20,16,0),(21,10,1),(21,11,0),(22,5,0),(22,6,1),(23,2,1),(23,3,0),(24,14,1),(24,15,0),(25,17,0),(25,19,1),(26,29,0),(26,32,1),(27,18,1),(27,20,0),(28,30,0),(28,31,1),(29,25,1),(29,26,0),(30,27,0),(30,28,1),(31,21,1),(31,24,0),(32,22,0),(32,23,1),(33,6,0),(33,7,1),(34,2,0),(34,4,1),(35,1,0),(35,3,1),(36,5,1),(36,8,0),(37,15,0),(37,16,1),(38,9,1),(38,11,0),(39,10,1),(39,12,0),(40,13,0),(40,14,1),(41,22,0),(41,24,1),(42,31,0),(42,32,1),(43,18,1),(43,19,0),(44,29,0),(44,30,1),(45,25,0),(45,28,1),(46,21,0),(46,23,1),(47,17,1),(47,20,0),(48,26,1),(48,27,0),(49,17,0),(49,20,1),(50,18,0),(50,19,1),(51,29,1),(51,30,0),(52,31,1),(52,32,0),(53,22,1),(53,24,0),(54,25,1),(54,28,0),(55,26,0),(55,27,1),(56,21,1),(56,23,0),(57,9,0),(57,11,1),(58,6,1),(58,7,0),(59,10,0),(59,12,1),(60,13,1),(60,14,0),(61,5,0),(61,8,1),(62,1,1),(62,3,0),(63,2,1),(63,4,0),(64,15,1),(64,16,0),(65,5,0),(65,7,1),(66,3,0),(66,4,1),(67,11,0),(67,12,1),(68,13,1),(68,15,0),(69,9,0),(69,10,1),(70,6,1),(70,8,0),(71,1,0),(71,2,1),(72,14,1),(72,16,0),(73,19,1),(73,20,0),(74,30,0),(74,32,1),(75,17,0),(75,18,1),(76,29,0),(76,31,1),(77,25,1),(77,27,0),(78,26,0),(78,28,1),(79,21,1),(79,22,0),(80,23,1),(80,24,0),(81,21,0),(81,24,1),(82,22,1),(82,23,0),(83,18,0),(83,20,1),(84,30,1),(84,31,0),(85,27,1),(85,28,0),(86,17,1),(86,19,0),(87,25,0),(87,26,1),(88,29,1),(88,32,0),(89,13,0),(89,16,1),(90,14,0),(90,15,1),(91,2,0),(91,3,1),(92,5,1),(92,6,0),(93,10,0),(93,11,1),(94,9,1),(94,12,0),(95,7,0),(95,8,1),(96,1,1),(96,4,0);
/*!40000 ALTER TABLE `teammatches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `teamID` tinyint NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `Groups_GroupID` tinyint NOT NULL,
  `Stadiums_stadiumID` tinyint NOT NULL,
  `totaltrophies` tinyint DEFAULT NULL,
  PRIMARY KEY (`teamID`),
  UNIQUE KEY `team_name_UNIQUE` (`team_name`),
  KEY `fk_Teams_Groups1_idx` (`Groups_GroupID`),
  KEY `fk_Teams_Stadiums1_idx` (`Stadiums_stadiumID`),
  CONSTRAINT `fk_Teams_Groups1` FOREIGN KEY (`Groups_GroupID`) REFERENCES `groups_c` (`GroupID`),
  CONSTRAINT `fk_Teams_Stadiums1` FOREIGN KEY (`Stadiums_stadiumID`) REFERENCES `stadiums` (`stadiumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Bayern Munich',1,1,6),(2,'Atletico Madrid',1,2,0),(3,'Salzburg',1,3,0),(4,'Lokomotiv Moscow',1,4,0),(5,'Real Madrid',2,5,13),(6,'B. Monchengladbach',2,6,0),(7,'Shakhtar Donetsk',2,7,0),(8,'Inter',2,8,3),(9,'Manchester City',3,9,0),(10,'FC Porto',3,10,2),(11,'Olympiacos ',3,11,0),(12,'Marseille',3,12,1),(13,'Liverpool',4,13,6),(14,'Atalanta',4,14,0),(15,'Ajax',4,15,4),(16,'Midtjylland',4,16,0),(17,'Chelsea',5,17,2),(18,'Sevilla',5,18,0),(19,'Krasnodar',5,19,0),(20,'Rennes',5,20,0),(21,'Dortmund',6,21,1),(22,'Lazio',6,22,0),(23,'Club Brugge Kv',6,23,0),(24,'Zenit',6,24,0),(25,'Juventus',7,25,2),(26,'Barcelona',7,26,5),(27,'Dyn. Kyiv',7,27,0),(28,'Ferencvaros',7,28,0),(29,'Paris SG',8,29,0),(30,'RB Leipzig',8,30,0),(31,'Manchester Utd',8,31,3),(32,'Baasaksehir',8,32,0);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topplayers`
--

DROP TABLE IF EXISTS `topplayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topplayers` (
  `PlayerID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Goals` int NOT NULL,
  `RedCards` int NOT NULL,
  `YellowCards` int NOT NULL,
  `TotalSaves` int NOT NULL,
  `FacePicture` varchar(255) DEFAULT NULL,
  `Teams_teamID` tinyint NOT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `fk_TopPlayers_Teams1_idx` (`Teams_teamID`),
  CONSTRAINT `fk_TopPlayers_Teams1` FOREIGN KEY (`Teams_teamID`) REFERENCES `teams` (`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topplayers`
--

LOCK TABLES `topplayers` WRITE;
/*!40000 ALTER TABLE `topplayers` DISABLE KEYS */;
/*!40000 ALTER TABLE `topplayers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 22:05:19
