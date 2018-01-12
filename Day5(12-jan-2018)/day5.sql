-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2018 at 05:01 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `day5`
--

-- --------------------------------------------------------

--
-- Table structure for table `citymaster`
--

CREATE TABLE `citymaster` (
  `CityID` int(4) NOT NULL,
  `cityname` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citymaster`
--

INSERT INTO `citymaster` (`CityID`, `cityname`) VALUES
(1, 'London'),
(2, 'London'),
(3, 'London'),
(4, 'London');

-- --------------------------------------------------------

--
-- Table structure for table `citytest`
--

CREATE TABLE `citytest` (
  `cityID` varchar(6) NOT NULL,
  `cityname` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citytest`
--

INSERT INTO `citytest` (`cityID`, `cityname`) VALUES
('1', 'Toronto'),
('2', 'Ottawa'),
('3', 'Downtown'),
('4', 'Alberta');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custID` int(2) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custID`, `name`, `nickname`, `city`, `postalcode`) VALUES
(3, 'cherlies Theron', 'Cher', 'NewYork', '120134'),
(3, 'cherlies Theron', 'Cher', 'NewYork', '120134'),
(3, 'cherlies Theron', 'Cher', 'NewYork', '120134'),
(3, 'cherlies Theron', 'Cher', 'NewYork', '120134'),
(3, 'cherlies Theron', 'Cher', 'NewYork', '120134');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `name` varchar(10) DEFAULT NULL,
  `age` int(2) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `ID` int(3) NOT NULL,
  `LasteName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `CityID` int(4) DEFAULT NULL,
  `country` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `citymaster`
--
ALTER TABLE `citymaster`
  ADD PRIMARY KEY (`CityID`);

--
-- Indexes for table `citytest`
--
ALTER TABLE `citytest`
  ADD PRIMARY KEY (`cityID`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_persons` (`CityID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `fk_persons` FOREIGN KEY (`CityID`) REFERENCES `citymaster` (`CityID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
