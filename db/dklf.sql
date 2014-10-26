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
INSERT INTO `city_group` VALUES ('1000001','1000001','City Group 1'),('1000002','1000001','City Group 2'),('1000003','1000001','Group2');
/*!40000 ALTER TABLE `city_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `COMPANY_ID` varchar(30) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('1000001','Infosys','Gachibowli','Hyderabad','Andhra Pradesh','500032','1234567788888','9966833088','mailtopsudheer@gmail.com','Yes','2014-10-17','2014-10-26'),('1000002','TCS','PJR NAGAR','Hyderabad','Andhra Pradesh','500032','112232','919642013773','sujitmajumdar42@gmail.com','Yes','2014-10-17','2014-10-17'),('1000003','Wipro','','','','','','','',NULL,'2014-10-25','2014-10-26');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_book`
--

DROP TABLE IF EXISTS `fin_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_book` (
  `FIB_ID` varchar(30) NOT NULL,
  `COMPANY_ID` varchar(30) DEFAULT NULL,
  `FIB_FINANCIAL_YR` varchar(45) DEFAULT NULL,
  `FIB_CREATION_DATE` varchar(45) DEFAULT NULL,
  `FIB_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FIB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_book`
--

LOCK TABLES `fin_book` WRITE;
/*!40000 ALTER TABLE `fin_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `fin_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_group`
--

DROP TABLE IF EXISTS `item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_group` (
  `ITEM_GROUP_ID` varchar(45) NOT NULL,
  `COMPANY_ID` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_NAME` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_CRT_DATE` varchar(45) DEFAULT NULL,
  `ITEM_GROUP_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ITEM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_group`
--

LOCK TABLES `item_group` WRITE;
/*!40000 ALTER TABLE `item_group` DISABLE KEYS */;
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
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_master`
--

LOCK TABLES `item_master` WRITE;
/*!40000 ALTER TABLE `item_master` DISABLE KEYS */;
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
-- Table structure for table `item_transaction`
--

DROP TABLE IF EXISTS `item_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_transaction` (
  `ITEM_TRANSACTION_ID` varchar(45) NOT NULL,
  `LEDGER_TRANS_ID` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_SEQ_NO` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_TYPE` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_DATE` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_ACC_ID` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_ACC_NAME` varchar(45) DEFAULT NULL,
  `ITEM_ID` varchar(45) DEFAULT NULL,
  `ITEM_NAME` varchar(45) DEFAULT NULL,
  `ITEM_BATCH_ID` varchar(45) DEFAULT NULL,
  `ITEM_BATCH_NAME` varchar(45) DEFAULT NULL,
  `ITEM_BATCH_MARK` varchar(45) DEFAULT NULL,
  `ITEM_QTY` varchar(45) DEFAULT NULL,
  `ITEM_WEIGHT` varchar(45) DEFAULT NULL,
  `ITEM_BILL_PRICE` varchar(45) DEFAULT NULL,
  `ITEM_UNBILLED_PRICE` varchar(45) DEFAULT NULL,
  `ITEM_BILL_AMOUNT` varchar(45) DEFAULT NULL,
  `ITEM_UNBILLED_AMOUNT` varchar(45) DEFAULT NULL,
  `ITEM_TOTAL_AMOUNT` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_CRT_DATE` varchar(45) DEFAULT NULL,
  `ITEM_TRANS_MOD_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ITEM_TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_transaction`
--

LOCK TABLES `item_transaction` WRITE;
/*!40000 ALTER TABLE `item_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_transaction` ENABLE KEYS */;
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
INSERT INTO `party` VALUES ('1000002','1000001','party2','Owner','1000001','1000002','pune','pune City','919642013773','2014-10-19','2014-10-19'),('1000003','1000002','party2','Trade Creditor','City','Ledg1','house no-2-85/9/1,PJR Nagar','Hyderabad','919642013773','2014-10-19','2014-10-19'),('1000004','1000001','Party2','Owner','Group2','pqr','Gachibowli','Hyderabad','9966833088','2014-10-26','2014-10-26');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
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

-- Dump completed on 2014-10-27  0:29:48
