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
-- Table structure for table `city_group`
--

DROP TABLE IF EXISTS `city_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_group` (
  `CITY_GROUP_ID` varchar(45) NOT NULL,
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `CITY_GROUP_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CITY_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_group`
--

LOCK TABLES `city_group` WRITE;
/*!40000 ALTER TABLE `city_group` DISABLE KEYS */;
INSERT INTO `city_group` VALUES ('1000002','1000001','Group3'),('1000003','1000001','Group2');
/*!40000 ALTER TABLE `city_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(10) NOT NULL DEFAULT '0',
  `COMPANY_NAME` varchar(45) DEFAULT NULL,
  `COMPANY_STREET_NAME` varchar(45) DEFAULT NULL,
  `COMPANY_CITY` varchar(45) DEFAULT NULL,
  `COMPANY_STATE` varchar(45) DEFAULT NULL,
  `COMPANY_PIN` varchar(45) DEFAULT NULL,
  `COMPANY_TIN` varchar(45) DEFAULT NULL,
  `COMPANY_PHONE` varchar(45) DEFAULT NULL,
  `COMPANY_EMAIL` varchar(45) DEFAULT NULL,
  `COMPANY_SLIPS_IND` varchar(45) DEFAULT NULL,
  `COMPANY_CREATION_DATE` varchar(45) DEFAULT NULL,
  `COMPANY_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1000001,'Infosys','Gachibowli','Hyderabad','Andhra Pradesh','500032','1234567788888','9966833088','mailtopsudheer@gmail.com','Yes','2014-10-17','2014-10-26'),(1000002,'TCS','PJR NAGAR','Hyderabad','Andhra Pradesh','500032','112232','919642013773','sujitmajumdar42@gmail.com','Yes','2014-10-17','2014-10-17'),(1000003,'Wipro','','','','','','','',NULL,'2014-10-25','2014-10-26');
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
  `fib_creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fib_mod_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`fib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_book`
--

LOCK TABLES `fin_book` WRITE;
/*!40000 ALTER TABLE `fin_book` DISABLE KEYS */;
INSERT INTO `fin_book` VALUES ('FY2013-14',1000001,'2013-2014','2014-11-09 12:13:51','2014-11-09 12:13:51');
/*!40000 ALTER TABLE `fin_book` ENABLE KEYS */;
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
-- Table structure for table `item_master`
--

DROP TABLE IF EXISTS `item_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_master` (
  `ITEM_ID` varchar(45) NOT NULL,
  `ITEM_GROUP_ID` varchar(45) DEFAULT NULL,
  `ITEM_NAME` varchar(45) DEFAULT NULL,
  `ITEM_UNIT_NAME` varchar(45) DEFAULT NULL,
  `ITEM_SALES_TAX_EX` varchar(45) DEFAULT NULL,
  `ITEM_TOWN_COOLIE` varchar(45) DEFAULT NULL,
  `ITEM_OOT_COOLIE` varchar(45) DEFAULT NULL,
  `ITEM_EETA_COOLIE` varchar(45) DEFAULT NULL,
  `ITEM_UNLOAD_COOLIE` varchar(45) DEFAULT NULL,
  `ITEM_PRICE_PER` varchar(45) DEFAULT NULL,
  `ITEM_CRT_DATE` varchar(45) DEFAULT NULL,
  `ITEM_MOD_DATE` varchar(45) DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `weight` double(5,2) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_master`
--

LOCK TABLES `item_master` WRITE;
/*!40000 ALTER TABLE `item_master` DISABLE KEYS */;
INSERT INTO `item_master` VALUES ('1000001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-11-05 00:28:43','2014-11-05 00:28:43',NULL,NULL),('1000003','3','Bags','SopaNuts','Yes','4','34',NULL,'3','Unit Name','2014-11-05 01:03:03','2014-11-05 01:03:03',1000001,3.00);
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
  `book_id` varchar(10) DEFAULT NULL,
  `stock_point_id` varchar(10) DEFAULT NULL,
  `stock_point_name` varchar(30) DEFAULT NULL,
  `item_id` varchar(10) DEFAULT NULL,
  `item_name` varchar(30) DEFAULT NULL,
  `item_batch_id` varchar(10) DEFAULT NULL,
  `item_batch_name` varchar(30) DEFAULT NULL,
  `open_quantity` int(10) DEFAULT NULL,
  `purchase_quantity` int(10) DEFAULT NULL,
  `sale_quantity` int(10) DEFAULT NULL,
  `transfer_in` int(10) DEFAULT NULL,
  `transfer_out` int(10) DEFAULT NULL,
  `stock_on_hand` int(10) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_stock_register`
--

LOCK TABLES `item_stock_register` WRITE;
/*!40000 ALTER TABLE `item_stock_register` DISABLE KEYS */;
INSERT INTO `item_stock_register` VALUES ('FY2013-14','SP1','ELR MAIN SHOP','IT1','10KG Karipuli','IB1','360/1030',0,10,0,0,0,10,'2014-11-24 18:05:03','2014-11-24 18:05:03');
/*!40000 ALTER TABLE `item_stock_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_transaction`
--

DROP TABLE IF EXISTS `item_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_transaction` (
  `book_id` varchar(10) DEFAULT NULL,
  `transaction_id` varchar(10) NOT NULL,
  `transaction_seq_no` int(5) DEFAULT NULL,
  `item_id` varchar(10) DEFAULT NULL,
  `item_name` varchar(30) DEFAULT NULL,
  `item_batch_id` varchar(10) DEFAULT NULL,
  `item_batch_name` varchar(30) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `weight` double(10,2) DEFAULT NULL,
  `weight_difference` double(6,2) DEFAULT NULL,
  `price_per` int(10) DEFAULT NULL,
  `price1` double(10,2) DEFAULT NULL,
  `price2` double(10,2) DEFAULT NULL,
  `amount1` double(10,2) DEFAULT NULL,
  `amount2` double(10,2) DEFAULT NULL,
  `total_amount` double(10,2) DEFAULT NULL,
  `firm_id` int(10) DEFAULT NULL,
  `firm_name` varchar(30) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_transaction`
--

LOCK TABLES `item_transaction` WRITE;
/*!40000 ALTER TABLE `item_transaction` DISABLE KEYS */;
INSERT INTO `item_transaction` VALUES ('FY2013-14','PUR1',1,'IT2','10KG Karipuli','IB4','1040/1050',100,1000.00,0.00,10,450.00,400.00,45000.00,40000.00,85000.00,1,'DVR','2014-11-24 17:48:13','2014-11-24 17:48:13');
/*!40000 ALTER TABLE `item_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ledger` (
  `ledgerid` varchar(10) DEFAULT NULL,
  `bookid` varchar(10) DEFAULT NULL,
  `transactionType` varchar(20) DEFAULT NULL,
  `transactionDate` timestamp NULL DEFAULT NULL,
  `ledger_seq_no` int(10) DEFAULT NULL,
  `transactionId` varchar(10) DEFAULT NULL,
  `ledger_name` varchar(45) DEFAULT NULL,
  `firmId` int(10) DEFAULT NULL,
  `firmName` varchar(30) DEFAULT NULL,
  `depositType` varchar(2) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `narration` varchar(45) DEFAULT NULL,
  KEY `bookid` (`bookid`),
  CONSTRAINT `ledger_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `fin_book` (`fib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger`
--

LOCK TABLES `ledger` WRITE;
/*!40000 ALTER TABLE `ledger` DISABLE KEYS */;
INSERT INTO `ledger` VALUES ('PY7','FY2013-14','PURCHASE','2014-11-10 17:56:18',1,'PUR1','BASAVAPPA',1,'DVR','Dr',45000.00,'2014-11-10 17:56:18','2014-11-10 17:56:18','remarks'),('IT1LG1','FY2013-14','SALE','2014-11-11 19:31:52',2,'PUR1','10KG Karipuli Purchase',1,'DVR','CR',35000.00,'2014-11-11 19:31:52','2014-11-11 19:31:52','Pulihora Purchased'),('leger1','FY2013-14','payment','2014-11-13 18:25:02',2,'trans1','legerName',232,'DKLF','cr',34323.00,'2014-11-13 18:25:02','2014-11-13 18:25:02','NOTHING');
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
  `FIB_ID` varchar(45) DEFAULT NULL,
  `LEDGER_ACC_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_ID` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `LEDGER_ACCOUNTcol` varchar(45) DEFAULT NULL,
  `CITY_GROUP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_OPEN_BAL` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_CREDIT` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_DEBIT` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_CURR_BAL` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_CRT_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_ACC_ID`)
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
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_TYPE` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_CRT_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_GRP_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LEDGER_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledger_group`
--

LOCK TABLES `ledger_group` WRITE;
/*!40000 ALTER TABLE `ledger_group` DISABLE KEYS */;
INSERT INTO `ledger_group` VALUES ('1000002','1000001','Ledg1','liabilities','2014-10-19','2014-10-19'),('1000003','1000001','xyz','income','2014-10-26','2014-10-26'),('1000004','1000002','abc','liabilities','2014-10-26','2014-10-26'),('1000005','1000002','abc','liabilities','2014-10-26','2014-10-26'),('1000006','1000001','pqr','expenditure','2014-10-26','2014-10-26'),('1000007','1000001','anyGroup','assets','2014-10-26','2014-10-26');
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
  `LEDGER_ITEM_BATCH_CRT_DATE` varchar(45) DEFAULT NULL,
  `LEDGER_ITEM_BATCH_MOD_DATE` varchar(45) DEFAULT NULL,
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
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `NARRATION_DETAIL` varchar(45) DEFAULT NULL,
  `NARRATION_CRT_DATE` varchar(45) DEFAULT NULL,
  `NARRATIO_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NARRATION_ID`)
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
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `party_name` varchar(30) DEFAULT NULL,
  `PARTY_TYPE` varchar(45) DEFAULT NULL,
  `city_group_name` varchar(30) DEFAULT NULL,
  `LEDGER_GRP_NAME` varchar(30) DEFAULT NULL,
  `PARTY_STREET_NAME` varchar(45) DEFAULT NULL,
  `PARTY_CITY` varchar(45) DEFAULT NULL,
  `PARTY_PHONE` varchar(45) DEFAULT NULL,
  `PARTY_CRT_DATE` varchar(45) DEFAULT NULL,
  `PARTY_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PARTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES ('1000002','1000001','party2','Owner','1000001','1000002','pune','pune City','919642013773','2014-10-19','2014-10-19'),('1000003','1000002','party2','Trade Creditor','City','Ledg1','house no-2-85/9/1,PJR Nagar','Hyderabad','919642013773','2014-10-19','2014-10-19'),('1000004','1000001','Party2','Employee','Group2','pqr','Gachibowli','Hyderabad','9966833088','2014-10-26',NULL);
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
  PRIMARY KEY (`remarks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES ('1000001','1000002','Remark1');
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
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'clerk');
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
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `STOCK_POINT_NAME` varchar(45) DEFAULT NULL,
  `STOCK_POINT_ADDRESS` varchar(545) DEFAULT NULL,
  `STOCK_POINT_CITY` varchar(45) DEFAULT NULL,
  `STOCK_POINT_STATE` varchar(45) DEFAULT NULL,
  `STOCK_POINT_PHONE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`STOCK_POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_point`
--

LOCK TABLES `stock_point` WRITE;
/*!40000 ALTER TABLE `stock_point` DISABLE KEYS */;
INSERT INTO `stock_point` VALUES ('1000001','1000001','XYZ','MGBS','Hyderabad','Telangana','040-223344');
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
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit_id` int(10) NOT NULL DEFAULT '0',
  `company_id` int(10) DEFAULT NULL,
  `UNIT_NAME` varchar(45) DEFAULT NULL,
  `unit_no_of_kg` decimal(10,2) DEFAULT NULL,
  `unit_crt_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unit_mod_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1000001,1000001,'SopaNuts',3.00,'2014-11-01 07:48:55','2014-11-01 07:48:55'),(1000002,1000001,'Tamarind',10.00,'2014-11-02 14:43:35','2014-11-01 07:49:12'),(1000003,1000002,'Tamarind',5.00,'2014-11-02 14:46:45','2014-11-02 14:46:45'),(1000004,1000002,'SopaNuts',10.00,'2014-11-02 14:47:47','2014-11-02 14:47:47');
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (10001,'sudheer','admin'),(10002,'Sujit','clerk');
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
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (10001,1),(10002,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-27  9:20:57
