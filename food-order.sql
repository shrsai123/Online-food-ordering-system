-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 21, 2022 at 07:45 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-order`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catID`, `Name`) VALUES
(4001, 'North Indian'),
(4002, 'South Indian'),
(4003, 'Pizza'),
(4004, 'Burger');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(4) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `contact_number` varchar(11) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `contact_number`, `address`) VALUES
(1001, 'vaibhav Palkar', '1234567801', '01 SND, aundh, pune'),
(1002, 'pratik kijbil', '1234567802', '02 WBG, kothrud, pune'),
(1003, 'sagar amritkar', '1234567803', '03 QWE, wakad, pune'),
(1004, 'mitali basargi', '1234567804', '04 RTY, sanghavi, pune'),
(1005, 'jagruti bhoite', '1234567805', '05 SGV, sanghavi, pune'),
(1006, 'sandhya shirale', '1234567806', '06 ASD, ravet, pune'),
(1007, 'uday patil', '1234567807', '07 BLA, baner, pune'),
(1008, 'punam kale', '1234567808', '08 SNR, warje, pune'),
(1009, 'vighnesh gopinath', '1234567809', '09 ABP, ravet, pune'),
(1010, 'nilesh supekar', '1234567810', '13 MGV, moshi, pune'),
(1011, 'Murtaza khn', '1234567811', '17 ABP, vadgaon, pune'),
(1012, 'gopal kasat', '1234567812', '19 ABP, pashan, pune'),
(1013, 'yogesh jadhav', '1234567813', '20 ABP, pimpri, pune'),
(1014, 'apeksha jadhav', '1234567814', '21 ABP, sinhagad, pune'),
(1015, 'harshad kunjir', '1234567815', '22 DVK, Uruli, pune'),
(1016, 'manash konwar', '1234567816', '57 SND, kasarwadi, pune'),
(1017, 'someshwar kale', '1234567817', '11 MKN, mukund nagar, pune');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `food_id` int(7) NOT NULL,
  `food_name` varchar(20) NOT NULL,
  `price_per_unit` decimal(5,2) NOT NULL,
  `catID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`food_id`, `food_name`, `price_per_unit`, `catID`) VALUES
(9999411, 'allo paratha', '80.00', 4001),
(9999412, 'veg meal', '120.00', 4002),
(9999413, 'cheese pizza', '20.00', 4003),
(9999414, 'Veg Burger', '220.00', 4004);

-- --------------------------------------------------------

--
-- Table structure for table `order_food`
--

CREATE TABLE `order_food` (
  `order_id` int(4) NOT NULL,
  `customer_id` int(4) NOT NULL,
  `restaurant_id` int(3) NOT NULL,
  `total_cost` int(10) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_invoice`
--

CREATE TABLE `order_invoice` (
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(3) NOT NULL,
  `restaurant_name` varchar(20) NOT NULL,
  `rlocation` varchar(20) NOT NULL,
  `rrating` decimal(2,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `restaurant_name`, `rlocation`, `rrating`) VALUES
(101, 'hydrabadi spice', 'aundh', '4.5'),
(102, 'hotel green park', 'baner', '4.1'),
(103, 'saffron', 'pashan', '3.9'),
(104, 'thomson restro', 'sanghavi', '3.6'),
(105, 'laa unico', 'mukund nagar', '4.3'),
(106, 'blue water', 'ravet', '4.2'),
(107, 'jalsaa restaurant', 'wakad', '4.3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `catID` (`catID`);

--
-- Indexes for table `order_food`
--
ALTER TABLE `order_food`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD PRIMARY KEY (`order_id`,`food_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `category` (`catID`);

--
-- Constraints for table `order_food`
--
ALTER TABLE `order_food`
  ADD CONSTRAINT `order_food_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  ADD CONSTRAINT `order_food_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `order_invoice`
--
ALTER TABLE `order_invoice`
  ADD CONSTRAINT `order_invoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_food` (`order_id`),
  ADD CONSTRAINT `order_invoice_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
