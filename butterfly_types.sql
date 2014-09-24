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
-- Dumping data for table `General_material_type`
--

LOCK TABLES `General_material_type` WRITE;
/*!40000 ALTER TABLE `General_material_type` DISABLE KEYS */;
INSERT INTO `General_material_type` VALUES (55),(56),(57);
/*!40000 ALTER TABLE `General_material_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_record_type`
--

LOCK TABLES `General_record_type` WRITE;
/*!40000 ALTER TABLE `General_record_type` DISABLE KEYS */;
INSERT INTO `General_record_type` VALUES (14),(15),(16),(17),(18),(58),(59),(60),(61);
/*!40000 ALTER TABLE `General_record_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_unit_type`
--

LOCK TABLES `General_unit_type` WRITE;
/*!40000 ALTER TABLE `General_unit_type` DISABLE KEYS */;
INSERT INTO `General_unit_type` VALUES (34),(35),(36),(37),(38),(48);
/*!40000 ALTER TABLE `General_unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_unitratio`
--

LOCK TABLES `General_unitratio` WRITE;
/*!40000 ALTER TABLE `General_unitratio` DISABLE KEYS */;
INSERT INTO `General_unitratio` VALUES (3,1,5.000,5),(4,1,1.000,2),(5,6,1.000,2);
/*!40000 ALTER TABLE `General_unitratio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Welcome_ic_document_type`
--

LOCK TABLES `Welcome_ic_document_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_document_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_document_type` VALUES (13),(14),(15),(16),(27),(28);
/*!40000 ALTER TABLE `Welcome_ic_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_being_type`
--

LOCK TABLES `General_being_type` WRITE;
/*!40000 ALTER TABLE `General_being_type` DISABLE KEYS */;
INSERT INTO `General_being_type` VALUES (4),(5),(6),(13),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(64),(66);
/*!40000 ALTER TABLE `General_being_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Welcome_ic_record_type`
--

LOCK TABLES `Welcome_ic_record_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_record_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_record_type` VALUES (3),(4),(5),(6),(7),(8),(9),(10),(11),(13),(14),(15),(16),(17),(18),(19),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(41);
/*!40000 ALTER TABLE `Welcome_ic_record_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_job`
--

LOCK TABLES `General_job` WRITE;
/*!40000 ALTER TABLE `General_job` DISABLE KEYS */;
INSERT INTO `General_job` VALUES (1,'Autogestió','autogestionar','autogestionant','',NULL,1,6,1,0,''),(2,'Coordinació','coordinar','coordinant','',1,2,3,1,1,''),(3,'Desenvolupament','desenvolupar','desenvolupant','',NULL,1,2,2,0,''),(4,'Transport','transportar','transportant','',NULL,1,2,3,0,''),(5,'Facilitació CI','facilitar CI','facilitant CI','',1,4,5,1,1,'ic_facilitate'),(6,'Restauració','restaurar','restaurant','',NULL,1,2,4,0,'');
/*!40000 ALTER TABLE `General_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_artwork_type`
--

LOCK TABLES `General_artwork_type` WRITE;
/*!40000 ALTER TABLE `General_artwork_type` DISABLE KEYS */;
INSERT INTO `General_artwork_type` VALUES (9),(10),(11),(12),(14),(15),(16),(17),(18),(34),(35),(36),(37),(38),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(65);
/*!40000 ALTER TABLE `General_artwork_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_unit`
--

LOCK TABLES `General_unit` WRITE;
/*!40000 ALTER TABLE `General_unit` DISABLE KEYS */;
INSERT INTO `General_unit` VALUES (1,'EcoCoop','',35,'eco',NULL,3),(2,'Euro','',37,'€',NULL,NULL),(3,'Metre Quadrat','',38,'m2',NULL,NULL),(4,'Hectàrea','',38,'Ha',NULL,NULL),(5,'Hora','',48,'h',NULL,NULL),(6,'Riu','',35,'riu',4,17),(7,'FairCoin','',36,'FAC',6,NULL);
/*!40000 ALTER TABLE `General_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_record`
--

LOCK TABLES `General_record` WRITE;
/*!40000 ALTER TABLE `General_record` DISABLE KEYS */;
INSERT INTO `General_record` VALUES (1,'(eco) CIC (Cooperativa Integral Catalana) COOP0001',NULL,16),(3,'EcoCoop * 5.000 = Hora','',58),(4,'EcoCoop * 1 = Euro','',59),(5,'Riu * 1 = Euro','',59);
/*!40000 ALTER TABLE `General_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_relation`
--

LOCK TABLES `General_relation` WRITE;
/*!40000 ALTER TABLE `General_relation` DISABLE KEYS */;
INSERT INTO `General_relation` VALUES (1,':Relació Humà - Humà','','','',NULL,1,38,1,0,'rel_hum_hum'),(2,':Relació Humà - Art','','','',NULL,1,6,2,0,'rel_hum_art'),(3,':Relació Humà - Espai','','','',NULL,1,20,3,0,'rel_hum_spac'),(4,':Relació Humà - Obra','','','',NULL,1,16,4,0,''),(5,':relació Persona - Projecte','','','',1,18,29,1,1,'rel_pers_proj'),(6,':relació Persona - Persona','','','',1,36,37,1,1,'rel_pers_pers'),(7,'participació','participar','participant','',19,7,8,1,2,''),(8,'dinamització','dinamitzar','dinamitzant','',19,5,6,1,2,''),(9,'col·laboració','col·laborar','col·laborant','',21,15,16,1,2,''),(10,'contribució/col·laboració','contribuir/col·laborar','contribuint/col·laborant','',5,21,28,1,2,'contribute'),(11,'referència','referenciar','referenciant','',19,3,4,1,2,'reference'),(12,'contribució en alguna comissió','contribuir en comissió','contribuint en comissió','',10,22,23,1,3,''),(13,'contribució puntual en tasques organitzatives','contribuir puntualment','contribuint puntualment','',10,24,25,1,3,''),(14,'contribució econòmica','contribuir econòmicament','contribuint econòmicament','',10,26,27,1,3,''),(15,':relació Projecte - Adreça','','','',3,2,9,3,1,'rel_proj_addr'),(16,'oferiment de l\'espai','oferir l\'espai','oferint l\'espai','',17,4,5,3,3,''),(17,'gestió de l\'espai','gestionar l\'espai','gestionant l\'espai','',15,3,6,3,2,''),(18,':relació Projecte - Empresa','','','',1,10,13,1,1,'rel_proj_empr'),(19,':relació Projecte - Persona','','','',1,2,9,1,1,'rel_proj_pers'),(20,'utilització','utilitzar','utilitzant','',18,11,12,1,2,''),(21,':relació Projecte - Projecte','','','',1,14,17,1,1,'rel_proj_proj'),(22,':relació Persona - Empresa','','','',1,30,35,1,1,'rel_pers_comp'),(23,'utilització d\'espai','utilitzar l\'espai','utilitzant l\'espai','',15,7,8,3,2,''),(24,':relació Persona - Adreça','','','',3,10,15,3,1,'rel_pers_addr'),(25,'habitatge a','habitar a','habitant a','',24,11,12,3,2,''),(26,'treball a','treballar a','treballant a','',24,13,14,3,2,''),(27,'seguiment','seguir','seguint','',5,19,20,1,2,''),(28,'aprenentatge','apendre','aprenent','',2,2,3,2,1,''),(29,'pràctica','practicar','practicant','',2,4,5,2,1,''),(30,':relació Humà - Registre','','','',4,2,5,4,1,'rel_hum_reco'),(31,'compra a empresa','comprar a l\'empresa','comprant a l\'empresa','',22,31,32,1,2,''),(32,'treball per empresa','treballar per l\'empresa','treballant per l\'empresa','',22,33,34,1,2,''),(33,':relació Humà - Regió','','','',3,16,19,3,1,'rel_hum_regi'),(34,'vinculació vital a','fer vida a','fent vida a','',33,17,18,3,2,''),(35,':relació Humà - obra Material','','','',4,6,9,4,1,'rel_hum_mate'),(36,'titular del registre','titular el registre','titulant el registre','',30,3,4,4,2,'holder'),(37,'pertinença','pertànyer','pertanyent','',35,7,8,4,2,''),(38,':relació Humà - obra Inmaterial','','','',4,10,15,4,1,'rel_hum_nonm'),(39,'representació','representar','representant','',38,11,12,4,2,''),(40,'oferta d\'obra inmaterial','oferir l\'obra inmaterial','oferint l\'obra inmaterial','',38,13,14,4,2,''),(41,':relació obra Material - Adreça','','','',46,2,5,9,1,'rel_mat_addr'),(42,'aparcament a','aparcar a','aparcant a','',41,3,4,9,2,''),(43,':relació obra Material - Registre','','','',47,2,3,10,1,'rel_mat_reco'),(44,':relació obra Material - obra Inmaterial','','','',47,6,7,10,1,'rel_mat_nonm'),(45,':relació obra Material - obra Material','','','',47,4,5,10,1,'rel_mat_mate'),(46,':Relació Obra - Espai','','','',NULL,1,8,9,0,''),(47,':Relació Obra - Obra','','','',NULL,1,12,10,0,''),(48,':Relació Obra - Art','','','',NULL,1,8,11,0,''),(49,':relació obra Material - Ofici','','','',48,2,5,11,1,'rel_mat_jobs'),(50,':relació obra Inmaterial - Adreça','','','',46,6,7,9,1,'rel_non_addr'),(51,':relació obra Inmaterial - Registre','','','',47,8,9,10,1,'rel_non_reco'),(52,':relació obra Inmaterial - Ofici','','','',48,6,7,11,1,'rel_non_jobs'),(53,':relació obra Inmaterial - obra Inmaterial','','','',47,10,11,10,1,'rel_non_nonm'),(54,'servei per','servir per','servint per','',49,3,4,11,2,'');
/*!40000 ALTER TABLE `General_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_project_type`
--

LOCK TABLES `General_project_type` WRITE;
/*!40000 ALTER TABLE `General_project_type` DISABLE KEYS */;
INSERT INTO `General_project_type` VALUES (13),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(47),(63),(66);
/*!40000 ALTER TABLE `General_project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Welcome_payment_type`
--

LOCK TABLES `Welcome_payment_type` WRITE;
/*!40000 ALTER TABLE `Welcome_payment_type` DISABLE KEYS */;
INSERT INTO `Welcome_payment_type` VALUES (20),(21),(22),(23),(24),(25),(26);
/*!40000 ALTER TABLE `Welcome_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Welcome_ic_type`
--

LOCK TABLES `Welcome_ic_type` WRITE;
/*!40000 ALTER TABLE `Welcome_ic_type` DISABLE KEYS */;
INSERT INTO `Welcome_ic_type` (`id`, `name`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, 'Registre CI', '', NULL, 1, 82, 1, 0, 'iC_Record'),
(2, 'Forma de Pagament', '', NULL, 1, 16, 2, 0, ''),
(3, 'alta Soci CI', '', 4, 3, 10, 1, 2, 'iC_Membership'),
(4, 'Alta de Membre', '', 1, 2, 17, 1, 1, ''),
(5, 'alta Proj. Autoocupat', '', 4, 11, 14, 1, 2, 'iC_Self_Employed'),
(6, 'Document CI', '', 1, 18, 31, 1, 1, 'iC_Document'),
(7, 'alta Soci Coop. Individual', '', 3, 4, 5, 1, 3, 'iC_Person_Membership'),
(8, 'alta Proj. Col·lectiu', '', 3, 6, 7, 1, 3, 'iC_Project_Membership'),
(9, 'alta Proj. Públic', '', 3, 8, 9, 1, 3, ''),
(10, 'alta Soci Afí Individual', '', 4, 15, 16, 1, 2, 'iC_Akin_Membership'),
(11, 'alta Proj. Firaire', '', 5, 12, 13, 1, 3, 'iC_Stallholder'),
(13, 'Contracte d''Adreça', '', 6, 19, 24, 1, 2, 'iC_Address_Contract'),
(14, 'Llicència d''activitat', '', 6, 25, 26, 1, 2, 'iC_Licence'),
(15, 'Assegurança soci', '', 6, 27, 28, 1, 2, 'iC_Insurance'),
(16, 'Contracte Laboral', '', 6, 29, 30, 1, 2, 'iC_Labor_Contract'),
(17, 'Quota', '', 1, 32, 67, 1, 1, 'Fee'),
(18, 'quota d''Alta', '', 17, 33, 46, 1, 2, 'join_fee'),
(19, 'quota Trimestral', '', 17, 47, 56, 1, 2, 'quarterly_fee'),
(20, 'pagament en Moneda Social', '', 26, 9, 10, 2, 2, ''),
(21, 'pagament amb Hores de Treball', '', 26, 13, 14, 2, 2, ''),
(22, 'pagament amb Criptomoneda', '', 2, 2, 3, 2, 1, ''),
(23, 'pagament en Metàl·lic', '', 26, 11, 12, 2, 2, ''),
(24, 'pagament per Transferència Bancària', '', 2, 4, 5, 2, 1, ''),
(25, 'pagament fent Ingrés al Banc', '', 2, 6, 7, 2, 1, ''),
(26, 'pagament presencial', '', 2, 8, 15, 2, 1, 'face-to-face'),
(27, 'contracte de Lloguer', '', 13, 20, 21, 1, 3, ''),
(28, 'contracte de Cessió', '', 13, 22, 23, 1, 3, ''),
(29, 'quota 1T', '', 19, 48, 49, 1, 3, ''),
(30, 'quota 2T', '', 19, 50, 51, 1, 3, ''),
(31, 'quota 3T', '', 19, 52, 53, 1, 3, ''),
(32, 'Sessió / Formació', '', 1, 68, 73, 1, 1, 'Learn_Session'),
(33, 'reg Sessió d''Acollida', '', 32, 69, 70, 1, 2, 'welcome_session'),
(34, 'reg Sessió MonedaSocial', '', 32, 71, 72, 1, 2, 'socialcoin_session'),
(35, 'quota alta Individual (Moneda Fiat)', '', 18, 34, 35, 1, 3, '(30-euro) individual'),
(36, 'quota alta Col·lectiva (Moneda Fiat)', '', 18, 36, 37, 1, 3, '(60-euro) collective'),
(37, 'quota 4T', '', 19, 54, 55, 1, 3, ''),
(38, 'Tipus parada firaire', '', 1, 74, 81, 1, 1, 'tent_type'),
(39, 'Sense carpa', '', 38, 75, 76, 1, 2, ''),
(41, 'Quota Avançada', '', 17, 57, 66, 1, 2, 'advanced_fee'),
(42, 'Carpa metall', '', 38, 77, 78, 1, 2, ''),
(43, 'Carpa fusta', '', 38, 79, 80, 1, 2, ''),
(44, 'quota Trimestral Individual (Moneda fiat)', '', 41, 58, 59, 1, 3, '(45-euro) quarterly_ind'),
(45, 'quota Trimestral Col·lectiva (Moneda social)', '', 41, 60, 61, 1, 3, '(90-euro) quarterly_col'),
(46, 'quota alta Individual (Moneda social)', '', 18, 38, 39, 1, 3, '(30-ecos)'),
(47, 'quota alta Col·lectiva (Moneda social)', '', 18, 40, 41, 1, 3, '(60-ecos)'),
(48, 'quota alta Individual (Hores Treball)', '', 18, 42, 43, 1, 3, '(6-hores)'),
(49, 'quota alta Col·lectiva (Hores Treball)', '', 18, 44, 45, 1, 3, '(12-hores)'),
(50, 'quota Trimestral Individual (Moneda social)', '', 41, 62, 63, 1, 3, '45 ecos'),
/*!40000 ALTER TABLE `Welcome_ic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_type`
--

LOCK TABLES `General_type` WRITE;
/*!40000 ALTER TABLE `General_type` DISABLE KEYS */;
INSERT INTO `General_type` VALUES (1,'Ésser','',NULL,1,48,1,0,'Being'),(2,'Espai','',NULL,1,24,2,0,'Space'),(3,'Obra','',NULL,1,60,3,0,'Artwork'),(4,'Persona','',1,2,3,1,1,'Person'),(5,'Projecte','',1,4,39,1,1,'Project'),(6,'Empresa','',1,40,47,1,1,'Company'),(7,'Adreça','',2,2,9,2,1,'Address'),(8,'Regió','',2,10,23,2,1,'Region'),(9,'Material','',3,2,9,3,1,'Material'),(10,'Inmaterial','',3,10,25,3,1,'Nonmaterial'),(11,'Registre','',3,26,45,3,1,'Record'),(12,'Unitat','',3,46,59,3,1,'Unit'),(13,'Projecte CI','',5,5,36,1,2,'ic_project'),(14,'Equivalencia d\'Unitats','',11,27,36,3,2,'UnitRatio'),(15,'Compte monetari','',11,37,44,3,2,''),(16,'compte CES','',15,38,39,3,3,'AccountCes'),(17,'compte Criptomoneda','',15,40,41,3,3,'AccountCrypto'),(18,'compte Bancari','',15,42,43,3,3,'AccountBank'),(19,'Cooperativa','',6,41,42,1,2,'cooperative'),(20,'Bancaria','',6,43,44,1,2,'bank'),(21,'Nucli d\'Autogestió Local','',23,7,8,1,4,''),(22,'Ecoxarxa','',23,9,10,1,4,'ces'),(23,'Públic','',13,6,19,1,3,'public'),(24,'Cooperativa Integral','',23,11,12,1,4,'ces'),(25,'Productiu Public','',23,13,14,1,4,''),(26,'Servei Comú','',23,15,16,1,4,''),(27,'Cooperatiu Col·lectiu','',63,31,32,1,4,''),(28,'Grup de Consum','',63,33,34,1,4,''),(29,'De Serveis','',13,20,21,1,3,''),(30,'PAIC sense facturació','',13,22,23,1,3,''),(31,'Autoocupat','',13,24,29,1,3,'selfemployed'),(32,'Autoocupat Firaire','',31,25,26,1,4,''),(33,'PAIC amb facturació','',31,27,28,1,4,''),(34,'Moneda','',12,47,54,3,2,'currency'),(35,'Moneda Social','',34,48,49,3,3,'social_currency'),(36,'Criptomoneda','',34,50,51,3,3,'crypto_currency'),(37,'Moneda Fiat','',34,52,53,3,3,'fiat_currency'),(38,'Àrea','',12,55,56,3,2,'area'),(39,'Continent','',8,11,20,2,2,''),(40,'País','',39,12,19,2,3,''),(41,'Comunitat Cultural','',40,13,18,2,4,''),(42,'Bioregió','',41,14,15,2,5,''),(43,'Comarca','',41,16,17,2,5,'region'),(44,'Espai Polivalent Col·lectiu','',7,3,4,2,2,''),(45,'Taller','',7,5,6,2,2,''),(46,'Habitatge','',7,7,8,2,2,''),(47,'Xarxa Mundial','',5,37,38,1,2,''),(48,'Temps','',12,57,58,3,2,'time_currency'),(49,'Formació','',50,12,19,3,3,''),(50,'obra Cultural','',10,11,20,3,2,''),(51,'obra Digital','',10,21,24,3,2,''),(52,'formació CI','',49,13,18,3,4,'ic_learn'),(53,'sessió de formació Col·lectiva','',52,14,15,3,5,''),(54,'sessió de formació Individual','',52,16,17,3,5,''),(55,'Màquina','',9,3,8,3,2,''),(56,'Vehicle','',55,4,7,3,3,''),(57,'Cotxe','',56,5,6,3,4,''),(58,'equivalencia Moneda - Temps','',14,28,29,3,3,''),(59,'equivalencia Moneda - Moneda','',14,30,31,3,3,''),(60,'equivalencia Àrea - Àrea','',14,32,33,3,3,''),(61,'equivalencia Temps - Temps','',14,34,35,3,3,''),(62,'Planeta','',8,21,22,2,2,''),(63,'Online','',13,30,35,1,3,'online'),(64,'Asseguradora','',6,45,46,1,2,''),(65,'Imatge digital','',51,22,23,3,3,'img'),(66,'Rebost','',23,17,18,1,4,'ic_larder');
/*!40000 ALTER TABLE `General_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_address_type`
--

LOCK TABLES `General_address_type` WRITE;
/*!40000 ALTER TABLE `General_address_type` DISABLE KEYS */;
INSERT INTO `General_address_type` VALUES (44),(45),(46);
/*!40000 ALTER TABLE `General_address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_region`
--

LOCK TABLES `General_region` WRITE;
/*!40000 ALTER TABLE `General_region` DISABLE KEYS */;
INSERT INTO `General_region` VALUES (1,'Països Catalans',40,5,'',2,9,2,1),(2,'Catalunya',41,1,'',3,8,2,2),(3,'Barcelonès',43,2,'',4,5,2,3),(4,'Anoia',43,2,'',6,7,2,3),(5,'continent europeu',39,NULL,'',1,10,2,0),(6,'planeta Terra',62,NULL,'',1,2,3,0);
/*!40000 ALTER TABLE `General_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_company_type`
--

LOCK TABLES `General_company_type` WRITE;
/*!40000 ALTER TABLE `General_company_type` DISABLE KEYS */;
INSERT INTO `General_company_type` VALUES (19),(20),(64);
/*!40000 ALTER TABLE `General_company_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_space_type`
--

LOCK TABLES `General_space_type` WRITE;
/*!40000 ALTER TABLE `General_space_type` DISABLE KEYS */;
INSERT INTO `General_space_type` VALUES (7),(8),(39),(40),(41),(42),(43),(44),(45),(46),(62);
/*!40000 ALTER TABLE `General_space_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `General_region_type`
--

LOCK TABLES `General_region_type` WRITE;
/*!40000 ALTER TABLE `General_region_type` DISABLE KEYS */;
INSERT INTO `General_region_type` VALUES (39),(40),(41),(42),(43),(62);
/*!40000 ALTER TABLE `General_region_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Volcado de datos para la tabla `General_human`
--

LOCK TABLES `General_human` WRITE;
/*!40000 ALTER TABLE `General_human` DISABLE KEYS */;
INSERT INTO `General_human` (`id`, `name`, `birth_date`, `death_date`, `nickname`, `email`, `telephone_cell`, `telephone_land`, `website`, `description`) VALUES
(1, 'Revolució Integral', NULL, NULL, 'RI', '', '', '', '', ''),
(2, 'Xarxa de Cooperatives Integrals', NULL, NULL, 'XCI', '', '', '', '', ''),
(3, 'Cooperativa Integral Catalana', NULL, NULL, 'CIC', '', '', '', '', '');
/*!40000 ALTER TABLE `General_human` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Volcado de datos para la tabla `General_project`
--

LOCK TABLES `General_project` WRITE;
/*!40000 ALTER TABLE `General_project` DISABLE KEYS */;
INSERT INTO `General_project` (`human_id`, `project_type_id`, `parent_id`, `socialweb`, `email2`, `ecommerce`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 47, NULL, '', '', 0, 1, 18, 1, 0),
(2, 47, 1, '', '', 0, 2, 13, 1, 1),
(3, 24, 2, '', '', 0, 3, 12, 1, 2);
/*!40000 ALTER TABLE `General_project` ENABLE KEYS */;
UNLOCK TABLES;

