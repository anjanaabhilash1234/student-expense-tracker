-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 23, 2026 at 06:24 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `expense_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE IF NOT EXISTS `budget` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `month` varchar(30) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`bid`, `uid`, `month`, `year`, `amount`) VALUES
(2, 2, 'February', 2026, 3000),
(3, 2, 'March', 2026, 1000),
(4, 2, 'January', 2026, 2000),
(5, 3, 'January', 2026, 2000),
(6, 3, 'February', 2026, 1500),
(7, 3, 'March', 2026, 1800);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_admin_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-09-14 09:41:06'),
(2, 'auth', '0001_initial', '2022-09-14 09:41:09'),
(3, 'admin', '0001_initial', '2022-09-14 09:41:09'),
(4, 'contenttypes', '0002_remove_content_type_name', '2022-09-14 09:41:10'),
(5, 'auth', '0002_alter_permission_name_max_length', '2022-09-14 09:41:10'),
(6, 'auth', '0003_alter_user_email_max_length', '2022-09-14 09:41:11'),
(7, 'auth', '0004_alter_user_username_opts', '2022-09-14 09:41:11'),
(8, 'auth', '0005_alter_user_last_login_null', '2022-09-14 09:41:11'),
(9, 'auth', '0006_require_contenttypes_0002', '2022-09-14 09:41:11'),
(10, 'sessions', '0001_initial', '2022-09-14 09:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('18fmg8zhrdbt42o23j01e37ylsumh8rd', 'e30:1ujxBW:aaRMXV7yWq09y2cZmCucBCY-lzH6-T6RH0CnkiwnHQc', '2025-08-21 09:45:18'),
('2715hsn7r55x0llh96adrdbyj5v3lyb2', 'ZDQzM2JiZmJjZjY3MmUyMDVlM2VmYmQ0MzBiNmJlNGZkYWE1YWViNDp7fQ==', '2022-11-10 12:09:34'),
('2kbm2cgpi1bjypswwv4vz3opajnaf8nm', 'NDYzNDI5Mzk5NGExYWMyNTQ4NDk3ODc0NmUxMDM0OGIzZDBjYWM0Zjp7InV0eXBlIjoiYWRtaW4iLCJ1aWQiOjR9', '2022-10-23 09:58:08'),
('3w32qcysmcjr8r02brecyg3irl73kvpr', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vtKps:A9ymRnuKzhWsd3RVTFpswMGnIJPzaFe9heZF9Hq466M', '2026-03-06 07:22:00'),
('40m2x6intyusmqyh5ubvh9pv4rlzxyyt', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vyNcN:1GaQovpqSc3-rmZbWWb30Kkhsr2bTj704hOFwXv8JDw', '2026-03-20 05:20:55'),
('4z5sff0ufch3d7haoibcz07wy0pa31aa', 'ZDQzM2JiZmJjZjY3MmUyMDVlM2VmYmQ0MzBiNmJlNGZkYWE1YWViNDp7fQ==', '2022-10-31 10:18:15'),
('62w5w1fmvon9l1ci34kolmxsnqwcs96z', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1w2j2Y:bsv4t2KVKO89K0fKDlR8SzAzL2qZ66RLGzcbiGLdlNk', '2026-04-01 05:01:54'),
('9a4lbi6y1o33y6l1hm1l9k32jlsg38bk', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vvCau:7D6rwd8bzkV9eGFzxWyX0uV7YFSrHkkX8HDwpjA-Ivc', '2026-03-11 10:58:16'),
('ahbpadp2q9nnzoe18dqvx1bzw57d6p5z', 'YzRmODMyMWI1ZjM1ZjgxMDc1YjJiN2NhNjM4ZGIyMjkyMTJjYWZlNjp7InV0eXBlIjoiYnVpbGRlciIsInVpZCI6MX0=', '2022-10-23 12:03:21'),
('cj26lpztt1t0olh5qm3a1pahj4ns1757', 'ZDQzM2JiZmJjZjY3MmUyMDVlM2VmYmQ0MzBiNmJlNGZkYWE1YWViNDp7fQ==', '2022-10-30 09:03:38'),
('e16cc9nvq35e7i949dy6vc1y12nyrza0', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vuhlX:AvOOAJaz_mMsg7_kiJgYIQOoZOgN0oSvlwJQQgpJtn0', '2026-03-10 02:03:11'),
('e3oirftlg8z9vtqfdjvotoufcatkgg2u', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkFydW5AMTIzNCIsInV0eXBlIjoic3R1ZGVudCJ9:1w2nS0:fdUZkm45QALWmDY8K3THa-qRe6hnEmYnxYvkCLhgVBE', '2026-04-01 09:44:28'),
('eblkr52l9gz51oujx6xggbdjhbhdkp7n', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vyiVl:NFpeXs-WtKCiLkcOkPpPWCpE2f6557ybLx982UwpIeY', '2026-03-21 03:39:29'),
('efmb0zs8v4zilqnso7h3kocj7l0zzfs5', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkFydW5AMTIzNCIsInV0eXBlIjoic3R1ZGVudCJ9:1w3WV2:Z_KUZVPf048CBBc9KZAkvScZxrvZtz8Aa7_LEoEVDaI', '2026-04-03 09:50:36'),
('fiho6uxtii4dxkuqwwjv962to2rz5ixb', 'YTk1OGZiZDQ3Mzc2NWM4NjU0MjVlNjI1ZTFkOTVhYzg5YmUwOWExYjp7InV0eXBlIjoiYnVpbGRhZG1pbiIsInVpZCI6MX0=', '2022-11-07 22:32:31'),
('g886vczkzypdfnykveft3nsebfo87gbq', 'eyJ1aWQiOjIsInVuYW1lIjoiYXVuQGdtYWlsLmNvbSIsInVwYXNzIjoiQXVuQDEyMzQ1IiwidXR5cGUiOiJzdHVkZW50In0:1vt0tb:mfSY7Hx1kIhCW9uApNYYYzSMTOzUnVBYNcOGGnDZYk0', '2026-03-05 10:04:31'),
('hvyk1jbr5tb73y9ttykfz5uqale8lkwu', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vyoNE:347QTNl_huuxJl-n5uon7ubMQmztJq9skFIEyYgbTy8', '2026-03-21 09:55:04'),
('imxqgaukn19t6eycz5fj5st6izps74go', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkFydW5AMTIzNCIsInV0eXBlIjoic3R1ZGVudCJ9:1w3oBX:4zuCfG6qrmsfI2XVfXR9zRRmszxuQmlq6Jj7EkG2Iw8', '2026-04-04 04:43:39'),
('isnyqi0hlp6vmdyk5cja8mypqhh44308', 'ZDQzM2JiZmJjZjY3MmUyMDVlM2VmYmQ0MzBiNmJlNGZkYWE1YWViNDp7fQ==', '2022-10-17 08:53:57'),
('iu66a02kltv3x1hfyvm6grawqhco3q05', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkFydW5AMTIzNCIsInV0eXBlIjoic3R1ZGVudCJ9:1w3TuF:2D1Vnvbpx9sRILa32uAUsGjEGgbZjNADRzW-u7e2QII', '2026-04-03 07:04:27'),
('klj0b1f6zt9nxcephtl0eodtrb9afdyj', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1w2mCb:bbpbOFMSFo3WUbrpwsnu-QC1CnkwERSrUpaA257UpSw', '2026-04-01 08:24:29'),
('kx3y7r2akcktfarvnkf8tr2z3f83sghi', 'YTk1OGZiZDQ3Mzc2NWM4NjU0MjVlNjI1ZTFkOTVhYzg5YmUwOWExYjp7InV0eXBlIjoiYnVpbGRhZG1pbiIsInVpZCI6MX0=', '2022-11-10 12:16:31'),
('kz1akkx6ufcqodkg5sdw82xst3idgtdf', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1w0Yi9:8Lp4GMMnRx4u4sUujvWOSFe-F0mF3W9OHclVJbAE4Xw', '2026-03-26 05:35:53'),
('mqvjyqc2hgd91zd6zbv8s4eef47sdadn', 'ZDQzM2JiZmJjZjY3MmUyMDVlM2VmYmQ0MzBiNmJlNGZkYWE1YWViNDp7fQ==', '2022-12-02 07:39:06'),
('o80tbw59of8hbxiw5tx3xbq6gstqs3w9', 'eyJ1aWQiOjMsInVuYW1lIjoibWFudUBnbWFpbC5jb20iLCJ1cGFzcyI6Ik1hbnVAMTIzNCIsInV0eXBlIjoic3R1ZGVudCJ9:1w4Xue:qgSjZIc_hJNnYvZ3lS8j6OnnNHV690TgLJbEX61Ptg4', '2026-04-06 05:33:16'),
('sfmo63gv1czncgnfp89d8q426alut3qx', 'ZDQzM2JiZmJjZjY3MmUyMDVlM2VmYmQ0MzBiNmJlNGZkYWE1YWViNDp7fQ==', '2022-11-10 12:22:51'),
('zsbpsoun75sineewn8o9gpgyj0ie8yln', 'eyJ1aWQiOjIsInVuYW1lIjoiYXJ1bkBnbWFpbC5jb20iLCJ1cGFzcyI6IkF1bkAxMjM0NSIsInV0eXBlIjoic3R1ZGVudCJ9:1vvBbN:YoiAAQ459R8s7etqXdtiUuAgJX4Luj0DgeRIGyBDU4Y', '2026-03-11 09:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE IF NOT EXISTS `expense` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cat` varchar(50) NOT NULL,
  `amt` varchar(50) NOT NULL,
  `ds` varchar(50) NOT NULL,
  `rdate` varchar(50) NOT NULL,
  `payment_mode` varchar(30) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`eid`, `uid`, `cat`, `amt`, `ds`, `rdate`, `payment_mode`) VALUES
(1, 2, 'Food', '253', 'fd', '2026-01-06', 'UPI'),
(2, 2, 'Food', '451', 'fdd', '2026-01-06', 'UPI'),
(3, 2, 'Food', '123', 'asdsad', '2026-01-07', 'Cash'),
(4, 2, 'Food', '124', 'qfsghte', '2026-03-04', 'Cash'),
(5, 2, 'Food', '678', 'asdsad', '2026-03-03', 'Card'),
(6, 2, 'Travel', '234', 'ttrtrtrt', '2026-03-02', 'Card'),
(7, 2, 'movie', '678', 'mv', '2026-03-01', 'Card'),
(8, 2, 'miscellanous', '342', 'mssddsds', '2026-03-06', 'UPI'),
(9, 2, 'Food', '567', 'ytryf', '2026-02-07', 'Card'),
(10, 2, 'Travel', '878', 'iuiiuiyiyu', '2026-02-10', 'Cash'),
(11, 2, 'movie', '98', 'assasasa', '2026-02-12', 'UPI'),
(12, 2, 'miscellanous', '234', 'adasdsadasdas', '2026-02-05', 'Card'),
(13, 3, 'Food', '250', 'Lunch', '2026-01-02', 'UPI'),
(14, 3, 'Travel', '120', 'Bus fare', '2026-01-03', 'Cash'),
(15, 3, 'movie', '300', 'Cinema', '2026-01-05', 'Card'),
(16, 3, 'miscellanous', '150', 'Snacks', '2026-01-08', 'UPI'),
(17, 3, 'Food', '400', 'Dinner', '2026-01-12', 'Card'),
(18, 3, 'Travel', '220', 'Auto', '2026-01-15', 'Cash'),
(19, 3, 'Food', '180', 'Breakfast', '2026-01-18', 'UPI'),
(20, 3, 'movie', '350', 'Movie night', '2026-01-20', 'Card'),
(21, 3, 'Food', '500', 'Dinner', '2026-02-02', 'Card'),
(22, 3, 'Travel', '300', 'Train', '2026-02-04', 'Cash'),
(23, 3, 'miscellanous', '200', 'Shopping', '2026-02-06', 'UPI'),
(24, 3, 'Food', '270', 'Lunch', '2026-02-08', 'UPI'),
(25, 3, 'movie', '150', 'OTT', '2026-02-10', 'UPI'),
(26, 3, 'Travel', '450', 'Cab', '2026-02-14', 'Card'),
(27, 3, 'Food', '320', 'Snacks', '2026-02-18', 'Cash'),
(28, 3, 'miscellanous', '280', 'Groceries', '2026-02-22', 'Card'),
(29, 3, 'Food', '600', 'Dinner', '2026-03-01', 'Card'),
(30, 3, 'Travel', '200', 'Bus', '2026-03-02', 'Cash'),
(31, 3, 'movie', '400', 'Cinema', '2026-03-03', 'Card'),
(32, 3, 'miscellanous', '350', 'Shopping', '2026-03-05', 'UPI'),
(33, 3, 'Food', '220', 'Breakfast', '2026-03-07', 'UPI'),
(34, 3, 'Travel', '500', 'Cab', '2026-03-10', 'Card'),
(35, 3, 'Food', '330', 'Lunch', '2026-03-15', 'Cash'),
(36, 3, 'miscellanous', '410', 'Electronics', '2026-03-20', 'Card');

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE IF NOT EXISTS `expense_category` (
  `ecid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL,
  PRIMARY KEY (`ecid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`ecid`, `cname`) VALUES
(1, 'Food'),
(3, 'Travel'),
(4, 'Movie'),
(5, 'miscellanous');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `typ` varchar(30) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `uid`, `typ`, `msg`, `date`) VALUES
(1, 2, 'complaint', 'error in page budget', '2026-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE IF NOT EXISTS `income` (
  `incid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cat` varchar(50) NOT NULL,
  `amt` varchar(50) NOT NULL,
  `ds` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`incid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`incid`, `uid`, `cat`, `amt`, `ds`, `date`) VALUES
(2, 2, 'scholorship', '5000', 'sc', '2026-03-01'),
(3, 2, 'gift', '3600', 'dd', '2026-03-04'),
(4, 3, 'Scholorship', '1000', 'scholorship', '2026-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `income_category`
--

CREATE TABLE IF NOT EXISTS `income_category` (
  `icid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL,
  PRIMARY KEY (`icid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `income_category`
--

INSERT INTO `income_category` (`icid`, `cname`) VALUES
(3, 'Scholorship'),
(4, 'Partime'),
(5, 'Gift');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `uid` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `upass` varchar(30) NOT NULL,
  `utype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `uname`, `upass`, `utype`) VALUES
(0, 'admin@gmail.com', 'Admin@1234', 'admin'),
(2, 'arun@gmail.com', 'Arun@1234', 'student'),
(3, 'manu@gmail.com', 'Manu@1234', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gen` varchar(10) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `adr` varchar(100) NOT NULL,
  `course` varchar(50) NOT NULL,
  `inst` varchar(100) NOT NULL,
  `phn` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `name`, `gen`, `dob`, `adr`, `course`, `inst`, `phn`, `email`) VALUES
(2, 'arun S', 'Male', '2014-05-07', 'ssdgffffffffff', 'ffffffffffffffffff', 'fffffffffffffffffff', '9999999999', 'arun@gmail.com'),
(3, 'Manu', 'Male', '2000-02-16', 'manu villa', 'mca', 'tvk', '7892654487', 'manu@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
