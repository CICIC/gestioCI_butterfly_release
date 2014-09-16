-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-09-2014 a las 05:43:17
-- Versión del servidor: 5.5.34-0ubuntu0.13.04.1
-- Versión de PHP: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `migrations`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Welcome_ic_type`
--

DROP TABLE IF EXISTS `Welcome_ic_type`;
CREATE TABLE IF NOT EXISTS `Welcome_ic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `clas` varchar(200) NOT NULL,
  `parent_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Volcado de datos para la tabla `Welcome_ic_type`
--

INSERT INTO `Welcome_ic_type` (`id`, `name`, `description`, `lft`, `rght`, `tree_id`, `level`, `clas`, `parent_id`) VALUES
(1, 'Registre CI', '', 0, 1, 56, 1, 'iC_Record', 0),
(2, 'Forma de Pagament', '', 0, 1, 16, 2, '', 0),
(3, 'alta Soci CI', '', 4, 3, 10, 1, 'iC_Membership', 2),
(4, 'Alta de Membre', '', 1, 2, 17, 1, '', 1),
(5, 'alta Proj. Autoocupat', '', 4, 11, 14, 1, 'iC_Self_Employed', 2),
(6, 'Document CI', '', 1, 18, 31, 1, 'iC_Document', 1),
(7, 'alta Soci Coop. Individual', '', 3, 4, 5, 1, 'iC_Person_Membership', 3),
(8, 'alta Proj. Col·lectiu', '', 3, 6, 7, 1, 'iC_Project_Membership', 3),
(9, 'alta Proj. Públic', '', 3, 8, 9, 1, '', 3),
(10, 'alta Soci Afí Individual', '', 4, 15, 16, 1, 'iC_Akin_Membership', 2),
(11, 'alta Proj. Firaire', '', 5, 12, 13, 1, 'iC_Stallholder', 3),
(13, 'Contracte d''Adreça', '', 6, 19, 24, 1, 'iC_Address_Contract', 2),
(14, 'Llicència d''activitat', '', 6, 25, 26, 1, 'iC_Licence', 2),
(15, 'Assegurança soci', '', 6, 27, 28, 1, 'iC_Insurance', 2),
(16, 'Contracte Laboral', '', 6, 29, 30, 1, 'iC_Labor_Contract', 2),
(17, 'Quota', '', 1, 32, 49, 1, 'Fee', 1),
(18, 'quota d''Alta', '', 17, 33, 38, 1, 'join_fee', 2),
(19, 'quota Trimestral', '', 17, 39, 48, 1, 'quarterly_fee', 2),
(20, 'pagament en Moneda Social', '', 26, 9, 10, 2, '', 2),
(21, 'pagament amb Hores de Treball', '', 26, 13, 14, 2, '', 2),
(22, 'pagament amb Criptomoneda', '', 2, 2, 3, 2, '', 1),
(23, 'pagament en Metàl·lic', '', 26, 11, 12, 2, '', 2),
(24, 'pagament per Transferència Bancària', '', 2, 4, 5, 2, '', 1),
(25, 'pagament fent Ingrés al Banc', '', 2, 6, 7, 2, '', 1),
(26, 'pagament presencial', '', 2, 8, 15, 2, 'face-to-face', 1),
(27, 'contracte de Lloguer', '', 13, 20, 21, 1, '', 3),
(28, 'contracte de Cessió', '', 13, 22, 23, 1, '', 3),
(29, 'quota 1T', '', 19, 40, 41, 1, '', 3),
(30, 'quota 2T', '', 19, 42, 43, 1, '', 3),
(31, 'quota 3T', '', 19, 44, 45, 1, '', 3),
(32, 'Sessió / Formació', '', 1, 50, 55, 1, 'Learn_Session', 1),
(33, 'reg Sessió d''Acollida', '', 32, 51, 52, 1, 'welcome_session', 2),
(34, 'reg Sessió MonedaSocial', '', 32, 53, 54, 1, 'socialcoin_session', 2),
(35, 'quota alta Individual', '', 18, 34, 35, 1, '(30_eco) individual', 3),
(36, 'quota alta Col·lectiva', '', 18, 36, 37, 1, '(60_eco) collective', 3),
(37, 'quota 4T', '', 19, 46, 47, 1, '', 3),
(38, 'Tipus parada firaire', '', 1, 74, 81, 1, 'tent_type', 1),
(39, 'Sense Carpa', '', 38, 75, 76, 1, '', 2),
(41, 'Quota Avançada', '', 17, 57, 66, 1, 'advanced_fee', 2),
(42, 'Carpa metall', '', 38, 77, 78, 1, '', 2),
(43, 'Carpa fusta', '', 38, 79, 80, 1, '', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
