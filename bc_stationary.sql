-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 22, 2018 at 07:17 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bc_stationary`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladdress`
--

CREATE TABLE IF NOT EXISTS `tbladdress` (
  `AddressIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `Line1` varchar(100) NOT NULL,
  `Line2` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PostalCode` char(4) NOT NULL,
  PRIMARY KEY (`AddressIDPK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbladdress`
--

INSERT INTO `tbladdress` (`AddressIDPK`, `Line1`, `Line2`, `City`, `PostalCode`) VALUES
(5, '21 Riverside', 'Downbern', 'Pretoria', '0182');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE IF NOT EXISTS `tblcategory` (
  `CategoryIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `CatDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`CategoryIDPK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`CategoryIDPK`, `CatDescription`) VALUES
(2, 'Pens');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE IF NOT EXISTS `tblcontact` (
  `ContactIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `Cell` char(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`ContactIDPK`),
  UNIQUE KEY `Cell` (`Cell`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`ContactIDPK`, `Cell`, `Email`) VALUES
(3, '0798264300', 'tansdjspam@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE IF NOT EXISTS `tbldepartment` (
  `DepartmentIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `DepName` varchar(30) NOT NULL,
  PRIMARY KEY (`DepartmentIDPK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`DepartmentIDPK`, `DepName`) VALUES
(2, 'Administration');

-- --------------------------------------------------------

--
-- Table structure for table `tblmodel`
--

CREATE TABLE IF NOT EXISTS `tblmodel` (
  `ModelIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `ModDescription` varchar(200) NOT NULL,
  PRIMARY KEY (`ModelIDPK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblmodel`
--

INSERT INTO `tblmodel` (`ModelIDPK`, `ModDescription`) VALUES
(2, 'Model1');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE IF NOT EXISTS `tblorder` (
  `OrderIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `UserIdFK` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ReceivedDate` date NOT NULL,
  PRIMARY KEY (`OrderIDPK`),
  KEY `UserIdFK` (`UserIdFK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderitems`
--

CREATE TABLE IF NOT EXISTS `tblorderitems` (
  `OrderItemIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `OrderIDFK` int(11) NOT NULL,
  `ProductIDFK` int(11) NOT NULL,
  `ItemQty` int(11) NOT NULL,
  PRIMARY KEY (`OrderItemIDPK`),
  KEY `ProductIDFK` (`ProductIDFK`),
  KEY `OrderIDFK` (`OrderIDFK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblperson`
--

CREATE TABLE IF NOT EXISTS `tblperson` (
  `PersonIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `IDNumber` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `AddressIDFK` int(11) NOT NULL,
  `ContactIDFK` int(11) NOT NULL,
  `DepIDFK` int(11) NOT NULL,
  `Campus` varchar(30) NOT NULL,
  PRIMARY KEY (`PersonIDPK`),
  UNIQUE KEY `IDNumber` (`IDNumber`),
  KEY `AddressIDFK` (`AddressIDFK`),
  KEY `ContactIDFK` (`ContactIDFK`),
  KEY `DepIDFK` (`DepIDFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblperson`
--

INSERT INTO `tblperson` (`PersonIDPK`, `IDNumber`, `Name`, `Surname`, `AddressIDFK`, `ContactIDFK`, `DepIDFK`, `Campus`) VALUES
(1, '9711160103084', 'Tanya', 'de Jager', 5, 3, 2, 'PE');

-- --------------------------------------------------------

--
-- Table structure for table `tblproduct`
--

CREATE TABLE IF NOT EXISTS `tblproduct` (
  `ProductIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `CategoryIDFK` int(11) NOT NULL,
  `Status` varchar(15) NOT NULL,
  `ModelIDFK` int(11) DEFAULT NULL,
  `CostPrice` double NOT NULL,
  `SalesPrice` double NOT NULL,
  `EntryDate` date NOT NULL,
  PRIMARY KEY (`ProductIDPK`),
  KEY `CategoryIDFK` (`CategoryIDFK`),
  KEY `ModelIDFK` (`ModelIDFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblproduct`
--

INSERT INTO `tblproduct` (`ProductIDPK`, `Name`, `Description`, `CategoryIDFK`, `Status`, `ModelIDFK`, `CostPrice`, `SalesPrice`, `EntryDate`) VALUES
(2, 'Prod1', 'desc1', 2, 'Unavailable', 2, 25, 27.5, '1916-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `tblsecurityquestions`
--

CREATE TABLE IF NOT EXISTS `tblsecurityquestions` (
  `QuestionIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(500) NOT NULL,
  PRIMARY KEY (`QuestionIDPK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblsecurityquestions`
--

INSERT INTO `tblsecurityquestions` (`QuestionIDPK`, `Question`) VALUES
(2, 'What is your mothers maiden name?');

-- --------------------------------------------------------

--
-- Table structure for table `tblstock`
--

CREATE TABLE IF NOT EXISTS `tblstock` (
  `StockIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `ProductIDFK` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`StockIDPK`),
  KEY `ProductIDFK` (`ProductIDFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblstock`
--

INSERT INTO `tblstock` (`StockIDPK`, `ProductIDFK`, `Quantity`) VALUES
(2, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE IF NOT EXISTS `tbluser` (
  `UserIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `PersonIDFK` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `AccessLevel` varchar(20) NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`UserIDPK`),
  UNIQUE KEY `Username` (`Username`),
  KEY `PersonIDFK` (`PersonIDFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserIDPK`, `PersonIDFK`, `Username`, `Password`, `AccessLevel`, `Status`) VALUES
(1, 1, 'tansdj', 'pw123456', 'Admin', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbluserrequest`
--

CREATE TABLE IF NOT EXISTS `tbluserrequest` (
  `RequestIDPK` int(11) NOT NULL AUTO_INCREMENT,
  `UserIDFK` int(11) NOT NULL,
  `ProductIDFK` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Priority` int(11) NOT NULL,
  `ReqStatus` varchar(20) NOT NULL,
  `ReqDate` date NOT NULL,
  `DateCompleted` date DEFAULT NULL,
  PRIMARY KEY (`RequestIDPK`),
  KEY `ProductIDFK` (`ProductIDFK`),
  KEY `UserIDFK` (`UserIDFK`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblusersecurityquestions`
--

CREATE TABLE IF NOT EXISTS `tblusersecurityquestions` (
  `UserIDFK` int(11) NOT NULL,
  `QuestionIDFK` int(11) NOT NULL,
  `Answer` varchar(50) NOT NULL,
  KEY `QuestionIDFK` (`QuestionIDFK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD CONSTRAINT `tblorder_ibfk_1` FOREIGN KEY (`UserIdFK`) REFERENCES `tbluser` (`UserIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblorderitems`
--
ALTER TABLE `tblorderitems`
  ADD CONSTRAINT `tblorderitems_ibfk_2` FOREIGN KEY (`OrderIDFK`) REFERENCES `tblorder` (`OrderIDPK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblorderitems_ibfk_1` FOREIGN KEY (`ProductIDFK`) REFERENCES `tblproduct` (`ProductIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblperson`
--
ALTER TABLE `tblperson`
  ADD CONSTRAINT `tblperson_ibfk_1` FOREIGN KEY (`AddressIDFK`) REFERENCES `tbladdress` (`AddressIDPK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblperson_ibfk_2` FOREIGN KEY (`ContactIDFK`) REFERENCES `tblcontact` (`ContactIDPK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblperson_ibfk_3` FOREIGN KEY (`DepIDFK`) REFERENCES `tbldepartment` (`DepartmentIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblproduct`
--
ALTER TABLE `tblproduct`
  ADD CONSTRAINT `tblproduct_ibfk_1` FOREIGN KEY (`CategoryIDFK`) REFERENCES `tblcategory` (`CategoryIDPK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblproduct_ibfk_2` FOREIGN KEY (`ModelIDFK`) REFERENCES `tblmodel` (`ModelIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblstock`
--
ALTER TABLE `tblstock`
  ADD CONSTRAINT `tblstock_ibfk_1` FOREIGN KEY (`ProductIDFK`) REFERENCES `tblproduct` (`ProductIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD CONSTRAINT `tbluser_ibfk_1` FOREIGN KEY (`PersonIDFK`) REFERENCES `tblperson` (`PersonIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbluserrequest`
--
ALTER TABLE `tbluserrequest`
  ADD CONSTRAINT `tbluserrequest_ibfk_1` FOREIGN KEY (`UserIDFK`) REFERENCES `tbluser` (`UserIDPK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbluserrequest_ibfk_2` FOREIGN KEY (`ProductIDFK`) REFERENCES `tblproduct` (`ProductIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblusersecurityquestions`
--
ALTER TABLE `tblusersecurityquestions`
  ADD CONSTRAINT `tblusersecurityquestions_ibfk_1` FOREIGN KEY (`QuestionIDFK`) REFERENCES `tblsecurityquestions` (`QuestionIDPK`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
