-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jan 07, 2021 at 07:40 PM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vocab`
--

-- --------------------------------------------------------

--
-- Table structure for table `card_items`
--

DROP TABLE IF EXISTS `card_items`;
CREATE TABLE IF NOT EXISTS `card_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `card_items_user_id_foreign` (`user_id`),
  KEY `card_items_item_state_id_foreign` (`item_state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card_items`
--

INSERT INTO `card_items` (`id`, `user_id`, `item_state_id`, `extra`, `created_at`, `updated_at`) VALUES
(378, 5, 9, NULL, '2020-12-01 21:39:05', '2020-12-01 21:39:05'),
(377, 5, 14, NULL, '2020-11-26 07:40:25', '2020-11-26 07:40:25'),
(376, 5, 13, NULL, '2020-11-26 07:40:25', '2020-11-26 07:40:25'),
(375, 5, 11, NULL, '2020-11-26 07:40:25', '2020-11-26 07:40:25'),
(374, 5, 10, NULL, '2020-11-26 07:40:25', '2020-11-26 07:40:25'),
(373, 7, 39, NULL, '2020-11-23 13:04:18', '2020-11-23 13:04:18'),
(372, 7, 42, NULL, '2020-11-23 13:04:18', '2020-11-23 13:04:18'),
(371, 5, 43, NULL, '2020-11-11 15:25:24', '2020-11-11 15:25:24'),
(370, 5, 46, NULL, '2020-11-11 15:25:24', '2020-11-11 15:25:24'),
(369, 5, 45, NULL, '2020-11-11 15:25:24', '2020-11-11 15:25:24'),
(368, 5, 44, NULL, '2020-11-11 15:25:24', '2020-11-11 15:25:24'),
(367, 5, 26, NULL, '2020-11-11 15:25:24', '2020-11-11 15:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('words','phrases','verbs','conversations','stories','exercises') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('beginner','intermediate','advanced') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `type`, `level`, `name`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(28, 'words', 'beginner', 'dd', '1600756045-therapy-item (copy).png', NULL, '2020-09-22 06:27:25', '2020-09-22 06:27:25'),
(30, 'words', 'beginner', 'aaaaa', '1600756209-video-bg.png', NULL, '2020-09-22 06:30:09', '2020-09-22 06:30:09'),
(31, 'exercises', NULL, 'xcxc', '1600756257-health-workers (copy).png', NULL, '2020-09-22 06:30:57', '2020-09-22 06:30:57'),
(32, 'exercises', NULL, 'sdf', '1600756301-video-bg (copy).png', 31, '2020-09-22 06:31:41', '2020-09-22 06:31:41'),
(34, 'words', 'beginner', 'A', '1600758161-1200px-Visual_Studio_Code_1.35_icon.svg.png', NULL, '2020-09-22 07:02:42', '2020-09-22 07:02:42'),
(35, 'words', 'beginner', 'aaa', '1600758175-1200px-Visual_Studio_Code_1.35_icon.svg.png', 34, '2020-09-22 07:02:56', '2020-09-22 07:02:56'),
(36, 'exercises', NULL, 'aaaa', '1600842588-A3.jpg', NULL, '2020-09-23 06:29:49', '2020-09-23 06:29:49'),
(37, 'words', 'beginner', 'juegos', '1600923492-a473654ded34be100afd29cea45c1087.jpg', 28, '2020-09-24 04:58:12', '2020-09-24 04:58:12'),
(39, 'words', 'intermediate', 'test', '1602068000-client-icon.png', NULL, '2020-10-07 10:53:20', '2020-10-07 10:53:20'),
(40, 'words', 'advanced', 'xcvxcvbcxv', '1602068082-circle.png', NULL, '2020-10-07 10:54:42', '2020-10-07 10:54:42'),
(42, 'phrases', 'intermediate', 'sdfga ertretet', '1602071447-item-school-man.png', NULL, '2020-10-07 11:50:48', '2020-10-07 11:50:48'),
(43, 'phrases', 'advanced', 'dfsg dfsg', '1602071464-enterprise-item1.png', NULL, '2020-10-07 11:51:05', '2020-10-07 11:51:05'),
(44, 'verbs', 'beginner', 'dsfg dsfgsd', '1602071679-video-bg1.png', NULL, '2020-10-07 11:54:40', '2020-10-07 11:54:40'),
(45, 'verbs', 'intermediate', 'dgs sgdf', '1602071696-home-banner.png', NULL, '2020-10-07 11:54:56', '2020-10-07 11:54:56'),
(46, 'verbs', 'advanced', 'dfg fdsgsfd', '1602071751-schools-icon4.png', NULL, '2020-10-07 11:55:51', '2020-10-07 11:55:51'),
(47, 'words', 'intermediate', 'food', '1602139794-download.jpg', NULL, '2020-10-08 06:49:54', '2020-10-08 06:49:54'),
(48, 'phrases', 'intermediate', 'fooooood', '1602139837-download.jpg', NULL, '2020-10-08 06:50:37', '2020-10-08 06:50:37'),
(50, 'phrases', 'beginner', 'phhhhhhhhh', '1603260433-ph.jpg', NULL, '2020-10-21 06:07:13', '2020-10-21 06:07:13'),
(51, 'phrases', 'beginner', 'p sub', '1603260491-ph.jpg', 50, '2020-10-21 06:08:11', '2020-10-21 06:08:11'),
(52, 'words', 'beginner', 'puiouiouio', '1603260767-ph.jpg', 30, '2020-10-21 06:12:47', '2020-10-21 06:12:47'),
(53, 'words', 'beginner', 'yuikyukhjkhjk', '1603260780-ph.jpg', 30, '2020-10-21 06:13:00', '2020-10-21 06:13:00'),
(55, 'conversations', 'intermediate', 'fooooood', '1603804627-rm.jpg', NULL, '2020-10-27 13:17:07', '2020-10-27 13:17:07'),
(56, 'conversations', 'advanced', 'p sub', '1603804681-slider_puffin_before_mobile.jpg', NULL, '2020-10-27 13:18:01', '2020-10-27 13:18:01'),
(57, 'conversations', 'advanced', 'cccccccccccccc', '1603804724-ph.jpg', 56, '2020-10-27 13:18:44', '2020-10-27 13:18:44'),
(58, 'conversations', 'advanced', 'rtyrtyrtyrtyrtyrty', '1603804799-Beer-in-China.jpg', 56, '2020-10-27 13:19:59', '2020-10-27 13:19:59'),
(59, 'words', 'beginner', 'nature', '1604575289-nat.jpeg', NULL, '2020-11-05 11:21:29', '2020-11-05 11:21:29'),
(60, 'words', 'beginner', 'nature category', '1604575313-nat1.jpg', 59, '2020-11-05 11:21:53', '2020-11-05 11:21:53'),
(69, 'stories', 'beginner', 'story cat', '1605596158-nat9.jpg', NULL, '2020-11-17 06:55:58', '2020-11-17 06:55:58'),
(70, 'stories', 'beginner', 'story sub cat', '1605596183-105796174-1552653879432gettyimages-1130590361r.jpg', 69, '2020-11-17 06:56:23', '2020-11-17 06:56:23'),
(71, 'exercises', 'beginner', 'ex', '1605616969-105796174-1552653879432gettyimages-1130590361r.jpg', NULL, '2020-11-17 12:42:50', '2020-11-17 12:42:50'),
(72, 'exercises', 'beginner', 'ex 1', '1605616989-slider_puffin_before_mobile.jpg', NULL, '2020-11-17 12:43:09', '2020-11-17 12:43:09'),
(73, 'exercises', 'beginner', 'ggg', '1605617008-download.jpg', NULL, '2020-11-17 12:43:28', '2020-11-17 12:43:28'),
(74, 'exercises', 'beginner', 'fghfgh', '1605617021-download.jpg', 71, '2020-11-17 12:43:41', '2020-11-17 12:43:41'),
(75, 'words', 'beginner', 'new', '1606812369-slider_puffin_before_mobile.jpg', NULL, '2020-12-01 08:46:09', '2020-12-01 08:46:09'),
(76, 'words', 'beginner', 'new c', '1606812380-105796174-1552653879432gettyimages-1130590361r.jpg', 75, '2020-12-01 08:46:20', '2020-12-01 08:46:20'),
(77, 'conversations', 'beginner', 'new', '1606812475-slider_puffin_before_mobile.jpg', NULL, '2020-12-01 08:47:55', '2020-12-01 08:47:55'),
(78, 'conversations', 'beginner', 'new c', '1606812486-nat6.jpg', 77, '2020-12-01 08:48:06', '2020-12-01 08:48:06'),
(79, 'phrases', 'beginner', 'client', '1607429141-nat8.jpg', NULL, '2020-12-08 12:05:41', '2020-12-08 12:05:41'),
(80, 'phrases', 'beginner', 'client sub', '1607429158-apple.png', NULL, '2020-12-08 12:05:58', '2020-12-08 12:05:58'),
(81, 'phrases', 'beginner', 'cllllll', '1607429180-nat11.jpg', 80, '2020-12-08 12:06:20', '2020-12-08 12:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `conversation_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversation_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eg_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `current_state` enum('learning','learned','default') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversations_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `category_id`, `conversation_en`, `record_en`, `conversation_es`, `record_es`, `image`, `eg_link`, `visible`, `current_state`, `created_at`, `updated_at`) VALUES
(7, 78, 'asdasdsad', '1606825003en-8.mp3', 'asdasdasd', '1606825003es-11.mp3', '1606825003-nat7.jpg', 'asdasdasd', 1, 'default', '2020-12-01 12:16:43', '2020-12-01 12:16:43'),
(8, 78, 'title en', '1607073214en-11.mp3', 'title es', '1607073214es-10.mp3', '1607073214-nat8.jpg', 'dsfsdfsdfsdfsdf', 1, 'default', '2020-12-04 09:13:34', '2020-12-04 09:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
CREATE TABLE IF NOT EXISTS `exercises` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1',
  `visible` tinyint(4) DEFAULT '1',
  `words` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exercise_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exercise_es` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercises_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `category_id`, `type`, `visible`, `words`, `image`, `title`, `record_en`, `record_es`, `exercise_en`, `exercise_es`, `created_at`, `updated_at`) VALUES
(2, 32, 1, 1, '', '1600811224-video-bg.png', 'test', NULL, NULL, 'test', 'test', '2020-09-22 21:47:05', '2020-09-24 05:09:59'),
(3, 32, 2, 1, 'dfg,fg', NULL, 'fg', NULL, NULL, 'dfsg dsg rg', 'fgfg dsg sf', '2020-09-24 05:18:55', '2020-09-24 05:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
CREATE TABLE IF NOT EXISTS `faq` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'faq',
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faq_id_index` (`id`),
  KEY `faq_question_index` (`question`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `type`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'faq', 'What is Award Interpretation?', 'fgh fghfgh fghfgh fghfgh fgh', '2020-10-14 09:56:33', '2020-10-14 09:56:33'),
(2, 'terms-of-use', 'What if my employees don\'t own a smartphone?', 'sdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdgsdg g fdg fffffffff fgdfgfdg fdg', '2020-10-14 09:57:23', '2020-10-14 09:57:23'),
(3, 'privacy-policy', 'What makes KeepShift different?', 'What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift What makes KeepShift', '2020-10-14 09:57:38', '2020-10-14 09:57:38'),
(4, 'faq', 'ghgh', 'ghgh', '2020-10-15 13:12:34', '2020-10-15 13:12:34'),
(5, 'privacy-policy', 'bbbbbbbbbbbb', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2020-10-15 13:44:44', '2020-10-15 13:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `flashcards`
--

DROP TABLE IF EXISTS `flashcards`;
CREATE TABLE IF NOT EXISTS `flashcards` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `word_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `word_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flashcards_group_id_foreign` (`group_id`),
  KEY `flashcards_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flashcards`
--

INSERT INTO `flashcards` (`id`, `user_id`, `group_id`, `word_en`, `word_es`, `image`, `created_at`, `updated_at`) VALUES
(1, 7, 31, 'fghfghgfhtyutyu', 'rtyufghjfytutyu', '5f96a766cb017.jpg', '2020-10-26 10:39:34', '2020-10-26 10:39:34'),
(2, 7, 31, 'mmmmm', 'ppppppppp', '5f96a7cbb8b48.jpg', '2020-10-26 10:41:15', '2020-10-26 10:41:15'),
(3, 7, 31, 'bbbb', 'bbbb', '5f96af9ebe1c0.jpg', '2020-10-26 11:14:38', '2020-10-26 11:14:38'),
(4, 7, 33, 'zzzzz', 'zzzzz', '5f96afcf2ec6f.jpg', '2020-10-26 11:15:27', '2020-10-26 11:15:27'),
(5, 5, 39, 'Bike watch', 'Bici reloj', '5f9904c36af04.jpg', '2020-10-28 05:42:27', '2020-10-28 05:42:27'),
(6, 5, 39, 'Heart', 'Corazon', '5f990688c6fa0.jpg', '2020-10-28 05:50:00', '2020-10-28 05:50:00'),
(7, 7, 31, 'Asaasaaaa', 'Asa', '5f990e395b596.jpg', '2020-10-28 06:22:49', '2020-10-28 06:22:49'),
(8, 7, 42, 'nnnnnnnnnnor', 'nor', '5f99100110a9e.jpg', '2020-10-28 06:30:25', '2020-10-28 06:30:25');

-- --------------------------------------------------------

--
-- Table structure for table `flashcard_groups`
--

DROP TABLE IF EXISTS `flashcard_groups`;
CREATE TABLE IF NOT EXISTS `flashcard_groups` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flashcard_groups_parent_id_foreign` (`parent_id`),
  KEY `flashcard_groups_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flashcard_groups`
--

INSERT INTO `flashcard_groups` (`id`, `user_id`, `parent_id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'test 1', NULL, '2020-10-15 09:59:51', '2020-10-15 09:59:51'),
(2, NULL, NULL, 'test 2', NULL, '2020-10-15 10:00:00', '2020-10-15 10:00:00'),
(3, NULL, NULL, 'test 3', NULL, '2020-10-15 10:00:04', '2020-10-15 10:00:04'),
(4, NULL, 1, 'a1', NULL, '2020-10-15 10:00:18', '2020-10-15 10:00:18'),
(5, NULL, 1, 'a2', NULL, '2020-10-15 10:00:23', '2020-10-15 10:00:23'),
(6, NULL, NULL, 'a2', NULL, '2020-10-22 12:47:33', '2020-10-22 12:47:33'),
(12, 1, NULL, 'asdasdasd', '5f92882f0f038.jpg', '2020-10-23 07:37:19', '2020-10-23 07:37:19'),
(13, NULL, NULL, 'asdasdasdsad', '5f92ad6de2a12.jpg', '2020-10-23 10:16:13', '2020-10-23 10:16:13'),
(14, NULL, NULL, 'qqqqqqqqqqqqq', '5f92b83f3dfb3.jpg', '2020-10-23 11:02:23', '2020-10-23 11:02:23'),
(15, NULL, NULL, 'new', '5f92ba956c137.jpg', '2020-10-23 11:12:21', '2020-10-23 11:12:21'),
(16, NULL, NULL, 'fghfghfgh', '5f92beb1215ea.jpg', '2020-10-23 11:29:53', '2020-10-23 11:29:53'),
(17, NULL, NULL, 'yyyyyyyyy', '5f92bfc05d8a0.jpg', '2020-10-23 11:34:24', '2020-10-23 11:34:24'),
(18, NULL, NULL, 'llllllllllllllll', '5f92c0b4a8505.jpg', '2020-10-23 11:38:28', '2020-10-23 11:38:28'),
(19, NULL, NULL, 'ppppppppppppppp', '5f92c872b7074.jpg', '2020-10-23 12:11:30', '2020-10-23 12:11:30'),
(20, NULL, NULL, 'mmmm', '5f92c95423209.jpg', '2020-10-23 12:15:16', '2020-10-23 12:15:16'),
(21, 7, NULL, 'www', '5f92d33c145ac.jpg', '2020-10-23 12:57:32', '2020-10-23 12:57:32'),
(22, 7, NULL, 'fdgdfgdfg', '5f92d4cb64df0.jpg', '2020-10-23 13:04:11', '2020-10-23 13:04:11'),
(23, 7, NULL, 'gfhfghftghfgh', '5f92d4e8533e7.jpg', '2020-10-23 13:04:40', '2020-10-23 13:04:40'),
(24, 7, NULL, 'asdasdasdsad', '5f92d7f18d7a5.jpg', '2020-10-23 13:17:37', '2020-10-23 13:17:37'),
(25, 7, NULL, 'bnbnmbnm', '5f92dcc4f1566.jpg', '2020-10-23 13:38:13', '2020-10-23 13:38:13'),
(26, 7, NULL, 'bvnbvnvbnbvn', '5f92dd2f67ebe.jpg', '2020-10-23 13:39:59', '2020-10-23 13:39:59'),
(27, 7, NULL, 'ghjghjghjhgj', '5f92df970fa24.jpg', '2020-10-23 13:50:15', '2020-10-23 13:50:15'),
(28, 7, NULL, 'ghjghjghj', '5f92dff7ead0c.jpg', '2020-10-23 13:51:52', '2020-10-23 13:51:52'),
(29, 7, NULL, 'ghjhgjghj', '5f92e08f46457.jpg', '2020-10-23 13:54:23', '2020-10-23 13:54:23'),
(30, 7, 24, 'sub', '5f92e0dbe8991.jpg', '2020-10-23 13:55:40', '2020-10-23 13:55:40'),
(31, 7, 21, 'yutyutyutyu', '5f92e3795aff1.jpg', '2020-10-23 14:06:49', '2020-10-23 14:06:49'),
(32, 7, 21, 'fghfghfghgfh', '5f9676a12c599.jpg', '2020-10-26 07:11:29', '2020-10-26 07:11:29'),
(33, 7, 21, 'aaaaa', '5f96779018f7a.jpg', '2020-10-26 07:15:28', '2020-10-26 07:15:28'),
(34, 7, 21, 'dsfsdfsdf', '5f967f0bee474.jpg', '2020-10-26 07:47:24', '2020-10-26 07:47:24'),
(35, 7, 21, '123', '5f967f9c40b55.jpg', '2020-10-26 07:49:48', '2020-10-26 07:49:48'),
(36, 7, 21, 'ffffffffffff', '5f967ffad0f16.jpg', '2020-10-26 07:51:22', '2020-10-26 07:51:22'),
(37, 7, 21, 'nwa', '5f9681e0a3324.jpg', '2020-10-26 07:59:28', '2020-10-26 07:59:28'),
(38, 5, NULL, 'Sport devices', '5f9901ea7a52a.jpg', '2020-10-28 05:30:18', '2020-10-28 05:30:18'),
(39, 5, 38, 'Bikes', '5f9902c6a024b.jpg', '2020-10-28 05:33:59', '2020-10-28 05:33:59'),
(40, 5, 38, 'Bikes', '5f9902db50c3f.jpg', '2020-10-28 05:34:19', '2020-10-28 05:34:19'),
(41, 7, NULL, 'Sss', '5f9906c86ce77.jpg', '2020-10-28 05:51:05', '2020-10-28 05:51:05'),
(42, 7, 41, 'Rrr', '5f9906da03d7c.jpg', '2020-10-28 05:51:22', '2020-10-28 05:51:22'),
(43, 7, 41, 'Fff', '5f9906eab4fea.jpg', '2020-10-28 05:51:39', '2020-10-28 05:51:39'),
(44, 7, 22, 'ssssss', '5f990e0369ab0.jpg', '2020-10-28 06:21:55', '2020-10-28 06:21:55'),
(45, 7, 21, 'Xbxbxnx', '5f990e73c9f16.jpg', '2020-10-28 06:23:48', '2020-10-28 06:23:48');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` int(10) UNSIGNED NOT NULL,
  `imageable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_states`
--

DROP TABLE IF EXISTS `item_states`;
CREATE TABLE IF NOT EXISTS `item_states` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_state` enum('learning','learned','default','in_card') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_states_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_states`
--

INSERT INTO `item_states` (`id`, `user_id`, `item_id`, `type`, `current_state`, `created_at`, `updated_at`) VALUES
(3, 7, 12, 'words', 'learned', '2020-01-23 12:55:59', '2020-02-21 10:04:33'),
(2, 1, 12, 'words', 'learned', '2020-10-23 12:13:47', '2020-10-23 12:13:47'),
(4, 7, 13, 'words', 'learned', '2020-10-23 12:55:59', '2020-11-20 10:04:33'),
(5, 7, 15, 'words', 'learned', '2020-10-23 12:55:59', '2020-11-20 10:04:33'),
(6, 7, 16, 'words', 'learned', '2020-10-23 12:55:59', '2020-11-23 06:43:18'),
(7, 7, 17, 'words', 'learned', '2020-10-23 12:55:59', '2020-11-20 10:04:33'),
(8, 7, 18, 'words', 'learned', '2020-10-23 12:55:59', '2020-11-20 10:04:33'),
(9, 5, 12, 'words', 'default', '2020-10-27 19:58:32', '2020-12-01 21:38:06'),
(10, 5, 13, 'words', 'learning', '2020-10-27 19:58:55', '2020-11-11 15:01:31'),
(11, 5, 15, 'words', 'learned', '2020-10-27 19:58:55', '2020-11-26 08:08:10'),
(12, 5, 16, 'words', 'learned', '2020-10-27 19:58:55', '2020-11-10 15:33:49'),
(13, 5, 17, 'words', 'default', '2020-10-27 19:58:55', '2020-12-01 21:38:02'),
(14, 5, 18, 'words', 'default', '2020-10-27 19:58:55', '2020-12-01 21:38:04'),
(51, 8, 15, 'words', 'default', '2020-12-01 12:31:59', '2020-12-04 09:23:10'),
(16, 7, 20, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-25 06:44:10'),
(17, 7, 21, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(18, 7, 22, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(19, 7, 23, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(20, 7, 24, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(21, 7, 25, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(22, 7, 26, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(23, 7, 27, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(24, 7, 28, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-23 06:44:10'),
(25, 7, 29, 'words', 'learned', '2020-11-05 11:33:51', '2020-11-20 06:44:10'),
(26, 5, 19, 'words', 'learning', '2020-11-05 17:53:15', '2020-11-05 17:53:15'),
(46, 5, 22, 'words', 'in_card', '2020-11-11 15:25:24', '2020-11-11 15:25:24'),
(45, 5, 21, 'words', 'learning', '2020-11-11 15:19:04', '2020-11-11 15:19:04'),
(44, 5, 20, 'words', 'learned', '2020-11-11 15:18:54', '2020-11-11 15:18:58'),
(43, 5, 3, 'phrases', 'learned', '2020-11-11 15:03:26', '2020-11-26 08:11:18'),
(42, 7, 19, 'words', 'learned', '2020-11-09 13:14:56', '2020-11-11 05:50:41'),
(40, 7, 4, 'phrases', 'learned', '2020-11-09 10:44:43', '2020-11-11 06:33:41'),
(39, 7, 3, 'phrases', 'learned', '2020-11-09 10:44:43', '2020-11-11 06:33:41'),
(50, 8, 13, 'words', 'default', '2020-12-01 12:31:59', '2020-12-04 09:23:10'),
(49, 8, 12, 'words', 'default', '2020-12-01 12:31:59', '2020-12-04 09:23:10'),
(52, 8, 16, 'words', 'default', '2020-12-01 12:31:59', '2020-12-04 09:23:10'),
(53, 8, 17, 'words', 'default', '2020-12-01 12:31:59', '2020-12-04 09:23:10'),
(54, 8, 18, 'words', 'default', '2020-12-01 12:31:59', '2020-12-04 09:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_16_083112_create_images_table', 1),
(7, '2020_08_02_223526_create_categories_table', 2),
(9, '2020_08_04_113703_create_words_table', 3),
(10, '2020_08_09_210140_create_phrases_table', 4),
(11, '2020_08_09_213714_create_verbs_table', 5),
(12, '2020_08_09_220008_create_news_table', 6),
(13, '2020_08_10_124808_create_conversations_table', 7),
(14, '2020_08_10_124833_create_stories_table', 7),
(16, '2020_09_14_212937_create_exercises_table', 8),
(17, '2016_06_01_000001_create_oauth_auth_codes_table', 9),
(18, '2016_06_01_000002_create_oauth_access_tokens_table', 9),
(19, '2016_06_01_000003_create_oauth_refresh_tokens_table', 9),
(20, '2016_06_01_000004_create_oauth_clients_table', 9),
(21, '2016_06_01_000005_create_oauth_personal_access_clients_table', 9),
(22, '2020_10_06_095728_add_avatar_to_users_table', 10),
(23, '2020_10_07_080837_create_user_notifications_table', 11),
(24, '2020_10_08_102926_add_current_state_to_words_table', 12),
(25, '2020_10_08_103224_add_current_state_to_phrases_table', 12),
(26, '2020_10_08_103316_add_current_state_to_verbs_table', 12),
(27, '2020_10_08_103413_add_current_state_to_conversations_table', 12),
(28, '2020_10_08_103508_add_current_state_to_stories_table', 12),
(29, '2019_08_19_125149_faq', 13),
(30, '2020_02_21_105543_create_options_table', 13),
(31, '2020_10_15_061550_create_studied_table', 14),
(32, '2020_10_15_091344_create_flashcard_groups_table', 15),
(33, '2020_10_15_092007_create_flashcards_table', 15),
(34, '2020_10_22_130725_image_to_flashcards_table', 16),
(35, '2020_10_22_130725_image_to_flashcard_groups_table', 17),
(36, '2020_10_23_100834_create_item_states_table', 18),
(37, '2020_10_23_111753_add_current_state_to_studied_table', 18),
(38, '2020_10_23_122454_add_user_id_to_flashcards_table', 19),
(39, '2020_10_23_122611_add_user_id_to_flashcard_groups_table', 19),
(41, '2020_10_28_111106_create_card_items_table', 20),
(42, '2020_11_16_065916_create_user_conversations_table', 21),
(43, '2020_11_16_093059_add_columns_to_stories_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `image`, `description`, `visible`, `created_at`, `updated_at`) VALUES
(2, 'aaaaa', '1600758286-1200px-Visual_Studio_Code_1.35_icon.svg.png', 'Toward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"', 1, '2020-09-22 07:04:46', '2020-10-07 08:25:56'),
(3, 'Simplify Your Business', '1602057718-about-us-icon1.png', 'Toward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company.\r\n\r\n\"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy.\r\n\r\nThen Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. \r\n\r\nLooking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\n\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"\r\n\r\nToward the end of an April 2018 hearing in the nation\'s capital, Sen. Kamala Harris leaned into her microphone and offered Facebook CEO Mark Zuckerberg a frank and unflattering assessment of his company. \"I have to tell you, I\'m concerned about how much Facebook values trust and transparency,\" the California Democrat told Zuckerberg. The CEO was being grilled by lawmakers over a scandal involving Cambridge Analytica, a data consultancy that scraped user information from the social network to help Donald\'s Trump\'s 2016 candidacy. Then Harris, who is now the Democratic nominee for vice president, zeroed in on a particularly troubling point: Facebook\'s failure to tell users that Cambridge Analytica had misappropriated their data. \"Were you part of a discussion that resulted in a decision not to inform your users?\" the senator asked Zuckerberg. Looking uncomfortable, the CEO responded, \"I don\'t remember a conversation like that.\"', 1, '2020-10-07 08:01:58', '2020-10-07 08:25:41'),
(4, 'Laravel Redirect HTTP to HTTPS via .htaccess', '1602057751-banner-bg.png', 'Cách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:\r\n\r\nCách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:\r\n\r\nCách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:\r\n\r\nCách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:\r\n\r\nCách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:\r\n\r\nCách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:\r\n\r\n\r\nCách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. \r\n\r\nTốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::)\r\n\r\nCách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau:', 1, '2020-10-07 08:02:32', '2020-10-07 08:26:12'),
(5, 'Geo Chart Example', '1602066105-enterprise-item1.png', 'cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau: Cách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. Tốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::) Cách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau: Cách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. Tốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::) Cách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau: Cách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. Tốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::) Cách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau: Cách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. Tốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::) Cách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .htaccess in thư mục root như sau: Cách chúng ta có thể redirect từ HTTP to HTTPS trong Laravel, ta biết rằng thư mục cấu trúc của laravel có một thư mục là /public, có một số bạn thường tìm cách làm sao để gõ http://localhost/project là sẽ hiện ra website, thay vì mặc định là http://locahost/project/public. Tốt nhất bạn không nên phá bỏ cấu trúc của laravel, nhiều bạn copy .htaccess và index.php trong public ra root và chỉnh sửa nó để có thể http://localhost/project, nhưng nếu làm vậy bạn sẽ bị một lỗi bảo mật đó là file .env sẽ bị phát hiện http://localhost/project/.env ::) Cách tốt nhất bạn giữ nguyên cấu trúc laravel như ban đâu, và bạn tiến hành tạo file .h', 1, '2020-10-07 10:21:46', '2020-10-07 10:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0067138b1ba97c8e3741b55e951decb5e5cd7154e1b17930dee34f865a33a3ab51326dc586f0e833', 7, 1, 'MyApp', '[]', 0, '2020-11-03 08:08:11', '2020-11-03 08:08:11', '2021-05-03 08:08:11'),
('009bad13c712c0d4f3e6d2774c5a02012bf3b979b8eced23b8ceaa5ffe0b7687d156a9230bad8e2d', 7, 1, 'MyApp', '[]', 0, '2020-11-23 13:21:22', '2020-11-23 13:21:22', '2021-05-23 13:21:22'),
('00f9a790f1867fea7b07f8aba7d465a2115462fed1ab0bb696afa593e4f1948e5c9beaac9f1b39ed', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:48:39', '2020-10-20 13:48:39', '2021-04-20 13:48:39'),
('0103c238845fd411037761ae249ce8583ebc70dd2c09ce40514e812acbe105b8416762a005673334', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:18:39', '2020-10-07 13:18:39', '2021-04-07 13:18:38'),
('0115d04cdcbb2ffdc0fbd5b7af85f418186b4c30f9bc1dd49f4e4af809e03b206deb2acb764daef2', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:24:19', '2020-10-07 07:24:19', '2021-04-07 07:24:19'),
('014a48504b21248a38d72375c4f03d578cdedbf18094978838779134caddd055c15d4c758b0d7cb4', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:53:06', '2020-10-21 13:53:06', '2021-04-21 13:53:06'),
('015e5d799a17c4b29399b2e8df1e78b2ce18fa878e532e6d7a5c0757e9fbadd7493b0a4e968c75c9', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:35:16', '2020-10-07 13:35:16', '2021-04-07 13:35:16'),
('016435b6429855be647bf7498532a93332d94739497751d93f71c17e9522759e462a34b4fc088bdb', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:20:46', '2020-10-06 13:20:46', '2021-04-06 13:20:45'),
('018860f01baca899e125eef01e64973738bca1718619934507118c5c448b884fb7015350be78667e', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:21:25', '2020-10-06 13:21:25', '2021-04-06 13:21:25'),
('01de2758b4d2511daa89e545b39452b49046a0f8cecbc7a092533e221f50707472fe955a743c8214', 7, 1, 'MyApp', '[]', 0, '2020-11-02 06:27:08', '2020-11-02 06:27:08', '2021-05-02 06:27:08'),
('02232716705beedf7800c1fde27ccb4b69db8c23c0609e083f78f0df10a2a71122272b239038d555', 7, 1, 'MyApp', '[]', 0, '2020-10-26 13:50:03', '2020-10-26 13:50:03', '2021-04-26 13:50:03'),
('0236ff536fedb4b3546dd2085a942a55b01c4ddd1ce36ee37d9d5cc8effb6b04d905ddaffbfdfe77', 7, 1, 'MyApp', '[]', 0, '2020-10-29 05:58:32', '2020-10-29 05:58:32', '2021-04-29 05:58:32'),
('023e800c6ee6324d925736f43ebe0f7306a311880ea0b07e6bea8a4f8ae451732e42ff791a1349b7', 4, 1, 'MyApp', '[]', 0, '2020-10-08 08:27:34', '2020-10-08 08:27:34', '2021-04-08 08:27:34'),
('024c15a0df3a2575ee924ba791af61a67a3e311f451c24b42cc9a46747f62c099fab35c26a956982', 5, 1, 'MyApp', '[]', 0, '2020-10-23 12:47:32', '2020-10-23 12:47:32', '2021-04-23 12:47:32'),
('024e5347bfc9443a6aae40dfd033a95706b679d2f61974c747c0011e8d3bd07ec58c4982b9da0f51', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:44:13', '2020-10-15 06:44:13', '2021-04-15 06:44:13'),
('0257f3a7482c06f8d90016a3af735ae25604fae8ecb29815e28279d77d7540ffacf5527704b64784', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:20:03', '2020-10-06 13:20:03', '2021-04-06 13:20:03'),
('03892d11019622bbf5211fe309d08916ce9ed460f8ae74a3a341656edd98a46e4691f1c441e1e804', 8, 1, 'MyApp', '[]', 0, '2020-12-08 11:53:31', '2020-12-08 11:53:31', '2021-06-08 11:53:31'),
('03dcd91d1aa7a4b1c8f9cfc2c9da604be3411331f215f6358452d0a87432003636ce854bd2874d40', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:06:38', '2020-10-14 08:06:38', '2021-04-14 08:06:38'),
('03e00bfaa770afa104ceb7a1f0309b3cd8d79a10ecbe90bcee061fdf4a561dd40cdaeea5b801cb53', 4, 1, 'MyApp', '[]', 0, '2020-10-15 08:05:03', '2020-10-15 08:05:03', '2021-04-15 08:05:03'),
('0401f81df4579172d2b1deaf89d17835bbee3ae89394e5afe98b834522f01331391488ff5cd5881e', 7, 1, 'MyApp', '[]', 0, '2020-11-11 06:05:51', '2020-11-11 06:05:51', '2021-05-11 06:05:51'),
('045e43b80c2b9ecf6e740a36668627f844cacbaf484740dfa4457f9151a1d11cfccca21ba21e8058', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:35:55', '2020-10-12 13:35:55', '2021-04-12 13:35:55'),
('04653ad2861e97fa04a6f5b6ec824c73b7a33e4d93b017ae28f1bc34368febadc9d3c0ae7d2016bd', 7, 1, 'MyApp', '[]', 0, '2020-10-23 10:57:56', '2020-10-23 10:57:56', '2021-04-23 10:57:55'),
('048c41cee9efa531ca45728d59158c82fe93c7eb66cbf1d01fd66787230c3554a17480142641ceb7', 5, 1, 'MyApp', '[]', 0, '2020-10-21 16:16:45', '2020-10-21 16:16:45', '2021-04-21 16:16:45'),
('04a0c41db7d1c9206dbba2372457491a4d4b2c20cbded38c53216a9df58d40e1b14bb656b204b381', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:09:51', '2020-10-13 13:09:51', '2021-04-13 13:09:51'),
('04a604d75736986cdf38f15e04281ecc4484e42d4409119efadc306c6bf4b8b1f45e32b52d57033e', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:23:32', '2020-10-12 08:23:32', '2021-04-12 08:23:32'),
('04ba72e9d822b40651e1433ddd1cb832c1b77c7bf788b3dd6cbd48a539ba48146aeb936cecac75f1', 7, 1, 'MyApp', '[]', 0, '2020-11-05 07:16:30', '2020-11-05 07:16:30', '2021-05-05 07:16:30'),
('04d4d97ab335d3f694c5fcceffb45ce9ef49cbc90b3ff995ba1985dd93835f162287f01b5b2bb47e', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:05:06', '2020-10-22 11:05:06', '2021-04-22 11:05:06'),
('058670a7b1a40137de332708d083c74c0a24c6ce065db6677bc09bbaf2524b433ea255532d405e45', 8, 1, 'MyApp', '[]', 0, '2020-12-07 07:14:40', '2020-12-07 07:14:40', '2021-06-07 07:14:40'),
('05f8de3450538c7115bc2ca6b0399baead7306612663dd7222721e3f1a6b53b76119848f97852a92', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:39:08', '2020-10-06 11:39:08', '2021-04-06 11:39:08'),
('05fba81c480720c5ee582e52e3b185b9ce8e575a51cb073054d0a6e98c674a6f34e9fbe9e8d6b3d3', 7, 1, 'MyApp', '[]', 0, '2020-11-26 12:06:31', '2020-11-26 12:06:31', '2021-05-26 12:06:31'),
('0633090b8621546faf3d36842240abbdd509aba21e6ce69a4db87ab2a6f72cc34928d65a7e9ffdba', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:54:59', '2020-10-06 13:54:59', '2021-04-06 13:54:59'),
('067de8520bf6df276cf66cda703593653ad761bfeddbee2eef3c417cd0e8b24baf03ed71cfd12a9d', 5, 1, 'MyApp', '[]', 0, '2020-12-05 16:33:11', '2020-12-05 16:33:11', '2021-06-05 16:33:11'),
('070b9c1a596edf297f174962206a58c20687fa2e2d89a0df2324248f6aeff04f84d785a62ee54acd', 5, 1, 'MyApp', '[]', 0, '2020-12-10 16:13:46', '2020-12-10 16:13:46', '2021-06-10 16:13:46'),
('072268a8c7b4d5d6026f03ea4828bde996cf5ea1fc0fbc71e186e89c865e3460639764e1473f5f54', 4, 1, 'MyApp', '[]', 0, '2020-10-09 06:02:54', '2020-10-09 06:02:54', '2021-04-09 06:02:54'),
('075e8863bb01bf8383a6fef6b2c74cb2ef130e48a610f11adc9bfab6af0f3e53fd7b08b671c7739b', 4, 1, 'MyApp', '[]', 0, '2020-10-16 14:00:41', '2020-10-16 14:00:41', '2021-04-16 14:00:40'),
('076c39c23692ed8199b43d35efba4e61e0501f9b799a84f83c7fa79d49400aac20b500409a4310ff', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:43:24', '2020-10-07 06:43:24', '2021-04-07 06:43:24'),
('07a5979a81f16817bb15d301f5f44b47ad006db8af8fefdb8c708eff90cee830b7610af3f977e4c3', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:03:56', '2020-10-09 12:03:56', '2021-04-09 12:03:56'),
('080236043f9edc090ea972fa5d477751736a2e86b8d840044f551dcd1d2557b4c15f5de470b5dfc4', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:21:19', '2020-10-29 10:21:19', '2021-04-29 10:21:19'),
('09c0c28ef6a11a1dc406954c5f9c303aa7b871701a3709198ddf675a34943f8d4a2b3ced6dea8589', 7, 1, 'MyApp', '[]', 0, '2020-11-04 10:32:12', '2020-11-04 10:32:12', '2021-05-04 10:32:12'),
('09e3c8b7114e7e248d92b38bb1f5f2ac3bd3aa322dd01dc225fcafa67b1f40b8abd18ec12d2b2e55', 7, 1, 'MyApp', '[]', 0, '2020-10-15 08:09:38', '2020-10-15 08:09:38', '2021-04-15 08:09:38'),
('0a1c048d7b6be9557c6e2ebb4b8b23c899e5abde2c32c24c7584ad23c0c4ca78485dffc46caefd75', 4, 1, 'MyApp', '[]', 0, '2020-10-08 11:37:12', '2020-10-08 11:37:12', '2021-04-08 11:37:12'),
('0a34f3d82a88be9a36dc41cb8bf1e2f6b962e1cf5ebab5ef930e931d3e4c8ab42c8fcf23ec011ec8', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:53:07', '2020-10-15 12:53:07', '2021-04-15 12:53:07'),
('0a59406cafaed591b52f4c7fc5e69675034d6b6cfe958c660f9fc68015de89ada8cce3e97c40cc4c', 4, 1, 'MyApp', '[]', 0, '2020-10-20 08:26:07', '2020-10-20 08:26:07', '2021-04-20 08:26:07'),
('0a7804d9020d766fbe1704c2c61dccf1e7e942f905fa03d42d41e8e1dc7efb39320327b9bf4db138', 2, 1, 'MyApp', '[]', 0, '2020-10-08 06:19:24', '2020-10-08 06:19:24', '2021-04-08 06:19:24'),
('0a878b798336c74ced5d2f5b563300e6d81076f0c62b33b5ab116814aad6cbcb70fa24728e6298d4', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:54:08', '2020-11-06 07:54:08', '2021-05-06 07:54:08'),
('0af89f8fbc6bf0a89832d6d6faca00d37a3977547cc547babf51888946fced03fb91bb43aad12bf4', 8, 1, 'MyApp', '[]', 0, '2020-12-04 08:10:15', '2020-12-04 08:10:15', '2021-06-04 08:10:15'),
('0b043b34716bfaf7c7e6db052538dbed28658e677f5a02190e57208442363acae8857661f08d3cf0', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:46:44', '2020-10-13 12:46:44', '2021-04-13 12:46:44'),
('0b06c595380edc39441f637c23e82339639b5d562d26556023d6ae654e8b1b1d411ca69b83af58ab', 8, 1, 'MyApp', '[]', 0, '2020-12-10 07:17:44', '2020-12-10 07:17:44', '2021-06-10 07:17:44'),
('0b074d30b7eaec93969a651747615e1965cfa8f5c6b39514b2a48711265a1607257dc0439ced7a4b', 7, 1, 'MyApp', '[]', 0, '2020-10-29 11:00:25', '2020-10-29 11:00:25', '2021-04-29 11:00:25'),
('0b1112c5ebd59d353356edd308dd6a3e3926ff82613d38a6e5860ec723b45dfcff4fd6480d9ffaf9', 7, 1, 'MyApp', '[]', 0, '2020-11-03 14:37:04', '2020-11-03 14:37:04', '2021-05-03 14:37:04'),
('0b3c618ea7559cabd37b2f644a57dc5be6a80a8ebdc1390d7c5c36e8e72f65d6ce66a985aba7e16e', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:41:48', '2020-10-21 12:41:48', '2021-04-21 12:41:47'),
('0b593ac30282c6fad8e9b7adf98d7d937a72bcbf061203dd528f3d0644c548634fcd727885f7a849', 7, 1, 'MyApp', '[]', 0, '2020-11-03 11:59:57', '2020-11-03 11:59:57', '2021-05-03 11:59:57'),
('0b6a9e48f8d05368b6696d1dcab7e91992115d2a7fc03f20379542369ec7c4e851bd471261718865', 5, 1, 'MyApp', '[]', 0, '2020-11-25 17:00:43', '2020-11-25 17:00:43', '2021-05-25 17:00:43'),
('0bcd1d56d90bcc74e59379cd108e495aae6cd1db2ed1ebd4bdb23bae2671569e64a0086bb129960b', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:35:31', '2020-10-09 13:35:31', '2021-04-09 13:35:31'),
('0bdf0f7759aa8901f6266fcf2a99a4e8ed5bf4ec26e23b1bf7fdc404d36715fea85e97258f68f311', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:24:40', '2020-10-08 08:24:40', '2021-04-08 08:24:40'),
('0c14fa7f9cf7f3efa8e18d76f7b445ff20e5900c90045388ab1c715438261ccd9258faa583bd413a', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:41:49', '2020-10-26 12:41:49', '2021-04-26 12:41:49'),
('0c43a4e8781cb4a65b15c3373a815774a4da231fcfa0fcd6f0d4886020447d74dd44db7ed781d68a', 7, 1, 'MyApp', '[]', 0, '2020-11-26 12:05:03', '2020-11-26 12:05:03', '2021-05-26 12:05:03'),
('0c56f5221fef3c242501b19880f4a9e620cfc41744af8d7c87275b0bb8aa28b3b49c1bb909decbed', 7, 1, 'MyApp', '[]', 0, '2020-11-18 06:01:38', '2020-11-18 06:01:38', '2021-05-18 06:01:38'),
('0cce74c1fa1958f171ede7d8ac37cae939c5f5abb22a4f101a0f96ca973c1f3dcabc6ef30cb83362', 7, 1, 'MyApp', '[]', 0, '2020-11-11 05:49:53', '2020-11-11 05:49:53', '2021-05-11 05:49:53'),
('0d91723d323e24159d157734bda47424f90934f43f5eb1135366f6813882ed2fac564c528dd9ac18', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:04:00', '2020-10-22 11:04:00', '2021-04-22 11:04:00'),
('0db08e6927e17b12ee9978c1f9584b691e546475823fee9d0daec4be0e826909196a1a4337af8f6d', 4, 1, 'MyApp', '[]', 0, '2020-10-16 13:58:12', '2020-10-16 13:58:12', '2021-04-16 13:58:12'),
('0dfbba7bf1de22cbec614b54e106a116d1881398edf9f9f4890f7d251df195c91f179495e3ca704f', 4, 1, 'MyApp', '[]', 0, '2020-10-16 10:59:19', '2020-10-16 10:59:19', '2021-04-16 10:59:19'),
('0e4f59fcaf019433f75f706b4c6e7396dab24fa54f37e83167ad3fdb0cf4c42ddff0a58d1498cb4d', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:23:31', '2020-10-13 13:23:31', '2021-04-13 13:23:31'),
('0eca110648639db1cd17acd0d224c8cdf2bdc571afb6e34fc3dc5f4001078a6c5fefbd17cfc22df5', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:01:07', '2020-10-14 08:01:07', '2021-04-14 08:01:07'),
('0ef6e6f1bd5bdbf8997623b1fc71522ce771f4dadae4975e81dd8048b7958fc267e3ad33f31603a1', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:28:01', '2020-10-06 12:28:01', '2021-04-06 12:28:01'),
('0fa02eb9c00646da03084383cf1ad114d8ad59223bc3688ad02dea5a0df8d03fb81089ddc9312d42', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:36:39', '2020-10-29 10:36:39', '2021-04-29 10:36:39'),
('0feccd107ef61eebd64bc1426a36efd1990a07165746d84aa873ecddd895ca49c2d39c5565dc910f', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:31:24', '2020-10-13 07:31:24', '2021-04-13 07:31:24'),
('10b3791a4fff93223b82b5c960fa07cdf6db1964693681342b09ddd32fe14bba7f3e1d68523abfd2', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:52:13', '2020-10-06 11:52:13', '2021-04-06 11:52:13'),
('10ecf852ae2f399b9385c313f02b4cbfe5b4c17043a00d66fb970c98a52193283047cdcfe03c8b28', 7, 1, 'MyApp', '[]', 0, '2020-10-22 13:50:15', '2020-10-22 13:50:15', '2021-04-22 13:50:15'),
('115a22be1399ebc6a3188e27c0f781a5ebc614c8bc1bf9f258e451c8d39560cd9d6e830ce3b134c5', 7, 1, 'MyApp', '[]', 0, '2020-10-26 13:56:15', '2020-10-26 13:56:15', '2021-04-26 13:56:15'),
('119d2672487d195e6645f84e15a095530aa24e17510111515568dd0829d2142c05b552b1b1e1a22b', 7, 1, 'MyApp', '[]', 0, '2020-10-20 12:25:26', '2020-10-20 12:25:26', '2021-04-20 12:25:26'),
('125607686fda59251477293f960f8062e8a4cf71a471adb61a593c555840f30f7b4735437cc576a0', 7, 1, 'MyApp', '[]', 0, '2020-11-17 05:43:31', '2020-11-17 05:43:31', '2021-05-17 05:43:31'),
('1264569b99cc1153d6b302a2f8160d46565225ce6f5d5596c9d9cd6475e2c6a79b11788987bb9b65', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:57:10', '2020-10-15 06:57:10', '2021-04-15 06:57:10'),
('1290707400c21834be4186c3fb47588d292e0de9f689b2f7362f00db8a2a47848f707e4063a812a7', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:43:42', '2020-10-19 13:43:42', '2021-04-19 13:43:42'),
('12e5257674ddadc5445276e1c32288bceff639c4e95341433f4483441efe1ff077277e41ef02c961', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:49:33', '2020-11-20 12:49:33', '2021-05-20 12:49:33'),
('1305e9dd5ef8488e7077aa9c147ea7de12c000c02399c5ebd5385b1d97185a7521f08818476eba91', 4, 1, 'MyApp', '[]', 0, '2020-10-16 08:31:55', '2020-10-16 08:31:55', '2021-04-16 08:31:55'),
('1319b2bd4d503e609c10d5c26d6ba8595a353817563ce449efd8ab9f2104ec0fac4d5aed2b940603', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:58:24', '2020-11-04 07:58:24', '2021-05-04 07:58:24'),
('13358f5f0ee19ba60449082cf09ec65ec4523f1a581150aa8c9a3a0235d6716d3fd65a979ec703f9', 8, 1, 'MyApp', '[]', 0, '2020-12-04 09:38:56', '2020-12-04 09:38:56', '2021-06-04 09:38:56'),
('13893621b8bcd7a36da318d23435d52a2a9bd530ac54ae70bb672931e8394ecffdba96e3a1b701c5', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:26:28', '2020-10-12 10:26:28', '2021-04-12 10:26:27'),
('1395ec1099b02497218e3162070d0645798243a5520d48c6504040167b79573f210641c8ca82b212', 4, 1, 'MyApp', '[]', 0, '2020-10-12 06:42:12', '2020-10-12 06:42:12', '2021-04-12 06:42:12'),
('139fd52ce773bb8afda004bf0fc42ec29a5d54311585c5744e5db94c66ec0a59dd74ec77cf8be000', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:41:52', '2020-10-06 13:41:52', '2021-04-06 13:41:52'),
('13ef27fc9c0f9007b9fa5f34b09537fea7e1151235ee6ea598cc64cb4537b825d8af1c3a1daa3cef', 7, 1, 'MyApp', '[]', 0, '2020-11-03 12:51:10', '2020-11-03 12:51:10', '2021-05-03 12:51:10'),
('13f365c3cf184e72b44e90542657d52fb328bfc33f21511a623f0c187e9a55deacdc83fcb2934c35', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:12:37', '2020-10-12 11:12:37', '2021-04-12 11:12:37'),
('141b3ba154b340be015cadb8382982c922bc6bf5b62645f98934f43b225c412e99b26760e02b9b5c', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:04:45', '2020-10-14 08:04:45', '2021-04-14 08:04:45'),
('145f15264ef0b89bb68ed27419b222f06a7903d9b40e22687b9e692d151da398a1eb523d61749cd2', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:36:58', '2020-10-13 12:36:58', '2021-04-13 12:36:58'),
('14b3576cd3ca15134e282d4304a7d8dda5c5b9f55b3c82ba9f360e29e6af9899edda6fe7aa3dbcd1', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:54:05', '2020-10-21 12:54:05', '2021-04-21 12:54:05'),
('14fd6b1f5d7d546bd3efac124f80b71f285ab02240b94bf0e2b26954e26702eef6f88ae2f3ec185e', 6, 1, 'MyApp', '[]', 0, '2020-10-11 08:44:40', '2020-10-11 08:44:40', '2021-04-11 08:44:40'),
('155819d667d9144899822ae1936175d0a24897efd68876e93f422c2dfdea0921274ab21c35221586', 8, 1, 'MyApp', '[]', 0, '2020-12-08 12:01:39', '2020-12-08 12:01:39', '2021-06-08 12:01:39'),
('1593eb81f8b1095bf077bd8c2abbe3944a1355024b30299bbe2511a855c3890aa81eaa5cc5f898ba', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:24:01', '2020-11-16 11:24:01', '2021-05-16 11:24:01'),
('160c96be52ddc39b75acae8f8922bdd1d6593c0e4d3711e280c065ddd2ea1af10e92818ac0599cd9', 4, 1, 'MyApp', '[]', 0, '2020-10-14 11:23:21', '2020-10-14 11:23:21', '2021-04-14 11:23:21'),
('170e84a5232bca948170e1a856a7669c05d9199565dbac9b0721c9ac3dbe123e3d9ac2c7ca44455a', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:54:09', '2020-11-04 07:54:09', '2021-05-04 07:54:09'),
('173f202fe603b2aebb63539039d3cc9c51839129928a1ae8f1ce80bd6840a3071f345ed11fcf9503', 7, 1, 'MyApp', '[]', 0, '2020-11-06 05:54:21', '2020-11-06 05:54:21', '2021-05-06 05:54:21'),
('181be67e6c628899be1d98de2a3363ab3981cccb71a1e61ac78efaf623f308d7b05c5c95a335b66e', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:02:47', '2020-10-15 10:02:47', '2021-04-15 10:02:47'),
('181c859a7467d8796f53d7db5eeb0bfef6eb56c8dc6bfdf5288d143e06a28c56db0a561040cfd0b1', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:35:43', '2020-10-15 10:35:43', '2021-04-15 10:35:43'),
('1823a194b15174614a4622254b3992ea978c2ef20145a7495abee754a8ba910bf9074d5d21706f1f', 4, 1, 'MyApp', '[]', 0, '2020-10-14 11:19:43', '2020-10-14 11:19:43', '2021-04-14 11:19:43'),
('18b5de362c7d228d0e29fbe9ea6cfc99328dc8a45658add335c8bbb95a745b4c790960c5f2c2135c', 7, 1, 'MyApp', '[]', 0, '2020-11-06 11:30:55', '2020-11-06 11:30:55', '2021-05-06 11:30:55'),
('1945fbdfa38694e1ecbf6e32059e0daa1f06e5aeeecae6b6d1c6eec1543e09fe8f86aea8cf2022e9', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:04:35', '2020-10-22 11:04:35', '2021-04-22 11:04:35'),
('199f9978d5a9eb8cc7e3f14443be1111c3a4bc48a75e1c5650b1bfa393575c6eaf0bc79564e253b2', 7, 1, 'MyApp', '[]', 0, '2020-11-16 12:13:11', '2020-11-16 12:13:11', '2021-05-16 12:13:11'),
('1a45d7645692afe6f75753f15f17c067404353d894f896a4cf43f0a8859fc6b9b2250aed27eecea4', 4, 1, 'MyApp', '[]', 0, '2020-10-12 06:14:03', '2020-10-12 06:14:03', '2021-04-12 06:14:03'),
('1a683ec665735cfca052121d3e0448981f0f017a0b988b580d18c8c8ae26dd4c8bc52df70f03ff1c', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:47:06', '2020-10-08 13:47:06', '2021-04-08 13:47:06'),
('1a976a7b4a14d9ccac44e383495093c49b6615b95674582bf16db1cb77e41339e87ec3d872626737', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:43:24', '2020-10-13 07:43:24', '2021-04-13 07:43:24'),
('1ad82de6261f92a3e23e7bed347d69dc2679e57351ee1f9ac763b44ec4c80030f5a4974f5ff0cffc', 5, 1, 'MyApp', '[]', 0, '2020-11-16 15:09:36', '2020-11-16 15:09:36', '2021-05-16 15:09:36'),
('1ad93f0c0ea5ad4dffdd8b4a3da84d99883cdf069d1b8c1c21872df2febe9275264bda54901d5258', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:02:44', '2020-11-04 07:02:44', '2021-05-04 07:02:44'),
('1af89aade63c57dac966835ad1937fc676f6d6ea538f54f6f34a713e3fbc4087bc9888e02bf3ba5c', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:40:58', '2020-10-06 13:40:58', '2021-04-06 13:40:58'),
('1b054c7865bf56a54d8e6d4f8ab5667f1108ca8bb3c9312ad7ff788c292c483b6165d0e96e65b9cd', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:54:29', '2020-10-13 12:54:29', '2021-04-13 12:54:29'),
('1b3d0ea23fba2c7e93b87c224f20cae353e88ab2becbf5600a4a7ec4e98193e2b1d14d902b383657', 1, 1, 'MyApp', '[]', 0, '2020-10-06 10:09:43', '2020-10-06 10:09:43', '2021-04-06 10:09:43'),
('1bd12e58462786e61e7f480814c15fcfab0103ceac2160250e0aed891908a0783b45606749c89095', 7, 1, 'MyApp', '[]', 0, '2020-11-18 06:54:30', '2020-11-18 06:54:30', '2021-05-18 06:54:29'),
('1bd8cf470f49578af00a3ad4062c873ea10366ab8e77d3b325d2cf56660fd4d3c9326662bd6aca77', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:30:09', '2020-10-12 07:30:09', '2021-04-12 07:30:09'),
('1c481587cf10743a6a53bd79fcc7e6738d314cd3e32bc9e3e2be489569fbf98af3c03c1142023cfc', 7, 1, 'MyApp', '[]', 0, '2020-10-27 17:59:52', '2020-10-27 17:59:52', '2021-04-27 17:59:52'),
('1d7a534807bebc7cd69756ead0d96835e7c936d5e35893dbfa8181759e97a8cefdba62a4e1ca7375', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:59:45', '2020-10-09 12:59:45', '2021-04-09 12:59:45'),
('1e228ca2ae0f8827320c4be7277a8d9ae06696f7d1e702d8c4cfd37e7042fdedbff44f8498cca4a1', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:14:24', '2020-11-20 12:14:24', '2021-05-20 12:14:24'),
('1e2ac4a15aa311f6a5aa0b4e4307fcc9b4e4c98aaff60c9cad093a53c62ece551dc9f4769b4b68b3', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:23:23', '2020-10-08 08:23:23', '2021-04-08 08:23:23'),
('1e3017d087a20aee5559ae37f5c95a4bf8cecf8a4bdfd253631226144a8dc05db2e26cae32e5d398', 7, 1, 'MyApp', '[]', 0, '2020-11-25 12:00:43', '2020-11-25 12:00:43', '2021-05-25 12:00:43'),
('1e61590b395c9d06268332b8ff7c8a18050f639933a7b1fc8d5e3ad457a193b2fd7a0052493da6fc', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:24:47', '2020-11-04 07:24:47', '2021-05-04 07:24:47'),
('1f00aa2ee3829bfe69ff9d6a9b4959616426c71b048b8f658f9f5b5ee721292baffd1434bc109ee1', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:23:59', '2020-10-15 12:23:59', '2021-04-15 12:23:59'),
('1f1039239351a3ddb960c996c1eb96d35d9f58541732a9e4f7cf74517669ef36fe3f2406a6d27b7a', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:45:47', '2020-10-08 12:45:47', '2021-04-08 12:45:47'),
('1f31a8e13cc912ef2876b96df6e590c2c6c5011e0ef8630519872733f915dd350b4f6c6cc176136b', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:11:19', '2020-10-14 08:11:19', '2021-04-14 08:11:19'),
('1f6621287877b18764aa6c4b5e53895cf01d8a0dee87e3de78e11d926fb527e27d692ec57b4d34a0', 7, 1, 'MyApp', '[]', 0, '2020-11-23 13:49:11', '2020-11-23 13:49:11', '2021-05-23 13:49:11'),
('1f8bbf8f2916ba2e267df129da2ed21feff33d962cbf997bde633ef8b3db11f19ff805f8d1648486', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:22:50', '2020-10-09 11:22:50', '2021-04-09 11:22:49'),
('2016f99038d5c3033c045286c3c226301a042762d6ffef474db968d1314d07d3061307f93bee4265', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:41:23', '2020-11-06 07:41:23', '2021-05-06 07:41:23'),
('20342b57442c61b5047387f9704536d9b099bd2153f3ebf34ff46e0ac9ea0d3dcba4c72d51d3ab98', 7, 1, 'MyApp', '[]', 0, '2020-10-21 06:03:35', '2020-10-21 06:03:35', '2021-04-21 06:03:35'),
('20b555db8f50d2bf53f4f113ef65f82b3c37e643cf387ba82abe8400f7ba8d4bc8d155f8fcc638e0', 1, 1, 'MyApp', '[]', 0, '2020-10-06 13:52:35', '2020-10-06 13:52:35', '2021-04-06 13:52:35'),
('20d2adb46a3fece0e40821a60d8768836c3852ef7d0f8dfc65be23aecdac0b3ad0f7db1b53cea19c', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:49:30', '2020-11-03 13:49:30', '2021-05-03 13:49:30'),
('20ed44262b8a1067de82b631498bdb303e6913586e9b3a455eeae90be6c7066889b8f0c68f86cca6', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:46:55', '2020-10-26 12:46:55', '2021-04-26 12:46:55'),
('20fcb3a0e5f8defc606a7a2668921f924c9bec270bd29a136642077b2383d3f7160ca75f284763db', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:33:51', '2020-10-23 11:33:51', '2021-04-23 11:33:51'),
('210674e0b64d7ab7d7ed90400c1bdb2a3d8ca0693df85ec40281b8025b3aceaf7bf8eca8584915ff', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:47:45', '2020-10-12 10:47:45', '2021-04-12 10:47:45'),
('2120b8c964d26b886608c6f3054a615ba89df1dfc8d0707d0d1b4d816de61b6fe0dbb643492bebdf', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:03:08', '2020-10-08 12:03:08', '2021-04-08 12:03:08'),
('214120b661debe83881ffb60522f96ed6f0cdb9cdd22b8a2494334a6b96e0fe14cf10a01270b6f91', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:30:17', '2020-11-20 11:30:17', '2021-05-20 11:30:16'),
('220a700ac2f8afc5f113bb2649f67ab9c9f36a2f85d0871948b771593a9b211a213cb3360044ca18', 7, 1, 'MyApp', '[]', 0, '2020-11-16 06:44:15', '2020-11-16 06:44:15', '2021-05-16 06:44:15'),
('222b79ae9599b1ab03d7295a3048b2ed0726ba68c4fe041014299cd79e34bba48884d131c3072341', 5, 1, 'MyApp', '[]', 0, '2020-10-16 13:39:01', '2020-10-16 13:39:01', '2021-04-16 13:39:01'),
('2307d40dd58b83c3511d3023c60c46e587ddc717acd0105a2ac3e55e38803d98c0ffcc0bac0e75f2', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:47:02', '2020-10-29 07:47:02', '2021-04-29 07:47:02'),
('2321b2a1457f2246eb4bc029af620b6b1bb8a7b393654dd33909c0bad0a79ed6d9675a4387456c1b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:03:13', '2020-10-13 08:03:13', '2021-04-13 08:03:13'),
('24109361157932877f21f4dc30f0b694fe7572111c986b707261fbdccb67dce78e023f485a4e3e69', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:50:29', '2020-10-26 12:50:29', '2021-04-26 12:50:29'),
('2447ae3fee54f45fee94f79f97a1aac09fdc696fffd96aaf25dc7d60980fbbf04b3a8d54e8787dba', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:37:03', '2020-10-13 12:37:03', '2021-04-13 12:37:03'),
('247df9363a4c80825170f7c81cbf73dff62c951cd8278f5cc9170f9c59631c8c003aadb29983a383', 7, 1, 'MyApp', '[]', 0, '2020-11-03 11:41:56', '2020-11-03 11:41:56', '2021-05-03 11:41:56'),
('2491dba59b3b6034554693dcfd1b29c7828dbc6daec5d86ffa93939d602ef6c45e8659ed93f7e5da', 4, 1, 'MyApp', '[]', 0, '2020-10-09 05:45:20', '2020-10-09 05:45:20', '2021-04-09 05:45:20'),
('24a50402cc6218cc7ed09a07c44f81584a806e5f40bb1edeaa9b475e11384e7d44192644386250f5', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:04:17', '2020-11-04 07:04:17', '2021-05-04 07:04:17'),
('24a57f8176699a4a78946c7f9faf34c511356a8a58e851a3382d9cc205d1613899fffb191585410a', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:11:01', '2020-10-09 13:11:01', '2021-04-09 13:11:01'),
('24cbbeaeda623aabfa9c6c04ddc5716e40e5ac606805a336288cda42da1836ce1463c553c5a8887d', 4, 1, 'MyApp', '[]', 0, '2020-10-09 07:21:53', '2020-10-09 07:21:53', '2021-04-09 07:21:53'),
('24db22aa14569c0e21369e708de9911eb3226e6ac9708cd0f91135af944118a0c9b559fd1b5ea864', 7, 1, 'MyApp', '[]', 0, '2020-11-16 14:09:14', '2020-11-16 14:09:14', '2021-05-16 14:09:14'),
('2577b3a0efe02c441bb41478574f2181a9ed128f7f58b8cfeee96cf7c27ae828f82f63a9507782b1', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:29:08', '2020-10-12 07:29:08', '2021-04-12 07:29:08'),
('25ec3020397e23185aa00cf6588d1a07603e7042e2582cc348cee80f8141ea19970379824ce80bc6', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:51:31', '2020-11-06 07:51:31', '2021-05-06 07:51:31'),
('25f120a1e6275c7cfbe2e9c669c4c19b84b6db72a8acf2f4071c2fbe0eba278ab775ca106b8c21c5', 7, 1, 'MyApp', '[]', 0, '2020-11-04 08:17:42', '2020-11-04 08:17:42', '2021-05-04 08:17:42'),
('25f4e57c7f49bafd19c82a26eacabd6367b2f46722fc7d6b332298d8b65f141926391ce2d4e83872', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:51:09', '2020-10-26 12:51:09', '2021-04-26 12:51:09'),
('25fd1c6cf91a30aac298f32ce39be409eaccde25d44f214c8eb0358df6dece413891daa45a5aac31', 4, 1, 'MyApp', '[]', 0, '2020-10-16 06:02:39', '2020-10-16 06:02:39', '2021-04-16 06:02:39'),
('2631aacc761c740dd1bdc1c0dd8a50f75c72f1f0db7b13d7d76752b509f3c4dd5ce5b9dd2cdd600f', 8, 1, 'MyApp', '[]', 0, '2020-12-04 09:22:56', '2020-12-04 09:22:56', '2021-06-04 09:22:56'),
('2694e96e5ebd155b23474fd1e9cc1107534cead3c2b71205fad5bb66d9a10fd371b9757ab6d9e367', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:53:16', '2020-10-06 13:53:16', '2021-04-06 13:53:16'),
('26a082dc825447f8b65d25138ac50f88d162bcac1f8ee2e3959574e00698e6180a5087b57888047b', 9, 1, 'MyApp', '[]', 0, '2020-12-04 12:09:13', '2020-12-04 12:09:13', '2021-06-04 12:09:13'),
('270eff1ef2d99a8e6385d82b6465774e2ad2c6b174dfd9660a20a57093d48619d4ee076f97feb8a9', 7, 1, 'MyApp', '[]', 0, '2020-11-27 13:43:13', '2020-11-27 13:43:13', '2021-05-27 13:43:13'),
('2714d92121a7d753703e650447788add5246ccde7e6817f7c312f56e55fe3e5e0a12c3e871eef8d8', 7, 1, 'MyApp', '[]', 0, '2020-11-17 06:15:16', '2020-11-17 06:15:16', '2021-05-17 06:15:16'),
('2725cf15a47daf8a1be7b48c508809c263c745163b3af6995b8bc26d121d72caa08058dab9ef990b', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:44:31', '2020-10-08 13:44:31', '2021-04-08 13:44:31'),
('2750dfc0aa48c033035a93547bd7a801ed77a35afca0810c787ec36597ce85883bf0f5817f6f87dc', 7, 1, 'MyApp', '[]', 0, '2020-10-26 06:58:07', '2020-10-26 06:58:07', '2021-04-26 06:58:07'),
('2786b58559ec8ea498a3ebf187852532e8d22a5c8e445f212002dd06527333fb673d8618223ed7ef', 7, 1, 'MyApp', '[]', 0, '2020-11-16 13:50:01', '2020-11-16 13:50:01', '2021-05-16 13:50:01'),
('27a82bec9f3de36a40bab652de7f92b2a6c521206c4ff4a3565bf35aaa2d9e2555b9e47b6af7f110', 7, 1, 'MyApp', '[]', 0, '2020-10-21 05:59:39', '2020-10-21 05:59:39', '2021-04-21 05:59:39'),
('284e262ad883d6ffe6765decc77c10c2aba32dd70235f41d35f1113433b7c3212fe0639108027d6a', 7, 1, 'MyApp', '[]', 0, '2020-11-03 07:21:44', '2020-11-03 07:21:44', '2021-05-03 07:21:44'),
('285d114c5e4f6867e79d42cea71f9261c5079da47e7a5073ed41d0757adc969d141cf70158258476', 7, 1, 'MyApp', '[]', 0, '2020-10-20 11:23:23', '2020-10-20 11:23:23', '2021-04-20 11:23:23'),
('28620fe4e7c92ce530745a620e8f39fdf4af29c64559d806e974a371db789c93c404aca515445f4a', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:18:13', '2020-10-09 11:18:13', '2021-04-09 11:18:13'),
('2895d2b7448f62ead94091bee434c54c6674ff60aa0e11bbcf6d82e1cc5388aa6eba5a8475f143fb', 7, 1, 'MyApp', '[]', 0, '2020-10-28 08:04:17', '2020-10-28 08:04:17', '2021-04-28 08:04:17'),
('28aa955337d0a2b0451edc7e8bae216579e9f60f77db696e1895651ff13150749a9ff963578fcdf6', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:01:11', '2020-10-14 07:01:11', '2021-04-14 07:01:10'),
('28dedc6dc4a7d32712300497f01ede55964a226f27405701fabbda88213322691b6a57602deea49e', 6, 1, 'MyApp', '[]', 0, '2020-10-11 08:40:00', '2020-10-11 08:40:00', '2021-04-11 08:40:00'),
('28f25c77ae956ee6cdda2073202ca5a5599c4085155209cbf434b10eaffb0ee7728b652d236a928c', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:50:55', '2020-11-06 07:50:55', '2021-05-06 07:50:55'),
('296695f811852b3cfc2ba76897ebf7ad700c874aec6f149049d6590def162a07868afe82b99f44cf', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:36:06', '2020-10-21 12:36:06', '2021-04-21 12:36:06'),
('296f0cd76eb8a231afc2d9f99a062865759fcfe3d45b6e4b34d337fa746735835cd5537d986f739b', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:43:57', '2020-10-29 07:43:57', '2021-04-29 07:43:57'),
('29b0a85476094077ba315066ce195bfb74a4bfe43a05229a169b5c094593c56f737a8509d3774289', 7, 1, 'MyApp', '[]', 0, '2020-11-23 10:18:15', '2020-11-23 10:18:15', '2021-05-23 10:18:15'),
('2a0407e3dd3daaeb3a5a237beb7242d4cf623b2618e6bc158df8302af37c13d489040ca29033b112', 5, 1, 'MyApp', '[]', 0, '2020-10-21 11:43:58', '2020-10-21 11:43:58', '2021-04-21 11:43:57'),
('2a6edeed57ca58d4dfae74dcb5ddb3e2d36ccaee28ceb54cd17b54cca2be134432e780720eb9c9b3', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:06:31', '2020-10-21 12:06:31', '2021-04-21 12:06:31'),
('2a9684074adabab22870c9dff939741b8632d457b9f4543ce8a9fa01918165ee4e8ab10d46a87888', 1, 1, 'MyApp', '[]', 0, '2020-09-30 07:40:46', '2020-09-30 07:40:46', '2021-03-30 07:40:46'),
('2a9e1613cec23478bdf25334f1c8adb5d65919c3f44beb331116b61087cabb908d7c76148ad24f35', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:37:24', '2020-10-12 11:37:24', '2021-04-12 11:37:24'),
('2abb0bab4a031bceea7e8d830148525beba9ec3ae102869fc0f1b12b6f7e077c620f81dc09bb3e75', 5, 1, 'MyApp', '[]', 0, '2020-11-26 07:59:41', '2020-11-26 07:59:41', '2021-05-26 07:59:41'),
('2ae15ecd12c9617d41362f161c65714e9ab8eb55b017f56a78a79971586859904d766e3e0eb04f94', 4, 1, 'MyApp', '[]', 0, '2020-10-15 07:47:54', '2020-10-15 07:47:54', '2021-04-15 07:47:54'),
('2aff3d3356f6ffbc3fba31c0b7604e915b05aa401b3c6a9ae1cb166164bf7d77adbe9e0180ab8e0d', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:54:55', '2020-10-30 11:54:55', '2021-04-30 11:54:55'),
('2b42989770661eefa997286837fcdfdb0fe6de2233acd9726decee4f6b757217cb4cfe7e2fd2163e', 7, 1, 'MyApp', '[]', 0, '2020-10-15 08:09:48', '2020-10-15 08:09:48', '2021-04-15 08:09:48'),
('2b47fe46909874cf11a4a03c978b1dfe8b4853d8c691216c736a559be8a0e07da94dc67c5e8004b1', 1, 1, 'MyApp', '[]', 0, '2020-10-06 11:59:10', '2020-10-06 11:59:10', '2021-04-06 11:59:10'),
('2b581e8f51391460b2933e94753864560886a9f5e9bed66ff0400dd4d34214eaa2e8280a1f135ff4', 7, 1, 'MyApp', '[]', 0, '2020-11-26 12:04:24', '2020-11-26 12:04:24', '2021-05-26 12:04:24'),
('2b9013815311baf85a832c8f804ce2ae41dc03b995dd407dc7c86415ec07e12a24bee474537bc900', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:55:23', '2020-10-14 06:55:23', '2021-04-14 06:55:23'),
('2c6fb64daa308ffac2906ef36d66aa59d1f475ce1ef2caf86c7f799903086f0de056a62cf77c0cd4', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:33:49', '2020-10-13 08:33:49', '2021-04-13 08:33:49'),
('2c918d9634de0a5ca1943120445a5469f323328fcc1b9abe219c2c50e84fe850c96cb5af72e0a3c4', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:08:35', '2020-10-21 08:08:35', '2021-04-21 08:08:35'),
('2d20a6dcd0e249e61a2ed1eb9b36b4bb4894f5a507638b6818a5d0daad14019a7f929e67c6c1fccb', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:45:21', '2020-10-09 12:45:21', '2021-04-09 12:45:21'),
('2d803ea5dc12b4c963f51565b30746fbf0a6946652ee516558667fac954eddc8b89c2417553b368d', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:15:41', '2020-10-09 13:15:41', '2021-04-09 13:15:41'),
('2d8dc0558d3975933418a208e1f6ee8c28af56a95a36f8d4501495a5ab5cf43ecd42311f4970a2d4', 5, 1, 'MyApp', '[]', 0, '2020-10-10 02:12:48', '2020-10-10 02:12:48', '2021-04-10 02:12:48'),
('2e2245430aeffe2d93c30eb2cfee4dfcf06deabf4b2819200b3b8ef07acead80470909fdcfc721d2', 7, 1, 'MyApp', '[]', 0, '2020-11-26 07:47:41', '2020-11-26 07:47:41', '2021-05-26 07:47:41'),
('2e26119b1811e48ef79ab991cb60bfa9631e24a7b1331f79fd78f8f7378a8caa014ee8e35e09bbb9', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:18:13', '2020-10-07 13:18:13', '2021-04-07 13:18:12'),
('2e5900594c08315f43c299966c20fea07b3b1287d64c74e5a0cc05350de578bba42193e6e30c0cd8', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:36:57', '2020-11-20 11:36:57', '2021-05-20 11:36:57'),
('2e5eaadcbea058c845705e5015bc005d2b9322b5d7fa6090cc0cfc9cbf9c0b7416c4eb4ce3133194', 7, 1, 'MyApp', '[]', 0, '2020-11-04 05:47:46', '2020-11-04 05:47:46', '2021-05-04 05:47:46'),
('2e6b2c58d5abf83ae711e19e2eecbf7bf24472ec9ac36d89712b19f5ad4fa28dbf449058108ed247', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:22:38', '2020-10-13 08:22:38', '2021-04-13 08:22:38'),
('2f0ab232ad7820a9501c39da312af7a3cd7c2ebcb0718ebee021ce4642fa5dd892b97162fcec8e8e', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:45:37', '2020-10-08 13:45:37', '2021-04-08 13:45:37'),
('2f1b6cf51f27aee35f0ea025f2c1fd33af37ca1466e50e4d697f93c6d89f769d8bd5d2eab1697b59', 7, 1, 'MyApp', '[]', 0, '2020-10-22 06:15:33', '2020-10-22 06:15:33', '2021-04-22 06:15:33'),
('2fd5a0622f695656fc6e78293142260cc9a7317eebfe50b9ddd6238bcb8333a38e9aad3bc6888ef6', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:59:19', '2020-10-30 11:59:19', '2021-04-30 11:59:19'),
('30134b7af3453191cb281a5750a15a9f222cfeb8ed3a36ac0399402e3c4e06df2bea26839962481e', 7, 1, 'MyApp', '[]', 0, '2020-10-27 13:59:24', '2020-10-27 13:59:24', '2021-04-27 13:59:24'),
('301de2f6c3eeebf1ac943538399ecec676b55dac262acfd436c04cd3122ab1f19f7b09e30f4f825c', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:25:35', '2020-10-12 08:25:35', '2021-04-12 08:25:35'),
('305c64b13a46fdff090612acfe9ddad0028f5088f15b71347d345157bcbc9a1a26ec59b477e9157c', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:43:46', '2020-10-14 07:43:46', '2021-04-14 07:43:46'),
('3103b3e7e198b93bb15cc67f97b97fb90ce0ecc76055326409ae89e158b08b0aefffab3a61ec1a5c', 5, 1, 'MyApp', '[]', 0, '2020-10-10 02:15:54', '2020-10-10 02:15:54', '2021-04-10 02:15:54'),
('3120d8f794d969b50d9f2a3f07801d8e9e70141566c33dce329b001ce6c8feed3e908e8112ac2ba8', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:38:11', '2020-10-07 07:38:11', '2021-04-07 07:38:11'),
('31380f471fa2362e4fe9982c8f12e69891ac14654e3b11eb98f8f57e2bb7eb422b082e989321f1c0', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:58:54', '2020-10-29 07:58:54', '2021-04-29 07:58:54'),
('318ec77edfbe92e1b58b8e2054600b7933a7d35e314e2630d6a5521763f46e350a00d3efc84e33ac', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:50:56', '2020-10-22 11:50:56', '2021-04-22 11:50:56'),
('31df4b9a8818d0f604a7b788ca6d314eae82346b750017546610ec5f3da31629f55edc34d572e14f', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:51:56', '2020-11-20 11:51:56', '2021-05-20 11:51:56'),
('320904743218338885ac4653c4bf563e7008153859606ad9ac1affdc66d328d4f2d6b323253d11b8', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:56:53', '2020-10-06 11:56:53', '2021-04-06 11:56:53'),
('3211facbd0503f1e7450318fe385a8ce638d807d4f51646a44a48af61cd0367001e3dda8ca51ad2e', 2, 1, 'MyApp', '[]', 0, '2020-10-07 08:21:43', '2020-10-07 08:21:43', '2021-04-07 08:21:43'),
('321f3b35947154b0b6bc2cfbfe2934d62f7b395e99215ccccf59c10937411a47e2ab05d34b34b3d4', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:14:26', '2020-10-15 12:14:26', '2021-04-15 12:14:26'),
('326a77f1553c8d5ab6f86dfacfb233d04ba035d5604810914e7d2fb4a57aa0bdbb2d388e13f84be6', 4, 1, 'MyApp', '[]', 0, '2020-10-09 07:47:52', '2020-10-09 07:47:52', '2021-04-09 07:47:52'),
('32898ad46600e902a10a28a40b87ed562a314ce00795037b14923d22ea9efec46fe897fac07b34f8', 4, 1, 'MyApp', '[]', 0, '2020-10-16 08:19:50', '2020-10-16 08:19:50', '2021-04-16 08:19:50'),
('32da87febb4043ad35560a2f291e80ea112fe5c0cd1f846e13d14b396cc0627da86e75e6828fa8f1', 7, 1, 'MyApp', '[]', 0, '2020-10-27 08:23:35', '2020-10-27 08:23:35', '2021-04-27 08:23:34'),
('32ff9553fc5d3e5e93bc64c6f8e48633e3ca7d3a3063311db8b16455750d86e74de870702cbd9cfe', 7, 1, 'MyApp', '[]', 0, '2020-11-09 13:10:02', '2020-11-09 13:10:02', '2021-05-09 13:10:02'),
('3333f7328a44ba6803089204a0ae5a46fc81f7067b839b6223c30a752bcaa4037f20a42336fe2bf6', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:34:38', '2020-10-13 13:34:38', '2021-04-13 13:34:38'),
('334157821d05630948ab452c0e5e3ea89609978d90852721f8b1dbfc11b2a4a7e15593e6a7420108', 7, 1, 'MyApp', '[]', 0, '2020-10-23 10:59:09', '2020-10-23 10:59:09', '2021-04-23 10:59:09'),
('33dc0fc216a1fdaad052fb3ada3697ee1a4df59c4365c955019fd4d04f26987b4765bb03f7a35c2e', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:53:54', '2020-10-29 07:53:54', '2021-04-29 07:53:53'),
('3413169b14de4f4170b419c7936fad20ef78146aa7b0d3a86f5531a58f90688adfb1def62849658f', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:20:42', '2020-10-12 10:20:42', '2021-04-12 10:20:42'),
('342ba8f6d06e24375c544192eb4de7daa83514c3edf608a1ea4cbdf439c26d08884f56735c6e8842', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:52:00', '2020-10-13 11:52:00', '2021-04-13 11:52:00'),
('34606453151a79b8e9760eda56d0ae942234b0be34601dc84400b82db3cf27e1749084c7d54ef875', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:19:33', '2020-10-12 11:19:33', '2021-04-12 11:19:33'),
('34b39006e8eac5dbf18e3e5c8d096a9c7c0f811171e562eee305a5ea889ac0a5f215eae484f56777', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:37:51', '2020-10-08 13:37:51', '2021-04-08 13:37:51'),
('34d609f6167046cc601897e2b146d1f97dd094e60c75fb5173740c95b6abbf55ce396d2f789c6def', 1, 1, 'MyApp', '[]', 0, '2020-09-29 08:18:49', '2020-09-29 08:18:49', '2021-03-29 08:18:48'),
('34e602e9c6bdc160aecc750de5de2218ca92ae8a5d8527a5cc1182cd171bef23db3d98c5886831fc', 4, 1, 'MyApp', '[]', 0, '2020-10-14 11:50:38', '2020-10-14 11:50:38', '2021-04-14 11:50:38'),
('3524065189d4b5984ece7a2c04990f6d10be4d8e764ba5dd6c41881b76772799030609df242d9039', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:41:25', '2020-10-29 07:41:25', '2021-04-29 07:41:25'),
('353d52e29c80d6734eedbe836cf826143f327c4250446727dc81d3d5546a79d9de3a41cbe8611cf0', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:50:06', '2020-10-06 11:50:06', '2021-04-06 11:50:06'),
('35502d5ebfc692f433bb9399cc2566864fb41ec51530b769036ec5d57bdc28cb3557072b0233738f', 9, 1, 'MyApp', '[]', 0, '2020-12-04 12:04:24', '2020-12-04 12:04:24', '2021-06-04 12:04:24'),
('355c0cff421457db8e4671adbd9fdf6e2f3c19aaff76b6475df266f6914b042100a2477c48523c6d', 4, 1, 'MyApp', '[]', 0, '2020-10-14 10:51:40', '2020-10-14 10:51:40', '2021-04-14 10:51:40'),
('3573cff46b6c19d07ce00b3b5bdd8044cb2a68d05ef6e3568bd03c09f9d41a34d014787be52993a6', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:26:56', '2020-10-29 06:26:56', '2021-04-29 06:26:56'),
('35a5d10588e98517fd98502271b3ab09afb9718265c07276883812cbe6b28fbca9d5c3c71f8000be', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:15:54', '2020-10-30 11:15:54', '2021-04-30 11:15:54'),
('35fd151a7503ce542036bf810ce09bedecfeb9ce08de6dd22dffad4c35053d116cec8345df1fabd4', 7, 1, 'MyApp', '[]', 0, '2020-11-23 12:20:32', '2020-11-23 12:20:32', '2021-05-23 12:20:32'),
('36416768de695fb7cdff8a518397c6245555d1762a01bfada43cfe9b4b2cdbf847355dfdabd75ac7', 8, 1, 'MyApp', '[]', 0, '2020-12-04 09:36:43', '2020-12-04 09:36:43', '2021-06-04 09:36:43'),
('3644485e575ae10c23d47811ea7d9713bf22a2cbd370c389683345cdfb0b7b12dfa1db8166315dbc', 4, 1, 'MyApp', '[]', 0, '2020-10-13 18:09:51', '2020-10-13 18:09:51', '2021-04-13 18:09:51'),
('37208afcece2c2f1c218e8178fa1ee4ec516287528ed50807a04e7f1d0b6fbc7825eb23102aa0b10', 5, 1, 'MyApp', '[]', 0, '2020-11-05 17:42:28', '2020-11-05 17:42:28', '2021-05-05 17:42:28'),
('373fc7209259eaba09fe2e212d2b5a46e46dc30a11249fd96ec9254382b4cd9ff4459cb55af713e8', 7, 1, 'MyApp', '[]', 0, '2020-11-05 06:31:32', '2020-11-05 06:31:32', '2021-05-05 06:31:32'),
('37ad2da6916244723a9e05ad068dadd9886df65899398950d29e21193e57b22d64d8ee3975d5995c', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:39:15', '2020-10-13 08:39:15', '2021-04-13 08:39:15'),
('37dceb357f8dffc64c180c86d5d3f2722d0433eb830781e8ba203e7775b4908a9c694a6f90940c40', 4, 1, 'MyApp', '[]', 0, '2020-10-09 06:02:44', '2020-10-09 06:02:44', '2021-04-09 06:02:44'),
('380e35434f2ac663967cf4d3f036d8b86372c5c65a4ece81e8f38186edea3bc35c2e6194a99ca6c5', 5, 1, 'MyApp', '[]', 0, '2020-10-30 18:31:20', '2020-10-30 18:31:20', '2021-04-30 18:31:20'),
('385a163adf9a805932e29c4069c91ed638cfd1d234d66844275ed5d7146106ab20258d98f1fe2061', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:45:50', '2020-11-03 13:45:50', '2021-05-03 13:45:50'),
('385da1cb23133a4512b6d694437f829846ffe0df5490e7548786603e2f213282c834c0d011d78015', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:54:04', '2020-10-30 11:54:04', '2021-04-30 11:54:04'),
('38f325c67bc9512ecc3677411381b106a44cd1f663341d985678111adfd84bb1518393adac796551', 8, 1, 'MyApp', '[]', 0, '2020-11-30 14:38:08', '2020-11-30 14:38:08', '2021-05-30 14:38:08'),
('394c517db14442762e551f1e1c8649f64755efefb021acb44fb8c9c4c2ed9e28d4ab4689b8379698', 4, 1, 'MyApp', '[]', 0, '2020-10-12 12:16:28', '2020-10-12 12:16:28', '2021-04-12 12:16:28'),
('395300ab9e07b747739726333420a8f90fbb22d5fecad7e4ff87dbfeb7e6040a7acc1f30ebc4dd6d', 7, 1, 'MyApp', '[]', 0, '2020-10-23 13:46:50', '2020-10-23 13:46:50', '2021-04-23 13:46:49'),
('39597c41525fe7a8b00e5c672dca492ed83dcc702eb53a8df69f7deb702ea7ad2f2c1e45cd9527e9', 1, 1, 'MyApp', '[]', 0, '2020-09-30 07:37:25', '2020-09-30 07:37:25', '2021-03-30 07:37:23'),
('39665c690dcb22491090a63b47abda0c7a5b4db35cc1f2305d9cad34f78afba4acd075cb02275f54', 4, 1, 'MyApp', '[]', 0, '2020-10-08 14:06:13', '2020-10-08 14:06:13', '2021-04-08 14:06:12'),
('3988b6e4ddfe336bf414a3f5b23ddb37515b50706cdb37d670b61a70cafdc739f188466188106813', 4, 1, 'MyApp', '[]', 0, '2020-10-19 07:21:20', '2020-10-19 07:21:20', '2021-04-19 07:21:20'),
('398c9d8d1dd2ea4c0f57b3a6084d97aea80a8c4a2d963dac00f7e339b498524994a610aabcfc1f43', 4, 1, 'MyApp', '[]', 0, '2020-10-14 19:25:57', '2020-10-14 19:25:57', '2021-04-14 19:25:57'),
('39a0cad3862625164803e2bc54e62c625954d3ebc77f52e3a34fbff86d1f56b7a5ae64d550f67714', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:49:01', '2020-10-14 12:49:01', '2021-04-14 12:49:01'),
('39cd5449b0c4475d522a45ddff44bcaa75414ddbf38ca95513dc2acc3c8193fafd89db05e367ecf9', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:37:24', '2020-10-30 11:37:24', '2021-04-30 11:37:24'),
('3a13ea46afbcb0c9d8a1c7ba0b4be70d07ab995b364ecf46fbc955e3f1ef343b618e9249955efa9c', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:08:48', '2020-10-19 13:08:48', '2021-04-19 13:08:48'),
('3a24b24b7db98e9ec8786c1976b8b8f39119a959aca27b6ace28b607618095087add205b912cd0ef', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:33:39', '2020-10-13 07:33:39', '2021-04-13 07:33:39'),
('3a5a9030b95ac1b9ff3e389b86d515486315e94c7c8ce3c426e32a61e360d590b002173959acbbd2', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:27:15', '2020-10-12 08:27:15', '2021-04-12 08:27:15'),
('3a7b7bc9c65c95484a6afb85ab4180be00c5f71b4780017f254bd53c2a127faa9edc8d6565ec35c8', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:29:09', '2020-10-12 07:29:09', '2021-04-12 07:29:09'),
('3a82a1d0634b2eed56b375aded339d92aa162930e6deebb24181b4d1a0b8eb50e8887cea4772a4a7', 4, 1, 'MyApp', '[]', 0, '2020-10-15 13:02:21', '2020-10-15 13:02:21', '2021-04-15 13:02:21'),
('3a9d958b93c9f10d10df40c1b50bb449b444e340bed4524c0ca77d6e12879a64ddca42114344787d', 2, 1, 'MyApp', '[]', 0, '2020-10-07 05:47:18', '2020-10-07 05:47:18', '2021-04-07 05:47:18'),
('3ab3ec17a5f5f0363c43249c1ab3d9e3f9f134c357949e820cdca0c881c64e2b2bb2a7ab78e4c037', 7, 1, 'MyApp', '[]', 0, '2020-10-29 09:24:06', '2020-10-29 09:24:06', '2021-04-29 09:24:06'),
('3ad8d04e8a16b89e9ceba2850ef06f12d1103317f46b5838ee42751d7c355819b7567d521880bdbf', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:56:55', '2020-10-22 11:56:55', '2021-04-22 11:56:55'),
('3afea12df7c2cb17e0462504beff226ebf51770ced6d4435d38a643477da8172de5b864519fd3c75', 4, 1, 'MyApp', '[]', 0, '2020-10-08 11:38:01', '2020-10-08 11:38:01', '2021-04-08 11:38:01'),
('3b0024cf01c1a2ddae261d86f219df3d5d73cbd95233df63902a192824fb9ffe82f342648ee87f11', 7, 1, 'MyApp', '[]', 0, '2020-11-18 06:54:28', '2020-11-18 06:54:28', '2021-05-18 06:54:28'),
('3b0b2d11ab4aa3d6cb21b76a7ce9f4d7b2c41ed0ec900957aad99fbbe385630124ba022f15942fb7', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:23:27', '2020-10-13 07:23:27', '2021-04-13 07:23:27'),
('3b30a1d6954b5157853f4a053f5deae5659bc73982925747cb4a58a7df9bc26f4412ee7086f021a5', 4, 1, 'MyApp', '[]', 0, '2020-10-15 09:44:41', '2020-10-15 09:44:41', '2021-04-15 09:44:41'),
('3be1a2151c1e0eed40e93ff4a65fc7db4c91b2115a4ccbc23e5aed8871b63258914fdfd760b8a9b0', 7, 1, 'MyApp', '[]', 0, '2020-11-26 07:49:40', '2020-11-26 07:49:40', '2021-05-26 07:49:40'),
('3c165c84315b65252b4c12fa15ab79a300ad343bb5d241ca0c64e0954b750bc54442aef51cb914eb', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:21:21', '2020-10-09 11:21:21', '2021-04-09 11:21:21'),
('3c23bb05371217b7b0e2fe913ece970718c2f963284a483f50b86cde256fc10adfb29e9a03cda631', 7, 1, 'MyApp', '[]', 0, '2020-11-04 10:40:14', '2020-11-04 10:40:14', '2021-05-04 10:40:14'),
('3c6f135b698eb986d6c90e7d0e8309063c0271b547e1281023e8df5f9b98134f0ffc7249313e59e1', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:59:34', '2020-10-14 07:59:34', '2021-04-14 07:59:34'),
('3c78d8d293634e0e769a4e12f84c25f790424fb6bee5797c85dd3855105a98eacaf0a92d695b2f0a', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:14:08', '2020-10-13 07:14:08', '2021-04-13 07:14:08'),
('3ca862b7dc8c97fad02ca54c72b84330b0fd058f279f305392702f0ba8f2c28ead01ea24362fac33', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:44:45', '2020-10-12 11:44:45', '2021-04-12 11:44:45'),
('3cd986e323228f4803d6185f5daca32c71e2a3342506f0ab09ad7eec85851af5716dd08d505c347f', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:58:32', '2020-10-30 06:58:32', '2021-04-30 06:58:32'),
('3cfd0499cf237cd1294cc6be01667c93893e4dc833772c53bdde23b808e66f8d20a9f81d8bf5e754', 4, 1, 'MyApp', '[]', 0, '2020-10-15 08:23:57', '2020-10-15 08:23:57', '2021-04-15 08:23:57'),
('3d0c2193d8d7d7e7d452e06608847063f523fd2bd40c549ca64fa08f935f57dadd5deaec30c173ed', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:28:52', '2020-10-21 08:28:52', '2021-04-21 08:28:52'),
('3d0d63dee9e35b74bcf3197a4a9911770b97b6c26e69f8862cdb65f1c023c178e19e0dd2727e2735', 7, 1, 'MyApp', '[]', 0, '2020-11-04 12:26:31', '2020-11-04 12:26:31', '2021-05-04 12:26:31'),
('3d15326c70b835664fe2ee52f76b79867a56fb38552d9aed2cf9dcf02354a197c031a4df40c7e7c8', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:17:01', '2020-10-13 13:17:01', '2021-04-13 13:17:01'),
('3d472fd5ee3547c64a0d79698c1017a27b4ffc390552610eb9f13349fc2309bddb253ea84ad3ecb1', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:15:43', '2020-10-22 11:15:43', '2021-04-22 11:15:42'),
('3d576b4841718d30df72eac8ebd5dd30d397b331ca019986d2705ec5adb39b79105b95f13d3fcf45', 2, 1, 'MyApp', '[]', 0, '2020-10-08 06:24:26', '2020-10-08 06:24:26', '2021-04-08 06:24:26'),
('3d7298e7a21dc23b37449d0b1c6835e08a0602b291bc287ba01e1f0376520dad796a41c6ec4b89fe', 7, 1, 'MyApp', '[]', 0, '2020-10-23 10:59:20', '2020-10-23 10:59:20', '2021-04-23 10:59:20'),
('3e0b8919ba1f530ab727a7b16d99be60ef41c91e39afb1fd5c9c14c7d10705d2e1f9acac9c46657d', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:42:16', '2020-10-13 07:42:16', '2021-04-13 07:42:16'),
('3e1a1fe00e77f3bc8739692f48ceb442bf2a0ebc97290be7ffccde9cc27b2a1f8921bd8c72e1af07', 7, 1, 'MyApp', '[]', 0, '2020-10-23 13:37:17', '2020-10-23 13:37:17', '2021-04-23 13:37:17'),
('3e438780b55177799315246c07cdcc17cc72ee326e06b707264a5d989f51ccd069cf54f8f0c8a3c1', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:25:43', '2020-10-07 07:25:43', '2021-04-07 07:25:42'),
('3e5316d01e789f8d2d3cd87ab817055de1d340466646a7ea848013b788c4118b3910077f6cc5cfaf', 8, 1, 'MyApp', '[]', 0, '2020-12-01 08:33:45', '2020-12-01 08:33:45', '2021-06-01 08:33:45'),
('3e6289c4c98464e64d4ac533ed887bae62198d6036bc82ea7157ee987545ef9cc85efa5753ab9260', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:15:50', '2020-10-21 08:15:50', '2021-04-21 08:15:50'),
('3e96e745fcb7bc9fb3a63851dda971c63d17555ccd6479cfe3a212efcbfff55d0bcc142e58030822', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:56:30', '2020-10-15 06:56:30', '2021-04-15 06:56:30'),
('3ef9da07f3d54b7848fd42e24c2b177f203178335c655d0ae2a28906767c499e2828ac37225ecce0', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:21:00', '2020-10-20 10:21:00', '2021-04-20 10:21:00'),
('3f0ec7c951735c0453d4e0c4e903053c0b038e4ccd904b06003f7656e496354eec8929101c581718', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:02:04', '2020-10-23 11:02:04', '2021-04-23 11:02:04'),
('3f37c6615c30a53cd1ed580dea65d28f64a3110645aaf5b6e02c7e7a51072ef0d1c9d16a52fc9fce', 4, 1, 'MyApp', '[]', 0, '2020-10-19 11:53:43', '2020-10-19 11:53:43', '2021-04-19 11:53:43'),
('3f8021e6959a3f5e4cbc87e11bfe2f953f0c2d7adda865deb1b0fa234fb5ebfb8d8921c81c66a41e', 7, 1, 'MyApp', '[]', 0, '2020-11-06 12:47:04', '2020-11-06 12:47:04', '2021-05-06 12:47:04'),
('3fc987f53d22b36726bdc4cefb10e22948f4c9bc6e538222ac435144a90d35b1ffdd311fe0c50bf7', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:32:12', '2020-10-13 13:32:12', '2021-04-13 13:32:12'),
('3fe23b5d7892106fb8f5135d602a467fd6a1788124353fc606fcf2614b31fddedddd9731a909da42', 7, 1, 'MyApp', '[]', 0, '2020-10-21 05:49:58', '2020-10-21 05:49:58', '2021-04-21 05:49:58'),
('3ff85adb6a1af534773777433f867f1a285a696cf969b2f111a5dcd85a60425a8f95e23207eec1ee', 8, 1, 'MyApp', '[]', 0, '2020-12-08 12:00:12', '2020-12-08 12:00:12', '2021-06-08 12:00:12'),
('405e54fd97b5d5d820e0094fcc1f711aeb9773bbf3417365863afe9825ac5965589ae657148c6d97', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:05:37', '2020-10-23 11:05:37', '2021-04-23 11:05:37'),
('4067d16ee926dfaf51dd80ec0f299c8dae5064a3140700998cdf494a611a290e0e8fd1aa7dd9f84f', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:49:57', '2020-10-13 12:49:57', '2021-04-13 12:49:57'),
('40987e7b614e2ad2d99a6633391c31d6db0b531704131d513e5c9a15f19019a2690a23a1a2462486', 7, 1, 'MyApp', '[]', 0, '2020-11-24 06:39:13', '2020-11-24 06:39:13', '2021-05-24 06:39:13'),
('40a26f82add1f2fe4b857ce1c76ca111ddbfe3c9bec808dc4e01f573e521e07d2638f9f841d426c5', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:35:02', '2020-10-09 11:35:02', '2021-04-09 11:35:02'),
('40bfe772b2523acbede6465e525d061e740e90badb80ddbd7352685eb16e5601c90601e58c0294ae', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:18:24', '2020-10-12 11:18:24', '2021-04-12 11:18:24');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('4127a3bd007885a39650f24ae6844e3832767587e729bc41ac383a86f1bc71f6aca4bb022cd2df7c', 7, 1, 'MyApp', '[]', 0, '2020-11-06 06:59:06', '2020-11-06 06:59:06', '2021-05-06 06:59:06'),
('41324a068334123864f2fd6743fcf94a1fff5588637ccde7908b8c3a9dfe54c23b4455eb4b1fd21f', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:38:44', '2020-10-09 13:38:44', '2021-04-09 13:38:44'),
('41353c832cafa1068c515858e584c5dae676d5ca5053dba3e89a2f6cce9fd368ddb005cf9b6f15f3', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:05:35', '2020-10-19 13:05:35', '2021-04-19 13:05:35'),
('4141e8e4b48791da0146f4c1af4ccb534a080622a5b02ec3eedfa092568d3ff59f6c8f54d40166b4', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:41:01', '2020-10-15 06:41:01', '2021-04-15 06:41:01'),
('419609f7a19cd097961d94e8d1a878ba024b0c10dc4ce4387daeb7a48be0a941147934b57d14d2b4', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:00:33', '2020-10-13 08:00:33', '2021-04-13 08:00:33'),
('41db3140f0f1e76fa86e6b12d5aa4733065b11fd1e18225308600a2ebe39ac9e639efadf8670a818', 8, 1, 'MyApp', '[]', 0, '2020-12-07 09:41:27', '2020-12-07 09:41:27', '2021-06-07 09:41:27'),
('4244f8047690c870b1a8004657701bd49f894ecc99fe3d4851f5fd5e2bcec3e091b0dcc62eb3f76d', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:40:35', '2020-10-09 11:40:35', '2021-04-09 11:40:35'),
('424594a4ad584fdcafe5f8096f887d0af79a3ecc313439393c74557fa3405dfeb7737bac26e475c6', 7, 1, 'MyApp', '[]', 0, '2020-10-20 12:25:40', '2020-10-20 12:25:40', '2021-04-20 12:25:40'),
('426df0158297e1317fb12c531f0994a00d17b2051936564b9bde8b5fd7523349f67eb7884fc38f7a', 7, 1, 'MyApp', '[]', 0, '2020-10-22 12:03:50', '2020-10-22 12:03:50', '2021-04-22 12:03:50'),
('433d24ba65615c180d1514d02dd6b0df3cef862f77648aefcd3ae50822eda0540daa91f2263d8940', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:11:15', '2020-10-22 11:11:15', '2021-04-22 11:11:15'),
('435de17e0bdd9429ce3a3b9c0fb321cef6ebeba9aa9a0190ed9703453cef25bffd6cc64c9f595d94', 7, 1, 'MyApp', '[]', 0, '2020-11-16 13:47:27', '2020-11-16 13:47:27', '2021-05-16 13:47:27'),
('438b189e857cd039c3377265e69b866bb306e39912a90d98011de27647169dbc7986e100351d47b2', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:13:25', '2020-10-29 10:13:25', '2021-04-29 10:13:25'),
('4390c06a8f6390ad397a787954f25c311bc7911b48192f7069ad5f1b2ddad0857197aacbe8b18717', 7, 1, 'MyApp', '[]', 0, '2020-11-18 05:59:15', '2020-11-18 05:59:15', '2021-05-18 05:59:15'),
('439487708a62b9227e1cc9c632a57d3fbdb33523681ee3d7f56a7d6b843cfd7f5bdbfa4f910a6e3c', 6, 1, 'MyApp', '[]', 0, '2020-10-11 08:39:02', '2020-10-11 08:39:02', '2021-04-11 08:39:02'),
('4397b548712ba8aa7403b2ad9276d4d5135708d1f3845319ea7929252b2c04166a3c5c49602ab0ff', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:31:38', '2020-10-12 13:31:38', '2021-04-12 13:31:38'),
('439f1467a279cf8c3d8fdc240569d6a1a94dbbb1e247ca13ef28c08a3a0afec3cdf27f24c9f04ddc', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:23:05', '2020-10-13 08:23:05', '2021-04-13 08:23:05'),
('43f6977c4155a08968e017f9519b64604b1a901dff1f946dd3524e824ab71581f2bd1cdb238e73a9', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:29:41', '2020-10-15 06:29:41', '2021-04-15 06:29:41'),
('4416603ccf1d6915b4f068d31b70b11d7cc795b5021ecd355cbc821a26404eab4fe787f64cc462d0', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:41:20', '2020-11-20 12:41:20', '2021-05-20 12:41:20'),
('444867f1966d81e87904425315162ad83144459d408a7c040e647a99bab7d717cb22c0e67537ec10', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:45:26', '2020-10-07 13:45:26', '2021-04-07 13:45:26'),
('44b56518af669929d973c381c45a0d743acd32422a6950608be7c11d832ebf00b4c3f0ae3e9184b8', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:16:50', '2020-10-12 08:16:50', '2021-04-12 08:16:50'),
('4502f06cbde122af6ccfab3104d3f0a21795690c08914adc39975f6fd4168d6dedb41a6afef5ff95', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:26:08', '2020-10-12 11:26:08', '2021-04-12 11:26:08'),
('45146986f6519b1fbe7a23f31dedf4f716eb1fb2b5a095a9fca336cd63412fe873634160cdd1a97e', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:13:20', '2020-10-12 08:13:20', '2021-04-12 08:13:20'),
('45200d81ef3f1a4b12f5851e6eb443eda37a30919c5337634bbf17706dcd1d553e3ff2938702dd95', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:36:09', '2020-10-12 07:36:09', '2021-04-12 07:36:09'),
('453ff22197159f403b6ccbbb9ea954fecbb58eb9eab50dbca43c07acd7eceeb7ea11740a596b546d', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:07:21', '2020-10-29 07:07:21', '2021-04-29 07:07:21'),
('45746d93caf0ce7ffcf8dbabcb859f46b5098428d02f6b21ab268f6613920488fb6e870666a36904', 7, 1, 'MyApp', '[]', 0, '2020-11-17 05:45:21', '2020-11-17 05:45:21', '2021-05-17 05:45:21'),
('458f2aae6fa306a659f4f89f7e9cb63b127e94f8ece770ba67e4681b9235c89989bb9dc337705583', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:43:52', '2020-10-20 13:43:52', '2021-04-20 13:43:52'),
('45b40df2159ed5dc1fa554520ee77892c9352eb5e9c02b56d42bc880d26ddeedd30628d52a409005', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:09:37', '2020-10-06 12:09:37', '2021-04-06 12:09:37'),
('45f4e28afe5b541ba85bb4573e1ddc0b6779946b2d4a5a1627dc45f84c21e366d23d7960f44b168f', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:24:47', '2020-10-07 13:24:47', '2021-04-07 13:24:47'),
('45fbbe884552d1cf4e9d9320f7cea1653baadf3ffe8789250f627397221fd561f18eec8e63e1bef1', 4, 1, 'MyApp', '[]', 0, '2020-10-15 11:03:59', '2020-10-15 11:03:59', '2021-04-15 11:03:59'),
('46153023adcb022229625dde388332fe16a534a36a8febdb36ab002dc8190a6c56929de8e9419151', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:58:02', '2020-10-12 10:58:02', '2021-04-12 10:58:02'),
('4619096ba20966aa4ba466e8b84c9ffc51580357d0b61e57d95402aea84601660362397ce405b97c', 7, 1, 'MyApp', '[]', 0, '2020-10-22 07:43:57', '2020-10-22 07:43:57', '2021-04-22 07:43:57'),
('4622530dd807c2e2df652e0bb5da8d9697baf00f1dc89fa21c55ed30577517477be2cbdbbdd5c87e', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:47:31', '2020-10-13 05:47:31', '2021-04-13 05:47:30'),
('4622c75cf7434b930121bfdf45d26cee700e61cdb8a226f04aacdb50fd133d0ea8f7a786bbc77fc2', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:22:06', '2020-10-21 08:22:06', '2021-04-21 08:22:06'),
('46a32d8d9bd5eeff72f34de5607c8248775413ca53d906e6ca663dae3781f7fa17196a234954f689', 8, 1, 'MyApp', '[]', 0, '2020-12-14 08:31:05', '2020-12-14 08:31:05', '2021-06-14 08:31:05'),
('46a8abb7ac554fbc6eb9be2b56e2dc5ffc0f37c408b313801f9f31b7d286e3db280bf80504f8af11', 4, 1, 'MyApp', '[]', 0, '2020-10-19 06:23:16', '2020-10-19 06:23:16', '2021-04-19 06:23:16'),
('46f25b89ca999181eb8af109c5343ef09c698ddbafa3b1d4c31fa75fbbf2e46fd798779ba1351e37', 8, 1, 'MyApp', '[]', 0, '2020-12-01 13:51:05', '2020-12-01 13:51:05', '2021-06-01 13:51:05'),
('4722df8a13974c2db5f6076b9b3f21752346b2a25f23516883d14cbefafeb3c011a4048ecb300c4c', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:23:07', '2020-10-20 10:23:07', '2021-04-20 10:23:07'),
('47ac55df38f900e6dbf18a53fd10d1114165990430c4d4837a95146be01b31112066f399114e05d2', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:57:04', '2020-10-21 13:57:04', '2021-04-21 13:57:04'),
('47af8c39fd41e0786d38f49ab128d29fb705a4256f4f381ef9ff51ee7dd981533998ae9ddc4d5bf5', 5, 1, 'MyApp', '[]', 0, '2020-10-22 05:53:41', '2020-10-22 05:53:41', '2021-04-22 05:53:41'),
('47b1c9eb9b8cbfcc34386e0aba06dab00e445e60f78007b579ca2704aa5e3d5484dbc81cfec48ba1', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:58:50', '2020-10-06 12:58:50', '2021-04-06 12:58:50'),
('47f371c8419fd743340ba95557a9aeaf9e31e0fdb431a109d7f83c16fe17f6d763a986a54b740d0e', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:11:59', '2020-10-29 07:11:59', '2021-04-29 07:11:59'),
('47ff6ccacdaceffa74fa0bfe52ca4d822186a97afd3b6549ae95a37bcf68441611b128b5985350e7', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:08:37', '2020-10-06 12:08:37', '2021-04-06 12:08:37'),
('486dd0752cf3d1b71cb02f43b329ec514bf416fecf17a0ab4c591a33615ae5161519f379eff4b04d', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:45:45', '2020-10-19 13:45:45', '2021-04-19 13:45:45'),
('487abfd606ef6fc93b8752a4b7ab27c80dcc32800b1d95a0e924d10d6665b3c875d13cd76369f26c', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:33:41', '2020-10-13 13:33:41', '2021-04-13 13:33:41'),
('48884e942d27d7111e9d2d5a64790292cfbf454bcc8650b8ca251129513b50b8990dda369b9eca63', 7, 1, 'MyApp', '[]', 0, '2020-11-05 13:59:37', '2020-11-05 13:59:37', '2021-05-05 13:59:37'),
('489a1630b6c58ffb61dc49046c40b5faa97e2d14b5080e748417cabd01d0652783b4c0217b4175e4', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:14:51', '2020-10-12 08:14:51', '2021-04-12 08:14:51'),
('48ffdc22050fa0cea4c09fec5c93a441d454520f68402acf1ebad8cba08558a9797c59c6ff5313fc', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:27:02', '2020-10-29 10:27:02', '2021-04-29 10:27:02'),
('491135988f728e40e0dbaa5b7664399f44e7aa8c34cc21715ecb1c33f80ee2d649a5f70e4ec96427', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:45:16', '2020-10-29 07:45:16', '2021-04-29 07:45:16'),
('4925cfa258b2137b3219ebbc65de48611aa68370f8786f58fbbb6d5a4123b3afac4dbd7a22a92e86', 8, 1, 'MyApp', '[]', 0, '2020-12-01 08:41:15', '2020-12-01 08:41:15', '2021-06-01 08:41:15'),
('49d54aa72ab7cfb00968674a0def195d952f5d186a9d53965030a383e68250c3e7f71d49b4949d8b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:36:31', '2020-10-13 08:36:31', '2021-04-13 08:36:31'),
('49de386600d5b3f37b94c524147dd0b58c2dd85afd2b040623a3e4def235dd76845d63ba73696a06', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:54:43', '2020-10-06 11:54:43', '2021-04-06 11:54:43'),
('49dfc4e71a8eb14661dcb57f1c7e37dc7aefa517466e983e6ccc9cd02d1302a7fc86c2a5a9414cff', 7, 1, 'MyApp', '[]', 0, '2020-10-20 12:27:00', '2020-10-20 12:27:00', '2021-04-20 12:27:00'),
('4a1e8b5d1a65d7ba32259eb457a511d77a72bdc905b04ced2994cc149f6aae7501ff501d37c52664', 8, 1, 'MyApp', '[]', 0, '2020-12-11 07:48:11', '2020-12-11 07:48:11', '2021-06-11 07:48:11'),
('4a33fce3d2e14636796f3140866a44221ead3a19da7f67c6f38e7873851517264c5ef0ea8f5f6963', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:46:58', '2020-11-06 07:46:58', '2021-05-06 07:46:58'),
('4b1039e30776becba2e83d9fd7ce0c0a1aba647937782373e8063a8da70894d9fffc85f8cb180f05', 7, 1, 'MyApp', '[]', 0, '2020-10-27 08:31:47', '2020-10-27 08:31:47', '2021-04-27 08:31:47'),
('4b6264882b5d01551563f08058045b3340a2f6c0075135878d82263181ab579cf600a3c2d1e29743', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:55:47', '2020-10-30 06:55:47', '2021-04-30 06:55:47'),
('4bb047eed3352bd02d799ea0fcf124d73b9d0f8e518e2afddba7429c81c7f544add34d358f09f858', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:33:15', '2020-10-12 10:33:15', '2021-04-12 10:33:15'),
('4c0af7d2500e44918bb6a87c9b567b1c21a8351fec4cb8aa580d3450b5b06ed56a49ba85df5436fc', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:51:04', '2020-10-21 13:51:04', '2021-04-21 13:51:04'),
('4c5c6a447ffdb59d375cff9479e4289df2573ef4213506f1d263929f0d69f72873580c9260b65ced', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:49:23', '2020-10-14 06:49:23', '2021-04-14 06:49:23'),
('4c6132cd1ce93da7f4077ffad4f08db1a6adfc5a09787baf472ce5ce8dcdc41331ba8e0268c5b2c9', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:41:46', '2020-11-06 07:41:46', '2021-05-06 07:41:46'),
('4c7f44568e3ad462c0130001e393248e25aed10cc2c2f3b6ded9f013b93d8d125ee60e7cd64e0aed', 7, 1, 'MyApp', '[]', 0, '2020-10-27 12:01:43', '2020-10-27 12:01:43', '2021-04-27 12:01:43'),
('4c803bd57041179a62f0e3b7299de21599298b318b8a1175d1448c2ed2cbcfa9ef3cefd0b8500876', 1, 1, 'MyApp', '[]', 0, '2020-09-29 08:26:04', '2020-09-29 08:26:04', '2021-03-29 08:26:03'),
('4c94e3e305586e00dbca9e06077e6aef8f04a45ab2fb3ce82e9903d0485bfae394b3fb71594ea056', 7, 1, 'MyApp', '[]', 0, '2020-11-23 06:52:39', '2020-11-23 06:52:39', '2021-05-23 06:52:39'),
('4cc838b7372b031429fc41ca46f95690d91e6c831ffed193325058275378712a9933d6a2461faeb4', 7, 1, 'MyApp', '[]', 0, '2020-11-17 07:04:34', '2020-11-17 07:04:34', '2021-05-17 07:04:34'),
('4ce41e81cc9e6d43d9a30adfa065ab561cb403315c38bcd32e950648eeae990b7fb94a0f9a55e6b1', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:15:55', '2020-10-12 11:15:55', '2021-04-12 11:15:55'),
('4cf8563ed829efb697b30ba91c822aa263568039275ad80c316088558e95edd9ceebd4593df9f7f3', 7, 1, 'MyApp', '[]', 0, '2020-11-16 13:02:17', '2020-11-16 13:02:17', '2021-05-16 13:02:17'),
('4d052cdb2851271dd1a87e3d49ba13342769ff4a489607b38488aebcf40c64b46ac2672a534f0061', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:37:01', '2020-10-07 06:37:01', '2021-04-07 06:37:01'),
('4da4e6ff62d474daa5d2211e5c00d39fe1e41b8343843fb1772bdfd9c2dde9098980598dc16d3de5', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:59:13', '2020-10-15 10:59:13', '2021-04-15 10:59:13'),
('4e5e528fb9ea5b9374f60d9d41a3d669f29f0f4170630cae454f1d8068b796b6dfe6a7f97b53759e', 7, 1, 'MyApp', '[]', 0, '2020-11-26 11:53:47', '2020-11-26 11:53:47', '2021-05-26 11:53:47'),
('4ea4a5b217c4c7da92dbb9566663f8f4d8229655663a5e86e8e027cd979b76e012ce0f555c090b1b', 7, 1, 'MyApp', '[]', 0, '2020-11-16 14:06:13', '2020-11-16 14:06:13', '2021-05-16 14:06:13'),
('4ebd4062e8e3f21baf55cfb733a502ef9298b93ecc0f153b6bf92db9cf771284b004e6a7c99b434e', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:07:29', '2020-10-21 12:07:29', '2021-04-21 12:07:29'),
('4f0f9fb6ccd391fbc08358170b14e93cd4c395a3d2778e842d3e8b0cd4141e91ec6edb0c0fe67c91', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:15:45', '2020-10-14 08:15:45', '2021-04-14 08:15:45'),
('4f276218392e7d8deb48cfcc81a3d0e9da00de81bbacd125d0abef4a8cbc731550fed0dda1dc3e03', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:18:19', '2020-10-15 06:18:19', '2021-04-15 06:18:19'),
('4f391f66d68707a6b9dd0c5711b2e783b4c6cd8f418d4a5c36bb5103112a495643b805bdb7e7133d', 7, 1, 'MyApp', '[]', 0, '2020-10-21 07:56:06', '2020-10-21 07:56:06', '2021-04-21 07:56:05'),
('4f56c82e4aa85747cfc5888497453de5c78e00f751e480fa791738bbfa48415f7d64f3da5937e582', 7, 1, 'MyApp', '[]', 0, '2020-11-25 12:49:18', '2020-11-25 12:49:18', '2021-05-25 12:49:18'),
('4f76c505ea6a7539534ec8b0d5e63f9a2819353d0a87451c4d2f8d497cd92eae56d5ac4e248d9cd4', 7, 1, 'MyApp', '[]', 0, '2020-10-26 10:25:10', '2020-10-26 10:25:10', '2021-04-26 10:25:10'),
('4f8bc6e59387dfc36c5265efc42a819c70407f92d8137d0e0a20d9ca38bf455bae7f29365d51cdf7', 7, 1, 'MyApp', '[]', 0, '2020-10-27 07:38:16', '2020-10-27 07:38:16', '2021-04-27 07:38:16'),
('4fa33796df0b59b09d6b3b64f8e0e55f41e96b2e7f8cc5f499b7cb02995511d232f80922a0cba046', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:39:04', '2020-10-07 13:39:04', '2021-04-07 13:39:04'),
('4fd8225c7b27d6ec920ca59cee1b47cf57a451f13f2ae8ac3f62b552f2756b95f0408f5bc54b2dc8', 7, 1, 'MyApp', '[]', 0, '2020-11-12 14:04:52', '2020-11-12 14:04:52', '2021-05-12 14:04:52'),
('4ff3a311c2ed20155f4fc18e2a218a79a375dc76ae80e20ca5832d9a9028ae09ca73f226db2863f1', 7, 1, 'MyApp', '[]', 0, '2020-11-05 14:13:37', '2020-11-05 14:13:37', '2021-05-05 14:13:37'),
('5056d84c9aacc92e19e21f9e14628bb3cd221c4e9beb25373d1435f6bd9c4b1a1a27b520c6dc26bc', 7, 1, 'MyApp', '[]', 0, '2020-11-12 09:45:35', '2020-11-12 09:45:35', '2021-05-12 09:45:35'),
('505c119a144f9ca858124206ef363d9f339bd92bf70045d475cf50fab8f1ab6dbf5c9b3f9fff4275', 7, 1, 'MyApp', '[]', 0, '2020-11-26 06:39:26', '2020-11-26 06:39:26', '2021-05-26 06:39:26'),
('50608137a5e8467be1510bfc9e740f6ef8d07f3e465afc60f116084f1da7dbd93a0f691d8e207baa', 1, 1, 'MyApp', '[]', 0, '2020-10-06 11:59:29', '2020-10-06 11:59:29', '2021-04-06 11:59:29'),
('509723a48fc8538247df2a857132f17c1fba33016d939ef316e772ae70c052e598bba82e7c4385a2', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:51:41', '2020-10-06 11:51:41', '2021-04-06 11:51:41'),
('51080e712df21c331e36b311051a2aeffd0bbeb3391c76ee20bffe25b04d9954eb10411d1cd393ab', 7, 1, 'MyApp', '[]', 0, '2020-10-26 13:13:33', '2020-10-26 13:13:33', '2021-04-26 13:13:33'),
('5116ee5ac0d5fc24d3dca44a7ad39daa19b418a093a012418ca3a70630df091ecfc544307178b3a9', 7, 1, 'MyApp', '[]', 0, '2020-10-23 12:58:43', '2020-10-23 12:58:43', '2021-04-23 12:58:43'),
('51357910f92acdff9ffb7d27255089532b33e56f74b5ca975b861f998cc0895d88641c0ffea0febd', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:53:52', '2020-10-06 11:53:52', '2021-04-06 11:53:52'),
('514a7a3b39dfafae38246580e827096e89eb4482dc6a82bf23395aaa6538295fd622898a90e4e0da', 7, 1, 'MyApp', '[]', 0, '2020-11-23 06:49:59', '2020-11-23 06:49:59', '2021-05-23 06:49:59'),
('5191461f01510e749021c734ae240533cb9d35125646f8ab5914e3806440905e02bed9c644d16967', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:04:50', '2020-10-13 13:04:50', '2021-04-13 13:04:50'),
('51e9353d9fcbe65938924625922930efa12ff12bc1d772582a0a5ef30ad1c85bbe9ff27192aca453', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:50:31', '2020-10-06 13:50:31', '2021-04-06 13:50:31'),
('51eefcc68024a9f90032d0a95e1694934313653a1e6512c0abfe396be4c48d65db4c964c32d9ec6d', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:21:36', '2020-10-29 07:21:36', '2021-04-29 07:21:36'),
('51ff137dec23c329d38c2af9a44a9c91c6d5fb66f4917e9b7c1a8449dce289bcb280ec35e90b17bc', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:55:49', '2020-10-06 13:55:49', '2021-04-06 13:55:49'),
('521898a88a8c19236d0c34a5b4dff342e36dcacb183c2a4a2620d7d08210488fa39f9140c10e5058', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:51:35', '2020-10-06 13:51:35', '2021-04-06 13:51:35'),
('52532b05b8dcf55ef7cb68291ea5d30936e63a9ad1d6c1cd4fcfab3fdab2332ad9cd12161ab2fa6e', 2, 1, 'MyApp', '[]', 0, '2020-10-07 10:08:30', '2020-10-07 10:08:30', '2021-04-07 10:08:30'),
('5259a5302467fdf45d5db2d8e0a8b08cd7b56bc5db60f172f6a33914cd9aeb719f013599234e67d0', 7, 1, 'MyApp', '[]', 0, '2020-10-20 14:01:01', '2020-10-20 14:01:01', '2021-04-20 14:01:01'),
('5304210489706e988f0f2a95f37522922bd34e5e50105a1c62b3e6b2b719f1163c705fbb4447e28d', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:27:36', '2020-10-12 10:27:36', '2021-04-12 10:27:36'),
('5332226edab6802dd94eeacfb77c237192b888a2e7bebf1109e774cfb77e2e4356d0b3cabf48757b', 7, 1, 'MyApp', '[]', 0, '2020-11-06 12:47:40', '2020-11-06 12:47:40', '2021-05-06 12:47:40'),
('535eaaf9adcab6ffb9fb82f1dae084b4e405ef6bed84710e4a4c0b8aa8b325afd07591c59c26aa65', 7, 1, 'MyApp', '[]', 0, '2020-11-26 08:07:30', '2020-11-26 08:07:30', '2021-05-26 08:07:30'),
('545ff4e2bc963180e0a7d6e79f096fdf36956f1d7b302df9cb2a0d75be43d5b8fcbd40efe3c05d48', 7, 1, 'MyApp', '[]', 0, '2020-11-05 06:31:49', '2020-11-05 06:31:49', '2021-05-05 06:31:49'),
('54d63c66b91bc0a1eac95da8c2de1b03544fbb06e0cb5b74a3bd56c3753ed1ef65d2f19b54ad0694', 4, 1, 'MyApp', '[]', 0, '2020-10-09 19:40:59', '2020-10-09 19:40:59', '2021-04-09 19:40:59'),
('55239e78bf619eac2c3d41f62522fa1b205696e8a311a0d99868d95afb9a5fb3b0628f8aaf5b2345', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:33:31', '2020-10-13 12:33:31', '2021-04-13 12:33:31'),
('552c0e0f9c239f7a1a97bc60faf9dc1c7bc5c1438e17ff9032dca74574953dcba12da05a87f94209', 6, 1, 'MyApp', '[]', 0, '2020-10-11 08:46:04', '2020-10-11 08:46:04', '2021-04-11 08:46:04'),
('5570e76caef3f46e23055fa929481a22ec6e8121a01dfe2c9d8a65dcd8e03c69c7a6c791f6bcc902', 8, 1, 'MyApp', '[]', 0, '2020-12-04 08:02:22', '2020-12-04 08:02:22', '2021-06-04 08:02:22'),
('565283ce1fca050209c82c7720040476eba5209ef2543870bbecbdbb5c47e3eb4e9982bcf0f818e7', 7, 1, 'MyApp', '[]', 0, '2020-10-22 06:13:19', '2020-10-22 06:13:19', '2021-04-22 06:13:19'),
('56538505ca8091236ca39f6bc70cc937ea0fa07a2873e65989f6f42afaa2217b50eac957d7ad7d0f', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:47:16', '2020-10-09 11:47:16', '2021-04-09 11:47:16'),
('569f4130edb623b6957c6a6144e51ce4c705a5dce1375824c1f0601245dc8a2f379fb65c24fd2cd8', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:43:22', '2020-10-08 13:43:22', '2021-04-08 13:43:22'),
('56bb90a3426f1dc394b4504648c1a65359d72a8be50c18953278b2781b256fb2031bda9e1c7529f3', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:59:51', '2020-10-29 10:59:51', '2021-04-29 10:59:51'),
('56efbd1ae87f5232ad90bd31d910d395cf0cf0a43e3ca4af3f0117a775861ce1724bc6e69d3cff07', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:39:29', '2020-10-30 11:39:29', '2021-04-30 11:39:29'),
('570fa3209dccbd4c9d3da25536c7af93239e54a0f649a2574e9934cc6f9aef921bcfb21953919188', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:51:59', '2020-10-15 10:51:59', '2021-04-15 10:51:59'),
('57150bcfa2f5b81b5841440d145d4f72b210b9839c53cdb4326b5625c66f243e0bfe1aecd8447dad', 7, 1, 'MyApp', '[]', 0, '2020-10-23 13:14:29', '2020-10-23 13:14:29', '2021-04-23 13:14:29'),
('57f35ce95d6094c3f39d3c3ad5249188c1869b98b70b362e0fc2a0410917a95fb3397b321eb092f2', 7, 1, 'MyApp', '[]', 0, '2020-10-23 05:40:03', '2020-10-23 05:40:03', '2021-04-23 05:40:02'),
('58c54a7034d9266a789e937453e8b045d3bd4e1999a25f57f5943596419bc64e562490fc73601d49', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:46:32', '2020-11-04 07:46:32', '2021-05-04 07:46:32'),
('590a7aed8a0504db491919c503727e3f9bd817c19ee8aafe5ea68c6bcc9e9bc68f63a55a8e2a5ecf', 7, 1, 'MyApp', '[]', 0, '2020-11-23 06:41:19', '2020-11-23 06:41:19', '2021-05-23 06:41:19'),
('590efd70473f875e6f498c52ec60fb5684f1571a637a77f9f5f7d57d87b7ea3c7af45a2c2cda0f35', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:05:32', '2020-10-29 06:05:32', '2021-04-29 06:05:32'),
('591cf4e11749cbaa9e9dbadfb911f3834666b17344fee7eb78b6adba69afd195d7d6070886813f5e', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:24:41', '2020-10-14 12:24:41', '2021-04-14 12:24:41'),
('5971b6088672885820e528dc647ae785398ec7b6d903bd64754d7be30dc141d2789ad413626f58b4', 7, 1, 'MyApp', '[]', 0, '2020-11-12 07:58:41', '2020-11-12 07:58:41', '2021-05-12 07:58:41'),
('597ce6694245a59772498f2332afc87dc533ba4720ccc1346206944d1c35cc0386b83eb9884ab70a', 4, 1, 'MyApp', '[]', 0, '2020-10-12 06:36:45', '2020-10-12 06:36:45', '2021-04-12 06:36:45'),
('597ffc924f4f223dae5b2f842b9f0c00dbb13bdb78e56e5bdad5633299f1ad04adbc7e92cb0bad87', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:25:58', '2020-10-13 07:25:58', '2021-04-13 07:25:58'),
('598237207e9161f753e69825b1e847c8edfbb3004cc7d759137f481e0ea9f56afd9e60633eb5377d', 8, 1, 'MyApp', '[]', 0, '2020-12-01 08:43:43', '2020-12-01 08:43:43', '2021-06-01 08:43:43'),
('59a578d32de89f59434a0917ecd5355661745f5559feae14f4f553ac7c0077dac437f5b23c47adc7', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:35:26', '2020-10-07 13:35:26', '2021-04-07 13:35:26'),
('59f553016309a221a502109a9d2dbecd096a88a69b606b7df7472154880f4d5174fad1997f98b836', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:14:51', '2020-10-13 07:14:51', '2021-04-13 07:14:51'),
('59fc8cbca3ac68905bfbcb91e8ab585f51b5e4d46c1158ff16801562f7636335f7f06722a4bef80d', 7, 1, 'MyApp', '[]', 0, '2020-10-23 14:06:07', '2020-10-23 14:06:07', '2021-04-23 14:06:06'),
('5a108433fe5a75c46a724594c6143004e5cae68567662f0dbcfe833fa359f2c11c86a346ea1fdc4b', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:32:20', '2020-10-06 13:32:20', '2021-04-06 13:32:20'),
('5a54e8f42b4b0226015f9bdb4397bbbb7ae9ce6f6482d57d5343568d85099056ffe7cb5475d9e0ff', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:34:18', '2020-10-12 07:34:18', '2021-04-12 07:34:18'),
('5a85bf8998bb16a5013eef0444f3ec8d9df35faed718bdd5de33e12d0264bd088c5a387b7091a904', 7, 1, 'MyApp', '[]', 0, '2020-10-20 08:32:39', '2020-10-20 08:32:39', '2021-04-20 08:32:39'),
('5aa8cac3bbd8d61ce81285e53641899582eef4c410233e7f6a72f7e26f9835bfc635d459a9c7e749', 4, 1, 'MyApp', '[]', 0, '2020-10-19 12:13:55', '2020-10-19 12:13:55', '2021-04-19 12:13:55'),
('5ae2fa8703c07f1b715d148f39caf7981f922e08420b9c3051d0189cd59b07c907454281e7e28c3c', 8, 1, 'MyApp', '[]', 0, '2020-12-08 11:57:08', '2020-12-08 11:57:08', '2021-06-08 11:57:08'),
('5aea2a0dafdf095a00da1b6706a4c6ed848d1d904d05378c54adfd5e0a816996c19907852f8fed67', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:46:07', '2020-10-13 07:46:07', '2021-04-13 07:46:07'),
('5b0d198e049593954c3c7bf964d52be6feca0cdfa8426a0f8881cc9357126631b8e9a5041ce4c037', 7, 1, 'MyApp', '[]', 0, '2020-11-09 14:05:05', '2020-11-09 14:05:05', '2021-05-09 14:05:04'),
('5b554fc2dc4f37b274dabcad60c481db76ecb174c69dfee8090708f69a2dcba359c883d46e47f5e4', 7, 1, 'MyApp', '[]', 0, '2020-11-26 11:49:39', '2020-11-26 11:49:39', '2021-05-26 11:49:39'),
('5b5e600b6111606e16f5b616bb291ec7bfbf14a47d91ac67a7c2b9399612f85ecadeffae383c026e', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:32:18', '2020-10-20 10:32:18', '2021-04-20 10:32:18'),
('5bbf5895f42d961eb6e1b1641f708c8b68ca17edb34075d8570ca737fa13c8e4b79b8e0b6241d605', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:35:21', '2020-11-16 11:35:21', '2021-05-16 11:35:21'),
('5c914060cd3d03536d186b9b76f81c02af7598bf7d2c238e75e686495a8b841c1ea7877c8a1edfd9', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:20:41', '2020-10-06 13:20:41', '2021-04-06 13:20:41'),
('5ccf0eeaf07f474d768bc3e3760a3b2d0b4edae2cf2252c7601b684d6b45d0b195dae97d490bbd3f', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:26:13', '2020-10-12 07:26:13', '2021-04-12 07:26:13'),
('5cf7322ab2af519f9abf8cae87d841dc4eaa970adc416f09ba2ca5d4b21b39a775760658a7a03a69', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:57:33', '2020-10-20 10:57:33', '2021-04-20 10:57:33'),
('5d04879d06e861ece6470b41e94e5dc5477952d898e91a7804ce36358458aa2565988c9e386b9713', 7, 1, 'MyApp', '[]', 0, '2020-10-23 12:13:16', '2020-10-23 12:13:16', '2021-04-23 12:13:16'),
('5d14a10ff48b027f53bb923f7c2be3fb6184b46d65c1067a706b53c75c026a964561a12d9d39fe52', 4, 1, 'MyApp', '[]', 0, '2020-10-12 06:39:47', '2020-10-12 06:39:47', '2021-04-12 06:39:47'),
('5dd74bb4e71a9d4f58425c155b94320af729670dfd793cc43d36b4a5776cee006e9845259de3caf6', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:51:50', '2020-10-21 13:51:50', '2021-04-21 13:51:50'),
('5e407bf26524d4973a451dee701e5b52211996a15017383a62442b46a674501fb8bfd8ea691259cc', 7, 1, 'MyApp', '[]', 0, '2020-10-26 07:10:50', '2020-10-26 07:10:50', '2021-04-26 07:10:50'),
('5e8acb1e2a976544f78038a3c47f654fc9d38693fa796d8087358f0500c3705d65393d8e7a789c0e', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:36:21', '2020-10-12 13:36:21', '2021-04-12 13:36:21'),
('5ee454e9964b73cafedbac9e8409743a069515552926c42dd6c18b56de322ebbeb6f32983c117659', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:39:32', '2020-10-21 12:39:32', '2021-04-21 12:39:32'),
('5f558b8e5d19df5ee66350177ccc263e9c257635f2753a780435cd487d33d0b2b026cb9881bfa61b', 7, 1, 'MyApp', '[]', 0, '2020-11-23 12:42:18', '2020-11-23 12:42:18', '2021-05-23 12:42:18'),
('5f957308be985ce57580e23d1ec36e0d59d8f1d5e88c8516b29fbf2012e1639605534b94faa98cbb', 7, 1, 'MyApp', '[]', 0, '2020-11-17 11:13:39', '2020-11-17 11:13:39', '2021-05-17 11:13:39'),
('5fd6b02353385167e72bed73e3708354ff8dc0028c87a8a9e11ce0088de8bafd4bf4a5dd42e601d6', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:05:50', '2020-10-22 11:05:50', '2021-04-22 11:05:50'),
('6063b50c02adfe507593c13b0c1dc6ef18ca0f96eff9d8381ff3b428d4df040764ca5e7f5a5261a8', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:44:54', '2020-10-13 07:44:54', '2021-04-13 07:44:54'),
('60a0e62e99ab1b17ef6d81dd0f1394b15192cfc3f7ab8ad79da203b375e601b81cb6043ad372d65f', 7, 1, 'MyApp', '[]', 0, '2020-11-26 07:41:05', '2020-11-26 07:41:05', '2021-05-26 07:41:05'),
('60cf2f9450f5b518831f6c8b8e92973346068f5ba877c3029e7f763ad28396bbfda18456cd4dcebb', 9, 1, 'MyApp', '[]', 0, '2020-12-07 09:51:03', '2020-12-07 09:51:03', '2021-06-07 09:51:03'),
('60ecf301bcebdca6b4a911653c01c6a84f5ec9cb4690c4042270e721e190f11d6ce8035212631dfd', 7, 1, 'MyApp', '[]', 0, '2020-10-29 19:40:20', '2020-10-29 19:40:20', '2021-04-29 19:40:20'),
('611045df1f35f14307aef4d9d87747b96c27bd9aed44ffb0f04ad1cf4808188b5ff8ae4e862643ed', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:46:54', '2020-10-08 13:46:54', '2021-04-08 13:46:54'),
('618ecfa14880bad11abbec6b2ba626de2c1fd6ffee4bb89304f3ff96e8238281c00aafa46756da07', 7, 1, 'MyApp', '[]', 0, '2020-11-02 06:31:45', '2020-11-02 06:31:45', '2021-05-02 06:31:45'),
('61a53c458dc0eb591df237aeecf490d058b0fa9a01ae77d78918c1d1fa8895f57cdaff4bb64bf5c1', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:48:40', '2020-11-06 07:48:40', '2021-05-06 07:48:40'),
('6257f0a47ae3f9b32cdea941f4399b44317bd36d47e780fa9ab006b552bf1bbc5d6238f1c84673da', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:46:27', '2020-10-15 12:46:27', '2021-04-15 12:46:26'),
('6293ff798258499ccb5eea766af7a12ad3d9f85f531711a9f3a2cb254c8c17a13cd884a2841444fa', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:32:45', '2020-10-07 06:32:45', '2021-04-07 06:32:45'),
('62e4fb4fe9eed56138e31097a2beb66129a885c990e49e47dfb35f778ce02379bb8c246cd196250b', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:14:21', '2020-10-12 10:14:21', '2021-04-12 10:14:21'),
('637d830d75e1d4f6d99b7e560a8d1c7ba8ec931a33586850d3298802d08de0a7fcbc87e773bf3be1', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:34:57', '2020-11-16 11:34:57', '2021-05-16 11:34:57'),
('6395f269f17bd5ad617cc29e50185ed492037b8d0b4fac1813847c7c8bdac7da62cf2ea8a6bdbf02', 7, 1, 'MyApp', '[]', 0, '2020-11-16 14:26:45', '2020-11-16 14:26:45', '2021-05-16 14:26:45'),
('63b345148709a1607d65ed64372ae666fd9f3eadd4ac75711f75634eaa98c9c7e2c4773188b9b612', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:00:21', '2020-10-15 06:00:21', '2021-04-15 06:00:21'),
('63bc0e329b4624fa0a39584635a11faedd10a715a7d3f001e263536c05e5bfafe6c6136d88e8688d', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:54:51', '2020-10-09 12:54:51', '2021-04-09 12:54:51'),
('64139e82ebbe0ed7050bd9ac3657b51086c937ef06cf859cbcc6fbba3130d6e31674341e0e268e15', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:52:13', '2020-10-09 13:52:13', '2021-04-09 13:52:13'),
('641cf978b633ae3489110352d5fb7518c881b27a8e0cc5bf39214c10fd0013d2549309340dd35a6d', 7, 1, 'MyApp', '[]', 0, '2020-11-26 11:54:50', '2020-11-26 11:54:50', '2021-05-26 11:54:50'),
('64362ccad3ff75bbe6fd1163389ea8079b964c97b01f08fddf724729f4c5dd455f7d35ed55235fb3', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:37:51', '2020-10-08 12:37:51', '2021-04-08 12:37:51'),
('644e7c297ab4081e6d47b6e0b1291cbd0d2ca15a2355bd09763ce7593da62cb170c82b30d3332992', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:16:32', '2020-10-29 10:16:32', '2021-04-29 10:16:32'),
('6458655631195cc04d5696c770d3f2a58aeee3371cf5902c92782fa9869ede70f7b4922afe37b7e0', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:28:05', '2020-10-21 08:28:05', '2021-04-21 08:28:05'),
('650887adc3b789c460bb439656ba34185985d55a932c95e01845e7ac96da7c9d998e4b40bcebe9ed', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:24:44', '2020-10-09 11:24:44', '2021-04-09 11:24:44'),
('65525761588ec4655115ec38ca818c9aef142b6c118c65896e71eb4df2a74964c5c350b750606387', 7, 1, 'MyApp', '[]', 0, '2020-11-17 06:10:59', '2020-11-17 06:10:59', '2021-05-17 06:10:59'),
('655f5dc09e4d3bcb63f8fb854c6301d0bbcae320d57f3ab27b5975b3c8660a54ecaeaf3a42a181de', 2, 1, 'MyApp', '[]', 0, '2020-10-07 10:11:35', '2020-10-07 10:11:35', '2021-04-07 10:11:35'),
('6561126cfcb6f7be5a6b1d84c2c489bdc974800e3d6a6b2ec6dd8fee20737086b5290f797ccad8a5', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:06:41', '2020-10-13 07:06:41', '2021-04-13 07:06:41'),
('65943114aca650488ff9ea081ab6c7d6a8fbb1e5655636d5688408253cf8b3e69ba326647ab96f7f', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:51:57', '2020-10-06 13:51:57', '2021-04-06 13:51:56'),
('660e8a8d55673d61440111ae572ecb7046fc023f140dbb7de82a977dcef72be5d1f2cfa89a026781', 7, 1, 'MyApp', '[]', 0, '2020-10-21 06:00:52', '2020-10-21 06:00:52', '2021-04-21 06:00:52'),
('668a910ce7e43f639daec6085bc00223208d576ce6db64bc9a3a8aa593accf6ff62367335e2f41c9', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:49:51', '2020-10-09 11:49:51', '2021-04-09 11:49:51'),
('66969c0cd39f28bf14d52cae73c9867bd837e7865cdfc32c78f3e2c52f6ac16122eb7fa0aa67dc0d', 7, 1, 'MyApp', '[]', 0, '2020-10-26 14:11:18', '2020-10-26 14:11:18', '2021-04-26 14:11:18'),
('669c2da034207a36f337dfd89c2fa18b1224fe4f429c2a0ec8dceb0d97808e65bd312da8fc0b6639', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:10:24', '2020-10-13 07:10:24', '2021-04-13 07:10:24'),
('66b807e13767a6d88c25cee85b9d83fb2375f6ae31d65baf0921dbda88d12a2c734f6e804891d656', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:44:08', '2020-11-20 12:44:08', '2021-05-20 12:44:08'),
('66cd5310b490b355911ca34a7605d860c17146f1863819865ba8ff161d9a3f2be8aaa23d34c54de9', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:09:51', '2020-10-21 08:09:51', '2021-04-21 08:09:51'),
('6737d8a047c81df89a1f11d0f783d330fe9f109ef526261f06850ecedb9004c119b4f12fd61f5522', 5, 1, 'MyApp', '[]', 0, '2020-11-17 15:48:48', '2020-11-17 15:48:48', '2021-05-17 15:48:48'),
('67384d3a833c35beb9dd74543ae2243a155c35b21e61b25670a1d82c8314b2aa5e53a08d7326ec34', 7, 1, 'MyApp', '[]', 0, '2020-11-06 05:38:24', '2020-11-06 05:38:24', '2021-05-06 05:38:24'),
('678e27d4cb3e8a5d65da6a9b6864e5661cc52d904227168b8374d96b3e70750eceafb8406632d581', 4, 1, 'MyApp', '[]', 0, '2020-10-12 12:18:16', '2020-10-12 12:18:16', '2021-04-12 12:18:16'),
('67b35f77ccb7e15cdb8ec8d93af94d649bbd8108edcdb21909d0abbdd2ac308edccae17c55197a50', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:40:02', '2020-10-12 07:40:02', '2021-04-12 07:40:02'),
('68007865913577dd39b0768398d36e815fa74a0ca32d63120c0fe740efd0df42b9c48b161e6412a1', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:12:51', '2020-10-08 08:12:51', '2021-04-08 08:12:51'),
('68029393e6ee582255f8ceb23e0ad6ddf8809338580b7660bca26f8fd6f5a989eecb9dfe59ec7109', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:22:49', '2020-10-22 11:22:49', '2021-04-22 11:22:49'),
('684852f7f475241debb26b40ca62aed40e186ef14832284bc5a86c200e38c831aeedd806d58a6273', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:01:15', '2020-10-09 13:01:15', '2021-04-09 13:01:15'),
('68bc7461233d4b6e061150c4faaed6b60b3d5befc8315453d3a79c4ba21734f8bb4b5ca17d94d4b3', 7, 1, 'MyApp', '[]', 0, '2020-10-21 06:12:01', '2020-10-21 06:12:01', '2021-04-21 06:12:01'),
('68eccdfcd55a55726a7df467127896c6d155962741c9082b6265f87999d8903ca7e97e7943c82af3', 5, 1, 'MyApp', '[]', 0, '2020-12-08 15:35:14', '2020-12-08 15:35:14', '2021-06-08 15:35:14'),
('6931bbf9a6234822c7087823cb6ea19dbc387fc8b31cb6f3dd212b61ce9a6c72ca68cd6c5053c1e5', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:57:02', '2020-10-09 12:57:02', '2021-04-09 12:57:01'),
('696559b8c12922038e8c9aac7bd3489f29afa360ac40c110ac70c3efb9c997619f903765b8ab6346', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:58:26', '2020-10-13 12:58:26', '2021-04-13 12:58:26'),
('6a240c45ed3ba07db19823a4c99aa15f623f2e80583b46ab31afeaad4359d72c71d9833d8021b4af', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:30:02', '2020-10-08 12:30:02', '2021-04-08 12:30:02'),
('6a3ae1056640062e6f5bc58e5a41031bf4652c625d6707afb1ef18122f8f63ffc741571989cf03c1', 7, 1, 'MyApp', '[]', 0, '2020-10-27 12:03:20', '2020-10-27 12:03:20', '2021-04-27 12:03:20'),
('6a6e3281faf5ea4ad2f2aaa18224570cb1a5a63d2de2a41f6398712f69e6a2a9e4f7e20c790ad045', 7, 1, 'MyApp', '[]', 0, '2020-11-24 06:39:22', '2020-11-24 06:39:22', '2021-05-24 06:39:22'),
('6a9af1c3f01824a0b3da570d03ca3de59a8c3cf60ff7403dcbc65292cf9df3ff3f01782d2678eba3', 4, 1, 'MyApp', '[]', 0, '2020-10-12 12:49:30', '2020-10-12 12:49:30', '2021-04-12 12:49:30'),
('6ad4776101f6fdb547ba94e68ceb7a7f0e825f976cf8ebc75b7f5997b21872654b5e8d507eac1115', 4, 1, 'MyApp', '[]', 0, '2020-10-16 14:32:10', '2020-10-16 14:32:10', '2021-04-16 14:32:10'),
('6b0decaa807c480f05fd1dc5c2641b30e0c8a19da352d1952ca970eadd07df601c7cd7e190fd5b4f', 7, 1, 'MyApp', '[]', 0, '2020-11-04 11:09:14', '2020-11-04 11:09:14', '2021-05-04 11:09:14'),
('6b78b8fdba583952b1c5446cefc746ce37d57774e9e529320885f515349fbe15f131908444e3cc89', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:06:15', '2020-10-23 11:06:15', '2021-04-23 11:06:15'),
('6b9881749e8926f11d6a331f1600a3c6a40f58814e35b59a311402b12577a3a7e439a9687fa0f4e4', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:16:47', '2020-10-12 11:16:47', '2021-04-12 11:16:47'),
('6bbe6893174c237a64f811c8f873f4b6686d56bb8ea8f90c49390e3874ef8f9834db7ad077b603bc', 2, 1, 'MyApp', '[]', 0, '2020-10-07 10:09:42', '2020-10-07 10:09:42', '2021-04-07 10:09:42'),
('6bc40ca96031bc87a7568e27744613c3ea92b5678224a80ee2bb5a1ce291afaad667fd7ef9bf62d3', 2, 1, 'MyApp', '[]', 0, '2020-10-07 05:47:11', '2020-10-07 05:47:11', '2021-04-07 05:47:11'),
('6bf4c45780beabc7540920f77610e5d8ef657c4d9775e1d15916b14d0d13684915242a794d0d8d70', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:00:35', '2020-10-13 13:00:35', '2021-04-13 13:00:35'),
('6c04c985808807527ff1124db3835912562a9129881506c7ae2a0e221fb5066d478c9033d6553507', 7, 1, 'MyApp', '[]', 0, '2020-11-17 06:04:41', '2020-11-17 06:04:41', '2021-05-17 06:04:41'),
('6c1fd2555b680f9388d7b365db5699408eeec34895de8dff2ba0d70e7a6ad7f45abc8e76ffa44776', 7, 1, 'MyApp', '[]', 0, '2020-11-25 16:01:15', '2020-11-25 16:01:15', '2021-05-25 16:01:15'),
('6c20a9495e8658788abdddf5caba42386460fb3a9d67b271d1fcbdbd1989d5e1fe6535a61e53252a', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:11:10', '2020-10-08 08:11:10', '2021-04-08 08:11:10'),
('6c2620c49c4451780d8abf09fbc0b58643b437e8c331075fe895d848e4c6b6ac4a6eb426140dd389', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:41:03', '2020-10-22 11:41:03', '2021-04-22 11:41:03'),
('6c3604247d5e8097c2aee82a45ad573b4977da17757aff3cd162c9f3940d4ab735980d489a996951', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:45:19', '2020-10-14 08:45:19', '2021-04-14 08:45:19'),
('6c4df281f287c30340a9f529374499826f607eec3399cde61736dc7e2ab11eb25600c89df5e5c188', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:09:38', '2020-10-06 12:09:38', '2021-04-06 12:09:38'),
('6c89d607e9b74a5af90d171524b813fe028417343db6a6e321ce9c590d28e1ed044e639cd942f3f5', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:20:06', '2020-10-21 12:20:06', '2021-04-21 12:20:06'),
('6cd3e40d85d87ab3194e8b4eb4cfff204f6767c82814807c32ed51ada0ceeb1bae4949bc65e0663b', 7, 1, 'MyApp', '[]', 0, '2020-11-06 06:22:49', '2020-11-06 06:22:49', '2021-05-06 06:22:49'),
('6cd9a6c6637a8b79ffa3224bb21896d765d009d012adf4495b71195b01f0bd1542bc10b585721089', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:54:28', '2020-10-13 11:54:28', '2021-04-13 11:54:28'),
('6cf87298dd6b7ea2258868280bbd30354396bdc2c5f8e02ee25089cb2f066e471934d13a0ca90d34', 4, 1, 'MyApp', '[]', 0, '2020-10-20 08:29:23', '2020-10-20 08:29:23', '2021-04-20 08:29:23'),
('6dcccc26b4bd5e5dca3fd795373e733d31ebe14f9ffd474dd4aa36b7d7b5aa4f63f6e3493ce53702', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:15:10', '2020-10-15 06:15:10', '2021-04-15 06:15:10'),
('6e1f1b7438aa0f1a8fa855f4646976596903e622b474e261e54459046023f31cef1622dbf055fadb', 7, 1, 'MyApp', '[]', 0, '2020-11-13 05:45:34', '2020-11-13 05:45:34', '2021-05-13 05:45:34'),
('6e488e0df4672a24390b6218359a780c87777fba640996af2f790ebe2c212292c150a288c2ff43cf', 5, 1, 'MyApp', '[]', 0, '2020-11-06 13:30:22', '2020-11-06 13:30:22', '2021-05-06 13:30:22'),
('6ea8e23d5d458c149c3027c6d0fdf4df8f1716cdca3058dd9899ac5785b5d40c29b2696171dc7bb4', 2, 1, 'MyApp', '[]', 0, '2020-10-07 12:44:00', '2020-10-07 12:44:00', '2021-04-07 12:44:00'),
('6f2034c466dd9b0d6ef39c72c8565b4e6e7d534a66918afb48792fd19cf4df13e49991fc6a41ce73', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:56:59', '2020-10-14 06:56:59', '2021-04-14 06:56:59'),
('6f3eedcf01874a0516d3fffa20ad25b2ea70726f15721000a1f3d65ab38813bf01ba2cc5a034bfd0', 5, 1, 'MyApp', '[]', 0, '2020-10-30 05:39:49', '2020-10-30 05:39:49', '2021-04-30 05:39:49'),
('6f7ac1793c73809a4c355e31568f3b3f40d85f407b76a0c62bad13a44e27c094d98707242112512c', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:43:09', '2020-10-08 13:43:09', '2021-04-08 13:43:09'),
('6f9d76b5a31cdde8f3f5e39fa0c877fe1b9c77578d7296165456b5a686bc3f38fb62574f16e9081b', 7, 1, 'MyApp', '[]', 0, '2020-11-25 15:30:41', '2020-11-25 15:30:41', '2021-05-25 15:30:41'),
('6fd8610b3c0e4fc033aa319eb2b296515d8a9e3029cbb5561edc6397bb7d586ce4e29e4dd3b77d4f', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:29:40', '2020-10-13 07:29:40', '2021-04-13 07:29:40'),
('70189de4e1afaf8a5d6cc2cde0b8544688623d3c3cdc2b35a8d57cea00a4355f07c7a9be7a505bb3', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:31:44', '2020-10-21 12:31:44', '2021-04-21 12:31:44'),
('7042f014b65657146ffcb85e836fda274a39788cbb70eaf4f029789825a45a32061d7efc512cca04', 7, 1, 'MyApp', '[]', 0, '2020-11-09 06:50:57', '2020-11-09 06:50:57', '2021-05-09 06:50:57'),
('709817f3b2fb3ef61bda7183a377e840470aa5aeedbf986cbdf835b6edb11cbbc35622afe8172709', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:01:44', '2020-10-13 08:01:44', '2021-04-13 08:01:44'),
('70c4add9486ef12ab0bb5b9a89afb68445835bafd068fdf3f2c40584e1489feba81a5c913585f1a7', 5, 1, 'MyApp', '[]', 0, '2020-10-19 05:31:40', '2020-10-19 05:31:40', '2021-04-19 05:31:40'),
('71077d018217eb0ee5e4f1c77aaffb91cc267856545d39e490d0b7bf1567bf1aac07fe9c7d86d2f2', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:04:31', '2020-10-09 13:04:31', '2021-04-09 13:04:31'),
('713eaecdbfcdd82cc35706aa0a6e0a646965219a84892f7ab49d61eafccded0bbc2cdd8f37a3c944', 7, 1, 'MyApp', '[]', 0, '2020-11-13 11:10:57', '2020-11-13 11:10:57', '2021-05-13 11:10:57'),
('7153bc7dbd583e6f5e633da53b8c4075e3c0f5bad6cde283097edb61116e9e740875a2c64e55f696', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:53:36', '2020-10-21 12:53:36', '2021-04-21 12:53:36'),
('716332efb1e4f41f9a196d7b5581f81b52c1441d49df7525faafc4f4aace5182f1e73bfc0e57f502', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:19:43', '2020-10-09 13:19:43', '2021-04-09 13:19:43'),
('72084fabb6f2d42e38eb99b9c5cb80f72383a325cd6e2f168ccbc3fee8f9ff9eb78ff7eb332edfc3', 7, 1, 'MyApp', '[]', 0, '2020-11-05 06:15:38', '2020-11-05 06:15:38', '2021-05-05 06:15:38'),
('7215e73a12e21fbda1090907e258946bdd1daba69ca2e6523f67a6b51c13181123d2e2e5b8a5efe1', 7, 1, 'MyApp', '[]', 0, '2020-11-10 07:15:25', '2020-11-10 07:15:25', '2021-05-10 07:15:25'),
('7233b3a2088d8740f8b5a1ccc6077a9d9589f51747f05a4a926cf84d7f2365bf33a63eef851b4fa9', 7, 1, 'MyApp', '[]', 0, '2020-11-26 07:48:59', '2020-11-26 07:48:59', '2021-05-26 07:48:59'),
('728312c16f15de82e754846a1890f1cedee306fe6d0e83240e4999b2bc5ded034eb34b3001981dd1', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:44:03', '2020-10-09 11:44:03', '2021-04-09 11:44:03'),
('729a7e35e0027c670223fc8430ab2a7eb97fe1fdea5c100d931aea38b60933ad6c0a6ea912996bb0', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:56:18', '2020-10-06 13:56:18', '2021-04-06 13:56:17'),
('72ce30adfcf7d2f50f25bfb0bcf79c611b6e896073350741f42f343d2463066dad19d1e30fd80b15', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:00:00', '2020-10-07 13:00:00', '2021-04-07 13:00:00'),
('730f9ba4cbfa00381f620e051d47564bd2bcde0305cb21bb8f25d4a2dda9e6876b428a966570eb9f', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:36:46', '2020-10-13 13:36:46', '2021-04-13 13:36:46'),
('731d68f2cd2728ac58253351bd599ddf4cfa3e8beb2f88c48cbca05b2a9bbaefdf6625ab5400b50b', 2, 1, 'MyApp', '[]', 0, '2020-10-08 07:04:02', '2020-10-08 07:04:02', '2021-04-08 07:04:02'),
('7357ae6f45b304de99a644f6b4181cc5350bb0b5acf4ea6b095de704165029c025d5fe30d83d768e', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:00:36', '2020-10-23 11:00:36', '2021-04-23 11:00:35'),
('73646ff553e350edae57d73e254e1656752f0aad845e30513790aba06210511aa957d13f4391bb51', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:10:45', '2020-10-20 10:10:45', '2021-04-20 10:10:45'),
('73bbb0ccddd0a8a9ecca580592c32c36df33f58de759063968e6a176ac3e544a8eed2d4a031139a3', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:40:44', '2020-10-15 10:40:44', '2021-04-15 10:40:44'),
('742c0655c5727c74e54af05b9f62e01dbceca42bea16be384b9ec245a28188befcc11143303309e9', 4, 1, 'MyApp', '[]', 0, '2020-10-16 08:22:05', '2020-10-16 08:22:05', '2021-04-16 08:22:05'),
('747caf836fa64e6396f16fef101238a66df2edc2a3853bd660d15373b225a67fa7fcf813b648012f', 7, 1, 'MyApp', '[]', 0, '2020-10-22 05:55:52', '2020-10-22 05:55:52', '2021-04-22 05:55:52'),
('74c2c8f36a0f4f03ded7e4c115bd02f1ac42d17edc272a52e8dec40b32f1bc26b0f0830ef73758c2', 5, 1, 'MyApp', '[]', 0, '2020-10-27 23:53:42', '2020-10-27 23:53:42', '2021-04-27 23:53:42'),
('74d2933821fe6e633f8950ec767531216c61b89102743c4646ab8902014bf058255cbb7f1f24586f', 7, 1, 'MyApp', '[]', 0, '2020-10-22 13:52:20', '2020-10-22 13:52:20', '2021-04-22 13:52:20'),
('7514c5a64a094a7f2b2baf238f85da784028ae16da22723f0409d72f2ecc34307be613e92544db12', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:12:42', '2020-10-09 13:12:42', '2021-04-09 13:12:42'),
('757ff3c1994670b8cd6b3b8200b211c4bc85f2033bc20b5e515b0aff56526be5dad3968c42d4b7a5', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:38:28', '2020-10-09 12:38:28', '2021-04-09 12:38:28'),
('766337796bfc71bba4c7af5724534b2cbde0f0c85fda5c407f82511890ff4d083761b6ffcb7f59cc', 7, 1, 'MyApp', '[]', 0, '2020-11-10 07:40:42', '2020-11-10 07:40:42', '2021-05-10 07:40:42'),
('76d20155ad0bd42342fcb3561b999f95823e3ff935c11cf148acc31c137d6a64f0d24479e46981ce', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:30:50', '2020-10-12 11:30:50', '2021-04-12 11:30:50'),
('76d60291f55e59707d1b07672257de8fa0dba4a21dbd2076efb82db5799cbfd95de518ae42fcac5b', 7, 1, 'MyApp', '[]', 0, '2020-10-27 06:10:34', '2020-10-27 06:10:34', '2021-04-27 06:10:34'),
('76e047b663dcead2b9c9ebd04fa23f107e647a3149f1f82c9b73b773f1158d6546dd6bf983297356', 4, 1, 'MyApp', '[]', 0, '2020-10-16 06:10:11', '2020-10-16 06:10:11', '2021-04-16 06:10:11'),
('76e8064769482d4bfc6af8b94865ed52a3395b0efabdfa12a5e681e245c8f9adf30e48ebe6589c8c', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:03:26', '2020-10-29 06:03:26', '2021-04-29 06:03:26'),
('78298c870ff6c1bc6bd2fe4f94d8ddf4f713c761d5751c1d29a55faa78f55626f10c33a58ceae27f', 3, 1, 'MyApp', '[]', 0, '2020-10-07 14:18:58', '2020-10-07 14:18:58', '2021-04-07 14:18:58'),
('7876da0f406234488f0c5069b1e164479a6519033c21b9e9148dd10b8cb4b17fb1b39dc801b7cc5d', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:34:06', '2020-10-06 13:34:06', '2021-04-06 13:34:06'),
('78d55b366615054fb6c8adb8dd990fb39f55796fb397ca95648004ba76ce0fd76cedade340f2e0bb', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:06:54', '2020-10-22 11:06:54', '2021-04-22 11:06:54'),
('79361baa53dccdbf1e7fb59bcbcc38a23798a36e76c8f9eae247be3f1c618ec07a81af6a2b6a8282', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:56:55', '2020-10-29 06:56:55', '2021-04-29 06:56:55'),
('795a8888231b4e4e2141b366b2eb1ad3a9d524d4e58f29fd4bde6a453b4b118dcb20e09f0b9cf27a', 4, 1, 'MyApp', '[]', 0, '2020-10-09 21:39:34', '2020-10-09 21:39:34', '2021-04-09 21:39:34'),
('79b61a32fc0d1c93241beaa9175c8940bc90a637f0e2cf15c7bc21364f0475c47f10ce3c78065d21', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:22:50', '2020-11-16 11:22:50', '2021-05-16 11:22:50'),
('79c045ba9da8143cf5ba8dc6f25d9e3a04d2db21b89024e5cb06d0d1742eea7e11b98354f4ef7d80', 2, 1, 'MyApp', '[]', 0, '2020-10-06 10:41:36', '2020-10-06 10:41:36', '2021-04-06 10:41:36'),
('79fbd111d1b86de601674b39676a3e73f389a6863147c20fa5e4247628b48c27d893b65d0517ec30', 7, 1, 'MyApp', '[]', 0, '2020-10-23 12:13:38', '2020-10-23 12:13:38', '2021-04-23 12:13:38'),
('7a04e13d0133ad89d054fc4acea24a5576008efb90f41e214963ca5b25b0f2a7ccd8d3cfaf12128a', 7, 1, 'MyApp', '[]', 0, '2020-10-21 11:58:00', '2020-10-21 11:58:00', '2021-04-21 11:58:00'),
('7a2e1b17f937d7f2226b71ac438c3000be4ef9efc6d9228ae83cbb81cdca3d6ec4864a3da8c7dfdf', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:50:24', '2020-10-19 13:50:24', '2021-04-19 13:50:24'),
('7a585c8d5c5cddcaec85c443a7956bd87e4ff3b63c3f7661e0231b494b3518fd9a1d76ee5a48d636', 4, 1, 'MyApp', '[]', 0, '2020-10-10 18:31:31', '2020-10-10 18:31:31', '2021-04-10 18:31:31'),
('7a915d3dfe67b5f81ef396f1bfd139494ba2b5ffba0af71594d7b4a6dc8b8e1a279a68e3106c038e', 7, 1, 'MyApp', '[]', 0, '2020-11-10 08:05:46', '2020-11-10 08:05:46', '2021-05-10 08:05:46'),
('7accb21174976978ec9be9f3674169dcbe7ee75cab90270b531e097c7395112b45adf8a6c12519a5', 2, 1, 'MyApp', '[]', 0, '2020-10-07 05:46:54', '2020-10-07 05:46:54', '2021-04-07 05:46:54'),
('7ae1296056d23b60219ddf20b0544e1a96d9eaee5251abbd645c82ba925ad51ada211d2a649cecf5', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:07:33', '2020-10-06 12:07:33', '2021-04-06 12:07:33'),
('7b5012d1dcce59c1f4a07836507e8cf85d7fd92cb120346c75d63f11d8f1a0d95998f33917b91083', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:04:15', '2020-10-08 12:04:15', '2021-04-08 12:04:15'),
('7bbe0eeb8ae2f61d3cfae2f6dad224e77656c21bf3dbba1f8a35824bd23bdfaf16db43721239f80b', 7, 1, 'MyApp', '[]', 0, '2020-10-23 12:17:31', '2020-10-23 12:17:31', '2021-04-23 12:17:31'),
('7c00bc77adbd1bf89212f7cbfd2bb597905796c55babaa67e11d0bf18e3225cf9218f9240d2e67fe', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:46:49', '2020-10-13 07:46:49', '2021-04-13 07:46:49'),
('7c5b824bf6a25d3e30fe37c7294b396f9d7e15dd1170b6612b39b87048d0ad3332caa46d3ffd0a8e', 4, 1, 'MyApp', '[]', 0, '2020-10-16 08:10:48', '2020-10-16 08:10:48', '2021-04-16 08:10:48'),
('7c6ae961dcb5416dee1add3ba44f5f748be0f9ac20c2d3da7c008b19a63c244b9397cd5d22df8984', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:19:53', '2020-10-29 07:19:53', '2021-04-29 07:19:53'),
('7cd889903f6e3738a56b7065a4481a94ec10e9f79bd5e29f0f7140a5f4e8cbfaf768807c79ceeac3', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:03:29', '2020-10-06 12:03:29', '2021-04-06 12:03:29'),
('7ce9496a76b9676e7c339ebaa57d5055d00355eb08e3712bf48d1c135df38c436804e4acf8c40b5e', 4, 1, 'MyApp', '[]', 0, '2020-10-15 09:48:06', '2020-10-15 09:48:06', '2021-04-15 09:48:06'),
('7d1e3beee5f435683248ec73bbf689d4b040c0a1a089c33b28ed5e3ddcf4497f3cafae76377913de', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:10:46', '2020-10-12 10:10:46', '2021-04-12 10:10:46'),
('7d350ae76d5b7f7d436903f6edd71c35ed894185f5672129e97c7637524547b843842ce244c7799d', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:44:13', '2020-10-07 06:44:13', '2021-04-07 06:44:13'),
('7db15a92db7370ddef31fc64d3d3d9e55e0f24c38b9b77507a432994edcbffb3bb88cf4e89e27eb2', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:32:22', '2020-10-07 13:32:22', '2021-04-07 13:32:22'),
('7dbf59de38e8fbd72fe432a751e267e9e52c2259b3b3dfdee74ac1f5b95f9185f4b0c0c5db223798', 4, 1, 'MyApp', '[]', 0, '2020-10-20 08:29:02', '2020-10-20 08:29:02', '2021-04-20 08:29:01'),
('7dc0fe787a9e1612c7cca98294f66f94aea7c39e2981b6b2971216443e84179adf21291eb791e88d', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:08:47', '2020-10-15 12:08:47', '2021-04-15 12:08:47'),
('7e7aaf284a722432293dbaae5c752a55a13201b8d655f1294416a7c3a221db98dda718848ada7235', 4, 1, 'MyApp', '[]', 0, '2020-10-19 06:06:24', '2020-10-19 06:06:24', '2021-04-19 06:06:24'),
('7e8240994574fd33c6f606b730e8c91821ef2d15972f0daf8b5e40557fd6412df23381c9ed5b1f23', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:03:12', '2020-10-23 11:03:12', '2021-04-23 11:03:12'),
('7ea6dfb5326e0168068bbecc1fa842b58fd660808ac26fe1e1bda0de7670eacf3f9d88a43494939d', 7, 1, 'MyApp', '[]', 0, '2020-10-27 12:46:56', '2020-10-27 12:46:56', '2021-04-27 12:46:56'),
('7ea7800417e9f9444b712c14ea8e33c6fb10c68bdfd709e32df388cbcdf4b4afdce73f21563d1724', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:03:02', '2020-10-14 07:03:02', '2021-04-14 07:03:02'),
('7ebd2f813488783253a4648d529bf02568fce182eac835666d76ecbafb3b86293077f1890254bf23', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:43:43', '2020-10-08 12:43:43', '2021-04-08 12:43:43'),
('7f1671ed80c52e52542dce82e317669e491160d3150641fd8c58f325dc0551968047e3b98f61845e', 4, 1, 'MyApp', '[]', 0, '2020-10-14 19:34:00', '2020-10-14 19:34:00', '2021-04-14 19:34:00'),
('7f16ba4c8d6e44bd255f5e84ea3bd888e0b734857a992aebdefa3a35909a0849387c817626652bef', 7, 1, 'MyApp', '[]', 0, '2020-11-11 13:24:04', '2020-11-11 13:24:04', '2021-05-11 13:24:04'),
('7f3e9e01da7beed587d1bfa20e45eec2c5666503c351daee5e6a958228d668e96c3ba79a0d9aa3a9', 7, 1, 'MyApp', '[]', 0, '2020-11-11 13:20:21', '2020-11-11 13:20:21', '2021-05-11 13:20:21'),
('7f42126b281359bbbd53d8eea27340a3a134025eb0f69a1d8ce6e525b5c29bbe9b52329113b5c1e7', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:45:06', '2020-11-06 07:45:06', '2021-05-06 07:45:06'),
('7f88d02f3872c34d977163412491e2586bef648fa80cba24f3b024ddde8e09468d4ff823c0b6a61b', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:32:19', '2020-10-29 10:32:19', '2021-04-29 10:32:19');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('7fb7c5c392a799dcb0262149c9460a17ce67fd88b8592964dc49f905c1b0ba6ee71b68d801c77e06', 7, 1, 'MyApp', '[]', 0, '2020-11-04 13:25:10', '2020-11-04 13:25:10', '2021-05-04 13:25:10'),
('7fe1817adac86a7985a21f29d3bcec61b24ace9c5a1ee5af17e292702cfcd3649c8cc2799be63280', 7, 1, 'MyApp', '[]', 0, '2020-11-05 12:27:17', '2020-11-05 12:27:17', '2021-05-05 12:27:17'),
('83007769fba77ffa7bbc846d188de24b39cda766e251eb9dbc46ca324d1c05ff9a505f3dd538ef43', 4, 1, 'MyApp', '[]', 0, '2020-10-16 06:06:41', '2020-10-16 06:06:41', '2021-04-16 06:06:41'),
('8305ac6a3ec62728fdc7a2f6cf50237ffb74fbf9f7d6ab813a6157d05c6014e48e7df967681ee200', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:30:06', '2020-10-12 08:30:06', '2021-04-12 08:30:06'),
('8334ddf22d34d4c527d7e3e2e99e071418fae84fe80a58342cd47b1453faf4a4d839d5f7f889be18', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:00:20', '2020-10-23 11:00:20', '2021-04-23 11:00:20'),
('834a0fafe9a3e25d87b9a2e3f286229e12e0b1588bd55eee9043c5239c53ca08437a8658e048c12f', 4, 1, 'MyApp', '[]', 0, '2020-10-16 12:19:21', '2020-10-16 12:19:21', '2021-04-16 12:19:21'),
('83efb0a8314fa1e27edc14d3f3f0d0d2745f3f1ad58887e3b08587e192ba266b909ee24f00542956', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:59:27', '2020-10-06 13:59:27', '2021-04-06 13:59:27'),
('840f8d0abddd0913fabc8491f79b85d89f2892b63b199d884c9fd9df5d764633758e5e6d6feadf2b', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:41:13', '2020-10-07 13:41:13', '2021-04-07 13:41:12'),
('84109a4b5cbbaacc7aca8f9f0dac89179be8de9858dd510e780c39ced902f63cf6525ed7f65e128f', 7, 1, 'MyApp', '[]', 0, '2020-11-26 05:43:58', '2020-11-26 05:43:58', '2021-05-26 05:43:58'),
('841e7bcfe3e93fd2777c922052abb63e1c960f8684803ec71dfc814d0f12a6957bf3f754ca176f30', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:03:14', '2020-10-14 08:03:14', '2021-04-14 08:03:14'),
('846e948060d4a368b16f16ef01e7772c0beea693729bf13af7509f464c08000919f84663c132b85e', 7, 1, 'MyApp', '[]', 0, '2020-11-09 13:11:20', '2020-11-09 13:11:20', '2021-05-09 13:11:20'),
('84b531c32b3287bbfc623c2c34f43d72caeec218671acd76aace7732ea8006c1c9780b8c036098cc', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:43:47', '2020-11-06 07:43:47', '2021-05-06 07:43:47'),
('84e5f6190b990f04de9fe75216b4c2e1f3b948dc5b361bd9d9ecc9cd97f019ad5026980b47a07949', 7, 1, 'MyApp', '[]', 0, '2020-11-05 14:30:40', '2020-11-05 14:30:40', '2021-05-05 14:30:40'),
('851adaa41e389145f4b49dcda0a15c51752f8d0647065a7738914961abb1b7d947b839ecc55ce265', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:06:07', '2020-10-07 06:06:07', '2021-04-07 06:06:07'),
('859123e8a0b7f6d14d926e624df14bfb237d3e7af32f9322c1dfb6bd31b236959b437e76c8968c50', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:58:54', '2020-10-21 13:58:54', '2021-04-21 13:58:54'),
('86006d203112da33cfc79d742f32d1ebb57ec52a300d5c46fd4232e694f678793affe48ff0ce36be', 2, 1, 'MyApp', '[]', 0, '2020-10-07 08:19:12', '2020-10-07 08:19:12', '2021-04-07 08:19:12'),
('864adde8bda7b015fd891cd0a19fd2ec0104f86d60b5db77d12709be96e6cacbea34070429e58a2e', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:38:22', '2020-10-08 13:38:22', '2021-04-08 13:38:22'),
('867ed5873be3df1af93e3695376fa8c1fce88895d3f76a4a6c9cffda08cf032de7b8389a566f895f', 7, 1, 'MyApp', '[]', 0, '2020-11-05 06:01:15', '2020-11-05 06:01:15', '2021-05-05 06:01:15'),
('868b1dbc5bf5d7903db13bac1a42fdb77f858d7a509cd5a78bb8f1f56fdbab8de381f6b9632a0b9c', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:28:36', '2020-10-20 13:28:36', '2021-04-20 13:28:36'),
('86cdd73832dc34fcb9e95535727799c3fb4e0fc032f2ef4bab3c2210fef5de52d077367d9db0ec54', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:15:13', '2020-10-13 13:15:13', '2021-04-13 13:15:13'),
('87285dad55e46ce9aa57163c71ceda9d8a9552bb01662e26114a6a917e5c7d21e702304ff1acf305', 5, 1, 'MyApp', '[]', 0, '2020-11-11 14:44:12', '2020-11-11 14:44:12', '2021-05-11 14:44:12'),
('87640ba4426b54269706a78d718289f2716d9d9115f01681058066801ce4b27bb8b609073c4f58f2', 7, 1, 'MyApp', '[]', 0, '2020-11-05 13:36:56', '2020-11-05 13:36:56', '2021-05-05 13:36:56'),
('87ed56e8d762d84d289022e6ef12c6f1f66c8b5e15128efbfdacc7de217ff170cb9506437cf5606e', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:06:45', '2020-10-13 13:06:45', '2021-04-13 13:06:45'),
('87f3b1fb3076f40bdfab2e79e231b7ebcb9628bbecab1fc2503bbb24cea8dfb07d0f6b74bced4f79', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:52:52', '2020-10-06 11:52:52', '2021-04-06 11:52:52'),
('881a90402401f67f68920eb79da5b54a6a0b53de3a8a9549370ca9c37f6ba624499ed14361685a3a', 7, 1, 'MyApp', '[]', 0, '2020-11-04 06:42:08', '2020-11-04 06:42:08', '2021-05-04 06:42:08'),
('88397bc8b5319910860e46ca7dc0cc6ed8b1b27a1c4259e47d8cf9743e52ead7e94c623b966cf8d5', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:25:00', '2020-10-14 08:25:00', '2021-04-14 08:25:00'),
('8865d7d368278d5078f813bcf293e73010fea7ffdb13f72bf6a521a4bec01de12c3a717a392d1fa4', 2, 1, 'MyApp', '[]', 0, '2020-10-06 06:13:18', '2020-10-06 06:13:18', '2021-04-06 06:13:18'),
('888bd914d0e1c626dfb280ea3958b4c94053ac56e6f8c013159ee075a9c7cfd8f06518b24a170c9b', 4, 1, 'MyApp', '[]', 0, '2020-10-15 07:59:52', '2020-10-15 07:59:52', '2021-04-15 07:59:52'),
('8895978cbfdc4a674accafb30719e1d3342f6214259313ee034a15226d3bf8fa5dc99e5670111c82', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:23:23', '2020-10-14 12:23:23', '2021-04-14 12:23:22'),
('88b4c13a9c866ee87be629e50971c5a6d5f9e356678d09122835367c1d49c1b28472a507cc720dc2', 4, 1, 'MyApp', '[]', 0, '2020-10-08 11:18:27', '2020-10-08 11:18:27', '2021-04-08 11:18:27'),
('88c0f46d2f62d17b35f2b6d727febf155bcf46fd8ff65a597e8b5c4320c72de8ba0ecf7f4aa7f1e4', 7, 1, 'MyApp', '[]', 0, '2020-11-16 07:57:40', '2020-11-16 07:57:40', '2021-05-16 07:57:39'),
('88d94e8e190062369c575ba44bb73688652feaf50878c5bf9932becc94656cc18875e91f84eeb744', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:58:20', '2020-10-14 07:58:20', '2021-04-14 07:58:19'),
('88fcd5801725aafe759e5902cb3ce3c52f0444ef9730c9625274ce08ba6899dcea4c810e65e40c2c', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:03:18', '2020-10-23 11:03:18', '2021-04-23 11:03:18'),
('8900475ed4f16a9a9589f928a9060d2348857c37edfa09d9f32937e1b7b73511a0eae05d0092220c', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:58:50', '2020-10-13 11:58:50', '2021-04-13 11:58:50'),
('890141f97b62818c2a328bee373e3380c961bd471b43899feef0e2ee7d6be3b5410b85ced5eba7c8', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:55:19', '2020-10-09 11:55:19', '2021-04-09 11:55:19'),
('89252d63505dee747614e3142f3ce316faa19f6afec853a9286f952b3b07a926ce12e1739ea1b990', 7, 1, 'MyApp', '[]', 0, '2020-10-15 08:14:36', '2020-10-15 08:14:36', '2021-04-15 08:14:36'),
('89454bccaee1a8415b0ef7d8d35f7a23b5ff429182cc6e36fbb3bbd7f2e9b03cb17a97213811e72c', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:48:24', '2020-11-20 12:48:24', '2021-05-20 12:48:24'),
('896848222ec7616e1231e80756e0bb1fbf3e4736cdbcee4891ebbad53a2a99ce61dca13fdd1638a8', 7, 1, 'MyApp', '[]', 0, '2020-11-17 06:07:43', '2020-11-17 06:07:43', '2021-05-17 06:07:43'),
('89758832a310d4623c0026f7e13cada45a33a6a32aa28bab4d2a1b9569f7b3028dac02bbe54284ab', 7, 1, 'MyApp', '[]', 0, '2020-10-27 13:20:11', '2020-10-27 13:20:11', '2021-04-27 13:20:11'),
('89b6281a6f82c68a93b376615ea16f0f92b4892ea5dc7f1763430497c29aad984c17af7de4f8461b', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:53:09', '2020-10-14 12:53:09', '2021-04-14 12:53:09'),
('89c4951c663007ee6f639585bed871e3a21d064ee37450ac1841d6827c0de80935d10891cec4cf69', 7, 1, 'MyApp', '[]', 0, '2020-11-09 13:07:38', '2020-11-09 13:07:38', '2021-05-09 13:07:38'),
('89d3508580b5ac4bb6184f471a1cb69287a590f94d934236a09f709284ac35127b743775850b61c1', 7, 1, 'MyApp', '[]', 0, '2020-11-26 12:34:30', '2020-11-26 12:34:30', '2021-05-26 12:34:30'),
('8a1fde87464bb33066cfa6c906e0270f69655bc5d73f08edb1865da98cfac0746f831ce96cf9818f', 7, 1, 'MyApp', '[]', 0, '2020-11-26 05:43:26', '2020-11-26 05:43:26', '2021-05-26 05:43:26'),
('8ad2dd6be5637ca6e525bf4f91759663cddbb9ad17d3a11f4417141c8814b6bf8216415de7a2275a', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:55:55', '2020-10-12 10:55:55', '2021-04-12 10:55:55'),
('8aeda088ecdf5714e3aad4e82bf6d3153c45d16b850b28ddcab8343b44185b56b623cbcc636e2ffe', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:26:50', '2020-10-12 08:26:50', '2021-04-12 08:26:50'),
('8af4f727d4b152da8d126a3fd18179adb110fcdcad3ff9fd45163ed5941f4d58b8ecff835aa1e7e0', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:57:38', '2020-10-30 06:57:38', '2021-04-30 06:57:38'),
('8afb801118ca0173bf420056dcf7cd5ec997acce5551b5b075d10a539be344b69f8a58dfa38a14d4', 4, 1, 'MyApp', '[]', 0, '2020-10-09 05:46:26', '2020-10-09 05:46:26', '2021-04-09 05:46:26'),
('8b0f069e0b0fbf9ff96172145b89ae9494501b8bcd93e4a884b19850514ef8da7629af9e7e04823a', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:53:59', '2020-10-06 13:53:59', '2021-04-06 13:53:59'),
('8b289b287af75647617498b4a80b9a2eecfe65a60a0a98abc83d94cfdac4da6a193ee2a98de334c8', 7, 1, 'MyApp', '[]', 0, '2020-10-26 13:58:23', '2020-10-26 13:58:23', '2021-04-26 13:58:23'),
('8b6875a57d2e578cec48c71eb570fa7f6804ba6a4762e43893c8030147fbeda3c2f47d07e2d7ffef', 4, 1, 'MyApp', '[]', 0, '2020-10-09 06:33:36', '2020-10-09 06:33:36', '2021-04-09 06:33:36'),
('8b78c56a2a9b2b92230976ad24545af180cacee33ac239c6d6af1ccc208ebd21693ff6a224b0a1b8', 7, 1, 'MyApp', '[]', 0, '2020-11-09 12:58:39', '2020-11-09 12:58:39', '2021-05-09 12:58:39'),
('8b800a3978573fb37357555f4ad386f86e526c005111effb62f9806f9e1e19aa26773e06d111555e', 7, 1, 'MyApp', '[]', 0, '2020-11-03 11:55:04', '2020-11-03 11:55:04', '2021-05-03 11:55:04'),
('8b9edffe07d4c132f827516aa26cd569f9d759719469af382c0ba5c2cfe4208447e2abba36509695', 7, 1, 'MyApp', '[]', 0, '2020-10-26 13:12:33', '2020-10-26 13:12:33', '2021-04-26 13:12:33'),
('8bb99bb5972c463b7b5454a27a5c8b483531df440afc33805f1fc8b81ac43251f218273e5b96f85c', 7, 1, 'MyApp', '[]', 0, '2020-10-30 07:49:01', '2020-10-30 07:49:01', '2021-04-30 07:49:01'),
('8be3e883107be3f66288cae7d60aab2e27be31c64020cfbea26080b4f096198af46bc587650f52fa', 4, 1, 'MyApp', '[]', 0, '2020-10-15 09:55:59', '2020-10-15 09:55:59', '2021-04-15 09:55:59'),
('8c2ee978552d7bd07b7c0994731c10ade250b1f8a456d46b951e430030170596696ae3edb5dd9681', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:30:48', '2020-10-09 11:30:48', '2021-04-09 11:30:48'),
('8ca0025b11c782d87557602698230cc70ce4caecd19474d1f2ed729a115296ac7c0360a41dd3e1dc', 7, 1, 'MyApp', '[]', 0, '2020-11-09 12:22:58', '2020-11-09 12:22:58', '2021-05-09 12:22:58'),
('8cb6d9798333425fed18eb2037fdcc7735a6d153c667f0d3192df6e4dbcd76600cc0069968ecc0a7', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:02:25', '2020-10-09 13:02:25', '2021-04-09 13:02:25'),
('8cc7cd3dbcbc1519e863d0dfdcfbfa559eddceaeae92cb13cc0d4e3100ee29ab8f7bed6b4c5bb743', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:35:46', '2020-10-09 11:35:46', '2021-04-09 11:35:45'),
('8d215e1932a34c519b8cbede688cad5dbfe76e81c16d963ec4f48f4053c8f7580118218ed7e144c6', 2, 1, 'MyApp', '[]', 0, '2020-10-06 10:23:49', '2020-10-06 10:23:49', '2021-04-06 10:23:49'),
('8d3dead87bef423f8940f4f35809380a125a702b167264ff28a1fc6f1228c82bc0332860c558b651', 7, 1, 'MyApp', '[]', 0, '2020-10-22 07:50:51', '2020-10-22 07:50:51', '2021-04-22 07:50:51'),
('8d40b62832ce662de2d7bfcdf71b4debc9ac7fac682d39938d229ddc132c92e48d93104cdfc472fa', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:14:02', '2020-10-29 07:14:02', '2021-04-29 07:14:02'),
('8e956f67f9ddfa2695f686cceae22113cd9cbc7a0aea19557a9c582f8d5c65efc3bc0809250d24bf', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:41:05', '2020-10-15 10:41:05', '2021-04-15 10:41:05'),
('8f0078ac7e4678eae989eb91931e57150a1ff3a51a0749c10efe7fc5b1d0837712f679c4ffae1f01', 5, 1, 'MyApp', '[]', 0, '2020-11-10 14:45:52', '2020-11-10 14:45:52', '2021-05-10 14:45:51'),
('8f28bb29ee7ad34c3fe202db519a429a92c6e2ef4e4240d3b659d8dc6919a254f6737b5d21f4bc83', 7, 1, 'MyApp', '[]', 0, '2020-11-12 08:02:52', '2020-11-12 08:02:52', '2021-05-12 08:02:52'),
('900ec4d6256d813ccbbcf6d253591eb1ce0e4256e10927ac40bc4a12c47c14075c3b0ccf74a874d5', 7, 1, 'MyApp', '[]', 0, '2020-10-26 14:10:42', '2020-10-26 14:10:42', '2021-04-26 14:10:42'),
('9018955f0d4216635514476141fb343b6bab3e44d4f4d13e4621b3e3cd53e9ed3b739c52f29ada44', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:21:36', '2020-10-15 06:21:36', '2021-04-15 06:21:35'),
('903dbc138773dbfc212505a2e5cc4d6e8416a505f72fd7c5331ce668b10b6946092cc4a25eab6d5b', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:43:32', '2020-10-07 06:43:32', '2021-04-07 06:43:32'),
('9042d3aaf396f75948bca587f1fc6d64ca7fa5915dd147905897a5cc4d1cba985f5c5da620360f56', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:09:13', '2020-10-13 07:09:13', '2021-04-13 07:09:13'),
('910574d8a5f892ebdc6e42f1aaff7d1d3d2987b26a75c4edaafa4f2fd32d6ab9ac71f0767860a3e6', 7, 1, 'MyApp', '[]', 0, '2020-11-03 08:08:00', '2020-11-03 08:08:00', '2021-05-03 08:08:00'),
('917440428c0f20c3a48c28919e0c29857666971d85cbeaebb639ea40e970dd5facfaa07a31627705', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:31:05', '2020-10-13 13:31:05', '2021-04-13 13:31:05'),
('9190d11a5c9429e3b2b3b9c711ba86acbf4d0782a21b3257573ed9d3493ae1306d3741b5d61cd966', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:20:50', '2020-10-06 13:20:50', '2021-04-06 13:20:50'),
('91a5b944db35b48be8674213acd3468ea8fb28f45c5aec17d3b7ac228d4b0dda9b6c0c795da29ae7', 4, 1, 'MyApp', '[]', 0, '2020-10-16 07:51:17', '2020-10-16 07:51:17', '2021-04-16 07:51:17'),
('91f5f17e7904206d7d6d64fcb664bdf42eba4336157ca094bd73e72191d1fce0713997bc412167e8', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:49:44', '2020-10-20 10:49:44', '2021-04-20 10:49:44'),
('92185d7c34e29f0cfbeafc8f578ba37fdba1089752d953a98b2f814c40c97e43399cbf5823491de4', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:18:59', '2020-10-22 11:18:59', '2021-04-22 11:18:59'),
('92192cd0dfbb4ab2b132355453b064ff626a8eea1005d55da92270e85d34079781294be1ff30ced0', 7, 1, 'MyApp', '[]', 0, '2020-11-26 07:56:31', '2020-11-26 07:56:31', '2021-05-26 07:56:31'),
('929644291d2af31907fd8a2e3e7bad1d9be5108a2c2c8a1ed10cac598026c26126be00bec0495c2b', 4, 1, 'MyApp', '[]', 0, '2020-10-14 11:52:05', '2020-10-14 11:52:05', '2021-04-14 11:52:04'),
('9297cf3a9e7df21d36d809c293b260bfdeec97261e046a731e947bb36b3e31dd8578b0b505d7dc65', 7, 1, 'MyApp', '[]', 0, '2020-11-23 09:58:50', '2020-11-23 09:58:50', '2021-05-23 09:58:50'),
('93038607609c68aa5735cbdb15da749a67970e8bc544edcce066515bbbc96be0b591832a4641d508', 4, 1, 'MyApp', '[]', 0, '2020-10-10 13:34:57', '2020-10-10 13:34:57', '2021-04-10 13:34:57'),
('930ec60aeafa837f2c6b896570e67e4dbeee0314112c1eba488e1b8c8f447e8df88ab8a81276e8f5', 7, 1, 'MyApp', '[]', 0, '2020-11-26 07:50:46', '2020-11-26 07:50:46', '2021-05-26 07:50:46'),
('9337441f4735f69f6ed116b62141874fe9ab5f1c3e361720df8fb549dba36f93d23bd5682ba3cbe2', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:49:20', '2020-10-13 05:49:20', '2021-04-13 05:49:20'),
('93a66b91e5e0d6cf72b991af9b2195e75d954172cf80f288da277e6e0e0884ddbbbfeb497363c705', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:32:11', '2020-10-14 06:32:11', '2021-04-14 06:32:11'),
('93b2ffa9da26c8e3bb5ea36306e8851882aac943d280580e40bbdd3c5a314c6e90f78d9aeffdcf2c', 4, 1, 'MyApp', '[]', 0, '2020-10-15 11:33:05', '2020-10-15 11:33:05', '2021-04-15 11:33:05'),
('93f963271e9971027aa5ff8e383b4cfc914362390e6e8493192701e672b58e5e81db973d25bf725e', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:32:24', '2020-10-14 06:32:24', '2021-04-14 06:32:24'),
('9414ea150f54b4e3b670e35d3c5e0128998fbd2f7afb4c44596d5ea89eb8c848372d0de0f8052467', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:56:56', '2020-10-12 10:56:56', '2021-04-12 10:56:56'),
('9422b7d7ba76b73a6e46490101a97c70ecd30c288ecc251daf4e185bd35d8d55966dfae21b2104af', 7, 1, 'MyApp', '[]', 0, '2020-11-11 13:54:28', '2020-11-11 13:54:28', '2021-05-11 13:54:28'),
('945a9eaac46ca62989b1bbf4a9465ebce8a2ec1187af2596e0f1dbe56a22b0a7b19d82aa5c2bf9de', 2, 1, 'MyApp', '[]', 0, '2020-10-07 08:24:06', '2020-10-07 08:24:06', '2021-04-07 08:24:06'),
('948e2357779bd88b46c51e9941162c5739efabedfef0a3b5a28030760f7f17aea22dcd565d04b0fa', 7, 1, 'MyApp', '[]', 0, '2020-11-11 12:20:28', '2020-11-11 12:20:28', '2021-05-11 12:20:28'),
('94be207ef58dc6baf781ef5ae0b70f9fdf2e792f505acb9b5413027bd84d496fa6170f53811be247', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:50:16', '2020-10-06 12:50:16', '2021-04-06 12:50:16'),
('9517e1d10f8e96a410182e4164be176c2aad820f29bff331f7b195a9129b56a8a21f361072671a9f', 7, 1, 'MyApp', '[]', 0, '2020-11-11 13:16:59', '2020-11-11 13:16:59', '2021-05-11 13:16:59'),
('95544900e585043d55b4f2a1f4c6470ffbc8fb54f5c0a77bf0732df4d59558748cd0a8198d4f289a', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:32:32', '2020-10-12 13:32:32', '2021-04-12 13:32:32'),
('955965c4e2ace41430a452aeaded6bd92c7788bcd947ae9a6b69c453cad28a8021220f60e4e8eea1', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:55:23', '2020-10-13 11:55:23', '2021-04-13 11:55:23'),
('95cf2adc47cdb78a980e01d3f64b06efd49fefca26fdf416b158f3ee0322433e57ecb02bdb47ca58', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:46:38', '2020-10-22 11:46:38', '2021-04-22 11:46:38'),
('95fe27737b40614a5f0d1b422ead1aa23803a7dbcca2f1b5b8eee50a32edb9de720dd50b1bb9133c', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:27:03', '2020-10-20 10:27:03', '2021-04-20 10:27:03'),
('966e17c9bf754d5ed0f78da310188a98540b091f7a35252687f1555531e42ec0a30a20a81ffc77e1', 2, 1, 'MyApp', '[]', 0, '2020-10-08 06:56:40', '2020-10-08 06:56:40', '2021-04-08 06:56:40'),
('96912cd74afb99bc7517e6c1eb7a21efe4ab81f642dfd045b1bc77d519dbbc29d688493e2fb8ac9c', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:47:01', '2020-11-20 12:47:01', '2021-05-20 12:47:01'),
('969c88e66be1fce7bf2e97d6182a1e04c50b3564ad52eeef08b6c8bf15c7af3dcd87a23be985d2c8', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:30:43', '2020-10-12 07:30:43', '2021-04-12 07:30:43'),
('96a9a7e527429ba78a4a68c6c76c5f9ca2bbb92991d952d210cea2a5da535011b27f3ee5d8714269', 4, 1, 'MyApp', '[]', 0, '2020-10-19 07:47:14', '2020-10-19 07:47:14', '2021-04-19 07:47:14'),
('96bc8cd77790ee441d34d55bf6c19bc1ad8ec598a5e4e0ef41846a00246f4ed747a814f19d7d57d3', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:37:10', '2020-10-07 13:37:10', '2021-04-07 13:37:10'),
('970dc288666f684dc76ab5f719318a281a0d6bb0001307bc008806c3520fcba4368d7e77c1ce3aca', 4, 1, 'MyApp', '[]', 0, '2020-10-09 07:50:07', '2020-10-09 07:50:07', '2021-04-09 07:50:07'),
('976544f61bc0d2ca76ac95e027e6f43f8359948b67cc365e4364ea6e2f87381c832eabb6a0fbbe05', 5, 1, 'MyApp', '[]', 0, '2020-10-14 14:14:11', '2020-10-14 14:14:11', '2021-04-14 14:14:11'),
('986477a9d58dd68f4b4ec7f391c2effd6de2253688f344c2e773dd92750fa9cda0882eb62cc8d90e', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:20:57', '2020-10-12 11:20:57', '2021-04-12 11:20:57'),
('98fe450bc2b1dfc29278d65f10b41d41f89052d8e90f316fb3ad153167168aa4ab769e418b9b47fc', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:53:40', '2020-11-03 13:53:40', '2021-05-03 13:53:40'),
('9914fc64cf6db36cf16013245d5d6c22d060fd18d6d164825a2795391ef691295599ca231ad7a6d6', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:42:52', '2020-10-07 06:42:52', '2021-04-07 06:42:52'),
('992775fea248b8dfaac7a0bfccc3809d72a4218b09308ab686bbfda094a58e865fb759985221e19b', 7, 1, 'MyApp', '[]', 0, '2020-11-23 12:42:40', '2020-11-23 12:42:40', '2021-05-23 12:42:40'),
('9932eaf4f6b0de8875868cd9cf9c55b527585ef4b94c2eafd0b1e3f0b28f4dcba2ff3528e781a8fb', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:18:26', '2020-10-09 13:18:26', '2021-04-09 13:18:26'),
('996f782cf945e8aebd1a2cd9372d4e288f82d6b1b8ade114bfc23e1d5d0ce926a75da4c3814e25f1', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:56:22', '2020-10-06 11:56:22', '2021-04-06 11:56:22'),
('9992a2db444f60e06319a46f3c7eb653e75a04117e4f3fac92137a5e8c415eac877b506ab9f62532', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:41:39', '2020-10-14 07:41:39', '2021-04-14 07:41:39'),
('99e164d9ab4ac3ba67bcde034865ce27cba9882081c84327faa034238e30630fd1310f23af75e71f', 7, 1, 'MyApp', '[]', 0, '2020-11-04 13:28:19', '2020-11-04 13:28:19', '2021-05-04 13:28:19'),
('99f963942d412264b1f147b430d7a66dc4db526ab7ce9d77777f12bf0701822c691e13f8ec966d63', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:31:34', '2020-10-06 13:31:34', '2021-04-06 13:31:34'),
('9a039619c1b93e78a5433828b5d080d5b19181aac3cd91d684e4f8f97207bdd24dd4f007ecda4b29', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:40:01', '2020-10-07 07:40:01', '2021-04-07 07:40:00'),
('9a3e4230fb347b68c6999f5339c98264ff521a9a48b270294645582a74f749e584b1306f92780992', 4, 1, 'MyApp', '[]', 0, '2020-10-08 14:07:14', '2020-10-08 14:07:14', '2021-04-08 14:07:14'),
('9ad3bd7e0bbb31e7d47f11b9d63f8ffc30e379c536a415adb8ebb2b3748b1139895d66cf6048e39b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:42:49', '2020-10-13 08:42:49', '2021-04-13 08:42:49'),
('9ad60fada3c4d663acd57dceaba43132de356a2dce587490dd318466aa8e670450202e311a9c4abe', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:29:17', '2020-10-09 11:29:17', '2021-04-09 11:29:17'),
('9adcafecf4b8a1a1eded9f86a1d3243b23b11f938f3f54773afd717971d3d2b3285739b4e645b368', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:29:25', '2020-11-16 11:29:25', '2021-05-16 11:29:25'),
('9afa07d4189d34ab97abe920ae09493dbcd19b26e2a6f95c5a8800cadfe557d5ac438aab1f520309', 5, 1, 'MyApp', '[]', 0, '2020-10-19 05:36:38', '2020-10-19 05:36:38', '2021-04-19 05:36:37'),
('9aff68775a9361e6d7094c158c3b792a9056c3a33c1c313d2be55bd3f1ff61c48dcab26a5a5d5124', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:03:17', '2020-10-09 13:03:17', '2021-04-09 13:03:17'),
('9b0438fcd7e9d069017b1aaa2d36ba323d27efebbd846bba48e746e98ef96f6083ce6df788c8e7e4', 7, 1, 'MyApp', '[]', 0, '2020-10-27 07:01:14', '2020-10-27 07:01:14', '2021-04-27 07:01:14'),
('9b4c6c9a7d02ef975a8d39dffe762e88d7b78c4c3fa3a4f7696a26617c072239912e9813b6f5be04', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:40:25', '2020-10-13 12:40:25', '2021-04-13 12:40:25'),
('9b5ad248c7278cb28b972127cec5bef698cd28cdb0c34c6c4a6825e5d8eec89633cf23ef6a9da3c9', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:40:24', '2020-10-20 13:40:24', '2021-04-20 13:40:24'),
('9bdfc0fd07be84bb0e6d70600c10ffeeb03dda637deb1ec43bbdf14313a712371d2f405dd65e5cfc', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:19:00', '2020-10-29 10:19:00', '2021-04-29 10:18:59'),
('9c3636a0634273cc7841f3e50a6bf8a232d9006c0ce731d15bae6ac9254bbbb23042d5a0e59c4f54', 4, 1, 'MyApp', '[]', 0, '2020-10-16 08:11:35', '2020-10-16 08:11:35', '2021-04-16 08:11:35'),
('9c3a42e34368e569d59c5887a7d4f89de66c9ac19532a5e787734ef50d988e668b3f80b409a3f9c0', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:00:33', '2020-10-30 11:00:33', '2021-04-30 11:00:32'),
('9c6b7c338aa9d0bf1f621f8c5e4c6e58fecc47a5c56f1871c6f53a289d7c3fe567f8c7180d373a1f', 7, 1, 'MyApp', '[]', 0, '2020-11-16 07:50:35', '2020-11-16 07:50:35', '2021-05-16 07:50:35'),
('9cb7c8bf9057142ed31f1551d06b73280a08749b908e63865cd2d9b1461bee29d9b39cb8e38d07f5', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:52:25', '2020-10-14 06:52:25', '2021-04-14 06:52:25'),
('9d18b677bfb6a95ef4d07fee51b932fff679fbb66d43090a27c4bfa4c3a5e9e52c780445d325f88e', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:33:20', '2020-10-14 08:33:20', '2021-04-14 08:33:20'),
('9d22ad59065e096c98c352170b6595940a77ecee5ee56cd9f5b46082ad953dd33fc6dbb4411562ff', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:49:11', '2020-11-04 07:49:11', '2021-05-04 07:49:11'),
('9d769c2913d8bc057338d8666bf0329f87fb2562847b79893f9fe402e2583403fbeea9c96f419926', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:38:46', '2020-10-13 12:38:46', '2021-04-13 12:38:45'),
('9db3dfdfa4c200cf26063663dde3edced67cbaced7afb7b555c412eb1b43eaad20debc269e890597', 7, 1, 'MyApp', '[]', 0, '2020-10-27 05:15:58', '2020-10-27 05:15:58', '2021-04-27 05:15:58'),
('9dbb9ca8456df7e6be1ce47ef986d0cdecb83aa2a74ada73a1f7816fde4007030f79d70ba9fd8dc6', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:50:21', '2020-10-06 13:50:21', '2021-04-06 13:50:21'),
('9dde9cfecb1bbf8bfb16084c243b585cfc7292aa288c5472fff032e993f12419428fbcb1749e364b', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:18:45', '2020-10-29 07:18:45', '2021-04-29 07:18:45'),
('9e35af80d78276887ab4f9a60f31d75e410f250463d5ba356da1f17df084bbb3233ac3c2a5cc468b', 7, 1, 'MyApp', '[]', 0, '2020-11-05 07:35:23', '2020-11-05 07:35:23', '2021-05-05 07:35:23'),
('9e9c8edb4abbf669e0aa4509c6bafdfb618bc01e6e95e4cbc3f2b2e883b16574521ddf751d46bc22', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:05:20', '2020-10-09 13:05:20', '2021-04-09 13:05:20'),
('9ebec680b56b86d5aa3a00bca8f590c968957b17bcc63ec4451461e1a7006f110f042f06ef08183e', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:46:00', '2020-10-13 08:46:00', '2021-04-13 08:46:00'),
('9f7266d987236188a372e1accac0dc29a3b6969b1dcb920db406106fe7cd5c6b42a04698ed3f7ba4', 7, 1, 'MyApp', '[]', 0, '2020-10-22 07:44:56', '2020-10-22 07:44:56', '2021-04-22 07:44:56'),
('9f8aedf88f9ce6e947c6e0b39580c085fc3bbac9b7b3835917ee706f3bdfd86f5a3b89b565deef19', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:55:39', '2020-10-13 11:55:39', '2021-04-13 11:55:39'),
('a0266791ac310a58464ad03fe6ab500609f252cce54e029988958987402774c46a45548c234b066f', 7, 1, 'MyApp', '[]', 0, '2020-10-21 10:02:12', '2020-10-21 10:02:12', '2021-04-21 10:02:12'),
('a0bad0681e05a2499fcef5986b14a09ee5bb146aa07e7f74a0ccbad5264552ddc605e7e8db66a989', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:30:00', '2020-10-13 13:30:00', '2021-04-13 13:30:00'),
('a0e1e0f3464ede32bd0834aa2eafd885e2155d25a5623540c50d8f31d42c8111ea02c5a4313fff64', 4, 1, 'MyApp', '[]', 0, '2020-10-08 08:27:04', '2020-10-08 08:27:04', '2021-04-08 08:27:04'),
('a0f2921ce6a070d57fefad00bcd6e5c6b46b64c2e0ac0b5e0c0738872fcc69db1a2a1ba7379f1192', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:03:53', '2020-10-06 12:03:53', '2021-04-06 12:03:53'),
('a0f507863fcb9238c494d2091f1cc313ece4426cc2dbe7eb4aa1a8d896c99ce02af19231bb11b34e', 7, 1, 'MyApp', '[]', 0, '2020-11-06 13:55:16', '2020-11-06 13:55:16', '2021-05-06 13:55:16'),
('a1996b1435433bab1ffb53110ae9c1455ef2c41e9b0272b6635c7203eef0f295c30844b9e04464c9', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:32:26', '2020-10-13 08:32:26', '2021-04-13 08:32:25'),
('a1bb9f4ccc1c18c3f6187d62aa59b98aa626aed26d5caa7592cf82d4ab70ee049f06f11bc89c07ff', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:47:26', '2020-10-26 12:47:26', '2021-04-26 12:47:25'),
('a1d06b9a3a1376b1bd50f3176b6084262decca6a87a74f61b1b9e5d7f60bbfeec274ade46404721b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:11:59', '2020-10-13 07:11:59', '2021-04-13 07:11:59'),
('a1e8842c9f2527340938091a08c2ea1e121d9ebb2a0609d62f0a16d3f225f13196ffd7961dae3789', 7, 1, 'MyApp', '[]', 0, '2020-10-28 08:14:01', '2020-10-28 08:14:01', '2021-04-28 08:14:01'),
('a26373b4b0b773c877c9658fabd1080004fa0f33acbe005a4f9768e85d9c38cb4f74853fa17f0d48', 4, 1, 'MyApp', '[]', 0, '2020-10-07 14:20:58', '2020-10-07 14:20:58', '2021-04-07 14:20:58'),
('a28842fbc908464ef992198a8ff895946f5d08f365f92139df953150b843868673af637a860d2a82', 7, 1, 'MyApp', '[]', 0, '2020-10-26 10:00:34', '2020-10-26 10:00:34', '2021-04-26 10:00:34'),
('a2efbc179484844435ba831db0124006d9014f1fa21f1a8a189631066ef5175494ecf00b44ad6c76', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:26:40', '2020-10-29 07:26:40', '2021-04-29 07:26:40'),
('a30d5b3fed0285d8992003bb09cccc8e8d1735e82e5b4bfd47dd94c352bb2f3ddf01b13bcb1f829a', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:25:43', '2020-11-16 11:25:43', '2021-05-16 11:25:43'),
('a3129689ee044e2665e116e99fed92455653bc082b4ba00a0730fe23f7fb37586eff08e0e1bae985', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:32:39', '2020-10-06 13:32:39', '2021-04-06 13:32:39'),
('a38279a3fcd291bbb9cb6e94abb794c587abbdd8cdabd1711b2745e13471a6b1e801b85cd4854d38', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:56:18', '2020-10-13 05:56:18', '2021-04-13 05:56:18'),
('a3a7362eb8e44765fe110e79f90a6755a23c8fa49a33d5f5f71bf7d923eec7a84611c3d4c257a3c1', 5, 1, 'MyApp', '[]', 0, '2020-10-23 12:53:58', '2020-10-23 12:53:58', '2021-04-23 12:53:58'),
('a46c550c2999283e981f1aa75ce1ad8c541906a9243f6920e04d4759ce64eb7711ec410c4b71a295', 7, 1, 'MyApp', '[]', 0, '2020-10-29 13:53:30', '2020-10-29 13:53:30', '2021-04-29 13:53:30'),
('a4ad32a5b9844111db6cfdda8108b1cafd1da56c62a657fdb7c0e9030b210b02122392ff9846794b', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:13:01', '2020-10-19 13:13:01', '2021-04-19 13:13:01'),
('a4e1167cd641ec6d9b264c7528e89a5b148e31dcb389d91e91d0563d11b2eae7f834002ed396b4b8', 7, 1, 'MyApp', '[]', 0, '2020-11-26 05:41:50', '2020-11-26 05:41:50', '2021-05-26 05:41:50'),
('a5031ea1d5bfb6f8d5b57af9d2759435fe66c9f7d18bfae9021f1f300e01a536fec7ac158ea1e24c', 7, 1, 'MyApp', '[]', 0, '2020-11-18 06:04:29', '2020-11-18 06:04:29', '2021-05-18 06:04:29'),
('a54d6e6e4718a8dcb77c6e76c4da73bc1a2d2ec0de2146561e73f6b82e4767d5e87291589cfd5272', 7, 1, 'MyApp', '[]', 0, '2020-10-28 11:00:38', '2020-10-28 11:00:38', '2021-04-28 11:00:38'),
('a584ec36dc3c2ce9983ebaa7cc67c5c921f5502ac2a0d7247d042a875b8fc0278ccb4af21de4cf82', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:55:54', '2020-11-04 07:55:54', '2021-05-04 07:55:54'),
('a58ce441576798c6c6715286d904f5a228ec8def5a1dbad62da59b006e136ef6710eccc5e3fbd652', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:56:35', '2020-10-13 11:56:35', '2021-04-13 11:56:35'),
('a5984eef60ed69edd8fe9d2961672b8454faec4f8996a3e599635f106ffc88f5df7c716f5acef83a', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:51:43', '2020-11-20 11:51:43', '2021-05-20 11:51:43'),
('a5b7d6041f700e8b57919ea97fb9eb12d64e7c25b15c31751ac737d406dc2010748d20eb8ca731e7', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:35:19', '2020-10-15 10:35:19', '2021-04-15 10:35:19'),
('a5bb10a44825e8e605b40652f7b2bd009a35c0c71734318704cf31a0edcb8191681a6abf68ee80db', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:03:31', '2020-10-23 11:03:31', '2021-04-23 11:03:31'),
('a5c2919ef4eb5da1fecb7bb22386b6b463be040e2f2bfb4f61de280c784f3e6953d8ecb32653cdf8', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:50:54', '2020-11-20 11:50:54', '2021-05-20 11:50:54'),
('a606671e16c0e8edd99ff73856b683cc8d5aa264c3e05c4d668f1441b817d491fa0a65cd581e2dd1', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:36:44', '2020-10-14 06:36:44', '2021-04-14 06:36:44'),
('a60ca1e3a13fb2f3cd2ed1f22495b9de16914d9de07114cba49cf2051574f62750f61e2b6813730f', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:33:00', '2020-10-20 13:33:00', '2021-04-20 13:33:00'),
('a62c1f06879e57f269f9ea33f6111b39515ff44a66306183e55a1925951e7af933f112ff25384de8', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:22:17', '2020-10-20 13:22:17', '2021-04-20 13:22:17'),
('a67b2be789e2e421ce21d03249c13e2d776cfa568bd6b9e0f4062f07454eeae699acf43ead33915e', 7, 1, 'MyApp', '[]', 0, '2020-11-23 10:17:47', '2020-11-23 10:17:47', '2021-05-23 10:17:47'),
('a6b52f0f04d9d30948ab120145434a2970856ab35891ec341b5bec89fb89de40903f275cce8d9962', 4, 1, 'MyApp', '[]', 0, '2020-10-08 11:20:04', '2020-10-08 11:20:04', '2021-04-08 11:20:04'),
('a6b86db32d6cec4f06532e1ce934b99636a5c7088f833c68d661484861a37a3ab3f6e73917f9c4b1', 4, 1, 'MyApp', '[]', 0, '2020-10-15 07:32:35', '2020-10-15 07:32:35', '2021-04-15 07:32:35'),
('a6cbac5cef1c474245b6e87e96111c7f227419d6e928dd6a18a87568aab90c017583e9c50408f2fa', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:42:40', '2020-10-13 07:42:40', '2021-04-13 07:42:40'),
('a6cd34cc27161601d89fecc069ab4e5dfeb5bff0411e3258ed758d071c4d53a6ee8f94bcd70aa73d', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:57:26', '2020-10-13 11:57:26', '2021-04-13 11:57:26'),
('a6d61de7d6b11f62f0457bbe3d835a288348146c46f87f7edc128bbf47b3981006abba5887cef7bb', 5, 1, 'MyApp', '[]', 0, '2020-12-01 21:04:37', '2020-12-01 21:04:37', '2021-06-01 21:04:37'),
('a6e3544e808d1cc812c602f760250970a4a45ad3c236f2bdb9fa9e9653dcf9df06a6aa879fcc3984', 4, 1, 'MyApp', '[]', 0, '2020-10-19 07:19:50', '2020-10-19 07:19:50', '2021-04-19 07:19:50'),
('a7cb178871607a90f2436fa8497d433bb98352e3d57e38a4a4e33a91d61b5f8711c771641645b9e7', 7, 1, 'MyApp', '[]', 0, '2020-11-05 12:28:39', '2020-11-05 12:28:39', '2021-05-05 12:28:39'),
('a7cb60041947fee821f6fad15a6d042fdecf2c6824679b6a3474b510b728534e377a3e0ea3e7190e', 7, 1, 'MyApp', '[]', 0, '2020-10-30 07:22:13', '2020-10-30 07:22:13', '2021-04-30 07:22:13'),
('a7e3116a013ec5d1529af3d685d65f87f6e0fbb816489a52ca2cb3f7f24fe20a0ddba461b6617a95', 7, 1, 'MyApp', '[]', 0, '2020-11-05 14:14:46', '2020-11-05 14:14:46', '2021-05-05 14:14:46'),
('a848cf4af5976a6f45b9232be8b1c2ab670824decc08bc1e25512d0953b6adf0020ddbf05a4dc9fe', 4, 1, 'MyApp', '[]', 0, '2020-10-13 20:19:56', '2020-10-13 20:19:56', '2021-04-13 20:19:55'),
('a88eaf8965a66034d632c7a8b7cf13e7941ae0e227fe9a45a6ef61a23c50f7750c2eb516a2879c17', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:09:47', '2020-10-12 10:09:47', '2021-04-12 10:09:47'),
('a8f62dff046489e96e940d1c34ce9d6dea6f72509168f71553f001e76f31ae94fdb871a5e852fa4f', 7, 1, 'MyApp', '[]', 0, '2020-10-30 07:24:18', '2020-10-30 07:24:18', '2021-04-30 07:24:18'),
('a925dc34635b700f9906d35ec877043f736f871e23c38779008375b3087cf4623da1eeea7e6e3a42', 4, 1, 'MyApp', '[]', 0, '2020-10-16 10:37:54', '2020-10-16 10:37:54', '2021-04-16 10:37:54'),
('a9db542c83a25a151b5fa7d233a3d67b1b882716059c3ec5968d3b4dae4739cd3ca05009206c9d29', 4, 1, 'MyApp', '[]', 0, '2020-10-08 11:35:56', '2020-10-08 11:35:56', '2021-04-08 11:35:56'),
('a9e626ad19fd2dc79809764460692da874d27f20a445e1e2275e55fb9fb8536dd07221faa9984473', 5, 1, 'MyApp', '[]', 0, '2020-10-27 19:07:54', '2020-10-27 19:07:54', '2021-04-27 19:07:54'),
('a9f7440b2eaba9e17d6e28be232444aaf7358fc4bdc334d5a5b887fdf357d587bbd276f241ead461', 7, 1, 'MyApp', '[]', 0, '2020-11-16 13:51:13', '2020-11-16 13:51:13', '2021-05-16 13:51:13'),
('aa502392a40ff86aa1f2d81370ca290df99d2f1296b2a36771701197c7931c3508af83f1939ba95d', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:07:25', '2020-11-06 07:07:25', '2021-05-06 07:07:25'),
('aa6b6ffe111eae7ca59c1689df46a38f244f6a9d58e7be0765de029e9f89cf55a35173fe493df63b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:54:52', '2020-10-13 11:54:52', '2021-04-13 11:54:52'),
('aa77178fd3ea835c2e92c29e9df58029d8b6174398c22c22ad6d7c0d4748ab9c1655acf084661795', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:34:46', '2020-10-09 12:34:46', '2021-04-09 12:34:46'),
('aa7c5106ebea7d44e5b5cd53a02fa93c30dbf5af27ec178ff93814464aa3f10db9c0e995e1e48df5', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:07:56', '2020-10-13 07:07:56', '2021-04-13 07:07:56'),
('aadcaa76ca7d78f01571f5626f5db8e45127d4810ca2903719ed8fbc3ddab5c8eceddc59b66e2dfa', 4, 1, 'MyApp', '[]', 0, '2020-10-26 14:08:54', '2020-10-26 14:08:54', '2021-04-26 14:08:54'),
('aae30ce9e5b9393c6985dbe3867f02d1a73413a1833720af7b07e7527fb0843c60c867be3f10a16f', 7, 1, 'MyApp', '[]', 0, '2020-11-04 10:12:30', '2020-11-04 10:12:30', '2021-05-04 10:12:30'),
('ab08582da8c338c9ebad3524826811b14007ed1008ced7afc5017ee388ac552fccca83df7de10637', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:37:25', '2020-10-19 13:37:25', '2021-04-19 13:37:25'),
('ab159d3c1931e43a88f0d7deea277b7c2dc0350538e506c167c10c64a528625cfafd71ea6488e50e', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:09:19', '2020-10-19 13:09:19', '2021-04-19 13:09:19'),
('ab49109bdc73fe8802672787a463acc9310d0bca526f725f6a30765892e4f284e4a91245a9ea077b', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:49:57', '2020-10-12 10:49:57', '2021-04-12 10:49:57'),
('ab5869ba989e19d024c3111d90d48286c887278fd4a07d7d1f8729e1452a4f169cdd26029590ab2d', 7, 1, 'MyApp', '[]', 0, '2020-11-04 08:16:56', '2020-11-04 08:16:56', '2021-05-04 08:16:56'),
('ab5a6ac61d9f84289d83c5308a63381d91a4f66edd9bb9ff855beca1e1c3731913ff56b420a7df57', 4, 1, 'MyApp', '[]', 0, '2020-10-19 12:24:56', '2020-10-19 12:24:56', '2021-04-19 12:24:56'),
('ab6c45f3739257afe94e8d87479e77eff116d632d7751cb57eacc656daef489e2a2c40939c1c9ff0', 7, 1, 'MyApp', '[]', 0, '2020-10-28 06:20:43', '2020-10-28 06:20:43', '2021-04-28 06:20:43'),
('ab94ee241258400eea49ab318b6cb588e871fa1f48f26e05acc58b79b0f30ba720a5c5e7d3f9717d', 7, 1, 'MyApp', '[]', 0, '2020-11-12 07:45:04', '2020-11-12 07:45:04', '2021-05-12 07:45:04'),
('abebc6abb236eb736292b603b25dfba3466f8262bce455f59cb5f7b973cf0d00c8ee4d11d1e7cf08', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:10:52', '2020-11-16 11:10:52', '2021-05-16 11:10:52'),
('ac091f4528ad595e0db603022a490c478c6c92f518a98f3d0291cdf5f5546bcdeb2b781c56d7ba99', 8, 1, 'MyApp', '[]', 0, '2020-12-04 09:37:15', '2020-12-04 09:37:15', '2021-06-04 09:37:15'),
('ac28b8c5f369864818e6454dc00aad96eea99f99121fad6c1009a24f27fcc6c0c05bb378c41ae9fe', 4, 1, 'MyApp', '[]', 0, '2020-10-09 14:19:00', '2020-10-09 14:19:00', '2021-04-09 14:19:00'),
('ac818018b5f5e5421eed944803339a4d8af17455d8bd6ada256da10eb6a6c73e052a317294c4ba59', 7, 1, 'MyApp', '[]', 0, '2020-10-27 11:38:43', '2020-10-27 11:38:43', '2021-04-27 11:38:43'),
('acb3f318829715c4a0960d0bca450d29f3cd6eb4cf5ff4b3bc75da725b0e60cd2a202be56355b49e', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:31:45', '2020-10-07 13:31:45', '2021-04-07 13:31:45'),
('acd3e2d20033586bd35227dba82f295e4de0eab694d091c02c4dcfdf96694ffc96fcd3f755946b5f', 7, 1, 'MyApp', '[]', 0, '2020-11-03 14:28:55', '2020-11-03 14:28:55', '2021-05-03 14:28:55'),
('ace2be9507aaa73dbdf09a54cc8ddd00acdcfd1d1aa296d55816c943cc2d4f5881e55f58a51fe7f9', 4, 1, 'MyApp', '[]', 0, '2020-10-15 08:25:14', '2020-10-15 08:25:14', '2021-04-15 08:25:14'),
('ad0b1a363762a6632bed28d3c89ecd200175882987b7a45a297e4abf915d60d66717f99e42830e9c', 8, 1, 'MyApp', '[]', 0, '2020-12-04 08:10:39', '2020-12-04 08:10:39', '2021-06-04 08:10:39'),
('ad1e9b43c0c6457157843ff89cb41f81ef6874aca998b3af49decd57ac79daffb40352c51986fbb0', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:18:17', '2020-10-13 08:18:17', '2021-04-13 08:18:17'),
('ad40df1d3c40d5fd2e611a393ae03622fe7e5bb5741a9a3ad4b4ee7d761ed660b18e24c2a75acd4f', 2, 1, 'MyApp', '[]', 0, '2020-10-07 12:41:40', '2020-10-07 12:41:40', '2021-04-07 12:41:40'),
('ad416fc5886609d46a4f3745460bd043b658d302fce7d9ffb83dc12de5b02dc43b7f994539bd7203', 4, 1, 'MyApp', '[]', 0, '2020-10-16 05:50:41', '2020-10-16 05:50:41', '2021-04-16 05:50:41'),
('ad92f62301718f39f46cb3ad1f4300a3ac234c2a4cd8ff81cb974d69784c61d8096f282e38c5470a', 7, 1, 'MyApp', '[]', 0, '2020-11-16 07:55:55', '2020-11-16 07:55:55', '2021-05-16 07:55:55'),
('ae143ebb6df4f18cd8486ee5690933a08c8a5153c561cffb0285a5c60fb4b78fe31ca0267a88d6e9', 4, 1, 'MyApp', '[]', 0, '2020-10-13 14:07:01', '2020-10-13 14:07:01', '2021-04-13 14:07:01'),
('ae1d6047ac864cc0032a1cd6b3463afa8f8d15bd5ffeb057033d2d102cbb076655793d5dcb4a9975', 4, 1, 'MyApp', '[]', 0, '2020-10-16 08:09:23', '2020-10-16 08:09:23', '2021-04-16 08:09:23'),
('ae80b314aafa2fd7dc59c4058fd1ea4d3a90ca0af5c0253eb87002b6be76c9ea64957334c3e43fa0', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:38:20', '2020-10-07 07:38:20', '2021-04-07 07:38:20'),
('aeb524f1af2914691b27ea41c7c1dcca7365c1751ddacbffa15535601336fac2e022c286d155ae94', 4, 1, 'MyApp', '[]', 0, '2020-10-15 11:30:33', '2020-10-15 11:30:33', '2021-04-15 11:30:33'),
('aeb650d3aa8bc09bc2e2cfe1c7c59c040242132c395678e362b189f8804244a004a4e4284e73b2c7', 7, 1, 'MyApp', '[]', 0, '2020-10-28 05:50:27', '2020-10-28 05:50:27', '2021-04-28 05:50:27'),
('aec7f7a4c43aa36f929b7128133fc459eb36c0e6b3e0522ebcd3f54430befe2f004db4461c26ff33', 7, 1, 'MyApp', '[]', 0, '2020-10-26 14:00:03', '2020-10-26 14:00:03', '2021-04-26 14:00:03'),
('aee42358661b28ec2bf4ffa4ef2aca6617c0b1bc9a5f66bc2c795f41d5fff143580369e21e701ca3', 7, 1, 'MyApp', '[]', 0, '2020-11-09 10:53:06', '2020-11-09 10:53:06', '2021-05-09 10:53:06'),
('aef95e594ab87ef8aca33d201d3572e5902fea4bea415cfc4e2c938bab0fa0333089b0e989f2226e', 7, 1, 'MyApp', '[]', 0, '2020-11-06 13:34:47', '2020-11-06 13:34:47', '2021-05-06 13:34:47'),
('af031d3c9593d743982f1341b9b24bac4f4fa5ee47e76d817b48c9e6936559794aebfb2ed1f8a781', 7, 1, 'MyApp', '[]', 0, '2020-10-30 07:01:38', '2020-10-30 07:01:38', '2021-04-30 07:01:38'),
('af0a3488071d4fd8bee72eefeef6fad84ffc7b852d4700e5e5939a30fb60469f5517eca9b357f47c', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:35:04', '2020-10-30 06:35:04', '2021-04-30 06:35:04'),
('af0b5c1c96bc3253e4a8c9f749215529f72e0a03eec627058c5b34b8ab544bc43c03d590cb3bce85', 5, 1, 'MyApp', '[]', 0, '2020-12-04 13:20:13', '2020-12-04 13:20:13', '2021-06-04 13:20:13'),
('af10de4de9e00f2991a31e723cfd1bf3e4d8ebb5f1169696ad74967fc932bf1dc6360e3d7a4d3b6b', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:17:36', '2020-10-12 08:17:36', '2021-04-12 08:17:36'),
('af3448e97ba88e99d501b36362ed80e8dbd7d92ffd1bc26ff0671fb5057e8adee77eeab1a1f0cd6e', 1, 1, 'MyApp', '[]', 0, '2020-10-06 11:59:59', '2020-10-06 11:59:59', '2021-04-06 11:59:59'),
('af3df6f26bd2347d4193db47b8801e0cc4033e19f595cf845c0acddb3fccbe26eaf6e8e40dfcb69e', 4, 1, 'MyApp', '[]', 0, '2020-10-19 13:05:16', '2020-10-19 13:05:16', '2021-04-19 13:05:16'),
('af43c007e7af574a58a1454da48b5ac51c26d810b90591a108e92c42a58404f65ac21a9abc53f91f', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:13:42', '2020-10-13 07:13:42', '2021-04-13 07:13:42'),
('af6350ee1cc588e98fbe76422b060d681a3f10baca501abd5c9039181cacafc4e088ee529ca81d66', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:00:25', '2020-10-13 12:00:25', '2021-04-13 12:00:25'),
('af7eab88865fba4c5a116eb6eada4108355f132e6405f87704d619554054cf87ab150f3b8a82a01e', 7, 1, 'MyApp', '[]', 0, '2020-11-17 04:38:18', '2020-11-17 04:38:18', '2021-05-17 04:38:18'),
('af940d9befa2edbc63747df6702b69b4b723073769df2d1f60f5f70815c0383ee005e3a00e4f5ad3', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:55:29', '2020-10-06 13:55:29', '2021-04-06 13:55:29'),
('b0a3c359cba54bdef20812b8c992878e34a527bdd05aaa565b0434c324e1b0985c2f73591c5a55e0', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:50:50', '2020-10-06 11:50:50', '2021-04-06 11:50:50'),
('b0da8d6d6b6eed9216dd194bbeedcd2630f7f34a65d42ff8a63ee09c2a08dff2b7508ddb8b4e8e70', 7, 1, 'MyApp', '[]', 0, '2020-10-30 10:49:29', '2020-10-30 10:49:29', '2021-04-30 10:49:29'),
('b12d2e75ebd6943d734babb99c502ba5a4c203f9afb218f9f54a1f8c8da21790e9d5fe5c8813a06f', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:57:36', '2020-10-06 13:57:36', '2021-04-06 13:57:36'),
('b1340370b8ca0ab5cc0b5637dea2dce179a0dd043051f69756d76c07b21c2b177d2b4ea8acab4a27', 4, 1, 'MyApp', '[]', 0, '2020-10-16 13:56:08', '2020-10-16 13:56:08', '2021-04-16 13:56:08'),
('b15ddd591357032ce5af439456d217d38d9ec0f26d2eb16e5cedba0cdbb54a4b6cefdb15ce64963f', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:35:06', '2020-10-21 12:35:06', '2021-04-21 12:35:06'),
('b18599d02791862da425cf1dd9a0471c1f4ede348f95b7bcaef1b080d3514004a80b824ed0a1794a', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:21:13', '2020-10-20 13:21:13', '2021-04-20 13:21:13'),
('b19c46da911848da01470d668f0a19ef065fa9ed9ec1dc95b3f8827f895da80267aa90f223c725d2', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:46:12', '2020-10-13 05:46:12', '2021-04-13 05:46:12'),
('b1a6cf851b5d962c34b77bde4c0988d01d7b3fd7f23247deee6aab7dd37e9126ff34def2ada22cc1', 7, 1, 'MyApp', '[]', 0, '2020-12-04 11:55:40', '2020-12-04 11:55:40', '2021-06-04 11:55:39'),
('b22121c75c9dd41e23ecebd105351e22162ec6046b1c5fccd863cd8ed7fa3dc8cceaac5b13730979', 7, 1, 'MyApp', '[]', 0, '2020-10-21 11:03:00', '2020-10-21 11:03:00', '2021-04-21 11:03:00'),
('b234c3f75591472e6164835b513a2dde317170488126565868a0457d062f01fc6c6b3a7f1d7ecb1e', 7, 1, 'MyApp', '[]', 0, '2020-10-27 06:33:55', '2020-10-27 06:33:55', '2021-04-27 06:33:55'),
('b24fae2b8a32e0d29d9dd095a891690b0881f413541f86f781ed9effe5a452dd6bad4d83cd6e53b5', 7, 1, 'MyApp', '[]', 0, '2020-10-22 07:48:55', '2020-10-22 07:48:55', '2021-04-22 07:48:55'),
('b2866b419d10441a341850c5a67c6e0d044d98f671f0294e11bc95da547888a1567395e37f93763d', 7, 1, 'MyApp', '[]', 0, '2020-10-21 14:13:32', '2020-10-21 14:13:32', '2021-04-21 14:13:32'),
('b2982aca3c13b3c0ae8d0992c055fb296bd02d53a5036a54a8109449cf349255f07a8cbcfab62c5d', 4, 1, 'MyApp', '[]', 0, '2020-10-16 11:00:40', '2020-10-16 11:00:40', '2021-04-16 11:00:40'),
('b30c2aa9b160de8c14f9791a894510c13b244ea1707f66242a590910b9096654487b27d0cab2bf48', 7, 1, 'MyApp', '[]', 0, '2020-11-09 12:36:16', '2020-11-09 12:36:16', '2021-05-09 12:36:16'),
('b3270018561b15aa6761d67fe574182fd62d5ea3a81a1c531f70f6f0186fd284b48df80932462668', 7, 1, 'MyApp', '[]', 0, '2020-11-23 09:58:22', '2020-11-23 09:58:22', '2021-05-23 09:58:22'),
('b334d25e9a8c3e4fc2c3afe1d6cca2ba4b3d8edf1ba20063d5799c308308beb8a3e75325d8a12346', 7, 1, 'MyApp', '[]', 0, '2020-10-28 08:04:54', '2020-10-28 08:04:54', '2021-04-28 08:04:53'),
('b3a9cb4690bd2180152e7fc5bd0fd24f11e0698010bd739a3080eacf00d086c5e63940bb6ac6e8d0', 5, 1, 'MyApp', '[]', 0, '2020-11-05 19:53:56', '2020-11-05 19:53:56', '2021-05-05 19:53:55'),
('b3ae4f28061d2de1301b88ccb24c6c2e6da593b1af352beac24ce34f96bca451b0aebaca6fa7f95b', 4, 1, 'MyApp', '[]', 0, '2020-10-15 07:53:14', '2020-10-15 07:53:14', '2021-04-15 07:53:14'),
('b3cd532e1852fc80d770bf340fffbb7ed9dbc9d74110f05aabcb8f1d8c1980faa79c619b472a5bc4', 4, 1, 'MyApp', '[]', 0, '2020-10-09 06:35:39', '2020-10-09 06:35:39', '2021-04-09 06:35:39'),
('b3f2a710e2d9be7b04ad3877b894b0820366c99788ed66a6d041ea4068643173d69cfb14a43de780', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:42:25', '2020-10-13 12:42:25', '2021-04-13 12:42:25'),
('b3f68697a02cd4ea216a92f6039fab892ac7faf011ee53f856c8cf427a0c54e0388c89ead0de7cd3', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:52:27', '2020-10-06 13:52:27', '2021-04-06 13:52:27'),
('b482df0617ec38e3c017cf008e67723a267badd3b4113213f15b53b177c4cd185dc81325050555e9', 4, 1, 'MyApp', '[]', 0, '2020-10-14 13:01:49', '2020-10-14 13:01:49', '2021-04-14 13:01:48'),
('b52d981b6cdfd4d169362727f2ca24d8ad274ae06cc23857fa7ae1c08c20b9b5fdcda434bdf97cbd', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:12:59', '2020-10-13 13:12:59', '2021-04-13 13:12:59'),
('b5448af3a9df4bdc94db284f4d7aca90e80174772469fa1b541ed06ece3d765c0be92ac27dedc4a7', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:06:37', '2020-10-14 07:06:37', '2021-04-14 07:06:37'),
('b59a4df1660e67baabe19a5d2a9b8fb0e7974c0910d40d45561a54e4d8c89de362ee1d4170ae2f12', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:15:59', '2020-10-12 13:15:59', '2021-04-12 13:15:58'),
('b5a272c311d7a0fc654c233339343deab70ce3267fc96ec140edcb89b79c82f23080d0290ce01d3d', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:28:44', '2020-10-12 10:28:44', '2021-04-12 10:28:44'),
('b5bda706366253045f8a98b84615cdc2088d0ec822797eb09c9f13e2c2fd8107c30f0c83b77eeffb', 4, 1, 'MyApp', '[]', 0, '2020-10-15 10:54:57', '2020-10-15 10:54:57', '2021-04-15 10:54:57'),
('b60e8c813e840c9c96dba562a87f393fc79d95ab9b19170bde289d13295d133299700faf3a5402a4', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:12:19', '2020-10-29 06:12:19', '2021-04-29 06:12:19'),
('b6780c9507fff0f1f7d288bd383ee1f26a4ce0f35a4dcd049ff80a7a34e6dfc1c2cf20b941fcf80f', 7, 1, 'MyApp', '[]', 0, '2020-11-17 11:00:45', '2020-11-17 11:00:45', '2021-05-17 11:00:45'),
('b689e038c486ac229d330008b621190145850c287966641699247945798f2588c888dcd39e2ebc5e', 2, 1, 'MyApp', '[]', 0, '2020-10-08 07:44:19', '2020-10-08 07:44:19', '2021-04-08 07:44:19'),
('b6a392e1ec1a4d6393760b7df139cbf05a67e423c4f4326525c2bf82e702e3a64f5a2a5f7f99a3a2', 7, 1, 'MyApp', '[]', 0, '2020-11-10 08:02:56', '2020-11-10 08:02:56', '2021-05-10 08:02:56'),
('b6c3f0d26b90354783ab9ba3cfc71deb02694b5e95734750b23e13689e314072032483d217236a8f', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:36:19', '2020-10-29 07:36:19', '2021-04-29 07:36:19'),
('b6d36a293b82f44efda8aa4b1d7c04b472c11612d90177df52e5f8a320a8e62b9d292ada35819cd3', 7, 1, 'MyApp', '[]', 0, '2020-10-20 12:28:18', '2020-10-20 12:28:18', '2021-04-20 12:28:18'),
('b6fa319eb5f4ede3500668c93146aec4794301342d72fc65d92847dcb986f41a54a59abc857066ff', 1, 1, 'MyApp', '[]', 0, '2020-10-06 13:15:36', '2020-10-06 13:15:36', '2021-04-06 13:15:36'),
('b73b5e789d120de5484310e2e7d57696b31fad8a8db75661ff2a27e35bf29c825aa4432ef83715c0', 2, 1, 'MyApp', '[]', 0, '2020-10-07 08:03:57', '2020-10-07 08:03:57', '2021-04-07 08:03:57'),
('b8418de9d2189890673447a5aa5cb1fa2f0ab53c67aee1c2289ba90c6fbea93a7d46c6a6f95cfbf3', 4, 1, 'MyApp', '[]', 0, '2020-10-08 10:16:06', '2020-10-08 10:16:06', '2021-04-08 10:16:06'),
('b86920404f07a43c460142cc1a0423f43f7c988ea86db81c1d6239e984db808aee15db866e99b10a', 4, 1, 'MyApp', '[]', 0, '2020-10-08 13:39:25', '2020-10-08 13:39:25', '2021-04-08 13:39:25'),
('b8f94c1584e1cc6bf7ed81b5d2dcfeceb2e9bfb6b09b67f0b83a8d5fc5d026379da563ba990769cd', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:49:12', '2020-11-03 13:49:12', '2021-05-03 13:49:12'),
('b90f914f51d24c53db06cfcfcf7784e9adeee6f1a33117e7be99a28f0f83785e1af080425525104b', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:53:11', '2020-11-04 07:53:11', '2021-05-04 07:53:10'),
('b950ff5118efad8dd00bbc11b1d03f2b49878be7f8d65b613007bbe641d012f5fce034f014c45f46', 4, 1, 'MyApp', '[]', 0, '2020-10-14 05:52:43', '2020-10-14 05:52:43', '2021-04-14 05:52:43'),
('b987eb8f1fedc496e17a43552182a5a0783261fa39bd6b8fb73b11fdccb249f8c27ebbe4c665b06f', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:15:26', '2020-10-12 10:15:26', '2021-04-12 10:15:26'),
('b9adc4a8eb96f4923ab0d5433d2219742b865bc1dba2c2ae33e5f5b6c71ced08672aa149f2b02e32', 7, 1, 'MyApp', '[]', 0, '2020-10-27 06:29:22', '2020-10-27 06:29:22', '2021-04-27 06:29:21'),
('b9ca3c72b28b181ee6703450a87d27282d3de04e2b81acfb95110e852988aa2d6bf2d90a8f2aed42', 7, 1, 'MyApp', '[]', 0, '2020-11-17 07:44:35', '2020-11-17 07:44:35', '2021-05-17 07:44:35'),
('b9f4b8fbf07a0368323b79f2eab009c9295ab6bafc51f6f9bde0e88f456cda971a7b9165a6b8870a', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:47:53', '2020-11-20 12:47:53', '2021-05-20 12:47:53'),
('ba683edd8ce21b159718136e3b6d5298ba61c236baf1400cc24b1fdb558f85442da20a6bb4763169', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:22:04', '2020-10-21 12:22:04', '2021-04-21 12:22:04'),
('ba848141081c7d9bc62491d14b1f82cea1d1958b49d77b2801fe551f93dddf99fbcca6badc9c690e', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:32:00', '2020-10-08 12:32:00', '2021-04-08 12:32:00'),
('ba88f80ab2878a6351b65e7c01cb089734d84e60ef93ac6024f891940da6d4fb22808c857ab92932', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:03:32', '2020-10-09 12:03:32', '2021-04-09 12:03:32'),
('bab690d5fc11a09c54b1f6179618db19f4c7134f633da0e981e592ba8246fa2a38d1fde02f5aba4e', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:38:56', '2020-10-12 07:38:56', '2021-04-12 07:38:56'),
('bae032e2e817797cf95e3505dbbbffeb46310cbbc3ac617f165fa4f973d74d2dc71aef1e677fb4ca', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:32:52', '2020-10-23 11:32:52', '2021-04-23 11:32:52'),
('bae06eeff61f8fbee970168bcb8e9019c8cb5252f520f1136eb85dd2c571f5a3c6094ade6fc1b80d', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:49:17', '2020-10-26 12:49:17', '2021-04-26 12:49:16'),
('bb83e5c03ef4d1a59c25a5f72f208efb36e7b1410d44c08a28e6f6119e2e15c02bcdd2b6679ee09b', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:33:04', '2020-10-12 13:33:04', '2021-04-12 13:33:04'),
('bb96199acc16c4cdbca78c16a61c06c0a6278536acc78c92f8515c90d8801c84e2d6921f2fe244b1', 1, 1, 'MyApp', '[]', 0, '2020-10-06 10:07:38', '2020-10-06 10:07:38', '2021-04-06 10:07:38'),
('bbace7db15362d387a5f44ebe5a3b18c14a6c5543bf76f9a2d4d49ba225fbee5c6c03f8851f5b4da', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:53:58', '2020-10-12 10:53:58', '2021-04-12 10:53:58'),
('bbb0dea11b332ea607c292dac4c09933aacdb0f17c36f380a3b323004d2202838398df01f4d85328', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:53:38', '2020-10-06 11:53:38', '2021-04-06 11:53:38'),
('bbc3f76321028712e3ea5c12a1b5c7b3e99e0f24327e8600bcc5d559fe2b5a0b0156980135409f0c', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:28:28', '2020-10-07 13:28:28', '2021-04-07 13:28:28');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('bbdb2d1844d55a4fc1e5d62abe7afd9773ea1e95286a42225243c26be66fd22d14f6caf54cd2bf00', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:23:04', '2020-10-15 12:23:04', '2021-04-15 12:23:04'),
('bc29af3f198661059a484a8179ffa0f158eafc4abc0b47cb2acaf307f1dc92bfa56b1f778c49346f', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:10:12', '2020-10-22 11:10:12', '2021-04-22 11:10:12'),
('bd46a730eb92f5ce431165990cfcb41979ae79c031dbcbe8c35cc177d0ca6ff0dd60e25573812c51', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:07:36', '2020-10-14 08:07:36', '2021-04-14 08:07:36'),
('bd645880c58f6d2b1b82f80b90c5f5b4d4395372090015363dda1209d069227b415db4e9625b5dcc', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:47:03', '2020-10-23 11:47:03', '2021-04-23 11:47:03'),
('bd6a9e4e905fc9134955cf584e03fca08d62ba6aa711b58d17f2cb99171dc396b0e6f56272c17542', 1, 1, 'MyApp', '[]', 0, '2020-10-06 12:24:09', '2020-10-06 12:24:09', '2021-04-06 12:24:09'),
('bdac5e63a835024f2b8c3c4fa1b32ee5161fbc8297d40c288274760594677e8e04dffeda4d72d464', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:43:37', '2020-10-07 13:43:37', '2021-04-07 13:43:36'),
('bdcc35c296565dab030db428c6658fcc33fbc79fde6ccb8678fc8e71c8ac6f168f729cd170251228', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:46:42', '2020-10-08 13:46:42', '2021-04-08 13:46:42'),
('be14bab9c2ee351d92fe9a886b21b76f0d526bc6f4eb4a470cfce983b55a5759594d645be2229611', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:17:44', '2020-10-29 07:17:44', '2021-04-29 07:17:44'),
('be319af7b2385514d8e8b33d5bdac7ce9a3966ea47d800df55a6de016fb4fc7ffe55808a2448dd0f', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:09:14', '2020-10-14 08:09:14', '2021-04-14 08:09:14'),
('be517b518395065e932c0291a2d1d85b96017821f61cfe96f3c67e5ee9c509de48a93024ae66a81c', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:39:55', '2020-11-16 11:39:55', '2021-05-16 11:39:55'),
('be8074a20f5b0106fb86d04e19a4b920b4e0e9dce5ed9801c0d2306fe70a45c6d5a77cd6a3fddda3', 7, 1, 'MyApp', '[]', 0, '2020-11-16 12:53:11', '2020-11-16 12:53:11', '2021-05-16 12:53:11'),
('bebffaca62f2af15c41b72672d4b3b45a0107c87191d488243de6bd112be3ce42816c7e2cad62cdf', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:41:04', '2020-11-06 07:41:04', '2021-05-06 07:41:04'),
('bec294eba03e803d357a6446000c97e37a412e1b8ef7ad73cff8a820142bc5910884e6b1dca93d52', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:35:05', '2020-10-07 06:35:05', '2021-04-07 06:35:05'),
('bed7aa9b77254bf6659822bac6bb0b9ec5ae0301b05c6d4244132d22de897e59dfa22226a11482e6', 7, 1, 'MyApp', '[]', 0, '2020-11-06 14:27:04', '2020-11-06 14:27:04', '2021-05-06 14:27:03'),
('bf03cba95844ec25fe4c8696f5c586bf0262cd250b793125d0399154eb43dc093cf546f0312241b2', 7, 1, 'MyApp', '[]', 0, '2020-11-06 13:58:33', '2020-11-06 13:58:33', '2021-05-06 13:58:33'),
('bf280c5822b314df78fdb14af69a3cc493f4f8681fdb25cbdaf6e555dac9ce4f6716d57caac92f79', 1, 1, 'MyApp', '[]', 0, '2020-10-06 13:58:23', '2020-10-06 13:58:23', '2021-04-06 13:58:23'),
('bf4a4f97e146d0dde2e60648406a758df1d7e11e3a397a975551c17d3d9fc7b71e9e16a26b62441f', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:40:39', '2020-10-26 12:40:39', '2021-04-26 12:40:39'),
('bf4c3f01ec7dd7c989be614a5a47cb6d3a4fcdaadcf8f41990709e3891093d00c2e4944122d2c6f9', 7, 1, 'MyApp', '[]', 0, '2020-10-21 14:17:07', '2020-10-21 14:17:07', '2021-04-21 14:17:07'),
('bfa8bebc639eb3d1949e15c1871cf80fe603fd5f1a3b4a09c7227cfa48ebcb07fe90bbaf0c7bc0ec', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:24:38', '2020-10-12 08:24:38', '2021-04-12 08:24:38'),
('c0bb144cc561beda138c9733b5d9235969834f4db36c6a3f69f3305d7657c27a8d1e21599e9aeac6', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:34:53', '2020-10-14 06:34:53', '2021-04-14 06:34:53'),
('c0ebe246fd74f82d756c2133c09b4d36a5828b92fb0dddd6ef6cc4923f60775b54b1359a3c14e3a2', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:48:57', '2020-10-12 10:48:57', '2021-04-12 10:48:57'),
('c0fa51399982fd697d26383619dba211b58ce44bea817dc8ff8fa95937bf246fc466b20bc80bf06e', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:53:38', '2020-10-13 12:53:38', '2021-04-13 12:53:38'),
('c136948f735d3b5b04a5caad570f76c734063f63860d0d6578a549a0b53afc4d246651ac01fce369', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:10:51', '2020-11-03 13:10:51', '2021-05-03 13:10:51'),
('c1a6449e13cfaf9c11a3186f888e8040feb6c0071a9a63e33aac421088bba3cf3059e3776b57ea9f', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:44:53', '2020-10-13 08:44:53', '2021-04-13 08:44:53'),
('c21061037f4a56bad11ad25547e081a6ff72042a0d4ba1e2851644d5db158d12089f49b28956c394', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:47:04', '2020-10-15 12:47:04', '2021-04-15 12:47:04'),
('c2205bcd168b11427ec86bc80fe06a8f94c8451a9f085b166872e361085a9a5a1fa3883c993c4766', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:13:00', '2020-10-13 07:13:00', '2021-04-13 07:13:00'),
('c221c31cc8baffe7246c33acfb331ecbf31ee4af9a32a46f59c64ab67ac6d3b1c4cfc1d98b1fc67f', 2, 1, 'MyApp', '[]', 0, '2020-10-07 10:22:07', '2020-10-07 10:22:07', '2021-04-07 10:22:07'),
('c242305d013834b2623da91bee60064f78837d94f0439a2ecad3506346d6ecb3971530ab8ce666c2', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:18:44', '2020-10-12 08:18:44', '2021-04-12 08:18:44'),
('c24e3f913b4f7ed0141422de11e35bdd9527b3980daa2383fe8237191b95989a99e3575cd5df48fe', 7, 1, 'MyApp', '[]', 0, '2020-10-21 14:14:28', '2020-10-21 14:14:28', '2021-04-21 14:14:28'),
('c25512971e475beb2110159cd7f4a49fbd1d0af375ca9eba6a448ee89ac5532e81e52b9954b59c79', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:16:01', '2020-10-29 07:16:01', '2021-04-29 07:16:01'),
('c25551ea0f548c01bf534f6e89c24db234439c757a1e38838bc33f6771557976f3032c0f36ce542b', 7, 1, 'MyApp', '[]', 0, '2020-10-27 17:15:10', '2020-10-27 17:15:10', '2021-04-27 17:15:10'),
('c25672f808b53ab19467e26d38fecb14dab2445490c0cf1d29168cee3f4435b4395273bf809d05ed', 2, 1, 'MyApp', '[]', 0, '2020-10-06 14:01:48', '2020-10-06 14:01:48', '2021-04-06 14:01:48'),
('c2769884d8ba52eccc1a423309435e9d0c3c910e80e9438c7bfb93683beac268684bd283532e55f4', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:57:52', '2020-10-06 11:57:52', '2021-04-06 11:57:52'),
('c3326f8a5b475e8885d87796b17ad8b172a5a7b0c3f1f622c2305774de94117b39f4d7c77c961ed2', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:59:57', '2020-10-14 12:59:57', '2021-04-14 12:59:57'),
('c34d99997bef7a7a38df6283d6925bb9771f92c1d483633fbd335d4a75f2f2981d0833036c806b9d', 7, 1, 'MyApp', '[]', 0, '2020-11-10 07:17:38', '2020-11-10 07:17:38', '2021-05-10 07:17:38'),
('c36c28a7fabb19e4700de64e1b48cf90466608cfaa781fa5ce6bd6893786497605e4c8047d5d490c', 7, 1, 'MyApp', '[]', 0, '2020-11-03 11:59:27', '2020-11-03 11:59:27', '2021-05-03 11:59:27'),
('c3a34685f32077d032d9157c2d4557a2a45e8d79bbbd4db3ca2d3c83cdb185ac80cda2add3d9ace3', 4, 1, 'MyApp', '[]', 0, '2020-10-16 06:53:31', '2020-10-16 06:53:31', '2021-04-16 06:53:31'),
('c3cbf93ae451af6881246af70d264535378517e8df0c06d853aade00d556b970e94050b2715f6789', 4, 1, 'MyApp', '[]', 0, '2020-10-20 08:28:18', '2020-10-20 08:28:18', '2021-04-20 08:28:18'),
('c43ebc392fc9602f129585c2bc7463f1a9a079f72f0253f3e83a89fba68bd167fec2f354430c4540', 4, 1, 'MyApp', '[]', 0, '2020-10-13 07:15:52', '2020-10-13 07:15:52', '2021-04-13 07:15:52'),
('c448271840aa24e7b78462dc7ab045a56792365f76e02d868de2f8f11f4fc9140f291bf29583d6d0', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:39:54', '2020-10-09 12:39:54', '2021-04-09 12:39:54'),
('c45011eb4300a4ebfff2517c1d3707838fc45ba592115e50223646aff80afd60cdefbe1ad1d9d299', 4, 1, 'MyApp', '[]', 0, '2020-10-15 12:06:04', '2020-10-15 12:06:04', '2021-04-15 12:06:04'),
('c452a1a03f8455f924e7988aa7679f84d3a6c663752a664a1a74eba94e4bed617005780a679419b2', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:45:53', '2020-10-14 07:45:53', '2021-04-14 07:45:53'),
('c47043597b5a8649364348cbf12e217f3e638cb1b63d2185e56cf9275a18147a11079e709fd5f342', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:30:55', '2020-10-29 10:30:55', '2021-04-29 10:30:55'),
('c49be2ab04e63484489bdcdfd6f933450bc2956336d778d4c6c3638faa239722419b0a537e605670', 7, 1, 'MyApp', '[]', 0, '2020-11-17 13:00:32', '2020-11-17 13:00:32', '2021-05-17 13:00:32'),
('c4dbfe0c882dcbe0fec38e897256b7d100d2d3b31a106d4aee368f544874fadcc7292b585b8633ad', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:44:25', '2020-11-06 07:44:25', '2021-05-06 07:44:25'),
('c4ebd93d8fc481a0c18d26e3d81b5ea831251d1a994f312c9883790a9a14ed5ff46c5515dedf057c', 7, 1, 'MyApp', '[]', 0, '2020-10-29 13:51:54', '2020-10-29 13:51:54', '2021-04-29 13:51:54'),
('c5c1136b08a565d84a74f98cef529b0309cab1ce7106cb26d9891fcd4887be32488062e4a27fb612', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:58:54', '2020-10-14 06:58:54', '2021-04-14 06:58:53'),
('c5e5f316f77fab6b719c1cfd56f5b1461f7f743626f0cebc67eb748fed36a8c4af0670fa599258e8', 4, 1, 'MyApp', '[]', 0, '2020-10-12 13:35:24', '2020-10-12 13:35:24', '2021-04-12 13:35:24'),
('c60861dceb64efc44f67b8ac02b64a3546896f84eb636c107755ffaeb86a41f1acf84dcc243ba988', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:57:05', '2020-10-13 12:57:05', '2021-04-13 12:57:05'),
('c614a857548e688e67107bd31466893d014a40b71fb0b18598d4b8129983a2e8f70aae7657a74f2e', 7, 1, 'MyApp', '[]', 0, '2020-10-30 11:14:58', '2020-10-30 11:14:58', '2021-04-30 11:14:58'),
('c61f1c2af85277eb79c9fbe818c42ccdcca7ac1d81b2c9007d2801ef27a1a88c7436af8ce652635c', 7, 1, 'MyApp', '[]', 0, '2020-10-26 10:05:14', '2020-10-26 10:05:14', '2021-04-26 10:05:14'),
('c65401eaf1548fa97d7556774a863253741d02a07c778e8bffaccdad92ae95c403cc1245e92169ea', 4, 1, 'MyApp', '[]', 0, '2020-10-15 07:55:25', '2020-10-15 07:55:25', '2021-04-15 07:55:25'),
('c689950b1a23e02ad197594e6983d981eb3df51e892ae2b68f319496562bc9d58c8f21c9c6799634', 7, 1, 'MyApp', '[]', 0, '2020-10-29 05:52:35', '2020-10-29 05:52:35', '2021-04-29 05:52:35'),
('c6c4a4fa3dac3adbcb0edc5d4d43992b50ca7a8e8af7740a02470c2b804eb5eac09cd5fb4eac2393', 4, 1, 'MyApp', '[]', 0, '2020-10-12 12:19:45', '2020-10-12 12:19:45', '2021-04-12 12:19:45'),
('c6d3c7c3e1c3d6ab93a6ab8e02d4f635a7f23d3c1cdcf311f2ed642fceda3e8e379cb693cc1a1679', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:04:26', '2020-11-04 07:04:26', '2021-05-04 07:04:26'),
('c6fcf480129b25fb5a06544468f855f30bb601186522da174f8d4980e2c5d15b8dc4f925cebaee93', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:22:03', '2020-10-13 13:22:03', '2021-04-13 13:22:03'),
('c74c1e7cdbc738e361dc5e13d213d2a417a44c6bffcb0b816f55b546f412ff4202e346137144c475', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:57:15', '2020-10-06 13:57:15', '2021-04-06 13:57:15'),
('c78b909880933237e7a3b224ad72f60a268b48e3ea247f431e42f3e6d413bfcb6ae5921adf8e3fea', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:55:40', '2020-10-21 13:55:40', '2021-04-21 13:55:40'),
('c78eb8fcf8ea1db4392c7263e9cc275d359963679d658c2798aaafd4f7de994e2b8ce8715388b81a', 7, 1, 'MyApp', '[]', 0, '2020-10-20 08:33:17', '2020-10-20 08:33:17', '2021-04-20 08:33:17'),
('c7aa958046b7d5a5eef9b0688c3bc7a7325b34e0fb456242b859c15d14f6f1930dfa561c2d4fb663', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:06:22', '2020-10-06 13:06:22', '2021-04-06 13:06:22'),
('c8399d9ae94e437229273083b5873000f14da86ffa836d4292be7c19d5e6c179a54598e9fd81c8d5', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:21:03', '2020-10-13 13:21:03', '2021-04-13 13:21:03'),
('c877b7c389b8602195c5608e5280e9153ec5f562a3bd3249bf8f71740b7d1853c03c97aab275e120', 7, 1, 'MyApp', '[]', 0, '2020-10-20 14:07:12', '2020-10-20 14:07:12', '2021-04-20 14:07:12'),
('c8b764f8ed9e9b08ace669a3474a6dbe03bb62e51055d6dd967808f215db678c787aee00e5dbeb0f', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:50:08', '2020-10-29 07:50:08', '2021-04-29 07:50:08'),
('c8e9f7153ac50e1ed66a9de04e5e51135b75b0752af247d342451a07e5941e9980d6951780fa3d92', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:53:18', '2020-10-06 11:53:18', '2021-04-06 11:53:18'),
('c8f0edcbd5b65504cf58974d833699b1d8f65e5922e948368fdaa49fc4c893dfc8ddf4195a5281a9', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:48:30', '2020-10-14 07:48:30', '2021-04-14 07:48:30'),
('c94f49550a0dbc6317462670e4308c3b7c5cfec6307bd4d787097264c2ed3d54d997578001807045', 7, 1, 'MyApp', '[]', 0, '2020-10-21 14:15:41', '2020-10-21 14:15:41', '2021-04-21 14:15:41'),
('ca3eee542d9a79c8e09b486b85b76c8a2fd99f284c992860af1e8c5a0fe2e95deedbf771ce7cd685', 8, 1, 'MyApp', '[]', 0, '2020-12-04 09:53:23', '2020-12-04 09:53:23', '2021-06-04 09:53:23'),
('ca3ff5b3ff3246381f162ce47479bc983e52faf25a3afd5fd07b97a66d93e5661cae3e139b2271b7', 1, 1, 'MyApp', '[]', 0, '2020-09-30 08:20:50', '2020-09-30 08:20:50', '2021-03-30 08:20:50'),
('ca7ba6e168c07484badf0a878728ccc76349347610f58d27d2ccf2a980c901a3a4292f29475c8a58', 7, 1, 'MyApp', '[]', 0, '2020-11-12 05:53:03', '2020-11-12 05:53:03', '2021-05-12 05:53:03'),
('caa829675d8cf5ad0ef1d5f3047ba3caa0de5fa95499a67ef17710e076f092c2be2f794437dff01f', 7, 1, 'MyApp', '[]', 0, '2020-11-16 13:05:41', '2020-11-16 13:05:41', '2021-05-16 13:05:41'),
('cb7f7fb59bd8cf5be4513e158518bb56124f7afd948c3a86867a9119ba84a19f161dcb3708fd18b9', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:23:02', '2020-10-08 08:23:02', '2021-04-08 08:23:02'),
('cb92105ae69e0d6b790648b6f6efed2c463e58715535bae210cc595648721019e97f2066d1e33814', 4, 1, 'MyApp', '[]', 0, '2020-10-14 11:49:40', '2020-10-14 11:49:40', '2021-04-14 11:49:40'),
('cbce423a81852f35923851f142115cea4d529285d8a69599ef55b3a9b78fd753b6204bc48a7e7566', 4, 1, 'MyApp', '[]', 0, '2020-10-15 08:22:48', '2020-10-15 08:22:48', '2021-04-15 08:22:48'),
('cbf1b93606a1463dd98af3289284325f31294753b2aaf4d5f56119605a42057fc545a3d59b15a20f', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:17:48', '2020-10-14 12:17:48', '2021-04-14 12:17:48'),
('cc4b63c58720e2dc9f61d40329594580945ae4a2a4337e9fa2e5d0150f2db56f32427b8eee576f1d', 7, 1, 'MyApp', '[]', 0, '2020-11-16 07:59:20', '2020-11-16 07:59:20', '2021-05-16 07:59:20'),
('cc4ca0e6ed59ad33c4a807f11e402de04de8f7ad3a1dafd923b208354ed278005b40bc252ef81084', 7, 1, 'MyApp', '[]', 0, '2020-10-21 10:46:08', '2020-10-21 10:46:08', '2021-04-21 10:46:08'),
('cca8b9e334f108a74113026ba858aea30fda3c548c07ae70b1c368f74318c53dabc1a3ff9e9a9a42', 7, 1, 'MyApp', '[]', 0, '2020-11-10 08:12:09', '2020-11-10 08:12:09', '2021-05-10 08:12:09'),
('ccac1d6871cf90470425e2dcafb096fc17ae128456b6ec4847280069983a44c97d0786bbb885e2d2', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:05:48', '2020-10-23 11:05:48', '2021-04-23 11:05:48'),
('ccceb37dced7ac6f484db9682a1a31528d55a5bd6f1edf184f80b5240ec01def91a757c74c46e799', 8, 1, 'MyApp', '[]', 0, '2020-11-30 14:35:37', '2020-11-30 14:35:37', '2021-05-30 14:35:36'),
('ccfcb046fbf3638eb871f32446f0c099de373d4d53a7083dfaa62c01d87dc16c2bbad8c8ed3d46f1', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:21:25', '2020-10-12 08:21:25', '2021-04-12 08:21:24'),
('cd2aba5b30ab1d966aab99618f048d21110ba855b6417a75eb06b2a09b1f6f4b2a08164e0e2afbb9', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:25:37', '2020-10-29 07:25:37', '2021-04-29 07:25:37'),
('cd5cc19a65cda51b09f8f1d5d327739c618aea9806c5f60b0d06dc6053656302104c1bbf60f6a7d1', 7, 1, 'MyApp', '[]', 0, '2020-11-17 07:10:01', '2020-11-17 07:10:01', '2021-05-17 07:10:01'),
('cd74e3db17cf73b31242e72588aa734e8e43248ca7ec21fe033e775f370ba5aad2cb29b130108c46', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:41:40', '2020-10-12 07:41:40', '2021-04-12 07:41:40'),
('cd99037c295279c851238d98f7bd48d0628cfc0003b2658453fc2e4b696b5bf908ce164e2f3de1a2', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:25:38', '2020-10-08 12:25:38', '2021-04-08 12:25:38'),
('cdebb28c63c0dd872973ea7dbe712986067ecb029365face5d4312d64ca28d42e4350b422bbf8e6d', 7, 1, 'MyApp', '[]', 0, '2020-10-21 06:16:23', '2020-10-21 06:16:23', '2021-04-21 06:16:23'),
('ce221ce3fd472b390826039b17ed4732cb851f1c551cf3bc57d946df34b28f9bdd9ca5b24ec78b3a', 7, 1, 'MyApp', '[]', 0, '2020-11-03 14:02:23', '2020-11-03 14:02:23', '2021-05-03 14:02:23'),
('ce713fcc4a0d9f3d1248197efde7465ef9121e58abef57ff224c81868b262b29c73e9d57b6e2c62c', 7, 1, 'MyApp', '[]', 0, '2020-11-05 07:26:55', '2020-11-05 07:26:55', '2021-05-05 07:26:55'),
('ce9c7e76ccf3f54a1baa3d75595d7568882413e63dc488481f2dc647f138ba83ac9c510c576af0f6', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:14:07', '2020-10-06 11:14:07', '2021-04-06 11:14:07'),
('ceb0786caea4c594419750b7b31ecfb47ccd5c67e094413ae0417cce50105d7319c7e390a5f5df1f', 4, 1, 'MyApp', '[]', 0, '2020-10-15 08:17:51', '2020-10-15 08:17:51', '2021-04-15 08:17:51'),
('cebe49775cd86220315ea4070b9af5d3bbc27130c7a6f412ae51252093852d7715700598b5be8b70', 4, 1, 'MyApp', '[]', 0, '2020-10-15 11:00:00', '2020-10-15 11:00:00', '2021-04-15 11:00:00'),
('cee2c6dd78e08e10218ed8bb1cae72b0e33a3bcec5e03e9af196a52ad16cd281fe757b37e3c6bf8d', 7, 1, 'MyApp', '[]', 0, '2020-10-27 08:36:56', '2020-10-27 08:36:56', '2021-04-27 08:36:56'),
('cef8817c40cc45ce168e14bf71534f1294b468d229efe9c1727b361a2e6264277bdac63159e128ed', 7, 1, 'MyApp', '[]', 0, '2020-10-21 13:54:36', '2020-10-21 13:54:36', '2021-04-21 13:54:36'),
('cfe7d0ff1da9970cd077d1be86a16e930aa5ee672b5614e5df2559c74d18a02571bdefe9acbe73e2', 5, 1, 'MyApp', '[]', 0, '2020-11-11 15:20:11', '2020-11-11 15:20:11', '2021-05-11 15:20:11'),
('d024a4072d041123d36f50051c6dd861309815ec69bb4ee039829290eb64855919e2574e8dac0ce3', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:48:16', '2020-11-06 07:48:16', '2021-05-06 07:48:16'),
('d0966370f32b60b32f76d3d976f1b7eaf1292dc6cb5810c665f12fb2084cb7becfa301c90a98b33a', 4, 1, 'MyApp', '[]', 0, '2020-10-14 10:07:43', '2020-10-14 10:07:43', '2021-04-14 10:07:43'),
('d0adf3d6806cd4fd26a0718737d60f92a89e533d82c0015b90afe0b10b8dd6a800b605aeffb35753', 4, 1, 'MyApp', '[]', 0, '2020-10-15 07:58:18', '2020-10-15 07:58:18', '2021-04-15 07:58:18'),
('d103e34fcee9adafa0f028af45a12fc8a0c61cc65a9f802c0f43b5b8f9a334bc2bd145e3cf426e06', 7, 1, 'MyApp', '[]', 0, '2020-11-20 09:35:13', '2020-11-20 09:35:13', '2021-05-20 09:35:12'),
('d135b14bbd39531b044309d3a73f6e7cd1bb8427f917bcdeadb2eb61aa376ebdd21e9b78d3f30b36', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:53:13', '2020-10-12 10:53:13', '2021-04-12 10:53:13'),
('d157e8c904c9422b847056c542b019da0f6532d3e4bdbae084868a9c68f99230db146a78477b394f', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:40:33', '2020-11-06 07:40:33', '2021-05-06 07:40:33'),
('d18db57710c10c823de5a94b88060b3237a729b3394195b31cd25f1a1d331cc4f9e7421c5045e7b1', 7, 1, 'MyApp', '[]', 0, '2020-11-17 11:01:26', '2020-11-17 11:01:26', '2021-05-17 11:01:26'),
('d1af9e5b1c701452187507b3de95d9c5e177d0d50d5d146ee4202c3acc64cbaf6fc54b86620796b1', 5, 1, 'MyApp', '[]', 0, '2020-10-29 22:28:00', '2020-10-29 22:28:00', '2021-04-29 22:28:00'),
('d1bebab7dc665e9aa2079e7a7ef69546560560d7559d4b51ac6c69d02e90c6c5cda1f1154c6337ae', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:46:10', '2020-10-13 12:46:10', '2021-04-13 12:46:10'),
('d1eaaeac505f9bbe3e829ce65c51c9b2ff1f53dc314baff9981724280260ac3617af1e8f220140dc', 2, 1, 'MyApp', '[]', 0, '2020-10-06 06:13:36', '2020-10-06 06:13:36', '2021-04-06 06:13:36'),
('d1ec7839778b883fd3bdd1e5cb2f6fab774d45e0b05ff57a23103c26e78badb1e4b7fc278b268a66', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:55:53', '2020-11-03 13:55:53', '2021-05-03 13:55:53'),
('d1fb5fa8700b158404df6ef1e375f6b151c63622bdd7a88ec321d38aa34971cf7c63b30ba2ae94ba', 7, 1, 'MyApp', '[]', 0, '2020-11-12 07:36:32', '2020-11-12 07:36:32', '2021-05-12 07:36:32'),
('d2085e05ebf4331af2f1fd7d16ff1347ff5f7ed0e94b48a275245fa9197ce5fa95d8f68c6ed20e7c', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:56:52', '2020-10-29 07:56:52', '2021-04-29 07:56:52'),
('d210a3eb1595481fc72bf9a540e05f4f0a5716cbeee5b4447ea1007d7268f060e336b30343c42c57', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:30:04', '2020-11-20 11:30:04', '2021-05-20 11:30:04'),
('d2264452daf9aa5d755f12a6453c12f0d37535ea8110f214ff526a17a78d50ecf56339106745bac5', 7, 1, 'MyApp', '[]', 0, '2020-10-30 07:30:22', '2020-10-30 07:30:22', '2021-04-30 07:30:22'),
('d2505e6521126105b7827aaa498cc50cfeb4178e5f511915d03ef3a02978d9052d70844a0fd41dfb', 4, 1, 'MyApp', '[]', 0, '2020-10-19 12:15:13', '2020-10-19 12:15:13', '2021-04-19 12:15:13'),
('d280d01baa0843c91159af89b4e4bae5e6f19cc34c012a82adb2be360f68cdaa19e67709d4536a62', 4, 1, 'MyApp', '[]', 0, '2020-10-13 14:03:45', '2020-10-13 14:03:45', '2021-04-13 14:03:45'),
('d2d6375745014356dec0c5928518cee835521f61681a02b9a51b6b3b0742c6a2fdf7e1372b4e12e8', 5, 1, 'MyApp', '[]', 0, '2020-10-08 13:42:14', '2020-10-08 13:42:14', '2021-04-08 13:42:14'),
('d2e737ad8a8e1c8896141d7b2f4dbf9e1b5ee5b5c98d9954f9610d600c94b1b0bf508b0099123714', 7, 1, 'MyApp', '[]', 0, '2020-11-13 13:57:52', '2020-11-13 13:57:52', '2021-05-13 13:57:52'),
('d34946b24a1025d41701b1d9b9c25b78b1b3aa2fa07e16404476ad38ea01f629d49daba93443298e', 7, 1, 'MyApp', '[]', 0, '2020-11-23 09:57:50', '2020-11-23 09:57:50', '2021-05-23 09:57:50'),
('d3762d7889c219291481190cbe57f7a3ee9e50ce1c95a30f158cba254895b367e00cf2c62dcc8a97', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:50:35', '2020-10-12 07:50:35', '2021-04-12 07:50:35'),
('d3b497d7e4ef657bdb4110926657f88807128e73c96b3d11aee53007d2d0b35cdf2128eabf0a97d4', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:24:23', '2020-11-16 11:24:23', '2021-05-16 11:24:23'),
('d3bd54e9ba81dfa75d0c7f5ac6e300fbfd9aa34cfea366a82cb071bf6a62c11925289ca66ea8fd75', 4, 1, 'MyApp', '[]', 0, '2020-10-14 19:33:35', '2020-10-14 19:33:35', '2021-04-14 19:33:34'),
('d3e866d3514f95a6cd1056109549cebd3525977504c45ed80b3ba801eee39296a8243441b77f3300', 7, 1, 'MyApp', '[]', 0, '2020-10-22 12:09:02', '2020-10-22 12:09:02', '2021-04-22 12:09:02'),
('d47cc3d34215ef7c914e0198162ef783cef3880a1fe4e8a286d8677fd7ff6a916397e7079453eb10', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:40:01', '2020-10-14 07:40:01', '2021-04-14 07:40:01'),
('d483ffbbd0cc89e271c8deafd7a155b202aadd1a9305b04a3850106cc85ddbd88a932f37d4fe5b02', 7, 1, 'MyApp', '[]', 0, '2020-11-06 13:33:42', '2020-11-06 13:33:42', '2021-05-06 13:33:42'),
('d48dc4ecb557133783eb72b4526a4a2936e56099c441f9133cd77232af8a180913fa37ab6e320d42', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:52:49', '2020-10-06 12:52:49', '2021-04-06 12:52:49'),
('d4c9a3665d53007219ff2a4cf3b910e1174a10154a7022ced036c7463b295d9b2b3916250b80b1c5', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:32:29', '2020-10-14 07:32:29', '2021-04-14 07:32:29'),
('d4ea423f416794a6aee41df11eb46dcdf980cdeb42310abad644f897eb89b42a501755ad5541431d', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:20:33', '2020-10-06 13:20:33', '2021-04-06 13:20:33'),
('d536d99a56bc87eeacf6dbb5c1604e651c15d9ccd7f8c8300380e4260b843b422c1f2dfc23c8c152', 4, 1, 'MyApp', '[]', 0, '2020-10-19 07:17:27', '2020-10-19 07:17:27', '2021-04-19 07:17:27'),
('d538f07ff90380c411e5d3e55a6269fa9cded84dddf3423358761fa8a7f7d8be0d55f40a70ebae2a', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:28:20', '2020-10-21 08:28:20', '2021-04-21 08:28:20'),
('d5d9e5c6ec4ae5854fc263ff4187d38b97cd98889f5d61eb99787a5b4909b034eb70ea3cefe5e8dc', 4, 1, 'MyApp', '[]', 0, '2020-10-12 12:48:41', '2020-10-12 12:48:41', '2021-04-12 12:48:41'),
('d5e70b0500d907312936da41ee8436dbf2bd14fe0cc54c1ae179707c38a831b906492dd67fdf6ecf', 7, 1, 'MyApp', '[]', 0, '2020-11-17 12:19:43', '2020-11-17 12:19:43', '2021-05-17 12:19:43'),
('d64d42869a922163b9d661362e9c58af5e0a5cc193ebc221fe1cea3f392b5cad63eefdf274d8f710', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:49:47', '2020-10-22 11:49:47', '2021-04-22 11:49:47'),
('d669429478cbbf4a206bc5cc983438c8015144c9160bfe4feb63e57dc7b01e3e409966e42367f0d5', 7, 1, 'MyApp', '[]', 0, '2020-11-19 07:04:07', '2020-11-19 07:04:07', '2021-05-19 07:04:07'),
('d691e127ce4afec6a502965af547a0fa837d9161420bb3a9f30181a9c658b790356d15a88ab64431', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:57:53', '2020-10-14 07:57:53', '2021-04-14 07:57:53'),
('d6ba72505dc6caaac0bbcaf8c716199d6a93884617dfddcf014f5c2a30a5186a7b0e89259fa55377', 4, 1, 'MyApp', '[]', 0, '2020-10-08 12:49:05', '2020-10-08 12:49:05', '2021-04-08 12:49:05'),
('d6e456b0e29b6cab287766cbcdb8b49b1e405c10052636e44bb47557872d09738db5705ed55c047f', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:37:56', '2020-10-07 07:37:56', '2021-04-07 07:37:56'),
('d7223fd748613e9aa4fb15208307d5885f9ee55ed78d9533fb0a7d58a9262a75028798ad3e3bacb0', 7, 1, 'MyApp', '[]', 0, '2020-11-12 13:36:27', '2020-11-12 13:36:27', '2021-05-12 13:36:27'),
('d7655b1e26fc8361c511b3d734ded559a2c9178501bf13835912f447add5494f87431b238ac45b08', 7, 1, 'MyApp', '[]', 0, '2020-11-16 07:56:41', '2020-11-16 07:56:41', '2021-05-16 07:56:41'),
('d811251b56a18524be2fafd2a40026dd5a06d4cb2fcae08e60dbc52cd9ccfd69eb12b16533e69d7b', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:30:32', '2020-10-15 06:30:32', '2021-04-15 06:30:32'),
('d819a203dcaa35cf8fd45a0d350906e270cb07355c611aa0aa10952015ae96002db280b4c957413f', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:49:05', '2020-10-30 06:49:05', '2021-04-30 06:49:05'),
('d8303b556a813cb8b8a27b3032fa0da00faa122c2f9091837e17e57ec06bb46592b4afbcf8e2ba25', 7, 1, 'MyApp', '[]', 0, '2020-10-23 12:19:38', '2020-10-23 12:19:38', '2021-04-23 12:19:38'),
('d8356c10606865eb225f7b4c4fba5d281055d704a7f5bf6d7c6c6579671dc737ef7d0fa8cad6d241', 1, 1, 'MyApp', '[]', 0, '2020-10-06 12:24:16', '2020-10-06 12:24:16', '2021-04-06 12:24:16'),
('d84d7664a74b43405069007a72b102ce0e928996653316a88311450300ebd40670747f415820bf3e', 1, 1, 'MyApp', '[]', 0, '2020-10-06 10:07:01', '2020-10-06 10:07:01', '2021-04-06 10:07:00'),
('d856ed2741df312b4997a0d9514c78d92c0f12c4735b04b1682976537bff9a5a1914f6848453f428', 2, 1, 'MyApp', '[]', 0, '2020-10-07 10:21:17', '2020-10-07 10:21:17', '2021-04-07 10:21:16'),
('d860ae70253f8dc9490fc4baabd0ed31818491c8de323a1eebf9fc06e3115939ed9011c899fcab03', 7, 1, 'MyApp', '[]', 0, '2020-12-04 08:05:59', '2020-12-04 08:05:59', '2021-06-04 08:05:59'),
('d8e626d2fddeb41b5fed00eed351bb4249557e9eb14832fc99703b57bf43aa9a7a4f9dd83ba244fc', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:35:13', '2020-10-13 12:35:13', '2021-04-13 12:35:13'),
('d9005e85f1a2839326ced249bf80b8eeda233e9f54c80b740260d8c74b4e4716a578f266d1cffd49', 4, 1, 'MyApp', '[]', 0, '2020-10-16 12:11:26', '2020-10-16 12:11:26', '2021-04-16 12:11:26'),
('d92cc2e309ed85739f97172f8f57c158ebfc4d9ebda1628b903fdcad71496ce8fdb4277342d63380', 4, 1, 'MyApp', '[]', 0, '2020-10-16 13:55:06', '2020-10-16 13:55:06', '2021-04-16 13:55:06'),
('d95f24b8c71f8d43c3786f2fd0634291ecec48b7ed919b6db957e58476163c79abd04c7554971549', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:00:40', '2020-10-14 07:00:40', '2021-04-14 07:00:39'),
('d9c541181bc197e4e1acd05751272692ee91e2da3d6b03686828f9c68bad5c82b40fe1a9810496ba', 4, 1, 'MyApp', '[]', 0, '2020-10-14 11:12:29', '2020-10-14 11:12:29', '2021-04-14 11:12:29'),
('d9f720ab8f03a851438c0512551bc136cbd86a0d16ceff0dd3ca524c4b6384fe8d7ed020cb0f3e24', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:08:40', '2020-10-06 11:08:40', '2021-04-06 11:08:40'),
('da668167e74effafe6cdffb4fe34cdaff2dcacc2389ccf86cd59de9a7d0250bdec62f8066ce8dca6', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:25:05', '2020-10-15 06:25:05', '2021-04-15 06:25:05'),
('da8a908e3b6a06a7372034f06aaef28a86e2f5c0ae1fff5a8eccdc34cbee1bfc4189f01162df3a7d', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:46:35', '2020-11-20 11:46:35', '2021-05-20 11:46:34'),
('db416b4e7be470ba53be7d34a9ff4b0f8da37899991d880895313e64b6d30adb429e147fe6969716', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:05:18', '2020-10-23 11:05:18', '2021-04-23 11:05:18'),
('db4ddb1da16ee3a1849786d1e8ce7f65b523c3abd3aec34ec0dcc36efb8e983d59384d561cf5d186', 4, 1, 'MyApp', '[]', 0, '2020-10-07 14:20:33', '2020-10-07 14:20:33', '2021-04-07 14:20:33'),
('db76fa46a0483ffe7f89d11f04bf2e8f3e119614d0fd9ade4ce17994450134f8a3cfd3e77de03165', 7, 1, 'MyApp', '[]', 0, '2020-11-23 06:53:31', '2020-11-23 06:53:31', '2021-05-23 06:53:31'),
('db8fdbd379eb7063dd0ab8b5c78a8856f9bce7c8b7d807801d1e7377dad19faf0224245810c2086f', 7, 1, 'MyApp', '[]', 0, '2020-11-27 13:43:24', '2020-11-27 13:43:24', '2021-05-27 13:43:24'),
('db8fdc82006fa7f02063e45a5eb0db76d2fc8278e37211ac41fc469c556ef28b649237640d10c065', 7, 1, 'MyApp', '[]', 0, '2020-10-22 06:16:42', '2020-10-22 06:16:42', '2021-04-22 06:16:42'),
('dbcba717b7ee86e6f657ef72c5523423b1d5d353579ee983ee85425adaa13c8b7771f05ab7a9c70f', 5, 1, 'MyApp', '[]', 0, '2020-11-11 15:02:18', '2020-11-11 15:02:18', '2021-05-11 15:02:18'),
('dc1713b1ebb6283ba8ffdf58badbd866a91bae7b4eac8a7261789741ba75b2dd42340aae306f8f28', 7, 1, 'MyApp', '[]', 0, '2020-11-24 06:12:59', '2020-11-24 06:12:59', '2021-05-24 06:12:58'),
('dc85d6bfc71c9267574438cbb298d96411de081704611df4c7736c1504ef1ac8f6dc848b7577aa00', 4, 1, 'MyApp', '[]', 0, '2020-10-16 11:40:36', '2020-10-16 11:40:36', '2021-04-16 11:40:36'),
('dcedb9d6b6821bf9ec6acd63fd385bce70517270eaf39aec0d6e758a5f6bc0fa8292e15a677c8a73', 7, 1, 'MyApp', '[]', 0, '2020-10-26 12:54:38', '2020-10-26 12:54:38', '2021-04-26 12:54:38'),
('dd3f2c49a419b243d6a965fa86c8f5b11f39d1e007b25b2dd90ec9cb99c614cf96b7e8d0f9489dbe', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:17:07', '2020-10-15 06:17:07', '2021-04-15 06:17:07'),
('ddc7c671e588839b696bf73706eb216087eadacb6ce1bcc382d1f946014df5d0b74bed22a8be8b55', 2, 1, 'MyApp', '[]', 0, '2020-10-07 08:09:41', '2020-10-07 08:09:41', '2021-04-07 08:09:41'),
('ddcf958f75fe391a4910b5c25080c6ecd2af3c6aa8a939a44b6e1e8ef75696c38033e746d388cca4', 7, 1, 'MyApp', '[]', 0, '2020-11-04 07:03:50', '2020-11-04 07:03:50', '2021-05-04 07:03:50'),
('de32c546553217c75ed432ba1cbef17a1a2f706e367c5bb9af863b41e55ea57c1279c83e36f5476d', 7, 1, 'MyApp', '[]', 0, '2020-10-29 13:15:23', '2020-10-29 13:15:23', '2021-04-29 13:15:23'),
('de32f1b77b0a06ef042bd87d71f1c91867e9cedd88aac4ea0e24799561dfb57668751adfba546989', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:26:47', '2020-10-06 13:26:47', '2021-04-06 13:26:47'),
('de5fe7511852ec7ea33dbae0d09b74be190c9d67a9a090603bd5664debc2c908d73723079fd82fe9', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:43:35', '2020-10-13 08:43:35', '2021-04-13 08:43:35'),
('de94430b6e609e88c89e51c52d5a0b77f6f3c050a98d265c5caf42bdd671d87a99718f784fed280b', 2, 1, 'MyApp', '[]', 0, '2020-10-07 07:32:23', '2020-10-07 07:32:23', '2021-04-07 07:32:23'),
('df52fe3261ef6f44f1859a56901706f3e83568d68be56de9a7b89bbe2285f3c09d516cd5e94a7206', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:09:30', '2020-10-06 12:09:30', '2021-04-06 12:09:30'),
('df66b59f39bd7e8d553f23dcd8b1c8f95c4e69183f046e348df1472112e02ff027791422da67ccd7', 2, 1, 'MyApp', '[]', 0, '2020-10-07 05:58:07', '2020-10-07 05:58:07', '2021-04-07 05:58:07'),
('df82539f00508b0abb78cb7bb70ec760e220fd5fb2a027f35821c6c5615443e7a6c585e0489fa5ca', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:29:29', '2020-10-29 06:29:29', '2021-04-29 06:29:29'),
('e00eb201a52071f3e925647e807c8a2400c1409c9300d2fa1edac9742a9ca673a8bf64a4487f7eb7', 7, 1, 'MyApp', '[]', 0, '2020-11-12 12:28:54', '2020-11-12 12:28:54', '2021-05-12 12:28:54'),
('e011c2293eeb1a2259092b08619bc19c3822c8a101946a13b885c8f3d4401af42046344197550b8a', 7, 1, 'MyApp', '[]', 0, '2020-11-05 14:12:07', '2020-11-05 14:12:07', '2021-05-05 14:12:07'),
('e04111157fe7f882c2510929d82950cd84a49c1fe31ef9fe1aac8b6e4ecf80a45313a57009b301f6', 4, 1, 'MyApp', '[]', 0, '2020-10-19 14:03:05', '2020-10-19 14:03:05', '2021-04-19 14:03:05'),
('e054b0cb48b16aafbf4a91a7dfc066453ccef45179f3a245fa95a7239dc5691c47e694fe623ab1fe', 7, 1, 'MyApp', '[]', 0, '2020-11-18 06:49:58', '2020-11-18 06:49:58', '2021-05-18 06:49:58'),
('e083d21c403ad4fc598eef8abb9f73f5177e718cd832d32ac9fa652767e6e9e76e119319974c2e3f', 4, 1, 'MyApp', '[]', 0, '2020-10-16 12:57:01', '2020-10-16 12:57:01', '2021-04-16 12:57:01'),
('e0aa8a1a25d41e57924d7fe833b006b61091d9f4d27803d63dcff0feb25be6387416ddb0de0bedf0', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:43:39', '2020-10-06 13:43:39', '2021-04-06 13:43:39'),
('e0e0869eb3eb3e20df29a8457ca992df3fa73440646796651edc81de8a078421b3a3e0ba8c3b7791', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:41:42', '2020-10-09 11:41:42', '2021-04-09 11:41:42'),
('e1284967a403920b28845cb0ee820d2e9bfc879c765a6a7970a3b4010bce3412b95a21f50bb38afd', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:30:13', '2020-10-14 08:30:13', '2021-04-14 08:30:13'),
('e143b27d19e4207e0b7024b6b9f7c206c7285ae2bd01be43cdaa439d606365ff055cf65ba27bc66b', 7, 1, 'MyApp', '[]', 0, '2020-10-22 06:04:22', '2020-10-22 06:04:22', '2021-04-22 06:04:22'),
('e186432b8fe06d7a2446df80f4a1eb5fe879a5edbeb4b80052162e461beb026e889edf51a263fd27', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:23:43', '2020-10-08 08:23:43', '2021-04-08 08:23:43'),
('e1d714fdd5555d177423ca5635f5cb420a52a7298954ed7e97fb3ef6b73e8c7ee62352aded4b2ef8', 5, 1, 'MyApp', '[]', 0, '2020-12-07 14:38:35', '2020-12-07 14:38:35', '2021-06-07 14:38:35'),
('e1ed99eb093214a4bc3d77c2f21a873940ba58426fd3df473ef8321735647a7834a6840e15b7377d', 7, 1, 'MyApp', '[]', 0, '2020-10-20 13:21:45', '2020-10-20 13:21:45', '2021-04-20 13:21:45'),
('e1f70419257c1874c2e3d270c9ccdbad9031cb19588c445f4b74cfd65760b1143b1312b8bee90f2c', 7, 1, 'MyApp', '[]', 0, '2020-11-11 06:32:47', '2020-11-11 06:32:47', '2021-05-11 06:32:47'),
('e266bd0753d4a109eb9fb52c21ba09828833a6033a86610bfdbe9a61eb3a1aed8769b5b587257c1b', 7, 1, 'MyApp', '[]', 0, '2020-10-21 06:10:18', '2020-10-21 06:10:18', '2021-04-21 06:10:18'),
('e2caf78d8cb619ebc331326d7275f4b1f06d883e2ce17e892aff4b15fbaa507ba0ac29d8930a0100', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:31:41', '2020-10-12 10:31:41', '2021-04-12 10:31:41'),
('e2f470b228d95e682227820d27c740543c558e1efde60887ad081e49f5e3e270e1158a2cd5a23382', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:33:18', '2020-10-21 08:33:18', '2021-04-21 08:33:18'),
('e3a58b35119d0483b0ad081fa893b8e6ff50a7a07a0e2fc7d8bad1721dd948cfec37303abd2e4eea', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:48:10', '2020-10-13 05:48:10', '2021-04-13 05:48:10'),
('e3a633867652e31656b3676283f7f9a3b26f2db5beadad098ea97063201b9afd07589166d20abc64', 7, 1, 'MyApp', '[]', 0, '2020-10-23 13:06:22', '2020-10-23 13:06:22', '2021-04-23 13:06:22'),
('e3d6f796c69ca8e4c97ff234d56b71a2707094ce93b2eafb90cd402a2a8e78b4cd15fa219cfb41a8', 2, 1, 'MyApp', '[]', 0, '2020-10-07 10:08:06', '2020-10-07 10:08:06', '2021-04-07 10:08:06'),
('e41a54d032df409687cab630048f9aa4d3c92b596946a8df5868ce9a61f11b50ee1461fd6d7dc441', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:12:32', '2020-10-14 12:12:32', '2021-04-14 12:12:32'),
('e45dfbf0185d6097ca955e4c2af0d50c92be4d411ddd399937aec986467f628c07b3cfac2c7f1059', 2, 1, 'MyApp', '[]', 0, '2020-10-08 06:23:33', '2020-10-08 06:23:33', '2021-04-08 06:23:33'),
('e48dfcad01b134c7338df58d7f7fbc204d7038bd56704d27675122bc9a618c415bae0a8144960c09', 4, 1, 'MyApp', '[]', 0, '2020-10-14 06:39:04', '2020-10-14 06:39:04', '2021-04-14 06:39:04'),
('e4c321479a068e13350574b464c2c1cdf20932f0c1af957c4fed3548792701cb4d4627e7d06f38cd', 7, 1, 'MyApp', '[]', 0, '2020-11-20 11:26:56', '2020-11-20 11:26:56', '2021-05-20 11:26:56'),
('e4c82d016b376ab11e2fdc1328036c7d0045f010391b6e8e3389faa42dfeb6d52788f671272c4a1e', 2, 1, 'MyApp', '[]', 0, '2020-10-07 13:44:31', '2020-10-07 13:44:31', '2021-04-07 13:44:31'),
('e4e5eccf245d1d34fe83c6472f0bf9d5cd9545908998577c08c6a27e1e839e460ec31b5c94048272', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:19:22', '2020-10-06 11:19:22', '2021-04-06 11:19:22'),
('e544c7c1c402ecba5a490c3f4847c5e200930934163d5d49921b78496b3e355ac7d0489e47c9506f', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:51:29', '2020-10-09 11:51:29', '2021-04-09 11:51:29'),
('e5752b24dc3b927120fc8248fce29911590bb5f644b67c08c15d9e60a526bde3c4f34f34ca113af3', 7, 1, 'MyApp', '[]', 0, '2020-11-06 13:57:21', '2020-11-06 13:57:21', '2021-05-06 13:57:21'),
('e5b47be13e2de97e36a3485b20e5c3d1ab9fb0bdfe9a2412239576f1b2c90acba8f6c85a3fe79e07', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:42:20', '2020-11-20 12:42:20', '2021-05-20 12:42:20'),
('e62038a707674d034f2c0930d5d3428cf0dce47f8c5555bfba1e4eb0ae5b0a7bcedecf2732039a9b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:08:49', '2020-10-13 13:08:49', '2021-04-13 13:08:49'),
('e66302c3a33a095e93f59d3b8e869843acfbb2cca3a0e72bcba6c8a256ab16e8bc00c473239122e1', 5, 1, 'MyApp', '[]', 0, '2020-11-26 18:20:09', '2020-11-26 18:20:09', '2021-05-26 18:20:09'),
('e69b026ab184a22cef832483b0609ea169115f9942b0dad60810eed65a398e8ec98ec94fa82de91b', 7, 1, 'MyApp', '[]', 0, '2020-11-16 11:21:26', '2020-11-16 11:21:26', '2021-05-16 11:21:26'),
('e707e901ddc1c0c4df8357ebb54ffbc2561427fa02a41b362953e5f79d1e2830a9e4fbdd5573544a', 7, 1, 'MyApp', '[]', 0, '2020-11-26 05:48:39', '2020-11-26 05:48:39', '2021-05-26 05:48:39'),
('e709da6dc9b1ccd1aa31a31e766c6f99cfd4fcc0dfed504e794ded3540c0e17a2acb2b88d400fc81', 7, 1, 'MyApp', '[]', 0, '2020-11-16 14:21:44', '2020-11-16 14:21:44', '2021-05-16 14:21:44'),
('e710f805d56a7bb229fc0d17234262c9d89e801bcdceeaa9b58530fa57009efb14934ce1466efb22', 7, 1, 'MyApp', '[]', 0, '2020-10-30 18:27:37', '2020-10-30 18:27:37', '2021-04-30 18:27:37'),
('e7224b09ecf958eb70ed6f7fb09aed97ee30d32afec5ac35ae0add98e0d1359f47ba5c1977292174', 2, 1, 'MyApp', '[]', 0, '2020-10-06 12:02:20', '2020-10-06 12:02:20', '2021-04-06 12:02:20'),
('e74da7b490cdd5c04482e9feaeca385d6c540364028695642d88bc986ff24700433ad2444aa1961c', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:24:45', '2020-10-13 13:24:45', '2021-04-13 13:24:45'),
('e7e2c76319ea64f474527009588559e16e78d5c48c25d287517c75b3b0408f8c1554463cc5c56ac4', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:37:18', '2020-10-09 11:37:18', '2021-04-09 11:37:18'),
('e803fe32de63c9c53a7e674a29a4c3db5e984aec1befc30d18788c221842d7b8c1bae9e42758d68f', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:42:57', '2020-11-06 07:42:57', '2021-05-06 07:42:57'),
('e84ff287e445f85428a1b363ed2bb9c5ba24bb381831e7a0eaf897494ab5be1915c619f401cc2a1f', 4, 1, 'MyApp', '[]', 0, '2020-10-15 11:51:19', '2020-10-15 11:51:19', '2021-04-15 11:51:19'),
('e8725a745d16c35e3a54294a764df1d0637e629bf18e5c3fcc3d2fe64a619c6aadd2481287b5abbe', 7, 1, 'MyApp', '[]', 0, '2020-10-20 10:58:11', '2020-10-20 10:58:11', '2021-04-20 10:58:11'),
('e89452011fd7d23745240eb98849f34e8f9c29e5afc42d45e5e220a92f703e4d411a4064745b790f', 7, 1, 'MyApp', '[]', 0, '2020-11-05 07:04:55', '2020-11-05 07:04:55', '2021-05-05 07:04:55'),
('e8ab8f80519ad79cee78265a7441295c2e50cde4bf476acac5f04437ffed813d8e504dd6e2788871', 5, 1, 'MyApp', '[]', 0, '2020-11-02 16:23:21', '2020-11-02 16:23:21', '2021-05-02 16:23:21'),
('e99987f783572c65a4d3ac6c99ad285ce1d8ddced30ba09427d709199d136dab4318492f8ae87ff0', 7, 1, 'MyApp', '[]', 0, '2020-11-12 07:57:35', '2020-11-12 07:57:35', '2021-05-12 07:57:35'),
('e9a4bae0c9fd1143e654988aa2cd9b967625fd8cc1999dccf52c490c84b4d8e2252cb436dde9728d', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:21:15', '2020-10-13 08:21:15', '2021-04-13 08:21:15'),
('e9be3feb8ccb6359d1bdd3efbe67a84f8e7e0e5865dd9d4a65a42547a9515e58729134bea214a033', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:21:41', '2020-10-29 06:21:41', '2021-04-29 06:21:41'),
('ea0f8fa10b37930d7033d336337870a4d9fadd52acec97bcef3441c4d2309d2ee89d7fa67a09f3f1', 4, 1, 'MyApp', '[]', 0, '2020-10-13 11:43:22', '2020-10-13 11:43:22', '2021-04-13 11:43:22'),
('ea9e363a79f833af2900c0a01b44c33a472d58a3727b2de78730888b9f3252e18210931785361288', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:40:50', '2020-10-06 13:40:50', '2021-04-06 13:40:50'),
('eacf6e93c8e8342ceb1c6fd211c7c253b8de38adea5ebc4ba05b71291e155f7bb44d34b09794969b', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:26:58', '2020-10-13 13:26:58', '2021-04-13 13:26:58'),
('eb291f4687dd63dde7f10d28d39ef544cf5a3aabc7b6cc5aba5d2e294388e1316880779c692cbf85', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:45:42', '2020-10-14 12:45:42', '2021-04-14 12:45:42'),
('eb3c43369c386ee2716eb80027639481f4672e040792cfa822013fbdd13b2d22a30f4e51de2adfda', 4, 1, 'MyApp', '[]', 0, '2020-10-12 07:37:25', '2020-10-12 07:37:25', '2021-04-12 07:37:25'),
('eb63faf98e650ed2fa027425387d7b3268c327711346c1c9b9cedb1357dbea3c423dd9eb3a164732', 7, 1, 'MyApp', '[]', 0, '2020-11-03 14:21:51', '2020-11-03 14:21:51', '2021-05-03 14:21:51'),
('eb6729c979299867c5cd5a845618bede1904ba5099fb044251b57b21686a0466baa17d0bd76c3cd6', 4, 1, 'MyApp', '[]', 0, '2020-10-15 06:40:24', '2020-10-15 06:40:24', '2021-04-15 06:40:24'),
('eb766d3d7f9e93397dda393a920767c07d2640309b4cd66d6a13b8a60c9f981c6234f2c1b2796127', 4, 1, 'MyApp', '[]', 0, '2020-10-12 12:21:43', '2020-10-12 12:21:43', '2021-04-12 12:21:43'),
('ebff6b76aef59ed6b62e2e51f9c202193c0f922f7390f0e28e7f88e1bafc0cf983b1723a309f61f2', 7, 1, 'MyApp', '[]', 0, '2020-10-21 08:18:14', '2020-10-21 08:18:14', '2021-04-21 08:18:14'),
('ec0b8cf1017ea391721cab97d5e285779a2efe6a4a07a3835cd9cfdee6651c18f02e3f4d4dbdb10c', 4, 1, 'MyApp', '[]', 0, '2020-10-14 08:13:47', '2020-10-14 08:13:47', '2021-04-14 08:13:47'),
('ec5346daa99d5999588d2af7245b23c7b7f4f99a91f188996916034b1d4bf6acb24351e5b75ee7db', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:44:13', '2020-10-13 12:44:13', '2021-04-13 12:44:13'),
('ec80d7d1107be5f3d92cfc8bc9bce0ebbf242c483f07215609f8a8914b4192f5be3400c834112b72', 2, 1, 'MyApp', '[]', 0, '2020-10-07 09:59:26', '2020-10-07 09:59:26', '2021-04-07 09:59:26'),
('eca3c72b6952d0a3005ee58d1a8ddc7f2115f90038ef496bd560f7aa742854d13b16c2c3baff26f8', 7, 1, 'MyApp', '[]', 0, '2020-10-27 06:09:19', '2020-10-27 06:09:19', '2021-04-27 06:09:19'),
('eca94dc80b84ef6af7ffaeb56109949e58f32bedc52e8ca8600896190d83f0d3343f7349738709fa', 7, 1, 'MyApp', '[]', 0, '2020-11-04 08:13:24', '2020-11-04 08:13:24', '2021-05-04 08:13:24'),
('ed253f94bd2887b28a21669dd855e7fdc59dd96e17b41a8996b28cb01f9b016775dd1cabe3965091', 4, 1, 'MyApp', '[]', 0, '2020-10-09 11:50:28', '2020-10-09 11:50:28', '2021-04-09 11:50:28'),
('ed4c6b48e4d61a990a20d53eaa508c40a3c10781b775081bbae27319a6ad3ebcfc71f6672935db53', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:15:59', '2020-10-13 13:15:59', '2021-04-13 13:15:58'),
('ed5b196069141e1a945fe37f12f6b85797e92d6bd6d1181418f927379fc9a17fabe5a9e9477e08f9', 7, 1, 'MyApp', '[]', 0, '2020-10-29 08:04:00', '2020-10-29 08:04:00', '2021-04-29 08:04:00'),
('ed5f050e6e0c5296417d610c158bcbc216a3394a38cc0fba0a07355f85b3483f18e936136dd4f948', 7, 1, 'MyApp', '[]', 0, '2020-10-26 10:17:14', '2020-10-26 10:17:14', '2021-04-26 10:17:14'),
('ed737162d4ccdadf67c381989d352090ae10408dbd0b43f622af6ec583e3bb06d5b40af1a61e26a4', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:37:35', '2020-10-30 06:37:35', '2021-04-30 06:37:35'),
('ed9ddf5fbd5440f0474279fa261a0b9b3d84c49d1643de607538fcb024bf4e32341bbeef41de75e2', 7, 1, 'MyApp', '[]', 0, '2020-10-22 06:14:28', '2020-10-22 06:14:28', '2021-04-22 06:14:28'),
('edd450b60710c50fc18d847416e1c6d13f4c48c06f58d3f8588595b97254c6899b97ecb5f0e1b221', 7, 1, 'MyApp', '[]', 0, '2020-10-27 13:24:45', '2020-10-27 13:24:45', '2021-04-27 13:24:45'),
('ee0f19e84ae3cf68958ebcee056d8b096ddd5f962fdce7c6f7b7f9cd86e8df0ddf50c293a1204979', 7, 1, 'MyApp', '[]', 0, '2020-11-26 11:56:02', '2020-11-26 11:56:02', '2021-05-26 11:56:02'),
('ee33948223ba41fd5eb029cf2810b6caec64a272a66568d9b3bb5b8754e15ce04528e830da755c35', 2, 1, 'MyApp', '[]', 0, '2020-10-08 05:50:08', '2020-10-08 05:50:08', '2021-04-08 05:50:08'),
('ee47ce77ac4ed71c5dacef09f6d128d6486199ac1e83cdabc45715f995e0f492fdbc057345fb36a6', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:16:57', '2020-10-29 07:16:57', '2021-04-29 07:16:57'),
('ee623726819c4ace20ae2b259f1c78be72a6a9e30ca31e9be8e4fc1fd751e0ce6af15abe1d7663ea', 4, 1, 'MyApp', '[]', 0, '2020-10-16 13:41:12', '2020-10-16 13:41:12', '2021-04-16 13:41:12'),
('ef0b58d0e2088608b6b1d8fd2719f664bc7e2f9740f3ed0ca1f0827de130999b4490831ce70f05a9', 4, 1, 'MyApp', '[]', 0, '2020-10-15 13:39:37', '2020-10-15 13:39:37', '2021-04-15 13:39:37'),
('ef20a252eabf1fe0beeea5f0095374134fe3055b27d822a9085b513003cad52f9d60441726a348d2', 8, 1, 'MyApp', '[]', 0, '2020-11-30 14:35:55', '2020-11-30 14:35:55', '2021-05-30 14:35:55'),
('ef23437ea6409eaab9cf35826cc1d8882ac0d846f3de563f8245f69414f21e26d964f33b0f7d1870', 5, 1, 'MyApp', '[]', 0, '2020-10-28 05:28:06', '2020-10-28 05:28:06', '2021-04-28 05:28:06'),
('ef4568287f3765ec6fabf16bafa622c2f506c8e9441848ae1bb91760632934e3e639a17172bde476', 7, 1, 'MyApp', '[]', 0, '2020-11-20 09:32:32', '2020-11-20 09:32:32', '2021-05-20 09:32:32'),
('ef886a4276c9590270312c006381c85ddadc3aabbb409c7a8cb73c81dd89b3bac53235331dd38e03', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:07:04', '2020-10-08 08:07:04', '2021-04-08 08:07:04'),
('efe87557f1b2671eda547717a57f417ba9eb1cc34bf98c4ca7a8e2316b080d8f477b44a93e59f2f2', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:31:28', '2020-10-29 06:31:28', '2021-04-29 06:31:28'),
('f01e2e04332fdf1faa53ff1569aba66f8ab1ed8ce77c9e7eef81bf2dfc2cd346c43222635c402c54', 7, 1, 'MyApp', '[]', 0, '2020-10-30 06:06:25', '2020-10-30 06:06:25', '2021-04-30 06:06:25'),
('f07df6fa394927f57a1d8af365bb8a82ec89a193ec5fa50b1250b15cb42ae66dec5e4d2771e53037', 7, 1, 'MyApp', '[]', 0, '2020-10-29 10:23:16', '2020-10-29 10:23:16', '2021-04-29 10:23:16'),
('f09b723f41e3df1b77b0912da0440d89cf80fb0137f91fa5620dbf33ccff65c655c75b2e0391d2d2', 7, 1, 'MyApp', '[]', 0, '2020-11-16 13:42:52', '2020-11-16 13:42:52', '2021-05-16 13:42:52'),
('f10012bf9540207f615c678ebd1dc01dbeea2d91f56e690985f4190fac5f3ad5938c8dff878a8f11', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:03:59', '2020-10-23 11:03:59', '2021-04-23 11:03:59'),
('f103d8c087f237f52f5c78c2ea09ecd5653f3f56d863ee02177b142c5707525e4e3f28db3ae2ab38', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:42:48', '2020-10-14 12:42:48', '2021-04-14 12:42:48'),
('f10a157558f436dd2914136018e0730b88fb99d6d8a93cec74545bd8617f8063ea5aac581dc0a714', 7, 1, 'MyApp', '[]', 0, '2020-10-29 06:01:17', '2020-10-29 06:01:17', '2021-04-29 06:01:17'),
('f11a6a21a977e5f27ced732ca3cfbf3c6d7659c01c7e0b3ddc7e0bddc5432e9c1e15d1f048cfd5cb', 7, 1, 'MyApp', '[]', 0, '2020-11-17 11:14:28', '2020-11-17 11:14:28', '2021-05-17 11:14:28'),
('f1c6e538112f2c8ee29e2fe24eb58aeea2b61b7b24419048ca2a17af95bf7a6e87e3df03ac6888f3', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:29:43', '2020-10-12 10:29:43', '2021-04-12 10:29:43'),
('f1c6f08229b049397ad621b3631b7c8a973e63ce63e21bc061a97b71146bceb0090c98f6e467a8f4', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:03:51', '2020-10-21 12:03:51', '2021-04-21 12:03:51'),
('f1f24df4954ced92580b0b1f7714cbdf9e5346ec627dd50b33fb4bd2d662e0cd3b7e48617a2054da', 4, 1, 'MyApp', '[]', 0, '2020-10-15 09:48:54', '2020-10-15 09:48:54', '2021-04-15 09:48:54'),
('f20c0bcc1c831dfe10f4db910229efdfaa382628b4fe954c788178178deeb681dc3b2e35ab2b9f9f', 4, 1, 'MyApp', '[]', 0, '2020-10-12 11:23:59', '2020-10-12 11:23:59', '2021-04-12 11:23:59'),
('f21074c717eb5a87152e2a0278e6cf5768ed199fdca2baefbb296c5dc1a89b919c0cb82e363d279d', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:42:55', '2020-10-29 07:42:55', '2021-04-29 07:42:55'),
('f212381bfd21a0f15d13e148f544f30ca21b8df836e0832150033b2026d3a4d734764720abb8f679', 5, 1, 'MyApp', '[]', 0, '2020-10-30 08:03:02', '2020-10-30 08:03:02', '2021-04-30 08:03:02'),
('f2827107848240066ea22af611bdcb15b7e3dfdad7de58a81d847b1805d274d0824557fb7a2c27d5', 4, 1, 'MyApp', '[]', 0, '2020-10-16 06:55:07', '2020-10-16 06:55:07', '2021-04-16 06:55:07'),
('f2a9c9bdced3e268a384f443b672dd9b0f0b8ba00cffab0dcd34b98ae7bb5e8c94aa0bb188b97088', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:49:06', '2020-10-06 11:49:06', '2021-04-06 11:49:06'),
('f2c6479fa49877743d13dd24db0726307a2a4a35a53315c94a0f34573c7bf87b7e2273b66c70897c', 7, 1, 'MyApp', '[]', 0, '2020-11-10 07:53:13', '2020-11-10 07:53:13', '2021-05-10 07:53:13'),
('f2d2afa61ad524defe28a82503c7b5e28971f88af917577c8ba6067f7b3d7e95447edb74c03deec4', 4, 1, 'MyApp', '[]', 0, '2020-10-12 08:22:24', '2020-10-12 08:22:24', '2021-04-12 08:22:24'),
('f2f80f2d8530a6331ebe824999b702005b4839abc28f22fcd99c08d71782af6b9e2d769fdb3a9081', 5, 1, 'MyApp', '[]', 0, '2020-12-09 16:32:32', '2020-12-09 16:32:32', '2021-06-09 16:32:32'),
('f3329aca332a91b8cdf5d008e5ce611422b97faa37265902be558e23f7072a11a6d7f249c41ef847', 7, 1, 'MyApp', '[]', 0, '2020-11-05 07:30:40', '2020-11-05 07:30:40', '2021-05-05 07:30:40'),
('f3758426de6482267baa1f89e3e5dd1a368d79ab88c5fc111ee2919f4c5cbeb5163eb6f6feeb944a', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:05:29', '2020-10-23 11:05:29', '2021-04-23 11:05:29'),
('f3a0c7070cd82d3ccba38aa3968e2455a93be60047de498869fcdd2399ef4eacfce1ebda769b0632', 5, 1, 'MyApp', '[]', 0, '2020-10-14 14:10:04', '2020-10-14 14:10:04', '2021-04-14 14:10:04'),
('f3d178b74ab521b73afb1daf5e12378149387dcafd3b152664917f68193df4b31776356e91fd86f3', 5, 1, 'MyApp', '[]', 0, '2020-11-02 13:24:30', '2020-11-02 13:24:30', '2021-05-02 13:24:30'),
('f3d714640b372354420c229c6993c7b0816d6f442d188a5d597f72b17f523d8adc6295e3bfc84a12', 7, 1, 'MyApp', '[]', 0, '2020-11-05 13:59:27', '2020-11-05 13:59:27', '2021-05-05 13:59:26'),
('f3e3c811e1cd5e94c9b76e57f2f3f1a13a7d4b3ad1bd3ac513f7439d603abcd37c8b80fb35c94565', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:44:47', '2020-11-06 07:44:47', '2021-05-06 07:44:47'),
('f3f933c602155c72f64efc673ecbe7bae77c18653907864a7833a52f6ee0e2982aefc616b6c2d8ff', 7, 1, 'MyApp', '[]', 0, '2020-11-20 12:10:19', '2020-11-20 12:10:19', '2021-05-20 12:10:19'),
('f4231dd8b2be5bfcc8568f4dfcdc448bf33db115158a2d93db50b80e7bed4e3628a8f9aa4352baf3', 4, 1, 'MyApp', '[]', 0, '2020-10-13 08:40:49', '2020-10-13 08:40:49', '2021-04-13 08:40:49'),
('f473dba72068c7c32922bb72f10a5ec7b508d7563fa6d800f337b1e264fee6661d81069a92e975a3', 9, 1, 'MyApp', '[]', 0, '2020-12-04 12:04:06', '2020-12-04 12:04:06', '2021-06-04 12:04:06'),
('f4a69bb739f89feb8497037b527a3dd0b51b872cc9bd41f5ad7f63d71e58b09f5cea01085c602e51', 4, 1, 'MyApp', '[]', 0, '2020-10-09 13:55:56', '2020-10-09 13:55:56', '2021-04-09 13:55:56'),
('f4add21503308aef2c9bc0dcef27507dd4e500eae3ee1e22ba6f33b264f24595de49b31776ad2265', 7, 1, 'MyApp', '[]', 0, '2020-11-03 13:47:43', '2020-11-03 13:47:43', '2021-05-03 13:47:43'),
('f4bfd94c65687587a3222b75e7d450aa6712e9e86ebcbbf088a25a32080eb969fba6d6da81f9bf4b', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:46:50', '2020-10-12 10:46:50', '2021-04-12 10:46:50'),
('f4e397b9b2b398266219bfc950b11fa6d9cae6b8482fcb603242ab4d8dce867893c7d9bdb80c909d', 7, 1, 'MyApp', '[]', 0, '2020-10-23 11:57:10', '2020-10-23 11:57:10', '2021-04-23 11:57:09'),
('f51a7a86272eae7a491a8bc9eedad740baf5b65ddcfe821dfd7d427b3f1824cdb08e4ef0cb51b9cb', 2, 1, 'MyApp', '[]', 0, '2020-10-06 13:49:12', '2020-10-06 13:49:12', '2021-04-06 13:49:12'),
('f5473f5ee5c9cd17bc19aad595125936ed948900e4f5aaa982eba4243149fd21f1e765bec1b73d85', 7, 1, 'MyApp', '[]', 0, '2020-10-22 11:42:12', '2020-10-22 11:42:12', '2021-04-22 11:42:11'),
('f56a400ac15196b8061ad9ea9761e5e60d2e1d2ef6b7d41b402932b8484c413a3159900b1533852b', 7, 1, 'MyApp', '[]', 0, '2020-11-06 12:43:43', '2020-11-06 12:43:43', '2021-05-06 12:43:42'),
('f56c1b8bcd797e086c897c8172371ea347e22143f2fccb8d5d658f5d4357d8f8a4f138b02455a6a5', 7, 1, 'MyApp', '[]', 0, '2020-11-13 13:59:40', '2020-11-13 13:59:40', '2021-05-13 13:59:40'),
('f5800eac998f88309f047c7ed4c2f71185926bb59d3dd370deb7d722bbe3de7953fcfab652de26ca', 4, 1, 'MyApp', '[]', 0, '2020-10-09 05:47:52', '2020-10-09 05:47:52', '2021-04-09 05:47:52'),
('f6358c75b3a0d0819f92a314b7c60fb06fd47eb29d0d22896266847fbbd2cee70c179a5fdd41f5be', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:52:22', '2020-10-13 05:52:22', '2021-04-13 05:52:22'),
('f7a177058d44b730b779f79d66bd713d81a64db82e013598d264182e6b8a0ceafc1cf2959eb1cf8f', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:23:54', '2020-10-29 07:23:54', '2021-04-29 07:23:54');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('f8db7fff63ce81d53da3be51f63800b0e8655856792b6768dd740e072c69a8148d161f7735a9bbd6', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:29:07', '2020-10-21 12:29:07', '2021-04-21 12:29:07'),
('f8f0a3ae1154ecca79e04e1bdaa4ad20e17f7c3f160d422b5e4a0293b3ed0c20bd7f5b490740685d', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:24:36', '2020-10-21 12:24:36', '2021-04-21 12:24:36'),
('f8fb4e796f07177ea5ecf24da126f911053c62490e92b7e4cd5cb766915eefc18cb9dd62d78e0d6a', 7, 1, 'MyApp', '[]', 0, '2020-10-29 07:32:00', '2020-10-29 07:32:00', '2021-04-29 07:32:00'),
('f91e3d914e754f50aa1a4b6ed3bad35c410016d357c8aea48fb630967071814cf3d24dc9e2f93b78', 4, 1, 'MyApp', '[]', 0, '2020-10-09 08:08:16', '2020-10-09 08:08:16', '2021-04-09 08:08:16'),
('f929933dca1dd9ae77d4b664dc36c530127cefe062958fb0214d1102c056d17f49eed5b5c47f109b', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:57:15', '2020-10-14 12:57:15', '2021-04-14 12:57:15'),
('f9b3d3fbd624d2eae5219673bd87f4b78ad0d008c81db5cadd6a28b8d55d496cc77499adf585832a', 7, 1, 'MyApp', '[]', 0, '2020-10-27 08:23:07', '2020-10-27 08:23:07', '2021-04-27 08:23:07'),
('fa03590f3234a9a710a48a6151eb048e45b3f54dc32032100123e845005d4e0c525b732a9cbff4bc', 1, 1, 'MyApp', '[]', 0, '2020-10-01 07:37:24', '2020-10-01 07:37:24', '2021-04-01 07:37:24'),
('fa10183eb870e29b4ac4cfd30664aaaf1673f8576be0e92a3b1384864445c1351a490eb1892364d4', 5, 1, 'MyApp', '[]', 0, '2020-10-23 12:26:15', '2020-10-23 12:26:15', '2021-04-23 12:26:15'),
('fa976f8663e2fd902bb02b50dde1f092f94574c2a9f3deb52bda6e42adb55043ea9753980d118b81', 4, 1, 'MyApp', '[]', 0, '2020-10-13 13:07:49', '2020-10-13 13:07:49', '2021-04-13 13:07:49'),
('faabe38faa8a1dabaa9db2edf882e55db93bdf49db3ee1fdd926def1907b7be14662dbff366f6b93', 4, 1, 'MyApp', '[]', 0, '2020-10-12 10:45:45', '2020-10-12 10:45:45', '2021-04-12 10:45:45'),
('faf19c83337c27fa344a0536f10a7da3093d57ba70809509b930dd066fb2c6b9d7057c799401e45e', 4, 1, 'MyApp', '[]', 0, '2020-10-09 12:55:09', '2020-10-09 12:55:09', '2021-04-09 12:55:09'),
('fb20a155435850319299c0285fd12ec3ec0c5c644966e9bb9a468a14346cffaa5ffcdc5de9237019', 4, 1, 'MyApp', '[]', 0, '2020-10-13 12:55:53', '2020-10-13 12:55:53', '2021-04-13 12:55:53'),
('fb2c4dc6f3d16045d924872536a4cde097b6ee694bfa79e9ef3be55df17e7e2eddd942f0e0a0843b', 7, 1, 'MyApp', '[]', 0, '2020-10-26 13:45:45', '2020-10-26 13:45:45', '2021-04-26 13:45:45'),
('fb585edc0975bd36a08f726a29cba6f150568ff7ad8c6562d63592e318c6fd8539046f96a7a7114e', 4, 1, 'MyApp', '[]', 0, '2020-10-14 12:16:35', '2020-10-14 12:16:35', '2021-04-14 12:16:35'),
('fbdbb828e80498fe725583aff82649efa0edf06ebf6bc719b5f297819e03e52aa55d46d037af08be', 2, 1, 'MyApp', '[]', 0, '2020-10-06 11:13:13', '2020-10-06 11:13:13', '2021-04-06 11:13:13'),
('fbeddf8de86ec496fd7b542e598810280db3fc8ce84e35f3c9cb5d10629f905bf3b582d5f5accf45', 7, 1, 'MyApp', '[]', 0, '2020-11-06 07:47:55', '2020-11-06 07:47:55', '2021-05-06 07:47:55'),
('fc19e9d89b55d3bd6afa3e9b5a618084ca03a402b6f0e426551c20c09d58637c8e3b000ee280dc3b', 4, 1, 'MyApp', '[]', 0, '2020-10-15 08:04:17', '2020-10-15 08:04:17', '2021-04-15 08:04:17'),
('fc2d6ac50aa7161854c52be9b5e6a7e4c5c90a52902a54933cfc2a8fe860bd979b5168a9681f3f79', 7, 1, 'MyApp', '[]', 0, '2020-11-04 09:57:44', '2020-11-04 09:57:44', '2021-05-04 09:57:44'),
('fd0a7732ff9e5906b004d08d33052409eb21d954ee7a5e79ad54116452e1ccb0b73448d5ae5c57ed', 4, 1, 'MyApp', '[]', 0, '2020-10-16 13:54:06', '2020-10-16 13:54:06', '2021-04-16 13:54:06'),
('fd171ab77eec8da74fa9d9e89679d0e230f138fd0ec2b8889cc1fe433f5d39e4d297d60a6ece80dd', 7, 1, 'MyApp', '[]', 0, '2020-10-21 12:11:16', '2020-10-21 12:11:16', '2021-04-21 12:11:16'),
('fe219d2af5d989562b007b019948c03f6011c57f7e4dcbf88d8d06b4ebe33c68138de01f8f11ff71', 4, 1, 'MyApp', '[]', 0, '2020-10-13 05:48:31', '2020-10-13 05:48:31', '2021-04-13 05:48:31'),
('fea3d3331601f16feec21bf3ea13aa6dfa872d258bda6a85dbed4bce021dd1582520497d053f2542', 2, 1, 'MyApp', '[]', 0, '2020-10-07 06:37:51', '2020-10-07 06:37:51', '2021-04-07 06:37:51'),
('ff62e59d6fbf39923075f137b8957ef2d0f5ac20e0757c55d77554ecdb71e139bcf8edf26db8f454', 2, 1, 'MyApp', '[]', 0, '2020-10-08 08:21:59', '2020-10-08 08:21:59', '2021-04-08 08:21:59'),
('ff79c1bbf3debd1cdf11bf0c68e1534d169653b74affea47a65c07e382d63d5eac256c223fe5bd59', 5, 1, 'MyApp', '[]', 0, '2020-11-26 07:37:24', '2020-11-26 07:37:24', '2021-05-26 07:37:24'),
('ffa8375bbf2f5fc4d49b52a9420905811a68972d9ba74e05d1be6854884dd28e241b6059d2d6505a', 4, 1, 'MyApp', '[]', 0, '2020-10-14 07:05:42', '2020-10-14 07:05:42', '2021-04-14 07:05:42'),
('ffdecfe9b37c89b109e551b1b3bf9172b0faabbb6dea9f2bc8f54f5e88ab6f8efc5adb3f972f68d5', 4, 1, 'MyApp', '[]', 0, '2020-10-15 11:02:57', '2020-10-15 11:02:57', '2021-04-15 11:02:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Vocab Personal Access Client', 'vD53Hys6JjLzjsDpADXmw4quhgm8MhG7RB7bXB8h', NULL, 'http://localhost', 1, 0, 0, '2020-09-29 08:00:30', '2020-09-29 08:00:30'),
(2, NULL, 'Vocab Password Grant Client', '9sXsNIJ4yfOtWfkG4QHuCacDVKKEeSPIcsttE7NW', 'users', 'http://localhost', 0, 1, 0, '2020-09-29 08:00:33', '2020-09-29 08:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-09-29 08:00:32', '2020-09-29 08:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `options_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `category_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'help', 'Do you have questions suggestions or claims?', '2020-10-14 08:38:20', '2020-10-14 08:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', 'GmuESt', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phrases`
--

DROP TABLE IF EXISTS `phrases`;
CREATE TABLE IF NOT EXISTS `phrases` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phrase_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phrase_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eg_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phrases_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phrases`
--

INSERT INTO `phrases` (`id`, `category_id`, `phrase_en`, `record_en`, `phrase_es`, `record_es`, `image`, `eg_link`, `visible`, `created_at`, `updated_at`) VALUES
(3, 51, 'girl', '1603260563en-file_example_MP3_700KB.mp3', 'giiiiiirl', '1603260563es-file_example_MP3_700KB.mp3', '1603260563-ph.jpg', 'dfhfghfghfghfghfghfghfgh', 1, '2020-10-21 06:09:23', '2020-10-21 06:09:23'),
(4, 51, 'aaaaaa', '1603260665en-file_example_MP3_700KB.mp3', 'aaaaaaaaa', '1603260665es-file_example_MP3_700KB.mp3', '1603260665-ph.jpg', 'fghfghfghfghfghfghfghfgh', 1, '2020-10-21 06:11:05', '2020-09-21 06:11:05'),
(13, 81, 'ljhgfd', '1608210163en-Abraham.mp3/1608210163en-Adam.mp3/1608210163en-Adan.mp3/1608210163en-Aden.mp3/1608210163en-Adrians.mp3', 'dfgdfgdfgfdg', '1608210163es-Adrien.mp3/1608210163es-Ahmad.mp3/1608210163es-Ahmed.mp3/1608210163es-Aiden.mp3', 'arrowhurry.jpg', 'sfsdf', 1, '2020-12-17 09:02:43', '2020-12-17 09:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
CREATE TABLE IF NOT EXISTS `stories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `story_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `story_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eg_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `current_state` enum('learning','learned','default') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stories_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `category_id`, `story_en`, `record_en`, `story_es`, `record_es`, `sub_title_en`, `sub_title_es`, `description_en`, `description_es`, `image`, `eg_link`, `visible`, `current_state`, `created_at`, `updated_at`) VALUES
(2, 70, 'Even though', '1606387993en-y2mate.com - How Bill Gates reads books.mp3', 'Even sp', '1606387993es-Burito_Comedy_Club_Cover_-_Po_volnam.mp3', 'Even though', 'This ancient', 'Even though Israel is a small country it is always in the news.  The news continues to report on Jews moving to Israel, on the technology invented there, but also on conflict, wars and tensio', 'This ancient man is Abraham (also known as Abram).  We can take his story seriously because the places and cities he visited are mentioned in other old writings.', '1606307905-nat12.jpg', 'fghfsdfsdfsdfsdfsdfsdfghfgh', 1, 'default', '2020-11-25 12:38:25', '2020-11-26 10:53:13'),
(3, 70, 'sdadasdasdasdasd', '1606308688en-7.mp3', 'asdasdasdasdasdasd', '1606308688es-11.mp3', 'asdasdasdasdasd', 'asdasdasd', 'asdasdas asd as dasd as das das asdasdasdas as dasdas dsdsd sd sdsd  sd sd dsdasd', 'asdasdas asd as dasd as das das asdasdasdas as dasdas dsdsd sd sdsd  sd sd dsdasd', '1606308688-nat6.jpg', 'asdasdasdasd', 1, 'default', '2020-11-25 12:51:28', '2020-11-25 12:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `studied`
--

DROP TABLE IF EXISTS `studied`;
CREATE TABLE IF NOT EXISTS `studied` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `studied_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studied_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studied`
--

INSERT INTO `studied` (`id`, `studied_id`, `type`, `percent`, `created_at`, `updated_at`, `user_id`) VALUES
(52, 17, 'words', '0.00', '2020-12-10 17:40:29', '2020-12-10 17:40:29', 5),
(51, 15, 'words', '0.00', '2020-12-10 17:40:23', '2020-12-10 17:40:23', 5),
(50, 23, 'words', '0.00', '2020-12-08 15:45:33', '2020-12-08 15:45:33', 5),
(49, 22, 'words', '0.00', '2020-12-08 15:44:43', '2020-12-08 15:44:43', 5),
(48, 21, 'words', '0.00', '2020-12-08 15:44:34', '2020-12-08 15:44:34', 5),
(47, 20, 'words', '0.00', '2020-12-08 15:43:56', '2020-12-08 15:43:56', 5),
(46, 31, 'words', '0.00', '2020-12-08 15:41:02', '2020-12-08 15:41:11', 5),
(44, 18, 'words', '80.00', '2020-12-04 11:50:22', '2020-12-04 11:50:22', 8),
(43, 17, 'words', '40.00', '2020-12-04 11:50:19', '2020-12-04 11:50:19', 8),
(42, 12, 'words', '0.00', '2020-12-04 09:24:20', '2020-12-04 09:24:20', 8),
(41, 4, 'phrases', '60.00', '2020-12-02 05:43:17', '2020-12-05 16:44:37', 5),
(45, 30, 'words', '0.00', '2020-12-08 15:37:55', '2020-12-10 16:29:34', 5),
(39, 16, 'words', '0.00', '2020-11-26 08:08:17', '2020-12-10 17:40:46', 5),
(38, 24, 'words', '80.00', '2020-11-12 12:32:54', '2020-11-12 12:32:54', 7),
(37, 20, 'words', '90.00', '2020-11-12 12:31:23', '2020-11-12 12:31:23', 7),
(53, 18, 'words', '0.00', '2020-12-10 17:40:35', '2020-12-10 17:40:35', 5),
(54, 12, 'words', '0.00', '2020-12-10 17:42:39', '2020-12-10 17:42:39', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, 'Don', 'admin@admin.com', NULL, '$2y$10$6C15ep/jJwjaVA2yLVmTF.LbvGo6Oq18zrmRJKDc1.BVEqkQm70GC', NULL, '2020-07-30 16:38:32', '2020-10-06 13:15:36', '1.jpg'),
(2, 'userr', 'user@gmail.com', NULL, '$2y$10$JNPGKqHoZWKO9L02sv4w9uv.0KX/HmAqd.VtSA.yXY8lb14fbbXz2', NULL, '2020-10-06 06:13:18', '2020-10-07 06:44:13', '5f7d63bd8119a.jpg'),
(3, 'Eeee', 'test@gmail.com', NULL, '$2y$10$YVz43sNlykNoRftE.4cImej3gETJ3cfi8Ao20hhiyUW8VSFtu247m', NULL, '2020-10-07 14:18:58', '2020-10-07 14:18:58', NULL),
(4, 'James', 'kit@gmail.com', NULL, '$2y$10$EGJMLo1rSl.I4bboCXahA.GmS1NMZe9dccqsh.nURdXDPF0UjxiCu', NULL, '2020-10-07 14:20:33', '2020-10-14 19:34:00', '5f8752a889753.jpg'),
(5, 'Javier', 'javierdonaire@gmail.com', NULL, '$2y$10$nFz5W96qcmR3D8QVTW23duRtcrjkqpExWDLZObB32kBkkDoXEkLta', NULL, '2020-10-08 13:37:51', '2020-10-08 13:37:51', NULL),
(6, 'Av', 'ilovecoding777@gmail.com', NULL, '$2y$10$S2ZFPsXvgO.wlBQZtUsaWO.Znq4agkWmdMtAv.J4plTu37klUMaki', NULL, '2020-10-11 08:39:02', '2020-10-11 08:39:02', NULL),
(7, 'david', 'user10@gmail.com', NULL, '$2y$10$GZg5q96HVI3O3NW31NUDpejk4LyVaQkP6k1iNo3LJK8r/u.5ZuZii', NULL, '2020-10-15 08:09:38', '2020-11-06 11:30:55', '5fa533ef99416.jpg'),
(8, 'sadsadsad', 'qwerty@gmail.com', NULL, '$2y$10$R1BJQleTIRCvR1N5wnbRm.xCz/F6S0l9I5m.TxYNFLCwrDpP.47VW', NULL, '2020-11-30 14:35:36', '2020-11-30 14:35:36', NULL),
(9, 'Rrrrr', 'user11@gmail.com', NULL, '$2y$10$WY/g0dBHrxdr86DTDDzyZ.DLBPrP3SMWkKuLx7d9jPw9K9hCHayuy', NULL, '2020-12-04 12:04:06', '2020-12-04 12:04:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_conversations`
--

DROP TABLE IF EXISTS `user_conversations`;
CREATE TABLE IF NOT EXISTS `user_conversations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_es` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_conversations_conversation_id_foreign` (`conversation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_conversations`
--

INSERT INTO `user_conversations` (`id`, `conversation_id`, `user`, `text_en`, `text_es`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tracy', 'dfgdfffffffffffffffffff', 'tttttttttttttttttttttttttttt', '2020-11-16 07:45:19', '2020-11-16 07:46:43'),
(3, 1, 'Javi', 'refdgdfgdfg', 'dfgfdfgdfgdfgfdg', '2020-11-16 07:46:23', '2020-11-16 07:46:23'),
(4, 1, 'Tracy', 'dfgdfgdfgdfgdfgdfg', 'dfgdfgfdgdfgfdggfgfdgfdgdfg', '2020-11-16 07:46:32', '2020-11-16 07:46:32'),
(5, 2, 'Tracy', 'asdasdasd', 'asdasdasdasdasd', '2020-11-16 11:15:06', '2020-11-16 11:15:06'),
(6, 2, 'Tracy', 'gfdhfghfghfghfghfghfgh', 'fghfghfghfghfgh', '2020-11-16 11:17:48', '2020-11-16 11:17:48'),
(7, 2, 'Javi', 'ghghgh', 'ghghghgh', '2020-11-16 11:17:54', '2020-11-16 11:17:54'),
(8, 2, 'Javi', 'fghfghfgh', 'sdfsdfsdfsdf', '2020-11-16 11:18:01', '2020-11-16 11:18:01'),
(9, 4, 'Javi', 'These are short, famous texts in English from classic sources like the Bible or Shakespeare. Some texts have word definitions and explanations to help you. Some of these texts are written in an old style of English. Try to understand them, because the English that we speak today is based on what our great, great, great, great grandparents spoke before! Of course, not all these texts were originally written in English. The Bible, for example, is a translation. But they are all well known in English today, and many of them express beautiful thoughts.', 'These are short, famous texts in English from classic sources like the Bible or Shakespeare. Some texts have word definitions and explanations to help you. Some of these texts are written in an old style of English. Try to understand them, because the English that we speak today is based on what our great, great, great, great grandparents spoke before! Of course, not all these texts were originally written in English. The Bible, for example, is a translation. But they are all well known in English today, and many of them express beautiful thoughts.', '2020-11-16 12:44:04', '2020-11-16 12:44:04'),
(10, 4, 'Tracy', 'physical location, or even office, no paid staff or editors, but books in the Original Series are published in the first place to satisfy subscriptions paid by individuals or institutions. This means that there is need for a regular sequence of new editions, normally one or two per year; achieving that sequence can pose problems for the Editorial Secretary, who may have too few or too many texts ready for publication at any one time', 'physical location, or even office, no paid staff or editors, but books in the Original Series are published in the first place to satisfy subscriptions paid by individuals or institutions. This means that there is need for a regular sequence of new editions, normally one or two per year; achieving that sequence can pose problems for the Editorial Secretary, who may have too few or too many texts ready for publication at any one time', '2020-11-16 12:44:33', '2020-11-16 12:44:33'),
(11, 5, 'Javi', 'These are short, famous texts in English from classic sources like the Bible or Shakespeare. Some texts have word definitions and explanations to help you.', 'Un texto del contenido del archivo, como el texto de un documento de procesamiento de texto, coincide con el término de búsqueda o empieza', '2020-11-16 12:58:38', '2020-11-16 12:58:38'),
(12, 5, 'Tracy', 'These are short, famous texts in English from classic sources like the Bible or Shakespeare. Some texts have word definitions and explanations to help you.', 'Un texto del contenido del archivo, como el texto de un documento de procesamiento de texto, coincide con el término de búsqueda o empieza', '2020-11-16 12:58:57', '2020-11-16 12:58:57'),
(13, 6, 'Javi', 'ytjghjghjghj', 'ghjghjghjghj', '2020-12-01 08:51:38', '2020-12-01 08:51:38'),
(14, 7, 'Javi', 'gfrhfghfgh', 'gfhfghfgh', '2020-12-01 13:08:06', '2020-12-01 13:08:06'),
(15, 7, 'Javi', 'fghfghfgh', 'fghfghgfh', '2020-12-01 13:08:12', '2020-12-01 13:08:12'),
(16, 7, 'Tracy', 'fghfghfgh', 'fghfghfgh', '2020-12-01 13:08:18', '2020-12-01 13:08:18'),
(17, 8, 'Javi', 'Even though Israel is a small country it is always in the news.  The news continues to report on Jews moving to Israel, on the technology invented there, but also on conflict, wars and tensions with surrounding people.', 'The short articles and everyday conversations are designed by experienced teachers to help beginning students feel challenged and successfu', '2020-12-04 09:14:52', '2020-12-04 09:14:52'),
(18, 8, 'Tracy', 'Even though Israel is a small country it is always in the news.  The news continues to report on Jews moving to Israel, on the technology invented there, but also on conflict, wars and tensions with surrounding people.', 'The short articles and everyday conversations are designed by experienced teachers to help beginning students feel challenged and successfu', '2020-12-04 09:15:03', '2020-12-04 09:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
CREATE TABLE IF NOT EXISTS `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no action',
  `views_count` int(11) NOT NULL DEFAULT '0',
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_notifications_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `type`, `views_count`, `extra`, `created_at`, `updated_at`) VALUES
(5, 2, 'news', 4, NULL, '2020-10-07 10:14:11', '2020-10-07 10:25:30'),
(4, 1, 'news', 3, NULL, '2020-10-07 10:11:37', '2020-10-07 10:11:37'),
(6, 4, 'news', 4, NULL, '2020-10-07 14:21:03', '2020-10-07 14:21:03'),
(7, 5, 'news', 4, NULL, '2020-10-08 13:39:17', '2020-10-08 13:39:17'),
(8, 6, 'news', 4, NULL, '2020-10-11 08:45:48', '2020-10-11 08:45:48'),
(9, 7, 'news', 4, NULL, '2020-10-21 10:44:59', '2020-10-21 10:44:59'),
(10, 8, 'news', 4, NULL, '2020-12-01 12:29:28', '2020-12-01 12:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `verbs`
--

DROP TABLE IF EXISTS `verbs`;
CREATE TABLE IF NOT EXISTS `verbs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `verb_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verb_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eg_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verbs_category_id_foreign` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
CREATE TABLE IF NOT EXISTS `words` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `word_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `word_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_es` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eg_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `words_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `category_id`, `word_en`, `record_en`, `word_es`, `record_es`, `image`, `eg_link`, `visible`, `created_at`, `updated_at`) VALUES
(12, 37, 'soccer', '1602240767en-Burito_Comedy_Club_Cover_-_Po_volnam.mp3', 'fútbol', '1602240767es-Burito_Comedy_Club_Cover_-_Po_volnam.mp3', '1602230148-download.jpg', 'games', 1, '2020-08-24 05:00:56', '2020-10-22 07:46:59'),
(13, 37, 'eight', '1600924918en-1-audioMessage.mp3', 'ocho', '1600924918es-1-audioMessage.mp3', '1602231062-slider_puffin_before_mobile.jpg', 'bola billar', 1, '2020-09-24 05:21:58', '2020-10-22 07:45:47'),
(15, 37, 'wwww', '1602577086en-file_example_MP3_700KB.mp3', 'eeeee', '1602577086es-file_example_MP3_700KB.mp3', '1602577086-rm.jpg', 'asdasdsad', 1, '2020-10-13 08:18:06', '2020-10-22 07:45:47'),
(16, 37, 'car', '1602664853en-file_example_MP3_700KB.mp3', 'care', '1602664853es-file_example_MP3_700KB.mp3', '1602664853-105796174-1552653879432gettyimages-1130590361r.jpg', 'fgfdgdfgdfgdfgdfg', 1, '2020-10-14 08:40:53', '2020-10-22 07:45:47'),
(17, 37, 'beer', '1602664888en-file_example_MP3_700KB.mp3', 'beere', '1602664888es-file_example_MP3_700KB.mp3', '1602664888-Beer-in-China.jpg', 'fdgfdhfghfgh', 1, '2020-10-14 08:41:28', '2020-10-22 07:51:59'),
(18, 37, 'apppleeee', '1602664942en-file_example_MP3_700KB.mp3', 'apple', '1602664942es-file_example_MP3_700KB.mp3', '1602664942-apple.png', 'sdfsdfsdf', 1, '2020-10-14 08:42:22', '2020-10-22 07:45:47'),
(19, 52, 'fgbhfghbnfg', '1603260822en-file_example_MP3_700KB.mp3', 'fghfghfghfgh', '1603260822es-file_example_MP3_700KB.mp3', '1603260822-ph.jpg', 'fghfghfghfghfgh', 1, '2020-10-21 06:13:42', '2020-10-10 06:13:42'),
(20, 60, 'aaaaa', '1604575358en-1.mp3', 'aaaaaaaa', '1604575358es-1.mp3', '1604575358-nat.jpeg', 'asdasdasdad', 1, '2020-11-05 11:22:38', '2020-11-05 11:22:38'),
(21, 60, 'bbbb', '1604575474en-2.mp3', 'bbbbb', '1604575474es-2.mp3', '1604575474-nat2.jpg', 'dsfsdfsdfdsf', 1, '2020-11-05 11:24:34', '2020-11-05 11:24:34'),
(22, 60, 'cccc', '1604575496en-3.mp3', 'ccccc', '1604575496es-3.mp3', '1604575496-nat4.jpg', 'sdfsdfdsfd', 1, '2020-11-05 11:24:56', '2020-11-05 11:24:56'),
(23, 60, 'eeeee', '1604575587en-5.mp3', 'eeeeeeeeee', '1604575587es-5.mp3', '1604575587-nat6.jpg', 'fdgdfgdfg', 1, '2020-11-05 11:26:27', '2020-11-05 11:26:27'),
(24, 60, 'ffffff', '1604575651en-6.mp3', 'fff', '1604575651es-6.mp3', '1604575651-nat7.jpg', 'fghfghfgh', 1, '2020-11-05 11:27:31', '2020-11-05 11:27:31'),
(25, 60, 'gggg', '1604575751en-8.mp3', 'gggggg', '1604575751es-8.mp3', '1604575751-nat8.jpg', 'ghjghjghj', 1, '2020-11-05 11:29:11', '2020-11-05 11:29:11'),
(26, 60, 'hhhh', '1604575796en-9.mp3', 'hhhhh', '1604575796es-9.mp3', '1604575796-nat11.jpg', 'dfgfdgdfg', 1, '2020-11-05 11:29:56', '2020-11-05 11:29:56'),
(27, 60, 'jjjjj', '1604575825en-10.mp3', 'jjjjjjj', '1604575825es-10.mp3', '1604575825-nat12.jpg', 'fdgdfgfdg', 1, '2020-11-05 11:30:25', '2020-11-05 11:30:25'),
(28, 60, 'iiii', '1604575862en-11.mp3', 'iiiiiiiii', '1604575862es-11.mp3', '1604575862-nat.jpeg', 'ghjghjghjhgj', 1, '2020-11-05 11:31:02', '2020-11-05 11:31:02'),
(29, 60, 'kkkk', '1604575943en-7.mp3', 'kkkkk', '1604575943es-7.mp3', '1604575943-nat7.jpg', 'hjkhjkhjkjhk', 1, '2020-11-05 11:32:23', '2020-11-05 11:32:23'),
(30, 76, 'new new', '1606812424en-6.mp3', 'neeeeeeeeeeeeeeeeeeeeew', '1606812424es-file_example_MP3_700KB.mp3', '1606812424-nat8.jpg', 'sdfsdfsdfsdfsdfsdfsdfs', 1, '2020-12-01 08:47:04', '2020-12-01 08:47:04'),
(31, 76, 'asdasdsad', '1606824950en-7.mp3', 'asdasdasd', '1606824950es-8.mp3', '1606824950-download.jpg', 'asdasdasdasdasd', 1, '2020-12-01 12:15:50', '2020-12-01 12:15:50');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flashcards`
--
ALTER TABLE `flashcards`
  ADD CONSTRAINT `flashcards_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `flashcard_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flashcards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flashcard_groups`
--
ALTER TABLE `flashcard_groups`
  ADD CONSTRAINT `flashcard_groups_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `flashcard_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `flashcard_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `phrases`
--
ALTER TABLE `phrases`
  ADD CONSTRAINT `phrases_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verbs`
--
ALTER TABLE `verbs`
  ADD CONSTRAINT `verbs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
