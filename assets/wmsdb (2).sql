-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 06:26 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wmsdb`
--
CREATE DATABASE IF NOT EXISTS `wmsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wmsdb`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `AddSpmHubInventoryItem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSpmHubInventoryItem` (IN `_partNo` VARCHAR(50), IN `_lastUpdate` DATETIME)  BEGIN

INSERT INTO spm_hub_inventory(PartNo, LastUpdate) VALUES (_partNo, _lastUpdate);

END$$

DROP PROCEDURE IF EXISTS `AddSpmInboundInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSpmInboundInventory` (IN `itemcode` VARCHAR(50), IN `itemqty` INT(11), IN `spmArNo` VARCHAR(50), IN `itemDateIn` DATE)  BEGIN
declare _itemId INT(11);
declare _inboundItemLastID INT(11);
declare _StockOnHand INT(10);

SELECT ItemId into _itemId from spm_hub_inventory WHERE PartNo = itemcode;

INSERT INTO spm_inbound_inventory_item(ItemID,Qty) VALUES (_itemId,itemqty);
SET _inboundItemLastID = last_insert_id();

INSERT INTO spm_inbound_inventory(ArNo, DateIn, InboundItemId) VALUES (spmArNo,itemDateIn,_inboundItemLastID);

SELECT StockOnHand into _StockOnHand from spm_hub_inventory WHERE PartNo = itemcode; 
SET _StockOnHand = _StockOnHand + itemqty;

UPDATE spm_hub_inventory SET StockOnHand = _StockOnHand WHERE ItemId = _itemId;

END$$

DROP PROCEDURE IF EXISTS `GetAllPartNo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPartNo` ()  BEGIN
SELECT ItemId,PartNo FROM spm_hub_inventory;
END$$

DROP PROCEDURE IF EXISTS `GetNextIdSpmInboundInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNextIdSpmInboundInventory` ()  BEGIN

SELECT AUTO_INCREMENT 
FROM information_schema.tables
WHERE table_name = 'spm_inbound_inventory'
     and table_schema = database();

END$$

DROP PROCEDURE IF EXISTS `GetSpmHubInventoryItemCount`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpmHubInventoryItemCount` ()  BEGIN

SELECT
Sum(spm_hub_inventory.StockOnHand) AS StockCount,
COUNT(spm_hub_inventory.ItemID) AS ItemCount
FROM
spm_hub_inventory;

END$$

DROP PROCEDURE IF EXISTS `GetSpmHubInventoryRandomInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpmHubInventoryRandomInventory` (IN `_limit` INT(10))  BEGIN
SELECT PartNo,StockOnHand FROM spm_hub_inventory WHERE StockOnHand > 0 ORDER BY RAND() LIMIT _limit;
END$$

DROP PROCEDURE IF EXISTS `GetSpmInboundInventoryCount`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpmInboundInventoryCount` ()  BEGIN

SELECT
COUNT(InboundId) as ItemCount
FROM spm_inbound_inventory;
END$$

DROP PROCEDURE IF EXISTS `GetSpmInboundInventoryViewDetails`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpmInboundInventoryViewDetails` (IN `_Inboundid` INT(10))  BEGIN

SELECT
spm_inbound_inventory.InboundId,
spm_inbound_inventory.ArNo,
spm_inbound_inventory.DateIn,
spm_hub_inventory.PartNo,
spm_inbound_inventory_item.Qty
FROM
spm_inbound_inventory
INNER JOIN spm_inbound_inventory_item ON spm_inbound_inventory_item.InboundId = spm_inbound_inventory.InboundId
INNER JOIN spm_hub_inventory ON spm_inbound_inventory_item.ItemID = spm_hub_inventory.ItemId
WHERE
spm_inbound_inventory.InboundId = _Inboundid;

END$$

DROP PROCEDURE IF EXISTS `GetSpmOutboundInventoryCount`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpmOutboundInventoryCount` ()  BEGIN

SELECT
COUNT(spm_outbound_inventory.OutboundId) AS ItemCount
FROM
spm_outbound_inventory;

END$$

DROP PROCEDURE IF EXISTS `GetSpmOutboundInventoryViewDetails`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpmOutboundInventoryViewDetails` (IN `_outboundId` VARCHAR(36))  BEGIN

SELECT
spm_outbound_inventory.OutboundId,
spm_outbound_inventory.WmDrNo,
spm_outbound_inventory.DateOut,
spm_outbound_inventory.ControlSeries,
vehicles.PlateNo AS `Vehicle`,
facilities.`Name` AS `Facility`
FROM
spm_outbound_inventory
INNER JOIN vehicles ON spm_outbound_inventory.VehicleId = vehicles.Id
INNER JOIN facilities ON spm_outbound_inventory.FacilityID = facilities.Id
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_item.Qty,
spm_outbound_inventory_item.PoNumber,
spm_outbound_inventory_item.Remarks,
spm_hub_inventory.PartNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_item ON spm_outbound_inventory_item.OutboundId = spm_outbound_inventory.OutboundId
INNER JOIN spm_hub_inventory ON spm_outbound_inventory_item.ItemID = spm_hub_inventory.ItemId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_apcdr.ApcDrNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_apcdr ON spm_outbound_inventory_apcdr.OutboundId = spm_outbound_inventory.OutboundId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;


END$$

DROP PROCEDURE IF EXISTS `new_procedure`$$
CREATE DEFINER=`dbadmin`@`%` PROCEDURE `new_procedure` (IN `_outboundId` VARCHAR(36))  BEGIN

SELECT
spm_outbound_inventory.OutboundId,
spm_outbound_inventory.WmDrNo,
spm_outbound_inventory.DateOut,
spm_outbound_inventory.ControlSeries,
vehicles.PlateNo,
facilities.`Name`
FROM
spm_outbound_inventory
INNER JOIN vehicles ON spm_outbound_inventory.VehicleId = vehicles.Id
INNER JOIN facilities ON spm_outbound_inventory.FacilityID = facilities.Id
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_item.Qty,
spm_outbound_inventory_item.PoNumber,
spm_outbound_inventory_item.Remarks,
spm_hub_inventory.PartNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_item ON spm_outbound_inventory_item.OutboundId = spm_outbound_inventory.OutboundId
INNER JOIN spm_hub_inventory ON spm_outbound_inventory_item.ItemID = spm_hub_inventory.ItemId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;

SELECT
spm_outbound_inventory_apcdr.ApcDrNo
FROM
spm_outbound_inventory
INNER JOIN spm_outbound_inventory_apcdr ON spm_outbound_inventory_apcdr.OutboundId = spm_outbound_inventory.OutboundId
WHERE
spm_outbound_inventory.OutboundId = _outboundId;


END$$

DROP PROCEDURE IF EXISTS `SearchSpmHubInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSpmHubInventory` (IN `searchItem` VARCHAR(50))  BEGIN

SELECT
*
FROM
spm_hub_inventory
WHERE
spm_hub_inventory.PartNo LIKE CONCAT('%',searchItem,'%');

END$$

DROP PROCEDURE IF EXISTS `SearchSpmInboundInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSpmInboundInventory` (IN `searchItem` VARCHAR(50))  BEGIN

SELECT
*
FROM
spm_inbound_inventory
WHERE
spm_inbound_inventory.ArNo LIKE CONCAT('%',searchItem,'%');

END$$

DROP PROCEDURE IF EXISTS `SearchSpmOutboundInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchSpmOutboundInventory` (IN `searchItem` VARCHAR(50))  BEGIN

SELECT
*
FROM
spm_outbound_inventory
WHERE
spm_outbound_inventory.ApcDrNo LIKE CONCAT('%',searchItem,'%');

END$$

DROP PROCEDURE IF EXISTS `ViewAllSpmHubInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewAllSpmHubInventory` (IN `_offSet` INT(50), IN `_limit` INT(50))  BEGIN
	SELECT
	*
	FROM
	spm_hub_inventory
    LIMIT _offSet, _limit;
END$$

DROP PROCEDURE IF EXISTS `ViewAllSpmInboundInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewAllSpmInboundInventory` (IN `_offSet` INT(50), IN `_limit` INT(50))  BEGIN
	select
    *
    from spm_inbound_inventory
    order by InboundId desc
    limit _offSet, _limit;
END$$

DROP PROCEDURE IF EXISTS `ViewAllSpmOutboundInventory`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewAllSpmOutboundInventory` (IN `_offSet` INT(50), IN `_limit` INT(50))  BEGIN
	select
    *
    from spm_outbound_inventory
    order by LogDate desc
    limit _offSet, _limit;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE `facilities` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Status` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`Id`, `Name`, `Status`) VALUES
(1, 'CAV 2', b'1'),
(2, 'CAV 3', b'1'),
(3, 'IPAI 2', b'1'),
(4, 'IPAI 3', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `spm_hub_inventory`
--

DROP TABLE IF EXISTS `spm_hub_inventory`;
CREATE TABLE `spm_hub_inventory` (
  `ItemId` int(11) NOT NULL,
  `PartNo` varchar(50) NOT NULL,
  `StockOnHand` int(10) NOT NULL,
  `LastUpdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spm_hub_inventory`
--

INSERT INTO `spm_hub_inventory` (`ItemId`, `PartNo`, `StockOnHand`, `LastUpdate`) VALUES
(1, '871-0128A', 150, '2020-02-21 00:00:00'),
(2, '871-0253', 180, '2020-02-22 00:00:00'),
(3, '871-0284', 160, '2020-02-22 00:00:00'),
(4, '871-0368B', 170, '2020-02-20 00:00:00'),
(5, '871-0489B', 35, '2020-02-19 00:00:00'),
(6, '871-0716B', 100, '2020-02-19 00:00:00'),
(7, '871-100024B-BASE', 30, '2020-02-03 00:00:00'),
(8, '871-100024B-COVER', 30, '2020-02-03 00:00:00'),
(9, '871-100068', 520, '2020-02-03 00:00:00'),
(10, '871-100069', 30, '2020-02-03 00:00:00'),
(11, '871-100677A', 0, '2020-01-15 00:00:00'),
(12, '871-100089', 0, '2020-01-15 00:00:00'),
(13, '871-100090', 100, '2020-01-27 00:00:00'),
(14, '871-100092', 200, '2020-01-27 00:00:00'),
(15, '871-100093', 150, '2020-01-27 00:00:00'),
(16, '871-100099A', 0, '2020-01-15 00:00:00'),
(17, '871-100103', 0, '2020-01-15 00:00:00'),
(18, '871-100240A', 0, '2020-01-15 00:00:00'),
(19, '871-100241', 0, '2020-01-15 00:00:00'),
(20, '871-1023A-001', 50, '2020-02-04 00:00:00'),
(21, '871-100678A', 0, '2020-01-15 00:00:00'),
(22, '871-100727', 0, '2020-01-15 00:00:00'),
(23, '871-100779', 0, '2020-01-15 00:00:00'),
(24, '871-100954', 0, '2020-01-15 00:00:00'),
(25, '871-100956 SET', 0, '2020-01-15 00:00:00'),
(26, '871-100982A', 0, '2020-01-15 00:00:00'),
(27, '871-101096', 0, '2020-01-15 00:00:00'),
(28, '871-101364', 0, '2020-01-15 00:00:00'),
(29, '871-101365', 0, '2020-01-15 00:00:00'),
(30, '871-101366', 500, '2020-01-29 00:00:00'),
(31, '871-101462A', 0, '2020-01-15 00:00:00'),
(32, '871-101858', 0, '2020-01-15 00:00:00'),
(33, '871-101860A', 0, '2020-01-15 00:00:00'),
(34, '871-1028', 0, '2020-01-15 00:00:00'),
(35, '871-1093', 0, '2020-01-15 00:00:00'),
(36, '871-102762', 0, '2020-01-15 00:00:00'),
(37, '871-1304A-002', 0, '2020-01-15 00:00:00'),
(38, '871-1304B-001', 0, '2020-01-15 00:00:00'),
(39, '871-1605A', 0, '2020-01-15 00:00:00'),
(40, '871-1731A', 0, '2020-01-15 00:00:00'),
(41, '871-1778B', 0, '2020-01-15 00:00:00'),
(42, '871-1842A', 0, '2020-01-15 00:00:00'),
(43, '871-1842A-002', 0, '2020-01-15 00:00:00'),
(44, '871-1944B', 0, '2020-01-15 00:00:00'),
(45, '871-1944B-004', 0, '2020-01-15 00:00:00'),
(46, '871-1944B-005', 0, '2020-01-15 00:00:00'),
(47, '871-1944B-006', 0, '2020-01-15 00:00:00'),
(48, '871-1936A', 0, '2020-01-15 00:00:00'),
(49, '871-1946C', 0, '2020-01-15 00:00:00'),
(50, '871-1946C-003', 0, '2020-01-15 00:00:00'),
(51, '871-2099C', 0, '2020-01-15 00:00:00'),
(52, '871-2108B', 0, '2020-01-15 00:00:00'),
(53, '871-2109A', 0, '2020-01-15 00:00:00'),
(54, '871-2128A', 0, '2020-01-15 00:00:00'),
(55, '871-2162B', 0, '2020-01-15 00:00:00'),
(56, '871-2162B-001', 0, '2020-01-15 00:00:00'),
(57, '871-2194C', 0, '2020-01-15 00:00:00'),
(58, '871-2205B', 0, '2020-01-15 00:00:00'),
(59, '871-22150', 0, '2020-01-15 00:00:00'),
(60, '871-22151', 0, '2020-01-15 00:00:00'),
(61, '871-2241D-002', 0, '2020-01-15 00:00:00'),
(62, '871-2241D-006', 0, '2020-01-15 00:00:00'),
(63, '871-2386A', 0, '2020-01-15 00:00:00'),
(64, '871-2387A', 0, '2020-01-15 00:00:00'),
(65, '871-2426', 0, '2020-01-15 00:00:00'),
(66, '871-2466C', 0, '2020-01-15 00:00:00'),
(67, '871-2688A', 0, '2020-01-15 00:00:00'),
(68, '871-2689A', 0, '2020-01-15 00:00:00'),
(69, '871-2748A', 0, '2020-01-15 00:00:00'),
(70, '871-2894B', 0, '2020-01-15 00:00:00'),
(71, '871-3092A', 0, '2020-01-15 00:00:00'),
(72, '871-3186A', 0, '2020-01-15 00:00:00'),
(73, '871-3294', 0, '2020-01-15 00:00:00'),
(74, '871-3297', 0, '2020-01-15 00:00:00'),
(75, '871-3326', 0, '2020-01-15 00:00:00'),
(76, '871-3393', 0, '2020-01-15 00:00:00'),
(77, '871-3578', 0, '2020-01-15 00:00:00'),
(78, '871-3737', 0, '2020-01-15 00:00:00'),
(79, '871-3775', 0, '2020-01-15 00:00:00'),
(80, '871-3776', 0, '2020-01-15 00:00:00'),
(81, '871-3777', 0, '2020-01-15 00:00:00'),
(82, '871-3781A', 0, '2020-01-15 00:00:00'),
(83, '871-3781', 0, '2020-01-15 00:00:00'),
(84, '871-3781A-002', 0, '2020-01-15 00:00:00'),
(85, '871-3782A', 0, '2020-01-15 00:00:00'),
(86, '871-3784', 0, '2020-01-15 00:00:00'),
(87, '871-3816B-002', 0, '2020-01-15 00:00:00'),
(88, '871-3816B-003', 0, '2020-01-15 00:00:00'),
(89, '871-3816B-009', 0, '2020-01-15 00:00:00'),
(90, '871-3816B-010', 0, '2020-01-15 00:00:00'),
(91, '871-3816B-014', 0, '2020-01-15 00:00:00'),
(92, '871-3816B-016', 0, '2020-01-15 00:00:00'),
(93, '871-3816B-017', 0, '2020-01-15 00:00:00'),
(94, '871-3936A', 0, '2020-01-15 00:00:00'),
(95, '871-3937A', 0, '2020-01-15 00:00:00'),
(96, '871-3942A', 0, '2020-01-15 00:00:00'),
(97, '871-4095', 0, '2020-01-15 00:00:00'),
(98, '871-4322B', 0, '2020-01-15 00:00:00'),
(99, '871-4334A', 0, '2020-01-15 00:00:00'),
(100, '871-4335A', 0, '2020-01-15 00:00:00'),
(101, '871-4347A', 0, '2020-01-15 00:00:00'),
(102, '871-4460 CAP', 0, '2020-01-15 00:00:00'),
(103, '871-4460 PAD', 0, '2020-01-15 00:00:00'),
(104, '871-4460 SLEEVE', 0, '2020-01-15 00:00:00'),
(105, '871-4473B', 0, '2020-01-15 00:00:00'),
(106, '871-4479B', 0, '2020-01-15 00:00:00'),
(107, '871-4592', 0, '2020-01-15 00:00:00'),
(108, '871-4606', 0, '2020-01-15 00:00:00'),
(109, '871-4659', 0, '2020-01-15 00:00:00'),
(110, '871-4666C', 0, '2020-01-15 00:00:00'),
(111, '871-4675C', 0, '2020-01-15 00:00:00'),
(112, '871-7315', 0, '2020-02-01 00:00:00'),
(113, '871-9584', 0, '2020-02-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `spm_inbound_inventory`
--

DROP TABLE IF EXISTS `spm_inbound_inventory`;
CREATE TABLE `spm_inbound_inventory` (
  `InboundId` varchar(36) NOT NULL,
  `ArNo` varchar(50) NOT NULL,
  `DateIn` datetime NOT NULL,
  `LogDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spm_inbound_inventory`
--

INSERT INTO `spm_inbound_inventory` (`InboundId`, `ArNo`, `DateIn`, `LogDate`) VALUES
('1', '874512', '2020-01-14 00:00:00', NULL),
('10', '999999', '2020-01-22 00:00:00', NULL),
('11', '754861', '2020-01-27 00:00:00', NULL),
('12', '8745146', '2020-01-29 00:00:00', NULL),
('13', '7541246', '2020-01-29 00:00:00', NULL),
('14', '896541', '2020-02-01 00:00:00', NULL),
('15', '874512', '2020-02-03 00:00:00', NULL),
('16', '745842', '2020-02-03 00:00:00', NULL),
('17', '845974', '2020-02-03 00:00:00', NULL),
('18', '978454', '2020-02-03 00:00:00', NULL),
('19', '879546', '2020-02-03 00:00:00', NULL),
('2', '896512', '2020-01-14 00:00:00', NULL),
('20', '879548', '2020-02-03 00:00:00', NULL),
('21', '896548', '2020-02-03 00:00:00', NULL),
('22', '895468', '2020-02-03 00:00:00', NULL),
('23', '798545', '2020-02-04 00:00:00', NULL),
('24', '1235459', '2020-02-21 00:00:00', NULL),
('3', '987451', '2020-01-14 00:00:00', NULL),
('4', '985614', '2020-01-14 00:00:00', NULL),
('5', '123456', '2020-01-14 00:00:00', NULL),
('6', '654785', '2020-01-14 00:00:00', NULL),
('7', '147852', '2020-01-14 00:00:00', NULL),
('8', '547842', '2020-01-15 00:00:00', NULL),
('9', '965475', '2020-01-21 00:00:00', NULL),
('f325ef7a-52ef-11ea-8f27-080027d59683', '1542654', '2020-02-22 00:00:00', '2020-02-22 11:13:38');

-- --------------------------------------------------------

--
-- Table structure for table `spm_inbound_inventory_item`
--

DROP TABLE IF EXISTS `spm_inbound_inventory_item`;
CREATE TABLE `spm_inbound_inventory_item` (
  `InboundItemId` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `InboundId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spm_inbound_inventory_item`
--

INSERT INTO `spm_inbound_inventory_item` (`InboundItemId`, `ItemID`, `Qty`, `InboundId`) VALUES
(1, 1, 10, '1'),
(2, 2, 20, '1'),
(3, 2, 50, '3'),
(4, 4, 100, '3'),
(5, 1, 50, '4'),
(6, 4, 100, '4'),
(7, 1, 10, '5'),
(8, 4, 55, '5'),
(9, 3, 50, '6'),
(10, 3, 30, '7'),
(11, 2, 50, '8'),
(12, 2, 20, '9'),
(13, 9, 200, '10'),
(14, 13, 100, '11'),
(15, 14, 200, '11'),
(16, 15, 150, '11'),
(17, 30, 500, '12'),
(18, 9, 300, '13'),
(19, 5, 50, '14'),
(20, 6, 100, '14'),
(21, 1, 20, '15'),
(22, 2, 50, '16'),
(23, 3, 20, '17'),
(24, 4, 50, '18'),
(25, 5, 10, '19'),
(26, 6, 20, '20'),
(27, 7, 30, '21'),
(28, 8, 30, '21'),
(29, 9, 20, '22'),
(30, 10, 30, '22'),
(31, 20, 50, '23'),
(32, 1, 100, '24'),
(33, 2, 100, 'f325ef7a-52ef-11ea-8f27-080027d59683'),
(34, 3, 100, 'f325ef7a-52ef-11ea-8f27-080027d59683');

-- --------------------------------------------------------

--
-- Table structure for table `spm_outbound_inventory`
--

DROP TABLE IF EXISTS `spm_outbound_inventory`;
CREATE TABLE `spm_outbound_inventory` (
  `OutboundId` varchar(36) NOT NULL,
  `FacilityID` int(11) NOT NULL,
  `WmDrNo` varchar(50) NOT NULL,
  `DateOut` date NOT NULL,
  `VehicleId` int(11) NOT NULL,
  `LogDate` datetime NOT NULL,
  `ControlSeries` varchar(45) NOT NULL,
  `Status` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spm_outbound_inventory`
--

INSERT INTO `spm_outbound_inventory` (`OutboundId`, `FacilityID`, `WmDrNo`, `DateOut`, `VehicleId`, `LogDate`, `ControlSeries`, `Status`) VALUES
('07331093-511c-11ea-8f27-080027d59683', 1, '20', '2020-02-19', 1, '2020-02-19 20:23:20', '2020-02', b'1'),
('07f4149d-510c-11ea-8f27-080027d59683', 3, '16', '2020-02-19', 2, '2020-02-19 18:28:49', '2020-02', b'1'),
('0972743a-511f-11ea-8f27-080027d59683', 1, '27', '2020-02-19', 1, '2020-02-19 20:44:52', '2020-02', b'1'),
('0a45f46f-51f2-11ea-8f27-080027d59683', 1, '3', '2020-02-20', 3, '2020-02-21 04:53:08', '2020-02', b'1'),
('1f35f9e1-511c-11ea-8f27-080027d59683', 1, '21', '2020-02-19', 1, '2020-02-19 20:24:00', '2020-02', b'1'),
('209dfbe4-510c-11ea-8f27-080027d59683', 1, '17', '2020-02-19', 1, '2020-02-19 18:29:30', '2020-02', b'1'),
('311d54dc-511e-11ea-8f27-080027d59683', 1, '26', '2020-02-19', 1, '2020-02-19 20:38:49', '2020-02', b'1'),
('42d96e6e-510c-11ea-8f27-080027d59683', 1, '18', '2020-02-19', 1, '2020-02-19 18:30:28', '2020-02', b'1'),
('54b6a278-511c-11ea-8f27-080027d59683', 1, '22', '2020-02-19', 1, '2020-02-19 20:25:30', '2020-02', b'1'),
('5f807542-44c7-11ea-ad56-b42e9914bd0f', 1, '14', '2020-02-01', 1, '2020-02-01 15:49:30', '2020-02', b'1'),
('611a1bbc-51d5-11ea-8f27-080027d59683', 1, '2', '2020-02-20', 1, '2020-02-21 01:27:58', '2020-02', b'1'),
('6c5e1933-511d-11ea-8f27-080027d59683', 1, '24', '2020-02-19', 1, '2020-02-19 20:33:19', '2020-02', b'1'),
('741091bb-510b-11ea-8f27-080027d59683', 1, '15', '2020-02-19', 1, '2020-02-19 18:24:41', '2020-02', b'1'),
('908face6-511d-11ea-8f27-080027d59683', 1, '25', '2020-02-19', 1, '2020-02-19 20:34:20', '2020-02', b'1'),
('95f3e52d-511b-11ea-8f27-080027d59683', 1, '19', '2020-02-19', 1, '2020-02-19 20:20:10', '2020-02', b'1'),
('d446e330-511c-11ea-8f27-080027d59683', 1, '23', '2020-02-19', 1, '2020-02-19 20:29:04', '2020-02', b'1'),
('d50449c2-4317-11ea-8e61-b42e9914bd0f', 1, '12', '2020-01-30', 1, '2020-01-30 12:20:22', '2020-01', b'1'),
('eb7c06ee-4318-11ea-8e61-b42e9914bd0f', 1, '13', '2020-01-30', 1, '2020-01-30 12:28:09', '2020-01', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `spm_outbound_inventory_apcdr`
--

DROP TABLE IF EXISTS `spm_outbound_inventory_apcdr`;
CREATE TABLE `spm_outbound_inventory_apcdr` (
  `Id` int(11) NOT NULL,
  `ApcDrNo` varchar(45) NOT NULL,
  `OutboundId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spm_outbound_inventory_apcdr`
--

INSERT INTO `spm_outbound_inventory_apcdr` (`Id`, `ApcDrNo`, `OutboundId`) VALUES
(1, '845167', '611a1bbc-51d5-11ea-8f27-080027d59683'),
(2, '845168', '611a1bbc-51d5-11ea-8f27-080027d59683'),
(3, '874569', '0a45f46f-51f2-11ea-8f27-080027d59683');

-- --------------------------------------------------------

--
-- Table structure for table `spm_outbound_inventory_item`
--

DROP TABLE IF EXISTS `spm_outbound_inventory_item`;
CREATE TABLE `spm_outbound_inventory_item` (
  `OutboundItemId` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `OutboundId` varchar(36) NOT NULL,
  `Remarks` varchar(50) DEFAULT NULL,
  `PoNumber` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spm_outbound_inventory_item`
--

INSERT INTO `spm_outbound_inventory_item` (`OutboundItemId`, `ItemID`, `Qty`, `OutboundId`, `Remarks`, `PoNumber`) VALUES
(1, 1, 5, 'd50449c2-4317-11ea-8e61-b42e9914bd0f', NULL, NULL),
(2, 2, 5, 'd50449c2-4317-11ea-8e61-b42e9914bd0f', NULL, NULL),
(3, 3, 5, 'eb7c06ee-4318-11ea-8e61-b42e9914bd0f', NULL, NULL),
(4, 4, 5, 'eb7c06ee-4318-11ea-8e61-b42e9914bd0f', NULL, NULL),
(5, 5, 5, '5f807542-44c7-11ea-ad56-b42e9914bd0f', NULL, NULL),
(6, 6, 5, '5f807542-44c7-11ea-ad56-b42e9914bd0f', NULL, NULL),
(7, 1, 4, '741091bb-510b-11ea-8f27-080027d59683', '', NULL),
(8, 2, 20, '07f4149d-510c-11ea-8f27-080027d59683', '', NULL),
(9, 3, 23, '209dfbe4-510c-11ea-8f27-080027d59683', '', NULL),
(10, 3, 5, '42d96e6e-510c-11ea-8f27-080027d59683', '', NULL),
(11, 1, 10, '95f3e52d-511b-11ea-8f27-080027d59683', '', NULL),
(12, 4, 10, '07331093-511c-11ea-8f27-080027d59683', '', NULL),
(13, 5, 5, '1f35f9e1-511c-11ea-8f27-080027d59683', '', NULL),
(14, 4, 5, '54b6a278-511c-11ea-8f27-080027d59683', '', NULL),
(15, 2, 5, 'd446e330-511c-11ea-8f27-080027d59683', '', NULL),
(16, 6, 5, '6c5e1933-511d-11ea-8f27-080027d59683', '', NULL),
(17, 5, 10, '908face6-511d-11ea-8f27-080027d59683', '', NULL),
(18, 6, 10, '311d54dc-511e-11ea-8f27-080027d59683', '', NULL),
(19, 4, 5, '0972743a-511f-11ea-8f27-080027d59683', 'this remarks', NULL),
(20, 5, 5, '0972743a-511f-11ea-8f27-080027d59683', NULL, NULL),
(21, 1, 10, '611a1bbc-51d5-11ea-8f27-080027d59683', NULL, NULL),
(22, 2, 5, '611a1bbc-51d5-11ea-8f27-080027d59683', NULL, NULL),
(23, 3, 7, '0a45f46f-51f2-11ea-8f27-080027d59683', 'Pickup', NULL),
(24, 4, 10, '0a45f46f-51f2-11ea-8f27-080027d59683', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE `user_accounts` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `Id` int(11) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `PlateNo` varchar(45) DEFAULT NULL,
  `Remarks` varchar(45) DEFAULT NULL,
  `Status` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`Id`, `Type`, `PlateNo`, `Remarks`, `Status`) VALUES
(1, 'Close Van', 'UCK923', NULL, b'1'),
(2, 'L300', 'AAN6066', NULL, b'1'),
(3, 'Others', 'Others', NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `wmdrcontrol`
--

DROP TABLE IF EXISTS `wmdrcontrol`;
CREATE TABLE `wmdrcontrol` (
  `Id` int(11) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Value` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wmdrcontrol`
--

INSERT INTO `wmdrcontrol` (`Id`, `Type`, `Value`) VALUES
(1, 'spmwmdr', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `spm_hub_inventory`
--
ALTER TABLE `spm_hub_inventory`
  ADD PRIMARY KEY (`ItemId`);

--
-- Indexes for table `spm_inbound_inventory`
--
ALTER TABLE `spm_inbound_inventory`
  ADD PRIMARY KEY (`InboundId`);

--
-- Indexes for table `spm_inbound_inventory_item`
--
ALTER TABLE `spm_inbound_inventory_item`
  ADD PRIMARY KEY (`InboundItemId`),
  ADD KEY `ItemId` (`ItemID`),
  ADD KEY `InboundId` (`InboundId`);

--
-- Indexes for table `spm_outbound_inventory`
--
ALTER TABLE `spm_outbound_inventory`
  ADD PRIMARY KEY (`OutboundId`),
  ADD KEY `VehicleID` (`VehicleId`),
  ADD KEY `FacilityID` (`FacilityID`);

--
-- Indexes for table `spm_outbound_inventory_apcdr`
--
ALTER TABLE `spm_outbound_inventory_apcdr`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OutboundId_FK` (`OutboundId`);

--
-- Indexes for table `spm_outbound_inventory_item`
--
ALTER TABLE `spm_outbound_inventory_item`
  ADD PRIMARY KEY (`OutboundItemId`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `OutboundID` (`OutboundId`) USING BTREE;

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `wmdrcontrol`
--
ALTER TABLE `wmdrcontrol`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `spm_hub_inventory`
--
ALTER TABLE `spm_hub_inventory`
  MODIFY `ItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `spm_inbound_inventory_item`
--
ALTER TABLE `spm_inbound_inventory_item`
  MODIFY `InboundItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `spm_outbound_inventory_apcdr`
--
ALTER TABLE `spm_outbound_inventory_apcdr`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spm_outbound_inventory_item`
--
ALTER TABLE `spm_outbound_inventory_item`
  MODIFY `OutboundItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wmdrcontrol`
--
ALTER TABLE `wmdrcontrol`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `spm_inbound_inventory_item`
--
ALTER TABLE `spm_inbound_inventory_item`
  ADD CONSTRAINT `ItemId` FOREIGN KEY (`ItemID`) REFERENCES `spm_hub_inventory` (`ItemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spm_outbound_inventory`
--
ALTER TABLE `spm_outbound_inventory`
  ADD CONSTRAINT `FacilityID` FOREIGN KEY (`FacilityID`) REFERENCES `facilities` (`Id`),
  ADD CONSTRAINT `VehicleID` FOREIGN KEY (`VehicleId`) REFERENCES `vehicles` (`Id`);

--
-- Constraints for table `spm_outbound_inventory_apcdr`
--
ALTER TABLE `spm_outbound_inventory_apcdr`
  ADD CONSTRAINT `OutboundId_FK` FOREIGN KEY (`OutboundId`) REFERENCES `spm_outbound_inventory` (`OutboundId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spm_outbound_inventory_item`
--
ALTER TABLE `spm_outbound_inventory_item`
  ADD CONSTRAINT `outboundid` FOREIGN KEY (`OutboundId`) REFERENCES `spm_outbound_inventory` (`OutboundId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `spm_outbound_inventory_item_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `spm_hub_inventory` (`ItemId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
