-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2018 at 02:03 PM
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `fixed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_tbl`
--

INSERT INTO `access_tbl` (`employee_id_fk`, `username`, `password`, `active`, `fixed`) VALUES
(1, 'jemuel', '123', 1, 1),
(2, 'karen', '123', 1, 0),
(3, 'jen', '123', 1, 0);

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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `fixed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_tbl`
--

INSERT INTO `branch_tbl` (`id`, `name`, `address`, `description`, `branch_code`, `modified_by_fk`, `active`, `fixed`) VALUES
(1, 'sm north', 'sm north edsa', 'testing', '123', 1, 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_tbl`
--

INSERT INTO `category_tbl` (`id`, `name`, `category_code`, `description`, `date_modified`, `modified_by_fk`, `active`) VALUES
(1, 'TUNA', '', '', '2018-03-05 09:34:20', 1, 1),
(2, 'BANGUS', '', '', '2018-03-05 09:34:20', 1, 1),
(3, 'BEEF', '', '', '2018-03-05 09:34:20', 1, 1),
(4, 'CHICKEN', '', '', '2018-03-05 09:34:20', 1, 1),
(5, 'PORK', '', '', '2018-03-05 09:34:20', 1, 1),
(6, 'VEGETABLES', '', '', '2018-03-05 09:34:20', 1, 1),
(7, 'PUSIT', '', '', '2018-03-05 09:34:20', 1, 1),
(8, 'SHRIMP', '', '', '2018-03-05 09:34:20', 1, 1),
(9, 'OTHER SEAFOODS', '', '', '2018-03-05 09:34:20', 1, 1),
(10, 'SPECIAL APPETIZERS', '', '', '2018-03-05 09:34:20', 1, 1),
(11, 'EXOTIC FOODS', '', '', '2018-03-05 09:34:20', 1, 1),
(12, 'SHORT ORDER', '', '', '2018-03-05 09:34:20', 1, 1),
(13, 'SOUP', '', '', '2018-03-05 09:34:20', 1, 1),
(14, 'RICE', '', '', '2018-03-05 09:34:20', 1, 1),
(15, 'DESSERTS', '', '', '2018-03-05 09:34:20', 1, 1),
(16, 'SASHIMI', '', '', '2018-03-05 09:34:20', 1, 1),
(17, 'TEMPURA', '', '', '2018-03-05 09:34:20', 1, 1),
(18, 'MAKI', '', '', '2018-03-05 09:34:20', 1, 1),
(19, 'FRY', '', '', '2018-03-05 09:34:20', 1, 1),
(20, 'SALAD', '', '', '2018-03-05 09:34:20', 1, 1),
(21, 'SUSHI', '', '', '2018-03-05 09:34:20', 1, 1),
(22, 'TEPANYAKI', '', '', '2018-03-05 09:34:20', 1, 1),
(23, 'MAKI ROLL MIX PLATIER', '', '', '2018-03-05 09:34:20', 1, 1),
(24, 'JUICES', '', '', '2018-03-05 09:34:20', 1, 1),
(25, 'SOFTDRINKS IN CAN', '', '', '2018-03-05 09:34:20', 1, 1),
(26, 'NON-ALCOHOLIC COCKTAIL', '', '', '2018-03-05 09:34:20', 1, 1),
(27, 'ALOHOLIC COCKTAILS', '', '', '2018-03-05 09:34:20', 1, 1),
(28, 'BEERS', '', '', '2018-03-05 09:34:20', 1, 1),
(29, 'WINE', '', '', '2018-03-05 09:34:20', 1, 1),
(30, 'VODKA', '', '', '2018-03-05 09:34:20', 1, 1),
(31, 'VODKA (shot)', '', '', '2018-03-05 09:34:20', 1, 1),
(32, 'TEQUILA (shot)', '', '', '2018-03-05 09:34:20', 1, 1),
(33, 'RUM', '', '', '2018-03-05 09:34:20', 1, 1),
(34, 'BRANDY', '', '', '2018-03-05 09:34:20', 1, 1),
(35, 'PLA-PLA', '', '', '2018-03-06 10:24:37', 1, 1),
(36, 'BLUE MARLIN', '', '', '2018-03-06 10:24:37', 1, 1);

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
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `fixed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_tbl`
--

INSERT INTO `employee_tbl` (`id`, `name`, `picture`, `address`, `contact_number`, `email`, `position_fk`, `branch_fk`, `salary`, `date_modified`, `modified_by_fk`, `active`, `birth_day`, `gender`, `fixed`) VALUES
(1, 'jemuel', '123123', 'wala st', '213123', '123123', 1, 1, '123123.00', '2018-02-06 06:03:17', 1, 1, '1994-05-20', 1, 1),
(2, 'Karen Talla', '123123', '123123123', '123123', '123123', 2, 1, '123123.00', '2018-02-06 07:04:43', 1, 1, '1995-05-04', 0, 0),
(3, 'jenny', '12312312', '123123', '123123123', '123123', 3, 1, '123123.00', '2018-02-06 07:43:51', 1, 1, '1992-05-04', 0, 0),
(4, 'testing employee', '123123', '1231231', '123123', '123123', 4, 1, '132123.00', '2018-02-06 07:45:01', 1, 1, '1990-05-04', 1, 0),
(5, 'adfasdfadsf', '123123', '123123', '123123', '123123123', 4, 1, '123123.00', '2018-02-06 07:45:42', 1, 0, '1992-05-04', 1, 0),
(6, 'paolo', '12312312', '123123123', '123123123', '123123123', 4, 1, '13123.00', '2018-02-06 08:08:54', 1, 1, '1990-05-04', 1, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_line_tbl`
--

INSERT INTO `order_line_tbl` (`id`, `order_id_fk`, `product_id_fk`, `name`, `code`, `quantity`, `price`, `served`, `served_items`) VALUES
(1, 1, 161, 'Blue Marlin Wrapped w/ Onion & Tomato', '""', 1, '308.00', 0, 1),
(2, 1, 160, 'Plain Blue Marlin ', '""', 1, '238.00', 0, 1),
(3, 1, 159, 'Grilled Blue Marlin', '""', 1, '280.00', 0, 1),
(4, 2, 158, 'Blue Marlin w/ Lemon Sauce ', '""', 1, '280.00', 0, 1),
(5, 2, 157, 'Blue Marlin w/ Butter & Garlic ', '""', 1, '280.00', 0, 1),
(6, 2, 156, 'Blue Marlin In Spicy Veggetables ', '""', 1, '280.00', 0, 1),
(7, 2, 153, 'Tilapia Deep Fried w/ Garlic', '""', 1, '130.00', 0, 1),
(8, 2, 154, 'Tilapia Pinaputok w/ Onion & Tomato', '""', 1, '198.00', 0, 1),
(9, 2, 155, 'Sizzling Blue Marlin ', '""', 10, '280.00', 0, 10),
(10, 3, 152, 'Tilapia w/ Mayonnaise & Cheese', '""', 1, '190.00', 0, 1),
(11, 3, 151, 'Tilapia w/ Oyster & Garlic', '""', 1, '180.00', 0, 1),
(12, 3, 151, 'Tilapia w/ Oyster & Garlic', '""', 1, '180.00', 0, 1),
(13, 3, 151, 'Tilapia w/ Oyster & Garlic', '""', 1, '180.00', 0, 1),
(14, 3, 151, 'Tilapia w/ Oyster & Garlic', '""', 1, '180.00', 0, 1),
(15, 3, 152, 'Tilapia w/ Mayonnaise & Cheese', '""', 1, '190.00', 0, 1),
(16, 3, 152, 'Tilapia w/ Mayonnaise & Cheese', '""', 1, '190.00', 0, 1),
(17, 4, 150, 'Steamed Tilapia', '""', 1, '170.00', 0, 0),
(18, 4, 150, 'Steamed Tilapia', '""', 1, '170.00', 0, 0),
(19, 4, 150, 'Steamed Tilapia', '""', 1, '170.00', 0, 0),
(20, 5, 161, 'Blue Marlin Wrapped w/ Onion & Tomato', '""', 1, '308.00', 0, 1),
(21, 5, 161, 'Blue Marlin Wrapped w/ Onion & Tomato', '""', 1, '308.00', 0, 1),
(22, 5, 161, 'Blue Marlin Wrapped w/ Onion & Tomato', '""', 1, '308.00', 0, 1),
(23, 5, 161, 'Blue Marlin Wrapped w/ Onion & Tomato', '""', 1, '308.00', 0, 1),
(24, 6, 155, 'Sizzling Blue Marlin ', '""', 1, '280.00', 0, 1),
(25, 7, 155, 'Sizzling Blue Marlin ', '""', 1, '280.00', 0, 1),
(26, 9, 149, 'Sizzling Tilapia', '""', 2, '170.00', 0, 2),
(27, 10, 147, 'Mixed Sushi', '""', 1, '625.00', 0, 1),
(28, 10, 146, 'Ebiko Sushi', '""', 1, '115.00', 0, 1);

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
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `vat` decimal(11,2) NOT NULL DEFAULT '12.00',
  `service_charge` decimal(11,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`id`, `order_date`, `seat_number`, `cashier_fk`, `branch_fk`, `waiter_fk`, `void`, `total_amount`, `customer_name`, `payment`, `notes`, `down_payment`, `received_date`, `void_reason`, `discount`, `discount_percentage`, `printed`, `done`, `vat`, `service_charge`) VALUES
(1, '2018-03-09 01:09:25', '12', NULL, 1, 1, 0, '826.00', '', '1000.00', '', '0.00', '2018-03-13 18:29:32', NULL, 0.00, 0, 1, 1, '12.00', '0.00'),
(2, '2018-03-13 10:29:16', '1', NULL, 1, 1, 0, '3968.00', '', '500.25', '', '0.00', '2018-03-13 20:02:02', NULL, 0.00, 50, 1, 1, '12.00', '0.00'),
(3, '2018-03-13 12:00:49', '5', 3, 1, 1, 0, '1290.00', '', '1300.00', '', '0.00', '2018-03-13 20:36:34', NULL, 0.00, 0, 1, 1, '12.00', '0.00'),
(4, '2018-03-13 12:01:46', '5', 3, 1, 1, 1, '0.00', '', '0.00', '', '0.00', NULL, 'walang bayad', 0.00, 0, 0, 0, '12.00', '0.00'),
(5, '2018-03-13 12:05:48', '1', 3, 1, 1, 0, '1232.00', '', '1555.00', '', '0.00', '2018-03-16 19:24:13', NULL, 0.00, 0, 1, 1, '12.00', '0.00'),
(6, '2018-03-13 12:06:34', '6', NULL, 1, 1, 0, '280.00', '', '1000.00', '', '0.00', '2018-03-16 20:53:05', NULL, 100.00, 12, 1, 0, '12.00', '0.00'),
(7, '2018-03-13 12:07:15', '3', NULL, 1, 1, 0, '280.00', '', '0.00', '', '0.00', '2018-03-16 20:21:48', NULL, 0.00, 0, 1, 0, '12.00', '0.00'),
(9, '2018-03-16 11:06:23', '1', NULL, 1, 1, 0, '340.00', '', '0.00', '', '0.00', '2018-03-16 20:22:01', NULL, 0.00, 0, 1, 0, '15.00', '0.00'),
(10, '2018-03-16 12:22:26', '2', NULL, 1, 1, 0, '740.00', '', '1000.00', '', '0.00', '2018-03-16 20:30:25', NULL, 0.00, 0, 1, 0, '12.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `position_tbl`
--

CREATE TABLE IF NOT EXISTS `position_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `fixed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position_tbl`
--

INSERT INTO `position_tbl` (`id`, `name`, `description`, `active`, `fixed`) VALUES
(1, 'admin', 'controls the system', 1, 1),
(2, 'waiter', 'gets the order', 1, 1),
(3, 'cashier', 'gets the payment', 1, 1),
(4, 'cook', 'makes the food', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pricing_config_tbl`
--

CREATE TABLE IF NOT EXISTS `pricing_config_tbl` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `percentage` decimal(11,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricing_config_tbl`
--

INSERT INTO `pricing_config_tbl` (`id`, `name`, `percentage`) VALUES
(1, 'vat', '12.00'),
(2, 'service_charge', '0.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`id`, `name`, `description`, `picture`, `product_code`, `category_fk`, `date_modified`, `modified_by_fk`, `active`, `price`, `stock`, `available`) VALUES
(1, 'Sinigang Bangus Belly', 'no desc', '/common/images/products/default_food_img.jpg', 'B01', 2, '2018-03-06 09:46:48', 0, 1, '260.00', 0, 1),
(2, 'Sizzling Bangus Belly (4pcs)', 'no desc', '/common/images/products/default_food_img.jpg', 'B02', 2, '2018-03-06 09:46:48', 0, 1, '220.00', 100, 1),
(3, 'Bangus La Pobre', 'no desc', '/common/images/products/default_food_img.jpg', 'B03', 2, '2018-03-06 09:46:48', 0, 1, '240.00', 100, 1),
(4, 'Bangus w/ Tomato & Cheese Wrap', 'no desc', '/common/images/products/default_food_img.jpg', 'B04', 2, '2018-03-06 09:46:48', 0, 1, '250.00', 100, 1),
(5, 'Rellenong Bangus', 'no desc', '/common/images/products/default_food_img.jpg', 'B05', 2, '2018-03-06 09:46:48', 0, 1, '290.00', 100, 1),
(6, 'Kare Kare', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '350.00', 100, 1),
(7, 'Beef Steak', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '150.00', 100, 1),
(8, 'Beef Tapa', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '140.00', 100, 1),
(9, 'Sizzling Beef Lind', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '260.00', 100, 1),
(10, 'Sizzling Korean Beef', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '220.00', 100, 1),
(11, 'Sizzling Tender Join String', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '190.00', 100, 1),
(12, 'Sizzling T-Bone Steak', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '205.00', 100, 1),
(13, 'Beef Morcon (1roll)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 3, '2018-03-06 09:46:48', 1, 1, '390.00', 100, 1),
(14, 'Fried Whole', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '340.00', 100, 1),
(15, 'Fried Half', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '190.00', 100, 1),
(16, 'Buttered Whole', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '380.00', 100, 1),
(17, 'Buttered Half', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '210.00', 100, 1),
(18, 'Sizzling Chicken', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '230.00', 100, 1),
(19, 'Sizzling Spicy Chicken', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '230.00', 100, 1),
(20, 'Sizzling Spicy Chicken Feet', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '136.00', 100, 1),
(21, 'Sizzling Buffalo Wings (4pcs)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '189.00', 100, 1),
(22, 'Sizzling Atay Balonbalunan', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '100.00', 100, 1),
(23, 'Chicken BBQ Legs', 'no desc', '/common/images/products/default_food_img.jpg', '""', 4, '2018-03-06 09:46:48', 1, 1, '120.00', 100, 1),
(24, 'Sizzing Sisig', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '198.00', 100, 1),
(25, 'Crispy Pata', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '420.00', 100, 1),
(26, 'Crispy Ulo', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '490.00', 100, 1),
(27, 'Pork Liempo BBQ', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(28, 'Asado', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(29, 'Lechon Kawali', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(30, 'Chicharon Bulaklak', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '130.00', 100, 1),
(31, 'Sinigang na Liempo', 'no desc', '/common/images/products/default_food_img.jpg', '""', 5, '2018-03-06 09:46:48', 1, 1, '305.00', 100, 1),
(32, 'Ampalaya con Hipon', 'no desc', '/common/images/products/default_food_img.jpg', '""', 6, '2018-03-06 09:46:48', 1, 1, '198.00', 100, 1),
(33, 'Beef Ampalaya', 'no desc', '/common/images/products/default_food_img.jpg', '""', 6, '2018-03-06 09:46:48', 1, 1, '210.00', 100, 1),
(34, 'Chopsuey', 'no desc', '/common/images/products/default_food_img.jpg', '""', 6, '2018-03-06 09:46:48', 1, 1, '230.00', 100, 1),
(35, 'Pinakbet', 'no desc', '/common/images/products/default_food_img.jpg', '""', 6, '2018-03-06 09:46:48', 1, 1, '245.00', 100, 1),
(36, 'Vegetable Stick w/ Mayo Dipping', 'no desc', '/common/images/products/default_food_img.jpg', '""', 6, '2018-03-06 09:46:48', 1, 1, '110.00', 100, 1),
(37, 'Ohonomiyaki(Cabbage Pizza)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 6, '2018-03-06 09:46:48', 1, 1, '200.00', 100, 1),
(38, 'Pusit Sizzling', 'no desc', '/common/images/products/default_food_img.jpg', '""', 7, '2018-03-06 09:46:48', 1, 1, '210.00', 100, 1),
(39, 'Pusit Grilled', 'no desc', '/common/images/products/default_food_img.jpg', '""', 7, '2018-03-06 09:46:48', 1, 1, '190.00', 100, 1),
(40, 'Pusit w/ Onion & Tomato Filling', 'no desc', '/common/images/products/default_food_img.jpg', '""', 7, '2018-03-06 09:46:48', 1, 1, '227.00', 100, 1),
(41, 'Pusit Calamares', 'no desc', '/common/images/products/default_food_img.jpg', '""', 7, '2018-03-06 09:46:48', 1, 1, '160.00', 100, 1),
(42, 'Pusit Sizzling Japanese Ika', 'no desc', '/common/images/products/default_food_img.jpg', '""', 7, '2018-03-06 09:46:48', 1, 1, '230.00', 100, 1),
(43, 'Crispy Squid Head', 'no desc', '/common/images/products/default_food_img.jpg', '""', 7, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(44, 'Srimp Sizzling Spicy', 'no desc', '/common/images/products/default_food_img.jpg', '""', 8, '2018-03-06 09:46:48', 1, 1, '240.00', 100, 1),
(45, 'Srimp Sizzling Gambas', 'no desc', '/common/images/products/default_food_img.jpg', '""', 8, '2018-03-06 09:46:48', 1, 1, '190.00', 100, 1),
(46, 'Shrimp w/ Oyster Sauce', 'no desc', '/common/images/products/default_food_img.jpg', '""', 8, '2018-03-06 09:46:48', 1, 1, '170.00', 100, 1),
(47, 'Srimp Sinigang', 'no desc', '/common/images/products/default_food_img.jpg', '""', 8, '2018-03-06 09:46:48', 1, 1, '340.00', 100, 1),
(48, 'Camara Rebesado', 'no desc', '/common/images/products/default_food_img.jpg', '""', 8, '2018-03-06 09:46:48', 1, 1, '150.00', 100, 1),
(49, 'Halabis', 'no desc', '/common/images/products/default_food_img.jpg', '""', 8, '2018-03-06 09:46:48', 1, 1, '156.00', 100, 1),
(50, 'Fry o Fish Fillet', 'no desc', '/common/images/products/default_food_img.jpg', '""', 9, '2018-03-06 09:46:48', 1, 1, '150.00', 100, 1),
(51, 'Crispy Crablets', 'no desc', '/common/images/products/default_food_img.jpg', '""', 9, '2018-03-06 09:46:48', 1, 1, '160.00', 100, 1),
(52, 'Kilawen', 'no desc', '/common/images/products/default_food_img.jpg', '""', 9, '2018-03-06 09:46:48', 1, 1, '190.00', 100, 1),
(53, 'Deep Fried Salmon Head', 'no desc', '/common/images/products/default_food_img.jpg', '""', 9, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(54, 'Sinigang sa Miso (Salmon Head)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 9, '2018-03-06 09:46:48', 1, 1, '280.00', 100, 1),
(55, 'Cheese Stick', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '110.00', 100, 1),
(56, 'Chilli Cheese Bite', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '120.00', 100, 1),
(57, 'Fish Shanghai Roll', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '120.00', 100, 1),
(58, 'French Fries', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '80.00', 100, 1),
(59, 'Lumpiang Shanghai', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '120.00', 100, 1),
(60, 'Onion Rings', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '90.00', 100, 1),
(61, 'Sliced Pipin', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '70.00', 100, 1),
(62, 'Fried Tofu', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '90.00', 100, 1),
(63, 'Sizzling Sweet Corn', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '120.00', 100, 1),
(64, 'Sizzling Hotdog', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '160.00', 100, 1),
(65, 'Sizzling 3 Kinds of Mushroom', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(66, 'Sizzling Mushroom', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '170.00', 100, 1),
(67, 'Sizzling Tofu w/ Special Chinese Sauce', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '170.00', 100, 1),
(68, 'Sizzling Young Corn', 'no desc', '/common/images/products/default_food_img.jpg', '""', 10, '2018-03-06 09:46:48', 1, 1, '140.00', 100, 1),
(69, 'Sizzling Spicy Fried Frog', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '180.00', 100, 1),
(70, 'Sizzling Adobong Kambing', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '260.00', 100, 1),
(71, 'Sizzling Kalderetang Kambing', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '280.00', 100, 1),
(72, 'Adobong Igat', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '210.00', 100, 1),
(73, 'Sizzling Adobong Kabayo', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '230.00', 100, 1),
(74, 'Tapa Kabayo', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '160.00', 100, 1),
(75, 'Crispy Tahong', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '160.00', 100, 1),
(76, 'Tortang Talaba', 'no desc', '/common/images/products/default_food_img.jpg', '""', 11, '2018-03-06 09:46:48', 1, 1, '190.00', 100, 1),
(77, 'Pancit Bihon', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '138.00', 100, 1),
(78, 'Pancit Canton', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '148.00', 100, 1),
(79, 'Pancit Mike & Bihon', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '148.00', 100, 1),
(80, 'Sotangho Guisado', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '136.00', 100, 1),
(81, 'Large Pancit Bihon', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '260.00', 100, 1),
(82, 'Large Pancit Canton', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '270.00', 100, 1),
(83, 'Large Pancit Mike & Bihon', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '270.00', 100, 1),
(84, 'Large Sotangho Guisado', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '260.00', 100, 1),
(85, 'Lomi Special', 'no desc', '/common/images/products/default_food_img.jpg', '""', 12, '2018-03-06 10:01:59', 1, 1, '200.00', 100, 1),
(86, 'Crab & Corn', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '50.00', 100, 1),
(87, 'Chicken & Corn', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '45.00', 100, 1),
(88, 'Nido Oriental', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '45.00', 100, 1),
(89, 'Cream of Mushroom', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '50.00', 100, 1),
(90, 'Large Crab & Corn', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '180.00', 100, 1),
(91, 'Large Chicken & Corn', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '170.00', 100, 1),
(92, 'Large Nido Oriental', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '170.00', 100, 1),
(93, 'Large Cream of Mushroom', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:01:59', 1, 1, '180.00', 100, 1),
(94, 'Pandan Rice', 'no desc', '/common/images/products/default_food_img.jpg', '""', 14, '2018-03-06 10:16:32', 1, 1, '25.00', 100, 1),
(95, 'Garlic Rice', 'no desc', '/common/images/products/default_food_img.jpg', '""', 14, '2018-03-06 10:16:32', 1, 1, '28.00', 100, 1),
(96, 'Fruit Salad', 'no desc', '/common/images/products/default_food_img.jpg', '""', 15, '2018-03-06 10:16:32', 1, 1, '40.00', 100, 1),
(97, 'Leche Flan Royale', 'no desc', '/common/images/products/default_food_img.jpg', '""', 15, '2018-03-06 10:16:32', 1, 1, '125.00', 100, 1),
(98, 'Tuna Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '220.00', 100, 1),
(99, 'Salmon Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '250.00', 100, 1),
(100, 'Ebi Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '230.00', 100, 1),
(101, 'Kani Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '190.00', 100, 1),
(102, 'Tamago Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '120.00', 100, 1),
(103, 'Ika Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '150.00', 100, 1),
(104, 'Uni Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '230.00', 100, 1),
(105, 'Unagi Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '220.00', 100, 1),
(106, 'Ebiko Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '240.00', 100, 1),
(107, 'Mixed Sashimi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 16, '2018-03-06 10:16:32', 1, 1, '330.00', 100, 1),
(108, 'Ebi Tempura (6pcs)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 17, '2018-03-06 10:16:32', 1, 1, '360.00', 100, 1),
(109, 'Kisu Tempura (6pcs)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 17, '2018-03-06 10:16:32', 1, 1, '330.00', 100, 1),
(110, 'Kani Tempura (6pcs)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 17, '2018-03-06 10:16:32', 1, 1, '325.00', 100, 1),
(111, 'Kani Pura Tempura (6pcs)', 'no desc', '/common/images/products/default_food_img.jpg', '""', 17, '2018-03-06 10:16:32', 1, 1, '325.00', 100, 1),
(112, 'Vegetable Tempura', 'no desc', '/common/images/products/default_food_img.jpg', '""', 17, '2018-03-06 10:16:32', 1, 1, '255.00', 100, 1),
(113, 'Special Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '255.00', 100, 1),
(114, 'Tekka Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '205.00', 100, 1),
(115, 'Kuppa Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '115.00', 100, 1),
(116, 'Unagi Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '240.00', 100, 1),
(117, 'Kani Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '190.00', 100, 1),
(118, 'Tamago Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '140.00', 100, 1),
(119, 'Salmon Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '160.00', 100, 1),
(120, 'Tuna Salad Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '160.00', 100, 1),
(121, 'Tc Maki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 18, '2018-03-06 10:16:32', 1, 1, '245.00', 100, 1),
(122, 'Ebi Fry', 'no desc', '/common/images/products/default_food_img.jpg', '""', 19, '2018-03-06 10:22:27', 1, 1, '335.00', 100, 1),
(123, 'Kisu Fry', 'no desc', '/common/images/products/default_food_img.jpg', '""', 19, '2018-03-06 10:22:27', 1, 1, '325.00', 100, 1),
(124, 'Kani Fry', 'no desc', '/common/images/products/default_food_img.jpg', '""', 19, '2018-03-06 10:22:27', 1, 1, '315.00', 100, 1),
(125, 'Kani Salad', 'no desc', '/common/images/products/default_food_img.jpg', '""', 20, '2018-03-06 10:22:27', 1, 1, '250.00', 100, 1),
(126, 'Tuna Salad', 'no desc', '/common/images/products/default_food_img.jpg', '""', 20, '2018-03-06 10:22:27', 1, 1, '275.00', 100, 1),
(127, 'Miso Soup', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:22:27', 1, 1, '250.00', 100, 1),
(128, 'Japanese Salmon Head Miso Soup', 'no desc', '/common/images/products/default_food_img.jpg', '""', 13, '2018-03-06 10:22:27', 1, 1, '275.00', 100, 1),
(129, 'Shrimp Tepanyaki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 22, '2018-03-06 10:22:27', 1, 1, '240.00', 100, 1),
(130, 'Tuna Tepanyaki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 22, '2018-03-06 10:22:27', 1, 1, '220.00', 100, 1),
(131, 'Ika Tepanyaki', 'no desc', '/common/images/products/default_food_img.jpg', '""', 22, '2018-03-06 10:22:27', 1, 1, '220.00', 100, 1),
(132, 'California Maki Plater', 'no desc', '/common/images/products/default_food_img.jpg', '""', 23, '2018-03-06 10:22:27', 1, 1, '850.00', 100, 1),
(133, 'Crazy Maki  Plater', 'no desc', '/common/images/products/default_food_img.jpg', '""', 23, '2018-03-06 10:22:27', 1, 1, '750.00', 100, 1),
(134, 'Tamago Maki Plater', 'no desc', '/common/images/products/default_food_img.jpg', '""', 23, '2018-03-06 10:22:27', 1, 1, '750.00', 100, 1),
(135, 'Salmon Maki Plater', 'no desc', '/common/images/products/default_food_img.jpg', '""', 23, '2018-03-06 10:22:27', 1, 1, '700.00', 100, 1),
(136, 'Tekka Maki Plater', 'no desc', '/common/images/products/default_food_img.jpg', '""', 23, '2018-03-06 10:22:27', 1, 1, '650.00', 100, 1),
(137, 'Futo Maki Plater', 'no desc', '/common/images/products/default_food_img.jpg', '""', 23, '2018-03-06 10:22:27', 1, 1, '600.00', 100, 1),
(138, 'Tuna Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '75.00', 100, 1),
(139, 'Salmon Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '50.00', 100, 1),
(140, 'Ebi Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '65.00', 100, 1),
(141, 'Kani Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '55.00', 100, 1),
(142, 'Tamago Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '45.00', 100, 1),
(143, 'Ika Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '65.00', 100, 1),
(144, 'Lui Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '125.00', 100, 1),
(145, 'Unagi Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '90.00', 100, 1),
(146, 'Ebiko Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '115.00', 99, 1),
(147, 'Mixed Sushi', 'no desc', '/common/images/products/default_food_img.jpg', '""', 21, '2018-03-06 10:22:27', 1, 1, '625.00', 99, 1),
(148, 'Tilapia Sisig', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '180.00', 100, 1),
(149, 'Sizzling Tilapia', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '170.00', 98, 1),
(150, 'Steamed Tilapia', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '170.00', 97, 1),
(151, 'Tilapia w/ Oyster & Garlic', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '180.00', 96, 1),
(152, 'Tilapia w/ Mayonnaise & Cheese', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '190.00', 97, 1),
(153, 'Tilapia Deep Fried w/ Garlic', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '130.00', 99, 1),
(154, 'Tilapia Pinaputok w/ Onion & Tomato', 'no desc', '/common/images/products/default_food_img.jpg', '""', 35, '2018-03-06 10:30:54', 1, 1, '198.00', 99, 1),
(155, 'Sizzling Blue Marlin ', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '280.00', 88, 1),
(156, 'Blue Marlin In Spicy Veggetables ', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '280.00', 99, 1),
(157, 'Blue Marlin w/ Butter & Garlic ', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '280.00', 99, 1),
(158, 'Blue Marlin w/ Lemon Sauce ', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '280.00', 99, 1),
(159, 'Grilled Blue Marlin', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '280.00', 99, 1),
(160, 'Plain Blue Marlin ', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '238.00', 99, 1),
(161, 'Blue Marlin Wrapped w/ Onion & Tomato', 'no desc', '/common/images/products/default_food_img.jpg', '""', 36, '2018-03-06 10:30:54', 1, 1, '308.00', 95, 1);

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
-- Indexes for table `pricing_config_tbl`
--
ALTER TABLE `pricing_config_tbl`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `employee_tbl`
--
ALTER TABLE `employee_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `order_line_tbl`
--
ALTER TABLE `order_line_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `position_tbl`
--
ALTER TABLE `position_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pricing_config_tbl`
--
ALTER TABLE `pricing_config_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=162;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
