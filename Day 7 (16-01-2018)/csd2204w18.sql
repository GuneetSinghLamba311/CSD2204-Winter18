-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2018 at 05:25 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csd2204w18`
--

-- --------------------------------------------------------

--
-- Table structure for table `manu`
--

CREATE TABLE `manu` (
  `Code` int(3) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manu`
--

INSERT INTO `manu` (`Code`, `Name`) VALUES
(1, 'Sony'),
(2, 'Creative Labs'),
(3, 'Hewlett-Packard'),
(4, 'Iomega'),
(5, 'Fujitsu'),
(6, 'Winchester'),
(7, 'moxDroid Labs Inc'),
(8, 'Dell'),
(9, 'Bell Labs');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `name` varchar(20) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL,
  `species` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`name`, `owner`, `species`, `sex`, `birth`, `death`) VALUES
('Fluffy', 'Harold', 'cat', 'f', '1993-02-04', '0000-00-00'),
('Claws', 'Gwen', 'cat', 'm', '1994-03-17', '0000-00-00'),
('Buffy', 'Harold', 'dog', 'f', '1989-05-13', '0000-00-00'),
('Fang', 'Benny', 'dog', 'm', '1990-08-27', '0000-00-00'),
('Bowser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29'),
('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', '0000-00-00'),
('Whistler', 'Gwen', 'bird', '', '1997-12-09', '0000-00-00'),
('Slim', 'Benny', 'snake', 'm', '1996-04-29', '0000-00-00'),
('Boxer123', NULL, NULL, NULL, NULL, NULL),
('123', NULL, NULL, NULL, NULL, NULL),
('JHK123', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Code` int(3) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Manufacturer` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Code`, `Name`, `Price`, `Manufacturer`) VALUES
(1, 'Hard drive', '240', 5),
(2, 'Memory', '120', 6),
(3, 'ZIP drive', '150', 4),
(4, 'Floppy disk', '5', 6),
(5, 'Monitor', '240', 1),
(6, 'DVD drive', '180', 2),
(7, 'CD drive', '90', 2),
(8, 'Printer', '270', 3),
(9, 'Toner cartridge', '66', 3),
(10, 'DVD burner', '180', 2),
(11, 'Printer', '40', 7),
(12, 'Toner cartridge', '54', 7),
(13, 'DVD burner', '78', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manu`
--
ALTER TABLE `manu`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `FK_PRODUCTS` (`Manufacturer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manu`
--
ALTER TABLE `manu`
  MODIFY `Code` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Code` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_PRODUCTS` FOREIGN KEY (`Manufacturer`) REFERENCES `manu` (`Code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
