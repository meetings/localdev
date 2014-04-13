-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: mogilefs
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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

CREATE DATABASE IF NOT EXISTS mogilefs;
GRANT ALL PRIVILEGES ON mogilefs.* TO 'mogile'@'localhost' IDENTIFIED BY 'dcpmogile';
FLUSH PRIVILEGES;
USE mogilefs;

--
-- Table structure for table `checksum`
--

DROP TABLE IF EXISTS `checksum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checksum` (
  `fid` bigint(20) unsigned NOT NULL,
  `hashtype` tinyint(3) unsigned NOT NULL,
  `checksum` varbinary(64) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checksum`
--

LOCK TABLES `checksum` WRITE;
/*!40000 ALTER TABLE `checksum` DISABLE KEYS */;
/*!40000 ALTER TABLE `checksum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `dmid` smallint(5) unsigned NOT NULL,
  `classid` tinyint(3) unsigned NOT NULL,
  `classname` varchar(50) DEFAULT NULL,
  `mindevcount` tinyint(3) unsigned NOT NULL,
  `hashtype` tinyint(3) unsigned DEFAULT NULL,
  `replpolicy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dmid`,`classid`),
  UNIQUE KEY `dmid` (`dmid`,`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,'attachment',2,NULL,NULL),(2,1,'thumbnail',2,NULL,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `devid` mediumint(8) unsigned NOT NULL,
  `hostid` mediumint(8) unsigned NOT NULL,
  `status` enum('alive','dead','down','readonly','drain') DEFAULT NULL,
  `weight` mediumint(9) DEFAULT '100',
  `mb_total` int(10) unsigned DEFAULT NULL,
  `mb_used` int(10) unsigned DEFAULT NULL,
  `mb_asof` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`devid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,'alive',100,3760,1909,1394132382),(2,1,'alive',100,3760,1909,1394132382);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `dmid` smallint(5) unsigned NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dmid`),
  UNIQUE KEY `namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'dicole.dcp.attachments'),(2,'dicole.dcp.thumbnails');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `fid` bigint(20) unsigned NOT NULL,
  `dmid` smallint(5) unsigned NOT NULL,
  `dkey` varchar(255) DEFAULT NULL,
  `length` bigint(20) unsigned DEFAULT NULL,
  `classid` tinyint(3) unsigned NOT NULL,
  `devcount` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `dkey` (`dmid`,`dkey`),
  KEY `devcount` (`dmid`,`classid`,`devcount`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_on`
--

DROP TABLE IF EXISTS `file_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_on` (
  `fid` bigint(20) unsigned NOT NULL,
  `devid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`fid`,`devid`),
  KEY `devid` (`devid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_on`
--

LOCK TABLES `file_on` WRITE;
/*!40000 ALTER TABLE `file_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_on_corrupt`
--

DROP TABLE IF EXISTS `file_on_corrupt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_on_corrupt` (
  `fid` bigint(20) unsigned NOT NULL,
  `devid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`fid`,`devid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_on_corrupt`
--

LOCK TABLES `file_on_corrupt` WRITE;
/*!40000 ALTER TABLE `file_on_corrupt` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_on_corrupt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_to_delete`
--

DROP TABLE IF EXISTS `file_to_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_to_delete` (
  `fid` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_to_delete`
--

LOCK TABLES `file_to_delete` WRITE;
/*!40000 ALTER TABLE `file_to_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_to_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_to_delete2`
--

DROP TABLE IF EXISTS `file_to_delete2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_to_delete2` (
  `fid` bigint(20) unsigned NOT NULL,
  `nexttry` int(10) unsigned NOT NULL,
  `failcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `nexttry` (`nexttry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_to_delete2`
--

LOCK TABLES `file_to_delete2` WRITE;
/*!40000 ALTER TABLE `file_to_delete2` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_to_delete2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_to_delete_later`
--

DROP TABLE IF EXISTS `file_to_delete_later`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_to_delete_later` (
  `fid` bigint(20) unsigned NOT NULL,
  `delafter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `delafter` (`delafter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_to_delete_later`
--

LOCK TABLES `file_to_delete_later` WRITE;
/*!40000 ALTER TABLE `file_to_delete_later` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_to_delete_later` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_to_queue`
--

DROP TABLE IF EXISTS `file_to_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_to_queue` (
  `fid` bigint(20) unsigned NOT NULL,
  `devid` int(10) unsigned DEFAULT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `nexttry` int(10) unsigned NOT NULL,
  `failcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arg` text,
  PRIMARY KEY (`fid`,`type`),
  KEY `type_nexttry` (`type`,`nexttry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_to_queue`
--

LOCK TABLES `file_to_queue` WRITE;
/*!40000 ALTER TABLE `file_to_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_to_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_to_replicate`
--

DROP TABLE IF EXISTS `file_to_replicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_to_replicate` (
  `fid` bigint(20) unsigned NOT NULL,
  `nexttry` int(10) unsigned NOT NULL,
  `fromdevid` int(10) unsigned DEFAULT NULL,
  `failcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `nexttry` (`nexttry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_to_replicate`
--

LOCK TABLES `file_to_replicate` WRITE;
/*!40000 ALTER TABLE `file_to_replicate` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_to_replicate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fsck_log`
--

DROP TABLE IF EXISTS `fsck_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fsck_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `utime` int(10) unsigned NOT NULL,
  `fid` bigint(20) unsigned DEFAULT NULL,
  `evcode` char(4) DEFAULT NULL,
  `devid` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `utime` (`utime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fsck_log`
--

LOCK TABLES `fsck_log` WRITE;
/*!40000 ALTER TABLE `fsck_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fsck_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `hostid` mediumint(8) unsigned NOT NULL,
  `status` enum('alive','dead','down') DEFAULT NULL,
  `http_port` mediumint(8) unsigned DEFAULT '7500',
  `http_get_port` mediumint(8) unsigned DEFAULT NULL,
  `hostname` varchar(40) DEFAULT NULL,
  `hostip` varchar(15) DEFAULT NULL,
  `altip` varchar(15) DEFAULT NULL,
  `altmask` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`hostid`),
  UNIQUE KEY `hostname` (`hostname`),
  UNIQUE KEY `hostip` (`hostip`),
  UNIQUE KEY `altip` (`altip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,'alive',7500,NULL,'1','127.0.0.1',NULL,NULL);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_settings`
--

DROP TABLE IF EXISTS `server_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_settings` (
  `field` varchar(50) NOT NULL,
  `value` text,
  PRIMARY KEY (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES ('schema_version','15');
/*!40000 ALTER TABLE `server_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempfile`
--

DROP TABLE IF EXISTS `tempfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempfile` (
  `fid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `createtime` int(10) unsigned NOT NULL,
  `classid` tinyint(3) unsigned NOT NULL,
  `dmid` smallint(5) unsigned NOT NULL,
  `dkey` varchar(255) DEFAULT NULL,
  `devids` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempfile`
--

LOCK TABLES `tempfile` WRITE;
/*!40000 ALTER TABLE `tempfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tempfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unreachable_fids`
--

DROP TABLE IF EXISTS `unreachable_fids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unreachable_fids` (
  `fid` bigint(20) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `lastupdate` (`lastupdate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unreachable_fids`
--

LOCK TABLES `unreachable_fids` WRITE;
/*!40000 ALTER TABLE `unreachable_fids` DISABLE KEYS */;
/*!40000 ALTER TABLE `unreachable_fids` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-06 18:59:48
