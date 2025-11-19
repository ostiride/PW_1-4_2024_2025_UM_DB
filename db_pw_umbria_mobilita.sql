-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 19, 2025 at 04:36 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pw_umbria_mobilita`
--
CREATE DATABASE IF NOT EXISTS `db_pw_umbria_mobilita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_pw_umbria_mobilita`;

-- --------------------------------------------------------

--
-- Table structure for table `abbonamento`
--

CREATE TABLE `abbonamento` (
  `ID_Abbonamento` int NOT NULL,
  `ID_Passeggero` int NOT NULL,
  `ID_Catalogo` int NOT NULL,
  `TipoDurata` varchar(50) NOT NULL,
  `DataInizioValidita` date NOT NULL,
  `DataFineValidita` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `abbonamento`
--

INSERT INTO `abbonamento` (`ID_Abbonamento`, `ID_Passeggero`, `ID_Catalogo`, `TipoDurata`, `DataInizioValidita`, `DataFineValidita`) VALUES
(1, 1, 1, 'Mensile', '2023-11-01', '2023-11-30'),
(2, 2, 2, 'Annuale', '2023-01-01', '2023-12-31'),
(3, 3, 1, 'Semestrale', '2023-06-01', '2023-12-31'),
(4, 4, 3, 'Mensile', '2023-11-01', '2023-11-30'),
(5, 5, 5, 'Annuale', '2023-01-01', '2023-12-31'),
(6, 6, 4, 'Mensile', '2023-11-15', '2023-12-14'),
(7, 7, 8, 'Mensile', '2023-11-01', '2023-11-30'),
(8, 8, 2, 'Annuale', '2023-01-01', '2023-12-31'),
(9, 9, 6, 'Semestrale', '2023-01-01', '2023-06-30'),
(10, 10, 1, 'Mensile', '2023-12-01', '2023-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `assegnazione_turno`
--

CREATE TABLE `assegnazione_turno` (
  `ID_Assegnazione` int NOT NULL,
  `ID_Viaggio` int NOT NULL,
  `ID_Dipendente` int NOT NULL,
  `Ordine_Fermata_Inizio` int DEFAULT NULL,
  `Ordine_Fermata_Fine` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assegnazione_turno`
--

INSERT INTO `assegnazione_turno` (`ID_Assegnazione`, `ID_Viaggio`, `ID_Dipendente`, `Ordine_Fermata_Inizio`, `Ordine_Fermata_Fine`) VALUES
(1, 1, 1, 1, 5),
(2, 1, 2, 1, 5),
(3, 2, 7, 1, 5),
(4, 2, 8, 1, 5),
(5, 3, 1, 1, 5),
(6, 3, 5, 1, 3),
(7, 4, 2, 1, 5),
(8, 5, 5, 1, 2),
(9, 6, 8, 1, 2),
(10, 7, 10, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `biglietto`
--

CREATE TABLE `biglietto` (
  `ID_Biglietto` int NOT NULL,
  `DataEmissione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PrezzoPagato` decimal(10,2) NOT NULL,
  `PostoAssegnato` varchar(50) DEFAULT NULL,
  `Classe` varchar(50) DEFAULT '2',
  `ID_Passeggero` int NOT NULL,
  `ID_Viaggio` int NOT NULL,
  `ID_Tariffa` int NOT NULL,
  `Ordine_Fermata_Partenza` int NOT NULL,
  `Ordine_Fermata_Arrivo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `biglietto`
--

INSERT INTO `biglietto` (`ID_Biglietto`, `DataEmissione`, `PrezzoPagato`, `PostoAssegnato`, `Classe`, `ID_Passeggero`, `ID_Viaggio`, `ID_Tariffa`, `Ordine_Fermata_Partenza`, `Ordine_Fermata_Arrivo`) VALUES
(1, '2025-11-19 17:13:07', '15.50', '1A', '2', 1, 1, 1, 1, 5),
(2, '2025-11-19 17:13:07', '10.00', '2B', '2', 2, 1, 2, 1, 3),
(3, '2025-11-19 17:13:07', '25.00', '1F', '1', 3, 2, 8, 1, 5),
(4, '2025-11-19 17:13:07', '5.00', NULL, '2', 4, 3, 1, 1, 2),
(5, '2025-11-19 17:13:07', '12.00', '5C', '2', 5, 4, 1, 2, 4),
(6, '2025-11-19 17:13:07', '8.50', '3D', '2', 6, 5, 2, 1, 2),
(7, '2025-11-19 17:13:07', '30.00', '2A', '1', 7, 6, 8, 1, 2),
(8, '2025-11-19 17:13:07', '15.50', '4A', '2', 8, 1, 1, 1, 5),
(9, '2025-11-19 17:13:07', '7.00', NULL, '2', 9, 8, 3, 1, 2),
(10, '2025-11-19 17:13:07', '15.50', '9C', '2', 10, 9, 1, 1, 5),
(11, '2025-11-19 17:18:49', '10.50', '1A', '2', 11, 11, 11, 1, 5),
(12, '2025-11-19 17:18:49', '15.00', '2A', '1', 11, 11, 11, 1, 5),
(13, '2025-11-19 17:18:49', '8.00', '3C', '2', 11, 11, 11, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalogo_abbonamenti`
--

CREATE TABLE `catalogo_abbonamenti` (
  `ID_Catalogo` int NOT NULL,
  `ID_Stazione_A` int NOT NULL,
  `ID_Stazione_B` int NOT NULL,
  `Prezzo_Mensile` decimal(10,2) DEFAULT NULL,
  `Prezzo_Semestrale` decimal(10,2) DEFAULT NULL,
  `Prezzo_Annuale` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `catalogo_abbonamenti`
--

INSERT INTO `catalogo_abbonamenti` (`ID_Catalogo`, `ID_Stazione_A`, `ID_Stazione_B`, `Prezzo_Mensile`, `Prezzo_Semestrale`, `Prezzo_Annuale`) VALUES
(1, 1, 6, '50.00', '280.00', '500.00'),
(2, 1, 4, '30.00', '160.00', '300.00'),
(3, 4, 6, '35.00', '190.00', '350.00'),
(4, 1, 2, '20.00', '100.00', '180.00'),
(5, 6, 7, '40.00', '220.00', '400.00'),
(6, 2, 3, '25.00', '130.00', '240.00'),
(7, 3, 4, '20.00', '100.00', '190.00'),
(8, 1, 7, '70.00', '380.00', '700.00'),
(9, 5, 6, '25.00', '130.00', '230.00'),
(10, 8, 1, '45.00', '240.00', '450.00');

-- --------------------------------------------------------

--
-- Table structure for table `dipendente`
--

CREATE TABLE `dipendente` (
  `ID_Dipendente` int NOT NULL,
  `Matricola` varchar(50) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Cognome` varchar(100) NOT NULL,
  `Mansione` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dipendente`
--

INSERT INTO `dipendente` (`ID_Dipendente`, `Matricola`, `Nome`, `Cognome`, `Mansione`) VALUES
(1, 'DIP001', 'Giovanni', 'Storti', 'Capotreno'),
(2, 'DIP002', 'Giacomo', 'Poretti', 'Macchinista'),
(3, 'DIP003', 'Aldo', 'Baglio', 'Controllore'),
(4, 'DIP004', 'Marina', 'Massironi', 'Biglietteria'),
(5, 'DIP005', 'Paolo', 'Bitta', 'Autista'),
(6, 'DIP006', 'Luca', 'Nervi', 'Manutentore'),
(7, 'DIP007', 'Silvano', 'Rogi', 'Capotreno'),
(8, 'DIP008', 'Pippo', 'Franco', 'Macchinista'),
(9, 'DIP009', 'Anna', 'Mazzamauro', 'Controllore'),
(10, 'DIP010', 'Lino', 'Banfi', 'Dirigente Movimento');

-- --------------------------------------------------------

--
-- Table structure for table `evento_viaggio`
--

CREATE TABLE `evento_viaggio` (
  `ID_Evento` int NOT NULL,
  `ID_Viaggio` int NOT NULL,
  `ID_Stazione` int DEFAULT NULL,
  `TimestampEvento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TipoEvento` varchar(100) NOT NULL,
  `Descrizione` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `evento_viaggio`
--

INSERT INTO `evento_viaggio` (`ID_Evento`, `ID_Viaggio`, `ID_Stazione`, `TimestampEvento`, `TipoEvento`, `Descrizione`) VALUES
(1, 1, 1, '2025-11-19 17:13:07', 'Guasto', 'Guasto risolto in 5 minuti'),
(2, 1, 4, '2025-11-19 17:13:07', 'Ritardo', 'Attesa coincidenza 5 min'),
(3, 1, 6, '2025-11-19 17:13:07', 'Problema tecnico', 'Problema tecnico di lieve entità'),
(4, 2, 1, '2025-11-19 17:13:07', 'Ritardo', 'Partito in orario'),
(5, 2, 2, '2025-11-19 17:13:07', 'Guasto', 'Problema alle porte, risolto in 10 min'),
(6, 3, 1, '2025-11-19 17:13:07', 'Problema tecnico', 'Problema tecnico di lieve entità'),
(7, 7, NULL, '2025-11-19 17:13:07', 'Cancellazione', 'Guasto tecnico al mezzo prima della partenza'),
(8, 4, 1, '2025-11-19 17:13:07', 'Info', 'Viaggio confermato'),
(9, 5, 4, '2025-11-19 17:13:07', 'Info', 'Traffico previsto'),
(10, 6, 4, '2025-11-19 17:13:07', 'Info', 'Maltempo in zona');

-- --------------------------------------------------------

--
-- Table structure for table `fermata`
--

CREATE TABLE `fermata` (
  `ID_Tratta` int NOT NULL,
  `Ordine` int NOT NULL,
  `ID_Stazione` int NOT NULL,
  `KmProgressivi` int DEFAULT NULL,
  `SuRichiesta` tinyint(1) DEFAULT '0',
  `TempoArrivoRelativo` int DEFAULT NULL,
  `TempoPartenzaRelativo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fermata`
--

INSERT INTO `fermata` (`ID_Tratta`, `Ordine`, `ID_Stazione`, `KmProgressivi`, `SuRichiesta`, `TempoArrivoRelativo`, `TempoPartenzaRelativo`) VALUES
(1, 1, 1, 0, 0, 0, 0),
(1, 2, 2, 5, 0, 10, 12),
(1, 3, 9, 15, 0, 20, 22),
(1, 4, 4, 35, 0, 40, 45),
(1, 5, 6, 80, 0, 80, 80),
(2, 1, 4, 0, 0, 0, 0),
(2, 2, 5, 25, 0, 20, 22),
(2, 3, 6, 55, 0, 50, 55),
(2, 4, 10, 100, 0, 90, 92),
(2, 5, 7, 130, 0, 120, 120);

-- --------------------------------------------------------

--
-- Table structure for table `manutenzione`
--

CREATE TABLE `manutenzione` (
  `ID_Manutenzione` int NOT NULL,
  `ID_Mezzo` int NOT NULL,
  `DataInizio` datetime NOT NULL,
  `DataFinePrevista` datetime DEFAULT NULL,
  `TipoManutenzione` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `manutenzione`
--

INSERT INTO `manutenzione` (`ID_Manutenzione`, `ID_Mezzo`, `DataInizio`, `DataFinePrevista`, `TipoManutenzione`) VALUES
(1, 1, '2023-10-01 08:00:00', '2023-10-02 18:00:00', 'Revisione Motore'),
(2, 2, '2023-10-05 09:00:00', '2023-10-05 13:00:00', 'Pulizia Straordinaria'),
(3, 3, '2023-10-10 08:00:00', '2023-10-15 18:00:00', 'Sostituzione Pantografo'),
(4, 4, '2023-10-12 07:00:00', '2023-10-12 19:00:00', 'Controllo Freni'),
(5, 5, '2023-10-15 08:00:00', '2023-10-16 12:00:00', 'Cambio Olio'),
(6, 6, '2023-10-20 08:00:00', '2023-10-20 18:00:00', 'Riparazione Aria Condizionata'),
(7, 7, '2023-10-25 08:00:00', '2023-10-28 18:00:00', 'Revisione Generale'),
(8, 8, '2023-11-01 09:00:00', '2023-11-01 17:00:00', 'Sostituzione Sedili'),
(9, 9, '2023-11-05 08:00:00', '2023-11-05 12:00:00', 'Controllo Elettronico'),
(10, 10, '2023-11-10 08:00:00', '2023-11-10 14:00:00', 'Lucidatura Esterna');

-- --------------------------------------------------------

--
-- Table structure for table `mezzo`
--

CREATE TABLE `mezzo` (
  `ID_Mezzo` int NOT NULL,
  `Matricola` varchar(50) NOT NULL,
  `Modello` varchar(100) NOT NULL,
  `CapacitaMax` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mezzo`
--

INSERT INTO `mezzo` (`ID_Mezzo`, `Matricola`, `Modello`, `CapacitaMax`) VALUES
(1, 'TR001', 'Minuetto Diesel', 150),
(2, 'TR002', 'Jazz Elettrico', 200),
(3, 'TR003', 'Pop Elettrico', 300),
(4, 'TR004', 'Swing Diesel', 160),
(5, 'BUS001', 'Mercedes Citaro', 80),
(6, 'BUS002', 'Iveco Crossway', 70),
(7, 'TR005', 'Rock Doppia Piano', 450),
(8, 'TR006', 'Minuetto Diesel', 150),
(9, 'BUS003', 'Solaris Urbino', 85),
(10, 'TR007', 'Jazz Elettrico', 200),
(11, 'JAZZ-099', 'Jazz Elettrico', 300);

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `ID_Pagamento` int NOT NULL,
  `DataOraPagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Importo` decimal(10,2) NOT NULL,
  `MetodoPagamento` varchar(50) NOT NULL,
  `StatoPagamento` varchar(50) NOT NULL,
  `ID_Biglietto` int DEFAULT NULL,
  `ID_Abbonamento` int DEFAULT NULL
) ;

--
-- Dumping data for table `pagamento`
--

INSERT INTO `pagamento` (`ID_Pagamento`, `DataOraPagamento`, `Importo`, `MetodoPagamento`, `StatoPagamento`, `ID_Biglietto`, `ID_Abbonamento`) VALUES
(1, '2025-11-19 17:13:07', '15.50', 'Carta di Credito', 'Completato', 1, NULL),
(2, '2025-11-19 17:13:07', '10.00', 'PayPal', 'Completato', 2, NULL),
(3, '2025-11-19 17:13:07', '25.00', 'Carta di Credito', 'Completato', 3, NULL),
(4, '2025-11-19 17:13:07', '5.00', 'Contanti', 'Completato', 4, NULL),
(5, '2025-11-19 17:13:07', '12.00', 'Satispay', 'Completato', 5, NULL),
(6, '2025-11-19 17:13:07', '50.00', 'Bonifico', 'Completato', NULL, 1),
(7, '2025-11-19 17:13:07', '300.00', 'Carta di Credito', 'Completato', NULL, 2),
(8, '2025-11-19 17:13:07', '140.00', 'PayPal', 'Completato', NULL, 3),
(9, '2025-11-19 17:13:07', '35.00', 'Carta di Credito', 'Completato', NULL, 4),
(10, '2025-11-19 17:13:07', '400.00', 'Carta di Credito', 'Completato', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `passeggero`
--

CREATE TABLE `passeggero` (
  `ID_Passeggero` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Cognome` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `NumTelefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `passeggero`
--

INSERT INTO `passeggero` (`ID_Passeggero`, `Nome`, `Cognome`, `Email`, `NumTelefono`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.it', '3331234567'),
(2, 'Luca', 'Bianchi', 'luca.bianchi@email.it', '3337654321'),
(3, 'Giulia', 'Verdi', 'giulia.verdi@email.it', '3339988776'),
(4, 'Francesca', 'Neri', 'francesca.neri@email.it', '3331122334'),
(5, 'Alessandro', 'Galli', 'alessandro.galli@email.it', '3335566778'),
(6, 'Sofia', 'Ricci', 'sofia.ricci@email.it', '3339900112'),
(7, 'Marco', 'Moretti', 'marco.moretti@email.it', '3334455667'),
(8, 'Chiara', 'Ferrari', 'chiara.ferrari@email.it', '3332233445'),
(9, 'Davide', 'Romano', 'davide.romano@email.it', '3337788990'),
(10, 'Elisa', 'Colombo', 'elisa.colombo@email.it', '3336655443'),
(11, 'Mario', 'Rossi', 'mario.test.query@email.com', '3330000000');

-- --------------------------------------------------------

--
-- Table structure for table `stazione`
--

CREATE TABLE `stazione` (
  `ID_Stazione` int NOT NULL,
  `NomeStazione` varchar(255) NOT NULL,
  `Citta` varchar(100) NOT NULL,
  `Indirizzo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stazione`
--

INSERT INTO `stazione` (`ID_Stazione`, `NomeStazione`, `Citta`, `Indirizzo`) VALUES
(1, 'Perugia Fontivegge', 'Perugia', 'Piazza Vittorio Veneto'),
(2, 'Perugia Ponte San Giovanni', 'Perugia', 'Via della Scuola'),
(3, 'Assisi', 'Assisi', 'Piazza Dante Alighieri'),
(4, 'Foligno Centrale', 'Foligno', 'Piazzale Unità d Italia'),
(5, 'Spoleto', 'Spoleto', 'Piazza Polvani'),
(6, 'Terni', 'Terni', 'Piazza Dante'),
(7, 'Orvieto', 'Orvieto', 'Piazza Matteotti'),
(8, 'Città di Castello', 'Città di Castello', 'Via Roma'),
(9, 'Bastia Umbra', 'Bastia', 'Via della Stazione'),
(10, 'Passignano sul Trasimeno', 'Passignano', 'Via Roma');

-- --------------------------------------------------------

--
-- Table structure for table `tariffa`
--

CREATE TABLE `tariffa` (
  `ID_Tariffa` int NOT NULL,
  `NomeTariffa` varchar(100) NOT NULL,
  `Descrizione` text,
  `CondizioniRimborso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tariffa`
--

INSERT INTO `tariffa` (`ID_Tariffa`, `NomeTariffa`, `Descrizione`, `CondizioniRimborso`) VALUES
(1, 'Ordinaria', 'Tariffa base', 'Rimborsabile 80%'),
(2, 'Studenti', 'Sconto under 26', 'Non rimborsabile'),
(3, 'Anziani', 'Sconto over 65', 'Rimborsabile 100%'),
(4, 'Abbonamento Mensile', 'Valido 30 giorni', 'Non rimborsabile dopo attivazione'),
(5, 'Abbonamento Annuale', 'Valido 365 giorni', 'Rimborsabile entro 1 mese'),
(6, 'Comitiva', 'Gruppi > 10 persone', 'Rimborsabile 50%'),
(7, 'Weekend', 'Sconto fine settimana', 'Non rimborsabile'),
(8, 'Business', 'Prima classe', 'Rimborsabile 100%'),
(9, 'Disabili', 'Tariffa agevolata', 'Rimborsabile 100%'),
(10, 'Promo Estate', 'Sconto stagionale', 'Non rimborsabile'),
(11, 'Standard', 'Tariffa Base', 'Rimborsabile');

-- --------------------------------------------------------

--
-- Table structure for table `tratta`
--

CREATE TABLE `tratta` (
  `ID_Tratta` int NOT NULL,
  `NomeTratta` varchar(255) NOT NULL,
  `TipoServizio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tratta`
--

INSERT INTO `tratta` (`ID_Tratta`, `NomeTratta`, `TipoServizio`) VALUES
(1, 'Perugia - Terni', 'Regionale'),
(2, 'Foligno - Perugia', 'Regionale Veloce'),
(3, 'Città di Castello - Perugia', 'Autobus Extraurbano'),
(4, 'Orvieto - Roma', 'Intercity'),
(5, 'Spoleto - Terni', 'Regionale'),
(6, 'Assisi - Foligno', 'Navetta Turistica'),
(7, 'Terni - Rieti', 'Regionale'),
(8, 'Perugia - Lago Trasimeno', 'Regionale'),
(9, 'Gubbio - Fossato di Vico', 'Autobus Link'),
(10, 'Narni - Orte', 'Regionale'),
(11, 'Perugia - Terni', 'Regionale Veloce');

-- --------------------------------------------------------

--
-- Table structure for table `viaggio`
--

CREATE TABLE `viaggio` (
  `ID_Viaggio` int NOT NULL,
  `DataOraPartenzaPrevista` datetime NOT NULL,
  `DataOraArrivoPrevista` datetime NOT NULL,
  `StatoViaggio` varchar(50) DEFAULT 'Programmato',
  `ID_Tratta` int NOT NULL,
  `ID_Mezzo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `viaggio`
--

INSERT INTO `viaggio` (`ID_Viaggio`, `DataOraPartenzaPrevista`, `DataOraArrivoPrevista`, `StatoViaggio`, `ID_Tratta`, `ID_Mezzo`) VALUES
(1, '2023-11-20 08:00:00', '2023-11-20 09:30:00', 'Completato', 1, 1),
(2, '2023-11-20 10:00:00', '2023-11-20 11:30:00', 'Completato', 1, 2),
(3, '2023-11-20 12:00:00', '2023-11-20 13:30:00', 'In Corso', 1, 3),
(4, '2023-11-20 14:00:00', '2023-11-20 15:30:00', 'Programmato', 1, 4),
(5, '2023-11-21 08:00:00', '2023-11-21 09:00:00', 'Programmato', 2, 5),
(6, '2023-11-21 09:00:00', '2023-11-21 10:00:00', 'Programmato', 2, 6),
(7, '2023-11-21 10:00:00', '2023-11-21 11:00:00', 'Cancellato', 3, 7),
(8, '2023-11-21 11:00:00', '2023-11-21 12:00:00', 'Programmato', 3, 8),
(9, '2023-11-22 08:00:00', '2023-11-22 09:30:00', 'Programmato', 4, 9),
(10, '2023-11-22 09:00:00', '2023-11-22 10:30:00', 'Programmato', 4, 10),
(11, '2025-11-19 07:30:00', '2025-11-19 08:45:00', 'Programmato', 11, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abbonamento`
--
ALTER TABLE `abbonamento`
  ADD PRIMARY KEY (`ID_Abbonamento`),
  ADD KEY `ID_Passeggero` (`ID_Passeggero`),
  ADD KEY `ID_Catalogo` (`ID_Catalogo`);

--
-- Indexes for table `assegnazione_turno`
--
ALTER TABLE `assegnazione_turno`
  ADD PRIMARY KEY (`ID_Assegnazione`),
  ADD KEY `ID_Viaggio` (`ID_Viaggio`),
  ADD KEY `ID_Dipendente` (`ID_Dipendente`);

--
-- Indexes for table `biglietto`
--
ALTER TABLE `biglietto`
  ADD PRIMARY KEY (`ID_Biglietto`),
  ADD KEY `ID_Passeggero` (`ID_Passeggero`),
  ADD KEY `ID_Viaggio` (`ID_Viaggio`),
  ADD KEY `ID_Tariffa` (`ID_Tariffa`);

--
-- Indexes for table `catalogo_abbonamenti`
--
ALTER TABLE `catalogo_abbonamenti`
  ADD PRIMARY KEY (`ID_Catalogo`),
  ADD KEY `ID_Stazione_A` (`ID_Stazione_A`),
  ADD KEY `ID_Stazione_B` (`ID_Stazione_B`);

--
-- Indexes for table `dipendente`
--
ALTER TABLE `dipendente`
  ADD PRIMARY KEY (`ID_Dipendente`),
  ADD UNIQUE KEY `Matricola` (`Matricola`);

--
-- Indexes for table `evento_viaggio`
--
ALTER TABLE `evento_viaggio`
  ADD PRIMARY KEY (`ID_Evento`),
  ADD KEY `ID_Viaggio` (`ID_Viaggio`),
  ADD KEY `ID_Stazione` (`ID_Stazione`);

--
-- Indexes for table `fermata`
--
ALTER TABLE `fermata`
  ADD PRIMARY KEY (`ID_Tratta`,`Ordine`),
  ADD KEY `ID_Stazione` (`ID_Stazione`);

--
-- Indexes for table `manutenzione`
--
ALTER TABLE `manutenzione`
  ADD PRIMARY KEY (`ID_Manutenzione`),
  ADD KEY `ID_Mezzo` (`ID_Mezzo`);

--
-- Indexes for table `mezzo`
--
ALTER TABLE `mezzo`
  ADD PRIMARY KEY (`ID_Mezzo`),
  ADD UNIQUE KEY `Matricola` (`Matricola`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`ID_Pagamento`),
  ADD KEY `ID_Biglietto` (`ID_Biglietto`),
  ADD KEY `ID_Abbonamento` (`ID_Abbonamento`);

--
-- Indexes for table `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`ID_Passeggero`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `stazione`
--
ALTER TABLE `stazione`
  ADD PRIMARY KEY (`ID_Stazione`);

--
-- Indexes for table `tariffa`
--
ALTER TABLE `tariffa`
  ADD PRIMARY KEY (`ID_Tariffa`);

--
-- Indexes for table `tratta`
--
ALTER TABLE `tratta`
  ADD PRIMARY KEY (`ID_Tratta`);

--
-- Indexes for table `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`ID_Viaggio`),
  ADD KEY `ID_Tratta` (`ID_Tratta`),
  ADD KEY `ID_Mezzo` (`ID_Mezzo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abbonamento`
--
ALTER TABLE `abbonamento`
  MODIFY `ID_Abbonamento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assegnazione_turno`
--
ALTER TABLE `assegnazione_turno`
  MODIFY `ID_Assegnazione` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `biglietto`
--
ALTER TABLE `biglietto`
  MODIFY `ID_Biglietto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `catalogo_abbonamenti`
--
ALTER TABLE `catalogo_abbonamenti`
  MODIFY `ID_Catalogo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dipendente`
--
ALTER TABLE `dipendente`
  MODIFY `ID_Dipendente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `evento_viaggio`
--
ALTER TABLE `evento_viaggio`
  MODIFY `ID_Evento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `manutenzione`
--
ALTER TABLE `manutenzione`
  MODIFY `ID_Manutenzione` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mezzo`
--
ALTER TABLE `mezzo`
  MODIFY `ID_Mezzo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `ID_Pagamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passeggero`
--
ALTER TABLE `passeggero`
  MODIFY `ID_Passeggero` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stazione`
--
ALTER TABLE `stazione`
  MODIFY `ID_Stazione` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tariffa`
--
ALTER TABLE `tariffa`
  MODIFY `ID_Tariffa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tratta`
--
ALTER TABLE `tratta`
  MODIFY `ID_Tratta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `viaggio`
--
ALTER TABLE `viaggio`
  MODIFY `ID_Viaggio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abbonamento`
--
ALTER TABLE `abbonamento`
  ADD CONSTRAINT `abbonamento_ibfk_1` FOREIGN KEY (`ID_Passeggero`) REFERENCES `passeggero` (`ID_Passeggero`),
  ADD CONSTRAINT `abbonamento_ibfk_2` FOREIGN KEY (`ID_Catalogo`) REFERENCES `catalogo_abbonamenti` (`ID_Catalogo`);

--
-- Constraints for table `assegnazione_turno`
--
ALTER TABLE `assegnazione_turno`
  ADD CONSTRAINT `assegnazione_turno_ibfk_1` FOREIGN KEY (`ID_Viaggio`) REFERENCES `viaggio` (`ID_Viaggio`),
  ADD CONSTRAINT `assegnazione_turno_ibfk_2` FOREIGN KEY (`ID_Dipendente`) REFERENCES `dipendente` (`ID_Dipendente`);

--
-- Constraints for table `biglietto`
--
ALTER TABLE `biglietto`
  ADD CONSTRAINT `biglietto_ibfk_1` FOREIGN KEY (`ID_Passeggero`) REFERENCES `passeggero` (`ID_Passeggero`),
  ADD CONSTRAINT `biglietto_ibfk_2` FOREIGN KEY (`ID_Viaggio`) REFERENCES `viaggio` (`ID_Viaggio`),
  ADD CONSTRAINT `biglietto_ibfk_3` FOREIGN KEY (`ID_Tariffa`) REFERENCES `tariffa` (`ID_Tariffa`);

--
-- Constraints for table `catalogo_abbonamenti`
--
ALTER TABLE `catalogo_abbonamenti`
  ADD CONSTRAINT `catalogo_abbonamenti_ibfk_1` FOREIGN KEY (`ID_Stazione_A`) REFERENCES `stazione` (`ID_Stazione`),
  ADD CONSTRAINT `catalogo_abbonamenti_ibfk_2` FOREIGN KEY (`ID_Stazione_B`) REFERENCES `stazione` (`ID_Stazione`);

--
-- Constraints for table `evento_viaggio`
--
ALTER TABLE `evento_viaggio`
  ADD CONSTRAINT `evento_viaggio_ibfk_1` FOREIGN KEY (`ID_Viaggio`) REFERENCES `viaggio` (`ID_Viaggio`),
  ADD CONSTRAINT `evento_viaggio_ibfk_2` FOREIGN KEY (`ID_Stazione`) REFERENCES `stazione` (`ID_Stazione`);

--
-- Constraints for table `fermata`
--
ALTER TABLE `fermata`
  ADD CONSTRAINT `fermata_ibfk_1` FOREIGN KEY (`ID_Tratta`) REFERENCES `tratta` (`ID_Tratta`),
  ADD CONSTRAINT `fermata_ibfk_2` FOREIGN KEY (`ID_Stazione`) REFERENCES `stazione` (`ID_Stazione`);

--
-- Constraints for table `manutenzione`
--
ALTER TABLE `manutenzione`
  ADD CONSTRAINT `manutenzione_ibfk_1` FOREIGN KEY (`ID_Mezzo`) REFERENCES `mezzo` (`ID_Mezzo`);

--
-- Constraints for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`ID_Biglietto`) REFERENCES `biglietto` (`ID_Biglietto`),
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`ID_Abbonamento`) REFERENCES `abbonamento` (`ID_Abbonamento`);

--
-- Constraints for table `viaggio`
--
ALTER TABLE `viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`ID_Tratta`) REFERENCES `tratta` (`ID_Tratta`),
  ADD CONSTRAINT `viaggio_ibfk_2` FOREIGN KEY (`ID_Mezzo`) REFERENCES `mezzo` (`ID_Mezzo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
