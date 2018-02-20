-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2018 at 10:04 AM
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
(1, 'jemuel', '123123', 'wala st', '213123', '123123', 2, 1, '123123.00', '2018-02-06 06:03:17', 1, 1, '1994-05-20', 1),
(2, 'Karen Talla', '123123', '123123123', '123123', '123123', 1, 1, '123123.00', '2018-02-06 07:04:43', 1, 1, '1995-05-04', 0),
(3, 'jenny', '12312312', '123123', '123123123', '123123', 1, 1, '123123.00', '2018-02-06 07:43:51', 1, 1, '1992-05-04', 0),
(4, 'qeqweq', '123123', '1231231', '123123', '123123', 1, 1, '132123.00', '2018-02-06 07:45:01', 1, 1, '1990-05-04', 1),
(5, 'adfasdfadsf', '123123', '123123', '123123', '123123123', 2, 1, '123123.00', '2018-02-06 07:45:42', 1, 1, '1992-05-04', 1),
(6, 'paolo', '12312312', '123123123', '123123123', '123123123', 1, 1, '13123.00', '2018-02-06 08:08:54', 1, 1, '1990-05-04', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

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
(45, 17, 2, 'srimp', '112', 1, '123.00', 0, 1);

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
  `void_fk` int(11) NOT NULL DEFAULT '0',
  `total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `customer_name` varchar(50) DEFAULT '""',
  `payment` decimal(11,2) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `down_payment` decimal(11,2) NOT NULL DEFAULT '0.00',
  `received_date` datetime DEFAULT NULL,
  `void_reason` varchar(150) DEFAULT NULL,
  `discount` double(11,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`id`, `order_date`, `seat_number`, `cashier_fk`, `branch_fk`, `waiter_fk`, `void_fk`, `total_amount`, `customer_name`, `payment`, `notes`, `down_payment`, `received_date`, `void_reason`, `discount`) VALUES
(1, '2018-02-09 03:40:42', '1', NULL, 1, 1, 0, '0.00', NULL, '1480.00', 'Deliver the icecream later wwwwww wwwwww wwwwww wwwwww wwwwww wwwwww wwwwww wwwwww', '1000.00', '2018-02-13 11:06:58', NULL, 0.00),
(2, '2018-02-09 04:35:23', '2', NULL, 1, 1, 0, '0.00', NULL, '1369.00', '', '0.00', '2018-02-13 11:10:47', NULL, 0.00),
(3, '2018-02-09 05:09:58', '1', NULL, 1, 1, 0, '0.00', NULL, '369.00', '', '0.00', '2018-02-13 11:16:12', NULL, 0.00),
(4, '2018-02-09 05:11:44', '1', NULL, 1, 1, 0, '0.00', NULL, '3616.00', '', '0.00', '2018-02-13 11:18:09', NULL, 0.00),
(5, '2018-02-09 05:14:27', '6', NULL, 1, 1, 0, '0.00', NULL, '246.00', '', '0.00', '2018-02-13 11:19:11', NULL, 0.00),
(6, '2018-02-13 03:19:55', '5', NULL, 1, 1, 0, '0.00', NULL, '246.00', '', '0.00', '2018-02-13 11:21:07', NULL, 0.00),
(7, '2018-02-13 03:20:07', '5', NULL, 1, 1, 0, '0.00', NULL, '247.00', '', '0.00', '2018-02-13 11:21:24', NULL, 0.00),
(8, '2018-02-13 03:20:37', '7', NULL, 1, 1, 0, '0.00', NULL, '2480.00', '', '0.00', '2018-02-13 12:18:29', NULL, 500.00),
(9, '2018-02-13 08:54:12', '1', NULL, 1, 1, 0, '0.00', NULL, '2603.00', '', '0.00', '2018-02-20 16:12:32', NULL, 0.00),
(10, '2018-02-13 09:04:06', '5', NULL, 1, 1, 0, '0.00', NULL, '123.00', '', '0.00', '2018-02-20 16:22:33', NULL, 0.00),
(11, '2018-02-20 07:51:49', '1', NULL, 1, 1, 0, '0.00', NULL, '1123.00', '', '0.00', '2018-02-20 16:22:35', NULL, 0.00),
(12, '2018-02-20 07:54:49', '4', NULL, 1, 1, 0, '0.00', NULL, '2480.00', '', '0.00', '2018-02-20 16:22:31', NULL, 0.00),
(13, '2018-02-20 08:23:20', '1', NULL, 1, 1, 0, '0.00', NULL, '2246.00', '', '0.00', '2018-02-20 16:26:37', NULL, 0.00),
(14, '2018-02-20 08:23:30', '1', NULL, 1, 1, 0, '0.00', NULL, '369.00', '', '0.00', '2018-02-20 16:26:39', NULL, 0.00),
(15, '2018-02-20 08:55:30', '3', NULL, 1, 1, 0, '0.00', NULL, '1246.00', '', '0.00', '2018-02-20 17:03:16', NULL, 0.00),
(16, '2018-02-20 08:55:48', '3', NULL, 1, 1, 0, '0.00', NULL, '6170.00', '', '0.00', '2018-02-20 17:03:18', NULL, 0.00),
(17, '2018-02-20 09:02:21', '4', NULL, 1, 1, 0, '0.00', NULL, '1246.00', '', '0.00', '2018-02-20 17:03:21', NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `position_tbl`
--

CREATE TABLE IF NOT EXISTS `position_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position_tbl`
--

INSERT INTO `position_tbl` (`id`, `name`, `description`, `active`) VALUES
(1, 'Waiter', 'Gets the orders and the payment of the customers', 1),
(2, 'cook', 'adfajadskasfd', 1);

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
  `price` decimal(11,2) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '1',
  `available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`id`, `name`, `description`, `picture`, `product_code`, `category_fk`, `date_modified`, `modified_by_fk`, `active`, `price`, `amount`, `available`) VALUES
(1, 'adobo', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '/common/images/products/default_food_img.jpg', 'p01', 1, '2018-02-05 06:33:12', 0, 1, '1123.00', 1, 1),
(2, 'srimp', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww', '/common/images/products/default_food_img.jpg', '112', 1, '2018-02-05 06:34:15', 0, 1, '123.00', 1, 1),
(3, 'Test', '123123123123', '/common/images/products/Desert3.jpg', '', 2, '2018-02-05 06:45:14', 0, 1, '1234.00', 1, 1),
(4, 'qwe', 'qwerwer', '/common/images/products/Tulips4.jpg', '', 2, '2018-02-05 06:47:30', 0, 1, '123.00', 1, 1),
(5, 'laing', 'wala pa 123', '/common/images/products/Lighthouse5.jpg', '', 2, '2018-02-05 07:43:25', 0, 1, NULL, 1, 1),
(6, 'sinigang', '123123', '/common/images/products/Chrysanthemum6.jpg', '123', 2, '2018-02-05 10:56:30', 0, 1, '123.00', 1, 1),
(7, 'fried chicken', '1123123', '/common/images/products/Jellyfish7.jpg', 'f1', 1, '2018-02-05 10:59:36', 0, 1, '123.00', 1, 1),
(8, 'fried rice', '1231231231', '/common/images/products/Hydrangeas8.jpg', '123', 1, '2018-02-05 11:00:48', 1, 1, '1.00', 1, 1),
(9, 'lecheflan', '213', '/common/images/products/Jellyfish9.jpg', 'd01', 2, '2018-02-05 11:48:26', 0, 1, '123.00', 1, 1),
(10, 'adobong kangkong', '123', '/common/images/products/Penguins10.jpg', '', 1, '2018-02-05 12:00:33', 1, 1, '123.00', 1, 1);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `position_tbl`
--
ALTER TABLE `position_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
