-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 21, 2014 at 05:29 AM
-- Server version: 5.5.35
-- PHP Version: 5.4.4-14+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gestioCI_butterfly_migration`
--

-- --------------------------------------------------------

--
-- Table structure for table `General_accountbank`
--

CREATE TABLE IF NOT EXISTS `General_accountbank` (
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
  KEY `General_accountbank_b9dcc52b` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_accountces`
--

CREATE TABLE IF NOT EXISTS `General_accountces` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountces_6922ec88` (`human_id`),
  KEY `General_accountces_c096cf48` (`entity_id`),
  KEY `General_accountces_b9dcc52b` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_accountcrypto`
--

CREATE TABLE IF NOT EXISTS `General_accountcrypto` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `number` varchar(34) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountcrypto_6922ec88` (`human_id`),
  KEY `General_accountcrypto_b9dcc52b` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_address`
--

CREATE TABLE IF NOT EXISTS `General_address` (
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
  KEY `General_address_4f62c404` (`size_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `General_address`
--

INSERT INTO `General_address` (`id`, `name`, `address_type_id`, `p_address`, `town`, `postalcode`, `region_id`, `ic_larder`, `size`, `size_unit_id`, `longitude`, `latitude`, `description`) VALUES
(1, 'AureaSocial', 44, 'Sardenya 261-263', 'Barcelona', '08013', 3, 0, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `General_address_jobs`
--

CREATE TABLE IF NOT EXISTS `General_address_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_id` (`address_id`,`job_id`),
  KEY `General_address_jobs_3ac8a70a` (`address_id`),
  KEY `General_address_jobs_218f3960` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_address_type`
--

CREATE TABLE IF NOT EXISTS `General_address_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_address_type`
--

INSERT INTO `General_address_type` (`space_type_id`) VALUES
(44),
(45),
(46);

-- --------------------------------------------------------

--
-- Table structure for table `General_artwork_type`
--

CREATE TABLE IF NOT EXISTS `General_artwork_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_artwork_type`
--

INSERT INTO `General_artwork_type` (`typ_id`) VALUES
(9),
(10),
(11),
(12),
(14),
(15),
(16),
(17),
(18),
(34),
(35),
(36),
(37),
(38),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(65);

-- --------------------------------------------------------

--
-- Table structure for table `General_asset`
--

CREATE TABLE IF NOT EXISTS `General_asset` (
  `material_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `reciprocity` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `General_asset_6922ec88` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_being_type`
--

CREATE TABLE IF NOT EXISTS `General_being_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_being_type`
--

INSERT INTO `General_being_type` (`typ_id`) VALUES
(4),
(5),
(6),
(13),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(47),
(63),
(64),
(66);

-- --------------------------------------------------------

--
-- Table structure for table `General_company`
--

CREATE TABLE IF NOT EXISTS `General_company` (
  `human_id` int(11) NOT NULL,
  `company_type_id` int(11) DEFAULT NULL,
  `legal_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`human_id`),
  KEY `General_company_a3c9d75e` (`company_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_company_type`
--

CREATE TABLE IF NOT EXISTS `General_company_type` (
  `being_type_id` int(11) NOT NULL,
  PRIMARY KEY (`being_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_company_type`
--

INSERT INTO `General_company_type` (`being_type_id`) VALUES
(19),
(20),
(64);

-- --------------------------------------------------------

--
-- Table structure for table `General_human`
--

CREATE TABLE IF NOT EXISTS `General_human` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `General_human`
--

INSERT INTO `General_human` (`id`, `name`, `birth_date`, `death_date`, `nickname`, `email`, `telephone_cell`, `telephone_land`, `website`, `description`) VALUES
(1, 'Revolució Integral', NULL, NULL, 'RI', '', '', '', '', ''),
(2, 'Xarxa de Cooperatives Integrals', NULL, NULL, 'XCI', '', '', '', '', ''),
(3, 'Cooperativa Integral Catalana', NULL, NULL, 'CIC', '', '', '', '', ''),
(4, 'testPerson', NULL, NULL, '', 'tes@tes.tes', '34876592', '', '', 'wadhjbvñascv'),
(5, 'testProj', NULL, NULL, '', 'tes@tes.tes', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `General_image`
--

CREATE TABLE IF NOT EXISTS `General_image` (
  `nonmaterial_id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`nonmaterial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `General_job`
--

CREATE TABLE IF NOT EXISTS `General_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `verb` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gerund` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
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
  KEY `General_job_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `General_job`
--

INSERT INTO `General_job` (`id`, `name`, `verb`, `gerund`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, 'Autogestió', 'autogestionar', 'autogestionant', '', NULL, 1, 6, 1, 0, ''),
(2, 'Coordinació', 'coordinar', 'coordinant', '', 1, 2, 3, 1, 1, ''),
(3, 'Desenvolupament', 'desenvolupar', 'desenvolupant', '', NULL, 1, 2, 2, 0, ''),
(4, 'Transport', 'transportar', 'transportant', '', NULL, 1, 2, 3, 0, ''),
(5, 'Facilitació CI', 'facilitar CI', 'facilitant CI', '', 1, 4, 5, 1, 1, 'ic_facilitate'),
(6, 'Restauració', 'restaurar', 'restaurant', '', NULL, 1, 2, 4, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `General_material`
--

CREATE TABLE IF NOT EXISTS `General_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `material_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_material_6965c408` (`material_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_material_type`
--

CREATE TABLE IF NOT EXISTS `General_material_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_material_type`
--

INSERT INTO `General_material_type` (`artwork_type_id`) VALUES
(55),
(56),
(57);

-- --------------------------------------------------------

--
-- Table structure for table `General_nonmaterial`
--

CREATE TABLE IF NOT EXISTS `General_nonmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `nonmaterial_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_nonmaterial_d40a8f00` (`nonmaterial_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `General_nonmaterial`
--

INSERT INTO `General_nonmaterial` (`id`, `name`, `description`, `nonmaterial_type_id`) VALUES
(1, 'acollida Autoocupats', '', 53),
(2, 'formació Moneda Social', '', 53);

-- --------------------------------------------------------

--
-- Table structure for table `General_nonmaterial_type`
--

CREATE TABLE IF NOT EXISTS `General_nonmaterial_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_nonmaterial_type`
--

INSERT INTO `General_nonmaterial_type` (`artwork_type_id`) VALUES
(49),
(50),
(51),
(52),
(53),
(54),
(65);

-- --------------------------------------------------------

--
-- Table structure for table `General_person`
--

CREATE TABLE IF NOT EXISTS `General_person` (
  `human_id` int(11) NOT NULL,
  `surnames` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_card` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `email2` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `nickname2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_person`
--

INSERT INTO `General_person` (`human_id`, `surnames`, `id_card`, `email2`, `nickname2`) VALUES
(4, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `General_project`
--

CREATE TABLE IF NOT EXISTS `General_project` (
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
  KEY `General_project_410d0aac` (`parent_id`),
  KEY `General_project_329f6fb3` (`lft`),
  KEY `General_project_e763210f` (`rght`),
  KEY `General_project_ba470c4a` (`tree_id`),
  KEY `General_project_20e079f4` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_project`
--

INSERT INTO `General_project` (`human_id`, `project_type_id`, `parent_id`, `socialweb`, `email2`, `ecommerce`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 47, NULL, '', '', 0, 1, 20, 1, 0),
(2, 47, 1, '', '', 0, 2, 15, 1, 1),
(3, 24, 2, '', '', 0, 3, 14, 1, 2),
(5, 27, 3, '', '', 0, 12, 13, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `General_project_type`
--

CREATE TABLE IF NOT EXISTS `General_project_type` (
  `being_type_id` int(11) NOT NULL,
  PRIMARY KEY (`being_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_project_type`
--

INSERT INTO `General_project_type` (`being_type_id`) VALUES
(13),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(47),
(63),
(66);

-- --------------------------------------------------------

--
-- Table structure for table `General_record`
--

CREATE TABLE IF NOT EXISTS `General_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_record_ac580b38` (`record_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `General_record`
--

INSERT INTO `General_record` (`id`, `name`, `description`, `record_type_id`) VALUES
(1, '(eco) CIC (Cooperativa Integral Catalana) COOP0001', NULL, 16),
(3, 'EcoCoop * 5.000 = Hora', '', 58),
(4, 'EcoCoop * 1 = Euro', '', 59),
(5, 'Riu * 1 = Euro', '', 59);

-- --------------------------------------------------------

--
-- Table structure for table `General_record_type`
--

CREATE TABLE IF NOT EXISTS `General_record_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_record_type`
--

INSERT INTO `General_record_type` (`artwork_type_id`) VALUES
(14),
(15),
(16),
(17),
(18),
(58),
(59),
(60),
(61);

-- --------------------------------------------------------

--
-- Table structure for table `General_region`
--

CREATE TABLE IF NOT EXISTS `General_region` (
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
  KEY `General_region_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `General_region`
--

INSERT INTO `General_region` (`id`, `name`, `region_type_id`, `parent_id`, `description`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 'Països Catalans', 40, 5, '', 2, 9, 2, 1),
(2, 'Catalunya', 41, 1, '', 3, 8, 2, 2),
(3, 'Barcelonès', 43, 2, '', 4, 5, 2, 3),
(4, 'Anoia', 43, 2, '', 6, 7, 2, 3),
(5, 'continent europeu', 39, NULL, '', 1, 10, 2, 0),
(6, 'planeta Terra', 62, NULL, '', 1, 2, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `General_region_type`
--

CREATE TABLE IF NOT EXISTS `General_region_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_region_type`
--

INSERT INTO `General_region_type` (`space_type_id`) VALUES
(39),
(40),
(41),
(42),
(43),
(62);

-- --------------------------------------------------------

--
-- Table structure for table `General_relation`
--

CREATE TABLE IF NOT EXISTS `General_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `verb` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gerund` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
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
  KEY `General_relation_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=55 ;

--
-- Dumping data for table `General_relation`
--

INSERT INTO `General_relation` (`id`, `name`, `verb`, `gerund`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, ':Relació Humà - Humà', '', '', '', NULL, 1, 38, 1, 0, 'rel_hum_hum'),
(2, ':Relació Humà - Art', '', '', '', NULL, 1, 6, 2, 0, 'rel_hum_art'),
(3, ':Relació Humà - Espai', '', '', '', NULL, 1, 20, 3, 0, 'rel_hum_spac'),
(4, ':Relació Humà - Obra', '', '', '', NULL, 1, 16, 4, 0, ''),
(5, ':relació Persona - Projecte', '', '', '', 1, 18, 29, 1, 1, 'rel_pers_proj'),
(6, ':relació Persona - Persona', '', '', '', 1, 36, 37, 1, 1, 'rel_pers_pers'),
(7, 'participació', 'participar', 'participant', '', 19, 7, 8, 1, 2, ''),
(8, 'dinamització', 'dinamitzar', 'dinamitzant', '', 19, 5, 6, 1, 2, ''),
(9, 'col·laboració', 'col·laborar', 'col·laborant', '', 21, 15, 16, 1, 2, ''),
(10, 'contribució/col·laboració', 'contribuir/col·laborar', 'contribuint/col·laborant', '', 5, 21, 28, 1, 2, 'contribute'),
(11, 'referència', 'referenciar', 'referenciant', '', 19, 3, 4, 1, 2, 'reference'),
(12, 'contribució en alguna comissió', 'contribuir en comissió', 'contribuint en comissió', '', 10, 22, 23, 1, 3, ''),
(13, 'contribució puntual en tasques organitzatives', 'contribuir puntualment', 'contribuint puntualment', '', 10, 24, 25, 1, 3, ''),
(14, 'contribució econòmica', 'contribuir econòmicament', 'contribuint econòmicament', '', 10, 26, 27, 1, 3, ''),
(15, ':relació Projecte - Adreça', '', '', '', 3, 2, 9, 3, 1, 'rel_proj_addr'),
(16, 'oferiment de l''espai', 'oferir l''espai', 'oferint l''espai', '', 17, 4, 5, 3, 3, ''),
(17, 'gestió de l''espai', 'gestionar l''espai', 'gestionant l''espai', '', 15, 3, 6, 3, 2, ''),
(18, ':relació Projecte - Empresa', '', '', '', 1, 10, 13, 1, 1, 'rel_proj_empr'),
(19, ':relació Projecte - Persona', '', '', '', 1, 2, 9, 1, 1, 'rel_proj_pers'),
(20, 'utilització', 'utilitzar', 'utilitzant', '', 18, 11, 12, 1, 2, ''),
(21, ':relació Projecte - Projecte', '', '', '', 1, 14, 17, 1, 1, 'rel_proj_proj'),
(22, ':relació Persona - Empresa', '', '', '', 1, 30, 35, 1, 1, 'rel_pers_comp'),
(23, 'utilització d''espai', 'utilitzar l''espai', 'utilitzant l''espai', '', 15, 7, 8, 3, 2, ''),
(24, ':relació Persona - Adreça', '', '', '', 3, 10, 15, 3, 1, 'rel_pers_addr'),
(25, 'habitatge a', 'habitar a', 'habitant a', '', 24, 11, 12, 3, 2, ''),
(26, 'treball a', 'treballar a', 'treballant a', '', 24, 13, 14, 3, 2, ''),
(27, 'seguiment', 'seguir', 'seguint', '', 5, 19, 20, 1, 2, ''),
(28, 'aprenentatge', 'apendre', 'aprenent', '', 2, 2, 3, 2, 1, ''),
(29, 'pràctica', 'practicar', 'practicant', '', 2, 4, 5, 2, 1, ''),
(30, ':relació Humà - Registre', '', '', '', 4, 2, 5, 4, 1, 'rel_hum_reco'),
(31, 'compra a empresa', 'comprar a l''empresa', 'comprant a l''empresa', '', 22, 31, 32, 1, 2, ''),
(32, 'treball per empresa', 'treballar per l''empresa', 'treballant per l''empresa', '', 22, 33, 34, 1, 2, ''),
(33, ':relació Humà - Regió', '', '', '', 3, 16, 19, 3, 1, 'rel_hum_regi'),
(34, 'vinculació vital a', 'fer vida a', 'fent vida a', '', 33, 17, 18, 3, 2, ''),
(35, ':relació Humà - obra Material', '', '', '', 4, 6, 9, 4, 1, 'rel_hum_mate'),
(36, 'titular del registre', 'titular el registre', 'titulant el registre', '', 30, 3, 4, 4, 2, 'holder'),
(37, 'pertinença', 'pertànyer', 'pertanyent', '', 35, 7, 8, 4, 2, ''),
(38, ':relació Humà - obra Inmaterial', '', '', '', 4, 10, 15, 4, 1, 'rel_hum_nonm'),
(39, 'representació', 'representar', 'representant', '', 38, 11, 12, 4, 2, ''),
(40, 'oferta d''obra inmaterial', 'oferir l''obra inmaterial', 'oferint l''obra inmaterial', '', 38, 13, 14, 4, 2, ''),
(41, ':relació obra Material - Adreça', '', '', '', 46, 2, 5, 9, 1, 'rel_mat_addr'),
(42, 'aparcament a', 'aparcar a', 'aparcant a', '', 41, 3, 4, 9, 2, ''),
(43, ':relació obra Material - Registre', '', '', '', 47, 2, 3, 10, 1, 'rel_mat_reco'),
(44, ':relació obra Material - obra Inmaterial', '', '', '', 47, 6, 7, 10, 1, 'rel_mat_nonm'),
(45, ':relació obra Material - obra Material', '', '', '', 47, 4, 5, 10, 1, 'rel_mat_mate'),
(46, ':Relació Obra - Espai', '', '', '', NULL, 1, 8, 9, 0, ''),
(47, ':Relació Obra - Obra', '', '', '', NULL, 1, 12, 10, 0, ''),
(48, ':Relació Obra - Art', '', '', '', NULL, 1, 8, 11, 0, ''),
(49, ':relació obra Material - Ofici', '', '', '', 48, 2, 5, 11, 1, 'rel_mat_jobs'),
(50, ':relació obra Inmaterial - Adreça', '', '', '', 46, 6, 7, 9, 1, 'rel_non_addr'),
(51, ':relació obra Inmaterial - Registre', '', '', '', 47, 8, 9, 10, 1, 'rel_non_reco'),
(52, ':relació obra Inmaterial - Ofici', '', '', '', 48, 6, 7, 11, 1, 'rel_non_jobs'),
(53, ':relació obra Inmaterial - obra Inmaterial', '', '', '', 47, 10, 11, 10, 1, 'rel_non_nonm'),
(54, 'servei per', 'servir per', 'servint per', '', 49, 3, 4, 11, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_addresses`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `main_address` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_addresses_6922ec88` (`human_id`),
  KEY `General_rel_human_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_human_addresses_d525a588` (`relation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `General_rel_human_addresses`
--

INSERT INTO `General_rel_human_addresses` (`id`, `human_id`, `address_id`, `relation_id`, `main_address`) VALUES
(1, 4, 1, 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_companies`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_companies_6922ec88` (`human_id`),
  KEY `General_rel_human_companies_0316dde1` (`company_id`),
  KEY `General_rel_human_companies_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_jobs`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_jobs_6922ec88` (`human_id`),
  KEY `General_rel_human_jobs_218f3960` (`job_id`),
  KEY `General_rel_human_jobs_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_materials`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_materials_6922ec88` (`human_id`),
  KEY `General_rel_human_materials_f6ab4be3` (`material_id`),
  KEY `General_rel_human_materials_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_nonmaterials`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_nonmaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_nonmaterials_6922ec88` (`human_id`),
  KEY `General_rel_human_nonmaterials_c510079f` (`nonmaterial_id`),
  KEY `General_rel_human_nonmaterials_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_persons`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_persons_6922ec88` (`human_id`),
  KEY `General_rel_human_persons_16f39487` (`person_id`),
  KEY `General_rel_human_persons_d525a588` (`relation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `General_rel_human_persons`
--

INSERT INTO `General_rel_human_persons` (`id`, `human_id`, `person_id`, `relation_id`) VALUES
(1, 5, 4, 11);

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_projects`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_projects_6922ec88` (`human_id`),
  KEY `General_rel_human_projects_37952554` (`project_id`),
  KEY `General_rel_human_projects_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_records`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_records_6922ec88` (`human_id`),
  KEY `General_rel_human_records_52103e4c` (`record_id`),
  KEY `General_rel_human_records_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_human_regions`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_regions_6922ec88` (`human_id`),
  KEY `General_rel_human_regions_55a4ce96` (`region_id`),
  KEY `General_rel_human_regions_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_material_addresses`
--

CREATE TABLE IF NOT EXISTS `General_rel_material_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_addresses_f6ab4be3` (`material_id`),
  KEY `General_rel_material_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_material_addresses_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_material_jobs`
--

CREATE TABLE IF NOT EXISTS `General_rel_material_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_jobs_f6ab4be3` (`material_id`),
  KEY `General_rel_material_jobs_218f3960` (`job_id`),
  KEY `General_rel_material_jobs_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_material_materials`
--

CREATE TABLE IF NOT EXISTS `General_rel_material_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `material2_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_materials_f6ab4be3` (`material_id`),
  KEY `General_rel_material_materials_f9e9200e` (`material2_id`),
  KEY `General_rel_material_materials_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_material_nonmaterials`
--

CREATE TABLE IF NOT EXISTS `General_rel_material_nonmaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_nonmaterials_f6ab4be3` (`material_id`),
  KEY `General_rel_material_nonmaterials_c510079f` (`nonmaterial_id`),
  KEY `General_rel_material_nonmaterials_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_material_records`
--

CREATE TABLE IF NOT EXISTS `General_rel_material_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_material_records_f6ab4be3` (`material_id`),
  KEY `General_rel_material_records_52103e4c` (`record_id`),
  KEY `General_rel_material_records_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_nonmaterial_addresses`
--

CREATE TABLE IF NOT EXISTS `General_rel_nonmaterial_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_addresses_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_nonmaterial_addresses_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_nonmaterial_jobs`
--

CREATE TABLE IF NOT EXISTS `General_rel_nonmaterial_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_jobs_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_jobs_218f3960` (`job_id`),
  KEY `General_rel_nonmaterial_jobs_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_nonmaterial_nonmaterials`
--

CREATE TABLE IF NOT EXISTS `General_rel_nonmaterial_nonmaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `nonmaterial2_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_nonmaterials_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_nonmaterials_e0d4901c` (`nonmaterial2_id`),
  KEY `General_rel_nonmaterial_nonmaterials_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_rel_nonmaterial_records`
--

CREATE TABLE IF NOT EXISTS `General_rel_nonmaterial_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonmaterial_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_nonmaterial_records_c510079f` (`nonmaterial_id`),
  KEY `General_rel_nonmaterial_records_52103e4c` (`record_id`),
  KEY `General_rel_nonmaterial_records_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `General_space_type`
--

CREATE TABLE IF NOT EXISTS `General_space_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_space_type`
--

INSERT INTO `General_space_type` (`typ_id`) VALUES
(7),
(8),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(62);

-- --------------------------------------------------------

--
-- Table structure for table `General_type`
--

CREATE TABLE IF NOT EXISTS `General_type` (
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
  KEY `General_type_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=67 ;

--
-- Dumping data for table `General_type`
--

INSERT INTO `General_type` (`id`, `name`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, 'Ésser', '', NULL, 1, 48, 1, 0, 'Being'),
(2, 'Espai', '', NULL, 1, 24, 2, 0, 'Space'),
(3, 'Obra', '', NULL, 1, 60, 3, 0, 'Artwork'),
(4, 'Persona', '', 1, 2, 3, 1, 1, 'Person'),
(5, 'Projecte', '', 1, 4, 39, 1, 1, 'Project'),
(6, 'Empresa', '', 1, 40, 47, 1, 1, 'Company'),
(7, 'Adreça', '', 2, 2, 9, 2, 1, 'Address'),
(8, 'Regió', '', 2, 10, 23, 2, 1, 'Region'),
(9, 'Material', '', 3, 2, 9, 3, 1, 'Material'),
(10, 'Inmaterial', '', 3, 10, 25, 3, 1, 'Nonmaterial'),
(11, 'Registre', '', 3, 26, 45, 3, 1, 'Record'),
(12, 'Unitat', '', 3, 46, 59, 3, 1, 'Unit'),
(13, 'Projecte CI', '', 5, 5, 36, 1, 2, 'ic_project'),
(14, 'Equivalencia d''Unitats', '', 11, 27, 36, 3, 2, 'UnitRatio'),
(15, 'Compte monetari', '', 11, 37, 44, 3, 2, ''),
(16, 'compte CES', '', 15, 38, 39, 3, 3, 'AccountCes'),
(17, 'compte Criptomoneda', '', 15, 40, 41, 3, 3, 'AccountCrypto'),
(18, 'compte Bancari', '', 15, 42, 43, 3, 3, 'AccountBank'),
(19, 'Cooperativa', '', 6, 41, 42, 1, 2, 'cooperative'),
(20, 'Bancaria', '', 6, 43, 44, 1, 2, 'bank'),
(21, 'Nucli d''Autogestió Local', '', 23, 7, 8, 1, 4, ''),
(22, 'Ecoxarxa', '', 23, 9, 10, 1, 4, 'ces'),
(23, 'Públic', '', 13, 6, 19, 1, 3, 'public'),
(24, 'Cooperativa Integral', '', 23, 11, 12, 1, 4, 'ces'),
(25, 'Productiu Public', '', 23, 13, 14, 1, 4, ''),
(26, 'Servei Comú', '', 23, 15, 16, 1, 4, ''),
(27, 'Cooperatiu Col·lectiu', '', 63, 31, 32, 1, 4, ''),
(28, 'Grup de Consum', '', 63, 33, 34, 1, 4, ''),
(29, 'De Serveis', '', 13, 20, 21, 1, 3, ''),
(30, 'PAIC sense facturació', '', 13, 22, 23, 1, 3, ''),
(31, 'Autoocupat', '', 13, 24, 29, 1, 3, 'selfemployed'),
(32, 'Autoocupat Firaire', '', 31, 25, 26, 1, 4, ''),
(33, 'PAIC amb facturació', '', 31, 27, 28, 1, 4, ''),
(34, 'Moneda', '', 12, 47, 54, 3, 2, 'currency'),
(35, 'Moneda Social', '', 34, 48, 49, 3, 3, 'social_currency'),
(36, 'Criptomoneda', '', 34, 50, 51, 3, 3, 'crypto_currency'),
(37, 'Moneda Fiat', '', 34, 52, 53, 3, 3, 'fiat_currency'),
(38, 'Àrea', '', 12, 55, 56, 3, 2, 'area'),
(39, 'Continent', '', 8, 11, 20, 2, 2, ''),
(40, 'País', '', 39, 12, 13, 2, 3, ''),
(41, 'Comunitat Cultural', '', 39, 14, 19, 2, 3, ''),
(42, 'Bioregió', '', 41, 15, 16, 2, 4, ''),
(43, 'Comarca', '', 41, 17, 18, 2, 4, 'region'),
(44, 'Espai Polivalent Col·lectiu', '', 7, 3, 4, 2, 2, ''),
(45, 'Taller', '', 7, 5, 6, 2, 2, ''),
(46, 'Habitatge', '', 7, 7, 8, 2, 2, ''),
(47, 'Xarxa Mundial', '', 5, 37, 38, 1, 2, ''),
(48, 'Temps', '', 12, 57, 58, 3, 2, 'time_currency'),
(49, 'Formació', '', 50, 12, 19, 3, 3, ''),
(50, 'obra Cultural', '', 10, 11, 20, 3, 2, ''),
(51, 'obra Digital', '', 10, 21, 24, 3, 2, ''),
(52, 'formació CI', '', 49, 13, 18, 3, 4, 'ic_learn'),
(53, 'sessió de formació Col·lectiva', '', 52, 14, 15, 3, 5, ''),
(54, 'sessió de formació Individual', '', 52, 16, 17, 3, 5, ''),
(55, 'Màquina', '', 9, 3, 8, 3, 2, ''),
(56, 'Vehicle', '', 55, 4, 7, 3, 3, ''),
(57, 'Cotxe', '', 56, 5, 6, 3, 4, ''),
(58, 'equivalencia Moneda - Temps', '', 14, 28, 29, 3, 3, ''),
(59, 'equivalencia Moneda - Moneda', '', 14, 30, 31, 3, 3, ''),
(60, 'equivalencia Àrea - Àrea', '', 14, 32, 33, 3, 3, ''),
(61, 'equivalencia Temps - Temps', '', 14, 34, 35, 3, 3, ''),
(62, 'Planeta', '', 8, 21, 22, 2, 2, ''),
(63, 'Online', '', 13, 30, 35, 1, 3, 'online'),
(64, 'Asseguradora', '', 6, 45, 46, 1, 2, ''),
(65, 'Imatge digital', '', 51, 22, 23, 3, 3, 'img'),
(66, 'Rebost', '', 23, 17, 18, 1, 4, 'ic_larder');

-- --------------------------------------------------------

--
-- Table structure for table `General_unit`
--

CREATE TABLE IF NOT EXISTS `General_unit` (
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
  KEY `General_unit_6922ec88` (`human_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `General_unit`
--

INSERT INTO `General_unit` (`id`, `name`, `description`, `unit_type_id`, `code`, `region_id`, `human_id`) VALUES
(1, 'EcoCoop', '', 35, 'eco', NULL, 3),
(2, 'Euro', '', 37, '€', NULL, NULL),
(3, 'Metre Quadrat', '', 38, 'm2', NULL, NULL),
(4, 'Hectàrea', '', 38, 'Ha', NULL, NULL),
(5, 'Hora', '', 48, 'h', NULL, NULL),
(6, 'Riu', '', 35, 'riu', 4, 17),
(7, 'FairCoin', '', 36, 'FAC', 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `General_unitratio`
--

CREATE TABLE IF NOT EXISTS `General_unitratio` (
  `record_id` int(11) NOT NULL,
  `in_unit_id` int(11) NOT NULL,
  `rate` decimal(6,3) NOT NULL,
  `out_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_unitratio_49ac93b0` (`in_unit_id`),
  KEY `General_unitratio_17576a54` (`out_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_unitratio`
--

INSERT INTO `General_unitratio` (`record_id`, `in_unit_id`, `rate`, `out_unit_id`) VALUES
(3, 1, 5.000, 5),
(4, 1, 1.000, 2),
(5, 6, 1.000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `General_unit_type`
--

CREATE TABLE IF NOT EXISTS `General_unit_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `General_unit_type`
--

INSERT INTO `General_unit_type` (`artwork_type_id`) VALUES
(34),
(35),
(36),
(37),
(38),
(48);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_fee`
--

CREATE TABLE IF NOT EXISTS `Welcome_fee` (
  `ic_record_id` int(11) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `human_id` int(11) NOT NULL,
  `payment_type_id` int(11),
  `project_id` int(11) NOT NULL,
  `rel_account_id` int(11),
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_fee_90062ed5` (`human_id`),
  KEY `Welcome_fee_1e6d9cc6` (`payment_type_id`),
  KEY `Welcome_fee_b098ad43` (`project_id`),
  KEY `Welcome_fee_bf2fbab7` (`rel_account_id`),
  KEY `Welcome_fee_e8175980` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_address_contract`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_address_contract` (
  `ic_document_id` int(11) NOT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `price_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_address_contract_ea8e5d12` (`address_id`),
  KEY `Welcome_ic_address_contract_447d3092` (`company_id`),
  KEY `Welcome_ic_address_contract_d6444479` (`price_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_akin_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_akin_membership` (
  `ic_record_id` int(11) NOT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ic_company_id` int(11) DEFAULT NULL,
  `ic_membership_id` int(11),
  `ic_project_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  UNIQUE KEY `person_id` (`person_id`),
  KEY `Welcome_ic_akin_membership_20989c5f` (`ic_company_id`),
  KEY `Welcome_ic_akin_membership_33190435` (`ic_membership_id`),
  KEY `Welcome_ic_akin_membership_6abec7f6` (`ic_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_document`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_document` (
  `ic_record_id` int(11) NOT NULL,
  `doc_file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_type_id` int(11),
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_document_5dcf63f2` (`doc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Welcome_ic_document`
--

INSERT INTO `Welcome_ic_document` (`ic_record_id`, `doc_file`, `doc_type_id`) VALUES
(7, '', 14);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_document_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_document_type` (
  `record_type_id` int(11) NOT NULL,
  PRIMARY KEY (`record_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Welcome_ic_document_type`
--

INSERT INTO `Welcome_ic_document_type` (`record_type_id`) VALUES
(13),
(14),
(15),
(16),
(27),
(28);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_insurance`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_insurance` (
  `ic_document_id` int(11) NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(13,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `price_unit_id` int(11) DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_insurance_447d3092` (`company_id`),
  KEY `Welcome_ic_insurance_d6444479` (`price_unit_id`),
  KEY `Welcome_ic_insurance_6afea050` (`rel_address_id`),
  KEY `Welcome_ic_insurance_15eb022c` (`rel_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_labor_contract`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_labor_contract` (
  `ic_document_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `company_id` int(11),
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_labor_contract_447d3092` (`company_id`),
  KEY `Welcome_ic_labor_contract_a8452ca7` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_labor_contract_rel_fees`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_labor_contract_rel_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_labor_contract_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_labor_contract_id` (`ic_labor_contract_id`,`fee_id`),
  KEY `Welcome_ic_labor_contract_rel_fees_614a7171` (`ic_labor_contract_id`),
  KEY `Welcome_ic_labor_contract_rel_fees_30792835` (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_licence`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_licence` (
  `ic_document_id` int(11) NOT NULL,
  `number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_licence_6afea050` (`rel_address_id`),
  KEY `Welcome_ic_licence_15eb022c` (`rel_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Welcome_ic_licence`
--

INSERT INTO `Welcome_ic_licence` (`ic_document_id`, `number`, `start_date`, `end_date`, `rel_address_id`, `rel_job_id`) VALUES
(7, 's456g356', '2014-09-21', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_membership` (
  `ic_record_id` int(11) NOT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ic_CESnum` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `virtual_market` tinyint(1) NOT NULL,
  `contribution_id` int(11),
  `human_id` int(11) NOT NULL,
  `ic_company_id` int(11),
  `ic_project_id` int(11) NOT NULL,
  `join_fee_id` int(11),
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_membership_75f16bd4` (`contribution_id`),
  KEY `Welcome_ic_membership_90062ed5` (`human_id`),
  KEY `Welcome_ic_membership_20989c5f` (`ic_company_id`),
  KEY `Welcome_ic_membership_6abec7f6` (`ic_project_id`),
  KEY `Welcome_ic_membership_11b4ebf4` (`join_fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_membership_expositors`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_membership_expositors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_membership_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_membership_id` (`ic_membership_id`,`address_id`),
  KEY `Welcome_ic_membership_expositors_33190435` (`ic_membership_id`),
  KEY `Welcome_ic_membership_expositors_ea8e5d12` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_person_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_person_membership` (
  `ic_membership_id` int(11) NOT NULL,
  `labor_contract_id` int(11),
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_membership_id`),
  UNIQUE KEY `labor_contract_id` (`labor_contract_id`),
  KEY `Welcome_ic_person_membership_a8452ca7` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_project_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_project_membership` (
  `ic_membership_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_membership_id`),
  KEY `Welcome_ic_project_membership_b098ad43` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_record`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `record_type_id` int(11),
  PRIMARY KEY (`id`),
  KEY `Welcome_ic_record_6c31fb9d` (`record_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `Welcome_ic_record`
--

INSERT INTO `Welcome_ic_record` (`id`, `name`, `description`, `record_type_id`) VALUES
(2, 'acollida Autoocupats: 2014-09-21 (??) AureaSocial', '', 33),
(7, 'Llicència d''activitat: ?? s456g356', '', NULL),
(19, 'formació Moneda Social: 2014-09-21 (??) AureaSocial', '', 34);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_record_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_record_type` (
  `ic_type_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Welcome_ic_record_type`
--

INSERT INTO `Welcome_ic_record_type` (`ic_type_id`) VALUES
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(41);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_self_employed`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed` (
  `ic_record_id` int(11) NOT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `organic` tinyint(1) NOT NULL,
  `assigned_vat` decimal(4,2) DEFAULT NULL,
  `review_vat` tinyint(1) NOT NULL,
  `last_review_date` date DEFAULT NULL,
  `mentor_comment` longtext COLLATE utf8_unicode_ci,
  `extra_days` int(11) NOT NULL,
  `ic_membership_id` int(11) NOT NULL,
  `mentor_membership_id` int(11),
  `rel_accountBank_id` int(11),
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_self_employed_33190435` (`ic_membership_id`),
  KEY `Welcome_ic_self_employed_336001c2` (`mentor_membership_id`),
  KEY `Welcome_ic_self_employed_385bd619` (`rel_accountBank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_self_employed_rel_address_contracts`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_address_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_address_contract_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_address_contract_id`),
  KEY `Welcome_ic_self_employed_rel_address_contracts_7914dfef` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_address_contracts_531b06b3` (`ic_address_contract_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_self_employed_rel_fees`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`fee_id`),
  KEY `Welcome_ic_self_employed_rel_fees_7914dfef` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_fees_30792835` (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_self_employed_rel_images`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`image_id`),
  KEY `Welcome_ic_self_employed_rel_images_7914dfef` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_images_f33175e6` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_self_employed_rel_insurances`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_insurance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_insurance_id`),
  KEY `Welcome_ic_self_employed_rel_insurances_7914dfef` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_insurances_7a0d44b9` (`ic_insurance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_self_employed_rel_licences`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_licences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_licence_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_licence_id`),
  KEY `Welcome_ic_self_employed_rel_licences_7914dfef` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_licences_f073f1a1` (`ic_licence_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_stallholder`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_stallholder` (
  `ic_self_employed_id` int(11) NOT NULL,
  `tent_type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ic_self_employed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_ic_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `Welcome_ic_type_caf7cc51` (`lft`),
  KEY `Welcome_ic_type_3cfbd988` (`rght`),
  KEY `Welcome_ic_type_656442a0` (`tree_id`),
  KEY `Welcome_ic_type_c9e9a848` (`level`),
  KEY `Welcome_ic_type_6be37982` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

--
-- Dumping data for table `Welcome_ic_type`
--

INSERT INTO `Welcome_ic_type` (`id`, `name`, `description`, `lft`, `rght`, `tree_id`, `level`, `clas`, `parent_id`) VALUES
(1, 'Registre CI', '', 1, 58, 1, 0, 'iC_Record', NULL),
(2, 'Forma de Pagament', '', 1, 16, 2, 0, '', NULL),
(3, 'alta Soci CI', '', 3, 10, 1, 2, 'iC_Membership', 4),
(4, 'Alta de Membre', '', 2, 17, 1, 1, '', 1),
(5, 'alta Proj. Autoocupat', '', 11, 14, 1, 2, 'iC_Self_Employed', 4),
(6, 'Document CI', '', 18, 31, 1, 1, 'iC_Document', 1),
(7, 'alta Soci Coop. Individual', '', 4, 5, 1, 3, 'iC_Person_Membership', 3),
(8, 'alta Proj. Col·lectiu', '', 6, 7, 1, 3, 'iC_Project_Membership', 3),
(9, 'alta Proj. Públic', '', 8, 9, 1, 3, '', 3),
(10, 'alta Soci Afí Individual', '', 15, 16, 1, 2, 'iC_Akin_Membership', 4),
(11, 'alta Proj. Firaire', '', 12, 13, 1, 3, 'iC_Stallholder', 5),
(13, 'Contracte d''Adreça', '', 21, 26, 1, 2, 'iC_Address_Contract', 6),
(14, 'Llicència d''activitat', '', 27, 28, 1, 2, 'iC_Licence', 6),
(15, 'Assegurança soci', '', 29, 30, 1, 2, 'iC_Insurance', 6),
(16, 'Contracte Laboral', '', 19, 20, 1, 2, 'iC_Labor_Contract', 6),
(17, 'Quota', '', 32, 51, 1, 1, 'Fee', 1),
(18, 'quota d''Alta', '', 33, 38, 1, 2, 'join_fee', 17),
(19, 'quota Trimestral', '', 39, 48, 1, 2, 'quarterly_fee', 17),
(20, 'pagament en Moneda Social', '', 13, 14, 2, 2, '', 26),
(21, 'pagament amb Hores de Treball', '', 6, 7, 2, 1, '', 2),
(22, 'pagament amb Criptomoneda', '', 11, 12, 2, 2, '', 26),
(23, 'pagament en Metàl·lic', '', 9, 10, 2, 2, '', 26),
(24, 'pagament per Transferència Bancària', '', 2, 3, 2, 1, '', 2),
(25, 'pagament fent Ingrés al Banc', '', 4, 5, 2, 1, '', 2),
(26, 'pagament presencial', '', 8, 15, 2, 1, 'face-to-face', 2),
(27, 'contracte de Lloguer', '', 22, 23, 1, 3, '', 13),
(28, 'contracte de Cessió', '', 24, 25, 1, 3, '', 13),
(29, 'quota 1T', '', 40, 41, 1, 3, '', 19),
(30, 'quota 2T', '', 42, 43, 1, 3, '', 19),
(31, 'quota 3T', '', 44, 45, 1, 3, '', 19),
(32, 'Sessió / Formació', '', 52, 57, 1, 1, 'Learn_Session', 1),
(33, 'reg Sessió d''Acollida', '', 53, 54, 1, 2, 'welcome_session', 32),
(34, 'reg Sessió MonedaSocial', '', 55, 56, 1, 2, 'socialcoin_session', 32),
(35, 'quota alta Individual', '', 34, 35, 1, 3, '(30_eco) individual', 18),
(36, 'quota alta Col·lectiva', '', 36, 37, 1, 3, '(60_eco) collective', 18),
(37, 'quota 4T', '', 46, 47, 1, 3, '', 19),
(38, 'Tipus parada firaire', '', 1, 8, 3, 0, 'tent_type', NULL),
(39, 'Sense Carpa', '', 6, 7, 3, 1, '', 38),
(41, 'quota Avançada', '', 49, 50, 1, 2, 'advanced_fee', 17),
(42, 'Carpa metall', '', 2, 3, 3, 1, '', 38),
(43, 'Carpa fusta', '', 4, 5, 3, 1, '', 38);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_learn_session`
--

CREATE TABLE IF NOT EXISTS `Welcome_learn_session` (
  `ic_record_ptr_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `duration` time NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_record_ptr_id`),
  KEY `Welcome_learn_session_ea8e5d12` (`address_id`),
  KEY `Welcome_learn_session_f3ec24b0` (`facilitator_id`),
  KEY `Welcome_learn_session_e318a084` (`nonmaterial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Welcome_learn_session`
--

INSERT INTO `Welcome_learn_session` (`ic_record_ptr_id`, `datetime`, `duration`, `address_id`, `facilitator_id`, `nonmaterial_id`) VALUES
(2, '2014-09-21 00:19:47', '01:00:00', 1, NULL, 1),
(19, '2014-09-21 01:41:51', '01:00:00', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_learn_session_assistants`
--

CREATE TABLE IF NOT EXISTS `Welcome_learn_session_assistants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `learn_session_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learn_session_id` (`learn_session_id`,`human_id`),
  KEY `Welcome_learn_session_assistants_3c78342d` (`learn_session_id`),
  KEY `Welcome_learn_session_assistants_90062ed5` (`human_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `Welcome_learn_session_assistants`
--

INSERT INTO `Welcome_learn_session_assistants` (`id`, `learn_session_id`, `human_id`) VALUES
(19, 2, 4),
(20, 2, 5),
(28, 19, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_payment_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_payment_type` (
  `ic_type_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Welcome_payment_type`
--

INSERT INTO `Welcome_payment_type` (`ic_type_id`) VALUES
(20),
(21),
(22),
(23),
(24),
(25),
(26);

-- --------------------------------------------------------

--
-- Table structure for table `Welcome_project_accompaniment`
--

CREATE TABLE IF NOT EXISTS `Welcome_project_accompaniment` (
  `ic_record_ptr_id` int(11) NOT NULL,
  `situation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `needs` longtext COLLATE utf8_unicode_ci NOT NULL,
  `petition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  `human_id` int(11) NOT NULL,
  `petitioner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_ptr_id`),
  KEY `Welcome_project_accompaniment_f3ec24b0` (`facilitator_id`),
  KEY `Welcome_project_accompaniment_90062ed5` (`human_id`),
  KEY `Welcome_project_accompaniment_f286b822` (`petitioner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `General_accountbank`
--
ALTER TABLE `General_accountbank`
  ADD CONSTRAINT `human_id_refs_id_d6164342` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `company_id_refs_human_id_466f5e8e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `record_id_refs_id_a20996dc` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `unit_id_refs_id_e5728480` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`);

--
-- Constraints for table `General_accountces`
--
ALTER TABLE `General_accountces`
  ADD CONSTRAINT `human_id_refs_id_da305fb3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `entity_id_refs_human_id_935d5d48` FOREIGN KEY (`entity_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `record_id_refs_id_2286902b` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `unit_id_refs_id_07a72ac8` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`);

--
-- Constraints for table `General_accountcrypto`
--
ALTER TABLE `General_accountcrypto`
  ADD CONSTRAINT `human_id_refs_id_77c8ab2d` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_023b3440` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `unit_id_refs_id_d51cdeac` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`);

--
-- Constraints for table `General_address`
--
ALTER TABLE `General_address`
  ADD CONSTRAINT `size_unit_id_refs_id_68083e30` FOREIGN KEY (`size_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `address_type_id_refs_space_type_id_54ad4544` FOREIGN KEY (`address_type_id`) REFERENCES `General_address_type` (`space_type_id`),
  ADD CONSTRAINT `region_id_refs_id_c1ad246c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`);

--
-- Constraints for table `General_address_jobs`
--
ALTER TABLE `General_address_jobs`
  ADD CONSTRAINT `address_id_refs_id_b5c5216e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `job_id_refs_id_89cfbedd` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`);

--
-- Constraints for table `General_address_type`
--
ALTER TABLE `General_address_type`
  ADD CONSTRAINT `space_type_id_refs_typ_id_9112582a` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`);

--
-- Constraints for table `General_artwork_type`
--
ALTER TABLE `General_artwork_type`
  ADD CONSTRAINT `typ_id_refs_id_37a269e1` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`);

--
-- Constraints for table `General_asset`
--
ALTER TABLE `General_asset`
  ADD CONSTRAINT `human_id_refs_id_cbd3fba4` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `material_id_refs_id_a349c1f5` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`);

--
-- Constraints for table `General_being_type`
--
ALTER TABLE `General_being_type`
  ADD CONSTRAINT `typ_id_refs_id_8745a66c` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`);

--
-- Constraints for table `General_company`
--
ALTER TABLE `General_company`
  ADD CONSTRAINT `company_type_id_refs_being_type_id_24e786ac` FOREIGN KEY (`company_type_id`) REFERENCES `General_company_type` (`being_type_id`),
  ADD CONSTRAINT `human_id_refs_id_ae2f98d3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Constraints for table `General_company_type`
--
ALTER TABLE `General_company_type`
  ADD CONSTRAINT `being_type_id_refs_typ_id_f04123a9` FOREIGN KEY (`being_type_id`) REFERENCES `General_being_type` (`typ_id`);

--
-- Constraints for table `General_image`
--
ALTER TABLE `General_image`
  ADD CONSTRAINT `nonmaterial_id_refs_id_c84188d9` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Constraints for table `General_job`
--
ALTER TABLE `General_job`
  ADD CONSTRAINT `parent_id_refs_id_a2f76742` FOREIGN KEY (`parent_id`) REFERENCES `General_job` (`id`);

--
-- Constraints for table `General_material`
--
ALTER TABLE `General_material`
  ADD CONSTRAINT `material_type_id_refs_artwork_type_id_c95cd6a1` FOREIGN KEY (`material_type_id`) REFERENCES `General_material_type` (`artwork_type_id`);

--
-- Constraints for table `General_material_type`
--
ALTER TABLE `General_material_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_416409e2` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Constraints for table `General_nonmaterial`
--
ALTER TABLE `General_nonmaterial`
  ADD CONSTRAINT `nonmaterial_type_id_refs_artwork_type_id_185071f1` FOREIGN KEY (`nonmaterial_type_id`) REFERENCES `General_nonmaterial_type` (`artwork_type_id`);

--
-- Constraints for table `General_nonmaterial_type`
--
ALTER TABLE `General_nonmaterial_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_5702be87` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Constraints for table `General_person`
--
ALTER TABLE `General_person`
  ADD CONSTRAINT `human_id_refs_id_ce327b3b` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Constraints for table `General_project`
--
ALTER TABLE `General_project`
  ADD CONSTRAINT `project_type_id_refs_being_type_id_bdad21d0` FOREIGN KEY (`project_type_id`) REFERENCES `General_project_type` (`being_type_id`),
  ADD CONSTRAINT `human_id_refs_id_c0052093` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `parent_id_refs_human_id_cb4b7459` FOREIGN KEY (`parent_id`) REFERENCES `General_project` (`human_id`);

--
-- Constraints for table `General_project_type`
--
ALTER TABLE `General_project_type`
  ADD CONSTRAINT `being_type_id_refs_typ_id_a90a2e07` FOREIGN KEY (`being_type_id`) REFERENCES `General_being_type` (`typ_id`);

--
-- Constraints for table `General_record`
--
ALTER TABLE `General_record`
  ADD CONSTRAINT `record_type_id_refs_artwork_type_id_bf922724` FOREIGN KEY (`record_type_id`) REFERENCES `General_record_type` (`artwork_type_id`);

--
-- Constraints for table `General_record_type`
--
ALTER TABLE `General_record_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_18d309fa` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Constraints for table `General_region`
--
ALTER TABLE `General_region`
  ADD CONSTRAINT `region_type_id_refs_space_type_id_64b2d605` FOREIGN KEY (`region_type_id`) REFERENCES `General_region_type` (`space_type_id`),
  ADD CONSTRAINT `parent_id_refs_id_d0933889` FOREIGN KEY (`parent_id`) REFERENCES `General_region` (`id`);

--
-- Constraints for table `General_region_type`
--
ALTER TABLE `General_region_type`
  ADD CONSTRAINT `space_type_id_refs_typ_id_723b7251` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`);

--
-- Constraints for table `General_relation`
--
ALTER TABLE `General_relation`
  ADD CONSTRAINT `parent_id_refs_id_f04fb9fe` FOREIGN KEY (`parent_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_human_addresses`
--
ALTER TABLE `General_rel_human_addresses`
  ADD CONSTRAINT `address_id_refs_id_10b91208` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `human_id_refs_id_7504d2e7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_2f3eeaff` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_human_companies`
--
ALTER TABLE `General_rel_human_companies`
  ADD CONSTRAINT `relation_id_refs_id_e6d593f3` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `company_id_refs_human_id_71dbec55` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_e5fc194f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Constraints for table `General_rel_human_jobs`
--
ALTER TABLE `General_rel_human_jobs`
  ADD CONSTRAINT `job_id_refs_id_8fcd99c8` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `human_id_refs_id_e1b3b25a` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_6bff0d33` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_human_materials`
--
ALTER TABLE `General_rel_human_materials`
  ADD CONSTRAINT `material_id_refs_id_096e6125` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `human_id_refs_id_27a27746` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_a156018f` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_human_nonmaterials`
--
ALTER TABLE `General_rel_human_nonmaterials`
  ADD CONSTRAINT `nonmaterial_id_refs_id_9eb375a4` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `human_id_refs_id_fa4695a7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_759394a9` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_human_persons`
--
ALTER TABLE `General_rel_human_persons`
  ADD CONSTRAINT `relation_id_refs_id_4d87a191` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_0f3df09c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `person_id_refs_human_id_c2292566` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`);

--
-- Constraints for table `General_rel_human_projects`
--
ALTER TABLE `General_rel_human_projects`
  ADD CONSTRAINT `relation_id_refs_id_ba34c004` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_a037337f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `project_id_refs_human_id_ff302cd2` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`);

--
-- Constraints for table `General_rel_human_records`
--
ALTER TABLE `General_rel_human_records`
  ADD CONSTRAINT `record_id_refs_id_9dc62d11` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `human_id_refs_id_4b3e025c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_f06466de` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_human_regions`
--
ALTER TABLE `General_rel_human_regions`
  ADD CONSTRAINT `region_id_refs_id_5965961e` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
  ADD CONSTRAINT `human_id_refs_id_aff17d88` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_2f9e896a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_material_addresses`
--
ALTER TABLE `General_rel_material_addresses`
  ADD CONSTRAINT `material_id_refs_id_bbaf7619` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `address_id_refs_id_705aef0e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_ef8a49fc` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_material_jobs`
--
ALTER TABLE `General_rel_material_jobs`
  ADD CONSTRAINT `material_id_refs_id_619f712c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `job_id_refs_id_9d643e60` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_16536571` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_material_materials`
--
ALTER TABLE `General_rel_material_materials`
  ADD CONSTRAINT `material2_id_refs_id_2740db72` FOREIGN KEY (`material2_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `material_id_refs_id_2740db72` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_bab781c4` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_material_nonmaterials`
--
ALTER TABLE `General_rel_material_nonmaterials`
  ADD CONSTRAINT `material_id_refs_id_dd74c330` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_65ad546f` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_b7f51b83` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_material_records`
--
ALTER TABLE `General_rel_material_records`
  ADD CONSTRAINT `record_id_refs_id_2ce02938` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `material_id_refs_id_0f893e3c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_c378f6c7` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_nonmaterial_addresses`
--
ALTER TABLE `General_rel_nonmaterial_addresses`
  ADD CONSTRAINT `nonmaterial_id_refs_id_1bb0b026` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `address_id_refs_id_7fe0517a` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_50c1c3d8` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_nonmaterial_jobs`
--
ALTER TABLE `General_rel_nonmaterial_jobs`
  ADD CONSTRAINT `nonmaterial_id_refs_id_8a14fd3c` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `job_id_refs_id_32aeb4f3` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_3a8d4d6d` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_nonmaterial_nonmaterials`
--
ALTER TABLE `General_rel_nonmaterial_nonmaterials`
  ADD CONSTRAINT `nonmaterial2_id_refs_id_872f31c6` FOREIGN KEY (`nonmaterial2_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_872f31c6` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_98ed753a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_rel_nonmaterial_records`
--
ALTER TABLE `General_rel_nonmaterial_records`
  ADD CONSTRAINT `record_id_refs_id_9f9268bf` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_eba277fb` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `relation_id_refs_id_bab73c08` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`);

--
-- Constraints for table `General_space_type`
--
ALTER TABLE `General_space_type`
  ADD CONSTRAINT `typ_id_refs_id_5dcfea05` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`);

--
-- Constraints for table `General_type`
--
ALTER TABLE `General_type`
  ADD CONSTRAINT `parent_id_refs_id_4c09e283` FOREIGN KEY (`parent_id`) REFERENCES `General_type` (`id`);

--
-- Constraints for table `General_unit`
--
ALTER TABLE `General_unit`
  ADD CONSTRAINT `unit_type_id_refs_artwork_type_id_5cc88dc7` FOREIGN KEY (`unit_type_id`) REFERENCES `General_unit_type` (`artwork_type_id`),
  ADD CONSTRAINT `human_id_refs_id_5eaaaa15` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `region_id_refs_id_c4f5f71c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`);

--
-- Constraints for table `General_unitratio`
--
ALTER TABLE `General_unitratio`
  ADD CONSTRAINT `record_id_refs_id_e333dd70` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `in_unit_id_refs_id_e045a3a5` FOREIGN KEY (`in_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `out_unit_id_refs_id_e045a3a5` FOREIGN KEY (`out_unit_id`) REFERENCES `General_unit` (`id`);

--
-- Constraints for table `General_unit_type`
--
ALTER TABLE `General_unit_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_0b70a72e` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Constraints for table `Welcome_fee`
--
ALTER TABLE `Welcome_fee`
  ADD CONSTRAINT `Welcome_fee_unit_id_4fe8a3959dadd9f2_fk_General_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `D22f6ecf0200e1e2a79cac0b0b7745fc` FOREIGN KEY (`payment_type_id`) REFERENCES `Welcome_payment_type` (`ic_type_id`),
  ADD CONSTRAINT `Welcome_fee_human_id_3b7fb97668c6bf62_fk_General_human_id` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `Welcome_fee_project_id_3778754ac05d0_fk_General_project_human_id` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `Welcome_fee_rel_account_id_6f4b41041e602052_fk_General_record_id` FOREIGN KEY (`rel_account_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `Welcome_fe_ic_record_id_7daed9126061ed2d_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`);

--
-- Constraints for table `Welcome_ic_address_contract`
--
ALTER TABLE `Welcome_ic_address_contract`
  ADD CONSTRAINT `Welcome_ic_addr_price_unit_id_c2dc5a6330615dc_fk_General_unit_id` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `e85899cf196e756ed553b095281944f5` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_addr_address_id_da5c4a2b5ca619d_fk_General_address_id` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `Welcome__company_id_7deddc92bb955f2c_fk_General_company_human_id` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`);

--
-- Constraints for table `Welcome_ic_akin_membership`
--
ALTER TABLE `Welcome_ic_akin_membership`
  ADD CONSTRAINT `Welcome_ic__person_id_b7f8854cccf3405_fk_General_person_human_id` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `fb668d9a3eb00f45effab7ec4d7096e2` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_ic_record_id_28d1af5266e4bd1b_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `Welco_ic_company_id_108b64c63a907bd8_fk_General_company_human_id` FOREIGN KEY (`ic_company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `Welco_ic_project_id_69c099570d422562_fk_General_project_human_id` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`);

--
-- Constraints for table `Welcome_ic_document`
--
ALTER TABLE `Welcome_ic_document`
  ADD CONSTRAINT `ef937bc2306b234889f87493c2507660` FOREIGN KEY (`doc_type_id`) REFERENCES `Welcome_ic_document_type` (`record_type_id`),
  ADD CONSTRAINT `Welcome_ic_ic_record_id_3963087694132273_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`);

--
-- Constraints for table `Welcome_ic_document_type`
--
ALTER TABLE `Welcome_ic_document_type`
  ADD CONSTRAINT `D751bb3e227568f2459e801fd2bbb41f` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`);

--
-- Constraints for table `Welcome_ic_insurance`
--
ALTER TABLE `Welcome_ic_insurance`
  ADD CONSTRAINT `Welcome_ic_insuran_rel_job_id_4532fe630253d696_fk_General_job_id` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `D5227126387f51ac730cd7e1c29e8e77` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_ins_price_unit_id_3b6171e66eb2f6e6_fk_General_unit_id` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `Welcome_ic_rel_address_id_3adae3a6971630ff_fk_General_address_id` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `Welcome__company_id_16636bae9fa03822_fk_General_company_human_id` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`);

--
-- Constraints for table `Welcome_ic_labor_contract`
--
ALTER TABLE `Welcome_ic_labor_contract`
  ADD CONSTRAINT `Welcome__company_id_5522e8b098c9cecc_fk_General_company_human_id` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `dca26696673fcea08b436118f19e9058` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_person_id_2c1af229aa86f88d_fk_General_person_human_id` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`);

--
-- Constraints for table `Welcome_ic_labor_contract_rel_fees`
--
ALTER TABLE `Welcome_ic_labor_contract_rel_fees`
  ADD CONSTRAINT `Welcome_ic_l_fee_id_162dc97de128d348_fk_Welcome_fee_ic_record_id` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  ADD CONSTRAINT `D092e8b38f84699bc89509ecd7dfdb8a` FOREIGN KEY (`ic_labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`);

--
-- Constraints for table `Welcome_ic_licence`
--
ALTER TABLE `Welcome_ic_licence`
  ADD CONSTRAINT `Welcome_ic_licence_rel_job_id_35f58f823c5c8d1_fk_General_job_id` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `D87bd4e70991bebff4bb35489e8598c4` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_rel_address_id_487216ec748715f8_fk_General_address_id` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`);

--
-- Constraints for table `Welcome_ic_membership`
--
ALTER TABLE `Welcome_ic_membership`
  ADD CONSTRAINT `Welcome_join_fee_id_712eb0609f3f9b3c_fk_Welcome_fee_ic_record_id` FOREIGN KEY (`join_fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_ic_record_id_27bed660a08b377c_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `Welcome_ic_members_human_id_56310dcde8bc4dd3_fk_General_human_id` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `Welcome__contribution_id_35c62e4d2fb96f61_fk_General_relation_id` FOREIGN KEY (`contribution_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `Welco_ic_company_id_4cedb608beb8d6c7_fk_General_company_human_id` FOREIGN KEY (`ic_company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `Welco_ic_project_id_669548b96155a58b_fk_General_project_human_id` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`);

--
-- Constraints for table `Welcome_ic_membership_expositors`
--
ALTER TABLE `Welcome_ic_membership_expositors`
  ADD CONSTRAINT `Welcome_ic_mem_address_id_4b8fd47650cc3ffe_fk_General_address_id` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `e50c542f9eb2a90efc874c5c639d2ea2` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_person_membership`
--
ALTER TABLE `Welcome_ic_person_membership`
  ADD CONSTRAINT `Welcome_ic__person_id_de481774e62006f_fk_General_person_human_id` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `D78b9806a5ebca44301e001a5eb4575c` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `e0c5466209be43e6b6fa67d8c6acaaef` FOREIGN KEY (`labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`);

--
-- Constraints for table `Welcome_ic_project_membership`
--
ALTER TABLE `Welcome_ic_project_membership`
  ADD CONSTRAINT `Welcome__project_id_2fb1de7818c8bb0b_fk_General_project_human_id` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `D62652a4f34c123b6f29c70ca673eb9a` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_record`
--
ALTER TABLE `Welcome_ic_record`
  ADD CONSTRAINT `D3e6690e08cfee30c0684bd96eaa10ec` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`);

--
-- Constraints for table `Welcome_ic_record_type`
--
ALTER TABLE `Welcome_ic_record_type`
  ADD CONSTRAINT `Welcome_ic_rec_ic_type_id_6480c53d0e191f98_fk_Welcome_ic_type_id` FOREIGN KEY (`ic_type_id`) REFERENCES `Welcome_ic_type` (`id`);

--
-- Constraints for table `Welcome_ic_self_employed`
--
ALTER TABLE `Welcome_ic_self_employed`
  ADD CONSTRAINT `D98a21f1fee727aeef7a4f09afdce97b` FOREIGN KEY (`rel_accountBank_id`) REFERENCES `General_accountbank` (`record_id`),
  ADD CONSTRAINT `bae66f93913713e925dd754c82dac496` FOREIGN KEY (`mentor_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `D6743b92db47286e05cc7c2d5a4c9300` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `Welcome_ic_ic_record_id_37d06a05dd6c4e9d_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`);

--
-- Constraints for table `Welcome_ic_self_employed_rel_address_contracts`
--
ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts`
  ADD CONSTRAINT `D2dc3f8a9ec3fafa7478028ea5385373` FOREIGN KEY (`ic_address_contract_id`) REFERENCES `Welcome_ic_address_contract` (`ic_document_id`),
  ADD CONSTRAINT `D04fc800d08cd92086d2ccb59ee501bf` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_self_employed_rel_fees`
--
ALTER TABLE `Welcome_ic_self_employed_rel_fees`
  ADD CONSTRAINT `Welcome_ic_s_fee_id_301cb103666a49ca_fk_Welcome_fee_ic_record_id` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  ADD CONSTRAINT `d684e60def76fefe7fe84915161efb2d` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_self_employed_rel_images`
--
ALTER TABLE `Welcome_ic_self_employed_rel_images`
  ADD CONSTRAINT `Welcom_image_id_327b0498405bdd30_fk_General_image_nonmaterial_id` FOREIGN KEY (`image_id`) REFERENCES `General_image` (`nonmaterial_id`),
  ADD CONSTRAINT `a20b0b70996ca9c1bc047c2032123191` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_self_employed_rel_insurances`
--
ALTER TABLE `Welcome_ic_self_employed_rel_insurances`
  ADD CONSTRAINT `D0de44810c9f55de0941445d151fa312` FOREIGN KEY (`ic_insurance_id`) REFERENCES `Welcome_ic_insurance` (`ic_document_id`),
  ADD CONSTRAINT `D67e1202db3dbb460c4cb91e7087ea54` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_self_employed_rel_licences`
--
ALTER TABLE `Welcome_ic_self_employed_rel_licences`
  ADD CONSTRAINT `D44631e620ce42b54b069c275651334f` FOREIGN KEY (`ic_licence_id`) REFERENCES `Welcome_ic_licence` (`ic_document_id`),
  ADD CONSTRAINT `D3b239d82ced3448eca4425fab310486` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_stallholder`
--
ALTER TABLE `Welcome_ic_stallholder`
  ADD CONSTRAINT `D2963c577fdea363491dbf6fd87b5454` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Constraints for table `Welcome_ic_type`
--
ALTER TABLE `Welcome_ic_type`
  ADD CONSTRAINT `Welcome_ic_type_parent_id_65c161cf782e3e03_fk_Welcome_ic_type_id` FOREIGN KEY (`parent_id`) REFERENCES `Welcome_ic_type` (`id`);

--
-- Constraints for table `Welcome_learn_session`
--
ALTER TABLE `Welcome_learn_session`
  ADD CONSTRAINT `Welcom_nonmaterial_id_54ad31ad5b4dd6ac_fk_General_nonmaterial_id` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `Welcome_learn__address_id_6fdbd521e7dbaf06_fk_General_address_id` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `Welcome_lear_facilitator_id_336180736d885334_fk_General_human_id` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `Welcom_ic_record_ptr_id_145df6bb3c4a41d9_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`);

--
-- Constraints for table `Welcome_learn_session_assistants`
--
ALTER TABLE `Welcome_learn_session_assistants`
  ADD CONSTRAINT `Welcome_learn_sess_human_id_31411b53d87e2dd2_fk_General_human_id` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `D6fe8a0739cafdfc1d088800824870fd` FOREIGN KEY (`learn_session_id`) REFERENCES `Welcome_learn_session` (`ic_record_ptr_id`);

--
-- Constraints for table `Welcome_payment_type`
--
ALTER TABLE `Welcome_payment_type`
  ADD CONSTRAINT `Welcome_paymen_ic_type_id_370a3e977381d048_fk_Welcome_ic_type_id` FOREIGN KEY (`ic_type_id`) REFERENCES `Welcome_ic_type` (`id`);

--
-- Constraints for table `Welcome_project_accompaniment`
--
ALTER TABLE `Welcome_project_accompaniment`
  ADD CONSTRAINT `Welcome_proje_petitioner_id_6dd0e1f0b6b8ba94_fk_General_human_id` FOREIGN KEY (`petitioner_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `Welcome_project_ac_human_id_512b0b8819d00f1f_fk_General_human_id` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `Welcome_proj_facilitator_id_1707b7b52c4ac180_fk_General_human_id` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `Welcom_ic_record_ptr_id_615d7a69fda6848b_fk_Welcome_ic_record_id` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
