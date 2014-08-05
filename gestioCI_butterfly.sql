-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-08-2014 a las 19:46:26
-- Versión del servidor: 5.5.34-0ubuntu0.13.04.1
-- Versión de PHP: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gestioCI_butterfly`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'AUTOOCUPAT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 35),
(2, 1, 43),
(3, 1, 46),
(4, 1, 52),
(5, 1, 55),
(6, 1, 56),
(7, 1, 61),
(8, 1, 62),
(9, 1, 63),
(10, 1, 64),
(11, 1, 65),
(12, 1, 66),
(13, 1, 67),
(14, 1, 68),
(15, 1, 69),
(16, 1, 70),
(17, 1, 71),
(18, 1, 72),
(19, 1, 73),
(20, 1, 74),
(21, 1, 76),
(22, 1, 77),
(23, 1, 79),
(24, 1, 80),
(25, 1, 82),
(26, 1, 85),
(27, 1, 86),
(28, 1, 87);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=271 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add migration history', 7, 'add_migrationhistory'),
(20, 'Can change migration history', 7, 'change_migrationhistory'),
(21, 'Can delete migration history', 7, 'delete_migrationhistory'),
(22, 'Can add csv import', 8, 'add_csvimport'),
(23, 'Can change csv import', 8, 'change_csvimport'),
(24, 'Can delete csv import', 8, 'delete_csvimport'),
(25, 'Can add import model', 9, 'add_importmodel'),
(26, 'Can change import model', 9, 'change_importmodel'),
(27, 'Can delete import model', 9, 'delete_importmodel'),
(28, 'Can add H - Moneda', 10, 'add_currencies'),
(29, 'Can change H - Moneda', 10, 'change_currencies'),
(30, 'Can delete H - Moneda', 10, 'delete_currencies'),
(31, 'Can add F - IVA', 11, 'add_vats'),
(32, 'Can change F - IVA', 11, 'change_vats'),
(33, 'Can delete F - IVA', 11, 'delete_vats'),
(34, 'Can add A - Taula quotes', 12, 'add_tax'),
(35, 'Can change A - Taula quotes', 12, 'change_tax'),
(36, 'Can delete A - Taula quotes', 12, 'delete_tax'),
(37, 'Can add I - Cooperativa', 13, 'add_coop'),
(38, 'Can change I - Cooperativa', 13, 'change_coop'),
(39, 'Can delete I - Cooperativa', 13, 'delete_coop'),
(40, 'Can add company', 14, 'add_company'),
(41, 'Can change company', 14, 'change_company'),
(42, 'Can delete company', 14, 'delete_company'),
(43, 'Can add B - Client', 15, 'add_client'),
(44, 'Can change B - Client', 15, 'change_client'),
(45, 'Can delete B - Client', 15, 'delete_client'),
(46, 'Can add C - Proveïdor', 16, 'add_provider'),
(47, 'Can change C - Proveïdor', 16, 'change_provider'),
(48, 'Can delete C - Proveïdor', 16, 'delete_provider'),
(49, 'Can add D - Socia', 17, 'add_cooper'),
(50, 'Can change D - Socia', 17, 'change_cooper'),
(51, 'Can delete D - Socia', 17, 'delete_cooper'),
(52, 'Can add B - Els meus clients i proveïdors', 17, 'add_cooper_proxy_companies'),
(53, 'Can change B - Els meus clients i proveïdors', 17, 'change_cooper_proxy_companies'),
(54, 'Can delete B - Els meus clients i proveïdors', 17, 'delete_cooper_proxy_companies'),
(55, 'Can add L - Balanç projecte', 17, 'add_cooper_proxy_balance'),
(56, 'Can change L - Balanç projecte', 17, 'change_cooper_proxy_balance'),
(57, 'Can delete L - Balanç projecte', 17, 'delete_cooper_proxy_balance'),
(58, 'Can add G - Trimestres', 18, 'add_period'),
(59, 'Can change G - Trimestres', 18, 'change_period'),
(60, 'Can delete G - Trimestres', 18, 'delete_period'),
(61, 'Can add 01 - Factura Emesa', 19, 'add_sales_invoice'),
(62, 'Can change 01 - Factura Emesa', 19, 'change_sales_invoice'),
(63, 'Can delete 01 - Factura Emesa', 19, 'delete_sales_invoice'),
(64, 'Can add 02 - Factura Despesa', 20, 'add_purchases_invoice'),
(65, 'Can change 02 - Factura Despesa', 20, 'change_purchases_invoice'),
(66, 'Can delete 02 - Factura Despesa', 20, 'delete_purchases_invoice'),
(67, 'Can add Línia de factura emesa', 21, 'add_sales_line'),
(68, 'Can change Línia de factura emesa', 21, 'change_sales_line'),
(69, 'Can delete Línia de factura emesa', 21, 'delete_sales_line'),
(70, 'Can add Línia de factura despesa', 22, 'add_purchases_line'),
(71, 'Can change Línia de factura despesa', 22, 'change_purchases_line'),
(72, 'Can delete Línia de factura despesa', 22, 'delete_purchases_line'),
(73, 'Can add L - Abonament', 23, 'add_sales_movement'),
(74, 'Can change L - Abonament', 23, 'change_sales_movement'),
(75, 'Can delete L - Abonament', 23, 'delete_sales_movement'),
(76, 'Can add M - Reintegrament', 24, 'add_purchases_movement'),
(77, 'Can change M - Reintegrament', 24, 'change_purchases_movement'),
(78, 'Can delete M - Reintegrament', 24, 'delete_purchases_movement'),
(79, 'Can add 03 - Resultats', 25, 'add_period_close'),
(80, 'Can change 03 - Resultats', 25, 'change_period_close'),
(81, 'Can delete 03 - Resultats', 25, 'delete_period_close'),
(82, 'Can add K - Transaccions', 17, 'add_cooper_proxy_transactions'),
(83, 'Can change K - Transaccions', 17, 'change_cooper_proxy_transactions'),
(84, 'Can delete K - Transaccions', 17, 'delete_cooper_proxy_transactions'),
(85, 'Can add Pagament', 26, 'add_period_payment'),
(86, 'Can change Pagament', 26, 'change_period_payment'),
(87, 'Can delete Pagament', 26, 'delete_period_payment'),
(88, 'Can add E - Importar CSV (socies)', 27, 'add_csvimport'),
(89, 'Can change E - Importar CSV (socies)', 27, 'change_csvimport'),
(90, 'Can delete E - Importar CSV (socies)', 27, 'delete_csvimport'),
(91, 'Can add email', 28, 'add_email'),
(92, 'Can change email', 28, 'change_email'),
(93, 'Can delete email', 28, 'delete_email'),
(94, 'Can add J - Notificacions programades', 29, 'add_emailnotification'),
(95, 'Can change J - Notificacions programades', 29, 'change_emailnotification'),
(96, 'Can delete J - Notificacions programades', 29, 'delete_emailnotification'),
(97, 'Can add Concepte', 33, 'add_concept'),
(98, 'Can change Concepte', 33, 'change_concept'),
(99, 'Can delete Concepte', 33, 'delete_concept'),
(100, 'Can add c- Tipus', 34, 'add_type'),
(101, 'Can change c- Tipus', 34, 'change_type'),
(102, 'Can delete c- Tipus', 34, 'delete_type'),
(103, 'Can add Tipus d''entitat', 35, 'add_being_type'),
(104, 'Can change Tipus d''entitat', 35, 'change_being_type'),
(105, 'Can delete Tipus d''entitat', 35, 'delete_being_type'),
(106, 'Can add Humà', 36, 'add_human'),
(107, 'Can change Humà', 36, 'change_human'),
(108, 'Can delete Humà', 36, 'delete_human'),
(109, 'Can add Persona', 37, 'add_person'),
(110, 'Can change Persona', 37, 'change_person'),
(111, 'Can delete Persona', 37, 'delete_person'),
(112, 'Can add Projecte', 38, 'add_project'),
(113, 'Can change Projecte', 38, 'change_project'),
(114, 'Can delete Projecte', 38, 'delete_project'),
(115, 'Can add Tipus de Projecte', 39, 'add_project_type'),
(116, 'Can change Tipus de Projecte', 39, 'change_project_type'),
(117, 'Can delete Tipus de Projecte', 39, 'delete_project_type'),
(118, 'Can add Empresa', 40, 'add_company'),
(119, 'Can change Empresa', 40, 'change_company'),
(120, 'Can delete Empresa', 40, 'delete_company'),
(121, 'Can add Tipus d''Empresa', 41, 'add_company_type'),
(122, 'Can change Tipus d''Empresa', 41, 'change_company_type'),
(123, 'Can delete Tipus d''Empresa', 41, 'delete_company_type'),
(124, 'Can add ofi', 42, 'add_rel_human_jobs'),
(125, 'Can change ofi', 42, 'change_rel_human_jobs'),
(126, 'Can delete ofi', 42, 'delete_rel_human_jobs'),
(127, 'Can add adr', 43, 'add_rel_human_addresses'),
(128, 'Can change adr', 43, 'change_rel_human_addresses'),
(129, 'Can delete adr', 43, 'delete_rel_human_addresses'),
(130, 'Can add reg', 44, 'add_rel_human_regions'),
(131, 'Can change reg', 44, 'change_rel_human_regions'),
(132, 'Can delete reg', 44, 'delete_rel_human_regions'),
(133, 'Can add rec', 45, 'add_rel_human_records'),
(134, 'Can change rec', 45, 'change_rel_human_records'),
(135, 'Can delete rec', 45, 'delete_rel_human_records'),
(136, 'Can add mat', 46, 'add_rel_human_materials'),
(137, 'Can change mat', 46, 'change_rel_human_materials'),
(138, 'Can delete mat', 46, 'delete_rel_human_materials'),
(139, 'Can add inm', 47, 'add_rel_human_nonmaterials'),
(140, 'Can change inm', 47, 'change_rel_human_nonmaterials'),
(141, 'Can delete inm', 47, 'delete_rel_human_nonmaterials'),
(142, 'Can add per', 48, 'add_rel_human_persons'),
(143, 'Can change per', 48, 'change_rel_human_persons'),
(144, 'Can delete per', 48, 'delete_rel_human_persons'),
(145, 'Can add pro', 49, 'add_rel_human_projects'),
(146, 'Can change pro', 49, 'change_rel_human_projects'),
(147, 'Can delete pro', 49, 'delete_rel_human_projects'),
(148, 'Can add emp', 50, 'add_rel_human_companies'),
(149, 'Can change emp', 50, 'change_rel_human_companies'),
(150, 'Can delete emp', 50, 'delete_rel_human_companies'),
(151, 'Can add inm', 51, 'add_rel_material_nonmaterials'),
(152, 'Can change inm', 51, 'change_rel_material_nonmaterials'),
(153, 'Can delete inm', 51, 'delete_rel_material_nonmaterials'),
(154, 'Can add rec', 52, 'add_rel_material_records'),
(155, 'Can change rec', 52, 'change_rel_material_records'),
(156, 'Can delete rec', 52, 'delete_rel_material_records'),
(157, 'Can add adr', 53, 'add_rel_material_addresses'),
(158, 'Can change adr', 53, 'change_rel_material_addresses'),
(159, 'Can delete adr', 53, 'delete_rel_material_addresses'),
(160, 'Can add Art', 54, 'add_art'),
(161, 'Can change Art', 54, 'change_art'),
(162, 'Can delete Art', 54, 'delete_art'),
(163, 'Can add Relació', 55, 'add_relation'),
(164, 'Can change Relació', 55, 'change_relation'),
(165, 'Can delete Relació', 55, 'delete_relation'),
(166, 'Can add Ofici', 56, 'add_job'),
(167, 'Can change Ofici', 56, 'change_job'),
(168, 'Can delete Ofici', 56, 'delete_job'),
(169, 'Can add Tipus d''Espai', 57, 'add_space_type'),
(170, 'Can change Tipus d''Espai', 57, 'change_space_type'),
(171, 'Can delete Tipus d''Espai', 57, 'delete_space_type'),
(172, 'Can add Adreça', 58, 'add_address'),
(173, 'Can change Adreça', 58, 'change_address'),
(174, 'Can delete Adreça', 58, 'delete_address'),
(175, 'Can add Tipus d''Adreça', 59, 'add_address_type'),
(176, 'Can change Tipus d''Adreça', 59, 'change_address_type'),
(177, 'Can delete Tipus d''Adreça', 59, 'delete_address_type'),
(178, 'Can add Regió', 60, 'add_region'),
(179, 'Can change Regió', 60, 'change_region'),
(180, 'Can delete Regió', 60, 'delete_region'),
(181, 'Can add Tipus de Regió', 61, 'add_region_type'),
(182, 'Can change Tipus de Regió', 61, 'change_region_type'),
(183, 'Can delete Tipus de Regió', 61, 'delete_region_type'),
(184, 'Can add Tipus d''Obra', 62, 'add_artwork_type'),
(185, 'Can change Tipus d''Obra', 62, 'change_artwork_type'),
(186, 'Can delete Tipus d''Obra', 62, 'delete_artwork_type'),
(187, 'Can add Obra Inmaterial', 63, 'add_nonmaterial'),
(188, 'Can change Obra Inmaterial', 63, 'change_nonmaterial'),
(189, 'Can delete Obra Inmaterial', 63, 'delete_nonmaterial'),
(190, 'Can add Tipus d''obra Inmaterial', 64, 'add_nonmaterial_type'),
(191, 'Can change Tipus d''obra Inmaterial', 64, 'change_nonmaterial_type'),
(192, 'Can delete Tipus d''obra Inmaterial', 64, 'delete_nonmaterial_type'),
(193, 'Can add Imatge', 65, 'add_image'),
(194, 'Can change Imatge', 65, 'change_image'),
(195, 'Can delete Imatge', 65, 'delete_image'),
(196, 'Can add Obra Material', 66, 'add_material'),
(197, 'Can change Obra Material', 66, 'change_material'),
(198, 'Can delete Obra Material', 66, 'delete_material'),
(199, 'Can add Tipus d''obra Material', 67, 'add_material_type'),
(200, 'Can change Tipus d''obra Material', 67, 'change_material_type'),
(201, 'Can delete Tipus d''obra Material', 67, 'delete_material_type'),
(202, 'Can add Actiu', 68, 'add_asset'),
(203, 'Can change Actiu', 68, 'change_asset'),
(204, 'Can delete Actiu', 68, 'delete_asset'),
(205, 'Can add Registre', 69, 'add_record'),
(206, 'Can change Registre', 69, 'change_record'),
(207, 'Can delete Registre', 69, 'delete_record'),
(208, 'Can add Tipus de Registre', 70, 'add_record_type'),
(209, 'Can change Tipus de Registre', 70, 'change_record_type'),
(210, 'Can delete Tipus de Registre', 70, 'delete_record_type'),
(211, 'Can add Unitat', 71, 'add_unit'),
(212, 'Can change Unitat', 71, 'change_unit'),
(213, 'Can delete Unitat', 71, 'delete_unit'),
(214, 'Can add Tipus d''Unitat', 72, 'add_unit_type'),
(215, 'Can change Tipus d''Unitat', 72, 'change_unit_type'),
(216, 'Can delete Tipus d''Unitat', 72, 'delete_unit_type'),
(217, 'Can add Equivalencia entre Unitats', 73, 'add_unitratio'),
(218, 'Can change Equivalencia entre Unitats', 73, 'change_unitratio'),
(219, 'Can delete Equivalencia entre Unitats', 73, 'delete_unitratio'),
(220, 'Can add Compte CES', 74, 'add_accountces'),
(221, 'Can change Compte CES', 74, 'change_accountces'),
(222, 'Can delete Compte CES', 74, 'delete_accountces'),
(223, 'Can add Compte Bancari', 75, 'add_accountbank'),
(224, 'Can change Compte Bancari', 75, 'change_accountbank'),
(225, 'Can delete Compte Bancari', 75, 'delete_accountbank'),
(226, 'Can add Compte Criptomoneda', 76, 'add_accountcrypto'),
(227, 'Can change Compte Criptomoneda', 76, 'change_accountcrypto'),
(228, 'Can delete Compte Criptomoneda', 76, 'delete_accountcrypto'),
(229, 'Can add Registre CI', 77, 'add_ic_record'),
(230, 'Can change Registre CI', 77, 'change_ic_record'),
(231, 'Can delete Registre CI', 77, 'delete_ic_record'),
(232, 'Can add Alta de Soci CI', 78, 'add_ic_membership'),
(233, 'Can change Alta de Soci CI', 78, 'change_ic_membership'),
(234, 'Can delete Alta de Soci CI', 78, 'delete_ic_membership'),
(235, 'Can add Soci Autoocupat', 79, 'add_ic_self_employed'),
(236, 'Can change Soci Autoocupat', 79, 'change_ic_self_employed'),
(237, 'Can delete Soci Autoocupat', 79, 'delete_ic_self_employed'),
(238, 'Can add Soci Firaire', 80, 'add_ic_stallholder'),
(239, 'Can change Soci Firaire', 80, 'change_ic_stallholder'),
(240, 'Can delete Soci Firaire', 80, 'delete_ic_stallholder'),
(241, 'Can add Sessió formativa', 81, 'add_learn_session'),
(242, 'Can change Sessió formativa', 81, 'change_learn_session'),
(243, 'Can delete Sessió formativa', 81, 'delete_learn_session'),
(244, 'Can add Expedient Projecte Productiu', 82, 'add_project_accompaniment'),
(245, 'Can change Expedient Projecte Productiu', 82, 'change_project_accompaniment'),
(246, 'Can delete Expedient Projecte Productiu', 82, 'delete_project_accompaniment'),
(247, 'Can add Quota', 83, 'add_fee'),
(248, 'Can change Quota', 83, 'change_fee'),
(249, 'Can delete Quota', 83, 'delete_fee'),
(250, 'Can add Forma de pagament', 84, 'add_payment_mode'),
(251, 'Can change Forma de pagament', 84, 'change_payment_mode'),
(252, 'Can delete Forma de pagament', 84, 'delete_payment_mode'),
(253, 'Can add i c_ document', 85, 'add_ic_document'),
(254, 'Can change i c_ document', 85, 'change_ic_document'),
(255, 'Can delete i c_ document', 85, 'delete_ic_document'),
(256, 'Can add Tipus de Document CI', 86, 'add_ic_document_type'),
(257, 'Can change Tipus de Document CI', 86, 'change_ic_document_type'),
(258, 'Can delete Tipus de Document CI', 86, 'delete_ic_document_type'),
(259, 'Can add Contracte Laboral CI', 87, 'add_ic_labor_contract'),
(260, 'Can change Contracte Laboral CI', 87, 'change_ic_labor_contract'),
(261, 'Can delete Contracte Laboral CI', 87, 'delete_ic_labor_contract'),
(262, 'Can add Contracte d''Adreça CI', 88, 'add_ic_address_contract'),
(263, 'Can change Contracte d''Adreça CI', 88, 'change_ic_address_contract'),
(264, 'Can delete Contracte d''Adreça CI', 88, 'delete_ic_address_contract'),
(265, 'Can add Assegurança soci CI', 89, 'add_ic_insurance'),
(266, 'Can change Assegurança soci CI', 89, 'change_ic_insurance'),
(267, 'Can delete Assegurança soci CI', 89, 'delete_ic_insurance'),
(268, 'Can add Llicència soci CI', 90, 'add_ic_licence'),
(269, 'Can change Llicència soci CI', 90, 'change_ic_licence'),
(270, 'Can delete Llicència soci CI', 90, 'delete_ic_licence');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$slHNJa0IUgZy$f4ALF9LBvaEx6UhRWeLsBPCa4ad8j82ZJjEooN4Yty0=', '2014-08-05 17:14:14', 1, 'aleph', '', '', '', 1, 1, '2014-08-05 17:11:11'),
(2, 'pbkdf2_sha256$12000$fZEAAYoFoyjl$TUPhMOR21ZR1TIFHKWwFADJDEP7IpglJN7KwoKWpKPw=', '2014-08-05 17:34:43', 0, 'pepe', 'Pepe', 'GOTERA', 'rua13@percebe.vom', 0, 1, '2014-08-05 17:34:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `csvimport_csvimport`
--

CREATE TABLE IF NOT EXISTS `csvimport_csvimport` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `csvimport_csvimport`
--

INSERT INTO `csvimport_csvimport` (`id`, `model_name`, `field_list`, `upload_file`, `file_name`, `encoding`, `upload_method`, `error_log`, `import_date`, `import_user`) VALUES
(5, 'Invoices.tax', '', 'csv/periodTaxes_4.csv', 'csv/periodTaxes_4.csv', '', 'manual', 'Using mapping from first row of CSV file', '2014-08-05', 'aleph');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `csvimport_importmodel`
--

CREATE TABLE IF NOT EXISTS `csvimport_importmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `csvimport_id` int(11) NOT NULL,
  `numeric_id` int(10) unsigned NOT NULL,
  `natural_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `csvimport_importmodel_367c7ba0` (`csvimport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2014-08-05 17:29:14', 1, 11, '1', '0', 1, ''),
(2, '2014-08-05 17:29:18', 1, 11, '2', '4', 1, ''),
(3, '2014-08-05 17:29:21', 1, 11, '3', '10', 1, ''),
(4, '2014-08-05 17:29:24', 1, 11, '4', '21', 1, ''),
(5, '2014-08-05 17:30:13', 1, 18, '1', '2014 T1', 1, ''),
(6, '2014-08-05 17:30:40', 1, 18, '2', '2014 T2', 1, ''),
(7, '2014-08-05 17:30:42', 1, 18, '2', '2014 T2', 2, 'No ha cambiado ningún campo.'),
(8, '2014-08-05 17:31:19', 1, 18, '3', '2014 T3', 1, ''),
(9, '2014-08-05 17:34:26', 1, 3, '1', 'AUTOOCUPAT', 1, ''),
(10, '2014-08-05 17:34:44', 1, 4, '2', 'pepe', 1, ''),
(11, '2014-08-05 17:36:36', 1, 4, '2', 'pepe', 2, 'Modificado/a first_name, last_name, email y groups.'),
(12, '2014-08-05 17:41:47', 1, 8, '5', 'csv/periodTaxes_4.csv', 1, ''),
(13, '2014-08-05 17:42:14', 1, 13, '1', 'Xarxa de profesionals i usuàries', 1, ''),
(14, '2014-08-05 17:43:04', 1, 13, '2', 'Interprofesionals', 1, ''),
(15, '2014-08-05 17:43:17', 1, 10, '1', 'BTC', 1, ''),
(16, '2014-08-05 17:43:21', 1, 10, '2', 'EURO', 1, ''),
(17, '2014-08-05 17:43:24', 1, 10, '3', 'ECO', 1, ''),
(18, '2014-08-05 17:43:36', 1, 10, '4', 'SALDO', 1, ''),
(19, '2014-08-05 17:46:01', 1, 29, '1', 'Aviso de cierre automático', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'migration history', 'south', 'migrationhistory'),
(8, 'csv import', 'csvimport', 'csvimport'),
(9, 'import model', 'csvimport', 'importmodel'),
(10, 'H - Moneda', 'Invoices', 'currencies'),
(11, 'F - IVA', 'Invoices', 'vats'),
(12, 'A - Taula quotes', 'Invoices', 'tax'),
(13, 'I - Cooperativa', 'Invoices', 'coop'),
(14, 'company', 'Invoices', 'company'),
(15, 'B - Client', 'Invoices', 'client'),
(16, 'C - Proveïdor', 'Invoices', 'provider'),
(17, 'D - Socia', 'Invoices', 'cooper'),
(18, 'G - Trimestres', 'Invoices', 'period'),
(19, '01 - Factura Emesa', 'Invoices', 'sales_invoice'),
(20, '02 - Factura Despesa', 'Invoices', 'purchases_invoice'),
(21, 'Línia de factura emesa', 'Invoices', 'sales_line'),
(22, 'Línia de factura despesa', 'Invoices', 'purchases_line'),
(23, 'L - Abonament', 'Invoices', 'sales_movement'),
(24, 'M - Reintegrament', 'Invoices', 'purchases_movement'),
(25, '03 - Resultats', 'Invoices', 'period_close'),
(26, 'Pagament', 'Invoices', 'period_payment'),
(27, 'E - Importar CSV (socies)', 'Invoices', 'csvimport'),
(28, 'email', 'Invoices', 'email'),
(29, 'J - Notificacions programades', 'Invoices', 'emailnotification'),
(30, 'K - Transaccions', 'Invoices', 'cooper_proxy_transactions'),
(31, 'L - Balanç projecte', 'Invoices', 'cooper_proxy_balance'),
(32, 'B - Els meus clients i proveïdors', 'Invoices', 'cooper_proxy_companies'),
(33, 'Concepte', 'General', 'concept'),
(34, 'c- Tipus', 'General', 'type'),
(35, 'Tipus d''entitat', 'General', 'being_type'),
(36, 'Humà', 'General', 'human'),
(37, 'Persona', 'General', 'person'),
(38, 'Projecte', 'General', 'project'),
(39, 'Tipus de Projecte', 'General', 'project_type'),
(40, 'Empresa', 'General', 'company'),
(41, 'Tipus d''Empresa', 'General', 'company_type'),
(42, 'ofi', 'General', 'rel_human_jobs'),
(43, 'adr', 'General', 'rel_human_addresses'),
(44, 'reg', 'General', 'rel_human_regions'),
(45, 'rec', 'General', 'rel_human_records'),
(46, 'mat', 'General', 'rel_human_materials'),
(47, 'inm', 'General', 'rel_human_nonmaterials'),
(48, 'per', 'General', 'rel_human_persons'),
(49, 'pro', 'General', 'rel_human_projects'),
(50, 'emp', 'General', 'rel_human_companies'),
(51, 'inm', 'General', 'rel_material_nonmaterials'),
(52, 'rec', 'General', 'rel_material_records'),
(53, 'adr', 'General', 'rel_material_addresses'),
(54, 'Art', 'General', 'art'),
(55, 'Relació', 'General', 'relation'),
(56, 'Ofici', 'General', 'job'),
(57, 'Tipus d''Espai', 'General', 'space_type'),
(58, 'Adreça', 'General', 'address'),
(59, 'Tipus d''Adreça', 'General', 'address_type'),
(60, 'Regió', 'General', 'region'),
(61, 'Tipus de Regió', 'General', 'region_type'),
(62, 'Tipus d''Obra', 'General', 'artwork_type'),
(63, 'Obra Inmaterial', 'General', 'nonmaterial'),
(64, 'Tipus d''obra Inmaterial', 'General', 'nonmaterial_type'),
(65, 'Imatge', 'General', 'image'),
(66, 'Obra Material', 'General', 'material'),
(67, 'Tipus d''obra Material', 'General', 'material_type'),
(68, 'Actiu', 'General', 'asset'),
(69, 'Registre', 'General', 'record'),
(70, 'Tipus de Registre', 'General', 'record_type'),
(71, 'Unitat', 'General', 'unit'),
(72, 'Tipus d''Unitat', 'General', 'unit_type'),
(73, 'Equivalencia entre Unitats', 'General', 'unitratio'),
(74, 'Compte CES', 'General', 'accountces'),
(75, 'Compte Bancari', 'General', 'accountbank'),
(76, 'Compte Criptomoneda', 'General', 'accountcrypto'),
(77, 'Registre CI', 'Welcome', 'ic_record'),
(78, 'Alta de Soci CI', 'Welcome', 'ic_membership'),
(79, 'Soci Autoocupat', 'Welcome', 'ic_self_employed'),
(80, 'Soci Firaire', 'Welcome', 'ic_stallholder'),
(81, 'Sessió formativa', 'Welcome', 'learn_session'),
(82, 'Expedient Projecte Productiu', 'Welcome', 'project_accompaniment'),
(83, 'Quota', 'Welcome', 'fee'),
(84, 'Forma de pagament', 'Welcome', 'payment_mode'),
(85, 'i c_ document', 'Welcome', 'ic_document'),
(86, 'Tipus de Document CI', 'Welcome', 'ic_document_type'),
(87, 'Contracte Laboral CI', 'Welcome', 'ic_labor_contract'),
(88, 'Contracte d''Adreça CI', 'Welcome', 'ic_address_contract'),
(89, 'Assegurança soci CI', 'Welcome', 'ic_insurance'),
(90, 'Llicència soci CI', 'Welcome', 'ic_licence');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('33jcrnnumrme7jkxiya1c9yqp3i8g7qe', 'ZWE1ZjUwNTQ0YTJkOTNjNmIzOGJhOTE3MGNjOGZjZjA5MmE2OTczMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-08-19 17:14:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_accountbank`
--

CREATE TABLE IF NOT EXISTS `General_accountbank` (
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
  KEY `General_accountbank_b9dcc52b` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_accountces`
--

CREATE TABLE IF NOT EXISTS `General_accountces` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `number` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountces_6922ec88` (`human_id`),
  KEY `General_accountces_c096cf48` (`entity_id`),
  KEY `General_accountces_b9dcc52b` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_accountcrypto`
--

CREATE TABLE IF NOT EXISTS `General_accountcrypto` (
  `record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `number` varchar(34) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_accountcrypto_6922ec88` (`human_id`),
  KEY `General_accountcrypto_b9dcc52b` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_address`
--

CREATE TABLE IF NOT EXISTS `General_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `comment` longtext,
  `address_type_id` int(11) DEFAULT NULL,
  `p_address` varchar(100) NOT NULL,
  `town` varchar(100) NOT NULL,
  `postalcode` varchar(5) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `telephone` varchar(20) NOT NULL,
  `ic_larder` tinyint(1) NOT NULL,
  `main_address` tinyint(1) NOT NULL,
  `size` decimal(20,2) DEFAULT NULL,
  `size_unit_id` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_address_4b4cf59f` (`address_type_id`),
  KEY `General_address_55a4ce96` (`region_id`),
  KEY `General_address_4f62c404` (`size_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_address_type`
--

CREATE TABLE IF NOT EXISTS `General_address_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_address_type`
--

INSERT INTO `General_address_type` (`space_type_id`) VALUES
(55),
(56),
(57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_art`
--

CREATE TABLE IF NOT EXISTS `General_art` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `verb` varchar(50) NOT NULL,
  `gerund` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_art_410d0aac` (`parent_id`),
  KEY `General_art_329f6fb3` (`lft`),
  KEY `General_art_e763210f` (`rght`),
  KEY `General_art_ba470c4a` (`tree_id`),
  KEY `General_art_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `General_art`
--

INSERT INTO `General_art` (`id`, `name`, `verb`, `gerund`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 'Relació', 'relacionar', 'relacionant', '', NULL, 1, 44, 1, 0),
(2, 'Ofici', 'fer', 'fent', '', NULL, 1, 6, 2, 0),
(3, 'Participació', 'participar', 'participant', '', 20, 3, 28, 1, 2),
(4, 'Dinamització', 'dinamitzar', 'dinamitzant', '', 2, 2, 3, 2, 1),
(5, 'Col·laboració', 'col·laborar', 'col·laborant', '', 3, 4, 11, 1, 3),
(6, 'Desenvolupament', 'desenvolupar', 'desenvolupant', '', 2, 4, 5, 2, 1),
(7, 'Coneixement', 'saber', 'sabent', '', 22, 35, 36, 1, 2),
(8, 'Utilització', 'utilitzar', 'utilitzant', '', 21, 31, 32, 1, 2),
(9, 'Referència', 'referenciar', 'referenciant', '', 3, 12, 13, 1, 3),
(10, 'col·laboració en alguna comissió', 'col·laborar en comissió', 'col·laborant en comissió', '', 5, 5, 6, 1, 4),
(11, 'contribució puntual en tasques organitzatives', 'contribuir puntualment', 'contribuint puntualment', '', 5, 7, 8, 1, 4),
(12, 'contribució econòmica', 'contribuir econòmicament', 'contribuint econòmicament', '', 5, 9, 10, 1, 4),
(13, 'Pagament', 'pagar', 'pagant', '', 3, 14, 27, 1, 3),
(14, 'pagament en Moneda Social', 'pagar amb moneda social', 'pagant amb moneda social', '', 13, 15, 16, 1, 4),
(15, 'pagament per Transferència Bancària', 'pagar per transferencia', 'pagant per transferencia', '', 13, 17, 18, 1, 4),
(16, 'pagament en Metàl·lic', 'pagar en metàl·lic', 'pagant en metàl·lic', '', 13, 19, 20, 1, 4),
(17, 'pagament fent Ingrés al Banc', 'pagar fent ingrés bancari', 'pagant fent ingrés bancari', '', 13, 21, 22, 1, 4),
(18, 'pagament amb Criptomoneda', 'pagar amb criptomoneda', 'pagant amb criptomoneda', '', 13, 23, 24, 1, 4),
(19, 'pagament amb Hores de Treball', 'pagar amb hores', 'pagant amb hores', '', 13, 25, 26, 1, 4),
(20, ':Relació Humà - Humà', '', '', '', 1, 2, 29, 1, 1),
(21, ':Relació Humà - Obra', '', '', '', 1, 30, 33, 1, 1),
(22, ':Relació Humà - Art', '', '', '', 1, 34, 37, 1, 1),
(23, ':Relació Humà - Espai', '', '', '', 1, 38, 43, 1, 1),
(24, 'Habitatge', 'habitar', 'habitant', '', 23, 39, 40, 1, 2),
(25, 'Recepció de correu', 'rebre el correu', 'rebent el correu', '', 23, 41, 42, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_artwork_type`
--

CREATE TABLE IF NOT EXISTS `General_artwork_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_artwork_type`
--

INSERT INTO `General_artwork_type` (`typ_id`) VALUES
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(59),
(60),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_asset`
--

CREATE TABLE IF NOT EXISTS `General_asset` (
  `material_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `reciprocity` longtext NOT NULL,
  PRIMARY KEY (`material_id`),
  KEY `General_asset_6922ec88` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_being_type`
--

CREATE TABLE IF NOT EXISTS `General_being_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_being_type`
--

INSERT INTO `General_being_type` (`typ_id`) VALUES
(5),
(6),
(7),
(8),
(9),
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
(34),
(35),
(61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_company`
--

CREATE TABLE IF NOT EXISTS `General_company` (
  `human_id` int(11) NOT NULL,
  `company_type_id` int(11) DEFAULT NULL,
  `legal_name` varchar(100) DEFAULT NULL,
  `vat_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`human_id`),
  KEY `General_company_a3c9d75e` (`company_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_company_type`
--

CREATE TABLE IF NOT EXISTS `General_company_type` (
  `being_type_id` int(11) NOT NULL,
  PRIMARY KEY (`being_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_company_type`
--

INSERT INTO `General_company_type` (`being_type_id`) VALUES
(21),
(22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_concept`
--

CREATE TABLE IF NOT EXISTS `General_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `General_concept_410d0aac` (`parent_id`),
  KEY `General_concept_329f6fb3` (`lft`),
  KEY `General_concept_e763210f` (`rght`),
  KEY `General_concept_ba470c4a` (`tree_id`),
  KEY `General_concept_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Volcado de datos para la tabla `General_concept`
--

INSERT INTO `General_concept` (`id`, `name`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`) VALUES
(1, 'Tipus', '', NULL, 1, 124, 1, 0),
(2, 'Ésser', '', 1, 2, 45, 1, 1),
(3, 'Obra', '', 1, 46, 97, 1, 1),
(4, 'Espai', '', 1, 98, 123, 1, 1),
(5, 'Humà', '', 2, 3, 44, 1, 2),
(6, 'Persona', '', 5, 4, 5, 1, 3),
(7, 'Projecte', '', 5, 6, 37, 1, 3),
(8, 'Empresa', '', 5, 38, 43, 1, 3),
(9, 'projecte CI', '', 7, 7, 34, 1, 4),
(10, 'Adreça', '', 4, 99, 106, 1, 2),
(11, 'Regió', '', 4, 107, 122, 1, 2),
(12, 'Registre', '', 3, 47, 80, 1, 2),
(13, 'Unitat', '', 3, 81, 92, 1, 2),
(14, 'Material', '', 3, 93, 94, 1, 2),
(15, 'Inmaterial', '', 3, 95, 96, 1, 2),
(16, 'Equivalencia d''Unitats', '', 12, 48, 49, 1, 3),
(17, 'Compte monetari', '', 12, 50, 57, 1, 3),
(18, 'Compte CES/iCES', '', 17, 51, 52, 1, 4),
(19, 'Compte Bancari', '', 17, 53, 54, 1, 4),
(20, 'Compte Criptomoneda', '', 17, 55, 56, 1, 4),
(21, 'Cooperativa', '', 8, 39, 40, 1, 4),
(22, 'Bancaria', '', 8, 41, 42, 1, 4),
(23, 'Nucli d''Autogestió Local', '', 28, 9, 10, 1, 6),
(24, 'Ecoxarxa', '', 28, 11, 12, 1, 6),
(25, 'Cooperativa Integral', '', 28, 13, 14, 1, 6),
(26, 'Productiu Public', '', 28, 15, 16, 1, 6),
(27, 'Servei Comú', '', 28, 17, 18, 1, 6),
(28, 'Públic', '', 9, 8, 19, 1, 5),
(29, 'Cooperatiu Col·lectiu', '', 9, 20, 21, 1, 5),
(30, 'Grup de Consum', '', 9, 22, 23, 1, 5),
(31, 'Projecte de Serveis', '', 9, 24, 25, 1, 5),
(32, 'PAIC sense facturació', '', 9, 26, 27, 1, 5),
(33, 'Autoocupat', '', 9, 28, 29, 1, 5),
(34, 'Autoocupat Firaire', '', 9, 30, 31, 1, 5),
(35, 'PAIC amb facturació', '', 9, 32, 33, 1, 5),
(36, 'Alta Soci CI', '', 37, 59, 64, 1, 4),
(37, 'registre CI', '', 12, 58, 79, 1, 3),
(38, 'Document CI', '', 37, 65, 74, 1, 4),
(39, 'alta Soci Autoocupat', '', 36, 60, 61, 1, 5),
(40, 'alta Soci Firaire', '', 36, 62, 63, 1, 5),
(41, 'Contracte Laboral', '', 38, 66, 67, 1, 5),
(42, 'Contracte d''Adreça', '', 38, 68, 69, 1, 5),
(43, 'Llicència soci', '', 38, 70, 71, 1, 5),
(44, 'Assegurança soci', '', 38, 72, 73, 1, 5),
(45, 'Moneda', '', 13, 82, 89, 1, 3),
(46, 'Àrea', '', 13, 90, 91, 1, 3),
(47, 'Moneda Social', '', 45, 83, 84, 1, 4),
(48, 'Moneda Fiat', '', 45, 85, 86, 1, 4),
(49, 'Criptomoneda', '', 45, 87, 88, 1, 4),
(51, 'Continent', '', 11, 108, 117, 1, 3),
(52, 'País', '', 51, 109, 116, 1, 4),
(53, 'Bioregió', '', 62, 111, 112, 1, 6),
(54, 'Comarca', '', 62, 113, 114, 1, 6),
(55, 'Habitatge', '', 10, 100, 101, 1, 3),
(56, 'Taller', '', 10, 102, 103, 1, 3),
(57, 'Espai Polivalent Col·lectiu', '', 10, 104, 105, 1, 3),
(58, 'zona monetaria', '', 11, 118, 121, 1, 3),
(59, 'Quota', '', 37, 75, 78, 1, 4),
(60, 'quota d''Alta', '', 59, 76, 77, 1, 5),
(61, 'Xarxa Mundial', '', 7, 35, 36, 1, 4),
(62, 'Comunitat Cultural', '', 52, 110, 115, 1, 5),
(63, 'zona euro', '', 58, 119, 120, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_human`
--

CREATE TABLE IF NOT EXISTS `General_human` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_image`
--

CREATE TABLE IF NOT EXISTS `General_image` (
  `nonmaterial_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`nonmaterial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_job`
--

CREATE TABLE IF NOT EXISTS `General_job` (
  `art_id` int(11) NOT NULL,
  `clas` varchar(50) NOT NULL,
  PRIMARY KEY (`art_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_job`
--

INSERT INTO `General_job` (`art_id`, `clas`) VALUES
(4, ''),
(6, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_material`
--

CREATE TABLE IF NOT EXISTS `General_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `material_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_material_6965c408` (`material_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_material_type`
--

CREATE TABLE IF NOT EXISTS `General_material_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_material_type`
--

INSERT INTO `General_material_type` (`artwork_type_id`) VALUES
(62),
(63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_nonmaterial`
--

CREATE TABLE IF NOT EXISTS `General_nonmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `nonmaterial_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_nonmaterial_d40a8f00` (`nonmaterial_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_nonmaterial_type`
--

CREATE TABLE IF NOT EXISTS `General_nonmaterial_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_nonmaterial_type`
--

INSERT INTO `General_nonmaterial_type` (`artwork_type_id`) VALUES
(64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_person`
--

CREATE TABLE IF NOT EXISTS `General_person` (
  `human_id` int(11) NOT NULL,
  `surnames` varchar(100) NOT NULL,
  `id_card` varchar(9) NOT NULL,
  `email2` varchar(75) NOT NULL,
  `nickname2` varchar(20) NOT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_project`
--

CREATE TABLE IF NOT EXISTS `General_project` (
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
  KEY `General_project_20e079f4` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_project_images`
--

CREATE TABLE IF NOT EXISTS `General_project_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`image_id`),
  KEY `General_project_images_37952554` (`project_id`),
  KEY `General_project_images_06df7330` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_project_type`
--

CREATE TABLE IF NOT EXISTS `General_project_type` (
  `being_type_id` int(11) NOT NULL,
  PRIMARY KEY (`being_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_project_type`
--

INSERT INTO `General_project_type` (`being_type_id`) VALUES
(9),
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
(34),
(35),
(61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_record`
--

CREATE TABLE IF NOT EXISTS `General_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_record_ac580b38` (`record_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_record_type`
--

CREATE TABLE IF NOT EXISTS `General_record_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_record_type`
--

INSERT INTO `General_record_type` (`artwork_type_id`) VALUES
(16),
(17),
(18),
(19),
(20),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(59),
(60),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_region`
--

CREATE TABLE IF NOT EXISTS `General_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `comment` longtext,
  `region_type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_region_type`
--

CREATE TABLE IF NOT EXISTS `General_region_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_region_type`
--

INSERT INTO `General_region_type` (`space_type_id`) VALUES
(51),
(52),
(53),
(54),
(58),
(62),
(63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_relation`
--

CREATE TABLE IF NOT EXISTS `General_relation` (
  `art_id` int(11) NOT NULL,
  `clas` varchar(50) NOT NULL,
  PRIMARY KEY (`art_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_addresses`
--

CREATE TABLE IF NOT EXISTS `General_rel_human_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `human_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_rel_human_addresses_6922ec88` (`human_id`),
  KEY `General_rel_human_addresses_3ac8a70a` (`address_id`),
  KEY `General_rel_human_addresses_d525a588` (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_companies`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_jobs`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_materials`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_nonmaterials`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_persons`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_projects`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_records`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_human_regions`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_material_addresses`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_material_nonmaterials`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_material_records`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_space_type`
--

CREATE TABLE IF NOT EXISTS `General_space_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_space_type`
--

INSERT INTO `General_space_type` (`typ_id`) VALUES
(10),
(11),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(61),
(62),
(63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_type`
--

CREATE TABLE IF NOT EXISTS `General_type` (
  `concept_id` int(11) NOT NULL,
  `clas` varchar(50) NOT NULL,
  PRIMARY KEY (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_type`
--

INSERT INTO `General_type` (`concept_id`, `clas`) VALUES
(2, 'Being'),
(3, 'Artwork'),
(4, 'Space'),
(5, 'Human'),
(6, 'Person'),
(7, 'Project'),
(8, 'Company'),
(9, ''),
(10, 'Address'),
(11, 'Region'),
(12, 'Record'),
(13, 'Unit'),
(14, 'Material'),
(15, 'Nonmaterial'),
(16, 'UnitRatio'),
(17, ''),
(18, 'AccountCes'),
(19, 'AccountBank'),
(20, 'AccountCrypto'),
(21, ''),
(22, ''),
(23, ''),
(24, ''),
(25, ''),
(26, ''),
(27, ''),
(28, ''),
(29, ''),
(30, ''),
(31, ''),
(32, ''),
(33, ''),
(34, ''),
(35, ''),
(36, 'iC_Membership'),
(37, 'iC_Record'),
(38, 'iC_Document'),
(39, 'iC_Self_Employed'),
(40, 'iC_Stallholder'),
(41, 'iC_Labor_Contract'),
(42, 'iC_Address_Contract'),
(43, 'iC_Licence'),
(44, 'iC_Insurance'),
(45, ''),
(46, ''),
(47, ''),
(48, ''),
(49, ''),
(51, ''),
(52, ''),
(53, ''),
(54, ''),
(55, ''),
(56, ''),
(57, ''),
(58, ''),
(59, 'Fee'),
(60, ''),
(61, ''),
(62, ''),
(63, ''),
(64, 'Image'),
(65, ''),
(66, ''),
(67, ''),
(68, ''),
(69, 'Project_Accompaniment'),
(70, 'Learn_Session'),
(71, ''),
(72, ''),
(73, ''),
(74, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_unit`
--

CREATE TABLE IF NOT EXISTS `General_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `unit_type_id` int(11) DEFAULT NULL,
  `code` varchar(4) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `human_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `General_unit_0f371b60` (`unit_type_id`),
  KEY `General_unit_55a4ce96` (`region_id`),
  KEY `General_unit_6922ec88` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_unitratio`
--

CREATE TABLE IF NOT EXISTS `General_unitratio` (
  `record_id` int(11) NOT NULL,
  `in_unit_id` int(11) NOT NULL,
  `rate` decimal(6,3) NOT NULL,
  `out_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `General_unitratio_49ac93b0` (`in_unit_id`),
  KEY `General_unitratio_17576a54` (`out_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_unit_type`
--

CREATE TABLE IF NOT EXISTS `General_unit_type` (
  `artwork_type_id` int(11) NOT NULL,
  PRIMARY KEY (`artwork_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_unit_type`
--

INSERT INTO `General_unit_type` (`artwork_type_id`) VALUES
(45),
(46),
(47),
(48),
(49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_client`
--

CREATE TABLE IF NOT EXISTS `Invoices_client` (
  `company_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_company`
--

CREATE TABLE IF NOT EXISTS `Invoices_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `CIF` varchar(30) DEFAULT NULL,
  `otherCIF` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_coop`
--

CREATE TABLE IF NOT EXISTS `Invoices_coop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Invoices_coop`
--

INSERT INTO `Invoices_coop` (`id`, `name`) VALUES
(2, 'Interprofesionals'),
(1, 'Xarxa de profesionals i usuàries');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_cooper`
--

CREATE TABLE IF NOT EXISTS `Invoices_cooper` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_cooper_clients`
--

CREATE TABLE IF NOT EXISTS `Invoices_cooper_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooper_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cooper_id` (`cooper_id`,`client_id`),
  KEY `Invoices_cooper_clients_0e79bd52` (`cooper_id`),
  KEY `Invoices_cooper_clients_4fea5d6a` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_cooper_providers`
--

CREATE TABLE IF NOT EXISTS `Invoices_cooper_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooper_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cooper_id` (`cooper_id`,`provider_id`),
  KEY `Invoices_cooper_providers_0e79bd52` (`cooper_id`),
  KEY `Invoices_cooper_providers_3f126c2d` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_csvimport`
--

CREATE TABLE IF NOT EXISTS `Invoices_csvimport` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_currencies`
--

CREATE TABLE IF NOT EXISTS `Invoices_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Invoices_currencies`
--

INSERT INTO `Invoices_currencies` (`id`, `name`) VALUES
(1, 'BTC'),
(2, 'EURO'),
(3, 'ECO'),
(4, 'SALDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_email`
--

CREATE TABLE IF NOT EXISTS `Invoices_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `efrom` varchar(75) NOT NULL,
  `eto` varchar(75) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Invoices_email`
--

INSERT INTO `Invoices_email` (`id`, `efrom`, `eto`, `subject`, `body`, `is_active`) VALUES
(1, 'gestioci@cooperativa.cat', 'camp reservat pel sistema', 'Aviso de cierre automático', 'Como no has cerrado se cerrará automáticamente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_emailnotification`
--

CREATE TABLE IF NOT EXISTS `Invoices_emailnotification` (
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

--
-- Volcado de datos para la tabla `Invoices_emailnotification`
--

INSERT INTO `Invoices_emailnotification` (`email_ptr_id`, `period_id`, `sent_to_user_id`, `ento`, `notification_type`, `pointed_date`, `offset_days`) VALUES
(1, 3, NULL, 2, 1, '2014-08-05', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_period`
--

CREATE TABLE IF NOT EXISTS `Invoices_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(200) NOT NULL,
  `first_day` date NOT NULL,
  `date_open` date NOT NULL,
  `date_close` date NOT NULL,
  `exported` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `Invoices_period`
--

INSERT INTO `Invoices_period` (`id`, `label`, `first_day`, `date_open`, `date_close`, `exported`) VALUES
(1, 'T1', '2014-01-01', '2014-04-01', '2014-04-10', 0),
(2, 'T2', '2014-04-01', '2014-07-01', '2014-07-10', 0),
(3, 'T3', '2014-07-01', '2014-10-01', '2014-10-10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_period_close`
--

CREATE TABLE IF NOT EXISTS `Invoices_period_close` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_period_payment`
--

CREATE TABLE IF NOT EXISTS `Invoices_period_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_close_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_period_payment_a07f73c3` (`period_close_id`),
  KEY `Invoices_period_payment_b2321453` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_provider`
--

CREATE TABLE IF NOT EXISTS `Invoices_provider` (
  `company_ptr_id` int(11) NOT NULL,
  `iban` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`company_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_purchases_invoice`
--

CREATE TABLE IF NOT EXISTS `Invoices_purchases_invoice` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_purchases_line`
--

CREATE TABLE IF NOT EXISTS `Invoices_purchases_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchases_invoice_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `percent_vat_id` int(11) NOT NULL,
  `percent_irpf` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_purchases_line_ea3d3bfa` (`purchases_invoice_id`),
  KEY `Invoices_purchases_line_040d9802` (`percent_vat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_purchases_movement`
--

CREATE TABLE IF NOT EXISTS `Invoices_purchases_movement` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_sales_invoice`
--

CREATE TABLE IF NOT EXISTS `Invoices_sales_invoice` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_sales_line`
--

CREATE TABLE IF NOT EXISTS `Invoices_sales_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_invoice_id` int(11) NOT NULL,
  `percent_invoiced_vat_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Invoices_sales_line_03e8ca27` (`sales_invoice_id`),
  KEY `Invoices_sales_line_882eda97` (`percent_invoiced_vat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_sales_movement`
--

CREATE TABLE IF NOT EXISTS `Invoices_sales_movement` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_tax`
--

CREATE TABLE IF NOT EXISTS `Invoices_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(10,2) NOT NULL,
  `min_base` int(11) NOT NULL,
  `max_base` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `Invoices_tax`
--

INSERT INTO `Invoices_tax` (`id`, `value`, `min_base`, `max_base`) VALUES
(1, 950.00, 23001, 24000),
(2, 925.00, 22001, 23000),
(3, 900.00, 21001, 22000),
(4, 875.00, 20001, 21000),
(5, 850.00, 19001, 20000),
(6, 825.00, 18001, 19000),
(7, 800.00, 17001, 18000),
(8, 775.00, 16001, 17000),
(9, 750.00, 15001, 16000),
(10, 725.00, 14001, 15000),
(11, 700.00, 13001, 14000),
(12, 675.00, 12001, 13000),
(13, 650.00, 11001, 12000),
(14, 625.00, 10001, 11000),
(15, 600.00, 9001, 10000),
(16, 550.00, 8001, 9000),
(17, 500.00, 7001, 8000),
(18, 450.00, 6001, 7000),
(19, 400.00, 5001, 6000),
(20, 325.00, 4001, 5000),
(21, 250.00, 3001, 4000),
(22, 175.00, 2001, 3000),
(23, 125.00, 1001, 2000),
(24, 75.00, 501, 1000),
(25, 45.00, 1, 500),
(26, 30.00, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_vats`
--

CREATE TABLE IF NOT EXISTS `Invoices_vats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Invoices_vats`
--

INSERT INTO `Invoices_vats` (`id`, `value`) VALUES
(1, 0),
(2, 4),
(3, 10),
(4, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `south_migrationhistory`
--

CREATE TABLE IF NOT EXISTS `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_fee`
--

CREATE TABLE IF NOT EXISTS `Welcome_fee` (
  `ic_record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `rel_account_id` int(11) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_fee_6922ec88` (`human_id`),
  KEY `Welcome_fee_37952554` (`project_id`),
  KEY `Welcome_fee_b9dcc52b` (`unit_id`),
  KEY `Welcome_fee_1818c0ae` (`membership_id`),
  KEY `Welcome_fee_5b622010` (`rel_account_id`),
  KEY `Welcome_fee_8342f46c` (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_address_contract`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_address_contract` (
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
  KEY `Welcome_ic_address_contract_098d71f2` (`price_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_document`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_document` (
  `ic_record_id` int(11) NOT NULL,
  `doc_type_id` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_document_ca3e294e` (`doc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_document_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_document_type` (
  `record_type_id` int(11) NOT NULL,
  PRIMARY KEY (`record_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Welcome_ic_document_type`
--

INSERT INTO `Welcome_ic_document_type` (`record_type_id`) VALUES
(41),
(42),
(43),
(44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_insurance`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_insurance` (
  `ic_document_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `number` varchar(30) DEFAULT NULL,
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
  KEY `Welcome_ic_insurance_bfdae731` (`rel_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_labor_contract`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_labor_contract` (
  `ic_document_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_labor_contract_16f39487` (`person_id`),
  KEY `Welcome_ic_labor_contract_0316dde1` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_labor_contract_rel_fees`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_labor_contract_rel_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_labor_contract_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_labor_contract_id` (`ic_labor_contract_id`,`fee_id`),
  KEY `Welcome_ic_labor_contract_rel_fees_2382b2f1` (`ic_labor_contract_id`),
  KEY `Welcome_ic_labor_contract_rel_fees_5329f76d` (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_licence`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_licence` (
  `ic_document_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `number` varchar(30) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rel_address_id` int(11) DEFAULT NULL,
  `rel_job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_document_id`),
  KEY `Welcome_ic_licence_1818c0ae` (`membership_id`),
  KEY `Welcome_ic_licence_57d16b26` (`rel_address_id`),
  KEY `Welcome_ic_licence_bfdae731` (`rel_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_membership` (
  `ic_record_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `ic_project_id` int(11) NOT NULL,
  `contribution_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `join_fee_id` int(11) DEFAULT NULL,
  `ic_CESnum` varchar(8) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `labor_contract_id` int(11) DEFAULT NULL,
  `virtual_market` tinyint(1) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  UNIQUE KEY `labor_contract_id` (`labor_contract_id`),
  KEY `Welcome_ic_membership_6922ec88` (`human_id`),
  KEY `Welcome_ic_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_membership_2731fa00` (`contribution_id`),
  KEY `Welcome_ic_membership_3f4dd712` (`join_fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_membership_expositors`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_membership_expositors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_membership_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_membership_id` (`ic_membership_id`,`address_id`),
  KEY `Welcome_ic_membership_expositors_37d462ff` (`ic_membership_id`),
  KEY `Welcome_ic_membership_expositors_3ac8a70a` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_record`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_record` (
  `record_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`record_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_self_employed`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed` (
  `ic_record_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `join_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `organic` tinyint(1) NOT NULL,
  `req_id_cards` smallint(6) NOT NULL,
  `req_address_contract` smallint(6) NOT NULL,
  `req_insurance` smallint(6) NOT NULL,
  `req_licence` smallint(6) NOT NULL,
  `req_images` smallint(6) NOT NULL,
  `rel_accountBank_id` int(11) DEFAULT NULL,
  `assigned_vat` decimal(4,2) NOT NULL,
  `review_vat` tinyint(1) NOT NULL,
  `last_review_date` date DEFAULT NULL,
  `mentor_membership_id` int(11) DEFAULT NULL,
  `mentor_comment` longtext,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_self_employed_1818c0ae` (`membership_id`),
  KEY `Welcome_ic_self_employed_259761f6` (`rel_accountBank_id`),
  KEY `Welcome_ic_self_employed_5bec29b3` (`mentor_membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_self_employed_rel_fees`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`fee_id`),
  KEY `Welcome_ic_self_employed_rel_fees_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_fees_5329f76d` (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_stallholder`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_stallholder` (
  `ic_self_employed_id` int(11) NOT NULL,
  `tent_type` varchar(5) NOT NULL,
  PRIMARY KEY (`ic_self_employed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_learn_session`
--

CREATE TABLE IF NOT EXISTS `Welcome_learn_session` (
  `ic_record_ptr_id` int(11) NOT NULL,
  `nonmaterial_id` int(11) NOT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `duration` time NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ic_record_ptr_id`),
  KEY `Welcome_learn_session_c510079f` (`nonmaterial_id`),
  KEY `Welcome_learn_session_024adddb` (`facilitator_id`),
  KEY `Welcome_learn_session_3ac8a70a` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_learn_session_assistants`
--

CREATE TABLE IF NOT EXISTS `Welcome_learn_session_assistants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `learn_session_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learn_session_id` (`learn_session_id`,`human_id`),
  KEY `Welcome_learn_session_assistants_4f40a5ce` (`learn_session_id`),
  KEY `Welcome_learn_session_assistants_6922ec88` (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_payment_mode`
--

CREATE TABLE IF NOT EXISTS `Welcome_payment_mode` (
  `relation_id` int(11) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Welcome_payment_mode`
--

INSERT INTO `Welcome_payment_mode` (`relation_id`) VALUES
(14),
(15),
(16),
(17),
(18),
(19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_project_accompaniment`
--

CREATE TABLE IF NOT EXISTS `Welcome_project_accompaniment` (
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
  KEY `Welcome_project_accompaniment_024adddb` (`facilitator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `csvimport_importmodel`
--
ALTER TABLE `csvimport_importmodel`
  ADD CONSTRAINT `csvimport_id_refs_id_a4b08305` FOREIGN KEY (`csvimport_id`) REFERENCES `csvimport_csvimport` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `General_accountbank`
--
ALTER TABLE `General_accountbank`
  ADD CONSTRAINT `company_id_refs_human_id_466f5e8e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_d6164342` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_a20996dc` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `unit_id_refs_id_e5728480` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`);

--
-- Filtros para la tabla `General_accountces`
--
ALTER TABLE `General_accountces`
  ADD CONSTRAINT `entity_id_refs_human_id_935d5d48` FOREIGN KEY (`entity_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_da305fb3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_2286902b` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `unit_id_refs_id_07a72ac8` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`);

--
-- Filtros para la tabla `General_accountcrypto`
--
ALTER TABLE `General_accountcrypto`
  ADD CONSTRAINT `unit_id_refs_id_d51cdeac` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `human_id_refs_id_77c8ab2d` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_023b3440` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `General_address`
--
ALTER TABLE `General_address`
  ADD CONSTRAINT `size_unit_id_refs_id_68083e30` FOREIGN KEY (`size_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `address_type_id_refs_space_type_id_54ad4544` FOREIGN KEY (`address_type_id`) REFERENCES `General_address_type` (`space_type_id`),
  ADD CONSTRAINT `region_id_refs_id_c1ad246c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`);

--
-- Filtros para la tabla `General_address_type`
--
ALTER TABLE `General_address_type`
  ADD CONSTRAINT `space_type_id_refs_typ_id_9112582a` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`);

--
-- Filtros para la tabla `General_art`
--
ALTER TABLE `General_art`
  ADD CONSTRAINT `parent_id_refs_id_efcf9409` FOREIGN KEY (`parent_id`) REFERENCES `General_art` (`id`);

--
-- Filtros para la tabla `General_artwork_type`
--
ALTER TABLE `General_artwork_type`
  ADD CONSTRAINT `typ_id_refs_concept_id_37a269e1` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`concept_id`);

--
-- Filtros para la tabla `General_asset`
--
ALTER TABLE `General_asset`
  ADD CONSTRAINT `material_id_refs_id_a349c1f5` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `human_id_refs_id_cbd3fba4` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `General_being_type`
--
ALTER TABLE `General_being_type`
  ADD CONSTRAINT `typ_id_refs_concept_id_8745a66c` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`concept_id`);

--
-- Filtros para la tabla `General_company`
--
ALTER TABLE `General_company`
  ADD CONSTRAINT `company_type_id_refs_being_type_id_24e786ac` FOREIGN KEY (`company_type_id`) REFERENCES `General_company_type` (`being_type_id`),
  ADD CONSTRAINT `human_id_refs_id_ae2f98d3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `General_company_type`
--
ALTER TABLE `General_company_type`
  ADD CONSTRAINT `being_type_id_refs_typ_id_f04123a9` FOREIGN KEY (`being_type_id`) REFERENCES `General_being_type` (`typ_id`);

--
-- Filtros para la tabla `General_concept`
--
ALTER TABLE `General_concept`
  ADD CONSTRAINT `parent_id_refs_id_9ec027ea` FOREIGN KEY (`parent_id`) REFERENCES `General_concept` (`id`);

--
-- Filtros para la tabla `General_image`
--
ALTER TABLE `General_image`
  ADD CONSTRAINT `nonmaterial_id_refs_id_c84188d9` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_job`
--
ALTER TABLE `General_job`
  ADD CONSTRAINT `art_id_refs_id_c23db58e` FOREIGN KEY (`art_id`) REFERENCES `General_art` (`id`);

--
-- Filtros para la tabla `General_material`
--
ALTER TABLE `General_material`
  ADD CONSTRAINT `material_type_id_refs_artwork_type_id_c95cd6a1` FOREIGN KEY (`material_type_id`) REFERENCES `General_material_type` (`artwork_type_id`);

--
-- Filtros para la tabla `General_material_type`
--
ALTER TABLE `General_material_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_416409e2` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Filtros para la tabla `General_nonmaterial`
--
ALTER TABLE `General_nonmaterial`
  ADD CONSTRAINT `nonmaterial_type_id_refs_artwork_type_id_185071f1` FOREIGN KEY (`nonmaterial_type_id`) REFERENCES `General_nonmaterial_type` (`artwork_type_id`);

--
-- Filtros para la tabla `General_nonmaterial_type`
--
ALTER TABLE `General_nonmaterial_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_5702be87` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Filtros para la tabla `General_person`
--
ALTER TABLE `General_person`
  ADD CONSTRAINT `human_id_refs_id_ce327b3b` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `General_project`
--
ALTER TABLE `General_project`
  ADD CONSTRAINT `project_type_id_refs_being_type_id_bdad21d0` FOREIGN KEY (`project_type_id`) REFERENCES `General_project_type` (`being_type_id`),
  ADD CONSTRAINT `human_id_refs_id_c0052093` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `parent_id_refs_human_id_cb4b7459` FOREIGN KEY (`parent_id`) REFERENCES `General_project` (`human_id`);

--
-- Filtros para la tabla `General_project_images`
--
ALTER TABLE `General_project_images`
  ADD CONSTRAINT `image_id_refs_nonmaterial_id_1c1297ef` FOREIGN KEY (`image_id`) REFERENCES `General_image` (`nonmaterial_id`),
  ADD CONSTRAINT `project_id_refs_human_id_4b0c4328` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`);

--
-- Filtros para la tabla `General_project_type`
--
ALTER TABLE `General_project_type`
  ADD CONSTRAINT `being_type_id_refs_typ_id_a90a2e07` FOREIGN KEY (`being_type_id`) REFERENCES `General_being_type` (`typ_id`);

--
-- Filtros para la tabla `General_record`
--
ALTER TABLE `General_record`
  ADD CONSTRAINT `record_type_id_refs_artwork_type_id_bf922724` FOREIGN KEY (`record_type_id`) REFERENCES `General_record_type` (`artwork_type_id`);

--
-- Filtros para la tabla `General_record_type`
--
ALTER TABLE `General_record_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_18d309fa` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Filtros para la tabla `General_region`
--
ALTER TABLE `General_region`
  ADD CONSTRAINT `parent_id_refs_id_d0933889` FOREIGN KEY (`parent_id`) REFERENCES `General_region` (`id`),
  ADD CONSTRAINT `region_type_id_refs_space_type_id_64b2d605` FOREIGN KEY (`region_type_id`) REFERENCES `General_region_type` (`space_type_id`);

--
-- Filtros para la tabla `General_region_type`
--
ALTER TABLE `General_region_type`
  ADD CONSTRAINT `space_type_id_refs_typ_id_723b7251` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`);

--
-- Filtros para la tabla `General_relation`
--
ALTER TABLE `General_relation`
  ADD CONSTRAINT `art_id_refs_id_46450b3e` FOREIGN KEY (`art_id`) REFERENCES `General_art` (`id`);

--
-- Filtros para la tabla `General_rel_human_addresses`
--
ALTER TABLE `General_rel_human_addresses`
  ADD CONSTRAINT `address_id_refs_id_10b91208` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `human_id_refs_id_7504d2e7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_2f3eeaff` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_human_companies`
--
ALTER TABLE `General_rel_human_companies`
  ADD CONSTRAINT `relation_id_refs_art_id_e6d593f3` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`),
  ADD CONSTRAINT `company_id_refs_human_id_71dbec55` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_e5fc194f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `General_rel_human_jobs`
--
ALTER TABLE `General_rel_human_jobs`
  ADD CONSTRAINT `relation_id_refs_art_id_6bff0d33` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`),
  ADD CONSTRAINT `human_id_refs_id_e1b3b25a` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `job_id_refs_art_id_8fcd99c8` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`art_id`);

--
-- Filtros para la tabla `General_rel_human_materials`
--
ALTER TABLE `General_rel_human_materials`
  ADD CONSTRAINT `material_id_refs_id_096e6125` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `human_id_refs_id_27a27746` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_a156018f` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_human_nonmaterials`
--
ALTER TABLE `General_rel_human_nonmaterials`
  ADD CONSTRAINT `nonmaterial_id_refs_id_9eb375a4` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `human_id_refs_id_fa4695a7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_759394a9` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_human_persons`
--
ALTER TABLE `General_rel_human_persons`
  ADD CONSTRAINT `relation_id_refs_art_id_4d87a191` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`),
  ADD CONSTRAINT `human_id_refs_id_0f3df09c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `person_id_refs_human_id_c2292566` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`);

--
-- Filtros para la tabla `General_rel_human_projects`
--
ALTER TABLE `General_rel_human_projects`
  ADD CONSTRAINT `relation_id_refs_art_id_ba34c004` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`),
  ADD CONSTRAINT `human_id_refs_id_a037337f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `project_id_refs_human_id_ff302cd2` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`);

--
-- Filtros para la tabla `General_rel_human_records`
--
ALTER TABLE `General_rel_human_records`
  ADD CONSTRAINT `record_id_refs_id_9dc62d11` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `human_id_refs_id_4b3e025c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_f06466de` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_human_regions`
--
ALTER TABLE `General_rel_human_regions`
  ADD CONSTRAINT `region_id_refs_id_5965961e` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
  ADD CONSTRAINT `human_id_refs_id_aff17d88` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_2f9e896a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_material_addresses`
--
ALTER TABLE `General_rel_material_addresses`
  ADD CONSTRAINT `material_id_refs_id_bbaf7619` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `address_id_refs_id_705aef0e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_ef8a49fc` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_material_nonmaterials`
--
ALTER TABLE `General_rel_material_nonmaterials`
  ADD CONSTRAINT `material_id_refs_id_dd74c330` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_65ad546f` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_b7f51b83` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_rel_material_records`
--
ALTER TABLE `General_rel_material_records`
  ADD CONSTRAINT `record_id_refs_id_2ce02938` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `material_id_refs_id_0f893e3c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `relation_id_refs_art_id_c378f6c7` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `General_space_type`
--
ALTER TABLE `General_space_type`
  ADD CONSTRAINT `typ_id_refs_concept_id_5dcfea05` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`concept_id`);

--
-- Filtros para la tabla `General_type`
--
ALTER TABLE `General_type`
  ADD CONSTRAINT `concept_id_refs_id_3c7307d7` FOREIGN KEY (`concept_id`) REFERENCES `General_concept` (`id`);

--
-- Filtros para la tabla `General_unit`
--
ALTER TABLE `General_unit`
  ADD CONSTRAINT `region_id_refs_id_c4f5f71c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
  ADD CONSTRAINT `human_id_refs_id_5eaaaa15` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `unit_type_id_refs_artwork_type_id_5cc88dc7` FOREIGN KEY (`unit_type_id`) REFERENCES `General_unit_type` (`artwork_type_id`);

--
-- Filtros para la tabla `General_unitratio`
--
ALTER TABLE `General_unitratio`
  ADD CONSTRAINT `out_unit_id_refs_id_e045a3a5` FOREIGN KEY (`out_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `in_unit_id_refs_id_e045a3a5` FOREIGN KEY (`in_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `record_id_refs_id_e333dd70` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `General_unit_type`
--
ALTER TABLE `General_unit_type`
  ADD CONSTRAINT `artwork_type_id_refs_typ_id_0b70a72e` FOREIGN KEY (`artwork_type_id`) REFERENCES `General_artwork_type` (`typ_id`);

--
-- Filtros para la tabla `Invoices_client`
--
ALTER TABLE `Invoices_client`
  ADD CONSTRAINT `company_ptr_id_refs_id_ef75bce5` FOREIGN KEY (`company_ptr_id`) REFERENCES `Invoices_company` (`id`);

--
-- Filtros para la tabla `Invoices_cooper`
--
ALTER TABLE `Invoices_cooper`
  ADD CONSTRAINT `user_id_refs_id_4e0da4ad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `coop_id_refs_id_32a70915` FOREIGN KEY (`coop_id`) REFERENCES `Invoices_coop` (`id`);

--
-- Filtros para la tabla `Invoices_cooper_clients`
--
ALTER TABLE `Invoices_cooper_clients`
  ADD CONSTRAINT `cooper_id_refs_id_e1b00501` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `client_id_refs_company_ptr_id_47b197bc` FOREIGN KEY (`client_id`) REFERENCES `Invoices_client` (`company_ptr_id`);

--
-- Filtros para la tabla `Invoices_cooper_providers`
--
ALTER TABLE `Invoices_cooper_providers`
  ADD CONSTRAINT `cooper_id_refs_id_51eca6db` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `provider_id_refs_company_ptr_id_76872955` FOREIGN KEY (`provider_id`) REFERENCES `Invoices_provider` (`company_ptr_id`);

--
-- Filtros para la tabla `Invoices_emailnotification`
--
ALTER TABLE `Invoices_emailnotification`
  ADD CONSTRAINT `period_id_refs_id_0b714fd0` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`),
  ADD CONSTRAINT `email_ptr_id_refs_id_39c11a23` FOREIGN KEY (`email_ptr_id`) REFERENCES `Invoices_email` (`id`),
  ADD CONSTRAINT `sent_to_user_id_refs_id_6ec8b209` FOREIGN KEY (`sent_to_user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `Invoices_period_close`
--
ALTER TABLE `Invoices_period_close`
  ADD CONSTRAINT `period_id_refs_id_ff19a1b5` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`),
  ADD CONSTRAINT `cooper_id_refs_id_bcea9d40` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`);

--
-- Filtros para la tabla `Invoices_period_payment`
--
ALTER TABLE `Invoices_period_payment`
  ADD CONSTRAINT `period_close_id_refs_id_e986744e` FOREIGN KEY (`period_close_id`) REFERENCES `Invoices_period_close` (`id`),
  ADD CONSTRAINT `currency_id_refs_id_05753da2` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`);

--
-- Filtros para la tabla `Invoices_provider`
--
ALTER TABLE `Invoices_provider`
  ADD CONSTRAINT `company_ptr_id_refs_id_3e1babba` FOREIGN KEY (`company_ptr_id`) REFERENCES `Invoices_company` (`id`);

--
-- Filtros para la tabla `Invoices_purchases_invoice`
--
ALTER TABLE `Invoices_purchases_invoice`
  ADD CONSTRAINT `period_id_refs_id_95b23a99` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`),
  ADD CONSTRAINT `cooper_id_refs_id_0c68846b` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `provider_id_refs_company_ptr_id_67ba8602` FOREIGN KEY (`provider_id`) REFERENCES `Invoices_provider` (`company_ptr_id`);

--
-- Filtros para la tabla `Invoices_purchases_line`
--
ALTER TABLE `Invoices_purchases_line`
  ADD CONSTRAINT `percent_vat_id_refs_id_edb9cd9a` FOREIGN KEY (`percent_vat_id`) REFERENCES `Invoices_vats` (`id`),
  ADD CONSTRAINT `purchases_invoice_id_refs_id_cceb0727` FOREIGN KEY (`purchases_invoice_id`) REFERENCES `Invoices_purchases_invoice` (`id`);

--
-- Filtros para la tabla `Invoices_purchases_movement`
--
ALTER TABLE `Invoices_purchases_movement`
  ADD CONSTRAINT `cooper_id_refs_id_1d20a696` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `currency_id_refs_id_76ff56a7` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`);

--
-- Filtros para la tabla `Invoices_sales_invoice`
--
ALTER TABLE `Invoices_sales_invoice`
  ADD CONSTRAINT `period_id_refs_id_caf8efec` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`),
  ADD CONSTRAINT `client_id_refs_company_ptr_id_6f3398be` FOREIGN KEY (`client_id`) REFERENCES `Invoices_client` (`company_ptr_id`),
  ADD CONSTRAINT `cooper_id_refs_id_bb4338e1` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`);

--
-- Filtros para la tabla `Invoices_sales_line`
--
ALTER TABLE `Invoices_sales_line`
  ADD CONSTRAINT `percent_invoiced_vat_id_refs_id_b51d6294` FOREIGN KEY (`percent_invoiced_vat_id`) REFERENCES `Invoices_vats` (`id`),
  ADD CONSTRAINT `sales_invoice_id_refs_id_d17ada0f` FOREIGN KEY (`sales_invoice_id`) REFERENCES `Invoices_sales_invoice` (`id`);

--
-- Filtros para la tabla `Invoices_sales_movement`
--
ALTER TABLE `Invoices_sales_movement`
  ADD CONSTRAINT `cooper_id_refs_id_1c3b858e` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `currency_id_refs_id_ea1b4f9e` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`);

--
-- Filtros para la tabla `Welcome_fee`
--
ALTER TABLE `Welcome_fee`
  ADD CONSTRAINT `unit_id_refs_id_d83a16d0` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `human_id_refs_id_3c3445f1` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `ic_record_id_refs_record_ptr_id_fb734d90` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`record_ptr_id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_518057e2` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `payment_type_id_refs_relation_id_a764cf60` FOREIGN KEY (`payment_type_id`) REFERENCES `Welcome_payment_mode` (`relation_id`),
  ADD CONSTRAINT `project_id_refs_human_id_028a3357` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `rel_account_id_refs_id_93465450` FOREIGN KEY (`rel_account_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `Welcome_ic_address_contract`
--
ALTER TABLE `Welcome_ic_address_contract`
  ADD CONSTRAINT `company_id_refs_human_id_9f93aaad` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `address_id_refs_id_7bcaf3bc` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_8f544de0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_b0b8e545` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `price_unit_id_refs_id_a84f78ad` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`);

--
-- Filtros para la tabla `Welcome_ic_document`
--
ALTER TABLE `Welcome_ic_document`
  ADD CONSTRAINT `doc_type_id_refs_record_type_id_697e0ecf` FOREIGN KEY (`doc_type_id`) REFERENCES `Welcome_ic_document_type` (`record_type_id`),
  ADD CONSTRAINT `ic_record_id_refs_record_ptr_id_28d2e5f7` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`record_ptr_id`);

--
-- Filtros para la tabla `Welcome_ic_document_type`
--
ALTER TABLE `Welcome_ic_document_type`
  ADD CONSTRAINT `record_type_id_refs_artwork_type_id_bba54e5c` FOREIGN KEY (`record_type_id`) REFERENCES `General_record_type` (`artwork_type_id`);

--
-- Filtros para la tabla `Welcome_ic_insurance`
--
ALTER TABLE `Welcome_ic_insurance`
  ADD CONSTRAINT `company_id_refs_human_id_8dc69d9f` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_74e41ee0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_06cb12c9` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `price_unit_id_refs_id_cf457021` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `rel_address_id_refs_id_0a733bc0` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `rel_job_id_refs_art_id_69cdbd47` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`art_id`);

--
-- Filtros para la tabla `Welcome_ic_labor_contract`
--
ALTER TABLE `Welcome_ic_labor_contract`
  ADD CONSTRAINT `company_id_refs_human_id_53c2a07e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_7885c79c` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `person_id_refs_human_id_23ff45ce` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`);

--
-- Filtros para la tabla `Welcome_ic_labor_contract_rel_fees`
--
ALTER TABLE `Welcome_ic_labor_contract_rel_fees`
  ADD CONSTRAINT `ic_labor_contract_id_refs_ic_document_id_d1fb4508` FOREIGN KEY (`ic_labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`),
  ADD CONSTRAINT `fee_id_refs_ic_record_id_bbc0ea3f` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_licence`
--
ALTER TABLE `Welcome_ic_licence`
  ADD CONSTRAINT `rel_address_id_refs_id_44aa1942` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_638b2aec` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_b7db909c` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `rel_job_id_refs_art_id_c58b25ba` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`art_id`);

--
-- Filtros para la tabla `Welcome_ic_membership`
--
ALTER TABLE `Welcome_ic_membership`
  ADD CONSTRAINT `labor_contract_id_refs_ic_document_id_34c5d1fb` FOREIGN KEY (`labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`),
  ADD CONSTRAINT `contribution_id_refs_art_id_803a7b3a` FOREIGN KEY (`contribution_id`) REFERENCES `General_relation` (`art_id`),
  ADD CONSTRAINT `human_id_refs_id_90a969ae` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `ic_project_id_refs_human_id_5db24bd9` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `ic_record_id_refs_record_ptr_id_2333c0a4` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`record_ptr_id`),
  ADD CONSTRAINT `join_fee_id_refs_ic_record_id_b65e7f0b` FOREIGN KEY (`join_fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_membership_expositors`
--
ALTER TABLE `Welcome_ic_membership_expositors`
  ADD CONSTRAINT `ic_membership_id_refs_ic_record_id_e4a14336` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `address_id_refs_id_0c2b9dd4` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`);

--
-- Filtros para la tabla `Welcome_ic_record`
--
ALTER TABLE `Welcome_ic_record`
  ADD CONSTRAINT `record_ptr_id_refs_id_fe443f0e` FOREIGN KEY (`record_ptr_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed`
--
ALTER TABLE `Welcome_ic_self_employed`
  ADD CONSTRAINT `rel_accountBank_id_refs_record_id_939a5950` FOREIGN KEY (`rel_accountBank_id`) REFERENCES `General_accountbank` (`record_id`),
  ADD CONSTRAINT `ic_record_id_refs_record_ptr_id_8ebb96a9` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`record_ptr_id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `mentor_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`mentor_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed_rel_fees`
--
ALTER TABLE `Welcome_ic_self_employed_rel_fees`
  ADD CONSTRAINT `fee_id_refs_ic_record_id_4078f825` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_887743bd` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_stallholder`
--
ALTER TABLE `Welcome_ic_stallholder`
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4245c133` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_learn_session`
--
ALTER TABLE `Welcome_learn_session`
  ADD CONSTRAINT `nonmaterial_id_refs_id_77877834` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `address_id_refs_id_45bf8dc6` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `facilitator_id_refs_human_id_13adcfda` FOREIGN KEY (`facilitator_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `ic_record_ptr_id_refs_record_ptr_id_54767834` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`record_ptr_id`);

--
-- Filtros para la tabla `Welcome_learn_session_assistants`
--
ALTER TABLE `Welcome_learn_session_assistants`
  ADD CONSTRAINT `learn_session_id_refs_ic_record_ptr_id_117f7e2c` FOREIGN KEY (`learn_session_id`) REFERENCES `Welcome_learn_session` (`ic_record_ptr_id`),
  ADD CONSTRAINT `human_id_refs_id_b83e2682` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `Welcome_payment_mode`
--
ALTER TABLE `Welcome_payment_mode`
  ADD CONSTRAINT `relation_id_refs_art_id_1f987c16` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`art_id`);

--
-- Filtros para la tabla `Welcome_project_accompaniment`
--
ALTER TABLE `Welcome_project_accompaniment`
  ADD CONSTRAINT `petitioner_id_refs_id_0227f432` FOREIGN KEY (`petitioner_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `facilitator_id_refs_human_id_6b10d15a` FOREIGN KEY (`facilitator_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_0227f432` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `ic_record_ptr_id_refs_record_ptr_id_58f56a13` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`record_ptr_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
