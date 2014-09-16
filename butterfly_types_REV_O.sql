-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-09-2014 a las 11:41:28
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
-- Estructura de tabla para la tabla `Welcome_ic_type`
--

DROP TABLE IF EXISTS `Welcome_ic_type`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `Welcome_ic_type`
--

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
(51, 'quota Trimestral Col·lectiva (Moneda fiat)', '', 41, 64, 65, 1, 3, '90-euro');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Welcome_ic_type`
--
ALTER TABLE `Welcome_ic_type`
  ADD CONSTRAINT `parent_id_refs_id_d03ad36e` FOREIGN KEY (`parent_id`) REFERENCES `Welcome_ic_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
