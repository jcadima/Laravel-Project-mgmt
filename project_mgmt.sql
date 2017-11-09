-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 08, 2017 at 10:57 PM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jcadima_laraproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_19_154835_create_projects_table', 1),
(4, '2017_08_19_154845_create_tasks_table', 1),
(5, '2017_09_01_105033_create_task_files_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('demo@test.com', '$2y$10$trLK/QtXrW2asuC7hhLLYun3LJLxnoc1pfs4vIdx4quyV663cBZGq', '2017-10-22 23:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(10) unsigned NOT NULL,
  `project_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_name`, `created_at`, `updated_at`) VALUES
(1, 'Laravel tasks', NULL, '2017-09-09 03:55:55'),
(2, 'Google maps addition', NULL, NULL),
(3, 'Wordpress Tasks', '2017-08-25 13:58:10', '2017-09-09 03:55:31'),
(6, 'Javascript Validation', '2017-09-09 03:56:30', '2017-09-09 03:56:30'),
(7, 'CSS animations', '2017-09-09 03:56:48', '2017-09-09 03:56:48'),
(8, 'Magento tasks', '2017-09-09 04:27:15', '2017-09-09 04:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `task_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duedate` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `project_id`, `task_title`, `task`, `priority`, `completed`, `created_at`, `updated_at`, `duedate`) VALUES
(11, 6, 1, 'Task validation', '<ul><li>Task Validation for input and files</li><li>allow only images of <span style="background-color: rgb(255, 255, 0);">known</span> files: jpg, png, gif, jpeg</li></ul>', 1, 1, '2017-08-26 00:06:28', '2017-09-09 03:55:02', '2017-10-02 23:30:56'),
(13, 6, 1, 'Tasks pagination', '<p>add pagination of 10 tasks per project</p>', 0, 1, '2017-08-27 00:25:15', '2017-09-03 01:32:08', '2017-11-02 23:30:56'),
(21, 8, 1, 'Create tasks view by user', '<p>Implement a view that shows all tasks by selected <span style="background-color: rgb(255, 255, 0);">user</span></p>', 0, 1, '2017-08-28 03:52:54', '2017-09-09 03:21:20', '2017-09-17 23:30:56'),
(25, 9, 1, 'Create date deadline', '<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n\r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>', 0, 1, '2017-08-29 06:44:23', '2017-11-01 21:01:57', '2017-09-19 11:30:56'),
(36, 10, 7, 'Banner animation', '<ul><li>Implement animate.css</li><li>add banner text bouncing animations</li></ul><ul><li>Grab attention with animated banner ads</li><li>Educate your leads with explainer videos</li><li>Sell more with video catalogues and demos</li><li>Tell your business story to build relationship </li></ul><p>Choose from thousands of free, pre-animated characters, backgrounds and \r\nprops. Our marketplace is home to several professionally designed &amp; \r\nthemed infographics, icons and animated sets to help you build scenes in\r\n a jiffy.<br></p>', 1, 0, '2017-08-31 03:58:42', '2017-11-01 21:01:19', '2017-09-22 11:57:14'),
(37, 12, 3, 'ACF install', '<ol><li>Install ACF plugin</li><li>Create new gallery fields&nbsp;</li><li>implement <span style="background-color: rgb(255, 255, 0);">Owl carousel</span> with custom fields</li></ol><p>Use the Advanced Custom Fields plugin to take full control of your WordPress edit screens &amp; custom field data.</p><ul><li>Our field builder allows you to <b>quickly and easily</b> add fields to WP edit screens with only the click of a few buttons!</li><li>Fields can be added <b>all over</b> WP including posts, users, taxonomy terms, media, comments and even custom options pages!</li><li>Load and display your custom field values in any theme template file with our hassle free <b>developer friendly</b> functions!<br></li></ul>', 0, 0, '2017-09-01 04:00:30', '2017-11-01 20:59:27', '2017-09-20 11:58:58'),
(38, 13, 2, 'Add map directions', '<ul><li>Create custom Google Maps directions&nbsp;</li><li>Add custom marker Image with main Logo</li></ul>', 0, 0, '2017-09-02 04:02:57', '2017-09-09 04:02:57', '2017-09-29 12:00:44'),
(39, 11, 1, 'Migrate Users', '<ul><li>Migrate new User Model</li><li>Add admin column, <span style="background-color: rgb(255, 255, 0);">disabled</span> by default</li></ul>', 0, 1, '2017-09-03 04:05:05', '2017-09-09 19:57:48', '2017-11-02 12:03:14'),
(40, 12, 3, 'Migrate Ecommerce Store', '<p>Merchants and their teams, including authorized developers, can access the new tool directly within their Magento Account. And it is very easy to set up. \r\n\r\nIn the future, we’ll provide regular updates to the scanning tool as new Magento patches are made available. </p><p>The scan is only available for our commerce products today, but we’re looking to extend security tools to additional Magento products later.</p><p>From shades of color to specific formularies, custom product attributes \r\nare essential when matching products to customer needs. Magento helps \r\nyou quickly and easily showcase your unique product attributes and tap \r\nrobust product bundling to grow your average order value.</p><ul><li>Optimize payments to increase sales, reduce risk</li><li>Deliver a better overall customer experience.<br></li></ul>', 0, 0, '2017-09-04 04:23:51', '2017-11-01 20:57:16', '2017-09-28 12:05:23'),
(41, 8, 6, 'Form Validation', '<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\r\n\r\n<ul><li>Add form validation</li><li>Add support for <span style="background-color: rgb(255, 255, 0);">multiple</span> file upload validation</li></ul>\r\n\r\n<dl>\r\n   <dt>Definition list</dt>\r\n   <dd>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna\r\naliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\r\ncommodo consequat.</dd>\r\n   <dt>Lorem ipsum dolor sit amet</dt>\r\n   <dd>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna\r\naliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\r\ncommodo consequat.</dd>\r\n</dl>', 0, 0, '2017-09-05 04:25:41', '2017-11-01 20:44:28', '2017-09-30 12:24:43'),
(42, 10, 8, 'Apply Security Patches', '<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>\r\n\r\n<h2>Header Level 2</h2>\r\n\r\n<ol>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ol>\r\n\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>\r\n\r\n<h3>Header Level 3</h3>\r\n\r\n<ul>\r\n   <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>\r\n   <li>Aliquam tincidunt mauris eu risus.</li>\r\n</ul>', 0, 0, '2017-09-06 04:27:58', '2017-11-01 20:55:06', '2017-09-28 12:27:19'),
(43, 13, 8, 'Magento Upgrade/Security', '<p>Magento has rolled out a new security scan tool that enables Magento \r\nmerchants to regularly monitor their sites and receive updates regarding\r\n known security risks, malware, and unauthorized access. Security Scan \r\nis a free service of Magento and can be run on any version of Magento \r\nCommerce (formerly Enterprise Edition) and Magento Open Source (formerly\r\n Community Edition).</p><p><br></p><ul><li>\r\n<p>Insight into the real-time security status of their Magento store and how to fix potential vulnerabilities</p>\r\n</li><li>\r\n<p>Over 30 security tests to identify potential vulnerabilities, such as\r\n missing Magento patches, configuration issues, and failure to follow \r\nsecurity best practices</p>\r\n</li><li>\r\n<p>Historical security reports of their Magento sites, so that they can track and monitor their progress over time</p>\r\n</li><li>\r\n<p>Scan result reports that clearly show which checks the site passed and failed and whether further action is required</p>\r\n</li><li>\r\n<p>Scheduling of scans for specific, recurring dates/times, and/or on-demand</p>\r\n</li><li>\r\n<p>Suggested remediation steps for each failed security test</p>\r\n</li></ul><p><br></p>', 1, 0, '2017-09-07 04:30:17', '2017-11-05 21:47:18', '2017-12-09 12:28:41'),
(44, 6, 1, 'Perl', '<dl>\r\n   <dt>Definition list</dt>\r\n   <dd>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna\r\naliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\r\ncommodo consequat.</dd>\r\n   <dt>Lorem ipsum dolor sit amet</dt>\r\n   <dd>Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna\r\naliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\r\ncommodo consequat.</dd></dl><p></p><p></p><dl><dd><br></dd></dl><p></p><table class="table table-bordered"><tbody><tr><td>ch1<br></td><td>ch2<br></td><td>ch3<br></td></tr><tr><td>ch4<br></td><td>ch4<br></td><td>ch6<br></td></tr></tbody></table><p></p><dl><dd>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.<br></dd>\r\n</dl><p></p>\r\n\r\n<p>Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam, gravida non, commodo a, sodales sit amet, nisi.</p>', 1, 1, '2017-09-08 05:10:14', '2017-11-05 10:33:39', '2017-11-09 01:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

CREATE TABLE IF NOT EXISTS `task_files` (
  `id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_files`
--

INSERT INTO `task_files` (`id`, `task_id`, `filename`, `created_at`, `updated_at`) VALUES
(20, 44, 'userdata.txt', '2017-09-09 05:10:14', '2017-09-09 05:10:14'),
(21, 44, 'gmapsphone.jpg', '2017-09-09 05:14:11', '2017-09-09 05:14:11'),
(24, 44, 'Programming-republic-of-perl.png', '2017-10-18 19:46:32', '2017-10-18 19:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'Not Assigned', 'not@assigned.com', '', NULL, NULL, NULL),
(5, 1, 'Demo User', 'demo@test.com', '$2y$10$Va.3smsuk8JI/2xgAMh9l.eQTMaj9umE0hil/MUwXi6RypsJpVWXu', 'I8g02MzrXwJDLr7vnChrtKBio0rXQQVioOJnNSO7mbvTgX8NymJuUVEkP64c', '2017-08-29 12:08:01', '2017-11-05 22:00:14'),
(6, 1, 'Juan Cadima', 'juan@cadima.com', '$2y$10$brcllY0.FHZGWP05Gfhr.OAMZdkSk1ef9kRsxeafHrLL0Z94Mgzv.', 'dxHU6s6Or0SQMolGcLBh1qXG302GTck8rYLgLtwT7ccfz98xLP7wBDwN82Ks', '2017-08-31 09:27:22', '2017-10-30 20:47:35'),
(8, 0, 'Lisa Yadomaru', 'lisa@yadomaru.com', '$2y$10$jTui8pV24nk6LaTjxbuAEuy0yIrRkQs5VlmclwpOGGiEiILuor2oe', 'GGDLYXPKilzJH7TBiJAKjxszByFgPuUmbJ1yHVAnLs18lN8j2TWPX9rGFuqL', '2017-08-31 10:01:30', '2017-09-08 06:13:12'),
(9, 1, 'Rukia Kuchiki', 'rukia@kuchiki.com', '$2y$10$GX68RfpF1FO0ABaqcl1x2.CHL5ilE8XIxQ/eXLQQ7NYSa0ubq31ly', '8ATvv26U5o1mz3ME7rYIBjHjX8Blav92clpV7OI4GiJ0PyipISYElU7sNlIZ', '2017-09-09 03:34:26', '2017-09-09 03:49:49'),
(10, 0, 'Renji Abarai', 'renji@abarai.com', '$2y$10$ZIoDBapWtSjOiMZXD/kUzOulSFD3TZOVKq49llqOc6Bu1O6h50XTy', NULL, '2017-09-09 03:52:31', '2017-09-09 03:52:31'),
(11, 0, 'Orihime Inoue', 'orihime@inoue.com', '$2y$10$xs.yo2gn6ehxiC1uXHu4cO8MlIiEngzu6002rjs.UT6SPMpW.jAFi', NULL, '2017-09-09 03:52:57', '2017-11-05 10:34:17'),
(12, 0, 'Kisuke Urahara', 'kisuke@urahara.com', '$2y$10$BnjEmJ/.XqQwzZOm4/qLrO1u0T1Fa/9E8YCiplysOHdtfYxtLq09O', NULL, '2017-09-09 03:53:31', '2017-09-09 03:53:31'),
(13, 0, 'Ichigo Kurosaki', 'ichigo@kurosaki.com', '$2y$10$09OAVPp59CsI6QAtTeYtZ.sMN6S8lcxrjc7OSQ3FiXUf/AoxQW1ky', NULL, '2017-09-09 03:54:05', '2017-09-09 03:54:05'),
(15, 1, 'admin2', 'admin2@test.com', '$2y$10$voBWydDFXbR7KM.DH6flbetb1EwLoybo5KrsvYe3vTthGDwp8.qHi', '12xLouoFn8WtcXALkMDERsBcCe4cAxQPBBFfge5yUVol8Fyl0MtudbjtUcuU', '2017-11-05 21:26:33', '2017-11-05 21:59:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`), ADD KEY `tasks_project_id_foreign` (`project_id`), ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`), ADD KEY `task_files_task_id_foreign` (`task_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_files`
--
ALTER TABLE `task_files`
ADD CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
