-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2015 at 05:56 PM
-- Server version: 5.6.20-enterprise-commercial-advanced
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dklf`
--

-- --------------------------------------------------------

--
-- Table structure for table `cash_transaction`
--

CREATE TABLE IF NOT EXISTS `cash_transaction` (
  `FIN_BOOK_ID` varchar(45) NOT NULL,
  `TRANSACTION_ID` varchar(45) NOT NULL,
  `TRANSACTION_SEQ_NO` int(11) NOT NULL,
  `LEDGER_ID` varchar(45) NOT NULL,
  `LEDGER_NAME` varchar(45) NOT NULL,
  `AMOUNT` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FIN_BOOK_ID`,`TRANSACTION_ID`,`TRANSACTION_SEQ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city_group`
--

CREATE TABLE IF NOT EXISTS `city_group` (
  `city_group_id` varchar(10) NOT NULL DEFAULT '',
  `COMPANY_ID` int(11) NOT NULL,
  `city_group_name` varchar(20) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`city_group_id`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city_group`
--

INSERT INTO `city_group` (`city_group_id`, `COMPANY_ID`, `city_group_name`, `created_date`, `modified_date`) VALUES
('CG1', 1000001, 'OLD MARKET', '2014-12-07', NULL),
('CG3', 1000001, 'ELURU', '2014-12-07', NULL),
('CG4', 1000001, 'LANKA', '2014-12-07', NULL),
('CG5', 1000001, 'NEW MARKET 1', '2014-12-07', NULL),
('CG6', 1000001, 'ELURU', '2015-01-10', NULL),
('CG7', 1000002, 'CHINTALAPUDY', '2015-02-28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `COMPANY_ID` int(11) NOT NULL,
  `COMPANY_NAME` varchar(45) DEFAULT NULL,
  `COMPANY_STREET_NAME` varchar(45) DEFAULT NULL,
  `COMPANY_CITY` varchar(45) DEFAULT NULL,
  `COMPANY_STATE` varchar(45) DEFAULT NULL,
  `COMPANY_PIN` varchar(45) DEFAULT NULL,
  `COMPANY_TIN` varchar(45) DEFAULT NULL,
  `COMPANY_PHONE` varchar(45) DEFAULT NULL,
  `COMPANY_EMAIL` varchar(45) DEFAULT NULL,
  `COMPANY_SLIPS_IND` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`COMPANY_ID`, `COMPANY_NAME`, `COMPANY_STREET_NAME`, `COMPANY_CITY`, `COMPANY_STATE`, `COMPANY_PIN`, `COMPANY_TIN`, `COMPANY_PHONE`, `COMPANY_EMAIL`, `COMPANY_SLIPS_IND`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1000001, 'DKL Firms', 'Tuta Street', 'Eluru', 'A.P', '5340012', '123456', '9030736209', 'dns.ramchand@gamil.com', 'No', '2014-12-21', '2015-01-11'),
(1000002, 'PavanSai Firm', 'Tuta Street', 'HYDERABAD', 'A.P', '500047', '123456', '9030736209', 'saipavan.jhnr@gmail.com', 'Yes', '2014-12-21', '2014-12-21'),
(1000004, 'tcs', 'house no-2-85/9/1,PJR Nagar', 'Hyderabad', 'TLS', '500032', '112232', '09642013773', 'sujitmajumdar42@gmail.com', 'Yes', '2015-03-16', '2015-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `fin_book`
--

CREATE TABLE IF NOT EXISTS `fin_book` (
  `fib_id` varchar(10) NOT NULL DEFAULT '',
  `company_id` int(10) NOT NULL DEFAULT '0',
  `fib_financial_yr` varchar(10) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`fib_id`,`company_id`),
  KEY `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fin_book`
--

INSERT INTO `fin_book` (`fib_id`, `company_id`, `fib_financial_yr`, `created_date`, `modified_date`) VALUES
('FY2012-13', 1000001, '2012-2013', '2015-01-21 13:42:30', '2015-01-21 13:42:30'),
('FY2012-13', 1000002, '2012-2013', '2015-02-28 12:10:11', '2015-02-28 12:10:11'),
('FY2013-14', 1000001, '2013-2014', '2014-11-09 01:13:51', '2014-11-09 01:13:51'),
('FY2013-14', 1000002, '2013-2014', '2015-02-28 12:10:33', '2015-02-28 12:10:33'),
('FY2014-15', 1000001, '2014-2015', '2015-02-28 12:10:56', '2015-02-28 12:10:56'),
('FY2014-15', 1000002, '2014-2015', '2015-02-28 12:10:51', '2015-02-28 12:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `firm`
--

CREATE TABLE IF NOT EXISTS `firm` (
  `firm_id` varchar(10) NOT NULL,
  `firm_name` varchar(20) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`firm_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `firm`
--

INSERT INTO `firm` (`firm_id`, `firm_name`, `created_date`, `modified_date`, `company_id`) VALUES
('1001', 'DVR', '2015-02-23', '2015-02-23', 1000001),
('1002', 'SJR', '2015-02-23', '2015-02-23', 1000001),
('1003', 'ABC', '2015-03-16', '2015-03-16', 1000004),
('1004', 'xyz', '2015-03-16', '2015-03-16', 1000004),
('1005', 'lmn', NULL, NULL, 1000004);

-- --------------------------------------------------------

--
-- Table structure for table `item_group`
--

CREATE TABLE IF NOT EXISTS `item_group` (
  `item_group_id` int(10) NOT NULL DEFAULT '0',
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_NAME` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_CRT_DATE` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_group`
--

INSERT INTO `item_group` (`item_group_id`, `COMPANY_ID`, `ITEM_GROUP_NAME`, `ITEM_GROUP_CRT_DATE`, `ITEM_GROUP_MOD_DATE`) VALUES
(10001, '100001', 'Jaggery', '2014-11-02 23:33:12', '2014-11-02 23:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `item_ledger`
--

CREATE TABLE IF NOT EXISTS `item_ledger` (
  `ITEM_LEDGER_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `ITEM_ID` varchar(45) NOT NULL DEFAULT '',
  `ITEM_NAME` varchar(45) DEFAULT NULL,
  `ITEM_LEDGER_NAME` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_NAME` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`,`COMPANY_ID`,`ITEM_LEDGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE IF NOT EXISTS `item_master` (
  `ITEM_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `ITEM_NAME` varchar(45) NOT NULL DEFAULT '',
  `ITEM_UNIT_ID` varchar(45) DEFAULT NULL,
  `ITEM_UNIT_NAME` varchar(45) DEFAULT NULL,
  `ITEM_NO_OF_KGS` double NOT NULL,
  `ITEM_VAT` varchar(45) DEFAULT NULL,
  `ITEM_SALES_TAX_EX` varchar(45) DEFAULT NULL,
  `ITEM_TOWN_COOLIE` double NOT NULL,
  `ITEM_OOT_COOLIE` double NOT NULL,
  `ITEM_EETA_COOLIE` double NOT NULL,
  `ITEM_UNLOAD_COOLIE` double NOT NULL,
  `ITEM_PRICE_PER` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`,`COMPANY_ID`,`ITEM_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock_point`
--

CREATE TABLE IF NOT EXISTS `item_stock_point` (
  `ITEM_STOCK_POINT_ID` varchar(45) NOT NULL,
  `FIB_ID` varchar(45) DEFAULT NULL,
  `ITEM_ID` varchar(45) DEFAULT NULL,
  `ITEM_BATCH_ID` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_ID` varchar(45) DEFAULT NULL,
  `STOCK_POINT_NAME` varchar(45) DEFAULT NULL,
  `STOCK_OPEN_QTY` varchar(45) DEFAULT NULL,
  `STOCK_PURCHASE_QTY` varchar(45) DEFAULT NULL,
  `STOCK_SALE_QTY` varchar(45) DEFAULT NULL,
  `STOCK_TRANSFER_IN` varchar(45) DEFAULT NULL,
  `STOCK_TRANSFER_OUT` varchar(45) DEFAULT NULL,
  `STOCK_ON_HAND` varchar(45) DEFAULT NULL,
  `STOCK_CRT_DATE` varchar(45) DEFAULT NULL,
  `STOCK_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ITEM_STOCK_POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock_register`
--

CREATE TABLE IF NOT EXISTS `item_stock_register` (
  `ITEM_STOCK_POINT_ID` varchar(45) NOT NULL,
  `FIB_ID` varchar(45) NOT NULL DEFAULT '',
  `ITEM_ID` varchar(45) NOT NULL DEFAULT '',
  `ITEM_NAME` varchar(45) DEFAULT NULL,
  `ITEM_BATCH_ID` varchar(45) NOT NULL DEFAULT '',
  `ITEM_BATCH_NAME` varchar(45) DEFAULT NULL,
  `STOCK_OPEN_QTY` double NOT NULL,
  `STOCK_PURCHASE_QTY` double NOT NULL,
  `STOCK_SALE_QTY` double NOT NULL,
  `STOCK_TRANSFER_IN` double NOT NULL,
  `STOCK_TRANSFER_OUT` double NOT NULL,
  `STOCK_ON_HAND` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FIB_ID`,`ITEM_ID`,`ITEM_BATCH_ID`,`ITEM_STOCK_POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_stock_register`
--

INSERT INTO `item_stock_register` (`ITEM_STOCK_POINT_ID`, `FIB_ID`, `ITEM_ID`, `ITEM_NAME`, `ITEM_BATCH_ID`, `ITEM_BATCH_NAME`, `STOCK_OPEN_QTY`, `STOCK_PURCHASE_QTY`, `STOCK_SALE_QTY`, `STOCK_TRANSFER_IN`, `STOCK_TRANSFER_OUT`, `STOCK_ON_HAND`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('FY2013-14', 'SP1', 'IT1', '10 KG Karipuli', 'IB1', '360/1030', 0, 10, 0, 0, 0, 10, '2015-01-11 20:04:13', '2015-01-11 20:04:13'),
('FY2013-14', 'SP1', 'IT2', '15 KG Flower', 'IB2', '1510/640', 0, 10, 0, 0, 0, 10, '2015-01-11 20:05:12', '2015-01-11 20:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `item_transaction`
--

CREATE TABLE IF NOT EXISTS `item_transaction` (
  `FIB_ID` varchar(45) NOT NULL,
  `ITEM_TRANSACTION_ID` varchar(45) NOT NULL,
  `ITEM_TRANS_SEQ_NO` int(11) NOT NULL,
  `ITEM_ID` varchar(45) NOT NULL,
  `ITEM_NAME` varchar(45) NOT NULL,
  `ITEM_BATCH_ID` varchar(45) NOT NULL,
  `ITEM_BATCH_NAME` varchar(45) NOT NULL,
  `ITEM_QTY` double NOT NULL,
  `ITEM_WEIGHT` double NOT NULL,
  `ITEM_WEIGHT_DIFF` double NOT NULL,
  `ITEM_PRICE_PER` double NOT NULL,
  `ITEM_PRICE_1` double NOT NULL,
  `ITEM_PRICE_2` double NOT NULL,
  `ITEM_AMOUNT_1` double NOT NULL,
  `ITEM_AMOUNT_2` double NOT NULL,
  `ITEM_TOTAL_AMOUNT` double NOT NULL,
  `FIRM_ID` varchar(45) NOT NULL,
  `FIRM_NAME` varchar(45) NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ITEM_TRANSACTION_ID`,`ITEM_TRANS_SEQ_NO`,`FIB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_transaction`
--

INSERT INTO `item_transaction` (`FIB_ID`, `ITEM_TRANSACTION_ID`, `ITEM_TRANS_SEQ_NO`, `ITEM_ID`, `ITEM_NAME`, `ITEM_BATCH_ID`, `ITEM_BATCH_NAME`, `ITEM_QTY`, `ITEM_WEIGHT`, `ITEM_WEIGHT_DIFF`, `ITEM_PRICE_PER`, `ITEM_PRICE_1`, `ITEM_PRICE_2`, `ITEM_AMOUNT_1`, `ITEM_AMOUNT_2`, `ITEM_TOTAL_AMOUNT`, `FIRM_ID`, `FIRM_NAME`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('FY2013-14', 'PUR1', 1, 'IT2', '10 KG Karipuli', 'IB4', '1040/1050', 100, 1000, 0, 10, 450, 400, 45000, 40000, 85000, '1', 'DVR', '2015-01-11 20:08:27', '2015-01-11 20:08:27'),
('FY2013-14', 'SAL1', 1, 'IT2', '10 KG Karipuli', 'IB4', '1040/1050', 10, 100, 0, 10, 0, 400, 0, 4000, 4000, '3', 'AN', '2015-01-11 20:09:57', '2015-01-11 20:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE IF NOT EXISTS `ledger` (
  `FIB_ID` varchar(45) NOT NULL DEFAULT '',
  `TRANS_ID` varchar(45) NOT NULL DEFAULT '',
  `TRANS_TYPE` varchar(45) NOT NULL DEFAULT '',
  `TRANS_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_ID` varchar(45) NOT NULL DEFAULT '',
  `LEDGER_SEQ_NO` int(11) NOT NULL DEFAULT '0',
  `LEDGER_NAME` varchar(45) DEFAULT NULL,
  `FIRM_ID` varchar(45) DEFAULT NULL,
  `FIRM_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_CR_DR` varchar(45) DEFAULT NULL,
  `LEDGER_AMOUNT` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FIB_ID`,`TRANS_ID`,`TRANS_TYPE`,`LEDGER_SEQ_NO`,`LEDGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledger`
--

INSERT INTO `ledger` (`FIB_ID`, `TRANS_ID`, `TRANS_TYPE`, `TRANS_DATE`, `LEDGER_ID`, `LEDGER_SEQ_NO`, `LEDGER_NAME`, `FIRM_ID`, `FIRM_NAME`, `LEDGER_CR_DR`, `LEDGER_AMOUNT`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('FY2013-14', 'PUR1', 'PURCHASE', '2015-01-11 19:59:44', 'IT1LG1', 1, '10KG Karipuli Purchase', '3', 'AN', 'Dr', 3500, '2015-01-11 19:59:44', '2015-01-11 19:59:44'),
('FY2013-14', 'PUR1', 'PURCHASE', '2015-01-10 13:22:14', 'PY7', 1, 'BASAVAPPA', '1', 'DVR', 'CR', 2000, '2015-01-10 13:22:14', '2015-01-10 13:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `ledger_account`
--

CREATE TABLE IF NOT EXISTS `ledger_account` (
  `LEDGER_ACC_ID` varchar(45) NOT NULL,
  `fib_id` varchar(10) NOT NULL DEFAULT '',
  `LEDGER_ACC_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_ID` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `firm_id` varchar(10) NOT NULL DEFAULT '',
  `FIRM_NAME` varchar(45) DEFAULT NULL,
  `city_group_id` varchar(10) DEFAULT NULL,
  `LEDGER_ACC_OPEN_BAL` double NOT NULL,
  `LEDGER_ACC_CREDIT` double NOT NULL,
  `LEDGER_ACC_DEBIT` double NOT NULL,
  `LEDGER_ACC_CLOSE_BAL` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_ACC_ID`,`fib_id`,`firm_id`),
  KEY `fk_led_acc_fin_book` (`fib_id`),
  KEY `fk_led_acc_firm` (`firm_id`),
  KEY `fk_led_acc_city_grp` (`city_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledger_account`
--

INSERT INTO `ledger_account` (`LEDGER_ACC_ID`, `fib_id`, `LEDGER_ACC_NAME`, `LEDGER_GRP_ID`, `LEDGER_GRP_NAME`, `LEDGER_GRP_TYPE`, `firm_id`, `FIRM_NAME`, `city_group_id`, `LEDGER_ACC_OPEN_BAL`, `LEDGER_ACC_CREDIT`, `LEDGER_ACC_DEBIT`, `LEDGER_ACC_CLOSE_BAL`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('IT1LG1', 'FY2013-14', '10 KG Karipuli Purchase', 'LG7', 'PURCHASE', 'EXPENSE', '1001', 'DVR', 'CG1', 0, 0, 40000, -40000, '25th March,2014', '25th March,2014'),
('IT1LG1', 'FY2013-14', '10 KG Karipuli Purchase', 'LG7', 'PURCHASE', 'EXPENSE', '1003', 'AN', 'CG1', 0, 0, 40000, -40000, '25th March,2014', '25th March,2014'),
('PY7', 'FY2013-14', 'BASAVAPPA', 'LG2', 'TRADE CREDITORS', 'LIABILITIES', '1001', 'DVR', 'CG1', 0, 2000, 4000, -2000, '27-OCT-2014', '27-OCT-2014'),
('PY7', 'FY2013-14', 'BASAVAPPA', 'LG2', 'TRADE CREDITORS', 'LIABILITIES', '1003', 'AN', 'CG1', 0, 45000, 45000, 0, '25th March,2014', '25th March,2014');

-- --------------------------------------------------------

--
-- Table structure for table `ledger_group`
--

CREATE TABLE IF NOT EXISTS `ledger_group` (
  `ledger_grp_id` varchar(10) NOT NULL DEFAULT '',
  `COMPANY_ID` int(11) NOT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ledger_grp_id`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ledger_group`
--

INSERT INTO `ledger_group` (`ledger_grp_id`, `COMPANY_ID`, `LEDGER_GRP_NAME`, `LEDGER_GRP_TYPE`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('LG1', 1000001, 'CLOSING STOCK', 'income', '2014-12-07', '2015-01-10 14:07:39'),
('LG10', 1000001, 'CAPITAL ACCOUNTS', 'income', '2014-12-07', '2015-01-10 14:07:50'),
('LG11', 1000001, 'TRADE CREDITORS', 'liabilities', '2014-12-07', '2014-12-07 14:06:13'),
('LG12', 1000002, 'Group1', 'liabilities', '2015-02-28', '2015-02-28'),
('LG2', 1000001, 'SALE', 'income', '2014-12-07', '2014-12-07'),
('LG3', 1000001, 'TRADE DEBTORS', 'assets', '2014-12-07', '2014-12-07'),
('LG4', 1000001, 'CASH ON HAND', 'assets', '2014-12-07', '2015-01-10 14:08:06'),
('LG5', 1000001, 'STOCK ON HAND', 'assets', '2014-12-07', '2014-12-07'),
('LG6', 1000001, 'OPENING STOCK', 'assets', '2014-12-07', '2014-12-07'),
('LG7', 1000001, 'PURCHASE', 'expenditure', '2014-12-07', '2014-12-07'),
('LG8', 1000001, 'PROFIT & LOSS', 'expenditure', '2014-12-07', '2014-12-07'),
('LG9', 1000001, 'EXPENSE', 'expenditure', '2014-12-07', '2014-12-07 14:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `ledger_item_batch`
--

CREATE TABLE IF NOT EXISTS `ledger_item_batch` (
  `LEDGER_ITEM_BATCH_ID` varchar(45) NOT NULL,
  `ITEM_ID` varchar(45) DEFAULT NULL,
  `LEDGER_ACC_ID` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_OPEN_BAL` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_CREDIT` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_DEBIT` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_CURR_BAL` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_ITEM_BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ledger_trans`
--

CREATE TABLE IF NOT EXISTS `ledger_trans` (
  `LEDGER_TRANS_ID` varchar(45) NOT NULL,
  `FIB_ID` varchar(45) DEFAULT NULL,
  `LEDGER_TRANS_SEQ_NO` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `LEDGER_ACC_ID` varchar(45) DEFAULT NULL,
  `LEDGER_ACC_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_TRANS_TYPE` varchar(45) DEFAULT NULL,
  `LEDGER_TRANS_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_TRANS_AMOUNT` varchar(45) DEFAULT NULL,
  `LEDGER_TRANS_CRT_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_TRANS_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_TRANS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `narration`
--

CREATE TABLE IF NOT EXISTS `narration` (
  `NARRATION_ID` varchar(30) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `NARRATION_DETAIL` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NARRATION_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE IF NOT EXISTS `party` (
  `PARTY_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `party_name` varchar(30) DEFAULT NULL,
  `PARTY_TYPE` varchar(45) DEFAULT NULL,
  `city_group_id` varchar(10) DEFAULT NULL,
  `ledger_grp_id` varchar(10) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PARTY_ID`,`COMPANY_ID`),
  KEY `fk_party` (`ledger_grp_id`),
  KEY `fk_party_city_group` (`city_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`PARTY_ID`, `COMPANY_ID`, `party_name`, `PARTY_TYPE`, `city_group_id`, `ledger_grp_id`, `street_name`, `city`, `phone`, `CREATED_DATE`, `MODIFIED_DATE`, `state`, `pincode`, `email`) VALUES
('PY1', 1000001, 'BASAVAPPA', 'Owner', 'CG6', 'LG4', 'Agraharam', 'Eluru', '09030736209', '2015-02-28', '2015-02-28', NULL, 0, NULL),
('PY2', 1000002, 'DVR', 'Person', 'CG7', 'LG12', 'Agraharam', 'Eluru', '09030736209', '2015-02-28', '2015-02-28', NULL, 0, NULL),
('PY4', 1000001, 'KRK', 'Person', 'CG1', 'LG11', 'Tuta Street', 'Eluru', '98484', '2015-02-28', '2015-02-28', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `remarks`
--

CREATE TABLE IF NOT EXISTS `remarks` (
  `company_id` varchar(30) DEFAULT NULL,
  `remarks_id` varchar(10) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`remarks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `remarks`
--

INSERT INTO `remarks` (`company_id`, `remarks_id`, `remark`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('1000001', 'RM2', 'sample remark 22', '2014-12-07 15:24:34', '2014-12-07 15:24:44'),
('1000001', 'RM3', 'sample remark 223', '2014-12-07 15:24:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(1, 'admin', '2014-12-07 10:04:20', NULL),
(2, 'clerk', '2014-12-07 10:04:20', '2015-02-28 15:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `stock_point`
--

CREATE TABLE IF NOT EXISTS `stock_point` (
  `STOCK_POINT_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `STOCK_POINT_NAME` varchar(45) DEFAULT NULL,
  `STOCK_POINT_ADDRESS` varchar(545) DEFAULT NULL,
  `STOCK_POINT_CITY` varchar(45) DEFAULT NULL,
  `STOCK_POINT_STATE` varchar(45) DEFAULT NULL,
  `STOCK_POINT_PHONE` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`STOCK_POINT_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_point`
--

INSERT INTO `stock_point` (`STOCK_POINT_ID`, `COMPANY_ID`, `STOCK_POINT_NAME`, `STOCK_POINT_ADDRESS`, `STOCK_POINT_CITY`, `STOCK_POINT_STATE`, `STOCK_POINT_PHONE`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('SP1', 1000001, 'ELR MAIN SHOP', '10-168/1/1 VASANTHA PURI COLONY MALKAJGIRI', 'HYDERABAD', 'ANDHRA PRADESH', '09030736209', '2014-12-07 15:16:12', '2015-01-10 01:32:38'),
('SP2', 1000001, 'ELR MAIN SHOP', 'Lanco Hills', 'Hyderabad', 'ANDHRA PRADESH', '09030736209', '2015-01-10 11:34:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`date`) VALUES
('2014-10-25 18:30:00'),
('2014-10-26 10:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `FIB_ID` varchar(45) NOT NULL,
  `TRANSACTION_ID` varchar(45) NOT NULL,
  `TRANSACTION_TYPE` varchar(45) NOT NULL DEFAULT '',
  `TRANSACTION_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_ID` varchar(45) NOT NULL DEFAULT '',
  `LEDGER_NAME` varchar(45) DEFAULT NULL,
  `PAYMENT_MODE` varchar(45) DEFAULT NULL,
  `WAY_BILL_NO` varchar(45) DEFAULT NULL,
  `VEHICLE_NO` varchar(45) DEFAULT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `SLIP_NO` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FIB_ID`,`TRANSACTION_ID`,`TRANSACTION_TYPE`,`LEDGER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`FIB_ID`, `TRANSACTION_ID`, `TRANSACTION_TYPE`, `TRANSACTION_DATE`, `LEDGER_ID`, `LEDGER_NAME`, `PAYMENT_MODE`, `WAY_BILL_NO`, `VEHICLE_NO`, `TOTAL_AMOUNT`, `SLIP_NO`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('FY2013-14', 'PUR1', 'PURCHASE', '27-OCT-2014', 'PY7', 'BASAVAPPA', 'CREDIT', NULL, NULL, 85000, 'S1', '27-OCT-2014', '27-OCT-2014'),
('FY2013-14', 'SAL1', 'SALE', '27-OCT-2014', 'PY3', 'KRK', 'CREDIT', NULL, NULL, 4000, 'S2', '27-OCT-2014', '27-OCT-2014');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `UNIT_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `UNIT_NAME` varchar(45) DEFAULT NULL,
  `UNIT_NO_OF_KG` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UNIT_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UNIT_ID`, `COMPANY_ID`, `UNIT_NAME`, `UNIT_NO_OF_KG`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
('UT1', 1000001, '30 KG', 30, '2014-12-07 15:07:32', '2014-12-07 15:07:32'),
('UT10', 1000001, '10 KG', 10, '2015-01-10 13:04:29', '2015-01-10 13:04:29'),
('UT2', 1000001, '20 KG', 20, '2014-12-07 15:07:47', '2014-12-07 15:07:47'),
('UT3', 1000001, '15 KG', 15, '2014-12-07 15:08:00', '2014-12-07 15:08:00'),
('UT4', 1000001, '35 KG', 35, '2014-12-07 15:08:22', '2014-12-07 15:08:22'),
('UT6', 1000001, '22 KG', 22, '2014-12-07 15:08:37', '2014-12-07 15:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_name`, `password`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(10001, 'Ramchand', 'admin', '2014-12-07 10:01:39', NULL),
(10002, 'Clerk', 'clerk', '2014-12-07 10:01:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `role_id` int(10) NOT NULL DEFAULT '0',
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`, `CREATED_DATE`, `MODIFIED_DATE`) VALUES
(10001, 1, '2014-12-07 10:01:39', NULL),
(10002, 2, '2014-12-07 10:01:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_url_mappings`
--

CREATE TABLE IF NOT EXISTS `user_url_mappings` (
  `role_id` int(10) NOT NULL DEFAULT '0',
  `url_pattern` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`,`url_pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_url_mappings`
--

INSERT INTO `user_url_mappings` (`role_id`, `url_pattern`) VALUES
(1, '/merchantdb'),
(1, '/merchantdb/createLedgerGroup'),
(1, '/merchantdb/viewLedgerGroup'),
(1, '/processLogin'),
(2, '/merchantdb/purchaseOrder'),
(2, '/merchantdb/sales'),
(2, '/merchantdb/viewFinYears');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fin_book`
--
ALTER TABLE `fin_book`
  ADD CONSTRAINT `company` FOREIGN KEY (`company_id`) REFERENCES `company` (`COMPANY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `firm`
--
ALTER TABLE `firm`
  ADD CONSTRAINT `firm_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`COMPANY_ID`);

--
-- Constraints for table `ledger_account`
--
ALTER TABLE `ledger_account`
  ADD CONSTRAINT `fk_led_acc_city_grp` FOREIGN KEY (`city_group_id`) REFERENCES `city_group` (`city_group_id`),
  ADD CONSTRAINT `fk_led_acc_fin_book` FOREIGN KEY (`fib_id`) REFERENCES `fin_book` (`fib_id`),
  ADD CONSTRAINT `fk_led_acc_firm` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`);

--
-- Constraints for table `party`
--
ALTER TABLE `party`
  ADD CONSTRAINT `fk_party` FOREIGN KEY (`ledger_grp_id`) REFERENCES `ledger_group` (`ledger_grp_id`),
  ADD CONSTRAINT `fk_party_city_group` FOREIGN KEY (`city_group_id`) REFERENCES `city_group` (`city_group_id`);

--
-- Constraints for table `user_url_mappings`
--
ALTER TABLE `user_url_mappings`
  ADD CONSTRAINT `user_url_mappings_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
