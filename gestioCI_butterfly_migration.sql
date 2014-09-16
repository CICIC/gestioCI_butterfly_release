-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gestioCI_butterfly
-- ------------------------------------------------------
-- Server version	5.5.38-0+wheezy1

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
-- Table structure for table `General_accountbank`
--

DROP TABLE IF EXISTS `General_accountbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_accountbank` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `code` varchar(11) DEFAULT NULL,
  `number` varchar(34) DEFAULT NULL,
  `bankcard` tinyint(1) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountbank_6922ec88` (`human_id`),
  KEY `General_accountbank_0316dde1` (`company_id`),
  KEY `General_accountbank_b9dcc52b` (`unit_id`),
  CONSTRAINT `unit_id_refs_id_e5728480` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `company_id_refs_human_id_466f5e8e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `human_id_refs_id_d6164342` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_a20996dc` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountbank`
--

LOCK TABLES `General_accountbank` WRITE;
/*!40000 ALTER TABLE `General_accountbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_accountbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_accountces`
--

DROP TABLE IF EXISTS `General_accountces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_accountces` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `number` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountces_6922ec88` (`human_id`),
  KEY `General_accountces_c096cf48` (`entity_id`),
  KEY `General_accountces_b9dcc52b` (`unit_id`),
  CONSTRAINT `unit_id_refs_id_07a72ac8` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `entity_id_refs_human_id_935d5d48` FOREIGN KEY (`entity_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `human_id_refs_id_da305fb3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_2286902b` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountces`
--

LOCK TABLES `General_accountces` WRITE;
/*!40000 ALTER TABLE `General_accountces` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_accountces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_accountcrypto`
--

DROP TABLE IF EXISTS `General_accountcrypto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_accountcrypto` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `number` varchar(34) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountcrypto_6922ec88` (`human_id`),
  KEY `General_accountcrypto_b9dcc52b` (`unit_id`),
  CONSTRAINT `unit_id_refs_id_d51cdeac` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `human_id_refs_id_77c8ab2d` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_023b3440` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountcrypto`
--

LOCK TABLES `General_accountcrypto` WRITE;
/*!40000 ALTER TABLE `General_accountcrypto` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_accountcrypto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_address`
--

DROP TABLE IF EXISTS `General_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address_type_id` int(11) DEFAULT NULL,
  `p_address` varchar(200) NOT NULL,
  `town` varchar(150) NOT NULL,
  `postalcode` varchar(5) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `ic_larder` tinyint(1) NOT NULL,
  `size` decimal(20,2) DEFAULT NULL,
  `size_unit_id` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `General_address_4b4cf59f` (`address_type_id`),
  KEY `General_address_55a4ce96` (`region_id`),
  KEY `General_address_4f62c404` (`size_unit_id`),
  CONSTRAINT `size_unit_id_refs_id_68083e30` FOREIGN KEY (`size_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `address_type_id_refs_space_type_id_54ad4544` FOREIGN KEY (`address_type_id`) REFERENCES `General_address_type` (`space_type_id`),
  CONSTRAINT `region_id_refs_id_c1ad246c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address`
--

LOCK TABLES `General_address` WRITE;
/*!40000 ALTER TABLE `General_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_address_jobs`
--

DROP TABLE IF EXISTS `General_address_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_address_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_id` (`address_id`,`job_id`),
  KEY `General_address_jobs_3ac8a70a` (`address_id`),
  KEY `General_address_jobs_218f3960` (`job_id`),
  CONSTRAINT `address_id_refs_id_b5c5216e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `job_id_refs_id_89cfbedd` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address_jobs`
--

LOCK TABLES `General_address_jobs` WRITE;
/*!40000 ALTER TABLE `General_address_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_address_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_address_type`
--

DROP TABLE IF EXISTS `General_address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_address_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`),
  CONSTRAINT `space_type_id_refs_typ_id_9112582a` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address_type`
--

LOCK TABLES `General_address_type` WRITE;
/*!40000 ALTER TABLE `General_address_type` DISABLE KEYS */;
INSERT INTO `General_address_type` VALUES (44),(45),(46);
/*!40000 ALTER TABLE `General_address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_artwork_type`
--

DROP TABLE IF EXISTS `General_artwork_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_artwork_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`),
  CONSTRAINT `typ_id_refs_id_37a269e1` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_artwork_type`
--

LOCK TABLES `General_artwork_type` WRITE;
/*!40000 ALTER TABLE `General_artwork_type` DISABLE KEYS */;
INSERT INTO `General_artwork_type` VALUES (9),(10),(11),(12),(14),(15),(16),(17),(18),(34),(35),(36),(37),(38),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(65);
/*!40000 ALTER TABLE `General_artwork_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_asset`
--

DROP TABLE IF EXISTS `General_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_asset` (
  `material_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `reciprocity` longtext NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `General_asset_6922ec88` (`human_id`),
  CONSTRAINT `material_id_refs_id_a349c1f5` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `human_id_refs_id_cbd3fba4` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_asset`
--

LOCK TABLES `General_asset` WRITE;
/*!40000 ALTER TABLE `General_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_being_type`
--

DROP TABLE IF EXISTS `General_being_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_being_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`),
  CONSTRAINT `typ_id_refs_id_8745a66c` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_being_type`
--

LOCK TABLES `General_being_type` WRITE;
/*!40000 ALTER TABLE `General_being_type` DISABLE KEYS */;
INSERT INTO `General_being_type` VALUES (4),(5),(6),(13),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(64),(66);
/*!40000 ALTER TABLE `General_being_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_company`
--

DROP TABLE IF EXISTS `General_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_company` (
  `human_id` int(11) NOT NULL,
  `company_type_id` int(11) DEFAULT NULL,
  `legal_name` varchar(200) DEFAULT NULL,
  `vat_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`human_id`),
  KEY `General_company_a3c9d75e` (`company_type_id`),
  CONSTRAINT `company_type_id_refs_being_type_id_24e786ac` FOREIGN KEY (`company_type_id`) REFERENCES `General_company_type` (`being_type_id`),
  CONSTRAINT `human_id_refs_id_ae2f98d3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_company`
--

LOCK TABLES `General_company` WRITE;
/*!40000 ALTER TABLE `General_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_company_type`
--

DROP TABLE IF EXISTS `General_company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_company_type` (
  `being_type_id` int(11) NOT NULL,
  PRIMARY KEY (`being_type_id`),
  CONSTRAINT `being_type_id_refs_typ_id_f04123a9` FOREIGN KEY (`being_type_id`) REFERENCES `General_being_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_company_type`
--

LOCK TABLES `General_company_type` WRITE;
/*!40000 ALTER TABLE `General_company_type` DISABLE KEYS */;
INSERT INTO `General_company_type` VALUES (19),(20),(64);
/*!40000 ALTER TABLE `General_company_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_human`
--

DROP TABLE IF EXISTS `General_human`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_human` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone_cell` varchar(20) NOT NULL,
  `telephone_land` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_human`
--

LOCK TABLES `General_human` WRITE;
/*!40000 ALTER TABLE `General_human` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_human` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_image`
--

DROP TABLE IF EXISTS `General_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_image` (
  `nonmaterial_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`nonmaterial_id`),
  CONSTRAINT `nonmaterial_id_refs_id_c84188d9` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_image`
--

LOCK TABLES `General_image` WRITE;
/*!40000 ALTER TABLE `General_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_job`
--

DROP TABLE IF EXISTS `General_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `verb` varchar(200) NOT NULL,
  `gerund` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_job_410d0aac` (`parent_id`),
  KEY `General_job_329f6fb3` (`lft`),
  KEY `General_job_e763210f` (`rght`),
  KEY `General_job_ba470c4a` (`tree_id`),
  KEY `General_job_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_a2f76742` FOREIGN KEY (`parent_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_job`
--

LOCK TABLES `General_job` WRITE;
/*!40000 ALTER TABLE `General_job` DISABLE KEYS */;
INSERT INTO `General_job` VALUES (1,'Autogestió','autogestionar','autogestionant','',NULL,1,6,1,0,''),(2,'Coordinació','coordinar','coordinant','',1,2,3,1,1,''),(3,'Desenvolupament','desenvolupar','desenvolupant','',NULL,1,2,2,0,''),(4,'Transport','transportar','transportant','',NULL,1,2,3,0,''),(5,'Facilitació CI','facilitar CI','facilitant CI','',1,4,5,1,1,'ic_facilitate'),(6,'Restauració','restaurar','restaurant','',NULL,1,2,4,0,'');
/*!40000 ALTER TABLE `General_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_material`
--

DROP TABLE IF EXISTS `General_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `material_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_material_6965c408` (`material_type_id`),
  CONSTRAINT `material_type_id_refs_artwork_type_id_c95cd6a1` FOREIGN KEY (`material_type_id`) REFERENCES `General_material_type` (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_material`
--

LOCK TABLES `General_material` WRITE;
/*!40000 ALTER TABLE `General_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_material_type`
--

DROP TABLE IF EXISTS `General_material_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_material_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`),
  CONSTRAINT `artwork_type_id_refs_typ_id_416409e2` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_material_type`
--

LOCK TABLES `General_material_type` WRITE;
/*!40000 ALTER TABLE `General_material_type` DISABLE KEYS */;
INSERT INTO `General_material_type` VALUES (55),(56),(57);
/*!40000 ALTER TABLE `General_material_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_nonmaterial`
--

DROP TABLE IF EXISTS `General_nonmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_nonmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `nonmaterial_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_nonmaterial_d40a8f00` (`nonmaterial_type_id`),
  CONSTRAINT `nonmaterial_type_id_refs_artwork_type_id_185071f1` FOREIGN KEY (`nonmaterial_type_id`) REFERENCES `General_nonmaterial_type` (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_nonmaterial`
--

LOCK TABLES `General_nonmaterial` WRITE;
/*!40000 ALTER TABLE `General_nonmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_nonmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_nonmaterial_type`
--

DROP TABLE IF EXISTS `General_nonmaterial_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_nonmaterial_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`),
  CONSTRAINT `artwork_type_id_refs_typ_id_5702be87` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_nonmaterial_type`
--

LOCK TABLES `General_nonmaterial_type` WRITE;
/*!40000 ALTER TABLE `General_nonmaterial_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_nonmaterial_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_person`
--

DROP TABLE IF EXISTS `General_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_person` (
  `human_id` int(11) NOT NULL,
  `surnames` varchar(200) NOT NULL,
  `id_card` varchar(9) NOT NULL,
  `email2` varchar(75) NOT NULL,
  `nickname2` varchar(50) NOT NULL,
  PRIMARY KEY (`human_id`),
  CONSTRAINT `human_id_refs_id_ce327b3b` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_person`
--

LOCK TABLES `General_person` WRITE;
/*!40000 ALTER TABLE `General_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_project`
--

DROP TABLE IF EXISTS `General_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_project` (
  `human_id` int(11) NOT NULL,
  `project_type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `socialweb` varchar(100) NOT NULL,
  `email2` varchar(75) NOT NULL,
  `ecommerce` tinyint(1) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`human_id`),
  KEY `General_project_758f74b0` (`project_type_id`),
  KEY `General_project_410d0aac` (`parent_id`),
  KEY `General_project_329f6fb3` (`lft`),
  KEY `General_project_e763210f` (`rght`),
  KEY `General_project_ba470c4a` (`tree_id`),
  KEY `General_project_20e079f4` (`level`),
  CONSTRAINT `project_type_id_refs_being_type_id_bdad21d0` FOREIGN KEY (`project_type_id`) REFERENCES `General_project_type` (`being_type_id`),
  CONSTRAINT `human_id_refs_id_c0052093` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `parent_id_refs_human_id_cb4b7459` FOREIGN KEY (`parent_id`) REFERENCES `General_project` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_project`
--

LOCK TABLES `General_project` WRITE;
/*!40000 ALTER TABLE `General_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_project_type`
--

DROP TABLE IF EXISTS `General_project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_project_type` (
  `being_type_id` int(11) NOT NULL,
  PRIMARY KEY (`being_type_id`),
  CONSTRAINT `being_type_id_refs_typ_id_a90a2e07` FOREIGN KEY (`being_type_id`) REFERENCES `General_being_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_project_type`
--

LOCK TABLES `General_project_type` WRITE;
/*!40000 ALTER TABLE `General_project_type` DISABLE KEYS */;
INSERT INTO `General_project_type` VALUES (13),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(66);
/*!40000 ALTER TABLE `General_project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_record`
--

DROP TABLE IF EXISTS `General_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_record_ac580b38` (`record_type_id`),
  CONSTRAINT `record_type_id_refs_artwork_type_id_bf922724` FOREIGN KEY (`record_type_id`) REFERENCES `General_record_type` (`artwork_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_record`
--

LOCK TABLES `General_record` WRITE;
/*!40000 ALTER TABLE `General_record` DISABLE KEYS */;
INSERT INTO `General_record` VALUES (1,'(eco) CIC (Cooperativa Integral Catalana) COOP0001',NULL,16),(3,'EcoCoop * 5.000 = Hora','',58),(4,'EcoCoop * 1 = Euro','',59),(5,'Riu * 1 = Euro','',59);
/*!40000 ALTER TABLE `General_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_record_type`
--

DROP TABLE IF EXISTS `General_record_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_record_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`),
  CONSTRAINT `artwork_type_id_refs_typ_id_18d309fa` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_record_type`
--

LOCK TABLES `General_record_type` WRITE;
/*!40000 ALTER TABLE `General_record_type` DISABLE KEYS */;
INSERT INTO `General_record_type` VALUES (14),(15),(16),(17),(18),(58),(59),(60),(61);
/*!40000 ALTER TABLE `General_record_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_region`
--

DROP TABLE IF EXISTS `General_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `region_type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` longtext,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `General_region_5fb27f15` (`region_type_id`),
  KEY `General_region_410d0aac` (`parent_id`),
  KEY `General_region_329f6fb3` (`lft`),
  KEY `General_region_e763210f` (`rght`),
  KEY `General_region_ba470c4a` (`tree_id`),
  KEY `General_region_20e079f4` (`level`),
  CONSTRAINT `region_type_id_refs_space_type_id_64b2d605` FOREIGN KEY (`region_type_id`) REFERENCES `General_region_type` (`space_type_id`),
  CONSTRAINT `parent_id_refs_id_d0933889` FOREIGN KEY (`parent_id`) REFERENCES `General_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_region`
--

LOCK TABLES `General_region` WRITE;
/*!40000 ALTER TABLE `General_region` DISABLE KEYS */;
INSERT INTO `General_region` VALUES (1,'Països Catalans',40,5,'',2,9,2,1),(2,'Catalunya',41,1,'',3,8,2,2),(3,'Barcelonès',43,2,'',4,5,2,3),(4,'Anoia',43,2,'',6,7,2,3),(5,'continent europeu',39,NULL,'',1,10,2,0),(6,'planeta Terra',62,NULL,'',1,2,3,0);
/*!40000 ALTER TABLE `General_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_region_type`
--

DROP TABLE IF EXISTS `General_region_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_region_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`),
  CONSTRAINT `space_type_id_refs_typ_id_723b7251` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_region_type`
--

LOCK TABLES `General_region_type` WRITE;
/*!40000 ALTER TABLE `General_region_type` DISABLE KEYS */;
INSERT INTO `General_region_type` VALUES (39),(40),(41),(42),(43),(62);
/*!40000 ALTER TABLE `General_region_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_addresses`
--

DROP TABLE IF EXISTS `General_rel_human_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `main_address` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_addresses_6922ec88` (`human_id`),
  KEY `General_rel_human_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_human_addresses_d525a588` (`relation_id`),
  CONSTRAINT `address_id_refs_id_10b91208` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `human_id_refs_id_7504d2e7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_2f3eeaff` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_addresses`
--

LOCK TABLES `General_rel_human_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_human_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_companies`
--

DROP TABLE IF EXISTS `General_rel_human_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_companies_6922ec88` (`human_id`),
  KEY `General_rel_human_companies_0316dde1` (`company_id`),
  KEY `General_rel_human_companies_d525a588` (`relation_id`),
  CONSTRAINT `relation_id_refs_id_e6d593f3` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  CONSTRAINT `company_id_refs_human_id_71dbec55` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `human_id_refs_id_e5fc194f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_companies`
--

LOCK TABLES `General_rel_human_companies` WRITE;
/*!40000 ALTER TABLE `General_rel_human_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_jobs`
--

DROP TABLE IF EXISTS `General_rel_human_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_jobs_6922ec88` (`human_id`),
  KEY `General_rel_human_jobs_218f3960` (`job_id`),
  KEY `General_rel_human_jobs_d525a588` (`relation_id`),
  CONSTRAINT `job_id_refs_id_8fcd99c8` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  CONSTRAINT `human_id_refs_id_e1b3b25a` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_6bff0d33` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_jobs`
--

LOCK TABLES `General_rel_human_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_human_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_materials`
--

DROP TABLE IF EXISTS `General_rel_human_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_materials_6922ec88` (`human_id`),
  KEY `General_rel_human_materials_f6ab4be3` (`material_id`),
  KEY `General_rel_human_materials_d525a588` (`relation_id`),
  CONSTRAINT `material_id_refs_id_096e6125` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `human_id_refs_id_27a27746` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_a156018f` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_materials`
--

LOCK TABLES `General_rel_human_materials` WRITE;
/*!40000 ALTER TABLE `General_rel_human_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_nonmaterials`
--

DROP TABLE IF EXISTS `General_rel_human_nonmaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_nonmaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_nonmaterials_6922ec88` (`human_id`),
  KEY `General_rel_human_nonmaterials_c510079f` (`nonmaterial_id`),
  KEY `General_rel_human_nonmaterials_d525a588` (`relation_id`),
  CONSTRAINT `nonmaterial_id_refs_id_9eb375a4` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `human_id_refs_id_fa4695a7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_759394a9` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_nonmaterials`
--

LOCK TABLES `General_rel_human_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_human_nonmaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_nonmaterials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_persons`
--

DROP TABLE IF EXISTS `General_rel_human_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_persons_6922ec88` (`human_id`),
  KEY `General_rel_human_persons_16f39487` (`person_id`),
  KEY `General_rel_human_persons_d525a588` (`relation_id`),
  CONSTRAINT `relation_id_refs_id_4d87a191` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  CONSTRAINT `human_id_refs_id_0f3df09c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `person_id_refs_human_id_c2292566` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_persons`
--

LOCK TABLES `General_rel_human_persons` WRITE;
/*!40000 ALTER TABLE `General_rel_human_persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_projects`
--

DROP TABLE IF EXISTS `General_rel_human_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_projects_6922ec88` (`human_id`),
  KEY `General_rel_human_projects_37952554` (`project_id`),
  KEY `General_rel_human_projects_d525a588` (`relation_id`),
  CONSTRAINT `relation_id_refs_id_ba34c004` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  CONSTRAINT `human_id_refs_id_a037337f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `project_id_refs_human_id_ff302cd2` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_projects`
--

LOCK TABLES `General_rel_human_projects` WRITE;
/*!40000 ALTER TABLE `General_rel_human_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_records`
--

DROP TABLE IF EXISTS `General_rel_human_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_records_6922ec88` (`human_id`),
  KEY `General_rel_human_records_52103e4c` (`record_id`),
  KEY `General_rel_human_records_d525a588` (`relation_id`),
  CONSTRAINT `record_id_refs_id_9dc62d11` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `human_id_refs_id_4b3e025c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_f06466de` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_records`
--

LOCK TABLES `General_rel_human_records` WRITE;
/*!40000 ALTER TABLE `General_rel_human_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_human_regions`
--

DROP TABLE IF EXISTS `General_rel_human_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_human_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_regions_6922ec88` (`human_id`),
  KEY `General_rel_human_regions_55a4ce96` (`region_id`),
  KEY `General_rel_human_regions_d525a588` (`relation_id`),
  CONSTRAINT `region_id_refs_id_5965961e` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
  CONSTRAINT `human_id_refs_id_aff17d88` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_2f9e896a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_regions`
--

LOCK TABLES `General_rel_human_regions` WRITE;
/*!40000 ALTER TABLE `General_rel_human_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_material_addresses`
--

DROP TABLE IF EXISTS `General_rel_material_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_material_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_addresses_f6ab4be3` (`material_id`),
  KEY `General_rel_material_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_material_addresses_d525a588` (`relation_id`),
  CONSTRAINT `material_id_refs_id_bbaf7619` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `address_id_refs_id_705aef0e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `relation_id_refs_id_ef8a49fc` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_addresses`
--

LOCK TABLES `General_rel_material_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_material_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_material_jobs`
--

DROP TABLE IF EXISTS `General_rel_material_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_material_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_jobs_f6ab4be3` (`material_id`),
  KEY `General_rel_material_jobs_218f3960` (`job_id`),
  KEY `General_rel_material_jobs_d525a588` (`relation_id`),
  CONSTRAINT `material_id_refs_id_619f712c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `job_id_refs_id_9d643e60` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  CONSTRAINT `relation_id_refs_id_16536571` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_jobs`
--

LOCK TABLES `General_rel_material_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_material_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_material_materials`
--

DROP TABLE IF EXISTS `General_rel_material_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_material_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `material2_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_materials_f6ab4be3` (`material_id`),
  KEY `General_rel_material_materials_f9e9200e` (`material2_id`),
  KEY `General_rel_material_materials_d525a588` (`relation_id`),
  CONSTRAINT `material2_id_refs_id_2740db72` FOREIGN KEY (`material2_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `material_id_refs_id_2740db72` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `relation_id_refs_id_bab781c4` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_materials`
--

LOCK TABLES `General_rel_material_materials` WRITE;
/*!40000 ALTER TABLE `General_rel_material_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_material_nonmaterials`
--

DROP TABLE IF EXISTS `General_rel_material_nonmaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_material_nonmaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_nonmaterials_f6ab4be3` (`material_id`),
  KEY `General_rel_material_nonmaterials_c510079f` (`nonmaterial_id`),
  KEY `General_rel_material_nonmaterials_d525a588` (`relation_id`),
  CONSTRAINT `material_id_refs_id_dd74c330` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_65ad546f` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `relation_id_refs_id_b7f51b83` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_nonmaterials`
--

LOCK TABLES `General_rel_material_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_material_nonmaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_nonmaterials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_material_records`
--

DROP TABLE IF EXISTS `General_rel_material_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_material_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_records_f6ab4be3` (`material_id`),
  KEY `General_rel_material_records_52103e4c` (`record_id`),
  KEY `General_rel_material_records_d525a588` (`relation_id`),
  CONSTRAINT `record_id_refs_id_2ce02938` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `material_id_refs_id_0f893e3c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `relation_id_refs_id_c378f6c7` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_records`
--

LOCK TABLES `General_rel_material_records` WRITE;
/*!40000 ALTER TABLE `General_rel_material_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_nonmaterial_addresses`
--

DROP TABLE IF EXISTS `General_rel_nonmaterial_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_nonmaterial_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_addresses_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_nonmaterial_addresses_d525a588` (`relation_id`),
  CONSTRAINT `nonmaterial_id_refs_id_1bb0b026` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `address_id_refs_id_7fe0517a` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `relation_id_refs_id_50c1c3d8` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_addresses`
--

LOCK TABLES `General_rel_nonmaterial_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_nonmaterial_jobs`
--

DROP TABLE IF EXISTS `General_rel_nonmaterial_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_nonmaterial_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_jobs_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_jobs_218f3960` (`job_id`),
  KEY `General_rel_nonmaterial_jobs_d525a588` (`relation_id`),
  CONSTRAINT `nonmaterial_id_refs_id_8a14fd3c` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `job_id_refs_id_32aeb4f3` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  CONSTRAINT `relation_id_refs_id_3a8d4d6d` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_jobs`
--

LOCK TABLES `General_rel_nonmaterial_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_nonmaterial_nonmaterials`
--

DROP TABLE IF EXISTS `General_rel_nonmaterial_nonmaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_nonmaterial_nonmaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `nonmaterial2_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_nonmaterials_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_nonmaterials_e0d4901c` (`nonmaterial2_id`),
  KEY `General_rel_nonmaterial_nonmaterials_d525a588` (`relation_id`),
  CONSTRAINT `nonmaterial2_id_refs_id_872f31c6` FOREIGN KEY (`nonmaterial2_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_872f31c6` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `relation_id_refs_id_98ed753a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_nonmaterials`
--

LOCK TABLES `General_rel_nonmaterial_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_nonmaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_nonmaterials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_rel_nonmaterial_records`
--

DROP TABLE IF EXISTS `General_rel_nonmaterial_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_rel_nonmaterial_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_records_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_records_52103e4c` (`record_id`),
  KEY `General_rel_nonmaterial_records_d525a588` (`relation_id`),
  CONSTRAINT `record_id_refs_id_9f9268bf` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_eba277fb` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `relation_id_refs_id_bab73c08` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_records`
--

LOCK TABLES `General_rel_nonmaterial_records` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_relation`
--

DROP TABLE IF EXISTS `General_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `verb` varchar(200) NOT NULL,
  `gerund` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_relation_410d0aac` (`parent_id`),
  KEY `General_relation_329f6fb3` (`lft`),
  KEY `General_relation_e763210f` (`rght`),
  KEY `General_relation_ba470c4a` (`tree_id`),
  KEY `General_relation_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_f04fb9fe` FOREIGN KEY (`parent_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_relation`
--

LOCK TABLES `General_relation` WRITE;
/*!40000 ALTER TABLE `General_relation` DISABLE KEYS */;
INSERT INTO `General_relation` VALUES (1,':Relació Humà - Humà','','','',NULL,1,38,1,0,'rel_hum_hum'),(2,':Relació Humà - Art','','','',NULL,1,6,2,0,'rel_hum_art'),(3,':Relació Humà - Espai','','','',NULL,1,20,3,0,'rel_hum_spac'),(4,':Relació Humà - Obra','','','',NULL,1,16,4,0,''),(5,':relació Persona - Projecte','','','',1,18,29,1,1,'rel_pers_proj'),(6,':relació Persona - Persona','','','',1,36,37,1,1,'rel_pers_pers'),(7,'participació','participar','participant','',19,7,8,1,2,''),(8,'dinamització','dinamitzar','dinamitzant','',19,5,6,1,2,''),(9,'col·laboració','col·laborar','col·laborant','',21,15,16,1,2,''),(10,'contribució/col·laboració','contribuir/col·laborar','contribuint/col·laborant','',5,21,28,1,2,'contribute'),(11,'referència','referenciar','referenciant','',19,3,4,1,2,'reference'),(12,'contribució en alguna comissió','contribuir en comissió','contribuint en comissió','',10,22,23,1,3,''),(13,'contribució puntual en tasques organitzatives','contribuir puntualment','contribuint puntualment','',10,24,25,1,3,''),(14,'contribució econòmica','contribuir econòmicament','contribuint econòmicament','',10,26,27,1,3,''),(15,':relació Projecte - Adreça','','','',3,2,9,3,1,'rel_proj_addr'),(16,'oferiment de l\'espai','oferir l\'espai','oferint l\'espai','',17,4,5,3,3,''),(17,'gestió de l\'espai','gestionar l\'espai','gestionant l\'espai','',15,3,6,3,2,''),(18,':relació Projecte - Empresa','','','',1,10,13,1,1,'rel_proj_empr'),(19,':relació Projecte - Persona','','','',1,2,9,1,1,'rel_proj_pers'),(20,'utilització','utilitzar','utilitzant','',18,11,12,1,2,''),(21,':relació Projecte - Projecte','','','',1,14,17,1,1,'rel_proj_proj'),(22,':relació Persona - Empresa','','','',1,30,35,1,1,'rel_pers_comp'),(23,'utilització d\'espai','utilitzar l\'espai','utilitzant l\'espai','',15,7,8,3,2,''),(24,':relació Persona - Adreça','','','',3,10,15,3,1,'rel_pers_addr'),(25,'habitatge a','habitar a','habitant a','',24,11,12,3,2,''),(26,'treball a','treballar a','treballant a','',24,13,14,3,2,''),(27,'seguiment','seguir','seguint','',5,19,20,1,2,''),(28,'aprenentatge','apendre','aprenent','',2,2,3,2,1,''),(29,'pràctica','practicar','practicant','',2,4,5,2,1,''),(30,':relació Humà - Registre','','','',4,2,5,4,1,'rel_hum_reco'),(31,'compra a empresa','comprar a l\'empresa','comprant a l\'empresa','',22,31,32,1,2,''),(32,'treball per empresa','treballar per l\'empresa','treballant per l\'empresa','',22,33,34,1,2,''),(33,':relació Humà - Regió','','','',3,16,19,3,1,'rel_hum_regi'),(34,'vinculació vital a','fer vida a','fent vida a','',33,17,18,3,2,''),(35,':relació Humà - obra Material','','','',4,6,9,4,1,'rel_hum_mate'),(36,'titular del registre','titular el registre','titulant el registre','',30,3,4,4,2,'holder'),(37,'pertinença','pertànyer','pertanyent','',35,7,8,4,2,''),(38,':relació Humà - obra Inmaterial','','','',4,10,15,4,1,'rel_hum_nonm'),(39,'representació','representar','representant','',38,11,12,4,2,''),(40,'oferta d\'obra inmaterial','oferir l\'obra inmaterial','oferint l\'obra inmaterial','',38,13,14,4,2,''),(41,':relació obra Material - Adreça','','','',46,2,5,9,1,'rel_mat_addr'),(42,'aparcament a','aparcar a','aparcant a','',41,3,4,9,2,''),(43,':relació obra Material - Registre','','','',47,2,3,10,1,'rel_mat_reco'),(44,':relació obra Material - obra Inmaterial','','','',47,6,7,10,1,'rel_mat_nonm'),(45,':relació obra Material - obra Material','','','',47,4,5,10,1,'rel_mat_mate'),(46,':Relació Obra - Espai','','','',NULL,1,8,9,0,''),(47,':Relació Obra - Obra','','','',NULL,1,12,10,0,''),(48,':Relació Obra - Art','','','',NULL,1,8,11,0,''),(49,':relació obra Material - Ofici','','','',48,2,5,11,1,'rel_mat_jobs'),(50,':relació obra Inmaterial - Adreça','','','',46,6,7,9,1,'rel_non_addr'),(51,':relació obra Inmaterial - Registre','','','',47,8,9,10,1,'rel_non_reco'),(52,':relació obra Inmaterial - Ofici','','','',48,6,7,11,1,'rel_non_jobs'),(53,':relació obra Inmaterial - obra Inmaterial','','','',47,10,11,10,1,'rel_non_nonm'),(54,'servei per','servir per','servint per','',49,3,4,11,2,'');
/*!40000 ALTER TABLE `General_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_space_type`
--

DROP TABLE IF EXISTS `General_space_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_space_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`),
  CONSTRAINT `typ_id_refs_id_5dcfea05` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_space_type`
--

LOCK TABLES `General_space_type` WRITE;
/*!40000 ALTER TABLE `General_space_type` DISABLE KEYS */;
INSERT INTO `General_space_type` VALUES (7),(8),(39),(40),(41),(42),(43),(44),(45),(46),(62);
/*!40000 ALTER TABLE `General_space_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_type`
--

DROP TABLE IF EXISTS `General_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_type_410d0aac` (`parent_id`),
  KEY `General_type_329f6fb3` (`lft`),
  KEY `General_type_e763210f` (`rght`),
  KEY `General_type_ba470c4a` (`tree_id`),
  KEY `General_type_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_4c09e283` FOREIGN KEY (`parent_id`) REFERENCES `General_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_type`
--

LOCK TABLES `General_type` WRITE;
/*!40000 ALTER TABLE `General_type` DISABLE KEYS */;
INSERT INTO `General_type` VALUES (1,'Ésser','',NULL,1,48,1,0,'Being'),(2,'Espai','',NULL,1,24,2,0,'Space'),(3,'Obra','',NULL,1,60,3,0,'Artwork'),(4,'Persona','',1,2,3,1,1,'Person'),(5,'Projecte','',1,4,39,1,1,'Project'),(6,'Empresa','',1,40,47,1,1,'Company'),(7,'Adreça','',2,2,9,2,1,'Address'),(8,'Regió','',2,10,23,2,1,'Region'),(9,'Material','',3,2,9,3,1,'Material'),(10,'Inmaterial','',3,10,25,3,1,'Nonmaterial'),(11,'Registre','',3,26,45,3,1,'Record'),(12,'Unitat','',3,46,59,3,1,'Unit'),(13,'Projecte CI','',5,5,36,1,2,'ic_project'),(14,'Equivalencia d\'Unitats','',11,27,36,3,2,'UnitRatio'),(15,'Compte monetari','',11,37,44,3,2,''),(16,'compte CES','',15,38,39,3,3,'AccountCes'),(17,'compte Criptomoneda','',15,40,41,3,3,'AccountCrypto'),(18,'compte Bancari','',15,42,43,3,3,'AccountBank'),(19,'Cooperativa','',6,41,42,1,2,'cooperative'),(20,'Bancaria','',6,43,44,1,2,'bank'),(21,'Nucli d\'Autogestió Local','',23,7,8,1,4,''),(22,'Ecoxarxa','',23,9,10,1,4,'ces'),(23,'Públic','',13,6,19,1,3,'public'),(24,'Cooperativa Integral','',23,11,12,1,4,'ces'),(25,'Productiu Public','',23,13,14,1,4,''),(26,'Servei Comú','',23,15,16,1,4,''),(27,'Cooperatiu Col·lectiu','',63,31,32,1,4,''),(28,'Grup de Consum','',63,33,34,1,4,''),(29,'De Serveis','',13,20,21,1,3,''),(30,'PAIC sense facturació','',13,22,23,1,3,''),(31,'Autoocupat','',13,24,29,1,3,'selfemployed'),(32,'Autoocupat Firaire','',31,25,26,1,4,''),(33,'PAIC amb facturació','',31,27,28,1,4,''),(34,'Moneda','',12,47,54,3,2,'currency'),(35,'Moneda Social','',34,48,49,3,3,'social_currency'),(36,'Criptomoneda','',34,50,51,3,3,'crypto_currency'),(37,'Moneda Fiat','',34,52,53,3,3,'fiat_currency'),(38,'Àrea','',12,55,56,3,2,'area'),(39,'Continent','',8,11,20,2,2,''),(40,'País','',39,12,19,2,3,''),(41,'Comunitat Cultural','',40,13,18,2,4,''),(42,'Bioregió','',41,14,15,2,5,''),(43,'Comarca','',41,16,17,2,5,'region'),(44,'Espai Polivalent Col·lectiu','',7,3,4,2,2,''),(45,'Taller','',7,5,6,2,2,''),(46,'Habitatge','',7,7,8,2,2,''),(47,'Xarxa Mundial','',5,37,38,1,2,''),(48,'Temps','',12,57,58,3,2,'time_currency'),(49,'Formació','',50,12,19,3,3,''),(50,'obra Cultural','',10,11,20,3,2,''),(51,'obra Digital','',10,21,24,3,2,''),(52,'formació CI','',49,13,18,3,4,'ic_learn'),(53,'sessió de formació Col·lectiva','',52,14,15,3,5,''),(54,'sessió de formació Individual','',52,16,17,3,5,''),(55,'Màquina','',9,3,8,3,2,''),(56,'Vehicle','',55,4,7,3,3,''),(57,'Cotxe','',56,5,6,3,4,''),(58,'equivalencia Moneda - Temps','',14,28,29,3,3,''),(59,'equivalencia Moneda - Moneda','',14,30,31,3,3,''),(60,'equivalencia Àrea - Àrea','',14,32,33,3,3,''),(61,'equivalencia Temps - Temps','',14,34,35,3,3,''),(62,'Planeta','',8,21,22,2,2,''),(63,'Online','',13,30,35,1,3,'online'),(64,'Asseguradora','',6,45,46,1,2,''),(65,'Imatge digital','',51,22,23,3,3,'img'),(66,'Rebost','',23,17,18,1,4,'ic_larder');
/*!40000 ALTER TABLE `General_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_unit`
--

DROP TABLE IF EXISTS `General_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `unit_type_id` int(11) DEFAULT NULL,
  `code` varchar(4) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `human_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_unit_0f371b60` (`unit_type_id`),
  KEY `General_unit_55a4ce96` (`region_id`),
  KEY `General_unit_6922ec88` (`human_id`),
  CONSTRAINT `unit_type_id_refs_artwork_type_id_5cc88dc7` FOREIGN KEY (`unit_type_id`) REFERENCES `General_unit_type` (`artwork_type_id`),
  CONSTRAINT `human_id_refs_id_5eaaaa15` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `region_id_refs_id_c4f5f71c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_unit`
--

LOCK TABLES `General_unit` WRITE;
/*!40000 ALTER TABLE `General_unit` DISABLE KEYS */;
INSERT INTO `General_unit` VALUES (1,'EcoCoop','',35,'eco',NULL,3),(2,'Euro','',37,'€',NULL,NULL),(3,'Metre Quadrat','',38,'m2',NULL,NULL),(4,'Hectàrea','',38,'Ha',NULL,NULL),(5,'Hora','',48,'h',NULL,NULL),(6,'Riu','',35,'riu',4,17),(7,'FairCoin','',36,'FAC',6,NULL);
/*!40000 ALTER TABLE `General_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_unit_type`
--

DROP TABLE IF EXISTS `General_unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_unit_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`),
  CONSTRAINT `artwork_type_id_refs_typ_id_0b70a72e` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_unit_type`
--

LOCK TABLES `General_unit_type` WRITE;
/*!40000 ALTER TABLE `General_unit_type` DISABLE KEYS */;
INSERT INTO `General_unit_type` VALUES (34),(35),(36),(37),(38),(48);
/*!40000 ALTER TABLE `General_unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_unitratio`
--

DROP TABLE IF EXISTS `General_unitratio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_unitratio` (
  `record_id` int(11) NOT NULL,
  `in_unit_id` int(11) NOT NULL,
  `rate` decimal(6,3) NOT NULL,
  `out_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_unitratio_49ac93b0` (`in_unit_id`),
  KEY `General_unitratio_17576a54` (`out_unit_id`),
  CONSTRAINT `out_unit_id_refs_id_e045a3a5` FOREIGN KEY (`out_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `in_unit_id_refs_id_e045a3a5` FOREIGN KEY (`in_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `record_id_refs_id_e333dd70` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_unitratio`
--

LOCK TABLES `General_unitratio` WRITE;
/*!40000 ALTER TABLE `General_unitratio` DISABLE KEYS */;
INSERT INTO `General_unitratio` VALUES (3,1,5.000,5),(4,1,1.000,2),(5,6,1.000,2);
/*!40000 ALTER TABLE `General_unitratio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_client`
--

DROP TABLE IF EXISTS `Invoices_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_client` (
  `company_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`company_ptr_id`),
  CONSTRAINT `company_ptr_id_refs_id_ef75bce5` FOREIGN KEY (`company_ptr_id`) REFERENCES `Invoices_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_client`
--

LOCK TABLES `Invoices_client` WRITE;
/*!40000 ALTER TABLE `Invoices_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_company`
--

DROP TABLE IF EXISTS `Invoices_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `CIF` varchar(30) DEFAULT NULL,
  `otherCIF` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_company`
--

LOCK TABLES `Invoices_company` WRITE;
/*!40000 ALTER TABLE `Invoices_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_coop`
--

DROP TABLE IF EXISTS `Invoices_coop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_coop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_coop`
--

LOCK TABLES `Invoices_coop` WRITE;
/*!40000 ALTER TABLE `Invoices_coop` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_coop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_cooper`
--

DROP TABLE IF EXISTS `Invoices_cooper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_cooper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `coop_id` int(11) NOT NULL,
  `coop_number` int(11) NOT NULL,
  `assigned_vat` int(11) NOT NULL,
  `extra_days` int(11) NOT NULL,
  `advanced_tax` decimal(10,2) NOT NULL,
  `membership_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `coop_number` (`coop_number`),
  KEY `Invoices_cooper_b0ecf097` (`coop_id`),
  KEY `Invoices_cooper_1818c0ae` (`membership_id`),
  CONSTRAINT `membership_id_refs_ic_record_id_0be63ce5` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `coop_id_refs_id_32a70915` FOREIGN KEY (`coop_id`) REFERENCES `Invoices_coop` (`id`),
  CONSTRAINT `user_id_refs_id_4e0da4ad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_cooper`
--

LOCK TABLES `Invoices_cooper` WRITE;
/*!40000 ALTER TABLE `Invoices_cooper` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_cooper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_cooper_clients`
--

DROP TABLE IF EXISTS `Invoices_cooper_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_cooper_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooper_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cooper_id` (`cooper_id`,`client_id`),
  KEY `Invoices_cooper_clients_0e79bd52` (`cooper_id`),
  KEY `Invoices_cooper_clients_4fea5d6a` (`client_id`),
  CONSTRAINT `cooper_id_refs_id_e1b00501` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  CONSTRAINT `client_id_refs_company_ptr_id_47b197bc` FOREIGN KEY (`client_id`) REFERENCES `Invoices_client` (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_cooper_clients`
--

LOCK TABLES `Invoices_cooper_clients` WRITE;
/*!40000 ALTER TABLE `Invoices_cooper_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_cooper_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_cooper_providers`
--

DROP TABLE IF EXISTS `Invoices_cooper_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_cooper_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooper_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cooper_id` (`cooper_id`,`provider_id`),
  KEY `Invoices_cooper_providers_0e79bd52` (`cooper_id`),
  KEY `Invoices_cooper_providers_3f126c2d` (`provider_id`),
  CONSTRAINT `cooper_id_refs_id_51eca6db` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  CONSTRAINT `provider_id_refs_company_ptr_id_76872955` FOREIGN KEY (`provider_id`) REFERENCES `Invoices_provider` (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_cooper_providers`
--

LOCK TABLES `Invoices_cooper_providers` WRITE;
/*!40000 ALTER TABLE `Invoices_cooper_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_cooper_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_csvimport`
--

DROP TABLE IF EXISTS `Invoices_csvimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_csvimport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `field_list` varchar(255) NOT NULL,
  `upload_file` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `upload_method` varchar(50) NOT NULL,
  `error_log` longtext NOT NULL,
  `import_date` date NOT NULL,
  `import_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_csvimport`
--

LOCK TABLES `Invoices_csvimport` WRITE;
/*!40000 ALTER TABLE `Invoices_csvimport` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_csvimport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_currencies`
--

DROP TABLE IF EXISTS `Invoices_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_currencies`
--

LOCK TABLES `Invoices_currencies` WRITE;
/*!40000 ALTER TABLE `Invoices_currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_email`
--

DROP TABLE IF EXISTS `Invoices_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `efrom` varchar(75) NOT NULL,
  `eto` varchar(75) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_email`
--

LOCK TABLES `Invoices_email` WRITE;
/*!40000 ALTER TABLE `Invoices_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_emailnotification`
--

DROP TABLE IF EXISTS `Invoices_emailnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_emailnotification` (
  `email_ptr_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `sent_to_user_id` int(11) DEFAULT NULL,
  `ento` int(11) NOT NULL,
  `notification_type` int(11) NOT NULL,
  `pointed_date` date NOT NULL,
  `offset_days` int(11) NOT NULL,
  PRIMARY KEY (`email_ptr_id`),
  KEY `Invoices_emailnotification_ba07d19d` (`period_id`),
  KEY `Invoices_emailnotification_30669b4d` (`sent_to_user_id`),
  CONSTRAINT `sent_to_user_id_refs_id_6ec8b209` FOREIGN KEY (`sent_to_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `email_ptr_id_refs_id_39c11a23` FOREIGN KEY (`email_ptr_id`) REFERENCES `Invoices_email` (`id`),
  CONSTRAINT `period_id_refs_id_0b714fd0` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_emailnotification`
--

LOCK TABLES `Invoices_emailnotification` WRITE;
/*!40000 ALTER TABLE `Invoices_emailnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_emailnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_period`
--

DROP TABLE IF EXISTS `Invoices_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(200) NOT NULL,
  `first_day` date NOT NULL,
  `date_open` date NOT NULL,
  `date_close` date NOT NULL,
  `exported` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_period`
--

LOCK TABLES `Invoices_period` WRITE;
/*!40000 ALTER TABLE `Invoices_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_period_close`
--

DROP TABLE IF EXISTS `Invoices_period_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_period_close` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `cooper_id` int(11) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL,
  `system_closed` tinyint(1) NOT NULL,
  `sales_base` decimal(10,2) NOT NULL,
  `sales_invoiced_vat` decimal(10,2) NOT NULL,
  `sales_assigned_vat` decimal(10,2) NOT NULL,
  `sales_total` decimal(10,2) NOT NULL,
  `purchases_base` decimal(10,2) NOT NULL,
  `purchases_vat` decimal(10,2) NOT NULL,
  `purchases_irpf` decimal(10,2) NOT NULL,
  `purchases_total` decimal(10,2) NOT NULL,
  `vat_type` int(11) NOT NULL,
  `savings_with_assigned_vat_donation` decimal(10,2) NOT NULL,
  `period_tax` decimal(10,2) NOT NULL,
  `advanced_tax` decimal(10,2) NOT NULL,
  `donation` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cooper_id` (`cooper_id`,`period_id`),
  KEY `Invoices_period_close_ba07d19d` (`period_id`),
  KEY `Invoices_period_close_0e79bd52` (`cooper_id`),
  CONSTRAINT `cooper_id_refs_id_bcea9d40` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  CONSTRAINT `period_id_refs_id_ff19a1b5` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_period_close`
--

LOCK TABLES `Invoices_period_close` WRITE;
/*!40000 ALTER TABLE `Invoices_period_close` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_period_close` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_period_payment`
--

DROP TABLE IF EXISTS `Invoices_period_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_period_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_close_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_period_payment_a07f73c3` (`period_close_id`),
  KEY `Invoices_period_payment_b2321453` (`currency_id`),
  CONSTRAINT `period_close_id_refs_id_e986744e` FOREIGN KEY (`period_close_id`) REFERENCES `Invoices_period_close` (`id`),
  CONSTRAINT `currency_id_refs_id_05753da2` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_period_payment`
--

LOCK TABLES `Invoices_period_payment` WRITE;
/*!40000 ALTER TABLE `Invoices_period_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_period_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_provider`
--

DROP TABLE IF EXISTS `Invoices_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_provider` (
  `company_ptr_id` int(11) NOT NULL,
  `iban` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`company_ptr_id`),
  CONSTRAINT `company_ptr_id_refs_id_3e1babba` FOREIGN KEY (`company_ptr_id`) REFERENCES `Invoices_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_provider`
--

LOCK TABLES `Invoices_provider` WRITE;
/*!40000 ALTER TABLE `Invoices_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_purchases_invoice`
--

DROP TABLE IF EXISTS `Invoices_purchases_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_purchases_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `cooper_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `expiring_date` date DEFAULT NULL,
  `who_manage` int(11) NOT NULL,
  `transfer_date` date DEFAULT NULL,
  `num` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_purchases_invoice_ba07d19d` (`period_id`),
  KEY `Invoices_purchases_invoice_0e79bd52` (`cooper_id`),
  KEY `Invoices_purchases_invoice_3f126c2d` (`provider_id`),
  CONSTRAINT `cooper_id_refs_id_0c68846b` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  CONSTRAINT `period_id_refs_id_95b23a99` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`),
  CONSTRAINT `provider_id_refs_company_ptr_id_67ba8602` FOREIGN KEY (`provider_id`) REFERENCES `Invoices_provider` (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_purchases_invoice`
--

LOCK TABLES `Invoices_purchases_invoice` WRITE;
/*!40000 ALTER TABLE `Invoices_purchases_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_purchases_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_purchases_line`
--

DROP TABLE IF EXISTS `Invoices_purchases_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_purchases_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchases_invoice_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `percent_vat_id` int(11) NOT NULL,
  `percent_irpf` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_purchases_line_ea3d3bfa` (`purchases_invoice_id`),
  KEY `Invoices_purchases_line_040d9802` (`percent_vat_id`),
  CONSTRAINT `percent_vat_id_refs_id_edb9cd9a` FOREIGN KEY (`percent_vat_id`) REFERENCES `Invoices_vats` (`id`),
  CONSTRAINT `purchases_invoice_id_refs_id_cceb0727` FOREIGN KEY (`purchases_invoice_id`) REFERENCES `Invoices_purchases_invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_purchases_line`
--

LOCK TABLES `Invoices_purchases_line` WRITE;
/*!40000 ALTER TABLE `Invoices_purchases_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_purchases_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_purchases_movement`
--

DROP TABLE IF EXISTS `Invoices_purchases_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_purchases_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_membership_id` int(11) NOT NULL,
  `concept` varchar(200) NOT NULL,
  `execution_date` date DEFAULT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `petition_date` date NOT NULL,
  `acceptation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_purchases_movement_37d462ff` (`ic_membership_id`),
  KEY `Invoices_purchases_movement_b2321453` (`currency_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_6dd418d3` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `currency_id_refs_id_76ff56a7` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_purchases_movement`
--

LOCK TABLES `Invoices_purchases_movement` WRITE;
/*!40000 ALTER TABLE `Invoices_purchases_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_purchases_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_sales_invoice`
--

DROP TABLE IF EXISTS `Invoices_sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_sales_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `cooper_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `expiring_date` date DEFAULT NULL,
  `who_manage` int(11) NOT NULL,
  `transfer_date` date DEFAULT NULL,
  `num` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cooper_id` (`cooper_id`,`period_id`,`num`),
  KEY `Invoices_sales_invoice_ba07d19d` (`period_id`),
  KEY `Invoices_sales_invoice_0e79bd52` (`cooper_id`),
  KEY `Invoices_sales_invoice_4fea5d6a` (`client_id`),
  CONSTRAINT `client_id_refs_company_ptr_id_6f3398be` FOREIGN KEY (`client_id`) REFERENCES `Invoices_client` (`company_ptr_id`),
  CONSTRAINT `cooper_id_refs_id_bb4338e1` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  CONSTRAINT `period_id_refs_id_caf8efec` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_sales_invoice`
--

LOCK TABLES `Invoices_sales_invoice` WRITE;
/*!40000 ALTER TABLE `Invoices_sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_sales_line`
--

DROP TABLE IF EXISTS `Invoices_sales_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_sales_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` int(11) NOT NULL,
  `percent_invoiced_vat_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_sales_line_03e8ca27` (`sales_invoice_id`),
  KEY `Invoices_sales_line_882eda97` (`percent_invoiced_vat_id`),
  CONSTRAINT `sales_invoice_id_refs_id_d17ada0f` FOREIGN KEY (`sales_invoice_id`) REFERENCES `Invoices_sales_invoice` (`id`),
  CONSTRAINT `percent_invoiced_vat_id_refs_id_b51d6294` FOREIGN KEY (`percent_invoiced_vat_id`) REFERENCES `Invoices_vats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_sales_line`
--

LOCK TABLES `Invoices_sales_line` WRITE;
/*!40000 ALTER TABLE `Invoices_sales_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_sales_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_sales_movement`
--

DROP TABLE IF EXISTS `Invoices_sales_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_sales_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_membership_id` int(11) NOT NULL,
  `concept` varchar(200) NOT NULL,
  `execution_date` date DEFAULT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `planned_date` date NOT NULL,
  `who_manage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_sales_movement_37d462ff` (`ic_membership_id`),
  KEY `Invoices_sales_movement_b2321453` (`currency_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_426a3e93` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `currency_id_refs_id_ea1b4f9e` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_sales_movement`
--

LOCK TABLES `Invoices_sales_movement` WRITE;
/*!40000 ALTER TABLE `Invoices_sales_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_sales_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_tax`
--

DROP TABLE IF EXISTS `Invoices_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(10,2) NOT NULL,
  `min_base` int(11) NOT NULL,
  `max_base` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_tax`
--

LOCK TABLES `Invoices_tax` WRITE;
/*!40000 ALTER TABLE `Invoices_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_type`
--

DROP TABLE IF EXISTS `Invoices_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `Invoices_type_410d0aac` (`parent_id`),
  KEY `Invoices_type_329f6fb3` (`lft`),
  KEY `Invoices_type_e763210f` (`rght`),
  KEY `Invoices_type_ba470c4a` (`tree_id`),
  KEY `Invoices_type_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_02569410` FOREIGN KEY (`parent_id`) REFERENCES `Invoices_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_type`
--

LOCK TABLES `Invoices_type` WRITE;
/*!40000 ALTER TABLE `Invoices_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_vats`
--

DROP TABLE IF EXISTS `Invoices_vats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_vats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_vats`
--

LOCK TABLES `Invoices_vats` WRITE;
/*!40000 ALTER TABLE `Invoices_vats` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_vats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_fee`
--

DROP TABLE IF EXISTS `Welcome_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_fee` (
  `ic_record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `rel_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_fee_6922ec88` (`human_id`),
  KEY `Welcome_fee_37952554` (`project_id`),
  KEY `Welcome_fee_b9dcc52b` (`unit_id`),
  KEY `Welcome_fee_8342f46c` (`payment_type_id`),
  KEY `Welcome_fee_5b622010` (`rel_account_id`),
  CONSTRAINT `payment_type_id_refs_ic_type_id_c8bafb66` FOREIGN KEY (`payment_type_id`) REFERENCES `Welcome_payment_type` (`ic_type_id`),
  CONSTRAINT `human_id_refs_id_3c3445f1` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_record_id_refs_id_fb734d90` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `project_id_refs_human_id_028a3357` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `rel_account_id_refs_id_93465450` FOREIGN KEY (`rel_account_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_d83a16d0` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_fee`
--

LOCK TABLES `Welcome_fee` WRITE;
/*!40000 ALTER TABLE `Welcome_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_address_contract`
--

DROP TABLE IF EXISTS `Welcome_ic_address_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_address_contract` (
  `ic_document_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `price_unit_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_address_contract_0316dde1` (`company_id`),
  KEY `Welcome_ic_address_contract_3ac8a70a` (`address_id`),
  KEY `Welcome_ic_address_contract_098d71f2` (`price_unit_id`),
  CONSTRAINT `price_unit_id_refs_id_a84f78ad` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `address_id_refs_id_7bcaf3bc` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `company_id_refs_human_id_9f93aaad` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_8f544de0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_address_contract`
--

LOCK TABLES `Welcome_ic_address_contract` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_address_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_address_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_akin_membership`
--

DROP TABLE IF EXISTS `Welcome_ic_akin_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_akin_membership` (
  `ic_record_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `ic_project_id` int(11) NOT NULL,
  `ic_company_id` int(11) DEFAULT NULL,
  `ic_membership_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  UNIQUE KEY `person_id` (`person_id`),
  KEY `Welcome_ic_akin_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_akin_membership_44454d15` (`ic_company_id`),
  KEY `Welcome_ic_akin_membership_37d462ff` (`ic_membership_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_99c87fea` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_company_id_refs_human_id_6f7442a2` FOREIGN KEY (`ic_company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_project_id_refs_human_id_9b38bd6d` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `ic_record_id_refs_id_c266dcc5` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `person_id_refs_human_id_0758e303` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_akin_membership`
--

LOCK TABLES `Welcome_ic_akin_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_akin_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_akin_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_document`
--

DROP TABLE IF EXISTS `Welcome_ic_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_document` (
  `ic_record_id` int(11) NOT NULL,
  `doc_type_id` int(11) DEFAULT NULL,
  `doc_file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_document_ca3e294e` (`doc_type_id`),
  CONSTRAINT `doc_type_id_refs_record_type_id_697e0ecf` FOREIGN KEY (`doc_type_id`) REFERENCES `Welcome_ic_document_type` (`record_type_id`),
  CONSTRAINT `ic_record_id_refs_id_28d2e5f7` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_document`
--

LOCK TABLES `Welcome_ic_document` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_document_type`
--

DROP TABLE IF EXISTS `Welcome_ic_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_document_type` (
  `record_type_id` int(11) NOT NULL,
  PRIMARY KEY (`record_type_id`),
  CONSTRAINT `record_type_id_refs_ic_type_id_121c74ac` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_document_type`
--

LOCK TABLES `Welcome_ic_document_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_document_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_document_type` VALUES (13),(14),(15),(16),(27),(28);
/*!40000 ALTER TABLE `Welcome_ic_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_insurance`
--

DROP TABLE IF EXISTS `Welcome_ic_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_insurance` (
  `ic_document_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `number` varchar(30) DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `price_unit_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_insurance_0316dde1` (`company_id`),
  KEY `Welcome_ic_insurance_098d71f2` (`price_unit_id`),
  KEY `Welcome_ic_insurance_57d16b26` (`rel_address_id`),
  KEY `Welcome_ic_insurance_bfdae731` (`rel_job_id`),
  CONSTRAINT `rel_address_id_refs_id_0a733bc0` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `company_id_refs_human_id_8dc69d9f` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_74e41ee0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `price_unit_id_refs_id_cf457021` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `rel_job_id_refs_id_69cdbd47` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_insurance`
--

LOCK TABLES `Welcome_ic_insurance` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_insurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_labor_contract`
--

DROP TABLE IF EXISTS `Welcome_ic_labor_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_labor_contract` (
  `ic_document_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_labor_contract_16f39487` (`person_id`),
  KEY `Welcome_ic_labor_contract_0316dde1` (`company_id`),
  CONSTRAINT `company_id_refs_human_id_53c2a07e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_7885c79c` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `person_id_refs_human_id_23ff45ce` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_labor_contract`
--

LOCK TABLES `Welcome_ic_labor_contract` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_labor_contract_rel_fees`
--

DROP TABLE IF EXISTS `Welcome_ic_labor_contract_rel_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_labor_contract_rel_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_labor_contract_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_labor_contract_id` (`ic_labor_contract_id`,`fee_id`),
  KEY `Welcome_ic_labor_contract_rel_fees_2382b2f1` (`ic_labor_contract_id`),
  KEY `Welcome_ic_labor_contract_rel_fees_5329f76d` (`fee_id`),
  CONSTRAINT `ic_labor_contract_id_refs_ic_document_id_d1fb4508` FOREIGN KEY (`ic_labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`),
  CONSTRAINT `fee_id_refs_ic_record_id_bbc0ea3f` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_labor_contract_rel_fees`
--

LOCK TABLES `Welcome_ic_labor_contract_rel_fees` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract_rel_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract_rel_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_licence`
--

DROP TABLE IF EXISTS `Welcome_ic_licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_licence` (
  `ic_document_id` int(11) NOT NULL,
  `number` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_licence_57d16b26` (`rel_address_id`),
  KEY `Welcome_ic_licence_bfdae731` (`rel_job_id`),
  CONSTRAINT `rel_address_id_refs_id_44aa1942` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_638b2aec` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `rel_job_id_refs_id_c58b25ba` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_licence`
--

LOCK TABLES `Welcome_ic_licence` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_membership`
--

DROP TABLE IF EXISTS `Welcome_ic_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_membership` (
  `ic_record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `ic_project_id` int(11) NOT NULL,
  `ic_company_id` int(11) DEFAULT NULL,
  `contribution_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `join_fee_id` int(11) DEFAULT NULL,
  `ic_CESnum` varchar(8) DEFAULT NULL,
  `virtual_market` tinyint(1) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_membership_6922ec88` (`human_id`),
  KEY `Welcome_ic_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_membership_44454d15` (`ic_company_id`),
  KEY `Welcome_ic_membership_2731fa00` (`contribution_id`),
  KEY `Welcome_ic_membership_3f4dd712` (`join_fee_id`),
  CONSTRAINT `human_id_refs_id_90a969ae` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `contribution_id_refs_id_803a7b3a` FOREIGN KEY (`contribution_id`) REFERENCES `General_relation` (`id`),
  CONSTRAINT `ic_company_id_refs_human_id_ad6c338f` FOREIGN KEY (`ic_company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_project_id_refs_human_id_5db24bd9` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `ic_record_id_refs_id_2333c0a4` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `join_fee_id_refs_ic_record_id_b65e7f0b` FOREIGN KEY (`join_fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership`
--

LOCK TABLES `Welcome_ic_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_membership_expositors`
--

DROP TABLE IF EXISTS `Welcome_ic_membership_expositors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_membership_expositors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_membership_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_membership_id` (`ic_membership_id`,`address_id`),
  KEY `Welcome_ic_membership_expositors_37d462ff` (`ic_membership_id`),
  KEY `Welcome_ic_membership_expositors_3ac8a70a` (`address_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_e4a14336` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `address_id_refs_id_0c2b9dd4` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership_expositors`
--

LOCK TABLES `Welcome_ic_membership_expositors` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_person_membership`
--

DROP TABLE IF EXISTS `Welcome_ic_person_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_person_membership` (
  `ic_membership_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `labor_contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_membership_id`),
  UNIQUE KEY `labor_contract_id` (`labor_contract_id`),
  KEY `Welcome_ic_person_membership_16f39487` (`person_id`),
  CONSTRAINT `labor_contract_id_refs_ic_document_id_6b8b7536` FOREIGN KEY (`labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_f0bf3784` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `person_id_refs_human_id_aa582a02` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_person_membership`
--

LOCK TABLES `Welcome_ic_person_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_person_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_person_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_project_membership`
--

DROP TABLE IF EXISTS `Welcome_ic_project_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_project_membership` (
  `ic_membership_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_membership_id`),
  KEY `Welcome_ic_project_membership_37952554` (`project_id`),
  CONSTRAINT `project_id_refs_human_id_0be24c6e` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_925dedba` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_project_membership`
--

LOCK TABLES `Welcome_ic_project_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_project_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_project_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_record`
--

DROP TABLE IF EXISTS `Welcome_ic_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Welcome_ic_record_ac580b38` (`record_type_id`),
  CONSTRAINT `record_type_id_refs_ic_type_id_3360b245` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_record`
--

LOCK TABLES `Welcome_ic_record` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_record_type`
--

DROP TABLE IF EXISTS `Welcome_ic_record_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_record_type` (
  `ic_type_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_type_id`),
  CONSTRAINT `ic_type_id_refs_id_6fca3ce7` FOREIGN KEY (`ic_type_id`) REFERENCES `Welcome_ic_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_record_type`
--

LOCK TABLES `Welcome_ic_record_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_record_type` VALUES (3),(4),(5),(6),(7),(8),(9),(10),(11),(13),(14),(15),(16),(17),(18),(19),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38);
/*!40000 ALTER TABLE `Welcome_ic_record_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_self_employed`
--

DROP TABLE IF EXISTS `Welcome_ic_self_employed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_self_employed` (
  `ic_record_id` int(11) NOT NULL,
  `ic_membership_id` int(11) NOT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `organic` tinyint(1) NOT NULL,
  `rel_accountBank_id` int(11) DEFAULT NULL,
  `assigned_vat` decimal(4,2) DEFAULT NULL,
  `review_vat` tinyint(1) NOT NULL,
  `last_review_date` date DEFAULT NULL,
  `mentor_membership_id` int(11) DEFAULT NULL,
  `mentor_comment` longtext,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_self_employed_37d462ff` (`ic_membership_id`),
  KEY `Welcome_ic_self_employed_259761f6` (`rel_accountBank_id`),
  KEY `Welcome_ic_self_employed_5bec29b3` (`mentor_membership_id`),
  CONSTRAINT `mentor_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`mentor_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_record_id_refs_id_8ebb96a9` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `rel_accountBank_id_refs_record_id_939a5950` FOREIGN KEY (`rel_accountBank_id`) REFERENCES `General_accountbank` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed`
--

LOCK TABLES `Welcome_ic_self_employed` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_self_employed_rel_address_contracts`
--

DROP TABLE IF EXISTS `Welcome_ic_self_employed_rel_address_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_self_employed_rel_address_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_address_contract_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_address_contract_id`),
  KEY `Welcome_ic_self_employed_rel_address_contracts_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_address_contracts_e60246de` (`ic_address_contract_id`),
  CONSTRAINT `ic_address_contract_id_refs_ic_document_id_5db41926` FOREIGN KEY (`ic_address_contract_id`) REFERENCES `Welcome_ic_address_contract` (`ic_document_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_ae5cb31f` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_address_contracts`
--

LOCK TABLES `Welcome_ic_self_employed_rel_address_contracts` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_self_employed_rel_fees`
--

DROP TABLE IF EXISTS `Welcome_ic_self_employed_rel_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_self_employed_rel_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`fee_id`),
  KEY `Welcome_ic_self_employed_rel_fees_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_fees_5329f76d` (`fee_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_887743bd` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`),
  CONSTRAINT `fee_id_refs_ic_record_id_4078f825` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_fees`
--

LOCK TABLES `Welcome_ic_self_employed_rel_fees` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_self_employed_rel_images`
--

DROP TABLE IF EXISTS `Welcome_ic_self_employed_rel_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_self_employed_rel_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`image_id`),
  KEY `Welcome_ic_self_employed_rel_images_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_images_06df7330` (`image_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_c3762b0a` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`),
  CONSTRAINT `image_id_refs_nonmaterial_id_7ec8668d` FOREIGN KEY (`image_id`) REFERENCES `General_image` (`nonmaterial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_images`
--

LOCK TABLES `Welcome_ic_self_employed_rel_images` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_self_employed_rel_insurances`
--

DROP TABLE IF EXISTS `Welcome_ic_self_employed_rel_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_self_employed_rel_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_insurance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_insurance_id`),
  KEY `Welcome_ic_self_employed_rel_insurances_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_insurances_948dcf14` (`ic_insurance_id`),
  CONSTRAINT `ic_insurance_id_refs_ic_document_id_4800d0d4` FOREIGN KEY (`ic_insurance_id`) REFERENCES `Welcome_ic_insurance` (`ic_document_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4db1169b` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_insurances`
--

LOCK TABLES `Welcome_ic_self_employed_rel_insurances` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_insurances` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_self_employed_rel_licences`
--

DROP TABLE IF EXISTS `Welcome_ic_self_employed_rel_licences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_self_employed_rel_licences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_licence_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_licence_id`),
  KEY `Welcome_ic_self_employed_rel_licences_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_licences_36f9f36d` (`ic_licence_id`),
  CONSTRAINT `ic_licence_id_refs_ic_document_id_874c087d` FOREIGN KEY (`ic_licence_id`) REFERENCES `Welcome_ic_licence` (`ic_document_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_c9d6e611` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_licences`
--

LOCK TABLES `Welcome_ic_self_employed_rel_licences` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_stallholder`
--

DROP TABLE IF EXISTS `Welcome_ic_stallholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_stallholder` (
  `ic_self_employed_id` int(11) NOT NULL,
  `tent_type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ic_self_employed_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4245c133` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_stallholder`
--

LOCK TABLES `Welcome_ic_stallholder` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_stallholder` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_stallholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_type`
--

DROP TABLE IF EXISTS `Welcome_ic_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `Welcome_ic_type_410d0aac` (`parent_id`),
  KEY `Welcome_ic_type_329f6fb3` (`lft`),
  KEY `Welcome_ic_type_e763210f` (`rght`),
  KEY `Welcome_ic_type_ba470c4a` (`tree_id`),
  KEY `Welcome_ic_type_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_d03ad36e` FOREIGN KEY (`parent_id`) REFERENCES `Welcome_ic_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_type`
--

LOCK TABLES `Welcome_ic_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_type` VALUES (1,'Registre CI','',0,0,1,56,1,'iC_Record'),(2,'Forma de Pagament','',0,0,1,16,2,''),(3,'alta Soci CI','',2,4,3,10,1,'iC_Membership'),(4,'Alta de Membre','',1,1,2,17,1,''),(5,'alta Proj. Autoocupat','',2,4,11,14,1,'iC_Self_Employed'),(6,'Document CI','',1,1,18,31,1,'iC_Document'),(7,'alta Soci Coop. Individual','',3,3,4,5,1,'iC_Person_Membership'),(8,'alta Proj. Col·lectiu','',3,3,6,7,1,'iC_Project_Membership'),(9,'alta Proj. Públic','',3,3,8,9,1,''),(10,'alta Soci Afí Individual','',2,4,15,16,1,'iC_Akin_Membership'),(11,'alta Proj. Firaire','',3,5,12,13,1,'iC_Stallholder'),(13,'Contracte d\'Adreça','',2,6,19,24,1,'iC_Address_Contract'),(14,'Llicència d\'activitat','',2,6,25,26,1,'iC_Licence'),(15,'Assegurança soci','',2,6,27,28,1,'iC_Insurance'),(16,'Contracte Laboral','',2,6,29,30,1,'iC_Labor_Contract'),(17,'Quota','',1,1,32,49,1,'Fee'),(18,'quota d\'Alta','',2,17,33,38,1,'join_fee'),(19,'quota Trimestral','',2,17,39,48,1,'quarterly_fee'),(20,'pagament en Moneda Social','',2,26,9,10,2,''),(21,'pagament amb Hores de Treball','',2,26,13,14,2,''),(22,'pagament amb Criptomoneda','',1,2,2,3,2,''),(23,'pagament en Metàl·lic','',2,26,11,12,2,''),(24,'pagament per Transferència Bancària','',1,2,4,5,2,''),(25,'pagament fent Ingrés al Banc','',1,2,6,7,2,''),(26,'pagament presencial','',1,2,8,15,2,'face-to-face'),(27,'contracte de Lloguer','',3,13,20,21,1,''),(28,'contracte de Cessió','',3,13,22,23,1,''),(29,'quota 1T','',3,19,40,41,1,''),(30,'quota 2T','',3,19,42,43,1,''),(31,'quota 3T','',3,19,44,45,1,''),(32,'Sessió / Formació','',1,1,50,55,1,'Learn_Session'),(33,'reg Sessió d\'Acollida','',2,32,51,52,1,'welcome_session'),(34,'reg Sessió MonedaSocial','',2,32,53,54,1,'socialcoin_session'),(35,'quota alta Individual','',3,18,34,35,1,'(30_eco) individual'),(36,'quota alta Col·lectiva','',3,18,36,37,1,'(60_eco) collective'),(37,'quota 4T','',3,19,46,47,1,''),(38,'Tipus parada firaire','',1,1,74,81,1,'tent_type'),(39,'Sense Carpa','',2,38,75,76,1,''),(41,'Quota Avançada','',2,17,57,66,1,'advanced_fee'),(42,'Carpa metall','',2,38,77,78,1,''),(43,'Carpa fusta','',2,38,79,80,1,'');
/*!40000 ALTER TABLE `Welcome_ic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_learn_session`
--

DROP TABLE IF EXISTS `Welcome_learn_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_learn_session` (
  `ic_record_ptr_id` int(11) NOT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `duration` time NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_ptr_id`),
  KEY `Welcome_learn_session_c510079f` (`nonmaterial_id`),
  KEY `Welcome_learn_session_024adddb` (`facilitator_id`),
  KEY `Welcome_learn_session_3ac8a70a` (`address_id`),
  CONSTRAINT `address_id_refs_id_45bf8dc6` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `facilitator_id_refs_id_9f178a2c` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_record_ptr_id_refs_id_54767834` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_77877834` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session`
--

LOCK TABLES `Welcome_learn_session` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_learn_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_learn_session_assistants`
--

DROP TABLE IF EXISTS `Welcome_learn_session_assistants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_learn_session_assistants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `learn_session_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learn_session_id` (`learn_session_id`,`human_id`),
  KEY `Welcome_learn_session_assistants_4f40a5ce` (`learn_session_id`),
  KEY `Welcome_learn_session_assistants_6922ec88` (`human_id`),
  CONSTRAINT `learn_session_id_refs_ic_record_ptr_id_117f7e2c` FOREIGN KEY (`learn_session_id`) REFERENCES `Welcome_learn_session` (`ic_record_ptr_id`),
  CONSTRAINT `human_id_refs_id_b83e2682` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session_assistants`
--

LOCK TABLES `Welcome_learn_session_assistants` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session_assistants` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_learn_session_assistants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_payment_type`
--

DROP TABLE IF EXISTS `Welcome_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_payment_type` (
  `ic_type_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_type_id`),
  CONSTRAINT `ic_type_id_refs_id_5a59f5bc` FOREIGN KEY (`ic_type_id`) REFERENCES `Welcome_ic_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_payment_type`
--

LOCK TABLES `Welcome_payment_type` WRITE;
/*!40000 ALTER TABLE `Welcome_payment_type` DISABLE KEYS */;
INSERT INTO `Welcome_payment_type` VALUES (20),(21),(22),(23),(24),(25),(26);
/*!40000 ALTER TABLE `Welcome_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_project_accompaniment`
--

DROP TABLE IF EXISTS `Welcome_project_accompaniment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_project_accompaniment` (
  `ic_record_ptr_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `situation` longtext NOT NULL,
  `needs` longtext NOT NULL,
  `petitioner_id` int(11) DEFAULT NULL,
  `petition` longtext NOT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_ptr_id`),
  KEY `Welcome_project_accompaniment_6922ec88` (`human_id`),
  KEY `Welcome_project_accompaniment_45430575` (`petitioner_id`),
  KEY `Welcome_project_accompaniment_024adddb` (`facilitator_id`),
  CONSTRAINT `facilitator_id_refs_id_0227f432` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `human_id_refs_id_0227f432` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_record_ptr_id_refs_id_58f56a13` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `petitioner_id_refs_id_0227f432` FOREIGN KEY (`petitioner_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_project_accompaniment`
--

LOCK TABLES `Welcome_project_accompaniment` WRITE;
/*!40000 ALTER TABLE `Welcome_project_accompaniment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_project_accompaniment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add c- Tipus ',7,'add_type'),(20,'Can change c- Tipus ',7,'change_type'),(21,'Can delete c- Tipus ',7,'delete_type'),(22,'Can add H - Moneda',8,'add_currencies'),(23,'Can change H - Moneda',8,'change_currencies'),(24,'Can delete H - Moneda',8,'delete_currencies'),(25,'Can add F - IVA',9,'add_vats'),(26,'Can change F - IVA',9,'change_vats'),(27,'Can delete F - IVA',9,'delete_vats'),(28,'Can add A - Taula quotes',10,'add_tax'),(29,'Can change A - Taula quotes',10,'change_tax'),(30,'Can delete A - Taula quotes',10,'delete_tax'),(31,'Can add I - Cooperativa',11,'add_coop'),(32,'Can change I - Cooperativa',11,'change_coop'),(33,'Can delete I - Cooperativa',11,'delete_coop'),(34,'Can add company',12,'add_company'),(35,'Can change company',12,'change_company'),(36,'Can delete company',12,'delete_company'),(37,'Can add B - Client',13,'add_client'),(38,'Can change B - Client',13,'change_client'),(39,'Can delete B - Client',13,'delete_client'),(40,'Can add C - Proveïdor',14,'add_provider'),(41,'Can change C - Proveïdor',14,'change_provider'),(42,'Can delete C - Proveïdor',14,'delete_provider'),(43,'Can add D - Socia',15,'add_cooper'),(44,'Can change D - Socia',15,'change_cooper'),(45,'Can delete D - Socia',15,'delete_cooper'),(46,'Can add B - Els meus clients i proveïdors',15,'add_cooper_proxy_companies'),(47,'Can change B - Els meus clients i proveïdors',15,'change_cooper_proxy_companies'),(48,'Can delete B - Els meus clients i proveïdors',15,'delete_cooper_proxy_companies'),(49,'Can add L - Balanç projecte',15,'add_cooper_proxy_balance'),(50,'Can change L - Balanç projecte',15,'change_cooper_proxy_balance'),(51,'Can delete L - Balanç projecte',15,'delete_cooper_proxy_balance'),(52,'Can add G - Trimestres',16,'add_period'),(53,'Can change G - Trimestres',16,'change_period'),(54,'Can delete G - Trimestres',16,'delete_period'),(55,'Can add 01 - Factura Emesa',17,'add_sales_invoice'),(56,'Can change 01 - Factura Emesa',17,'change_sales_invoice'),(57,'Can delete 01 - Factura Emesa',17,'delete_sales_invoice'),(58,'Can add 02 - Factura Despesa',18,'add_purchases_invoice'),(59,'Can change 02 - Factura Despesa',18,'change_purchases_invoice'),(60,'Can delete 02 - Factura Despesa',18,'delete_purchases_invoice'),(61,'Can add Línia de factura emesa',19,'add_sales_line'),(62,'Can change Línia de factura emesa',19,'change_sales_line'),(63,'Can delete Línia de factura emesa',19,'delete_sales_line'),(64,'Can add Línia de factura despesa',20,'add_purchases_line'),(65,'Can change Línia de factura despesa',20,'change_purchases_line'),(66,'Can delete Línia de factura despesa',20,'delete_purchases_line'),(67,'Can add L - Abonament',21,'add_sales_movement'),(68,'Can change L - Abonament',21,'change_sales_movement'),(69,'Can delete L - Abonament',21,'delete_sales_movement'),(70,'Can add M - Reintegrament',22,'add_purchases_movement'),(71,'Can change M - Reintegrament',22,'change_purchases_movement'),(72,'Can delete M - Reintegrament',22,'delete_purchases_movement'),(73,'Can add 03 - Resultats',23,'add_period_close'),(74,'Can change 03 - Resultats',23,'change_period_close'),(75,'Can delete 03 - Resultats',23,'delete_period_close'),(76,'Can add K - Transaccions',15,'add_cooper_proxy_transactions'),(77,'Can change K - Transaccions',15,'change_cooper_proxy_transactions'),(78,'Can delete K - Transaccions',15,'delete_cooper_proxy_transactions'),(79,'Can add Pagament',24,'add_period_payment'),(80,'Can change Pagament',24,'change_period_payment'),(81,'Can delete Pagament',24,'delete_period_payment'),(82,'Can add E - Importar CSV (socies)',25,'add_csvimport'),(83,'Can change E - Importar CSV (socies)',25,'change_csvimport'),(84,'Can delete E - Importar CSV (socies)',25,'delete_csvimport'),(85,'Can add email',26,'add_email'),(86,'Can change email',26,'change_email'),(87,'Can delete email',26,'delete_email'),(88,'Can add J - Notificacions programades',27,'add_emailnotification'),(89,'Can change J - Notificacions programades',27,'change_emailnotification'),(90,'Can delete J - Notificacions programades',27,'delete_emailnotification'),(91,'Can add c- Tipus',31,'add_type'),(92,'Can change c- Tipus',31,'change_type'),(93,'Can delete c- Tipus',31,'delete_type'),(94,'Can add Tipus d\'entitat',32,'add_being_type'),(95,'Can change Tipus d\'entitat',32,'change_being_type'),(96,'Can delete Tipus d\'entitat',32,'delete_being_type'),(97,'Can add Humà',33,'add_human'),(98,'Can change Humà',33,'change_human'),(99,'Can delete Humà',33,'delete_human'),(100,'Can add Persona',34,'add_person'),(101,'Can change Persona',34,'change_person'),(102,'Can delete Persona',34,'delete_person'),(103,'Can add Projecte',35,'add_project'),(104,'Can change Projecte',35,'change_project'),(105,'Can delete Projecte',35,'delete_project'),(106,'Can add Tipus de Projecte',36,'add_project_type'),(107,'Can change Tipus de Projecte',36,'change_project_type'),(108,'Can delete Tipus de Projecte',36,'delete_project_type'),(109,'Can add Empresa',37,'add_company'),(110,'Can change Empresa',37,'change_company'),(111,'Can delete Empresa',37,'delete_company'),(112,'Can add Tipus d\'Empresa',38,'add_company_type'),(113,'Can change Tipus d\'Empresa',38,'change_company_type'),(114,'Can delete Tipus d\'Empresa',38,'delete_company_type'),(115,'Can add H_ofi',39,'add_rel_human_jobs'),(116,'Can change H_ofi',39,'change_rel_human_jobs'),(117,'Can delete H_ofi',39,'delete_rel_human_jobs'),(118,'Can add H_adr',40,'add_rel_human_addresses'),(119,'Can change H_adr',40,'change_rel_human_addresses'),(120,'Can delete H_adr',40,'delete_rel_human_addresses'),(121,'Can add H_reg',41,'add_rel_human_regions'),(122,'Can change H_reg',41,'change_rel_human_regions'),(123,'Can delete H_reg',41,'delete_rel_human_regions'),(124,'Can add H_rec',42,'add_rel_human_records'),(125,'Can change H_rec',42,'change_rel_human_records'),(126,'Can delete H_rec',42,'delete_rel_human_records'),(127,'Can add H_mat',43,'add_rel_human_materials'),(128,'Can change H_mat',43,'change_rel_human_materials'),(129,'Can delete H_mat',43,'delete_rel_human_materials'),(130,'Can add H_inm',44,'add_rel_human_nonmaterials'),(131,'Can change H_inm',44,'change_rel_human_nonmaterials'),(132,'Can delete H_inm',44,'delete_rel_human_nonmaterials'),(133,'Can add H_per',45,'add_rel_human_persons'),(134,'Can change H_per',45,'change_rel_human_persons'),(135,'Can delete H_per',45,'delete_rel_human_persons'),(136,'Can add H_pro',46,'add_rel_human_projects'),(137,'Can change H_pro',46,'change_rel_human_projects'),(138,'Can delete H_pro',46,'delete_rel_human_projects'),(139,'Can add H_emp',47,'add_rel_human_companies'),(140,'Can change H_emp',47,'change_rel_human_companies'),(141,'Can delete H_emp',47,'delete_rel_human_companies'),(142,'Can add Relació',48,'add_relation'),(143,'Can change Relació',48,'change_relation'),(144,'Can delete Relació',48,'delete_relation'),(145,'Can add Ofici',49,'add_job'),(146,'Can change Ofici',49,'change_job'),(147,'Can delete Ofici',49,'delete_job'),(148,'Can add Tipus d\'Espai',50,'add_space_type'),(149,'Can change Tipus d\'Espai',50,'change_space_type'),(150,'Can delete Tipus d\'Espai',50,'delete_space_type'),(151,'Can add Adreça',51,'add_address'),(152,'Can change Adreça',51,'change_address'),(153,'Can delete Adreça',51,'delete_address'),(154,'Can add Tipus d\'Adreça',52,'add_address_type'),(155,'Can change Tipus d\'Adreça',52,'change_address_type'),(156,'Can delete Tipus d\'Adreça',52,'delete_address_type'),(157,'Can add Regió',53,'add_region'),(158,'Can change Regió',53,'change_region'),(159,'Can delete Regió',53,'delete_region'),(160,'Can add Tipus de Regió',54,'add_region_type'),(161,'Can change Tipus de Regió',54,'change_region_type'),(162,'Can delete Tipus de Regió',54,'delete_region_type'),(163,'Can add Tipus d\'Obra',55,'add_artwork_type'),(164,'Can change Tipus d\'Obra',55,'change_artwork_type'),(165,'Can delete Tipus d\'Obra',55,'delete_artwork_type'),(166,'Can add N_rec',56,'add_rel_nonmaterial_records'),(167,'Can change N_rec',56,'change_rel_nonmaterial_records'),(168,'Can delete N_rec',56,'delete_rel_nonmaterial_records'),(169,'Can add N_adr',57,'add_rel_nonmaterial_addresses'),(170,'Can change N_adr',57,'change_rel_nonmaterial_addresses'),(171,'Can delete N_adr',57,'delete_rel_nonmaterial_addresses'),(172,'Can add N_ofi',58,'add_rel_nonmaterial_jobs'),(173,'Can change N_ofi',58,'change_rel_nonmaterial_jobs'),(174,'Can delete N_ofi',58,'delete_rel_nonmaterial_jobs'),(175,'Can add N_mat',59,'add_rel_nonmaterial_nonmaterials'),(176,'Can change N_mat',59,'change_rel_nonmaterial_nonmaterials'),(177,'Can delete N_mat',59,'delete_rel_nonmaterial_nonmaterials'),(178,'Can add Obra Inmaterial',60,'add_nonmaterial'),(179,'Can change Obra Inmaterial',60,'change_nonmaterial'),(180,'Can delete Obra Inmaterial',60,'delete_nonmaterial'),(181,'Can add Tipus d\'obra Inmaterial',61,'add_nonmaterial_type'),(182,'Can change Tipus d\'obra Inmaterial',61,'change_nonmaterial_type'),(183,'Can delete Tipus d\'obra Inmaterial',61,'delete_nonmaterial_type'),(184,'Can add Imatge',62,'add_image'),(185,'Can change Imatge',62,'change_image'),(186,'Can delete Imatge',62,'delete_image'),(187,'Can add M_inm',63,'add_rel_material_nonmaterials'),(188,'Can change M_inm',63,'change_rel_material_nonmaterials'),(189,'Can delete M_inm',63,'delete_rel_material_nonmaterials'),(190,'Can add M_rec',64,'add_rel_material_records'),(191,'Can change M_rec',64,'change_rel_material_records'),(192,'Can delete M_rec',64,'delete_rel_material_records'),(193,'Can add M_adr',65,'add_rel_material_addresses'),(194,'Can change M_adr',65,'change_rel_material_addresses'),(195,'Can delete M_adr',65,'delete_rel_material_addresses'),(196,'Can add M_mat',66,'add_rel_material_materials'),(197,'Can change M_mat',66,'change_rel_material_materials'),(198,'Can delete M_mat',66,'delete_rel_material_materials'),(199,'Can add M_ofi',67,'add_rel_material_jobs'),(200,'Can change M_ofi',67,'change_rel_material_jobs'),(201,'Can delete M_ofi',67,'delete_rel_material_jobs'),(202,'Can add Obra Material',68,'add_material'),(203,'Can change Obra Material',68,'change_material'),(204,'Can delete Obra Material',68,'delete_material'),(205,'Can add Tipus d\'obra Material',69,'add_material_type'),(206,'Can change Tipus d\'obra Material',69,'change_material_type'),(207,'Can delete Tipus d\'obra Material',69,'delete_material_type'),(208,'Can add Actiu',70,'add_asset'),(209,'Can change Actiu',70,'change_asset'),(210,'Can delete Actiu',70,'delete_asset'),(211,'Can add Unitat',71,'add_unit'),(212,'Can change Unitat',71,'change_unit'),(213,'Can delete Unitat',71,'delete_unit'),(214,'Can add Tipus d\'Unitat',72,'add_unit_type'),(215,'Can change Tipus d\'Unitat',72,'change_unit_type'),(216,'Can delete Tipus d\'Unitat',72,'delete_unit_type'),(217,'Can add Registre',73,'add_record'),(218,'Can change Registre',73,'change_record'),(219,'Can delete Registre',73,'delete_record'),(220,'Can add Tipus de Registre',74,'add_record_type'),(221,'Can change Tipus de Registre',74,'change_record_type'),(222,'Can delete Tipus de Registre',74,'delete_record_type'),(223,'Can add Equivalencia entre Unitats',75,'add_unitratio'),(224,'Can change Equivalencia entre Unitats',75,'change_unitratio'),(225,'Can delete Equivalencia entre Unitats',75,'delete_unitratio'),(226,'Can add Compte CES',76,'add_accountces'),(227,'Can change Compte CES',76,'change_accountces'),(228,'Can delete Compte CES',76,'delete_accountces'),(229,'Can add Compte Bancari',77,'add_accountbank'),(230,'Can change Compte Bancari',77,'change_accountbank'),(231,'Can delete Compte Bancari',77,'delete_accountbank'),(232,'Can add Compte Criptomoneda',78,'add_accountcrypto'),(233,'Can change Compte Criptomoneda',78,'change_accountcrypto'),(234,'Can delete Compte Criptomoneda',78,'delete_accountcrypto'),(235,'Can add Registre CI',79,'add_ic_record'),(236,'Can change Registre CI',79,'change_ic_record'),(237,'Can delete Registre CI',79,'delete_ic_record'),(238,'Can add c- Tipus CI',80,'add_ic_type'),(239,'Can change c- Tipus CI',80,'change_ic_type'),(240,'Can delete c- Tipus CI',80,'delete_ic_type'),(241,'Can add Tipus de Registre CI',81,'add_ic_record_type'),(242,'Can change Tipus de Registre CI',81,'change_ic_record_type'),(243,'Can delete Tipus de Registre CI',81,'delete_ic_record_type'),(244,'Can add Quota',82,'add_fee'),(245,'Can change Quota',82,'change_fee'),(246,'Can delete Quota',82,'delete_fee'),(247,'Can add Forma de pagament',83,'add_payment_type'),(248,'Can change Forma de pagament',83,'change_payment_type'),(249,'Can delete Forma de pagament',83,'delete_payment_type'),(250,'Can add Alta de Soci Afí CI',84,'add_ic_akin_membership'),(251,'Can change Alta de Soci Afí CI',84,'change_ic_akin_membership'),(252,'Can delete Alta de Soci Afí CI',84,'delete_ic_akin_membership'),(253,'Can add Alta de Soci CI',85,'add_ic_membership'),(254,'Can change Alta de Soci CI',85,'change_ic_membership'),(255,'Can delete Alta de Soci CI',85,'delete_ic_membership'),(256,'Can add Alta de Soci Cooperatiu individual CI',86,'add_ic_person_membership'),(257,'Can change Alta de Soci Cooperatiu individual CI',86,'change_ic_person_membership'),(258,'Can delete Alta de Soci Cooperatiu individual CI',86,'delete_ic_person_membership'),(259,'Can add Alta de Projecte Col·lectiu CI',87,'add_ic_project_membership'),(260,'Can change Alta de Projecte Col·lectiu CI',87,'change_ic_project_membership'),(261,'Can delete Alta de Projecte Col·lectiu CI',87,'delete_ic_project_membership'),(262,'Can add Alta Proj.Autoocupat',88,'add_ic_self_employed'),(263,'Can change Alta Proj.Autoocupat',88,'change_ic_self_employed'),(264,'Can delete Alta Proj.Autoocupat',88,'delete_ic_self_employed'),(265,'Can add Alta Proj.Autoocupat Firaire',89,'add_ic_stallholder'),(266,'Can change Alta Proj.Autoocupat Firaire',89,'change_ic_stallholder'),(267,'Can delete Alta Proj.Autoocupat Firaire',89,'delete_ic_stallholder'),(268,'Can add Sessió formativa',90,'add_learn_session'),(269,'Can change Sessió formativa',90,'change_learn_session'),(270,'Can delete Sessió formativa',90,'delete_learn_session'),(271,'Can add Expedient Projecte Productiu',91,'add_project_accompaniment'),(272,'Can change Expedient Projecte Productiu',91,'change_project_accompaniment'),(273,'Can delete Expedient Projecte Productiu',91,'delete_project_accompaniment'),(274,'Can add i c_ document',92,'add_ic_document'),(275,'Can change i c_ document',92,'change_ic_document'),(276,'Can delete i c_ document',92,'delete_ic_document'),(277,'Can add Tipus de Document CI',93,'add_ic_document_type'),(278,'Can change Tipus de Document CI',93,'change_ic_document_type'),(279,'Can delete Tipus de Document CI',93,'delete_ic_document_type'),(280,'Can add Contracte Laboral CI',94,'add_ic_labor_contract'),(281,'Can change Contracte Laboral CI',94,'change_ic_labor_contract'),(282,'Can delete Contracte Laboral CI',94,'delete_ic_labor_contract'),(283,'Can add Contracte d\'Adreça CI',95,'add_ic_address_contract'),(284,'Can change Contracte d\'Adreça CI',95,'change_ic_address_contract'),(285,'Can delete Contracte d\'Adreça CI',95,'delete_ic_address_contract'),(286,'Can add Assegurança soci CI',96,'add_ic_insurance'),(287,'Can change Assegurança soci CI',96,'change_ic_insurance'),(288,'Can delete Assegurança soci CI',96,'delete_ic_insurance'),(289,'Can add Llicència soci CI',97,'add_ic_licence'),(290,'Can change Llicència soci CI',97,'change_ic_licence'),(291,'Can delete Llicència soci CI',97,'delete_ic_licence'),(292,'Can add Alta Membre: procés activació',98,'add_registrationprofile'),(293,'Can change Alta Membre: procés activació',98,'change_registrationprofile'),(294,'Can delete Alta Membre: procés activació',98,'delete_registrationprofile'),(295,'Can add FORMULARI AUTOOCUPATS PRESENCIAL',33,'add_human_proxy'),(296,'Can change FORMULARI AUTOOCUPATS PRESENCIAL',33,'change_human_proxy'),(297,'Can delete FORMULARI AUTOOCUPATS PRESENCIAL',33,'delete_human_proxy'),(298,'Can add ASSITÈNCIA SESSIÓ ACOLLIDA',90,'add_learn_session_proxy'),(299,'Can change ASSITÈNCIA SESSIÓ ACOLLIDA',90,'change_learn_session_proxy'),(300,'Can delete ASSITÈNCIA SESSIÓ ACOLLIDA',90,'delete_learn_session_proxy'),(301,'Can add cron job log',101,'add_cronjoblog'),(302,'Can change cron job log',101,'change_cronjoblog'),(303,'Can delete cron job log',101,'delete_cronjoblog'),(304,'Can add csv import',102,'add_csvimport'),(305,'Can change csv import',102,'change_csvimport'),(306,'Can delete csv import',102,'delete_csvimport'),(307,'Can add import model',103,'add_importmodel'),(308,'Can change import model',103,'change_importmodel'),(309,'Can delete import model',103,'delete_importmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$pDIvzELIX7HT$wUeAo9fp3RwEP+jqVR0iMUtADMJD9JRxunw/W4HbYBQ=','2014-09-16 03:43:34',1,'admin','','','informatica@cooperativaintegral.cat',1,1,'2014-09-16 03:43:34');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_csvimport`
--

DROP TABLE IF EXISTS `csvimport_csvimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_csvimport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `field_list` varchar(255) NOT NULL,
  `upload_file` varchar(100) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `encoding` varchar(32) NOT NULL,
  `upload_method` varchar(50) NOT NULL,
  `error_log` longtext NOT NULL,
  `import_date` date NOT NULL,
  `import_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_csvimport`
--

LOCK TABLES `csvimport_csvimport` WRITE;
/*!40000 ALTER TABLE `csvimport_csvimport` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_csvimport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csvimport_importmodel`
--

DROP TABLE IF EXISTS `csvimport_importmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csvimport_importmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `csvimport_id` int(11) NOT NULL,
  `numeric_id` int(10) unsigned NOT NULL,
  `natural_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `csvimport_importmodel_367c7ba0` (`csvimport_id`),
  CONSTRAINT `csvimport_id_refs_id_a4b08305` FOREIGN KEY (`csvimport_id`) REFERENCES `csvimport_csvimport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_importmodel`
--

LOCK TABLES `csvimport_importmodel` WRITE;
/*!40000 ALTER TABLE `csvimport_importmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_importmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'c- Tipus ','Invoices','type'),(8,'H - Moneda','Invoices','currencies'),(9,'F - IVA','Invoices','vats'),(10,'A - Taula quotes','Invoices','tax'),(11,'I - Cooperativa','Invoices','coop'),(12,'company','Invoices','company'),(13,'B - Client','Invoices','client'),(14,'C - Proveïdor','Invoices','provider'),(15,'D - Socia','Invoices','cooper'),(16,'G - Trimestres','Invoices','period'),(17,'01 - Factura Emesa','Invoices','sales_invoice'),(18,'02 - Factura Despesa','Invoices','purchases_invoice'),(19,'Línia de factura emesa','Invoices','sales_line'),(20,'Línia de factura despesa','Invoices','purchases_line'),(21,'L - Abonament','Invoices','sales_movement'),(22,'M - Reintegrament','Invoices','purchases_movement'),(23,'03 - Resultats','Invoices','period_close'),(24,'Pagament','Invoices','period_payment'),(25,'E - Importar CSV (socies)','Invoices','csvimport'),(26,'email','Invoices','email'),(27,'J - Notificacions programades','Invoices','emailnotification'),(28,'K - Transaccions','Invoices','cooper_proxy_transactions'),(29,'L - Balanç projecte','Invoices','cooper_proxy_balance'),(30,'B - Els meus clients i proveïdors','Invoices','cooper_proxy_companies'),(31,'c- Tipus','General','type'),(32,'Tipus d\'entitat','General','being_type'),(33,'Humà','General','human'),(34,'Persona','General','person'),(35,'Projecte','General','project'),(36,'Tipus de Projecte','General','project_type'),(37,'Empresa','General','company'),(38,'Tipus d\'Empresa','General','company_type'),(39,'H_ofi','General','rel_human_jobs'),(40,'H_adr','General','rel_human_addresses'),(41,'H_reg','General','rel_human_regions'),(42,'H_rec','General','rel_human_records'),(43,'H_mat','General','rel_human_materials'),(44,'H_inm','General','rel_human_nonmaterials'),(45,'H_per','General','rel_human_persons'),(46,'H_pro','General','rel_human_projects'),(47,'H_emp','General','rel_human_companies'),(48,'Relació','General','relation'),(49,'Ofici','General','job'),(50,'Tipus d\'Espai','General','space_type'),(51,'Adreça','General','address'),(52,'Tipus d\'Adreça','General','address_type'),(53,'Regió','General','region'),(54,'Tipus de Regió','General','region_type'),(55,'Tipus d\'Obra','General','artwork_type'),(56,'N_rec','General','rel_nonmaterial_records'),(57,'N_adr','General','rel_nonmaterial_addresses'),(58,'N_ofi','General','rel_nonmaterial_jobs'),(59,'N_mat','General','rel_nonmaterial_nonmaterials'),(60,'Obra Inmaterial','General','nonmaterial'),(61,'Tipus d\'obra Inmaterial','General','nonmaterial_type'),(62,'Imatge','General','image'),(63,'M_inm','General','rel_material_nonmaterials'),(64,'M_rec','General','rel_material_records'),(65,'M_adr','General','rel_material_addresses'),(66,'M_mat','General','rel_material_materials'),(67,'M_ofi','General','rel_material_jobs'),(68,'Obra Material','General','material'),(69,'Tipus d\'obra Material','General','material_type'),(70,'Actiu','General','asset'),(71,'Unitat','General','unit'),(72,'Tipus d\'Unitat','General','unit_type'),(73,'Registre','General','record'),(74,'Tipus de Registre','General','record_type'),(75,'Equivalencia entre Unitats','General','unitratio'),(76,'Compte CES','General','accountces'),(77,'Compte Bancari','General','accountbank'),(78,'Compte Criptomoneda','General','accountcrypto'),(79,'Registre CI','Welcome','ic_record'),(80,'c- Tipus CI','Welcome','ic_type'),(81,'Tipus de Registre CI','Welcome','ic_record_type'),(82,'Quota','Welcome','fee'),(83,'Forma de pagament','Welcome','payment_type'),(84,'Alta de Soci Afí CI','Welcome','ic_akin_membership'),(85,'Alta de Soci CI','Welcome','ic_membership'),(86,'Alta de Soci Cooperatiu individual CI','Welcome','ic_person_membership'),(87,'Alta de Projecte Col·lectiu CI','Welcome','ic_project_membership'),(88,'Alta Proj.Autoocupat','Welcome','ic_self_employed'),(89,'Alta Proj.Autoocupat Firaire','Welcome','ic_stallholder'),(90,'Sessió formativa','Welcome','learn_session'),(91,'Expedient Projecte Productiu','Welcome','project_accompaniment'),(92,'i c_ document','Welcome','ic_document'),(93,'Tipus de Document CI','Welcome','ic_document_type'),(94,'Contracte Laboral CI','Welcome','ic_labor_contract'),(95,'Contracte d\'Adreça CI','Welcome','ic_address_contract'),(96,'Assegurança soci CI','Welcome','ic_insurance'),(97,'Llicència soci CI','Welcome','ic_licence'),(98,'Alta Membre: procés activació','public_form','registrationprofile'),(99,'FORMULARI AUTOOCUPATS PRESENCIAL','public_form','human_proxy'),(100,'ASSITÈNCIA SESSIÓ ACOLLIDA','public_form','learn_session_proxy'),(101,'cron job log','django_cron','cronjoblog'),(102,'csv import','csvimport','csvimport'),(103,'import model','csvimport','importmodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_cron_cronjoblog`
--

DROP TABLE IF EXISTS `django_cron_cronjoblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_cron_cronjoblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `message` longtext NOT NULL,
  `ran_at_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_cron_cronjoblog_09bb5fb3` (`code`),
  KEY `django_cron_cronjoblog_66db471f` (`start_time`),
  KEY `django_cron_cronjoblog_a3457057` (`end_time`),
  KEY `django_cron_cronjoblog_164a3ee7` (`ran_at_time`),
  KEY `django_cron_cronjoblog_63e2740d` (`code`,`is_success`,`ran_at_time`),
  KEY `django_cron_cronjoblog_1fe0e40b` (`code`,`start_time`,`ran_at_time`),
  KEY `django_cron_cronjoblog_495fb183` (`code`,`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_cron_cronjoblog`
--

LOCK TABLES `django_cron_cronjoblog` WRITE;
/*!40000 ALTER TABLE `django_cron_cronjoblog` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_cron_cronjoblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_form_registrationprofile`
--

DROP TABLE IF EXISTS `public_form_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_form_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  `person_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `record_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `person_id` (`person_id`),
  KEY `public_form_registrationprofile_37952554` (`project_id`),
  KEY `public_form_registrationprofile_ac580b38` (`record_type_id`),
  CONSTRAINT `project_id_refs_human_id_62b3141c` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `person_id_refs_human_id_ae1bbdf6` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  CONSTRAINT `record_type_id_refs_ic_type_id_576eb0fe` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`),
  CONSTRAINT `user_id_refs_id_f6d62eb5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_form_registrationprofile`
--

LOCK TABLES `public_form_registrationprofile` WRITE;
/*!40000 ALTER TABLE `public_form_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_form_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-16  5:59:49
