-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2015. Jún 10. 13:55
-- Szerver verzió: 10.0.14-MariaDB
-- PHP verzió: 5.4.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `profession`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához: `job_listings`
--

CREATE TABLE IF NOT EXISTS `job_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `activated` datetime DEFAULT NULL,
  `orientation` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('friss','kész','aktív') NOT NULL DEFAULT 'friss',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- A tábla adatainak kiíratása `job_listings`
--

INSERT INTO `job_listings` (`id`, `title`, `created`, `activated`, `orientation`, `email`, `status`) VALUES
(1, 'Óceánjáró másodtiszt', '2015-04-01 09:12:26', NULL, 3, 'captainmorgan@adventurecruise.com', 'friss'),
(2, '?', '1953-04-13 00:00:07', NULL, 1, 'ifitoldyou@idhavetokill.you', 'friss'),
(3, 'PL/SQL fejlesztő', '2015-05-22 11:09:46', NULL, 6, 'john.smith@expertdata.com', 'friss'),
(4, 'Kormányos', '2015-06-09 12:42:06', NULL, 3, 'allas@mahart.hu', 'friss');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához: `orientations`
--

CREATE TABLE IF NOT EXISTS `orientations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- A tábla adatainak kiíratása `orientations`
--

INSERT INTO `orientations` (`id`, `name`) VALUES
(1, 'Nemzetközi kém'),
(2, 'Porszívó ügynök'),
(3, 'Hajóskapitány'),
(4, 'Inszektológus'),
(5, 'Játékfejlesztő'),
(6, 'Adatbázis szakértő');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
