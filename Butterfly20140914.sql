CREATE DATABASE  IF NOT EXISTS `gestioCI_butterfly` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gestioCI_butterfly`;
-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: gestioCI_butterfly
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_record`
--

LOCK TABLES `Welcome_ic_record` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record` DISABLE KEYS */;
INSERT INTO `Welcome_ic_record` VALUES (1,'quota alta Col·lectiva: EA (Ecoxarxanoia) [60.00 €]',NULL,36),(2,'alta Proj. Col·lectiu: EA (Ecoxarxanoia)','',8),(3,'quota alta Individual: bumbum (Sebas) [30.00 eco]',NULL,35),(4,'COOP0111 (bumbum)','',7),(6,'XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',NULL,NULL),(7,'alta Proj. Autoocupat: COOP0111 (bumbum)',NULL,5),(8,'quota 1T: bumbum (Sebas) [30.00 eco]',NULL,29),(9,'bumbum (Sebas): pis de mallorca','',NULL),(12,'bumbum (Sebas): Casa del Comú',NULL,NULL),(13,'quota 2T: bumbum (Sebas) [30.00 eco] > CIC',NULL,30),(14,'quota 3T: bumbum (Sebas) [45.00 €]',NULL,31),(15,'acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial','',33),(18,'quota alta Individual: seb (anonymous) [6.00 riu] > CIC',NULL,35),(19,'alta Soci Coop. Individual: seb (Sebb)','',7),(21,'Llicència d\'activitat: COOP0111 (bumbum)','',NULL),(22,'Arç: COOP0111 (bumbum)','',NULL),(23,'formació Moneda Social: 2014-08-25 (Marta) AureaSocial','',34),(24,'quota 1T: EA (Ecoxarxanoia) [30 riu]',NULL,29),(29,'alta Soci Afí Individual: Jeto Laface (jeto)','',10),(30,'quota alta Individual: duub (Duub) [30.00 €]',NULL,35),(31,'COOP0874 (duub)','',7),(32,'alta Proj. Autoocupat: COOP0874 (duub)',NULL,5),(33,'quota 3T: duub (Duub) [45.00 €]',NULL,31),(34,'XIPU: ?? > pis de mallorca','',NULL),(35,'Assegurança soci: ?? ','',NULL),(36,'Llicència d\'activitat: COOP0874 (duub)','',NULL),(40,'alta Proj. Col·lectiu: Calafou','',8),(41,'alta Proj. Col·lectiu: Creant','',8),(43,'alta Proj. Firaire: alta Proj. Col·lectiu: Creant',NULL,11),(47,'quota 4T: Creant [45.00 €]',NULL,37),(48,'alta Proj. Firaire: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',NULL,11),(63,'alta Soci Coop. Individual: Marta (tuccia)','',7),(81,NULL,NULL,35),(82,'alta Proj. Col·lectiu: Balabiro (Cooperatiu Col·lectiu)','',8),(83,'quota alta Col·lectiva: Balabiro [60.0 h]',NULL,36),(84,NULL,NULL,35),(85,NULL,NULL,7),(86,NULL,NULL,35),(87,NULL,NULL,7),(88,NULL,NULL,36),(89,NULL,NULL,8),(90,NULL,NULL,10),(91,NULL,NULL,10),(92,NULL,NULL,10),(93,NULL,NULL,10),(94,NULL,NULL,10),(95,NULL,NULL,10),(103,'103',NULL,10),(104,NULL,NULL,35),(105,NULL,NULL,7),(106,'alta Soci Afí Individual: Juan Lopez Gutierrez (afinito)','',10),(107,'quota alta Individual: cooper (Luis) [30.0 €]',NULL,35),(108,'dsfdfdsf (cooper)','',7),(109,NULL,NULL,35),(110,NULL,NULL,NULL),(111,NULL,NULL,NULL),(112,NULL,NULL,NULL),(113,NULL,NULL,NULL),(114,NULL,NULL,NULL),(115,NULL,NULL,35),(116,NULL,NULL,7),(117,'quota alta Individual: asdgsda (sdh) [30.0 €]',NULL,35),(118,'dgsdgsdg (asdgsda)','',7),(119,NULL,NULL,36),(120,NULL,NULL,36),(121,'alta Proj. Col·lectiu: hfhdf',NULL,8),(122,'quota alta Col·lectiva: wwwwwwwwwwwwwwww [60.0 €]',NULL,36),(123,'09890 lH ()','Alta Col·lectiva',8),(124,'alta Proj. Autoocupat: 09890 lH ()',NULL,5),(127,'quota alta Individual: zzz (zzzzz) [30.0 €]',NULL,35),(128,'3456 (zzz)','fhdfhdssfj',7),(129,'alta Proj. Autoocupat: 3456 (zzz)',NULL,5),(130,'quota alta Individual: prueba_person (elnomdelprovant) [30.0 €]',NULL,35),(131,'COOP4567 (prueba_person)','bla, bla',7),(132,'alta Proj. Autoocupat: COOP4567 (prueba_person)',NULL,5),(133,'133',NULL,10),(134,NULL,NULL,NULL),(135,'quota alta Individual: angel (angel) [30.0 €]',NULL,35),(136,'686786 (angel)','',7),(137,'quota alta Col·lectiva: FinDualidad [60.0 €]',NULL,36),(138,'OOPC3464 ()','',8),(139,'139',NULL,10),(140,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_fees`
--

LOCK TABLES `Welcome_ic_self_employed_rel_fees` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_fees` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_fees` VALUES (174,7,8),(175,7,13),(176,7,14),(170,32,33),(184,43,47);
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
INSERT INTO `General_person` VALUES (4,'','28374655','',''),(18,'','837462833','',''),(19,'Laface','134837561','',''),(42,'Fresh','','',''),(55,'Cognom','','',''),(56,'Madorell','','',''),(61,'dgdsgdg','','',''),(62,'aaa','','',''),(63,'aaa','','',''),(65,'','','',''),(66,'','','',''),(68,'','','',''),(69,'','','',''),(70,'','','',''),(71,'','','',''),(72,'','','',''),(73,'wuinze','4536','',''),(74,'w','333','',''),(75,'sdgdg','','',''),(76,'botella','','',''),(77,'perez lopez','4353535','',''),(78,'fhdfh','fdhfdh','',''),(79,'Gutierrez','343434','',''),(80,'Lopez Gutierrez','441123212','',''),(81,'hiuyt teett','4535325','',''),(82,'dgsdg','dsgsdg','',''),(83,'sdhsdh','sdhdh','',''),(84,'Null','45545666','','aleph'),(86,'fdhfdh','','',''),(88,'','','',''),(90,'zzzz','zzz','',''),(91,'cognoms del provant','453263463','',''),(92,'Fernandez','34325235','',''),(93,'luz bel','436','',''),(94,'angel','43646','',''),(95,'Superior','453','',''),(97,'asdgsdg','342546','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_nonmaterial`
--

LOCK TABLES `General_nonmaterial` WRITE;
/*!40000 ALTER TABLE `General_nonmaterial` DISABLE KEYS */;
INSERT INTO `General_nonmaterial` VALUES (1,'acollida Autoocupats','',53),(2,'formació Moneda Social','',53),(4,'Jeto seb','',65),(5,'debian bulbs','',65);
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
  `join_fee_id` int(11) DEFAULT NULL,
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
INSERT INTO `Welcome_ic_membership` VALUES (2,17,3,NULL,13,'2014-08-25',NULL,1,'',0),(4,4,3,NULL,12,'2014-08-20',NULL,3,'COOP0111',0),(19,42,3,NULL,14,NULL,NULL,18,'',0),(31,55,3,NULL,13,'2014-08-25',NULL,30,'COOP0874',0),(40,58,3,NULL,NULL,NULL,NULL,NULL,'',0),(41,59,3,NULL,NULL,NULL,NULL,NULL,'',0),(63,18,3,NULL,NULL,NULL,NULL,81,'',0),(82,60,3,NULL,NULL,NULL,NULL,83,'',0),(85,61,3,NULL,NULL,NULL,NULL,84,NULL,0),(87,62,3,NULL,NULL,NULL,NULL,86,NULL,0),(89,67,3,NULL,NULL,NULL,NULL,88,NULL,0),(95,77,3,NULL,NULL,NULL,NULL,NULL,NULL,0),(105,79,3,NULL,NULL,NULL,NULL,104,NULL,0),(108,81,3,NULL,NULL,'2014-09-04',NULL,107,'dsfdfdsf',0),(110,77,3,NULL,NULL,NULL,NULL,NULL,NULL,0),(111,77,3,NULL,NULL,NULL,NULL,NULL,NULL,0),(112,77,17,NULL,NULL,NULL,NULL,NULL,NULL,0),(113,77,3,NULL,NULL,NULL,NULL,NULL,NULL,0),(114,77,17,NULL,NULL,NULL,NULL,NULL,NULL,0),(116,82,3,NULL,NULL,'2014-09-05',NULL,115,NULL,0),(118,83,3,NULL,NULL,'2014-09-05',NULL,117,'dgsdgsdg',0),(121,87,3,NULL,NULL,'2014-09-05',NULL,120,NULL,0),(123,89,3,NULL,12,'2014-09-05',NULL,122,'09890 lH',0),(128,90,3,NULL,NULL,'2014-09-05',NULL,127,'3456',0),(131,91,3,NULL,12,'2014-09-06',NULL,130,'COOP4567',0),(134,93,85,NULL,NULL,NULL,NULL,NULL,NULL,0),(136,94,3,NULL,NULL,'2014-09-06',NULL,135,'686786',0),(138,96,3,NULL,NULL,'2014-09-06',NULL,137,'OOPC3464',0),(140,97,17,NULL,NULL,NULL,NULL,NULL,NULL,0);
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
INSERT INTO `General_being_type` VALUES (4),(5),(6),(13),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(64),(66);
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
INSERT INTO `Welcome_ic_record_type` VALUES (3),(4),(5),(6),(7),(8),(9),(10),(11),(13),(14),(15),(16),(17),(18),(19),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`nonmaterial_id`),
  CONSTRAINT `nonmaterial_id_refs_id_c84188d9` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_image`
--

LOCK TABLES `General_image` WRITE;
/*!40000 ALTER TABLE `General_image` DISABLE KEYS */;
INSERT INTO `General_image` VALUES (4,'files/images/bumbum.png','',100,100),(5,'files/images/debian-bulbs-by-omns.png','',1600,2560);
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
INSERT INTO `General_artwork_type` VALUES (9),(10),(11),(12),(14),(15),(16),(17),(18),(34),(35),(36),(37),(38),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(65);
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
  `doc_file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `Welcome_ic_document` VALUES (6,27,''),(9,27,''),(12,28,''),(21,14,''),(22,15,''),(34,27,''),(35,15,''),(36,14,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_record`
--

LOCK TABLES `General_record` WRITE;
/*!40000 ALTER TABLE `General_record` DISABLE KEYS */;
INSERT INTO `General_record` VALUES (1,'(eco) CIC (Cooperativa Integral Catalana) COOP0001',NULL,16),(3,'EcoCoop * 5.000 = Hora','',58),(4,'EcoCoop * 1 = Euro','',59),(5,'Riu * 1 = Euro','',59),(38,'(eco) bumbum (Sebas) COOP0111',NULL,16),(42,'(FAC) Sebas (bumbum) fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4',NULL,17),(43,'triodos: XIPU 2347563984582345',NULL,18),(44,'frfrf','ddddd',17),(45,'gsdgfg','fhgdfhfdhdfhff',17),(46,'ertrewy','dfhfdhdsfhfh',NULL),(47,'ertrewy','dfhfdhdsfhfh',18),(48,'grhgerhrefdhfd','',58),(49,'','',NULL),(50,'eee','dddd',17),(51,'ces2345','cdeswsd',16),(52,'2345','wwww',16),(53,'wwwwww','wwwww',59),(54,'ssss','ssssss',16),(55,'ggggggggggggg','ggggggggggggggg',16),(56,'retr','fhdfhfdhfdhfdhfdhf',17);
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
INSERT INTO `General_project_type` VALUES (13),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(66);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_images`
--

LOCK TABLES `Welcome_ic_self_employed_rel_images` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_images` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_images` VALUES (39,43,4),(40,43,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_jobs`
--

LOCK TABLES `General_rel_human_jobs` WRITE;
/*!40000 ALTER TABLE `General_rel_human_jobs` DISABLE KEYS */;
INSERT INTO `General_rel_human_jobs` VALUES (1,3,1,29),(2,18,2,29),(3,4,3,29),(4,19,3,28),(5,4,5,29),(6,18,5,29);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_type`
--

LOCK TABLES `Welcome_ic_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_type` VALUES (1,'Registre CI','',NULL,1,56,1,0,'iC_Record'),(2,'Forma de Pagament','',NULL,1,16,2,0,''),(3,'alta Soci CI','',4,3,10,1,2,'iC_Membership'),(4,'Alta de Membre','',1,2,17,1,1,''),(5,'alta Proj. Autoocupat','',4,11,14,1,2,'iC_Self_Employed'),(6,'Document CI','',1,18,31,1,1,'iC_Document'),(7,'alta Soci Coop. Individual','',3,4,5,1,3,'iC_Person_Membership'),(8,'alta Proj. Col·lectiu','',3,6,7,1,3,'iC_Project_Membership'),(9,'alta Proj. Públic','',3,8,9,1,3,''),(10,'alta Soci Afí Individual','',4,15,16,1,2,'iC_Akin_Membership'),(11,'alta Proj. Firaire','',5,12,13,1,3,'iC_Stallholder'),(13,'Contracte d\'Adreça','',6,19,24,1,2,'iC_Address_Contract'),(14,'Llicència d\'activitat','',6,25,26,1,2,'iC_Licence'),(15,'Assegurança soci','',6,27,28,1,2,'iC_Insurance'),(16,'Contracte Laboral','',6,29,30,1,2,'iC_Labor_Contract'),(17,'Quota','',1,32,49,1,1,'Fee'),(18,'quota d\'Alta','',17,33,38,1,2,'join_fee'),(19,'quota Trimestral','',17,39,48,1,2,'quarterly_fee'),(20,'pagament en Moneda Social','',26,9,10,2,2,''),(21,'pagament amb Hores de Treball','',26,13,14,2,2,''),(22,'pagament amb Criptomoneda','',2,2,3,2,1,''),(23,'pagament en Metàl·lic','',26,11,12,2,2,''),(24,'pagament per Transferència Bancària','',2,4,5,2,1,''),(25,'pagament fent Ingrés al Banc','',2,6,7,2,1,''),(26,'pagament presencial','',2,8,15,2,1,'face-to-face'),(27,'contracte de Lloguer','',13,20,21,1,3,''),(28,'contracte de Cessió','',13,22,23,1,3,''),(29,'quota 1T','',19,40,41,1,3,''),(30,'quota 2T','',19,42,43,1,3,''),(31,'quota 3T','',19,44,45,1,3,''),(32,'Sessió / Formació','',1,50,55,1,1,'Learn_Session'),(33,'reg Sessió d\'Acollida','',32,51,52,1,2,'welcome_session'),(34,'reg Sessió MonedaSocial','',32,53,54,1,2,'socialcoin_session'),(35,'quota alta Individual','',18,34,35,1,3,'(30_eco) individual'),(36,'quota alta Col·lectiva','',18,36,37,1,3,'(60_eco) collective'),(37,'quota 4T','',19,46,47,1,3,''),(38,'Quota Avançada','',17,0,0,0,0,'advanced_fee');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `Welcome_ic_licence` VALUES (21,'84657780yiuy8p68','2014-08-27',NULL,NULL,3),(36,'',NULL,NULL,NULL,6);
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
INSERT INTO `Welcome_ic_self_employed` VALUES (7,4,NULL,NULL,0,NULL,18.00,0,NULL,2,''),(32,31,NULL,NULL,0,NULL,NULL,0,NULL,NULL,''),(43,41,NULL,NULL,0,NULL,NULL,0,NULL,NULL,''),(48,2,NULL,NULL,0,NULL,NULL,0,NULL,NULL,''),(124,123,NULL,NULL,0,NULL,NULL,0,NULL,NULL,''),(129,128,NULL,NULL,1,NULL,NULL,0,NULL,NULL,''),(132,131,NULL,NULL,0,NULL,NULL,0,NULL,NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'AUTOOCUPAT'),(5,'gestión_económica'),(3,'iC_Akin_Membership'),(2,'iC_Person_Membership'),(4,'iC_Project_Membership'),(7,'iC_Self_Employed'),(8,'iC_Stallholder'),(6,'iC_Welcome');
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
INSERT INTO `General_project` VALUES (1,47,NULL,'','',0,1,14,1,0),(2,47,1,'','',0,2,11,1,1),(3,24,2,'','',0,3,10,1,2),(17,22,3,'','',0,4,5,1,3),(58,30,3,'','',0,6,7,1,3),(59,21,3,'','',0,8,9,1,3),(60,27,NULL,'','',0,1,2,2,0),(64,NULL,NULL,'','',0,1,2,3,0),(67,NULL,NULL,'','',0,1,2,4,0),(85,23,1,'wiki.enredaos.net','',1,12,13,1,1),(87,NULL,NULL,'','',0,1,2,6,0),(89,NULL,NULL,'','',0,1,2,7,0),(96,NULL,NULL,'','',0,1,2,8,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_licences`
--

LOCK TABLES `Welcome_ic_self_employed_rel_licences` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_licences` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_licences` VALUES (26,7,21),(24,32,36);
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
) ENGINE=InnoDB AUTO_INCREMENT=1584 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-08-05 17:29:14',1,11,'1','0',1,''),(2,'2014-08-05 17:29:18',1,11,'2','4',1,''),(3,'2014-08-05 17:29:21',1,11,'3','10',1,''),(4,'2014-08-05 17:29:24',1,11,'4','21',1,''),(5,'2014-08-05 17:30:13',1,18,'1','2014 T1',1,''),(6,'2014-08-05 17:30:40',1,18,'2','2014 T2',1,''),(7,'2014-08-05 17:30:42',1,18,'2','2014 T2',2,'No ha cambiado ningún campo.'),(8,'2014-08-05 17:31:19',1,18,'3','2014 T3',1,''),(9,'2014-08-05 17:34:26',1,3,'1','AUTOOCUPAT',1,''),(10,'2014-08-05 17:34:44',1,4,'2','pepe',1,''),(11,'2014-08-05 17:36:36',1,4,'2','pepe',2,'Modificado/a first_name, last_name, email y groups.'),(12,'2014-08-05 17:41:47',1,8,'5','csv/periodTaxes_4.csv',1,''),(13,'2014-08-05 17:42:14',1,13,'1','Xarxa de profesionals i usuàries',1,''),(14,'2014-08-05 17:43:04',1,13,'2','Interprofesionals',1,''),(15,'2014-08-05 17:43:17',1,10,'1','BTC',1,''),(16,'2014-08-05 17:43:21',1,10,'2','EURO',1,''),(17,'2014-08-05 17:43:24',1,10,'3','ECO',1,''),(18,'2014-08-05 17:43:36',1,10,'4','SALDO',1,''),(19,'2014-08-05 17:46:01',1,29,'1','Aviso de cierre automático',1,''),(20,'2014-08-06 14:52:35',3,38,'1','Revolució Integral (RI)',1,''),(21,'2014-08-06 14:52:58',3,38,'2','Xarxa de Cooperatives Integrals (XCI)',1,''),(22,'2014-08-06 14:53:14',3,38,'3','Cooperativa Integral Catalana (CIC)',1,''),(23,'2014-08-06 14:54:21',3,37,'4','Sebas (bumbum)',1,''),(24,'2014-08-06 15:35:01',3,60,'1','Països Catalans',1,''),(25,'2014-08-06 15:35:15',3,60,'2','Catalunya',1,''),(26,'2014-08-06 15:35:28',3,60,'3','Barcelonès',1,''),(27,'2014-08-06 21:31:47',3,34,'1','Ésser (Being)',1,''),(28,'2014-08-06 21:32:13',3,34,'2','Espai (Space)',1,''),(29,'2014-08-06 21:32:36',3,34,'3','Obra (Artwork)',1,''),(30,'2014-08-06 21:33:01',3,34,'4','Persona (Person)',1,''),(31,'2014-08-06 21:33:15',3,34,'5','Projecte (Project)',1,''),(32,'2014-08-06 21:33:37',3,34,'6','Empresa (Company)',1,''),(33,'2014-08-06 21:34:18',3,34,'7','Adreça (Address)',1,''),(34,'2014-08-06 21:34:35',3,34,'8','Regió (Region)',1,''),(35,'2014-08-06 21:35:32',3,34,'9','Material (Material)',1,''),(36,'2014-08-06 21:36:24',3,34,'10','Inmaterial (Nonmaterial)',1,''),(37,'2014-08-06 21:36:50',3,34,'11','Registre (Record)',1,''),(38,'2014-08-06 21:37:13',3,34,'12','Unitat (Unit)',1,''),(39,'2014-08-06 21:57:27',3,39,'13','Projecte CI',1,''),(40,'2014-08-06 21:59:55',3,70,'14','Equivalencia d\'Unitats (UnitRatio)',1,''),(41,'2014-08-06 22:00:19',3,70,'15','Compte monetari',1,''),(42,'2014-08-06 22:00:34',3,70,'16','Compte CES (AccountCes)',1,''),(43,'2014-08-06 22:01:10',3,70,'17','Compte Criptomoneda (AccountCrypto)',1,''),(44,'2014-08-06 22:01:30',3,70,'18','Compte Bancari (AccountCrypto)',1,''),(45,'2014-08-06 22:02:58',3,41,'19','Cooperativa',1,''),(46,'2014-08-06 22:03:35',3,41,'20','Bancaria',1,''),(47,'2014-08-06 22:04:29',3,39,'21','Nucli d\'Autogestió Local',1,''),(48,'2014-08-06 22:04:43',3,39,'22','Ecoxarxa',1,''),(49,'2014-08-06 22:05:53',3,39,'23','Públic',1,''),(50,'2014-08-06 22:06:05',3,39,'21','Nucli d\'Autogestió Local',2,'Modificat parent.'),(51,'2014-08-06 22:06:13',3,39,'22','Ecoxarxa',2,'Modificat parent.'),(52,'2014-08-06 22:06:55',3,39,'24','Cooperativa Integral',1,''),(53,'2014-08-06 22:07:18',3,39,'25','Productiu Public',1,''),(54,'2014-08-06 22:07:37',3,39,'26','Servei Comú',1,''),(55,'2014-08-06 22:09:10',3,39,'27','Cooperatiu Col·lectiu',1,''),(56,'2014-08-06 22:09:31',3,39,'28','Grup de Consum',1,''),(57,'2014-08-06 22:10:46',3,39,'29','De Serveis',1,''),(58,'2014-08-06 22:11:34',3,39,'30','PAIC sense facturació',1,''),(59,'2014-08-06 22:12:24',3,39,'31','Autoocupat',1,''),(60,'2014-08-06 22:12:40',3,39,'32','Autoocupat Firaire',1,''),(61,'2014-08-06 22:12:54',3,39,'33','PAIC amb facturació',1,''),(62,'2014-08-06 22:14:34',3,72,'34','Moneda',1,''),(63,'2014-08-06 22:14:54',3,72,'35','Moneda Social',1,''),(64,'2014-08-06 22:15:11',3,72,'36','Criptomoneda',1,''),(65,'2014-08-06 22:15:24',3,72,'37','Moneda Fiat',1,''),(66,'2014-08-06 22:15:50',3,72,'38','Àrea',1,''),(67,'2014-08-06 22:17:40',3,61,'39','Continent',1,''),(68,'2014-08-06 22:18:09',3,61,'40','País',1,''),(69,'2014-08-06 22:18:49',3,61,'41','Comunitat Cultural',1,''),(70,'2014-08-06 22:19:45',3,61,'40','País',2,'Modificat parent.'),(71,'2014-08-06 22:20:04',3,61,'41','Comunitat Cultural',2,'Modificat parent.'),(72,'2014-08-06 22:20:32',3,61,'42','Bioregió',1,''),(73,'2014-08-06 22:20:44',3,61,'43','Comarca',1,''),(74,'2014-08-06 22:22:19',3,59,'44','Espai Polivalent Col·lectiu',1,''),(75,'2014-08-06 22:23:56',3,59,'45','Taller',1,''),(76,'2014-08-06 22:24:35',3,59,'46','Habitatge',1,''),(77,'2014-08-07 01:46:10',3,55,'1',':Relació Humà - Humà, relacionar',1,''),(78,'2014-08-07 01:47:37',3,55,'2',':Relació Humà - Art, ',1,''),(79,'2014-08-07 01:47:59',3,55,'1',':Relació Humà - Humà, ',2,'Modificat verb i gerund.'),(80,'2014-08-07 01:48:28',3,55,'3',':Relació Humà - Espai, ',1,''),(81,'2014-08-07 01:48:40',3,55,'4',':Relació Humà - Obra, ',1,''),(82,'2014-08-07 01:50:16',3,55,'5',':Relació Persona - Projecte, ',1,''),(83,'2014-08-07 01:51:16',3,55,'6',':Relació Persona - Persona, ',1,''),(84,'2014-08-07 01:53:32',3,55,'7','Participació, participar',1,''),(85,'2014-08-07 01:54:18',3,55,'8','Dinamització, dinamitzar',1,''),(86,'2014-08-07 01:57:51',3,55,'9','Col·laboració, col·laborar',1,''),(87,'2014-08-07 12:00:15',3,97,'1','registre CI',1,''),(88,'2014-08-07 12:01:16',3,97,'2','Forma de Pagament',1,''),(89,'2014-08-07 12:05:02',3,98,'3','Alta Soci CI (iC_Membership)',1,''),(90,'2014-08-07 12:05:38',3,98,'4','Alta de Membre',1,''),(91,'2014-08-07 12:06:45',3,98,'3','Alta Soci CI (iC_Membership)',2,'Modificat parent.'),(92,'2014-08-07 12:07:49',3,98,'5','alta Soci Autoocupat (iC_Self_Employed)',1,''),(93,'2014-08-07 12:08:05',3,98,'3','alta Soci CI (iC_Membership)',2,'Modificat name.'),(94,'2014-08-07 12:16:00',3,98,'6','Document CI (iC_Document)',1,''),(95,'2014-08-07 12:20:29',3,97,'1','Registre CI (iC_Record)',2,'Modificat name i clas.'),(96,'2014-08-07 12:20:50',3,97,'4','alta de Membre',2,'Modificat name.'),(97,'2014-08-07 12:20:58',3,97,'3','Alta Soci CI (iC_Membership)',2,'Modificat name.'),(98,'2014-08-07 12:21:03',3,97,'5','Alta Soci Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(99,'2014-08-07 12:27:27',3,97,'7','alta Soci Cooperatiu Individual',1,''),(100,'2014-08-07 12:28:26',3,97,'8','alta Projecte Col·lectiu',1,''),(101,'2014-08-07 12:29:01',3,97,'9','alta Projecte Públic',1,''),(102,'2014-08-07 12:30:29',3,97,'10','alta Soci Afí Individual',1,''),(103,'2014-08-07 12:31:26',3,97,'11','alta Projecte Firaire',1,''),(104,'2014-08-07 12:31:48',3,97,'5','Alta Projecte Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(105,'2014-08-07 12:32:25',3,97,'4','Alta de Membre',2,'Modificat name.'),(106,'2014-08-07 12:32:36',3,97,'3','alta Soci CI (iC_Membership)',2,'Modificat name.'),(107,'2014-08-07 12:32:46',3,97,'5','alta Projecte Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(108,'2014-08-07 12:32:58',3,97,'11','alta Projecte Firaire (iC_Stallholder)',2,'Modificat clas.'),(109,'2014-08-07 17:20:58',3,97,'1','Registre CI (iC_Record)',1,''),(110,'2014-08-07 17:21:24',3,97,'2','Forma de Pagament (Payment_Type)',1,''),(111,'2014-08-07 17:23:14',3,98,'3','Alta de Membre',1,''),(112,'2014-08-07 17:24:26',3,98,'4','alta Soci Afí Individual (iC_Akin_Membership)',1,''),(113,'2014-08-07 17:25:09',3,98,'5','alta Soci CI (iC_Membership)',1,''),(114,'2014-08-07 17:26:25',3,98,'6','alta Soci Cooperatiu Individual',1,''),(115,'2014-08-07 17:37:57',3,98,'6','alta Soci Cooperatiu Individual (Person)',2,'Modificat clas.'),(116,'2014-08-07 17:38:24',3,98,'7','alta Projecte Col·lectiu (Project)',1,''),(117,'2014-08-07 18:01:29',3,98,'6','alta Soci Cooperatiu Individual (person)',2,'Modificat clas.'),(118,'2014-08-07 18:01:36',3,98,'7','alta Projecte Col·lectiu (project)',2,'Modificat clas.'),(119,'2014-08-07 18:02:02',3,98,'8','alta Projecte Públic (public_project)',1,''),(120,'2014-08-07 18:04:26',3,98,'9','alta Projecte Autoocupat (iC_Self_Employed)',1,''),(121,'2014-08-07 18:06:49',3,98,'10','alta Projecte Firaire (iC_Stallholder)',1,''),(122,'2014-08-07 18:07:34',3,98,'11','Document CI (iC_Document)',1,''),(123,'2014-08-07 18:40:19',3,97,'6','alta Soci Cooperatiu Individual (ic_Person_Membership)',2,'Modificat clas.'),(124,'2014-08-07 18:40:37',3,97,'7','alta Projecte Col·lectiu (ic_Project_Membership)',2,'Modificat clas.'),(125,'2014-08-07 18:41:24',3,97,'8','alta Projecte Públic',2,'Modificat clas.'),(126,'2014-08-07 18:45:19',3,98,'12','Contracte d\'Adreça (iC_Address_Contract)',1,''),(127,'2014-08-07 19:02:16',3,86,'13','Llicència soci (iC_Licence)',1,''),(128,'2014-08-07 19:03:05',3,86,'14','Assegurança soci (iC_Insurance)',1,''),(129,'2014-08-07 19:04:06',3,86,'15','Contracte Laboral (iC_Labor_Contract)',1,''),(130,'2014-08-07 19:05:48',3,98,'16','Quota (Fee)',1,''),(131,'2014-08-07 19:08:18',3,98,'17','Acompanyament de Projecte (Project_Accompaniment)',1,''),(132,'2014-08-07 19:09:05',3,98,'18','Sessió / Formació (Learn_Session)',1,''),(133,'2014-08-07 19:16:22',3,99,'19','pagament en Moneda Social',1,''),(134,'2014-08-07 19:16:35',3,99,'20','pagament en Metàl·lic',1,''),(135,'2014-08-07 19:17:04',3,99,'21','pagament amb Hores de Treball',1,''),(136,'2014-08-07 19:17:42',3,99,'22','pagament amb Criptomoneda',1,''),(137,'2014-08-07 19:19:42',3,98,'23','quota d\'Alta',1,''),(138,'2014-08-07 19:20:08',3,98,'24','quota Contracte Laboral',1,''),(139,'2014-08-07 19:20:34',3,98,'24','quota Trimestral',2,'Modificat name.'),(140,'2014-08-07 21:09:58',3,39,'47','Xarxa Mundial',1,''),(141,'2014-08-07 21:10:05',3,38,'1','Revolució Integral (RI)',1,''),(142,'2014-08-07 21:26:20',3,38,'2','Xarxa de Cooperatives Integrals (XCI)',1,''),(143,'2014-08-07 21:27:45',3,38,'3','Cooperativa Integral Catalana (CIC)',1,''),(144,'2014-08-07 21:28:42',3,71,'1','Moneda Social: EcoCoop',1,''),(145,'2014-08-07 21:29:02',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0001\"'),(146,'2014-08-07 21:31:41',3,74,'1','(eco) Cooperativa Integral Catalana (CIC) COOP0001',2,'Cap camp modificat.'),(147,'2014-08-07 21:37:00',3,60,'1','Països Catalans',1,''),(148,'2014-08-07 21:37:13',3,60,'2','Catalunya',1,''),(149,'2014-08-07 21:37:16',3,71,'2','Moneda Social: EcoBàsic',1,''),(150,'2014-08-07 21:37:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eB) Cooperativa Integral Catalana (CIC) CIEB0001\"'),(151,'2014-08-07 21:38:41',3,37,'4','Sebas (bumbum)',1,''),(152,'2014-08-07 21:40:22',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit per \"dinamitzant > Sebas (bumbum)\"'),(153,'2014-08-07 21:40:40',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"col·laborant > Sebas (bumbum)\".'),(154,'2014-08-07 21:41:40',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"Sebas (bumbum)\".'),(155,'2014-08-07 21:41:54',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"col·laborant > Sebas (bumbum)\".'),(156,'2014-08-07 21:48:05',3,71,'3','Criptomoneda: FairCoin',1,''),(157,'2014-08-07 21:49:11',3,37,'4','Sebas (bumbum)',2,'Modificat birth_date. Afegit Compte Criptomoneda \"(FAC) Sebas (bumbum) fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4\"'),(158,'2014-08-07 21:53:47',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(159,'2014-08-07 21:59:05',3,60,'3','Barcelonès',1,''),(160,'2014-08-07 21:59:42',3,71,'4','Àrea: Metre Quadrat',1,''),(161,'2014-08-07 22:00:10',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(162,'2014-08-07 22:03:14',3,55,'10','Oferiment de l\'espai, oferir l\'espai',1,''),(163,'2014-08-07 22:03:22',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit adr \"oferint l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(164,'2014-08-07 22:05:24',3,37,'5','Aleph (aleph)',1,''),(165,'2014-08-07 22:05:38',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit per \"col·laborant > Aleph (aleph)\"'),(166,'2014-08-07 22:48:09',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(167,'2014-08-07 22:49:08',3,74,'7','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(168,'2014-08-07 22:52:13',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(169,'2014-08-07 22:53:05',3,74,'9','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(170,'2014-08-07 22:54:10',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(171,'2014-08-07 22:56:30',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\".'),(172,'2014-08-07 23:05:57',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(173,'2014-08-07 23:08:49',3,74,'16','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(174,'2014-08-07 23:09:15',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(175,'2014-08-07 23:10:45',3,74,'17','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(176,'2014-08-07 23:11:38',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(177,'2014-08-07 23:16:50',3,74,'19','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(178,'2014-08-07 23:28:29',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(179,'2014-08-07 23:40:22',3,74,'30','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(180,'2014-08-07 23:41:06',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(181,'2014-08-07 23:48:23',3,74,'31','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(182,'2014-08-07 23:48:58',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(183,'2014-08-07 23:50:59',3,74,'32','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(184,'2014-08-07 23:53:59',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(185,'2014-08-08 00:02:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\".'),(186,'2014-08-08 00:38:47',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(187,'2014-08-08 00:40:16',3,74,'38','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(188,'2014-08-08 00:40:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(189,'2014-08-08 00:41:12',3,74,'39','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(190,'2014-08-08 00:41:32',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(191,'2014-08-08 00:42:39',3,74,'40','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(192,'2014-08-08 00:43:03',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\"'),(193,'2014-08-08 00:50:41',3,74,'41','(eco) Cooperativa Integral Catalana (CIC) COOP0000',3,''),(194,'2014-08-08 00:55:55',3,70,'18','Compte Bancari (AccountBank)',2,'Modificat clas.'),(195,'2014-08-08 00:56:01',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\" Afegit Compte Criptomoneda \"(FAC) Cooperativa Integral Catalana (CIC) nolatincpas\"'),(196,'2014-08-08 00:56:55',3,76,'45','(FAC) Cooperativa Integral Catalana (CIC) nolatincpas',3,''),(197,'2014-08-08 00:58:01',3,40,'6','Triodos Bank',1,''),(198,'2014-08-08 00:58:36',3,71,'5','Moneda Fiat: Euro',1,''),(199,'2014-08-08 00:59:04',3,37,'4','Sebas (bumbum)',2,'Afegit Compte Bancari \"(€) Sebas (bumbum) 124512351290581 ()\"'),(200,'2014-08-08 01:03:45',3,40,'6','Triodos Bank (Triodos)',2,'Modificat nickname.'),(201,'2014-08-08 01:28:24',3,64,'48','Digital',1,''),(202,'2014-08-08 01:28:48',3,64,'49','Cultural',1,''),(203,'2014-08-08 09:12:51',3,64,'50','Arxiu digital',1,''),(204,'2014-08-08 09:13:47',3,64,'51','Imatge digital (Image)',1,''),(205,'2014-08-08 11:24:50',3,78,'1','CIC > Sebas (bumbum)',1,''),(206,'2014-08-08 11:32:42',3,100,'3','',1,''),(207,'2014-08-08 11:44:49',3,83,'5','quota d\'Alta: Sebas (bumbum) [30 €] > CIC',1,''),(208,'2014-08-08 11:45:05',3,78,'6','CIC > Sebas (bumbum)',1,''),(209,'2014-08-08 11:45:21',3,78,'6','CIC > Sebas (bumbum)',2,'Modificat name.'),(210,'2014-08-08 12:36:21',3,78,'6','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(211,'2014-08-08 12:43:48',3,83,'5','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat membership.'),(212,'2014-08-08 12:43:57',3,83,'5','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(213,'2014-08-08 12:44:12',3,83,'5','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(214,'2014-08-08 12:52:57',3,77,'3','',3,''),(215,'2014-08-08 12:53:14',3,77,'1','',3,''),(216,'2014-08-08 12:53:32',3,77,'6','',3,''),(217,'2014-08-08 17:21:45',3,83,'7','quota d\'Alta: Sebas (bumbum) [30 €] > CIC',1,''),(218,'2014-08-08 17:21:52',3,78,'8','CIC > Sebas (bumbum)',1,''),(219,'2014-08-08 17:23:54',3,78,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(220,'2014-08-08 17:24:08',3,78,'8','CIC > Sebas (bumbum)',3,''),(221,'2014-08-08 17:25:01',3,78,'9','CIC > Sebas (bumbum)',1,''),(222,'2014-08-08 17:29:22',3,78,'9','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(223,'2014-08-08 17:29:44',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Cap camp modificat.'),(224,'2014-08-08 17:29:55',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Cap camp modificat.'),(225,'2014-08-08 17:34:14',3,100,'10','',1,''),(226,'2014-08-08 17:34:28',3,100,'10','',2,'Cap camp modificat.'),(227,'2014-08-08 17:42:49',3,100,'10','',2,'Cap camp modificat.'),(228,'2014-08-08 17:56:13',3,100,'10','Cooperativa Integral Catalana > Aleph (aleph)',2,'Cap camp modificat.'),(229,'2014-08-08 17:57:27',3,100,'10','CIC > Aleph (aleph)',2,'Cap camp modificat.'),(230,'2014-08-08 20:40:30',3,100,'10','alta Soci Afí Individual: Aleph (aleph)',2,'Cap camp modificat.'),(231,'2014-08-08 20:52:59',3,100,'10','alta Soci Afí Individual: Aleph (aleph)',3,''),(232,'2014-08-08 21:11:58',3,100,'13','alta Soci Afí Individual: Aleph (aleph)',1,''),(233,'2014-08-08 21:12:12',3,100,'13','alta Soci Afí Individual: Aleph (aleph)',2,'Cap camp modificat.'),(234,'2014-08-08 21:23:15',3,100,'13','alta Soci Afí Individual: Aleph (aleph)',2,'Cap camp modificat.'),(235,'2014-08-08 21:23:56',3,37,'5','Aleph (aleph)',2,'Modificat id_card.'),(236,'2014-08-08 21:35:56',3,37,'5','Aleph (aleph)',2,'Modificat id_card.'),(237,'2014-08-08 21:39:14',3,78,'9','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(238,'2014-08-08 21:47:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0000\".'),(239,'2014-08-08 21:48:17',3,60,'4','Continent Europeu',1,''),(240,'2014-08-08 21:48:24',3,60,'1','Països Catalans',2,'Modificat parent.'),(241,'2014-08-08 21:50:41',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte Bancari \"(€) Sebas (bumbum) 124512351290581 - Triodos Bank (Triodos)\".'),(242,'2014-08-08 21:51:11',3,37,'4','Sebas (bumbum)',2,'Modificat email.'),(243,'2014-08-08 21:54:08',3,67,'52','Vehicle',1,''),(244,'2001-01-13 12:42:38',3,67,'53','Cotxe',1,''),(245,'2014-08-08 22:39:12',3,37,'4','Sebas (bumbum)',2,'Afegit Actiu \"(Cotxe) peugeot 306\"'),(246,'2014-08-08 23:13:16',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(247,'2014-08-09 18:50:04',3,55,'11','Contribució, contribuir',1,''),(248,'2014-08-09 19:25:31',3,72,'38','Àrea (area)',2,'Modificat clas.'),(249,'2014-08-09 19:25:48',3,72,'34','Moneda (currency)',2,'Modificat clas.'),(250,'2014-08-09 19:37:02',3,71,'6','Àrea: Hectàrea',1,''),(251,'2014-08-09 19:37:21',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona) (Sardenya 261-263 - Barcelona)',2,'Modificat size_unit.'),(252,'2014-08-09 19:40:06',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona) (Sardenya 261-263 - Barcelona) (Sardenya 261-263 - Barcelona)',2,'Modificat main_address.'),(253,'2014-08-09 19:42:03',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat name.'),(254,'2014-08-10 13:02:04',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat main_address.'),(255,'2014-08-10 13:04:27',3,37,'7','Marta (tuccia) (tuccia)',1,''),(256,'2014-08-10 13:04:49',3,38,'3','Cooperativa Integral Catalana (CIC) (CIC)',2,'Afegit per \"dinamitzant > Marta (tuccia) (tuccia)\"'),(257,'2014-08-10 13:11:55',3,37,'7','Marta (tuccia)',2,'Modificat name.'),(258,'2014-08-10 13:25:55',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat name.'),(259,'2014-08-11 13:13:04',3,99,'22','pagament amb Criptomoneda',3,''),(260,'2014-08-11 13:20:16',3,83,'7','quota d\'Alta: Sebas (bumbum) [30.00 €] > CIC',2,'Modificat payment_date.'),(261,'2014-08-11 15:42:49',3,55,'12','Referent, referenciar (referent)',1,''),(262,'2014-08-11 15:43:02',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a per \"referenciant > Sebas (bumbum)\".'),(263,'2014-08-15 11:56:04',3,72,'38','Àrea (area)',2,'Modificat clas.'),(264,'2014-08-15 11:56:22',3,72,'34','Moneda (currency)',2,'Modificat clas.'),(265,'2014-08-15 12:08:14',3,98,'7','alta Soci Cooperatiu Individual (ic_Person_Membership)',2,'Modificat clas.'),(266,'2014-08-15 12:08:25',3,98,'7','alta Soci Cooperatiu Individual (iC_Person_Membership)',2,'Modificat clas.'),(267,'2014-08-15 12:08:49',3,98,'8','alta Projecte Col·lectiu (iC_Project_Membership)',2,'Modificat clas.'),(268,'2014-08-15 12:09:05',3,98,'10','alta Soci Afí Individual (iC_Akin_Membership)',2,'Modificat clas.'),(269,'2014-08-15 12:30:39',3,86,'13','Contracte d\'Adreça (iC_Address_Contract)',1,''),(270,'2014-08-15 12:31:38',3,86,'14','Llicència soci (iC_Licence)',1,''),(271,'2014-08-15 12:32:10',3,86,'15','Assegurança soci (iC_Insurance)',1,''),(272,'2014-08-15 12:32:41',3,86,'16','Contracte Laboral (iC_Labor_Contract)',1,''),(273,'2014-08-15 12:34:50',3,98,'17','Quota (Fee)',1,''),(274,'2014-08-15 12:35:31',3,98,'18','quota d\'Alta',1,''),(275,'2014-08-15 12:35:47',3,98,'19','quota Trimestral',1,''),(276,'2014-08-15 12:40:10',3,99,'20','pagament en Moneda Social',1,''),(277,'2014-08-15 12:40:27',3,99,'21','pagament amb Hores de Treball',1,''),(278,'2014-08-15 12:40:52',3,99,'22','pagament amb Criptomoneda',1,''),(279,'2014-08-15 12:41:05',3,99,'23','pagament en Metàl·lic',1,''),(280,'2014-08-15 12:45:55',3,99,'24','pagament per Transferència Bancària',1,''),(281,'2014-08-15 12:46:14',3,99,'25','pagament fent Ingrés al Banc',1,''),(282,'2014-08-15 12:46:50',3,99,'26','pagament presencial (face-to-face)',1,''),(283,'2014-08-15 12:47:08',3,99,'20','pagament en Moneda Social',2,'Modificat parent.'),(284,'2014-08-15 12:47:21',3,99,'23','pagament en Metàl·lic',2,'Modificat parent.'),(285,'2014-08-15 12:47:30',3,99,'21','pagament amb Hores de Treball',2,'Modificat parent.'),(286,'2014-08-15 13:09:18',3,39,'47','Xarxa Mundial',1,''),(287,'2014-08-15 13:09:29',3,38,'1','Revolució Integral (RI) (RI)',1,''),(288,'2014-08-15 13:11:20',3,38,'2','Xarxa de Cooperatives Integrals',1,''),(289,'2014-08-15 13:11:34',3,38,'1','Revolució Integral (RI)',2,'Modificat name.'),(290,'2014-08-15 13:11:58',3,38,'2','Xarxa de Cooperatives Integrals (XCI)',2,'Modificat nickname.'),(291,'2014-08-15 13:12:21',3,38,'3','Cooperativa Integral Catalana (CIC)',1,''),(292,'2014-08-15 13:13:40',3,37,'4','Sebas (bumbum)',1,''),(293,'2014-08-15 13:15:42',3,37,'5','Marta (tuccia)',1,''),(294,'2014-08-15 13:16:23',3,37,'6','Aleph ',1,''),(295,'2014-08-15 13:18:52',3,71,'1','Moneda Social: EcoCoop',1,''),(296,'2014-08-15 13:19:33',3,71,'2','Moneda Fiat: Euro',1,''),(297,'2014-08-15 13:19:57',3,71,'3','Àrea: Metre Quadrat',1,''),(298,'2014-08-15 13:20:15',3,71,'4','Àrea: Hectàrea',1,''),(299,'2014-08-15 13:36:57',3,55,'10','Contribució, contribuir',1,''),(300,'2014-08-15 13:37:59',3,55,'11','Referent, referenciar (referent)',1,''),(301,'2014-08-15 13:42:54',3,55,'12','contribució en alguna comissió, contribuir en comissió',1,''),(302,'2014-08-15 13:43:42',3,55,'13','contribució puntual en tasques organitzatives, contribuir puntualment',1,''),(303,'2014-08-15 13:44:08',3,55,'14','contribució econòmica, contribuir econòmicament',1,''),(304,'2014-08-15 13:52:06',3,55,'10','Contribució, contribuir (contribution)',2,'Modificat clas.'),(305,'2014-08-15 14:20:26',3,37,'6','Aleph ',3,''),(306,'2014-08-15 15:05:04',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(307,'2014-08-15 15:06:14',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(308,'2014-08-15 15:08:45',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(309,'2014-08-15 15:26:45',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(310,'2014-08-15 15:32:30',3,3,'2','iC_Person_Membership',2,'Cap camp modificat.'),(311,'2014-08-15 15:33:38',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(312,'2014-08-15 15:37:26',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(313,'2014-08-15 15:38:51',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(314,'2014-08-15 15:54:12',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(315,'2014-08-15 16:00:59',3,55,'5',':Relació Persona - Projecte,  (rel_pers_proj)',2,'Modificat clas.'),(316,'2014-08-15 16:02:24',3,55,'3',':Relació Humà - Espai,  (rel_hum_addr)',2,'Modificat clas.'),(317,'2014-08-15 16:13:28',3,60,'1','Països Catalans',1,''),(318,'2014-08-15 16:13:41',3,60,'2','Catalunya',1,''),(319,'2014-08-15 16:13:57',3,60,'3','Barcelonès',1,''),(320,'2014-08-15 16:15:53',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(321,'2014-08-15 16:18:15',3,55,'15',':Relació Projecte - Adreça,  (rel_proj_addr)',1,''),(322,'2014-08-15 16:23:19',3,55,'16','Oferiment de l\'espai, oferir l\'espai',1,''),(323,'2014-08-15 16:23:58',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_adr \"oferint l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(324,'2014-08-15 16:25:39',3,55,'17','Gestió de l\'espai, gestionar l\'espai',1,''),(325,'2014-08-15 16:25:43',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a H_adr \"gestionant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(326,'2014-08-15 16:26:13',3,55,'16','Oferiment de l\'espai, oferir l\'espai',2,'Modificat parent.'),(327,'2014-08-15 16:27:18',3,37,'7','alep (alep)',3,''),(328,'2014-08-15 16:29:16',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(329,'2014-08-15 16:44:03',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(330,'2014-08-15 17:16:52',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(331,'2014-08-15 17:18:24',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(332,'2014-08-15 17:23:45',3,37,'8','alep (alep)',3,''),(333,'2014-08-15 17:26:50',3,4,'5','alep',3,''),(334,'2014-08-15 18:08:25',3,37,'5','Marta (tuccia)',3,''),(335,'2014-08-15 18:19:26',3,37,'9',' (tuccia)',3,''),(336,'2014-08-15 18:19:49',3,4,'6','tuccia',3,''),(337,'2014-08-15 18:29:40',3,4,'7','tuccia',3,''),(338,'2014-08-15 18:29:53',3,37,'10',' (tuccia)',3,''),(339,'2014-08-15 19:30:22',3,37,'11','Marta (tuccia)',2,'Modificat name.'),(340,'2014-08-15 19:31:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"participant > Sebas (bumbum)\" Afegit H_per \"participant > Marta (tuccia)\"'),(341,'2014-08-15 19:34:45',3,100,'7','alta Soci Afí Individual: Marta (tuccia)',1,''),(342,'2014-08-15 20:25:16',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(343,'2014-08-15 20:27:00',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(344,'2014-08-15 20:31:33',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(345,'2014-08-15 20:53:40',3,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(346,'2014-08-15 21:16:55',3,37,'11','Marta (tuccia)',3,''),(347,'2014-08-15 21:17:16',3,4,'8','tuccia',3,''),(348,'2014-08-15 21:22:59',3,4,'9','tuccia',3,''),(349,'2014-08-15 21:23:15',3,37,'12',' (tuccia)',3,''),(350,'2014-08-15 21:45:58',3,37,'13','Marta P (tuccia)',2,'Modificat name.'),(351,'2014-08-15 21:49:25',3,37,'13','Marta P (tuccia)',3,''),(352,'2014-08-15 21:50:17',3,4,'10','tuccia',3,''),(354,'2014-08-15 22:01:07',3,100,'9','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(355,'2014-08-15 22:27:28',3,100,'9','alta Soci Afí Individual: Marta (tuccia)',3,''),(356,'2014-08-15 22:28:32',3,4,'11','tuccia',3,''),(357,'2014-08-16 08:38:57',3,37,'14','Marta (tuccia)',3,''),(358,'2014-08-16 09:01:21',3,72,'35','Moneda Social (social_currency)',2,'Modificat clas.'),(359,'2014-08-16 09:01:33',3,72,'36','Criptomoneda (crypto_currency)',2,'Modificat clas.'),(360,'2014-08-16 09:01:44',3,72,'37','Moneda Fiat (fiat_currency)',2,'Modificat clas.'),(361,'2014-08-16 09:19:49',3,40,'15','Xarxa Integral de Professionals i Usuaries (XIPU)',1,''),(362,'2014-08-16 09:22:10',3,55,'1',':Relació Humà - Humà,  (rel_hum_hum)',2,'Modificat clas.'),(363,'2014-08-16 09:22:28',3,55,'6',':Relació Persona - Persona,  (rel_pers_pers)',2,'Modificat clas.'),(364,'2014-08-16 09:23:40',3,55,'18',':Relació Projecte - Empresa,  (rel_proj_empr)',1,''),(365,'2014-08-16 09:26:06',3,55,'19',':Relació Projecte - Persona, ',1,''),(366,'2014-08-16 09:26:25',3,55,'19',':Relació Projecte - Persona,  (rel_proj_pers)',2,'Modificat parent i clas.'),(367,'2014-08-16 09:36:26',3,55,'20','Utilització, utilitzar',1,''),(368,'2014-08-16 09:37:21',3,55,'21',':Relació Projecte - Projecte,  (rel_proj_proj)',1,''),(369,'2014-08-16 09:38:44',3,55,'22',':Relació Persona - Empresa,  (rel_pers_empr)',1,''),(370,'2014-08-16 09:41:50',3,55,'11','Referència, referenciar (referent)',2,'Modificat name.'),(371,'2014-08-16 09:43:54',3,55,'11','Referència, referenciar (reference)',2,'Modificat clas.'),(372,'2014-08-16 09:46:48',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_emp \"(Cooperativa) utilitzant > Xarxa Integral de Professionals i Usuaries (XIPU)\"'),(373,'2014-08-16 09:47:07',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a H_per \"referenciant > Sebas (bumbum)\".'),(374,'2014-08-16 19:17:44',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat relation per a H_per \"dinamitzant > Sebas (bumbum)\".'),(375,'2014-08-16 19:18:48',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"dinamitzant > Sebas (bumbum)\".'),(376,'2014-08-16 19:21:44',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(377,'2014-08-16 19:34:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(378,'2014-08-16 21:22:41',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(379,'2014-08-16 21:27:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(380,'2014-08-16 21:27:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(381,'2014-08-16 21:41:36',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(382,'2014-08-16 21:41:53',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(383,'2014-08-16 21:42:39',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(384,'2014-08-16 21:43:48',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(385,'2014-08-16 21:45:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(386,'2014-08-16 21:46:29',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(387,'2014-08-16 21:47:33',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(388,'2014-08-16 21:49:12',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(389,'2014-08-16 21:50:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"Sebas (bumbum)\".'),(390,'2014-08-16 21:55:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(391,'2014-08-16 21:57:43',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(392,'2014-08-16 22:02:55',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(393,'2014-08-16 22:03:12',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(394,'2014-08-16 22:33:26',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(395,'2014-08-16 22:33:46',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(396,'2014-08-16 22:35:18',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(397,'2014-08-16 22:37:04',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(398,'2014-08-16 22:38:34',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(399,'2014-08-16 22:51:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(400,'2014-08-16 22:56:40',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(401,'2014-08-16 23:16:02',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"Sebas (bumbum)\"'),(402,'2014-08-16 23:23:21',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0111\"'),(403,'2014-08-16 23:53:42',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"referenciant > Sebas (bumbum)\"'),(404,'2014-08-16 23:54:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Eliminat H_per \"referenciant > Sebas (bumbum)\".'),(405,'2014-08-16 23:56:33',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"referenciant > Sebas (bumbum)\"'),(406,'2014-08-17 00:00:22',3,37,'16','Marta (tuccia)',1,''),(407,'2014-08-17 00:03:26',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"dinamitzant > Marta (tuccia)\"'),(408,'2014-08-17 00:07:20',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"dinamitzant > Marta (tuccia)\"'),(409,'2014-08-17 00:11:00',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_per \"dinamitzant > Marta (tuccia)\"'),(410,'2014-08-17 00:53:02',3,38,'17','Ecoxarxanoia',1,''),(411,'2014-08-17 19:10:21',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat number per a Compte CES \"(eco) Cooperativa Integral Catalana (CIC) COOP0001\".'),(412,'2014-08-17 19:11:00',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat nickname.'),(413,'2014-08-17 19:36:27',3,60,'4','Anoia',1,''),(414,'2014-08-17 19:37:59',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',1,''),(415,'2014-08-17 19:38:23',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\"'),(416,'2014-08-17 19:53:24',3,61,'43','Comarca (region)',2,'Modificat clas.'),(417,'2014-08-17 20:04:05',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(418,'2014-08-17 20:34:22',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(419,'2014-08-17 21:16:14',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\".'),(420,'2014-08-17 21:43:10',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\".'),(421,'2014-08-17 21:53:23',3,55,'23','Utilització d\'espai, utilitzar l\'espai',1,''),(422,'2014-08-17 21:53:28',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_adr \"utilitzant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(423,'2014-08-17 21:54:10',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat main_address per a H_adr \"utilitzant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(424,'2014-08-17 22:06:52',3,55,'24',':Relació Persona - Adreça',1,''),(425,'2014-08-17 22:08:24',3,55,'25','Habitatge, habitar',1,''),(426,'2014-08-17 22:10:36',3,55,'26','Treball, treballar',1,''),(427,'2014-08-17 22:15:12',3,55,'27','Seguiment, seguir',1,''),(428,'2014-08-17 22:20:33',3,100,'1','alta Soci Afí Individual: Sebas (bumbum)',1,''),(429,'2014-08-17 22:42:11',3,56,'1','Autogestió, autogestionar',1,''),(430,'2014-08-17 22:43:25',3,55,'28','Aprenentatge, apendre',1,''),(431,'2014-08-17 22:44:05',3,55,'29','Pràctica, practicar',1,''),(432,'2014-08-17 22:44:14',3,38,'3','Cooperativa Integral Catalana (CIC)',2,'Afegit H_ofi \"practicant > Autogestió, autogestionar\"'),(433,'2014-08-17 22:45:36',3,55,'2',':Relació Humà - Art (rel_hum_art)',2,'Modificat clas.'),(434,'2014-08-18 00:57:05',3,55,'10','Contribució, contribuir (contribute)',2,'Modificat clas.'),(435,'2014-08-18 02:16:44',3,72,'48','Temps (time)',1,''),(436,'2014-08-18 02:17:09',3,71,'5','Temps: Hora',1,''),(437,'2014-08-18 02:20:18',3,72,'48','Temps (time_currency)',2,'Modificat clas.'),(438,'2014-08-18 02:20:40',3,83,'2','quota d\'Alta: Sebas (bumbum) [6 h] > CIC',1,''),(439,'2014-08-18 02:21:07',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',1,''),(440,'2014-08-18 02:58:09',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat membership.'),(441,'2014-08-18 03:03:15',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat deadline_date i payment_date.'),(442,'2014-08-18 03:03:28',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(443,'2014-08-18 03:04:02',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Modificat join_date.'),(444,'2014-08-18 03:08:19',3,71,'6','Moneda Social: Riu',1,''),(445,'2014-08-18 03:08:35',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60 riu] > CIC',1,''),(446,'2014-08-18 03:09:05',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',1,''),(447,'2014-08-18 03:10:43',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Modificat membership.'),(448,'2014-08-18 03:11:42',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Cap camp modificat.'),(449,'2014-08-18 03:16:14',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',2,'Modificat join_date.'),(450,'2014-08-18 03:26:52',3,100,'1','alta Soci Afí Individual: Marta (tuccia)',2,'Modificat person.'),(451,'2014-08-18 03:27:13',3,100,'1','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(452,'2014-08-18 03:28:50',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Modificat payment_date.'),(453,'2014-08-18 03:29:10',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(454,'2014-08-18 12:27:39',3,79,'7','CIC > Sebas (bumbum)',1,''),(455,'2014-08-18 12:49:08',3,79,'7','CIC > Sebas (bumbum)',2,'Afegit Contracte d\'Adreça CI \"XIPU: ?? > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(457,'2014-08-18 13:31:04',3,79,'8','CIC > Sebas (bumbum)',1,''),(458,'2014-08-18 13:34:21',3,79,'8','CIC > Sebas (bumbum)',2,'Afegit Contracte d\'Adreça CI \"None\"'),(459,'2014-08-18 13:56:26',3,79,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(460,'2014-08-18 14:01:39',3,79,'8','CIC > Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(461,'2014-08-18 14:07:14',3,88,'8','XIPU: Sebas > AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(462,'2014-08-18 14:09:45',3,88,'8','XIPU: Sebas (bumbum) > AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(463,'2014-08-18 14:13:29',3,88,'8','XIPU: Sebas (bumbum) > AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(464,'2014-08-18 14:16:14',3,83,'9','quota Trimestral: Sebas (bumbum) [30 €] > CIC',1,''),(465,'2014-08-18 14:16:55',3,79,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(466,'2014-08-18 14:21:04',3,55,'30',':Relació Humà - Registre (rel_hum_reco)',1,''),(467,'2014-08-18 15:28:57',3,79,'8','CIC > Sebas (bumbum)',2,'Modificat rel_fees.'),(468,'2014-08-18 15:30:52',3,79,'8','CIC > Sebas (bumbum)',2,'Cap camp modificat.'),(469,'2014-08-18 15:54:23',3,83,'9','quota Trimestral: Sebas (bumbum) [30.00 €] > CIC',3,''),(470,'2014-08-18 16:19:10',3,83,'10','quota Trimestral: Sebas (bumbum) [30 €] > CIC',1,''),(471,'2014-08-18 16:19:37',3,79,'8','CIC > Sebas (bumbum)',2,'Modificat rel_fees.'),(472,'2014-08-18 16:33:39',3,83,'10','quota Trimestral: Sebas (bumbum) [30.00 €] > CIC',2,'Cap camp modificat.'),(473,'2014-08-18 20:53:20',3,79,'8','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat ic_membership.'),(474,'2014-08-18 20:58:40',3,79,'8','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat ic_membership.'),(475,'2014-08-18 21:01:48',3,79,'11','alta Projecte Autoocupat: Ecoxarxanoia (EA)',1,''),(476,'2014-08-18 21:49:22',3,37,'16','Marta (tuccia)',3,''),(477,'2014-08-18 21:53:43',4,37,'18','Marta (tuccia)',2,'Modificat name.'),(478,'2014-08-18 22:00:12',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(479,'2014-08-18 22:03:22',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(480,'2014-08-18 22:06:52',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(481,'2014-08-18 22:09:16',3,41,'20','Bancaria (bank)',2,'Modificat clas.'),(482,'2014-08-18 22:09:35',3,41,'19','Cooperativa (cooperative)',2,'Modificat clas.'),(483,'2014-08-18 22:16:11',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(484,'2014-08-18 22:17:10',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(485,'2014-08-18 22:18:50',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(486,'2014-08-18 22:19:36',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(487,'2014-08-18 22:21:38',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(488,'2014-08-18 22:21:56',3,3,'2','iC_Person_Membership',2,'Modificat permissions.'),(489,'2014-08-18 22:24:22',3,4,'4','tuccia',2,'Modificat user_permissions.'),(490,'2014-08-18 22:27:02',3,4,'4','tuccia',2,'Modificat user_permissions.'),(491,'2014-08-18 22:27:24',3,4,'4','tuccia',2,'Modificat is_staff.'),(492,'2014-08-18 22:30:09',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',1,''),(493,'2014-08-18 22:36:28',3,37,'18','Marta (tuccia)',2,'Afegit H_adr \"pis de mallorca (Mallorca, 450 - Barcelona)\"'),(494,'2014-08-18 22:38:49',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(495,'2014-08-18 22:43:56',3,56,'2','Coordinació, coordinar',1,''),(496,'2014-08-18 22:44:23',3,37,'18','Marta (tuccia)',2,'Modificat relation per a H_adr \"habitant > pis de mallorca (Mallorca, 450 - Barcelona)\". Afegit H_ofi \"practicant > Coordinació, coordinar\"'),(497,'2014-08-18 22:56:07',3,83,'2','quota d\'Alta: Sebas (bumbum) [6 h] > CIC',1,''),(498,'2014-08-18 22:57:21',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',1,''),(499,'2014-08-18 23:02:36',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Cap camp modificat.'),(500,'2014-08-18 23:04:31',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Cap camp modificat.'),(501,'2014-08-18 23:05:08',3,83,'2','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Cap camp modificat.'),(502,'2014-08-18 23:05:22',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(503,'2014-08-18 23:06:59',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60 riu] > CIC',1,''),(504,'2014-08-18 23:07:42',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',1,''),(505,'2014-08-18 23:08:15',3,83,'4','quota d\'Alta: Ecoxarxanoia (EA) [60.00 riu] > CIC',2,'Cap camp modificat.'),(506,'2014-08-18 23:15:57',4,100,'7','alta Soci Afí Individual: Marta (tuccia)',1,''),(507,'2014-08-18 23:17:15',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(508,'2014-08-18 23:17:49',4,100,'7','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(509,'2014-08-18 23:19:47',5,37,'19','Jeto Laface (jeto)',2,'Modificat name.'),(510,'2014-08-18 23:20:46',3,100,'8','alta Soci Afí Individual: Jeto Laface (jeto)',2,'Cap camp modificat.'),(511,'2014-08-18 23:23:16',5,37,'19','Jeto Laface (jeto)',2,'Cap camp modificat.'),(512,'2014-08-18 23:24:14',3,100,'8','alta Soci Afí Individual: Jeto Laface (jeto)',2,'Modificat join_date.'),(513,'2014-08-18 23:24:29',3,100,'7','alta Soci Afí Individual: Marta (tuccia)',2,'Modificat join_date.'),(514,'2014-08-18 23:29:08',3,83,'9','quota Trimestral: Sebas (bumbum) [6 h] > CIC',1,''),(515,'2014-08-18 23:29:23',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',1,''),(516,'2014-08-18 23:30:53',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(517,'2014-08-18 23:31:10',3,101,'3','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(518,'2014-08-18 23:33:36',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(519,'2014-08-18 23:34:52',3,37,'4','Sebas (bumbum)',2,'Modificat id_card.'),(520,'2014-08-18 23:35:29',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(521,'2014-08-18 23:36:25',3,37,'4','Sebas (bumbum)',2,'Cap camp modificat.'),(522,'2014-08-18 23:41:36',3,102,'5','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',2,'Modificat join_date.'),(523,'2014-08-18 23:42:45',3,83,'11','quota Trimestral: Ecoxarxanoia (EA) [60 riu] > CIC',1,''),(524,'2014-08-18 23:42:56',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',1,''),(525,'2014-08-18 23:43:45',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_per \"referenciant > Marta (tuccia)\"'),(526,'2014-08-18 23:58:48',3,37,'18','Marta (tuccia)',2,'Modificat id_card.'),(527,'2014-08-19 00:11:03',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_per \"referenciant > Sebas (bumbum)\"'),(528,'2014-08-19 00:39:46',3,86,'27','Lloguer',1,''),(529,'2014-08-19 00:40:17',3,88,'13','XIPU: ?? > AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(530,'2014-08-19 00:46:43',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(531,'2014-08-19 00:49:30',3,88,'13','XIPU: Ecoxarxanoia (EA) > AureaSocial (Sardenya 261-263 - Barcelona)',3,''),(532,'2014-08-19 00:50:36',3,86,'28','Cessió',1,''),(533,'2014-08-19 00:50:57',3,88,'14','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(534,'2014-08-19 00:51:08',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(535,'2014-08-19 01:08:58',3,88,'14','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(536,'2014-08-19 01:10:50',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(537,'2014-08-19 01:49:07',3,55,'9','col·laborar',2,'Modificat parent.'),(538,'2014-08-19 01:49:30',3,55,'10','contribuir (contribute)',2,'Modificat parent.'),(539,'2014-08-19 01:49:51',3,55,'7','participar',2,'Modificat parent.'),(540,'2014-08-19 01:50:28',3,38,'17','Ecoxarxanoia (EA)',2,'Afegit H_per \"dinamitzant > Jeto Laface (jeto)\"'),(541,'2014-08-19 01:50:47',3,38,'17','Ecoxarxanoia (EA)',2,'Modificat relation per a H_per \"participant > Jeto Laface (jeto)\".'),(542,'2014-08-19 01:55:15',3,37,'18','Marta (tuccia)',2,'Modificat id_card i email.'),(543,'2014-08-19 01:56:14',3,37,'4','Sebas (bumbum)',2,'Modificat id_card i birth_date.'),(544,'2014-08-19 16:05:23',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Afegit Contracte d\'Adreça CI \"XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(545,'2014-08-19 16:36:20',3,88,'12','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(546,'2014-08-19 16:36:37',3,88,'12','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat name.'),(549,'2014-08-19 16:38:42',3,88,'14','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',3,''),(550,'2014-08-19 19:13:40',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(551,'2014-08-19 19:15:04',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat name.'),(552,'2014-08-19 19:25:11',3,88,'15','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(553,'2014-08-19 19:25:22',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(554,'2014-08-19 19:26:50',3,88,'15','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',3,''),(555,'2014-08-19 19:38:29',3,88,'16','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(556,'2014-08-19 19:38:52',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(557,'2014-08-19 19:42:35',3,88,'16','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',3,''),(558,'2014-08-19 19:45:55',3,88,'17','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(559,'2014-08-19 19:47:25',3,88,'17','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',3,''),(560,'2014-08-19 19:55:37',3,88,'18','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',1,''),(561,'2014-08-19 19:56:24',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(562,'2014-08-19 20:04:28',3,88,'18','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(563,'2014-08-19 20:10:54',3,88,'18','XIPU: Ecoxarxanoia (EA) > Casa del Comú (pl. del Pilar - Igualada)',2,'Cap camp modificat.'),(564,'2014-08-19 21:04:03',3,88,'19','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',1,''),(565,'2014-08-19 21:04:09',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Modificat rel_address_contracts.'),(566,'2014-08-19 21:04:22',3,88,'19','XIPU: Ecoxarxanoia (EA) > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(567,'2014-08-19 22:05:10',3,88,'18','Ecoxarxanoia: Casa del Comú',2,'Cap camp modificat.'),(568,'2014-08-19 22:07:33',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(569,'2014-08-19 23:56:05',3,98,'19','quota Trimestral (quarterly_fee)',2,'Modificat clas.'),(570,'2014-08-19 23:57:06',3,98,'18','quota d\'Alta (join_fee)',2,'Modificat clas.'),(571,'2014-08-19 23:57:30',3,98,'27','contracte de Lloguer',2,'Modificat name.'),(572,'2014-08-19 23:57:39',3,98,'28','contracte de Cessió',2,'Modificat name.'),(573,'2014-08-20 00:39:29',3,88,'19','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',3,''),(574,'2014-08-20 00:39:34',3,88,'18','XIPU: ?? > Casa del Comú (pl. del Pilar - Igualada)',3,''),(577,'2014-08-20 00:44:10',3,79,'12','alta Projecte Autoocupat: Ecoxarxanoia (EA)',3,''),(578,'2014-08-20 00:44:10',3,79,'10','alta Projecte Autoocupat: Sebas (bumbum)',3,''),(579,'2014-08-20 00:45:08',3,83,'11','quota Trimestral: Ecoxarxanoia (EA) [60.00 riu] > CIC',3,''),(580,'2014-08-20 00:45:08',3,83,'9','quota Trimestral: Sebas (bumbum) [6.00 h] > CIC',3,''),(581,'2014-08-20 00:52:22',3,79,'20','alta Projecte Autoocupat: Ecoxarxanoia (EA)',1,''),(582,'2014-08-20 00:52:50',3,79,'20','alta Projecte Autoocupat: Ecoxarxanoia (EA)',2,'Cap camp modificat.'),(584,'2014-08-20 01:03:29',3,83,'1','quota d\'Alta: Ecoxarxanoia (EA) [30 riu] > CIC',1,''),(585,'2014-08-20 01:03:45',3,102,'2','alta Projecte Col·lectiu: Ecoxarxanoia (EA)',1,''),(586,'2014-08-20 01:04:34',3,83,'3','quota d\'Alta: Sebas (bumbum) [6 h] > CIC',1,''),(587,'2014-08-20 01:04:56',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',1,''),(588,'2014-08-20 01:06:19',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',1,''),(589,'2014-08-20 01:08:37',3,79,'6','alta Projecte Autoocupat: Sebas (bumbum)',1,''),(590,'2014-08-20 01:08:59',3,83,'3','quota d\'Alta: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat payment_date.'),(591,'2014-08-20 01:16:17',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(592,'2014-08-20 01:20:51',3,79,'6','alta Projecte Autoocupat: Sebas (bumbum)',2,'Afegit Contracte d\'Adreça CI \"XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(593,'2014-08-20 01:21:36',3,88,'6','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(594,'2014-08-20 01:24:08',3,88,'6','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(596,'2014-08-20 01:31:45',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',1,''),(597,'2014-08-20 01:32:19',3,83,'8','quota Trimestral: Sebas (bumbum) [30 eco] > CIC',1,''),(598,'2014-08-20 01:32:30',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_fees.'),(599,'2014-08-20 01:33:30',3,88,'9','XIPU: ?? > pis de mallorca (Mallorca, 450 - Barcelona)',1,''),(600,'2014-08-20 01:33:35',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(601,'2014-08-20 01:44:40',3,88,'9','Sebas: pis de mallorca',2,'Cap camp modificat.'),(602,'2014-08-20 02:05:33',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Cap camp modificat.'),(603,'2014-08-20 02:07:51',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Modificat name.'),(604,'2014-08-20 02:07:56',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Cap camp modificat.'),(605,'2014-08-20 02:09:34',3,88,'9','Sebas (bumbum): pis de mallorca',2,'Cap camp modificat.'),(606,'2014-08-20 02:11:49',3,88,'11','XIPU: ?? > AureaSocial',1,''),(607,'2014-08-20 02:11:56',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(608,'2014-08-20 02:13:29',3,88,'11','Sebas (bumbum): AureaSocial',2,'Cap camp modificat.'),(609,'2014-08-20 02:14:05',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(610,'2014-08-20 02:18:41',3,88,'11','Sebas (bumbum): AureaSocial',2,'Cap camp modificat.'),(611,'2014-08-20 02:19:33',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(612,'2014-08-20 02:19:58',3,88,'11','Sebas (bumbum): AureaSocial',3,''),(613,'2014-08-20 02:31:12',3,88,'12','XIPU: ?? > Casa del Comú',1,''),(614,'2014-08-20 02:31:18',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_address_contracts.'),(615,'2014-08-20 02:53:17',3,83,'8','quota Trimestral: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(616,'2014-08-20 02:53:25',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(617,'2014-08-20 02:53:38',3,83,'8','quota Trimestral: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat payment_date.'),(618,'2014-08-20 02:53:49',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(619,'2014-08-20 02:55:50',3,98,'29','quota 1T',1,''),(620,'2014-08-20 02:56:02',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat record_type.'),(621,'2014-08-20 02:56:56',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(622,'2014-08-20 02:57:05',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(623,'2014-08-20 03:02:47',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Cap camp modificat.'),(624,'2014-08-20 03:06:54',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(625,'2014-08-20 03:07:33',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(626,'2014-08-20 03:12:03',3,98,'30','quota 2T',1,''),(627,'2014-08-20 03:12:34',3,83,'13','quota 2T: Sebas (bumbum) [30 eco] > CIC',1,''),(628,'2014-08-20 03:12:41',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_fees.'),(629,'2014-08-20 03:16:45',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(630,'2014-08-20 04:21:41',3,83,'8','quota 1T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat payment_type.'),(631,'2014-08-20 04:21:59',3,83,'13','quota 2T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat deadline_date i payment_date.'),(632,'2014-08-20 04:22:06',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(633,'2014-08-20 14:19:28',3,83,'13','quota 2T: Sebas (bumbum) [30.00 eco] > CIC',2,'Modificat payment_date.'),(634,'2014-08-20 14:19:36',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(635,'2014-08-20 14:20:00',3,98,'31','quota 3T',1,''),(636,'2014-08-20 14:20:19',3,83,'14','quota 3T: Sebas (bumbum) [6 h] > CIC',1,''),(637,'2014-08-20 14:20:28',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Modificat rel_fees.'),(638,'2014-08-20 14:20:38',3,83,'14','quota 3T: Sebas (bumbum) [6.00 h] > CIC',2,'Modificat payment_date.'),(639,'2014-08-20 14:20:42',3,79,'7','alta Projecte Autoocupat: Sebas (bumbum)',2,'Cap camp modificat.'),(640,'2014-08-20 15:33:43',3,56,'3','Desenvolupament',1,''),(641,'2014-08-20 15:34:54',3,37,'4','Sebas (bumbum)',2,'Afegit H_ofi \"practicant > Desenvolupament\" Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(642,'2014-08-20 15:38:49',5,37,'19','Jeto Laface (jeto)',2,'Afegit H_ofi \"aprenent > Desenvolupament\"'),(643,'2014-08-20 15:41:53',3,88,'12','bumbum (Sebas): Casa del Comú',2,'Cap camp modificat.'),(644,'2014-08-20 15:42:18',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Cap camp modificat.'),(645,'2014-08-20 15:50:36',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Modificat price i price_unit.'),(646,'2014-08-20 16:06:10',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(647,'2014-08-20 16:06:44',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Modificat ic_CESnum.'),(648,'2014-08-20 16:07:03',3,101,'4','alta Soci Cooperatiu Individual: Sebas (bumbum)',2,'Cap camp modificat.'),(649,'2014-08-20 16:07:14',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(650,'2014-08-20 16:08:39',3,101,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(651,'2014-08-20 16:12:29',3,83,'13','quota 2T: bumbum (Sebas) [30.00 eco] > CIC',2,'Cap camp modificat.'),(652,'2014-08-20 16:12:36',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(653,'2014-08-20 16:12:48',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat payment_date.'),(654,'2014-08-20 16:13:04',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(655,'2014-08-20 16:25:57',3,98,'7','alta Soci Coop. Individual (iC_Person_Membership)',2,'Modificat name.'),(656,'2014-08-20 16:26:15',3,98,'8','alta Proj. Col·lectiu (iC_Project_Membership)',2,'Modificat name.'),(657,'2014-08-20 16:26:46',3,98,'9','alta Proj. Públic',2,'Modificat name.'),(658,'2014-08-20 16:36:50',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco] > CIC',2,'Cap camp modificat.'),(659,'2014-08-20 16:36:59',3,79,'7','alta Projecte Autoocupat: bumbum (Sebas)',2,'Cap camp modificat.'),(660,'2014-08-20 16:55:03',3,98,'5','alta Proj. Autoocupat (iC_Self_Employed)',2,'Modificat name.'),(661,'2014-08-20 16:55:22',3,98,'11','alta Proj. Firaire (iC_Stallholder)',2,'Modificat name.'),(662,'2014-08-20 17:10:09',3,55,'22',':Relació Persona - Empresa (rel_pers_comp)',2,'Modificat clas.'),(663,'2014-08-20 17:11:28',3,55,'31','comprar',1,''),(664,'2014-08-20 17:12:21',3,55,'31','comprar a l\'empresa',2,'Modificat name, verb i gerund.'),(665,'2014-08-20 17:12:43',3,55,'22',':Relació Persona - Empresa (rel_pers_comp)',2,'Cap camp modificat.'),(666,'2014-08-20 17:13:44',3,55,'32','treballar per l\'empresa',1,''),(667,'2014-08-20 17:18:35',3,55,'3',':Relació Humà - Espai (rel_hum_spac)',2,'Modificat clas.'),(668,'2014-08-20 17:20:08',3,55,'33',':Relació Humà - Regió (rel_hum_regi)',1,''),(669,'2014-08-20 17:23:54',3,55,'34','fer vida a',1,''),(670,'2014-08-20 17:24:26',3,55,'24',':Relació Persona - Adreça (rel_pers_addr)',2,'Modificat clas.'),(671,'2014-08-20 17:56:48',3,64,'49','Formació',1,''),(672,'2014-08-20 17:58:23',3,64,'50','obra Cultural',1,''),(673,'2014-08-20 17:59:02',3,64,'51','obra Digital',1,''),(674,'2014-08-20 17:59:12',3,64,'49','Formació',2,'Modificat parent.'),(675,'2014-08-20 18:23:09',3,64,'52','formació CI (ic_learn)',1,''),(676,'2014-08-20 18:25:46',3,39,'23','Públic (public)',2,'Modificat clas.'),(677,'2014-08-20 19:03:09',3,64,'53','formació Acollida Autoocupats',1,''),(678,'2014-08-20 19:03:40',3,64,'54','formació Moneda Social',1,''),(679,'2014-08-20 19:30:51',3,67,'55','Màquina',1,''),(680,'2014-08-20 19:31:05',3,67,'56','Vehicle',1,''),(681,'2014-08-20 19:31:49',3,67,'57','Cotxe',1,''),(682,'2014-08-20 20:20:30',3,60,'5','continent europeu',1,''),(683,'2014-08-20 20:20:42',3,60,'1','Països Catalans',2,'Modificat parent.'),(684,'2014-08-20 21:18:06',3,64,'53','sessió de formació col·lectiva',2,'Modificat name.'),(685,'2014-08-20 21:18:47',3,64,'54','sessió de formació Individual',2,'Modificat name.'),(686,'2014-08-20 21:18:55',3,64,'53','sessió de formació Col·lectiva',2,'Modificat name.'),(687,'2014-08-20 21:19:47',3,63,'1','sessió d\'Acollida',1,''),(688,'2014-08-20 21:20:11',3,63,'2','sessió de Moneda Social',1,''),(689,'2014-08-20 21:41:59',3,37,'4','Sebas (bumbum)',2,'Afegit Actiu \"(Cotxe) peugeot 306\"'),(690,'2014-08-20 21:51:00',3,55,'35',':Relació Humà - ObraMaterial (rel_hum_mate)',1,''),(691,'2014-08-20 21:52:46',3,55,'36','titular',1,''),(692,'2014-08-20 21:55:19',3,55,'36','titular el registre',2,'Modificat name, verb i gerund.'),(693,'2014-08-20 21:57:24',3,55,'37','pertànyer',1,''),(694,'2014-08-20 22:07:41',3,37,'4','Sebas (bumbum)',2,'Afegit H_mat \"peugeot 306\" Afegit H_rec \"Compte CES: titulant el registre > Compte CES: (eco) Cooperativa Integral Catalana (CIC) COOP0111\"'),(695,'2014-08-20 22:08:33',3,37,'4','Sebas (bumbum)',2,'Modificat relation per a H_mat \"pertanyent > peugeot 306\".'),(696,'2014-08-20 22:20:32',3,55,'38',':Relació Humà - obra Inmaterial (rel_hum_nonm)',1,''),(697,'2014-08-20 22:20:43',3,55,'35',':Relació Humà - obra Material (rel_hum_mate)',2,'Modificat name.'),(698,'2014-08-20 22:24:32',3,55,'39','representar',1,''),(699,'2014-08-20 22:28:34',3,55,'40','oferir l\'obra inmaterial',1,''),(700,'2014-08-20 22:28:59',3,37,'4','Sebas (bumbum)',2,'Afegit H_inm \"oferint l\'obra inmaterial > sessió d\'Acollida\"'),(701,'2014-08-20 22:30:55',3,98,'32','Sessió / Formació (Learn_Session)',1,''),(702,'2014-08-20 22:32:32',3,81,'15','sessió d\'Acollida: 2014-08-21 00:31:36+00:00 (Sebas) AureaSocial',1,''),(703,'2014-08-20 22:37:06',3,81,'15','sessió d\'Acollida: <built-in method date of datetime.datetime object at 0x7f9f70d81a50> (Sebas) AureaSocial',2,'Cap camp modificat.'),(704,'2014-08-20 22:37:27',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(705,'2014-08-20 22:57:50',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(706,'2014-08-20 23:49:06',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(707,'2014-08-20 23:50:10',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(708,'2014-08-20 23:54:45',3,98,'33','reg Sessió d\'Acollida (welcome_session)',1,''),(709,'2014-08-20 23:55:17',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat record_type.'),(710,'2014-08-21 00:35:08',3,81,'15','sessió d\'Acollida: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(711,'2014-08-21 00:39:16',4,37,'18','Marta (tuccia)',2,'Afegit H_pro \"(Ecoxarxa) seguint > Ecoxarxanoia\"'),(712,'2014-08-21 01:19:41',3,55,'41',':Relació ObraMaterial - Adreça (rel_mat_addr)',1,''),(713,'2014-08-21 01:23:16',3,55,'42','aparcar',1,''),(714,'2014-08-21 01:23:31',3,68,'1','(Cotxe) peugeot 306',2,'Afegit M_adr \"(Espai Polivalent Col·lectiu) aparcant > AureaSocial (Sardenya 261-263 - Barcelona)\"'),(715,'2014-08-21 01:30:27',3,55,'43',':Relació ObraMaterial - Registre (rel_mat_reco)',1,''),(716,'2014-08-21 01:31:33',3,55,'44',':Relació Obra - Espai',1,''),(717,'2014-08-21 01:32:04',3,55,'45',':Relació Obra - Obra',1,''),(718,'2014-08-21 01:33:53',3,55,'44',':Relació ObraMaterial - Espai (rel_mat_spac)',2,'Modificat name i clas.'),(719,'2014-08-21 01:34:27',3,55,'41',':Relació ObraMaterial - Adreça (rel_mat_addr)',2,'Modificat parent.'),(720,'2014-08-21 01:35:35',3,55,'45',':Relació ObraMaterial - ObraMaterial (rel_mat_mate)',2,'Modificat name i clas.'),(721,'2014-08-21 01:36:12',3,55,'43',':Relació obra Material - Registre (rel_mat_reco)',2,'Modificat name.'),(722,'2014-08-21 01:36:15',3,55,'43',':Relació obra Material - Registre (rel_mat_reco)',2,'Cap camp modificat.'),(723,'2014-08-21 01:36:46',3,55,'44',':Relació obra Material - Espai (rel_mat_spac)',2,'Modificat name.'),(724,'2014-08-21 01:37:48',3,55,'46',':Relació Obra - Espai (rel_awo_spac)',1,''),(725,'2014-08-21 01:38:18',3,55,'41',':Relació obra Material - Adreça (rel_mat_addr)',2,'Modificat name.'),(726,'2014-08-21 01:38:43',3,55,'44',':Relació obra Material - Espai (rel_mat_spac)',2,'Modificat parent.'),(727,'2014-08-21 01:39:19',3,55,'41',':Relació obra Material - Adreça (rel_mat_addr)',2,'Modificat parent.'),(728,'2014-08-21 01:40:44',3,55,'47',':Relació Obra - Obra (rel_awo_arwo)',1,''),(729,'2014-08-21 01:41:01',3,55,'43',':Relació obra Material - Registre (rel_mat_reco)',2,'Modificat parent.'),(730,'2014-08-21 01:41:30',3,55,'45',':Relació obra Material - obra Material (rel_mat_mate)',2,'Modificat name i parent.'),(731,'2014-08-21 01:45:14',3,55,'42','aparcar a',2,'Modificat name, verb i gerund.'),(732,'2014-08-21 01:47:03',3,55,'44',':Relació obra Material - obra Inmaterial (rel_mat_nonm)',2,'Modificat name, parent i clas.'),(733,'2014-08-21 01:53:41',3,55,'46',':Relació Obra - Espai',2,'Modificat clas.'),(734,'2014-08-21 01:53:49',3,55,'47',':Relació Obra - Obra',2,'Modificat clas.'),(735,'2014-08-21 01:54:14',3,55,'48',':Relació Obra - Art',1,''),(736,'2014-08-21 01:54:40',3,55,'19',':relació Projecte - Persona (rel_proj_pers)',2,'Modificat name.'),(737,'2014-08-21 01:54:55',3,55,'18',':relació Projecte - Empresa (rel_proj_empr)',2,'Modificat name.'),(738,'2014-08-21 01:55:02',3,55,'21',':relació Projecte - Projecte (rel_proj_proj)',2,'Modificat name.'),(739,'2014-08-21 01:55:07',3,55,'5',':relació Persona - Projecte (rel_pers_proj)',2,'Modificat name.'),(740,'2014-08-21 01:55:13',3,55,'22',':relació Persona - Empresa (rel_pers_comp)',2,'Modificat name.'),(741,'2014-08-21 01:55:18',3,55,'6',':relació Persona - Persona (rel_pers_pers)',2,'Modificat name.'),(742,'2014-08-21 01:55:32',3,55,'15',':relació Projecte - Adreça (rel_proj_addr)',2,'Modificat name.'),(743,'2014-08-21 01:55:37',3,55,'24',':relació Persona - Adreça (rel_pers_addr)',2,'Modificat name.'),(744,'2014-08-21 01:55:42',3,55,'33',':relació Humà - Regió (rel_hum_regi)',2,'Modificat name.'),(745,'2014-08-21 01:55:54',3,55,'30',':relació Humà - Registre (rel_hum_reco)',2,'Modificat name.'),(746,'2014-08-21 01:55:59',3,55,'35',':relació Humà - obra Material (rel_hum_mate)',2,'Modificat name.'),(747,'2014-08-21 01:56:03',3,55,'38',':relació Humà - obra Inmaterial (rel_hum_nonm)',2,'Modificat name.'),(748,'2014-08-21 01:56:10',3,55,'41',':relació obra Material - Adreça (rel_mat_addr)',2,'Modificat name.'),(749,'2014-08-21 01:56:16',3,55,'43',':relació obra Material - Registre (rel_mat_reco)',2,'Modificat name.'),(750,'2014-08-21 01:56:20',3,55,'45',':relació obra Material - obra Material (rel_mat_mate)',2,'Modificat name.'),(751,'2014-08-21 01:56:27',3,55,'44',':relació obra Material - obra Inmaterial (rel_mat_nonm)',2,'Modificat name.'),(752,'2014-08-21 01:57:16',3,55,'49',':relació obra Material - Ofici (rel_mat_jobs)',1,''),(753,'2014-08-21 02:05:44',3,68,'1','(Cotxe) peugeot 306',2,'Cap camp modificat.'),(754,'2014-08-21 02:43:11',3,55,'50',':relació obra Inmaterial - Adreça (rel_non_addr)',1,''),(755,'2014-08-21 02:45:18',3,55,'51',':relació obra Inmaterial - Registre (rel_non_reco)',1,''),(756,'2014-08-21 02:47:31',3,55,'52',':relació obra Inmaterial - Ofici (rel_non_jobs)',1,''),(757,'2014-08-21 02:49:15',3,55,'53',':relació obra Inmaterial - obra Inmaterial (rel_non_nonm)',1,''),(758,'2014-08-21 02:55:30',3,55,'10','contribuir/col·laborar (contribute)',2,'Modificat verb, gerund i parent.'),(759,'2014-08-21 02:59:27',3,55,'11','referenciar (reference)',2,'Modificat name.'),(760,'2014-08-21 02:59:47',3,55,'8','dinamitzar',2,'Modificat name.'),(761,'2014-08-21 02:59:59',3,55,'7','participar',2,'Modificat name.'),(762,'2014-08-21 03:00:13',3,55,'20','utilitzar',2,'Modificat name.'),(763,'2014-08-21 03:00:26',3,55,'9','col·laborar',2,'Modificat name.'),(764,'2014-08-21 03:00:48',3,55,'27','seguir',2,'Modificat name.'),(765,'2014-08-21 03:01:26',3,55,'10','contribuir/col·laborar (contribute)',2,'Modificat name.'),(766,'2014-08-21 03:02:02',3,55,'31','comprar a l\'empresa',2,'Modificat name.'),(767,'2014-08-21 03:02:25',3,55,'32','treballar per l\'empresa',2,'Modificat name.'),(768,'2014-08-21 03:02:42',3,55,'28','apendre',2,'Modificat name.'),(769,'2014-08-21 03:02:49',3,55,'29','practicar',2,'Modificat name.'),(770,'2014-08-21 03:03:09',3,55,'17','gestionar l\'espai',2,'Modificat name.'),(771,'2014-08-21 03:03:27',3,55,'16','oferir l\'espai',2,'Modificat name.'),(772,'2014-08-21 03:03:54',3,55,'23','utilitzar l\'espai',2,'Modificat name.'),(773,'2014-08-21 03:04:09',3,55,'25','habitar',2,'Modificat name.'),(774,'2014-08-21 03:04:21',3,55,'26','treballar',2,'Modificat name.'),(775,'2014-08-21 03:04:53',3,55,'26','treballar a',2,'Modificat name, verb i gerund.'),(776,'2014-08-21 03:05:13',3,55,'25','habitar a',2,'Modificat name, verb i gerund.'),(777,'2014-08-21 03:05:40',3,55,'34','fer vida a',2,'Cap camp modificat.'),(778,'2014-08-21 03:05:56',3,55,'36','titular el registre',2,'Modificat name.'),(779,'2014-08-21 03:06:12',3,55,'37','pertànyer',2,'Modificat name.'),(780,'2014-08-21 03:06:25',3,55,'39','representar',2,'Modificat name.'),(781,'2014-08-21 03:06:39',3,55,'40','oferir l\'obra inmaterial',2,'Modificat name.'),(782,'2014-08-21 03:06:54',3,55,'42','aparcar a',2,'Modificat name.'),(783,'2014-08-21 10:01:22',3,73,'3',' (h * 5 = €) (h * 5 = €)',1,''),(784,'2014-08-21 10:02:50',3,73,'3',' (h * 5 = €) (h * 5.000 = eco)',2,'Modificat out_unit.'),(785,'2014-08-21 10:03:00',3,73,'3',' (h * 5.000 = eco) (h * 5.000 = eco)',2,'Modificat name.'),(786,'2014-08-21 10:09:33',3,73,'3','Hora * 5.000 = EcoCoop',2,'Cap camp modificat.'),(787,'2014-08-21 10:09:37',3,73,'3','Hora * 5.000 = EcoCoop',2,'Cap camp modificat.'),(788,'2014-08-21 10:10:28',3,73,'3','Hora * 5.000 = EcoCoop',2,'Modificat name.'),(789,'2014-08-21 10:11:05',3,73,'3','Hora * 5.000 = EcoCoop',2,'Cap camp modificat.'),(790,'2014-08-21 10:13:27',3,70,'58','equivalencia Temps - Moneda',1,''),(791,'2014-08-21 10:13:51',3,73,'3','Hora * 5.000 = EcoCoop',2,'Modificat record_type.'),(792,'2014-08-21 10:14:19',3,70,'16','compte CES (AccountCes)',2,'Modificat name.'),(793,'2014-08-21 10:14:27',3,70,'17','compte Criptomoneda (AccountCrypto)',2,'Modificat name.'),(794,'2014-08-21 10:14:33',3,70,'18','compte Bancari (AccountCrypto)',2,'Modificat name.'),(795,'2014-08-21 10:16:47',3,70,'59','equivalencia Moneda - Moneda',1,''),(796,'2014-08-21 10:20:21',3,70,'60','equivalencia Àrea - Àrea',1,''),(797,'2014-08-21 10:22:41',3,70,'61','equivalencia Temps - Temps',1,''),(798,'2014-08-21 10:25:05',3,73,'3','EcoCoop * 5.000 = Hora',2,'Modificat in_unit, out_unit i name.'),(799,'2014-08-21 10:26:05',3,70,'58','equivalencia Moneda - Temps',2,'Modificat name.'),(800,'2014-08-21 10:27:33',3,73,'4','EcoCoop * 1 = Euro',1,''),(801,'2014-08-21 10:28:01',3,73,'3','EcoCoop * 5 = Hora',2,'Modificat name.'),(802,'2014-08-21 10:40:07',3,98,'34','reg Sessió MonedaSocial (socialcoin_session)',1,''),(803,'2014-08-21 10:42:13',3,98,'35','quota alta Individual ((30_€))',1,''),(804,'2014-08-21 10:43:12',3,98,'36','quota alta Col·lectiva ((60_€))',1,''),(805,'2014-08-21 10:43:49',3,98,'35','quota alta Individual ((30_eco))',2,'Modificat clas.'),(806,'2014-08-21 10:43:56',3,98,'36','quota alta Col·lectiva ((60_eco))',2,'Modificat clas.'),(807,'2014-08-21 10:46:55',3,83,'3','quota alta Individual: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat record_type.'),(808,'2014-08-21 10:47:11',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [30.00 riu] > CIC',2,'Modificat record_type.'),(809,'2014-08-21 11:16:22',3,83,'3','quota alta Individual: bumbum (Sebas) [6.00 h] > CIC',2,'Cap camp modificat.'),(810,'2014-08-21 11:46:46',3,83,'3','quota alta Individual: bumbum (Sebas) [None h] > CIC',2,'Modificat amount.'),(811,'2014-08-21 12:15:25',3,83,'3','quota alta Individual: bumbum (Sebas) [30 h] > CIC',2,'Cap camp modificat.'),(812,'2014-08-21 12:28:21',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat amount.'),(813,'2014-08-21 12:28:47',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit i amount.'),(814,'2014-08-21 12:28:56',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(815,'2014-08-21 12:43:18',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(816,'2014-08-21 12:43:23',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(817,'2014-08-21 12:43:29',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(818,'2014-08-21 12:43:34',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 riu] > CIC',2,'Modificat unit.'),(819,'2014-08-21 12:43:47',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(820,'2014-08-21 12:46:02',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(821,'2014-08-21 12:46:12',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(822,'2014-08-21 12:46:22',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(823,'2014-08-21 12:48:39',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Cap camp modificat.'),(824,'2014-08-21 12:48:47',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(825,'2014-08-21 12:49:26',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Cap camp modificat.'),(826,'2014-08-21 12:49:30',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(827,'2014-08-21 12:49:36',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(828,'2014-08-21 12:50:04',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 riu] > CIC',2,'Modificat unit.'),(829,'2014-08-21 12:52:27',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(830,'2014-08-21 12:56:14',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €] > CIC',2,'Modificat unit.'),(831,'2014-08-21 12:56:23',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Modificat unit.'),(832,'2014-08-21 12:56:29',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(833,'2014-08-21 13:09:19',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(834,'2014-08-21 13:35:14',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Modificat unit.'),(835,'2014-08-21 13:37:08',3,73,'5','EcoCoop * 1 = Riu',1,''),(836,'2014-08-21 13:43:20',3,73,'5','Riu * 1.000 = EcoCoop',2,'Modificat in_unit i out_unit.'),(837,'2014-08-21 13:43:27',3,73,'5','Riu * 1.000 = EcoCoop',2,'Modificat name.'),(838,'2014-08-21 13:48:55',3,73,'5','Riu * 2.000 = EcoCoop',2,'Modificat rate i name.'),(839,'2014-08-21 13:49:02',3,73,'5','Riu * 2.000 = EcoCoop',2,'Cap camp modificat.'),(840,'2014-08-21 13:49:42',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [120.0 riu] > CIC',2,'Cap camp modificat.'),(841,'2014-08-21 13:49:56',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(842,'2014-08-21 13:50:00',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €] > CIC',2,'Modificat unit.'),(843,'2014-08-21 13:50:04',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(844,'2014-08-21 13:50:09',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [120.0 riu] > CIC',2,'Modificat unit.'),(845,'2014-08-21 13:52:13',3,73,'5','Riu * 1 = EcoCoop',2,'Modificat rate i name.'),(846,'2014-08-21 13:54:03',3,73,'5','Riu * 1 = Euro',2,'Modificat out_unit i name.'),(847,'2014-08-21 13:54:07',3,73,'5','Riu * 1.000 = Euro',2,'Cap camp modificat.'),(848,'2014-08-21 14:02:49',3,73,'5','Riu * 2.000 = Euro',2,'Modificat rate i name.'),(849,'2014-08-21 14:07:31',3,73,'4','EcoCoop * 0.8 = Euro',2,'Modificat rate i name.'),(850,'2014-08-21 14:08:23',3,73,'5','Riu * 1 = Euro',2,'Modificat rate i name.'),(851,'2014-08-21 14:08:59',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [75.0 riu] > CIC',2,'Cap camp modificat.'),(852,'2014-08-21 14:09:08',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [75.0 €] > CIC',2,'Modificat unit.'),(853,'2014-08-21 14:09:20',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(854,'2014-08-21 14:09:25',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(855,'2014-08-21 14:09:31',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [75.0 riu] > CIC',2,'Modificat unit.'),(856,'2014-08-21 14:10:01',3,73,'4','EcoCoop * 1 = Euro',2,'Modificat rate i name.'),(857,'2014-08-21 14:10:46',3,73,'5','Riu * 0.9 = Euro',2,'Modificat rate i name.'),(858,'2014-08-21 14:10:59',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [54.0 riu] > CIC',2,'Cap camp modificat.'),(859,'2014-08-21 14:11:06',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €] > CIC',2,'Modificat unit.'),(860,'2014-08-21 14:11:11',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 eco] > CIC',2,'Modificat unit.'),(861,'2014-08-21 14:11:15',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [54.0 riu] > CIC',2,'Modificat unit.'),(862,'2014-08-21 14:11:39',3,73,'5','Riu * 1 = Euro',2,'Modificat rate i name.'),(863,'2014-08-21 14:16:30',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Cap camp modificat.'),(864,'2014-08-21 14:18:37',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 riu] > CIC',2,'Cap camp modificat.'),(865,'2014-08-21 14:18:44',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat unit.'),(866,'2014-08-21 14:19:08',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 €] > CIC',2,'Modificat unit.'),(867,'2014-08-21 14:19:11',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco] > CIC',2,'Modificat unit.'),(868,'2014-08-21 14:19:16',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 riu] > CIC',2,'Modificat unit.'),(869,'2014-08-21 14:19:21',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Modificat unit.'),(870,'2014-08-21 14:19:33',3,83,'3','quota alta Individual: bumbum (Sebas) [6.0 h] > CIC',2,'Cap camp modificat.'),(871,'2014-08-21 14:48:17',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [12.0 h] > CIC',2,'Modificat name.'),(872,'2014-08-21 15:16:54',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',2,'Modificat ic_membership.'),(873,'2014-08-21 15:17:00',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(874,'2014-08-21 15:24:57',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(875,'2014-08-21 15:53:13',3,63,'2','formació Moneda Social',2,'Modificat name.'),(876,'2014-08-21 15:53:33',3,63,'1','formació d\'Acollida Autoocupats',2,'Modificat name.'),(877,'2014-08-21 15:54:09',3,81,'15','formació d\'Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(878,'2014-08-21 15:54:12',3,81,'15','formació d\'Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(879,'2014-08-21 15:56:30',3,63,'1','formació Acollida Autoocupats',2,'Modificat name.'),(880,'2014-08-21 15:56:41',3,81,'15','formació Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(881,'2014-08-21 15:57:17',3,63,'1','Acollida Autoocupats',2,'Modificat name.'),(882,'2014-08-21 15:57:52',3,81,'15','Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(883,'2014-08-21 15:57:55',3,81,'15','Acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(884,'2014-08-21 15:58:53',3,63,'1','acollida Autoocupats',2,'Modificat name.'),(885,'2014-08-21 15:59:09',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(886,'2014-08-21 15:59:13',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(887,'2014-08-21 16:01:04',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(888,'2014-08-21 16:02:21',4,37,'18','Marta (tuccia)',2,'Cap camp modificat.'),(889,'2014-08-21 16:04:44',3,4,'4','tuccia',2,'Modificat groups.'),(890,'2014-08-21 16:30:12',3,4,'6','creant',3,''),(891,'2014-08-21 16:43:18',3,4,'7','creant',3,''),(892,'2014-08-21 16:51:37',3,38,'23','C.R.E.A.N.T.',3,''),(893,'2014-08-21 16:51:49',3,38,'21','C.R.E.A.N.T.',3,''),(894,'2014-08-21 16:57:43',3,4,'8','creant',3,''),(895,'2014-08-21 16:58:10',3,38,'25','C.R.E.A.N.T.',3,''),(896,'2014-08-21 17:16:41',3,38,'27','C.R.E.A.N.T.',3,''),(897,'2014-08-21 17:18:16',3,37,'26',' Fresh (seb)',3,''),(898,'2014-08-21 17:18:16',3,37,'24',' Fresh (seb)',3,''),(899,'2014-08-21 17:18:16',3,37,'22',' Fresh (seb)',3,''),(900,'2014-08-21 17:18:16',3,37,'20',' Fresh (seb)',3,''),(901,'2014-08-21 17:18:43',3,4,'9','creant',3,''),(902,'2014-08-21 17:23:04',3,37,'28','Sebb Fresh (seb)',2,'Modificat name.'),(903,'2014-08-21 17:26:09',3,3,'4','iC_Project_Membership',2,'Modificat permissions.'),(905,'2014-08-21 17:34:56',3,37,'28','Sebb Fresh (seb)',3,''),(906,'2014-08-21 17:35:10',3,38,'29','C.R.E.A.N.T.',3,''),(907,'2014-08-21 17:35:27',3,4,'10','creant',3,''),(908,'2014-08-21 18:58:31',3,37,'30','Sebb Fresh (seb)',2,'Modificat name.'),(909,'2014-08-21 18:58:38',3,37,'30','Sebb Fresh (seb)',3,''),(910,'2014-08-21 18:59:14',3,38,'31','ColectiuRural',3,''),(911,'2014-08-21 18:59:52',3,4,'11','seb',3,''),(912,'2014-08-21 19:07:48',3,37,'32',' Fresh (seb)',3,''),(913,'2014-08-21 19:08:03',3,38,'33','c.r.e.a.n.t.',3,''),(914,'2014-08-21 19:08:14',3,4,'12','seb',3,''),(915,'2014-08-21 19:37:12',3,37,'34',' Fresh (seb)',3,''),(916,'2014-08-21 19:37:32',3,38,'35','c.r.e.a.n.t.',3,''),(917,'2014-08-21 19:37:41',3,4,'13','seb',3,''),(918,'2014-08-21 19:45:22',3,98,'35','quota alta Individual ((30_eco) individual)',2,'Modificat clas.'),(919,'2014-08-21 19:46:33',3,98,'36','quota alta Col·lectiva ((60_eco) collective)',2,'Modificat clas.'),(920,'2014-08-21 19:50:06',3,37,'36',' Fresh (seb)',3,''),(921,'2014-08-21 19:50:17',3,38,'37','c.r.e.a.n.t.',3,''),(922,'2014-08-21 19:50:31',3,4,'14','seb',3,''),(923,'2014-08-21 20:11:48',3,37,'38',' Fresh (seb)',3,''),(924,'2014-08-21 20:12:02',3,38,'39','c.r.e.a.n.t.',3,''),(925,'2014-08-21 20:12:14',3,4,'15','seb',3,''),(926,'2014-08-22 00:17:51',3,4,'16','seb',3,''),(927,'2014-08-22 00:18:15',3,37,'40','anonymous Fresh (seb)',3,''),(928,'2014-08-22 00:20:56',3,37,'41','anonymous Fresh (seb)',3,''),(929,'2014-08-22 00:21:11',3,4,'17','seb',3,''),(930,'2014-08-22 00:25:35',18,83,'18','quota alta Individual: seb (anonymous) [6.0 h] > CIC',2,'Modificat unit.'),(931,'2014-08-22 00:51:12',18,83,'18','quota alta Individual: seb (anonymous) [30.0 riu] > CIC',2,'Modificat unit.'),(932,'2014-08-22 00:52:38',18,37,'42','Sebb Fresh (seb)',2,'Modificat name.'),(933,'2014-08-22 01:13:16',3,37,'43','anonymous Cia (tuc)',3,''),(934,'2014-08-22 01:13:31',3,38,'44','c.r.e.a.n.t.',3,''),(935,'2014-08-22 01:13:43',3,4,'19','tuc',3,''),(936,'2014-08-22 01:17:26',3,83,'21','quota alta Col·lectiva: tuc (anonymous) [60.0 €] > CIC',2,'Cap camp modificat.'),(938,'2014-08-22 01:31:59',3,83,'21','quota alta Col·lectiva: tuc (Tuc) [60.00 €] > CIC',3,''),(939,'2014-08-22 01:32:12',3,37,'45','Tuc Cia (tuc)',3,''),(940,'2014-08-22 01:32:31',3,38,'46','c.r.e.a.n.t.',3,''),(941,'2014-08-22 01:32:41',3,4,'20','tuc',3,''),(942,'2014-08-22 01:33:58',3,4,'21','tuc',3,''),(943,'2014-08-22 01:34:28',3,38,'48','c.r.e.a.n.t.',3,''),(944,'2014-08-22 01:34:50',3,37,'47','anonymous Cia (tuc)',3,''),(945,'2014-08-22 01:42:08',3,83,'24','quota alta Col·lectiva: c.r.e.a.n.t. [60.00 €] > CIC',3,''),(946,'2014-08-22 01:42:42',3,38,'50','c.r.e.a.n.t.',3,''),(947,'2014-08-22 01:42:55',3,37,'49','anonymous Cia (tuc)',3,''),(948,'2014-08-22 01:43:13',3,4,'22','tuc',3,''),(955,'2014-08-22 03:10:49',3,83,'25','quota alta Col·lectiva: c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació) [12.0 h] > CIC',2,'Cap camp modificat.'),(956,'2014-08-22 03:12:18',3,102,'26','alta Proj. Col·lectiu: c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació)',2,'Cap camp modificat.'),(957,'2014-08-22 03:13:49',3,83,'25','quota alta Col·lectiva: c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació) [12.0 h] > CIC',2,'Cap camp modificat.'),(958,'2014-08-22 03:30:27',3,38,'52','c.r.e.a.n.t. (Col·lectiu Rural i Ecològic d\'Arts i Natura per la Transformació)',3,''),(959,'2014-08-22 03:30:41',3,37,'51','Tuc Cia (tuc)',3,''),(960,'2014-08-22 03:31:32',3,4,'23','tuc',3,''),(961,'2014-08-22 03:32:05',3,101,'19','alta Soci Coop. Individual: seb (Sebb)',2,'Modificat contribution.'),(962,'2014-08-22 13:06:28',3,37,'4','Sebas (bumbum)',2,'Eliminat H_rec \"compte CES: titulant el registre > compte CES: (eco) Cooperativa Integral Catalana (CIC) COOP0111\".'),(963,'2014-08-22 13:06:53',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(964,'2014-08-22 13:08:14',3,74,'1','(eco) CIC (Cooperativa Integral Catalana) COOP0001',2,'Cap camp modificat.'),(965,'2014-08-22 13:13:59',3,74,'1','(eco) CIC (Cooperativa Integral Catalana) COOP0001',2,'Cap camp modificat.'),(966,'2014-08-22 13:19:50',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(967,'2014-08-22 13:22:25',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(968,'2014-08-22 13:25:15',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(969,'2014-08-22 13:25:49',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(970,'2014-08-22 13:27:07',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(971,'2014-08-22 13:28:47',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(972,'2014-08-22 13:38:13',3,55,'36','titular el registre (holder)',2,'Modificat clas.'),(973,'2014-08-22 13:38:33',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(974,'2014-08-22 13:39:39',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(975,'2014-08-22 13:52:10',3,37,'4','Sebas (bumbum)',2,'Afegit H_rec \"equivalencia Moneda - Moneda: Riu * 1 = Euro\"'),(976,'2014-08-22 14:15:41',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(977,'2014-08-22 14:18:18',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(978,'2014-08-22 14:19:52',3,37,'4','Sebas (bumbum)',2,'Modificat relation per a H_rec \"equivalencia Moneda - Moneda: titulant el registre > equivalencia Moneda - Moneda: Riu * 1 = Euro\".'),(979,'2014-08-22 14:20:10',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(980,'2014-08-22 14:31:15',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(981,'2014-08-22 14:31:41',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(982,'2014-08-22 14:38:36',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(983,'2014-08-22 14:41:48',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(984,'2014-08-22 14:43:12',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(985,'2014-08-22 14:43:28',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(986,'2014-08-22 14:48:04',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(987,'2014-08-22 14:51:12',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(988,'2014-08-22 15:03:56',3,37,'4','Sebas (bumbum)',2,'Eliminat Compte CES \"(eco) Sebas (bumbum) COOP0111\".'),(989,'2014-08-22 15:20:43',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(990,'2014-08-22 15:26:44',3,37,'4','Sebas (bumbum)',2,'Eliminat H_rec \"compte CES: titulant el registre > compte CES: (eco) Sebas (bumbum) COOP0111\".'),(991,'2014-08-22 17:28:13',3,37,'4','Sebas (bumbum)',2,'Afegit Compte CES \"(eco) Sebas (bumbum) COOP0111\"'),(992,'2014-08-22 17:29:04',3,74,'39','(eco) bumbum (Sebas) COOP0111',3,''),(993,'2014-08-22 17:33:07',3,61,'62','Planeta',1,''),(994,'2014-08-22 17:33:18',3,60,'6','planeta Terra',1,''),(995,'2014-08-22 17:33:43',3,71,'7','Criptomoneda: FairCoin',1,''),(996,'2014-08-22 17:48:20',3,70,'18','compte Bancari (AccountBank)',2,'Modificat clas.'),(997,'2014-08-22 17:48:28',3,37,'4','Sebas (bumbum)',2,'Afegit Compte Criptomoneda \"(FAC) Sebas (bumbum) fPZ9NaANowe8PyWAJ3sLZY3cFzGbUyZca4\"'),(998,'2014-08-22 17:58:53',3,37,'4','Sebas (bumbum)',2,'Eliminat H_rec \"equivalencia Moneda - Moneda: titulant el registre > equivalencia Moneda - Moneda: Riu * 1 = Euro\".'),(999,'2014-08-22 18:39:46',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1000,'2014-08-22 19:00:29',3,83,'13','quota 2T: bumbum (Sebas) [30.00 eco] > CIC',2,'Modificat payment_date.'),(1001,'2014-08-22 19:01:01',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat payment_date.'),(1002,'2014-08-22 19:09:50',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h] > CIC',2,'Modificat payment_date.'),(1003,'2014-08-22 19:09:59',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco] > CIC',2,'Modificat payment_date.'),(1004,'2014-08-22 19:10:02',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1005,'2014-08-22 19:16:07',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1006,'2014-08-22 19:35:12',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',2,'Modificat jobs.'),(1007,'2014-08-22 20:46:44',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1008,'2014-08-22 21:22:41',3,40,'53','triodos (Triodos Bank)',1,''),(1009,'2014-08-22 21:22:59',3,75,'43','(€) XIPU (Xarxa Integral de Professionals i Usuaries)  - triodos (Triodos Bank)',1,''),(1010,'2014-08-22 21:25:30',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_accountBank i mentor_membership.'),(1011,'2014-08-22 23:30:38',3,38,'17','EA (Ecoxarxanoia)',2,'Modificat main_address per a H_adr \"gestionant l\'espai > Casa del Comú (pl. del Pilar - Igualada)\". Modificat main_address per a H_adr \"utilitzant l\'espai > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(1012,'2014-08-23 00:02:42',3,37,'42','Sebb Fresh (seb)',2,'Afegit H_pro \"(Xarxa Mundial) seguint > Revolució Integral\"'),(1013,'2014-08-23 00:19:30',3,37,'42','seb',2,'Cap camp modificat.'),(1014,'2014-08-23 01:00:29',3,37,'4','Sebas (bumbum)',2,'Afegit H_adr \"treballant a > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(1015,'2014-08-23 01:02:25',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat jobs.'),(1016,'2014-08-23 01:08:39',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(1017,'2014-08-23 01:23:16',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat jobs.'),(1018,'2014-08-23 01:24:11',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(1019,'2014-08-23 01:51:03',3,56,'4','Transport',1,''),(1020,'2014-08-23 01:53:44',3,55,'54','servir per',1,''),(1021,'2014-08-23 01:53:52',3,68,'1','(Cotxe) peugeot 306',2,'Afegit M_ofi \"servint per > Transport\"'),(1022,'2014-08-23 01:56:48',3,68,'1','(Cotxe) peugeot 306',2,'Cap camp modificat.'),(1023,'2014-08-23 02:12:51',3,39,'22','Ecoxarxa (ces)',2,'Modificat clas.'),(1024,'2014-08-23 02:13:06',3,39,'24','Cooperativa Integral (ces)',2,'Modificat clas.'),(1025,'2014-08-23 02:17:07',3,37,'4','Sebas (bumbum)',2,'Cap camp modificat.'),(1026,'2014-08-23 02:37:43',3,37,'4','Sebas (bumbum)',2,'Cap camp modificat.'),(1027,'2014-08-23 02:38:15',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco] > CIC',2,'Modificat payment_date.'),(1028,'2014-08-23 02:58:32',3,101,'4','COOP0111 (bumbum)',2,'Modificat expositors.'),(1029,'2014-08-23 03:01:24',3,101,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(1030,'2014-08-23 03:22:29',3,101,'4','COOP0111 (bumbum)',2,'Modificat expositors.'),(1031,'2014-08-23 13:11:13',3,39,'63','Online (online)',1,''),(1032,'2014-08-23 13:12:03',3,39,'27','Cooperatiu Col·lectiu',2,'Modificat parent.'),(1033,'2014-08-23 13:12:14',3,39,'28','Grup de Consum',2,'Modificat parent.'),(1034,'2014-08-23 18:08:08',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco]',2,'Modificat unit i payment_date.'),(1035,'2014-08-23 18:08:18',3,101,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(1036,'2014-08-23 18:11:21',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Cap camp modificat.'),(1037,'2014-08-23 18:11:39',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Cap camp modificat.'),(1038,'2014-08-23 18:13:20',18,37,'42','Sebb Fresh (seb)',2,'Afegit H_pro \"(Ecoxarxa) contribuint puntualment > Ecoxarxanoia\"'),(1039,'2014-08-23 18:15:45',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1040,'2014-08-23 18:49:48',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1041,'2014-08-24 00:14:48',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1042,'2014-08-24 00:17:19',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1043,'2014-08-24 00:17:25',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1044,'2014-08-24 00:17:33',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1045,'2014-08-24 00:25:51',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1046,'2014-08-24 00:33:19',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project i expositors.'),(1047,'2014-08-24 00:33:28',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1048,'2014-08-24 00:33:36',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1049,'2014-08-24 00:33:41',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1050,'2014-08-24 01:03:26',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1051,'2014-08-24 01:03:48',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1052,'2014-08-24 01:05:04',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1053,'2014-08-24 01:05:44',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1054,'2014-08-24 01:05:58',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1055,'2014-08-24 01:05:58',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1056,'2014-08-24 01:06:04',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1057,'2014-08-24 01:06:04',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1058,'2014-08-24 01:06:16',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1059,'2014-08-24 01:06:17',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1060,'2014-08-24 01:06:31',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1061,'2014-08-24 01:06:31',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1062,'2014-08-24 01:06:34',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1063,'2014-08-24 01:06:35',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1064,'2014-08-24 01:06:49',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1065,'2014-08-24 01:06:49',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1066,'2014-08-24 01:07:17',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1067,'2014-08-24 01:07:17',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1068,'2014-08-24 01:09:10',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1069,'2014-08-24 01:09:11',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1070,'2014-08-24 01:17:08',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1071,'2014-08-24 01:17:09',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1072,'2014-08-24 01:33:50',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1073,'2014-08-24 01:33:57',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1074,'2014-08-24 16:34:54',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1075,'2014-08-24 16:35:32',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1076,'2014-08-24 17:46:42',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Cap camp modificat.'),(1077,'2014-08-24 17:59:05',3,37,'4','Sebas (bumbum)',2,'Modificat address per a H_adr \"treballant a > AureaSocial (Sardenya 261-263 - Barcelona)\".'),(1078,'2014-08-24 17:59:39',3,37,'4','Sebas (bumbum)',2,'Modificat address per a H_adr \"treballant a > pis de mallorca (Mallorca, 450 - Barcelona)\".'),(1079,'2014-08-24 18:07:42',3,37,'4','Sebas (bumbum)',2,'Modificat address per a H_adr \"treballant a > Casa del Comú (pl. del Pilar - Igualada)\".'),(1080,'2014-08-24 18:11:34',3,37,'4','Sebas (bumbum)',2,'Afegit H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\"'),(1081,'2014-08-24 18:11:47',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Cooperativa Integral) rel? > Cooperativa Integral Catalana\".'),(1082,'2014-08-24 18:17:49',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\".'),(1083,'2014-08-24 18:18:28',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Cooperativa Integral) rel? > Cooperativa Integral Catalana\".'),(1084,'2014-08-24 18:20:52',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\".'),(1085,'2014-08-24 18:37:55',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Xarxa Mundial) rel? > Xarxa de Cooperatives Integrals\".'),(1086,'2014-08-24 18:40:05',3,37,'4','Sebas (bumbum)',2,'Modificat project per a H_pro \"(Ecoxarxa) rel? > Ecoxarxanoia\".'),(1087,'2014-08-24 22:48:21',3,90,'20','Llicència soci: ?? ',1,''),(1088,'2014-08-24 22:48:28',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_licences.'),(1089,'2014-08-24 22:52:39',3,90,'20','Llicència soci: ?? ',3,''),(1090,'2014-08-24 22:53:05',3,90,'21','Llicència soci: ?? ',1,''),(1091,'2014-08-24 22:53:09',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_licences.'),(1092,'2014-08-24 22:54:07',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1093,'2014-08-24 22:54:16',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1094,'2014-08-24 22:57:36',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1095,'2014-08-24 23:02:47',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1096,'2014-08-24 23:06:26',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1097,'2014-08-24 23:14:44',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1098,'2014-08-24 23:14:51',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1099,'2014-08-24 23:14:57',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1100,'2014-08-24 23:23:13',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address i rel_job.'),(1101,'2014-08-24 23:23:56',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat number.'),(1102,'2014-08-24 23:24:04',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1103,'2014-08-24 23:24:08',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1104,'2014-08-24 23:54:22',3,41,'64','Asseguradora',1,''),(1105,'2014-08-24 23:54:38',3,40,'54','Arç (Arç Assegurances)',1,''),(1106,'2014-08-24 23:57:20',3,89,'22','Assegurança soci: ?? ',1,''),(1107,'2014-08-24 23:57:24',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_insurances.'),(1108,'2014-08-25 00:00:41',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1109,'2014-08-25 00:01:06',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1110,'2014-08-25 00:01:29',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1111,'2014-08-25 00:01:34',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1112,'2014-08-25 00:33:21',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_job.'),(1113,'2014-08-25 00:33:30',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1114,'2014-08-25 00:34:35',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1115,'2014-08-25 00:34:40',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1116,'2014-08-25 00:36:56',3,89,'22','Arç: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1117,'2014-08-25 00:37:01',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1118,'2014-08-25 00:37:16',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address.'),(1119,'2014-08-25 00:37:21',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1120,'2014-08-25 00:42:38',3,75,'43','(€) XIPU (Xarxa Integral de Professionals i Usuaries) 2347563984582345 - triodos (Triodos Bank)',2,'Modificat number.'),(1121,'2014-08-25 00:42:42',3,75,'43','(€) XIPU (Xarxa Integral de Professionals i Usuaries) 2347563984582345 - triodos (Triodos Bank)',2,'Cap camp modificat.'),(1122,'2014-08-25 00:44:35',3,75,'43','(€) Xarxa Integral de Professionals i Usuaries 2347563984582345 - triodos',2,'Cap camp modificat.'),(1123,'2014-08-25 00:46:03',3,75,'43','triodos: Xarxa Integral de Professionals i Usuaries 2347563984582345',2,'Cap camp modificat.'),(1124,'2014-08-25 00:46:29',3,75,'43','triodos: XIPU 2347563984582345',2,'Cap camp modificat.'),(1125,'2014-08-25 00:47:49',3,74,'1','(eco) CIC (Cooperativa Integral Catalana) COOP0001',2,'Cap camp modificat.'),(1126,'2014-08-25 00:47:54',3,74,'38','(eco) bumbum (Sebas) COOP0111',2,'Cap camp modificat.'),(1127,'2014-08-25 01:00:19',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1128,'2014-08-25 01:19:56',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1129,'2014-08-25 01:36:06',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(1130,'2014-08-25 01:36:55',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',1,''),(1131,'2014-08-25 01:47:40',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_accountBank.'),(1132,'2014-08-25 01:49:14',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1133,'2014-08-25 01:53:18',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1134,'2014-08-25 01:53:30',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1135,'2014-08-25 02:03:04',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Modificat rel_address i rel_job.'),(1136,'2014-08-25 02:03:07',3,90,'21','Llicència soci: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1137,'2014-08-25 02:25:20',3,83,'24','quota 1T: EA (Ecoxarxanoia) [30 riu]',1,''),(1138,'2014-08-25 02:38:20',3,79,'26','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',1,''),(1139,'2014-08-25 02:39:56',3,79,'26','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1140,'2014-08-25 02:40:14',3,79,'26','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',3,''),(1141,'2014-08-25 02:40:28',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1142,'2014-08-25 02:40:59',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',1,''),(1143,'2014-08-25 02:41:43',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat rel_fees.'),(1144,'2014-08-25 02:42:50',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Cap camp modificat.'),(1145,'2014-08-25 02:43:44',3,83,'14','quota 3T: bumbum (Sebas) [6.00 h]',2,'Cap camp modificat.'),(1146,'2014-08-25 02:45:23',3,83,'8','quota 1T: bumbum (Sebas) [30.00 eco]',2,'Cap camp modificat.'),(1147,'2014-08-25 02:47:47',3,83,'14','quota 3T: bumbum (Sebas) [45.00 eco]',2,'Modificat unit, amount, payment_type i rel_account.'),(1148,'2014-08-25 02:56:26',3,83,'14','quota 3T: bumbum (Sebas) [45.00 eco]',2,'Modificat rel_account.'),(1149,'2014-08-25 02:56:51',3,83,'14','quota 3T: bumbum (Sebas) [45.00 FAC]',2,'Modificat unit i rel_account.'),(1150,'2014-08-25 02:57:43',3,83,'14','quota 3T: bumbum (Sebas) [45.00 FAC]',2,'Modificat rel_account.'),(1151,'2014-08-25 02:58:32',3,83,'14','quota 3T: bumbum (Sebas) [45.00 €]',2,'Modificat unit.'),(1152,'2014-08-25 02:59:20',3,79,'28','alta Proj. Autoocupat: alta Soci Coop. Individual: seb (Sebb)',1,''),(1153,'2014-08-25 03:01:10',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat join_date.'),(1154,'2014-08-25 03:05:07',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1155,'2014-08-25 03:05:16',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat expositors.'),(1156,'2014-08-25 03:06:44',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',2,'Cap camp modificat.'),(1157,'2014-08-25 03:09:09',3,100,'29','alta Soci Afí Individual: Jeto Laface (jeto)',1,''),(1158,'2014-08-25 03:12:11',3,101,'19','alta Soci Coop. Individual: seb (Sebb)',2,'Modificat expositors.'),(1159,'2014-08-25 03:20:32',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1160,'2014-08-25 10:40:04',3,56,'5','Facilitació CI (ic_facilitate)',1,''),(1161,'2014-08-25 10:40:47',3,37,'4','Sebas (bumbum)',2,'Afegit H_ofi \"practicant > Facilitació CI (ic_facilitate)\"'),(1162,'2014-08-25 10:47:59',3,37,'18','Marta (tuccia)',2,'Afegit H_ofi \"practicant > Facilitació CI (ic_facilitate)\"'),(1163,'2014-08-25 10:48:49',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat jobs.'),(1164,'2014-08-25 10:58:11',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat jobs.'),(1165,'2014-08-25 10:58:23',3,58,'1','AureaSocial (Sardenya 261-263 - Barcelona)',2,'Modificat jobs.'),(1166,'2014-08-25 11:00:41',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1167,'2014-08-25 11:01:57',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Cap camp modificat.'),(1168,'2014-08-25 11:45:49',3,37,'56','Jordi Madorell (jordi)',1,''),(1169,'2014-08-25 11:50:35',3,101,'31','alta Soci Coop. Individual: duub (anonymous)',2,'Cap camp modificat.'),(1170,'2014-08-25 11:50:59',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',1,''),(1171,'2014-08-25 11:51:49',3,83,'30','quota alta Individual: duub (anonymous) [30.0 €]',2,'Modificat payment_type i payment_date.'),(1172,'2014-08-25 11:52:01',3,83,'30','quota alta Individual: duub (anonymous) [30.0 €]',2,'Modificat payment_date.'),(1173,'2014-08-25 11:52:19',3,101,'31','alta Soci Coop. Individual: duub (anonymous)',2,'Modificat contribution.'),(1174,'2014-08-25 11:52:29',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',2,'Cap camp modificat.'),(1175,'2014-08-25 11:53:03',3,83,'33','quota 1T: duub (anonymous) [45 €]',1,''),(1176,'2014-08-25 11:53:05',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',2,'Modificat rel_fees.'),(1177,'2014-08-25 11:53:36',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1178,'2014-08-25 11:55:04',3,88,'34','XIPU: ?? > pis de mallorca',1,''),(1179,'2014-08-25 11:55:06',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',2,'Modificat rel_address_contracts.'),(1180,'2014-08-25 11:59:17',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1181,'2014-08-25 11:59:55',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',2,'Modificat mentor_membership.'),(1182,'2014-08-25 12:03:12',3,89,'35','Assegurança soci: ?? ',1,''),(1183,'2014-08-25 12:03:34',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',2,'Modificat rel_insurances.'),(1184,'2014-08-25 12:07:12',3,90,'36','Llicència soci: ?? ',1,''),(1185,'2014-08-25 12:07:17',3,79,'32','alta Proj. Autoocupat: alta Soci Coop. Individual: duub (anonymous)',2,'Modificat rel_licences.'),(1186,'2014-08-25 12:13:19',3,37,'55','Duub Cognom (duub)',2,'Modificat name.'),(1187,'2014-08-25 12:13:24',3,101,'31','alta Soci Coop. Individual: duub (Duub)',2,'Cap camp modificat.'),(1188,'2014-08-25 12:14:55',3,83,'30','quota alta Individual: duub (Duub) [30.0 €]',2,'Modificat payment_date.'),(1189,'2014-08-25 12:16:52',3,101,'31','COOP0874 (duub)',2,'Modificat ic_CESnum i join_date.'),(1190,'2014-08-25 12:18:22',3,83,'33','quota 3T: duub (Duub) [45.00 €]',2,'Modificat record_type.'),(1191,'2014-08-25 12:19:55',3,83,'30','quota alta Individual: duub (Duub) [30.0 €]',2,'Modificat payment_date.'),(1192,'2014-08-25 12:23:30',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1193,'2014-08-25 12:35:32',3,38,'57','Creant',1,''),(1194,'2014-08-25 12:37:07',3,83,'37','quota alta Col·lectiva: Creant [60.0 €]',1,''),(1195,'2014-08-25 12:38:39',3,38,'57','Creant',2,'Cap camp modificat.'),(1196,'2014-08-25 12:40:47',3,83,'37','quota alta Col·lectiva: Creant [60.0 €]',2,'Cap camp modificat.'),(1197,'2014-08-25 12:41:01',3,83,'37','quota alta Col·lectiva: Creant [12.0 h]',2,'Modificat unit.'),(1198,'2014-08-25 12:41:09',3,83,'37','quota alta Col·lectiva: Creant [60.0 riu]',2,'Modificat unit.'),(1199,'2014-08-25 12:41:15',3,83,'37','quota alta Col·lectiva: Creant [60.0 eco]',2,'Modificat unit.'),(1200,'2014-08-25 12:41:26',3,83,'37','quota alta Col·lectiva: Creant [60.0 eco]',2,'Modificat issue_date, deadline_date i payment_type.'),(1201,'2014-08-25 12:46:20',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat join_date i expositors.'),(1202,'2014-08-25 12:46:37',3,79,'38','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',1,''),(1203,'2014-08-25 12:46:55',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1204,'2014-08-25 12:49:23',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1205,'2014-08-25 12:50:33',3,37,'19','Jeto Laface (jeto)',2,'Modificat id_card.'),(1206,'2014-08-25 12:52:49',3,79,'27','alta Proj. Autoocupat: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',3,''),(1207,'2014-08-25 12:56:16',3,79,'32','alta Proj. Autoocupat: COOP0874 (duub)',2,'Modificat mentor_membership.'),(1208,'2014-08-25 13:02:06',19,37,'55','Duub Cognom (duub)',2,'Cap camp modificat.'),(1209,'2014-08-25 13:04:50',3,73,'3','EcoCoop * 5.000 = Hora',2,'Cap camp modificat.'),(1210,'2014-08-25 13:07:14',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1211,'2014-08-25 13:08:04',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Cap camp modificat.'),(1212,'2014-08-25 13:13:34',3,56,'6','Restauració',1,''),(1213,'2014-08-25 13:13:40',3,90,'36','Llicència soci: COOP0874 (duub)',2,'Modificat rel_job.'),(1214,'2014-08-25 13:13:46',3,90,'36','Llicència soci: COOP0874 (duub)',2,'Cap camp modificat.'),(1215,'2014-08-25 13:16:21',3,86,'14','Llicència d\'activitat (iC_Licence)',2,'Modificat name.'),(1216,'2014-08-25 13:17:54',3,90,'21','Llicència d\'activitat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1217,'2014-08-25 13:18:31',3,90,'36','Llicència d\'activitat: COOP0874 (duub)',2,'Cap camp modificat.'),(1218,'2014-08-25 13:24:26',3,38,'57','Creant',2,'Modificat project_type.'),(1219,'2014-08-25 13:26:12',3,38,'57','Creant',2,'Cap camp modificat.'),(1220,'2014-08-25 13:38:49',3,37,'42','Sebb Fresh (seb)',2,'Modificat email.'),(1221,'2014-08-25 13:39:14',3,4,'18','seb',2,'Modificat email.'),(1222,'2014-08-25 13:40:18',3,4,'18','seb',2,'Modificat email.'),(1223,'2014-08-25 13:41:38',3,38,'17','EA (Ecoxarxanoia)',2,'Eliminat H_per \"referenciant > Sebas (bumbum)\".'),(1224,'2014-08-25 13:42:41',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1225,'2014-08-25 13:42:50',3,102,'2','alta Proj. Col·lectiu: EA (Ecoxarxanoia)',2,'Modificat project.'),(1226,'2014-08-25 13:43:41',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €]',2,'Modificat unit.'),(1227,'2014-08-25 13:53:32',3,101,'31','COOP0874 (duub)',2,'Modificat expositors.'),(1228,'2014-08-25 13:53:50',3,101,'31','COOP0874 (duub)',2,'Modificat expositors.'),(1229,'2014-08-25 13:54:04',3,101,'31','COOP0874 (duub)',2,'Modificat expositors.'),(1230,'2014-08-25 18:59:53',3,83,'1','quota alta Col·lectiva: EA (Ecoxarxanoia) [60.0 €]',2,'Cap camp modificat.'),(1231,'2014-08-25 23:12:19',3,38,'57','Creant',2,'Cap camp modificat.'),(1232,'2014-08-25 23:20:49',3,102,'39','alta Proj. Col·lectiu: Creant',1,''),(1233,'2014-08-25 23:22:47',3,83,'37','quota alta Col·lectiva: Creant [12.0 h]',2,'Modificat unit.'),(1234,'2014-08-25 23:28:03',3,38,'58','Calafou',1,''),(1235,'2014-08-25 23:36:10',3,102,'40','alta Proj. Col·lectiu: Calafou',1,''),(1236,'2014-08-25 23:51:49',3,38,'57','Creant (Productiu Public)',3,''),(1237,'2014-08-25 23:53:36',3,38,'59','Creant (Nucli d\'Autogestió Local)',1,''),(1238,'2014-08-25 23:53:40',3,102,'41','alta Proj. Col·lectiu: Creant (Nucli d\'Autogestió Local)',1,''),(1239,'2014-08-25 23:54:10',3,102,'41','alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1240,'2014-08-25 23:55:42',3,79,'42','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',1,''),(1241,'2014-08-25 23:56:33',3,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1242,'2014-08-25 23:59:13',3,38,'59','Creant (Nucli d\'Autogestió Local)',2,'Afegit H_per \"referenciant > Sebb Fresh (seb)\"'),(1243,'2014-08-26 00:00:02',3,38,'59','Creant (Nucli d\'Autogestió Local)',2,'Afegit H_per \"participant > Jeto Laface (jeto)\"'),(1244,'2014-08-26 00:02:03',3,79,'42','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1245,'2014-08-26 00:02:23',3,79,'42','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat rel_insurances.'),(1246,'2014-08-26 00:02:54',3,79,'42','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1247,'2014-08-26 23:45:04',3,90,'21','Llicència d\'activitat: COOP0111 (bumbum)',2,'Modificat number.'),(1248,'2014-08-26 23:48:24',3,90,'21','Llicència d\'activitat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1249,'2014-08-26 23:50:55',3,88,'9','bumbum (Sebas): pis de mallorca',2,'Modificat start_date.'),(1250,'2014-08-26 23:51:14',3,90,'21','Llicència d\'activitat: COOP0111 (bumbum)',2,'Modificat number i start_date.'),(1251,'2014-08-26 23:51:57',3,79,'7','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1252,'2014-08-27 08:37:14',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',1,''),(1253,'2014-08-27 08:40:41',3,64,'65','Imatge digital (img)',1,''),(1254,'2014-08-27 08:43:03',3,65,'3','Cara cumple 8 de la Noa',1,''),(1255,'2014-08-27 08:43:11',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat rel_images.'),(1256,'2014-08-27 08:46:08',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1257,'2014-08-27 08:47:43',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat rel_images.'),(1258,'2014-08-27 08:52:02',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1259,'2014-08-27 21:01:38',3,65,'3','Cara cumple 8 de la Noa',2,'Cap camp modificat.'),(1260,'2014-08-27 21:12:18',3,65,'4','jeto seb',1,''),(1261,'2014-08-27 21:12:21',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat rel_images.'),(1262,'2014-08-27 22:46:14',3,65,'4','jeto seb',2,'Cap camp modificat.'),(1263,'2014-08-27 22:46:22',3,65,'3','Cara cumple 8 de la Noa',2,'Cap camp modificat.'),(1264,'2014-08-27 22:46:59',3,65,'4','Jeto seb',2,'Modificat name.'),(1265,'2014-08-27 22:47:07',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1266,'2014-08-27 22:58:03',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat rel_address_contracts.'),(1267,'2014-08-27 23:01:13',3,65,'5','debian bulbs',1,''),(1268,'2014-08-27 23:01:19',3,80,'43','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat rel_images.'),(1269,'2014-08-27 23:05:31',3,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1270,'2014-08-27 23:09:52',3,80,'44','alta Proj. Autoocupat: COOP0111 (bumbum)',1,''),(1271,'2014-08-27 23:30:19',3,80,'44','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat rel_images.'),(1272,'2014-08-27 23:37:12',3,80,'43','alta Proj. Firaire: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1273,'2014-08-27 23:37:16',3,80,'43','alta Proj. Firaire: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1274,'2014-08-27 23:37:22',3,80,'44','alta Proj. Firaire: COOP0111 (bumbum)',2,'Cap camp modificat.'),(1275,'2014-08-27 23:50:57',3,100,'5','alta Soci Afí Individual: Marta (tuccia)',3,''),(1276,'2014-08-27 23:51:50',3,38,'58','Calafou (PAIC sense facturació)',2,'Cap camp modificat.'),(1277,'2014-08-28 00:39:27',3,83,'3','quota alta Individual: bumbum (Sebas) [30.0 eco]',2,'Modificat payment_date.'),(1278,'2014-08-28 00:39:31',3,78,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(1279,'2014-08-28 00:39:33',3,78,'4','COOP0111 (bumbum)',2,'Cap camp modificat.'),(1280,'2014-08-28 00:52:00',3,79,'42','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',3,''),(1281,'2014-08-28 00:52:25',3,79,'28','alta Proj. Autoocupat: alta Soci Coop. Individual: seb (Sebb)',3,''),(1282,'2014-08-28 01:21:21',3,79,'44','alta Proj. Firaire: COOP0111 (bumbum)',3,''),(1283,'2014-08-28 01:24:50',3,80,'46','alta Proj. Firaire: alta Soci Coop. Individual: seb (Sebb)',1,''),(1284,'2014-08-28 01:25:36',3,80,'46','alta Proj. Firaire: alta Proj. Col·lectiu: Calafou',2,'Modificat ic_membership.'),(1285,'2014-08-28 02:27:07',3,38,'17','EA (Ecoxarxanoia)',2,'Eliminat H_per \"referenciant > Marta (tuccia)\".'),(1286,'2014-08-28 02:45:27',3,38,'17','EA (Ecoxarxanoia)',2,'Modificat telephone_cell.'),(1287,'2014-08-28 02:45:48',3,38,'17','EA (Ecoxarxanoia)',2,'Modificat description.'),(1288,'2014-08-28 02:46:18',3,58,'2','Casa del Comú (pl. del Pilar - Igualada)',2,'Modificat postalcode.'),(1289,'2014-08-28 02:46:48',3,38,'17','EA (Ecoxarxanoia)',2,'Afegit H_per \"referenciant > Marta (tuccia)\"'),(1290,'2014-08-28 02:47:43',3,79,'38','alta Proj. Autoocupat: alta Proj. Col·lectiu: Calafou',2,'Modificat ic_membership.'),(1291,'2014-08-28 02:50:19',3,79,'38','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat ic_membership.'),(1292,'2014-08-28 03:00:41',3,38,'59','Creant (Nucli d\'Autogestió Local)',2,'Modificat telephone_cell.'),(1293,'2014-08-28 03:01:13',3,38,'59','Creant (Nucli d\'Autogestió Local)',2,'Modificat description.'),(1294,'2014-08-28 03:01:43',3,38,'59','Creant (Nucli d\'Autogestió Local)',2,'Afegit H_adr \"pis de mallorca (Mallorca, 450 - Barcelona)\"'),(1295,'2014-08-28 03:02:03',3,38,'59','Creant (Nucli d\'Autogestió Local)',2,'Modificat main_address per a H_adr \"pis de mallorca (Mallorca, 450 - Barcelona)\".'),(1296,'2014-08-28 03:02:32',3,58,'3','pis de mallorca (Mallorca, 450 - Barcelona)',2,'Modificat postalcode.'),(1297,'2014-08-28 03:21:35',3,83,'33','quota 3T: duub (Duub) [45.00 €]',2,'Modificat payment_type.'),(1298,'2014-08-28 03:22:57',3,83,'33','quota 3T: duub (Duub) [45.00 €]',2,'Modificat issue_date.'),(1299,'2014-08-28 03:29:47',3,98,'37','quota 4T',1,''),(1300,'2014-08-28 03:31:19',3,83,'47','quota 4T: Creant [45 h]',1,''),(1301,'2014-08-28 03:31:23',3,79,'43','alta Proj. Firaire: alta Proj. Col·lectiu: Creant',2,'Modificat rel_fees.'),(1302,'2014-08-28 03:31:33',3,79,'43','alta Proj. Firaire: alta Proj. Col·lectiu: Creant',2,'Modificat rel_fees.'),(1303,'2014-08-28 03:33:18',3,79,'38','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',3,''),(1304,'2014-08-28 03:33:30',3,79,'43','alta Proj. Firaire: alta Proj. Col·lectiu: Creant',2,'Modificat rel_fees.'),(1305,'2014-08-28 03:37:42',3,83,'47','quota 4T: Creant [45.00 €]',2,'Modificat unit.'),(1306,'2014-08-28 12:25:15',3,65,'3','Cara cumple 8 de la Noa',3,''),(1307,'2014-08-28 12:41:56',3,83,'47','quota 4T: Creant [45.00 €]',2,'Cap camp modificat.'),(1308,'2014-08-28 12:42:32',3,79,'43','alta Proj. Firaire: alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1309,'2014-08-28 16:56:33',3,80,'46','alta Proj. Firaire: alta Proj. Col·lectiu: Calafou',3,''),(1310,'2014-08-28 17:33:56',3,80,'48','alta Proj. Firaire: alta Proj. Col·lectiu: EA (Ecoxarxanoia)',1,''),(1311,'2014-08-28 17:48:27',3,79,'49','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',1,''),(1312,'2014-08-28 17:50:34',3,79,'49','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',3,''),(1313,'2014-08-28 17:51:14',3,79,'50','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',1,''),(1314,'2014-08-28 17:52:35',3,79,'50','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',3,''),(1315,'2014-08-28 18:08:13',3,79,'51','alta Proj. Autoocupat: COOP0111 (bumbum)',1,''),(1316,'2014-08-28 18:35:47',3,79,'51','alta Proj. Autoocupat: COOP0111 (bumbum)',3,''),(1317,'2014-08-28 18:41:38',3,79,'52','alta Proj. Autoocupat: alta Proj. Col·lectiu: Calafou',1,''),(1318,'2014-08-28 18:41:47',3,79,'52','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat ic_membership.'),(1319,'2014-08-28 18:42:14',3,79,'52','alta Proj. Autoocupat: alta Proj. Col·lectiu: Calafou',2,'Cap camp modificat.'),(1320,'2014-08-28 18:42:26',3,79,'52','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat ic_membership.'),(1321,'2014-08-28 18:43:10',3,79,'52','alta Proj. Autoocupat: alta Proj. Col·lectiu: Creant',2,'Modificat ic_membership.'),(1322,'2014-08-28 18:45:20',3,79,'52','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat ic_membership.'),(1323,'2014-08-28 18:47:19',3,79,'52','alta Proj. Autoocupat: COOP0111 (bumbum)',2,'Modificat ic_membership.'),(1324,'2014-08-28 18:50:23',3,79,'52','alta Proj. Autoocupat: alta Soci Coop. Individual: seb (Sebb)',2,'Modificat ic_membership.'),(1325,'2014-08-28 18:50:33',3,79,'52','alta Proj. Autoocupat: alta Soci Coop. Individual: seb (Sebb)',3,''),(1326,'2014-08-28 18:59:54',3,102,'53','alta Proj. Col·lectiu: Creant (Nucli d\'Autogestió Local)',1,''),(1327,'2014-08-28 19:05:00',3,102,'53','alta Proj. Col·lectiu: Creant',2,'Cap camp modificat.'),(1328,'2014-08-28 19:22:21',3,102,'53','alta Proj. Col·lectiu: Creant',3,''),(1329,'2014-08-28 19:24:58',3,102,'54','alta Proj. Col·lectiu: Creant (Nucli d\'Autogestió Local)',1,''),(1330,'2014-08-28 19:25:18',3,102,'54','alta Proj. Col·lectiu: Creant',3,''),(1331,'2014-08-28 19:25:50',3,102,'55','alta Proj. Col·lectiu: Creant (Nucli d\'Autogestió Local)',1,''),(1332,'2014-08-28 19:30:16',3,102,'55','alta Proj. Col·lectiu: Creant',3,''),(1333,'2014-08-28 19:35:59',3,102,'56','alta Proj. Col·lectiu: Creant (Nucli d\'Autogestió Local)',1,''),(1334,'2014-08-28 19:38:33',3,102,'56','alta Proj. Col·lectiu: Creant',3,''),(1335,'2014-08-28 19:40:27',3,102,'57','alta Proj. Col·lectiu: XCI (Xarxa de Cooperatives Integrals)',1,''),(1336,'2014-08-28 19:40:33',3,102,'57','alta Proj. Col·lectiu: XCI (Xarxa de Cooperatives Integrals)',3,''),(1337,'2014-08-28 20:05:29',3,39,'13','Projecte CI (ic_project)',2,'Modificat clas.'),(1338,'2014-08-28 20:05:31',3,39,'13','Projecte CI (ic_project)',2,'Cap camp modificat.'),(1339,'2014-08-28 20:07:56',3,39,'31','Autoocupat (iC_Self_Employed)',2,'Modificat clas.'),(1340,'2014-08-28 20:09:04',3,39,'31','Autoocupat (selfemployed)',2,'Modificat clas.'),(1341,'2014-08-28 20:11:18',3,39,'66','Rebost (ic_larder)',1,''),(1342,'2014-08-28 20:11:20',3,39,'66','Rebost (ic_larder)',2,'Cap camp modificat.'),(1343,'2014-08-28 20:20:32',3,101,'58','alta Soci Coop. Individual: Marta (tuccia)',1,''),(1344,'2014-08-28 22:08:00',3,83,'59','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1345,'2014-08-28 22:12:14',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Cap camp modificat.'),(1346,'2014-08-28 22:12:30',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1347,'2014-08-28 22:12:58',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Cap camp modificat.'),(1348,'2014-08-28 22:13:06',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1349,'2014-08-28 23:14:24',3,83,'60','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1350,'2014-08-28 23:14:58',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Cap camp modificat.'),(1351,'2014-08-28 23:15:16',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1352,'2014-08-28 23:16:11',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Cap camp modificat.'),(1353,'2014-08-28 23:16:23',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Cap camp modificat.'),(1354,'2014-08-28 23:16:34',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1355,'2014-08-28 23:17:13',3,83,'59','quota alta Individual: tuccia (Marta) [30.0 €]',3,''),(1356,'2014-08-28 23:20:44',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1357,'2014-08-28 23:22:19',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1358,'2014-08-28 23:23:14',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Cap camp modificat.'),(1359,'2014-08-28 23:24:23',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1360,'2014-08-28 23:26:21',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1361,'2014-08-28 23:27:52',3,101,'58','alta Soci Coop. Individual: tuccia (Marta)',3,''),(1362,'2014-08-28 23:28:14',3,83,'60','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1363,'2014-08-28 23:28:40',3,101,'61','alta Soci Coop. Individual: Marta (tuccia)',1,''),(1364,'2014-08-28 23:28:56',3,83,'62','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1365,'2014-08-28 23:29:16',3,101,'61','alta Soci Coop. Individual: tuccia (Marta)',2,'Modificat join_fee.'),(1366,'2014-08-28 23:41:42',3,83,'62','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1367,'2014-08-28 23:42:51',3,101,'63','alta Soci Coop. Individual: Marta (tuccia)',1,''),(1368,'2014-08-28 23:47:24',3,83,'64','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1369,'2014-08-28 23:47:31',3,83,'65','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1370,'2014-08-28 23:47:44',3,83,'64','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1371,'2014-08-28 23:55:33',3,83,'66','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1372,'2014-08-28 23:59:05',3,83,'67','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1373,'2014-08-28 23:59:59',3,83,'68','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1374,'2014-08-29 00:01:34',3,83,'69','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1375,'2014-08-29 00:02:00',3,83,'69','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1376,'2014-08-29 00:02:00',3,83,'68','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1377,'2014-08-29 00:02:00',3,83,'67','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1378,'2014-08-29 00:02:00',3,83,'66','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1379,'2014-08-29 00:02:00',3,83,'65','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1380,'2014-08-29 00:04:00',3,83,'70','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1381,'2014-08-29 00:04:41',3,83,'71','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1382,'2014-08-29 00:13:57',3,83,'72','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1383,'2014-08-29 00:14:36',3,83,'72','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1384,'2014-08-29 00:14:36',3,83,'71','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1385,'2014-08-29 00:14:36',3,83,'70','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1386,'2014-08-29 00:14:59',3,83,'73','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1387,'2014-08-29 00:48:36',3,83,'74','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1388,'2014-08-29 00:57:48',3,83,'74','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1389,'2014-08-29 00:57:48',3,83,'73','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1390,'2014-08-29 00:58:04',3,83,'75','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1391,'2014-08-29 00:58:46',3,83,'75','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1392,'2014-08-29 00:59:19',3,83,'76','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1393,'2014-08-29 00:59:55',3,83,'77','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1394,'2014-08-29 01:02:02',3,83,'78','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1395,'2014-08-29 01:06:45',3,83,'79','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1396,'2014-08-29 01:10:37',3,83,'80','quota alta Individual: tuccia (Marta) [30.0 €]',1,''),(1397,'2014-08-29 01:18:48',3,83,'80','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1398,'2014-08-29 01:18:48',3,83,'79','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1399,'2014-08-29 01:18:48',3,83,'78','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1400,'2014-08-29 01:18:48',3,83,'77','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1401,'2014-08-29 01:18:48',3,83,'76','quota alta Individual: tuccia (Marta) [30.00 €]',3,''),(1402,'2014-08-29 03:01:35',3,38,'60','Balabiro (Cooperatiu Col·lectiu)',1,''),(1403,'2014-08-29 03:01:40',3,102,'82','alta Proj. Col·lectiu: Balabiro (Cooperatiu Col·lectiu)',1,''),(1404,'2014-08-29 03:02:47',3,83,'83','quota alta Col·lectiva: Balabiro [60.00 €]',2,'Modificat deadline_date.'),(1405,'2014-08-29 03:03:04',3,83,'83','quota alta Col·lectiva: Balabiro [60.00 €]',2,'Modificat payment_type.'),(1406,'2014-08-29 03:04:17',3,83,'83','quota alta Col·lectiva: Balabiro [60.00 h]',2,'Modificat unit.'),(1407,'2014-08-29 03:12:27',3,83,'83','quota alta Col·lectiva: Balabiro [60.00 h]',2,'Modificat payment_type.'),(1408,'2014-08-29 03:13:11',3,83,'83','quota alta Col·lectiva: Balabiro [60.00 €]',2,'Modificat unit i payment_type.'),(1409,'2014-08-29 03:13:41',3,83,'83','quota alta Col·lectiva: Balabiro [60.00 h]',2,'Modificat unit.'),(1410,'2014-08-29 03:15:51',3,83,'83','quota alta Col·lectiva: Balabiro [12.0 €]',2,'Modificat unit.'),(1411,'2014-08-29 03:16:25',3,83,'83','quota alta Col·lectiva: Balabiro [60.0 h]',2,'Modificat unit.'),(1412,'2014-08-29 11:53:13',1,3,'3','iC_Akin_Membership',2,'Modificado/a permissions.'),(1413,'2014-08-29 12:08:41',20,43,'10','AureaSocial (Sardenya 261-263 - Barcelona)',1,''),(1414,'2014-08-29 12:15:03',1,3,'4','iC_Project_Membership',2,'Modificado/a permissions.'),(1415,'2014-08-29 12:15:38',1,3,'4','iC_Project_Membership',2,'Modificado/a permissions.'),(1416,'2014-08-29 12:16:41',1,3,'2','iC_Person_Membership',2,'Modificado/a permissions.'),(1417,'2014-08-29 12:17:04',1,3,'2','iC_Person_Membership',2,'Modificado/a permissions.'),(1418,'2014-08-29 12:34:44',1,3,'5','gestión_económica',1,''),(1419,'2014-08-29 12:34:57',1,3,'6','comisión_de_acogida',1,''),(1420,'2014-08-29 12:36:37',1,3,'7','iC_Self_Employed',1,''),(1421,'2014-08-29 12:38:06',1,3,'8','iC_Stallholder',1,''),(1422,'2014-08-29 16:27:30',1,101,'19','alta Soci Coop. Individual: seb (Sebb)',2,'Modificado/a expositors.'),(1423,'2014-08-29 16:27:41',1,101,'19','alta Soci Coop. Individual: seb (Sebb)',2,'Modificado/a expositors.'),(1424,'2014-08-29 16:28:05',1,101,'4','COOP0111 (bumbum)',2,'Modificado/a expositors.'),(1425,'2014-08-30 17:16:26',1,83,'47','quota 4T: Creant [45.00 €]',2,'Modificado/a payment_type y rel_account.'),(1426,'2014-08-30 17:17:08',1,69,'44','compte Criptomoneda: frfrf',1,''),(1427,'2014-08-30 17:17:12',1,83,'47','quota 4T: Creant [45.00 €]',2,'Modificado/a rel_account.'),(1428,'2014-08-30 17:33:43',1,69,'45','compte Criptomoneda: gsdgfg',1,''),(1429,'2014-08-30 17:33:45',1,83,'47','quota 4T: Creant [45.00 €]',2,'Modificado/a rel_account.'),(1430,'2014-08-30 17:46:54',1,69,'46','ertrewy',1,''),(1431,'2014-08-30 17:47:09',1,69,'47','compte Bancari: ertrewy',1,''),(1432,'2014-08-30 17:47:25',1,69,'48','equivalencia Moneda - Temps: grhgerhrefdhfd',1,''),(1433,'2014-08-30 17:49:47',1,69,'49','',1,''),(1434,'2014-08-30 18:09:11',1,69,'50','compte Criptomoneda: eee',1,''),(1435,'2014-08-30 18:09:14',1,83,'47','quota 4T: Creant [45.00 €]',2,'Modificado/a payment_type.'),(1436,'2014-08-30 18:09:31',1,69,'51','compte CES: ces2345',1,''),(1437,'2014-08-30 18:09:34',1,83,'47','quota 4T: Creant [45.00 €]',2,'No ha cambiado ningún campo.'),(1438,'2014-08-30 18:09:43',1,83,'47','quota 4T: Creant [45.00 €]',2,'Modificado/a payment_type.'),(1439,'2014-08-30 18:09:58',1,69,'52','compte CES: 2345',1,''),(1440,'2014-08-30 18:10:01',1,83,'47','quota 4T: Creant [45.00 €]',2,'No ha cambiado ningún campo.'),(1441,'2014-08-30 18:18:07',1,69,'53','equivalencia Moneda - Moneda: wwwwww',1,''),(1442,'2014-08-30 18:18:10',1,83,'47','quota 4T: Creant [45.00 €]',2,'No ha cambiado ningún campo.'),(1443,'2014-08-30 18:18:59',1,69,'54','compte CES: ssss',1,''),(1444,'2014-08-30 18:19:02',1,83,'47','quota 4T: Creant [45.00 €]',2,'No ha cambiado ningún campo.'),(1445,'2014-08-30 18:19:53',1,69,'55','compte CES: ggggggggggggg',1,''),(1446,'2014-08-30 18:19:56',1,83,'47','quota 4T: Creant [45.00 €]',2,'No ha cambiado ningún campo.'),(1447,'2014-08-30 18:24:34',1,83,'33','quota 3T: duub (Duub) [45.00 €]',2,'Modificado/a payment_type y rel_account.'),(1448,'2014-08-31 10:05:04',1,69,'56','compte Criptomoneda: retr',1,''),(1449,'2014-08-31 10:05:07',1,83,'30','quota alta Individual: duub (Duub) [30.00 €]',2,'Modificado/a payment_type y rel_account.'),(1450,'2014-09-03 17:29:23',1,4,'1','aleph',2,'Modificado/a groups.'),(1451,'2014-09-04 05:59:24',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Modificado/a ic_membership.'),(1452,'2014-09-04 15:16:23',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1453,'2014-09-04 15:17:07',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1454,'2014-09-04 15:18:28',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1455,'2014-09-04 15:18:43',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1456,'2014-09-04 15:19:42',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1457,'2014-09-04 15:20:11',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1458,'2014-09-04 15:20:51',34,58,'4','qqqqq (qqqq - qqqqqq)',1,''),(1459,'2014-09-04 15:20:54',34,37,'77','miguel perez lopez (miki)',2,'Añadido/a \"qqqqq (qqqq - qqqqqq)\" H_adr.'),(1460,'2014-09-04 15:21:03',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1461,'2014-09-04 15:21:20',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1462,'2014-09-04 18:18:05',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1463,'2014-09-04 18:27:13',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1464,'2014-09-04 18:27:17',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1465,'2014-09-04 18:49:48',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1466,'2014-09-04 18:55:13',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1467,'2014-09-04 19:09:33',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1468,'2014-09-04 19:24:38',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1469,'2014-09-04 19:25:07',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1472,'2014-09-04 19:31:48',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1473,'2014-09-04 19:32:24',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1474,'2014-09-04 19:33:23',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1475,'2014-09-04 19:33:43',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1476,'2014-09-04 19:35:47',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1477,'2014-09-04 19:35:52',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1478,'2014-09-04 19:38:33',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1479,'2014-09-04 19:39:02',34,37,'77','miguel perez lopez (miki)',2,'No ha cambiado ningún campo.'),(1480,'2014-09-04 19:39:18',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1481,'2014-09-04 19:39:46',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1482,'2014-09-04 19:40:14',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1483,'2014-09-04 19:41:17',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1484,'2014-09-04 19:41:24',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1485,'2014-09-04 19:42:35',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1486,'2014-09-04 19:43:07',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1487,'2014-09-04 19:44:13',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1496,'2014-09-04 20:00:46',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1497,'2014-09-04 20:00:51',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1498,'2014-09-04 20:00:56',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1499,'2014-09-04 20:01:39',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1500,'2014-09-04 20:01:44',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1501,'2014-09-04 20:01:47',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1502,'2014-09-04 20:05:43',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1503,'2014-09-04 20:08:52',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1505,'2014-09-04 20:14:21',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1506,'2014-09-04 20:14:31',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1507,'2014-09-04 20:14:34',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1508,'2014-09-04 20:16:02',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1509,'2014-09-04 21:04:10',34,100,'95','alta Soci Afí Individual: miguel perez lopez (miki)',2,'Cap camp modificat.'),(1510,'2014-09-04 21:25:36',37,100,'106','alta Soci Afí Individual: Juan Lopez Gutierrez (afinito)',2,'Cap camp modificat.'),(1511,'2014-09-04 21:42:00',38,37,'81','Luis hiuyt teett (cooper)',2,'Cap camp modificat.'),(1512,'2014-09-04 21:42:23',38,101,'108','alta Soci Coop. Individual: cooper (Luis)',2,'Modificat join_date.'),(1513,'2014-09-04 21:42:26',38,101,'108','alta Soci Coop. Individual: cooper (Luis)',2,'Cap camp modificat.'),(1514,'2014-09-04 22:03:01',38,83,'107','quota alta Individual: cooper (Luis) [30.0 €]',2,'Modificat payment_type.'),(1515,'2014-09-04 22:56:38',1,3,'6','iC_Welcome',2,'Modificat name i permissions.'),(1516,'2014-09-04 23:02:36',1,83,'107','quota alta Individual: cooper (Luis) [30.0 €]',2,'Modificat payment_type i payment_date.'),(1517,'2014-09-04 23:40:20',1,4,'21','person',2,'Modificat username, first_name, last_name, is_staff i groups.'),(1518,'2014-09-04 23:40:33',1,4,'1','aleph',2,'Modificat password.'),(1519,'2014-09-04 23:51:18',1,3,'6','iC_Welcome',2,'Modificat permissions.'),(1520,'2014-09-04 23:51:37',1,3,'6','iC_Welcome',2,'Modificat permissions.'),(1521,'2014-09-04 23:54:55',21,101,'108','dsfdfdsf (cooper)',2,'Modificat ic_CESnum.'),(1522,'2014-09-05 00:10:15',1,4,'39','lolo',1,''),(1523,'2014-09-05 00:10:21',1,4,'39','lolo',2,'Modificat groups.'),(1524,'2014-09-05 00:30:19',1,4,'39','lolo',2,'Modificat is_staff.'),(1525,'2014-09-05 02:06:47',1,3,'3','iC_Akin_Membership',2,'Modificat permissions.'),(1526,'2014-09-05 02:20:20',21,83,'117','quota alta Individual: asdgsda (sdh) [30.0 €]',2,'Modificat payment_type i payment_date.'),(1527,'2014-09-05 02:20:44',21,78,'118','dgsdgsdg (asdgsda)',2,'Modificat ic_CESnum.'),(1528,'2014-09-05 03:11:58',1,4,'38','cooper',2,'Modificat is_staff i groups.'),(1529,'2014-09-05 03:12:26',38,83,'122','quota alta Col·lectiva: wwwwwwwwwwwwwwww [60.0 €]',2,'Modificat payment_type i payment_date.'),(1530,'2014-09-05 03:15:22',38,78,'123','sdfsdgsd ()',2,'Modificat ic_CESnum.'),(1531,'2014-09-05 03:15:42',44,37,'88','wwwwwwwww (swwwwwww)',2,'Cap camp modificat.'),(1532,'2014-09-05 14:08:39',1,3,'6','pu',2,'Modificat name i permissions.'),(1533,'2014-09-05 14:16:29',1,3,'6','iC_Welcome',2,'Modificat name.'),(1534,'2014-09-05 14:50:11',34,37,'77','miguel perez lopez (miki)',2,'Cap camp modificat.'),(1535,'2014-09-05 17:37:05',38,79,'124','alta Proj. Autoocupat: sdfsdgsd ()',1,''),(1536,'2014-09-05 17:42:15',38,79,'125','alta Proj. Autoocupat: sdfsdgsd ()',1,''),(1537,'2014-09-05 17:43:01',1,3,'6','iC_Welcome',2,'Modificat permissions.'),(1538,'2014-09-05 17:43:25',38,79,'126','alta Proj. Autoocupat: sdfsdgsd ()',1,''),(1539,'2014-09-05 17:50:21',38,79,'126','alta Proj. Autoocupat: sdfsdgsd ()',3,''),(1540,'2014-09-05 17:50:21',38,79,'125','alta Proj. Autoocupat: sdfsdgsd ()',3,''),(1541,'2014-09-05 17:52:02',42,37,'84','Aleph Null (proyecto)',2,'Modificat name, surnames, id_card, nickname2, birth_date, website i telephone_cell.'),(1542,'2014-09-05 17:54:03',42,38,'85','enredaos (cicicdev)',2,'Modificat name, nickname, project_type, website, ecommerce, socialweb, email, birth_date, parent i description.'),(1543,'2014-09-05 17:55:19',38,102,'123','09890 lH ()',2,'Modificat ic_CESnum.'),(1544,'2014-09-05 17:56:02',38,102,'123','09890 lH ()',2,'Modificat contribution i description.'),(1545,'2014-09-05 17:56:14',38,79,'124','alta Proj. Autoocupat: 09890 lH ()',2,'Cap camp modificat.'),(1546,'2014-09-05 17:58:38',38,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1547,'2014-09-05 18:14:08',38,4,'42','proyecto',2,'Modificat groups.'),(1548,'2014-09-05 18:47:07',38,4,'42','proyecto',2,'Modificat first_name i last_name.'),(1549,'2014-09-05 19:41:17',38,83,'127','quota alta Individual: zzz (zzzzz) [30.0 €]',2,'Modificat payment_type i payment_date.'),(1550,'2014-09-05 19:41:40',38,78,'128','3456 (zzz)',2,'Modificat ic_CESnum.'),(1551,'2014-09-05 19:53:18',38,79,'129','alta Proj. Autoocupat: 3456 (zzz)',1,''),(1552,'2014-09-05 19:53:46',38,37,'90','zzzzz zzzz (zzz)',2,'Modificat website, telephone_cell, telephone_land i description.'),(1553,'2014-09-05 19:53:55',38,79,'129','alta Proj. Autoocupat: 3456 (zzz)',2,'Cap camp modificat.'),(1554,'2014-09-05 19:54:15',38,37,'90','zzzzz zzzz (zzz)',2,'Afegit H_adr \"treballant a > pis de mallorca (Mallorca, 450 - Barcelona)\"'),(1555,'2014-09-05 19:54:21',38,79,'129','alta Proj. Autoocupat: 3456 (zzz)',2,'Cap camp modificat.'),(1556,'2014-09-05 19:54:38',38,101,'128','3456 (zzz)',2,'Modificat expositors i description.'),(1557,'2014-09-05 19:54:43',38,79,'129','alta Proj. Autoocupat: 3456 (zzz)',2,'Cap camp modificat.'),(1558,'2014-09-05 19:55:27',38,37,'90','zzzzz zzzz (zzz)',2,'Modificat main_address per a H_adr \"treballant a > pis de mallorca (Mallorca, 450 - Barcelona)\".'),(1559,'2014-09-05 19:55:33',38,79,'129','alta Proj. Autoocupat: 3456 (zzz)',2,'Cap camp modificat.'),(1560,'2014-09-05 19:55:39',38,79,'129','alta Proj. Autoocupat: 3456 (zzz)',2,'Modificat organic.'),(1561,'2014-09-05 22:34:35',38,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Cap camp modificat.'),(1562,'2014-09-05 22:35:38',38,81,'23','formació Moneda Social: 2014-08-25 (Marta) AureaSocial',2,'Modificat assistants.'),(1563,'2014-09-06 03:44:33',42,58,'5','direcion a proyecto (gsg - dgsdgdsg)',1,''),(1564,'2014-09-06 03:44:36',42,37,'84','Aleph Null (proyecto)',2,'Afegit H_adr \"direcion a proyecto (gsg - dgsdgdsg)\"'),(1565,'2014-09-06 03:57:21',42,58,'6','gsdgsdgdsg (dgdsgdsg - dgsdgdsg)',1,''),(1566,'2014-09-06 03:57:26',42,38,'85','enredaos (cicicdev)',2,'Afegit H_adr \"gsdgsdgdsg (dgdsgdsg - dgsdgdsg)\"'),(1567,'2014-09-06 03:57:50',42,38,'85','enredaos (cicicdev)',2,'Afegit H_per \"referenciant > Aleph Null (proyecto)\"'),(1568,'2014-09-06 05:05:08',46,58,'7','gfdjgfdjgfdj (fdgjfgjfgjgjfgjgf - fgjfgjfgjfg)',1,''),(1569,'2014-09-06 05:05:15',46,37,'91','elnomdelprovant cognoms del provant (prueba_person)',2,'Afegit H_adr \"gfdjgfdjgfdj (fdgjfgjfgjgjfgjgf - fgjfgjfgjfg)\"'),(1570,'2014-09-06 05:08:45',38,83,'130','quota alta Individual: prueba_person (elnomdelprovant) [30.0 €]',2,'Modificat payment_type i payment_date.'),(1571,'2014-09-06 05:09:13',46,101,'131','alta Soci Coop. Individual: prueba_person (elnomdelprovant)',2,'Cap camp modificat.'),(1572,'2014-09-06 05:10:07',38,78,'131','COOP4567 (prueba_person)',2,'Modificat ic_CESnum, contribution, expositors i description.'),(1573,'2014-09-06 05:12:53',38,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1574,'2014-09-06 05:14:52',38,79,'132','alta Proj. Autoocupat: COOP4567 (prueba_person)',1,''),(1575,'2014-09-06 05:18:41',38,81,'15','acollida Autoocupats: 2014-08-21 (Sebas) AureaSocial',2,'Modificat assistants.'),(1576,'2014-09-06 06:12:33',38,58,'7','gfdjgfdjgfdj (fdgjfgjfgjgjfgjgf - fgjfgjfgjfg)',2,'Modificat postalcode i description.'),(1577,'2014-09-06 06:15:39',38,58,'7','gfdjgfdjgfdj (fdgjfgjfgjgjfgjgf - fgjfgjfgjfg)',2,'Modificat region.'),(1578,'2014-09-06 06:15:44',38,37,'91','elnomdelprovant cognoms del provant (prueba_person)',2,'Modificat description.'),(1579,'2014-09-06 06:36:24',38,3,'7','iC_Self_Employed',2,'Modificat permissions.'),(1580,'2014-09-06 07:36:59',38,83,'135','quota alta Individual: angel (angel) [30.0 €]',2,'Modificat payment_type i payment_date.'),(1581,'2014-09-06 07:38:05',38,78,'136','686786 (angel)',2,'Modificat ic_CESnum.'),(1582,'2014-09-06 07:41:42',38,83,'137','quota alta Col·lectiva: FinDualidad [60.0 €]',2,'Modificat payment_type i payment_date.'),(1583,'2014-09-06 07:42:13',38,78,'138','OOPC3464 ()',2,'Modificat ic_CESnum.');
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
INSERT INTO `Welcome_ic_akin_membership` VALUES (29,19,3,NULL,NULL,NULL,NULL),(90,72,3,NULL,NULL,NULL,NULL),(91,73,3,NULL,NULL,NULL,NULL),(92,74,3,NULL,NULL,NULL,NULL),(93,75,3,NULL,NULL,NULL,NULL),(94,76,3,NULL,NULL,NULL,NULL),(95,77,3,NULL,114,'2014-09-04',NULL),(103,78,3,NULL,NULL,'2014-09-04',NULL),(106,80,3,NULL,NULL,'2014-09-04',NULL),(133,93,3,NULL,134,'2014-09-06',NULL),(139,97,3,NULL,140,'2014-09-06',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_membership_expositors`
--

LOCK TABLES `Welcome_ic_membership_expositors` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_membership_expositors` DISABLE KEYS */;
INSERT INTO `Welcome_ic_membership_expositors` VALUES (174,2,1),(194,4,2),(190,19,1),(191,19,2),(192,19,3),(182,31,2),(196,128,3),(198,131,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_insurances`
--

LOCK TABLES `Welcome_ic_self_employed_rel_insurances` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_insurances` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_insurances` VALUES (24,7,22),(18,32,35);
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
INSERT INTO `Welcome_ic_address_contract` VALUES (9,15,3,650.00,2,'2014-08-27',NULL),(12,15,2,NULL,NULL,NULL,NULL),(34,15,3,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_human`
--

LOCK TABLES `General_human` WRITE;
/*!40000 ALTER TABLE `General_human` DISABLE KEYS */;
INSERT INTO `General_human` VALUES (1,'Revolució Integral',NULL,NULL,'RI','','','','',''),(2,'Xarxa de Cooperatives Integrals',NULL,NULL,'XCI','','','','',''),(3,'Cooperativa Integral Catalana',NULL,NULL,'CIC','','','','',''),(4,'Sebas',NULL,NULL,'bumbum','','','','',''),(15,'Xarxa Integral de Professionals i Usuaries',NULL,NULL,'XIPU','','','','',NULL),(17,'Ecoxarxanoia',NULL,NULL,'EA','','1238e87','','','aschlajhvljkbrvbnsd'),(18,'Marta',NULL,NULL,'tuccia','tuc@tuc.tuc','','','',''),(19,'Jeto',NULL,NULL,'jeto','jeto@jeto.jeto','','','',''),(42,'Sebb',NULL,NULL,'seb','','','','',''),(53,'Triodos Bank',NULL,NULL,'triodos','','','','',NULL),(54,'Arç Assegurances',NULL,NULL,'Arç','','','','',NULL),(55,'Duub',NULL,NULL,'duub','dub@dub.dub','','','',''),(56,'Jordi',NULL,NULL,'jordi','','','','',''),(58,'Calafou',NULL,NULL,'','','','','calafou.org',''),(59,'Creant',NULL,NULL,'','','97658675','','','hvmvcmvb '),(60,'Balabiro',NULL,NULL,'','','','','',''),(61,'dgsdgd',NULL,NULL,'juan','dsgd@dasg.es','','','',NULL),(62,'aaaa',NULL,NULL,'aa','ale@de.es','','','',NULL),(63,'aaa',NULL,NULL,'aaa','dsg@dsgsd.es','','','',NULL),(64,'aaaa',NULL,NULL,'','','','','aaaa',NULL),(65,'anonymous',NULL,NULL,'','adgsd@adgdsf.es','','','',NULL),(66,'anonymous',NULL,NULL,'','dgsdg@dsg.es','','','',NULL),(67,'',NULL,NULL,'','','','','',NULL),(68,'anonymous',NULL,NULL,'','dg@sdgs.es','','','',NULL),(69,'anonymous',NULL,NULL,'','we@dsg.es','','','',NULL),(70,'anonymous',NULL,NULL,'','dsgsdg@dsgfsdg.es','','','',NULL),(71,'anonymous',NULL,NULL,'juan1','ADGSD@ADG.rd','','','',NULL),(72,'anonymous',NULL,NULL,'','ddgsd@dsg.es','','','',NULL),(73,'3333dd',NULL,NULL,'drago','adgsd@gd.es','','93897988979','',NULL),(74,'wwwwwww',NULL,NULL,'ww','wwwww@sss.ws','','','',NULL),(75,'dgdsgsfd',NULL,NULL,'jai','jdsg@dsg.es','3535','35','',NULL),(76,'perez',NULL,NULL,'gato','quert@teclados.es','','','',NULL),(77,'miguel',NULL,NULL,'miki','dgsd@gdsg.es','','93323232323','',''),(78,'hfdhf',NULL,NULL,'juanillo','fgsf@fdg.es','','','',NULL),(79,'LaLola',NULL,NULL,'lanick','la@dfg.es','4326262363','424242141','',NULL),(80,'Juan',NULL,NULL,'afinito','afin@afinlandia.es','696987878','932145678','',NULL),(81,'Luis',NULL,NULL,'cooper','cooper@dgsdg.es','','','',''),(82,'sdgsd',NULL,NULL,'sgd','sdgsd2@sdgd.es','','','',NULL),(83,'sdh',NULL,NULL,'asdgsda','setasfdg@sadgd.es','','','',NULL),(84,'Aleph','2010-09-05',NULL,'proyecto','sagsd2@edsggds.es','5664376457','','cicicdev.enredaos.net',''),(85,'cicicdev','2010-09-05',NULL,'enredaos','info@cicicdev.net','','','cicicdev.enredaos.net','Desarrollo y soul!'),(86,'hhf',NULL,NULL,'fdgsfdh','fgasf@fgdfh.es','','','',NULL),(87,'hfhdf',NULL,NULL,'','','','','fhdfh',NULL),(88,'wwwwwwwww',NULL,NULL,'swwwwwww','ddffgdswqfsdd@edgsdddgd.esd','','','',''),(89,'wwwwwwwwwwwwwwww',NULL,NULL,'','','','','www',NULL),(90,'zzzzz',NULL,NULL,'zzz','zzz@sss.es','4563764357457','57457547547','fdgfdhfdhfdh','hfdshdfh\r\nfdhdfh\r\nhfd\r\nfhd\r\nfh\r\nfhdfh'),(91,'elnomdelprovant',NULL,NULL,'prueba_person','mail_person@person.es','4363264346346','54346346','','faergsfdgfsdhd'),(92,'Kiko',NULL,NULL,'prova_afin','semail@mail.es','634634643634','35345','',NULL),(93,'lucifer',NULL,NULL,'satan','mundo@dsgsd.es','32523523','325325','',NULL),(94,'angel',NULL,NULL,'angel','dios@cielo.es','43634','26346','',NULL),(95,'Mezcla',NULL,NULL,'egoeco','adgd@es.es','eryery','ryewyr','',NULL),(96,'FinDualidad',NULL,NULL,'','','','','abraxas.es',NULL),(97,'afin',NULL,NULL,'afin','sdgd@es.es','436346','6463','',NULL);
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
INSERT INTO `django_session` VALUES ('0dzf8phh14ojaf9ex134yhb4lsp42srr','NDMxOGJkNWFhMzFmN2YxNTg5NzliODQyNmFlMTk1ZTgzYWU0MDM4Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-09-01 22:27:53'),('1erdiw1dejjz84opjqleuc53odh1zgih','MDA1MjFlZTQ1Mzg1YTkxMjk4Y2IzMTRjMjIxOGE2YmFlMWFjMDQxMjp7ImRqYW5nb19sYW5ndWFnZSI6ImVzIn0=','2014-09-17 15:18:45'),('2eay19ue6yd1p2w7ha620gm8gq7s47ac','MDQwZmFkN2Q4ZjI0YTFmY2E0NzkxYzlhZTRkYzdhZTJkMzMxOTk3ZDp7fQ==','2014-09-04 16:05:16'),('33jcrnnumrme7jkxiya1c9yqp3i8g7qe','ZWE1ZjUwNTQ0YTJkOTNjNmIzOGJhOTE3MGNjOGZjZjA5MmE2OTczMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-08-19 17:14:14'),('5e78ca5cdgwecenlker6541pvwr4dqha','Y2RiMTY3Y2ExNDZhN2UyNTRkZTllODExYmJmZTdiZjM4Nzg2OGQ5NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiZGphbmdvX2xhbmd1YWdlIjoiY2EiLCJfYXV0aF91c2VyX2lkIjozOH0=','2014-09-19 17:35:52'),('5k6qpeocv1cnwb38v32a3kvujlkzfqe9','NDMxOGJkNWFhMzFmN2YxNTg5NzliODQyNmFlMTk1ZTgzYWU0MDM4Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-09-04 00:37:10'),('6a57d9ge0uzjkesvhg8arpcdsnw9p3lf','NTViZjJlMWJmNzIzYzljMTU5NWY3N2U2N2JhY2EyZTc5ODhhMzIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-08-22 22:37:57'),('frmglpu92fom64z6mvwxisluoajl62br','NTViZjJlMWJmNzIzYzljMTU5NWY3N2U2N2JhY2EyZTc5ODhhMzIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-09-08 13:20:41'),('k28bmyq3cfmowa6jassdgqvj660f2nz6','NTViZjJlMWJmNzIzYzljMTU5NWY3N2U2N2JhY2EyZTc5ODhhMzIxNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=','2014-09-05 22:44:28'),('s2qy5vrq7hvj0te8q9i54md8kdsosc3c','MWFlMjYyZmIxZjE1MjljMzdlNGE2YzdhYzE5N2E5NGJiNzMyZmQwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTh9','2014-09-05 19:12:11'),('u94hm432i1z3clat2k0c9xjldl3lup9x','MGRmOGJjNTVkZDYyMGJmNGE3ZmU0ZGMwNzk5MTY4ODY5NWE0ZWU3Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9','2014-09-04 17:25:42'),('w3h5wouiazpuw623dcll1pgbz2g6ny4g','NDZmMjU3ODgwYzFkZDJkYWIzYmM3YTBkMjgzY2Y1M2ExZThmYjdiNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiZGphbmdvX2xhbmd1YWdlIjoiY2EiLCJfYXV0aF91c2VyX2lkIjo1MX0=','2014-09-20 07:44:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_self_employed_rel_address_contracts`
--

LOCK TABLES `Welcome_ic_self_employed_rel_address_contracts` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts` DISABLE KEYS */;
INSERT INTO `Welcome_ic_self_employed_rel_address_contracts` VALUES (139,7,9),(140,7,12),(136,32,34),(156,43,12);
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
  `membership_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_form_registrationprofile`
--

LOCK TABLES `public_form_registrationprofile` WRITE;
/*!40000 ALTER TABLE `public_form_registrationprofile` DISABLE KEYS */;
INSERT INTO `public_form_registrationprofile` VALUES (1,4,'ALREADY_ACTIVATED',18,NULL,7),(2,5,'ALREADY_ACTIVATED',19,NULL,10),(15,18,'ALREADY_ACTIVATED',42,NULL,7),(16,19,'ALREADY_ACTIVATED',55,NULL,7),(17,20,'ALREADY_ACTIVATED',61,NULL,7),(18,21,'ALREADY_ACTIVATED',62,NULL,7),(19,22,'35104c4f12eeb29ca73970d649139bf818e80077',63,64,8),(20,23,'e963e1d59d16b8ad0b50df58544acbfa7f4b62ac',65,NULL,10),(21,24,'ALREADY_ACTIVATED',66,67,8),(22,29,'ALREADY_ACTIVATED',72,NULL,10),(23,30,'ALREADY_ACTIVATED',73,NULL,10),(24,31,'ALREADY_ACTIVATED',74,NULL,10),(25,32,'ALREADY_ACTIVATED',75,NULL,10),(26,33,'ALREADY_ACTIVATED',76,NULL,10),(27,34,'ALREADY_ACTIVATED',77,NULL,10),(28,35,'ALREADY_ACTIVATED',78,NULL,10),(29,36,'ALREADY_ACTIVATED',79,NULL,7),(30,37,'ALREADY_ACTIVATED',80,NULL,10),(31,38,'ALREADY_ACTIVATED',81,NULL,7),(32,40,'ALREADY_ACTIVATED',82,NULL,7),(33,41,'ALREADY_ACTIVATED',83,NULL,7),(34,42,'ALREADY_ACTIVATED',84,85,8),(35,43,'ALREADY_ACTIVATED',86,87,8),(36,44,'ALREADY_ACTIVATED',88,85,8),(37,45,'ALREADY_ACTIVATED',90,NULL,7),(38,46,'ALREADY_ACTIVATED',91,NULL,7),(39,47,'ALREADY_ACTIVATED',92,NULL,10),(40,48,'ALREADY_ACTIVATED',93,NULL,10),(41,49,'ALREADY_ACTIVATED',94,NULL,7),(42,50,'ALREADY_ACTIVATED',95,96,8),(43,51,'ALREADY_ACTIVATED',97,NULL,10);
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
INSERT INTO `Welcome_ic_project_membership` VALUES (95,1),(121,1),(2,17),(40,58),(41,59),(82,60),(89,67),(123,85),(138,96);
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
INSERT INTO `General_nonmaterial_type` VALUES (49),(50),(51),(52),(53),(54),(65);
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
) ENGINE=InnoDB AUTO_INCREMENT=4437 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,35),(2,1,43),(3,1,46),(4,1,52),(5,1,55),(6,1,56),(7,1,61),(8,1,62),(9,1,63),(10,1,64),(11,1,65),(12,1,66),(13,1,67),(14,1,68),(15,1,69),(16,1,70),(17,1,71),(18,1,72),(19,1,73),(20,1,74),(21,1,76),(22,1,77),(23,1,79),(24,1,80),(25,1,82),(26,1,85),(27,1,86),(28,1,87),(2587,2,1),(2588,2,2),(2589,2,3),(2590,2,4),(2591,2,5),(2592,2,6),(2593,2,7),(2594,2,8),(2595,2,9),(2596,2,10),(2597,2,11),(2598,2,12),(2599,2,13),(2600,2,14),(2601,2,15),(2602,2,16),(2603,2,17),(2604,2,18),(2605,2,19),(2606,2,20),(2607,2,21),(2608,2,22),(2609,2,23),(2610,2,24),(2611,2,25),(2612,2,26),(2613,2,27),(2614,2,28),(2615,2,29),(2616,2,30),(2617,2,31),(2618,2,32),(2619,2,33),(2620,2,34),(2621,2,35),(2622,2,36),(2623,2,37),(2624,2,38),(2625,2,39),(2626,2,40),(2627,2,41),(2628,2,42),(2629,2,43),(2630,2,44),(2631,2,45),(2632,2,46),(2633,2,47),(2634,2,48),(2635,2,49),(2636,2,50),(2637,2,51),(2638,2,52),(2639,2,53),(2640,2,54),(2641,2,55),(2642,2,56),(2643,2,57),(2644,2,58),(2645,2,59),(2646,2,60),(2647,2,61),(2648,2,62),(2649,2,63),(2650,2,64),(2651,2,65),(2652,2,66),(2653,2,67),(2654,2,68),(2655,2,69),(2656,2,70),(2657,2,71),(2658,2,72),(2659,2,73),(2660,2,74),(2661,2,75),(2662,2,76),(2663,2,77),(2664,2,78),(2665,2,79),(2666,2,80),(2667,2,81),(2668,2,82),(2669,2,83),(2670,2,84),(2671,2,85),(2672,2,86),(2673,2,87),(2674,2,88),(2675,2,89),(2676,2,90),(2677,2,91),(2678,2,92),(2679,2,93),(2680,2,94),(2681,2,95),(2682,2,96),(2683,2,100),(2684,2,101),(2685,2,102),(2686,2,103),(2687,2,104),(2688,2,105),(2689,2,106),(2690,2,107),(2691,2,108),(2692,2,109),(2693,2,110),(2694,2,111),(2695,2,112),(2696,2,113),(2697,2,114),(2698,2,115),(2699,2,116),(2700,2,117),(2701,2,118),(2702,2,119),(2703,2,120),(2704,2,121),(2705,2,122),(2706,2,123),(2707,2,124),(2708,2,125),(2709,2,126),(2710,2,127),(2711,2,128),(2712,2,129),(2713,2,130),(2714,2,131),(2715,2,132),(2716,2,133),(2717,2,134),(2718,2,135),(2719,2,136),(2720,2,137),(2721,2,138),(2722,2,139),(2723,2,140),(2724,2,141),(2725,2,142),(2726,2,143),(2727,2,144),(2728,2,145),(2729,2,146),(2730,2,147),(2731,2,148),(2732,2,149),(2733,2,150),(2734,2,151),(2735,2,152),(2736,2,153),(2737,2,154),(2738,2,155),(2739,2,156),(2740,2,157),(2741,2,158),(2742,2,159),(2743,2,163),(2744,2,164),(2745,2,165),(2746,2,166),(2747,2,167),(2748,2,168),(2749,2,169),(2750,2,170),(2751,2,171),(2752,2,172),(2753,2,173),(2754,2,174),(2755,2,175),(2756,2,176),(2757,2,177),(2758,2,178),(2759,2,179),(2760,2,180),(2761,2,181),(2762,2,182),(2763,2,183),(2764,2,184),(2765,2,185),(2766,2,186),(2767,2,187),(2768,2,188),(2769,2,189),(2770,2,190),(2771,2,191),(2772,2,192),(2773,2,193),(2774,2,194),(2775,2,195),(2776,2,196),(2777,2,197),(2778,2,198),(2779,2,199),(2780,2,200),(2781,2,201),(2782,2,202),(2783,2,203),(2784,2,204),(2785,2,205),(2786,2,206),(2787,2,207),(2788,2,208),(2789,2,209),(2790,2,210),(2791,2,211),(2792,2,212),(2793,2,213),(2794,2,214),(2795,2,215),(2796,2,216),(2797,2,217),(2798,2,218),(2799,2,219),(2800,2,220),(2801,2,221),(2802,2,222),(2803,2,223),(2804,2,224),(2805,2,225),(2806,2,226),(2807,2,227),(2808,2,228),(2809,2,229),(2810,2,230),(2811,2,231),(2812,2,232),(2813,2,233),(2814,2,234),(2815,2,235),(2816,2,236),(2817,2,237),(2818,2,238),(2819,2,239),(2820,2,240),(2821,2,241),(2822,2,242),(2823,2,243),(2824,2,244),(2825,2,245),(2826,2,246),(2827,2,247),(2828,2,248),(2829,2,249),(2830,2,253),(2831,2,254),(2832,2,255),(2833,2,256),(2834,2,257),(2835,2,258),(2836,2,259),(2837,2,260),(2838,2,261),(2839,2,262),(2840,2,263),(2841,2,264),(2842,2,265),(2843,2,266),(2844,2,267),(2845,2,268),(2846,2,269),(2847,2,270),(2848,2,271),(2849,2,272),(2850,2,273),(2851,2,274),(2852,2,275),(2853,2,276),(2854,2,277),(2855,2,278),(2856,2,279),(2857,2,280),(2858,2,281),(2859,2,282),(2860,2,283),(2861,2,284),(2862,2,285),(2863,2,286),(2864,2,287),(2865,2,288),(2866,2,289),(2867,2,290),(2868,2,291),(2869,2,292),(2870,2,293),(2871,2,294),(2872,2,295),(2873,2,296),(2874,2,297),(2875,2,298),(2876,2,299),(2877,2,300),(2878,2,301),(2879,2,302),(2880,2,303),(2881,2,304),(2882,2,305),(2883,2,306),(2884,2,307),(2885,2,308),(2886,2,309),(3703,3,109),(3697,3,110),(3698,3,111),(3699,3,112),(3700,3,113),(3701,3,114),(3704,3,127),(3692,3,128),(3693,3,129),(3695,3,172),(3696,3,173),(3702,3,174),(3694,3,299),(1990,4,1),(1991,4,2),(1992,4,3),(1993,4,4),(1994,4,5),(1995,4,6),(1996,4,7),(1997,4,8),(1998,4,9),(1999,4,10),(2000,4,11),(2001,4,12),(2002,4,13),(2003,4,14),(2004,4,15),(2005,4,16),(2006,4,17),(2007,4,18),(2008,4,19),(2009,4,20),(2010,4,21),(2011,4,22),(2012,4,23),(2013,4,24),(2014,4,25),(2015,4,26),(2016,4,27),(2017,4,28),(2018,4,29),(2019,4,30),(2020,4,31),(2021,4,32),(2022,4,33),(2023,4,34),(2024,4,35),(2025,4,36),(2026,4,37),(2027,4,38),(2028,4,39),(2029,4,40),(2030,4,41),(2031,4,42),(2032,4,43),(2033,4,44),(2034,4,45),(2035,4,46),(2036,4,47),(2037,4,48),(2038,4,49),(2039,4,50),(2040,4,51),(2041,4,52),(2042,4,53),(2043,4,54),(2044,4,55),(2045,4,56),(2046,4,57),(2047,4,58),(2048,4,59),(2049,4,60),(2050,4,61),(2051,4,62),(2052,4,63),(2053,4,64),(2054,4,65),(2055,4,66),(2056,4,67),(2057,4,68),(2058,4,69),(2059,4,70),(2060,4,71),(2061,4,72),(2062,4,73),(2063,4,74),(2064,4,75),(2065,4,76),(2066,4,77),(2067,4,78),(2068,4,79),(2069,4,80),(2070,4,81),(2071,4,82),(2072,4,83),(2073,4,84),(2074,4,85),(2075,4,86),(2076,4,87),(2077,4,88),(2078,4,89),(2079,4,90),(2080,4,91),(2081,4,92),(2082,4,93),(2083,4,94),(2084,4,95),(2085,4,96),(2086,4,100),(2087,4,101),(2088,4,102),(2089,4,103),(2090,4,104),(2091,4,105),(2092,4,106),(2093,4,107),(2094,4,108),(2095,4,109),(2096,4,110),(2097,4,111),(2098,4,112),(2099,4,113),(2100,4,114),(2101,4,115),(2102,4,116),(2103,4,117),(2104,4,118),(2105,4,119),(2106,4,120),(2107,4,121),(2108,4,122),(2109,4,123),(2110,4,124),(2111,4,125),(2112,4,126),(2113,4,127),(2114,4,128),(2115,4,129),(2116,4,130),(2117,4,131),(2118,4,132),(2119,4,133),(2120,4,134),(2121,4,135),(2122,4,136),(2123,4,137),(2124,4,138),(2125,4,139),(2126,4,140),(2127,4,141),(2128,4,142),(2129,4,143),(2130,4,144),(2131,4,145),(2132,4,146),(2133,4,147),(2134,4,148),(2135,4,149),(2136,4,150),(2137,4,151),(2138,4,152),(2139,4,153),(2140,4,154),(2141,4,155),(2142,4,156),(2143,4,157),(2144,4,158),(2145,4,159),(2146,4,163),(2147,4,164),(2148,4,165),(2149,4,166),(2150,4,167),(2151,4,168),(2152,4,169),(2153,4,170),(2154,4,171),(2155,4,172),(2156,4,173),(2157,4,174),(2158,4,175),(2159,4,176),(2160,4,177),(2161,4,178),(2162,4,179),(2163,4,180),(2164,4,181),(2165,4,182),(2166,4,183),(2167,4,184),(2168,4,185),(2169,4,186),(2170,4,187),(2171,4,188),(2172,4,189),(2173,4,190),(2174,4,191),(2175,4,192),(2176,4,193),(2177,4,194),(2178,4,195),(2179,4,196),(2180,4,197),(2181,4,198),(2182,4,199),(2183,4,200),(2184,4,201),(2185,4,202),(2186,4,203),(2187,4,204),(2188,4,205),(2189,4,206),(2190,4,207),(2191,4,208),(2192,4,209),(2193,4,210),(2194,4,211),(2195,4,212),(2196,4,213),(2197,4,214),(2198,4,215),(2199,4,216),(2200,4,217),(2201,4,218),(2202,4,219),(2203,4,220),(2204,4,221),(2205,4,222),(2206,4,223),(2207,4,224),(2208,4,225),(2209,4,226),(2210,4,227),(2211,4,228),(2212,4,229),(2213,4,230),(2214,4,231),(2215,4,232),(2216,4,233),(2217,4,234),(2218,4,235),(2219,4,236),(2220,4,237),(2221,4,238),(2222,4,239),(2223,4,240),(2224,4,241),(2225,4,242),(2226,4,243),(2227,4,244),(2228,4,245),(2229,4,246),(2230,4,247),(2231,4,248),(2232,4,249),(2233,4,253),(2234,4,254),(2235,4,255),(2236,4,256),(2237,4,257),(2238,4,258),(2239,4,259),(2240,4,260),(2241,4,261),(2242,4,262),(2243,4,263),(2244,4,264),(2245,4,265),(2246,4,266),(2247,4,267),(2248,4,268),(2249,4,269),(2250,4,270),(2251,4,271),(2252,4,272),(2253,4,273),(2254,4,274),(2255,4,275),(2256,4,276),(2257,4,277),(2258,4,278),(2259,4,279),(2260,4,280),(2261,4,281),(2262,4,282),(2263,4,283),(2264,4,284),(2265,4,285),(2266,4,286),(2267,4,287),(2268,4,288),(2269,4,289),(2270,4,290),(2271,4,291),(2272,4,292),(2273,4,293),(2274,4,294),(2275,4,295),(2276,4,296),(2277,4,297),(2278,4,298),(2279,4,299),(2280,4,300),(2281,4,301),(2282,4,302),(2283,4,303),(2284,4,304),(2285,4,305),(2286,4,306),(2287,4,307),(2288,4,308),(2289,4,309),(3837,6,1),(3838,6,2),(3839,6,3),(3840,6,4),(3841,6,5),(3842,6,6),(3843,6,7),(3844,6,8),(3845,6,9),(3846,6,10),(3847,6,11),(3848,6,12),(3849,6,13),(3850,6,14),(3851,6,15),(3852,6,16),(3853,6,17),(3854,6,18),(3855,6,19),(3856,6,20),(3857,6,21),(3858,6,22),(3859,6,23),(3860,6,24),(3861,6,25),(3862,6,26),(3863,6,27),(3864,6,28),(3865,6,29),(3866,6,30),(3867,6,31),(3868,6,32),(3869,6,33),(3870,6,34),(3871,6,35),(3872,6,36),(3873,6,37),(3874,6,38),(3875,6,39),(3876,6,40),(3877,6,41),(3878,6,42),(3879,6,43),(3880,6,44),(3881,6,45),(3882,6,46),(3883,6,47),(3884,6,48),(3885,6,49),(3886,6,50),(3887,6,51),(3888,6,52),(3889,6,53),(3890,6,54),(3891,6,55),(3892,6,56),(3893,6,57),(3894,6,58),(3895,6,59),(3896,6,60),(3897,6,61),(3898,6,62),(3899,6,63),(3900,6,64),(3901,6,65),(3902,6,66),(3903,6,67),(3904,6,68),(3905,6,69),(3906,6,70),(3907,6,71),(3908,6,72),(3909,6,73),(3910,6,74),(3911,6,75),(3912,6,76),(3913,6,77),(3914,6,78),(3915,6,79),(3916,6,80),(3917,6,81),(3918,6,82),(3919,6,83),(3920,6,84),(3921,6,85),(3922,6,86),(3923,6,87),(3924,6,88),(3925,6,89),(3926,6,90),(3927,6,91),(3928,6,92),(3929,6,93),(3930,6,94),(3931,6,95),(3932,6,96),(3933,6,100),(3934,6,101),(3935,6,102),(3936,6,103),(3937,6,104),(3938,6,105),(3939,6,106),(3940,6,107),(3941,6,108),(3942,6,109),(3943,6,110),(3944,6,111),(3945,6,112),(3946,6,113),(3947,6,114),(3948,6,115),(3949,6,116),(3950,6,117),(3951,6,118),(3952,6,119),(3953,6,120),(3954,6,121),(3955,6,122),(3956,6,123),(3957,6,124),(3958,6,125),(3959,6,126),(3960,6,127),(3961,6,128),(3962,6,129),(3963,6,130),(3964,6,131),(3965,6,132),(3966,6,133),(3967,6,134),(3968,6,135),(3969,6,136),(3970,6,137),(3971,6,138),(3972,6,139),(3973,6,140),(3974,6,141),(3975,6,142),(3976,6,143),(3977,6,144),(3978,6,145),(3979,6,146),(3980,6,147),(3981,6,148),(3982,6,149),(3983,6,150),(3984,6,151),(3985,6,152),(3986,6,153),(3987,6,154),(3988,6,155),(3989,6,156),(3990,6,157),(3991,6,158),(3992,6,159),(3993,6,163),(3994,6,164),(3995,6,165),(3996,6,166),(3997,6,167),(3998,6,168),(3999,6,169),(4000,6,170),(4001,6,171),(4002,6,172),(4003,6,173),(4004,6,174),(4005,6,175),(4006,6,176),(4007,6,177),(4008,6,178),(4009,6,179),(4010,6,180),(4011,6,181),(4012,6,182),(4013,6,183),(4014,6,184),(4015,6,185),(4016,6,186),(4017,6,187),(4018,6,188),(4019,6,189),(4020,6,190),(4021,6,191),(4022,6,192),(4023,6,193),(4024,6,194),(4025,6,195),(4026,6,196),(4027,6,197),(4028,6,198),(4029,6,199),(4030,6,200),(4031,6,201),(4032,6,202),(4033,6,203),(4034,6,204),(4035,6,205),(4036,6,206),(4037,6,207),(4038,6,208),(4039,6,209),(4040,6,210),(4041,6,211),(4042,6,212),(4043,6,213),(4044,6,214),(4045,6,215),(4046,6,216),(4047,6,217),(4048,6,218),(4049,6,219),(4050,6,220),(4051,6,221),(4052,6,222),(4053,6,223),(4054,6,224),(4055,6,225),(4056,6,226),(4057,6,227),(4058,6,228),(4059,6,229),(4060,6,230),(4061,6,231),(4062,6,232),(4063,6,233),(4064,6,234),(4065,6,235),(4066,6,236),(4067,6,237),(4068,6,238),(4069,6,239),(4070,6,240),(4071,6,241),(4072,6,242),(4073,6,243),(4074,6,244),(4075,6,245),(4076,6,246),(4077,6,247),(4078,6,248),(4079,6,249),(4080,6,253),(4081,6,254),(4082,6,255),(4083,6,256),(4084,6,257),(4085,6,258),(4086,6,259),(4087,6,260),(4088,6,261),(4089,6,262),(4090,6,263),(4091,6,264),(4092,6,265),(4093,6,266),(4094,6,267),(4095,6,268),(4096,6,269),(4097,6,270),(4098,6,271),(4099,6,272),(4100,6,273),(4101,6,274),(4102,6,275),(4103,6,276),(4104,6,277),(4105,6,278),(4106,6,279),(4107,6,280),(4108,6,281),(4109,6,282),(4110,6,283),(4111,6,284),(4112,6,285),(4113,6,286),(4114,6,287),(4115,6,288),(4116,6,289),(4117,6,290),(4118,6,291),(4119,6,292),(4120,6,293),(4121,6,294),(4122,6,295),(4123,6,296),(4124,6,297),(4125,6,298),(4126,6,299),(4127,6,300),(4128,6,301),(4129,6,302),(4130,6,303),(4131,6,304),(4132,6,305),(4133,6,306),(4134,6,307),(4135,6,308),(4136,6,309),(4137,7,1),(4138,7,2),(4139,7,3),(4140,7,4),(4141,7,5),(4142,7,6),(4143,7,7),(4144,7,8),(4145,7,9),(4146,7,10),(4147,7,11),(4148,7,12),(4149,7,13),(4150,7,14),(4151,7,15),(4152,7,16),(4153,7,17),(4154,7,18),(4155,7,19),(4156,7,20),(4157,7,21),(4158,7,22),(4159,7,23),(4160,7,24),(4161,7,25),(4162,7,26),(4163,7,27),(4164,7,28),(4165,7,29),(4166,7,30),(4167,7,31),(4168,7,32),(4169,7,33),(4170,7,34),(4171,7,35),(4172,7,36),(4173,7,37),(4174,7,38),(4175,7,39),(4176,7,40),(4177,7,41),(4178,7,42),(4179,7,43),(4180,7,44),(4181,7,45),(4182,7,46),(4183,7,47),(4184,7,48),(4185,7,49),(4186,7,50),(4187,7,51),(4188,7,52),(4189,7,53),(4190,7,54),(4191,7,55),(4192,7,56),(4193,7,57),(4194,7,58),(4195,7,59),(4196,7,60),(4197,7,61),(4198,7,62),(4199,7,63),(4200,7,64),(4201,7,65),(4202,7,66),(4203,7,67),(4204,7,68),(4205,7,69),(4206,7,70),(4207,7,71),(4208,7,72),(4209,7,73),(4210,7,74),(4211,7,75),(4212,7,76),(4213,7,77),(4214,7,78),(4215,7,79),(4216,7,80),(4217,7,81),(4218,7,82),(4219,7,83),(4220,7,84),(4221,7,85),(4222,7,86),(4223,7,87),(4224,7,88),(4225,7,89),(4226,7,90),(4227,7,91),(4228,7,92),(4229,7,93),(4230,7,94),(4231,7,95),(4232,7,96),(4233,7,100),(4234,7,101),(4235,7,102),(4236,7,103),(4237,7,104),(4238,7,105),(4239,7,106),(4240,7,107),(4241,7,108),(4242,7,109),(4243,7,110),(4244,7,111),(4245,7,112),(4246,7,113),(4247,7,114),(4248,7,115),(4249,7,116),(4250,7,117),(4251,7,118),(4252,7,119),(4253,7,120),(4254,7,121),(4255,7,122),(4256,7,123),(4257,7,124),(4258,7,125),(4259,7,126),(4260,7,127),(4261,7,128),(4262,7,129),(4263,7,130),(4264,7,131),(4265,7,132),(4266,7,133),(4267,7,134),(4268,7,135),(4269,7,136),(4270,7,137),(4271,7,138),(4272,7,139),(4273,7,140),(4274,7,141),(4275,7,142),(4276,7,143),(4277,7,144),(4278,7,145),(4279,7,146),(4280,7,147),(4281,7,148),(4282,7,149),(4283,7,150),(4284,7,151),(4285,7,152),(4286,7,153),(4287,7,154),(4288,7,155),(4289,7,156),(4290,7,157),(4291,7,158),(4292,7,159),(4293,7,163),(4294,7,164),(4295,7,165),(4296,7,166),(4297,7,167),(4298,7,168),(4299,7,169),(4300,7,170),(4301,7,171),(4302,7,172),(4303,7,173),(4304,7,174),(4305,7,175),(4306,7,176),(4307,7,177),(4308,7,178),(4309,7,179),(4310,7,180),(4311,7,181),(4312,7,182),(4313,7,183),(4314,7,184),(4315,7,185),(4316,7,186),(4317,7,187),(4318,7,188),(4319,7,189),(4320,7,190),(4321,7,191),(4322,7,192),(4323,7,193),(4324,7,194),(4325,7,195),(4326,7,196),(4327,7,197),(4328,7,198),(4329,7,199),(4330,7,200),(4331,7,201),(4332,7,202),(4333,7,203),(4334,7,204),(4335,7,205),(4336,7,206),(4337,7,207),(4338,7,208),(4339,7,209),(4340,7,210),(4341,7,211),(4342,7,212),(4343,7,213),(4344,7,214),(4345,7,215),(4346,7,216),(4347,7,217),(4348,7,218),(4349,7,219),(4350,7,220),(4351,7,221),(4352,7,222),(4353,7,223),(4354,7,224),(4355,7,225),(4356,7,226),(4357,7,227),(4358,7,228),(4359,7,229),(4360,7,230),(4361,7,231),(4362,7,232),(4363,7,233),(4364,7,234),(4365,7,235),(4366,7,236),(4367,7,237),(4368,7,238),(4369,7,239),(4370,7,240),(4371,7,241),(4372,7,242),(4373,7,243),(4374,7,244),(4375,7,245),(4376,7,246),(4377,7,247),(4378,7,248),(4379,7,249),(4380,7,253),(4381,7,254),(4382,7,255),(4383,7,256),(4384,7,257),(4385,7,258),(4386,7,259),(4387,7,260),(4388,7,261),(4389,7,262),(4390,7,263),(4391,7,264),(4392,7,265),(4393,7,266),(4394,7,267),(4395,7,268),(4396,7,269),(4397,7,270),(4398,7,271),(4399,7,272),(4400,7,273),(4401,7,274),(4402,7,275),(4403,7,276),(4404,7,277),(4405,7,278),(4406,7,279),(4407,7,280),(4408,7,281),(4409,7,282),(4410,7,283),(4411,7,284),(4412,7,285),(4413,7,286),(4414,7,287),(4415,7,288),(4416,7,289),(4417,7,290),(4418,7,291),(4419,7,292),(4420,7,293),(4421,7,294),(4422,7,295),(4423,7,296),(4424,7,297),(4425,7,298),(4426,7,299),(4427,7,300),(4428,7,301),(4429,7,302),(4430,7,303),(4431,7,304),(4432,7,305),(4433,7,306),(4434,7,307),(4435,7,308),(4436,7,309);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address`
--

LOCK TABLES `General_address` WRITE;
/*!40000 ALTER TABLE `General_address` DISABLE KEYS */;
INSERT INTO `General_address` VALUES (1,'AureaSocial',44,'Sardenya 261-263','Barcelona','',3,0,NULL,NULL,NULL,NULL,''),(2,'Casa del Comú',44,'pl. del Pilar','Igualada','9878',4,0,NULL,NULL,NULL,NULL,''),(3,'pis de mallorca',46,'Mallorca, 450','Barcelona','876y',3,0,NULL,NULL,NULL,NULL,''),(4,'qqqqq',45,'qqqq','qqqqqq','',1,0,NULL,NULL,NULL,NULL,''),(5,'direcion a proyecto',44,'gsg','dgsdgdsg','dgsdg',1,0,NULL,NULL,NULL,NULL,''),(6,'gsdgsdgdsg',45,'dgdsgdsg','dgsdgdsg','',1,0,NULL,NULL,NULL,NULL,''),(7,'gfdjgfdjgfdj',44,'fdgjfgjfgjgjfgjgf','fgjfgjfgjfg','45325',3,0,NULL,NULL,NULL,NULL,'vcvvbfnmfngfngb');
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
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_learn_session_assistants`
--

LOCK TABLES `Welcome_learn_session_assistants` WRITE;
/*!40000 ALTER TABLE `Welcome_learn_session_assistants` DISABLE KEYS */;
INSERT INTO `Welcome_learn_session_assistants` VALUES (260,15,4),(261,15,17),(262,15,18),(263,15,19),(265,15,55),(266,15,59),(264,15,84),(233,23,4),(236,23,55),(234,23,59),(235,23,84);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_persons`
--

LOCK TABLES `General_rel_human_persons` WRITE;
/*!40000 ALTER TABLE `General_rel_human_persons` DISABLE KEYS */;
INSERT INTO `General_rel_human_persons` VALUES (11,3,4,11),(16,17,19,7),(18,59,42,11),(19,59,19,7),(20,17,18,11),(21,67,66,11),(22,87,86,11),(23,89,88,11),(24,85,84,11),(25,96,95,11);
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
INSERT INTO `Welcome_ic_insurance` VALUES (22,54,'',NULL,NULL,NULL,NULL,NULL,4),(35,54,'',NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (29,1,1),(30,1,2),(31,1,3),(32,1,4),(33,1,5),(34,1,6),(35,1,7),(36,1,8),(1,2,1),(7,4,2),(8,4,3),(6,5,3),(24,18,2),(22,19,2),(25,20,2),(48,21,6),(27,22,4),(28,23,3),(37,24,4),(38,29,3),(39,30,3),(40,31,3),(41,32,3),(42,33,3),(43,34,3),(44,35,3),(45,36,2),(46,37,3),(56,38,6),(50,39,6),(51,40,2),(52,41,2),(59,42,4),(60,42,7),(54,43,4),(55,44,4),(61,45,2),(62,45,7),(63,46,2),(64,46,7),(65,47,3),(66,48,3),(67,49,2),(68,50,4),(69,51,3);
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
INSERT INTO `Welcome_ic_person_membership` VALUES (4,4,NULL),(19,42,NULL),(31,55,NULL),(63,18,NULL),(85,61,NULL),(87,62,NULL),(105,79,NULL),(108,81,NULL),(116,82,NULL),(118,83,NULL),(128,90,NULL),(131,91,NULL),(136,94,NULL);
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
INSERT INTO `Welcome_fee` VALUES (1,17,3,60.00,2,'2014-08-20','2014-08-20',NULL,20,NULL),(3,4,3,30.00,1,'2014-08-20','2014-08-20','2014-08-28',21,NULL),(8,4,3,30.00,1,'2014-08-20','2014-08-20','2014-08-23',20,NULL),(13,4,3,30.00,1,'2014-08-20','2014-08-20','2014-08-22',20,NULL),(14,4,3,45.00,2,'2014-08-20','2014-08-20',NULL,20,NULL),(18,42,3,30.00,6,'2014-08-22','2014-08-27',NULL,NULL,NULL),(24,17,3,30.00,6,'2014-08-25',NULL,NULL,NULL,NULL),(30,55,3,30.00,2,'2014-08-25','2014-08-30',NULL,22,56),(33,55,3,45.00,2,'2014-08-28',NULL,NULL,24,43),(47,59,3,45.00,2,NULL,NULL,NULL,20,45),(81,18,3,30.00,2,'2014-08-29',NULL,NULL,NULL,NULL),(83,60,3,60.00,5,'2014-08-29','2014-08-29',NULL,21,NULL),(84,61,3,30.00,2,'2014-08-29','2014-09-03',NULL,NULL,NULL),(86,62,3,30.00,2,'2014-09-03','2014-09-08',NULL,NULL,NULL),(88,67,3,60.00,2,'2014-09-03','2014-09-08',NULL,NULL,NULL),(104,79,3,30.00,2,'2014-09-04','2014-09-09',NULL,22,NULL),(107,81,3,30.00,2,'2014-09-04','2014-09-09','2014-09-05',23,NULL),(109,77,3,30.00,2,'2014-09-05',NULL,NULL,NULL,NULL),(115,82,3,30.00,2,'2014-09-05','2014-09-10',NULL,NULL,NULL),(117,83,3,30.00,2,'2014-09-05','2014-09-10','2014-09-05',23,NULL),(119,85,3,60.00,2,'2014-09-05','2014-09-10',NULL,NULL,NULL),(120,87,3,60.00,2,'2014-09-05','2014-09-10',NULL,24,NULL),(122,89,3,60.00,2,'2014-09-05','2014-09-10','2014-09-05',23,NULL),(127,90,3,30.00,2,'2014-09-05','2014-09-10','2014-09-05',23,NULL),(130,91,3,30.00,2,'2014-09-06','2014-09-11','2014-09-06',23,NULL),(135,94,3,30.00,2,'2014-09-06','2014-09-11','2014-09-06',23,NULL),(137,96,3,60.00,2,'2014-09-06','2014-09-11','2014-09-06',23,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_address_jobs`
--

LOCK TABLES `General_address_jobs` WRITE;
/*!40000 ALTER TABLE `General_address_jobs` DISABLE KEYS */;
INSERT INTO `General_address_jobs` VALUES (11,1,5),(12,2,1),(13,3,2),(14,3,3);
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
  `tent_type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ic_self_employed_id`),
  CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4245c133` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Welcome_ic_stallholder`
--

LOCK TABLES `Welcome_ic_stallholder` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_stallholder` DISABLE KEYS */;
INSERT INTO `Welcome_ic_stallholder` VALUES (43,'none'),(48,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$slHNJa0IUgZy$f4ALF9LBvaEx6UhRWeLsBPCa4ad8j82ZJjEooN4Yty0=','2014-09-05 22:06:02',1,'aleph','','','',1,1,'2014-08-05 17:11:11'),(2,'pbkdf2_sha256$12000$fZEAAYoFoyjl$TUPhMOR21ZR1TIFHKWwFADJDEP7IpglJN7KwoKWpKPw=','2014-08-29 11:52:28',0,'pepe','Pepe','GOTERA','rua13@percebe.vom',0,1,'2014-08-05 17:34:43'),(3,'pbkdf2_sha256$12000$uRZYWtMYE2eV$dHtqeDChoLdhES3GE8YO7HXLkK0Z2eWY/PTRqjMFwe4=','2014-08-25 13:20:41',1,'bumbum','','','bumbum@cooperativa.cat',1,1,'2014-08-06 14:26:28'),(4,'pbkdf2_sha256$12000$Lt3RQUroFJYr$bgylEsGNuOF39oRUNS6sUJYoCwGm53MS9dGg8scc5Z8=','2014-08-21 16:00:26',0,'tuccia','','','tuccia@cooperativa.cat',1,1,'2014-08-18 21:50:08'),(5,'pbkdf2_sha256$12000$nfQdLRQXVTja$Zk9u5wsHThlLUONpy0XxRwcryEB58iUFoSZUJvLkZhI=','2014-08-18 23:19:26',0,'jeto','','','jeto@jeto.jeto',0,1,'2014-08-18 23:19:04'),(18,'pbkdf2_sha256$12000$dlby1h96Aa4J$3c7LFAdLW2OHAY63cZKB35F2JKM2gbExHlpt2Bc93Fs=','2014-08-22 19:12:11',0,'seb','','','seb@seb.seb',0,1,'2014-08-22 00:21:37'),(19,'pbkdf2_sha256$12000$iRZDpdQYrs46$a7GfjP54zy6S+zJ/PBPONManrYgmma3YBbSLmXPn8HM=','2014-08-25 11:43:29',0,'duub','','','dub@dub.dub',0,1,'2014-08-25 11:43:14'),(20,'pbkdf2_sha256$12000$U4BfxLYSq6yQ$ZqVFW+jcGkfPyTK1qSrtDw7WidyZDdccTj6UXK8OCCw=','2014-08-29 12:16:02',0,'juan','','','dsgd@dasg.es',0,1,'2014-08-29 11:53:47'),(21,'pbkdf2_sha256$12000$iVWSedYoAjEB$Xcg221wBbTCXRdIovyEWoK/9OELN1Cq+zi9WGv8uVHc=','2014-09-05 02:19:32',0,'person','persdgfs','asdgsdg','ale@de.es',1,1,'2014-09-03 01:29:24'),(22,'pbkdf2_sha256$12000$Qvems3oRMbR0$hEBNe0d6Gy2qa9ym0qVrrVi8IpuflWetP2FChVC2l30=','2014-09-03 15:18:45',0,'aaa','','','dsg@dsgsd.es',0,0,'2014-09-03 15:18:45'),(23,'pbkdf2_sha256$12000$jx7DXSj0VK2e$10lwLNbQdKLtKsF/91VXNOA3v4twpHA5Q28Rl40FqIM=','2014-09-03 16:02:20',0,'gabriel','','','adgsd@adgdsf.es',0,0,'2014-09-03 16:02:20'),(24,'pbkdf2_sha256$12000$XEViAKQmHle4$gCYOs82o5lPc28SM/TB0Af/AnxwMtg9VSzSml0dCRfc=','2014-09-03 19:17:58',0,'ddd','','','dgsdg@dsg.es',0,1,'2014-09-03 19:17:57'),(29,'pbkdf2_sha256$12000$1eUsnjm6U61T$qyaFcRR1FTBCwwNRovV0O9u5UbBmsnqefYxFmbZYkhk=','2014-09-03 22:28:50',0,'dg','','','ddgsd@dsg.es',0,1,'2014-09-03 22:28:50'),(30,'pbkdf2_sha256$12000$797fPVAmdD3V$1ipnzGkKozEgbBO+qXcVjvbo84Ta6CoxbX8GA/a9QAk=','2014-09-04 01:12:45',0,'drago','','','adgsd@gd.es',0,1,'2014-09-04 00:17:22'),(31,'pbkdf2_sha256$12000$2sqoOFFp9PSj$8ZjRuw3l/mGGg1ZHqMEFmU8RI+5PQXPfbEsohPXl2vg=','2014-09-04 01:15:21',0,'wwwww','','','wwwww@sss.ws',0,1,'2014-09-04 01:15:20'),(32,'pbkdf2_sha256$12000$532rA0gak6Zi$WAxrsCdjQB69EbA5HupwcxoiYhqghx2qm39GIAHjpMM=','2014-09-04 01:38:17',0,'jia','','','jdsg@dsg.es',0,1,'2014-09-04 01:38:17'),(33,'pbkdf2_sha256$12000$HhUcwiMk056Q$nlDN7w1tfB+DP/8sTL0yWNH2DLoEXK9xqCgWvAHeXCA=','2014-09-04 03:00:16',0,'qwert','','','quert@teclados.es',0,1,'2014-09-04 03:00:16'),(34,'pbkdf2_sha256$12000$WogruXgaLhVW$CLYhYwX7qi2pis0F0SsCDALp5pQyQ6yiHby8TT2CKRk=','2014-09-05 14:49:59',0,'miki','','','dgsd@gdsg.es',0,1,'2014-09-04 03:12:37'),(35,'pbkdf2_sha256$12000$jfsdm9j69jtD$3ANgxube3VJVSiq67YNpMa3PAslcTXc/QBEC/uVkXqs=','2014-09-04 07:06:36',0,'juanillo','','','fgsf@fdg.es',0,1,'2014-09-04 07:06:36'),(36,'pbkdf2_sha256$12000$qNlI6OvWoBYB$rxX4rSn8T0gV6+y6shMr6bk8Fi7BJClG1KD1rDkBRHw=','2014-09-04 23:08:35',0,'la','','','la@dfg.es',0,1,'2014-09-04 15:33:07'),(37,'pbkdf2_sha256$12000$Lft8Gs2UUoZe$TZUy6Q7OZiYJ4NnSVW2LsoMmv2QejlU67Cr1Svhjjvg=','2014-09-04 21:10:54',0,'afin','','','afin@afinlandia.es',0,1,'2014-09-04 21:10:53'),(38,'pbkdf2_sha256$12000$QNRjhkCZWkXC$2sSq6Q8uu03FD9YwRpFNLjAz141Gamiq5PEhSKhm5+8=','2014-09-05 17:35:52',0,'cooper','','','cooper@dgsdg.es',1,1,'2014-09-04 21:27:45'),(39,'pbkdf2_sha256$12000$DIOdC6cA4PBl$gTVTEb7H1bhewzWFlOj4hrK6DHFTqH5kWC5ZKdyGUdo=','2014-09-05 00:30:43',0,'lolo','','','',1,1,'2014-09-05 00:10:15'),(40,'pbkdf2_sha256$12000$e0522GUI4nWW$tC915k3sH9MsN/WzA8uYscZAFbmKqD1CxdoAmlXzXyQ=','2014-09-05 02:10:17',0,'carlos','','','sdgsd2@sdgd.es',0,1,'2014-09-05 02:10:17'),(41,'pbkdf2_sha256$12000$rxTpAhFoNGzB$eawva8s5o+g3VT8yFyR+hqSei5jHZkYr9lPHfPgtdXA=','2014-09-05 02:19:50',0,'sebas','','','setasfdg@sadgd.es',0,1,'2014-09-05 02:14:34'),(42,'pbkdf2_sha256$12000$XkfKu4GsOXRi$qYNpZqb03im7Hejra445CpwCbdeF8N3KlOxY/QNrreE=','2014-09-05 22:07:41',0,'proyecto','User Aleph Ox','Nulis','sagsd2@edsggds.es',0,1,'2014-09-05 02:24:00'),(43,'pbkdf2_sha256$12000$92ObaKUdRBcO$LqmVg0twn6qiexHAIBsFPbfUwHqk08IDbiWismOoi0Q=','2014-09-05 02:39:41',0,'casa','','','fgasf@fgdfh.es',0,1,'2014-09-05 02:39:40'),(44,'pbkdf2_sha256$12000$48W1vfWPpuzn$sCfHv+skMubJGlioRWBuJ+OWfhclwtAZIqKa5E7XSSc=','2014-09-05 03:13:01',0,'swsw','','','ddffgdswqfsdd@edgsdddgd.esd',0,1,'2014-09-05 02:58:56'),(45,'pbkdf2_sha256$12000$8SRY3jb3o55J$htAV1zZKt/PtD/p31fFpergJllQ4jISYfiTBHpcjvBM=','2014-09-05 19:37:32',0,'zzzz','','','zzz@sss.es',0,1,'2014-09-05 19:37:32'),(46,'pbkdf2_sha256$12000$rc9Rg7no7PEN$ZBkZ/VVa7fWlx9EM6qDtuiKBzFt0F9oNL7boJO4jQSQ=','2014-09-06 04:45:18',0,'prueba_person','','','mail_person@person.es',0,1,'2014-09-06 04:45:18'),(47,'pbkdf2_sha256$12000$0p0jJdt8ILTB$TSNlqXzgSnZ5niEFkkUE4hvpYkT57TOgdzxY8ydxlFI=','2014-09-06 06:50:34',0,'prova_afin','','','semail@mail.es',0,1,'2014-09-06 06:50:34'),(48,'pbkdf2_sha256$12000$ndB7Q1kJhhKg$CBs2xmyUOfSgLeTlXxgBNHJxCDHDXZbkU8oEfwWj6Mg=','2014-09-06 07:13:33',0,'diablo','','','mundo@dsgsd.es',0,1,'2014-09-06 07:13:33'),(49,'pbkdf2_sha256$12000$zHnoB3r5gc5R$n6fyx8qIaHsJHef9GwmNANMNSuCu2I34r7zHavEQ3bU=','2014-09-06 07:29:56',0,'angel','','','dios@cielo.es',0,1,'2014-09-06 07:29:56'),(50,'pbkdf2_sha256$12000$70ynQEbZGTST$4HtJERVYUYOwppo4WUjBMAAOxfLa9qqh2yCx+qBxkd8=','2014-09-06 07:39:52',0,'abraxas','','','adgd@es.es',0,1,'2014-09-06 07:39:52'),(51,'pbkdf2_sha256$12000$puJeLF4Ogltt$0fFVYzIZRu6u5XLP9+0FgRnjPt4fQHOXRJz0FVkU2Vo=','2014-09-06 07:44:13',0,'afin1','','','sdgd@es.es',0,1,'2014-09-06 07:44:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_rel_human_addresses`
--

LOCK TABLES `General_rel_human_addresses` WRITE;
/*!40000 ALTER TABLE `General_rel_human_addresses` DISABLE KEYS */;
INSERT INTO `General_rel_human_addresses` VALUES (1,3,1,17,1),(2,17,2,17,1),(3,17,1,23,0),(7,18,3,25,0),(8,4,2,26,0),(9,59,3,NULL,1),(10,61,1,1,0),(11,77,4,NULL,0),(12,90,3,26,1),(13,84,5,NULL,0),(14,85,6,NULL,0),(15,91,7,NULL,1);
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

-- Dump completed on 2014-09-14 20:58:50
