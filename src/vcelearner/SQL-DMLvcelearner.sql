/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Teilnehmer
 * Created: 18.05.2016
 */

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Mai 2016 um 12:31
-- Server-Version: 10.1.13-MariaDB
-- PHP-Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `vcetrainer`
--
-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lernkarte`
--

CREATE TABLE `lernkarte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frage` varchar(2048) DEFAULT NULL,
  `schwierigkeitsgrad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `themenbereich`
--

CREATE TABLE `themenbereich` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lernkarte2themenbereich`
--

CREATE TABLE `lernkarte2themenbereich` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lernkarte_id` int(11) NOT NULL,
  `themenbereich_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`lernkarte_id`) REFERENCES `lernkarte` (`id`),
  FOREIGN KEY (`themenbereich_id`) REFERENCES `themenbereich` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `potentielleantwort`
--

CREATE TABLE `potentielleantwort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `richtigkeit` enum('true','false') DEFAULT NULL,
  `antwort` varchar(1024) DEFAULT NULL,
  `lernkarte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`lernkarte_id`) REFERENCES `lernkarte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer`
--

CREATE TABLE `benutzer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL UNIQUE,
  `passwort` varchar(45) NOT NULL,
  `vorname` varchar(45) NOT NULL,
  `nachname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lernsitzung`
--

CREATE TABLE `lernsitzung` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typ` enum('Test','Lern','LernR','ungewertet') DEFAULT NULL,
  `datum` DATE NOT NULL,
  `benutzer_id` int(11) NOT NULL,  
  PRIMARY KEY (`id`),
  FOREIGN KEY (`benutzer_id`) REFERENCES `benutzer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lernsitzung2potentielleantwort`
--

CREATE TABLE `lernsitzung2potentielleantwort` (
  `lernsitzung_id` int(11) NOT NULL,
  `potentielleantwort_id` int(11) NOT NULL,
  PRIMARY KEY (`lernsitzung_id`,`potentielleantwort_id`),
  FOREIGN KEY (`lernsitzung_id`) REFERENCES `lernsitzung` (`id`),
  FOREIGN KEY (`potentielleantwort_id`) REFERENCES `potentielleantwort` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `benutzer2lernkarte`
--

CREATE TABLE `benutzer2lernkarte` (
  `benutzer_id` int(11) NOT NULL,
  `lernkarte_id` int(11) NOT NULL,
  `wiedervorlage` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`benutzer_id`,`lernkarte_id`),
  FOREIGN KEY (`benutzer_id`) REFERENCES `benutzer` (`id`),
  FOREIGN KEY (`lernkarte_id`) REFERENCES `lernkarte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lernsitzung2lernkarte`
--

CREATE TABLE `lernsitzung2lernkarte` (
  `lernsitzung_id` int(11) NOT NULL,
  `lernkarte_id` int(11) NOT NULL,
  `gemogelt` enum('true','false') DEFAULT NULL,
  PRIMARY KEY (`lernsitzung_id`,`lernkarte_id`),
  FOREIGN KEY (`lernsitzung_id`) REFERENCES `lernsitzung` (`id`),
  FOREIGN KEY (`lernkarte_id`) REFERENCES `lernkarte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------------------------------
 /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;