-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 07:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trade`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`) VALUES
(1, 'siavasham', 'siavasham', 'qazwsxedc');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `status` enum('from','to') DEFAULT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `text`, `status`, `seen`, `time`, `user_id`) VALUES
(1, 'hi aref', 'from', 0, '2019-12-18 18:02:59', 1),
(2, 'okk', 'from', 0, '2019-12-28 03:54:46', 1),
(3, 'okk', 'from', 0, '2019-12-28 03:54:49', 1),
(4, 'yess', 'from', 0, '2019-12-28 03:54:51', 1),
(5, 'jdkfjd', 'from', 0, '2019-12-28 03:54:52', 1),
(6, 'dfmdlfldf', 'from', 0, '2019-12-28 03:54:53', 1),
(7, 'dfndkfd', 'from', 0, '2019-12-28 03:54:55', 1),
(8, 'fjdfjdfdlfd', 'from', 0, '2019-12-28 03:54:57', 1),
(9, 'kdfkdfjkd', 'from', 0, '2019-12-28 03:54:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `amount`, `description`, `time`, `user_id`) VALUES
(1, 150, 'eth', NULL, 1),
(2, 150, 'eth', NULL, 1),
(3, 150, 'bitcoin', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `id` int(11) NOT NULL,
  `type` enum('stock','forex','crypto') DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`id`, `type`, `symbol`, `display`, `description`) VALUES
(1, 'crypto', 'BINANCE:ETHBTC', 'ETH/BTC', 'ETHBTC'),
(2, 'crypto', 'BINANCE:LTCBTC', 'LTC/BTC', 'LTCBTC'),
(3, 'crypto', 'BINANCE:BNBBTC', 'BNB/BTC', 'BNBBTC'),
(4, 'crypto', 'BINANCE:NEOBTC', 'NEO/BTC', 'NEOBTC'),
(5, 'crypto', 'BINANCE:QTUMETH', 'QTUM/ETH', 'QTUMETH'),
(6, 'crypto', 'BINANCE:EOSETH', 'EOS/ETH', 'EOSETH'),
(7, 'crypto', 'BINANCE:SNTETH', 'SNT/ETH', 'SNTETH'),
(8, 'crypto', 'BINANCE:BNTETH', 'BNT/ETH', 'BNTETH'),
(9, 'crypto', 'BINANCE:BCCBTC', 'BCC/BTC', 'BCCBTC'),
(10, 'crypto', 'BINANCE:GASBTC', 'GAS/BTC', 'GASBTC'),
(11, 'crypto', 'BINANCE:BNBETH', 'BNB/ETH', 'BNBETH'),
(12, 'crypto', 'BINANCE:BTCUSDT', 'BTC/USDT', 'BTCUSDT'),
(13, 'crypto', 'BINANCE:ETHUSDT', 'ETH/USDT', 'ETHUSDT'),
(14, 'crypto', 'BINANCE:HSRBTC', 'HSR/BTC', 'HSRBTC'),
(15, 'crypto', 'BINANCE:OAXETH', 'OAX/ETH', 'OAXETH'),
(16, 'crypto', 'BINANCE:DNTETH', 'DNT/ETH', 'DNTETH'),
(17, 'crypto', 'BINANCE:MCOETH', 'MCO/ETH', 'MCOETH'),
(18, 'crypto', 'BINANCE:ICNETH', 'ICN/ETH', 'ICNETH'),
(19, 'crypto', 'BINANCE:MCOBTC', 'MCO/BTC', 'MCOBTC'),
(20, 'crypto', 'BINANCE:WTCBTC', 'WTC/BTC', 'WTCBTC'),
(21, 'crypto', 'BINANCE:WTCETH', 'WTC/ETH', 'WTCETH'),
(22, 'crypto', 'BINANCE:LRCBTC', 'LRC/BTC', 'LRCBTC'),
(23, 'crypto', 'BINANCE:LRCETH', 'LRC/ETH', 'LRCETH'),
(24, 'crypto', 'BINANCE:QTUMBTC', 'QTUM/BTC', 'QTUMBTC'),
(25, 'crypto', 'BINANCE:YOYOBTC', 'YOYO/BTC', 'YOYOBTC'),
(26, 'crypto', 'BINANCE:OMGBTC', 'OMG/BTC', 'OMGBTC'),
(27, 'crypto', 'BINANCE:OMGETH', 'OMG/ETH', 'OMGETH'),
(28, 'crypto', 'BINANCE:ZRXBTC', 'ZRX/BTC', 'ZRXBTC'),
(29, 'crypto', 'BINANCE:ZRXETH', 'ZRX/ETH', 'ZRXETH'),
(30, 'crypto', 'BINANCE:STRATBTC', 'STRAT/BTC', 'STRATBTC'),
(31, 'crypto', 'BINANCE:STRATETH', 'STRAT/ETH', 'STRATETH'),
(32, 'crypto', 'BINANCE:SNGLSBTC', 'SNGLS/BTC', 'SNGLSBTC'),
(33, 'crypto', 'BINANCE:SNGLSETH', 'SNGLS/ETH', 'SNGLSETH'),
(34, 'crypto', 'BINANCE:BQXBTC', 'BQX/BTC', 'BQXBTC'),
(35, 'crypto', 'BINANCE:BQXETH', 'BQX/ETH', 'BQXETH'),
(36, 'crypto', 'BINANCE:KNCBTC', 'KNC/BTC', 'KNCBTC'),
(37, 'crypto', 'BINANCE:KNCETH', 'KNC/ETH', 'KNCETH'),
(38, 'crypto', 'BINANCE:FUNBTC', 'FUN/BTC', 'FUNBTC'),
(39, 'crypto', 'BINANCE:FUNETH', 'FUN/ETH', 'FUNETH'),
(40, 'crypto', 'BINANCE:SNMBTC', 'SNM/BTC', 'SNMBTC'),
(41, 'crypto', 'BINANCE:SNMETH', 'SNM/ETH', 'SNMETH'),
(42, 'crypto', 'BINANCE:NEOETH', 'NEO/ETH', 'NEOETH'),
(43, 'crypto', 'BINANCE:IOTABTC', 'IOTA/BTC', 'IOTABTC'),
(44, 'crypto', 'BINANCE:IOTAETH', 'IOTA/ETH', 'IOTAETH'),
(45, 'crypto', 'BINANCE:LINKBTC', 'LINK/BTC', 'LINKBTC'),
(46, 'crypto', 'BINANCE:LINKETH', 'LINK/ETH', 'LINKETH'),
(47, 'crypto', 'BINANCE:XVGBTC', 'XVG/BTC', 'XVGBTC'),
(48, 'crypto', 'BINANCE:XVGETH', 'XVG/ETH', 'XVGETH'),
(49, 'crypto', 'BINANCE:SALTBTC', 'SALT/BTC', 'SALTBTC'),
(50, 'crypto', 'BINANCE:SALTETH', 'SALT/ETH', 'SALTETH'),
(51, 'crypto', 'BINANCE:MDABTC', 'MDA/BTC', 'MDABTC'),
(52, 'crypto', 'BINANCE:MDAETH', 'MDA/ETH', 'MDAETH'),
(53, 'crypto', 'BINANCE:MTLBTC', 'MTL/BTC', 'MTLBTC'),
(54, 'crypto', 'BINANCE:MTLETH', 'MTL/ETH', 'MTLETH'),
(55, 'crypto', 'BINANCE:SUBBTC', 'SUB/BTC', 'SUBBTC'),
(56, 'crypto', 'BINANCE:SUBETH', 'SUB/ETH', 'SUBETH'),
(57, 'crypto', 'BINANCE:EOSBTC', 'EOS/BTC', 'EOSBTC'),
(58, 'crypto', 'BINANCE:SNTBTC', 'SNT/BTC', 'SNTBTC'),
(59, 'crypto', 'BINANCE:ETCETH', 'ETC/ETH', 'ETCETH'),
(60, 'crypto', 'BINANCE:ETCBTC', 'ETC/BTC', 'ETCBTC'),
(61, 'crypto', 'BINANCE:MTHBTC', 'MTH/BTC', 'MTHBTC'),
(62, 'crypto', 'BINANCE:MTHETH', 'MTH/ETH', 'MTHETH'),
(63, 'crypto', 'BINANCE:ENGBTC', 'ENG/BTC', 'ENGBTC'),
(64, 'crypto', 'BINANCE:ENGETH', 'ENG/ETH', 'ENGETH'),
(65, 'crypto', 'BINANCE:DNTBTC', 'DNT/BTC', 'DNTBTC'),
(66, 'crypto', 'BINANCE:ZECBTC', 'ZEC/BTC', 'ZECBTC'),
(67, 'crypto', 'BINANCE:ZECETH', 'ZEC/ETH', 'ZECETH'),
(68, 'crypto', 'BINANCE:BNTBTC', 'BNT/BTC', 'BNTBTC'),
(69, 'crypto', 'BINANCE:ASTBTC', 'AST/BTC', 'ASTBTC'),
(70, 'crypto', 'BINANCE:ASTETH', 'AST/ETH', 'ASTETH'),
(71, 'crypto', 'BINANCE:DASHBTC', 'DASH/BTC', 'DASHBTC'),
(72, 'crypto', 'BINANCE:DASHETH', 'DASH/ETH', 'DASHETH'),
(73, 'crypto', 'BINANCE:OAXBTC', 'OAX/BTC', 'OAXBTC'),
(74, 'crypto', 'BINANCE:ICNBTC', 'ICN/BTC', 'ICNBTC'),
(75, 'crypto', 'BINANCE:BTGBTC', 'BTG/BTC', 'BTGBTC'),
(76, 'crypto', 'BINANCE:BTGETH', 'BTG/ETH', 'BTGETH'),
(77, 'crypto', 'BINANCE:EVXBTC', 'EVX/BTC', 'EVXBTC'),
(78, 'crypto', 'BINANCE:EVXETH', 'EVX/ETH', 'EVXETH'),
(79, 'crypto', 'BINANCE:REQBTC', 'REQ/BTC', 'REQBTC'),
(80, 'crypto', 'BINANCE:REQETH', 'REQ/ETH', 'REQETH'),
(81, 'crypto', 'BINANCE:VIBBTC', 'VIB/BTC', 'VIBBTC'),
(82, 'crypto', 'BINANCE:VIBETH', 'VIB/ETH', 'VIBETH'),
(83, 'crypto', 'BINANCE:HSRETH', 'HSR/ETH', 'HSRETH'),
(84, 'crypto', 'BINANCE:TRXBTC', 'TRX/BTC', 'TRXBTC'),
(85, 'crypto', 'BINANCE:TRXETH', 'TRX/ETH', 'TRXETH'),
(86, 'crypto', 'BINANCE:POWRBTC', 'POWR/BTC', 'POWRBTC'),
(87, 'crypto', 'BINANCE:POWRETH', 'POWR/ETH', 'POWRETH'),
(88, 'crypto', 'BINANCE:ARKBTC', 'ARK/BTC', 'ARKBTC'),
(89, 'crypto', 'BINANCE:ARKETH', 'ARK/ETH', 'ARKETH'),
(90, 'crypto', 'BINANCE:YOYOETH', 'YOYO/ETH', 'YOYOETH'),
(91, 'crypto', 'BINANCE:XRPBTC', 'XRP/BTC', 'XRPBTC'),
(92, 'crypto', 'BINANCE:XRPETH', 'XRP/ETH', 'XRPETH'),
(93, 'crypto', 'BINANCE:MODBTC', 'MOD/BTC', 'MODBTC'),
(94, 'crypto', 'BINANCE:MODETH', 'MOD/ETH', 'MODETH'),
(95, 'crypto', 'BINANCE:ENJBTC', 'ENJ/BTC', 'ENJBTC'),
(96, 'crypto', 'BINANCE:ENJETH', 'ENJ/ETH', 'ENJETH'),
(97, 'crypto', 'BINANCE:STORJBTC', 'STORJ/BTC', 'STORJBTC'),
(98, 'crypto', 'BINANCE:STORJETH', 'STORJ/ETH', 'STORJETH'),
(99, 'crypto', 'BINANCE:BNBUSDT', 'BNB/USDT', 'BNBUSDT'),
(100, 'crypto', 'BINANCE:VENBNB', 'VEN/BNB', 'VENBNB'),
(101, 'crypto', 'BINANCE:YOYOBNB', 'YOYO/BNB', 'YOYOBNB'),
(102, 'crypto', 'BINANCE:POWRBNB', 'POWR/BNB', 'POWRBNB'),
(103, 'crypto', 'BINANCE:VENBTC', 'VEN/BTC', 'VENBTC'),
(104, 'crypto', 'BINANCE:VENETH', 'VEN/ETH', 'VENETH'),
(105, 'crypto', 'BINANCE:KMDBTC', 'KMD/BTC', 'KMDBTC'),
(106, 'crypto', 'BINANCE:KMDETH', 'KMD/ETH', 'KMDETH'),
(107, 'crypto', 'BINANCE:NULSBNB', 'NULS/BNB', 'NULSBNB'),
(108, 'crypto', 'BINANCE:RCNBTC', 'RCN/BTC', 'RCNBTC'),
(109, 'crypto', 'BINANCE:RCNETH', 'RCN/ETH', 'RCNETH'),
(110, 'crypto', 'BINANCE:RCNBNB', 'RCN/BNB', 'RCNBNB'),
(111, 'crypto', 'BINANCE:NULSBTC', 'NULS/BTC', 'NULSBTC'),
(112, 'crypto', 'BINANCE:NULSETH', 'NULS/ETH', 'NULSETH'),
(113, 'crypto', 'BINANCE:RDNBTC', 'RDN/BTC', 'RDNBTC'),
(114, 'crypto', 'BINANCE:RDNETH', 'RDN/ETH', 'RDNETH'),
(115, 'crypto', 'BINANCE:RDNBNB', 'RDN/BNB', 'RDNBNB'),
(116, 'crypto', 'BINANCE:XMRBTC', 'XMR/BTC', 'XMRBTC'),
(117, 'crypto', 'BINANCE:XMRETH', 'XMR/ETH', 'XMRETH'),
(118, 'crypto', 'BINANCE:DLTBNB', 'DLT/BNB', 'DLTBNB'),
(119, 'crypto', 'BINANCE:WTCBNB', 'WTC/BNB', 'WTCBNB'),
(120, 'crypto', 'BINANCE:DLTBTC', 'DLT/BTC', 'DLTBTC'),
(121, 'crypto', 'BINANCE:DLTETH', 'DLT/ETH', 'DLTETH'),
(122, 'crypto', 'BINANCE:AMBBTC', 'AMB/BTC', 'AMBBTC'),
(123, 'crypto', 'BINANCE:AMBETH', 'AMB/ETH', 'AMBETH'),
(124, 'crypto', 'BINANCE:AMBBNB', 'AMB/BNB', 'AMBBNB'),
(125, 'crypto', 'BINANCE:BCCETH', 'BCC/ETH', 'BCCETH'),
(126, 'crypto', 'BINANCE:BCCUSDT', 'BCC/USDT', 'BCCUSDT'),
(127, 'crypto', 'BINANCE:BCCBNB', 'BCC/BNB', 'BCCBNB'),
(128, 'crypto', 'BINANCE:BATBTC', 'BAT/BTC', 'BATBTC'),
(129, 'crypto', 'BINANCE:BATETH', 'BAT/ETH', 'BATETH'),
(130, 'crypto', 'BINANCE:BATBNB', 'BAT/BNB', 'BATBNB'),
(131, 'crypto', 'BINANCE:BCPTBTC', 'BCPT/BTC', 'BCPTBTC'),
(132, 'crypto', 'BINANCE:BCPTETH', 'BCPT/ETH', 'BCPTETH'),
(133, 'crypto', 'BINANCE:BCPTBNB', 'BCPT/BNB', 'BCPTBNB'),
(134, 'crypto', 'BINANCE:ARNBTC', 'ARN/BTC', 'ARNBTC'),
(135, 'crypto', 'BINANCE:ARNETH', 'ARN/ETH', 'ARNETH'),
(136, 'crypto', 'BINANCE:GVTBTC', 'GVT/BTC', 'GVTBTC'),
(137, 'crypto', 'BINANCE:GVTETH', 'GVT/ETH', 'GVTETH'),
(138, 'crypto', 'BINANCE:CDTBTC', 'CDT/BTC', 'CDTBTC'),
(139, 'crypto', 'BINANCE:CDTETH', 'CDT/ETH', 'CDTETH'),
(140, 'crypto', 'BINANCE:GXSBTC', 'GXS/BTC', 'GXSBTC'),
(141, 'crypto', 'BINANCE:GXSETH', 'GXS/ETH', 'GXSETH'),
(142, 'crypto', 'BINANCE:NEOUSDT', 'NEO/USDT', 'NEOUSDT'),
(143, 'crypto', 'BINANCE:NEOBNB', 'NEO/BNB', 'NEOBNB'),
(144, 'crypto', 'BINANCE:POEBTC', 'POE/BTC', 'POEBTC'),
(145, 'crypto', 'BINANCE:POEETH', 'POE/ETH', 'POEETH'),
(146, 'crypto', 'BINANCE:QSPBTC', 'QSP/BTC', 'QSPBTC'),
(147, 'crypto', 'BINANCE:QSPETH', 'QSP/ETH', 'QSPETH'),
(148, 'crypto', 'BINANCE:QSPBNB', 'QSP/BNB', 'QSPBNB'),
(149, 'crypto', 'BINANCE:BTSBTC', 'BTS/BTC', 'BTSBTC'),
(150, 'crypto', 'BINANCE:BTSETH', 'BTS/ETH', 'BTSETH'),
(151, 'crypto', 'BINANCE:BTSBNB', 'BTS/BNB', 'BTSBNB'),
(152, 'crypto', 'BINANCE:XZCBTC', 'XZC/BTC', 'XZCBTC'),
(153, 'crypto', 'BINANCE:XZCETH', 'XZC/ETH', 'XZCETH'),
(154, 'crypto', 'BINANCE:XZCBNB', 'XZC/BNB', 'XZCBNB'),
(155, 'crypto', 'BINANCE:LSKBTC', 'LSK/BTC', 'LSKBTC'),
(156, 'crypto', 'BINANCE:LSKETH', 'LSK/ETH', 'LSKETH'),
(157, 'crypto', 'BINANCE:LSKBNB', 'LSK/BNB', 'LSKBNB'),
(158, 'crypto', 'BINANCE:TNTBTC', 'TNT/BTC', 'TNTBTC'),
(159, 'crypto', 'BINANCE:TNTETH', 'TNT/ETH', 'TNTETH'),
(160, 'crypto', 'BINANCE:FUELBTC', 'FUEL/BTC', 'FUELBTC'),
(161, 'crypto', 'BINANCE:FUELETH', 'FUEL/ETH', 'FUELETH'),
(162, 'crypto', 'BINANCE:MANABTC', 'MANA/BTC', 'MANABTC'),
(163, 'crypto', 'BINANCE:MANAETH', 'MANA/ETH', 'MANAETH'),
(164, 'crypto', 'BINANCE:BCDBTC', 'BCD/BTC', 'BCDBTC'),
(165, 'crypto', 'BINANCE:BCDETH', 'BCD/ETH', 'BCDETH'),
(166, 'crypto', 'BINANCE:DGDBTC', 'DGD/BTC', 'DGDBTC'),
(167, 'crypto', 'BINANCE:DGDETH', 'DGD/ETH', 'DGDETH'),
(168, 'crypto', 'BINANCE:IOTABNB', 'IOTA/BNB', 'IOTABNB'),
(169, 'crypto', 'BINANCE:ADXBTC', 'ADX/BTC', 'ADXBTC'),
(170, 'crypto', 'BINANCE:ADXETH', 'ADX/ETH', 'ADXETH'),
(171, 'crypto', 'BINANCE:ADXBNB', 'ADX/BNB', 'ADXBNB'),
(172, 'crypto', 'BINANCE:ADABTC', 'ADA/BTC', 'ADABTC'),
(173, 'crypto', 'BINANCE:ADAETH', 'ADA/ETH', 'ADAETH'),
(174, 'crypto', 'BINANCE:PPTBTC', 'PPT/BTC', 'PPTBTC'),
(175, 'crypto', 'BINANCE:PPTETH', 'PPT/ETH', 'PPTETH'),
(176, 'crypto', 'BINANCE:CMTBTC', 'CMT/BTC', 'CMTBTC'),
(177, 'crypto', 'BINANCE:CMTETH', 'CMT/ETH', 'CMTETH'),
(178, 'crypto', 'BINANCE:CMTBNB', 'CMT/BNB', 'CMTBNB'),
(179, 'crypto', 'BINANCE:XLMBTC', 'XLM/BTC', 'XLMBTC'),
(180, 'crypto', 'BINANCE:XLMETH', 'XLM/ETH', 'XLMETH'),
(181, 'crypto', 'BINANCE:XLMBNB', 'XLM/BNB', 'XLMBNB'),
(182, 'crypto', 'BINANCE:CNDBTC', 'CND/BTC', 'CNDBTC'),
(183, 'crypto', 'BINANCE:CNDETH', 'CND/ETH', 'CNDETH'),
(184, 'crypto', 'BINANCE:CNDBNB', 'CND/BNB', 'CNDBNB'),
(185, 'crypto', 'BINANCE:LENDBTC', 'LEND/BTC', 'LENDBTC'),
(186, 'crypto', 'BINANCE:LENDETH', 'LEND/ETH', 'LENDETH'),
(187, 'crypto', 'BINANCE:WABIBTC', 'WABI/BTC', 'WABIBTC'),
(188, 'crypto', 'BINANCE:WABIETH', 'WABI/ETH', 'WABIETH'),
(189, 'crypto', 'BINANCE:WABIBNB', 'WABI/BNB', 'WABIBNB'),
(190, 'crypto', 'BINANCE:LTCETH', 'LTC/ETH', 'LTCETH'),
(191, 'crypto', 'BINANCE:LTCUSDT', 'LTC/USDT', 'LTCUSDT'),
(192, 'crypto', 'BINANCE:LTCBNB', 'LTC/BNB', 'LTCBNB'),
(193, 'crypto', 'BINANCE:TNBBTC', 'TNB/BTC', 'TNBBTC'),
(194, 'crypto', 'BINANCE:TNBETH', 'TNB/ETH', 'TNBETH'),
(195, 'crypto', 'BINANCE:WAVESBTC', 'WAVES/BTC', 'WAVESBTC'),
(196, 'crypto', 'BINANCE:WAVESETH', 'WAVES/ETH', 'WAVESETH'),
(197, 'crypto', 'BINANCE:WAVESBNB', 'WAVES/BNB', 'WAVESBNB'),
(198, 'crypto', 'BINANCE:GTOBTC', 'GTO/BTC', 'GTOBTC'),
(199, 'crypto', 'BINANCE:GTOETH', 'GTO/ETH', 'GTOETH'),
(200, 'crypto', 'BINANCE:GTOBNB', 'GTO/BNB', 'GTOBNB'),
(201, 'crypto', 'BINANCE:ICXBTC', 'ICX/BTC', 'ICXBTC'),
(202, 'crypto', 'BINANCE:ICXETH', 'ICX/ETH', 'ICXETH'),
(203, 'crypto', 'BINANCE:ICXBNB', 'ICX/BNB', 'ICXBNB'),
(204, 'crypto', 'BINANCE:OSTBTC', 'OST/BTC', 'OSTBTC'),
(205, 'crypto', 'BINANCE:OSTETH', 'OST/ETH', 'OSTETH'),
(206, 'crypto', 'BINANCE:OSTBNB', 'OST/BNB', 'OSTBNB'),
(207, 'crypto', 'BINANCE:ELFBTC', 'ELF/BTC', 'ELFBTC'),
(208, 'crypto', 'BINANCE:ELFETH', 'ELF/ETH', 'ELFETH'),
(209, 'crypto', 'BINANCE:AIONBTC', 'AION/BTC', 'AIONBTC'),
(210, 'crypto', 'BINANCE:AIONETH', 'AION/ETH', 'AIONETH'),
(211, 'crypto', 'BINANCE:AIONBNB', 'AION/BNB', 'AIONBNB'),
(212, 'crypto', 'BINANCE:NEBLBTC', 'NEBL/BTC', 'NEBLBTC'),
(213, 'crypto', 'BINANCE:NEBLETH', 'NEBL/ETH', 'NEBLETH'),
(214, 'crypto', 'BINANCE:NEBLBNB', 'NEBL/BNB', 'NEBLBNB'),
(215, 'crypto', 'BINANCE:BRDBTC', 'BRD/BTC', 'BRDBTC'),
(216, 'crypto', 'BINANCE:BRDETH', 'BRD/ETH', 'BRDETH'),
(217, 'crypto', 'BINANCE:BRDBNB', 'BRD/BNB', 'BRDBNB'),
(218, 'crypto', 'BINANCE:MCOBNB', 'MCO/BNB', 'MCOBNB'),
(219, 'crypto', 'BINANCE:EDOBTC', 'EDO/BTC', 'EDOBTC'),
(220, 'crypto', 'BINANCE:EDOETH', 'EDO/ETH', 'EDOETH'),
(221, 'crypto', 'BINANCE:WINGSBTC', 'WINGS/BTC', 'WINGSBTC'),
(222, 'crypto', 'BINANCE:WINGSETH', 'WINGS/ETH', 'WINGSETH'),
(223, 'crypto', 'BINANCE:NAVBTC', 'NAV/BTC', 'NAVBTC'),
(224, 'crypto', 'BINANCE:NAVETH', 'NAV/ETH', 'NAVETH'),
(225, 'crypto', 'BINANCE:NAVBNB', 'NAV/BNB', 'NAVBNB'),
(226, 'crypto', 'BINANCE:LUNBTC', 'LUN/BTC', 'LUNBTC'),
(227, 'crypto', 'BINANCE:LUNETH', 'LUN/ETH', 'LUNETH'),
(228, 'crypto', 'BINANCE:TRIGBTC', 'TRIG/BTC', 'TRIGBTC'),
(229, 'crypto', 'BINANCE:TRIGETH', 'TRIG/ETH', 'TRIGETH'),
(230, 'crypto', 'BINANCE:TRIGBNB', 'TRIG/BNB', 'TRIGBNB'),
(231, 'crypto', 'BINANCE:APPCBTC', 'APPC/BTC', 'APPCBTC'),
(232, 'crypto', 'BINANCE:APPCETH', 'APPC/ETH', 'APPCETH'),
(233, 'crypto', 'BINANCE:APPCBNB', 'APPC/BNB', 'APPCBNB'),
(234, 'crypto', 'BINANCE:VIBEBTC', 'VIBE/BTC', 'VIBEBTC'),
(235, 'crypto', 'BINANCE:VIBEETH', 'VIBE/ETH', 'VIBEETH'),
(236, 'crypto', 'BINANCE:RLCBTC', 'RLC/BTC', 'RLCBTC'),
(237, 'crypto', 'BINANCE:RLCETH', 'RLC/ETH', 'RLCETH'),
(238, 'crypto', 'BINANCE:RLCBNB', 'RLC/BNB', 'RLCBNB'),
(239, 'crypto', 'BINANCE:INSBTC', 'INS/BTC', 'INSBTC'),
(240, 'crypto', 'BINANCE:INSETH', 'INS/ETH', 'INSETH'),
(241, 'crypto', 'BINANCE:PIVXBTC', 'PIVX/BTC', 'PIVXBTC'),
(242, 'crypto', 'BINANCE:PIVXETH', 'PIVX/ETH', 'PIVXETH'),
(243, 'crypto', 'BINANCE:PIVXBNB', 'PIVX/BNB', 'PIVXBNB'),
(244, 'crypto', 'BINANCE:IOSTBTC', 'IOST/BTC', 'IOSTBTC'),
(245, 'crypto', 'BINANCE:IOSTETH', 'IOST/ETH', 'IOSTETH'),
(246, 'crypto', 'BINANCE:CHATBTC', 'CHAT/BTC', 'CHATBTC'),
(247, 'crypto', 'BINANCE:CHATETH', 'CHAT/ETH', 'CHATETH'),
(248, 'crypto', 'BINANCE:STEEMBTC', 'STEEM/BTC', 'STEEMBTC'),
(249, 'crypto', 'BINANCE:STEEMETH', 'STEEM/ETH', 'STEEMETH'),
(250, 'crypto', 'BINANCE:STEEMBNB', 'STEEM/BNB', 'STEEMBNB'),
(251, 'crypto', 'BINANCE:NANOBTC', 'NANO/BTC', 'NANOBTC'),
(252, 'crypto', 'BINANCE:NANOETH', 'NANO/ETH', 'NANOETH'),
(253, 'crypto', 'BINANCE:NANOBNB', 'NANO/BNB', 'NANOBNB'),
(254, 'crypto', 'BINANCE:VIABTC', 'VIA/BTC', 'VIABTC'),
(255, 'crypto', 'BINANCE:VIAETH', 'VIA/ETH', 'VIAETH'),
(256, 'crypto', 'BINANCE:VIABNB', 'VIA/BNB', 'VIABNB'),
(257, 'crypto', 'BINANCE:BLZBTC', 'BLZ/BTC', 'BLZBTC'),
(258, 'crypto', 'BINANCE:BLZETH', 'BLZ/ETH', 'BLZETH'),
(259, 'crypto', 'BINANCE:BLZBNB', 'BLZ/BNB', 'BLZBNB'),
(260, 'crypto', 'BINANCE:AEBTC', 'AE/BTC', 'AEBTC'),
(261, 'crypto', 'BINANCE:AEETH', 'AE/ETH', 'AEETH'),
(262, 'crypto', 'BINANCE:AEBNB', 'AE/BNB', 'AEBNB'),
(263, 'crypto', 'BINANCE:RPXBTC', 'RPX/BTC', 'RPXBTC'),
(264, 'crypto', 'BINANCE:RPXETH', 'RPX/ETH', 'RPXETH'),
(265, 'crypto', 'BINANCE:RPXBNB', 'RPX/BNB', 'RPXBNB'),
(266, 'crypto', 'BINANCE:NCASHBTC', 'NCASH/BTC', 'NCASHBTC'),
(267, 'crypto', 'BINANCE:NCASHETH', 'NCASH/ETH', 'NCASHETH'),
(268, 'crypto', 'BINANCE:NCASHBNB', 'NCASH/BNB', 'NCASHBNB'),
(269, 'crypto', 'BINANCE:POABTC', 'POA/BTC', 'POABTC'),
(270, 'crypto', 'BINANCE:POAETH', 'POA/ETH', 'POAETH'),
(271, 'crypto', 'BINANCE:POABNB', 'POA/BNB', 'POABNB'),
(272, 'crypto', 'BINANCE:ZILBTC', 'ZIL/BTC', 'ZILBTC'),
(273, 'crypto', 'BINANCE:ZILETH', 'ZIL/ETH', 'ZILETH'),
(274, 'crypto', 'BINANCE:ZILBNB', 'ZIL/BNB', 'ZILBNB'),
(275, 'crypto', 'BINANCE:ONTBTC', 'ONT/BTC', 'ONTBTC'),
(276, 'crypto', 'BINANCE:ONTETH', 'ONT/ETH', 'ONTETH'),
(277, 'crypto', 'BINANCE:ONTBNB', 'ONT/BNB', 'ONTBNB'),
(278, 'crypto', 'BINANCE:STORMBTC', 'STORM/BTC', 'STORMBTC'),
(279, 'crypto', 'BINANCE:STORMETH', 'STORM/ETH', 'STORMETH'),
(280, 'crypto', 'BINANCE:STORMBNB', 'STORM/BNB', 'STORMBNB'),
(281, 'crypto', 'BINANCE:QTUMBNB', 'QTUM/BNB', 'QTUMBNB'),
(282, 'crypto', 'BINANCE:QTUMUSDT', 'QTUM/USDT', 'QTUMUSDT'),
(283, 'crypto', 'BINANCE:XEMBTC', 'XEM/BTC', 'XEMBTC'),
(284, 'crypto', 'BINANCE:XEMETH', 'XEM/ETH', 'XEMETH'),
(285, 'crypto', 'BINANCE:XEMBNB', 'XEM/BNB', 'XEMBNB'),
(286, 'crypto', 'BINANCE:WANBTC', 'WAN/BTC', 'WANBTC'),
(287, 'crypto', 'BINANCE:WANETH', 'WAN/ETH', 'WANETH'),
(288, 'crypto', 'BINANCE:WANBNB', 'WAN/BNB', 'WANBNB'),
(289, 'crypto', 'BINANCE:WPRBTC', 'WPR/BTC', 'WPRBTC'),
(290, 'crypto', 'BINANCE:WPRETH', 'WPR/ETH', 'WPRETH'),
(291, 'crypto', 'BINANCE:QLCBTC', 'QLC/BTC', 'QLCBTC'),
(292, 'crypto', 'BINANCE:QLCETH', 'QLC/ETH', 'QLCETH'),
(293, 'crypto', 'BINANCE:SYSBTC', 'SYS/BTC', 'SYSBTC'),
(294, 'crypto', 'BINANCE:SYSETH', 'SYS/ETH', 'SYSETH'),
(295, 'crypto', 'BINANCE:SYSBNB', 'SYS/BNB', 'SYSBNB'),
(296, 'crypto', 'BINANCE:QLCBNB', 'QLC/BNB', 'QLCBNB'),
(297, 'crypto', 'BINANCE:GRSBTC', 'GRS/BTC', 'GRSBTC'),
(299, 'crypto', 'BINANCE:GRSETH', 'GRS/ETH', 'GRSETH'),
(301, 'crypto', 'BINANCE:ADAUSDT', 'ADA/USDT', 'ADAUSDT'),
(303, 'crypto', 'BINANCE:ADABNB', 'ADA/BNB', 'ADABNB'),
(305, 'crypto', 'BINANCE:CLOAKBTC', 'CLOAK/BTC', 'CLOAKBTC'),
(307, 'crypto', 'BINANCE:CLOAKETH', 'CLOAK/ETH', 'CLOAKETH'),
(309, 'crypto', 'BINANCE:GNTBTC', 'GNT/BTC', 'GNTBTC'),
(311, 'crypto', 'BINANCE:GNTETH', 'GNT/ETH', 'GNTETH'),
(313, 'crypto', 'BINANCE:GNTBNB', 'GNT/BNB', 'GNTBNB'),
(315, 'crypto', 'BINANCE:LOOMBTC', 'LOOM/BTC', 'LOOMBTC'),
(317, 'crypto', 'BINANCE:LOOMETH', 'LOOM/ETH', 'LOOMETH'),
(319, 'crypto', 'BINANCE:LOOMBNB', 'LOOM/BNB', 'LOOMBNB'),
(321, 'crypto', 'BINANCE:XRPUSDT', 'XRP/USDT', 'XRPUSDT'),
(323, 'crypto', 'BINANCE:BCNBTC', 'BCN/BTC', 'BCNBTC'),
(325, 'crypto', 'BINANCE:BCNETH', 'BCN/ETH', 'BCNETH'),
(327, 'crypto', 'BINANCE:BCNBNB', 'BCN/BNB', 'BCNBNB'),
(329, 'crypto', 'BINANCE:REPBTC', 'REP/BTC', 'REPBTC'),
(331, 'crypto', 'BINANCE:REPETH', 'REP/ETH', 'REPETH'),
(333, 'crypto', 'BINANCE:REPBNB', 'REP/BNB', 'REPBNB'),
(335, 'crypto', 'BINANCE:BTCTUSD', 'BTC/TUSD', 'BTCTUSD'),
(337, 'crypto', 'BINANCE:TUSDBTC', 'TUSD/BTC', 'TUSDBTC'),
(339, 'crypto', 'BINANCE:ETHTUSD', 'ETH/TUSD', 'ETHTUSD'),
(341, 'crypto', 'BINANCE:TUSDETH', 'TUSD/ETH', 'TUSDETH'),
(343, 'crypto', 'BINANCE:TUSDBNB', 'TUSD/BNB', 'TUSDBNB'),
(345, 'crypto', 'BINANCE:ZENBTC', 'ZEN/BTC', 'ZENBTC'),
(347, 'crypto', 'BINANCE:ZENETH', 'ZEN/ETH', 'ZENETH'),
(349, 'crypto', 'BINANCE:ZENBNB', 'ZEN/BNB', 'ZENBNB'),
(351, 'crypto', 'BINANCE:SKYBTC', 'SKY/BTC', 'SKYBTC'),
(353, 'crypto', 'BINANCE:SKYETH', 'SKY/ETH', 'SKYETH'),
(355, 'crypto', 'BINANCE:SKYBNB', 'SKY/BNB', 'SKYBNB'),
(357, 'crypto', 'BINANCE:EOSUSDT', 'EOS/USDT', 'EOSUSDT'),
(359, 'crypto', 'BINANCE:EOSBNB', 'EOS/BNB', 'EOSBNB'),
(361, 'crypto', 'BINANCE:CVCBTC', 'CVC/BTC', 'CVCBTC'),
(363, 'crypto', 'BINANCE:CVCETH', 'CVC/ETH', 'CVCETH'),
(365, 'crypto', 'BINANCE:CVCBNB', 'CVC/BNB', 'CVCBNB'),
(367, 'crypto', 'BINANCE:THETABTC', 'THETA/BTC', 'THETABTC'),
(369, 'crypto', 'BINANCE:THETAETH', 'THETA/ETH', 'THETAETH'),
(371, 'crypto', 'BINANCE:THETABNB', 'THETA/BNB', 'THETABNB'),
(373, 'crypto', 'BINANCE:XRPBNB', 'XRP/BNB', 'XRPBNB'),
(375, 'crypto', 'BINANCE:TUSDUSDT', 'TUSD/USDT', 'TUSDUSDT'),
(377, 'crypto', 'BINANCE:IOTAUSDT', 'IOTA/USDT', 'IOTAUSDT'),
(379, 'crypto', 'BINANCE:XLMUSDT', 'XLM/USDT', 'XLMUSDT'),
(381, 'crypto', 'BINANCE:IOTXBTC', 'IOTX/BTC', 'IOTXBTC'),
(383, 'crypto', 'BINANCE:IOTXETH', 'IOTX/ETH', 'IOTXETH'),
(385, 'crypto', 'BINANCE:QKCBTC', 'QKC/BTC', 'QKCBTC'),
(387, 'crypto', 'BINANCE:QKCETH', 'QKC/ETH', 'QKCETH'),
(389, 'crypto', 'BINANCE:AGIBTC', 'AGI/BTC', 'AGIBTC'),
(391, 'crypto', 'BINANCE:AGIETH', 'AGI/ETH', 'AGIETH'),
(393, 'crypto', 'BINANCE:AGIBNB', 'AGI/BNB', 'AGIBNB'),
(395, 'crypto', 'BINANCE:NXSBTC', 'NXS/BTC', 'NXSBTC'),
(397, 'crypto', 'BINANCE:NXSETH', 'NXS/ETH', 'NXSETH'),
(399, 'crypto', 'BINANCE:NXSBNB', 'NXS/BNB', 'NXSBNB'),
(401, 'crypto', 'BINANCE:ENJBNB', 'ENJ/BNB', 'ENJBNB'),
(403, 'crypto', 'BINANCE:DATABTC', 'DATA/BTC', 'DATABTC'),
(405, 'crypto', 'BINANCE:DATAETH', 'DATA/ETH', 'DATAETH'),
(407, 'crypto', 'BINANCE:ONTUSDT', 'ONT/USDT', 'ONTUSDT'),
(409, 'crypto', 'BINANCE:TRXBNB', 'TRX/BNB', 'TRXBNB'),
(411, 'crypto', 'BINANCE:TRXUSDT', 'TRX/USDT', 'TRXUSDT'),
(413, 'crypto', 'BINANCE:ETCUSDT', 'ETC/USDT', 'ETCUSDT'),
(415, 'crypto', 'BINANCE:ETCBNB', 'ETC/BNB', 'ETCBNB'),
(417, 'crypto', 'BINANCE:ICXUSDT', 'ICX/USDT', 'ICXUSDT'),
(419, 'crypto', 'BINANCE:SCBTC', 'SC/BTC', 'SCBTC'),
(421, 'crypto', 'BINANCE:SCETH', 'SC/ETH', 'SCETH'),
(423, 'crypto', 'BINANCE:SCBNB', 'SC/BNB', 'SCBNB'),
(425, 'crypto', 'BINANCE:NPXSBTC', 'NPXS/BTC', 'NPXSBTC'),
(427, 'crypto', 'BINANCE:NPXSETH', 'NPXS/ETH', 'NPXSETH'),
(429, 'crypto', 'BINANCE:VENUSDT', 'VEN/USDT', 'VENUSDT'),
(431, 'crypto', 'BINANCE:KEYBTC', 'KEY/BTC', 'KEYBTC'),
(433, 'crypto', 'BINANCE:KEYETH', 'KEY/ETH', 'KEYETH'),
(435, 'crypto', 'BINANCE:NASBTC', 'NAS/BTC', 'NASBTC'),
(437, 'crypto', 'BINANCE:NASETH', 'NAS/ETH', 'NASETH'),
(439, 'crypto', 'BINANCE:NASBNB', 'NAS/BNB', 'NASBNB'),
(441, 'crypto', 'BINANCE:MFTBTC', 'MFT/BTC', 'MFTBTC'),
(443, 'crypto', 'BINANCE:MFTETH', 'MFT/ETH', 'MFTETH'),
(445, 'crypto', 'BINANCE:MFTBNB', 'MFT/BNB', 'MFTBNB'),
(447, 'crypto', 'BINANCE:DENTBTC', 'DENT/BTC', 'DENTBTC'),
(449, 'crypto', 'BINANCE:DENTETH', 'DENT/ETH', 'DENTETH'),
(451, 'crypto', 'BINANCE:ARDRBTC', 'ARDR/BTC', 'ARDRBTC'),
(453, 'crypto', 'BINANCE:ARDRETH', 'ARDR/ETH', 'ARDRETH'),
(455, 'crypto', 'BINANCE:ARDRBNB', 'ARDR/BNB', 'ARDRBNB'),
(457, 'crypto', 'BINANCE:NULSUSDT', 'NULS/USDT', 'NULSUSDT'),
(459, 'crypto', 'BINANCE:HOTBTC', 'HOT/BTC', 'HOTBTC'),
(461, 'crypto', 'BINANCE:HOTETH', 'HOT/ETH', 'HOTETH'),
(463, 'crypto', 'BINANCE:VETBTC', 'VET/BTC', 'VETBTC'),
(465, 'crypto', 'BINANCE:VETETH', 'VET/ETH', 'VETETH'),
(467, 'crypto', 'BINANCE:VETUSDT', 'VET/USDT', 'VETUSDT'),
(469, 'crypto', 'BINANCE:VETBNB', 'VET/BNB', 'VETBNB'),
(471, 'crypto', 'BINANCE:DOCKBTC', 'DOCK/BTC', 'DOCKBTC'),
(473, 'crypto', 'BINANCE:DOCKETH', 'DOCK/ETH', 'DOCKETH'),
(475, 'crypto', 'BINANCE:POLYBTC', 'POLY/BTC', 'POLYBTC'),
(477, 'crypto', 'BINANCE:POLYBNB', 'POLY/BNB', 'POLYBNB'),
(479, 'crypto', 'BINANCE:PHXBTC', 'PHX/BTC', 'PHXBTC'),
(481, 'crypto', 'BINANCE:PHXETH', 'PHX/ETH', 'PHXETH'),
(483, 'crypto', 'BINANCE:PHXBNB', 'PHX/BNB', 'PHXBNB'),
(485, 'crypto', 'BINANCE:HCBTC', 'HC/BTC', 'HCBTC'),
(487, 'crypto', 'BINANCE:HCETH', 'HC/ETH', 'HCETH'),
(489, 'crypto', 'BINANCE:GOBTC', 'GO/BTC', 'GOBTC'),
(491, 'crypto', 'BINANCE:GOBNB', 'GO/BNB', 'GOBNB'),
(493, 'crypto', 'BINANCE:PAXBTC', 'PAX/BTC', 'PAXBTC'),
(495, 'crypto', 'BINANCE:PAXBNB', 'PAX/BNB', 'PAXBNB'),
(497, 'crypto', 'BINANCE:PAXUSDT', 'PAX/USDT', 'PAXUSDT'),
(499, 'crypto', 'BINANCE:PAXETH', 'PAX/ETH', 'PAXETH'),
(501, 'crypto', 'BINANCE:RVNBTC', 'RVN/BTC', 'RVNBTC'),
(503, 'crypto', 'BINANCE:RVNBNB', 'RVN/BNB', 'RVNBNB'),
(505, 'crypto', 'BINANCE:DCRBTC', 'DCR/BTC', 'DCRBTC'),
(507, 'crypto', 'BINANCE:DCRBNB', 'DCR/BNB', 'DCRBNB'),
(509, 'crypto', 'BINANCE:USDCBNB', 'USDC/BNB', 'USDCBNB'),
(511, 'crypto', 'BINANCE:MITHBTC', 'MITH/BTC', 'MITHBTC'),
(513, 'crypto', 'BINANCE:MITHBNB', 'MITH/BNB', 'MITHBNB'),
(515, 'crypto', 'BINANCE:BCHABCBTC', 'BCHABC/BTC', 'BCHABCBTC'),
(517, 'crypto', 'BINANCE:BCHSVBTC', 'BCHSV/BTC', 'BCHSVBTC'),
(519, 'crypto', 'BINANCE:BCHABCUSDT', 'BCHABC/USDT', 'BCHABCUSDT'),
(521, 'crypto', 'BINANCE:BCHSVUSDT', 'BCHSV/USDT', 'BCHSVUSDT'),
(523, 'crypto', 'BINANCE:BNBPAX', 'BNB/PAX', 'BNBPAX'),
(525, 'crypto', 'BINANCE:BTCPAX', 'BTC/PAX', 'BTCPAX'),
(527, 'crypto', 'BINANCE:ETHPAX', 'ETH/PAX', 'ETHPAX'),
(529, 'crypto', 'BINANCE:XRPPAX', 'XRP/PAX', 'XRPPAX'),
(531, 'crypto', 'BINANCE:EOSPAX', 'EOS/PAX', 'EOSPAX'),
(533, 'crypto', 'BINANCE:XLMPAX', 'XLM/PAX', 'XLMPAX'),
(535, 'crypto', 'BINANCE:RENBTC', 'REN/BTC', 'RENBTC'),
(537, 'crypto', 'BINANCE:RENBNB', 'REN/BNB', 'RENBNB'),
(539, 'crypto', 'BINANCE:BNBTUSD', 'BNB/TUSD', 'BNBTUSD'),
(541, 'crypto', 'BINANCE:XRPTUSD', 'XRP/TUSD', 'XRPTUSD'),
(543, 'crypto', 'BINANCE:EOSTUSD', 'EOS/TUSD', 'EOSTUSD'),
(545, 'crypto', 'BINANCE:XLMTUSD', 'XLM/TUSD', 'XLMTUSD'),
(547, 'crypto', 'BINANCE:BNBUSDC', 'BNB/USDC', 'BNBUSDC'),
(549, 'crypto', 'BINANCE:BTCUSDC', 'BTC/USDC', 'BTCUSDC'),
(551, 'crypto', 'BINANCE:ETHUSDC', 'ETH/USDC', 'ETHUSDC'),
(553, 'crypto', 'BINANCE:XRPUSDC', 'XRP/USDC', 'XRPUSDC'),
(555, 'crypto', 'BINANCE:EOSUSDC', 'EOS/USDC', 'EOSUSDC'),
(557, 'crypto', 'BINANCE:XLMUSDC', 'XLM/USDC', 'XLMUSDC'),
(559, 'crypto', 'BINANCE:USDCUSDT', 'USDC/USDT', 'USDCUSDT'),
(561, 'crypto', 'BINANCE:ADATUSD', 'ADA/TUSD', 'ADATUSD'),
(563, 'crypto', 'BINANCE:TRXTUSD', 'TRX/TUSD', 'TRXTUSD'),
(565, 'crypto', 'BINANCE:NEOTUSD', 'NEO/TUSD', 'NEOTUSD'),
(567, 'crypto', 'BINANCE:TRXXRP', 'TRX/XRP', 'TRXXRP'),
(569, 'crypto', 'BINANCE:XZCXRP', 'XZC/XRP', 'XZCXRP'),
(571, 'crypto', 'BINANCE:PAXTUSD', 'PAX/TUSD', 'PAXTUSD'),
(573, 'crypto', 'BINANCE:USDCTUSD', 'USDC/TUSD', 'USDCTUSD'),
(575, 'crypto', 'BINANCE:USDCPAX', 'USDC/PAX', 'USDCPAX'),
(577, 'crypto', 'BINANCE:LINKUSDT', 'LINK/USDT', 'LINKUSDT'),
(579, 'crypto', 'BINANCE:LINKTUSD', 'LINK/TUSD', 'LINKTUSD'),
(581, 'crypto', 'BINANCE:LINKPAX', 'LINK/PAX', 'LINKPAX'),
(583, 'crypto', 'BINANCE:LINKUSDC', 'LINK/USDC', 'LINKUSDC'),
(585, 'crypto', 'BINANCE:WAVESUSDT', 'WAVES/USDT', 'WAVESUSDT'),
(587, 'crypto', 'BINANCE:WAVESTUSD', 'WAVES/TUSD', 'WAVESTUSD'),
(589, 'crypto', 'BINANCE:WAVESPAX', 'WAVES/PAX', 'WAVESPAX'),
(591, 'crypto', 'BINANCE:WAVESUSDC', 'WAVES/USDC', 'WAVESUSDC'),
(593, 'crypto', 'BINANCE:BCHABCTUSD', 'BCHABC/TUSD', 'BCHABCTUSD'),
(595, 'crypto', 'BINANCE:BCHABCPAX', 'BCHABC/PAX', 'BCHABCPAX'),
(597, 'crypto', 'BINANCE:BCHABCUSDC', 'BCHABC/USDC', 'BCHABCUSDC'),
(599, 'crypto', 'BINANCE:BCHSVTUSD', 'BCHSV/TUSD', 'BCHSVTUSD'),
(601, 'crypto', 'BINANCE:BCHSVPAX', 'BCHSV/PAX', 'BCHSVPAX'),
(603, 'crypto', 'BINANCE:BCHSVUSDC', 'BCHSV/USDC', 'BCHSVUSDC'),
(605, 'crypto', 'BINANCE:LTCTUSD', 'LTC/TUSD', 'LTCTUSD'),
(607, 'crypto', 'BINANCE:LTCPAX', 'LTC/PAX', 'LTCPAX'),
(609, 'crypto', 'BINANCE:LTCUSDC', 'LTC/USDC', 'LTCUSDC'),
(611, 'crypto', 'BINANCE:TRXPAX', 'TRX/PAX', 'TRXPAX'),
(613, 'crypto', 'BINANCE:TRXUSDC', 'TRX/USDC', 'TRXUSDC'),
(615, 'crypto', 'BINANCE:BTTBTC', 'BTT/BTC', 'BTTBTC'),
(617, 'crypto', 'BINANCE:BTTBNB', 'BTT/BNB', 'BTTBNB'),
(619, 'crypto', 'BINANCE:BTTUSDT', 'BTT/USDT', 'BTTUSDT'),
(621, 'crypto', 'BINANCE:BNBUSDS', 'BNB/USDS', 'BNBUSDS'),
(623, 'crypto', 'BINANCE:BTCUSDS', 'BTC/USDS', 'BTCUSDS'),
(625, 'crypto', 'BINANCE:USDSUSDT', 'USDS/USDT', 'USDSUSDT'),
(627, 'crypto', 'BINANCE:USDSPAX', 'USDS/PAX', 'USDSPAX'),
(629, 'crypto', 'BINANCE:USDSTUSD', 'USDS/TUSD', 'USDSTUSD'),
(631, 'crypto', 'BINANCE:USDSUSDC', 'USDS/USDC', 'USDSUSDC'),
(633, 'crypto', 'BINANCE:BTTPAX', 'BTT/PAX', 'BTTPAX'),
(635, 'crypto', 'BINANCE:BTTTUSD', 'BTT/TUSD', 'BTTTUSD'),
(637, 'crypto', 'BINANCE:BTTUSDC', 'BTT/USDC', 'BTTUSDC'),
(639, 'crypto', 'BINANCE:ONGBNB', 'ONG/BNB', 'ONGBNB'),
(641, 'crypto', 'BINANCE:ONGBTC', 'ONG/BTC', 'ONGBTC'),
(643, 'crypto', 'BINANCE:ONGUSDT', 'ONG/USDT', 'ONGUSDT'),
(645, 'crypto', 'BINANCE:HOTBNB', 'HOT/BNB', 'HOTBNB'),
(647, 'crypto', 'BINANCE:HOTUSDT', 'HOT/USDT', 'HOTUSDT'),
(649, 'crypto', 'BINANCE:ZILUSDT', 'ZIL/USDT', 'ZILUSDT'),
(651, 'crypto', 'BINANCE:ZRXBNB', 'ZRX/BNB', 'ZRXBNB'),
(653, 'crypto', 'BINANCE:ZRXUSDT', 'ZRX/USDT', 'ZRXUSDT'),
(655, 'crypto', 'BINANCE:FETBNB', 'FET/BNB', 'FETBNB'),
(657, 'crypto', 'BINANCE:FETBTC', 'FET/BTC', 'FETBTC'),
(659, 'crypto', 'BINANCE:FETUSDT', 'FET/USDT', 'FETUSDT'),
(661, 'crypto', 'BINANCE:BATUSDT', 'BAT/USDT', 'BATUSDT'),
(663, 'crypto', 'BINANCE:XMRBNB', 'XMR/BNB', 'XMRBNB'),
(665, 'crypto', 'BINANCE:XMRUSDT', 'XMR/USDT', 'XMRUSDT'),
(667, 'crypto', 'BINANCE:ZECBNB', 'ZEC/BNB', 'ZECBNB'),
(669, 'crypto', 'BINANCE:ZECUSDT', 'ZEC/USDT', 'ZECUSDT'),
(671, 'crypto', 'BINANCE:ZECPAX', 'ZEC/PAX', 'ZECPAX'),
(673, 'crypto', 'BINANCE:ZECTUSD', 'ZEC/TUSD', 'ZECTUSD'),
(675, 'crypto', 'BINANCE:ZECUSDC', 'ZEC/USDC', 'ZECUSDC'),
(677, 'crypto', 'BINANCE:IOSTBNB', 'IOST/BNB', 'IOSTBNB'),
(679, 'crypto', 'BINANCE:IOSTUSDT', 'IOST/USDT', 'IOSTUSDT'),
(681, 'crypto', 'BINANCE:CELRBNB', 'CELR/BNB', 'CELRBNB'),
(683, 'crypto', 'BINANCE:CELRBTC', 'CELR/BTC', 'CELRBTC'),
(685, 'crypto', 'BINANCE:CELRUSDT', 'CELR/USDT', 'CELRUSDT'),
(687, 'crypto', 'BINANCE:ADAPAX', 'ADA/PAX', 'ADAPAX'),
(689, 'crypto', 'BINANCE:ADAUSDC', 'ADA/USDC', 'ADAUSDC'),
(691, 'crypto', 'BINANCE:NEOPAX', 'NEO/PAX', 'NEOPAX'),
(693, 'crypto', 'BINANCE:NEOUSDC', 'NEO/USDC', 'NEOUSDC'),
(695, 'crypto', 'BINANCE:DASHBNB', 'DASH/BNB', 'DASHBNB'),
(697, 'crypto', 'BINANCE:DASHUSDT', 'DASH/USDT', 'DASHUSDT'),
(699, 'crypto', 'BINANCE:NANOUSDT', 'NANO/USDT', 'NANOUSDT'),
(701, 'crypto', 'BINANCE:OMGBNB', 'OMG/BNB', 'OMGBNB'),
(704, 'crypto', 'BINANCE:OMGUSDT', 'OMG/USDT', 'OMGUSDT'),
(707, 'crypto', 'BINANCE:THETAUSDT', 'THETA/USDT', 'THETAUSDT'),
(710, 'crypto', 'BINANCE:ENJUSDT', 'ENJ/USDT', 'ENJUSDT'),
(714, 'crypto', 'BINANCE:MITHUSDT', 'MITH/USDT', 'MITHUSDT'),
(717, 'crypto', 'BINANCE:MATICBNB', 'MATIC/BNB', 'MATICBNB'),
(720, 'crypto', 'BINANCE:MATICBTC', 'MATIC/BTC', 'MATICBTC'),
(723, 'crypto', 'BINANCE:MATICUSDT', 'MATIC/USDT', 'MATICUSDT'),
(725, 'crypto', 'BINANCE:ATOMBNB', 'ATOM/BNB', 'ATOMBNB'),
(729, 'crypto', 'BINANCE:ATOMBTC', 'ATOM/BTC', 'ATOMBTC'),
(732, 'crypto', 'BINANCE:ATOMUSDT', 'ATOM/USDT', 'ATOMUSDT'),
(734, 'crypto', 'BINANCE:ATOMUSDC', 'ATOM/USDC', 'ATOMUSDC'),
(737, 'crypto', 'BINANCE:ATOMPAX', 'ATOM/PAX', 'ATOMPAX'),
(740, 'crypto', 'BINANCE:ATOMTUSD', 'ATOM/TUSD', 'ATOMTUSD'),
(743, 'crypto', 'BINANCE:ETCUSDC', 'ETC/USDC', 'ETCUSDC'),
(746, 'crypto', 'BINANCE:ETCPAX', 'ETC/PAX', 'ETCPAX'),
(750, 'crypto', 'BINANCE:ETCTUSD', 'ETC/TUSD', 'ETCTUSD'),
(753, 'crypto', 'BINANCE:BATUSDC', 'BAT/USDC', 'BATUSDC'),
(755, 'crypto', 'BINANCE:BATPAX', 'BAT/PAX', 'BATPAX'),
(758, 'crypto', 'BINANCE:BATTUSD', 'BAT/TUSD', 'BATTUSD'),
(761, 'crypto', 'BINANCE:PHBBNB', 'PHB/BNB', 'PHBBNB'),
(763, 'stock', 'AAPL', 'Apple', 'Consumer Goods'),
(764, 'stock', 'MSFT', 'Microsoft', 'Technology'),
(765, 'stock', 'AMZN', 'Amazon', 'Services'),
(766, 'stock', 'GOOGL', 'Alphabet', 'Technology'),
(767, 'stock', 'FB', 'Facebook', 'Technology'),
(770, 'stock', 'BABA', 'Alibaba', 'Services'),
(771, 'stock', 'JPM', 'JPMorgan Chase & Co.', 'Financial'),
(773, 'stock', 'V', 'Visa', 'Financial'),
(777, 'stock', 'SSNLF', 'Samsung Electronics', 'Consumer Goods'),
(780, 'stock', 'BAC', 'Bank of America', 'Financial'),
(781, 'stock', 'MA', 'Mastercard', 'Financial'),
(784, 'stock', 'T', 'AT&T', 'Technology'),
(790, 'stock', 'INTC', 'Intel', 'Consumer Goods'),
(792, 'stock', 'KO', 'Coca-Cola', 'Consumer Goods'),
(802, 'stock', 'TM', 'Toyota Motor', 'Consumer Goods'),
(803, 'forex', 'OANDA:XAU_GBP', 'XAU/GBP', 'Gold/GBP'),
(804, 'forex', 'OANDA:USD_DKK', 'USD/DKK', 'USD/DKK'),
(805, 'forex', 'OANDA:CHF_JPY', 'CHF/JPY', 'CHF/JPY'),
(806, 'forex', 'OANDA:EUR_SGD', 'EUR/SGD', 'EUR/SGD'),
(807, 'forex', 'OANDA:USD_SGD', 'USD/SGD', 'USD/SGD'),
(808, 'forex', 'OANDA:EUR_SEK', 'EUR/SEK', 'EUR/SEK'),
(809, 'forex', 'OANDA:USD_JPY', 'USD/JPY', 'USD/JPY'),
(810, 'forex', 'OANDA:EUR_TRY', 'EUR/TRY', 'EUR/TRY'),
(811, 'forex', 'OANDA:GBP_AUD', 'GBP/AUD', 'GBP/AUD'),
(812, 'forex', 'OANDA:USD_PLN', 'USD/PLN', 'USD/PLN'),
(813, 'forex', 'OANDA:USD_INR', 'USD/INR', 'USD/INR'),
(814, 'forex', 'OANDA:EUR_NZD', 'EUR/NZD', 'EUR/NZD'),
(815, 'forex', 'OANDA:CHF_HKD', 'CHF/HKD', 'CHF/HKD'),
(816, 'forex', 'OANDA:USD_THB', 'USD/THB', 'USD/THB'),
(817, 'forex', 'OANDA:GBP_CHF', 'GBP/CHF', 'GBP/CHF'),
(818, 'forex', 'OANDA:TRY_JPY', 'TRY/JPY', 'TRY/JPY'),
(819, 'forex', 'OANDA:AUD_CHF', 'AUD/CHF', 'AUD/CHF'),
(820, 'forex', 'OANDA:DE10YB_EUR', 'DEYB/EUR', 'Bund'),
(821, 'forex', 'OANDA:WTICO_USD', 'WTICO/USD', 'West Texas Oil'),
(822, 'forex', 'OANDA:CN50_USD', 'CN/USD', 'China A50'),
(823, 'forex', 'OANDA:SGD_JPY', 'SGD/JPY', 'SGD/JPY'),
(824, 'forex', 'OANDA:AUD_CAD', 'AUD/CAD', 'AUD/CAD'),
(825, 'forex', 'OANDA:XAU_NZD', 'XAU/NZD', 'Gold/NZD'),
(826, 'forex', 'OANDA:XAU_XAG', 'XAU/XAG', 'Gold/Silver'),
(827, 'forex', 'OANDA:NL25_EUR', 'NL/EUR', 'Netherlands 25'),
(828, 'forex', 'OANDA:AUD_USD', 'AUD/USD', 'AUD/USD'),
(829, 'forex', 'OANDA:XAU_USD', 'XAU/USD', 'Gold'),
(830, 'forex', 'OANDA:CORN_USD', 'CORN/USD', 'Corn'),
(831, 'forex', 'OANDA:USD_SAR', 'USD/SAR', 'USD/SAR'),
(832, 'forex', 'OANDA:GBP_CAD', 'GBP/CAD', 'GBP/CAD'),
(833, 'forex', 'OANDA:CAD_JPY', 'CAD/JPY', 'CAD/JPY'),
(834, 'forex', 'OANDA:SPX500_USD', 'SPX/USD', 'US SPX 500'),
(835, 'forex', 'OANDA:NZD_JPY', 'NZD/JPY', 'NZD/JPY'),
(836, 'forex', 'OANDA:AUD_NZD', 'AUD/NZD', 'AUD/NZD'),
(837, 'forex', 'OANDA:SGD_HKD', 'SGD/HKD', 'SGD/HKD'),
(838, 'forex', 'OANDA:EUR_HUF', 'EUR/HUF', 'EUR/HUF'),
(839, 'forex', 'OANDA:XAU_CAD', 'XAU/CAD', 'Gold/CAD'),
(840, 'forex', 'OANDA:USD_CNH', 'USD/CNH', 'USD/CNH'),
(841, 'forex', 'OANDA:XAG_HKD', 'XAG/HKD', 'Silver/HKD'),
(842, 'forex', 'OANDA:JP225_USD', 'JP/USD', 'Japan 225'),
(843, 'forex', 'OANDA:XAG_AUD', 'XAG/AUD', 'Silver/AUD'),
(844, 'forex', 'OANDA:BCO_USD', 'BCO/USD', 'Brent Crude Oil'),
(845, 'forex', 'OANDA:EUR_PLN', 'EUR/PLN', 'EUR/PLN'),
(846, 'forex', 'OANDA:EUR_ZAR', 'EUR/ZAR', 'EUR/ZAR'),
(847, 'forex', 'OANDA:NAS100_USD', 'NAS/USD', 'US Nas 100'),
(848, 'forex', 'OANDA:XAU_EUR', 'XAU/EUR', 'Gold/EUR'),
(849, 'forex', 'OANDA:UK100_GBP', 'UK/GBP', 'UK 100'),
(850, 'forex', 'OANDA:XAU_CHF', 'XAU/CHF', 'Gold/CHF'),
(851, 'forex', 'OANDA:NZD_HKD', 'NZD/HKD', 'NZD/HKD'),
(852, 'forex', 'OANDA:NZD_CHF', 'NZD/CHF', 'NZD/CHF'),
(853, 'forex', 'OANDA:XAU_JPY', 'XAU/JPY', 'Gold/JPY'),
(854, 'forex', 'OANDA:EUR_JPY', 'EUR/JPY', 'EUR/JPY'),
(855, 'forex', 'OANDA:WHEAT_USD', 'WHEAT/USD', 'Wheat'),
(856, 'forex', 'OANDA:GBP_PLN', 'GBP/PLN', 'GBP/PLN'),
(857, 'forex', 'OANDA:XAU_AUD', 'XAU/AUD', 'Gold/AUD'),
(858, 'forex', 'OANDA:GBP_HKD', 'GBP/HKD', 'GBP/HKD'),
(859, 'forex', 'OANDA:GBP_SGD', 'GBP/SGD', 'GBP/SGD'),
(860, 'forex', 'OANDA:USD_SEK', 'USD/SEK', 'USD/SEK'),
(861, 'forex', 'OANDA:XAU_HKD', 'XAU/HKD', 'Gold/HKD'),
(862, 'forex', 'OANDA:EUR_GBP', 'EUR/GBP', 'EUR/GBP'),
(863, 'forex', 'OANDA:XPD_USD', 'XPD/USD', 'Palladium'),
(864, 'forex', 'OANDA:TWIX_USD', 'TWIX/USD', 'Taiwan Index'),
(865, 'forex', 'OANDA:US30_USD', 'US/USD', 'US Wall St 30'),
(866, 'forex', 'OANDA:USB05Y_USD', 'USBY/USD', 'US 5Y T-Note'),
(867, 'forex', 'OANDA:USD_ZAR', 'USD/ZAR', 'USD/ZAR'),
(868, 'forex', 'OANDA:NATGAS_USD', 'NATGAS/USD', 'Natural Gas'),
(869, 'forex', 'OANDA:US2000_USD', 'US/USD', 'US Russ 2000'),
(870, 'forex', 'OANDA:NZD_CAD', 'NZD/CAD', 'NZD/CAD'),
(871, 'forex', 'OANDA:NZD_USD', 'NZD/USD', 'NZD/USD'),
(872, 'forex', 'OANDA:SUGAR_USD', 'SUGAR/USD', 'Sugar'),
(873, 'forex', 'OANDA:SG30_SGD', 'SG/SGD', 'Singapore 30'),
(874, 'forex', 'OANDA:EUR_HKD', 'EUR/HKD', 'EUR/HKD'),
(875, 'forex', 'OANDA:EUR_CHF', 'EUR/CHF', 'EUR/CHF'),
(876, 'forex', 'OANDA:AU200_AUD', 'AU/AUD', 'Australia 200'),
(877, 'forex', 'OANDA:USB02Y_USD', 'USBY/USD', 'US 2Y T-Note'),
(878, 'forex', 'OANDA:EUR_NOK', 'EUR/NOK', 'EUR/NOK'),
(879, 'forex', 'OANDA:AUD_SGD', 'AUD/SGD', 'AUD/SGD'),
(880, 'forex', 'OANDA:USD_CHF', 'USD/CHF', 'USD/CHF'),
(881, 'forex', 'OANDA:USB30Y_USD', 'USBY/USD', 'US T-Bond'),
(882, 'forex', 'OANDA:CAD_CHF', 'CAD/CHF', 'CAD/CHF'),
(883, 'forex', 'OANDA:SGD_CHF', 'SGD/CHF', 'SGD/CHF'),
(884, 'forex', 'OANDA:GBP_USD', 'GBP/USD', 'GBP/USD'),
(885, 'forex', 'OANDA:USD_MXN', 'USD/MXN', 'USD/MXN'),
(886, 'forex', 'OANDA:XAG_CAD', 'XAG/CAD', 'Silver/CAD'),
(887, 'forex', 'OANDA:CAD_HKD', 'CAD/HKD', 'CAD/HKD'),
(888, 'forex', 'OANDA:GBP_JPY', 'GBP/JPY', 'GBP/JPY'),
(889, 'forex', 'OANDA:USD_TRY', 'USD/TRY', 'USD/TRY'),
(890, 'forex', 'OANDA:EUR_CAD', 'EUR/CAD', 'EUR/CAD'),
(891, 'forex', 'OANDA:HK33_HKD', 'HK/HKD', 'Hong Kong 33'),
(892, 'forex', 'OANDA:IN50_USD', 'IN/USD', 'India 50'),
(893, 'forex', 'OANDA:XAU_SGD', 'XAU/SGD', 'Gold/SGD'),
(894, 'forex', 'OANDA:XAG_SGD', 'XAG/SGD', 'Silver/SGD'),
(895, 'forex', 'OANDA:EUR_USD', 'EUR/USD', 'EUR/USD'),
(896, 'forex', 'OANDA:USD_HKD', 'USD/HKD', 'USD/HKD'),
(897, 'forex', 'OANDA:USD_CZK', 'USD/CZK', 'USD/CZK'),
(898, 'forex', 'OANDA:XAG_EUR', 'XAG/EUR', 'Silver/EUR'),
(899, 'forex', 'OANDA:UK10YB_GBP', 'UKYB/GBP', 'UK 10Y Gilt'),
(900, 'forex', 'OANDA:SOYBN_USD', 'SOYBN/USD', 'Soybeans'),
(901, 'forex', 'OANDA:GBP_ZAR', 'GBP/ZAR', 'GBP/ZAR'),
(902, 'forex', 'OANDA:NZD_SGD', 'NZD/SGD', 'NZD/SGD'),
(903, 'forex', 'OANDA:XPT_USD', 'XPT/USD', 'Platinum'),
(904, 'forex', 'OANDA:XAG_CHF', 'XAG/CHF', 'Silver/CHF'),
(905, 'forex', 'OANDA:EU50_EUR', 'EU/EUR', 'Europe 50'),
(906, 'forex', 'OANDA:USB10Y_USD', 'USBY/USD', 'US 10Y T-Note'),
(907, 'forex', 'OANDA:ZAR_JPY', 'ZAR/JPY', 'ZAR/JPY'),
(908, 'forex', 'OANDA:EUR_AUD', 'EUR/AUD', 'EUR/AUD'),
(909, 'forex', 'OANDA:XAG_JPY', 'XAG/JPY', 'Silver/JPY'),
(910, 'forex', 'OANDA:XAG_USD', 'XAG/USD', 'Silver'),
(911, 'forex', 'OANDA:CHF_ZAR', 'CHF/ZAR', 'CHF/ZAR'),
(912, 'forex', 'OANDA:EUR_CZK', 'EUR/CZK', 'EUR/CZK'),
(913, 'forex', 'OANDA:AUD_HKD', 'AUD/HKD', 'AUD/HKD'),
(914, 'forex', 'OANDA:USD_HUF', 'USD/HUF', 'USD/HUF'),
(915, 'forex', 'OANDA:FR40_EUR', 'FR/EUR', 'France 40'),
(916, 'forex', 'OANDA:HKD_JPY', 'HKD/JPY', 'HKD/JPY'),
(917, 'forex', 'OANDA:CAD_SGD', 'CAD/SGD', 'CAD/SGD'),
(918, 'forex', 'OANDA:GBP_NZD', 'GBP/NZD', 'GBP/NZD'),
(919, 'forex', 'OANDA:USD_NOK', 'USD/NOK', 'USD/NOK'),
(920, 'forex', 'OANDA:DE30_EUR', 'DE/EUR', 'Germany 30'),
(921, 'forex', 'OANDA:XCU_USD', 'XCU/USD', 'Copper'),
(922, 'forex', 'OANDA:EUR_DKK', 'EUR/DKK', 'EUR/DKK'),
(923, 'forex', 'OANDA:AUD_JPY', 'AUD/JPY', 'AUD/JPY'),
(924, 'forex', 'OANDA:XAG_NZD', 'XAG/NZD', 'Silver/NZD'),
(925, 'forex', 'OANDA:USD_CAD', 'USD/CAD', 'USD/CAD'),
(926, 'forex', 'OANDA:XAG_GBP', 'XAG/GBP', 'Silver/GBP');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `balanceType` enum('real','practice') DEFAULT NULL,
  `tradeType` enum('buy','sell') DEFAULT NULL,
  `price` float DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `tradeAt` int(11) DEFAULT NULL,
  `status` enum('pending','done') DEFAULT NULL,
  `bet` float DEFAULT NULL,
  `profit` float DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `market_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `balanceType`, `tradeType`, `price`, `point`, `tradeAt`, `status`, `bet`, `profit`, `amount`, `time`, `user_id`, `market_id`) VALUES
(1, 'practice', 'buy', 0.019271, 1579301515, 1579301575, 'done', 1, 50, 0.5, '2020-01-18 02:21:54', 1, 1),
(2, 'practice', 'buy', 0.019262, 1579301743, 1579301803, 'done', 1, 50, 0, '2020-01-18 02:25:43', 1, 1),
(3, 'practice', 'buy', 0.019254, 1579301823, 1579301883, 'done', 1, 50, 0, '2020-01-18 02:27:02', 1, 1),
(4, 'practice', 'buy', 0.019257, 1579301871, 1579301931, 'done', 1, 50, 0, '2020-01-18 02:27:51', 1, 1),
(5, 'practice', 'buy', 0.019246, 1579301906, 1579301966, 'done', 1, 50, 0, '2020-01-18 02:28:25', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `key`, `value`) VALUES
(1, 'tradePriceMax', '5000'),
(2, 'tradeTimeMax', '30'),
(3, 'chartType', 'candle'),
(4, 'reolution', '1m'),
(5, 'maxData', '200'),
(6, 'balanceType', 'real'),
(7, 'tradePercent', '0'),
(9, 'profit', '50'),
(10, 'defaultMarket', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`) VALUES
(1, 'bmlk6r7rh5rb2pv98jqg'),
(2, 'bmqbr8nrh5rdski293og'),
(3, 'bn705kfrh5r9nv5grc3g'),
(4, 'bns3hkvrh5rfc44sf94g'),
(5, 'bns3ibfrh5rfc44sf9ag'),
(6, 'bns3is7rh5rfc44sf9f0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `realBalance` float DEFAULT NULL,
  `practiceBalance` float DEFAULT NULL,
  `joinedAt` datetime DEFAULT NULL,
  `lastSeen` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `mobile`, `realBalance`, `practiceBalance`, `joinedAt`, `lastSeen`, `status`, `token`) VALUES
(1, 'siavasham', 'a2550eeab0724a691192ca13982e6ebd', 'sayeh.2010@ymail.com', '+98 935 063 434 3', 150, 10000, '2020-02-15 01:09:20', '2020-02-15 01:09:20', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTgxNzE2MzYwfQ.U02YAgdbzNPfkY8QUxhxYcPMn3YHTUyNhnXpI67oFcU');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `view` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `title`, `image`, `link`, `view`) VALUES
(2, 'test mikonim', 'http://localhost/a.jpg', 'http://localhost/a.mp4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `amount`, `description`, `time`, `user_id`) VALUES
(2, 0, 'bitcoin', '2020-02-14 03:22:38', 1),
(3, 0, 'bitcoin', '2020-02-14 03:24:44', 1),
(4, 0, 'bitcoin', '2020-02-14 03:25:15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_unique` (`key`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_unique` (`token`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=927;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
