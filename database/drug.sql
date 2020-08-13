-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2020 at 02:00 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drug`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_company`
--

CREATE TABLE `accounts_company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `company_address` longtext,
  `image` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `nafdac_number_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_company`
--

INSERT INTO `accounts_company` (`id`, `company_name`, `company_address`, `image`, `active`, `timestamp`, `nafdac_number_id`) VALUES
(4, 'Evon Pharmaceutical Company', '6A, Bara''s Compound, Iwoye Road, Osogbo', '', 1, '2020-03-25 14:15:30.739637', 10);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_drug`
--

CREATE TABLE `accounts_drug` (
  `id` int(11) NOT NULL,
  `drug_name` varchar(250) DEFAULT NULL,
  `tracking_code` varchar(250) DEFAULT NULL,
  `production_date` varchar(250) DEFAULT NULL,
  `expiry_date` varchar(250) DEFAULT NULL,
  `batch_number` varchar(250) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `nafdac_number_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_drug`
--

INSERT INTO `accounts_drug` (`id`, `drug_name`, `tracking_code`, `production_date`, `expiry_date`, `batch_number`, `image`, `active`, `timestamp`, `nafdac_number_id`) VALUES
(5, 'Paracetamol', 'QOPL4U3J78G', '2019-01-09', '2020-12-09', 'BN23M', '', 0, '2020-03-29 16:15:31.755642', 10),
(6, 'Paracetamol', 'BHL4U3J78P', '2019-01-09', '2020-12-09', 'BN23M', '', 1, '2020-03-29 16:16:08.438741', 10),
(7, 'Ibruvin Dixonin', 'YBNL6TJ7W5', '2019-12-20', '2020-12-20', 'BHN78U', '', 1, '2020-03-29 17:26:44.588034', 10),
(8, 'Ibruvin Dixonin', 'HNG8R4XS2M', '2019-01-09', '2020-12-20', 'BHN78U', '', 1, '2020-03-29 19:46:25.435570', 10),
(9, 'Ibruvin Dixonin', 'UNBHD79S2M', '2019-01-09', '2020-12-20', 'BHN78U', '', 1, '2020-03-29 21:01:28.993158', 10),
(10, 'Dicotine Capsule', 'FBNE2U902N', '2019-12-20', '2020-12-20', 'GVBJ8', '', 1, '2020-03-29 21:51:45.476691', 10),
(11, 'Chlorohquine', 'UN8B6GHNS9', '2019-01-09', '2020-12-20', 'VSC7J', '', 1, '2020-03-29 22:00:06.903371', 10),
(12, 'Panadol Extra', 'GBHT9Y6M2B', '2020-01-20', '2021-01-20', 'DY78BV', '', 1, '2020-03-30 12:15:38.698685', 10),
(13, 'Ibucalp 500mg', 'YOP97U5FBY', '2020-01-20', '2021-01-20', 'BN2BM', '', 1, '2020-03-30 12:17:13.820125', 10),
(14, 'Amalar 400mg', 'POKD90BH5F', '2020-01-20', '2021-01-20', 'BN2BB', '', 1, '2020-03-30 12:18:39.581031', 10);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_nafdacnumber`
--

CREATE TABLE `accounts_nafdacnumber` (
  `id` int(11) NOT NULL,
  `Nafdac_number` varchar(50) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_nafdacnumber`
--

INSERT INTO `accounts_nafdacnumber` (`id`, `Nafdac_number`, `active`, `timestamp`, `reference_number`) VALUES
(1, 'Y56QV2', 1, '2020-03-24 13:58:01.983697', '1'),
(2, 'UQ0CPU', 1, '2020-03-24 13:58:09.864806', '1'),
(3, 'GNR9TF', 1, '2020-03-24 13:58:50.734475', '2'),
(4, '1NGUCU', 1, '2020-03-24 13:59:36.926181', '1'),
(5, '80WLN6', 1, '2020-03-24 15:27:04.202934', '5');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add naf dac number', 7, 'add_nafdacnumber'),
(26, 'Can change naf dac number', 7, 'change_nafdacnumber'),
(27, 'Can delete naf dac number', 7, 'delete_nafdacnumber'),
(28, 'Can view naf dac number', 7, 'view_nafdacnumber'),
(29, 'Can add company', 8, 'add_company'),
(30, 'Can change company', 8, 'change_company'),
(31, 'Can delete company', 8, 'delete_company'),
(32, 'Can view company', 8, 'view_company'),
(33, 'Can add drug', 9, 'add_drug'),
(34, 'Can change drug', 9, 'change_drug'),
(35, 'Can delete drug', 9, 'delete_drug'),
(36, 'Can view drug', 9, 'view_drug');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$18713N1xMFqu$h2yFweKFIEu3e8lRUpRSkqwJfwnMHqtEI70Ewz1ZLSI=', '2020-03-30 04:47:14.233171', 1, 'Admin', '', '', 'daricocity@gmail.com', 1, 1, '2020-03-20 12:15:07.283842'),
(10, 'pbkdf2_sha256$120000$xqpBuZ8VlL0I$rSIBKdZ1Ts8LMBGeDjuOiBkWZnfytrnL2p3uYBICFV0=', '2020-03-31 12:32:39.478733', 0, '80WLN6', '', '', '', 0, 1, '2020-03-25 14:15:29.612573');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-03-23 17:00:30.265826', '1', '1', 1, '[{"added": {}}]', 7, 1),
(2, '2020-03-23 17:02:03.658168', '2', '2', 1, '[{"added": {}}]', 7, 1),
(3, '2020-03-24 11:53:04.226004', '3', '3', 1, '[{"added": {}}]', 7, 1),
(4, '2020-03-24 11:57:53.673559', '4', '4', 1, '[{"added": {}}]', 7, 1),
(5, '2020-03-24 11:58:58.648276', '5', '5', 1, '[{"added": {}}]', 7, 1),
(6, '2020-03-24 12:03:26.133575', '5', '5', 2, '[{"changed": {"fields": ["Nafdac_number"]}}]', 7, 1),
(7, '2020-03-24 12:06:41.220733', '6', '6', 1, '[{"added": {}}]', 7, 1),
(8, '2020-03-24 12:06:54.807510', '6', '6', 3, '', 7, 1),
(9, '2020-03-24 12:07:06.155159', '5', '5', 3, '', 7, 1),
(10, '2020-03-24 12:07:06.209162', '4', '4', 3, '', 7, 1),
(11, '2020-03-24 12:07:06.242164', '3', '3', 3, '', 7, 1),
(12, '2020-03-24 12:07:06.301168', '2', '2', 3, '', 7, 1),
(13, '2020-03-24 12:07:06.566183', '1', '1', 3, '', 7, 1),
(14, '2020-03-24 13:18:21.420691', '14', '14', 3, '', 7, 1),
(15, '2020-03-24 13:18:21.825714', '13', '13', 3, '', 7, 1),
(16, '2020-03-24 13:18:22.008724', '12', '12', 3, '', 7, 1),
(17, '2020-03-24 13:18:22.049727', '11', '11', 3, '', 7, 1),
(18, '2020-03-24 13:18:22.150732', '10', '10', 3, '', 7, 1),
(19, '2020-03-24 13:18:22.269739', '9', '9', 3, '', 7, 1),
(20, '2020-03-24 13:18:22.466750', '8', '8', 3, '', 7, 1),
(21, '2020-03-24 13:18:22.505753', '7', '7', 3, '', 7, 1),
(22, '2020-03-24 13:25:27.518062', '16', '16', 1, '[{"added": {}}]', 7, 1),
(23, '2020-03-24 13:53:26.454267', '21', '21', 1, '[{"added": {}}]', 7, 1),
(24, '2020-03-24 13:53:40.155770', '21', '21', 2, '[{"changed": {"fields": ["reference_number"]}}]', 7, 1),
(25, '2020-03-24 13:55:52.011721', '22', '22', 3, '', 7, 1),
(26, '2020-03-24 13:55:52.111726', '21', '21', 3, '', 7, 1),
(27, '2020-03-24 13:55:52.285736', '20', '20', 3, '', 7, 1),
(28, '2020-03-24 13:55:52.456746', '19', '19', 3, '', 7, 1),
(29, '2020-03-24 13:55:52.543751', '18', '18', 3, '', 7, 1),
(30, '2020-03-24 13:55:52.601754', '17', '17', 3, '', 7, 1),
(31, '2020-03-24 13:55:52.661758', '16', '16', 3, '', 7, 1),
(32, '2020-03-24 13:55:52.718761', '15', '15', 3, '', 7, 1),
(33, '2020-03-25 08:42:57.877557', '2', '80WLN6', 3, '', 4, 1),
(34, '2020-03-25 08:54:05.220150', '3', '80WLN6', 3, '', 4, 1),
(35, '2020-03-25 08:58:17.280789', '4', '80WLN6', 3, '', 4, 1),
(36, '2020-03-25 09:01:27.919970', '5', '80WLN6', 3, '', 4, 1),
(37, '2020-03-25 09:15:46.199358', '1', '80WLN6', 3, '', 8, 1),
(38, '2020-03-25 09:16:15.033590', '6', '80WLN6', 3, '', 4, 1),
(39, '2020-03-25 13:31:22.263649', '2', '80WLN6', 3, '', 8, 1),
(40, '2020-03-25 13:31:49.201538', '7', '80WLN6', 3, '', 4, 1),
(41, '2020-03-25 13:35:52.829076', '8', '80WLN6', 3, '', 4, 1),
(42, '2020-03-25 13:39:09.887431', '3', '80WLN6', 3, '', 8, 1),
(43, '2020-03-25 13:39:28.745715', '9', '80WLN6', 3, '', 4, 1),
(44, '2020-03-29 15:16:44.689906', '1', 'None', 1, '[{"added": {}}]', 9, 1),
(45, '2020-03-29 15:22:05.381248', '1', 'None', 3, '', 9, 1),
(46, '2020-03-29 16:09:48.823028', '2', 'Emzor Paracetamol', 3, '', 9, 1),
(47, '2020-03-29 19:47:39.236791', '8', 'HNG8R4XS2M', 2, '[{"changed": {"fields": ["drug_name"]}}]', 9, 1),
(48, '2020-03-29 21:57:42.373105', '6', 'Paracetamol', 2, '[{"changed": {"fields": ["drug_name"]}}]', 9, 1),
(49, '2020-03-29 21:57:58.205010', '5', 'Paracetamol', 2, '[{"changed": {"fields": ["drug_name"]}}]', 9, 1),
(50, '2020-03-30 04:47:38.352551', '12', 'None', 3, '', 9, 1),
(51, '2020-03-30 04:53:13.365712', '13', 'None', 3, '', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'company'),
(9, 'accounts', 'drug'),
(7, 'accounts', 'nafdacnumber'),
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

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-20 12:11:22.654994'),
(2, 'auth', '0001_initial', '2020-03-20 12:11:42.355121'),
(3, 'admin', '0001_initial', '2020-03-20 12:11:46.220342'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-20 12:11:46.307347'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-20 12:11:46.419354'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-20 12:11:48.256459'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-20 12:11:49.658539'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-20 12:11:50.845607'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-20 12:11:51.015616'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-20 12:11:51.774660'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-20 12:11:51.811662'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-20 12:11:51.904667'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-20 12:11:53.050733'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-20 12:11:54.217800'),
(15, 'sessions', '0001_initial', '2020-03-20 12:11:55.829892'),
(16, 'accounts', '0001_initial', '2020-03-23 16:54:06.905503'),
(17, 'accounts', '0002_nafdacnumber_reference_number', '2020-03-24 12:05:40.565264'),
(18, 'accounts', '0003_company', '2020-03-24 16:51:39.815242'),
(19, 'accounts', '0004_drug', '2020-03-29 12:30:58.793358'),
(20, 'accounts', '0005_auto_20200329_1417', '2020-03-29 13:17:37.723123'),
(21, 'accounts', '0006_auto_20200329_1608', '2020-03-29 15:08:44.233425'),
(22, 'accounts', '0007_auto_20200329_1619', '2020-03-29 15:20:38.585284'),
(23, 'accounts', '0008_auto_20200329_1620', '2020-03-29 15:20:38.825298'),
(24, 'accounts', '0009_auto_20200329_1624', '2020-03-29 15:24:46.294452'),
(25, 'accounts', '0010_auto_20200329_1642', '2020-03-29 15:42:58.614929'),
(26, 'accounts', '0011_auto_20200329_1711', '2020-03-29 16:12:04.135767');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('101h6w69cej307j3u7litldtsmpn2m4u', 'ZGIzM2FhMzk1NDczNzBmYzAyYTQwMzFhZjQwYjlkNjk5ZTMzN2U2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwODAwY2EzMmEzZWZhMzFlNTI5Y2JkYTFmMDE1YWFkZWU5MGQxOWYzIn0=', '2020-04-03 12:15:50.135293'),
('dkrakx0j5l25tjiw6ywvkfzxhl9oyy69', 'MDI0ZjM5YWE5NTQzNzc0YTAxYmYzYjQ0Mjc5OTBkN2M0ZDE4ZTAwZDp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWI1Yjk1MTBkOGViODQzODAxNmQwYmU5YTg5ODRiNTljZTQzMThhMSJ9', '2020-04-14 12:32:39.549737');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_company`
--
ALTER TABLE `accounts_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nafdac_number_id` (`nafdac_number_id`);

--
-- Indexes for table `accounts_drug`
--
ALTER TABLE `accounts_drug`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_drug_nafdac_number_id_00993c28` (`nafdac_number_id`);

--
-- Indexes for table `accounts_nafdacnumber`
--
ALTER TABLE `accounts_nafdacnumber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_company`
--
ALTER TABLE `accounts_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `accounts_drug`
--
ALTER TABLE `accounts_drug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `accounts_nafdacnumber`
--
ALTER TABLE `accounts_nafdacnumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_company`
--
ALTER TABLE `accounts_company`
  ADD CONSTRAINT `accounts_company_nafdac_number_id_c177ab2a_fk_auth_user_id` FOREIGN KEY (`nafdac_number_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
