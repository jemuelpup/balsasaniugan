-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2018 at 10:19 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `balsasaniugan`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_tbl`
--

CREATE TABLE IF NOT EXISTS `access_tbl` (
  `employee_id_fk` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_tbl`
--

INSERT INTO `access_tbl` (`employee_id_fk`, `username`, `password`, `active`) VALUES
(1, 'jemuel', '123', 1),
(2, 'karen', '123', 1),
(3, 'jen', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch_tbl`
--

CREATE TABLE IF NOT EXISTS `branch_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `branch_code` varchar(10) NOT NULL,
  `modified_by_fk` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_tbl`
--

INSERT INTO `branch_tbl` (`id`, `name`, `address`, `description`, `branch_code`, `modified_by_fk`, `active`) VALUES
(1, 'sm north', 'sm north edsa', 'wala', '123', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_tbl`
--

CREATE TABLE IF NOT EXISTS `category_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category_code` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by_fk` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_tbl`
--

INSERT INTO `category_tbl` (`id`, `name`, `category_code`, `description`, `date_modified`, `modified_by_fk`, `active`) VALUES
(1, 'seafoods', 's01', 'seafoods recipe''s', '2018-02-04 07:31:22', NULL, 1),
(2, 'desserts', 'd01', 'traditional Filipino desserts', '2018-02-04 08:06:15', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_tbl`
--

CREATE TABLE IF NOT EXISTS `employee_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `position_fk` int(11) DEFAULT NULL,
  `branch_fk` int(11) DEFAULT NULL,
  `salary` decimal(11,2) NOT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by_fk` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `birth_day` date DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_tbl`
--

INSERT INTO `employee_tbl` (`id`, `name`, `picture`, `address`, `contact_number`, `email`, `position_fk`, `branch_fk`, `salary`, `date_modified`, `modified_by_fk`, `active`, `birth_day`, `gender`) VALUES
(1, 'jemuel', '123123', 'wala st', '213123', '123123', 1, 1, '123123.00', '2018-02-06 06:03:17', 1, 1, '1994-05-20', 1),
(2, 'Karen Talla', '123123', '123123123', '123123', '123123', 2, 1, '123123.00', '2018-02-06 07:04:43', 1, 1, '1995-05-04', 0),
(3, 'jenny', '12312312', '123123', '123123123', '123123', 3, 1, '123123.00', '2018-02-06 07:43:51', 1, 1, '1992-05-04', 0),
(4, 'qeqweq', '123123', '1231231', '123123', '123123', 4, 1, '132123.00', '2018-02-06 07:45:01', 1, 1, '1990-05-04', 1),
(5, 'adfasdfadsf', '123123', '123123', '123123', '123123123', 4, 1, '123123.00', '2018-02-06 07:45:42', 1, 1, '1992-05-04', 1),
(6, 'paolo', '12312312', '123123123', '123123123', '123123123', 4, 1, '13123.00', '2018-02-06 08:08:54', 1, 1, '1990-05-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_tbl`
--

CREATE TABLE IF NOT EXISTS `ingredients_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `quantity` int(11) DEFAULT '1',
  `unit` varchar(15) DEFAULT 'pieces',
  `description` varchar(500) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by_fk` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_line_tbl`
--

CREATE TABLE IF NOT EXISTS `order_line_tbl` (
`id` int(11) NOT NULL,
  `order_id_fk` int(11) NOT NULL,
  `product_id_fk` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `served` tinyint(4) NOT NULL DEFAULT '0',
  `served_items` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_line_tbl`
--

INSERT INTO `order_line_tbl` (`id`, `order_id_fk`, `product_id_fk`, `name`, `code`, `quantity`, `price`, `served`, `served_items`) VALUES
(3, 2, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(4, 2, 2, 'srimp', '112', 1, '123.00', 0, 1),
(5, 3, 2, 'srimp', '112', 1, '123.00', 0, 1),
(6, 4, 1, 'adobo', 'p01', 3, '1123.00', 0, 3),
(7, 4, 2, 'srimp', '112', 2, '123.00', 0, 2),
(8, 5, 2, 'srimp', '112', 2, '123.00', 0, 2),
(11, 1, 10, 'adobong kangkong', '', 1, '123.00', 0, 1),
(12, 1, 9, 'lecheflan', 'd01', 1, '123.00', 0, 1),
(13, 2, 10, 'adobong kangkong', '', 1, '123.00', 0, 1),
(14, 3, 9, 'lecheflan', 'd01', 1, '123.00', 0, 1),
(15, 3, 10, 'adobong kangkong', '', 1, '123.00', 0, 1),
(16, 1, 3, 'Test', '', 1, '1234.00', 0, 1),
(17, 4, 8, 'fried rice', '123', 1, '1.00', 0, 1),
(18, 6, 4, 'qwe', '', 1, '123.00', 0, 1),
(19, 6, 6, 'sinigang', '123', 1, '123.00', 0, 1),
(20, 7, 8, 'fried rice', '123', 1, '1.00', 0, 1),
(21, 7, 9, 'lecheflan', 'd01', 1, '123.00', 0, 1),
(22, 7, 10, 'adobong kangkong', '', 1, '123.00', 0, 1),
(23, 8, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(24, 8, 2, 'srimp', '112', 1, '123.00', 0, 1),
(25, 8, 3, 'Test', '', 1, '1234.00', 0, 1),
(26, 9, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(27, 9, 2, 'srimp', '112', 1, '123.00', 0, 1),
(28, 9, 3, 'Test', '', 1, '1234.00', 0, 1),
(29, 9, 4, 'qwe', '', 1, '123.00', 0, 1),
(31, 10, 4, 'qwe', '', 1, '123.00', 0, 1),
(32, 11, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(34, 12, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(35, 12, 2, 'srimp', '112', 1, '123.00', 0, 1),
(36, 12, 3, 'Test', '', 1, '1234.00', 0, 1),
(37, 13, 1, 'adobo', 'p01', 2, '1123.00', 0, 2),
(38, 14, 2, 'srimp', '112', 1, '123.00', 0, 1),
(39, 14, 2, 'srimp', '112', 1, '123.00', 0, 1),
(40, 14, 2, 'srimp', '112', 1, '123.00', 0, 1),
(41, 15, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(42, 15, 2, 'srimp', '112', 1, '123.00', 0, 1),
(43, 16, 3, 'Test', '', 5, '1234.00', 0, 5),
(44, 17, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(45, 17, 2, 'srimp', '112', 1, '123.00', 0, 1),
(46, 18, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(47, 18, 2, 'srimp', '112', 16, '123.00', 0, 16),
(48, 18, 3, 'Test', '', 1, '1234.00', 0, 1),
(49, 18, 9, 'lecheflan', 'd01', 1, '123.00', 0, 1),
(50, 18, 10, 'adobong kangkong', '', 1, '123.00', 0, 1),
(52, 19, 2, 'srimp', '112', 1, '123.00', 0, 1),
(53, 19, 3, 'Test', '', 1, '1234.00', 0, 1),
(55, 18, 2, 'srimp', '112', 1, '123.00', 0, 1),
(56, 23, 2, 'srimp', '112', 1, '123.00', 0, 1),
(57, 24, 2, 'srimp', '112', 1, '123.00', 0, 1),
(58, 25, 2, 'srimp', '112', 1, '123.00', 0, 1),
(59, 28, 3, 'Test', '', 1, '1234.00', 0, 1),
(60, 33, 4, 'qwe', '', 1, '123.00', 0, 1),
(61, 34, 6, 'sinigang', '123', 1, '123.00', 0, 1),
(62, 35, 7, 'fried chicken', 'f1', 1, '123.00', 0, 1),
(63, 34, 2, 'srimp', '112', 1, '123.00', 0, 1),
(64, 36, 1, 'adobo', 'p01', 5, '1123.00', 0, 5),
(65, 36, 2, 'srimp', '112', 1, '123.00', 0, 1),
(66, 36, 3, 'Test', '', 1, '1234.00', 0, 1),
(67, 37, 1, 'adobo', 'p01', 1, '1123.00', 0, 0),
(68, 37, 2, 'srimp', '112', 1, '123.00', 0, 0),
(69, 37, 3, 'Test', '', 1, '1234.00', 0, 0),
(70, 38, 2, 'srimp', '112', 1, '123.00', 0, 0),
(71, 38, 3, 'Test', '', 1, '1234.00', 0, 0),
(72, 39, 1, 'adobo', 'p01', 1, '1123.00', 0, 0),
(73, 39, 2, 'srimp', '112', 1, '123.00', 0, 0),
(74, 40, 1, 'adobo', 'p01', 1, '1123.00', 0, 0),
(75, 40, 2, 'srimp', '112', 1, '123.00', 0, 0),
(76, 40, 3, 'Test', '', 1, '1234.00', 0, 0),
(77, 41, 2, 'srimp', '112', 1, '123.00', 0, 0),
(78, 41, 1, 'adobo', 'p01', 1, '1123.00', 0, 0),
(79, 42, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(80, 42, 2, 'srimp', '112', 1, '123.00', 0, 1),
(81, 42, 3, 'Test', '', 1, '1234.00', 0, 1),
(82, 43, 1, 'adobo', 'p01', 1, '1123.00', 0, 0),
(83, 43, 2, 'srimp', '112', 1, '123.00', 0, 0),
(84, 43, 3, 'Test', '', 1, '1234.00', 0, 0),
(85, 44, 1, 'adobo', 'p01', 2, '1123.00', 0, 2),
(86, 45, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(87, 45, 2, 'srimp', '112', 1, '123.00', 0, 1),
(88, 45, 3, 'Test', '', 1, '1234.00', 0, 1),
(89, 46, 3, 'Test', '', 3, '1234.00', 0, 3),
(90, 45, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(91, 45, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(92, 45, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(93, 46, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(94, 46, 4, 'qwe', '', 1, '123.00', 0, 1),
(95, 46, 4, 'qwe', '', 1, '123.00', 0, 1),
(96, 46, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(97, 47, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(98, 47, 2, 'srimp', '112', 1, '123.00', 0, 1),
(99, 48, 4, 'qwe', '', 1, '123.00', 0, 0),
(100, 48, 6, 'sinigang', '123', 1, '123.00', 0, 0),
(101, 48, 1, 'adobo', 'p01', 1, '1123.00', 0, 0),
(102, 47, 1, 'adobo', 'p01', 1, '1123.00', 0, 1),
(103, 47, 6, 'sinigang', '123', 1, '123.00', 0, 1),
(104, 47, 8, 'fried rice', '123', 1, '1.00', 0, 1),
(105, 47, 10, 'adobong kangkong', '', 1, '123.00', 0, 1),
(106, 48, 2, 'srimp', '112', 1, '123.00', 0, 0),
(107, 48, 5, 'laing', '', 1, '0.00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE IF NOT EXISTS `order_tbl` (
`id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seat_number` varchar(11) DEFAULT '0',
  `cashier_fk` int(11) DEFAULT NULL,
  `branch_fk` int(11) NOT NULL,
  `waiter_fk` int(11) NOT NULL,
  `void` int(11) NOT NULL DEFAULT '0',
  `total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `customer_name` varchar(50) DEFAULT '""',
  `payment` decimal(11,2) DEFAULT '0.00',
  `notes` varchar(200) DEFAULT NULL,
  `down_payment` decimal(11,2) NOT NULL DEFAULT '0.00',
  `received_date` datetime DEFAULT NULL,
  `void_reason` varchar(150) DEFAULT NULL,
  `discount` double(11,2) NOT NULL DEFAULT '0.00',
  `discount_percentage` double NOT NULL DEFAULT '0',
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  `done` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`id`, `order_date`, `seat_number`, `cashier_fk`, `branch_fk`, `waiter_fk`, `void`, `total_amount`, `customer_name`, `payment`, `notes`, `down_payment`, `received_date`, `void_reason`, `discount`, `discount_percentage`, `printed`, `done`) VALUES
(1, '2018-02-09 03:40:42', '1', NULL, 1, 1, 0, '0.00', NULL, '1480.00', 'Deliver the icecream later wwwwww wwwwww wwwwww wwwwww wwwwww wwwwww wwwwww wwwwww', '1000.00', '2018-02-13 11:06:58', NULL, 0.00, 0, 1, 1),
(2, '2018-02-09 04:35:23', '2', NULL, 1, 1, 0, '0.00', NULL, '1369.00', '', '0.00', '2018-02-13 11:10:47', NULL, 0.00, 0, 1, 1),
(3, '2018-02-09 05:09:58', '1', NULL, 1, 1, 0, '0.00', NULL, '369.00', '', '0.00', '2018-02-13 11:16:12', NULL, 0.00, 0, 1, 1),
(4, '2018-02-09 05:11:44', '1', NULL, 1, 1, 0, '0.00', NULL, '3616.00', '', '0.00', '2018-02-13 11:18:09', NULL, 0.00, 0, 1, 1),
(5, '2018-02-09 05:14:27', '6', NULL, 1, 1, 0, '0.00', NULL, '246.00', '', '0.00', '2018-02-13 11:19:11', NULL, 0.00, 0, 1, 1),
(6, '2018-02-13 03:19:55', '5', NULL, 1, 1, 0, '0.00', NULL, '246.00', '', '0.00', '2018-02-13 11:21:07', NULL, 0.00, 0, 1, 1),
(7, '2018-02-13 03:20:07', '5', NULL, 1, 1, 0, '0.00', NULL, '247.00', '', '0.00', '2018-02-13 11:21:24', NULL, 0.00, 0, 1, 1),
(8, '2018-02-13 03:20:37', '7', NULL, 1, 1, 0, '0.00', NULL, '2480.00', '', '0.00', '2018-02-13 12:18:29', NULL, 500.00, 0, 1, 1),
(9, '2018-02-13 08:54:12', '1', NULL, 1, 1, 0, '0.00', NULL, '2603.00', '', '0.00', '2018-02-20 16:12:32', NULL, 0.00, 0, 1, 1),
(10, '2018-02-13 09:04:06', '5', NULL, 1, 1, 0, '0.00', NULL, '123.00', '', '0.00', '2018-02-20 16:22:33', NULL, 0.00, 0, 1, 1),
(11, '2018-02-20 07:51:49', '1', NULL, 1, 1, 0, '0.00', NULL, '1123.00', '', '0.00', '2018-02-20 16:22:35', NULL, 0.00, 0, 1, 1),
(12, '2018-02-20 07:54:49', '4', NULL, 1, 1, 0, '0.00', NULL, '2480.00', '', '0.00', '2018-02-20 16:22:31', NULL, 0.00, 0, 1, 1),
(13, '2018-02-20 08:23:20', '1', NULL, 1, 1, 0, '0.00', NULL, '2246.00', '', '0.00', '2018-02-20 16:26:37', NULL, 0.00, 0, 1, 1),
(14, '2018-02-20 08:23:30', '1', NULL, 1, 1, 0, '0.00', NULL, '369.00', '', '0.00', '2018-02-20 16:26:39', NULL, 0.00, 0, 1, 1),
(15, '2018-02-20 08:55:30', '3', NULL, 1, 1, 0, '0.00', NULL, '1246.00', '', '0.00', '2018-02-20 17:03:16', NULL, 0.00, 0, 1, 1),
(16, '2018-02-20 08:55:48', '3', NULL, 1, 1, 0, '0.00', NULL, '6170.00', '', '0.00', '2018-02-20 17:03:18', NULL, 0.00, 0, 1, 1),
(17, '2018-02-20 09:02:21', '4', NULL, 1, 1, 0, '0.00', NULL, '1246.00', '', '0.00', '2018-02-20 17:03:21', NULL, 0.00, 0, 1, 1),
(18, '2018-02-22 06:38:35', '1', NULL, 1, 1, 0, '4694.00', NULL, '2500.00', '', '0.00', '2018-02-26 14:11:01', NULL, 2347.00, 0, 1, 1),
(19, '2018-02-22 08:38:11', '1', NULL, 1, 1, 0, '1357.00', NULL, '1500.00', '', '0.00', '2018-02-26 14:26:24', NULL, 0.00, 0, 1, 1),
(20, '2018-02-26 02:30:53', '5', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(21, '2018-02-26 02:31:41', '7', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(22, '2018-02-26 02:32:57', '5', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(23, '2018-02-26 02:36:05', '5', NULL, 1, 1, 0, '0.00', NULL, '123.00', '', '0.00', '2018-02-26 12:06:00', NULL, 0.00, 0, 1, 1),
(24, '2018-02-26 02:36:22', '5', NULL, 1, 1, 0, '123.00', NULL, '200.00', '', '0.00', '2018-02-26 14:26:31', NULL, 0.00, 0, 1, 1),
(25, '2018-02-26 02:36:57', '4', NULL, 1, 1, 0, '123.00', NULL, '200.00', '', '0.00', '2018-02-26 14:26:38', NULL, 0.00, 0, 1, 1),
(26, '2018-02-26 02:38:23', '6', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(27, '2018-02-26 02:39:15', '7', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(28, '2018-02-26 02:49:52', '5', NULL, 1, 1, 0, '1234.00', NULL, '800.00', '', '0.00', '2018-02-26 17:20:46', NULL, 493.60, 0, 1, 1),
(29, '2018-02-26 02:50:47', '4', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(30, '2018-02-26 02:51:53', '6', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(31, '2018-02-26 02:55:13', '7', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(32, '2018-02-26 02:55:50', '9', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(33, '2018-02-26 02:59:43', '9', NULL, 1, 1, 0, '123.00', NULL, '500.00', '', '0.00', '2018-02-28 15:14:29', NULL, 0.00, 0, 1, 1),
(34, '2018-02-26 03:00:09', '10', NULL, 1, 1, 0, '246.00', NULL, '250.00', '', '0.00', '2018-02-28 17:15:08', NULL, 0.00, 0, 1, 1),
(35, '2018-02-26 03:01:34', '3', NULL, 1, 1, 0, '123.00', NULL, '123.00', '', '0.00', '2018-03-01 15:10:00', NULL, 0.00, 0, 1, 1),
(36, '2018-02-28 05:22:55', '1', NULL, 1, 1, 0, '6972.00', NULL, '7000.00', '', '0.00', '2018-03-01 17:02:48', NULL, 1673.28, 12, 1, 1),
(37, '2018-02-28 06:56:34', '1', NULL, 1, 1, 1, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(38, '2018-03-01 01:30:54', '1', NULL, 1, 1, 1, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 0),
(39, '2018-03-01 01:59:01', '5', NULL, 1, 1, 1, '0.00', NULL, '0.00', '', '0.00', NULL, 'Adobo is out of stock. The customer left', 0.00, 0, 0, 0),
(40, '2018-03-01 07:05:20', '7', NULL, 1, 1, 1, '0.00', NULL, '0.00', '', '0.00', NULL, 'The customer needs to go to the hospital', 0.00, 0, 0, 0),
(41, '2018-03-01 07:07:34', '7', NULL, 1, 1, 1, '0.00', NULL, '0.00', '', '0.00', NULL, 'meeting is cancelled', 0.00, 0, 0, 0),
(42, '2018-03-01 07:28:29', '6', NULL, 1, 1, 0, '2480.00', NULL, '2500.00', '', '0.00', '2018-03-01 17:15:14', NULL, 0.00, 5, 1, 1),
(43, '2018-03-01 07:44:00', '11', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 1, 1),
(44, '2018-03-01 07:45:43', '7', NULL, 1, 1, 0, '2246.00', NULL, '2500.00', '', '0.00', '2018-03-01 17:16:00', NULL, 0.00, 0, 1, 1),
(45, '2018-03-01 09:16:43', '1', NULL, 1, 1, 0, '5849.00', NULL, '6000.00', '', '0.00', '2018-03-01 17:25:55', NULL, 0.00, 0, 1, 1),
(46, '2018-03-01 09:16:52', '1', NULL, 1, 1, 0, '6194.00', NULL, '7000.00', '', '0.00', '2018-03-02 09:10:08', NULL, 0.00, 0, 1, 1),
(47, '2018-03-02 01:35:02', '2', NULL, 1, 1, 0, '2616.00', NULL, '2700.00', '', '0.00', '2018-03-02 15:03:03', NULL, 0.00, 0, 1, 1),
(48, '2018-03-02 01:35:17', '4', NULL, 1, 1, 0, '0.00', NULL, '0.00', '', '0.00', NULL, NULL, 0.00, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `position_tbl`
--

CREATE TABLE IF NOT EXISTS `position_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position_tbl`
--

INSERT INTO `position_tbl` (`id`, `name`, `description`, `active`) VALUES
(1, 'admin', 'controls the system', 1),
(2, 'waiter', 'gets the order', 1),
(3, 'cashier', 'gets the payment', 1),
(4, 'cook', 'makes the food', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE IF NOT EXISTS `product_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL DEFAULT 'no desc',
  `picture` varchar(100) DEFAULT '/common/images/products/default_food_img.jpg',
  `product_code` varchar(10) DEFAULT '""',
  `category_fk` int(11) DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by_fk` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `stock` int(11) NOT NULL DEFAULT '1',
  `available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`id`, `name`, `description`, `picture`, `product_code`, `category_fk`, `date_modified`, `modified_by_fk`, `active`, `price`, `stock`, `available`) VALUES
(1, 'adobo', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '/common/images/products/default_food_img.jpg', 'p01', 1, '2018-02-05 06:33:12', 0, 1, '1123.00', 76, 1),
(2, 'srimp', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '/common/images/products/default_food_img.jpg', '112', 1, '2018-02-05 06:34:15', 0, 1, '123.00', 584, 1),
(3, 'Test', '123123123123', '/common/images/products/Desert3.jpg', '', 2, '2018-02-05 06:45:14', 0, 1, '1234.00', 20, 1),
(4, 'qwe', 'qwerwer', '/common/images/products/Tulips4.jpg', '', 2, '2018-02-05 06:47:30', 0, 1, '123.00', 47, 1),
(5, 'laing', 'wala pa 123', '/common/images/products/Lighthouse5.jpg', '', 2, '2018-02-05 07:43:25', 0, 1, '0.00', 86, 1),
(6, 'sinigang', '123123', '/common/images/products/Chrysanthemum6.jpg', '123', 2, '2018-02-05 10:56:30', 0, 1, '123.00', 68, 1),
(7, 'fried chicken', '1123123', '/common/images/products/Jellyfish7.jpg', 'f1', 1, '2018-02-05 10:59:36', 0, 1, '123.00', 20, 1),
(8, 'fried rice', '1231231231', '/common/images/products/Hydrangeas8.jpg', '123', 1, '2018-02-05 11:00:48', 1, 1, '1.00', 10, 1),
(9, 'lecheflan', '213', '/common/images/products/Jellyfish9.jpg', 'd01', 2, '2018-02-05 11:48:26', 0, 1, '123.00', 1, 1),
(10, 'adobong kangkong', '123', '/common/images/products/Penguins10.jpg', '', 1, '2018-02-05 12:00:33', 1, 1, '123.00', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

CREATE TABLE IF NOT EXISTS `tbl_images` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_images`
--

INSERT INTO `tbl_images` (`id`, `name`) VALUES
(1, 'Chrysanthemum.jpg'),
(2, 'Desert.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_tbl`
--
ALTER TABLE `access_tbl`
 ADD UNIQUE KEY `employee_id_fk` (`employee_id_fk`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `branch_tbl`
--
ALTER TABLE `branch_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_tbl`
--
ALTER TABLE `category_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_tbl`
--
ALTER TABLE `employee_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients_tbl`
--
ALTER TABLE `ingredients_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_line_tbl`
--
ALTER TABLE `order_line_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position_tbl`
--
ALTER TABLE `position_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_images`
--
ALTER TABLE `tbl_images`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch_tbl`
--
ALTER TABLE `branch_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category_tbl`
--
ALTER TABLE `category_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_tbl`
--
ALTER TABLE `employee_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ingredients_tbl`
--
ALTER TABLE `ingredients_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_line_tbl`
--
ALTER TABLE `order_line_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `position_tbl`
--
ALTER TABLE `position_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_images`
--
ALTER TABLE `tbl_images`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
