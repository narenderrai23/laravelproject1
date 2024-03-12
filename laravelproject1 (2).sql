-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2024 at 01:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelproject1`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `head` varchar(100) NOT NULL,
  `category` enum('authorized','training','learning') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `joining_date` date NOT NULL,
  `till_date` date NOT NULL,
  `address` text NOT NULL,
  `c_address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_otp` int(11) DEFAULT NULL,
  `reset_otp_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `city_id`, `code`, `name`, `head`, `category`, `phone`, `joining_date`, `till_date`, `address`, `c_address`, `email`, `password`, `reset_otp`, `reset_otp_timestamp`, `created_at`, `updated_at`) VALUES
(1, 4, 'RON20240311001', 'Kimberley Rivas', 'Karyn Kennedy', 'learning', '5743061698', '2024-04-02', '2027-04-02', 'Recusandae Cillum d', 'Fugit ut quia repre333', 'mode@gmail.com33', '$2y$12$9mQKaIbB5mgctOpnmvC4TuJAjq5OPLPV/gCHXubRRg9tMPj9wyRo2', NULL, '2024-03-11 12:24:42', '2024-03-11 06:54:42', '2024-03-12 01:33:48'),
(2, 4, 'BHA20240312002', 'Alice Garza', 'Mikayla Rowland', 'authorized', '3835118454', '2024-03-12', '2027-03-12', 'Est perspiciatis a', 'Vel voluptatem aut n', 'tenu@gmail.com', '$2y$12$uCM5YSoqC97NO5poVldau.AGGW.133fCi.voO4Eo8myFFUAC4Ygoe', NULL, '2024-03-12 05:19:46', '2024-03-11 23:49:46', '2024-03-12 01:33:16'),
(3, 4, 'RON20240312003', 'Josephine Garrett1', 'Courtney May1', 'training', '4145097161', '2024-03-21', '2027-03-21', 'Consectetur porro co1', 'Sint vel aliquam qua1', 'vefumu@gmail.com1', '$2y$12$8mcF1n/mHBNcQ.zkCIeFjuxwyVOvKwJPmBh3ZsDXrgVAURPknGHLS', NULL, '2024-03-12 05:41:45', '2024-03-12 00:11:45', '2024-03-12 01:31:45'),
(4, 4, 'RON20240312004', 'asdasd', 'asda', 'training', '2321312312', '2024-03-12', '2027-03-12', '123123', '123123', 'jupame@mailinator.com', '$2y$12$T/QOps9y/atCP2Du6Ws./eRJCgCXS0IvHnq55B5m0N/ZpmNWDGTbG', NULL, '2024-03-12 06:50:02', '2024-03-12 01:20:02', '2024-03-12 01:20:02'),
(5, 1, 'BHA20240312005', 'Jasmine Rogers', 'Xyla Rich', 'authorized', '1611313684', '2024-03-12', '2027-03-12', 'Nostrum ullamco sint', 'Aut minim voluptatum', 'diwexesup@gmail.com', '$2y$12$0shc1Dpl7K4nLQYK3NR.B.d6t6NZRBUpTBDoN0OVYSszywXkqbDJu', NULL, '2024-03-12 07:05:40', '2024-03-12 01:35:40', '2024-03-12 01:35:40'),
(6, 2, 'KOP20240312006', 'Silas Delgado', 'Nyssa Jacobson', 'authorized', '7329543675', '2024-03-15', '2027-03-15', 'Assumenda cupidatat', 'Et voluptate aut ex', 'cohyqa@gmail.com', 'Pa$$w0rd!', NULL, '2024-03-12 07:06:09', '2024-03-12 01:36:09', '2024-03-12 01:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Programming & Web Designing', '2024-03-11 01:17:43', '2024-03-11 01:17:43'),
(2, 'Vocational', '2024-03-11 01:17:51', '2024-03-11 01:17:51'),
(3, 'Hardware & Networking', '2024-03-11 01:17:55', '2024-03-11 01:17:55'),
(4, 'Computer Application', '2024-03-11 01:18:01', '2024-03-11 01:18:01'),
(5, 'Financial Accounting', '2024-03-11 01:18:06', '2024-03-11 01:18:06'),
(6, 'Multi-media And Graphic Design', '2024-03-11 01:18:11', '2024-03-11 01:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `code`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Bahadrabad', 'BHA', 4, '2024-03-11 01:15:11', '2024-03-11 05:24:52'),
(2, 'Kopa', 'KOP', 4, '2024-03-11 01:15:56', '2024-03-11 01:15:56'),
(3, 'New Arya Nagar', 'NEA', 34, '2024-03-11 01:16:14', '2024-03-11 01:16:14'),
(4, 'Rongpur', 'RON', 3, '2024-03-11 01:16:28', '2024-03-11 01:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `course_duration` int(11) NOT NULL,
  `duration_time` enum('Days','Months','Year') NOT NULL,
  `total_fee` decimal(10,2) DEFAULT NULL,
  `eligibility` varchar(255) DEFAULT NULL,
  `other_details` text DEFAULT NULL,
  `course_type` enum('Career Programs','Professional Course','Short-Term Programs') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `category_id`, `code`, `course_duration`, `duration_time`, `total_fee`, `eligibility`, `other_details`, `course_type`, `created_at`, `updated_at`) VALUES
(2, 'Diploma in Computer Application', 4, 'DCA', 6, 'Months', 5000.00, '10+2 ', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(3, 'Advance Diploma in Computer Application', 4, 'ADCA', 12, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(4, 'Diploma in Information Technology', 4, 'DIT', 12, 'Months', 12000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(5, 'Certificate in Desktop Publishing ', 6, 'CDP', 6, 'Months', 6000.00, '10th above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(6, 'Complete Accounting Package', 5, 'CAP', 3, 'Months', 3500.00, '10th above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(7, 'Computerized Financial Accounting', 5, 'CFA', 6, 'Months', 5000.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(8, 'Diploma in Computer Application with Tally', 5, 'DCA-T', 9, 'Months', 7500.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(9, 'Certificate in Computer Application with Tally', 5, 'CCA-T', 4, 'Months', 7000.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(10, 'Advance Diploma in Hardware & Networking', 3, 'ADHN', 1, 'Year', 45000.00, '10th + Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(11, 'Diploma in Card Level Repairing', 3, 'DCLR', 6, 'Months', 20000.00, '10th or 10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(12, 'Diploma in Card Level Repairing with Networking', 3, 'DCLRN', 12, 'Months', 35000.00, '10th or 10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(13, 'Basic in Hardware & Networking', 3, 'BHN', 6, 'Months', 15000.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(14, 'Diploma in Hardware & Networking', 3, 'DHN', 9, 'Months', 21000.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(15, 'Certificate in Hardware & Networking', 3, 'CHN', 6, 'Months', 15000.00, '10th + Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(16, 'Certificate in Basic Hardware', 3, 'CBH', 3, 'Days', 10000.00, '8th +Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(17, 'Advance Diploma in Computer Programming & Accounting', 5, 'ADCPA', 12, 'Months', 15000.00, '10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(18, 'Advance Diploma in Faculty  Management ', 4, 'ADFM', 12, 'Months', 12000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(19, 'Certification in Graphic Designing', 6, 'CGD', 4, 'Months', 6000.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(20, 'Certification in Web Designing', 1, 'CWD', 6, 'Months', 9000.00, '10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(21, 'Diploma in Professional Web Designing', 1, 'DPWD', 12, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(22, 'Web Development Programming I', 1, 'WDP-I', 6, 'Months', 8000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(23, 'Web Development Programming II', 1, 'WDP-II', 6, 'Months', 9000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(24, 'Advance Java Programming', 1, 'AJP', 6, 'Months', 10000.00, '10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(25, 'Advance Diploma in Computer Teacher Training', 4, 'ADCTT', 12, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(26, 'Diploma In Professional Video Editing', 3, 'DPVE', 6, 'Months', 8000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(27, 'Diploma in Mobile Phone Repairing ', 3, 'DMPR', 3, 'Months', 15000.00, '8th', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(28, 'Advance Diploma in Software Engineering', 3, 'ADSE', 2, 'Year', 80000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(29, 'Full Accounting And Taxation Package', 5, 'FATP', 1, 'Year', 20000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(30, 'SQL 2005 & 2007', 3, 'SQL 2005 & 2007', 60, 'Days', 1500.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(31, 'PHP', 1, 'PHP', 30, 'Days', 6000.00, '10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(32, 'Visual Basic', 3, 'Visual Basic', 45, 'Days', 2000.00, '10th +Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(33, 'Java', 1, 'Java', 30, 'Days', 4000.00, '10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(34, 'Wonder Workshop - I', 3, 'Wonder Workshop - I', 30, 'Days', 1200.00, '10th +Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(35, 'Wonder Workshop - II', 3, 'Wonder Workshop - II', 60, 'Days', 1200.00, '10th +Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(36, 'Little Genius', 4, 'Little Genius', 60, 'Days', 2000.00, '10th +Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(37, 'C & C++', 1, 'C & C++', 45, 'Days', 5000.00, '10th +Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(38, 'English Speaking', 3, 'English Speaking', 90, 'Days', 4000.00, '8th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(39, 'ASP.Net Technology', 1, 'ASP.Net Technology', 30, 'Days', 4500.00, '10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(40, 'Auto CAD- 2D & 3D', 3, 'Auto CAD- 2D & 3D', 120, 'Days', 7000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(41, 'Fox-Pro', 3, 'Fox-Pro', 15, 'Days', 1000.00, '10th +Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(42, 'Page Maker', 6, 'Page Maker', 30, 'Days', 1000.00, '10th +Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(43, 'HTML', 3, 'HTML', 15, 'Days', 1000.00, '10th +Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(44, 'Tally 7.2 & 9.0', 5, 'Tally 7.2 & 9.0', 90, 'Days', 1800.00, '10th +Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(45, 'Adobe Photoshop', 6, 'Adobe Photoshop', 30, 'Days', 1500.00, '10th +Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(46, 'Corel Draw', 6, 'Corel Draw', 30, 'Days', 1500.00, '10th +Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(47, 'Basic Computer Course With Tally', 5, 'BCC-T', 6, 'Months', 4500.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(48, 'Core Java', 1, 'Core Java', 30, 'Days', 3000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(49, 'Computer Typing', 3, 'Typing', 3, 'Months', 1000.00, '10th +Above', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(50, 'PG - Diploma in Computer Application ', 4, 'PG-DCA', 12, 'Months', 15000.00, 'Graduation', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(51, 'Tripal Tally', 3, 'TT', 3, 'Months', 2000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(52, 'Advance Diploma in Computer Studies', 4, 'ADCS', 12, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(53, 'Professional Diploma in Computer Application', 4, 'PDCA', 12, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(54, 'AutoCAD', 3, 'AutoCAD Civil', 6, 'Months', 3500.00, '10 th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(55, 'Microsoft Office', 3, 'Ms-Office', 3, 'Months', 1500.00, '8th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(56, '.Net Technology', 3, '.Net Technology', 3, 'Months', 3500.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(57, 'Computer Saksharta', 3, 'Computer Saksharta', 12, 'Months', 6000.00, '4th to 10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(58, 'Certificate in Computer Application', 4, 'CCA', 3, 'Months', 1250.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(59, 'Diploma in Computer Application (Kid Course)', 3, 'DCA Kid', 6, 'Months', 4000.00, 'below 10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(60, 'Internet & Email', 4, 'Internet & Email', 10, 'Days', 1500.00, '8th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(61, 'Course on Computer Concepts', 4, 'CCC', 3, 'Months', 3000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(62, 'Diploma in Desktop Publishing', 3, 'DDTP', 9, 'Months', 5000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(63, 'Certificate in Microsoft Office', 4, 'CMO', 3, 'Months', 3000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(64, 'Diploma in DTP & Graphics Designing', 6, 'DDGD', 6, 'Months', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(65, 'Industrial Training in Networking', 3, 'ITN', 6, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(66, 'Computerized Industrial Accounting', 5, 'CIA', 6, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(67, 'Industrial Accounting', 3, 'Industrial Accounting', 8, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(68, 'Professional Diploma in Banking & Accounting', 5, 'PDBA', 1, 'Year', 12000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(69, 'Certification In Computer Application & Programming', 4, 'CCAP', 12, 'Months', 10000.00, '10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(70, 'Diploma in Taxation & Accountancy', 5, 'DTA', 6, 'Months', 7500.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(71, 'Advance Diploma in Computer Training', 4, 'ADCT', 12, 'Months', 10000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(72, 'CATIA', 3, 'CATIA', 60, 'Days', 3000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(73, 'Video & Sound Editing', 3, 'Video & Sound Editing', 2, 'Months', 5000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(74, 'Professional Diploma in Computer Application with Programming', 3, 'PDCAP', 12, 'Months', 12000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(75, 'Certificate in Laptop Repairing', 3, 'CLR', 3, 'Months', 18000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(76, 'C#/C Sharp', 3, 'C#', 45, 'Days', 3000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(77, 'C Programming', 3, 'C Programming', 1, 'Months', 1500.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(78, 'Career Diploma in Computer Application ', 4, 'CDCA', 15, 'Months', 15000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(79, 'Diploma in Digital Film Making', 3, 'DDFM', 6, 'Months', 8300.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(80, 'Script Writing', 3, 'Script Writing', 2, 'Months', 3200.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(81, 'Film Direction', 3, 'Film Direction', 4, 'Months', 6300.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(82, 'Film Editing', 3, 'Film Editing', 4, 'Months', 5900.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(83, 'Certificate in After Effects', 3, 'CAE', 3, 'Months', 3200.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(84, 'Certificate in 3D Studio Max', 3, 'CSM', 3, 'Months', 7500.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(85, 'Cyber Security', 3, 'Cyber Security', 6, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(86, 'Diploma in Laptop Repairing', 3, 'DLR', 6, 'Months', 12000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:16', NULL),
(87, 'Advance Diploma in Computer & Hardware Management', 3, 'ADCHM', 15, 'Months', 10000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(88, 'AutoCAD (Mechanical)', 3, 'AutoCAD Mech.', 6, 'Months', 200.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(89, 'AutoCAD (Civil & Mechanical with Draftman)', 3, 'AutoCAD C & M', 12, 'Months', 300.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(90, 'Certificate in Computer Teacher Training', 3, 'CCTT', 12, 'Months', 6000.00, '10+2 ', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(91, 'Advance Diploma of Technical Engineering in Information Technology', 3, 'ADTE(IT)', 15, 'Months', 20000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(92, 'Advanced Diploma in Taxation & Accounting ', 3, 'ADTA', 12, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(93, 'Diploma in Office Applications & Management', 3, 'DOAM', 12, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(94, 'Advanced Diploma in Desktop Publication ', 3, 'ADDTP', 12, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(95, 'Auto CAD & BCC', 3, 'Auto CAD & BCC', 4, 'Months', 6000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(96, 'Web Designing Certificate Course', 3, 'WDCC', 2, 'Months', 1500.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(97, 'Web Designing and Graphic Designing Certificate Course', 3, 'WDGDCC', 4, 'Months', 5000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(98, 'Triple Tally with Busy', 3, 'TT with Busy', 4, 'Months', 2500.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(99, 'CERTIFICATE IN COMPUTER APPLICATION WITH TRIPLE TALLY & BUSY ', 3, 'CCA-TT with Busy', 7, 'Months', 3750.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(100, 'TRIPLE TALLY WITH OFFICE', 3, 'TT with Office', 4, 'Months', 2500.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(101, 'Certificate in Computer Application with Tripal Tally', 3, 'CCA-TT', 6, 'Months', 3250.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(102, 'Diploma In Software Engineering ', 1, 'DSE', 12, 'Months', 17500.00, '12th ', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(103, 'NUDI', 3, 'NUDI', 3, 'Months', 2000.00, '8th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(104, '~C++~ Programming', 3, 'C++', 45, 'Days', 4500.00, '10+2 ', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(105, 'Diploma in Computer & Hardware Management', 3, 'DCHM', 4, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(106, 'Diploma in Software Technology', 3, 'DST', 6, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(107, 'Diploma in 3D Animation', 3, 'D3DA', 6, 'Months', 5000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(108, 'Auto Cad Electrical', 3, 'ACE (ST)', 2, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(109, 'Auto Cad Machanical', 3, 'ACM', 2, 'Months', 12000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(110, 'Diploma in Mechanical, Electrical & Plumbing', 3, 'DMEP', 6, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(111, 'Auto Cad Civil', 3, 'ACC', 2, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(112, 'Diploma in Networking Technology', 3, 'DNT', 6, 'Months', 8000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(113, 'Diploma in Digital Marketing ', 1, 'DDM', 6, 'Months', 66000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(114, 'Advance Diploma in Laptop & Mobile Phone Repairing ', 3, 'ADLMR', 12, 'Months', 75000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(115, 'Personality Development with English Speaking', 3, 'PDES', 6, 'Months', 10000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(116, 'Training in Android Technology', 3, 'Training in Android Technology', 42, 'Days', 2000.00, '10', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(117, 'Master in Information Technology', 3, 'MIT', 2, 'Year', 60000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(118, 'Diploma in Multimedia', 3, 'DMM', 12, 'Months', 20000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(119, 'Advance Diploma in Graphics Designing', 3, 'ADGD', 12, 'Months', 20000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(120, 'Diploma in Office Automation and Publishing', 3, 'DOAP', 12, 'Months', 15000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(121, 'e-Office', 3, 'e-Office', 3, 'Months', 2000.00, '10', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(122, 'Word Press', 1, 'Word Press', 60, 'Days', 4000.00, '10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(123, 'Adobe Indesign', 6, 'Adobe Indesign', 30, 'Days', 1000.00, '10', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(124, 'Oracle 11g', 1, 'Oracle 11g', 60, 'Days', 1500.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(125, 'Advance Diploma in Information Technology', 3, 'ADIT', 18, 'Months', 20000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(126, 'Certificate in Information Technology', 3, 'CIT', 12, 'Months', 15000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(127, 'Diploma in Computers & Graphics with TALLY', 3, 'DCG', 6, 'Months', 25000.00, '10th ', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(128, 'Microsoft Excel', 3, 'Ms. Excel', 1, 'Months', 1500.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(129, 'Diploma in Graphics Designing & Animation', 6, 'DGDA', 6, 'Months', 15000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(130, 'Advance Diploma in Animation and Web Designing', 3, 'ADAWD', 18, 'Months', 15000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(131, 'Digital Literacy Course ', 4, 'DLC ', 45, 'Days', 5000.00, '08th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(132, 'Certified Data Entry Operator', 3, 'CDEO', 60, 'Days', 2000.00, '8th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(133, 'Desktop Designing Course', 3, 'DDC', 3, 'Months', 3000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(134, 'Advance Excel', 3, 'Advance Excel', 3, 'Months', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(135, 'Python', 1, 'Python', 30, 'Days', 5000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(136, 'Computer Fundamentals', 3, 'Fundamental', 1, 'Months', 1000.00, '8th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(137, 'Pro-E', 3, 'Pro-E', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(138, 'Unigraphics', 3, 'Unigraphics', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(139, 'Master Cam', 3, 'Master Cam', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(140, '3D studio Max', 3, '3ds Max', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(141, 'STAAD PRO', 3, 'STAAD PRO', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(142, 'Revit Architecture 2015', 3, 'Revit Architecture 2015', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(143, 'Civil Drafts Man', 3, 'Civil Drafts Man', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(144, 'Mechanical Draftsman', 3, 'Mechanical Draftsman', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(145, 'Auto cad- 2 D & Productivity', 3, 'Auto cad- 2 D & Productivity', 120, 'Days', 10000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(146, 'Auto Cad Foundation', 3, 'Auto Cad Foundation', 120, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(147, 'Auto cad-  Productivity', 3, 'Auto cad -  Productivity', 120, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(148, 'Auto Cad 3D & Productivity', 3, 'Auto cad 3D & Productivity', 60, 'Days', 6000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(149, 'Mobile App', 3, 'Mobile App', 30, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(150, 'Diploma in Laptop,Mobile & Desktop Repairing Course', 3, 'DLMDR', 6, 'Months', 180000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(151, 'Tally.ERP 9 and GST', 3, 'Tally & GST', 3, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(152, 'Advance Diploma in Web Designing and Hosting', 3, 'ADWDH', 6, 'Months', 18000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(153, 'AutoCad and Project Management in Primavera', 3, 'APMP', 6, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(154, 'Solid Works Premium', 3, 'Solid Works Premium', 60, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(155, 'Work NC 3 Axis', 3, 'Work NC 3 Axis', 30, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(156, 'Work NC 5 Axis', 3, 'Work NC 5 Axis', 45, 'Days', 6000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(157, 'CNC Programming', 3, 'CNC Programming', 45, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(158, 'VMC Programming', 3, 'VMC Programming', 45, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(159, 'Diploma in Interior Architecture & Design', 3, 'DIAD', 12, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(160, 'MYSQL', 1, 'MYSQL', 30, 'Days', 5000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(161, 'Basic Computer Course (Summer)', 3, 'BCC (Summer)', 1, 'Months', 1500.00, '5th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(162, 'Digital Marketing', 3, 'Digital Marketing', 60, 'Days', 10000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(163, 'Summer Project Training In ASP.NET', 3, 'SPTA', 3, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(164, 'Microsoft Access', 4, 'Microsoft Access', 30, 'Days', 1500.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:16', NULL),
(165, 'ANSYS', 3, 'ANSYS', 60, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:16', NULL),
(166, 'Auto Cad MEP (Mechanical Electrical and Plumbing)', 3, 'Auto Cad MEP', 6, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(167, 'Qbasic', 3, 'Qbasic', 1, 'Months', 5000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(168, 'Diploma In Civil CAD ', 3, 'DCC', 3, 'Months', 3000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(169, 'Advanced Diploma in Civil CAD', 3, 'ADCC', 6, 'Months', 4000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(170, 'Diploma in Mechanical CAD', 3, 'DMC', 3, 'Months', 2500.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(171, 'Advanced diploma in Mechanical CAD', 3, 'ADMC', 6, 'Months', 3000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(172, 'UG NX CAD/CAM', 3, 'UG NX CAD/CAM', 60, 'Days', 5000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(173, 'ZWCAD', 3, 'ZWCAD', 1, 'Months', 2000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(174, 'Cisco Certified Network Associate', 3, 'CCNA', 60, 'Days', 10000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(175, '(Microsoft Certified Solutions Associate)', 3, 'MCSA', 4, 'Months', 10000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(176, 'Linux', 3, 'Linux', 90, 'Days', 15000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(177, 'personality development', 3, 'PD', 30, 'Days', 3000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(178, 'Microsoft Word', 4, 'Microsoft Word', 30, 'Days', 3000.00, '8th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(179, 'Microsoft PowerPoint', 4, 'Microsoft PowerPoint', 30, 'Days', 1500.00, '8th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(180, 'Microsoft Outlook', 4, 'Microsoft Outlook', 30, 'Days', 2000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(181, 'ETHICAL HACKING', 3, 'EH', 6, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(182, 'CCTV Security Technician ', 3, 'CCIT', 6, 'Months', 10000.00, '10', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(183, 'Diploma in Mutimedia Design Program', 6, 'DMDP', 9, 'Months', 15000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(184, 'Digital Advertising Design & Marketing', 6, 'DADM', 12, 'Months', 25000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(185, 'Advanced Program in Digital Media & Design', 6, 'APDMD', 12, 'Months', 25000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(186, 'Diploma in Graphic & Animation', 6, 'DGA', 9, 'Months', 20000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(187, 'Diploma in Desktop Publication', 6, 'DDP', 9, 'Months', 10000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(188, 'Digital Photography', 6, 'DP', 45, 'Days', 10000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(189, 'Diploma in Web Development', 1, 'DWD', 3, 'Months', 8000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(190, 'Corel Studio	', 6, 'Corel Studio	', 30, 'Days', 15000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(191, 'Diploma in Database-Administration [RDBMS] ', 1, 'DDA', 2, 'Months', 10000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(192, 'Maya 3D	', 6, 'Maya 3D	', 45, 'Days', 10000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(193, 'Certificate in Web Development', 1, 'CWDP', 4, 'Months', 8000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(194, 'Certificate in Cyber Security ', 1, 'CCS', 6, 'Months', 15000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(195, 'Adobe Flash', 6, 'Adobe Flash', 30, 'Days', 5000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(196, 'VB.NET', 1, 'VB.NET', 30, 'Days', 5000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(197, 'Adobe After Effects	', 6, 'Adobe After Effects	', 45, 'Days', 5000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(198, 'R Language', 1, 'R Language', 30, 'Days', 5000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(199, 'Diploma in DOT NET Technology  ', 1, 'DDT', 5, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(200, 'Certificate in Computer Application Course', 4, 'CCAC', 12, 'Months', 15000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(201, 'Advance Diploma In Foreign Accounting And Indian Accounting', 5, 'ADFAIA', 6, 'Months', 10000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(202, 'Basic Accounting', 5, 'BA', 30, 'Days', 5000.00, '10th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(203, 'GCC VAT', 5, 'GCC VAT', 30, 'Days', 2000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(204, 'TallyPrime', 5, 'TallyPrime', 3, 'Months', 5000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(205, ' QuickBooks', 5, 'QB', 30, 'Days', 5000.00, '12th', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(206, 'Certificate in Accounting and Taxation', 5, 'CAT', 5, 'Months', 8000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(207, 'Diploma in Account and Taxation', 5, 'DAT', 6, 'Months', 11000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(208, 'Advance Diploma in Account and Taxation ', 5, 'ADAT', 12, 'Months', 22000.00, '12th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(209, 'Basic in Tailoring', 4, 'Basic in Tailoring', 3, 'Months', 5000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(210, 'Diploma in Tailoring', 4, 'Diploma in Tailoring', 6, 'Months', 10000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(211, 'Retail Sales Associate', 4, 'RSA', 3, 'Months', 10000.00, '10th', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(212, 'ADVANCED DIPLOMA IN INTERIOR DESIGNING AND VIRTUAL REALITY LITE', 6, 'ADIDVR Lite', 12, 'Months', 22000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(213, 'Java, C & C++', 1, 'Java, C & C++', 3, 'Months', 8000.00, '10th + Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(214, 'Graphic Design', 6, 'Graphic Design', 2, 'Months', 7000.00, '10th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(215, 'SketchUp', 1, 'SketchUp', 30, 'Days', 8000.00, '10th + Above', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(216, 'Digital Literacy Course (Internship)', 4, 'DLC  (Internship)', 45, 'Days', 5000.00, '08th + Above', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(217, 'Diploma In Computer Office Management & Publishing', 4, 'DOMP', 12, 'Months', 15000.00, '12th', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(218, 'HTML & CSS', 1, 'HTML & CSS', 2, 'Months', 10000.00, '10th ', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(219, 'Accounting & Tally', 5, 'Accounting & Tally', 12, 'Months', 10000.00, '10th & 10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(220, 'Peachtree', 5, 'Peachtree', 30, 'Days', 2500.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(221, 'Tableau', 1, 'Tableau', 30, 'Days', 5000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(222, 'Python with Data Structure', 1, 'Python with Data Structure', 2, 'Months', 10000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(223, 'SQL Server', 1, 'SQL Server', 60, 'Days', 10000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(224, 'Android Studio', 1, 'Android Studio', 3, 'Months', 12000.00, '10th & 10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(225, 'Professional Diploma in Logistics & Supply Chain Management', 5, 'PDL&SCM ', 12, 'Months', 25000.00, '10th & 10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(226, 'DCHN [Diploma in Computer Hardware & Networking]', 3, 'DCHN', 12, 'Months', 15000.00, '10th & 10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(227, 'Data Science', 1, 'Data Science', 3, 'Months', 12000.00, '10th & 10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(228, 'Computer Typing (Hindi & English)', 4, 'Computer Typing (Hindi & English)', 6, 'Months', 5000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(229, 'Primavera', 1, 'Primavera', 30, 'Days', 5000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(230, 'Diploma in Data Entry Operator', 4, 'DDEO', 4, 'Months', 6800.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(231, 'JavaScript', 1, 'JavaScript', 2, 'Months', 5000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(232, 'Industrial Training, HTML, CSS, JavaScript', 1, 'INDUSTRIAL TRAINING, HTML, CSS, JS', 45, 'Days', 3000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(233, 'Tally', 5, 'Tally', 1, 'Months', 3500.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(234, 'Basic Accounting', 5, 'Basic Accounting', 30, 'Days', 5000.00, '10th & 10+2', 'NULL', 'Short-Term Programs', '2024-02-19 06:26:17', NULL),
(235, 'Diploma in Computer Application', 4, 'DCA ', 12, 'Months', 6000.00, '10th & 10+2', 'NULL', 'Career Programs', '2024-02-19 06:26:17', NULL),
(236, 'Data Science with Python', 1, 'DSP', 3, 'Months', 25000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(237, 'Data Science with R', 1, 'DSR', 3, 'Months', 25000.00, '10+2', 'NULL', 'Professional Course', '2024-02-19 06:26:17', NULL),
(238, 'Basic Computer Course', 4, 'BCC', 3, 'Months', 3500.00, '8th ', 'Basic Computer Course', 'Career Programs', '2024-02-20 01:03:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `state_id`, `created_at`, `updated_at`) VALUES
(1, 'Anantapur', 1, NULL, '2024-03-12 03:01:52'),
(2, 'Chittoor', 1, NULL, NULL),
(3, 'East Godavari', 1, NULL, NULL),
(4, 'Guntur', 1, NULL, NULL),
(5, 'Krishna', 1, NULL, NULL),
(6, 'Kurnool', 1, NULL, NULL),
(7, 'Nellore', 1, NULL, NULL),
(8, 'Prakasam', 1, NULL, NULL),
(9, 'Srikakulam', 1, NULL, NULL),
(10, 'Visakhapatnam', 1, NULL, NULL),
(11, 'Vizianagaram', 1, NULL, NULL),
(12, 'West Godavari', 1, NULL, NULL),
(13, 'YSR Kadapa', 1, NULL, NULL),
(14, 'Tawang', 2, NULL, NULL),
(15, 'West Kameng', 2, NULL, NULL),
(16, 'East Kameng', 2, NULL, NULL),
(17, 'Papum Pare', 2, NULL, NULL),
(18, 'Kurung Kumey', 2, NULL, NULL),
(19, 'Kra Daadi', 2, NULL, NULL),
(20, 'Lower Subansiri', 2, NULL, NULL),
(21, 'Upper Subansiri', 2, NULL, NULL),
(22, 'West Siang', 2, NULL, NULL),
(23, 'East Siang', 2, NULL, NULL),
(24, 'Siang', 2, NULL, NULL),
(25, 'Upper Siang', 2, NULL, NULL),
(26, 'Lower Siang', 2, NULL, NULL),
(27, 'Lower Dibang Valley', 2, NULL, NULL),
(28, 'Dibang Valley', 2, NULL, NULL),
(29, 'Anjaw', 2, NULL, NULL),
(30, 'Lohit', 2, NULL, NULL),
(31, 'Namsai', 2, NULL, NULL),
(32, 'Changlang', 2, NULL, NULL),
(33, 'Tirap', 2, NULL, NULL),
(34, 'Longding', 2, NULL, NULL),
(35, 'Baksa', 3, NULL, NULL),
(36, 'Barpeta', 3, NULL, NULL),
(37, 'Biswanath', 3, NULL, NULL),
(38, 'Bongaigaon', 3, NULL, NULL),
(39, 'Cachar', 3, NULL, NULL),
(40, 'Charaideo', 3, NULL, NULL),
(41, 'Chirang', 3, NULL, NULL),
(42, 'Darrang', 3, NULL, NULL),
(43, 'Dhemaji', 3, NULL, NULL),
(44, 'Dhubri', 3, NULL, NULL),
(45, 'Dibrugarh', 3, NULL, NULL),
(46, 'Goalpara', 3, NULL, NULL),
(47, 'Golaghat', 3, NULL, NULL),
(48, 'Hailakandi', 3, NULL, NULL),
(49, 'Hojai', 3, NULL, NULL),
(50, 'Jorhat', 3, NULL, NULL),
(51, 'Kamrup Metropolitan', 3, NULL, NULL),
(52, 'Kamrup', 3, NULL, NULL),
(53, 'Karbi Anglong', 3, NULL, NULL),
(54, 'Karimganj', 3, NULL, NULL),
(55, 'Kokrajhar', 3, NULL, NULL),
(56, 'Lakhimpur', 3, NULL, NULL),
(57, 'Majuli', 3, NULL, NULL),
(58, 'Morigaon', 3, NULL, NULL),
(59, 'Nagaon', 3, NULL, NULL),
(60, 'Nalbari', 3, NULL, NULL),
(61, 'Dima Hasao', 3, NULL, NULL),
(62, 'Sivasagar', 3, NULL, NULL),
(63, 'Sonitpur', 3, NULL, NULL),
(64, 'South Salmara-Mankachar', 3, NULL, NULL),
(65, 'Tinsukia', 3, NULL, NULL),
(66, 'Udalguri', 3, NULL, NULL),
(67, 'West Karbi Anglong', 3, NULL, NULL),
(68, 'Araria', 4, NULL, NULL),
(69, 'Arwal', 4, NULL, NULL),
(70, 'Aurangabad', 4, NULL, NULL),
(71, 'Banka', 4, NULL, NULL),
(72, 'Begusarai', 4, NULL, NULL),
(73, 'Bhagalpur', 4, NULL, NULL),
(74, 'Bhojpur', 4, NULL, NULL),
(75, 'Buxar', 4, NULL, NULL),
(76, 'Darbhanga', 4, NULL, NULL),
(77, 'East Champaran (Motihari)', 4, NULL, NULL),
(78, 'Gaya', 4, NULL, NULL),
(79, 'Gopalganj', 4, NULL, NULL),
(80, 'Jamui', 4, NULL, NULL),
(81, 'Jehanabad', 4, NULL, NULL),
(82, 'Kaimur (Bhabua)', 4, NULL, NULL),
(83, 'Katihar', 4, NULL, NULL),
(84, 'Khagaria', 4, NULL, NULL),
(85, 'Kishanganj', 4, NULL, NULL),
(86, 'Lakhisarai', 4, NULL, NULL),
(87, 'Madhepura', 4, NULL, NULL),
(88, 'Madhubani', 4, NULL, NULL),
(89, 'Munger (Monghyr)', 4, NULL, NULL),
(90, 'Muzaffarpur', 4, NULL, NULL),
(91, 'Nalanda', 4, NULL, NULL),
(92, 'Nawada', 4, NULL, NULL),
(93, 'Patna', 4, NULL, NULL),
(94, 'Purnia (Purnea)', 4, NULL, NULL),
(95, 'Rohtas', 4, NULL, NULL),
(96, 'Saharsa', 4, NULL, NULL),
(97, 'Samastipur', 4, NULL, NULL),
(98, 'Saran', 4, NULL, NULL),
(99, 'Sheikhpura', 4, NULL, NULL),
(100, 'Sheohar', 4, NULL, NULL),
(101, 'Sitamarhi', 4, NULL, NULL),
(102, 'Siwan', 4, NULL, NULL),
(103, 'Supaul', 4, NULL, NULL),
(104, 'Vaishali', 4, NULL, NULL),
(105, 'West Champaran', 4, NULL, NULL),
(106, 'Chandigarh', 5, NULL, NULL),
(107, 'Balod', 6, NULL, NULL),
(108, 'Baloda Bazar', 6, NULL, NULL),
(109, 'Balrampur', 6, NULL, NULL),
(110, 'Bastar', 6, NULL, NULL),
(111, 'Bemetara', 6, NULL, NULL),
(112, 'Bijapur', 6, NULL, NULL),
(113, 'Bilaspur', 6, NULL, NULL),
(114, 'Dantewada (South Bastar)', 6, NULL, NULL),
(115, 'Dhamtari', 6, NULL, NULL),
(116, 'Durg', 6, NULL, NULL),
(117, 'Gariyaband', 6, NULL, NULL),
(118, 'Janjgir-Champa', 6, NULL, NULL),
(119, 'Jashpur', 6, NULL, NULL),
(120, 'Kabirdham (Kawardha)', 6, NULL, NULL),
(121, 'Kanker (North Bastar)', 6, NULL, NULL),
(122, 'Kondagaon', 6, NULL, NULL),
(123, 'Korba', 6, NULL, NULL),
(124, 'Korea (Koriya)', 6, NULL, NULL),
(125, 'Mahasamund', 6, NULL, NULL),
(126, 'Mungeli', 6, NULL, NULL),
(127, 'Narayanpur', 6, NULL, NULL),
(128, 'Raigarh', 6, NULL, NULL),
(129, 'Raipur', 6, NULL, NULL),
(130, 'Rajnandgaon', 6, NULL, NULL),
(131, 'Sukma', 6, NULL, NULL),
(132, 'Surajpur  ', 6, NULL, NULL),
(133, 'Surguja', 6, NULL, NULL),
(134, 'Dadra & Nagar Haveli', 7, NULL, NULL),
(135, 'Daman', 8, NULL, NULL),
(136, 'Diu', 8, NULL, NULL),
(137, 'Central Delhi', 9, NULL, NULL),
(138, 'East Delhi', 9, NULL, NULL),
(139, 'New Delhi', 9, NULL, NULL),
(140, 'North Delhi', 9, NULL, NULL),
(141, 'North East  Delhi', 9, NULL, NULL),
(142, 'North West  Delhi', 9, NULL, NULL),
(143, 'Shahdara', 9, NULL, NULL),
(144, 'South Delhi', 9, NULL, NULL),
(145, 'South East Delhi', 9, NULL, NULL),
(146, 'South West  Delhi', 9, NULL, NULL),
(147, 'West Delhi', 9, NULL, NULL),
(148, 'North Goa', 10, NULL, NULL),
(149, 'South Goa', 10, NULL, NULL),
(150, 'Ahmedabad', 11, NULL, NULL),
(151, 'Amreli', 11, NULL, NULL),
(152, 'Anand', 11, NULL, NULL),
(153, 'Aravalli', 11, NULL, NULL),
(154, 'Banaskantha (Palanpur)', 11, NULL, NULL),
(155, 'Bharuch', 11, NULL, NULL),
(156, 'Bhavnagar', 11, NULL, NULL),
(157, 'Botad', 11, NULL, NULL),
(158, 'Chhota Udepur', 11, NULL, NULL),
(159, 'Dahod', 11, NULL, NULL),
(160, 'Dangs (Ahwa)', 11, NULL, NULL),
(161, 'Devbhoomi Dwarka', 11, NULL, NULL),
(162, 'Gandhinagar', 11, NULL, NULL),
(163, 'Gir Somnath', 11, NULL, NULL),
(164, 'Jamnagar', 11, NULL, NULL),
(165, 'Junagadh', 11, NULL, NULL),
(166, 'Kachchh', 11, NULL, NULL),
(167, 'Kheda (Nadiad)', 11, NULL, NULL),
(168, 'Mahisagar', 11, NULL, NULL),
(169, 'Mehsana', 11, NULL, NULL),
(170, 'Morbi', 11, NULL, NULL),
(171, 'Narmada (Rajpipla)', 11, NULL, NULL),
(172, 'Navsari', 11, NULL, NULL),
(173, 'Panchmahal (Godhra)', 11, NULL, NULL),
(174, 'Patan', 11, NULL, NULL),
(175, 'Porbandar', 11, NULL, NULL),
(176, 'Rajkot', 11, NULL, NULL),
(177, 'Sabarkantha (Himmatnagar)', 11, NULL, NULL),
(178, 'Surat', 11, NULL, NULL),
(179, 'Surendranagar', 11, NULL, NULL),
(180, 'Tapi (Vyara)', 11, NULL, NULL),
(181, 'Vadodara', 11, NULL, NULL),
(182, 'Valsad', 11, NULL, NULL),
(183, 'Ambala', 12, NULL, NULL),
(184, 'Bhiwani', 12, NULL, NULL),
(185, 'Charkhi Dadri', 12, NULL, NULL),
(186, 'Faridabad', 12, NULL, NULL),
(187, 'Fatehabad', 12, NULL, NULL),
(188, 'Gurgaon', 12, NULL, NULL),
(189, 'Hisar', 12, NULL, NULL),
(190, 'Jhajjar', 12, NULL, NULL),
(191, 'Jind', 12, NULL, NULL),
(192, 'Kaithal', 12, NULL, NULL),
(193, 'Karnal', 12, NULL, NULL),
(194, 'Kurukshetra', 12, NULL, NULL),
(195, 'Mahendragarh', 12, NULL, NULL),
(196, 'Mewat', 12, NULL, NULL),
(197, 'Palwal', 12, NULL, NULL),
(198, 'Panchkula', 12, NULL, NULL),
(199, 'Panipat', 12, NULL, NULL),
(200, 'Rewari', 12, NULL, NULL),
(201, 'Rohtak', 12, NULL, NULL),
(202, 'Sirsa', 12, NULL, NULL),
(203, 'Sonipat', 12, NULL, NULL),
(204, 'Yamunanagar', 12, NULL, NULL),
(205, 'Bilaspur', 13, NULL, NULL),
(206, 'Chamba', 13, NULL, NULL),
(207, 'Hamirpur', 13, NULL, NULL),
(208, 'Kangra', 13, NULL, NULL),
(209, 'Kinnaur', 13, NULL, NULL),
(210, 'Kullu', 13, NULL, NULL),
(211, 'Lahaul &amp; Spiti', 13, NULL, NULL),
(212, 'Mandi', 13, NULL, NULL),
(213, 'Shimla', 13, NULL, NULL),
(214, 'Sirmaur (Sirmour)', 13, NULL, NULL),
(215, 'Solan', 13, NULL, NULL),
(216, 'Una', 13, NULL, NULL),
(217, 'Anantnag', 14, NULL, NULL),
(218, 'Bandipore', 14, NULL, NULL),
(219, 'Baramulla', 14, NULL, NULL),
(220, 'Budgam', 14, NULL, NULL),
(221, 'Doda', 14, NULL, NULL),
(222, 'Ganderbal', 14, NULL, NULL),
(223, 'Jammu', 14, NULL, NULL),
(224, 'Kargil', 14, NULL, NULL),
(225, 'Kathua', 14, NULL, NULL),
(226, 'Kishtwar', 14, NULL, NULL),
(227, 'Kulgam', 14, NULL, NULL),
(228, 'Kupwara', 14, NULL, NULL),
(229, 'Leh', 14, NULL, NULL),
(230, 'Poonch', 14, NULL, NULL),
(231, 'Pulwama', 14, NULL, NULL),
(232, 'Rajouri', 14, NULL, NULL),
(233, 'Ramban', 14, NULL, NULL),
(234, 'Reasi', 14, NULL, NULL),
(235, 'Samba', 14, NULL, NULL),
(236, 'Shopian', 14, NULL, NULL),
(237, 'Srinagar', 14, NULL, NULL),
(238, 'Udhampur', 14, NULL, NULL),
(239, 'Bokaro', 15, NULL, NULL),
(240, 'Chatra', 15, NULL, NULL),
(241, 'Deoghar', 15, NULL, NULL),
(242, 'Dhanbad', 15, NULL, NULL),
(243, 'Dumka', 15, NULL, NULL),
(244, 'East Singhbhum', 15, NULL, NULL),
(245, 'Garhwa', 15, NULL, NULL),
(246, 'Giridih', 15, NULL, NULL),
(247, 'Godda', 15, NULL, NULL),
(248, 'Gumla', 15, NULL, NULL),
(249, 'Hazaribag', 15, NULL, NULL),
(250, 'Jamtara', 15, NULL, NULL),
(251, 'Khunti', 15, NULL, NULL),
(252, 'Koderma', 15, NULL, NULL),
(253, 'Latehar', 15, NULL, NULL),
(254, 'Lohardaga', 15, NULL, NULL),
(255, 'Pakur', 15, NULL, NULL),
(256, 'Palamu', 15, NULL, NULL),
(257, 'Ramgarh', 15, NULL, NULL),
(258, 'Ranchi', 15, NULL, NULL),
(259, 'Sahibganj', 15, NULL, NULL),
(260, 'Seraikela-Kharsawan', 15, NULL, NULL),
(261, 'Simdega', 15, NULL, NULL),
(262, 'West Singhbhum', 15, NULL, NULL),
(263, 'Bagalkot', 16, NULL, NULL),
(264, 'Ballari (Bellary)', 16, NULL, NULL),
(265, 'Belagavi (Belgaum)', 16, NULL, NULL),
(266, 'Bengaluru (Bangalore) Rural', 16, NULL, NULL),
(267, 'Bengaluru (Bangalore) Urban', 16, NULL, NULL),
(268, 'Bidar', 16, NULL, NULL),
(269, 'Chamarajanagar', 16, NULL, NULL),
(270, 'Chikballapur', 16, NULL, NULL),
(271, 'Chikkamagaluru (Chikmagalur)', 16, NULL, NULL),
(272, 'Chitradurga', 16, NULL, NULL),
(273, 'Dakshina Kannada', 16, NULL, NULL),
(274, 'Davangere', 16, NULL, NULL),
(275, 'Dharwad', 16, NULL, NULL),
(276, 'Gadag', 16, NULL, NULL),
(277, 'Hassan', 16, NULL, NULL),
(278, 'Haveri', 16, NULL, NULL),
(279, 'Kalaburagi (Gulbarga)', 16, NULL, NULL),
(280, 'Kodagu', 16, NULL, NULL),
(281, 'Kolar', 16, NULL, NULL),
(282, 'Koppal', 16, NULL, NULL),
(283, 'Mandya', 16, NULL, NULL),
(284, 'Mysuru (Mysore)', 16, NULL, NULL),
(285, 'Raichur', 16, NULL, NULL),
(286, 'Ramanagara', 16, NULL, NULL),
(287, 'Shivamogga (Shimoga)', 16, NULL, NULL),
(288, 'Tumakuru (Tumkur)', 16, NULL, NULL),
(289, 'Udupi', 16, NULL, NULL),
(290, 'Uttara Kannada (Karwar)', 16, NULL, NULL),
(291, 'Vijayapura (Bijapur)', 16, NULL, NULL),
(292, 'Yadgir', 16, NULL, NULL),
(293, 'Alappuzha', 17, NULL, NULL),
(294, 'Ernakulam', 17, NULL, NULL),
(295, 'Idukki', 17, NULL, NULL),
(296, 'Kannur', 17, NULL, NULL),
(297, 'Kasaragod', 17, NULL, NULL),
(298, 'Kollam', 17, NULL, NULL),
(299, 'Kottayam', 17, NULL, NULL),
(300, 'Kozhikode', 17, NULL, NULL),
(301, 'Malappuram', 17, NULL, NULL),
(302, 'Palakkad', 17, NULL, NULL),
(303, 'Pathanamthitta', 17, NULL, NULL),
(304, 'Thiruvananthapuram', 17, NULL, NULL),
(305, 'Thrissur', 17, NULL, NULL),
(306, 'Wayanad', 17, NULL, NULL),
(307, 'Agatti', 18, NULL, NULL),
(308, 'Amini', 18, NULL, NULL),
(309, 'Androth', 18, NULL, NULL),
(310, 'Bithra', 18, NULL, NULL),
(311, 'Chethlath', 18, NULL, NULL),
(312, 'Kavaratti', 18, NULL, NULL),
(313, 'Kadmath', 18, NULL, NULL),
(314, 'Kalpeni', 18, NULL, NULL),
(315, 'Kilthan', 18, NULL, NULL),
(316, 'Minicoy', 18, NULL, NULL),
(317, 'Agar Malwa', 19, NULL, NULL),
(318, 'Alirajpur', 19, NULL, NULL),
(319, 'Anuppur', 19, NULL, NULL),
(320, 'Ashoknagar', 19, NULL, NULL),
(321, 'Balaghat', 19, NULL, NULL),
(322, 'Barwani', 19, NULL, NULL),
(323, 'Betul', 19, NULL, NULL),
(324, 'Bhind', 19, NULL, NULL),
(325, 'Bhopal', 19, NULL, NULL),
(326, 'Burhanpur', 19, NULL, NULL),
(327, 'Chhatarpur', 19, NULL, NULL),
(328, 'Chhindwara', 19, NULL, NULL),
(329, 'Damoh', 19, NULL, NULL),
(330, 'Datia', 19, NULL, NULL),
(331, 'Dewas', 19, NULL, NULL),
(332, 'Dhar', 19, NULL, NULL),
(333, 'Dindori', 19, NULL, NULL),
(334, 'Guna', 19, NULL, NULL),
(335, 'Gwalior', 19, NULL, NULL),
(336, 'Harda', 19, NULL, NULL),
(337, 'Hoshangabad', 19, NULL, NULL),
(338, 'Indore', 19, NULL, NULL),
(339, 'Jabalpur', 19, NULL, NULL),
(340, 'Jhabua', 19, NULL, NULL),
(341, 'Katni', 19, NULL, NULL),
(342, 'Khandwa', 19, NULL, NULL),
(343, 'Khargone', 19, NULL, NULL),
(344, 'Mandla', 19, NULL, NULL),
(345, 'Mandsaur', 19, NULL, NULL),
(346, 'Morena', 19, NULL, NULL),
(347, 'Narsinghpur', 19, NULL, NULL),
(348, 'Neemuch', 19, NULL, NULL),
(349, 'Panna', 19, NULL, NULL),
(350, 'Raisen', 19, NULL, NULL),
(351, 'Rajgarh', 19, NULL, NULL),
(352, 'Ratlam', 19, NULL, NULL),
(353, 'Rewa', 19, NULL, NULL),
(354, 'Sagar', 19, NULL, NULL),
(355, 'Satna', 19, NULL, NULL),
(356, 'Sehore', 19, NULL, NULL),
(357, 'Seoni', 19, NULL, NULL),
(358, 'Shahdol', 19, NULL, NULL),
(359, 'Shajapur', 19, NULL, NULL),
(360, 'Sheopur', 19, NULL, NULL),
(361, 'Shivpuri', 19, NULL, NULL),
(362, 'Sidhi', 19, NULL, NULL),
(363, 'Singrauli', 19, NULL, NULL),
(364, 'Tikamgarh', 19, NULL, NULL),
(365, 'Ujjain', 19, NULL, NULL),
(366, 'Umaria', 19, NULL, NULL),
(367, 'Vidisha', 19, NULL, NULL),
(368, 'Ahmednagar', 20, NULL, NULL),
(369, 'Akola', 20, NULL, NULL),
(370, 'Amravati', 20, NULL, NULL),
(371, 'Aurangabad', 20, NULL, NULL),
(372, 'Beed', 20, NULL, NULL),
(373, 'Bhandara', 20, NULL, NULL),
(374, 'Buldhana', 20, NULL, NULL),
(375, 'Chandrapur', 20, NULL, NULL),
(376, 'Dhule', 20, NULL, NULL),
(377, 'Gadchiroli', 20, NULL, NULL),
(378, 'Gondia', 20, NULL, NULL),
(379, 'Hingoli', 20, NULL, NULL),
(380, 'Jalgaon', 20, NULL, NULL),
(381, 'Jalna', 20, NULL, NULL),
(382, 'Kolhapur', 20, NULL, NULL),
(383, 'Latur', 20, NULL, NULL),
(384, 'Mumbai City', 20, NULL, NULL),
(385, 'Mumbai Suburban', 20, NULL, NULL),
(386, 'Nagpur', 20, NULL, NULL),
(387, 'Nanded', 20, NULL, NULL),
(388, 'Nandurbar', 20, NULL, NULL),
(389, 'Nashik', 20, NULL, NULL),
(390, 'Osmanabad', 20, NULL, NULL),
(391, 'Palghar', 20, NULL, NULL),
(392, 'Parbhani', 20, NULL, NULL),
(393, 'Pune', 20, NULL, NULL),
(394, 'Raigad', 20, NULL, NULL),
(395, 'Ratnagiri', 20, NULL, NULL),
(396, 'Sangli', 20, NULL, NULL),
(397, 'Satara', 20, NULL, NULL),
(398, 'Sindhudurg', 20, NULL, NULL),
(399, 'Solapur', 20, NULL, NULL),
(400, 'Thane', 20, NULL, NULL),
(401, 'Wardha', 20, NULL, NULL),
(402, 'Washim', 20, NULL, NULL),
(403, 'Yavatmal', 20, NULL, NULL),
(404, 'Bishnupur', 21, NULL, NULL),
(405, 'Chandel', 21, NULL, NULL),
(406, 'Churachandpur', 21, NULL, NULL),
(407, 'Imphal East', 21, NULL, NULL),
(408, 'Imphal West', 21, NULL, NULL),
(409, 'Jiribam', 21, NULL, NULL),
(410, 'Kakching', 21, NULL, NULL),
(411, 'Kamjong', 21, NULL, NULL),
(412, 'Kangpokpi', 21, NULL, NULL),
(413, 'Noney', 21, NULL, NULL),
(414, 'Pherzawl', 21, NULL, NULL),
(415, 'Senapati', 21, NULL, NULL),
(416, 'Tamenglong', 21, NULL, NULL),
(417, 'Tengnoupal', 21, NULL, NULL),
(418, 'Thoubal', 21, NULL, NULL),
(419, 'Ukhrul', 21, NULL, NULL),
(420, 'East Garo Hills', 22, NULL, NULL),
(421, 'East Jaintia Hills', 22, NULL, NULL),
(422, 'East Khasi Hills', 22, NULL, NULL),
(423, 'North Garo Hills', 22, NULL, NULL),
(424, 'Ri Bhoi', 22, NULL, NULL),
(425, 'South Garo Hills', 22, NULL, NULL),
(426, 'South West Garo Hills ', 22, NULL, NULL),
(427, 'South West Khasi Hills', 22, NULL, NULL),
(428, 'West Garo Hills', 22, NULL, NULL),
(429, 'West Jaintia Hills', 22, NULL, NULL),
(430, 'West Khasi Hills', 22, NULL, NULL),
(431, 'Aizawl', 23, NULL, NULL),
(432, 'Champhai', 23, NULL, NULL),
(433, 'Kolasib', 23, NULL, NULL),
(434, 'Lawngtlai', 23, NULL, NULL),
(435, 'Lunglei', 23, NULL, NULL),
(436, 'Mamit', 23, NULL, NULL),
(437, 'Saiha', 23, NULL, NULL),
(438, 'Serchhip', 23, NULL, NULL),
(439, 'Dimapur', 24, NULL, NULL),
(440, 'Kiphire', 24, NULL, NULL),
(441, 'Kohima', 24, NULL, NULL),
(442, 'Longleng', 24, NULL, NULL),
(443, 'Mokokchung', 24, NULL, NULL),
(444, 'Mon', 24, NULL, NULL),
(445, 'Peren', 24, NULL, NULL),
(446, 'Phek', 24, NULL, NULL),
(447, 'Tuensang', 24, NULL, NULL),
(448, 'Wokha', 24, NULL, NULL),
(449, 'Zunheboto', 24, NULL, NULL),
(450, 'Angul', 25, NULL, NULL),
(451, 'Balangir', 25, NULL, NULL),
(452, 'Balasore', 25, NULL, NULL),
(453, 'Bargarh', 25, NULL, NULL),
(454, 'Bhadrak', 25, NULL, NULL),
(455, 'Boudh', 25, NULL, NULL),
(456, 'Cuttack', 25, NULL, NULL),
(457, 'Deogarh', 25, NULL, NULL),
(458, 'Dhenkanal', 25, NULL, NULL),
(459, 'Gajapati', 25, NULL, NULL),
(460, 'Ganjam', 25, NULL, NULL),
(461, 'Jagatsinghapur', 25, NULL, NULL),
(462, 'Jajpur', 25, NULL, NULL),
(463, 'Jharsuguda', 25, NULL, NULL),
(464, 'Kalahandi', 25, NULL, NULL),
(465, 'Kandhamal', 25, NULL, NULL),
(466, 'Kendrapara', 25, NULL, NULL),
(467, 'Kendujhar (Keonjhar)', 25, NULL, NULL),
(468, 'Khordha', 25, NULL, NULL),
(469, 'Koraput', 25, NULL, NULL),
(470, 'Malkangiri', 25, NULL, NULL),
(471, 'Mayurbhanj', 25, NULL, NULL),
(472, 'Nabarangpur', 25, NULL, NULL),
(473, 'Nayagarh', 25, NULL, NULL),
(474, 'Nuapada', 25, NULL, NULL),
(475, 'Puri', 25, NULL, NULL),
(476, 'Rayagada', 25, NULL, NULL),
(477, 'Sambalpur', 25, NULL, NULL),
(478, 'Sonepur', 25, NULL, NULL),
(479, 'Sundargarh', 25, NULL, NULL),
(480, 'Karaikal', 26, NULL, NULL),
(481, 'Mahe', 26, NULL, NULL),
(482, 'Pondicherry', 26, NULL, NULL),
(483, 'Yanam', 26, NULL, NULL),
(484, 'Amritsar', 27, NULL, NULL),
(485, 'Barnala', 27, NULL, NULL),
(486, 'Bathinda', 27, NULL, NULL),
(487, 'Faridkot', 27, NULL, NULL),
(488, 'Fatehgarh Sahib', 27, NULL, NULL),
(489, 'Fazilka', 27, NULL, NULL),
(490, 'Ferozepur', 27, NULL, NULL),
(491, 'Gurdaspur', 27, NULL, NULL),
(492, 'Hoshiarpur', 27, NULL, NULL),
(493, 'Jalandhar', 27, NULL, NULL),
(494, 'Kapurthala', 27, NULL, NULL),
(495, 'Ludhiana', 27, NULL, NULL),
(496, 'Mansa', 27, NULL, NULL),
(497, 'Moga', 27, NULL, NULL),
(498, 'Muktsar', 27, NULL, NULL),
(499, 'Nawanshahr (Shahid Bhagat Singh Nagar)', 27, NULL, NULL),
(500, 'Pathankot', 27, NULL, NULL),
(501, 'Patiala', 27, NULL, NULL),
(502, 'Rupnagar', 27, NULL, NULL),
(503, 'Sahibzada Ajit Singh Nagar (Mohali)', 27, NULL, NULL),
(504, 'Sangrur', 27, NULL, NULL),
(505, 'Tarn Taran', 27, NULL, NULL),
(506, 'Ajmer', 28, NULL, NULL),
(507, 'Alwar', 28, NULL, NULL),
(508, 'Banswara', 28, NULL, NULL),
(509, 'Baran', 28, NULL, NULL),
(510, 'Barmer', 28, NULL, NULL),
(511, 'Bharatpur', 28, NULL, NULL),
(512, 'Bhilwara', 28, NULL, NULL),
(513, 'Bikaner', 28, NULL, NULL),
(514, 'Bundi', 28, NULL, NULL),
(515, 'Chittorgarh', 28, NULL, NULL),
(516, 'Churu', 28, NULL, NULL),
(517, 'Dausa', 28, NULL, NULL),
(518, 'Dholpur', 28, NULL, NULL),
(519, 'Dungarpur', 28, NULL, NULL),
(520, 'Hanumangarh', 28, NULL, NULL),
(521, 'Jaipur', 28, NULL, NULL),
(522, 'Jaisalmer', 28, NULL, NULL),
(523, 'Jalore', 28, NULL, NULL),
(524, 'Jhalawar', 28, NULL, NULL),
(525, 'Jhunjhunu', 28, NULL, NULL),
(526, 'Jodhpur', 28, NULL, NULL),
(527, 'Karauli', 28, NULL, NULL),
(528, 'Kota', 28, NULL, NULL),
(529, 'Nagaur', 28, NULL, NULL),
(530, 'Pali', 28, NULL, NULL),
(531, 'Pratapgarh', 28, NULL, NULL),
(532, 'Rajsamand', 28, NULL, NULL),
(533, 'Sawai Madhopur', 28, NULL, NULL),
(534, 'Sikar', 28, NULL, NULL),
(535, 'Sirohi', 28, NULL, NULL),
(536, 'Sri Ganganagar', 28, NULL, NULL),
(537, 'Tonk', 28, NULL, NULL),
(538, 'Udaipur', 28, NULL, NULL),
(539, 'East Sikkim', 29, NULL, NULL),
(540, 'North Sikkim', 29, NULL, NULL),
(541, 'South Sikkim', 29, NULL, NULL),
(542, 'West Sikkim', 29, NULL, NULL),
(543, 'Ariyalur', 30, NULL, NULL),
(544, 'Chennai', 30, NULL, NULL),
(545, 'Coimbatore', 30, NULL, NULL),
(546, 'Cuddalore', 30, NULL, NULL),
(547, 'Dharmapuri', 30, NULL, NULL),
(548, 'Dindigul', 30, NULL, NULL),
(549, 'Erode', 30, NULL, NULL),
(550, 'Kanchipuram', 30, NULL, NULL),
(551, 'Kanyakumari', 30, NULL, NULL),
(552, 'Karur', 30, NULL, NULL),
(553, 'Krishnagiri', 30, NULL, NULL),
(554, 'Madurai', 30, NULL, NULL),
(555, 'Nagapattinam', 30, NULL, NULL),
(556, 'Namakkal', 30, NULL, NULL),
(557, 'Nilgiris', 30, NULL, NULL),
(558, 'Perambalur', 30, NULL, NULL),
(559, 'Pudukkottai', 30, NULL, NULL),
(560, 'Ramanathapuram', 30, NULL, NULL),
(561, 'Salem', 30, NULL, NULL),
(562, 'Sivaganga', 30, NULL, NULL),
(563, 'Thanjavur', 30, NULL, NULL),
(564, 'Theni', 30, NULL, NULL),
(565, 'Thoothukudi (Tuticorin)', 30, NULL, NULL),
(566, 'Tiruchirappalli', 30, NULL, NULL),
(567, 'Tirunelveli', 30, NULL, NULL),
(568, 'Tiruppur', 30, NULL, NULL),
(569, 'Tiruvallur', 30, NULL, NULL),
(570, 'Tiruvannamalai', 30, NULL, NULL),
(571, 'Tiruvarur', 30, NULL, NULL),
(572, 'Vellore', 30, NULL, NULL),
(573, 'Viluppuram', 30, NULL, NULL),
(574, 'Virudhunagar', 30, NULL, NULL),
(575, 'Adilabad', 31, NULL, NULL),
(576, 'Bhadradri Kothagudem', 31, NULL, NULL),
(577, 'Hyderabad', 31, NULL, NULL),
(578, 'Jagtial', 31, NULL, NULL),
(579, 'Jangaon', 31, NULL, NULL),
(580, 'Jayashankar Bhoopalpally', 31, NULL, NULL),
(581, 'Jogulamba Gadwal', 31, NULL, NULL),
(582, 'Kamareddy', 31, NULL, NULL),
(583, 'Karimnagar', 31, NULL, NULL),
(584, 'Khammam', 31, NULL, NULL),
(585, 'Komaram Bheem Asifabad', 31, NULL, NULL),
(586, 'Mahabubabad', 31, NULL, NULL),
(587, 'Mahabubnagar', 31, NULL, NULL),
(588, 'Mancherial', 31, NULL, NULL),
(589, 'Medak', 31, NULL, NULL),
(590, 'Medchal', 31, NULL, NULL),
(591, 'Nagarkurnool', 31, NULL, NULL),
(592, 'Nalgonda', 31, NULL, NULL),
(593, 'Nirmal', 31, NULL, NULL),
(594, 'Nizamabad', 31, NULL, NULL),
(595, 'Peddapalli', 31, NULL, NULL),
(596, 'Rajanna Sircilla', 31, NULL, NULL),
(597, 'Rangareddy', 31, NULL, NULL),
(598, 'Sangareddy', 31, NULL, NULL),
(599, 'Siddipet', 31, NULL, NULL),
(600, 'Suryapet', 31, NULL, NULL),
(601, 'Vikarabad', 31, NULL, NULL),
(602, 'Wanaparthy', 31, NULL, NULL),
(603, 'Warangal (Rural)', 31, NULL, NULL),
(604, 'Warangal (Urban)', 31, NULL, NULL),
(605, 'Yadadri Bhuvanagiri', 31, NULL, NULL),
(606, 'Dhalai', 32, NULL, NULL),
(607, 'Gomati', 32, NULL, NULL),
(608, 'Khowai', 32, NULL, NULL),
(609, 'North Tripura', 32, NULL, NULL),
(610, 'Sepahijala', 32, NULL, NULL),
(611, 'South Tripura', 32, NULL, NULL),
(612, 'Unakoti', 32, NULL, NULL),
(613, 'West Tripura', 32, NULL, NULL),
(614, 'Almora', 33, NULL, NULL),
(615, 'Bageshwar', 33, NULL, NULL),
(616, 'Chamoli', 33, NULL, NULL),
(617, 'Champawat', 33, NULL, NULL),
(618, 'Dehradun', 33, NULL, NULL),
(619, 'Haridwar', 33, NULL, NULL),
(620, 'Nainital', 33, NULL, NULL),
(621, 'Pauri Garhwal', 33, NULL, NULL),
(622, 'Pithoragarh', 33, NULL, NULL),
(623, 'Rudraprayag', 33, NULL, NULL),
(624, 'Tehri Garhwal', 33, NULL, NULL),
(625, 'Udham Singh Nagar', 33, NULL, NULL),
(626, 'Uttarkashi', 33, NULL, NULL),
(627, 'Agra', 34, NULL, NULL),
(628, 'Aligarh', 34, NULL, NULL),
(629, 'Allahabad', 34, NULL, NULL),
(630, 'Ambedkar Nagar', 34, NULL, NULL),
(631, 'Amethi (Chatrapati Sahuji Mahraj Nagar)', 34, NULL, NULL),
(632, 'Amroha (J.P. Nagar)', 34, NULL, NULL),
(633, 'Auraiya', 34, NULL, NULL),
(634, 'Azamgarh', 34, NULL, NULL),
(635, 'Baghpat', 34, NULL, NULL),
(636, 'Bahraich', 34, NULL, NULL),
(637, 'Ballia', 34, NULL, NULL),
(638, 'Balrampur', 34, NULL, NULL),
(639, 'Banda', 34, NULL, NULL),
(640, 'Barabanki', 34, NULL, NULL),
(641, 'Bareilly', 34, NULL, NULL),
(642, 'Basti', 34, NULL, NULL),
(643, 'Bhadohi', 34, NULL, NULL),
(644, 'Bijnor', 34, NULL, NULL),
(645, 'Budaun', 34, NULL, NULL),
(646, 'Bulandshahr', 34, NULL, NULL),
(647, 'Chandauli', 34, NULL, NULL),
(648, 'Chitrakoot', 34, NULL, NULL),
(649, 'Deoria', 34, NULL, NULL),
(650, 'Etah', 34, NULL, NULL),
(651, 'Etawah', 34, NULL, NULL),
(652, 'Faizabad', 34, NULL, NULL),
(653, 'Farrukhabad', 34, NULL, NULL),
(654, 'Fatehpur', 34, NULL, NULL),
(655, 'Firozabad', 34, NULL, NULL),
(656, 'Gautam Buddha Nagar', 34, NULL, NULL),
(657, 'Ghaziabad', 34, NULL, NULL),
(658, 'Ghazipur', 34, NULL, NULL),
(659, 'Gonda', 34, NULL, NULL),
(660, 'Gorakhpur', 34, NULL, NULL),
(661, 'Hamirpur', 34, NULL, NULL),
(662, 'Hapur (Panchsheel Nagar)', 34, NULL, NULL),
(663, 'Hardoi', 34, NULL, NULL),
(664, 'Hathras', 34, NULL, NULL),
(665, 'Jalaun', 34, NULL, NULL),
(666, 'Jaunpur', 34, NULL, NULL),
(667, 'Jhansi', 34, NULL, NULL),
(668, 'Kannauj', 34, NULL, NULL),
(669, 'Kanpur Dehat', 34, NULL, NULL),
(670, 'Kanpur Nagar', 34, NULL, NULL),
(671, 'Kanshiram Nagar (Kasganj)', 34, NULL, NULL),
(672, 'Kaushambi', 34, NULL, NULL),
(673, 'Kushinagar (Padrauna)', 34, NULL, NULL),
(674, 'Lakhimpur - Kheri', 34, NULL, NULL),
(675, 'Lalitpur', 34, NULL, NULL),
(676, 'Lucknow', 34, NULL, NULL),
(677, 'Maharajganj', 34, NULL, NULL),
(678, 'Mahoba', 34, NULL, NULL),
(679, 'Mainpuri', 34, NULL, NULL),
(680, 'Mathura', 34, NULL, NULL),
(681, 'Mau', 34, NULL, NULL),
(682, 'Meerut', 34, NULL, NULL),
(683, 'Mirzapur', 34, NULL, NULL),
(684, 'Moradabad', 34, NULL, NULL),
(685, 'Muzaffarnagar', 34, NULL, NULL),
(686, 'Pilibhit', 34, NULL, NULL),
(687, 'Pratapgarh', 34, NULL, NULL),
(688, 'RaeBareli', 34, NULL, NULL),
(689, 'Rampur', 34, NULL, NULL),
(690, 'Saharanpur', 34, NULL, NULL),
(691, 'Sambhal (Bhim Nagar)', 34, NULL, NULL),
(692, 'Sant Kabir Nagar', 34, NULL, NULL),
(693, 'Shahjahanpur', 34, NULL, NULL),
(694, 'Shamali (Prabuddh Nagar)', 34, NULL, NULL),
(695, 'Shravasti', 34, NULL, NULL),
(696, 'Siddharth Nagar', 34, NULL, NULL),
(697, 'Sitapur', 34, NULL, NULL),
(698, 'Sonbhadra', 34, NULL, NULL),
(699, 'Sultanpur', 34, NULL, NULL),
(700, 'Unnao', 34, NULL, NULL),
(701, 'Varanasi', 34, NULL, NULL),
(702, 'Alipurduar', 35, NULL, NULL),
(703, 'Bankura', 35, NULL, NULL),
(704, 'Birbhum', 35, NULL, NULL),
(705, 'Burdwan (Bardhaman)', 35, NULL, NULL),
(706, 'Cooch Behar', 35, NULL, NULL),
(707, 'Dakshin Dinajpur (South Dinajpur)', 35, NULL, NULL),
(708, 'Darjeeling', 35, NULL, NULL),
(709, 'Hooghly', 35, NULL, NULL),
(710, 'Howrah', 35, NULL, NULL),
(711, 'Jalpaiguri', 35, NULL, NULL),
(712, 'Kalimpong', 35, NULL, NULL),
(713, 'Kolkata', 35, NULL, NULL),
(714, 'Malda', 35, NULL, NULL),
(715, 'Murshidabad', 35, NULL, NULL),
(716, 'Nadia', 35, NULL, NULL),
(717, 'North 24 Parganas', 35, NULL, NULL),
(718, 'Paschim Medinipur (West Medinipur)', 35, NULL, NULL),
(719, 'Purba Medinipur (East Medinipur)', 35, NULL, NULL),
(720, 'Purulia', 35, NULL, NULL),
(721, 'South 24 Parganas', 35, NULL, NULL),
(722, 'Uttar Dinajpur (North Dinajpur)', 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, '10th', '2024-03-12 02:33:46', '2024-03-12 02:48:14'),
(3, '10th+ 2', '2024-03-12 02:33:57', '2024-03-12 02:48:09'),
(4, 'Graduation', '2024-03-12 02:34:39', '2024-03-12 02:48:19'),
(5, 'Other', '2024-03-12 02:34:55', '2024-03-12 02:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_07_094415_create_states_table', 2),
(6, '2024_03_09_084602_create_cities_table', 3),
(7, '2024_03_11_055734_create_categories_table', 4),
(11, '2024_03_11_065221_create_courses_table', 5),
(15, '2024_03_11_083120_create_branches_table', 6),
(16, '2024_03_12_075459_create_education_table', 7),
(17, '2024_03_12_080931_create_districts_table', 8),
(18, '2024_03_12_083404_create_qualifications_table', 9),
(19, '2024_03_12_084258_create_students_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `board_university` varchar(255) DEFAULT NULL,
  `year_of_passing` varchar(255) DEFAULT NULL,
  `percentage` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Andhra Pradesh', '2024-03-09 02:27:04', '2024-03-11 01:02:56'),
(2, 'Arunachal Pradesh', '2024-03-09 05:26:14', '2024-03-09 02:47:11'),
(3, 'Assam', '2024-03-09 05:26:14', '2024-03-09 02:41:39'),
(4, 'Bihar', '2024-03-09 05:26:14', NULL),
(5, 'Chandigarh (UT)', '2024-03-09 05:26:14', NULL),
(6, 'Chhattisgarh', '2024-03-09 05:26:14', NULL),
(7, 'Dadra and Nagar Haveli (UT)', '2024-03-09 05:26:14', NULL),
(8, 'Daman and Diu (UT)', '2024-03-09 05:26:14', NULL),
(9, 'Delhi (NCT)', '2024-03-09 05:26:14', NULL),
(10, 'Goa', '2024-03-09 05:26:14', NULL),
(11, 'Gujarat', '2024-03-09 05:26:14', NULL),
(12, 'Haryana', '2024-03-09 05:26:14', NULL),
(13, 'Himachal Pradesh', '2024-03-09 05:26:14', NULL),
(14, 'Jammu and Kashmir', '2024-03-09 05:26:14', NULL),
(15, 'Jharkhand', '2024-03-09 05:26:14', NULL),
(16, 'Karnataka', '2024-03-09 05:26:14', NULL),
(17, 'Kerala', '2024-03-09 05:26:14', NULL),
(18, 'Lakshadweep (UT)', '2024-03-09 05:26:14', NULL),
(19, 'Madhya Pradesh', '2024-03-09 05:26:14', NULL),
(20, 'Maharashtra', '2024-03-09 05:26:14', NULL),
(21, 'Manipur', '2024-03-09 05:26:14', NULL),
(22, 'Meghalaya', '2024-03-09 05:26:14', NULL),
(23, 'Mizoram', '2024-03-09 05:26:14', NULL),
(24, 'Nagaland', '2024-03-09 05:26:14', NULL),
(25, 'Odisha', '2024-03-09 05:26:14', NULL),
(26, 'Puducherry (UT)', '2024-03-09 05:26:14', NULL),
(27, 'Punjab', '2024-03-09 05:26:14', NULL),
(28, 'Rajasthan', '2024-03-09 05:26:14', NULL),
(29, 'Sikkim', '2024-03-09 05:26:14', NULL),
(30, 'Tamil Nadu', '2024-03-09 05:26:14', NULL),
(31, 'Telangana', '2024-03-09 05:26:14', NULL),
(32, 'Tripura', '2024-03-09 05:26:14', NULL),
(33, 'Uttarakhand', '2024-03-09 05:26:14', NULL),
(34, 'Uttar Pradesh', '2024-03-09 05:26:14', NULL),
(35, 'West Bengal', '2024-03-09 05:26:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_admission` date DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `enrollment` varchar(255) DEFAULT NULL,
  `course` int(10) UNSIGNED NOT NULL,
  `till_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_occupation` varchar(255) DEFAULT NULL,
  `student_dob` date NOT NULL,
  `gender` enum('male','female','transgender') DEFAULT NULL,
  `profile_image` varchar(255) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `wphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pqualification` varchar(255) NOT NULL,
  `qualification` bigint(20) UNSIGNED DEFAULT NULL,
  `student_status` enum('running','complete','dropout') DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` enum('deactive','active') NOT NULL,
  `approve` enum('no','yes') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'jupame@mailinator.com', NULL, '$2y$12$QlhSH7MKv2HmrFDzL2VrFeLQSvCdG4u6GEbi4sXTEqp6G.jwg2LSu', 'test.jpg', 'CQTkhZCcBgx6fiTKd5v3jjv9FXgFsKSn5GB32fYOZO8TkbmBRTU7mI3cRsht', '2024-03-07 01:35:47', '2024-03-07 03:21:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_code_unique` (`code`),
  ADD UNIQUE KEY `branches_email_unique` (`email`),
  ADD KEY `branches_city_id_foreign` (`city_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_state_id_foreign` (`state_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_branch_id_foreign` (`branch_id`),
  ADD KEY `students_state_id_foreign` (`state_id`),
  ADD KEY `students_qualification_foreign` (`qualification`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=723;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  ADD CONSTRAINT `students_qualification_foreign` FOREIGN KEY (`qualification`) REFERENCES `qualifications` (`id`),
  ADD CONSTRAINT `students_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
