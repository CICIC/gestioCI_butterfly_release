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
-- Table structure for table `Invoices_currencies`
--

DROP TABLE IF EXISTS `Invoices_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_currencies`
--

LOCK TABLES `Invoices_currencies` WRITE;
/*!40000 ALTER TABLE `Invoices_currencies` DISABLE KEYS */;
INSERT INTO `Invoices_currencies` VALUES (1,'BTC'),(2,'EURO'),(3,'ECO'),(4,'SALDO');
/*!40000 ALTER TABLE `Invoices_currencies` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_coop`
--

LOCK TABLES `Invoices_coop` WRITE;
/*!40000 ALTER TABLE `Invoices_coop` DISABLE KEYS */;
INSERT INTO `Invoices_coop` VALUES (2,'Interprofesionals'),(1,'Xarxa de profesionals i usuàries');
/*!40000 ALTER TABLE `Invoices_coop` ENABLE KEYS */;
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
INSERT INTO `General_material_type` VALUES (55),(56),(57);
/*!40000 ALTER TABLE `General_material_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_record`
--

LOCK TABLES `Welcome_ic_record` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record` DISABLE KEYS */;
INSERT INTO `Welcome_ic_record` VALUES (1,'quota alta Col·lectiva: EA (Ecoxarxanoia) [12.00 h] > CIC',NULL,36),(2,'alta Proj. Col·lectiu: EA (Ecoxarxanoia)','',8),(3,'quota alta Individual: bumbum (Sebas) [6.00 eco]',NULL,35),(4,'COOP0111 (bumbum)','',7),(5,'alta Soci Afí Individual: Marta (tuccia)','',10),(6,'XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',NULL,NULL),(7,'alta Proj. Autoocupat: COOP0111 (bumbum)',NULL,5),(8,'quota 1T: bumbum (Sebas) [30.00 eco]',NULL,29),(9,'bumbum (Sebas): pis de mallorca',NULL,NULL),(12,'bumbum (Sebas): Casa del Comú',NULL,NULL),(13,'quota 2T: bumbum (Sebas) [30.00 eco] > CIC',NULL,30),(14,'quota 3T: bumbum (Sebas) [45.00 €]',NULL,31),(15,'acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial','',33),(18,'quota alta Individual: seb (anonymous) [6.00 riu] > CIC',NULL,35),(19,'alta Soci Coop. Individual: seb (Sebb)','',7),(21,'Llicència soci: COOP0111 (bumbum)','',NULL),(22,'Arç: COOP0111 (bumbum)','',NULL),(23,'formació Moneda Social: 2014-08-25 (Marta) AureaSocial','',34),(24,'quota 1T: EA (Ecoxarxanoia) [30 riu]',NULL,29),(27,'alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',NULL,5),(28,'alta Proj. Autoocupat: alta Soci Coop. Individual: seb (Sebb)',NULL,5),(29,'alta Soci Afí Individual: Jeto Laface (jeto)','',10);
/*!40000 ALTER TABLE `Welcome_ic_record` ENABLE KEYS */;
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
INSERT INTO `General_record_type` VALUES (14),(15),(16),(17),(18),(58),(59),(60),(61);
/*!40000 ALTER TABLE `General_record_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_tax`
--

LOCK TABLES `Invoices_tax` WRITE;
/*!40000 ALTER TABLE `Invoices_tax` DISABLE KEYS */;
INSERT INTO `Invoices_tax` VALUES (1,950.00,23001,24000),(2,925.00,22001,23000),(3,900.00,21001,22000),(4,875.00,20001,21000),(5,850.00,19001,20000),(6,825.00,18001,19000),(7,800.00,17001,18000),(8,775.00,16001,17000),(9,750.00,15001,16000),(10,725.00,14001,15000),(11,700.00,13001,14000),(12,675.00,12001,13000),(13,650.00,11001,12000),(14,625.00,10001,11000),(15,600.00,9001,10000),(16,550.00,8001,9000),(17,500.00,7001,8000),(18,450.00,6001,7000),(19,400.00,5001,6000),(20,325.00,4001,5000),(21,250.00,3001,4000),(22,175.00,2001,3000),(23,125.00,1001,2000),(24,75.00,501,1000),(25,45.00,1,500),(26,30.00,0,0);
/*!40000 ALTER TABLE `Invoices_tax` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_fees`
--

LOCK TABLES `Welcome_ic_self_employed_rel_fees` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_fees` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_fees` VALUES (148,7,8),(149,7,13),(150,7,14),(158,27,24);
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
  CONSTRAINT `company_id_refs_human_id_71dbec55` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `human_id_refs_id_e5fc194f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_e6d593f3` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_companies`
--

LOCK TABLES `General_rel_human_companies` WRITE;
/*!40000 ALTER TABLE `General_rel_human_companies` DISABLE KEYS */;
INSERT INTO `General_rel_human_companies` VALUES (1,3,15,20);
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
INSERT INTO `General_person` VALUES (4,'','28374655','',''),(18,'','837462833','',''),(19,'Laface','','',''),(42,'Fresh','','','');
/*!40000 ALTER TABLE `General_person` ENABLE KEYS */;
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
INSERT INTO `General_unit_type` VALUES (34),(35),(36),(37),(38),(48);
/*!40000 ALTER TABLE `General_unit_type` ENABLE KEYS */;
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
  CONSTRAINT `job_id_refs_id_32aeb4f3` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_8a14fd3c` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_nonmaterial`
--

LOCK TABLES `General_nonmaterial` WRITE;
/*!40000 ALTER TABLE `General_nonmaterial` DISABLE KEYS */;
INSERT INTO `General_nonmaterial` VALUES (1,'acollida Autoocupats','',53),(2,'formació Moneda Social','',53);
/*!40000 ALTER TABLE `General_nonmaterial` ENABLE KEYS */;
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
  CONSTRAINT `in_unit_id_refs_id_e045a3a5` FOREIGN KEY (`in_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `out_unit_id_refs_id_e045a3a5` FOREIGN KEY (`out_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `record_id_refs_id_e333dd70` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `Welcome_ic_document_type` VALUES (13),(14),(15),(16),(27),(28);
/*!40000 ALTER TABLE `Welcome_ic_document_type` ENABLE KEYS */;
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
  KEY `Invoices_emailnotification_30669b4d` (`sent_to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_emailnotification`
--

LOCK TABLES `Invoices_emailnotification` WRITE;
/*!40000 ALTER TABLE `Invoices_emailnotification` DISABLE KEYS */;
INSERT INTO `Invoices_emailnotification` VALUES (1,3,NULL,2,1,'2014-08-05',5);
/*!40000 ALTER TABLE `Invoices_emailnotification` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_csvimport`
--

LOCK TABLES `csvimport_csvimport` WRITE;
/*!40000 ALTER TABLE `csvimport_csvimport` DISABLE KEYS */;
INSERT INTO `csvimport_csvimport` VALUES (5,'Invoices.tax','','csv/periodTaxes_4.csv','csv/periodTaxes_4.csv','','manual','Using mapping from first row of CSV file','2014-08-05','aleph');
/*!40000 ALTER TABLE `csvimport_csvimport` ENABLE KEYS */;
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
  `join_fee_id` int(11) NOT NULL,
  `ic_CESnum` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `virtual_market` tinyint(1) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_membership_6922ec88` (`human_id`),
  KEY `Welcome_ic_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_membership_44454d15` (`ic_company_id`),
  KEY `Welcome_ic_membership_2731fa00` (`contribution_id`),
  KEY `Welcome_ic_membership_3f4dd712` (`join_fee_id`),
  CONSTRAINT `contribution_id_refs_id_803a7b3a` FOREIGN KEY (`contribution_id`) REFERENCES `General_relation` (`id`),
  CONSTRAINT `human_id_refs_id_90a969ae` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_company_id_refs_human_id_ad6c338f` FOREIGN KEY (`ic_company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_project_id_refs_human_id_5db24bd9` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `ic_record_id_refs_id_2333c0a4` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `join_fee_id_refs_ic_record_id_b65e7f0b` FOREIGN KEY (`join_fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership`
--

LOCK TABLES `Welcome_ic_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership` DISABLE KEYS */;
INSERT INTO `Welcome_ic_membership` VALUES (2,17,3,NULL,13,NULL,NULL,1,'',0),(4,4,3,NULL,12,'2014-08-20',NULL,3,'COOP0111',0),(19,42,3,NULL,14,NULL,NULL,18,'',0);
/*!40000 ALTER TABLE `Welcome_ic_membership` ENABLE KEYS */;
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
  CONSTRAINT `human_id_refs_id_a037337f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `project_id_refs_human_id_ff302cd2` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `relation_id_refs_id_ba34c004` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_projects`
--

LOCK TABLES `General_rel_human_projects` WRITE;
/*!40000 ALTER TABLE `General_rel_human_projects` DISABLE KEYS */;
INSERT INTO `General_rel_human_projects` VALUES (1,18,17,27),(2,42,1,27),(3,42,17,13),(6,4,17,NULL);
/*!40000 ALTER TABLE `General_rel_human_projects` ENABLE KEYS */;
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
  CONSTRAINT `material_id_refs_id_0f893e3c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `record_id_refs_id_2ce02938` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
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
  CONSTRAINT `human_id_refs_id_27a27746` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `material_id_refs_id_096e6125` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `relation_id_refs_id_a156018f` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_materials`
--

LOCK TABLES `General_rel_human_materials` WRITE;
/*!40000 ALTER TABLE `General_rel_human_materials` DISABLE KEYS */;
INSERT INTO `General_rel_human_materials` VALUES (8,4,1,37);
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
  CONSTRAINT `address_id_refs_id_705aef0e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `material_id_refs_id_bbaf7619` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `relation_id_refs_id_ef8a49fc` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_addresses`
--

LOCK TABLES `General_rel_material_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_material_addresses` DISABLE KEYS */;
INSERT INTO `General_rel_material_addresses` VALUES (1,1,1,42);
/*!40000 ALTER TABLE `General_rel_material_addresses` ENABLE KEYS */;
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
INSERT INTO `General_being_type` VALUES (4),(5),(6),(13),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(64);
/*!40000 ALTER TABLE `General_being_type` ENABLE KEYS */;
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
INSERT INTO `Welcome_ic_record_type` VALUES (3),(4),(5),(6),(7),(8),(9),(10),(11),(13),(14),(15),(16),(17),(18),(19),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36);
/*!40000 ALTER TABLE `Welcome_ic_record_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_job`
--

LOCK TABLES `General_job` WRITE;
/*!40000 ALTER TABLE `General_job` DISABLE KEYS */;
INSERT INTO `General_job` VALUES (1,'Autogestió','autogestionar','autogestionant','',NULL,1,4,1,0,''),(2,'Coordinació','coordinar','coordinant','',1,2,3,1,1,''),(3,'Desenvolupament','desenvolupar','desenvolupant','',NULL,1,2,2,0,''),(4,'Transport','transportar','transportant','',NULL,1,2,3,0,'');
/*!40000 ALTER TABLE `General_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_sales_movement`
--

DROP TABLE IF EXISTS `Invoices_sales_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_sales_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooper_id` int(11) NOT NULL,
  `concept` varchar(200) NOT NULL,
  `execution_date` date DEFAULT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `planned_date` date NOT NULL,
  `who_manage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_sales_movement_0e79bd52` (`cooper_id`),
  KEY `Invoices_sales_movement_b2321453` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_sales_movement`
--

LOCK TABLES `Invoices_sales_movement` WRITE;
/*!40000 ALTER TABLE `Invoices_sales_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_sales_movement` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'migration history','south','migrationhistory'),(8,'csv import','csvimport','csvimport'),(9,'import model','csvimport','importmodel'),(10,'H - Moneda','Invoices','currencies'),(11,'F - IVA','Invoices','vats'),(12,'A - Taula quotes','Invoices','tax'),(13,'I - Cooperativa','Invoices','coop'),(14,'company','Invoices','company'),(15,'B - Client','Invoices','client'),(16,'C - Proveïdor','Invoices','provider'),(17,'D - Socia','Invoices','cooper'),(18,'G - Trimestres','Invoices','period'),(19,'01 - Factura Emesa','Invoices','sales_invoice'),(20,'02 - Factura Despesa','Invoices','purchases_invoice'),(21,'Línia de factura emesa','Invoices','sales_line'),(22,'Línia de factura despesa','Invoices','purchases_line'),(23,'L - Abonament','Invoices','sales_movement'),(24,'M - Reintegrament','Invoices','purchases_movement'),(25,'03 - Resultats','Invoices','period_close'),(26,'Pagament','Invoices','period_payment'),(27,'E - Importar CSV (socies)','Invoices','csvimport'),(28,'email','Invoices','email'),(29,'J - Notificacions programades','Invoices','emailnotification'),(30,'K - Transaccions','Invoices','cooper_proxy_transactions'),(31,'L - Balanç projecte','Invoices','cooper_proxy_balance'),(32,'B - Els meus clients i proveïdors','Invoices','cooper_proxy_companies'),(34,'c- Tipus','General','type'),(35,'Tipus d\'entitat','General','being_type'),(36,'Humà','General','human'),(37,'Persona','General','person'),(38,'Projecte','General','project'),(39,'Tipus de Projecte','General','project_type'),(40,'Empresa','General','company'),(41,'Tipus d\'Empresa','General','company_type'),(42,'H_ofi','General','rel_human_jobs'),(43,'H_adr','General','rel_human_addresses'),(44,'H_reg','General','rel_human_regions'),(45,'H_rec','General','rel_human_records'),(46,'H_mat','General','rel_human_materials'),(47,'H_inm','General','rel_human_nonmaterials'),(48,'H_per','General','rel_human_persons'),(49,'H_pro','General','rel_human_projects'),(50,'H_emp','General','rel_human_companies'),(51,'M_inm','General','rel_material_nonmaterials'),(52,'M_rec','General','rel_material_records'),(53,'M_adr','General','rel_material_addresses'),(55,'Relació','General','relation'),(56,'Ofici','General','job'),(57,'Tipus d\'Espai','General','space_type'),(58,'Adreça','General','address'),(59,'Tipus d\'Adreça','General','address_type'),(60,'Regió','General','region'),(61,'Tipus de Regió','General','region_type'),(62,'Tipus d\'Obra','General','artwork_type'),(63,'Obra Inmaterial','General','nonmaterial'),(64,'Tipus d\'obra Inmaterial','General','nonmaterial_type'),(65,'Imatge','General','image'),(66,'Obra Material','General','material'),(67,'Tipus d\'obra Material','General','material_type'),(68,'Actiu','General','asset'),(69,'Registre','General','record'),(70,'Tipus de Registre','General','record_type'),(71,'Unitat','General','unit'),(72,'Tipus d\'Unitat','General','unit_type'),(73,'Equivalencia entre Unitats','General','unitratio'),(74,'Compte CES','General','accountces'),(75,'Compte Bancari','General','accountbank'),(76,'Compte Criptomoneda','General','accountcrypto'),(77,'Registre CI','Welcome','ic_record'),(78,'Alta de Soci CI','Welcome','ic_membership'),(79,'Soci Autoocupat','Welcome','ic_self_employed'),(80,'Soci Firaire','Welcome','ic_stallholder'),(81,'Sessió formativa','Welcome','learn_session'),(82,'Expedient Projecte Productiu','Welcome','project_accompaniment'),(83,'Quota','Welcome','fee'),(85,'i c_ document','Welcome','ic_document'),(86,'Tipus de Document CI','Welcome','ic_document_type'),(87,'Contracte Laboral CI','Welcome','ic_labor_contract'),(88,'Contracte d\'Adreça CI','Welcome','ic_address_contract'),(89,'Assegurança soci CI','Welcome','ic_insurance'),(90,'Llicència soci CI','Welcome','ic_licence'),(91,'M_mat','General','rel_material_materials'),(92,'M_ofi','General','rel_material_jobs'),(93,'N_rec','General','rel_nonmaterial_records'),(94,'N_adr','General','rel_nonmaterial_addresses'),(95,'N_ofi','General','rel_nonmaterial_jobs'),(96,'N_inm','General','rel_nonmaterial_nonmaterials'),(97,'c- Tipus CI','Welcome','ic_type'),(98,'Tipus de Registre','Welcome','ic_record_type'),(99,'Forma de pagament','Welcome','payment_type'),(100,'Alta de Soci Afí CI','Welcome','ic_akin_membership'),(101,'Alta de Soci Cooperatiu individual CI','Welcome','ic_person_membership'),(102,'Alta de Projecte Col·lectiu CI','Welcome','ic_project_membership'),(103,'Alta Membre: procés activació','public_form','registrationprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  KEY `Invoices_sales_invoice_4fea5d6a` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_sales_invoice`
--

LOCK TABLES `Invoices_sales_invoice` WRITE;
/*!40000 ALTER TABLE `Invoices_sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_sales_invoice` ENABLE KEYS */;
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
INSERT INTO `General_artwork_type` VALUES (9),(10),(11),(12),(14),(15),(16),(17),(18),(34),(35),(36),(37),(38),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61);
/*!40000 ALTER TABLE `General_artwork_type` ENABLE KEYS */;
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
INSERT INTO `Welcome_ic_document` VALUES (6,27,''),(9,27,''),(12,28,''),(21,14,''),(22,15,'');
/*!40000 ALTER TABLE `Welcome_ic_document` ENABLE KEYS */;
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
  KEY `Invoices_sales_line_882eda97` (`percent_invoiced_vat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_sales_line`
--

LOCK TABLES `Invoices_sales_line` WRITE;
/*!40000 ALTER TABLE `Invoices_sales_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_sales_line` ENABLE KEYS */;
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
  CONSTRAINT `human_id_refs_id_5eaaaa15` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `region_id_refs_id_c4f5f71c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
  CONSTRAINT `unit_type_id_refs_artwork_type_id_5cc88dc7` FOREIGN KEY (`unit_type_id`) REFERENCES `General_unit_type` (`artwork_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  CONSTRAINT `address_id_refs_id_7fe0517a` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_1bb0b026` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
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
  CONSTRAINT `company_id_refs_human_id_53c2a07e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_7885c79c` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_record`
--

LOCK TABLES `General_record` WRITE;
/*!40000 ALTER TABLE `General_record` DISABLE KEYS */;
INSERT INTO `General_record` VALUES (1,'(eco) CIC (Cooperativa Integral Catalana) COOP0001',NULL,16),(3,'EcoCoop * 5 = Hora','',58),(4,'EcoCoop * 1 = Euro','',59),(5,'Riu * 1 = Euro','',59),(38,'(eco) bumbum (Sebas) COOP0111',NULL,16),(42,'(FAC) Sebas (bumbum) fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4',NULL,17),(43,'triodos: XIPU 2347563984582345',NULL,18);
/*!40000 ALTER TABLE `General_record` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `General_project_type` VALUES (13),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_vats`
--

LOCK TABLES `Invoices_vats` WRITE;
/*!40000 ALTER TABLE `Invoices_vats` DISABLE KEYS */;
INSERT INTO `Invoices_vats` VALUES (1,0),(2,4),(3,10),(4,21);
/*!40000 ALTER TABLE `Invoices_vats` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_period`
--

LOCK TABLES `Invoices_period` WRITE;
/*!40000 ALTER TABLE `Invoices_period` DISABLE KEYS */;
INSERT INTO `Invoices_period` VALUES (1,'T1','2014-01-01','2014-04-01','2014-04-10',0),(2,'T2','2014-04-01','2014-07-01','2014-07-10',0),(3,'T3','2014-07-01','2014-10-01','2014-10-10',0);
/*!40000 ALTER TABLE `Invoices_period` ENABLE KEYS */;
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
  CONSTRAINT `human_id_refs_id_e1b3b25a` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `job_id_refs_id_8fcd99c8` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  CONSTRAINT `relation_id_refs_id_6bff0d33` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_jobs`
--

LOCK TABLES `General_rel_human_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_human_jobs` DISABLE KEYS */;
INSERT INTO `General_rel_human_jobs` VALUES (1,3,1,29),(2,18,2,29),(3,4,3,29),(4,19,3,28);
/*!40000 ALTER TABLE `General_rel_human_jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_company`
--

LOCK TABLES `Invoices_company` WRITE;
/*!40000 ALTER TABLE `Invoices_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_company` ENABLE KEYS */;
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
  PRIMARY KEY (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_provider`
--

LOCK TABLES `Invoices_provider` WRITE;
/*!40000 ALTER TABLE `Invoices_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_provider` ENABLE KEYS */;
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
  CONSTRAINT `human_id_refs_id_4b3e025c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_9dc62d11` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `relation_id_refs_id_f06466de` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_records`
--

LOCK TABLES `General_rel_human_records` WRITE;
/*!40000 ALTER TABLE `General_rel_human_records` DISABLE KEYS */;
INSERT INTO `General_rel_human_records` VALUES (11,4,38,36),(12,3,1,36),(14,4,42,36),(15,15,43,36);
/*!40000 ALTER TABLE `General_rel_human_records` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_type`
--

LOCK TABLES `Welcome_ic_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_type` VALUES (1,'Registre CI','',NULL,1,54,1,0,'iC_Record'),(2,'Forma de Pagament','',NULL,1,16,2,0,''),(3,'alta Soci CI','',4,3,10,1,2,'iC_Membership'),(4,'Alta de Membre','',1,2,17,1,1,''),(5,'alta Proj. Autoocupat','',4,11,14,1,2,'iC_Self_Employed'),(6,'Document CI','',1,18,31,1,1,'iC_Document'),(7,'alta Soci Coop. Individual','',3,4,5,1,3,'iC_Person_Membership'),(8,'alta Proj. Col·lectiu','',3,6,7,1,3,'iC_Project_Membership'),(9,'alta Proj. Públic','',3,8,9,1,3,''),(10,'alta Soci Afí Individual','',4,15,16,1,2,'iC_Akin_Membership'),(11,'alta Proj. Firaire','',5,12,13,1,3,'iC_Stallholder'),(13,'Contracte d\'Adreça','',6,19,24,1,2,'iC_Address_Contract'),(14,'Llicència soci','',6,25,26,1,2,'iC_Licence'),(15,'Assegurança soci','',6,27,28,1,2,'iC_Insurance'),(16,'Contracte Laboral','',6,29,30,1,2,'iC_Labor_Contract'),(17,'Quota','',1,32,47,1,1,'Fee'),(18,'quota d\'Alta','',17,33,38,1,2,'join_fee'),(19,'quota Trimestral','',17,39,46,1,2,'quarterly_fee'),(20,'pagament en Moneda Social','',26,9,10,2,2,''),(21,'pagament amb Hores de Treball','',26,13,14,2,2,''),(22,'pagament amb Criptomoneda','',2,2,3,2,1,''),(23,'pagament en Metàl·lic','',26,11,12,2,2,''),(24,'pagament per Transferència Bancària','',2,4,5,2,1,''),(25,'pagament fent Ingrés al Banc','',2,6,7,2,1,''),(26,'pagament presencial','',2,8,15,2,1,'face-to-face'),(27,'contracte de Lloguer','',13,20,21,1,3,''),(28,'contracte de Cessió','',13,22,23,1,3,''),(29,'quota 1T','',19,40,41,1,3,''),(30,'quota 2T','',19,42,43,1,3,''),(31,'quota 3T','',19,44,45,1,3,''),(32,'Sessió / Formació','',1,48,53,1,1,'Learn_Session'),(33,'reg Sessió d\'Acollida','',32,49,50,1,2,'welcome_session'),(34,'reg Sessió MonedaSocial','',32,51,52,1,2,'socialcoin_session'),(35,'quota alta Individual','',18,34,35,1,3,'(30_eco) individual'),(36,'quota alta Col·lectiva','',18,36,37,1,3,'(60_eco) collective');
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_type`
--

LOCK TABLES `General_type` WRITE;
/*!40000 ALTER TABLE `General_type` DISABLE KEYS */;
INSERT INTO `General_type` VALUES (1,'Ésser','',NULL,1,46,1,0,'Being'),(2,'Espai','',NULL,1,24,2,0,'Space'),(3,'Obra','',NULL,1,58,3,0,'Artwork'),(4,'Persona','',1,2,3,1,1,'Person'),(5,'Projecte','',1,4,37,1,1,'Project'),(6,'Empresa','',1,38,45,1,1,'Company'),(7,'Adreça','',2,2,9,2,1,'Address'),(8,'Regió','',2,10,23,2,1,'Region'),(9,'Material','',3,2,9,3,1,'Material'),(10,'Inmaterial','',3,10,23,3,1,'Nonmaterial'),(11,'Registre','',3,24,43,3,1,'Record'),(12,'Unitat','',3,44,57,3,1,'Unit'),(13,'Projecte CI','',5,5,34,1,2,''),(14,'Equivalencia d\'Unitats','',11,25,34,3,2,'UnitRatio'),(15,'Compte monetari','',11,35,42,3,2,''),(16,'compte CES','',15,36,37,3,3,'AccountCes'),(17,'compte Criptomoneda','',15,38,39,3,3,'AccountCrypto'),(18,'compte Bancari','',15,40,41,3,3,'AccountBank'),(19,'Cooperativa','',6,39,40,1,2,'cooperative'),(20,'Bancaria','',6,41,42,1,2,'bank'),(21,'Nucli d\'Autogestió Local','',23,7,8,1,4,''),(22,'Ecoxarxa','',23,9,10,1,4,'ces'),(23,'Públic','',13,6,17,1,3,'public'),(24,'Cooperativa Integral','',23,11,12,1,4,'ces'),(25,'Productiu Public','',23,13,14,1,4,''),(26,'Servei Comú','',23,15,16,1,4,''),(27,'Cooperatiu Col·lectiu','',63,29,30,1,4,''),(28,'Grup de Consum','',63,31,32,1,4,''),(29,'De Serveis','',13,18,19,1,3,''),(30,'PAIC sense facturació','',13,20,21,1,3,''),(31,'Autoocupat','',13,22,27,1,3,''),(32,'Autoocupat Firaire','',31,23,24,1,4,''),(33,'PAIC amb facturació','',31,25,26,1,4,''),(34,'Moneda','',12,45,52,3,2,'currency'),(35,'Moneda Social','',34,46,47,3,3,'social_currency'),(36,'Criptomoneda','',34,48,49,3,3,'crypto_currency'),(37,'Moneda Fiat','',34,50,51,3,3,'fiat_currency'),(38,'Àrea','',12,53,54,3,2,'area'),(39,'Continent','',8,11,20,2,2,''),(40,'País','',39,12,19,2,3,''),(41,'Comunitat Cultural','',40,13,18,2,4,''),(42,'Bioregió','',41,14,15,2,5,''),(43,'Comarca','',41,16,17,2,5,'region'),(44,'Espai Polivalent Col·lectiu','',7,3,4,2,2,''),(45,'Taller','',7,5,6,2,2,''),(46,'Habitatge','',7,7,8,2,2,''),(47,'Xarxa Mundial','',5,35,36,1,2,''),(48,'Temps','',12,55,56,3,2,'time_currency'),(49,'Formació','',50,12,19,3,3,''),(50,'obra Cultural','',10,11,20,3,2,''),(51,'obra Digital','',10,21,22,3,2,''),(52,'formació CI','',49,13,18,3,4,'ic_learn'),(53,'sessió de formació Col·lectiva','',52,14,15,3,5,''),(54,'sessió de formació Individual','',52,16,17,3,5,''),(55,'Màquina','',9,3,8,3,2,''),(56,'Vehicle','',55,4,7,3,3,''),(57,'Cotxe','',56,5,6,3,4,''),(58,'equivalencia Moneda - Temps','',14,26,27,3,3,''),(59,'equivalencia Moneda - Moneda','',14,28,29,3,3,''),(60,'equivalencia Àrea - Àrea','',14,30,31,3,3,''),(61,'equivalencia Temps - Temps','',14,32,33,3,3,''),(62,'Planeta','',8,21,22,2,2,''),(63,'Online','',13,28,33,1,3,'online'),(64,'Asseguradora','',6,43,44,1,2,'');
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
  `number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_licence_57d16b26` (`rel_address_id`),
  KEY `Welcome_ic_licence_bfdae731` (`rel_job_id`),
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
INSERT INTO `Welcome_ic_licence` VALUES (21,'123o857618754t4tg',NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `Welcome_ic_licence` ENABLE KEYS */;
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
  CONSTRAINT `human_id_refs_id_fa4695a7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `nonmaterial_id_refs_id_9eb375a4` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `relation_id_refs_id_759394a9` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_nonmaterials`
--

LOCK TABLES `General_rel_human_nonmaterials` WRITE;
/*!40000 ALTER TABLE `General_rel_human_nonmaterials` DISABLE KEYS */;
INSERT INTO `General_rel_human_nonmaterials` VALUES (1,4,1,40);
/*!40000 ALTER TABLE `General_rel_human_nonmaterials` ENABLE KEYS */;
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
  KEY `Invoices_purchases_invoice_3f126c2d` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_purchases_invoice`
--

LOCK TABLES `Invoices_purchases_invoice` WRITE;
/*!40000 ALTER TABLE `Invoices_purchases_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_purchases_invoice` ENABLE KEYS */;
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
  `mentor_comment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_self_employed_37d462ff` (`ic_membership_id`),
  KEY `Welcome_ic_self_employed_259761f6` (`rel_accountBank_id`),
  KEY `Welcome_ic_self_employed_5bec29b3` (`mentor_membership_id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `ic_record_id_refs_id_8ebb96a9` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `mentor_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`mentor_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `rel_accountBank_id_refs_record_id_939a5950` FOREIGN KEY (`rel_accountBank_id`) REFERENCES `General_accountbank` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed`
--

LOCK TABLES `Welcome_ic_self_employed` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed` VALUES (7,4,NULL,NULL,0,NULL,18.00,0,NULL,2,''),(27,2,NULL,NULL,0,NULL,NULL,0,NULL,NULL,''),(28,19,NULL,NULL,0,NULL,NULL,0,NULL,NULL,'');
/*!40000 ALTER TABLE `Welcome_ic_self_employed` ENABLE KEYS */;
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
  CONSTRAINT `parent_id_refs_id_d0933889` FOREIGN KEY (`parent_id`) REFERENCES `General_region` (`id`),
  CONSTRAINT `region_type_id_refs_space_type_id_64b2d605` FOREIGN KEY (`region_type_id`) REFERENCES `General_region_type` (`space_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_email`
--

LOCK TABLES `Invoices_email` WRITE;
/*!40000 ALTER TABLE `Invoices_email` DISABLE KEYS */;
INSERT INTO `Invoices_email` VALUES (1,'gestioci@cooperativa.cat','camp reservat pel sistema','Aviso de cierre automático','Como no has cerrado se cerrará automáticamente',1);
/*!40000 ALTER TABLE `Invoices_email` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'AUTOOCUPAT'),(3,'iC_Akin_Membership'),(2,'iC_Person_Membership'),(4,'iC_Project_Membership');
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
INSERT INTO `General_project` VALUES (1,47,NULL,'','',0,1,8,1,0),(2,47,1,'','',0,2,7,1,1),(3,24,2,'','',0,3,6,1,2),(17,22,3,'','',0,4,5,1,3);
/*!40000 ALTER TABLE `General_project` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_licences`
--

LOCK TABLES `Welcome_ic_self_employed_rel_licences` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_licences` VALUES (20,7,21);
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-08-05 17:29:14',1,11,'1','0',1,''),(2,'2014-08-05 17:29:18',1,11,'2','4',1,''),(3,'2014-08-05 17:29:21',1,11,'3','10',1,''),(4,'2014-08-05 17:29:24',1,11,'4','21',1,''),(5,'2014-08-05 17:30:13',1,18,'1','2014 T1',1,''),(6,'2014-08-05 17:30:40',1,18,'2','2014 T2',1,''),(7,'2014-08-05 17:30:42',1,18,'2','2014 T2',2,'No ha cambiado ningún campo.'),(8,'2014-08-05 17:31:19',1,18,'3','2014 T3',1,''),(9,'2014-08-05 17:34:26',1,3,'1','AUTOOCUPAT',1,''),(10,'2014-08-05 17:34:44',1,4,'2','pepe',1,''),(11,'2014-08-05 17:36:36',1,4,'2','pepe',2,'Modificado/a first_name, last_name, email y groups.'),(12,'2014-08-05 17:41:47',1,8,'5','csv/periodTaxes_4.csv',1,''),(13,'2014-08-05 17:42:14',1,13,'1','Xarxa de profesionals i usuàries',1,''),(14,'2014-08-05 17:43:04',1,13,'2','Interprofesionals',1,''),(15,'2014-08-05 17:43:17',1,10,'1','BTC',1,''),(16,'2014-08-05 17:43:21',1,10,'2','EURO',1,''),(17,'2014-08-05 17:43:24',1,10,'3','ECO',1,''),(18,'2014-08-05 17:43:36',1,10,'4','SALDO',1,''),(19,'2014-08-05 17:46:01',1,29,'1','Aviso de cierre automático',1,''),(20,'2014-08-06 14:52:35',3,38,'1','Revolució Integral (RI)',1,''),(21,'2014-08-06 14:52:58',3,38,'2','Xarxa de Cooperatives Integrals (XCI)',1,''),(22,'2014-08-06 14:53:14',3,38,'3','Cooperativa Integral Catalana (CIC)',1,''),(23,'2014-08-06 14:54:21',3,37,'4','Sebas (bumbum)',1,''),(24,'2014-08-06 15:35:01',3,60,'1','Països Catalans',1,''),(25,'2014-08-06 15:35:15',3,60,'2','Catalunya',1,''),(26,'2014-08-06 15:35:28',3,60,'3','Barcelonès',1,''),(27,'2014-08-06 21:31:47',3,34,'1','Ésser (Being)',1,''),(28,'2014-08-06 21:32:13',3,34,'2','Espai (Space)',1,''),(29,'2014-08-06 21:32:36',3,34,'3','Obra (Artwork)',1,''),(30,'2014-08-06 21:33:01',3,34,'4','Persona (Person)',1,''),(31,'2014-08-06 21:33:15',3,34,'5','Projecte (Project)',1,''),(32,'2014-08-06 21:33:37',3,34,'6','Empresa (Company)',1,''),(33,'2014-08-06 21:34:18',3,34,'7','Adreça (Address)',1,''),(34,'2014-08-06 21:34:35',3,34,'8','Regió (Region)',1,''),(35,'2014-08-06 21:35:32',3,34,'9','Material (Material)',1,''),(36,'2014-08-06 21:36:24',3,34,'10','Inmaterial (Nonmaterial)',1,''),(37,'2014-08-06 21:36:50',3,34,'11','Registre (Record)',1,''),(38,'2014-08-06 21:37:13',3,34,'12','Unitat (Unit)',1,''),(39,'2014-08-06 21:57:27',3,39,'13','Projecte CI',1,''),(40,'2014-08-06 21:59:55',3,70,'14','Equivalencia d\'Unitats (UnitRatio)',1,''),(41,'2014-08-06 22:00:19',3,70,'15','Compte monetari',1,''),(42,'2014-08-06 22:00:34',3,70,'16','Compte CES (AccountCes)',1,''),(43,'2014-08-06 22:01:10',3,70,'17','Compte Criptomoneda (AccountCrypto)',1,''),(44,'2014-08-06 22:01:30',3,70,'18','Compte Bancari (AccountCrypto)',1,''),(45,'2014-08-06 22:02:58',3,41,'19','Cooperativa',1,''),(46,'2014-08-06 22:03:35',3,41,'20','Bancaria',1,''),(47,'2014-08-06 22:04:29',3,39,'21','Nucli d\'Autogestió Local',1,''),(48,'2014-08-06 22:04:43',3,39,'22','Ecoxarxa',1,''),(49,'2014-08-06 22:05:53',3,39,'23','Públic',1,''),(50,'2014-08-06 22:06:05',3,39,'21','Nucli d\'Autogestió Local',2,'Modificat parent.'),(51,'2014-08-06 22:06:13',3,39,'22','Ecoxarxa',2,'Modificat parent.'),(52,'2014-08-06 22:06:55',3,39,'24','Cooperativa Integral',1,''),(53,'2014-08-06 22:07:18',3,39,'25','Productiu Public',1,''),(54,'2014-08-06 22:07:37',3,39,'26','Servei Comú',1,''),(55,'2014-08-06 22:09:10',3,39,'27','Cooperatiu Col·lectiu',1,''),(56,'2014-08-06 22:09:31',3,39,'28','Grup de Consum',1,''),(57,'2014-08-06 22:10:46',3,39,'29','De Serveis',1,''),(58,'2014-08-06 22:11:34',3,39,'30','PAIC sense facturació',1,''),(59,'2014-08-06 22:12:24',3,39,'31','Autoocupat',1,''),(60,'2014-08-06 22:12:40',3,39,'32','Autoocupat Firaire',1,''),(61,'2014-08-06 22:12:54',3,39,'33','PAIC amb facturació',1,''),(62,'2014-08-06 22:14:34',3,72,'34','Moneda',1,''),(63,'2014-08-06 22:14:54',3,72,'35','Moneda Social',1,''),(64,'2014-08-06 22:15:11',3,72,'36','Criptomoneda',1,''),(65,'2014-08-06 22:15:24',3,72,'37','Moneda Fiat',1,''),(66,'2014-08-06 22:15:50',3,72,'38','Àrea',1,''),(67,'2014-08-06 22:17:40',3,61,'39','Continent',1,''),(68,'2014-08-06 22:18:09',3,61,'40','País',1,''),(69,'2014-08-06 22:18:49',3,61,'41','Comunitat Cultural',1,''),(70,'2014-08-06 22:19:45',3,61,'40','País',2,'Modificat parent.'),(71,'2014-08-06 22:20:04',3,61,'41','Comunitat Cultural',2,'Modificat parent.'),(72,'2014-08-06 22:20:32',3,61,'42','Bioregió',1,''),(73,'2014-08-06 22:20:44',3,61,'43','Comarca',1,''),(74,'2014-08-06 22:22:19',3,59,'44','Espai Polivalent Col·lectiu',1,''),(75,'2014-08-06 22:23:56',3,59,'45','Taller',1,''),(76,'2014-08-06 22:24:35',3,59,'46','Habitatge',1,''),(77,'2014-08-07 01:46:10',3,55,'1',':Relació Humà - Humà, relacionar',1,''),(78,'2014-08-07 01:47:37',3,55,'2',':Relació Humà - Art, ',1,''),(79,'2014-08-07 01:47:59',3,55,'1',':Relació Humà - Humà, ',2,'Modificat verb i gerund.'),(80,'2014-08-07 01:48:28',3,55,'3',':Relació Humà - Espai, ',1,''),(81,'2014-08-07 01:48:40',3,55,'4',':Relació Humà - Obra, ',1,''),(82,'2014-08-07 01:50:16',3,55,'5',':Relació Persona - Projecte, ',1,''),(83,'2014-08-07 01:51:16',3,55,'6',':Relació Persona - Persona, ',1,''),(84,'2014-08-07 01:53:32',3,55,'7','Participació, participar',1,''),(85,'2014-08-07 01:54:18',3,55,'8','Dinamització, dinamitzar',1,''),(86,'2014-08-07 01:57:51',3,55,'9','Col·laboració, col·laborar',1,''),(87,'2014-08-07 12:00:15',3,97,'1','registre CI',1,''),(88,'2014-08-07 12:01:16',3,97,'2','Forma de Pagament',1,''),(89,'2014-08-07 12:05:02',3,98,'3','Alta Soci CI (iC_Membership)',1,''),(90,'2014-08-07 12:05:38',3,98,'4','Alta de Membre',1,''),(91,'2014-08-07 12:06:45',3,98,'3','Alta Soci CI (iC_Membership)',2,'Modificat parent.'),(92,'2014-08-07 12:07:49',3,98,'5','alta Soci Autoocupat (iC_Self_Employed)',1,''),(93,'2014-08-07 12:08:05',3,98,'3','alta Soci CI (iC_Membership)',2,'Modificat name.'),(94,'2014-08-07 12:16:00',3,98,'6','Document CI (iC_Document)',1,''),(95,'2014-08-07 12:20:29',3,97,'1','Registre CI (iC_Record)',2,'Modificat name i clas.'),(96,'2014-08-07 12:20:50',3,97,'4','alta de Membre',2,'Modificat name.'),(97,'2014-08-07 12:20:58',3,97,'3','Alta Soci CI (iC_Membership)',2,'Modificat name.'),(98,'2014-08-07 12:21:03',3,97,'5','Alta Soci Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(99,'2014-08-07 12:27:27',3,97,'7','alta Soci Cooperatiu Individual',1,''),(100,'2014-08-07 12:28:26',3,97,'8','alta Projecte Col·lectiu',1,''),(101,'2014-08-07 12:29:01',3,97,'9','alta Projecte Públic',1,''),(102,'2014-08-07 12:30:29',3,97,'10','alta Soci Afí Individual',1,''),(103,'2014-08-07 12:31:26',3,97,'11','alta Projecte Firaire',1,''),(104,'2014-08-07 12:31:48',3,97,'5','Alta Projecte Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(105,'2014-08-07 12:32:25',3,97,'4','Alta de Membre',2,'Modificat name.'),(106,'2014-08-07 12:32:36',3,97,'3','alta Soci CI (iC_Membership)',2,'Modificat name.'),(107,'2014-08-07 12:32:46',3,97,'5','alta Projecte Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(108,'2014-08-07 12:32:58',3,97,'11','alta Projecte Firaire (iC_Stallholder)',2,'Modificat clas.'),(109,'2014-08-07 17:20:58',3,97,'1','Registre CI (iC_Record)',1,''),(110,'2014-08-07 17:21:24',3,97,'2','Forma de Pagament (Payment_Type)',1,''),(111,'2014-08-07 17:23:14',3,98,'3','Alta de Membre',1,''),(112,'2014-08-07 17:24:26',3,98,'4','alta Soci Afí Individual (iC_Akin_Membership)',1,''),(113,'2014-08-07 17:25:09',3,98,'5','alta Soci CI (iC_Membership)',1,''),(114,'2014-08-07 17:26:25',3,98,'6','alta Soci Cooperatiu Individual',1,''),(115,'2014-08-07 17:37:57',3,98,'6','alta Soci Cooperatiu Individual (Person)',2,'Modificat clas.'),(116,'2014-08-07 17:38:24',3,98,'7','alta Projecte Col·lectiu (Project)',1,''),(117,'2014-08-07 18:01:29',3,98,'6','alta Soci Cooperatiu Individual (person)',2,'Modificat clas.'),(118,'2014-08-07 18:01:36',3,98,'7','alta Projecte Col·lectiu (project)',2,'Modificat clas.'),(119,'2014-08-07 18:02:02',3,98,'8','alta Projecte Públic (public_project)',1,''),(120,'2014-08-07 18:04:26',3,98,'9','alta Projecte Autoocupat (iC_Self_Employed)',1,''),(121,'2014-08-07 18:06:49',3,98,'10','alta Projecte Firaire (iC_Stallholder)',1,''),(122,'2014-08-07 18:07:34',3,98,'11','Document CI (iC_Document)',1,''),(123,'2014-08-07 18:40:19',3,97,'6','alta Soci Cooperatiu Individual (ic_Person_Membership)',2,'Modificat clas.'),(124,'2014-08-07 18:40:37',3,97,'7','alta Projecte Col·lectiu (ic_Project_Membership)',2,'Modificat clas.'),(125,'2014-08-07 18:41:24',3,97,'8','alta Projecte Públic',2,'Modificat clas.'),(126,'2014-08-07 18:45:19',3,98,'12','Contracte d\'Adreça (iC_Address_Contract)',1,''),(127,'2014-08-07 19:02:16',3,86,'13','Llicència soci (iC_Licence)',1,''),(128,'2014-08-07 19:03:05',3,86,'14','Assegurança soci (iC_Insurance)',1,''),(129,'2014-08-07 19:04:06',3,86,'15','Contracte Laboral (iC_Labor_Contract)',1,''),(130,'2014-08-07 19:05:48',3,98,'16','Quota (Fee)',1,''),(131,'2014-08-07 19:08:18',3,98,'17','Acompanyament de Projecte (Project_Accompaniment)',1,''),(132,'2014-08-07 19:09:05',3,98,'18','Sessió / Formació (Learn_Session)',1,''),(133,'2014-08-07 19:16:22',3,99,'19','pagament en Moneda Social',1,''),(134,'2014-08-07 19:16:35',3,99,'20','pagament en Metàl·lic',1,''),(135,'2014-08-07 19:17:04',3,99,'21','pagament amb Hores de Treball',1,''),(136,'2014-08-07 19:17:42',3,99,'22','pagament amb Criptomoneda',1,''),(137,'2014-08-07 19:19:42',3,98,'23','quota d\'Alta',1,''),(138,'2014-08-07 19:20:08',3,98,'24','quota Contracte Laboral',1,''),(139,'2014-08-07 19:20:34',3,98,'24','quota Trimestral',2,'Modificat name.'),(140,'2014-08-07 21:09:58',3,39,'47','Xarxa Mundial',1,''),(141,'2014-08-07 21:10:05',3,38,'1','Revolució Integral (RI)',1,''),(142,'2014-08-07 21:26:20',3,38,'2','Xarxa de Cooperatives Integrals (XCI)',1,''),(143,'2014-08-07 21:27:45',3,38,'3','Cooperativa Integral Catalana (CIC)',1,''),(144,'2014-08-07 21:28:42',3,71,'1','Moneda Social: EcoCoop',1,''),(145,'2014-08-07 21:29:02',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0001\"'),(146,'2014-08-07 21:31:41',3,74,'1','(eco) Cooperativa Integral Catalana (CIC) COOP0001',2,'Cap camp modificat.'),(147,'2014-08-07 21:37:00',3,60,'1','Països Catalans',1,''),(148,'2014-08-07 21:37:13',3,60,'2','Catalunya',1,''),(149,'2014-08-07 21:37:16',3,71,'2','Moneda Social: EcoBàsic',1,''),(150,'2014-08-07 21:37:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eB) Cooperativa Integral Catalana (CIC) CIEB0001\"'),(151,'2014-08-07 21:38:41',3,37,'4','Sebas (bumbum)',1,''),(152,'2014-08-07 21:40:22',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit per \"dinamitzant > Sebas (bumbum)\"'),(153,'2014-08-07 21:40:40',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"col·laborant > Sebas (bumbum)\".'),(154,'2014-08-07 21:41:40',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"Sebas (bumbum)\".'),(155,'2014-08-07 21:41:54',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"col·laborant > Sebas (bumbum)\".'),(156,'2014-08-07 21:48:05',3,71,'3','Criptomoneda: FairCoin',1,''),(157,'2014-08-07 21:49:11',3,37,'4','Sebas (bumbum)',2,'Modificat birth_date. Afegit Compte Criptomoneda \"(FAC) Sebas (bumbum) fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4\"'),(158,'2014-08-07 21:53:47',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(159,'2014-08-07 21:59:05',3,60,'3','Barcelonès',1,''),(160,'2014-08-07 21:59:42',3,71,'4','Àrea: Metre Quadrat',1,''),(161,'2014-08-07 22:00:10',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(162,'2014-08-07 22:03:14',3,55,'10','Oferiment de l\'espai, oferir l\'espai',1,''),(163,'2014-08-07 22:03:22',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit adr \"oferint l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(164,'2014-08-07 22:05:24',3,37,'5','Aleph (aleph)',1,''),(165,'2014-08-07 22:05:38',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit per \"col·laborant > Aleph (aleph)\"'),(166,'2014-08-07 22:48:09',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(167,'2014-08-07 22:49:08',3,74,'7','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(168,'2014-08-07 22:52:13',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(169,'2014-08-07 22:53:05',3,74,'9','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(170,'2014-08-07 22:54:10',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(171,'2014-08-07 22:56:30',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\".'),(172,'2014-08-07 23:05:57',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(173,'2014-08-07 23:08:49',3,74,'16','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(174,'2014-08-07 23:09:15',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(175,'2014-08-07 23:10:45',3,74,'17','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(176,'2014-08-07 23:11:38',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(177,'2014-08-07 23:16:50',3,74,'19','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(178,'2014-08-07 23:28:29',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(179,'2014-08-07 23:40:22',3,74,'30','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(180,'2014-08-07 23:41:06',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(181,'2014-08-07 23:48:23',3,74,'31','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(182,'2014-08-07 23:48:58',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(183,'2014-08-07 23:50:59',3,74,'32','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(184,'2014-08-07 23:53:59',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(185,'2014-08-08 00:02:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\".'),(186,'2014-08-08 00:38:47',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(187,'2014-08-08 00:40:16',3,74,'38','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(188,'2014-08-08 00:40:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(189,'2014-08-08 00:41:12',3,74,'39','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(190,'2014-08-08 00:41:32',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(191,'2014-08-08 00:42:39',3,74,'40','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(192,'2014-08-08 00:43:03',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(193,'2014-08-08 00:50:41',3,74,'41','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(194,'2014-08-08 00:55:55',3,70,'18','Compte Bancari (AccountBank)',2,'Modificat clas.'),(195,'2014-08-08 00:56:01',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\" Afegit Compte Criptomoneda \"(FAC) Cooperativa Integral Catalana (CIC) nolatincpas\"'),(196,'2014-08-08 00:56:55',3,76,'45','(FAC) Cooperativa Integral Catalana (CIC) nolatincpas',3,''),(197,'2014-08-08 00:58:01',3,40,'6','Triodos Bank',1,''),(198,'2014-08-08 00:58:36',3,71,'5','Moneda Fiat: Euro',1,''),(199,'2014-08-08 00:59:04',3,37,'4','Sebas (bumbum)',2,'Afegit Compte Bancari \"(€) Sebas (bumbum) 124512351290581 ()\"'),(200,'2014-08-08 01:03:45',3,40,'6','Triodos Bank (Triodos)',2,'Modificat nickname.'),(201,'2014-08-08 01:28:24',3,64,'48','Digital',1,''),(202,'2014-08-08 01:28:48',3,64,'49','Cultural',1,''),(203,'2014-08-08 09:12:51',3,64,'50','Arxiu digital',1,''),(204,'2014-08-08 09:13:47',3,64,'51','Imatge digital (Image)',1,''),(205,'2014-08-08 11:24:50',3,78,'1','CIC > Sebas (bumbum)',1,''),(206,'2014-08-08 11:32:42',3,100,'3','',1,''),(207,'2014-08-08 11:44:49',3,83,'5','quota d\'Alta: Sebas (bumbum) [30 €] > CIC',1,''),(208,'2014-08-08 11:45:05',3,78,'6','CIC > Sebas (bumbum)',1,''),(209,'2014-08-08 11:45:21',3,78,'6','CIC > Sebas (bumbum)',2,'Modificat name.'),(210,'2014-08-08 12:36:21',3,78,'6','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(211,'2014-08-08 12:43:48',3,83,'5','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat membership.'),(212,'2014-08-08 12:43:57',3,83,'5','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(213,'2014-08-08 12:44:12',3,83,'5','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(214,'2014-08-08 12:52:57',3,77,'3','',3,''),(215,'2014-08-08 12:53:14',3,77,'1','',3,''),(216,'2014-08-08 12:53:32',3,77,'6','',3,''),(217,'2014-08-08 17:21:45',3,83,'7','quota d\'Alta: Sebas (bumbum) [30 €] > CIC',1,''),(218,'2014-08-08 17:21:52',3,78,'8','CIC > Sebas (bumbum)',1,''),(219,'2014-08-08 17:23:54',3,78,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(220,'2014-08-08 17:24:08',3,78,'8','CIC > Sebas (bumbum)',3,''),(221,'2014-08-08 17:25:01',3,78,'9','CIC > Sebas (bumbum)',1,''),(222,'2014-08-08 17:29:22',3,78,'9','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(223,'2014-08-08 17:29:44',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Cap camp modificat.'),(224,'2014-08-08 17:29:55',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Cap camp modificat.'),(225,'2014-08-08 17:34:14',3,100,'10','',1,''),(226,'2014-08-08 17:34:28',3,100,'10','',2,'Cap camp modificat.'),(227,'2014-08-08 17:42:49',3,100,'10','',2,'Cap camp modificat.'),(228,'2014-08-08 17:56:13',3,100,'10','Cooperativa Integral Catalana > Aleph (aleph)',2,'Cap camp modificat.'),(229,'2014-08-08 17:57:27',3,100,'10','CIC > Aleph (aleph)',2,'Cap camp modificat.'),(230,'2014-08-08 20:40:30',3,100,'10','alta Soci Afí Individual: Aleph (aleph)',2,'Cap camp modificat.'),(231,'2014-08-08 20:52:59',3,100,'10','alta Soci Afí Individual: Aleph (aleph)',3,''),(232,'2014-08-08 21:11:58',3,100,'13','alta Soci Afí Individual: Aleph (aleph)',1,''),(233,'2014-08-08 21:12:12',3,100,'13','alta Soci Afí Individual: Aleph (aleph)',2,'Cap camp modificat.'),(234,'2014-08-08 21:23:15',3,100,'13','alta Soci Afí Individual: Aleph (aleph)',2,'Cap camp modificat.'),(235,'2014-08-08 21:23:56',3,37,'5','Aleph (aleph)',2,'Modificat id_card.'),(236,'2014-08-08 21:35:56',3,37,'5','Aleph (aleph)',2,'Modificat id_card.'),(237,'2014-08-08 21:39:14',3,78,'9','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(238,'2014-08-08 21:47:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\".'),(239,'2014-08-08 21:48:17',3,60,'4','Continent Europeu',1,''),(240,'2014-08-08 21:48:24',3,60,'1','Països Catalans',2,'Modificat parent.'),(241,'2014-08-08 21:50:41',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte Bancari \"(€) Sebas (bumbum) 124512351290581 - Triodos Bank (Triodos)\".'),(242,'2014-08-08 21:51:11',3,37,'4','Sebas (bumbum)',2,'Modificat email.'),(243,'2014-08-08 21:54:08',3,67,'52','Vehicle',1,''),(244,'2001-01-13 12:42:38',3,67,'53','Cotxe',1,''),(245,'2014-08-08 22:39:12',3,37,'4','Sebas (bumbum)',2,'Afegit Actiu \"(Cotxe) peugeot 306\"'),(246,'2014-08-08 23:13:16',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(247,'2014-08-09 18:50:04',3,55,'11','Contribució, contribuir',1,''),(248,'2014-08-09 19:25:31',3,72,'38','Àrea (area)',2,'Modificat clas.'),(249,'2014-08-09 19:25:48',3,72,'34','Moneda (currency)',2,'Modificat clas.'),(250,'2014-08-09 19:37:02',3,71,'6','Àrea: Hectàrea',1,''),(251,'2014-08-09 19:37:21',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona) (Sardenya 261-263 - Barcelona)',2,'Modificat size_unit.'),(252,'2014-08-09 19:40:06',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona) (Sardenya 261-263 - Barcelona) (Sardenya 261-263 - Barcelona)',2,'Modificat main_address.'),(253,'2014-08-09 19:42:03',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat name.'),(254,'2014-08-10 13:02:04',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat main_address.'),(255,'2014-08-10 13:04:27',3,37,'7','Marta (tuccia) (tuccia)',1,''),(256,'2014-08-10 13:04:49',3,38,'3','Cooperativa Integral Catalana (CIC) (CIC)',2,'Afegit per \"dinamitzant > Marta (tuccia) (tuccia)\"'),(257,'2014-08-10 13:11:55',3,37,'7','Marta (tuccia)',2,'Modificat name.'),(258,'2014-08-10 13:25:55',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat name.'),(259,'2014-08-11 13:13:04',3,99,'22','pagament amb Criptomoneda',3,''),(260,'2014-08-11 13:20:16',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(261,'2014-08-11 15:42:49',3,55,'12','Referent, referenciar (referent)',1,''),(262,'2014-08-11 15:43:02',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"referenciant > Sebas (bumbum)\".'),(263,'2014-08-15 11:56:04',3,72,'38','Àrea (area)',2,'Modificat clas.'),(264,'2014-08-15 11:56:22',3,72,'34','Moneda (currency)',2,'Modificat clas.'),(265,'2014-08-15 12:08:14',3,98,'7','alta Soci Cooperatiu Individual (ic_Person_Membership)',2,'Modificat clas.'),(266,'2014-08-15 12:08:25',3,98,'7','alta Soci Cooperatiu Individual (iC_Person_Membership)',2,'Modificat clas.'),(267,'2014-08-15 12:08:49',3,98,'8','alta Projecte Col·lectiu (iC_Project_Membership)',2,'Modificat clas.'),(268,'2014-08-15 12:09:05',3,98,'10','alta Soci Afí Individual (iC_Akin_Membership)',2,'Modificat clas.'),(269,'2014-08-15 12:30:39',3,86,'13','Contracte d\'Adreça (iC_Address_Contract)',1,''),(270,'2014-08-15 12:31:38',3,86,'14','Llicència soci (iC_Licence)',1,''),(271,'2014-08-15 12:32:10',3,86,'15','Assegurança soci (iC_Insurance)',1,''),(272,'2014-08-15 12:32:41',3,86,'16','Contracte Laboral (iC_Labor_Contract)',1,''),(273,'2014-08-15 12:34:50',3,98,'17','Quota (Fee)',1,''),(274,'2014-08-15 12:35:31',3,98,'18','quota d\'Alta',1,''),(275,'2014-08-15 12:35:47',3,98,'19','quota Trimestral',1,''),(276,'2014-08-15 12:40:10',3,99,'20','pagament en Moneda Social',1,''),(277,'2014-08-15 12:40:27',3,99,'21','pagament amb Hores de Treball',1,''),(278,'2014-08-15 12:40:52',3,99,'22','pagament amb Criptomoneda',1,''),(279,'2014-08-15 12:41:05',3,99,'23','pagament en Metàl·lic',1,''),(280,'2014-08-15 12:45:55',3,99,'24','pagament per Transferència Bancària',1,''),(281,'2014-08-15 12:46:14',3,99,'25','pagament fent Ingrés al Banc',1,''),(282,'2014-08-15 12:46:50',3,99,'26','pagament presencial (face-to-face)',1,''),(283,'2014-08-15 12:47:08',3,99,'20','pagament en Moneda Social',2,'Modificat parent.'),(284,'2014-08-15 12:47:21',3,99,'23','pagament en Metàl·lic',2,'Modificat parent.'),(285,'2014-08-15 12:47:30',3,99,'21','pagament amb Hores de Treball',2,'Modificat parent.'),(286,'2014-08-15 13:09:18',3,39,'47','Xarxa Mundial',1,''),(287,'2014-08-15 13:09:29',3,38,'1','Revolució Integral (RI) (RI)',1,''),(288,'2014-08-15 13:11:20',3,38,'2','Xarxa de Cooperatives Integrals',1,''),(289,'2014-08-15 13:11:34',3,38,'1','Revolució Integral (RI)',2,'Modificat name.'),(290,'2014-08-15 13:11:58',3,38,'2','Xarxa de Cooperatives Integrals (XCI)',2,'Modificat nickname.'),(291,'2014-08-15 13:12:21',3,38,'3','Cooperativa Integral Catalana (CIC)',1,''),(292,'2014-08-15 13:13:40',3,37,'4','Sebas (bumbum)',1,''),(293,'2014-08-15 13:15:42',3,37,'5','Marta (tuccia)',1,''),(294,'2014-08-15 13:16:23',3,37,'6','Aleph ',1,''),(295,'2014-08-15 13:18:52',3,71,'1','Moneda Social: EcoCoop',1,''),(296,'2014-08-15 13:19:33',3,71,'2','Moneda Fiat: Euro',1,''),(297,'2014-08-15 13:19:57',3,71,'3','Àrea: Metre Quadrat',1,''),(298,'2014-08-15 13:20:15',3,71,'4','Àrea: Hectàrea',1,''),(299,'2014-08-15 13:36:57',3,55,'10','Contribució, contribuir',1,''),(300,'2014-08-15 13:37:59',3,55,'11','Referent, referenciar (referent)',1,''),(301,'2014-08-15 13:42:54',3,55,'12','contribució en alguna comissió, contribuir en comissió',1,''),(302,'2014-08-15 13:43:42',3,55,'13','contribució puntual en tasques organitzatives, contribuir puntualment',1,''),(303,'2014-08-15 13:44:08',3,55,'14','contribució econòmica, contribuir econòmicament',1,''),(304,'2014-08-15 13:52:06',3,55,'10','Contribució, contribuir (contribution)',2,'Modificat clas.'),(305,'2014-08-15 14:20:26',3,37,'6','Aleph ',3,''),(306,'2014-08-15 15:05:04',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(307,'2014-08-15 15:06:14',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(308,'2014-08-15 15:08:45',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(309,'2014-08-15 15:26:45',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(310,'2014-08-15 15:32:30',3,3,'2','iC_Person_Membership',2,'Cap camp modificat.'),(311,'2014-08-15 15:33:38',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(312,'2014-08-15 15:37:26',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(313,'2014-08-15 15:38:51',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(314,'2014-08-15 15:54:12',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(315,'2014-08-15 16:00:59',3,55,'5',':Relació Persona - Projecte,  (rel_pers_proj)',2,'Modificat clas.'),(316,'2014-08-15 16:02:24',3,55,'3',':Relació Humà - Espai,  (rel_hum_addr)',2,'Modificat clas.'),(317,'2014-08-15 16:13:28',3,60,'1','Països Catalans',1,''),(318,'2014-08-15 16:13:41',3,60,'2','Catalunya',1,''),(319,'2014-08-15 16:13:57',3,60,'3','Barcelonès',1,''),(320,'2014-08-15 16:15:53',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(321,'2014-08-15 16:18:15',3,55,'15',':Relació Projecte - Adreça,  (rel_proj_addr)',1,''),(322,'2014-08-15 16:23:19',3,55,'16','Oferiment de l\'espai, oferir l\'espai',1,''),(323,'2014-08-15 16:23:58',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_adr \"oferint l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(324,'2014-08-15 16:25:39',3,55,'17','Gestió de l\'espai, gestionar l\'espai',1,''),(325,'2014-08-15 16:25:43',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a H_adr \"gestionant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(326,'2014-08-15 16:26:13',3,55,'16','Oferiment de l\'espai, oferir l\'espai',2,'Modificat parent.'),(327,'2014-08-15 16:27:18',3,37,'7','alep (alep)',3,''),(328,'2014-08-15 16:29:16',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(329,'2014-08-15 16:44:03',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(330,'2014-08-15 17:16:52',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(331,'2014-08-15 17:18:24',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(332,'2014-08-15 17:23:45',3,37,'8','alep (alep)',3,''),(333,'2014-08-15 17:26:50',3,4,'5','alep',3,''),(334,'2014-08-15 18:08:25',3,37,'5','Marta (tuccia)',3,''),(335,'2014-08-15 18:19:26',3,37,'9',' (tuccia)',3,''),(336,'2014-08-15 18:19:49',3,4,'6','tuccia',3,''),(337,'2014-08-15 18:29:40',3,4,'7','tuccia',3,''),(338,'2014-08-15 18:29:53',3,37,'10',' (tuccia)',3,''),(339,'2014-08-15 19:30:22',3,37,'11','Marta (tuccia)',2,'Modificat name.'),(340,'2014-08-15 19:31:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"participant > Sebas (bumbum)\" Afegit H_per \"participant > Marta (tuccia)\"'),(341,'2014-08-15 19:34:45',3,100,'7','alta Soci Afí Individual: Marta (tuccia)',1,''),(342,'2014-08-15 20:25:16',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(343,'2014-08-15 20:27:00',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(344,'2014-08-15 20:31:33',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(345,'2014-08-15 20:53:40',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(346,'2014-08-15 21:16:55',3,37,'11','Marta (tuccia)',3,''),(347,'2014-08-15 21:17:16',3,4,'8','tuccia',3,''),(348,'2014-08-15 21:22:59',3,4,'9','tuccia',3,''),(349,'2014-08-15 21:23:15',3,37,'12',' (tuccia)',3,''),(350,'2014-08-15 21:45:58',3,37,'13','Marta P (tuccia)',2,'Modificat name.'),(351,'2014-08-15 21:49:25',3,37,'13','Marta P (tuccia)',3,''),(352,'2014-08-15 21:50:17',3,4,'10','tuccia',3,''),(354,'2014-08-15 22:01:07',3,100,'9','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(355,'2014-08-15 22:27:28',3,100,'9','alta Soci Afí Individual: Marta (tuccia)',3,''),(356,'2014-08-15 22:28:32',3,4,'11','tuccia',3,''),(357,'2014-08-16 08:38:57',3,37,'14','Marta (tuccia)',3,''),(358,'2014-08-16 09:01:21',3,72,'35','Moneda Social (social_currency)',2,'Modificat clas.'),(359,'2014-08-16 09:01:33',3,72,'36','Criptomoneda (crypto_currency)',2,'Modificat clas.'),(360,'2014-08-16 09:01:44',3,72,'37','Moneda Fiat (fiat_currency)',2,'Modificat clas.'),(361,'2014-08-16 09:19:49',3,40,'15','Xarxa Integral de Professionals i Usuaries (XIPU)',1,''),(362,'2014-08-16 09:22:10',3,55,'1',':Relació Humà - Humà,  (rel_hum_hum)',2,'Modificat clas.'),(363,'2014-08-16 09:22:28',3,55,'6',':Relació Persona - Persona,  (rel_pers_pers)',2,'Modificat clas.'),(364,'2014-08-16 09:23:40',3,55,'18',':Relació Projecte - Empresa,  (rel_proj_empr)',1,''),(365,'2014-08-16 09:26:06',3,55,'19',':Relació Projecte - Persona, ',1,''),(366,'2014-08-16 09:26:25',3,55,'19',':Relació Projecte - Persona,  (rel_proj_pers)',2,'Modificat parent i clas.'),(367,'2014-08-16 09:36:26',3,55,'20','Utilització, utilitzar',1,''),(368,'2014-08-16 09:37:21',3,55,'21',':Relació Projecte - Projecte,  (rel_proj_proj)',1,''),(369,'2014-08-16 09:38:44',3,55,'22',':Relació Persona - Empresa,  (rel_pers_empr)',1,''),(370,'2014-08-16 09:41:50',3,55,'11','Referència, referenciar (referent)',2,'Modificat name.'),(371,'2014-08-16 09:43:54',3,55,'11','Referència, referenciar (reference)',2,'Modificat clas.'),(372,'2014-08-16 09:46:48',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_emp \"(Cooperativa) utilitzant > Xarxa Integral de Professionals i Usuaries (XIPU)\"'),(373,'2014-08-16 09:47:07',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a H_per \"referenciant > Sebas (bumbum)\".'),(374,'2014-08-16 19:17:44',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a H_per \"dinamitzant > Sebas (bumbum)\".'),(375,'2014-08-16 19:18:48',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"dinamitzant > Sebas (bumbum)\".'),(376,'2014-08-16 19:21:44',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(377,'2014-08-16 19:34:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(378,'2014-08-16 21:22:41',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(379,'2014-08-16 21:27:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(380,'2014-08-16 21:27:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(381,'2014-08-16 21:41:36',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(382,'2014-08-16 21:41:53',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(383,'2014-08-16 21:42:39',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(384,'2014-08-16 21:43:48',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(385,'2014-08-16 21:45:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(386,'2014-08-16 21:46:29',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(387,'2014-08-16 21:47:33',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(388,'2014-08-16 21:49:12',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(389,'2014-08-16 21:50:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(390,'2014-08-16 21:55:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(391,'2014-08-16 21:57:43',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(392,'2014-08-16 22:02:55',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(393,'2014-08-16 22:03:12',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(394,'2014-08-16 22:33:26',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(395,'2014-08-16 22:33:46',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(396,'2014-08-16 22:35:18',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(397,'2014-08-16 22:37:04',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(398,'2014-08-16 22:38:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(399,'2014-08-16 22:51:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(400,'2014-08-16 22:56:40',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(401,'2014-08-16 23:16:02',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(402,'2014-08-16 23:23:21',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0111\"'),(403,'2014-08-16 23:53:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"referenciant > Sebas (bumbum)\"'),(404,'2014-08-16 23:54:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"referenciant > Sebas (bumbum)\".'),(405,'2014-08-16 23:56:33',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"referenciant > Sebas (bumbum)\"'),(406,'2014-08-17 00:00:22',3,37,'16','Marta (tuccia)',1,''),(407,'2014-08-17 00:03:26',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"dinamitzant > Marta (tuccia)\"'),(408,'2014-08-17 00:07:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"dinamitzant > Marta (tuccia)\"'),(409,'2014-08-17 00:11:00',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"dinamitzant > Marta (tuccia)\"'),(410,'2014-08-17 00:53:02',3,38,'17','Ecoxarxanoia',1,''),(411,'2014-08-17 19:10:21',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat number per a Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0001\".'),(412,'2014-08-17 19:11:00',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat nickname.'),(413,'2014-08-17 19:36:27',3,60,'4','Anoia',1,''),(414,'2014-08-17 19:37:59',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',1,''),(415,'2014-08-17 19:38:23',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\"'),(416,'2014-08-17 19:53:24',3,61,'43','Comarca (region)',2,'Modificat clas.'),(417,'2014-08-17 20:04:05',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(418,'2014-08-17 20:34:22',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(419,'2014-08-17 21:16:14',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\".'),(420,'2014-08-17 21:43:10',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\".'),(421,'2014-08-17 21:53:23',3,55,'23','Utilització d\'espai, utilitzar l\'espai',1,''),(422,'2014-08-17 21:53:28',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_adr \"utilitzant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(423,'2014-08-17 21:54:10',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat main_address per a H_adr \"utilitzant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(424,'2014-08-17 22:06:52',3,55,'24',':Relació Persona - Adreça',1,''),(425,'2014-08-17 22:08:24',3,55,'25','Habitatge, habitar',1,''),(426,'2014-08-17 22:10:36',3,55,'26','Treball, treballar',1,''),(427,'2014-08-17 22:15:12',3,55,'27','Seguiment, seguir',1,''),(428,'2014-08-17 22:20:33',3,100,'1','alta Soci Afí Individual: Sebas (bumbum)',1,''),(429,'2014-08-17 22:42:11',3,56,'1','Autogestió, autogestionar',1,''),(430,'2014-08-17 22:43:25',3,55,'28','Aprenentatge, apendre',1,''),(431,'2014-08-17 22:44:05',3,55,'29','Pràctica, practicar',1,''),(432,'2014-08-17 22:44:14',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_ofi \"practicant > Autogestió, autogestionar\"'),(433,'2014-08-17 22:45:36',3,55,'2',':Relació Humà - Art (rel_hum_art)',2,'Modificat clas.'),(434,'2014-08-18 00:57:05',3,55,'10','Contribució, contribuir (contribute)',2,'Modificat clas.'),(435,'2014-08-18 02:16:44',3,72,'48','Temps (time)',1,''),(436,'2014-08-18 02:17:09',3,71,'5','Temps: Hora',1,''),(437,'2014-08-18 02:20:18',3,72,'48','Temps (time_currency)',2,'Modificat clas.'),(438,'2014-08-18 02:20:40',3,83,'2','quota d\'Alta: Sebas (bumbum) [6 h] > CIC',1,''),(439,'2014-08-18 02:21:07',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',1,''),(440,'2014-08-18 02:58:09',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat membership.'),(441,'2014-08-18 03:03:15',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat deadline_date i payment_date.'),(442,'2014-08-18 03:03:28',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(443,'2014-08-18 03:04:02',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Modificat join_date.'),(444,'2014-08-18 03:08:19',3,71,'6','Moneda Social: Riu',1,''),(445,'2014-08-18 03:08:35',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60 riu] > CIC',1,''),(446,'2014-08-18 03:09:05',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',1,''),(447,'2014-08-18 03:10:43',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Modificat membership.'),(448,'2014-08-18 03:11:42',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Cap camp modificat.'),(449,'2014-08-18 03:16:14',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',2,'Modificat join_date.'),(450,'2014-08-18 03:26:52',3,100,'1','alta Soci Afí Individual: Marta (tuccia)',2,'Modificat person.'),(451,'2014-08-18 03:27:13',3,100,'1','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(452,'2014-08-18 03:28:50',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Modificat payment_date.'),(453,'2014-08-18 03:29:10',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(454,'2014-08-18 12:27:39',3,79,'7','CIC > Sebas (bumbum)',1,''),(455,'2014-08-18 12:49:08',3,79,'7','CIC > Sebas (bumbum)',2,'Afegit Contracte d\'Adreça CI \"XIPU: ?? > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(457,'2014-08-18 13:31:04',3,79,'8','CIC > Sebas (bumbum)',1,''),(458,'2014-08-18 13:34:21',3,79,'8','CIC > Sebas (bumbum)',2,'Afegit Contracte d\'Adreça CI \"None\"'),(459,'2014-08-18 13:56:26',3,79,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(460,'2014-08-18 14:01:39',3,79,'8','CIC > Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(461,'2014-08-18 14:07:14',3,88,'8','XIPU: Sebas > AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(462,'2014-08-18 14:09:45',3,88,'8','XIPU: Sebas (bumbum) > AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(463,'2014-08-18 14:13:29',3,88,'8','XIPU: Sebas (bumbum) > AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(464,'2014-08-18 14:16:14',3,83,'9','quota Trimestral: Sebas (bumbum) [30 €] > CIC',1,''),(465,'2014-08-18 14:16:55',3,79,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(466,'2014-08-18 14:21:04',3,55,'30',':Relació Humà - Registre (rel_hum_reco)',1,''),(467,'2014-08-18 15:28:57',3,79,'8','CIC > Sebas (bumbum)',2,'Modificat rel_fees.'),(468,'2014-08-18 15:30:52',3,79,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(469,'2014-08-18 15:54:23',3,83,'9','quota Trimestral: Sebas (bumbum) [30.00 €] > CIC',3,''),(470,'2014-08-18 16:19:10',3,83,'10','quota Trimestral: Sebas (bumbum) [30 €] > CIC',1,''),(471,'2014-08-18 16:19:37',3,79,'8','CIC > Sebas (bumbum)',2,'Modificat rel_fees.'),(472,'2014-08-18 16:33:39',3,83,'10','quota Trimestral: Sebas (bumbum) [30.00 €] > CIC',2,'Cap camp modificat.'),(473,'2014-08-18 20:53:20',3,79,'8','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat ic_membership.'),(474,'2014-08-18 20:58:40',3,79,'8','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat ic_membership.'),(475,'2014-08-18 21:01:48',3,79,'11','alta Projecte Autoocupat: Ecoxarxanoia (EA)',1,''),(476,'2014-08-18 21:49:22',3,37,'16','Marta (tuccia)',3,''),(477,'2014-08-18 21:53:43',4,37,'18','Marta (tuccia)',2,'Modificat name.'),(478,'2014-08-18 22:00:12',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(479,'2014-08-18 22:03:22',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(480,'2014-08-18 22:06:52',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(481,'2014-08-18 22:09:16',3,41,'20','Bancaria (bank)',2,'Modificat clas.'),(482,'2014-08-18 22:09:35',3,41,'19','Cooperativa (cooperative)',2,'Modificat clas.'),(483,'2014-08-18 22:16:11',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(484,'2014-08-18 22:17:10',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(485,'2014-08-18 22:18:50',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(486,'2014-08-18 22:19:36',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(487,'2014-08-18 22:21:38',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(488,'2014-08-18 22:21:56',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(489,'2014-08-18 22:24:22',3,4,'4','tuccia',2,'Modificat user_permissions.'),(490,'2014-08-18 22:27:02',3,4,'4','tuccia',2,'Modificat user_permissions.'),(491,'2014-08-18 22:27:24',3,4,'4','tuccia',2,'Modificat is_staff.'),(492,'2014-08-18 22:30:09',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',1,''),(493,'2014-08-18 22:36:28',3,37,'18','Marta (tuccia)',2,'Afegit H_adr \"pis de mallorca (Mallorca, 450 - Barcelona)\"'),(494,'2014-08-18 22:38:49',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(495,'2014-08-18 22:43:56',3,56,'2','Coordinació, coordinar',1,''),(496,'2014-08-18 22:44:23',3,37,'18','Marta (tuccia)',2,'Modificat relation per a H_adr \"habitant > pis de mallorca (Mallorca, 450 - Barcelona)\". Afegit H_ofi \"practicant > Coordinació, coordinar\"'),(497,'2014-08-18 22:56:07',3,83,'2','quota d\'Alta: Sebas (bumbum) [6 h] > CIC',1,''),(498,'2014-08-18 22:57:21',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',1,''),(499,'2014-08-18 23:02:36',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Cap camp modificat.'),(500,'2014-08-18 23:04:31',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Cap camp modificat.'),(501,'2014-08-18 23:05:08',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Cap camp modificat.'),(502,'2014-08-18 23:05:22',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(503,'2014-08-18 23:06:59',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60 riu] > CIC',1,''),(504,'2014-08-18 23:07:42',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',1,''),(505,'2014-08-18 23:08:15',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Cap camp modificat.'),(506,'2014-08-18 23:15:57',4,100,'7','alta Soci Afí Individual: Marta (tuccia)',1,''),(507,'2014-08-18 23:17:15',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(508,'2014-08-18 23:17:49',4,100,'7','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(509,'2014-08-18 23:19:47',5,37,'19','Jeto Laface (jeto)',2,'Modificat name.'),(510,'2014-08-18 23:20:46',3,100,'8','alta Soci Afí Individual: Jeto Laface (jeto)',2,'Cap camp modificat.'),(511,'2014-08-18 23:23:16',5,37,'19','Jeto Laface (jeto)',2,'Cap camp modificat.'),(512,'2014-08-18 23:24:14',3,100,'8','alta Soci Afí Individual: Jeto Laface (jeto)',2,'Modificat join_date.'),(513,'2014-08-18 23:24:29',3,100,'7','alta Soci Afí Individual: Marta (tuccia)',2,'Modificat join_date.'),(514,'2014-08-18 23:29:08',3,83,'9','quota Trimestral: Sebas (bumbum) [6 h] > CIC',1,''),(515,'2014-08-18 23:29:23',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',1,''),(516,'2014-08-18 23:30:53',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(517,'2014-08-18 23:31:10',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(518,'2014-08-18 23:33:36',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(519,'2014-08-18 23:34:52',3,37,'4','Sebas (bumbum)',2,'Modificat id_card.'),(520,'2014-08-18 23:35:29',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(521,'2014-08-18 23:36:25',3,37,'4','Sebas (bumbum)',2,'Cap camp modificat.'),(522,'2014-08-18 23:41:36',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',2,'Modificat join_date.'),(523,'2014-08-18 23:42:45',3,83,'11','quota Trimestral: Ecoxarxanoia (EA) [60 riu] > CIC',1,''),(524,'2014-08-18 23:42:56',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',1,''),(525,'2014-08-18 23:43:45',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_per \"referenciant > Marta (tuccia)\"'),(526,'2014-08-18 23:58:48',3,37,'18','Marta (tuccia)',2,'Modificat id_card.'),(527,'2014-08-19 00:11:03',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_per \"referenciant > Sebas (bumbum)\"'),(528,'2014-08-19 00:39:46',3,86,'27','Lloguer',1,''),(529,'2014-08-19 00:40:17',3,88,'13','XIPU: ?? > AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(530,'2014-08-19 00:46:43',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(531,'2014-08-19 00:49:30',3,88,'13','XIPU: Ecoxarxanoia (EA) > AureaSocial (Sardenya 261-263 - Barcelona)',3,''),(532,'2014-08-19 00:50:36',3,86,'28','Cessió',1,''),(533,'2014-08-19 00:50:57',3,88,'14','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(534,'2014-08-19 00:51:08',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(535,'2014-08-19 01:08:58',3,88,'14','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(536,'2014-08-19 01:10:50',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(537,'2014-08-19 01:49:07',3,55,'9','col·laborar',2,'Modificat parent.'),(538,'2014-08-19 01:49:30',3,55,'10','contribuir (contribute)',2,'Modificat parent.'),(539,'2014-08-19 01:49:51',3,55,'7','participar',2,'Modificat parent.'),(540,'2014-08-19 01:50:28',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_per \"dinamitzant > Jeto Laface (jeto)\"'),(541,'2014-08-19 01:50:47',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat relation per a H_per \"participant > Jeto Laface (jeto)\".'),(542,'2014-08-19 01:55:15',3,37,'18','Marta (tuccia)',2,'Modificat id_card i email.'),(543,'2014-08-19 01:56:14',3,37,'4','Sebas (bumbum)',2,'Modificat id_card i birth_date.'),(544,'2014-08-19 16:05:23',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Afegit Contracte d\'Adreça CI \"XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(545,'2014-08-19 16:36:20',3,88,'12','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(546,'2014-08-19 16:36:37',3,88,'12','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat name.'),(549,'2014-08-19 16:38:42',3,88,'14','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',3,''),(550,'2014-08-19 19:13:40',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(551,'2014-08-19 19:15:04',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat name.'),(552,'2014-08-19 19:25:11',3,88,'15','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(553,'2014-08-19 19:25:22',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(554,'2014-08-19 19:26:50',3,88,'15','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',3,''),(555,'2014-08-19 19:38:29',3,88,'16','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(556,'2014-08-19 19:38:52',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(557,'2014-08-19 19:42:35',3,88,'16','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',3,''),(558,'2014-08-19 19:45:55',3,88,'17','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(559,'2014-08-19 19:47:25',3,88,'17','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',3,''),(560,'2014-08-19 19:55:37',3,88,'18','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(561,'2014-08-19 19:56:24',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(562,'2014-08-19 20:04:28',3,88,'18','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(563,'2014-08-19 20:10:54',3,88,'18','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(564,'2014-08-19 21:04:03',3,88,'19','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',1,''),(565,'2014-08-19 21:04:09',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(566,'2014-08-19 21:04:22',3,88,'19','XIPU: Ecoxarxanoia (EA) > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(567,'2014-08-19 22:05:10',3,88,'18','Ecoxarxanoia: Casa del Comú',2,'Cap camp modificat.'),(568,'2014-08-19 22:07:33',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(569,'2014-08-19 23:56:05',3,98,'19','quota Trimestral (quarterly_fee)',2,'Modificat clas.'),(570,'2014-08-19 23:57:06',3,98,'18','quota d\'Alta (join_fee)',2,'Modificat clas.'),(571,'2014-08-19 23:57:30',3,98,'27','contracte de Lloguer',2,'Modificat name.'),(572,'2014-08-19 23:57:39',3,98,'28','contracte de Cessió',2,'Modificat name.'),(573,'2014-08-20 00:39:29',3,88,'19','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',3,''),(574,'2014-08-20 00:39:34',3,88,'18','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',3,''),(577,'2014-08-20 00:44:10',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',3,''),(578,'2014-08-20 00:44:10',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',3,''),(579,'2014-08-20 00:45:08',3,83,'11','quota Trimestral: Ecoxarxanoia (EA) [60.00 riu] > CIC',3,''),(580,'2014-08-20 00:45:08',3,83,'9','quota Trimestral: Sebas (bumbum) [6.00 h] > CIC',3,''),(581,'2014-08-20 00:52:22',3,79,'20','alta Projecte Autoocupat: Ecoxarxanoia (EA)',1,''),(582,'2014-08-20 00:52:50',3,79,'20','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(584,'2014-08-20 01:03:29',3,83,'1','quota d\'Alta: Ecoxarxanoia (EA) [30 riu] > CIC',1,''),(585,'2014-08-20 01:03:45',3,102,'2','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',1,''),(586,'2014-08-20 01:04:34',3,83,'3','quota d\'Alta: Sebas (bumbum) [6 h] > CIC',1,''),(587,'2014-08-20 01:04:56',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',1,''),(588,'2014-08-20 01:06:19',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',1,''),(589,'2014-08-20 01:08:37',3,79,'6','alta Projecte Autoocupat: Sebas (bumbum)',1,''),(590,'2014-08-20 01:08:59',3,83,'3','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat payment_date.'),(591,'2014-08-20 01:16:17',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(592,'2014-08-20 01:20:51',3,79,'6','alta Projecte Autoocupat: Sebas (bumbum)',2,'Afegit Contracte d\'Adreça CI \"XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(593,'2014-08-20 01:21:36',3,88,'6','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(594,'2014-08-20 01:24:08',3,88,'6','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(596,'2014-08-20 01:31:45',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',1,''),(597,'2014-08-20 01:32:19',3,83,'8','quota Trimestral: Sebas (bumbum) [30 eco] > CIC',1,''),(598,'2014-08-20 01:32:30',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_fees.'),(599,'2014-08-20 01:33:30',3,88,'9','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',1,''),(600,'2014-08-20 01:33:35',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(601,'2014-08-20 01:44:40',3,88,'9','Sebas: pis de mallorca',2,'Cap camp modificat.'),(602,'2014-08-20 02:05:33',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Cap camp modificat.'),(603,'2014-08-20 02:07:51',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Modificat name.'),(604,'2014-08-20 02:07:56',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Cap camp modificat.'),(605,'2014-08-20 02:09:34',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Cap camp modificat.'),(606,'2014-08-20 02:11:49',3,88,'11','XIPU: ?? > AureaSocial',1,''),(607,'2014-08-20 02:11:56',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(608,'2014-08-20 02:13:29',3,88,'11','Sebas (bumbum): AureaSocial',2,'Cap camp modificat.'),(609,'2014-08-20 02:14:05',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(610,'2014-08-20 02:18:41',3,88,'11','Sebas (bumbum): AureaSocial',2,'Cap camp modificat.'),(611,'2014-08-20 02:19:33',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(612,'2014-08-20 02:19:58',3,88,'11','Sebas (bumbum): AureaSocial',3,''),(613,'2014-08-20 02:31:12',3,88,'12','XIPU: ?? > Casa del Comú',1,''),(614,'2014-08-20 02:31:18',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(615,'2014-08-20 02:53:17',3,83,'8','quota Trimestral: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(616,'2014-08-20 02:53:25',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(617,'2014-08-20 02:53:38',3,83,'8','quota Trimestral: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat payment_date.'),(618,'2014-08-20 02:53:49',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(619,'2014-08-20 02:55:50',3,98,'29','quota 1T',1,''),(620,'2014-08-20 02:56:02',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat record_type.'),(621,'2014-08-20 02:56:56',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(622,'2014-08-20 02:57:05',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(623,'2014-08-20 03:02:47',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(624,'2014-08-20 03:06:54',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(625,'2014-08-20 03:07:33',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(626,'2014-08-20 03:12:03',3,98,'30','quota 2T',1,''),(627,'2014-08-20 03:12:34',3,83,'13','quota 2T: Sebas (bumbum) [30 eco] > CIC',1,''),(628,'2014-08-20 03:12:41',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_fees.'),(629,'2014-08-20 03:16:45',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(630,'2014-08-20 04:21:41',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat payment_type.'),(631,'2014-08-20 04:21:59',3,83,'13','quota 2T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat deadline_date i payment_date.'),(632,'2014-08-20 04:22:06',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(633,'2014-08-20 14:19:28',3,83,'13','quota 2T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat payment_date.'),(634,'2014-08-20 14:19:36',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(635,'2014-08-20 14:20:00',3,98,'31','quota 3T',1,''),(636,'2014-08-20 14:20:19',3,83,'14','quota 3T: Sebas (bumbum) [6 h] > CIC',1,''),(637,'2014-08-20 14:20:28',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_fees.'),(638,'2014-08-20 14:20:38',3,83,'14','quota 3T: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat payment_date.'),(639,'2014-08-20 14:20:42',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(640,'2014-08-20 15:33:43',3,56,'3','Desenvolupament',1,''),(641,'2014-08-20 15:34:54',3,37,'4','Sebas (bumbum)',2,'Afegit H_ofi \"practicant > Desenvolupament\" Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(642,'2014-08-20 15:38:49',5,37,'19','Jeto Laface (jeto)',2,'Afegit H_ofi \"aprenent > Desenvolupament\"'),(643,'2014-08-20 15:41:53',3,88,'12','bumbum (Sebas): Casa del Comú',2,'Cap camp modificat.'),(644,'2014-08-20 15:42:18',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Cap camp modificat.'),(645,'2014-08-20 15:50:36',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Modificat price i price_unit.'),(646,'2014-08-20 16:06:10',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(647,'2014-08-20 16:06:44',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Modificat ic_CESnum.'),(648,'2014-08-20 16:07:03',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(649,'2014-08-20 16:07:14',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(650,'2014-08-20 16:08:39',3,101,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(651,'2014-08-20 16:12:29',3,83,'13','quota 2T: bumbum (Sebas) [30.00 eco] > CIC',2,'Cap camp modificat.'),(652,'2014-08-20 16:12:36',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(653,'2014-08-20 16:12:48',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat payment_date.'),(654,'2014-08-20 16:13:04',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(655,'2014-08-20 16:25:57',3,98,'7','alta Soci Coop. Individual (iC_Person_Membership)',2,'Modificat name.'),(656,'2014-08-20 16:26:15',3,98,'8','alta Proj. Col·lectiu (iC_Project_Membership)',2,'Modificat name.'),(657,'2014-08-20 16:26:46',3,98,'9','alta Proj. Públic',2,'Modificat name.'),(658,'2014-08-20 16:36:50',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco] > CIC',2,'Cap camp modificat.'),(659,'2014-08-20 16:36:59',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(660,'2014-08-20 16:55:03',3,98,'5','alta Proj. Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(661,'2014-08-20 16:55:22',3,98,'11','alta Proj. Firaire (iC_Stallholder)',2,'Modificat name.'),(662,'2014-08-20 17:10:09',3,55,'22',':Relació Persona - Empresa (rel_pers_comp)',2,'Modificat clas.'),(663,'2014-08-20 17:11:28',3,55,'31','comprar',1,''),(664,'2014-08-20 17:12:21',3,55,'31','comprar a l\'empresa',2,'Modificat name, verb i gerund.'),(665,'2014-08-20 17:12:43',3,55,'22',':Relació Persona - Empresa (rel_pers_comp)',2,'Cap camp modificat.'),(666,'2014-08-20 17:13:44',3,55,'32','treballar per l\'empresa',1,''),(667,'2014-08-20 17:18:35',3,55,'3',':Relació Humà - Espai (rel_hum_spac)',2,'Modificat clas.'),(668,'2014-08-20 17:20:08',3,55,'33',':Relació Humà - Regió (rel_hum_regi)',1,''),(669,'2014-08-20 17:23:54',3,55,'34','fer vida a',1,''),(670,'2014-08-20 17:24:26',3,55,'24',':Relació Persona - Adreça (rel_pers_addr)',2,'Modificat clas.'),(671,'2014-08-20 17:56:48',3,64,'49','Formació',1,''),(672,'2014-08-20 17:58:23',3,64,'50','obra Cultural',1,''),(673,'2014-08-20 17:59:02',3,64,'51','obra Digital',1,''),(674,'2014-08-20 17:59:12',3,64,'49','Formació',2,'Modificat parent.'),(675,'2014-08-20 18:23:09',3,64,'52','formació CI (ic_learn)',1,''),(676,'2014-08-20 18:25:46',3,39,'23','Públic (public)',2,'Modificat clas.'),(677,'2014-08-20 19:03:09',3,64,'53','formació Acollida Autoocupats',1,''),(678,'2014-08-20 19:03:40',3,64,'54','formació Moneda Social',1,''),(679,'2014-08-20 19:30:51',3,67,'55','Màquina',1,''),(680,'2014-08-20 19:31:05',3,67,'56','Vehicle',1,''),(681,'2014-08-20 19:31:49',3,67,'57','Cotxe',1,''),(682,'2014-08-20 20:20:30',3,60,'5','continent europeu',1,''),(683,'2014-08-20 20:20:42',3,60,'1','Països Catalans',2,'Modificat parent.'),(684,'2014-08-20 21:18:06',3,64,'53','sessió de formació col·lectiva',2,'Modificat name.'),(685,'2014-08-20 21:18:47',3,64,'54','sessió de formació Individual',2,'Modificat name.'),(686,'2014-08-20 21:18:55',3,64,'53','sessió de formació Col·lectiva',2,'Modificat name.'),(687,'2014-08-20 21:19:47',3,63,'1','sessió d\'Acollida',1,''),(688,'2014-08-20 21:20:11',3,63,'2','sessió de Moneda Social',1,''),(689,'2014-08-20 21:41:59',3,37,'4','Sebas (bumbum)',2,'Afegit Actiu \"(Cotxe) peugeot 306\"'),(690,'2014-08-20 21:51:00',3,55,'35',':Relació Humà - ObraMaterial (rel_hum_mate)',1,''),(691,'2014-08-20 21:52:46',3,55,'36','titular',1,''),(692,'2014-08-20 21:55:19',3,55,'36','titular el registre',2,'Modificat name, verb i gerund.'),(693,'2014-08-20 21:57:24',3,55,'37','pertànyer',1,''),(694,'2014-08-20 22:07:41',3,37,'4','Sebas (bumbum)',2,'Afegit H_mat \"peugeot 306\" Afegit H_rec \"Compte CES: titulant el registre > Compte CES: (eco) Cooperativa Integral Catalana (CIC) COOP0111\"'),(695,'2014-08-20 22:08:33',3,37,'4','Sebas (bumbum)',2,'Modificat relation per a H_mat \"pertanyent > peugeot 306\".'),(696,'2014-08-20 22:20:32',3,55,'38',':Relació Humà - obra Inmaterial (rel_hum_nonm)',1,''),(697,'2014-08-20 22:20:43',3,55,'35',':Relació Humà - obra Material (rel_hum_mate)',2,'Modificat name.'),(698,'2014-08-20 22:24:32',3,55,'39','representar',1,''),(699,'2014-08-20 22:28:34',3,55,'40','oferir l\'obra inmaterial',1,''),(700,'2014-08-20 22:28:59',3,37,'4','Sebas (bumbum)',2,'Afegit H_inm \"oferint l\'obra inmaterial > sessió d\'Acollida\"'),(701,'2014-08-20 22:30:55',3,98,'32','Sessió / Formació (Learn_Session)',1,''),(702,'2014-08-20 22:32:32',3,81,'15','sessió d\'Acollida: 2014-08-21 00:31:36+00:00 (Sebas) AureaSocial',1,''),(703,'2014-08-20 22:37:06',3,81,'15','sessió d\'Acollida: <built-in method date of datetime.datetime object at 0x7f9f70d81a50> (Sebas) AureaSocial',2,'Cap camp modificat.'),(704,'2014-08-20 22:37:27',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(705,'2014-08-20 22:57:50',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(706,'2014-08-20 23:49:06',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(707,'2014-08-20 23:50:10',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(708,'2014-08-20 23:54:45',3,98,'33','reg Sessió d\'Acollida (welcome_session)',1,''),(709,'2014-08-20 23:55:17',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat record_type.'),(710,'2014-08-21 00:35:08',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(711,'2014-08-21 00:39:16',4,37,'18','Marta (tuccia)',2,'Afegit H_pro \"(Ecoxarxa) seguint > Ecoxarxanoia\"'),(712,'2014-08-21 01:19:41',3,55,'41',':Relació ObraMaterial - Adreça (rel_mat_addr)',1,''),(713,'2014-08-21 01:23:16',3,55,'42','aparcar',1,''),(714,'2014-08-21 01:23:31',3,68,'1','(Cotxe) peugeot 306',2,'Afegit M_adr \"(Espai Polivalent Col·lectiu) aparcant > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(715,'2014-08-21 01:30:27',3,55,'43',':Relació ObraMaterial - Registre (rel_mat_reco)',1,''),(716,'2014-08-21 01:31:33',3,55,'44',':Relació Obra - Espai',1,''),(717,'2014-08-21 01:32:04',3,55,'45',':Relació Obra - Obra',1,''),(718,'2014-08-21 01:33:53',3,55,'44',':Relació ObraMaterial - Espai (rel_mat_spac)',2,'Modificat name i clas.'),(719,'2014-08-21 01:34:27',3,55,'41',':Relació ObraMaterial - Adreça (rel_mat_addr)',2,'Modificat parent.'),(720,'2014-08-21 01:35:35',3,55,'45',':Relació ObraMaterial - ObraMaterial (rel_mat_mate)',2,'Modificat name i clas.'),(721,'2014-08-21 01:36:12',3,55,'43',':Relació obra Material - Registre (rel_mat_reco)',2,'Modificat name.'),(722,'2014-08-21 01:36:15',3,55,'43',':Relació obra Material - Registre (rel_mat_reco)',2,'Cap camp modificat.'),(723,'2014-08-21 01:36:46',3,55,'44',':Relació obra Material - Espai (rel_mat_spac)',2,'Modificat name.'),(724,'2014-08-21 01:37:48',3,55,'46',':Relació Obra - Espai (rel_awo_spac)',1,''),(725,'2014-08-21 01:38:18',3,55,'41',':Relació obra Material - Adreça (rel_mat_addr)',2,'Modificat name.'),(726,'2014-08-21 01:38:43',3,55,'44',':Relació obra Material - Espai (rel_mat_spac)',2,'Modificat parent.'),(727,'2014-08-21 01:39:19',3,55,'41',':Relació obra Material - Adreça (rel_mat_addr)',2,'Modificat parent.'),(728,'2014-08-21 01:40:44',3,55,'47',':Relació Obra - Obra (rel_awo_arwo)',1,''),(729,'2014-08-21 01:41:01',3,55,'43',':Relació obra Material - Registre (rel_mat_reco)',2,'Modificat parent.'),(730,'2014-08-21 01:41:30',3,55,'45',':Relació obra Material - obra Material (rel_mat_mate)',2,'Modificat name i parent.'),(731,'2014-08-21 01:45:14',3,55,'42','aparcar a',2,'Modificat name, verb i gerund.'),(732,'2014-08-21 01:47:03',3,55,'44',':Relació obra Material - obra Inmaterial (rel_mat_nonm)',2,'Modificat name, parent i clas.'),(733,'2014-08-21 01:53:41',3,55,'46',':Relació Obra - Espai',2,'Modificat clas.'),(734,'2014-08-21 01:53:49',3,55,'47',':Relació Obra - Obra',2,'Modificat clas.'),(735,'2014-08-21 01:54:14',3,55,'48',':Relació Obra - Art',1,''),(736,'2014-08-21 01:54:40',3,55,'19',':relació Projecte - Persona (rel_proj_pers)',2,'Modificat name.'),(737,'2014-08-21 01:54:55',3,55,'18',':relació Projecte - Empresa (rel_proj_empr)',2,'Modificat name.'),(738,'2014-08-21 01:55:02',3,55,'21',':relació Projecte - Projecte (rel_proj_proj)',2,'Modificat name.'),(739,'2014-08-21 01:55:07',3,55,'5',':relació Persona - Projecte (rel_pers_proj)',2,'Modificat name.'),(740,'2014-08-21 01:55:13',3,55,'22',':relació Persona - Empresa (rel_pers_comp)',2,'Modificat name.'),(741,'2014-08-21 01:55:18',3,55,'6',':relació Persona - Persona (rel_pers_pers)',2,'Modificat name.'),(742,'2014-08-21 01:55:32',3,55,'15',':relació Projecte - Adreça (rel_proj_addr)',2,'Modificat name.'),(743,'2014-08-21 01:55:37',3,55,'24',':relació Persona - Adreça (rel_pers_addr)',2,'Modificat name.'),(744,'2014-08-21 01:55:42',3,55,'33',':relació Humà - Regió (rel_hum_regi)',2,'Modificat name.'),(745,'2014-08-21 01:55:54',3,55,'30',':relació Humà - Registre (rel_hum_reco)',2,'Modificat name.'),(746,'2014-08-21 01:55:59',3,55,'35',':relació Humà - obra Material (rel_hum_mate)',2,'Modificat name.'),(747,'2014-08-21 01:56:03',3,55,'38',':relació Humà - obra Inmaterial (rel_hum_nonm)',2,'Modificat name.'),(748,'2014-08-21 01:56:10',3,55,'41',':relació obra Material - Adreça (rel_mat_addr)',2,'Modificat name.'),(749,'2014-08-21 01:56:16',3,55,'43',':relació obra Material - Registre (rel_mat_reco)',2,'Modificat name.'),(750,'2014-08-21 01:56:20',3,55,'45',':relació obra Material - obra Material (rel_mat_mate)',2,'Modificat name.'),(751,'2014-08-21 01:56:27',3,55,'44',':relació obra Material - obra Inmaterial (rel_mat_nonm)',2,'Modificat name.'),(752,'2014-08-21 01:57:16',3,55,'49',':relació obra Material - Ofici (rel_mat_jobs)',1,''),(753,'2014-08-21 02:05:44',3,68,'1','(Cotxe) peugeot 306',2,'Cap camp modificat.'),(754,'2014-08-21 02:43:11',3,55,'50',':relació obra Inmaterial - Adreça (rel_non_addr)',1,''),(755,'2014-08-21 02:45:18',3,55,'51',':relació obra Inmaterial - Registre (rel_non_reco)',1,''),(756,'2014-08-21 02:47:31',3,55,'52',':relació obra Inmaterial - Ofici (rel_non_jobs)',1,''),(757,'2014-08-21 02:49:15',3,55,'53',':relació obra Inmaterial - obra Inmaterial (rel_non_nonm)',1,''),(758,'2014-08-21 02:55:30',3,55,'10','contribuir/col·laborar (contribute)',2,'Modificat verb, gerund i parent.'),(759,'2014-08-21 02:59:27',3,55,'11','referenciar (reference)',2,'Modificat name.'),(760,'2014-08-21 02:59:47',3,55,'8','dinamitzar',2,'Modificat name.'),(761,'2014-08-21 02:59:59',3,55,'7','participar',2,'Modificat name.'),(762,'2014-08-21 03:00:13',3,55,'20','utilitzar',2,'Modificat name.'),(763,'2014-08-21 03:00:26',3,55,'9','col·laborar',2,'Modificat name.'),(764,'2014-08-21 03:00:48',3,55,'27','seguir',2,'Modificat name.'),(765,'2014-08-21 03:01:26',3,55,'10','contribuir/col·laborar (contribute)',2,'Modificat name.'),(766,'2014-08-21 03:02:02',3,55,'31','comprar a l\'empresa',2,'Modificat name.'),(767,'2014-08-21 03:02:25',3,55,'32','treballar per l\'empresa',2,'Modificat name.'),(768,'2014-08-21 03:02:42',3,55,'28','apendre',2,'Modificat name.'),(769,'2014-08-21 03:02:49',3,55,'29','practicar',2,'Modificat name.'),(770,'2014-08-21 03:03:09',3,55,'17','gestionar l\'espai',2,'Modificat name.'),(771,'2014-08-21 03:03:27',3,55,'16','oferir l\'espai',2,'Modificat name.'),(772,'2014-08-21 03:03:54',3,55,'23','utilitzar l\'espai',2,'Modificat name.'),(773,'2014-08-21 03:04:09',3,55,'25','habitar',2,'Modificat name.'),(774,'2014-08-21 03:04:21',3,55,'26','treballar',2,'Modificat name.'),(775,'2014-08-21 03:04:53',3,55,'26','treballar a',2,'Modificat name, verb i gerund.'),(776,'2014-08-21 03:05:13',3,55,'25','habitar a',2,'Modificat name, verb i gerund.'),(777,'2014-08-21 03:05:40',3,55,'34','fer vida a',2,'Cap camp modificat.'),(778,'2014-08-21 03:05:56',3,55,'36','titular el registre',2,'Modificat name.'),(779,'2014-08-21 03:06:12',3,55,'37','pertànyer',2,'Modificat name.'),(780,'2014-08-21 03:06:25',3,55,'39','representar',2,'Modificat name.'),(781,'2014-08-21 03:06:39',3,55,'40','oferir l\'obra inmaterial',2,'Modificat name.'),(782,'2014-08-21 03:06:54',3,55,'42','aparcar a',2,'Modificat name.'),(783,'2014-08-21 10:01:22',3,73,'3',' (h * 5 = €) (h * 5 = €)',1,''),(784,'2014-08-21 10:02:50',3,73,'3',' (h * 5 = €) (h * 5.000 = eco)',2,'Modificat out_unit.'),(785,'2014-08-21 10:03:00',3,73,'3',' (h * 5.000 = eco) (h * 5.000 = eco)',2,'Modificat name.'),(786,'2014-08-21 10:09:33',3,73,'3','Hora * 5.000 = EcoCoop',2,'Cap camp modificat.'),(787,'2014-08-21 10:09:37',3,73,'3','Hora * 5.000 = EcoCoop',2,'Cap camp modificat.'),(788,'2014-08-21 10:10:28',3,73,'3','Hora * 5.000 = EcoCoop',2,'Modificat name.'),(789,'2014-08-21 10:11:05',3,73,'3','Hora * 5.000 = EcoCoop',2,'Cap camp modificat.'),(790,'2014-08-21 10:13:27',3,70,'58','equivalencia Temps - Moneda',1,''),(791,'2014-08-21 10:13:51',3,73,'3','Hora * 5.000 = EcoCoop',2,'Modificat record_type.'),(792,'2014-08-21 10:14:19',3,70,'16','compte CES (AccountCes)',2,'Modificat name.'),(793,'2014-08-21 10:14:27',3,70,'17','compte Criptomoneda (AccountCrypto)',2,'Modificat name.'),(794,'2014-08-21 10:14:33',3,70,'18','compte Bancari (AccountCrypto)',2,'Modificat name.'),(795,'2014-08-21 10:16:47',3,70,'59','equivalencia Moneda - Moneda',1,''),(796,'2014-08-21 10:20:21',3,70,'60','equivalencia Àrea - Àrea',1,''),(797,'2014-08-21 10:22:41',3,70,'61','equivalencia Temps - Temps',1,''),(798,'2014-08-21 10:25:05',3,73,'3','EcoCoop * 5.000 = Hora',2,'Modificat in_unit, out_unit i name.'),(799,'2014-08-21 10:26:05',3,70,'58','equivalencia Moneda - Temps',2,'Modificat name.'),(800,'2014-08-21 10:27:33',3,73,'4','EcoCoop * 1 = Euro',1,''),(801,'2014-08-21 10:28:01',3,73,'3','EcoCoop * 5 = Hora',2,'Modificat name.'),(802,'2014-08-21 10:40:07',3,98,'34','reg Sessió MonedaSocial (socialcoin_session)',1,''),(803,'2014-08-21 10:42:13',3,98,'35','quota alta Individual ((30_€))',1,''),(804,'2014-08-21 10:43:12',3,98,'36','quota alta Col·lectiva ((60_€))',1,''),(805,'2014-08-21 10:43:49',3,98,'35','quota alta Individual ((30_eco))',2,'Modificat clas.'),(806,'2014-08-21 10:43:56',3,98,'36','quota alta Col·lectiva ((60_eco))',2,'Modificat clas.'),(807,'2014-08-21 10:46:55',3,83,'3','quota alta Individual: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat record_type.'),(808,'2014-08-21 10:47:11',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [30.00 riu] > CIC',2,'Modificat record_type.'),(809,'2014-08-21 11:16:22',3,83,'3','quota alta Individual: bumbum (Sebas) [6.00 h] > CIC',2,'Cap camp modificat.'),(810,'2014-08-21 11:46:46',3,83,'3','quota alta Individual: bumbum (Sebas) [None h] > CIC',2,'Modificat amount.'),(811,'2014-08-21 12:15:25',3,83,'3','quota alta Individual: bumbum (Sebas) [30 h] > CIC',2,'Cap camp modificat.'),(812,'2014-08-21 12:28:21',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat amount.'),(813,'2014-08-21 12:28:47',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit i amount.'),(814,'2014-08-21 12:28:56',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(815,'2014-08-21 12:43:18',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(816,'2014-08-21 12:43:23',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(817,'2014-08-21 12:43:29',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(818,'2014-08-21 12:43:34',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 riu] > CIC',2,'Modificat unit.'),(819,'2014-08-21 12:43:47',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(820,'2014-08-21 12:46:02',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(821,'2014-08-21 12:46:12',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(822,'2014-08-21 12:46:22',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(823,'2014-08-21 12:48:39',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Cap camp modificat.'),(824,'2014-08-21 12:48:47',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(825,'2014-08-21 12:49:26',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Cap camp modificat.'),(826,'2014-08-21 12:49:30',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(827,'2014-08-21 12:49:36',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(828,'2014-08-21 12:50:04',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 riu] > CIC',2,'Modificat unit.'),(829,'2014-08-21 12:52:27',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(830,'2014-08-21 12:56:14',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €] > CIC',2,'Modificat unit.'),(831,'2014-08-21 12:56:23',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Modificat unit.'),(832,'2014-08-21 12:56:29',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(833,'2014-08-21 13:09:19',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(834,'2014-08-21 13:35:14',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Modificat unit.'),(835,'2014-08-21 13:37:08',3,73,'5','EcoCoop * 1 = Riu',1,''),(836,'2014-08-21 13:43:20',3,73,'5','Riu * 1.000 = EcoCoop',2,'Modificat in_unit i out_unit.'),(837,'2014-08-21 13:43:27',3,73,'5','Riu * 1.000 = EcoCoop',2,'Modificat name.'),(838,'2014-08-21 13:48:55',3,73,'5','Riu * 2.000 = EcoCoop',2,'Modificat rate i name.'),(839,'2014-08-21 13:49:02',3,73,'5','Riu * 2.000 = EcoCoop',2,'Cap camp modificat.'),(840,'2014-08-21 13:49:42',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [120.0 riu] > CIC',2,'Cap camp modificat.'),(841,'2014-08-21 13:49:56',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(842,'2014-08-21 13:50:00',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €] > CIC',2,'Modificat unit.'),(843,'2014-08-21 13:50:04',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(844,'2014-08-21 13:50:09',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [120.0 riu] > CIC',2,'Modificat unit.'),(845,'2014-08-21 13:52:13',3,73,'5','Riu * 1 = EcoCoop',2,'Modificat rate i name.'),(846,'2014-08-21 13:54:03',3,73,'5','Riu * 1 = Euro',2,'Modificat out_unit i name.'),(847,'2014-08-21 13:54:07',3,73,'5','Riu * 1.000 = Euro',2,'Cap camp modificat.'),(848,'2014-08-21 14:02:49',3,73,'5','Riu * 2.000 = Euro',2,'Modificat rate i name.'),(849,'2014-08-21 14:07:31',3,73,'4','EcoCoop * 0.8 = Euro',2,'Modificat rate i name.'),(850,'2014-08-21 14:08:23',3,73,'5','Riu * 1 = Euro',2,'Modificat rate i name.'),(851,'2014-08-21 14:08:59',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [75.0 riu] > CIC',2,'Cap camp modificat.'),(852,'2014-08-21 14:09:08',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [75.0 €] > CIC',2,'Modificat unit.'),(853,'2014-08-21 14:09:20',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(854,'2014-08-21 14:09:25',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(855,'2014-08-21 14:09:31',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [75.0 riu] > CIC',2,'Modificat unit.'),(856,'2014-08-21 14:10:01',3,73,'4','EcoCoop * 1 = Euro',2,'Modificat rate i name.'),(857,'2014-08-21 14:10:46',3,73,'5','Riu * 0.9 = Euro',2,'Modificat rate i name.'),(858,'2014-08-21 14:10:59',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [54.0 riu] > CIC',2,'Cap camp modificat.'),(859,'2014-08-21 14:11:06',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €] > CIC',2,'Modificat unit.'),(860,'2014-08-21 14:11:11',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(861,'2014-08-21 14:11:15',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [54.0 riu] > CIC',2,'Modificat unit.'),(862,'2014-08-21 14:11:39',3,73,'5','Riu * 1 = Euro',2,'Modificat rate i name.'),(863,'2014-08-21 14:16:30',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Cap camp modificat.'),(864,'2014-08-21 14:18:37',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Cap camp modificat.'),(865,'2014-08-21 14:18:44',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(866,'2014-08-21 14:19:08',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(867,'2014-08-21 14:19:11',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(868,'2014-08-21 14:19:16',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 riu] > CIC',2,'Modificat unit.'),(869,'2014-08-21 14:19:21',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(870,'2014-08-21 14:19:33',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Cap camp modificat.'),(871,'2014-08-21 14:48:17',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat name.'),(872,'2014-08-21 15:16:54',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',2,'Modificat ic_membership.'),(873,'2014-08-21 15:17:00',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(874,'2014-08-21 15:24:57',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(875,'2014-08-21 15:53:13',3,63,'2','formació Moneda Social',2,'Modificat name.'),(876,'2014-08-21 15:53:33',3,63,'1','formació d\'Acollida Autoocupats',2,'Modificat name.'),(877,'2014-08-21 15:54:09',3,81,'15','formació d\'Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(878,'2014-08-21 15:54:12',3,81,'15','formació d\'Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(879,'2014-08-21 15:56:30',3,63,'1','formació Acollida Autoocupats',2,'Modificat name.'),(880,'2014-08-21 15:56:41',3,81,'15','formació Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(881,'2014-08-21 15:57:17',3,63,'1','Acollida Autoocupats',2,'Modificat name.'),(882,'2014-08-21 15:57:52',3,81,'15','Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(883,'2014-08-21 15:57:55',3,81,'15','Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(884,'2014-08-21 15:58:53',3,63,'1','acollida Autoocupats',2,'Modificat name.'),(885,'2014-08-21 15:59:09',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(886,'2014-08-21 15:59:13',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(887,'2014-08-21 16:01:04',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(888,'2014-08-21 16:02:21',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(889,'2014-08-21 16:04:44',3,4,'4','tuccia',2,'Modificat groups.'),(890,'2014-08-21 16:30:12',3,4,'6','creant',3,''),(891,'2014-08-21 16:43:18',3,4,'7','creant',3,''),(892,'2014-08-21 16:51:37',3,38,'23','C.R.E.A.N.T.',3,''),(893,'2014-08-21 16:51:49',3,38,'21','C.R.E.A.N.T.',3,''),(894,'2014-08-21 16:57:43',3,4,'8','creant',3,''),(895,'2014-08-21 16:58:10',3,38,'25','C.R.E.A.N.T.',3,''),(896,'2014-08-21 17:16:41',3,38,'27','C.R.E.A.N.T.',3,''),(897,'2014-08-21 17:18:16',3,37,'26',' Fresh (seb)',3,''),(898,'2014-08-21 17:18:16',3,37,'24',' Fresh (seb)',3,''),(899,'2014-08-21 17:18:16',3,37,'22',' Fresh (seb)',3,''),(900,'2014-08-21 17:18:16',3,37,'20',' Fresh (seb)',3,''),(901,'2014-08-21 17:18:43',3,4,'9','creant',3,''),(902,'2014-08-21 17:23:04',3,37,'28','Sebb Fresh (seb)',2,'Modificat name.'),(903,'2014-08-21 17:26:09',3,3,'4','iC_Project_Membership',2,'Modificat permissions.'),(905,'2014-08-21 17:34:56',3,37,'28','Sebb Fresh (seb)',3,''),(906,'2014-08-21 17:35:10',3,38,'29','C.R.E.A.N.T.',3,''),(907,'2014-08-21 17:35:27',3,4,'10','creant',3,''),(908,'2014-08-21 18:58:31',3,37,'30','Sebb Fresh (seb)',2,'Modificat name.'),(909,'2014-08-21 18:58:38',3,37,'30','Sebb Fresh (seb)',3,''),(910,'2014-08-21 18:59:14',3,38,'31','ColectiuRural',3,''),(911,'2014-08-21 18:59:52',3,4,'11','seb',3,''),(912,'2014-08-21 19:07:48',3,37,'32',' Fresh (seb)',3,''),(913,'2014-08-21 19:08:03',3,38,'33','c.r.e.a.n.t.',3,''),(914,'2014-08-21 19:08:14',3,4,'12','seb',3,''),(915,'2014-08-21 19:37:12',3,37,'34',' Fresh (seb)',3,''),(916,'2014-08-21 19:37:32',3,38,'35','c.r.e.a.n.t.',3,''),(917,'2014-08-21 19:37:41',3,4,'13','seb',3,''),(918,'2014-08-21 19:45:22',3,98,'35','quota alta Individual ((30_eco) individual)',2,'Modificat clas.'),(919,'2014-08-21 19:46:33',3,98,'36','quota alta Col·lectiva ((60_eco) collective)',2,'Modificat clas.'),(920,'2014-08-21 19:50:06',3,37,'36',' Fresh (seb)',3,''),(921,'2014-08-21 19:50:17',3,38,'37','c.r.e.a.n.t.',3,''),(922,'2014-08-21 19:50:31',3,4,'14','seb',3,''),(923,'2014-08-21 20:11:48',3,37,'38',' Fresh (seb)',3,''),(924,'2014-08-21 20:12:02',3,38,'39','c.r.e.a.n.t.',3,''),(925,'2014-08-21 20:12:14',3,4,'15','seb',3,''),(926,'2014-08-22 00:17:51',3,4,'16','seb',3,''),(927,'2014-08-22 00:18:15',3,37,'40','anonymous Fresh (seb)',3,''),(928,'2014-08-22 00:20:56',3,37,'41','anonymous Fresh (seb)',3,''),(929,'2014-08-22 00:21:11',3,4,'17','seb',3,''),(930,'2014-08-22 00:25:35',18,83,'18','quota alta Individual: seb (anonymous) [6.0 h] > CIC',2,'Modificat unit.'),(931,'2014-08-22 00:51:12',18,83,'18','quota alta Individual: seb (anonymous) [30.0 riu] > CIC',2,'Modificat unit.'),(932,'2014-08-22 00:52:38',18,37,'42','Sebb Fresh (seb)',2,'Modificat name.'),(933,'2014-08-22 01:13:16',3,37,'43','anonymous Cia (tuc)',3,''),(934,'2014-08-22 01:13:31',3,38,'44','c.r.e.a.n.t.',3,''),(935,'2014-08-22 01:13:43',3,4,'19','tuc',3,''),(936,'2014-08-22 01:17:26',3,83,'21','quota alta Col·lectiva: tuc (anonymous) [60.0 €] > CIC',2,'Cap camp modificat.'),(938,'2014-08-22 01:31:59',3,83,'21','quota alta Col·lectiva: tuc (Tuc) [60.00 €] > CIC',3,''),(939,'2014-08-22 01:32:12',3,37,'45','Tuc Cia (tuc)',3,''),(940,'2014-08-22 01:32:31',3,38,'46','c.r.e.a.n.t.',3,''),(941,'2014-08-22 01:32:41',3,4,'20','tuc',3,''),(942,'2014-08-22 01:33:58',3,4,'21','tuc',3,''),(943,'2014-08-22 01:34:28',3,38,'48','c.r.e.a.n.t.',3,''),(944,'2014-08-22 01:34:50',3,37,'47','anonymous Cia (tuc)',3,''),(945,'2014-08-22 01:42:08',3,83,'24','quota alta Col·lectiva: c.r.e.a.n.t. [60.00 €] > CIC',3,''),(946,'2014-08-22 01:42:42',3,38,'50','c.r.e.a.n.t.',3,''),(947,'2014-08-22 01:42:55',3,37,'49','anonymous Cia (tuc)',3,''),(948,'2014-08-22 01:43:13',3,4,'22','tuc',3,''),(955,'2014-08-22 03:10:49',3,83,'25','quota alta Col·lectiva: c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació) [12.0 h] > CIC',2,'Cap camp modificat.'),(956,'2014-08-22 03:12:18',3,102,'26','alta Proj. Col·lectiu: c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació)',2,'Cap camp modificat.'),(957,'2014-08-22 03:13:49',3,83,'25','quota alta Col·lectiva: c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació) [12.0 h] > CIC',2,'Cap camp modificat.'),(958,'2014-08-22 03:30:27',3,38,'52','c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació)',3,''),(959,'2014-08-22 03:30:41',3,37,'51','Tuc Cia (tuc)',3,''),(960,'2014-08-22 03:31:32',3,4,'23','tuc',3,''),(961,'2014-08-22 03:32:05',3,101,'19','alta Soci Coop. Individual: seb (Sebb)',2,'Modificat contribution.'),(962,'2014-08-22 13:06:28',3,37,'4','Sebas (bumbum)',2,'Eliminat H_rec \"compte CES: titulant el registre > compte CES: (eco) Cooperativa Integral Catalana (CIC) COOP0111\".'),(963,'2014-08-22 13:06:53',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(964,'2014-08-22 13:08:14',3,74,'1','(eco) CIC (Cooperativa Integral Catalana) COOP0001',2,'Cap camp modificat.'),(965,'2014-08-22 13:13:59',3,74,'1','(eco) CIC (Cooperativa Integral Catalana) COOP0001',2,'Cap camp modificat.'),(966,'2014-08-22 13:19:50',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(967,'2014-08-22 13:22:25',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(968,'2014-08-22 13:25:15',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(969,'2014-08-22 13:25:49',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(970,'2014-08-22 13:27:07',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(971,'2014-08-22 13:28:47',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(972,'2014-08-22 13:38:13',3,55,'36','titular el registre (holder)',2,'Modificat clas.'),(973,'2014-08-22 13:38:33',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(974,'2014-08-22 13:39:39',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(975,'2014-08-22 13:52:10',3,37,'4','Sebas (bumbum)',2,'Afegit H_rec \"equivalencia Moneda - Moneda: Riu * 1 = Euro\"'),(976,'2014-08-22 14:15:41',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(977,'2014-08-22 14:18:18',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(978,'2014-08-22 14:19:52',3,37,'4','Sebas (bumbum)',2,'Modificat relation per a H_rec \"equivalencia Moneda - Moneda: titulant el registre > equivalencia Moneda - Moneda: Riu * 1 = Euro\".'),(979,'2014-08-22 14:20:10',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(980,'2014-08-22 14:31:15',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(981,'2014-08-22 14:31:41',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(982,'2014-08-22 14:38:36',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(983,'2014-08-22 14:41:48',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(984,'2014-08-22 14:43:12',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(985,'2014-08-22 14:43:28',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(986,'2014-08-22 14:48:04',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(987,'2014-08-22 14:51:12',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(988,'2014-08-22 15:03:56',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(989,'2014-08-22 15:20:43',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(990,'2014-08-22 15:26:44',3,37,'4','Sebas (bumbum)',2,'Eliminat H_rec \"compte CES: titulant el registre > compte CES: (eco) Sebas (bumbum) COOP0111\".'),(991,'2014-08-22 17:28:13',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(992,'2014-08-22 17:29:04',3,74,'39','(eco) bumbum (Sebas) COOP0111',3,''),(993,'2014-08-22 17:33:07',3,61,'62','Planeta',1,''),(994,'2014-08-22 17:33:18',3,60,'6','planeta Terra',1,''),(995,'2014-08-22 17:33:43',3,71,'7','Criptomoneda: FairCoin',1,''),(996,'2014-08-22 17:48:20',3,70,'18','compte Bancari (AccountBank)',2,'Modificat clas.'),(997,'2014-08-22 17:48:28',3,37,'4','Sebas (bumbum)',2,'Afegit Compte Criptomoneda \"(FAC) Sebas (bumbum) fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4\"'),(998,'2014-08-22 17:58:53',3,37,'4','Sebas (bumbum)',2,'Eliminat H_rec \"equivalencia Moneda - Moneda: titulant el registre > equivalencia Moneda - Moneda: Riu * 1 = Euro\".'),(999,'2014-08-22 18:39:46',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1000,'2014-08-22 19:00:29',3,83,'13','quota 2T: bumbum (Sebas) [30.00 eco] > CIC',2,'Modificat payment_date.'),(1001,'2014-08-22 19:01:01',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat payment_date.'),(1002,'2014-08-22 19:09:50',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat payment_date.'),(1003,'2014-08-22 19:09:59',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco] > CIC',2,'Modificat payment_date.'),(1004,'2014-08-22 19:10:02',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1005,'2014-08-22 19:16:07',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1006,'2014-08-22 19:35:12',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',2,'Modificat jobs.'),(1007,'2014-08-22 20:46:44',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1008,'2014-08-22 21:22:41',3,40,'53','triodos (Triodos Bank)',1,''),(1009,'2014-08-22 21:22:59',3,75,'43','(€) XIPU (Xarxa Integral de Professionals i Usuaries)  - triodos (Triodos Bank)',1,''),(1010,'2014-08-22 21:25:30',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_accountBank i mentor_membership.'),(1011,'2014-08-22 23:30:38',3,38,'17','EA (Ecoxarxanoia)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\". Modificat main_address per a H_adr \"utilitzant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(1012,'2014-08-23 00:02:42',3,37,'42','Sebb Fresh (seb)',2,'Afegit H_pro \"(Xarxa Mundial) seguint > Revolució Integral\"'),(1013,'2014-08-23 00:19:30',3,37,'42','seb',2,'Cap camp modificat.'),(1014,'2014-08-23 01:00:29',3,37,'4','Sebas (bumbum)',2,'Afegit H_adr \"treballant a > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(1015,'2014-08-23 01:02:25',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat jobs.'),(1016,'2014-08-23 01:08:39',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(1017,'2014-08-23 01:23:16',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat jobs.'),(1018,'2014-08-23 01:24:11',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(1019,'2014-08-23 01:51:03',3,56,'4','Transport',1,''),(1020,'2014-08-23 01:53:44',3,55,'54','servir per',1,''),(1021,'2014-08-23 01:53:52',3,68,'1','(Cotxe) peugeot 306',2,'Afegit M_ofi \"servint per > Transport\"'),(1022,'2014-08-23 01:56:48',3,68,'1','(Cotxe) peugeot 306',2,'Cap camp modificat.'),(1023,'2014-08-23 02:12:51',3,39,'22','Ecoxarxa (ces)',2,'Modificat clas.'),(1024,'2014-08-23 02:13:06',3,39,'24','Cooperativa Integral (ces)',2,'Modificat clas.'),(1025,'2014-08-23 02:17:07',3,37,'4','Sebas (bumbum)',2,'Cap camp modificat.'),(1026,'2014-08-23 02:37:43',3,37,'4','Sebas (bumbum)',2,'Cap camp modificat.'),(1027,'2014-08-23 02:38:15',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco] > CIC',2,'Modificat payment_date.'),(1028,'2014-08-23 02:58:32',3,101,'4','COOP0111 (bumbum)',2,'Modificat expositors.'),(1029,'2014-08-23 03:01:24',3,101,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(1030,'2014-08-23 03:22:29',3,101,'4','COOP0111 (bumbum)',2,'Modificat expositors.'),(1031,'2014-08-23 13:11:13',3,39,'63','Online (online)',1,''),(1032,'2014-08-23 13:12:03',3,39,'27','Cooperatiu Col·lectiu',2,'Modificat parent.'),(1033,'2014-08-23 13:12:14',3,39,'28','Grup de Consum',2,'Modificat parent.'),(1034,'2014-08-23 18:08:08',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco]',2,'Modificat unit i payment_date.'),(1035,'2014-08-23 18:08:18',3,101,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(1036,'2014-08-23 18:11:21',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(1037,'2014-08-23 18:11:39',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Cap camp modificat.'),(1038,'2014-08-23 18:13:20',18,37,'42','Sebb Fresh (seb)',2,'Afegit H_pro \"(Ecoxarxa) contribuint puntualment > Ecoxarxanoia\"'),(1039,'2014-08-23 18:15:45',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1040,'2014-08-23 18:49:48',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1041,'2014-08-24 00:14:48',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1042,'2014-08-24 00:17:19',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1043,'2014-08-24 00:17:25',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1044,'2014-08-24 00:17:33',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1045,'2014-08-24 00:25:51',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1046,'2014-08-24 00:33:19',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project i expositors.'),(1047,'2014-08-24 00:33:28',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1048,'2014-08-24 00:33:36',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1049,'2014-08-24 00:33:41',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1050,'2014-08-24 01:03:26',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1051,'2014-08-24 01:03:48',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1052,'2014-08-24 01:05:04',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1053,'2014-08-24 01:05:44',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1054,'2014-08-24 01:05:58',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1055,'2014-08-24 01:05:58',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1056,'2014-08-24 01:06:04',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1057,'2014-08-24 01:06:04',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1058,'2014-08-24 01:06:16',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1059,'2014-08-24 01:06:17',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1060,'2014-08-24 01:06:31',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1061,'2014-08-24 01:06:31',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1062,'2014-08-24 01:06:34',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1063,'2014-08-24 01:06:35',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1064,'2014-08-24 01:06:49',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1065,'2014-08-24 01:06:49',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1066,'2014-08-24 01:07:17',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1067,'2014-08-24 01:07:17',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1068,'2014-08-24 01:09:10',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1069,'2014-08-24 01:09:11',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1070,'2014-08-24 01:17:08',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1071,'2014-08-24 01:17:09',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1072,'2014-08-24 01:33:50',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1073,'2014-08-24 01:33:57',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1074,'2014-08-24 16:34:54',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1075,'2014-08-24 16:35:32',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1076,'2014-08-24 17:46:42',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(1077,'2014-08-24 17:59:05',3,37,'4','Sebas (bumbum)',2,'Modificat address per a H_adr \"treballant a > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(1078,'2014-08-24 17:59:39',3,37,'4','Sebas (bumbum)',2,'Modificat address per a H_adr \"treballant a > pis de mallorca (Mallorca, 450 - Barcelona)\".'),(1079,'2014-08-24 18:07:42',3,37,'4','Sebas (bumbum)',2,'Modificat address per a H_adr \"treballant a > Casa del Comú (pl. del Pilar - Igualada)\".'),(1080,'2014-08-24 18:11:34',3,37,'4','Sebas (bumbum)',2,'Afegit H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\"'),(1081,'2014-08-24 18:11:47',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Cooperativa Integral) rel? > Cooperativa Integral Catalana\".'),(1082,'2014-08-24 18:17:49',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\".'),(1083,'2014-08-24 18:18:28',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Cooperativa Integral) rel? > Cooperativa Integral Catalana\".'),(1084,'2014-08-24 18:20:52',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\".'),(1085,'2014-08-24 18:37:55',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Xarxa Mundial) rel? > Xarxa de Cooperatives Integrals\".'),(1086,'2014-08-24 18:40:05',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\".'),(1087,'2014-08-24 22:48:21',3,90,'20','Llicència soci: ?? ',1,''),(1088,'2014-08-24 22:48:28',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_licences.'),(1089,'2014-08-24 22:52:39',3,90,'20','Llicència soci: ?? ',3,''),(1090,'2014-08-24 22:53:05',3,90,'21','Llicència soci: ?? ',1,''),(1091,'2014-08-24 22:53:09',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_licences.'),(1092,'2014-08-24 22:54:07',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1093,'2014-08-24 22:54:16',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1094,'2014-08-24 22:57:36',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1095,'2014-08-24 23:02:47',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1096,'2014-08-24 23:06:26',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1097,'2014-08-24 23:14:44',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1098,'2014-08-24 23:14:51',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1099,'2014-08-24 23:14:57',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1100,'2014-08-24 23:23:13',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address i rel_job.'),(1101,'2014-08-24 23:23:56',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat number.'),(1102,'2014-08-24 23:24:04',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1103,'2014-08-24 23:24:08',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1104,'2014-08-24 23:54:22',3,41,'64','Asseguradora',1,''),(1105,'2014-08-24 23:54:38',3,40,'54','Arç (Arç Assegurances)',1,''),(1106,'2014-08-24 23:57:20',3,89,'22','Assegurança soci: ?? ',1,''),(1107,'2014-08-24 23:57:24',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_insurances.'),(1108,'2014-08-25 00:00:41',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1109,'2014-08-25 00:01:06',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1110,'2014-08-25 00:01:29',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1111,'2014-08-25 00:01:34',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1112,'2014-08-25 00:33:21',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1113,'2014-08-25 00:33:30',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1114,'2014-08-25 00:34:35',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1115,'2014-08-25 00:34:40',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1116,'2014-08-25 00:36:56',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1117,'2014-08-25 00:37:01',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1118,'2014-08-25 00:37:16',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1119,'2014-08-25 00:37:21',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1120,'2014-08-25 00:42:38',3,75,'43','(€) XIPU (Xarxa Integral de Professionals i Usuaries) 2347563984582345 - triodos (Triodos Bank)',2,'Modificat number.'),(1121,'2014-08-25 00:42:42',3,75,'43','(€) XIPU (Xarxa Integral de Professionals i Usuaries) 2347563984582345 - triodos (Triodos Bank)',2,'Cap camp modificat.'),(1122,'2014-08-25 00:44:35',3,75,'43','(€) Xarxa Integral de Professionals i Usuaries 2347563984582345 - triodos',2,'Cap camp modificat.'),(1123,'2014-08-25 00:46:03',3,75,'43','triodos: Xarxa Integral de Professionals i Usuaries 2347563984582345',2,'Cap camp modificat.'),(1124,'2014-08-25 00:46:29',3,75,'43','triodos: XIPU 2347563984582345',2,'Cap camp modificat.'),(1125,'2014-08-25 00:47:49',3,74,'1','(eco) CIC (Cooperativa Integral Catalana) COOP0001',2,'Cap camp modificat.'),(1126,'2014-08-25 00:47:54',3,74,'38','(eco) bumbum (Sebas) COOP0111',2,'Cap camp modificat.'),(1127,'2014-08-25 01:00:19',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1128,'2014-08-25 01:19:56',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1129,'2014-08-25 01:36:06',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(1130,'2014-08-25 01:36:55',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',1,''),(1131,'2014-08-25 01:47:40',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_accountBank.'),(1132,'2014-08-25 01:49:14',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1133,'2014-08-25 01:53:18',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1134,'2014-08-25 01:53:30',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1135,'2014-08-25 02:03:04',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address i rel_job.'),(1136,'2014-08-25 02:03:07',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1137,'2014-08-25 02:25:20',3,83,'24','quota 1T: EA (Ecoxarxanoia) [30 riu]',1,''),(1138,'2014-08-25 02:38:20',3,79,'26','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',1,''),(1139,'2014-08-25 02:39:56',3,79,'26','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1140,'2014-08-25 02:40:14',3,79,'26','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',3,''),(1141,'2014-08-25 02:40:28',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1142,'2014-08-25 02:40:59',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',1,''),(1143,'2014-08-25 02:41:43',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat rel_fees.'),(1144,'2014-08-25 02:42:50',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1145,'2014-08-25 02:43:44',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h]',2,'Cap camp modificat.'),(1146,'2014-08-25 02:45:23',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco]',2,'Cap camp modificat.'),(1147,'2014-08-25 02:47:47',3,83,'14','quota 3T: bumbum (Sebas) [45.00 eco]',2,'Modificat unit, amount, payment_type i rel_account.'),(1148,'2014-08-25 02:56:26',3,83,'14','quota 3T: bumbum (Sebas) [45.00 eco]',2,'Modificat rel_account.'),(1149,'2014-08-25 02:56:51',3,83,'14','quota 3T: bumbum (Sebas) [45.00 FAC]',2,'Modificat unit i rel_account.'),(1150,'2014-08-25 02:57:43',3,83,'14','quota 3T: bumbum (Sebas) [45.00 FAC]',2,'Modificat rel_account.'),(1151,'2014-08-25 02:58:32',3,83,'14','quota 3T: bumbum (Sebas) [45.00 €]',2,'Modificat unit.'),(1152,'2014-08-25 02:59:20',3,79,'28','alta Proj. Autoocupat: alta Soci Coop. Individual: seb (Sebb)',1,''),(1153,'2014-08-25 03:01:10',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat join_date.'),(1154,'2014-08-25 03:05:07',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1155,'2014-08-25 03:05:16',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1156,'2014-08-25 03:06:44',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(1157,'2014-08-25 03:09:09',3,100,'29','alta Soci Afí Individual: Jeto Laface (jeto)',1,''),(1158,'2014-08-25 03:12:11',3,101,'19','alta Soci Coop. Individual: seb (Sebb)',2,'Modificat expositors.'),(1159,'2014-08-25 03:20:32',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
  CONSTRAINT `ic_company_id_refs_human_id_6f7442a2` FOREIGN KEY (`ic_company_id`) REFERENCES `General_company` (`human_id`),
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
INSERT INTO `Welcome_ic_akin_membership` VALUES (5,18,3,NULL,4,'2014-08-20',NULL),(29,19,3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Welcome_ic_akin_membership` ENABLE KEYS */;
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
  KEY `Invoices_period_payment_b2321453` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_period_payment`
--

LOCK TABLES `Invoices_period_payment` WRITE;
/*!40000 ALTER TABLE `Invoices_period_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_period_payment` ENABLE KEYS */;
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
  CONSTRAINT `address_id_refs_id_0c2b9dd4` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `ic_membership_id_refs_ic_record_id_e4a14336` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership_expositors`
--

LOCK TABLES `Welcome_ic_membership_expositors` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` DISABLE KEYS */;
INSERT INTO `Welcome_ic_membership_expositors` VALUES (165,2,1),(166,2,2),(168,19,2);
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` ENABLE KEYS */;
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
  CONSTRAINT `company_id_refs_human_id_466f5e8e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `human_id_refs_id_d6164342` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_a20996dc` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_e5728480` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountbank`
--

LOCK TABLES `General_accountbank` WRITE;
/*!40000 ALTER TABLE `General_accountbank` DISABLE KEYS */;
INSERT INTO `General_accountbank` VALUES (43,15,53,2,'','2347563984582345',0);
/*!40000 ALTER TABLE `General_accountbank` ENABLE KEYS */;
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
  KEY `Invoices_period_close_0e79bd52` (`cooper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_period_close`
--

LOCK TABLES `Invoices_period_close` WRITE;
/*!40000 ALTER TABLE `Invoices_period_close` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_period_close` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_insurances`
--

LOCK TABLES `Welcome_ic_self_employed_rel_insurances` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_insurances` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_insurances` VALUES (12,7,22);
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
INSERT INTO `General_accountcrypto` VALUES (42,4,7,'fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4');
/*!40000 ALTER TABLE `General_accountcrypto` ENABLE KEYS */;
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
INSERT INTO `General_company_type` VALUES (19),(20),(64);
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
INSERT INTO `Welcome_ic_address_contract` VALUES (9,15,3,650.00,2,NULL,NULL),(12,15,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Welcome_ic_address_contract` ENABLE KEYS */;
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
INSERT INTO `General_space_type` VALUES (7),(8),(39),(40),(41),(42),(43),(44),(45),(46),(62);
/*!40000 ALTER TABLE `General_space_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_human`
--

LOCK TABLES `General_human` WRITE;
/*!40000 ALTER TABLE `General_human` DISABLE KEYS */;
INSERT INTO `General_human` VALUES (1,'Revolució Integral',NULL,NULL,'RI','','','','',''),(2,'Xarxa de Cooperatives Integrals',NULL,NULL,'XCI','','','','',''),(3,'Cooperativa Integral Catalana',NULL,NULL,'CIC','','','','',''),(4,'Sebas',NULL,NULL,'bumbum','','','','',''),(15,'Xarxa Integral de Professionals i Usuaries',NULL,NULL,'XIPU','','','','',NULL),(17,'Ecoxarxanoia',NULL,NULL,'EA','','','','',''),(18,'Marta',NULL,NULL,'tuccia','tuc@tuc.tuc','','','',''),(19,'Jeto',NULL,NULL,'jeto','jeto@jeto.jeto','','','',''),(42,'Sebb',NULL,NULL,'seb','seb@seb.seb','','','',''),(53,'Triodos Bank',NULL,NULL,'triodos','','','','',NULL),(54,'Arç Assegurances',NULL,NULL,'Arç','','','','',NULL);
/*!40000 ALTER TABLE `General_human` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csvimport_importmodel`
--

LOCK TABLES `csvimport_importmodel` WRITE;
/*!40000 ALTER TABLE `csvimport_importmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `csvimport_importmodel` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0dzf8phh14ojaf9ex134yhb4lsp42srr','NDMxOGJkNWFhMzFmN2YxNTg5NzliODQyNmFlMTk1ZTgzYWU0MDM4Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-09-01 22:27:53'),('2eay19ue6yd1p2w7ha620gm8gq7s47ac','MDQwZmFkN2Q4ZjI0YTFmY2E0NzkxYzlhZTRkYzdhZTJkMzMxOTk3ZDp7fQ==','2014-09-04 16:05:16'),('33jcrnnumrme7jkxiya1c9yqp3i8g7qe','ZWE1ZjUwNTQ0YTJkOTNjNmIzOGJhOTE3MGNjOGZjZjA5MmE2OTczMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-08-19 17:14:14'),('5k6qpeocv1cnwb38v32a3kvujlkzfqe9','NDMxOGJkNWFhMzFmN2YxNTg5NzliODQyNmFlMTk1ZTgzYWU0MDM4Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-09-04 00:37:10'),('6a57d9ge0uzjkesvhg8arpcdsnw9p3lf','NTViZjJlMWJmNzIzYzljMTU5NWY3N2U2N2JhY2EyZTc5ODhhMzIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-08-22 22:37:57'),('k28bmyq3cfmowa6jassdgqvj660f2nz6','NTViZjJlMWJmNzIzYzljMTU5NWY3N2U2N2JhY2EyZTc5ODhhMzIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-09-05 22:44:28'),('s2qy5vrq7hvj0te8q9i54md8kdsosc3c','MWFlMjYyZmIxZjE1MjljMzdlNGE2YzdhYzE5N2E5NGJiNzMyZmQwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTh9','2014-09-05 19:12:11'),('u94hm432i1z3clat2k0c9xjldl3lup9x','MGRmOGJjNTVkZDYyMGJmNGE3ZmU0ZGMwNzk5MTY4ODY5NWE0ZWU3Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9','2014-09-04 17:25:42');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_address_contracts`
--

LOCK TABLES `Welcome_ic_self_employed_rel_address_contracts` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_address_contracts` VALUES (125,7,9),(126,7,12);
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_csvimport`
--

LOCK TABLES `Invoices_csvimport` WRITE;
/*!40000 ALTER TABLE `Invoices_csvimport` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_csvimport` ENABLE KEYS */;
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
INSERT INTO `General_region_type` VALUES (39),(40),(41),(42),(43),(62);
/*!40000 ALTER TABLE `General_region_type` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `coop_number` (`coop_number`),
  KEY `Invoices_cooper_b0ecf097` (`coop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_cooper`
--

LOCK TABLES `Invoices_cooper` WRITE;
/*!40000 ALTER TABLE `Invoices_cooper` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_cooper` ENABLE KEYS */;
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
  CONSTRAINT `entity_id_refs_human_id_935d5d48` FOREIGN KEY (`entity_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `human_id_refs_id_da305fb3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `record_id_refs_id_2286902b` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  CONSTRAINT `unit_id_refs_id_07a72ac8` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_accountces`
--

LOCK TABLES `General_accountces` WRITE;
/*!40000 ALTER TABLE `General_accountces` DISABLE KEYS */;
INSERT INTO `General_accountces` VALUES (1,3,3,1,'COOP','0001'),(38,4,3,1,'COOP','0111');
/*!40000 ALTER TABLE `General_accountces` ENABLE KEYS */;
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
  CONSTRAINT `person_id_refs_human_id_ae1bbdf6` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  CONSTRAINT `project_id_refs_human_id_62b3141c` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  CONSTRAINT `record_type_id_refs_ic_type_id_576eb0fe` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`),
  CONSTRAINT `user_id_refs_id_f6d62eb5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_form_registrationprofile`
--

LOCK TABLES `public_form_registrationprofile` WRITE;
/*!40000 ALTER TABLE `public_form_registrationprofile` DISABLE KEYS */;
INSERT INTO `public_form_registrationprofile` VALUES (1,4,'ALREADY_ACTIVATED',18,NULL,7),(2,5,'ALREADY_ACTIVATED',19,NULL,10),(15,18,'ALREADY_ACTIVATED',42,NULL,7);
/*!40000 ALTER TABLE `public_form_registrationprofile` ENABLE KEYS */;
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
  KEY `Invoices_cooper_providers_3f126c2d` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_cooper_providers`
--

LOCK TABLES `Invoices_cooper_providers` WRITE;
/*!40000 ALTER TABLE `Invoices_cooper_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_cooper_providers` ENABLE KEYS */;
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
INSERT INTO `Welcome_ic_project_membership` VALUES (2,17);
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
INSERT INTO `General_nonmaterial_type` VALUES (49),(50),(51),(52),(53),(54);
/*!40000 ALTER TABLE `General_nonmaterial_type` ENABLE KEYS */;
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
  KEY `Invoices_cooper_clients_4fea5d6a` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_cooper_clients`
--

LOCK TABLES `Invoices_cooper_clients` WRITE;
/*!40000 ALTER TABLE `Invoices_cooper_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_cooper_clients` ENABLE KEYS */;
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
INSERT INTO `General_asset` VALUES (1,4,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=1393 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,35),(2,1,43),(3,1,46),(4,1,52),(5,1,55),(6,1,56),(7,1,61),(8,1,62),(9,1,63),(10,1,64),(11,1,65),(12,1,66),(13,1,67),(14,1,68),(15,1,69),(16,1,70),(17,1,71),(18,1,72),(19,1,73),(20,1,74),(21,1,76),(22,1,77),(23,1,79),(24,1,80),(25,1,82),(26,1,85),(27,1,86),(28,1,87),(793,2,1),(794,2,2),(795,2,3),(796,2,4),(797,2,5),(798,2,6),(799,2,7),(800,2,8),(801,2,9),(802,2,10),(803,2,11),(804,2,12),(805,2,13),(806,2,14),(807,2,15),(808,2,16),(809,2,17),(810,2,18),(811,2,19),(812,2,20),(813,2,21),(814,2,22),(815,2,23),(816,2,24),(817,2,25),(818,2,26),(819,2,27),(820,2,28),(821,2,29),(822,2,30),(823,2,31),(824,2,32),(825,2,33),(826,2,34),(827,2,35),(828,2,36),(829,2,37),(830,2,38),(831,2,39),(832,2,40),(833,2,41),(834,2,42),(835,2,43),(836,2,44),(837,2,45),(838,2,46),(839,2,47),(840,2,48),(841,2,49),(842,2,50),(843,2,51),(844,2,52),(845,2,53),(846,2,54),(847,2,55),(848,2,56),(849,2,57),(850,2,58),(851,2,59),(852,2,60),(853,2,61),(854,2,62),(855,2,63),(856,2,64),(857,2,65),(858,2,66),(859,2,67),(860,2,68),(861,2,69),(862,2,70),(863,2,71),(864,2,72),(865,2,73),(866,2,74),(867,2,75),(868,2,76),(869,2,77),(870,2,78),(871,2,79),(872,2,80),(873,2,81),(874,2,82),(875,2,83),(876,2,84),(877,2,85),(878,2,86),(879,2,87),(880,2,88),(881,2,89),(882,2,90),(883,2,91),(884,2,92),(885,2,93),(886,2,94),(887,2,95),(888,2,96),(889,2,100),(890,2,101),(891,2,102),(892,2,103),(893,2,104),(894,2,105),(895,2,106),(896,2,107),(897,2,108),(898,2,109),(899,2,110),(900,2,111),(901,2,112),(902,2,113),(903,2,114),(904,2,115),(905,2,116),(906,2,117),(907,2,118),(908,2,119),(909,2,120),(910,2,121),(911,2,122),(912,2,123),(913,2,124),(914,2,125),(915,2,126),(916,2,127),(917,2,128),(918,2,129),(919,2,130),(920,2,131),(921,2,132),(922,2,133),(923,2,134),(924,2,135),(925,2,136),(926,2,137),(927,2,138),(928,2,139),(929,2,140),(930,2,141),(931,2,142),(932,2,143),(933,2,144),(934,2,145),(935,2,146),(936,2,147),(937,2,148),(938,2,149),(939,2,150),(940,2,151),(941,2,152),(942,2,153),(943,2,154),(944,2,155),(945,2,156),(946,2,157),(947,2,158),(948,2,159),(949,2,163),(950,2,164),(951,2,165),(952,2,166),(953,2,167),(954,2,168),(955,2,169),(956,2,170),(957,2,171),(958,2,172),(959,2,173),(960,2,174),(961,2,175),(962,2,176),(963,2,177),(964,2,178),(965,2,179),(966,2,180),(967,2,181),(968,2,182),(969,2,183),(970,2,184),(971,2,185),(972,2,186),(973,2,187),(974,2,188),(975,2,189),(976,2,190),(977,2,191),(978,2,192),(979,2,193),(980,2,194),(981,2,195),(982,2,196),(983,2,197),(984,2,198),(985,2,199),(986,2,200),(987,2,201),(988,2,202),(989,2,203),(990,2,204),(991,2,205),(992,2,206),(993,2,207),(994,2,208),(995,2,209),(996,2,210),(997,2,211),(998,2,212),(999,2,213),(1000,2,214),(1001,2,215),(1002,2,216),(1003,2,217),(1004,2,218),(1005,2,219),(1006,2,220),(1007,2,221),(1008,2,222),(1009,2,223),(1010,2,224),(1011,2,225),(1012,2,226),(1013,2,227),(1014,2,228),(1015,2,229),(1016,2,230),(1017,2,231),(1018,2,232),(1019,2,233),(1020,2,234),(1021,2,235),(1022,2,236),(1023,2,237),(1024,2,238),(1025,2,239),(1026,2,240),(1027,2,241),(1028,2,242),(1029,2,243),(1030,2,244),(1031,2,245),(1032,2,246),(1033,2,247),(1034,2,248),(1035,2,249),(1036,2,253),(1037,2,254),(1038,2,255),(1039,2,256),(1040,2,257),(1041,2,258),(1042,2,259),(1043,2,260),(1044,2,261),(1045,2,262),(1046,2,263),(1047,2,264),(1048,2,265),(1049,2,266),(1050,2,267),(1051,2,268),(1052,2,269),(1053,2,270),(1054,2,271),(1055,2,272),(1056,2,273),(1057,2,274),(1058,2,275),(1059,2,276),(1060,2,277),(1061,2,278),(1062,2,279),(1063,2,280),(1064,2,281),(1065,2,282),(1066,2,283),(1067,2,284),(1068,2,285),(1069,2,286),(1070,2,287),(1071,2,288),(1072,2,289),(1073,2,290),(1074,2,291),(1075,2,292),(1076,2,293),(1077,2,294),(1078,2,295),(1079,2,296),(1080,2,297),(1081,2,298),(1082,2,299),(1083,2,300),(1084,2,301),(1085,2,302),(1086,2,303),(1087,2,304),(1088,2,305),(1089,2,306),(1090,2,307),(1091,2,308),(1092,2,309),(366,3,110),(367,3,124),(368,3,125),(369,3,126),(370,3,127),(345,3,128),(346,3,129),(347,3,130),(348,3,131),(349,3,132),(350,3,136),(351,3,137),(352,3,138),(353,3,139),(354,3,140),(355,3,141),(356,3,145),(357,3,146),(358,3,147),(359,3,148),(360,3,149),(361,3,150),(362,3,172),(363,3,173),(364,3,202),(365,3,203),(1093,4,1),(1094,4,2),(1095,4,3),(1096,4,4),(1097,4,5),(1098,4,6),(1099,4,7),(1100,4,8),(1101,4,9),(1102,4,10),(1103,4,11),(1104,4,12),(1105,4,13),(1106,4,14),(1107,4,15),(1108,4,16),(1109,4,17),(1110,4,18),(1111,4,19),(1112,4,20),(1113,4,21),(1114,4,22),(1115,4,23),(1116,4,24),(1117,4,25),(1118,4,26),(1119,4,27),(1120,4,28),(1121,4,29),(1122,4,30),(1123,4,31),(1124,4,32),(1125,4,33),(1126,4,34),(1127,4,35),(1128,4,36),(1129,4,37),(1130,4,38),(1131,4,39),(1132,4,40),(1133,4,41),(1134,4,42),(1135,4,43),(1136,4,44),(1137,4,45),(1138,4,46),(1139,4,47),(1140,4,48),(1141,4,49),(1142,4,50),(1143,4,51),(1144,4,52),(1145,4,53),(1146,4,54),(1147,4,55),(1148,4,56),(1149,4,57),(1150,4,58),(1151,4,59),(1152,4,60),(1153,4,61),(1154,4,62),(1155,4,63),(1156,4,64),(1157,4,65),(1158,4,66),(1159,4,67),(1160,4,68),(1161,4,69),(1162,4,70),(1163,4,71),(1164,4,72),(1165,4,73),(1166,4,74),(1167,4,75),(1168,4,76),(1169,4,77),(1170,4,78),(1171,4,79),(1172,4,80),(1173,4,81),(1174,4,82),(1175,4,83),(1176,4,84),(1177,4,85),(1178,4,86),(1179,4,87),(1180,4,88),(1181,4,89),(1182,4,90),(1183,4,91),(1184,4,92),(1185,4,93),(1186,4,94),(1187,4,95),(1188,4,96),(1189,4,100),(1190,4,101),(1191,4,102),(1192,4,103),(1193,4,104),(1194,4,105),(1195,4,106),(1196,4,107),(1197,4,108),(1198,4,109),(1199,4,110),(1200,4,111),(1201,4,112),(1202,4,113),(1203,4,114),(1204,4,115),(1205,4,116),(1206,4,117),(1207,4,118),(1208,4,119),(1209,4,120),(1210,4,121),(1211,4,122),(1212,4,123),(1213,4,124),(1214,4,125),(1215,4,126),(1216,4,127),(1217,4,128),(1218,4,129),(1219,4,130),(1220,4,131),(1221,4,132),(1222,4,133),(1223,4,134),(1224,4,135),(1225,4,136),(1226,4,137),(1227,4,138),(1228,4,139),(1229,4,140),(1230,4,141),(1231,4,142),(1232,4,143),(1233,4,144),(1234,4,145),(1235,4,146),(1236,4,147),(1237,4,148),(1238,4,149),(1239,4,150),(1240,4,151),(1241,4,152),(1242,4,153),(1243,4,154),(1244,4,155),(1245,4,156),(1246,4,157),(1247,4,158),(1248,4,159),(1249,4,163),(1250,4,164),(1251,4,165),(1252,4,166),(1253,4,167),(1254,4,168),(1255,4,169),(1256,4,170),(1257,4,171),(1258,4,172),(1259,4,173),(1260,4,174),(1261,4,175),(1262,4,176),(1263,4,177),(1264,4,178),(1265,4,179),(1266,4,180),(1267,4,181),(1268,4,182),(1269,4,183),(1270,4,184),(1271,4,185),(1272,4,186),(1273,4,187),(1274,4,188),(1275,4,189),(1276,4,190),(1277,4,191),(1278,4,192),(1279,4,193),(1280,4,194),(1281,4,195),(1282,4,196),(1283,4,197),(1284,4,198),(1285,4,199),(1286,4,200),(1287,4,201),(1288,4,202),(1289,4,203),(1290,4,204),(1291,4,205),(1292,4,206),(1293,4,207),(1294,4,208),(1295,4,209),(1296,4,210),(1297,4,211),(1298,4,212),(1299,4,213),(1300,4,214),(1301,4,215),(1302,4,216),(1303,4,217),(1304,4,218),(1305,4,219),(1306,4,220),(1307,4,221),(1308,4,222),(1309,4,223),(1310,4,224),(1311,4,225),(1312,4,226),(1313,4,227),(1314,4,228),(1315,4,229),(1316,4,230),(1317,4,231),(1318,4,232),(1319,4,233),(1320,4,234),(1321,4,235),(1322,4,236),(1323,4,237),(1324,4,238),(1325,4,239),(1326,4,240),(1327,4,241),(1328,4,242),(1329,4,243),(1330,4,244),(1331,4,245),(1332,4,246),(1333,4,247),(1334,4,248),(1335,4,249),(1336,4,253),(1337,4,254),(1338,4,255),(1339,4,256),(1340,4,257),(1341,4,258),(1342,4,259),(1343,4,260),(1344,4,261),(1345,4,262),(1346,4,263),(1347,4,264),(1348,4,265),(1349,4,266),(1350,4,267),(1351,4,268),(1352,4,269),(1353,4,270),(1354,4,271),(1355,4,272),(1356,4,273),(1357,4,274),(1358,4,275),(1359,4,276),(1360,4,277),(1361,4,278),(1362,4,279),(1363,4,280),(1364,4,281),(1365,4,282),(1366,4,283),(1367,4,284),(1368,4,285),(1369,4,286),(1370,4,287),(1371,4,288),(1372,4,289),(1373,4,290),(1374,4,291),(1375,4,292),(1376,4,293),(1377,4,294),(1378,4,295),(1379,4,296),(1380,4,297),(1381,4,298),(1382,4,299),(1383,4,300),(1384,4,301),(1385,4,302),(1386,4,303),(1387,4,304),(1388,4,305),(1389,4,306),(1390,4,307),(1391,4,308),(1392,4,309);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
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
  `size` decimal(20,2) DEFAULT NULL,
  `size_unit_id` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `General_address_4b4cf59f` (`address_type_id`),
  KEY `General_address_55a4ce96` (`region_id`),
  KEY `General_address_4f62c404` (`size_unit_id`),
  CONSTRAINT `address_type_id_refs_space_type_id_54ad4544` FOREIGN KEY (`address_type_id`) REFERENCES `General_address_type` (`space_type_id`),
  CONSTRAINT `region_id_refs_id_c1ad246c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
  CONSTRAINT `size_unit_id_refs_id_68083e30` FOREIGN KEY (`size_unit_id`) REFERENCES `General_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address`
--

LOCK TABLES `General_address` WRITE;
/*!40000 ALTER TABLE `General_address` DISABLE KEYS */;
INSERT INTO `General_address` VALUES (1,'AureaSocial',44,'Sardenya 261-263','Barcelona','',3,0,NULL,NULL,NULL,NULL,''),(2,'Casa del Comú',44,'pl. del Pilar','Igualada','',4,0,NULL,NULL,NULL,NULL,''),(3,'pis de mallorca',46,'Mallorca, 450','Barcelona','',3,0,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `General_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_purchases_movement`
--

DROP TABLE IF EXISTS `Invoices_purchases_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_purchases_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooper_id` int(11) NOT NULL,
  `concept` varchar(200) NOT NULL,
  `execution_date` date DEFAULT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `petition_date` date NOT NULL,
  `acceptation_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_purchases_movement_0e79bd52` (`cooper_id`),
  KEY `Invoices_purchases_movement_b2321453` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_purchases_movement`
--

LOCK TABLES `Invoices_purchases_movement` WRITE;
/*!40000 ALTER TABLE `Invoices_purchases_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_purchases_movement` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session`
--

LOCK TABLES `Welcome_learn_session` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session` DISABLE KEYS */;
INSERT INTO `Welcome_learn_session` VALUES (15,1,4,'2014-08-21 00:31:36','01:00:00',1),(23,2,18,'2014-08-25 03:36:21','01:00:00',1);
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
  CONSTRAINT `human_id_refs_id_b83e2682` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `learn_session_id_refs_ic_record_ptr_id_117f7e2c` FOREIGN KEY (`learn_session_id`) REFERENCES `Welcome_learn_session` (`ic_record_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session_assistants`
--

LOCK TABLES `Welcome_learn_session_assistants` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session_assistants` DISABLE KEYS */;
INSERT INTO `Welcome_learn_session_assistants` VALUES (136,15,4),(133,15,17),(134,15,18),(135,15,19);
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
  CONSTRAINT `nonmaterial_id_refs_id_eba277fb` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  CONSTRAINT `record_id_refs_id_9f9268bf` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
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
  CONSTRAINT `human_id_refs_id_aff17d88` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `region_id_refs_id_5965961e` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
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
INSERT INTO `General_company` VALUES (15,19,'Xarxa Integral de Professionals i Usuaries, SCCL',''),(53,20,'',''),(54,64,'','');
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
  CONSTRAINT `human_id_refs_id_0f3df09c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `person_id_refs_human_id_c2292566` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  CONSTRAINT `relation_id_refs_id_4d87a191` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_persons`
--

LOCK TABLES `General_rel_human_persons` WRITE;
/*!40000 ALTER TABLE `General_rel_human_persons` DISABLE KEYS */;
INSERT INTO `General_rel_human_persons` VALUES (11,3,4,11),(14,17,18,11),(15,17,4,11),(16,17,19,7);
/*!40000 ALTER TABLE `General_rel_human_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices_client`
--

DROP TABLE IF EXISTS `Invoices_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoices_client` (
  `company_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_client`
--

LOCK TABLES `Invoices_client` WRITE;
/*!40000 ALTER TABLE `Invoices_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_client` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_material`
--

LOCK TABLES `General_material` WRITE;
/*!40000 ALTER TABLE `General_material` DISABLE KEYS */;
INSERT INTO `General_material` VALUES (1,'peugeot 306','',57);
/*!40000 ALTER TABLE `General_material` ENABLE KEYS */;
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
  `number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  CONSTRAINT `company_id_refs_human_id_8dc69d9f` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  CONSTRAINT `ic_document_id_refs_ic_record_id_74e41ee0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  CONSTRAINT `price_unit_id_refs_id_cf457021` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  CONSTRAINT `rel_address_id_refs_id_0a733bc0` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `rel_job_id_refs_id_69cdbd47` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_insurance`
--

LOCK TABLES `Welcome_ic_insurance` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_insurance` DISABLE KEYS */;
INSERT INTO `Welcome_ic_insurance` VALUES (22,54,'',NULL,NULL,NULL,NULL,NULL,4);
/*!40000 ALTER TABLE `Welcome_ic_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(7,4,2),(8,4,3),(6,5,3),(21,18,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
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
  CONSTRAINT `ic_membership_id_refs_ic_record_id_f0bf3784` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  CONSTRAINT `labor_contract_id_refs_ic_document_id_6b8b7536` FOREIGN KEY (`labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`),
  CONSTRAINT `person_id_refs_human_id_aa582a02` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_person_membership`
--

LOCK TABLES `Welcome_ic_person_membership` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_person_membership` DISABLE KEYS */;
INSERT INTO `Welcome_ic_person_membership` VALUES (4,4,NULL),(19,42,NULL);
/*!40000 ALTER TABLE `Welcome_ic_person_membership` ENABLE KEYS */;
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
  CONSTRAINT `fee_id_refs_ic_record_id_bbc0ea3f` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  CONSTRAINT `ic_labor_contract_id_refs_ic_document_id_d1fb4508` FOREIGN KEY (`ic_labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`)
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
  CONSTRAINT `human_id_refs_id_3c3445f1` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `ic_record_id_refs_id_fb734d90` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  CONSTRAINT `payment_type_id_refs_ic_type_id_c8bafb66` FOREIGN KEY (`payment_type_id`) REFERENCES `Welcome_payment_type` (`ic_type_id`),
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
INSERT INTO `Welcome_fee` VALUES (1,17,3,12.00,5,'2014-08-20','2014-08-20',NULL,20,NULL),(3,4,3,30.00,1,'2014-08-20','2014-08-20',NULL,21,NULL),(8,4,3,30.00,1,'2014-08-20','2014-08-20','2014-08-23',20,NULL),(13,4,3,30.00,1,'2014-08-20','2014-08-20','2014-08-22',20,NULL),(14,4,3,45.00,2,'2014-08-20','2014-08-20',NULL,20,NULL),(18,42,3,30.00,6,'2014-08-22','2014-08-27',NULL,NULL,NULL),(24,17,3,30.00,6,'2014-08-25',NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address_jobs`
--

LOCK TABLES `General_address_jobs` WRITE;
/*!40000 ALTER TABLE `General_address_jobs` DISABLE KEYS */;
INSERT INTO `General_address_jobs` VALUES (1,2,1),(8,3,2),(9,3,3);
/*!40000 ALTER TABLE `General_address_jobs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$slHNJa0IUgZy$f4ALF9LBvaEx6UhRWeLsBPCa4ad8j82ZJjEooN4Yty0=','2014-08-05 17:14:14',1,'aleph','','','',1,1,'2014-08-05 17:11:11'),(2,'pbkdf2_sha256$12000$fZEAAYoFoyjl$TUPhMOR21ZR1TIFHKWwFADJDEP7IpglJN7KwoKWpKPw=','2014-08-05 17:34:43',0,'pepe','Pepe','GOTERA','rua13@percebe.vom',0,1,'2014-08-05 17:34:43'),(3,'pbkdf2_sha256$12000$uRZYWtMYE2eV$dHtqeDChoLdhES3GE8YO7HXLkK0Z2eWY/PTRqjMFwe4=','2014-08-22 22:44:28',1,'bumbum','','','bumbum@cooperativa.cat',1,1,'2014-08-06 14:26:28'),(4,'pbkdf2_sha256$12000$Lt3RQUroFJYr$bgylEsGNuOF39oRUNS6sUJYoCwGm53MS9dGg8scc5Z8=','2014-08-21 16:00:26',0,'tuccia','','','tuccia@cooperativa.cat',1,1,'2014-08-18 21:50:08'),(5,'pbkdf2_sha256$12000$nfQdLRQXVTja$Zk9u5wsHThlLUONpy0XxRwcryEB58iUFoSZUJvLkZhI=','2014-08-18 23:19:26',0,'jeto','','','jeto@jeto.jeto',0,1,'2014-08-18 23:19:04'),(18,'pbkdf2_sha256$12000$dlby1h96Aa4J$3c7LFAdLW2OHAY63cZKB35F2JKM2gbExHlpt2Bc93Fs=','2014-08-22 19:12:11',0,'seb','','','seb@seb.seb',0,1,'2014-08-22 00:21:37');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
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
  CONSTRAINT `job_id_refs_id_9d643e60` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  CONSTRAINT `material_id_refs_id_619f712c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  CONSTRAINT `relation_id_refs_id_16536571` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_material_jobs`
--

LOCK TABLES `General_rel_material_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_material_jobs` DISABLE KEYS */;
INSERT INTO `General_rel_material_jobs` VALUES (1,1,4,54);
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
  `main_address` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_addresses_6922ec88` (`human_id`),
  KEY `General_rel_human_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_human_addresses_d525a588` (`relation_id`),
  CONSTRAINT `address_id_refs_id_10b91208` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  CONSTRAINT `human_id_refs_id_7504d2e7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  CONSTRAINT `relation_id_refs_id_2f3eeaff` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_addresses`
--

LOCK TABLES `General_rel_human_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_human_addresses` DISABLE KEYS */;
INSERT INTO `General_rel_human_addresses` VALUES (1,3,1,17,1),(2,17,2,17,1),(3,17,1,23,0),(7,18,3,25,0),(8,4,2,26,0);
/*!40000 ALTER TABLE `General_rel_human_addresses` ENABLE KEYS */;
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
  KEY `Invoices_purchases_line_040d9802` (`percent_vat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices_purchases_line`
--

LOCK TABLES `Invoices_purchases_line` WRITE;
/*!40000 ALTER TABLE `Invoices_purchases_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoices_purchases_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-25  5:24:02
