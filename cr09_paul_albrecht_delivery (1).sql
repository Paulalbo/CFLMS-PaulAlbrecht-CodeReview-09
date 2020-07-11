-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 14:57
-- Server-Version: 10.1.39-MariaDB
-- PHP-Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_paul_albrecht_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_paul_albrecht_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_paul_albrecht_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_sorting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_weight` int(11) NOT NULL,
  `send_date` date NOT NULL,
  `fk_sender_id` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `fk_receiver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` int(11) NOT NULL,
  `receiver_address` int(11) NOT NULL,
  `receiver_FirstName` int(11) NOT NULL,
  `receiver_LastName` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `sender_FirstName` varchar(100) NOT NULL,
  `sender_LastName` varchar(100) NOT NULL,
  `sender_address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sorting`
--

CREATE TABLE `sorting` (
  `sorting_id` int(11) NOT NULL,
  `sort_date` date NOT NULL,
  `fk_package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_sorting_id` (`fk_sorting_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`);

--
-- Indizes für die Tabelle `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`);

--
-- Indizes für die Tabelle `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`);

--
-- Indizes für die Tabelle `sorting`
--
ALTER TABLE `sorting`
  ADD PRIMARY KEY (`sorting_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_sorting_id`) REFERENCES `sorting` (`sorting_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `package_ibfk_3` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`);

--
-- Constraints der Tabelle `sorting`
--
ALTER TABLE `sorting`
  ADD CONSTRAINT `sorting_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
