-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 07:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `raport`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `NIP` int(11) NOT NULL,
  `Nama_Guru` varchar(50) NOT NULL,
  `Guru_NIP_Guru` int(11) NOT NULL,
  `Tempat` varchar(50) NOT NULL,
  `Tanggal_Lahir` datetime NOT NULL,
  `Pendidikan_Terakhir` varchar(50) NOT NULL,
  `Pengguna_ID_Pengguna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `Nama_Mapel` varchar(50) NOT NULL,
  `Guru_Mapel` varchar(50) NOT NULL,
  `Guru_NIP_Guru` int(11) NOT NULL,
  `Kode_Mapel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_Pengguna` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `raport`
--

CREATE TABLE `raport` (
  `Kode_Mapel` int(11) NOT NULL,
  `Nilai_Rata_Rata` int(11) DEFAULT NULL,
  `Guru_NIP_Guru` int(11) NOT NULL,
  `Siswa_NIS_Siswa` varchar(50) NOT NULL,
  `ID_Raport` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` varchar(50) NOT NULL,
  `Nama_Siswa` varchar(50) NOT NULL,
  `Guru_NIP_Guru` int(11) NOT NULL,
  `Tempat` varchar(20) NOT NULL,
  `Tanggal_Lahir` datetime NOT NULL,
  `Pendidikan_Terakhir` varchar(50) NOT NULL,
  `Pengguna_ID_Pengguna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`NIP`),
  ADD UNIQUE KEY `Guru__IDX` (`Pengguna_ID_Pengguna`),
  ADD KEY `Guru_Guru_FK` (`Guru_NIP_Guru`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`Kode_Mapel`) USING BTREE,
  ADD UNIQUE KEY `Mata_Pelajaran__IDX` (`Guru_NIP_Guru`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_Pengguna`);

--
-- Indexes for table `raport`
--
ALTER TABLE `raport`
  ADD PRIMARY KEY (`ID_Raport`) USING BTREE,
  ADD UNIQUE KEY `Nilai__IDX` (`Guru_NIP_Guru`),
  ADD KEY `Nilai_Siswa_FK` (`Siswa_NIS_Siswa`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD UNIQUE KEY `Siswa__IDX` (`Pengguna_ID_Pengguna`),
  ADD KEY `Siswa_Guru_FK` (`Guru_NIP_Guru`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `Guru_Guru_FK` FOREIGN KEY (`Guru_NIP_Guru`) REFERENCES `guru` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Guru_Pengguna_FK` FOREIGN KEY (`Pengguna_ID_Pengguna`) REFERENCES `pengguna` (`ID_Pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD CONSTRAINT `Mata_Pelajaran_Guru_FK` FOREIGN KEY (`Guru_NIP_Guru`) REFERENCES `guru` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `raport`
--
ALTER TABLE `raport`
  ADD CONSTRAINT `Nilai_Guru_FK` FOREIGN KEY (`Guru_NIP_Guru`) REFERENCES `guru` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Nilai_Siswa_FK` FOREIGN KEY (`Siswa_NIS_Siswa`) REFERENCES `siswa` (`NIS`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `Siswa_Guru_FK` FOREIGN KEY (`Guru_NIP_Guru`) REFERENCES `guru` (`NIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Siswa_Pengguna_FK` FOREIGN KEY (`Pengguna_ID_Pengguna`) REFERENCES `pengguna` (`ID_Pengguna`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
