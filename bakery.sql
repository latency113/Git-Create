-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2024 at 08:33 AM
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
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cateID` int(5) NOT NULL COMMENT 'รหัสประเภท',
  `cateName` varchar(20) NOT NULL COMMENT 'ฃื่อประเภท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cateID`, `cateName`) VALUES
(1, 'ขนมปัง'),
(2, 'เค้ก');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(5) NOT NULL COMMENT 'รหัสลูกค้า',
  `name` varchar(40) NOT NULL COMMENT 'ชื่อลูกค้า',
  `address` varchar(255) NOT NULL COMMENT 'ที่อยู่',
  `phone` text NOT NULL COMMENT 'เบอร์โทร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `name`, `address`, `phone`) VALUES
(1, 'สมชาย ไมตรี', 'ดาวอังคาร 400 จังหวัดนครปฐม', '0912340000'),
(2, 'ชาย ไมตรี', 'ดาวอังคาร 400 จังหวัดนครปฐม', '0912340000'),
(3, 'ไมตรี สมชาย', 'ดาวอังคาร 400 จังหวัดนครปฐม', '0912340000'),
(4, 'สมหญิง สวยมาก', 'ดาวอังคาร 400 จังหวัดนครปฐม', '0912340000'),
(5, 'สมใจ สมชาย', 'ดาวอังคาร 400 จังหวัดนครปฐม', '0912340000');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(5) NOT NULL COMMENT 'รหัสพนักงาน',
  `name` varchar(40) NOT NULL COMMENT 'ชื่อพนักงาน',
  `adress` varchar(255) NOT NULL COMMENT 'ที่อยู่'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `name`, `adress`) VALUES
(1, 'สมสม', 'ดาวพลูโต 200 จังหวัดกระบี่'),
(2, 'มานะ', 'ดาวพลูโต 200 จังหวัดกระบี่'),
(3, 'นานะ', 'ดาวพลูโต 200 จังหวัดกระบี่');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int(5) NOT NULL COMMENT 'รหัสสั่งซื้อ',
  `customerID` int(5) NOT NULL COMMENT 'รหัสลูกค้า',
  `employeeID` int(5) NOT NULL COMMENT 'รหัสพนักงาน',
  `dateOrder` date NOT NULL COMMENT 'วันที่สั่งซื้อ',
  `orderTotal` decimal(65,0) NOT NULL COMMENT 'ยอดรวม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderID`, `customerID`, `employeeID`, `dateOrder`, `orderTotal`) VALUES
(2, 1, 1, '2024-09-09', 150);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `itemID` int(5) NOT NULL COMMENT 'รหัสสั่งซื้อ',
  `orderID` int(5) NOT NULL COMMENT 'รหัสสินค้า',
  `prodID` int(5) NOT NULL COMMENT 'รหัสสินค้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`itemID`, `orderID`, `prodID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodID` int(5) NOT NULL COMMENT 'รหัสสินค้า',
  `cateID` int(5) NOT NULL COMMENT 'รหัสประเภท',
  `prodName` varchar(40) NOT NULL COMMENT 'ฃื่อสินค้า',
  `quantity` int(10) NOT NULL COMMENT 'ปริมาณ',
  `price` decimal(65,0) NOT NULL COMMENT 'ราคา'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodID`, `cateID`, `prodName`, `quantity`, `price`) VALUES
(1, 1, 'ขนมปัง', 99, 25),
(2, 1, 'คุ๊กกี้', 99, 15),
(3, 1, 'ครัวซอง', 99, 25),
(4, 2, 'เค้กสตอเบอร์รี่\r\n', 99, 150),
(5, 2, 'คัพเค้ก', 99, 20);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `prodID` int(5) NOT NULL COMMENT 'รหัสสินค้า',
  `stockID` int(5) NOT NULL COMMENT 'รหัสสต๊อก',
  `prodName` varchar(20) NOT NULL COMMENT 'ฃื่อสินค้า',
  `amountProd` int(5) NOT NULL COMMENT 'จำนวนสินค้า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`prodID`, `stockID`, `prodName`, `amountProd`) VALUES
(1, 1, 'ขนมปัง', 99),
(2, 2, 'คุ๊กกี้', 99),
(3, 3, 'ครัวซอง', 99),
(4, 4, 'เค้กสตอเบอร์รี่', 99),
(5, 5, 'คัพเค้ก', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cateID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `customerID` (`customerID`,`employeeID`),
  ADD KEY `employeeID` (`employeeID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `prodID` (`orderID`),
  ADD KEY `prodID_2` (`prodID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodID`),
  ADD KEY `cateID` (`cateID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stockID`),
  ADD KEY `prodID` (`prodID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cateID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภท', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสลูกค้า', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสพนักงาน', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสั่งซื้อ', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `itemID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสั่งซื้อ', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสินค้า', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stockID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'รหัสสต๊อก', AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cateID`) REFERENCES `category` (`cateID`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
