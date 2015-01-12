CREATE DATABASE  IF NOT EXISTS `isdproject` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `isdproject`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: isdproject
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `resource_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_customers`
--

DROP TABLE IF EXISTS `ad_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_customers`
--

LOCK TABLES `ad_customers` WRITE;
/*!40000 ALTER TABLE `ad_customers` DISABLE KEYS */;
INSERT INTO `ad_customers` VALUES (1,'Nguyễn Đăng Hùng','Hà Đông-Hà Nội','danghung2551993@gmail.com','01666157993','234902099990','2015-01-10 07:26:35','2015-01-10 07:26:35'),(2,'Nguyễn Thế Anh','Phú xuyên-Hà Đông','theanh@gmail.com','0988232323','38909823808','2015-01-10 07:27:36','2015-01-10 07:27:36'),(3,'Đặng Huỳnh Nam','Quang Trung - Hà Nội','huynhnam@gmail.com','0164987463','0923823747466','2015-01-10 07:29:07','2015-01-10 07:29:07');
/*!40000 ALTER TABLE `ad_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_locations`
--

DROP TABLE IF EXISTS `ad_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordered` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_locations`
--

LOCK TABLES `ad_locations` WRITE;
/*!40000 ALTER TABLE `ad_locations` DISABLE KEYS */;
INSERT INTO `ad_locations` VALUES (1,'Top',NULL,0,'2015-01-08 04:34:44','2015-01-10 09:08:14'),(2,'Sidebar 1st - Trang chuyên mục báo',NULL,0,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(3,'Sidebar 1st - Trang chi tiết báo',NULL,0,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(4,'Sidebar 1st - Trang danh sách video',NULL,0,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(5,'Sidebar 1st - Trang danh sách blog',NULL,0,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(6,'Sidebar 1st - Trang chi tiết blog',NULL,0,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(7,'Sidebar 2nd - Trang nhất','anna.jpg',1,'2015-01-08 04:34:44','2015-01-10 08:46:48'),(8,'Sidebar 2nd - Trang chuyên mục báo',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45'),(9,'Sidebar 2nd - Trang chi tiết báo',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45'),(10,'Sidebar 2nd - Trang danh sách video',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45'),(11,'Sidebar 2nd - Trang danh sách blog',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45'),(12,'Sidebar 2nd - Trang chi tiết blog',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45'),(13,'Sidebar 1st - Trang nhất','trang_nhat_1.jpg',1,'2015-01-08 04:34:45','2015-01-10 09:08:14'),(14,'Sidebar 1st - Trang search',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45'),(15,'Sidebar 2nd - Trang search',NULL,0,'2015-01-08 04:34:45','2015-01-08 04:34:45');
/*!40000 ALTER TABLE `ad_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_orders`
--

DROP TABLE IF EXISTS `ad_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_customer_id` int(11) DEFAULT NULL,
  `ad_location_id` int(11) DEFAULT NULL,
  `started_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_orders`
--

LOCK TABLES `ad_orders` WRITE;
/*!40000 ALTER TABLE `ad_orders` DISABLE KEYS */;
INSERT INTO `ad_orders` VALUES (2,1,7,'2015-01-11 00:00:00','2015-03-22 00:00:00',100000,'anna.jpg','2015-01-10 07:50:50','2015-01-10 08:46:49'),(3,1,13,'2015-01-11 00:00:00','2015-05-13 00:00:00',150000,'trang_nhat_1.jpg','2015-01-10 08:48:42','2015-01-10 09:08:14'),(4,1,1,'2015-01-10 00:00:00','2015-04-22 00:00:00',100000,'top.gif','2015-01-10 09:03:01','2015-01-10 09:03:01');
/*!40000 ALTER TABLE `ad_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_price_lists`
--

DROP TABLE IF EXISTS `ad_price_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_price_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `duration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_location_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_price_lists`
--

LOCK TABLES `ad_price_lists` WRITE;
/*!40000 ALTER TABLE `ad_price_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_price_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin@example.com','$2a$10$Jo8NgUt97edR8aAHNQh/iexlTYG/ls5WMOeisDBWtRIamIQ5qUr5i',NULL,NULL,NULL,6,'2015-01-10 09:01:58','2015-01-10 07:19:46','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2015-01-08 04:34:48','2015-01-10 09:01:58');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `admin_user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Ngây ngất trước vòng 1 căng tròn bên smartphone','Ngây ngất trước vòng 1 căng tròn bên smartphone','<p>đ&acirc;sdasdasd</p>\r\n',1,'1420797643-1177627.jpg',3,'Nguyễn Đăng Hùng','2015-01-08 04:57:09','2015-01-10 09:19:15'),(2,'“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?','Cùng xem hành trình lột xác đầy ngỡ ngàng của \"Võ Tắc Thiên\" Phạm Băng Băng.','<div class=\"text-conent\" style=\"font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-align: justify; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">\r\n<p>C&aacute;i t&ecirc;n Phạm Băng Băng hiện đang rất &quot;hot&quot; sau m&agrave;n h&oacute;a th&acirc;n th&agrave;nh nh&acirc;n vật V&otilde; Tắc Thi&ecirc;n. Chưa b&agrave;n đến vấn đề diễn xuất, tạo h&igrave;nh của nhan sắc 33 tuổi trong bộ phim n&agrave;y khiến người xem ng&acirc;y ngất v&igrave; qu&aacute; xinh đẹp. Kh&ocirc;ng chỉ thế, những trang phục sử dụng cũng đầy gợi cảm t&ocirc;n vinh hết mực v&ograve;ng 1 của Phạm Băng Băng c&ugrave;ng d&agrave;n diễn vi&ecirc;n nữ.</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 1\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-cveftoc18_vwqi.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Phạm Băng Băng xinh đẹp v&agrave; quyến rũ trong tạo h&igrave;nh V&otilde; Tắc Thi&ecirc;n</p>\r\n\r\n<p>Để trở th&agrave;nh một trong những hoa đ&aacute;n xinh đẹp bậc nhất l&agrave;ng giải tr&iacute; Trung Quốc, Phạm Băng Băng cũng từng trải qua thời kỳ c&oacute; phần qu&ecirc; m&ugrave;a v&agrave; kh&ocirc;ng được bắt mắt.</p>\r\n\r\n<p>Thời đ&oacute;, ngo&agrave;i việc hạn chế trong gu thẩm mỹ, trang điểm, l&agrave;n da kh&ocirc;ng được trắng ngọc trắng ng&agrave; như hiện n&agrave;y cũng khiến người đẹp họ Phạm trở n&ecirc;n k&eacute;m quyến rũ.</p>\r\n\r\n<p>C&ugrave;ng nh&igrave;n lại h&agrave;nh tr&igrave;nh h&oacute;a thi&ecirc;n nga của Phạm Băng Băng:</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 2\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-bujmtoc10_zkmm.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Phạm Băng Băng đ&aacute;ng y&ecirc;u ng&agrave;y b&eacute;</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 3\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-uswctoc11_kwbp.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Một Phạm Băng Băng mũm mĩm v&agrave; kh&ocirc;ng hề bắt mắt</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 4\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-kzwztoc13_npcu.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Nữ diễn vi&ecirc;n họ Phạm ng&agrave;y c&ograve;n c&oacute; sở hữu l&agrave;n da đen nhẻm, ăn mặc kh&ocirc;ng thời trang</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 5\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-dwkptoc5_dbgm.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Lỗi trang điểm khiến Phạm Băng Băng k&eacute;m quyến rũ</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 6\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-glcrtoc6_sujo.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Nhan sắc sinh năm 1983 được khen ngợi c&oacute; đ&ocirc;i mắt đẹp</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 7\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-jauttoc7_ujpo.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 8\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-cxiktoc8_rpry.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 9\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-sfigtoc9_yrrg.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Nh&iacute; nhảnh với vai diễn Kim Tỏa trong phim Tiểu Yến Tử</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 10\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-uuahtoc2_qadl.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Phạm Băng Băng c&oacute; khu&ocirc;n mặt &quot;n&eacute;t n&agrave;o ra n&eacute;t đấy&quot;</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 11\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-oroytoc12_mhyb.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 12\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-hocptoc14_qepx.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">Sau thời gian hoạt động trong l&agrave;ng giải tr&iacute;, Phạm Băng Băng ng&agrave;y c&agrave;ng đẹp v&agrave; lu&ocirc;n chỉn chu cho vẻ bề ngo&agrave;i</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 13\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-gohwtoc4_dfyd.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 14\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-zluntoc15_xzwh.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div style=\"font-family: Arial, Helvetica, sans-serif; font-size: 12px; text-align: center;\">Kh&ocirc;ng phải l&agrave; người mẫu chuy&ecirc;n nghiệp song Phạm Băng Băng nhận được nhiều lời mời chụp ảnh v&agrave; quảng c&aacute;o</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 15\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-hceftoc1_shor.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-family:arial,helvetica,sans-serif; font-size:0.9em\">Tạo h&igrave;nh n&oacute;ng bỏng trong phim</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 16\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-rhnltoc16_lptv.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p><img alt=\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 17\" class=\"news-image\" src=\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-leabtoc17_ftwl.jpg\" style=\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\" /></p>\r\n\r\n<p style=\"text-align:center\">C&aacute;i t&ecirc;n Phạm Băng Băng đang rất &quot;n&oacute;ng&quot; v&igrave; tạo h&igrave;nh tuyệt đẹp trong bộ phim &quot;V&otilde; Tắc Thi&ecirc;n truyền kỳ&quot;</p>\r\n</div>\r\n',1,'2.jpg',3,'Nguyễn Đăng Hùng','2015-01-10 09:25:02','2015-01-10 09:25:09');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_categories`
--

DROP TABLE IF EXISTS `articles_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_categories` (
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_categories`
--

LOCK TABLES `articles_categories` WRITE;
/*!40000 ALTER TABLE `articles_categories` DISABLE KEYS */;
INSERT INTO `articles_categories` VALUES (1,1),(1,2),(2,2);
/*!40000 ALTER TABLE `articles_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogger_levels`
--

DROP TABLE IF EXISTS `blogger_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogger_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogger_levels`
--

LOCK TABLES `blogger_levels` WRITE;
/*!40000 ALTER TABLE `blogger_levels` DISABLE KEYS */;
INSERT INTO `blogger_levels` VALUES (1,'Sơ cấp','avatar3.jpg',50,'2015-01-08 04:57:35','2015-01-08 04:57:35');
/*!40000 ALTER TABLE `blogger_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloggers`
--

DROP TABLE IF EXISTS `bloggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blogger_level_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_bloggers_on_email` (`email`),
  UNIQUE KEY `index_bloggers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloggers`
--

LOCK TABLES `bloggers` WRITE;
/*!40000 ALTER TABLE `bloggers` DISABLE KEYS */;
INSERT INTO `bloggers` VALUES (1,'thong93@gmail.com','$2a$10$DocLRjOiLOzYiu2b6c5kkOuN0xfHMwHbdJlxI392pftmYZPWKIsEu',NULL,NULL,NULL,3,'2015-01-08 10:39:09','2015-01-08 09:13:49','127.0.0.1','127.0.0.1','Nguyễn Hữu','Thông','2015-01-23 00:00:00','0984592364','hà nội','Nam','avatar.png',NULL,1,1,'2015-01-08 04:58:13','2015-01-08 16:09:45'),(2,'tabi@gmail.com','$2a$10$P24BPKS3CPs1YoRgXWNV3eTXz2Dw1Lso5lkwi4cosouOwjZmxa7hW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Tabi','Choi','2015-01-24 00:00:00','asd','asd','Nam',NULL,NULL,1,1,'2015-01-08 16:10:43','2015-01-08 16:12:52');
/*!40000 ALTER TABLE `bloggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blogger_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Thế Giới','2015-01-08 04:56:21','2015-01-10 08:53:02'),(2,'Giải Trí','2015-01-08 04:56:47','2015-01-08 04:56:47'),(3,'Tài Chính','2015-01-10 08:54:04','2015-01-10 08:54:04'),(4,'Giáo Dục','2015-01-10 09:12:20','2015-01-10 09:12:20'),(5,'Khoa Học','2015-01-10 09:12:42','2015-01-10 09:12:42'),(6,'Đời Sống','2015-01-10 09:13:03','2015-01-10 09:13:03'),(7,'Quốc Tế','2015-01-10 09:14:07','2015-01-10 09:14:07');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `permission_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super admin','2015-01-08 04:34:48','2015-01-08 04:34:48');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141101035728'),('20141116092616'),('20141116093146'),('20141116095141'),('20141206135148'),('20141208142839'),('20141208144346'),('20141209103215'),('20141211043005'),('20141211190222'),('20141216203503'),('20141218134438'),('20141218140028'),('20150101132650'),('20150101132741'),('20150101145406'),('20150101182448'),('20150106145658'),('20150106153645'),('20150107161138');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Loại',-1,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(2,'Chờ duyệt',0,'2015-01-08 04:34:44','2015-01-08 04:34:44'),(3,'Duyệt',1,'2015-01-08 04:34:44','2015-01-08 04:34:44');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `whodunnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,'Article',1,'create','1',NULL,'2015-01-08 04:57:09'),(2,'Article',1,'update','1','---\nid: 1\ntitle: \"ádasd\"\ndescription: \"ádasd\"\ncontent: \"<p>đ&acirc;sdasdasd</p>\\r\\n\"\nadmin_user_id: 1\nimage: avatar.png\nstatus_id: 2\nauthor: \"ádasdas\"\ncreated_at: 2015-01-08 04:57:09.000000000 Z\nupdated_at: 2015-01-08 04:57:09.000000000 Z\n','2015-01-08 16:25:13'),(3,'Article',1,'update','1','---\nid: 1\ntitle: \"ádasd\"\ndescription: \"ádasd\"\ncontent: \"<p>đ&acirc;sdasdasd</p>\\r\\n\"\nadmin_user_id: 1\nimage: !ruby/object:ImageUploader\n  model: !ruby/object:Article\n    attributes:\n      id: 1\n      title: Ngây ngất trước vòng 1 căng tròn bên smartphone\n      description: Ngây ngất trước vòng 1 căng tròn bên smartphone\n      content: \"<p>đ&acirc;sdasdasd</p>\\r\\n\"\n      admin_user_id: 1\n      image: 1420797643-1177627.jpg\n      status_id: 3\n      author: Nguyễn Đăng Hùng\n      created_at: &1 2015-01-08 04:57:09.000000000 Z\n      updated_at: &2 2015-01-10 09:19:15.494371000 Z\n  mounted_as: :image\n  storage: &3 !ruby/object:CarrierWave::Storage::File\n    uploader: !ruby/object:ImageUploader\n      model: !ruby/object:Article\n        attributes:\n          id: 1\n          title: Ngây ngất trước vòng 1 căng tròn bên smartphone\n          description: Ngây ngất trước vòng 1 căng tròn bên smartphone\n          content: \"<p>đ&acirc;sdasdasd</p>\\r\\n\"\n          admin_user_id: 1\n          image: 1420797643-1177627.jpg\n          status_id: 3\n          author: Nguyễn Đăng Hùng\n          created_at: *1\n          updated_at: *2\n      mounted_as: :image\n      storage: *3\n      file: !ruby/object:CarrierWave::SanitizedFile\n        file: F:/Git Hub/Projects/ISDProject/public/uploads/tmp/1420881555-5728-6947/1420797643-1177627.jpg\n        original_filename: \n        content_type: image/jpeg\n      versions: &4 {}\n      cache_id: 1420881555-5728-6947\n      filename: 1420797643-1177627.jpg\n      original_filename: 1420797643-1177627.jpg\n  file: !ruby/object:CarrierWave::SanitizedFile\n    file: F:/Git Hub/Projects/ISDProject/public/uploads/article/image/1/avatar.png\n    original_filename: \n    content_type: \n  versions: *4\nstatus_id: 3\nauthor: \"ádasdas\"\ncreated_at: *1\nupdated_at: 2015-01-08 16:25:13.000000000 Z\n','2015-01-10 09:19:15'),(4,'Article',2,'create','1',NULL,'2015-01-10 09:25:03'),(5,'Article',2,'update','1','---\nid: 2\ntitle: \"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?\"\ndescription: Cùng xem hành trình lột xác đầy ngỡ ngàng của \"Võ Tắc Thiên\" Phạm Băng\n  Băng.\ncontent: \"<div class=\\\"text-conent\\\" style=\\\"font-family: Arial, Helvetica, sans-serif;\n  font-size: 12px; text-align: justify; color: rgb(0, 0, 0); font-style: normal; font-variant:\n  normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans:\n  auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing:\n  0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\\\">\\r\\n<p>C&aacute;i\n  t&ecirc;n Phạm Băng Băng hiện đang rất &quot;hot&quot; sau m&agrave;n h&oacute;a\n  th&acirc;n th&agrave;nh nh&acirc;n vật V&otilde; Tắc Thi&ecirc;n. Chưa b&agrave;n\n  đến vấn đề diễn xuất, tạo h&igrave;nh của nhan sắc 33 tuổi trong bộ phim n&agrave;y\n  khiến người xem ng&acirc;y ngất v&igrave; qu&aacute; xinh đẹp. Kh&ocirc;ng chỉ thế,\n  những trang phục sử dụng cũng đầy gợi cảm t&ocirc;n vinh hết mực v&ograve;ng 1 của\n  Phạm Băng Băng c&ugrave;ng d&agrave;n diễn vi&ecirc;n nữ.</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ\n  Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 1\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-cveftoc18_vwqi.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Phạm Băng Băng xinh đẹp v&agrave; quyến\n  rũ trong tạo h&igrave;nh V&otilde; Tắc Thi&ecirc;n</p>\\r\\n\\r\\n<p>Để trở th&agrave;nh\n  một trong những hoa đ&aacute;n xinh đẹp bậc nhất l&agrave;ng giải tr&iacute; Trung\n  Quốc, Phạm Băng Băng cũng từng trải qua thời kỳ c&oacute; phần qu&ecirc; m&ugrave;a\n  v&agrave; kh&ocirc;ng được bắt mắt.</p>\\r\\n\\r\\n<p>Thời đ&oacute;, ngo&agrave;i việc\n  hạn chế trong gu thẩm mỹ, trang điểm, l&agrave;n da kh&ocirc;ng được trắng ngọc\n  trắng ng&agrave; như hiện n&agrave;y cũng khiến người đẹp họ Phạm trở n&ecirc;n\n  k&eacute;m quyến rũ.</p>\\r\\n\\r\\n<p>C&ugrave;ng nh&igrave;n lại h&agrave;nh tr&igrave;nh\n  h&oacute;a thi&ecirc;n nga của Phạm Băng Băng:</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc\n  Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 2\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-bujmtoc10_zkmm.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Phạm Băng Băng đ&aacute;ng y&ecirc;u\n  ng&agrave;y b&eacute;</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã\n  hóa thiên nga thế nào? - 3\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-uswctoc11_kwbp.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Một Phạm Băng Băng mũm mĩm v&agrave;\n  kh&ocirc;ng hề bắt mắt</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã\n  hóa thiên nga thế nào? - 4\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-kzwztoc13_npcu.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Nữ diễn vi&ecirc;n họ Phạm ng&agrave;y\n  c&ograve;n c&oacute; sở hữu l&agrave;n da đen nhẻm, ăn mặc kh&ocirc;ng thời trang</p>\\r\\n\\r\\n<p><img\n  alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 5\\\" class=\\\"news-image\\\"\n  src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-dwkptoc5_dbgm.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Lỗi trang điểm khiến Phạm Băng Băng\n  k&eacute;m quyến rũ</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa\n  thiên nga thế nào? - 6\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874761-glcrtoc6_sujo.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Nhan sắc sinh năm 1983 được khen ngợi\n  c&oacute; đ&ocirc;i mắt đẹp</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng\n  đã hóa thiên nga thế nào? - 7\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-jauttoc7_ujpo.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?\n  - 8\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-cxiktoc8_rpry.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?\n  - 9\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-sfigtoc9_yrrg.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Nh&iacute; nhảnh với vai diễn Kim Tỏa\n  trong phim Tiểu Yến Tử</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã\n  hóa thiên nga thế nào? - 10\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-uuahtoc2_qadl.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Phạm Băng Băng c&oacute; khu&ocirc;n\n  mặt &quot;n&eacute;t n&agrave;o ra n&eacute;t đấy&quot;</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ\n  Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 11\\\" class=\\\"news-image\\\"\n  src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-oroytoc12_mhyb.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?\n  - 12\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-hocptoc14_qepx.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">Sau thời gian hoạt động trong l&agrave;ng\n  giải tr&iacute;, Phạm Băng Băng ng&agrave;y c&agrave;ng đẹp v&agrave; lu&ocirc;n\n  chỉn chu cho vẻ bề ngo&agrave;i</p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng\n  Băng đã hóa thiên nga thế nào? - 13\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874762-gohwtoc4_dfyd.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?\n  - 14\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-zluntoc15_xzwh.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<div style=\\\"font-family: Arial, Helvetica, sans-serif;\n  font-size: 12px; text-align: center;\\\">Kh&ocirc;ng phải l&agrave; người mẫu chuy&ecirc;n\n  nghiệp song Phạm Băng Băng nhận được nhiều lời mời chụp ảnh v&agrave; quảng c&aacute;o</div>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p><img\n  alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 15\\\" class=\\\"news-image\\\"\n  src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-hceftoc1_shor.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\"><span style=\\\"font-family:arial,helvetica,sans-serif;\n  font-size:0.9em\\\">Tạo h&igrave;nh n&oacute;ng bỏng trong phim</span></p>\\r\\n\\r\\n<p>&nbsp;</p>\\r\\n\\r\\n<p><img\n  alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào? - 16\\\" class=\\\"news-image\\\"\n  src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-rhnltoc16_lptv.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p><img alt=\\\"“Võ Tắc Thiên” Phạm Băng Băng đã hóa thiên nga thế nào?\n  - 17\\\" class=\\\"news-image\\\" src=\\\"http://24h-img.24hstatic.com/upload/1-2015/images/2015-01-10/1420874763-leabtoc17_ftwl.jpg\\\"\n  style=\\\"border:0px; font-family:arial,helvetica,sans-serif; font-size:12px; max-width:400px\\\"\n  /></p>\\r\\n\\r\\n<p style=\\\"text-align:center\\\">C&aacute;i t&ecirc;n Phạm Băng Băng\n  đang rất &quot;n&oacute;ng&quot; v&igrave; tạo h&igrave;nh tuyệt đẹp trong bộ phim\n  &quot;V&otilde; Tắc Thi&ecirc;n truyền kỳ&quot;</p>\\r\\n</div>\\r\\n\"\nadmin_user_id: 1\nimage: 2.jpg\nstatus_id: 2\nauthor: Nguyễn Đăng Hùng\ncreated_at: 2015-01-10 09:25:02.000000000 Z\nupdated_at: 2015-01-10 09:25:02.000000000 Z\n','2015-01-10 09:25:09');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views_statistics`
--

DROP TABLE IF EXISTS `views_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `views` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views_statistics`
--

LOCK TABLES `views_statistics` WRITE;
/*!40000 ALTER TABLE `views_statistics` DISABLE KEYS */;
INSERT INTO `views_statistics` VALUES (1,1,1,NULL,'2015-01-08 16:25:40','2015-01-08 16:25:40'),(2,1,1,NULL,'2015-01-10 09:21:02','2015-01-10 09:21:02'),(3,1,2,NULL,'2015-01-10 09:25:23','2015-01-10 09:25:23');
/*!40000 ALTER TABLE `views_statistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-10 17:54:17
