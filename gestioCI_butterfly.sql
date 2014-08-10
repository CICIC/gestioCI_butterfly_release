-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-08-2014 a las 23:34:42
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'iC_Akin_Membership'),
(3, 'iC_Person_Membership'),
(1, 'iC_Project_Membership'),
(4, 'self_employed');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1060 ;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1057, 1, 37),
(1056, 1, 38),
(1055, 1, 41),
(1059, 1, 191),
(1058, 1, 206),
(1051, 2, 38),
(1030, 2, 52),
(1031, 2, 53),
(1032, 2, 54),
(1033, 2, 55),
(1034, 2, 56),
(1035, 2, 57),
(1036, 2, 58),
(1037, 2, 59),
(1038, 2, 60),
(1039, 2, 64),
(1040, 2, 65),
(1041, 2, 66),
(1042, 2, 67),
(1043, 2, 68),
(1044, 2, 69),
(1021, 2, 163),
(1022, 2, 164),
(1023, 2, 165),
(1024, 2, 166),
(1025, 2, 167),
(1026, 2, 168),
(1027, 2, 169),
(1028, 2, 170),
(1029, 2, 171),
(1050, 2, 182),
(1049, 2, 185),
(1045, 2, 206),
(1046, 2, 208),
(1047, 2, 209),
(1048, 2, 210),
(1053, 3, 38),
(1052, 3, 188),
(1054, 3, 206);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=301 ;

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
(28, 'Can add c- Tipus', 10, 'add_type'),
(29, 'Can change c- Tipus', 10, 'change_type'),
(30, 'Can delete c- Tipus', 10, 'delete_type'),
(31, 'Can add Tipus d''entitat', 11, 'add_being_type'),
(32, 'Can change Tipus d''entitat', 11, 'change_being_type'),
(33, 'Can delete Tipus d''entitat', 11, 'delete_being_type'),
(34, 'Can add Humà', 12, 'add_human'),
(35, 'Can change Humà', 12, 'change_human'),
(36, 'Can delete Humà', 12, 'delete_human'),
(37, 'Can add Persona', 13, 'add_person'),
(38, 'Can change Persona', 13, 'change_person'),
(39, 'Can delete Persona', 13, 'delete_person'),
(40, 'Can add Projecte', 14, 'add_project'),
(41, 'Can change Projecte', 14, 'change_project'),
(42, 'Can delete Projecte', 14, 'delete_project'),
(43, 'Can add Tipus de Projecte', 15, 'add_project_type'),
(44, 'Can change Tipus de Projecte', 15, 'change_project_type'),
(45, 'Can delete Tipus de Projecte', 15, 'delete_project_type'),
(46, 'Can add Empresa', 16, 'add_company'),
(47, 'Can change Empresa', 16, 'change_company'),
(48, 'Can delete Empresa', 16, 'delete_company'),
(49, 'Can add Tipus d''Empresa', 17, 'add_company_type'),
(50, 'Can change Tipus d''Empresa', 17, 'change_company_type'),
(51, 'Can delete Tipus d''Empresa', 17, 'delete_company_type'),
(52, 'Can add ofi', 18, 'add_rel_human_jobs'),
(53, 'Can change ofi', 18, 'change_rel_human_jobs'),
(54, 'Can delete ofi', 18, 'delete_rel_human_jobs'),
(55, 'Can add adr', 19, 'add_rel_human_addresses'),
(56, 'Can change adr', 19, 'change_rel_human_addresses'),
(57, 'Can delete adr', 19, 'delete_rel_human_addresses'),
(58, 'Can add reg', 20, 'add_rel_human_regions'),
(59, 'Can change reg', 20, 'change_rel_human_regions'),
(60, 'Can delete reg', 20, 'delete_rel_human_regions'),
(61, 'Can add rec', 21, 'add_rel_human_records'),
(62, 'Can change rec', 21, 'change_rel_human_records'),
(63, 'Can delete rec', 21, 'delete_rel_human_records'),
(64, 'Can add mat', 22, 'add_rel_human_materials'),
(65, 'Can change mat', 22, 'change_rel_human_materials'),
(66, 'Can delete mat', 22, 'delete_rel_human_materials'),
(67, 'Can add inm', 23, 'add_rel_human_nonmaterials'),
(68, 'Can change inm', 23, 'change_rel_human_nonmaterials'),
(69, 'Can delete inm', 23, 'delete_rel_human_nonmaterials'),
(70, 'Can add per', 24, 'add_rel_human_persons'),
(71, 'Can change per', 24, 'change_rel_human_persons'),
(72, 'Can delete per', 24, 'delete_rel_human_persons'),
(73, 'Can add pro', 25, 'add_rel_human_projects'),
(74, 'Can change pro', 25, 'change_rel_human_projects'),
(75, 'Can delete pro', 25, 'delete_rel_human_projects'),
(76, 'Can add emp', 26, 'add_rel_human_companies'),
(77, 'Can change emp', 26, 'change_rel_human_companies'),
(78, 'Can delete emp', 26, 'delete_rel_human_companies'),
(79, 'Can add inm', 27, 'add_rel_material_nonmaterials'),
(80, 'Can change inm', 27, 'change_rel_material_nonmaterials'),
(81, 'Can delete inm', 27, 'delete_rel_material_nonmaterials'),
(82, 'Can add rec', 28, 'add_rel_material_records'),
(83, 'Can change rec', 28, 'change_rel_material_records'),
(84, 'Can delete rec', 28, 'delete_rel_material_records'),
(85, 'Can add adr', 29, 'add_rel_material_addresses'),
(86, 'Can change adr', 29, 'change_rel_material_addresses'),
(87, 'Can delete adr', 29, 'delete_rel_material_addresses'),
(88, 'Can add mat.', 30, 'add_rel_material_materials'),
(89, 'Can change mat.', 30, 'change_rel_material_materials'),
(90, 'Can delete mat.', 30, 'delete_rel_material_materials'),
(91, 'Can add job.', 31, 'add_rel_material_jobs'),
(92, 'Can change job.', 31, 'change_rel_material_jobs'),
(93, 'Can delete job.', 31, 'delete_rel_material_jobs'),
(94, 'Can add rec', 32, 'add_rel_nonmaterial_records'),
(95, 'Can change rec', 32, 'change_rel_nonmaterial_records'),
(96, 'Can delete rec', 32, 'delete_rel_nonmaterial_records'),
(97, 'Can add adr', 33, 'add_rel_nonmaterial_addresses'),
(98, 'Can change adr', 33, 'change_rel_nonmaterial_addresses'),
(99, 'Can delete adr', 33, 'delete_rel_nonmaterial_addresses'),
(100, 'Can add job.', 34, 'add_rel_nonmaterial_jobs'),
(101, 'Can change job.', 34, 'change_rel_nonmaterial_jobs'),
(102, 'Can delete job.', 34, 'delete_rel_nonmaterial_jobs'),
(103, 'Can add mat.', 35, 'add_rel_nonmaterial_nonmaterials'),
(104, 'Can change mat.', 35, 'change_rel_nonmaterial_nonmaterials'),
(105, 'Can delete mat.', 35, 'delete_rel_nonmaterial_nonmaterials'),
(106, 'Can add Relació', 36, 'add_relation'),
(107, 'Can change Relació', 36, 'change_relation'),
(108, 'Can delete Relació', 36, 'delete_relation'),
(109, 'Can add Ofici', 37, 'add_job'),
(110, 'Can change Ofici', 37, 'change_job'),
(111, 'Can delete Ofici', 37, 'delete_job'),
(112, 'Can add Tipus d''Espai', 38, 'add_space_type'),
(113, 'Can change Tipus d''Espai', 38, 'change_space_type'),
(114, 'Can delete Tipus d''Espai', 38, 'delete_space_type'),
(115, 'Can add Adreça', 39, 'add_address'),
(116, 'Can change Adreça', 39, 'change_address'),
(117, 'Can delete Adreça', 39, 'delete_address'),
(118, 'Can add Tipus d''Adreça', 40, 'add_address_type'),
(119, 'Can change Tipus d''Adreça', 40, 'change_address_type'),
(120, 'Can delete Tipus d''Adreça', 40, 'delete_address_type'),
(121, 'Can add Regió', 41, 'add_region'),
(122, 'Can change Regió', 41, 'change_region'),
(123, 'Can delete Regió', 41, 'delete_region'),
(124, 'Can add Tipus de Regió', 42, 'add_region_type'),
(125, 'Can change Tipus de Regió', 42, 'change_region_type'),
(126, 'Can delete Tipus de Regió', 42, 'delete_region_type'),
(127, 'Can add Tipus d''Obra', 43, 'add_artwork_type'),
(128, 'Can change Tipus d''Obra', 43, 'change_artwork_type'),
(129, 'Can delete Tipus d''Obra', 43, 'delete_artwork_type'),
(130, 'Can add Obra Inmaterial', 44, 'add_nonmaterial'),
(131, 'Can change Obra Inmaterial', 44, 'change_nonmaterial'),
(132, 'Can delete Obra Inmaterial', 44, 'delete_nonmaterial'),
(133, 'Can add Tipus d''obra Inmaterial', 45, 'add_nonmaterial_type'),
(134, 'Can change Tipus d''obra Inmaterial', 45, 'change_nonmaterial_type'),
(135, 'Can delete Tipus d''obra Inmaterial', 45, 'delete_nonmaterial_type'),
(136, 'Can add Imatge', 46, 'add_image'),
(137, 'Can change Imatge', 46, 'change_image'),
(138, 'Can delete Imatge', 46, 'delete_image'),
(139, 'Can add Obra Material', 47, 'add_material'),
(140, 'Can change Obra Material', 47, 'change_material'),
(141, 'Can delete Obra Material', 47, 'delete_material'),
(142, 'Can add Tipus d''obra Material', 48, 'add_material_type'),
(143, 'Can change Tipus d''obra Material', 48, 'change_material_type'),
(144, 'Can delete Tipus d''obra Material', 48, 'delete_material_type'),
(145, 'Can add Actiu', 49, 'add_asset'),
(146, 'Can change Actiu', 49, 'change_asset'),
(147, 'Can delete Actiu', 49, 'delete_asset'),
(148, 'Can add Registre', 50, 'add_record'),
(149, 'Can change Registre', 50, 'change_record'),
(150, 'Can delete Registre', 50, 'delete_record'),
(151, 'Can add Tipus de Registre', 51, 'add_record_type'),
(152, 'Can change Tipus de Registre', 51, 'change_record_type'),
(153, 'Can delete Tipus de Registre', 51, 'delete_record_type'),
(154, 'Can add Unitat', 52, 'add_unit'),
(155, 'Can change Unitat', 52, 'change_unit'),
(156, 'Can delete Unitat', 52, 'delete_unit'),
(157, 'Can add Tipus d''Unitat', 53, 'add_unit_type'),
(158, 'Can change Tipus d''Unitat', 53, 'change_unit_type'),
(159, 'Can delete Tipus d''Unitat', 53, 'delete_unit_type'),
(160, 'Can add Equivalencia entre Unitats', 54, 'add_unitratio'),
(161, 'Can change Equivalencia entre Unitats', 54, 'change_unitratio'),
(162, 'Can delete Equivalencia entre Unitats', 54, 'delete_unitratio'),
(163, 'Can add Compte CES', 55, 'add_accountces'),
(164, 'Can change Compte CES', 55, 'change_accountces'),
(165, 'Can delete Compte CES', 55, 'delete_accountces'),
(166, 'Can add Compte Bancari', 56, 'add_accountbank'),
(167, 'Can change Compte Bancari', 56, 'change_accountbank'),
(168, 'Can delete Compte Bancari', 56, 'delete_accountbank'),
(169, 'Can add Compte Criptomoneda', 57, 'add_accountcrypto'),
(170, 'Can change Compte Criptomoneda', 57, 'change_accountcrypto'),
(171, 'Can delete Compte Criptomoneda', 57, 'delete_accountcrypto'),
(172, 'Can add Registre CI', 58, 'add_ic_record'),
(173, 'Can change Registre CI', 58, 'change_ic_record'),
(174, 'Can delete Registre CI', 58, 'delete_ic_record'),
(175, 'Can add c- Tipus CI', 59, 'add_ic_type'),
(176, 'Can change c- Tipus CI', 59, 'change_ic_type'),
(177, 'Can delete c- Tipus CI', 59, 'delete_ic_type'),
(178, 'Can add Tipus de Registre', 60, 'add_ic_record_type'),
(179, 'Can change Tipus de Registre', 60, 'change_ic_record_type'),
(180, 'Can delete Tipus de Registre', 60, 'delete_ic_record_type'),
(181, 'Can add Alta de Soci CI', 61, 'add_ic_membership'),
(182, 'Can change Alta de Soci CI', 61, 'change_ic_membership'),
(183, 'Can delete Alta de Soci CI', 61, 'delete_ic_membership'),
(184, 'Can add Alta de Soci Afí CI', 62, 'add_ic_akin_membership'),
(185, 'Can change Alta de Soci Afí CI', 62, 'change_ic_akin_membership'),
(186, 'Can delete Alta de Soci Afí CI', 62, 'delete_ic_akin_membership'),
(187, 'Can add Alta de Soci Cooperatius individual CI', 63, 'add_ic_person_membership'),
(188, 'Can change Alta de Soci Cooperatius individual CI', 63, 'change_ic_person_membership'),
(189, 'Can delete Alta de Soci Cooperatius individual CI', 63, 'delete_ic_person_membership'),
(190, 'Can add Alta de Projecte Col·lectiu CI', 64, 'add_ic_project_membership'),
(191, 'Can change Alta de Projecte Col·lectiu CI', 64, 'change_ic_project_membership'),
(192, 'Can delete Alta de Projecte Col·lectiu CI', 64, 'delete_ic_project_membership'),
(193, 'Can add Soci Autoocupat', 65, 'add_ic_self_employed'),
(194, 'Can change Soci Autoocupat', 65, 'change_ic_self_employed'),
(195, 'Can delete Soci Autoocupat', 65, 'delete_ic_self_employed'),
(196, 'Can add Soci Firaire', 66, 'add_ic_stallholder'),
(197, 'Can change Soci Firaire', 66, 'change_ic_stallholder'),
(198, 'Can delete Soci Firaire', 66, 'delete_ic_stallholder'),
(199, 'Can add Sessió formativa', 67, 'add_learn_session'),
(200, 'Can change Sessió formativa', 67, 'change_learn_session'),
(201, 'Can delete Sessió formativa', 67, 'delete_learn_session'),
(202, 'Can add Expedient Projecte Productiu', 68, 'add_project_accompaniment'),
(203, 'Can change Expedient Projecte Productiu', 68, 'change_project_accompaniment'),
(204, 'Can delete Expedient Projecte Productiu', 68, 'delete_project_accompaniment'),
(205, 'Can add Quota', 69, 'add_fee'),
(206, 'Can change Quota', 69, 'change_fee'),
(207, 'Can delete Quota', 69, 'delete_fee'),
(208, 'Can add Forma de pagament', 70, 'add_payment_type'),
(209, 'Can change Forma de pagament', 70, 'change_payment_type'),
(210, 'Can delete Forma de pagament', 70, 'delete_payment_type'),
(211, 'Can add i c_ document', 71, 'add_ic_document'),
(212, 'Can change i c_ document', 71, 'change_ic_document'),
(213, 'Can delete i c_ document', 71, 'delete_ic_document'),
(214, 'Can add Tipus de Document CI', 72, 'add_ic_document_type'),
(215, 'Can change Tipus de Document CI', 72, 'change_ic_document_type'),
(216, 'Can delete Tipus de Document CI', 72, 'delete_ic_document_type'),
(217, 'Can add Contracte Laboral CI', 73, 'add_ic_labor_contract'),
(218, 'Can change Contracte Laboral CI', 73, 'change_ic_labor_contract'),
(219, 'Can delete Contracte Laboral CI', 73, 'delete_ic_labor_contract'),
(220, 'Can add Contracte d''Adreça CI', 74, 'add_ic_address_contract'),
(221, 'Can change Contracte d''Adreça CI', 74, 'change_ic_address_contract'),
(222, 'Can delete Contracte d''Adreça CI', 74, 'delete_ic_address_contract'),
(223, 'Can add Assegurança soci CI', 75, 'add_ic_insurance'),
(224, 'Can change Assegurança soci CI', 75, 'change_ic_insurance'),
(225, 'Can delete Assegurança soci CI', 75, 'delete_ic_insurance'),
(226, 'Can add Llicència soci CI', 76, 'add_ic_licence'),
(227, 'Can change Llicència soci CI', 76, 'change_ic_licence'),
(228, 'Can delete Llicència soci CI', 76, 'delete_ic_licence'),
(229, 'Can add Alta Membre: procés activació', 77, 'add_registrationprofile'),
(230, 'Can change Alta Membre: procés activació', 77, 'change_registrationprofile'),
(231, 'Can delete Alta Membre: procés activació', 77, 'delete_registrationprofile'),
(232, 'Can add H - Moneda', 78, 'add_currencies'),
(233, 'Can change H - Moneda', 78, 'change_currencies'),
(234, 'Can delete H - Moneda', 78, 'delete_currencies'),
(235, 'Can add F - IVA', 79, 'add_vats'),
(236, 'Can change F - IVA', 79, 'change_vats'),
(237, 'Can delete F - IVA', 79, 'delete_vats'),
(238, 'Can add A - Taula quotes', 80, 'add_tax'),
(239, 'Can change A - Taula quotes', 80, 'change_tax'),
(240, 'Can delete A - Taula quotes', 80, 'delete_tax'),
(241, 'Can add I - Cooperativa', 81, 'add_coop'),
(242, 'Can change I - Cooperativa', 81, 'change_coop'),
(243, 'Can delete I - Cooperativa', 81, 'delete_coop'),
(244, 'Can add company', 82, 'add_company'),
(245, 'Can change company', 82, 'change_company'),
(246, 'Can delete company', 82, 'delete_company'),
(247, 'Can add B - Client', 83, 'add_client'),
(248, 'Can change B - Client', 83, 'change_client'),
(249, 'Can delete B - Client', 83, 'delete_client'),
(250, 'Can add C - Proveïdor', 84, 'add_provider'),
(251, 'Can change C - Proveïdor', 84, 'change_provider'),
(252, 'Can delete C - Proveïdor', 84, 'delete_provider'),
(253, 'Can add D - Socia', 85, 'add_cooper'),
(254, 'Can change D - Socia', 85, 'change_cooper'),
(255, 'Can delete D - Socia', 85, 'delete_cooper'),
(256, 'Can add B - Els meus clients i proveïdors', 85, 'add_cooper_proxy_companies'),
(257, 'Can change B - Els meus clients i proveïdors', 85, 'change_cooper_proxy_companies'),
(258, 'Can delete B - Els meus clients i proveïdors', 85, 'delete_cooper_proxy_companies'),
(259, 'Can add L - Balanç projecte', 85, 'add_cooper_proxy_balance'),
(260, 'Can change L - Balanç projecte', 85, 'change_cooper_proxy_balance'),
(261, 'Can delete L - Balanç projecte', 85, 'delete_cooper_proxy_balance'),
(262, 'Can add G - Trimestres', 86, 'add_period'),
(263, 'Can change G - Trimestres', 86, 'change_period'),
(264, 'Can delete G - Trimestres', 86, 'delete_period'),
(265, 'Can add 01 - Factura Emesa', 87, 'add_sales_invoice'),
(266, 'Can change 01 - Factura Emesa', 87, 'change_sales_invoice'),
(267, 'Can delete 01 - Factura Emesa', 87, 'delete_sales_invoice'),
(268, 'Can add 02 - Factura Despesa', 88, 'add_purchases_invoice'),
(269, 'Can change 02 - Factura Despesa', 88, 'change_purchases_invoice'),
(270, 'Can delete 02 - Factura Despesa', 88, 'delete_purchases_invoice'),
(271, 'Can add Línia de factura emesa', 89, 'add_sales_line'),
(272, 'Can change Línia de factura emesa', 89, 'change_sales_line'),
(273, 'Can delete Línia de factura emesa', 89, 'delete_sales_line'),
(274, 'Can add Línia de factura despesa', 90, 'add_purchases_line'),
(275, 'Can change Línia de factura despesa', 90, 'change_purchases_line'),
(276, 'Can delete Línia de factura despesa', 90, 'delete_purchases_line'),
(277, 'Can add L - Abonament', 91, 'add_sales_movement'),
(278, 'Can change L - Abonament', 91, 'change_sales_movement'),
(279, 'Can delete L - Abonament', 91, 'delete_sales_movement'),
(280, 'Can add M - Reintegrament', 92, 'add_purchases_movement'),
(281, 'Can change M - Reintegrament', 92, 'change_purchases_movement'),
(282, 'Can delete M - Reintegrament', 92, 'delete_purchases_movement'),
(283, 'Can add 03 - Resultats', 93, 'add_period_close'),
(284, 'Can change 03 - Resultats', 93, 'change_period_close'),
(285, 'Can delete 03 - Resultats', 93, 'delete_period_close'),
(286, 'Can add K - Transaccions', 85, 'add_cooper_proxy_transactions'),
(287, 'Can change K - Transaccions', 85, 'change_cooper_proxy_transactions'),
(288, 'Can delete K - Transaccions', 85, 'delete_cooper_proxy_transactions'),
(289, 'Can add Pagament', 94, 'add_period_payment'),
(290, 'Can change Pagament', 94, 'change_period_payment'),
(291, 'Can delete Pagament', 94, 'delete_period_payment'),
(292, 'Can add E - Importar CSV (socies)', 95, 'add_csvimport'),
(293, 'Can change E - Importar CSV (socies)', 95, 'change_csvimport'),
(294, 'Can delete E - Importar CSV (socies)', 95, 'delete_csvimport'),
(295, 'Can add email', 96, 'add_email'),
(296, 'Can change email', 96, 'change_email'),
(297, 'Can delete email', 96, 'delete_email'),
(298, 'Can add J - Notificacions programades', 97, 'add_emailnotification'),
(299, 'Can change J - Notificacions programades', 97, 'change_emailnotification'),
(300, 'Can delete J - Notificacions programades', 97, 'delete_emailnotification');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$7wxKrp9gz8i6$GT8zklY2mfuJ1vOXolQBfFDti0XOQPh6YrzCimSWk10=', '2014-08-10 21:11:11', 1, 'aleph', '', '', '', 1, 1, '2014-08-10 17:22:44'),
(2, 'pbkdf2_sha256$12000$6by193DYds0g$WlMEF/BchLfiIwhhAah21zvfyWaUBFyt5HGWHakui8s=', '2014-08-10 17:32:57', 0, 'ss', '', '', 'dgsg@sdgds.es', 0, 1, '2014-08-10 17:32:57'),
(3, 'pbkdf2_sha256$12000$S1qpCAia6nYS$9lwYeJiypvsw4M4kCloUAC3lKhziqiZ47xFHzU2zpS8=', '2014-08-10 17:34:21', 0, 'sss', '', '', 'dgsg@sdgds.es', 0, 1, '2014-08-10 17:34:21'),
(4, 'pbkdf2_sha256$12000$zLNkdUcl0ffq$iq5+aNUBc8KMcrEpP9t1QRI4P2tUQ1GpDwPRF0M+m/A=', '2014-08-10 17:35:07', 0, 'ssfs', '', '', 'dfgsg@sdgds.es', 0, 1, '2014-08-10 17:35:07'),
(5, 'pbkdf2_sha256$12000$lGZL1ydrKWbr$kLp+W18iC4MViP818ooEXLM13yfwIwv+46jG1ox6PNQ=', '2014-08-10 17:37:03', 0, 'dsgsdg', '', '', 'dgsdg@dgsdg.es', 0, 1, '2014-08-10 17:37:03'),
(6, 'pbkdf2_sha256$12000$pZ00I8DHzgwd$CGQl2AkH+LBUfzG/dX+BCj2ILwYCIKF+k3NT101gI8o=', '2014-08-10 17:38:29', 0, 'dsgsddg', '', '', 'dgsdgd@dgsdg.es', 0, 1, '2014-08-10 17:38:29'),
(7, 'pbkdf2_sha256$12000$wKBtNUBAHZYi$IqwJMiNeKTkL+mkqyR4xEWOGzLgEHahNmLyi2wG0O6E=', '2014-08-10 17:42:11', 0, 'dgdg', '', '', 'gdg@dgd.es', 0, 1, '2014-08-10 17:42:11'),
(8, 'pbkdf2_sha256$12000$hBJ8LIsrJIFs$zMFHv1tlUsDRKfnJgxeW3KMYhZWUD2MMf4CMavwIDwA=', '2014-08-10 17:43:41', 0, 'dfdsgdsg', '', '', 'dg2@dgsdg.es', 0, 0, '2014-08-10 17:43:41'),
(9, 'pbkdf2_sha256$12000$QDbaIVJYTyiy$oGXcl3uArGNz0cNVY1wsoFfXYCb0T7zGaEQ3/lS0Jwc=', '2014-08-10 17:44:25', 0, 'aa', '', '', 'dg@sdgs.es', 0, 0, '2014-08-10 17:44:25'),
(10, 'pbkdf2_sha256$12000$T8tsJnmnQjhR$6YVEdaDAaYQaIh6DKtqkMnXzhx2/fZflMh7u90XqFyg=', '2014-08-10 17:47:05', 0, 'aae', '', '', 'dg@sdgs.es', 0, 0, '2014-08-10 17:47:05'),
(11, 'pbkdf2_sha256$12000$vv6QS4B3VUNh$/N/LVFKEPNwzKLHH3VIOxcS4eA6IAk8kgrdauEOf2Po=', '2014-08-10 17:48:22', 0, 'aaed', '', '', 'dg@sdgs.esd', 0, 0, '2014-08-10 17:48:22'),
(12, 'pbkdf2_sha256$12000$zLPtKl4v062w$9WK99VjvnkF+U1snvg6LCegFz/pJ5X7NjKnhIEJlclM=', '2014-08-10 17:48:58', 0, 'aaedd', '', '', 'dg@sddgs.esd', 0, 0, '2014-08-10 17:48:58'),
(13, 'pbkdf2_sha256$12000$bnFQxHbcD9CW$hx3OrvewgYqukAF+MY3Mnwqxb/3f6I1wtHWSMFP841k=', '2014-08-10 17:51:34', 0, 'aaesdd', '', '', 'dg@sdsdgs.esd', 0, 1, '2014-08-10 17:51:34'),
(14, 'pbkdf2_sha256$12000$9w3tyGbQ0UU0$W83MLKdzVx373ugHvETrM+T7oi9xmfb3t+lCpEV9+XA=', '2014-08-10 17:52:36', 0, 'asdgds', '', '', 'dgsg@dsds.es', 0, 0, '2014-08-10 17:52:36'),
(15, 'pbkdf2_sha256$12000$Rt0X1OQ7Jh8w$PsAR6fk9YWon0Cy5PEOeatSGN4xSm9mQZIcnYhEB0O4=', '2014-08-10 17:57:19', 0, 'tert', '', '', 'gfg2dfg@es.es', 0, 0, '2014-08-10 17:57:19'),
(16, 'pbkdf2_sha256$12000$YKYtVi4oLlQD$enT+jYFM257XS9PKvnIkJhs5msLaAh8epAkzXky0jBk=', '2014-08-10 17:58:17', 0, 'dgdgs', '', '', 'dsgss@dsgfdg.es', 0, 0, '2014-08-10 17:58:17'),
(17, 'pbkdf2_sha256$12000$WqvxW3NH0bMJ$8KxZvkPcXGlr9+iOVleJy/cdJCCMv2BUs0BXg3Gw9dE=', '2014-08-10 18:28:04', 0, 'dgsdg', '', '', 'sdg@sddg.es', 0, 1, '2014-08-10 18:28:04'),
(18, 'pbkdf2_sha256$12000$bKstxi3kEFsm$I7YlX2NNLPBSlmyzxsPP0hJ5lsaucPbo3CEGYND+Pw4=', '2014-08-10 18:29:02', 0, 'dgsdgd', '', '', 'sdg@sddg.es', 0, 0, '2014-08-10 18:29:02'),
(19, 'pbkdf2_sha256$12000$YHYi27JTmMS0$IMs8RltXvVFqLBA0nLfY0Tctbb5nZzt8lS/XwiHOqgw=', '2014-08-10 18:29:43', 0, 'dgssdgd', '', '', 'sdsg@sddg.es', 0, 0, '2014-08-10 18:29:43'),
(20, 'pbkdf2_sha256$12000$YXDVtaLjAJmS$Mt8YUqS+NoMGKpOIcsnHdnWA2IpumtM5f2ior6rOkwg=', '2014-08-10 18:50:14', 0, 'juan', '', '', 'ja@di.es', 0, 0, '2014-08-10 18:50:14'),
(21, 'pbkdf2_sha256$12000$Ps68XEQkjWpf$uHsHrCwwYO3XjJ/axnJA4vUatMU88JJXyLrkPcOKyMc=', '2014-08-10 18:52:57', 0, 'luis', '', '', 'ja@di.es', 0, 1, '2014-08-10 18:50:54'),
(22, 'pbkdf2_sha256$12000$ynbnLOzX4MKn$ldHpQOzA9ucAXwQ7DwBD4ASQl5kXy3uPunEXuaJN3S0=', '2014-08-10 18:53:53', 0, 'jose', '', '', 'jose@josre.es', 0, 1, '2014-08-10 18:53:42'),
(23, 'pbkdf2_sha256$12000$rpELjUlDLUsa$H+3Fvgzq56fyZydVjeR+8pXFBpTSR+Nb0M3gPCiU+0s=', '2014-08-10 21:27:16', 0, 'clara', '', '', 'ca@dsg.es', 0, 1, '2014-08-10 18:55:46'),
(24, 'pbkdf2_sha256$12000$SY9CFc8S9Krl$HOgmsCsm0Zfrpa9RkArGt/ab6Tzeqx9BS3wqU/ah46E=', '2014-08-10 20:31:16', 0, 'marc', '', '', 'marc@proje.es', 0, 1, '2014-08-10 20:31:16'),
(25, 'pbkdf2_sha256$12000$SpxJRR4owcXy$0ycB0BL2I/WARZLzkLiuqMfp0fweLeJ1+n9/hPLuZOo=', '2014-08-10 20:36:17', 0, 'marc1', '', '', 'marc@dsg.es', 0, 1, '2014-08-10 20:35:07'),
(26, 'pbkdf2_sha256$12000$75N2oKyXwy6J$4r/pj7az8rWYEKtDoT81GAja6KKYC1AR/tPLoZBEQYQ=', '2014-08-10 21:28:07', 0, 'manuel', '', '', 'dsgsd@dsgd.es', 0, 1, '2014-08-10 21:28:07'),
(27, 'pbkdf2_sha256$12000$NGBX4wee5o3K$yfnjyh7MgfC6YmMiemokcIJVbazg0tK1giWsAoDRfCw=', '2014-08-10 21:28:38', 0, 'manuel2', '', '', 'dsgsd@dsgd.es', 0, 1, '2014-08-10 21:28:26');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 2),
(5, 6, 2),
(6, 7, 2),
(7, 8, 2),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 3),
(16, 17, 2),
(17, 18, 2),
(18, 19, 2),
(19, 20, 1),
(21, 21, 1),
(22, 22, 2),
(23, 23, 2),
(24, 24, 1),
(25, 25, 1),
(26, 26, 2),
(27, 27, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2014-08-10 17:40:08', 1, 14, '6', 'coperativa', 1, ''),
(2, '2014-08-10 17:57:42', 1, 64, '10', 'alta Projecte Col·lectiu:  (tert)', 2, 'No ha cambiado ningún campo.'),
(3, '2014-08-10 18:19:36', 1, 52, '1', 'Moneda: sgsdg', 1, ''),
(4, '2014-08-10 18:24:07', 1, 52, '2', 'Moneda Fiat: EURO', 1, ''),
(5, '2014-08-10 18:47:58', 1, 3, '3', 'ic_Person_Membership', 2, 'Modificado/a permissions.'),
(6, '2014-08-10 18:48:37', 1, 3, '1', 'ic_Project_Membership', 2, 'Modificado/a permissions.'),
(7, '2014-08-10 18:49:17', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(8, '2014-08-10 18:51:59', 1, 4, '21', 'luis', 2, 'Modificado/a is_active.'),
(9, '2014-08-10 19:00:11', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(10, '2014-08-10 19:00:38', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(11, '2014-08-10 19:01:01', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(12, '2014-08-10 19:02:49', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(13, '2014-08-10 19:19:29', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(14, '2014-08-10 19:20:25', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(15, '2014-08-10 19:20:38', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(16, '2014-08-10 19:21:31', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(17, '2014-08-10 19:24:15', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(18, '2014-08-10 19:24:59', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(19, '2014-08-10 19:25:57', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(20, '2014-08-10 19:26:31', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(21, '2014-08-10 19:26:31', 1, 3, '2', 'iC_Akin_Membership', 2, 'No ha cambiado ningún campo.'),
(22, '2014-08-10 19:28:31', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(23, '2014-08-10 19:29:00', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(24, '2014-08-10 19:29:23', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(25, '2014-08-10 19:30:38', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(26, '2014-08-10 19:30:54', 1, 3, '2', 'iC_Akin_Membership', 2, 'Modificado/a permissions.'),
(27, '2014-08-10 19:44:01', 1, 69, '24', 'ddddd (jose) [30.00 eur] > ', 2, 'Modificado/a record_type.'),
(28, '2014-08-10 19:44:23', 1, 69, '24', 'ddddd (jose) [30.00 eur] > ', 2, 'Modificado/a payment_type.'),
(29, '2014-08-10 19:56:44', 1, 69, '24', 'alta Soci Afí Individual: clara (clara) [30.00 eur] > ', 2, 'Modificado/a human.'),
(30, '2014-08-10 20:21:36', 1, 3, '3', 'iC_Person_Membership', 2, 'Modificado/a name.'),
(31, '2014-08-10 20:21:42', 1, 3, '1', 'iC_Project_Membership', 2, 'Modificado/a name.'),
(32, '2014-08-10 20:22:19', 1, 3, '4', 'self_employed', 1, ''),
(33, '2014-08-10 21:29:01', 27, 62, '30', 'alta Soci Afí Individual: manuel2 (manuel2)', 2, 'Modificado/a join_fee.'),
(34, '2014-08-10 21:30:52', 27, 62, '30', 'alta Soci Afí Individual: manuel2 (manuel2)', 2, 'Modificado/a join_date.'),
(35, '2014-08-10 21:31:26', 27, 13, '37', 'manuel2 (manuel2) (manuel2)', 2, 'Modificado/a id_card.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

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
(10, 'c- Tipus', 'General', 'type'),
(11, 'Tipus d''entitat', 'General', 'being_type'),
(12, 'Humà', 'General', 'human'),
(13, 'Persona', 'General', 'person'),
(14, 'Projecte', 'General', 'project'),
(15, 'Tipus de Projecte', 'General', 'project_type'),
(16, 'Empresa', 'General', 'company'),
(17, 'Tipus d''Empresa', 'General', 'company_type'),
(18, 'ofi', 'General', 'rel_human_jobs'),
(19, 'adr', 'General', 'rel_human_addresses'),
(20, 'reg', 'General', 'rel_human_regions'),
(21, 'rec', 'General', 'rel_human_records'),
(22, 'mat', 'General', 'rel_human_materials'),
(23, 'inm', 'General', 'rel_human_nonmaterials'),
(24, 'per', 'General', 'rel_human_persons'),
(25, 'pro', 'General', 'rel_human_projects'),
(26, 'emp', 'General', 'rel_human_companies'),
(27, 'inm', 'General', 'rel_material_nonmaterials'),
(28, 'rec', 'General', 'rel_material_records'),
(29, 'adr', 'General', 'rel_material_addresses'),
(30, 'mat.', 'General', 'rel_material_materials'),
(31, 'job.', 'General', 'rel_material_jobs'),
(32, 'rec', 'General', 'rel_nonmaterial_records'),
(33, 'adr', 'General', 'rel_nonmaterial_addresses'),
(34, 'job.', 'General', 'rel_nonmaterial_jobs'),
(35, 'mat.', 'General', 'rel_nonmaterial_nonmaterials'),
(36, 'Relació', 'General', 'relation'),
(37, 'Ofici', 'General', 'job'),
(38, 'Tipus d''Espai', 'General', 'space_type'),
(39, 'Adreça', 'General', 'address'),
(40, 'Tipus d''Adreça', 'General', 'address_type'),
(41, 'Regió', 'General', 'region'),
(42, 'Tipus de Regió', 'General', 'region_type'),
(43, 'Tipus d''Obra', 'General', 'artwork_type'),
(44, 'Obra Inmaterial', 'General', 'nonmaterial'),
(45, 'Tipus d''obra Inmaterial', 'General', 'nonmaterial_type'),
(46, 'Imatge', 'General', 'image'),
(47, 'Obra Material', 'General', 'material'),
(48, 'Tipus d''obra Material', 'General', 'material_type'),
(49, 'Actiu', 'General', 'asset'),
(50, 'Registre', 'General', 'record'),
(51, 'Tipus de Registre', 'General', 'record_type'),
(52, 'Unitat', 'General', 'unit'),
(53, 'Tipus d''Unitat', 'General', 'unit_type'),
(54, 'Equivalencia entre Unitats', 'General', 'unitratio'),
(55, 'Compte CES', 'General', 'accountces'),
(56, 'Compte Bancari', 'General', 'accountbank'),
(57, 'Compte Criptomoneda', 'General', 'accountcrypto'),
(58, 'Registre CI', 'Welcome', 'ic_record'),
(59, 'c- Tipus CI', 'Welcome', 'ic_type'),
(60, 'Tipus de Registre', 'Welcome', 'ic_record_type'),
(61, 'Alta de Soci CI', 'Welcome', 'ic_membership'),
(62, 'Alta de Soci Afí CI', 'Welcome', 'ic_akin_membership'),
(63, 'Alta de Soci Cooperatius individual CI', 'Welcome', 'ic_person_membership'),
(64, 'Alta de Projecte Col·lectiu CI', 'Welcome', 'ic_project_membership'),
(65, 'Soci Autoocupat', 'Welcome', 'ic_self_employed'),
(66, 'Soci Firaire', 'Welcome', 'ic_stallholder'),
(67, 'Sessió formativa', 'Welcome', 'learn_session'),
(68, 'Expedient Projecte Productiu', 'Welcome', 'project_accompaniment'),
(69, 'Quota', 'Welcome', 'fee'),
(70, 'Forma de pagament', 'Welcome', 'payment_type'),
(71, 'i c_ document', 'Welcome', 'ic_document'),
(72, 'Tipus de Document CI', 'Welcome', 'ic_document_type'),
(73, 'Contracte Laboral CI', 'Welcome', 'ic_labor_contract'),
(74, 'Contracte d''Adreça CI', 'Welcome', 'ic_address_contract'),
(75, 'Assegurança soci CI', 'Welcome', 'ic_insurance'),
(76, 'Llicència soci CI', 'Welcome', 'ic_licence'),
(77, 'Alta Membre: procés activació', 'public_form', 'registrationprofile'),
(78, 'H - Moneda', 'Invoices', 'currencies'),
(79, 'F - IVA', 'Invoices', 'vats'),
(80, 'A - Taula quotes', 'Invoices', 'tax'),
(81, 'I - Cooperativa', 'Invoices', 'coop'),
(82, 'company', 'Invoices', 'company'),
(83, 'B - Client', 'Invoices', 'client'),
(84, 'C - Proveïdor', 'Invoices', 'provider'),
(85, 'D - Socia', 'Invoices', 'cooper'),
(86, 'G - Trimestres', 'Invoices', 'period'),
(87, '01 - Factura Emesa', 'Invoices', 'sales_invoice'),
(88, '02 - Factura Despesa', 'Invoices', 'purchases_invoice'),
(89, 'Línia de factura emesa', 'Invoices', 'sales_line'),
(90, 'Línia de factura despesa', 'Invoices', 'purchases_line'),
(91, 'L - Abonament', 'Invoices', 'sales_movement'),
(92, 'M - Reintegrament', 'Invoices', 'purchases_movement'),
(93, '03 - Resultats', 'Invoices', 'period_close'),
(94, 'Pagament', 'Invoices', 'period_payment'),
(95, 'E - Importar CSV (socies)', 'Invoices', 'csvimport'),
(96, 'email', 'Invoices', 'email'),
(97, 'J - Notificacions programades', 'Invoices', 'emailnotification'),
(98, 'K - Transaccions', 'Invoices', 'cooper_proxy_transactions'),
(99, 'L - Balanç projecte', 'Invoices', 'cooper_proxy_balance'),
(100, 'B - Els meus clients i proveïdors', 'Invoices', 'cooper_proxy_companies');

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
('q9n0sopjcn3ftwok6k3u45er6jx4r60d', 'Y2RhMzQxYzllZWY3YWUyNDgzYTdhZWUyYjc2M2U1MDc2ZDM4ZjkxODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mjd9', '2014-08-24 21:28:38'),
('r54i6zea57cpv1tmwm1umtforyc2jkjs', 'OWNmZGI5MDhjY2ZkNWFkOTQ0NDE4ODM5YmY5NDQ2ZWJkZjM4YTEwMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiZGphbmdvX2xhbmd1YWdlIjoiY2EiLCJfYXV0aF91c2VyX2lkIjoxfQ==', '2014-08-24 20:46:54');

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
  `address_type_id` int(11) DEFAULT NULL,
  `p_address` varchar(200) NOT NULL,
  `town` varchar(150) NOT NULL,
  `postalcode` varchar(5) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `telephone` varchar(20) NOT NULL,
  `ic_larder` tinyint(1) NOT NULL,
  `main_address` tinyint(1) NOT NULL,
  `size` decimal(20,2) DEFAULT NULL,
  `size_unit_id` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `General_address_4b4cf59f` (`address_type_id`),
  KEY `General_address_55a4ce96` (`region_id`),
  KEY `General_address_4f62c404` (`size_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_address_jobs`
--

CREATE TABLE IF NOT EXISTS `General_address_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `General_address_jobs_address_id_251bea37_uniq` (`address_id`,`job_id`),
  KEY `General_address_jobs_3ac8a70a` (`address_id`),
  KEY `General_address_jobs_218f3960` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_address_type`
--

CREATE TABLE IF NOT EXISTS `General_address_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_address_type`
--

INSERT INTO `General_address_type` (`space_type_id`) VALUES
(44),
(45),
(46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_artwork_type`
--

CREATE TABLE IF NOT EXISTS `General_artwork_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_artwork_type`
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
(38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_asset`
--

CREATE TABLE IF NOT EXISTS `General_asset` (
  `material_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_being_type`
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
(33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_company`
--

CREATE TABLE IF NOT EXISTS `General_company` (
  `human_id` int(11) NOT NULL,
  `company_type_id` int(11) DEFAULT NULL,
  `legal_name` varchar(200) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_company_type`
--

INSERT INTO `General_company_type` (`being_type_id`) VALUES
(19),
(20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_human`
--

CREATE TABLE IF NOT EXISTS `General_human` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `General_human`
--

INSERT INTO `General_human` (`id`, `name`, `birth_date`, `death_date`, `nickname`, `email`, `telephone`, `website`, `description`) VALUES
(1, '', NULL, NULL, 'ss', 'dgsg@sdgds.es', '', '', NULL),
(2, '', NULL, NULL, 'sss', 'dgsg@sdgds.es', '', '', NULL),
(3, '', NULL, NULL, 'ssfs', 'dfgsg@sdgds.es', '', '', NULL),
(4, '', NULL, NULL, 'dsgsdg', 'dgsdg@dgsdg.es', '', '', NULL),
(5, '', NULL, NULL, 'dsgsddg', 'dgsdgd@dgsdg.es', '', '', NULL),
(6, 'coperativa', NULL, NULL, '', '', '', '', ''),
(7, '', NULL, NULL, 'dgdg', 'gdg@dgd.es', '', '', NULL),
(8, '', NULL, NULL, 'dfdsgdsg', 'dg2@dgsdg.es', '', '', NULL),
(9, '', NULL, NULL, 'aa', 'dg@sdgs.es', '', '', NULL),
(10, '', NULL, NULL, 'aae', 'dg@sdgs.es', '', '', NULL),
(11, '', NULL, NULL, 'aaed', 'dg@sdgs.esd', '', '', NULL),
(12, 'ret', NULL, NULL, 'aaedd', 'dg@sddgs.esd', '', '', NULL),
(13, 'et', NULL, NULL, 'aaesdd', 'dg@sdsdgs.esd', '', '', NULL),
(14, '', NULL, NULL, 'aaesdd', 'dg@sdsdgs.esd', '', '', NULL),
(15, 'tet', NULL, NULL, 'aaesdd', 'dg@sdsdgs.esd', '', '', NULL),
(16, '', NULL, NULL, 'aaesdd', 'dg@sdsdgs.esd', '', '', NULL),
(17, 'asdgsgddg', NULL, NULL, '', '', '', 'gg', NULL),
(18, 'dd', NULL, NULL, 'asdgds', 'dgsg@dsds.es', '', '', NULL),
(19, 'dd', NULL, NULL, '', '', '', 'ddd', NULL),
(20, 'tet', NULL, NULL, 'tert', 'gfg2dfg@es.es', '', '', NULL),
(21, 'espairamon', NULL, NULL, '', '', '', 'e', NULL),
(22, 'dd', NULL, NULL, 'dgdgs', 'dsgss@dsgfdg.es', '', '', NULL),
(23, '', NULL, NULL, 'dgsdg', 'sdg@sddg.es', '', '', NULL),
(24, 'd', NULL, NULL, 'dgsdgd', 'sdg@sddg.es', '', '', NULL),
(25, 'sdfsdg', NULL, NULL, 'dgssdgd', 'sdsg@sddg.es', '', '', NULL),
(26, 'ddddd', NULL, NULL, 'juan', 'ja@di.es', '', '', NULL),
(27, 'miproject', NULL, NULL, '', '', '', 'sinweb', NULL),
(28, 'ddd', NULL, NULL, 'luis', 'ja@di.es', '', '', NULL),
(29, 'miproject2', NULL, NULL, '', '', '', 'sinweb', NULL),
(30, 'ddddd', NULL, NULL, 'jose', 'jose@josre.es', '', '', NULL),
(31, 'clara', NULL, NULL, 'clara', 'ca@dsg.es', '', '', NULL),
(32, 'marc', NULL, NULL, 'marc', 'marc@proje.es', '', '', NULL),
(33, 'butterwalk', NULL, NULL, '', '', '', 'notinc', NULL),
(34, 'marc1', NULL, NULL, 'marc1', 'marc@dsg.es', '', '', NULL),
(35, 'marc', NULL, NULL, '', '', '', 'marc', NULL),
(36, 'manuel', NULL, NULL, 'manuel', 'dsgsd@dsgd.es', '', '', NULL),
(37, 'manuel2 (manuel2)', NULL, NULL, 'manuel2', 'dsgsd@dsgd.es', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_image`
--

CREATE TABLE IF NOT EXISTS `General_image` (
  `nonmaterial_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`nonmaterial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_job`
--

CREATE TABLE IF NOT EXISTS `General_job` (
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
  KEY `General_job_20e079f4` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_material`
--

CREATE TABLE IF NOT EXISTS `General_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_nonmaterial`
--

CREATE TABLE IF NOT EXISTS `General_nonmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_person`
--

CREATE TABLE IF NOT EXISTS `General_person` (
  `human_id` int(11) NOT NULL,
  `surnames` varchar(200) NOT NULL,
  `id_card` varchar(9) NOT NULL,
  `email2` varchar(75) NOT NULL,
  `nickname2` varchar(50) NOT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `General_person`
--

INSERT INTO `General_person` (`human_id`, `surnames`, `id_card`, `email2`, `nickname2`) VALUES
(1, '', '', '', ''),
(2, '', '', '', ''),
(3, '', '', '', ''),
(4, '', '', '', ''),
(5, '', '', '', ''),
(7, '', '', '', ''),
(8, '', '', '', ''),
(9, '', '', '', ''),
(10, '', '', '', ''),
(11, '', '', '', ''),
(12, '', '', '', ''),
(13, '', '', '', ''),
(14, '', '', '', ''),
(15, '', '', '', ''),
(16, '', '', '', ''),
(18, '', '', '', ''),
(20, '', '', '', ''),
(22, '', '', '', ''),
(23, '', '', '', ''),
(24, '', '', '', ''),
(25, '', '', '', ''),
(26, '', '', '', ''),
(28, '', '', '', ''),
(30, '', '', '', ''),
(31, '', '', '', ''),
(32, '', '', '', ''),
(34, '', '', '', ''),
(36, '', '', '', ''),
(37, '', '3333', '', '');

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

--
-- Volcado de datos para la tabla `General_project`
--

INSERT INTO `General_project` (`human_id`, `project_type_id`, `parent_id`, `socialweb`, `email2`, `ecommerce`, `lft`, `rght`, `tree_id`, `level`) VALUES
(6, NULL, NULL, '', '', 0, 1, 2, 1, 0),
(17, NULL, NULL, '', '', 0, 1, 2, 2, 0),
(19, NULL, NULL, '', '', 0, 1, 2, 3, 0),
(21, NULL, NULL, '', '', 0, 1, 2, 4, 0),
(27, NULL, NULL, '', '', 0, 1, 2, 5, 0),
(29, NULL, NULL, '', '', 0, 1, 2, 6, 0),
(33, NULL, NULL, '', '', 0, 1, 2, 7, 0),
(35, NULL, NULL, '', '', 0, 1, 2, 8, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_project_images`
--

CREATE TABLE IF NOT EXISTS `General_project_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `General_project_images_project_id_554136b_uniq` (`project_id`,`image_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_project_type`
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
(33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_record`
--

CREATE TABLE IF NOT EXISTS `General_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_record_type`
--

INSERT INTO `General_record_type` (`artwork_type_id`) VALUES
(14),
(15),
(16),
(17),
(18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_region`
--

CREATE TABLE IF NOT EXISTS `General_region` (
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
  KEY `General_region_20e079f4` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_region_type`
--

CREATE TABLE IF NOT EXISTS `General_region_type` (
  `space_type_id` int(11) NOT NULL,
  PRIMARY KEY (`space_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_region_type`
--

INSERT INTO `General_region_type` (`space_type_id`) VALUES
(39),
(40),
(41),
(42),
(43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_relation`
--

CREATE TABLE IF NOT EXISTS `General_relation` (
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
  KEY `General_relation_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `General_relation`
--

INSERT INTO `General_relation` (`id`, `name`, `verb`, `gerund`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, ':Relació Humà - Humà', '', '', '', NULL, 1, 12, 1, 0, ''),
(2, ':Relació Humà - Art', '', '', '', NULL, 1, 2, 2, 0, ''),
(3, ':Relació Humà - Espai', '', '', '', NULL, 1, 2, 3, 0, ''),
(4, ':Relació Humà - Obra', '', '', '', NULL, 1, 2, 4, 0, ''),
(5, ':Relació Persona - Projecte', '', '', '', 1, 2, 9, 1, 1, ''),
(6, ':Relació Persona - Persona', '', '', '', 1, 10, 11, 1, 1, ''),
(7, 'Participació', 'participar', 'participant', '', 5, 3, 6, 1, 2, ''),
(8, 'Dinamització', 'dinamitzar', 'dinamitzant', '', 5, 7, 8, 1, 2, ''),
(9, 'Col·laboració', 'col·laborar', 'col·laborant', '', 7, 4, 5, 1, 3, '');

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
-- Estructura de tabla para la tabla `General_rel_material_jobs`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_material_materials`
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
-- Estructura de tabla para la tabla `General_rel_nonmaterial_addresses`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_nonmaterial_jobs`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_nonmaterial_nonmaterials`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_rel_nonmaterial_records`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_space_type`
--

CREATE TABLE IF NOT EXISTS `General_space_type` (
  `typ_id` int(11) NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_space_type`
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
(46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_type`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=47 ;

--
-- Volcado de datos para la tabla `General_type`
--

INSERT INTO `General_type` (`id`, `name`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, 'Ésser', '', NULL, 1, 40, 1, 0, 'Being'),
(2, 'Espai', '', NULL, 1, 22, 2, 0, 'Space'),
(3, 'Obra', '', NULL, 1, 30, 3, 0, 'Artwork'),
(4, 'Persona', '', 1, 2, 3, 1, 1, 'Person'),
(5, 'Projecte', '', 1, 4, 33, 1, 1, 'Project'),
(6, 'Empresa', '', 1, 34, 39, 1, 1, 'Company'),
(7, 'Adreça', '', 2, 2, 9, 2, 1, 'Address'),
(8, 'Regió', '', 2, 10, 21, 2, 1, 'Region'),
(9, 'Material', '', 3, 2, 3, 3, 1, 'Material'),
(10, 'Inmaterial', '', 3, 4, 5, 3, 1, 'Nonmaterial'),
(11, 'Registre', '', 3, 6, 17, 3, 1, 'Record'),
(12, 'Unitat', '', 3, 18, 29, 3, 1, 'Unit'),
(13, 'Projecte CI', '', 5, 5, 32, 1, 2, ''),
(14, 'Equivalencia d''Unitats', '', 11, 7, 8, 3, 2, 'UnitRatio'),
(15, 'Compte monetari', '', 11, 9, 16, 3, 2, ''),
(16, 'Compte CES', '', 15, 10, 11, 3, 3, 'AccountCes'),
(17, 'Compte Criptomoneda', '', 15, 12, 13, 3, 3, 'AccountCrypto'),
(18, 'Compte Bancari', '', 15, 14, 15, 3, 3, 'AccountCrypto'),
(19, 'Cooperativa', '', 6, 35, 36, 1, 2, ''),
(20, 'Bancaria', '', 6, 37, 38, 1, 2, ''),
(21, 'Nucli d''Autogestió Local', '', 23, 7, 8, 1, 4, ''),
(22, 'Ecoxarxa', '', 23, 9, 10, 1, 4, ''),
(23, 'Públic', '', 13, 6, 17, 1, 3, ''),
(24, 'Cooperativa Integral', '', 23, 11, 12, 1, 4, ''),
(25, 'Productiu Public', '', 23, 13, 14, 1, 4, ''),
(26, 'Servei Comú', '', 23, 15, 16, 1, 4, ''),
(27, 'Cooperatiu Col·lectiu', '', 13, 18, 19, 1, 3, ''),
(28, 'Grup de Consum', '', 13, 20, 21, 1, 3, ''),
(29, 'De Serveis', '', 13, 22, 23, 1, 3, ''),
(30, 'PAIC sense facturació', '', 13, 24, 25, 1, 3, ''),
(31, 'Autoocupat', '', 13, 26, 31, 1, 3, ''),
(32, 'Autoocupat Firaire', '', 31, 27, 28, 1, 4, ''),
(33, 'PAIC amb facturació', '', 31, 29, 30, 1, 4, ''),
(34, 'Moneda', '', 12, 19, 26, 3, 2, ''),
(35, 'Moneda Social', '', 34, 20, 21, 3, 3, ''),
(36, 'Criptomoneda', '', 34, 22, 23, 3, 3, ''),
(37, 'Moneda Fiat', '', 34, 24, 25, 3, 3, ''),
(38, 'Àrea', '', 12, 27, 28, 3, 2, ''),
(39, 'Continent', '', 8, 11, 20, 2, 2, ''),
(40, 'País', '', 39, 12, 19, 2, 3, ''),
(41, 'Comunitat Cultural', '', 40, 13, 18, 2, 4, ''),
(42, 'Bioregió', '', 41, 14, 15, 2, 5, ''),
(43, 'Comarca', '', 41, 16, 17, 2, 5, ''),
(44, 'Espai Polivalent Col·lectiu', '', 7, 3, 4, 2, 2, ''),
(45, 'Taller', '', 7, 5, 6, 2, 2, ''),
(46, 'Habitatge', '', 7, 7, 8, 2, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `General_unit`
--

CREATE TABLE IF NOT EXISTS `General_unit` (
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
  KEY `General_unit_6922ec88` (`human_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `General_unit`
--

INSERT INTO `General_unit` (`id`, `name`, `description`, `unit_type_id`, `code`, `region_id`, `human_id`) VALUES
(1, 'sgsdg', 'dsg', 34, 'gdg', NULL, NULL),
(2, 'EURO', 'DGSDG', 37, 'eur', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `General_unit_type`
--

INSERT INTO `General_unit_type` (`artwork_type_id`) VALUES
(34),
(35),
(36),
(37),
(38);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  UNIQUE KEY `Invoices_cooper_clients_cooper_id_7fbfdb8a_uniq` (`cooper_id`,`client_id`),
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
  UNIQUE KEY `Invoices_cooper_providers_cooper_id_5e76dda6_uniq` (`cooper_id`,`provider_id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  UNIQUE KEY `Invoices_period_close_cooper_id_2a9f9af_uniq` (`cooper_id`,`period_id`),
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
  UNIQUE KEY `Invoices_sales_invoice_cooper_id_75c7be50_uniq` (`cooper_id`,`period_id`,`num`),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices_vats`
--

CREATE TABLE IF NOT EXISTS `Invoices_vats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `public_form_registrationprofile`
--

CREATE TABLE IF NOT EXISTS `public_form_registrationprofile` (
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
  KEY `public_form_registrationprofile_ac580b38` (`record_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `public_form_registrationprofile`
--

INSERT INTO `public_form_registrationprofile` (`id`, `user_id`, `activation_key`, `person_id`, `project_id`, `record_type_id`) VALUES
(1, 2, 'ALREADY_ACTIVATED', 1, NULL, 7),
(2, 3, 'ALREADY_ACTIVATED', 2, NULL, 7),
(3, 4, 'ALREADY_ACTIVATED', 3, NULL, 7),
(4, 5, 'ALREADY_ACTIVATED', 4, NULL, 4),
(5, 6, 'ALREADY_ACTIVATED', 5, NULL, 4),
(6, 7, 'ALREADY_ACTIVATED', 7, NULL, 4),
(7, 8, 'ab71a330546c0a26b1333e1b7711988e9a522a6c', 8, NULL, 4),
(8, 9, '0bde721584844ecf2f2191466d074fd2326711a6', 9, NULL, 7),
(9, 10, '0c9cde5a908771ee8b5dd2c5f24b9d68f4faec3a', 10, NULL, 7),
(10, 11, '927efa857b1e3ce97223121e6ca0f840f9171a1f', 11, NULL, 7),
(11, 12, 'c2ee39d21c9535fd8f95174d30c66c70b7cc1be9', 12, NULL, 7),
(12, 13, 'ALREADY_ACTIVATED', 16, 17, 7),
(13, 14, 'a912b281cea7765347f5a5e5e462f0436a7d5a7e', 18, 19, 7),
(14, 15, 'becdc707b5c555e33ebcd9460171c6e63ffd1f5a', 20, 21, 7),
(15, 16, '695d73ea34ed804ddb92ba0bc4c721c89b31213b', 22, NULL, 6),
(16, 17, 'ALREADY_ACTIVATED', 23, NULL, 4),
(17, 18, 'a3cdd0aacf18951f15d697824a92f0b54699947c', 24, NULL, 4),
(18, 19, '23d24792d0378a5b60f816be45930ec286cafe71', 25, NULL, 4),
(19, 20, '48d725f1e5af4cbb804d985414e1a3b6a3b4e086', 26, 27, 7),
(20, 21, '9b54734d60aa080a907ad4b74fba46cba35a43c0', 28, 29, 7),
(21, 22, 'ALREADY_ACTIVATED', 30, NULL, 4),
(22, 23, 'ALREADY_ACTIVATED', 31, NULL, 4),
(23, 24, 'ALREADY_ACTIVATED', 32, 33, 7),
(24, 25, 'ALREADY_ACTIVATED', 34, 35, 7),
(25, 26, 'ALREADY_ACTIVATED', 36, NULL, 4),
(26, 27, 'ALREADY_ACTIVATED', 37, NULL, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `south_migrationhistory`
--

INSERT INTO `south_migrationhistory` (`id`, `app_name`, `migration`, `applied`) VALUES
(1, 'General', '0001_initial', '2014-08-10 17:23:31'),
(2, 'Welcome', '0001_initial', '2014-08-10 17:24:11'),
(3, 'public_form', '0001_initial', '2014-08-10 17:24:34'),
(4, 'Invoices', '0001_initial', '2014-08-10 17:26:16'),
(5, 'Welcome', '0002_auto__del_ic_akin_membership', '2014-08-10 17:30:58'),
(6, 'Welcome', '0003_auto__add_ic_akin_membership', '2014-08-10 17:31:27'),
(7, 'Welcome', '0004_auto__add_field_ic_project_membership_person', '2014-08-10 17:56:19');

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
  KEY `Welcome_fee_5b622010` (`rel_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Welcome_fee`
--

INSERT INTO `Welcome_fee` (`ic_record_id`, `human_id`, `project_id`, `amount`, `unit_id`, `membership_id`, `issue_date`, `deadline_date`, `payment_date`, `payment_type_id`, `rel_account_id`) VALUES
(16, 25, 6, 30.00, 2, 15, '2014-08-10', '2014-08-15', NULL, NULL, NULL),
(18, 26, 6, 60.00, 2, 17, '2014-08-10', '2014-08-15', NULL, NULL, NULL),
(20, 28, 6, 60.00, 2, 19, '2014-08-10', '2014-08-15', NULL, NULL, NULL),
(22, 30, 6, 30.00, 2, 21, '2014-08-10', '2014-08-15', NULL, NULL, NULL),
(24, 31, 6, 30.00, 2, 23, '2014-08-10', '2014-08-15', NULL, 20, NULL),
(27, 34, 6, 60.00, 2, 26, '2014-08-10', '2014-08-15', NULL, NULL, NULL),
(31, 37, 6, 30.00, 2, 30, '2014-08-10', '2014-08-15', NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_akin_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_akin_membership` (
  `ic_membership_ptr_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_membership_ptr_id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Welcome_ic_akin_membership`
--

INSERT INTO `Welcome_ic_akin_membership` (`ic_membership_ptr_id`, `person_id`) VALUES
(7, 8),
(13, 24),
(15, 25),
(21, 30),
(23, 31),
(30, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_document`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_document` (
  `ic_record_id` int(11) NOT NULL,
  `doc_type_id` int(11) DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_document_ca3e294e` (`doc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_document_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_document_type` (
  `record_type_id` int(11) NOT NULL,
  PRIMARY KEY (`record_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Welcome_ic_document_type`
--

INSERT INTO `Welcome_ic_document_type` (`record_type_id`) VALUES
(12),
(13),
(14),
(15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_insurance`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_insurance` (
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
  KEY `Welcome_ic_insurance_bfdae731` (`rel_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_licence`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_licence` (
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
  KEY `Welcome_ic_licence_bfdae731` (`rel_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `ic_CESnum` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labor_contract_id` int(11) DEFAULT NULL,
  `virtual_market` tinyint(1) NOT NULL,
  PRIMARY KEY (`ic_record_id`),
  UNIQUE KEY `labor_contract_id` (`labor_contract_id`),
  KEY `Welcome_ic_membership_6922ec88` (`human_id`),
  KEY `Welcome_ic_membership_e45b149f` (`ic_project_id`),
  KEY `Welcome_ic_membership_2731fa00` (`contribution_id`),
  KEY `Welcome_ic_membership_3f4dd712` (`join_fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Welcome_ic_membership`
--

INSERT INTO `Welcome_ic_membership` (`ic_record_id`, `human_id`, `ic_project_id`, `contribution_id`, `join_date`, `end_date`, `join_fee_id`, `ic_CESnum`, `labor_contract_id`, `virtual_market`) VALUES
(7, 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 18, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 20, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 22, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 24, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(15, 25, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(17, 26, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(19, 28, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(21, 30, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(23, 31, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(26, 34, 6, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(30, 37, 6, NULL, '2014-08-10', NULL, 16, '', NULL, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_person_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_person_membership` (
  `ic_membership_ptr_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_membership_ptr_id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Welcome_ic_person_membership`
--

INSERT INTO `Welcome_ic_person_membership` (`ic_membership_ptr_id`, `person_id`) VALUES
(11, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_project_membership`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_project_membership` (
  `ic_membership_ptr_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_membership_ptr_id`),
  UNIQUE KEY `project_id` (`project_id`),
  UNIQUE KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Welcome_ic_project_membership`
--

INSERT INTO `Welcome_ic_project_membership` (`ic_membership_ptr_id`, `project_id`, `person_id`) VALUES
(9, 19, 2),
(10, 21, 20),
(17, 27, 26),
(19, 29, 28),
(26, 35, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_record`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Welcome_ic_record_ac580b38` (`record_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Volcado de datos para la tabla `Welcome_ic_record`
--

INSERT INTO `Welcome_ic_record` (`id`, `name`, `description`, `record_type_id`) VALUES
(7, NULL, NULL, 4),
(9, NULL, NULL, 7),
(10, 'alta Projecte Col·lectiu:  (tert)', '', 7),
(11, NULL, NULL, 6),
(13, NULL, NULL, 4),
(15, NULL, NULL, 4),
(16, 'fsdfsdf', NULL, NULL),
(17, 'sdgdsg', NULL, 7),
(18, 'ddd', NULL, NULL),
(19, NULL, NULL, 7),
(20, 'dddddd', NULL, NULL),
(21, 'dgsdgdg', NULL, 4),
(22, 'dgsdg', NULL, NULL),
(23, 'dgsdg', NULL, 4),
(24, 'alta Soci Afí Individual: clara (clara) [30.00 eur] > ', NULL, 4),
(26, NULL, NULL, 7),
(27, NULL, NULL, NULL),
(30, 'alta Soci Afí Individual: manuel2 (manuel2)', '', 4),
(31, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_record_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_record_type` (
  `ic_type_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Welcome_ic_record_type`
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
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(23),
(24);

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
  `rel_accountBank_id` int(11) DEFAULT NULL,
  `assigned_vat` decimal(4,2) NOT NULL,
  `review_vat` tinyint(1) NOT NULL,
  `last_review_date` date DEFAULT NULL,
  `mentor_membership_id` int(11) DEFAULT NULL,
  `mentor_comment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ic_record_id`),
  KEY `Welcome_ic_self_employed_1818c0ae` (`membership_id`),
  KEY `Welcome_ic_self_employed_259761f6` (`rel_accountBank_id`),
  KEY `Welcome_ic_self_employed_5bec29b3` (`mentor_membership_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_self_employed_rel_address_contracts`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_address_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_address_contract_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_address_contract_id`),
  KEY `Welcome_ic_self_employed_rel_address_contracts_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_address_contracts_e60246de` (`ic_address_contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_self_employed_rel_images`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`image_id`),
  KEY `Welcome_ic_self_employed_rel_images_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_images_06df7330` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_self_employed_rel_insurances`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_insurance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_insurance_id`),
  KEY `Welcome_ic_self_employed_rel_insurances_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_insurances_948dcf14` (`ic_insurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_self_employed_rel_licences`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_self_employed_rel_licences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_self_employed_id` int(11) NOT NULL,
  `ic_licence_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ic_self_employed_id` (`ic_self_employed_id`,`ic_licence_id`),
  KEY `Welcome_ic_self_employed_rel_licences_da7dce9e` (`ic_self_employed_id`),
  KEY `Welcome_ic_self_employed_rel_licences_36f9f36d` (`ic_licence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_stallholder`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_stallholder` (
  `ic_self_employed_id` int(11) NOT NULL,
  `tent_type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ic_self_employed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_ic_type` (
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
  KEY `Welcome_ic_type_20e079f4` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `Welcome_ic_type`
--

INSERT INTO `Welcome_ic_type` (`id`, `name`, `description`, `parent_id`, `lft`, `rght`, `tree_id`, `level`, `clas`) VALUES
(1, 'Registre CI', '', NULL, 1, 38, 1, 0, 'iC_Record'),
(2, 'Forma de Pagament', '', NULL, 1, 10, 2, 0, 'Payment_Type'),
(3, 'Alta de Membre', '', 1, 2, 17, 1, 1, ''),
(4, 'alta Soci Afí Individual', '', 3, 3, 4, 1, 2, 'iC_Akin_Membership'),
(5, 'alta Soci CI', '', 3, 5, 12, 1, 2, 'iC_Membership'),
(6, 'alta Soci Cooperatiu Individual', '', 5, 6, 7, 1, 3, 'ic_Person_Membership'),
(7, 'alta Projecte Col·lectiu', '', 5, 8, 9, 1, 3, 'ic_Project_Membership'),
(8, 'alta Projecte Públic', '', 5, 10, 11, 1, 3, ''),
(9, 'alta Projecte Autoocupat', '', 3, 13, 16, 1, 2, 'iC_Self_Employed'),
(10, 'alta Projecte Firaire', '', 9, 14, 15, 1, 3, 'iC_Stallholder'),
(11, 'Document CI', '', 1, 18, 27, 1, 1, 'iC_Document'),
(12, 'Contracte d''Adreça', '', 11, 19, 20, 1, 2, 'iC_Address_Contract'),
(13, 'Llicència soci', '', 11, 21, 22, 1, 2, 'iC_Licence'),
(14, 'Assegurança soci', '', 11, 23, 24, 1, 2, 'iC_Insurance'),
(15, 'Contracte Laboral', '', 11, 25, 26, 1, 2, 'iC_Labor_Contract'),
(16, 'Quota', '', 1, 28, 33, 1, 1, 'Fee'),
(17, 'Acompanyament de Projecte', '', 1, 34, 35, 1, 1, 'Project_Accompaniment'),
(18, 'Sessió / Formació', '', 1, 36, 37, 1, 1, 'Learn_Session'),
(19, 'pagament en Moneda Social', '', 2, 2, 3, 2, 1, ''),
(20, 'pagament en Metàl·lic', '', 2, 4, 5, 2, 1, ''),
(21, 'pagament amb Hores de Treball', '', 2, 6, 7, 2, 1, ''),
(22, 'pagament amb Criptomoneda', '', 2, 8, 9, 2, 1, ''),
(23, 'quota d''Alta', '', 16, 29, 30, 1, 2, ''),
(24, 'quota Trimestral', '', 16, 31, 32, 1, 2, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_payment_type`
--

CREATE TABLE IF NOT EXISTS `Welcome_payment_type` (
  `ic_type_id` int(11) NOT NULL,
  PRIMARY KEY (`ic_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `Welcome_payment_type`
--

INSERT INTO `Welcome_payment_type` (`ic_type_id`) VALUES
(19),
(20),
(21),
(22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_project_accompaniment`
--

CREATE TABLE IF NOT EXISTS `Welcome_project_accompaniment` (
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
  KEY `Welcome_project_accompaniment_024adddb` (`facilitator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  ADD CONSTRAINT `unit_id_refs_id_e5728480` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `company_id_refs_human_id_466f5e8e` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_d6164342` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_a20996dc` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `General_accountces`
--
ALTER TABLE `General_accountces`
  ADD CONSTRAINT `unit_id_refs_id_07a72ac8` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `entity_id_refs_human_id_935d5d48` FOREIGN KEY (`entity_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_da305fb3` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_2286902b` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

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
-- Filtros para la tabla `General_address_jobs`
--
ALTER TABLE `General_address_jobs`
  ADD CONSTRAINT `job_id_refs_id_89cfbedd` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `address_id_refs_id_b5c5216e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`);

--
-- Filtros para la tabla `General_address_type`
--
ALTER TABLE `General_address_type`
  ADD CONSTRAINT `space_type_id_refs_typ_id_9112582a` FOREIGN KEY (`space_type_id`) REFERENCES `General_space_type` (`typ_id`);

--
-- Filtros para la tabla `General_artwork_type`
--
ALTER TABLE `General_artwork_type`
  ADD CONSTRAINT `typ_id_refs_id_37a269e1` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`);

--
-- Filtros para la tabla `General_asset`
--
ALTER TABLE `General_asset`
  ADD CONSTRAINT `human_id_refs_id_cbd3fba4` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `material_id_refs_id_a349c1f5` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`);

--
-- Filtros para la tabla `General_being_type`
--
ALTER TABLE `General_being_type`
  ADD CONSTRAINT `typ_id_refs_id_8745a66c` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`);

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
-- Filtros para la tabla `General_image`
--
ALTER TABLE `General_image`
  ADD CONSTRAINT `nonmaterial_id_refs_id_c84188d9` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_job`
--
ALTER TABLE `General_job`
  ADD CONSTRAINT `parent_id_refs_id_a2f76742` FOREIGN KEY (`parent_id`) REFERENCES `General_job` (`id`);

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
  ADD CONSTRAINT `parent_id_refs_human_id_cb4b7459` FOREIGN KEY (`parent_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_c0052093` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `project_type_id_refs_being_type_id_bdad21d0` FOREIGN KEY (`project_type_id`) REFERENCES `General_project_type` (`being_type_id`);

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
  ADD CONSTRAINT `parent_id_refs_id_f04fb9fe` FOREIGN KEY (`parent_id`) REFERENCES `General_relation` (`id`);

--
-- Filtros para la tabla `General_rel_human_addresses`
--
ALTER TABLE `General_rel_human_addresses`
  ADD CONSTRAINT `relation_id_refs_id_2f3eeaff` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `address_id_refs_id_10b91208` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `human_id_refs_id_7504d2e7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `General_rel_human_companies`
--
ALTER TABLE `General_rel_human_companies`
  ADD CONSTRAINT `relation_id_refs_id_e6d593f3` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `company_id_refs_human_id_71dbec55` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `human_id_refs_id_e5fc194f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `General_rel_human_jobs`
--
ALTER TABLE `General_rel_human_jobs`
  ADD CONSTRAINT `relation_id_refs_id_6bff0d33` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_e1b3b25a` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `job_id_refs_id_8fcd99c8` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`);

--
-- Filtros para la tabla `General_rel_human_materials`
--
ALTER TABLE `General_rel_human_materials`
  ADD CONSTRAINT `relation_id_refs_id_a156018f` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_27a27746` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `material_id_refs_id_096e6125` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`);

--
-- Filtros para la tabla `General_rel_human_nonmaterials`
--
ALTER TABLE `General_rel_human_nonmaterials`
  ADD CONSTRAINT `relation_id_refs_id_759394a9` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_fa4695a7` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_9eb375a4` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_rel_human_persons`
--
ALTER TABLE `General_rel_human_persons`
  ADD CONSTRAINT `relation_id_refs_id_4d87a191` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_0f3df09c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `person_id_refs_human_id_c2292566` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`);

--
-- Filtros para la tabla `General_rel_human_projects`
--
ALTER TABLE `General_rel_human_projects`
  ADD CONSTRAINT `relation_id_refs_id_ba34c004` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_a037337f` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `project_id_refs_human_id_ff302cd2` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`);

--
-- Filtros para la tabla `General_rel_human_records`
--
ALTER TABLE `General_rel_human_records`
  ADD CONSTRAINT `relation_id_refs_id_f06466de` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_4b3e025c` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `record_id_refs_id_9dc62d11` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `General_rel_human_regions`
--
ALTER TABLE `General_rel_human_regions`
  ADD CONSTRAINT `relation_id_refs_id_2f9e896a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_aff17d88` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `region_id_refs_id_5965961e` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`);

--
-- Filtros para la tabla `General_rel_material_addresses`
--
ALTER TABLE `General_rel_material_addresses`
  ADD CONSTRAINT `relation_id_refs_id_ef8a49fc` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `address_id_refs_id_705aef0e` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `material_id_refs_id_bbaf7619` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`);

--
-- Filtros para la tabla `General_rel_material_jobs`
--
ALTER TABLE `General_rel_material_jobs`
  ADD CONSTRAINT `relation_id_refs_id_16536571` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `job_id_refs_id_9d643e60` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `material_id_refs_id_619f712c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`);

--
-- Filtros para la tabla `General_rel_material_materials`
--
ALTER TABLE `General_rel_material_materials`
  ADD CONSTRAINT `relation_id_refs_id_bab781c4` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `material2_id_refs_id_2740db72` FOREIGN KEY (`material2_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `material_id_refs_id_2740db72` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`);

--
-- Filtros para la tabla `General_rel_material_nonmaterials`
--
ALTER TABLE `General_rel_material_nonmaterials`
  ADD CONSTRAINT `relation_id_refs_id_b7f51b83` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `material_id_refs_id_dd74c330` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_65ad546f` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_rel_material_records`
--
ALTER TABLE `General_rel_material_records`
  ADD CONSTRAINT `relation_id_refs_id_c378f6c7` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `material_id_refs_id_0f893e3c` FOREIGN KEY (`material_id`) REFERENCES `General_material` (`id`),
  ADD CONSTRAINT `record_id_refs_id_2ce02938` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `General_rel_nonmaterial_addresses`
--
ALTER TABLE `General_rel_nonmaterial_addresses`
  ADD CONSTRAINT `relation_id_refs_id_50c1c3d8` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `address_id_refs_id_7fe0517a` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_1bb0b026` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_rel_nonmaterial_jobs`
--
ALTER TABLE `General_rel_nonmaterial_jobs`
  ADD CONSTRAINT `relation_id_refs_id_3a8d4d6d` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `job_id_refs_id_32aeb4f3` FOREIGN KEY (`job_id`) REFERENCES `General_job` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_8a14fd3c` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_rel_nonmaterial_nonmaterials`
--
ALTER TABLE `General_rel_nonmaterial_nonmaterials`
  ADD CONSTRAINT `relation_id_refs_id_98ed753a` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `nonmaterial2_id_refs_id_872f31c6` FOREIGN KEY (`nonmaterial2_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_872f31c6` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `General_rel_nonmaterial_records`
--
ALTER TABLE `General_rel_nonmaterial_records`
  ADD CONSTRAINT `relation_id_refs_id_bab73c08` FOREIGN KEY (`relation_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_eba277fb` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`),
  ADD CONSTRAINT `record_id_refs_id_9f9268bf` FOREIGN KEY (`record_id`) REFERENCES `General_record` (`id`);

--
-- Filtros para la tabla `General_space_type`
--
ALTER TABLE `General_space_type`
  ADD CONSTRAINT `typ_id_refs_id_5dcfea05` FOREIGN KEY (`typ_id`) REFERENCES `General_type` (`id`);

--
-- Filtros para la tabla `General_type`
--
ALTER TABLE `General_type`
  ADD CONSTRAINT `parent_id_refs_id_4c09e283` FOREIGN KEY (`parent_id`) REFERENCES `General_type` (`id`);

--
-- Filtros para la tabla `General_unit`
--
ALTER TABLE `General_unit`
  ADD CONSTRAINT `human_id_refs_id_5eaaaa15` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `region_id_refs_id_c4f5f71c` FOREIGN KEY (`region_id`) REFERENCES `General_region` (`id`),
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
  ADD CONSTRAINT `coop_id_refs_id_32a70915` FOREIGN KEY (`coop_id`) REFERENCES `Invoices_coop` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4e0da4ad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `Invoices_cooper_clients`
--
ALTER TABLE `Invoices_cooper_clients`
  ADD CONSTRAINT `client_id_refs_company_ptr_id_47b197bc` FOREIGN KEY (`client_id`) REFERENCES `Invoices_client` (`company_ptr_id`),
  ADD CONSTRAINT `cooper_id_refs_id_e1b00501` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`);

--
-- Filtros para la tabla `Invoices_cooper_providers`
--
ALTER TABLE `Invoices_cooper_providers`
  ADD CONSTRAINT `provider_id_refs_company_ptr_id_76872955` FOREIGN KEY (`provider_id`) REFERENCES `Invoices_provider` (`company_ptr_id`),
  ADD CONSTRAINT `cooper_id_refs_id_51eca6db` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`);

--
-- Filtros para la tabla `Invoices_emailnotification`
--
ALTER TABLE `Invoices_emailnotification`
  ADD CONSTRAINT `sent_to_user_id_refs_id_6ec8b209` FOREIGN KEY (`sent_to_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `email_ptr_id_refs_id_39c11a23` FOREIGN KEY (`email_ptr_id`) REFERENCES `Invoices_email` (`id`),
  ADD CONSTRAINT `period_id_refs_id_0b714fd0` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`);

--
-- Filtros para la tabla `Invoices_period_close`
--
ALTER TABLE `Invoices_period_close`
  ADD CONSTRAINT `cooper_id_refs_id_bcea9d40` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `period_id_refs_id_ff19a1b5` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`);

--
-- Filtros para la tabla `Invoices_period_payment`
--
ALTER TABLE `Invoices_period_payment`
  ADD CONSTRAINT `currency_id_refs_id_05753da2` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`),
  ADD CONSTRAINT `period_close_id_refs_id_e986744e` FOREIGN KEY (`period_close_id`) REFERENCES `Invoices_period_close` (`id`);

--
-- Filtros para la tabla `Invoices_provider`
--
ALTER TABLE `Invoices_provider`
  ADD CONSTRAINT `company_ptr_id_refs_id_3e1babba` FOREIGN KEY (`company_ptr_id`) REFERENCES `Invoices_company` (`id`);

--
-- Filtros para la tabla `Invoices_purchases_invoice`
--
ALTER TABLE `Invoices_purchases_invoice`
  ADD CONSTRAINT `provider_id_refs_company_ptr_id_67ba8602` FOREIGN KEY (`provider_id`) REFERENCES `Invoices_provider` (`company_ptr_id`),
  ADD CONSTRAINT `cooper_id_refs_id_0c68846b` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `period_id_refs_id_95b23a99` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`);

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
  ADD CONSTRAINT `currency_id_refs_id_76ff56a7` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`),
  ADD CONSTRAINT `cooper_id_refs_id_1d20a696` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`);

--
-- Filtros para la tabla `Invoices_sales_invoice`
--
ALTER TABLE `Invoices_sales_invoice`
  ADD CONSTRAINT `client_id_refs_company_ptr_id_6f3398be` FOREIGN KEY (`client_id`) REFERENCES `Invoices_client` (`company_ptr_id`),
  ADD CONSTRAINT `cooper_id_refs_id_bb4338e1` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`),
  ADD CONSTRAINT `period_id_refs_id_caf8efec` FOREIGN KEY (`period_id`) REFERENCES `Invoices_period` (`id`);

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
  ADD CONSTRAINT `currency_id_refs_id_ea1b4f9e` FOREIGN KEY (`currency_id`) REFERENCES `Invoices_currencies` (`id`),
  ADD CONSTRAINT `cooper_id_refs_id_1c3b858e` FOREIGN KEY (`cooper_id`) REFERENCES `Invoices_cooper` (`id`);

--
-- Filtros para la tabla `public_form_registrationprofile`
--
ALTER TABLE `public_form_registrationprofile`
  ADD CONSTRAINT `record_type_id_refs_ic_type_id_576eb0fe` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`),
  ADD CONSTRAINT `person_id_refs_human_id_ae1bbdf6` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `project_id_refs_human_id_62b3141c` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `user_id_refs_id_f6d62eb5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `Welcome_fee`
--
ALTER TABLE `Welcome_fee`
  ADD CONSTRAINT `payment_type_id_refs_ic_type_id_c8bafb66` FOREIGN KEY (`payment_type_id`) REFERENCES `Welcome_payment_type` (`ic_type_id`),
  ADD CONSTRAINT `human_id_refs_id_3c3445f1` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `ic_record_id_refs_id_fb734d90` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_518057e2` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `project_id_refs_human_id_028a3357` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `rel_account_id_refs_id_93465450` FOREIGN KEY (`rel_account_id`) REFERENCES `General_record` (`id`),
  ADD CONSTRAINT `unit_id_refs_id_d83a16d0` FOREIGN KEY (`unit_id`) REFERENCES `General_unit` (`id`);

--
-- Filtros para la tabla `Welcome_ic_address_contract`
--
ALTER TABLE `Welcome_ic_address_contract`
  ADD CONSTRAINT `membership_id_refs_ic_record_id_b0b8e545` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `address_id_refs_id_7bcaf3bc` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `company_id_refs_human_id_9f93aaad` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_8f544de0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `price_unit_id_refs_id_a84f78ad` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`);

--
-- Filtros para la tabla `Welcome_ic_akin_membership`
--
ALTER TABLE `Welcome_ic_akin_membership`
  ADD CONSTRAINT `person_id_refs_human_id_0758e303` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `ic_membership_ptr_id_refs_ic_record_id_99c87fea` FOREIGN KEY (`ic_membership_ptr_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_document`
--
ALTER TABLE `Welcome_ic_document`
  ADD CONSTRAINT `doc_type_id_refs_record_type_id_697e0ecf` FOREIGN KEY (`doc_type_id`) REFERENCES `Welcome_ic_document_type` (`record_type_id`),
  ADD CONSTRAINT `ic_record_id_refs_id_28d2e5f7` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`);

--
-- Filtros para la tabla `Welcome_ic_document_type`
--
ALTER TABLE `Welcome_ic_document_type`
  ADD CONSTRAINT `record_type_id_refs_ic_type_id_121c74ac` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`);

--
-- Filtros para la tabla `Welcome_ic_insurance`
--
ALTER TABLE `Welcome_ic_insurance`
  ADD CONSTRAINT `company_id_refs_human_id_8dc69d9f` FOREIGN KEY (`company_id`) REFERENCES `General_company` (`human_id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_74e41ee0` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_06cb12c9` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `price_unit_id_refs_id_cf457021` FOREIGN KEY (`price_unit_id`) REFERENCES `General_unit` (`id`),
  ADD CONSTRAINT `rel_address_id_refs_id_0a733bc0` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `rel_job_id_refs_id_69cdbd47` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`);

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
  ADD CONSTRAINT `membership_id_refs_ic_record_id_b7db909c` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `ic_document_id_refs_ic_record_id_638b2aec` FOREIGN KEY (`ic_document_id`) REFERENCES `Welcome_ic_document` (`ic_record_id`),
  ADD CONSTRAINT `rel_address_id_refs_id_44aa1942` FOREIGN KEY (`rel_address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `rel_job_id_refs_id_c58b25ba` FOREIGN KEY (`rel_job_id`) REFERENCES `General_job` (`id`);

--
-- Filtros para la tabla `Welcome_ic_membership`
--
ALTER TABLE `Welcome_ic_membership`
  ADD CONSTRAINT `labor_contract_id_refs_ic_document_id_34c5d1fb` FOREIGN KEY (`labor_contract_id`) REFERENCES `Welcome_ic_labor_contract` (`ic_document_id`),
  ADD CONSTRAINT `contribution_id_refs_id_803a7b3a` FOREIGN KEY (`contribution_id`) REFERENCES `General_relation` (`id`),
  ADD CONSTRAINT `human_id_refs_id_90a969ae` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `ic_project_id_refs_human_id_5db24bd9` FOREIGN KEY (`ic_project_id`) REFERENCES `General_project` (`human_id`),
  ADD CONSTRAINT `ic_record_id_refs_id_2333c0a4` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `join_fee_id_refs_ic_record_id_b65e7f0b` FOREIGN KEY (`join_fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_membership_expositors`
--
ALTER TABLE `Welcome_ic_membership_expositors`
  ADD CONSTRAINT `ic_membership_id_refs_ic_record_id_e4a14336` FOREIGN KEY (`ic_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `address_id_refs_id_0c2b9dd4` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`);

--
-- Filtros para la tabla `Welcome_ic_person_membership`
--
ALTER TABLE `Welcome_ic_person_membership`
  ADD CONSTRAINT `person_id_refs_human_id_aa582a02` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `ic_membership_ptr_id_refs_ic_record_id_f0bf3784` FOREIGN KEY (`ic_membership_ptr_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_project_membership`
--
ALTER TABLE `Welcome_ic_project_membership`
  ADD CONSTRAINT `person_id_refs_human_id_d96529a1` FOREIGN KEY (`person_id`) REFERENCES `General_person` (`human_id`),
  ADD CONSTRAINT `ic_membership_ptr_id_refs_ic_record_id_925dedba` FOREIGN KEY (`ic_membership_ptr_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `project_id_refs_human_id_0be24c6e` FOREIGN KEY (`project_id`) REFERENCES `General_project` (`human_id`);

--
-- Filtros para la tabla `Welcome_ic_record`
--
ALTER TABLE `Welcome_ic_record`
  ADD CONSTRAINT `record_type_id_refs_ic_type_id_3360b245` FOREIGN KEY (`record_type_id`) REFERENCES `Welcome_ic_record_type` (`ic_type_id`);

--
-- Filtros para la tabla `Welcome_ic_record_type`
--
ALTER TABLE `Welcome_ic_record_type`
  ADD CONSTRAINT `ic_type_id_refs_id_6fca3ce7` FOREIGN KEY (`ic_type_id`) REFERENCES `Welcome_ic_type` (`id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed`
--
ALTER TABLE `Welcome_ic_self_employed`
  ADD CONSTRAINT `ic_record_id_refs_id_8ebb96a9` FOREIGN KEY (`ic_record_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `mentor_membership_id_refs_ic_record_id_246a38f1` FOREIGN KEY (`mentor_membership_id`) REFERENCES `Welcome_ic_membership` (`ic_record_id`),
  ADD CONSTRAINT `rel_accountBank_id_refs_record_id_939a5950` FOREIGN KEY (`rel_accountBank_id`) REFERENCES `General_accountbank` (`record_id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed_rel_address_contracts`
--
ALTER TABLE `Welcome_ic_self_employed_rel_address_contracts`
  ADD CONSTRAINT `ic_address_contract_id_refs_ic_document_id_5db41926` FOREIGN KEY (`ic_address_contract_id`) REFERENCES `Welcome_ic_address_contract` (`ic_document_id`),
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_ae5cb31f` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed_rel_fees`
--
ALTER TABLE `Welcome_ic_self_employed_rel_fees`
  ADD CONSTRAINT `fee_id_refs_ic_record_id_4078f825` FOREIGN KEY (`fee_id`) REFERENCES `Welcome_fee` (`ic_record_id`),
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_887743bd` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed_rel_images`
--
ALTER TABLE `Welcome_ic_self_employed_rel_images`
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_c3762b0a` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`),
  ADD CONSTRAINT `image_id_refs_nonmaterial_id_7ec8668d` FOREIGN KEY (`image_id`) REFERENCES `General_image` (`nonmaterial_id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed_rel_insurances`
--
ALTER TABLE `Welcome_ic_self_employed_rel_insurances`
  ADD CONSTRAINT `ic_insurance_id_refs_ic_document_id_4800d0d4` FOREIGN KEY (`ic_insurance_id`) REFERENCES `Welcome_ic_insurance` (`ic_document_id`),
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4db1169b` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_self_employed_rel_licences`
--
ALTER TABLE `Welcome_ic_self_employed_rel_licences`
  ADD CONSTRAINT `ic_licence_id_refs_ic_document_id_874c087d` FOREIGN KEY (`ic_licence_id`) REFERENCES `Welcome_ic_licence` (`ic_document_id`),
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_c9d6e611` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_stallholder`
--
ALTER TABLE `Welcome_ic_stallholder`
  ADD CONSTRAINT `ic_self_employed_id_refs_ic_record_id_4245c133` FOREIGN KEY (`ic_self_employed_id`) REFERENCES `Welcome_ic_self_employed` (`ic_record_id`);

--
-- Filtros para la tabla `Welcome_ic_type`
--
ALTER TABLE `Welcome_ic_type`
  ADD CONSTRAINT `parent_id_refs_id_d03ad36e` FOREIGN KEY (`parent_id`) REFERENCES `Welcome_ic_type` (`id`);

--
-- Filtros para la tabla `Welcome_learn_session`
--
ALTER TABLE `Welcome_learn_session`
  ADD CONSTRAINT `ic_record_ptr_id_refs_id_54767834` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `address_id_refs_id_45bf8dc6` FOREIGN KEY (`address_id`) REFERENCES `General_address` (`id`),
  ADD CONSTRAINT `facilitator_id_refs_id_9f178a2c` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `nonmaterial_id_refs_id_77877834` FOREIGN KEY (`nonmaterial_id`) REFERENCES `General_nonmaterial` (`id`);

--
-- Filtros para la tabla `Welcome_learn_session_assistants`
--
ALTER TABLE `Welcome_learn_session_assistants`
  ADD CONSTRAINT `learn_session_id_refs_ic_record_ptr_id_117f7e2c` FOREIGN KEY (`learn_session_id`) REFERENCES `Welcome_learn_session` (`ic_record_ptr_id`),
  ADD CONSTRAINT `human_id_refs_id_b83e2682` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`);

--
-- Filtros para la tabla `Welcome_payment_type`
--
ALTER TABLE `Welcome_payment_type`
  ADD CONSTRAINT `ic_type_id_refs_id_5a59f5bc` FOREIGN KEY (`ic_type_id`) REFERENCES `Welcome_ic_type` (`id`);

--
-- Filtros para la tabla `Welcome_project_accompaniment`
--
ALTER TABLE `Welcome_project_accompaniment`
  ADD CONSTRAINT `ic_record_ptr_id_refs_id_58f56a13` FOREIGN KEY (`ic_record_ptr_id`) REFERENCES `Welcome_ic_record` (`id`),
  ADD CONSTRAINT `facilitator_id_refs_id_0227f432` FOREIGN KEY (`facilitator_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `human_id_refs_id_0227f432` FOREIGN KEY (`human_id`) REFERENCES `General_human` (`id`),
  ADD CONSTRAINT `petitioner_id_refs_id_0227f432` FOREIGN KEY (`petitioner_id`) REFERENCES `General_human` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
