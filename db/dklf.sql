-- MySQL dump 10.13  Distrib 5.5.22, for Win32 (x86)
--
-- Host: localhost    Database: dklf
-- ------------------------------------------------------
-- Server version	5.5.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cash_transaction`
--

DROP TABLE IF EXISTS `cash_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_transaction` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_transaction`
--

LOCK TABLES `cash_transaction` WRITE;
/*!40000 ALTER TABLE `cash_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_group`
--

DROP TABLE IF EXISTS `city_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_group` (
  `CITY_GROUP_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `CITY_GROUP_NAME` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CITY_GROUP_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_group`
--

LOCK TABLES `city_group` WRITE;
/*!40000 ALTER TABLE `city_group` DISABLE KEYS */;
INSERT INTO `city_group` VALUES ('CG1',1000001,'OLD MARKET','2014-12-07 14:13:30',NULL),('CG3',1000001,'ELURU','2014-12-07 14:13:41',NULL),('CG4',1000001,'LANKA','2014-12-07 14:13:45',NULL),('CG5',1000001,'NEW MARKET','2014-12-07 14:13:57',NULL),('CG6',1000001,'ELURU','2015-01-10 11:33:44',NULL);
/*!40000 ALTER TABLE `city_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1000001,'DKL Firms','Tuta Street','Eluru','A.P','5340012','123456','9030736209','dns.ramchand@gamil.com','No','2014-12-21','2015-01-11'),(1000002,'PavanSai Firm','Tuta Street','HYDERABAD','A.P','500047','123456','9030736209','saipavan.jhnr@gmail.com','Yes','2014-12-21','2014-12-21');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_book`
--

DROP TABLE IF EXISTS `fin_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_book` (
  `fib_id` varchar(10) NOT NULL DEFAULT '',
  `company_id` int(10) DEFAULT NULL,
  `fib_financial_yr` varchar(10) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`fib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_book`
--

LOCK TABLES `fin_book` WRITE;
/*!40000 ALTER TABLE `fin_book` DISABLE KEYS */;
INSERT INTO `fin_book` VALUES ('FY2012-13',1000001,'2012-2013','2015-01-21 19:12:30','2015-01-21 19:12:30'),('FY2013-14',1000001,'2013-2014','2014-11-09 06:43:51','2014-11-09 06:43:51');
/*!40000 ALTER TABLE `fin_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firm`
--

DROP TABLE IF EXISTS `firm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firm` (
  `COMPANY_ID` int(11) NOT NULL,
  `FIRM_ID` varchar(30) NOT NULL DEFAULT '',
  `FIRM_NAME` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FIRM_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firm`
--

LOCK TABLES `firm` WRITE;
/*!40000 ALTER TABLE `firm` DISABLE KEYS */;
INSERT INTO `firm` VALUES (1000001,'FIRM1','DVR','21-Dec-14',NULL),(1000001,'FIRM2','SJR','21-Dec-14',NULL),(1000001,'FIRM3','AN','21-Dec-14',NULL);
/*!40000 ALTER TABLE `firm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_group`
--

DROP TABLE IF EXISTS `item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_group` (
  `item_group_id` int(10) NOT NULL DEFAULT '0',
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_NAME` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_CRT_DATE` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_group`
--

LOCK TABLES `item_group` WRITE;
/*!40000 ALTER TABLE `item_group` DISABLE KEYS */;
INSERT INTO `item_group` VALUES (10001,'100001','Jaggery','2014-11-02 23:33:12','2014-11-02 23:33:12');
/*!40000 ALTER TABLE `item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_ledger`
--

DROP TABLE IF EXISTS `item_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_ledger` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_ledger`
--

LOCK TABLES `item_ledger` WRITE;
/*!40000 ALTER TABLE `item_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_master`
--

DROP TABLE IF EXISTS `item_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_master` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_master`
--

LOCK TABLES `item_master` WRITE;
/*!40000 ALTER TABLE `item_master` DISABLE KEYS */;
INSERT INTO `item_master` VALUES ('IT1',1000001,'10 KG Karipuli','UT5','10 KG',10,'2%','Yes',100,101,1.81,102,10,'2014-12-13 00:49:30','2014-12-13 00:49:30'),('IT3',1000001,'20 KG Red Chillies','UT2','10 KG',20,'2%','No',100,101,1.81,102,20,'2014-12-13 00:58:17','2014-12-13 00:58:17'),('IT4',1000001,'15 KG Soap Nuts','UT6','15 KG',22,'2%','No',100,101,1.81,102,22,'2014-12-13 00:59:19','2014-12-13 00:59:19');
/*!40000 ALTER TABLE `item_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_stock_point`
--

DROP TABLE IF EXISTS `item_stock_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_stock_point` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_stock_point`
--

LOCK TABLES `item_stock_point` WRITE;
/*!40000 ALTER TABLE `item_stock_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_stock_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_stock_register`
--

DROP TABLE IF EXISTS `item_stock_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_stock_register` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_stock_register`
--

LOCK TABLES `item_stock_register` WRITE;
/*!40000 ALTER TABLE `item_stock_register` DISABLE KEYS */;
INSERT INTO `item_stock_register` VALUES ('FY2013-14','SP1','IT1','10 KG Karipuli','IB1','360/1030',0,10,0,0,0,10,'2015-01-11 20:04:13','2015-01-11 20:04:13'),('FY2013-14','SP1','IT2','15 KG Flower','IB2','1510/640',0,10,0,0,0,10,'2015-01-11 20:05:12','2015-01-11 20:05:12');
/*!40000 ALTER TABLE `item_stock_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_transaction`
--

DROP TABLE IF EXISTS `item_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_transaction` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_transaction`
--

LOCK TABLES `item_transaction` WRITE;
/*!40000 ALTER TABLE `item_transaction` DISABLE KEYS */;
INSERT INTO `item_transaction` VALUES ('FY2013-14','PUR1',1,'IT2','10 KG Karipuli','IB4','1040/1050',100,1000,0,10,450,400,45000,40000,85000,'1','DVR','2015-01-11 20:08:27','2015-01-11 20:08:27'),('FY2013-14','SAL1',1,'IT2','10 KG Karipuli','IB4','1040/1050',10,100,0,10,0,400,0,4000,4000,'3','AN','2015-01-11 20:09:57','2015-01-11 20:09:57');
/*!40000 ALTER TABLE `item_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--

LOCK TABLES `ledger` WRITE;
/*!40000 ALTER TABLE `ledger` DISABLE KEYS */;
INSERT INTO `ledger` VALUES ('FY2013-14','PUR1','PURCHASE','2015-01-11 19:59:44','IT1LG1',1,'10KG Karipuli Purchase','3','AN','Dr',3500,'2015-01-11 19:59:44','2015-01-11 19:59:44'),('FY2013-14','PUR1','PURCHASE','2015-01-10 13:22:14','PY7',1,'BASAVAPPA','1','DVR','CR',2000,'2015-01-10 13:22:14','2015-01-10 13:22:14');
/*!40000 ALTER TABLE `ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger_account`
--

DROP TABLE IF EXISTS `ledger_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_account` (
  `LEDGER_ACC_ID` varchar(45) NOT NULL,
  `FIB_ID` varchar(45) NOT NULL DEFAULT '',
  `LEDGER_ACC_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_ID` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `FIRM_ID` varchar(45) NOT NULL DEFAULT '',
  `FIRM_NAME` varchar(45) DEFAULT NULL,
  `CITY_GROUP_ID` varchar(45) DEFAULT NULL,
  `LEDGER_ACC_OPEN_BAL` double NOT NULL,
  `LEDGER_ACC_CREDIT` double NOT NULL,
  `LEDGER_ACC_DEBIT` double NOT NULL,
  `LEDGER_ACC_CLOSE_BAL` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_ACC_ID`,`FIB_ID`,`FIRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_account`
--

LOCK TABLES `ledger_account` WRITE;
/*!40000 ALTER TABLE `ledger_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ledger_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger_group`
--

DROP TABLE IF EXISTS `ledger_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_group` (
  `LEDGER_GRP_ID` varchar(30) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_GRP_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_group`
--

LOCK TABLES `ledger_group` WRITE;
/*!40000 ALTER TABLE `ledger_group` DISABLE KEYS */;
INSERT INTO `ledger_group` VALUES ('LG1',1000001,'CLOSING STOCK','income','2014-12-07','2015-01-10 14:07:39'),('LG10',1000001,'CAPITAL ACCOUNTS','income','2014-12-07','2015-01-10 14:07:50'),('LG11',1000001,'TRADE CREDITORS','liabilities','2014-12-07','2014-12-07 14:06:13'),('LG2',1000001,'SALE','income','2014-12-07','2014-12-07'),('LG3',1000001,'TRADE DEBTORS','assets','2014-12-07','2014-12-07'),('LG4',1000001,'CASH ON HAND','assets','2014-12-07','2015-01-10 14:08:06'),('LG5',1000001,'STOCK ON HAND','assets','2014-12-07','2014-12-07'),('LG6',1000001,'OPENING STOCK','assets','2014-12-07','2014-12-07'),('LG7',1000001,'PURCHASE','expenditure','2014-12-07','2014-12-07'),('LG8',1000001,'PROFIT & LOSS','expenditure','2014-12-07','2014-12-07'),('LG9',1000001,'EXPENSE','expenditure','2014-12-07','2014-12-07 14:06:10');
/*!40000 ALTER TABLE `ledger_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger_item_batch`
--

DROP TABLE IF EXISTS `ledger_item_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_item_batch` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_item_batch`
--

LOCK TABLES `ledger_item_batch` WRITE;
/*!40000 ALTER TABLE `ledger_item_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ledger_item_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger_trans`
--

DROP TABLE IF EXISTS `ledger_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger_trans` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_trans`
--

LOCK TABLES `ledger_trans` WRITE;
/*!40000 ALTER TABLE `ledger_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ledger_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narration`
--

DROP TABLE IF EXISTS `narration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narration` (
  `NARRATION_ID` varchar(30) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `NARRATION_DETAIL` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NARRATION_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narration`
--

LOCK TABLES `narration` WRITE;
/*!40000 ALTER TABLE `narration` DISABLE KEYS */;
/*!40000 ALTER TABLE `narration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `PARTY_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `party_name` varchar(30) DEFAULT NULL,
  `PARTY_TYPE` varchar(45) DEFAULT NULL,
  `city_group_name` varchar(30) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(30) DEFAULT NULL,
  `PARTY_STREET_NAME` varchar(45) DEFAULT NULL,
  `PARTY_CITY` varchar(45) DEFAULT NULL,
  `PARTY_PHONE` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PARTY_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES ('PY1',1000001,'DVR','Person','CG3','LG10','Agraharam','Eluru','09030736209','2014-12-07','2014-12-19 00:14:56'),('PY2',1000001,'SJR','Trade Debtor','CG3','LG10','Sanath Nagar','Eluru','09030736209','2014-12-07','2015-01-10 01:18:47'),('PY3',1000001,'KRK','Person','CG3','LG10','Tuta Street','Eluru','09030736209','2014-12-07','2014-12-07'),('PY4',1000001,'BASAVAPPA','Trade Debtor','CG1','LG11','Tuta Street','Hindpur','09030736209','2014-12-07','2015-01-10 01:32:26'),('PY5',1000001,'BASAVAPPA','Trade Debtor','CG5','LG2','Lanco Hills','Hyderabad','+919966833088','2015-01-10','2015-01-10');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remarks` (
  `company_id` varchar(30) DEFAULT NULL,
  `remarks_id` varchar(10) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`remarks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES ('1000001','RM2','sample remark 22','2014-12-07 15:24:34','2014-12-07 15:24:44'),('1000001','RM3','sample remark 223','2014-12-07 15:24:54',NULL);
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL,
  `role_name` varchar(20) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','2014-12-07 10:04:20',NULL),(2,'clerk','2014-12-07 10:04:20',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_point`
--

DROP TABLE IF EXISTS `stock_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_point` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_point`
--

LOCK TABLES `stock_point` WRITE;
/*!40000 ALTER TABLE `stock_point` DISABLE KEYS */;
INSERT INTO `stock_point` VALUES ('SP1',1000001,'ELR MAIN SHOP','10-168/1/1 VASANTHA PURI COLONY MALKAJGIRI','HYDERABAD','ANDHRA PRADESH','09030736209','2014-12-07 15:16:12','2015-01-10 01:32:38'),('SP2',1000001,'ELR MAIN SHOP','Lanco Hills','Hyderabad','ANDHRA PRADESH','09030736209','2015-01-10 11:34:37',NULL);
/*!40000 ALTER TABLE `stock_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('2014-10-25 18:30:00'),('2014-10-26 10:28:23');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `UNIT_ID` varchar(45) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `UNIT_NAME` varchar(45) DEFAULT NULL,
  `UNIT_NO_OF_KG` double NOT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UNIT_ID`,`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES ('UT1',1000001,'30 KG',30,'2014-12-07 15:07:32','2014-12-07 15:07:32'),('UT10',1000001,'10 KG',10,'2015-01-10 13:04:29','2015-01-10 13:04:29'),('UT2',1000001,'20 KG',20,'2014-12-07 15:07:47','2014-12-07 15:07:47'),('UT3',1000001,'15 KG',15,'2014-12-07 15:08:00','2014-12-07 15:08:00'),('UT4',1000001,'35 KG',35,'2014-12-07 15:08:22','2014-12-07 15:08:22'),('UT6',1000001,'22 KG',22,'2014-12-07 15:08:37','2014-12-07 15:08:37');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (10001,'Ramchand','admin','2014-12-07 10:01:39',NULL),(10002,'Clerk','clerk','2014-12-07 10:01:39',NULL);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `role_id` int(10) NOT NULL DEFAULT '0',
  `CREATED_DATE` varchar(45) NOT NULL,
  `MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (10001,1,'2014-12-07 10:01:39',NULL),(10002,2,'2014-12-07 10:01:39',NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_url_mappings`
--

DROP TABLE IF EXISTS `user_url_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_url_mappings` (
  `role_id` int(10) NOT NULL DEFAULT '0',
  `url_pattern` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`,`url_pattern`),
  CONSTRAINT `user_url_mappings_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_url_mappings`
--

LOCK TABLES `user_url_mappings` WRITE;
/*!40000 ALTER TABLE `user_url_mappings` DISABLE KEYS */;
INSERT INTO `user_url_mappings` VALUES (1,'/merchantdb'),(1,'/merchantdb/createLedgerGroup'),(1,'/merchantdb/viewLedgerGroup'),(1,'/processLogin'),(2,'/merchantdb/purchaseOrder'),(2,'/merchantdb/sales'),(2,'/merchantdb/viewFinYears');
/*!40000 ALTER TABLE `user_url_mappings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-22  2:25:55
