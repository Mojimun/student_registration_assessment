/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.33-0ubuntu0.20.04.4 : Database - user_registration_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`user_registration_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `user_registration_system`;

/*Table structure for table `active_storage_attachments` */

DROP TABLE IF EXISTS `active_storage_attachments`;

CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `active_storage_attachments` */

insert  into `active_storage_attachments`(`id`,`name`,`record_type`,`record_id`,`blob_id`,`created_at`) values 
(1,'avatar','User',2,1,'2023-09-13 06:49:14.392303'),
(2,'avatar','User',3,2,'2023-09-13 07:19:48.992165'),
(3,'avatar','User',4,3,'2023-09-13 07:21:51.450685'),
(4,'avatar','User',5,4,'2023-09-13 07:27:05.731085'),
(5,'avatar','User',6,5,'2023-09-13 07:33:48.035515'),
(6,'avatar','User',7,6,'2023-09-13 07:37:35.123852'),
(7,'avatar','User',8,7,'2023-09-13 07:44:31.952681'),
(8,'avatar','User',9,8,'2023-09-13 07:48:53.229012'),
(12,'avatar','User',13,12,'2023-09-13 10:24:47.838133'),
(13,'avatar','User',14,13,'2023-09-13 10:34:21.676311'),
(14,'avatar','User',15,14,'2023-09-13 10:50:28.201100'),
(15,'avatar','User',16,15,'2023-09-13 10:52:21.133783'),
(16,'avatar','User',17,16,'2023-09-13 10:54:26.875770'),
(17,'avatar','User',18,17,'2023-09-13 15:36:03.009842');

/*Table structure for table `active_storage_blobs` */

DROP TABLE IF EXISTS `active_storage_blobs`;

CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `active_storage_blobs` */

insert  into `active_storage_blobs`(`id`,`key`,`filename`,`content_type`,`metadata`,`service_name`,`byte_size`,`checksum`,`created_at`) values 
(1,'edla9oem5rwbdiw2u8u1xto0o6h6','MicrosoftTeams-image (1).png','image/png','{\"identified\":true,\"analyzed\":true}','local',66524,'rPKWrqaM6Yjem88x5Qtbvg==','2023-09-13 06:49:14.385002'),
(2,'5hwf7y3vjdoyrkswx0x9fchgrras','Image.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',34604,'rxON5ikIVVDj5Dng8npG4w==','2023-09-13 07:19:48.987794'),
(3,'52lz3b6zv9pkyc1a4sxx4ksqp9u7','Image.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',34604,'rxON5ikIVVDj5Dng8npG4w==','2023-09-13 07:21:51.446725'),
(4,'a1mxmjql82aqf3v9q8pmvuhyc36i','Image.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',34604,'rxON5ikIVVDj5Dng8npG4w==','2023-09-13 07:27:05.727030'),
(5,'3txp127y0k5b547rpm9tquw4v9ba','close.png','image/png','{\"identified\":true,\"analyzed\":true}','local',9732,'b7N0QSqVcVnflqj3BXxolg==','2023-09-13 07:33:48.032937'),
(6,'clqebis19i1kbt3dj6qlqbk7h7g3','check.png','image/png','{\"identified\":true,\"analyzed\":true}','local',7230,'4zebfk1NOGL0jxt0nDlkeQ==','2023-09-13 07:37:35.120695'),
(7,'9zo3p8eo4t944nrdzx6uk56230ti','icons8-user-64.png','image/png','{\"identified\":true,\"analyzed\":true}','local',1004,'WctC4CDjo5EnFkP9+Km2oQ==','2023-09-13 07:44:31.948307'),
(8,'7te1trjho7d7o5r73pu1l4pa3sda','close.png','image/png','{\"identified\":true,\"analyzed\":true}','local',9732,'b7N0QSqVcVnflqj3BXxolg==','2023-09-13 07:48:53.216387'),
(12,'rvhhqox2erlqhc6142a7jvvcecr4','close.png','image/png','{\"identified\":true,\"analyzed\":true}','local',9732,'b7N0QSqVcVnflqj3BXxolg==','2023-09-13 10:24:47.835402'),
(13,'5u6ouzil3960zoblgbaskqisdmq7','close.png','image/png','{\"identified\":true,\"analyzed\":true}','local',9732,'b7N0QSqVcVnflqj3BXxolg==','2023-09-13 10:34:21.673576'),
(14,'ur7xd6m21hgtm8t6fi6z0kmwwd6h','check.png','image/png','{\"identified\":true,\"analyzed\":true}','local',7230,'4zebfk1NOGL0jxt0nDlkeQ==','2023-09-13 10:50:28.198443'),
(15,'1uxheoqgh3j4wt0y3lt094kl6q5d','check.png','image/png','{\"identified\":true,\"analyzed\":true}','local',7230,'4zebfk1NOGL0jxt0nDlkeQ==','2023-09-13 10:52:21.131331'),
(16,'xmhyswy8dofzq0guw61dv3jq6i1d','close.png','image/png','{\"identified\":true,\"analyzed\":true}','local',9732,'b7N0QSqVcVnflqj3BXxolg==','2023-09-13 10:54:26.873236'),
(17,'rakf6xmmb5kvel346b6ntr38iwyp','close.png','image/png','{\"identified\":true,\"analyzed\":true}','local',9732,'b7N0QSqVcVnflqj3BXxolg==','2023-09-13 15:36:03.006073');

/*Table structure for table `active_storage_variant_records` */

DROP TABLE IF EXISTS `active_storage_variant_records`;

CREATE TABLE `active_storage_variant_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blob_id` bigint NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `active_storage_variant_records` */

/*Table structure for table `ar_internal_metadata` */

DROP TABLE IF EXISTS `ar_internal_metadata`;

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ar_internal_metadata` */

insert  into `ar_internal_metadata`(`key`,`value`,`created_at`,`updated_at`) values 
('environment','development','2023-09-13 05:03:42.970696','2023-09-13 05:03:42.970696');

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `schema_migrations` */

insert  into `schema_migrations`(`version`) values 
('20230913042750'),
('20230913064419'),
('20230913064829'),
('20230913070606');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `user_type` varchar(255) DEFAULT 'student',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `varified_by_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`encrypted_password`,`user_type`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`created_at`,`updated_at`,`name`,`dob`,`address`,`varified_by_admin`) values 
(1,'mojimunislam@gmail.com','$2a$12$sduitqTpiFtcWlu.V5FCeOHcON9nAv96YGt1B2BppJs.lJfP49kN.','admin','f54b74245d94c34bd0fb7fcc7c695b695afeceeca3b753e15e6805771f050cfc','2023-09-13 06:17:37.299081',NULL,'2023-09-13 05:12:10.444778','2023-09-13 06:17:37.299335',NULL,NULL,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
