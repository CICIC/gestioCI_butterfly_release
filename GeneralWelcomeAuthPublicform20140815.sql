CREATE DATABASE  IF NOT EXISTS `gestioCI_butterfly` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `gestioCI_butterfly`;
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gestioCI_butterfly
-- ------------------------------------------------------
-- Server version	5.5.35-0+wheezy1

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
-- Table structure for table `General_address_type`
--

DROP TABLE IF EXISTS `General_address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_address_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`),
  CONSTRAINT `space_type_id_refs_typ_id_9112582a` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `General_region`
--

DROP TABLE IF EXISTS `General_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `region_type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_region`
--

LOCK TABLES `General_region` WRITE;
/*!40000 ALTER TABLE `General_region` DISABLE KEYS */;
INSERT INTO `General_region` VALUES (1,'Països Catalans',40,NULL,'',1,6,1,0),(2,'Catalunya',41,1,'',2,5,1,1),(3,'Barcelonès',43,2,'',3,4,1,2);
/*!40000 ALTER TABLE `General_region` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add migration history',7,'add_migrationhistory'),(20,'Can change migration history',7,'change_migrationhistory'),(21,'Can delete migration history',7,'delete_migrationhistory'),(22,'Can add csv import',8,'add_csvimport'),(23,'Can change csv import',8,'change_csvimport'),(24,'Can delete csv import',8,'delete_csvimport'),(25,'Can add import model',9,'add_importmodel'),(26,'Can change import model',9,'change_importmodel'),(27,'Can delete import model',9,'delete_importmodel'),(28,'Can add H - Moneda',10,'add_currencies'),(29,'Can change H - Moneda',10,'change_currencies'),(30,'Can delete H - Moneda',10,'delete_currencies'),(31,'Can add F - IVA',11,'add_vats'),(32,'Can change F - IVA',11,'change_vats'),(33,'Can delete F - IVA',11,'delete_vats'),(34,'Can add A - Taula quotes',12,'add_tax'),(35,'Can change A - Taula quotes',12,'change_tax'),(36,'Can delete A - Taula quotes',12,'delete_tax'),(37,'Can add I - Cooperativa',13,'add_coop'),(38,'Can change I - Cooperativa',13,'change_coop'),(39,'Can delete I - Cooperativa',13,'delete_coop'),(40,'Can add company',14,'add_company'),(41,'Can change company',14,'change_company'),(42,'Can delete company',14,'delete_company'),(43,'Can add B - Client',15,'add_client'),(44,'Can change B - Client',15,'change_client'),(45,'Can delete B - Client',15,'delete_client'),(46,'Can add C - Proveïdor',16,'add_provider'),(47,'Can change C - Proveïdor',16,'change_provider'),(48,'Can delete C - Proveïdor',16,'delete_provider'),(49,'Can add D - Socia',17,'add_cooper'),(50,'Can change D - Socia',17,'change_cooper'),(51,'Can delete D - Socia',17,'delete_cooper'),(52,'Can add B - Els meus clients i proveïdors',17,'add_cooper_proxy_companies'),(53,'Can change B - Els meus clients i proveïdors',17,'change_cooper_proxy_companies'),(54,'Can delete B - Els meus clients i proveïdors',17,'delete_cooper_proxy_companies'),(55,'Can add L - Balanç projecte',17,'add_cooper_proxy_balance'),(56,'Can change L - Balanç projecte',17,'change_cooper_proxy_balance'),(57,'Can delete L - Balanç projecte',17,'delete_cooper_proxy_balance'),(58,'Can add G - Trimestres',18,'add_period'),(59,'Can change G - Trimestres',18,'change_period'),(60,'Can delete G - Trimestres',18,'delete_period'),(61,'Can add 01 - Factura Emesa',19,'add_sales_invoice'),(62,'Can change 01 - Factura Emesa',19,'change_sales_invoice'),(63,'Can delete 01 - Factura Emesa',19,'delete_sales_invoice'),(64,'Can add 02 - Factura Despesa',20,'add_purchases_invoice'),(65,'Can change 02 - Factura Despesa',20,'change_purchases_invoice'),(66,'Can delete 02 - Factura Despesa',20,'delete_purchases_invoice'),(67,'Can add Línia de factura emesa',21,'add_sales_line'),(68,'Can change Línia de factura emesa',21,'change_sales_line'),(69,'Can delete Línia de factura emesa',21,'delete_sales_line'),(70,'Can add Línia de factura despesa',22,'add_purchases_line'),(71,'Can change Línia de factura despesa',22,'change_purchases_line'),(72,'Can delete Línia de factura despesa',22,'delete_purchases_line'),(73,'Can add L - Abonament',23,'add_sales_movement'),(74,'Can change L - Abonament',23,'change_sales_movement'),(75,'Can delete L - Abonament',23,'delete_sales_movement'),(76,'Can add M - Reintegrament',24,'add_purchases_movement'),(77,'Can change M - Reintegrament',24,'change_purchases_movement'),(78,'Can delete M - Reintegrament',24,'delete_purchases_movement'),(79,'Can add 03 - Resultats',25,'add_period_close'),(80,'Can change 03 - Resultats',25,'change_period_close'),(81,'Can delete 03 - Resultats',25,'delete_period_close'),(82,'Can add K - Transaccions',17,'add_cooper_proxy_transactions'),(83,'Can change K - Transaccions',17,'change_cooper_proxy_transactions'),(84,'Can delete K - Transaccions',17,'delete_cooper_proxy_transactions'),(85,'Can add Pagament',26,'add_period_payment'),(86,'Can change Pagament',26,'change_period_payment'),(87,'Can delete Pagament',26,'delete_period_payment'),(88,'Can add E - Importar CSV (socies)',27,'add_csvimport'),(89,'Can change E - Importar CSV (socies)',27,'change_csvimport'),(90,'Can delete E - Importar CSV (socies)',27,'delete_csvimport'),(91,'Can add email',28,'add_email'),(92,'Can change email',28,'change_email'),(93,'Can delete email',28,'delete_email'),(94,'Can add J - Notificacions programades',29,'add_emailnotification'),(95,'Can change J - Notificacions programades',29,'change_emailnotification'),(96,'Can delete J - Notificacions programades',29,'delete_emailnotification'),(100,'Can add c- Tipus',34,'add_type'),(101,'Can change c- Tipus',34,'change_type'),(102,'Can delete c- Tipus',34,'delete_type'),(103,'Can add Tipus d\'entitat',35,'add_being_type'),(104,'Can change Tipus d\'entitat',35,'change_being_type'),(105,'Can delete Tipus d\'entitat',35,'delete_being_type'),(106,'Can add Humà',36,'add_human'),(107,'Can change Humà',36,'change_human'),(108,'Can delete Humà',36,'delete_human'),(109,'Can add Persona',37,'add_person'),(110,'Can change Persona',37,'change_person'),(111,'Can delete Persona',37,'delete_person'),(112,'Can add Projecte',38,'add_project'),(113,'Can change Projecte',38,'change_project'),(114,'Can delete Projecte',38,'delete_project'),(115,'Can add Tipus de Projecte',39,'add_project_type'),(116,'Can change Tipus de Projecte',39,'change_project_type'),(117,'Can delete Tipus de Projecte',39,'delete_project_type'),(118,'Can add Empresa',40,'add_company'),(119,'Can change Empresa',40,'change_company'),(120,'Can delete Empresa',40,'delete_company'),(121,'Can add Tipus d\'Empresa',41,'add_company_type'),(122,'Can change Tipus d\'Empresa',41,'change_company_type'),(123,'Can delete Tipus d\'Empresa',41,'delete_company_type'),(124,'Can add h_ofi',42,'add_rel_human_jobs'),(125,'Can change h_ofi',42,'change_rel_human_jobs'),(126,'Can delete h_ofi',42,'delete_rel_human_jobs'),(127,'Can add h_adr',43,'add_rel_human_addresses'),(128,'Can change h_adr',43,'change_rel_human_addresses'),(129,'Can delete h_adr',43,'delete_rel_human_addresses'),(130,'Can add h_reg',44,'add_rel_human_regions'),(131,'Can change h_reg',44,'change_rel_human_regions'),(132,'Can delete h_reg',44,'delete_rel_human_regions'),(133,'Can add h_rec',45,'add_rel_human_records'),(134,'Can change h_rec',45,'change_rel_human_records'),(135,'Can delete h_rec',45,'delete_rel_human_records'),(136,'Can add h_mat',46,'add_rel_human_materials'),(137,'Can change h_mat',46,'change_rel_human_materials'),(138,'Can delete h_mat',46,'delete_rel_human_materials'),(139,'Can add h_inm',47,'add_rel_human_nonmaterials'),(140,'Can change h_inm',47,'change_rel_human_nonmaterials'),(141,'Can delete h_inm',47,'delete_rel_human_nonmaterials'),(142,'Can add h_per',48,'add_rel_human_persons'),(143,'Can change h_per',48,'change_rel_human_persons'),(144,'Can delete h_per',48,'delete_rel_human_persons'),(145,'Can add h_pro',49,'add_rel_human_projects'),(146,'Can change h_pro',49,'change_rel_human_projects'),(147,'Can delete h_pro',49,'delete_rel_human_projects'),(148,'Can add h_emp',50,'add_rel_human_companies'),(149,'Can change h_emp',50,'change_rel_human_companies'),(150,'Can delete h_emp',50,'delete_rel_human_companies'),(151,'Can add m_inm',51,'add_rel_material_nonmaterials'),(152,'Can change m_inm',51,'change_rel_material_nonmaterials'),(153,'Can delete m_inm',51,'delete_rel_material_nonmaterials'),(154,'Can add m_rec',52,'add_rel_material_records'),(155,'Can change m_rec',52,'change_rel_material_records'),(156,'Can delete m_rec',52,'delete_rel_material_records'),(157,'Can add m_adr',53,'add_rel_material_addresses'),(158,'Can change m_adr',53,'change_rel_material_addresses'),(159,'Can delete m_adr',53,'delete_rel_material_addresses'),(163,'Can add Relació',55,'add_relation'),(164,'Can change Relació',55,'change_relation'),(165,'Can delete Relació',55,'delete_relation'),(166,'Can add Ofici',56,'add_job'),(167,'Can change Ofici',56,'change_job'),(168,'Can delete Ofici',56,'delete_job'),(169,'Can add Tipus d\'Espai',57,'add_space_type'),(170,'Can change Tipus d\'Espai',57,'change_space_type'),(171,'Can delete Tipus d\'Espai',57,'delete_space_type'),(172,'Can add Adreça',58,'add_address'),(173,'Can change Adreça',58,'change_address'),(174,'Can delete Adreça',58,'delete_address'),(175,'Can add Tipus d\'Adreça',59,'add_address_type'),(176,'Can change Tipus d\'Adreça',59,'change_address_type'),(177,'Can delete Tipus d\'Adreça',59,'delete_address_type'),(178,'Can add Regió',60,'add_region'),(179,'Can change Regió',60,'change_region'),(180,'Can delete Regió',60,'delete_region'),(181,'Can add Tipus de Regió',61,'add_region_type'),(182,'Can change Tipus de Regió',61,'change_region_type'),(183,'Can delete Tipus de Regió',61,'delete_region_type'),(184,'Can add Tipus d\'Obra',62,'add_artwork_type'),(185,'Can change Tipus d\'Obra',62,'change_artwork_type'),(186,'Can delete Tipus d\'Obra',62,'delete_artwork_type'),(187,'Can add Obra Inmaterial',63,'add_nonmaterial'),(188,'Can change Obra Inmaterial',63,'change_nonmaterial'),(189,'Can delete Obra Inmaterial',63,'delete_nonmaterial'),(190,'Can add Tipus d\'obra Inmaterial',64,'add_nonmaterial_type'),(191,'Can change Tipus d\'obra Inmaterial',64,'change_nonmaterial_type'),(192,'Can delete Tipus d\'obra Inmaterial',64,'delete_nonmaterial_type'),(193,'Can add Imatge',65,'add_image'),(194,'Can change Imatge',65,'change_image'),(195,'Can delete Imatge',65,'delete_image'),(196,'Can add Obra Material',66,'add_material'),(197,'Can change Obra Material',66,'change_material'),(198,'Can delete Obra Material',66,'delete_material'),(199,'Can add Tipus d\'obra Material',67,'add_material_type'),(200,'Can change Tipus d\'obra Material',67,'change_material_type'),(201,'Can delete Tipus d\'obra Material',67,'delete_material_type'),(202,'Can add Actiu',68,'add_asset'),(203,'Can change Actiu',68,'change_asset'),(204,'Can delete Actiu',68,'delete_asset'),(205,'Can add Registre',69,'add_record'),(206,'Can change Registre',69,'change_record'),(207,'Can delete Registre',69,'delete_record'),(208,'Can add Tipus de Registre',70,'add_record_type'),(209,'Can change Tipus de Registre',70,'change_record_type'),(210,'Can delete Tipus de Registre',70,'delete_record_type'),(211,'Can add Unitat',71,'add_unit'),(212,'Can change Unitat',71,'change_unit'),(213,'Can delete Unitat',71,'delete_unit'),(214,'Can add Tipus d\'Unitat',72,'add_unit_type'),(215,'Can change Tipus d\'Unitat',72,'change_unit_type'),(216,'Can delete Tipus d\'Unitat',72,'delete_unit_type'),(217,'Can add Equivalencia entre Unitats',73,'add_unitratio'),(218,'Can change Equivalencia entre Unitats',73,'change_unitratio'),(219,'Can delete Equivalencia entre Unitats',73,'delete_unitratio'),(220,'Can add Compte CES',74,'add_accountces'),(221,'Can change Compte CES',74,'change_accountces'),(222,'Can delete Compte CES',74,'delete_accountces'),(223,'Can add Compte Bancari',75,'add_accountbank'),(224,'Can change Compte Bancari',75,'change_accountbank'),(225,'Can delete Compte Bancari',75,'delete_accountbank'),(226,'Can add Compte Criptomoneda',76,'add_accountcrypto'),(227,'Can change Compte Criptomoneda',76,'change_accountcrypto'),(228,'Can delete Compte Criptomoneda',76,'delete_accountcrypto'),(229,'Can add Registre CI',77,'add_ic_record'),(230,'Can change Registre CI',77,'change_ic_record'),(231,'Can delete Registre CI',77,'delete_ic_record'),(232,'Can add Alta de Soci CI',78,'add_ic_membership'),(233,'Can change Alta de Soci CI',78,'change_ic_membership'),(234,'Can delete Alta de Soci CI',78,'delete_ic_membership'),(235,'Can add Soci Autoocupat',79,'add_ic_self_employed'),(236,'Can change Soci Autoocupat',79,'change_ic_self_employed'),(237,'Can delete Soci Autoocupat',79,'delete_ic_self_employed'),(238,'Can add Soci Firaire',80,'add_ic_stallholder'),(239,'Can change Soci Firaire',80,'change_ic_stallholder'),(240,'Can delete Soci Firaire',80,'delete_ic_stallholder'),(241,'Can add Sessió formativa',81,'add_learn_session'),(242,'Can change Sessió formativa',81,'change_learn_session'),(243,'Can delete Sessió formativa',81,'delete_learn_session'),(244,'Can add Expedient Projecte Productiu',82,'add_project_accompaniment'),(245,'Can change Expedient Projecte Productiu',82,'change_project_accompaniment'),(246,'Can delete Expedient Projecte Productiu',82,'delete_project_accompaniment'),(247,'Can add Quota',83,'add_fee'),(248,'Can change Quota',83,'change_fee'),(249,'Can delete Quota',83,'delete_fee'),(253,'Can add i c_ document',85,'add_ic_document'),(254,'Can change i c_ document',85,'change_ic_document'),(255,'Can delete i c_ document',85,'delete_ic_document'),(256,'Can add Tipus de Document CI',86,'add_ic_document_type'),(257,'Can change Tipus de Document CI',86,'change_ic_document_type'),(258,'Can delete Tipus de Document CI',86,'delete_ic_document_type'),(259,'Can add Contracte Laboral CI',87,'add_ic_labor_contract'),(260,'Can change Contracte Laboral CI',87,'change_ic_labor_contract'),(261,'Can delete Contracte Laboral CI',87,'delete_ic_labor_contract'),(262,'Can add Contracte d\'Adreça CI',88,'add_ic_address_contract'),(263,'Can change Contracte d\'Adreça CI',88,'change_ic_address_contract'),(264,'Can delete Contracte d\'Adreça CI',88,'delete_ic_address_contract'),(265,'Can add Assegurança soci CI',89,'add_ic_insurance'),(266,'Can change Assegurança soci CI',89,'change_ic_insurance'),(267,'Can delete Assegurança soci CI',89,'delete_ic_insurance'),(268,'Can add Llicència soci CI',90,'add_ic_licence'),(269,'Can change Llicència soci CI',90,'change_ic_licence'),(270,'Can delete Llicència soci CI',90,'delete_ic_licence'),(271,'Can add m_mat',91,'add_rel_material_materials'),(272,'Can change m_mat',91,'change_rel_material_materials'),(273,'Can delete m_mat',91,'delete_rel_material_materials'),(274,'Can add m_ofi',92,'add_rel_material_jobs'),(275,'Can change m_ofi',92,'change_rel_material_jobs'),(276,'Can delete m_ofi',92,'delete_rel_material_jobs'),(277,'Can add n_rec',93,'add_rel_nonmaterial_records'),(278,'Can change n_rec',93,'change_rel_nonmaterial_records'),(279,'Can delete n_rec',93,'delete_rel_nonmaterial_records'),(280,'Can add n_adr',94,'add_rel_nonmaterial_addresses'),(281,'Can change n_adr',94,'change_rel_nonmaterial_addresses'),(282,'Can delete n_adr',94,'delete_rel_nonmaterial_addresses'),(283,'Can add n_ofi',95,'add_rel_nonmaterial_jobs'),(284,'Can change n_ofi',95,'change_rel_nonmaterial_jobs'),(285,'Can delete n_ofi',95,'delete_rel_nonmaterial_jobs'),(286,'Can add n_inm',96,'add_rel_nonmaterial_nonmaterials'),(287,'Can change n_inm',96,'change_rel_nonmaterial_nonmaterials'),(288,'Can delete n_inm',96,'delete_rel_nonmaterial_nonmaterials'),(289,'Can add c- Tipus CI',97,'add_ic_type'),(290,'Can change c- Tipus CI',97,'change_ic_type'),(291,'Can delete c- Tipus CI',97,'delete_ic_type'),(292,'Can add Tipus de Registre',98,'add_ic_record_type'),(293,'Can change Tipus de Registre',98,'change_ic_record_type'),(294,'Can delete Tipus de Registre',98,'delete_ic_record_type'),(295,'Can add Forma de pagament',99,'add_payment_type'),(296,'Can change Forma de pagament',99,'change_payment_type'),(297,'Can delete Forma de pagament',99,'delete_payment_type'),(298,'Can add Alta de Soci Afí CI',100,'add_ic_akin_membership'),(299,'Can change Alta de Soci Afí CI',100,'change_ic_akin_membership'),(300,'Can delete Alta de Soci Afí CI',100,'delete_ic_akin_membership'),(301,'Can add Alta de Soci Cooperatiu individual CI',101,'add_ic_person_membership'),(302,'Can change Alta de Soci Cooperatiu individual CI',101,'change_ic_person_membership'),(303,'Can delete Alta de Soci Cooperatiu individual CI',101,'delete_ic_person_membership'),(304,'Can add Alta de Projecte Col·lectiu CI',102,'add_ic_project_membership'),(305,'Can change Alta de Projecte Col·lectiu CI',102,'change_ic_project_membership'),(306,'Can delete Alta de Projecte Col·lectiu CI',102,'delete_ic_project_membership'),(307,'Can add Alta Membre: procés activació',103,'add_registrationprofile'),(308,'Can change Alta Membre: procés activació',103,'change_registrationprofile'),(309,'Can delete Alta Membre: procés activació',103,'delete_registrationprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'AUTOOCUPAT'),(3,'iC_Akin_Membership'),(2,'iC_Person_Membership');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
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
  `socialweb` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email2` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `ecommerce` tinyint(1) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`human_id`),
  KEY `General_project_758f74b0` (`project_type_id`),
  KEY `General_project_329f6fb3` (`lft`),
  KEY `General_project_e763210f` (`rght`),
  KEY `General_project_ba470c4a` (`tree_id`),
  KEY `General_project_20e079f4` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_project`
--

LOCK TABLES `General_project` WRITE;
/*!40000 ALTER TABLE `General_project` DISABLE KEYS */;
INSERT INTO `General_project` VALUES (1,47,NULL,'','',0,1,6,1,0),(2,47,1,'','',0,2,5,1,1),(3,24,2,'','',0,3,4,1,2);
/*!40000 ALTER TABLE `General_project` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_person_membership`
--

LOCK TABLES `Welcome_ic_person_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_person_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_person_membership` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_licences`
--

LOCK TABLES `Welcome_ic_self_employed_rel_licences` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_nonmaterials`
--

LOCK TABLES `General_rel_human_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_human_nonmaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_nonmaterials` ENABLE KEYS */;
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
  CONSTRAINT `facilitator_id_refs_id_9f178a2c` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `address_id_refs_id_45bf8dc6` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `ic_record_ptr_id_refs_id_54767834` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_77877834` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session`
--

LOCK TABLES `Welcome_learn_session` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_learn_session` ENABLE KEYS */;
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
  `ic_membership_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_akin_membership_16f39487` (`person_id`),
  KEY `Welcome_ic_akin_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_akin_membership_37d462ff` (`ic_membership_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_99c87fea` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_project_id_refs_human_id_9b38bd6d` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `ic_record_id_refs_id_c266dcc5` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `person_id_refs_human_id_0758e303` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_akin_membership`
--

LOCK TABLES `Welcome_ic_akin_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_akin_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_akin_membership` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_space_type`
--

LOCK TABLES `General_space_type` WRITE;
/*!40000 ALTER TABLE `General_space_type` DISABLE KEYS */;
INSERT INTO `General_space_type` VALUES (7),(8),(39),(40),(41),(42),(43),(44),(45),(46);
/*!40000 ALTER TABLE `General_space_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_material_type`
--

LOCK TABLES `General_material_type` WRITE;
/*!40000 ALTER TABLE `General_material_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_material_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership_expositors`
--

LOCK TABLES `Welcome_ic_membership_expositors` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_record`
--

DROP TABLE IF EXISTS `Welcome_ic_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Welcome_ic_record_ac580b38` (`record_type_id`),
  CONSTRAINT `record_type_id_refs_ic_type_id_3360b245` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_record`
--

LOCK TABLES `Welcome_ic_record` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_record` ENABLE KEYS */;
UNLOCK TABLES;

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
  `code` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(34) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankcard` tinyint(1) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountbank_6922ec88` (`human_id`),
  KEY `General_accountbank_0316dde1` (`company_id`),
  KEY `General_accountbank_b9dcc52b` (`unit_id`),
  CONSTRAINT `human_id_refs_id_d6164342` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `company_id_refs_human_id_466f5e8e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `record_id_refs_id_a20996dc` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_e5728480` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountbank`
--

LOCK TABLES `General_accountbank` WRITE;
/*!40000 ALTER TABLE `General_accountbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_accountbank` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_record_type`
--

LOCK TABLES `General_record_type` WRITE;
/*!40000 ALTER TABLE `General_record_type` DISABLE KEYS */;
INSERT INTO `General_record_type` VALUES (14),(15),(16),(17),(18);
/*!40000 ALTER TABLE `General_record_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_insurances`
--

LOCK TABLES `Welcome_ic_self_employed_rel_insurances` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_insurances` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_insurances` ENABLE KEYS */;
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
  `number` varchar(34) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountcrypto_6922ec88` (`human_id`),
  KEY `General_accountcrypto_b9dcc52b` (`unit_id`),
  CONSTRAINT `human_id_refs_id_77c8ab2d` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_023b3440` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_d51cdeac` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountcrypto`
--

LOCK TABLES `General_accountcrypto` WRITE;
/*!40000 ALTER TABLE `General_accountcrypto` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_accountcrypto` ENABLE KEYS */;
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
  CONSTRAINT `fee_id_refs_ic_record_id_4078f825` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_887743bd` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_fees`
--

LOCK TABLES `Welcome_ic_self_employed_rel_fees` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_fees` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_companies`
--

LOCK TABLES `General_rel_human_companies` WRITE;
/*!40000 ALTER TABLE `General_rel_human_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_person`
--

DROP TABLE IF EXISTS `General_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_person` (
  `human_id` int(11) NOT NULL,
  `surnames` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_card` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `email2` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `nickname2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_person`
--

LOCK TABLES `General_person` WRITE;
/*!40000 ALTER TABLE `General_person` DISABLE KEYS */;
INSERT INTO `General_person` VALUES (4,'','','',''),(14,'','','','');
/*!40000 ALTER TABLE `General_person` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_company_type`
--

LOCK TABLES `General_company_type` WRITE;
/*!40000 ALTER TABLE `General_company_type` DISABLE KEYS */;
INSERT INTO `General_company_type` VALUES (19),(20);
/*!40000 ALTER TABLE `General_company_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_address_contract`
--

DROP TABLE IF EXISTS `Welcome_ic_address_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_address_contract` (
  `ic_document_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `price_unit_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_address_contract_1818c0ae` (`membership_id`),
  KEY `Welcome_ic_address_contract_0316dde1` (`company_id`),
  KEY `Welcome_ic_address_contract_3ac8a70a` (`address_id`),
  KEY `Welcome_ic_address_contract_098d71f2` (`price_unit_id`),
  CONSTRAINT `membership_id_refs_ic_record_id_b0b8e545` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `address_id_refs_id_7bcaf3bc` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `company_id_refs_human_id_9f93aaad` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_8f544de0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `price_unit_id_refs_id_a84f78ad` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_address_contract`
--

LOCK TABLES `Welcome_ic_address_contract` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_address_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_address_contract` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_records`
--

LOCK TABLES `General_rel_human_records` WRITE;
/*!40000 ALTER TABLE `General_rel_human_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_records` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_jobs`
--

LOCK TABLES `General_rel_nonmaterial_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_human`
--

DROP TABLE IF EXISTS `General_human`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_human` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `nickname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telephone_cell` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `telephone_land` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_human`
--

LOCK TABLES `General_human` WRITE;
/*!40000 ALTER TABLE `General_human` DISABLE KEYS */;
INSERT INTO `General_human` VALUES (1,'Revolució Integral',NULL,NULL,'RI','','','','',''),(2,'Xarxa de Cooperatives Integrals',NULL,NULL,'XCI','','','','',''),(3,'Cooperativa Integral Catalana',NULL,NULL,'CIC','','','','',''),(4,'Sebas','1972-09-29',NULL,'bumbum','','','','',''),(14,'Marta',NULL,NULL,'tuccia','tuccia@cooperativa.cat','','','','');
/*!40000 ALTER TABLE `General_human` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_nonmaterial`
--

DROP TABLE IF EXISTS `General_nonmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_nonmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `nonmaterial_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_nonmaterial_d40a8f00` (`nonmaterial_type_id`),
  CONSTRAINT `nonmaterial_type_id_refs_artwork_type_id_185071f1` FOREIGN KEY (`nonmaterial_type_id`) REFERENCES `General_nonmaterial_type` (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_nonmaterial`
--

LOCK TABLES `General_nonmaterial` WRITE;
/*!40000 ALTER TABLE `General_nonmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_nonmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_relation`
--

DROP TABLE IF EXISTS `General_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `verb` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gerund` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_relation_410d0aac` (`parent_id`),
  KEY `General_relation_329f6fb3` (`lft`),
  KEY `General_relation_e763210f` (`rght`),
  KEY `General_relation_ba470c4a` (`tree_id`),
  KEY `General_relation_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_f04fb9fe` FOREIGN KEY (`parent_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_relation`
--

LOCK TABLES `General_relation` WRITE;
/*!40000 ALTER TABLE `General_relation` DISABLE KEYS */;
INSERT INTO `General_relation` VALUES (1,':Relació Humà - Humà','','','',NULL,1,22,1,0,''),(2,':Relació Humà - Art','','','',NULL,1,2,2,0,''),(3,':Relació Humà - Espai','','','',NULL,1,8,3,0,'rel_hum_addr'),(4,':Relació Humà - Obra','','','',NULL,1,2,4,0,''),(5,':Relació Persona - Projecte','','','',1,2,19,1,1,'rel_pers_proj'),(6,':Relació Persona - Persona','','','',1,20,21,1,1,''),(7,'Participació','participar','participant','',5,3,18,1,2,''),(8,'Dinamització','dinamitzar','dinamitzant','',7,4,5,1,3,''),(9,'Col·laboració','col·laborar','col·laborant','',7,6,7,1,3,''),(10,'Contribució','contribuir','contribuint','',7,8,15,1,3,'contribution'),(11,'Referent','referenciar','referenciant','',7,16,17,1,3,'referent'),(12,'contribució en alguna comissió','contribuir en comissió','contribuint en comissió','',10,9,10,1,4,''),(13,'contribució puntual en tasques organitzatives','contribuir puntualment','contribuint puntualment','',10,11,12,1,4,''),(14,'contribució econòmica','contribuir econòmicament','contribuint econòmicament','',10,13,14,1,4,''),(15,':Relació Projecte - Adreça','','','',3,2,7,3,1,'rel_proj_addr'),(16,'Oferiment de l\'espai','oferir l\'espai','oferint l\'espai','',17,4,5,3,3,''),(17,'Gestió de l\'espai','gestionar l\'espai','gestionant l\'espai','',15,3,6,3,2,'');
/*!40000 ALTER TABLE `General_relation` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_projects`
--

LOCK TABLES `General_rel_human_projects` WRITE;
/*!40000 ALTER TABLE `General_rel_human_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_projects` ENABLE KEYS */;
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
  CONSTRAINT `record_type_id_refs_ic_type_id_bba54e5c` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_document_type`
--

LOCK TABLES `Welcome_ic_document_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_document_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_document_type` VALUES (13),(14),(15),(16);
/*!40000 ALTER TABLE `Welcome_ic_document_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_address_contracts`
--

LOCK TABLES `Welcome_ic_self_employed_rel_address_contracts` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` ENABLE KEYS */;
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
  `contribution_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `join_fee_id` int(11) NOT NULL,
  `ic_CESnum` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `virtual_market` tinyint(1) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_membership_6922ec88` (`human_id`),
  KEY `Welcome_ic_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_membership_2731fa00` (`contribution_id`),
  KEY `Welcome_ic_membership_3f4dd712` (`join_fee_id`),
  CONSTRAINT `join_fee_id_refs_ic_record_id_b65e7f0b` FOREIGN KEY (`join_fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  CONSTRAINT `contribution_id_refs_id_803a7b3a` FOREIGN KEY (`contribution_id`) REFERENCES `General_relation` (`id`),
  CONSTRAINT `human_id_refs_id_90a969ae` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_project_id_refs_human_id_5db24bd9` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `ic_record_id_refs_id_2333c0a4` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership`
--

LOCK TABLES `Welcome_ic_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_membership` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_region_type`
--

LOCK TABLES `General_region_type` WRITE;
/*!40000 ALTER TABLE `General_region_type` DISABLE KEYS */;
INSERT INTO `General_region_type` VALUES (39),(40),(41),(42),(43);
/*!40000 ALTER TABLE `General_region_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_record_type`
--

LOCK TABLES `Welcome_ic_record_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_record_type` VALUES (3),(4),(5),(6),(7),(8),(9),(10),(11),(13),(14),(15),(16),(17),(18),(19);
/*!40000 ALTER TABLE `Welcome_ic_record_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_records`
--

LOCK TABLES `General_rel_material_records` WRITE;
/*!40000 ALTER TABLE `General_rel_material_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_records` ENABLE KEYS */;
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
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountces_6922ec88` (`human_id`),
  KEY `General_accountces_c096cf48` (`entity_id`),
  KEY `General_accountces_b9dcc52b` (`unit_id`),
  CONSTRAINT `human_id_refs_id_da305fb3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `entity_id_refs_human_id_935d5d48` FOREIGN KEY (`entity_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `record_id_refs_id_2286902b` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_07a72ac8` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountces`
--

LOCK TABLES `General_accountces` WRITE;
/*!40000 ALTER TABLE `General_accountces` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_accountces` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_materials`
--

LOCK TABLES `General_rel_human_materials` WRITE;
/*!40000 ALTER TABLE `General_rel_human_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_materials` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_addresses`
--

LOCK TABLES `General_rel_material_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_material_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_addresses` ENABLE KEYS */;
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
  `activation_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_form_registrationprofile`
--

LOCK TABLES `public_form_registrationprofile` WRITE;
/*!40000 ALTER TABLE `public_form_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_form_registrationprofile` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_being_type`
--

LOCK TABLES `General_being_type` WRITE;
/*!40000 ALTER TABLE `General_being_type` DISABLE KEYS */;
INSERT INTO `General_being_type` VALUES (4),(5),(6),(13),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47);
/*!40000 ALTER TABLE `General_being_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_insurance`
--

DROP TABLE IF EXISTS `Welcome_ic_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_insurance` (
  `ic_document_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `price_unit_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_insurance_1818c0ae` (`membership_id`),
  KEY `Welcome_ic_insurance_0316dde1` (`company_id`),
  KEY `Welcome_ic_insurance_098d71f2` (`price_unit_id`),
  KEY `Welcome_ic_insurance_57d16b26` (`rel_address_id`),
  KEY `Welcome_ic_insurance_bfdae731` (`rel_job_id`),
  CONSTRAINT `price_unit_id_refs_id_cf457021` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `company_id_refs_human_id_8dc69d9f` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_74e41ee0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `membership_id_refs_ic_record_id_06cb12c9` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `rel_address_id_refs_id_0a733bc0` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `rel_job_id_refs_id_69cdbd47` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_insurance`
--

LOCK TABLES `Welcome_ic_insurance` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_insurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_job`
--

DROP TABLE IF EXISTS `General_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `verb` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gerund` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_job_410d0aac` (`parent_id`),
  KEY `General_job_329f6fb3` (`lft`),
  KEY `General_job_e763210f` (`rght`),
  KEY `General_job_ba470c4a` (`tree_id`),
  KEY `General_job_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_a2f76742` FOREIGN KEY (`parent_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_job`
--

LOCK TABLES `General_job` WRITE;
/*!40000 ALTER TABLE `General_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_job` ENABLE KEYS */;
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
  CONSTRAINT `ic_membership_id_refs_ic_record_id_925dedba` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `project_id_refs_human_id_0be24c6e` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_project_membership`
--

LOCK TABLES `Welcome_ic_project_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_project_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_project_membership` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_nonmaterial_type`
--

LOCK TABLES `General_nonmaterial_type` WRITE;
/*!40000 ALTER TABLE `General_nonmaterial_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_nonmaterial_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_image`
--

DROP TABLE IF EXISTS `General_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_image` (
  `nonmaterial_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`nonmaterial_id`),
  CONSTRAINT `nonmaterial_id_refs_id_c84188d9` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_image`
--

LOCK TABLES `General_image` WRITE;
/*!40000 ALTER TABLE `General_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_image` ENABLE KEYS */;
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
  `reciprocity` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `General_asset_6922ec88` (`human_id`),
  CONSTRAINT `human_id_refs_id_cbd3fba4` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `material_id_refs_id_a349c1f5` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_asset`
--

LOCK TABLES `General_asset` WRITE;
/*!40000 ALTER TABLE `General_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_asset` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,35),(2,1,43),(3,1,46),(4,1,52),(5,1,55),(6,1,56),(7,1,61),(8,1,62),(9,1,63),(10,1,64),(11,1,65),(12,1,66),(13,1,67),(14,1,68),(15,1,69),(16,1,70),(17,1,71),(18,1,72),(19,1,73),(20,1,74),(21,1,76),(22,1,77),(23,1,79),(24,1,80),(25,1,82),(26,1,85),(27,1,86),(28,1,87),(309,2,110),(310,2,116),(311,2,124),(312,2,125),(313,2,126),(314,2,127),(282,2,128),(283,2,129),(284,2,130),(285,2,131),(286,2,132),(287,2,136),(288,2,137),(289,2,138),(290,2,139),(291,2,140),(292,2,141),(293,2,145),(294,2,146),(295,2,147),(296,2,148),(297,2,149),(298,2,150),(299,2,172),(300,2,173),(301,2,176),(302,2,179),(303,2,182),(304,2,202),(305,2,203),(306,2,220),(307,2,223),(308,2,226),(366,3,110),(367,3,124),(368,3,125),(369,3,126),(370,3,127),(345,3,128),(346,3,129),(347,3,130),(348,3,131),(349,3,132),(350,3,136),(351,3,137),(352,3,138),(353,3,139),(354,3,140),(355,3,141),(356,3,145),(357,3,146),(358,3,147),(359,3,148),(360,3,149),(361,3,150),(362,3,172),(363,3,173),(364,3,202),(365,3,203);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
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
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_unit_type`
--

LOCK TABLES `General_unit_type` WRITE;
/*!40000 ALTER TABLE `General_unit_type` DISABLE KEYS */;
INSERT INTO `General_unit_type` VALUES (34),(35),(36),(37),(38);
/*!40000 ALTER TABLE `General_unit_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_nonmaterials`
--

LOCK TABLES `General_rel_nonmaterial_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_nonmaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_nonmaterials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_address`
--

DROP TABLE IF EXISTS `General_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address_type_id` int(11) DEFAULT NULL,
  `p_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `town` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `postalcode` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `ic_larder` tinyint(1) NOT NULL,
  `main_address` tinyint(1) NOT NULL,
  `size` decimal(20,2) DEFAULT NULL,
  `size_unit_id` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `General_address_4b4cf59f` (`address_type_id`),
  KEY `General_address_55a4ce96` (`region_id`),
  KEY `General_address_4f62c404` (`size_unit_id`),
  CONSTRAINT `size_unit_id_refs_id_68083e30` FOREIGN KEY (`size_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `address_type_id_refs_space_type_id_54ad4544` FOREIGN KEY (`address_type_id`) REFERENCES `General_address_type` (`space_type_id`),
  CONSTRAINT `region_id_refs_id_c1ad246c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address`
--

LOCK TABLES `General_address` WRITE;
/*!40000 ALTER TABLE `General_address` DISABLE KEYS */;
INSERT INTO `General_address` VALUES (1,'AureaSocial',44,'Sardenya 261-263','Barcelona','',3,0,1,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `General_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_material`
--

DROP TABLE IF EXISTS `General_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `material_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_material_6965c408` (`material_type_id`),
  CONSTRAINT `material_type_id_refs_artwork_type_id_c95cd6a1` FOREIGN KEY (`material_type_id`) REFERENCES `General_material_type` (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_material`
--

LOCK TABLES `General_material` WRITE;
/*!40000 ALTER TABLE `General_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_unit`
--

DROP TABLE IF EXISTS `General_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `unit_type_id` int(11) DEFAULT NULL,
  `code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `human_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_unit_0f371b60` (`unit_type_id`),
  KEY `General_unit_55a4ce96` (`region_id`),
  KEY `General_unit_6922ec88` (`human_id`),
  CONSTRAINT `unit_type_id_refs_artwork_type_id_5cc88dc7` FOREIGN KEY (`unit_type_id`) REFERENCES `General_unit_type` (`artwork_type_id`),
  CONSTRAINT `human_id_refs_id_5eaaaa15` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `region_id_refs_id_c4f5f71c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_unit`
--

LOCK TABLES `General_unit` WRITE;
/*!40000 ALTER TABLE `General_unit` DISABLE KEYS */;
INSERT INTO `General_unit` VALUES (1,'EcoCoop','',35,'eco',NULL,3),(2,'Euro','',37,'€',NULL,NULL),(3,'Metre Quadrat','',38,'m2',NULL,NULL),(4,'Hectàrea','',38,'Ha',NULL,NULL);
/*!40000 ALTER TABLE `General_unit` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session_assistants`
--

LOCK TABLES `Welcome_learn_session_assistants` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session_assistants` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_learn_session_assistants` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_records`
--

LOCK TABLES `General_rel_nonmaterial_records` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_records` ENABLE KEYS */;
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
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_document_ca3e294e` (`doc_type_id`),
  CONSTRAINT `doc_type_id_refs_record_type_id_697e0ecf` FOREIGN KEY (`doc_type_id`) REFERENCES `Welcome_ic_document_type` (`record_type_id`),
  CONSTRAINT `ic_record_id_refs_id_28d2e5f7` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_document`
--

LOCK TABLES `Welcome_ic_document` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_document` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_nonmaterial_addresses`
--

LOCK TABLES `General_rel_nonmaterial_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_nonmaterial_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_nonmaterial_addresses` ENABLE KEYS */;
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
  CONSTRAINT `ic_document_id_refs_ic_record_id_7885c79c` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `company_id_refs_human_id_53c2a07e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `person_id_refs_human_id_23ff45ce` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_labor_contract`
--

LOCK TABLES `Welcome_ic_labor_contract` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_materials`
--

LOCK TABLES `General_rel_material_materials` WRITE;
/*!40000 ALTER TABLE `General_rel_material_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_record`
--

DROP TABLE IF EXISTS `General_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_record_ac580b38` (`record_type_id`),
  CONSTRAINT `record_type_id_refs_artwork_type_id_bf922724` FOREIGN KEY (`record_type_id`) REFERENCES `General_record_type` (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_record`
--

LOCK TABLES `General_record` WRITE;
/*!40000 ALTER TABLE `General_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_record` ENABLE KEYS */;
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
  `legal_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`human_id`),
  KEY `General_company_a3c9d75e` (`company_type_id`),
  CONSTRAINT `company_type_id_refs_being_type_id_24e786ac` FOREIGN KEY (`company_type_id`) REFERENCES `General_company_type` (`being_type_id`),
  CONSTRAINT `human_id_refs_id_ae2f98d3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_company`
--

LOCK TABLES `General_company` WRITE;
/*!40000 ALTER TABLE `General_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_company` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_persons`
--

LOCK TABLES `General_rel_human_persons` WRITE;
/*!40000 ALTER TABLE `General_rel_human_persons` DISABLE KEYS */;
INSERT INTO `General_rel_human_persons` VALUES (1,3,4,7);
/*!40000 ALTER TABLE `General_rel_human_persons` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_project_type`
--

LOCK TABLES `General_project_type` WRITE;
/*!40000 ALTER TABLE `General_project_type` DISABLE KEYS */;
INSERT INTO `General_project_type` VALUES (13),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47);
/*!40000 ALTER TABLE `General_project_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_images`
--

LOCK TABLES `Welcome_ic_self_employed_rel_images` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_images` ENABLE KEYS */;
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
  `situation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `needs` longtext COLLATE utf8_unicode_ci NOT NULL,
  `petitioner_id` int(11) DEFAULT NULL,
  `petition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_ptr_id`),
  KEY `Welcome_project_accompaniment_6922ec88` (`human_id`),
  KEY `Welcome_project_accompaniment_45430575` (`petitioner_id`),
  KEY `Welcome_project_accompaniment_024adddb` (`facilitator_id`),
  CONSTRAINT `facilitator_id_refs_id_0227f432` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `human_id_refs_id_0227f432` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_record_ptr_id_refs_id_58f56a13` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `petitioner_id_refs_id_0227f432` FOREIGN KEY (`petitioner_id`) REFERENCES `General_human` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_project_accompaniment`
--

LOCK TABLES `Welcome_project_accompaniment` WRITE;
/*!40000 ALTER TABLE `Welcome_project_accompaniment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_project_accompaniment` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_jobs`
--

LOCK TABLES `General_rel_human_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_human_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_unitratio`
--

LOCK TABLES `General_unitratio` WRITE;
/*!40000 ALTER TABLE `General_unitratio` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_unitratio` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_artwork_type`
--

LOCK TABLES `General_artwork_type` WRITE;
/*!40000 ALTER TABLE `General_artwork_type` DISABLE KEYS */;
INSERT INTO `General_artwork_type` VALUES (9),(10),(11),(12),(14),(15),(16),(17),(18),(34),(35),(36),(37),(38);
/*!40000 ALTER TABLE `General_artwork_type` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_labor_contract_rel_fees`
--

LOCK TABLES `Welcome_ic_labor_contract_rel_fees` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract_rel_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_labor_contract_rel_fees` ENABLE KEYS */;
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
  `membership_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `rel_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_fee_6922ec88` (`human_id`),
  KEY `Welcome_fee_37952554` (`project_id`),
  KEY `Welcome_fee_b9dcc52b` (`unit_id`),
  KEY `Welcome_fee_1818c0ae` (`membership_id`),
  KEY `Welcome_fee_8342f46c` (`payment_type_id`),
  KEY `Welcome_fee_5b622010` (`rel_account_id`),
  CONSTRAINT `payment_type_id_refs_ic_type_id_c8bafb66` FOREIGN KEY (`payment_type_id`) REFERENCES `Welcome_payment_type` (`ic_type_id`),
  CONSTRAINT `human_id_refs_id_3c3445f1` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_record_id_refs_id_fb734d90` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `membership_id_refs_ic_record_id_518057e2` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `project_id_refs_human_id_028a3357` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `rel_account_id_refs_id_93465450` FOREIGN KEY (`rel_account_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_d83a16d0` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_fee`
--

LOCK TABLES `Welcome_fee` WRITE;
/*!40000 ALTER TABLE `Welcome_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_fee` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address_jobs`
--

LOCK TABLES `General_address_jobs` WRITE;
/*!40000 ALTER TABLE `General_address_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_address_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_type`
--

DROP TABLE IF EXISTS `Welcome_ic_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `Welcome_ic_type_410d0aac` (`parent_id`),
  KEY `Welcome_ic_type_329f6fb3` (`lft`),
  KEY `Welcome_ic_type_e763210f` (`rght`),
  KEY `Welcome_ic_type_ba470c4a` (`tree_id`),
  KEY `Welcome_ic_type_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_d03ad36e` FOREIGN KEY (`parent_id`) REFERENCES `Welcome_ic_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_type`
--

LOCK TABLES `Welcome_ic_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_type` VALUES (1,'Registre CI','',NULL,1,34,1,0,'iC_Record'),(2,'Forma de Pagament','',NULL,1,16,2,0,''),(3,'alta Soci CI','',4,3,10,1,2,'iC_Membership'),(4,'Alta de Membre','',1,2,17,1,1,''),(5,'alta Projecte Autoocupat','',4,11,14,1,2,'iC_Self_Employed'),(6,'Document CI','',1,18,27,1,1,'iC_Document'),(7,'alta Soci Cooperatiu Individual','',3,4,5,1,3,'iC_Person_Membership'),(8,'alta Projecte Col·lectiu','',3,6,7,1,3,'iC_Project_Membership'),(9,'alta Projecte Públic','',3,8,9,1,3,''),(10,'alta Soci Afí Individual','',4,15,16,1,2,'iC_Akin_Membership'),(11,'alta Projecte Firaire','',5,12,13,1,3,'iC_Stallholder'),(13,'Contracte d\'Adreça','',6,19,20,1,2,'iC_Address_Contract'),(14,'Llicència soci','',6,21,22,1,2,'iC_Licence'),(15,'Assegurança soci','',6,23,24,1,2,'iC_Insurance'),(16,'Contracte Laboral','',6,25,26,1,2,'iC_Labor_Contract'),(17,'Quota','',1,28,33,1,1,'Fee'),(18,'quota d\'Alta','',17,29,30,1,2,''),(19,'quota Trimestral','',17,31,32,1,2,''),(20,'pagament en Moneda Social','',26,9,10,2,2,''),(21,'pagament amb Hores de Treball','',26,13,14,2,2,''),(22,'pagament amb Criptomoneda','',2,2,3,2,1,''),(23,'pagament en Metàl·lic','',26,11,12,2,2,''),(24,'pagament per Transferència Bancària','',2,4,5,2,1,''),(25,'pagament fent Ingrés al Banc','',2,6,7,2,1,''),(26,'pagament presencial','',2,8,15,2,1,'face-to-face');
/*!40000 ALTER TABLE `Welcome_ic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_type`
--

DROP TABLE IF EXISTS `General_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `General_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_type_410d0aac` (`parent_id`),
  KEY `General_type_329f6fb3` (`lft`),
  KEY `General_type_e763210f` (`rght`),
  KEY `General_type_ba470c4a` (`tree_id`),
  KEY `General_type_20e079f4` (`level`),
  CONSTRAINT `parent_id_refs_id_4c09e283` FOREIGN KEY (`parent_id`) REFERENCES `General_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_type`
--

LOCK TABLES `General_type` WRITE;
/*!40000 ALTER TABLE `General_type` DISABLE KEYS */;
INSERT INTO `General_type` VALUES (1,'Ésser','',NULL,1,42,1,0,'Being'),(2,'Espai','',NULL,1,22,2,0,'Space'),(3,'Obra','',NULL,1,30,3,0,'Artwork'),(4,'Persona','',1,2,3,1,1,'Person'),(5,'Projecte','',1,4,35,1,1,'Project'),(6,'Empresa','',1,36,41,1,1,'Company'),(7,'Adreça','',2,2,9,2,1,'Address'),(8,'Regió','',2,10,21,2,1,'Region'),(9,'Material','',3,2,3,3,1,'Material'),(10,'Inmaterial','',3,4,5,3,1,'Nonmaterial'),(11,'Registre','',3,6,17,3,1,'Record'),(12,'Unitat','',3,18,29,3,1,'Unit'),(13,'Projecte CI','',5,5,32,1,2,''),(14,'Equivalencia d\'Unitats','',11,7,8,3,2,'UnitRatio'),(15,'Compte monetari','',11,9,16,3,2,''),(16,'Compte CES','',15,10,11,3,3,'AccountCes'),(17,'Compte Criptomoneda','',15,12,13,3,3,'AccountCrypto'),(18,'Compte Bancari','',15,14,15,3,3,'AccountCrypto'),(19,'Cooperativa','',6,37,38,1,2,''),(20,'Bancaria','',6,39,40,1,2,''),(21,'Nucli d\'Autogestió Local','',23,7,8,1,4,''),(22,'Ecoxarxa','',23,9,10,1,4,''),(23,'Públic','',13,6,17,1,3,''),(24,'Cooperativa Integral','',23,11,12,1,4,''),(25,'Productiu Public','',23,13,14,1,4,''),(26,'Servei Comú','',23,15,16,1,4,''),(27,'Cooperatiu Col·lectiu','',13,18,19,1,3,''),(28,'Grup de Consum','',13,20,21,1,3,''),(29,'De Serveis','',13,22,23,1,3,''),(30,'PAIC sense facturació','',13,24,25,1,3,''),(31,'Autoocupat','',13,26,31,1,3,''),(32,'Autoocupat Firaire','',31,27,28,1,4,''),(33,'PAIC amb facturació','',31,29,30,1,4,''),(34,'Moneda','',12,19,26,3,2,'currency'),(35,'Moneda Social','',34,20,21,3,3,''),(36,'Criptomoneda','',34,22,23,3,3,''),(37,'Moneda Fiat','',34,24,25,3,3,''),(38,'Àrea','',12,27,28,3,2,'area'),(39,'Continent','',8,11,20,2,2,''),(40,'País','',39,12,19,2,3,''),(41,'Comunitat Cultural','',40,13,18,2,4,''),(42,'Bioregió','',41,14,15,2,5,''),(43,'Comarca','',41,16,17,2,5,''),(44,'Espai Polivalent Col·lectiu','',7,3,4,2,2,''),(45,'Taller','',7,5,6,2,2,''),(46,'Habitatge','',7,7,8,2,2,''),(47,'Xarxa Mundial','',5,33,34,1,2,'');
/*!40000 ALTER TABLE `General_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_licence`
--

DROP TABLE IF EXISTS `Welcome_ic_licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_licence` (
  `ic_document_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_licence_1818c0ae` (`membership_id`),
  KEY `Welcome_ic_licence_57d16b26` (`rel_address_id`),
  KEY `Welcome_ic_licence_bfdae731` (`rel_job_id`),
  CONSTRAINT `membership_id_refs_ic_record_id_b7db909c` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_638b2aec` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `rel_address_id_refs_id_44aa1942` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `rel_job_id_refs_id_c58b25ba` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_licence`
--

LOCK TABLES `Welcome_ic_licence` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_licence` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_licence` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$slHNJa0IUgZy$f4ALF9LBvaEx6UhRWeLsBPCa4ad8j82ZJjEooN4Yty0=','2014-08-05 17:14:14',1,'aleph','','','',1,1,'2014-08-05 17:11:11'),(2,'pbkdf2_sha256$12000$fZEAAYoFoyjl$TUPhMOR21ZR1TIFHKWwFADJDEP7IpglJN7KwoKWpKPw=','2014-08-05 17:34:43',0,'pepe','Pepe','GOTERA','rua13@percebe.vom',0,1,'2014-08-05 17:34:43'),(3,'pbkdf2_sha256$12000$uRZYWtMYE2eV$dHtqeDChoLdhES3GE8YO7HXLkK0Z2eWY/PTRqjMFwe4=','2014-08-08 22:37:57',1,'bumbum','','','bumbum@cooperativa.cat',1,1,'2014-08-06 14:26:28');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Welcome_ic_stallholder`
--

DROP TABLE IF EXISTS `Welcome_ic_stallholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Welcome_ic_stallholder` (
  `ic_self_employed_id` int(11) NOT NULL,
  `tent_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ic_self_employed_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4245c133` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_stallholder`
--

LOCK TABLES `Welcome_ic_stallholder` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_stallholder` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_stallholder` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_regions`
--

LOCK TABLES `General_rel_human_regions` WRITE;
/*!40000 ALTER TABLE `General_rel_human_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_human_regions` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_jobs`
--

LOCK TABLES `General_rel_material_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_material_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_nonmaterials`
--

LOCK TABLES `General_rel_material_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_material_nonmaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `General_rel_material_nonmaterials` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `General_rel_human_addresses_6922ec88` (`human_id`),
  KEY `General_rel_human_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_human_addresses_d525a588` (`relation_id`),
  CONSTRAINT `address_id_refs_id_10b91208` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `human_id_refs_id_7504d2e7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_2f3eeaff` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_addresses`
--

LOCK TABLES `General_rel_human_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_human_addresses` DISABLE KEYS */;
INSERT INTO `General_rel_human_addresses` VALUES (1,3,1,17);
/*!40000 ALTER TABLE `General_rel_human_addresses` ENABLE KEYS */;
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
  `assigned_vat` decimal(4,2) NOT NULL,
  `review_vat` tinyint(1) NOT NULL,
  `last_review_date` date DEFAULT NULL,
  `mentor_membership_id` int(11) DEFAULT NULL,
  `mentor_comment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_self_employed_37d462ff` (`ic_membership_id`),
  KEY `Welcome_ic_self_employed_259761f6` (`rel_accountBank_id`),
  KEY `Welcome_ic_self_employed_5bec29b3` (`mentor_membership_id`),
  CONSTRAINT `mentor_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`mentor_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_record_id_refs_id_8ebb96a9` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `rel_accountBank_id_refs_record_id_939a5950` FOREIGN KEY (`rel_accountBank_id`) REFERENCES `General_accountbank` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed`
--

LOCK TABLES `Welcome_ic_self_employed` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed` DISABLE KEYS */;
/*!40000 ALTER TABLE `Welcome_ic_self_employed` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-16  0:33:14
