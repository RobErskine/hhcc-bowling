# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.28)
# Database: hhcc-bowling
# Generation Time: 2014-03-06 18:22:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table craft_assetfiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfiles`;

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` smallint(6) unsigned DEFAULT NULL,
  `height` smallint(6) unsigned DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_assetfolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfolders`;

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `fullPath`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'User Photos','','2014-03-06 17:02:02','2014-03-06 17:02:02','aa2e9e09-e4dc-4d20-b766-46736565cfc5');

/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_assetsources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetsources`;

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;

INSERT INTO `craft_assetsources` (`id`, `name`, `type`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User Photos','Local','{\"path\":\"{fileSystemPath}user-photos\\/\",\"url\":\"{siteUrl}images\\/user-photos\\/\"}',1,'2014-03-06 17:02:02','2014-03-06 17:02:02','4db13e95-1a4f-4c55-abd3-2db40bc150ec');

/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) NOT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_heading` text COLLATE utf8_unicode_ci,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_firstName` text COLLATE utf8_unicode_ci,
  `field_lastName` text COLLATE utf8_unicode_ci,
  `field_teamName` text COLLATE utf8_unicode_ci,
  `field_teamDivision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_teamColor` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_heading`, `field_body`, `field_firstName`, `field_lastName`, `field_teamName`, `field_teamDivision`, `field_teamColor`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en_us',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-03-06 16:47:27','2014-03-06 16:47:27','d03c1889-7d6f-4895-b0e5-92b455e925e1'),
	(2,2,'en_us','Homepage','Welcome to Hhcc-bowling.dev!','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Hhcc-bowling.dev will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,NULL,'2014-03-06 16:47:28','2014-03-06 16:47:28','5f49dd14-e7cc-4ae2-9469-7fb743bdd487'),
	(4,4,'en_us','Marco Bowlo',NULL,NULL,NULL,NULL,'','state','#404040','2014-03-06 17:19:21','2014-03-06 17:34:00','d2f2df2e-45f1-4c7f-b86b-fa1729a38c13'),
	(5,5,'en_us','TSUNAMIS',NULL,NULL,NULL,NULL,'','state','#3e83e9','2014-03-06 17:21:43','2014-03-06 17:21:43','8a0f1645-757e-44e1-a9a0-8557193349d8'),
	(6,6,'en_us','Head of Beyonce, Krishna?',NULL,NULL,NULL,NULL,'','state','#c74528','2014-03-06 17:22:21','2014-03-06 17:22:21','d4f364d7-dc1e-426b-991b-3f92f861919c'),
	(7,7,'en_us','John Daniels',NULL,NULL,'John','Daniels',NULL,NULL,NULL,'2014-03-06 17:25:40','2014-03-06 17:25:40','ec716bf1-ebaf-442a-80a3-69fc71a59424'),
	(8,8,'en_us','Jack Loftus',NULL,NULL,'Jack','Loftus',NULL,NULL,NULL,'2014-03-06 17:25:59','2014-03-06 17:25:59','33b4ebb3-2f2e-4761-9a08-5b6b82cac306'),
	(9,9,'en_us','Rachel MacCabe',NULL,NULL,'Rachel','MacCabe',NULL,NULL,NULL,'2014-03-06 17:26:12','2014-03-06 17:26:12','737698e1-6d55-44d9-b58c-e260db868d81'),
	(10,10,'en_us','Mark Wilkie',NULL,NULL,'Mark','Wilkie',NULL,NULL,NULL,'2014-03-06 17:26:24','2014-03-06 17:26:24','055cb858-ee1a-4391-a772-0206d206b92f'),
	(11,11,'en_us','Amber Richardson',NULL,NULL,'Amber ','Richardson',NULL,NULL,NULL,'2014-03-06 17:26:41','2014-03-06 17:26:41','a2dd3732-a652-4ff5-ac97-bea2c38e9ae5'),
	(12,12,'en_us','Mike Schilling',NULL,NULL,'Mike','Schilling',NULL,NULL,NULL,'2014-03-06 17:26:55','2014-03-06 17:26:55','e95f77e7-7c93-40bf-bc19-9f8d993a483f');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_idx` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User',1,0,'2014-03-06 16:47:27','2014-03-06 16:47:27','a0242331-a984-4f54-b6df-bcf57d3566fc'),
	(2,'Entry',1,0,'2014-03-06 16:47:28','2014-03-06 16:47:28','4511fe99-b923-44e6-b842-5ef052a1b611'),
	(4,'Entry',1,0,'2014-03-06 17:19:21','2014-03-06 17:34:00','fd2f8c22-7d7d-4bc5-b509-fbeb79f30884'),
	(5,'Entry',1,0,'2014-03-06 17:21:42','2014-03-06 17:21:42','8368f3d9-f5d1-4b40-8cc6-85ef21d01d57'),
	(6,'Entry',1,0,'2014-03-06 17:22:21','2014-03-06 17:22:21','96d3ce27-1b00-46c7-aff8-74f3ed0ab057'),
	(7,'Entry',1,0,'2014-03-06 17:25:40','2014-03-06 17:25:40','19475410-1517-4a39-b0ac-8cac59990e3e'),
	(8,'Entry',1,0,'2014-03-06 17:25:59','2014-03-06 17:25:59','b59dfa9b-0391-4b17-b66f-b22576450d5b'),
	(9,'Entry',1,0,'2014-03-06 17:26:12','2014-03-06 17:26:12','0e6e500c-ef1d-429c-9775-d3481a5af596'),
	(10,'Entry',1,0,'2014-03-06 17:26:24','2014-03-06 17:26:24','d8f4f929-e625-498f-87a3-53bd9a0fe361'),
	(11,'Entry',1,0,'2014-03-06 17:26:40','2014-03-06 17:26:40','0fb87461-a3b1-4bf7-b942-5dd6f349437d'),
	(12,'Entry',1,0,'2014-03-06 17:26:55','2014-03-06 17:26:55','39cb9055-b052-4768-993e-158400dec872');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_elements_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_i18n`;

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `uri`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,'en_us','__home__','2014-03-06 16:47:28','2014-03-06 16:47:28','b6af7328-f41e-4600-9ce3-0112207f4249'),
	(3,1,'en_us',NULL,'2014-03-06 16:50:15','2014-03-06 16:50:15','487956eb-1b84-4d45-987a-a8de3faba050'),
	(4,4,'en_us','teams/marco-bowlo','2014-03-06 17:19:21','2014-03-06 17:34:00','9572849a-88b6-41a3-98dd-9d6fe4051966'),
	(5,5,'en_us','teams/tsunamis','2014-03-06 17:21:43','2014-03-06 17:21:43','5693337f-dbad-4130-9767-9c011328f38a'),
	(6,6,'en_us','teams/head-of-beyonce-krishna','2014-03-06 17:22:21','2014-03-06 17:22:21','225c4249-9425-4fc7-ac4b-4ddf73b7233f'),
	(7,7,'en_us','bowler/john-daniels','2014-03-06 17:25:40','2014-03-06 17:25:40','d45f8171-fc15-488f-8d13-d00a3a339267'),
	(8,8,'en_us','bowler/jack-loftus','2014-03-06 17:25:59','2014-03-06 17:25:59','15145e81-675d-4d52-b13d-cc527143aac9'),
	(9,9,'en_us','bowler/rachel-maccabe','2014-03-06 17:26:12','2014-03-06 17:26:12','3e9fd1a2-ace6-48e2-8706-7c3d48c34bc0'),
	(10,10,'en_us','bowler/mark-wilkie','2014-03-06 17:26:24','2014-03-06 17:26:24','15d3e04d-02ac-4405-b82a-91bd6babf77c'),
	(11,11,'en_us','bowler/amber-richardson','2014-03-06 17:26:41','2014-03-06 17:26:41','3939ce2f-6769-4324-9817-d02bdd05ab7d'),
	(12,12,'en_us','bowler/mike-schilling','2014-03-06 17:26:55','2014-03-06 17:26:55','0e2f7871-8bc1-4ddb-87ef-8b5536e0ae54');

/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_emailmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_emailmessages`;

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `root` int(10) DEFAULT NULL,
  `lft` int(10) unsigned DEFAULT NULL,
  `rgt` int(10) unsigned DEFAULT NULL,
  `depth` smallint(6) unsigned DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_root_idx` (`root`),
  KEY `craft_entries_lft_idx` (`lft`),
  KEY `craft_entries_rgt_idx` (`rgt`),
  KEY `craft_entries_depth_idx` (`depth`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `root`, `lft`, `rgt`, `depth`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,1,NULL,NULL,NULL,NULL,NULL,'2014-03-06 16:47:28',NULL,'2014-03-06 16:47:28','2014-03-06 16:47:28','e5ae4bbf-6d68-46e9-9592-9a6a7da2e810'),
	(4,3,3,1,NULL,NULL,NULL,NULL,'2014-03-06 17:19:00',NULL,'2014-03-06 17:19:21','2014-03-06 17:34:00','cfc2f9d7-ce7f-43a0-a4e3-7314ec90b590'),
	(5,3,3,1,NULL,NULL,NULL,NULL,'2014-03-06 17:21:42',NULL,'2014-03-06 17:21:43','2014-03-06 17:21:43','a81a8dda-753c-4038-93a1-0ebb40b1801f'),
	(6,3,3,1,NULL,NULL,NULL,NULL,'2014-03-06 17:22:21',NULL,'2014-03-06 17:22:21','2014-03-06 17:22:21','cb80c6b8-66dd-4b03-9ee5-be6ecec89adb'),
	(7,4,4,1,NULL,NULL,NULL,NULL,'2014-03-06 17:25:40',NULL,'2014-03-06 17:25:40','2014-03-06 17:25:40','65a048cb-1907-4a1f-b68f-d8aa2a906717'),
	(8,4,4,1,NULL,NULL,NULL,NULL,'2014-03-06 17:25:59',NULL,'2014-03-06 17:25:59','2014-03-06 17:25:59','718e48a7-f6e4-490b-9184-a11af089d8b5'),
	(9,4,4,1,NULL,NULL,NULL,NULL,'2014-03-06 17:26:12',NULL,'2014-03-06 17:26:12','2014-03-06 17:26:12','839c219b-ec91-4377-9a63-1f0d7a30df27'),
	(10,4,4,1,NULL,NULL,NULL,NULL,'2014-03-06 17:26:24',NULL,'2014-03-06 17:26:24','2014-03-06 17:26:24','735882cb-83b5-43cc-a299-8d8bfd0a2958'),
	(11,4,4,1,NULL,NULL,NULL,NULL,'2014-03-06 17:26:40',NULL,'2014-03-06 17:26:41','2014-03-06 17:26:41','36b50154-2e6a-4763-a49a-6e02d8369aa1'),
	(12,4,4,1,NULL,NULL,NULL,NULL,'2014-03-06 17:26:55',NULL,'2014-03-06 17:26:55','2014-03-06 17:26:55','4dc4d1e3-1673-4e42-b200-822b06704a7b');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entries_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries_i18n`;

CREATE TABLE `craft_entries_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entries_i18n_entryId_locale_unq_idx` (`entryId`,`locale`),
  UNIQUE KEY `craft_entries_i18n_slug_sectionId_locale_unq_idx` (`slug`,`sectionId`,`locale`),
  KEY `craft_entries_i18n_sectionId_fk` (`sectionId`),
  KEY `craft_entries_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_entries_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entries_i18n_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries_i18n` WRITE;
/*!40000 ALTER TABLE `craft_entries_i18n` DISABLE KEYS */;

INSERT INTO `craft_entries_i18n` (`id`, `entryId`, `sectionId`, `locale`, `slug`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,1,'en_us','homepage','2014-03-06 16:47:28','2014-03-06 16:47:28','be2c4c98-f791-4fd1-88bd-c4c99e14f68a'),
	(3,4,3,'en_us','marco-bowlo','2014-03-06 17:19:21','2014-03-06 17:34:00','21e76809-d5c6-4041-a336-09d45a187cda'),
	(4,5,3,'en_us','tsunamis','2014-03-06 17:21:43','2014-03-06 17:21:43','628f32e4-8339-4a11-941c-5b1b9a4c5979'),
	(5,6,3,'en_us','head-of-beyonce-krishna','2014-03-06 17:22:21','2014-03-06 17:22:21','85991d55-83ff-4e25-aadd-5e53f07a144a'),
	(6,7,4,'en_us','john-daniels','2014-03-06 17:25:40','2014-03-06 17:25:40','c815206c-7061-4e8f-b5d3-2fa816708e43'),
	(7,8,4,'en_us','jack-loftus','2014-03-06 17:25:59','2014-03-06 17:25:59','462123bd-6185-4b93-806c-29a8d9a43897'),
	(8,9,4,'en_us','rachel-maccabe','2014-03-06 17:26:12','2014-03-06 17:26:12','7808e4c5-7f27-4f0f-9568-7b49b25b29c4'),
	(9,10,4,'en_us','mark-wilkie','2014-03-06 17:26:24','2014-03-06 17:26:24','52a1e236-24be-4788-9b4c-22380dc3f773'),
	(10,11,4,'en_us','amber-richardson','2014-03-06 17:26:41','2014-03-06 17:26:41','696acb9b-35f5-429e-9087-c7bd1274420a'),
	(11,12,4,'en_us','mike-schilling','2014-03-06 17:26:55','2014-03-06 17:26:55','625bcdf9-e651-4107-a982-4a32553f2f98');

/*!40000 ALTER TABLE `craft_entries_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `titleLabel`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,3,'Homepage','homepage','Title',NULL,'2014-03-06 16:47:28','2014-03-06 16:47:28','00af75b6-4445-4506-901b-ca6d4fcf1f8e'),
	(3,3,10,'Teams','teams','Title',NULL,'2014-03-06 17:09:31','2014-03-06 17:24:42','8405a936-46c9-446c-aeeb-4f3ce5ea2544'),
	(4,4,8,'Bowler','bowler','Title',NULL,'2014-03-06 17:18:00','2014-03-06 17:18:14','213ae280-8d63-4254-a49d-c32174aa0007'),
	(5,5,11,'Week','week','Title',NULL,'2014-03-06 17:56:14','2014-03-06 17:56:14','d6b2d6db-174f-47ab-9899-cf123a790422');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,4,3,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Marco Bowlo\",\"slug\":\"marco-bowlo\",\"postDate\":1394126360,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":\"state\",\"9\":\"#404040\",\"7\":\"\"}}','2014-03-06 17:19:21','2014-03-06 17:19:21','50a73575-3ef0-4581-b12a-ee899598d452'),
	(2,5,3,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"TSUNAMIS\",\"slug\":\"tsunamis\",\"postDate\":1394126502,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":\"state\",\"9\":\"#3e83e9\",\"7\":\"\"}}','2014-03-06 17:21:43','2014-03-06 17:21:43','68acd825-0185-42a2-b34d-a098430211a9'),
	(3,6,3,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Head of Beyonce, Krishna?\",\"slug\":\"head-of-beyonce-krishna\",\"postDate\":1394126541,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"8\":\"state\",\"9\":\"#c74528\",\"7\":\"\"}}','2014-03-06 17:22:21','2014-03-06 17:22:21','b00fa2d7-6a7e-445a-9daf-1b66dd5b7111'),
	(4,7,4,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"John Daniels\",\"slug\":\"john-daniels\",\"postDate\":1394126740,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"John\",\"5\":\"Daniels\",\"6\":\"\"}}','2014-03-06 17:25:40','2014-03-06 17:25:40','a50ffdd7-51cb-4a7b-b645-70f94bb58f98'),
	(5,8,4,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Jack Loftus\",\"slug\":\"jack-loftus\",\"postDate\":1394126759,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"Jack\",\"5\":\"Loftus\",\"6\":\"\"}}','2014-03-06 17:25:59','2014-03-06 17:25:59','bb692a26-51b6-4abe-bd3b-192d19c16f58'),
	(6,9,4,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Rachel MacCabe\",\"slug\":\"rachel-maccabe\",\"postDate\":1394126772,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"Rachel\",\"5\":\"MacCabe\",\"6\":\"\"}}','2014-03-06 17:26:12','2014-03-06 17:26:12','2c0a7a77-23f9-4b5a-8c08-c4d4eef7672a'),
	(7,10,4,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Mark Wilkie\",\"slug\":\"mark-wilkie\",\"postDate\":1394126784,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"Mark\",\"5\":\"Wilkie\",\"6\":\"\"}}','2014-03-06 17:26:24','2014-03-06 17:26:24','91b5f151-a924-46a2-a997-fe3206433e17'),
	(8,11,4,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Amber Richardson\",\"slug\":\"amber-richardson\",\"postDate\":1394126800,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"Amber \",\"5\":\"Richardson\",\"6\":\"\"}}','2014-03-06 17:26:41','2014-03-06 17:26:41','6bf34f25-edef-4a5c-817c-2ee620d7c9ab'),
	(9,12,4,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Mike Schilling\",\"slug\":\"mike-schilling\",\"postDate\":1394126815,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"4\":\"Mike\",\"5\":\"Schilling\",\"6\":\"\"}}','2014-03-06 17:26:55','2014-03-06 17:26:55','d90edaaa-f403-47a2-bbf0-d79b4fa8d9bd'),
	(10,4,3,1,'en_us',NULL,'{\"authorId\":\"1\",\"title\":\"Marco Bowlo\",\"slug\":\"marco-bowlo\",\"postDate\":1394126340,\"expiryDate\":null,\"enabled\":1,\"fields\":{\"11\":[\"12\",\"11\",\"10\",\"9\",\"8\",\"7\"],\"8\":\"state\",\"9\":\"#404040\",\"7\":\"\"}}','2014-03-06 17:34:00','2014-03-06 17:34:00','0d566101-a6a9-404b-8ca4-8523a8e240ad');

/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','2014-03-06 16:47:28','2014-03-06 16:47:28','b474a219-8018-4296-b666-fff0fa56e510'),
	(2,'User Fields','2014-03-06 16:58:54','2014-03-06 16:58:54','013a1292-11d0-42c3-a021-5c7656ac76d2'),
	(3,'Team Fields','2014-03-06 17:05:30','2014-03-06 17:05:30','7156ecf7-f68f-4044-9c9f-ef4ee112f08a'),
	(4,'Week Fields','2014-03-06 17:56:24','2014-03-06 17:56:24','f1d76c82-b67c-47be-a2ab-702e107686ee');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,1,1,0,1,'2014-03-06 16:47:28','2014-03-06 16:47:28','7a605315-a26d-4618-b17e-07352c3a9eab'),
	(2,3,1,2,0,2,'2014-03-06 16:47:28','2014-03-06 16:47:28','c3f3f1e3-3a12-4193-bb63-298253fa1ff5'),
	(3,5,2,2,1,1,'2014-03-06 16:47:28','2014-03-06 16:47:28','6c18b24f-5adc-492b-afa2-8fcc3c0ca5a3'),
	(4,5,2,3,0,2,'2014-03-06 16:47:28','2014-03-06 16:47:28','87ca51dd-9949-4759-a282-ea084a6f63ea'),
	(5,8,3,4,0,1,'2014-03-06 17:18:14','2014-03-06 17:18:14','923a6c45-71d7-4d9f-b747-fab352a93b3f'),
	(6,8,3,5,0,2,'2014-03-06 17:18:14','2014-03-06 17:18:14','8fbb5019-aa91-41f6-a79a-c9cf8bcdcd71'),
	(8,8,3,6,0,4,'2014-03-06 17:18:14','2014-03-06 17:18:14','5b03cc26-272f-47a0-96a3-d46d246b0fc3'),
	(12,10,5,7,0,1,'2014-03-06 17:24:42','2014-03-06 17:24:42','cb06ab5f-ca96-4ff6-8a86-ab57d1f5a725'),
	(13,10,5,9,0,2,'2014-03-06 17:24:42','2014-03-06 17:24:42','45a12fb6-f6f3-4885-85bc-3211e36e14bb'),
	(14,10,5,8,0,3,'2014-03-06 17:24:42','2014-03-06 17:24:42','be132b94-b5d2-4ff8-b937-43126702a1ba'),
	(15,10,5,11,0,4,'2014-03-06 17:24:42','2014-03-06 17:24:42','9cb45e70-4284-4a09-86a3-7bc283990075');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Tag','2014-03-06 16:47:28','2014-03-06 16:47:28','551be273-92ba-437e-836c-c1ce85e6241d'),
	(3,'Entry','2014-03-06 16:47:28','2014-03-06 16:47:28','b44983f4-e817-48aa-b7fb-2b597e18e5ff'),
	(5,'Entry','2014-03-06 16:47:28','2014-03-06 16:47:28','36408159-b5b5-4960-acbf-f62591c9019d'),
	(8,'Entry','2014-03-06 17:18:14','2014-03-06 17:18:14','9ecf1352-328e-4257-9308-c10849961a06'),
	(10,'Entry','2014-03-06 17:24:42','2014-03-06 17:24:42','2956f67a-05b0-4047-80d9-05d7707bf26e'),
	(11,'Entry','2014-03-06 17:56:14','2014-03-06 17:56:14','ea53f760-78cc-47eb-8184-bc08aa0ff387');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,'Content',1,'2014-03-06 16:47:28','2014-03-06 16:47:28','6f8fbc21-e6d8-4c4d-bbb5-b0933093f2f2'),
	(2,5,'Content',1,'2014-03-06 16:47:28','2014-03-06 16:47:28','acf60733-f16a-4b6e-8b29-db8c6a52dfdf'),
	(3,8,'User Fields',1,'2014-03-06 17:18:14','2014-03-06 17:18:14','07c75899-d048-41c3-828f-e5a99c02d783'),
	(5,10,'Team Fields',1,'2014-03-06 17:24:42','2014-03-06 17:24:42','5c0a086f-4825-42aa-9f6c-0311df92af5b');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Heading','heading','global',NULL,1,'PlainText',NULL,'2014-03-06 16:47:28','2014-03-06 16:47:28','0f9c857f-4b8e-4a1f-9052-cbe80842fa3f'),
	(2,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\"}','2014-03-06 16:47:28','2014-03-06 16:47:28','7c99f17c-a67d-4067-8c8a-62317c46ae3a'),
	(3,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"tagset:1\"}','2014-03-06 16:47:28','2014-03-06 16:47:28','ca7a4cb7-ba95-421b-9129-185e473606e8'),
	(4,2,'First Name','firstName','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-03-06 16:59:40','2014-03-06 16:59:40','55250963-8f6c-4ba4-9616-ed0d8e8a860a'),
	(5,2,'Last Name','lastName','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-03-06 16:59:49','2014-03-06 16:59:49','569a36a5-e6e3-473b-9f58-486ff3aa2911'),
	(6,2,'User Photo','userPhoto','global','',0,'Assets','{\"sources\":\"*\",\"limit\":\"1\"}','2014-03-06 17:04:53','2014-03-06 17:04:53','a2c6cf47-243a-499d-984e-38ef18d2539a'),
	(7,3,'Team Name','teamName','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2014-03-06 17:05:42','2014-03-06 17:05:42','da7827e8-1f19-4522-8a8f-f2b1e524d031'),
	(8,3,'Division','teamDivision','global','',0,'RadioButtons','{\"options\":[{\"label\":\"State\",\"value\":\"state\",\"default\":\"1\"},{\"label\":\"Congress\",\"value\":\"congress\",\"default\":\"\"}]}','2014-03-06 17:06:12','2014-03-06 17:06:12','b53c61d1-94e4-4c72-8448-dd2d4fe5a7ab'),
	(9,3,'Team Color','teamColor','global','',0,'Color',NULL,'2014-03-06 17:10:16','2014-03-06 17:10:16','00080548-1b31-48cd-b53c-1843d8d12bba'),
	(11,3,'Bowlers','bowlers','global','',0,'Entries','{\"sources\":[\"section:4\"],\"limit\":\"6\"}','2014-03-06 17:24:23','2014-03-06 17:24:23','5765811f-b31b-4201-a075-444380669c69');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `build` int(11) unsigned NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `packages` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `releaseDate` datetime NOT NULL,
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `track` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `build`, `schemaVersion`, `packages`, `releaseDate`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `track`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'1.3',2496,'1.3.17','PublishPro','2014-02-27 22:37:08','Hhcc Bowling','http://hhcc-bowling.dev','UTC',1,0,'stable','2014-03-06 16:47:27','2014-03-06 17:09:18','e4b539c5-9c65-48e5-ab8e-eba4037d7906');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_locales`;

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	('en_us',1,'2014-03-06 16:47:27','2014-03-06 16:47:27','65ba29f1-3748-4bd8-884b-902e20effdfc');

/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'m000000_000000_base','2014-03-06 16:47:27','2014-03-06 16:47:27','2014-03-06 16:47:27','41102535-fb79-4a65-a36c-4eb494171fa3'),
	(2,NULL,'m131212_000001_add_missing_fk_to_emailmessages','2014-03-06 16:47:27','2014-03-06 16:47:27','2014-03-06 16:47:27','ae7c88a6-261d-46a2-b9f5-78c07f76bbf1'),
	(3,NULL,'m140123_000000_update_widget_sort_orders','2014-03-06 16:50:15','2014-03-06 16:50:15','2014-03-06 16:50:15','cd9a8bfb-19d9-4d8b-accc-3702cde3beed'),
	(4,NULL,'m140212_000000_clean_up_structures','2014-03-06 16:50:15','2014-03-06 16:50:15','2014-03-06 16:50:15','b473c277-2dfb-48de-ae19-5997e02f45a2'),
	(5,NULL,'m140223_000000_add_missing_element_rows','2014-03-06 16:50:15','2014-03-06 16:50:15','2014-03-06 16:50:15','e32834c1-2c76-4f86-95f7-6d5ddfab82fd');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_rackspaceaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_rackspaceaccess`;

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_targetId_unq_idx` (`fieldId`,`sourceId`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,11,4,12,1,'2014-03-06 17:34:00','2014-03-06 17:34:00','ed7cb984-11c6-4c58-8770-c367ce5f3b9d'),
	(2,11,4,11,2,'2014-03-06 17:34:00','2014-03-06 17:34:00','aabec5e0-c2ac-4eb5-ada3-ee51e65dd661'),
	(3,11,4,10,3,'2014-03-06 17:34:00','2014-03-06 17:34:00','2b69f745-2493-4ae6-9a9e-d75e117b6496'),
	(4,11,4,9,4,'2014-03-06 17:34:00','2014-03-06 17:34:00','e1ebadee-1101-4b71-b489-93b1a7f381b3'),
	(5,11,4,8,5,'2014-03-06 17:34:00','2014-03-06 17:34:00','9c591580-7ed4-4a00-8182-470ae57712cc'),
	(6,11,4,7,6,'2014-03-06 17:34:00','2014-03-06 17:34:00','e9d5cf05-ab4f-433b-a30f-e3c3b39b6967');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_routes`;

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`)
VALUES
	(1,'username',0,'en_us',' admin '),
	(1,'firstname',0,'en_us',''),
	(1,'lastname',0,'en_us',''),
	(1,'fullname',0,'en_us',''),
	(1,'email',0,'en_us',' rob roberskine com '),
	(2,'slug',0,'en_us',' homepage '),
	(2,'title',0,'en_us',' homepage '),
	(2,'field',2,'en_us',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon hhcc bowling dev will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
	(2,'field',1,'en_us',' welcome to hhcc bowling dev '),
	(2,'field',3,'en_us',''),
	(3,'slug',0,'en_us',' we just installed craft '),
	(3,'title',0,'en_us',' we just installed craft '),
	(3,'field',2,'en_us',' craft is the cms that s powering hhcc bowling dev it s beautiful powerful flexible and easy to use and it s made by pixel tonic we can t wait to dive in and see what it s capable of this is even more captivating content which you couldn t see on the news index page because it was entered after a page break and the news index template only likes to show the content on the first page craft a nice alternative to word if you re making a website '),
	(3,'field',1,'en_us',''),
	(3,'field',3,'en_us',''),
	(4,'slug',0,'en_us',' marco bowlo '),
	(4,'title',0,'en_us',' marco bowlo '),
	(4,'field',2,'en_us',''),
	(4,'field',8,'en_us',' state '),
	(4,'field',4,'en_us',''),
	(4,'field',1,'en_us',''),
	(4,'field',5,'en_us',''),
	(4,'field',3,'en_us',''),
	(4,'field',10,'en_us',''),
	(4,'field',9,'en_us',' 404040 '),
	(4,'field',7,'en_us',''),
	(4,'field',6,'en_us',''),
	(5,'slug',0,'en_us',' tsunamis '),
	(5,'title',0,'en_us',' tsunamis '),
	(5,'field',2,'en_us',''),
	(5,'field',8,'en_us',' state '),
	(5,'field',4,'en_us',''),
	(5,'field',1,'en_us',''),
	(5,'field',5,'en_us',''),
	(5,'field',3,'en_us',''),
	(5,'field',10,'en_us',''),
	(5,'field',9,'en_us',' 3e83e9 '),
	(5,'field',7,'en_us',''),
	(5,'field',6,'en_us',''),
	(6,'slug',0,'en_us',' head of beyonce krishna '),
	(6,'title',0,'en_us',' head of beyonce krishna '),
	(6,'field',2,'en_us',''),
	(6,'field',8,'en_us',' state '),
	(6,'field',4,'en_us',''),
	(6,'field',1,'en_us',''),
	(6,'field',5,'en_us',''),
	(6,'field',3,'en_us',''),
	(6,'field',10,'en_us',''),
	(6,'field',9,'en_us',' c74528 '),
	(6,'field',7,'en_us',''),
	(6,'field',6,'en_us',''),
	(7,'slug',0,'en_us',' john daniels '),
	(7,'title',0,'en_us',' john daniels '),
	(7,'field',2,'en_us',''),
	(7,'field',11,'en_us',''),
	(7,'field',8,'en_us',''),
	(7,'field',4,'en_us',' john '),
	(7,'field',1,'en_us',''),
	(7,'field',5,'en_us',' daniels '),
	(7,'field',3,'en_us',''),
	(7,'field',9,'en_us',''),
	(7,'field',7,'en_us',''),
	(7,'field',6,'en_us',''),
	(8,'slug',0,'en_us',' jack loftus '),
	(8,'title',0,'en_us',' jack loftus '),
	(8,'field',2,'en_us',''),
	(8,'field',11,'en_us',''),
	(8,'field',8,'en_us',''),
	(8,'field',4,'en_us',' jack '),
	(8,'field',1,'en_us',''),
	(8,'field',5,'en_us',' loftus '),
	(8,'field',3,'en_us',''),
	(8,'field',9,'en_us',''),
	(8,'field',7,'en_us',''),
	(8,'field',6,'en_us',''),
	(9,'slug',0,'en_us',' rachel maccabe '),
	(9,'title',0,'en_us',' rachel maccabe '),
	(9,'field',2,'en_us',''),
	(9,'field',11,'en_us',''),
	(9,'field',8,'en_us',''),
	(9,'field',4,'en_us',' rachel '),
	(9,'field',1,'en_us',''),
	(9,'field',5,'en_us',' maccabe '),
	(9,'field',3,'en_us',''),
	(9,'field',9,'en_us',''),
	(9,'field',7,'en_us',''),
	(9,'field',6,'en_us',''),
	(10,'slug',0,'en_us',' mark wilkie '),
	(10,'title',0,'en_us',' mark wilkie '),
	(10,'field',2,'en_us',''),
	(10,'field',11,'en_us',''),
	(10,'field',8,'en_us',''),
	(10,'field',4,'en_us',' mark '),
	(10,'field',1,'en_us',''),
	(10,'field',5,'en_us',' wilkie '),
	(10,'field',3,'en_us',''),
	(10,'field',9,'en_us',''),
	(10,'field',7,'en_us',''),
	(10,'field',6,'en_us',''),
	(11,'slug',0,'en_us',' amber richardson '),
	(11,'title',0,'en_us',' amber richardson '),
	(11,'field',2,'en_us',''),
	(11,'field',11,'en_us',''),
	(11,'field',8,'en_us',''),
	(11,'field',4,'en_us',' amber '),
	(11,'field',1,'en_us',''),
	(11,'field',5,'en_us',' richardson '),
	(11,'field',3,'en_us',''),
	(11,'field',9,'en_us',''),
	(11,'field',7,'en_us',''),
	(11,'field',6,'en_us',''),
	(12,'slug',0,'en_us',' mike schilling '),
	(12,'title',0,'en_us',' mike schilling '),
	(12,'field',2,'en_us',''),
	(12,'field',11,'en_us',''),
	(12,'field',8,'en_us',''),
	(12,'field',4,'en_us',' mike '),
	(12,'field',1,'en_us',''),
	(12,'field',5,'en_us',' schilling '),
	(12,'field',3,'en_us',''),
	(12,'field',9,'en_us',''),
	(12,'field',7,'en_us',''),
	(12,'field',6,'en_us',''),
	(4,'field',11,'en_us',' mike schilling amber richardson mark wilkie rachel maccabe jack loftus john daniels ');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maxDepth` int(10) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `name`, `handle`, `type`, `hasUrls`, `template`, `maxDepth`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Homepage','homepage','single',1,'index',NULL,'2014-03-06 16:47:28','2014-03-06 16:47:28','443c643c-7622-45a4-baf8-0573fefb43b5'),
	(3,'Teams','teams','channel',1,'teams/_entry',NULL,'2014-03-06 17:09:31','2014-03-06 17:09:31','8269c75f-1e7e-459d-985b-e1d0adfa4973'),
	(4,'Bowler','bowler','channel',1,'bowler/_entry',NULL,'2014-03-06 17:18:00','2014-03-06 17:18:00','5c87abfa-6d20-4182-9795-7956cf2513d0'),
	(5,'Week','week','channel',1,'week/_entry',NULL,'2014-03-06 17:56:14','2014-03-06 17:56:14','3045820e-ce9f-4b99-8dcf-f76e4f95ccc5');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sections_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_i18n`;

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nestedUrlFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'en_us','__home__',NULL,'2014-03-06 16:47:28','2014-03-06 16:47:28','528b91b9-643c-4a66-86fb-273cb99b8140'),
	(3,3,'en_us','teams/{slug}',NULL,'2014-03-06 17:09:31','2014-03-06 17:09:31','e4119f08-6742-49cf-9cd4-fc41fba1636f'),
	(4,4,'en_us','bowler/{slug}',NULL,'2014-03-06 17:18:00','2014-03-06 17:18:00','262aae07-cf2f-4924-94a9-ea7d9eab4a2f'),
	(5,5,'en_us','week/{slug}',NULL,'2014-03-06 17:56:14','2014-03-06 17:56:14','afb1b99b-de4e-4768-9e8f-52b67468fc2a');

/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'a415f4508f131c6bba70d66018528e690abe0c9cczozNjoiNTkyOWNjODAtZDE3Ny00YzA2LThhYzgtMGNmMjBiYzI4MWRjIjs=','2014-03-06 16:47:28','2014-03-06 16:47:28','9542be15-d3c4-470b-8c1d-30a62208c820');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemsettings`;

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"rob@roberskine.com\",\"senderName\":\"Hhcc Bowling\"}','2014-03-06 16:47:28','2014-03-06 16:47:28','e30455a9-23c7-415d-a155-88c5553b311f');

/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `setId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tags_setId_name_unq_idx` (`setId`,`name`),
  CONSTRAINT `craft_tags_setId_fk` FOREIGN KEY (`setId`) REFERENCES `craft_tagsets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_tagsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tagsets`;

CREATE TABLE `craft_tagsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tagsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_tagsets_handle_unq_idx` (`handle`),
  KEY `craft_tagsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_tagsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_tagsets` WRITE;
/*!40000 ALTER TABLE `craft_tagsets` DISABLE KEYS */;

INSERT INTO `craft_tagsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','default',1,'2014-03-06 16:47:28','2014-03-06 16:47:28','834e281d-39c5-4d42-9a0f-22651dfcd921');

/*!40000 ALTER TABLE `craft_tagsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` enum('locked','suspended','pending','active','archived') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `admin`, `status`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'admin',NULL,NULL,NULL,'rob@roberskine.com','$2a$13$rEaQnoEvsSu5CLAxxr8HEOGmAO3jAMj9A0K3dExvyTeh/3/Y4FYdS',NULL,1,'active','2014-03-06 16:47:28','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,0,'2014-03-06 16:47:27','2014-03-06 16:47:27','2014-03-06 16:47:28','9df86332-9365-45d0-ac65-9e8ba7737dc9');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` tinyint(4) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'QuickPost',1,'{\"section\":\"2\"}',1,'2014-03-06 16:48:53','2014-03-06 16:48:53','9dcb2cb6-9655-4a25-97f5-e27f5b46d6e9'),
	(2,1,'RecentEntries',2,NULL,1,'2014-03-06 16:48:53','2014-03-06 16:48:53','2658c97a-2b88-440b-a531-f9acc811486f'),
	(3,1,'GetHelp',3,NULL,1,'2014-03-06 16:48:53','2014-03-06 16:48:53','4237196d-98bd-4382-a437-96d4b8d84812'),
	(4,1,'Updates',4,NULL,1,'2014-03-06 16:48:53','2014-03-06 16:48:53','2b3f2e1c-0ff8-462e-ade1-fb151c107ae6'),
	(5,1,'Feed',5,'{\"url\":\"http:\\/\\/feeds.feedburner.com\\/blogandtonic\",\"title\":\"Blog & Tonic\"}',1,'2014-03-06 16:48:53','2014-03-06 16:48:53','54311902-cc60-4d72-84b2-880023dd7bf7');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
