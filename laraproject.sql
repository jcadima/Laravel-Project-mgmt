/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 5.7.24-0ubuntu0.18.04.1 : Database - laraproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laraproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `laraproject`;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2017_08_19_154835_create_projects_table',1),
(4,'2017_08_19_154845_create_tasks_table',1),
(5,'2017_09_01_105033_create_task_files_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `projects` */

insert  into `projects`(`id`,`project_name`,`created_at`,`updated_at`) values 
(93,'MYPROJECT','2019-01-02 18:13:54','2019-01-02 18:13:54'),
(102,'Test','2019-01-14 23:16:17','2019-01-14 23:16:17'),
(103,'dwwdwd','2019-01-17 10:26:29','2019-01-17 10:26:29'),
(104,'ххх','2019-01-23 17:27:15','2019-01-23 17:27:15');

/*Table structure for table `task_files` */

DROP TABLE IF EXISTS `task_files`;

CREATE TABLE `task_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `filename` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_task_id_foreign` (`task_id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `task_files` */

insert  into `task_files`(`id`,`task_id`,`filename`,`created_at`,`updated_at`) values 
(13,161,'1547717267_145f0de7-256f-4499-be2f-7a7261ade6d3.jpg','2019-01-17 10:27:47','2019-01-17 10:27:47');

/*Table structure for table `tasks` */

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `task_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tasks` */

insert  into `tasks`(`id`,`user_id`,`project_id`,`task_title`,`task`,`priority`,`completed`,`created_at`,`updated_at`,`duedate`) values 
(160,1,93,'adasdasdasas','<p>dasdasdsa</p>',0,1,'2019-01-14 23:16:51','2019-01-15 11:05:10','2019-01-14 11:16:44'),
(161,5,103,'initiated','<p>fefef fkenfkenfefe</p>',1,1,'2019-01-17 10:27:47','2019-01-17 10:27:56','2019-01-24 03:27:02');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`admin`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,0,'Not Assigned','not@assigned.com','',NULL,NULL,NULL),
(5,1,'Demo User','demo@test.com','$2y$10$9PdOI6amvNuEZILOae9/VOg2TkxmNAlBMVOJnG1OuXTqipIJ8dGFq','o316476iw7HA1xU0FfAgudzGdIRSPJPFaf3QSmg0umcDmecbZzhuAJVhp41g','2017-08-29 12:08:01','2019-01-27 11:58:26'),
(33,1,'HaveFun','fun@mail.com','$2y$10$HqHSDsYI3iGLXK9JBSF2n.Xw3Y9fEPhaZ3VlkP4m/7/83.idLo.Ly','SPtFi8mAMBzcpRz6lsbWFN4DKNyvgfGYquWu0UeX1ugLW6OYMZgbHFPXdHjt','2018-08-09 14:03:41','2019-01-21 19:56:14'),
(37,0,'Aneesh','aaneeshaji@gmail.com','$2y$10$bCyBN8z4QPZy5HlzoMHBH.Am3enxpV1CsbdrX83tMFqxBOGRDkmX2','vMIYkNpgcWt5ymULBQWSMKT2R7m6EdnnpWETwyVt9KP82meaJVykhTfnZOlm','2018-08-28 08:18:45','2019-01-07 14:23:19'),
(39,0,'deepak','deep123@gmail.com','$2y$10$LWGEZHunz6dOnM17kJWxV.njakVlFAFH2XHniicG9ou9HIuSGHKa.','4TNZw3RH2GFkHyt9P2kXoWz4IjIf686IsEjCal1PBTqERIcc97t4MEf5KJuS','2018-10-03 13:29:36','2018-12-08 07:43:47'),
(41,0,'bazarragchaa','bz@juann.com','$2y$10$bIx5Qe9SsVzO59RdOfYMz.gKDdQY5YiaEwKIAmL4FpatvnNtsJV7.','0kI7kBa8MiqsVXZQUuraaZDVHOu4CEl4Erkj0jPY9uy2YgFRLDVmWJLHBGOP','2018-10-23 06:43:26','2019-01-27 11:58:26'),
(42,0,'zayed2012','a.zayed2012@gmail.com','$2y$10$wMagY3Wv/cLLRBIGbm53sONjHnBrTKxPi2aXE3m969MPkEXPhckNC',NULL,'2018-10-24 11:42:39','2018-12-08 07:43:44'),
(43,0,'ahmed','a.zayed800@gmail.com','$2y$10$PHwO7WojE6nyKLhaBh9GDu4gVeKqNEufD4YJ2vJfAE6pSAHZq7C/i','2DdFCMcBNDsIGR45IuOxP4KwmiIdWAq6unSbxCrQVHRQuhn3akiRyetNPIC4','2018-10-24 11:47:26','2018-12-23 15:39:11'),
(45,0,'saveto','saveto@saveto.saveto','$2y$10$IhCFYDNmRbpkvj41Qz7sR.jeYe7MIVjswAyND6R/./nIbF82Jof..','QWjJ1MxbD9U9SfGLe7X6EvdNKMSgzV5fzQTXYmOGj1rZE6xzc5G531ZQl5JQ','2018-10-25 15:48:31','2019-01-07 14:23:26'),
(46,0,'saveto@saveto.saveto','saveto2@saveto.saveto','$2y$10$Hs9g01whexpkAmst.uuwTOLeMWhW99lBcv954lsMO0TZq/.GUQFPO','uQsfNHdpgVmFToNKkEbKHAxvyGOGyfN3Y8LG2XjmD1YhfL63Ff2KJRivZtSc','2018-10-25 15:49:07','2019-01-07 14:23:22'),
(47,0,'ridwan','firuzade@gmail.com','$2y$10$/Y7ri6/7b53.OfPqIdw68uZJtogRjezc9XsojxSX2rj5NORMJEc1y','dOn14HXESPNCYu7T6mS9n1ra9gybudKY8OjA2VQzZAltEUAAppWFdmxAGglo','2018-11-02 12:16:55','2019-01-07 14:23:23'),
(48,0,'China','admin@admin.com','$2y$10$e3Z8Y6ExlUEF7axtWKYG9eo6XON3l2PFeu7yfKH8mnrWVaQp/wte.',NULL,'2018-11-02 12:31:59','2019-01-07 14:23:25'),
(49,0,'UserTest','usertest@test.com','$2y$10$il1lB4rdPcLRDu3.3Ocr9epo8JoIXqvi7/xROYCAiiYLsyEZkismC',NULL,'2018-11-21 03:32:40','2018-12-08 07:43:43'),
(51,0,'Test Mu','testmu@gmail.com','$2y$10$ttuUyR2L3jnAkkStZKW1ZuG.Xdp2BgDvq4Bb6JSZIYZYMquG5m3ha','dcvdSJcyC1PsAFlXazecPtDoHMWmqzZLYW39L7VkmC2qZhbskcPHsoAgTRSs','2018-11-23 07:35:04','2019-01-07 14:23:14'),
(54,0,'dsqsd','aaa@a.a','$2y$10$kM9UEttlWzrNEd.QFqlRPuuUr05O9Q.tAu0jie2xq0tvPOH2qznaK','8I4AlW6fWFrRRq9nbJ6tbu2Z9mA7foYrqzrqEQGysJkRRzgiM80MX2tErmMQ','2018-12-08 14:24:23','2019-01-07 14:23:30'),
(55,1,'kazemimorteza68@gmail.com','kazemimorteza68@gmail.com','$2y$10$XACNBF0UOcfeoommfPhAhegkSnkx6S8h.iumC2R2YMo0rDkYSew22','pkn0dBIRPJrskXHqBkb9SxruKcDZFWcZ9cAi8vQNnEQet1MzZde8rjlM2alC','2018-12-08 22:39:48','2019-01-23 14:16:11'),
(56,0,'ariuka jagaa','ariuka.jagaa@gmail.com','$2y$10$/49PIvhhK6vqirIV3ApuxOQ3Okrg5O1KHqJYQI7rn3uXudb/YUFpm','B9vUMs57Y0PPoBgftQFJFZ4TCPFIsBdS5azowqtvuVgxFMQXS1Bh9VH14Yfm','2018-12-10 10:11:21','2019-01-07 14:23:32'),
(57,0,'abed','ahmad_dweikk@outlook.com','$2y$10$vwxihozcyPonRzEmRqRWzOla0Rhz89DMDo7XClV4nUjzkLyYB86BW','1cpXKu7CRc0TxKsT4gUpYEFSBi6uieviyn6sTPIVomHYjJ1Zk8edNvjSaie4','2018-12-10 23:13:31','2019-01-07 14:23:34'),
(58,0,'dddd','abeddwiek@gmail.com','$2y$10$jGImccxxRXgEWTLCHs.pUe0s0mD5.NS.cPOjfQ9.Yt8fEwgYpxvpW','wrsgZ6VYjXP4TFcxxCifJEA6mZWE2DkSKzrLphEukYkZHf04FHwpRiXmFnxN','2018-12-10 23:15:19','2019-01-07 14:23:36'),
(59,0,'ddd@ddd.ddd','ddd@ddd.ddd','$2y$10$0L6lAmKXXmkdH4Efq5lyMOHhlMXUmJ7JY9p01gjpx0888.3TWz7Rq','gMgRtImDjrJoKZrbzr8sYK8aB1WBPwHsweJik4p7UT7yY8Mgtub2tQw32IwT','2018-12-12 11:02:41','2019-01-07 14:23:39'),
(60,0,'tester2','test3@gmail.com','$2y$10$phApLPXRPQKTY73wBRsh/eBipPs5/XHwFI5Fjs5RlL9yOCaIGLVlC','fBTTMjR5gsLQsgrci2GEC1KAuiQCd9wL9mi7PB5bmiiNiMA1xMRptgAuVmMG','2018-12-25 05:15:50','2019-01-13 18:31:32'),
(61,0,'tester4','test4@gmail.com','$2y$10$DdFyPaQexX8fVtGvqEKEgelUGoaoWnFRuhTQULf1jJH6GqKDlLsnS','JyvmVVKiJBpH35QsPe3Cf6FjCkPw8QjYAEaVDCPocXrJTSOmW95tJpTLt6DS','2018-12-25 05:16:32','2019-01-07 14:23:41'),
(62,0,'Follow My Ig @moch_lukman786','Indonesia@gmail.com','$2y$10$HzK7UbPxoWvWmUj3HklX.OpoL.gdsdAgVCSHYYeMsD2.mlU1WBfuy','xwlmKv5RLKfkVzqg6gXXCcIWjLpP1xrmTKdy86RxNYWrqNH5Hxg9my0FBPvm','2019-01-19 23:52:43','2019-01-20 07:07:44');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
