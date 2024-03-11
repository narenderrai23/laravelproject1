-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2024 at 01:35 PM
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
(1, 4, 'RON20240311001', 'Kimberley Rivas', 'Karyn Kennedy', 'authorized', '5743061698', '2024-04-02', '2027-04-02', 'Recusandae Cillum d', 'Fugit ut quia repre', 'mode@gmail.com', 'Pa$$w0rd!', NULL, '2024-03-11 12:24:42', '2024-03-11 06:54:42', '2024-03-11 06:54:42');

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
(15, '2024_03_11_083120_create_branches_table', 6);

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
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
