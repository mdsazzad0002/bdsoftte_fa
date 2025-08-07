-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 07, 2025 at 11:33 AM
-- Server version: 10.6.23-MariaDB
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdsoftte_fa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 'A0001', '', 'Internet Bill', '', '', 'a', 'Admin', '2025-07-31 17:12:49', NULL, NULL),
(2, 1, 'A0002', '', 'Electric Bill', '', '', 'a', 'Admin', '2025-07-31 17:13:15', NULL, NULL),
(3, 1, 'A0003', '', 'Water Bill', '', '', 'a', 'Admin', '2025-07-31 17:13:23', NULL, NULL),
(4, 1, 'A0004', '', 'Mechanic Bill', '', '', 'a', 'Admin', '2025-07-31 17:13:56', NULL, NULL),
(5, 1, 'A0005', '', 'Other Bill', '', '', 'a', 'Admin', '2025-07-31 17:14:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assets`
--

CREATE TABLE `tbl_assets` (
  `as_id` int(11) NOT NULL,
  `as_date` date DEFAULT NULL,
  `as_name` varchar(50) DEFAULT NULL,
  `as_sp_name` varchar(100) DEFAULT NULL,
  `as_qty` int(11) DEFAULT NULL,
  `as_rate` decimal(10,2) DEFAULT NULL,
  `as_amount` decimal(10,2) DEFAULT NULL,
  `buy_or_sale` enum('buy','sale') NOT NULL DEFAULT 'buy',
  `valuation` decimal(20,2) DEFAULT 0.00,
  `unit_valuation` decimal(20,2) DEFAULT 0.00,
  `as_note` mediumtext DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_assets`
--

INSERT INTO `tbl_assets` (`as_id`, `as_date`, `as_name`, `as_sp_name`, `as_qty`, `as_rate`, `as_amount`, `buy_or_sale`, `valuation`, `unit_valuation`, `as_note`, `status`, `AddBy`, `AddTime`, `branchid`) VALUES
(1, '2025-08-06', 'cash desk', 'kjb', 1, 10000.00, 10000.00, 'buy', 0.00, 0.00, '', 'a', 'Admin', '2025-08-06 17:37:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_accounts`
--

CREATE TABLE `tbl_bank_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bank_accounts`
--

INSERT INTO `tbl_bank_accounts` (`account_id`, `account_name`, `account_number`, `account_type`, `bank_name`, `branch_name`, `initial_balance`, `description`, `saved_by`, `saved_datetime`, `updated_by`, `updated_datetime`, `branch_id`, `status`) VALUES
(1, 'asd', '3412', 'c', 'dbbl', 'sadar', 0, '', 1, '2025-07-20 17:52:54', NULL, NULL, 1, 1),
(2, 'agfhgfse', '2565432', 'c', 'ucb', 'sadar', 0, '', 1, '2025-07-20 17:53:10', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bank_transactions`
--

CREATE TABLE `tbl_bank_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_SiNo` int(11) NOT NULL,
  `ProductCategory_SlNo` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL,
  `brand_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brunch`
--

CREATE TABLE `tbl_brunch` (
  `brunch_id` int(11) NOT NULL,
  `Brunch_name` varchar(250) NOT NULL,
  `Brunch_title` varchar(250) NOT NULL,
  `Brunch_address` mediumtext NOT NULL,
  `Brunch_sales` varchar(1) NOT NULL COMMENT 'Wholesales = 1, Retail = 2',
  `add_date` date NOT NULL,
  `add_time` datetime NOT NULL,
  `add_by` char(50) NOT NULL,
  `update_by` char(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_brunch`
--

INSERT INTO `tbl_brunch` (`brunch_id`, `Brunch_name`, `Brunch_title`, `Brunch_address`, `Brunch_sales`, `add_date`, `add_time`, `add_by`, `update_by`, `status`) VALUES
(1, 'Main Branch', 'Main Branch', 'Dhaka', '', '2023-07-05', '2023-07-05 05:24:30', 'Admin', 'Admin', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cashtransaction`
--

CREATE TABLE `tbl_cashtransaction` (
  `Tr_SlNo` int(11) NOT NULL,
  `Tr_Id` varchar(50) NOT NULL,
  `Tr_date` date NOT NULL,
  `Tr_Type` varchar(20) NOT NULL,
  `Tr_account_Type` varchar(50) NOT NULL,
  `Acc_SlID` int(11) NOT NULL,
  `Tr_Description` varchar(255) NOT NULL,
  `In_Amount` decimal(18,2) NOT NULL,
  `Out_Amount` decimal(18,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Tr_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cashtransaction`
--

INSERT INTO `tbl_cashtransaction` (`Tr_SlNo`, `Tr_Id`, `Tr_date`, `Tr_Type`, `Tr_account_Type`, `Acc_SlID`, `Tr_Description`, `In_Amount`, `Out_Amount`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Tr_branchid`) VALUES
(1, 'TR00001', '2025-07-31', 'Out Cash', '', 1, '', 0.00, 1050.00, 'a', 'Admin', '2025-07-31 17:14:37', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checks`
--

CREATE TABLE `tbl_checks` (
  `id` int(20) UNSIGNED NOT NULL,
  `cus_id` int(20) DEFAULT NULL,
  `SM_id` int(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `check_no` varchar(250) DEFAULT NULL,
  `check_amount` decimal(18,2) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `check_date` timestamp NULL DEFAULT NULL,
  `remid_date` timestamp NULL DEFAULT NULL,
  `sub_date` timestamp NULL DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `check_status` char(5) DEFAULT 'Pe' COMMENT 'Pe =Pending, Pa = Paid',
  `status` char(5) NOT NULL DEFAULT 'a',
  `created_by` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_color`
--

CREATE TABLE `tbl_color` (
  `color_SiNo` int(11) NOT NULL,
  `color_name` varchar(100) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_company`
--

CREATE TABLE `tbl_company` (
  `Company_SlNo` int(11) NOT NULL,
  `Company_Name` varchar(150) NOT NULL,
  `Repot_Heading` mediumtext NOT NULL,
  `Company_Logo_org` varchar(250) NOT NULL,
  `Company_Logo_thum` varchar(250) NOT NULL,
  `Invoice_Type` int(11) NOT NULL,
  `Currency_Name` varchar(50) DEFAULT NULL,
  `Currency_Symbol` varchar(10) DEFAULT NULL,
  `SubCurrency_Name` varchar(50) DEFAULT NULL,
  `print_type` int(11) NOT NULL,
  `company_BrunchId` int(11) NOT NULL,
  `invoice_footer` text DEFAULT NULL,
  `banner_img` varchar(300) DEFAULT NULL,
  `login_img` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_company`
--

INSERT INTO `tbl_company` (`Company_SlNo`, `Company_Name`, `Repot_Heading`, `Company_Logo_org`, `Company_Logo_thum`, `Invoice_Type`, `Currency_Name`, `Currency_Symbol`, `SubCurrency_Name`, `print_type`, `company_BrunchId`, `invoice_footer`, `banner_img`, `login_img`) VALUES
(1, 'Family Bazar', 'Address : Sky Plaza , HSS Road , Jhenaidah.\r\nMobile : 01921457676', 'company_logo.png', 'company_logo.png', 1, 'BDT', NULL, NULL, 3, 1, 'Thank you for shopping with FAMILY BAZAR. Purchase\r\nof defected item must be exchanged by 24 hours\r\nwith invoice. For any queries, suggestions or\r\ncomplaints, please call : \"01921457676\" (9:00 AM -\r\n6:00 PM)', 'banner_img.jpeg', 'login_img5.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `Country_SlNo` int(11) NOT NULL,
  `CountryName` varchar(50) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currentinventory`
--

CREATE TABLE `tbl_currentinventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_quantity` float NOT NULL,
  `purchase_return_quantity` float NOT NULL,
  `sales_quantity` float NOT NULL,
  `sales_return_quantity` float NOT NULL,
  `damage_quantity` float NOT NULL,
  `transfer_from_quantity` float NOT NULL,
  `transfer_to_quantity` float NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_currentinventory`
--

INSERT INTO `tbl_currentinventory` (`inventory_id`, `product_id`, `purchase_quantity`, `purchase_return_quantity`, `sales_quantity`, `sales_return_quantity`, `damage_quantity`, `transfer_from_quantity`, `transfer_to_quantity`, `branch_id`) VALUES
(1, 3451, 60, 0, 27, 0, 0, 0, 0, 1),
(2, 419, 2, 0, 2, 0, 0, 0, 0, 1),
(3, 3452, 60, 0, 30, 0, 0, 0, 0, 1),
(4, 3450, 100, 0, 14, 0, 0, 0, 0, 1),
(5, 3448, 50, 0, 6, 0, 0, 0, 0, 1),
(6, 3449, 50, 0, 4, 0, 0, 0, 0, 1),
(7, 3447, 50, 0, 6, 0, 0, 0, 0, 1),
(8, 3446, 50, 0, 4, 0, 0, 0, 0, 1),
(9, 3445, 60, 0, 15, 0, 0, 0, 0, 1),
(10, 3444, 60, 0, 4, 0, 0, 0, 0, 1),
(11, 3443, 50, 0, 4, 0, 0, 0, 0, 1),
(12, 3442, 50, 0, 4, 0, 0, 0, 0, 1),
(13, 3441, 50, 0, 4, 0, 0, 0, 0, 1),
(14, 3440, 50, 0, 4, 0, 0, 0, 0, 1),
(15, 3439, 50, 0, 26, 0, 0, 0, 0, 1),
(16, 3438, 50, 0, 4, 0, 0, 0, 0, 1),
(17, 3436, 50, 0, 4, 0, 0, 0, 0, 1),
(18, 3453, 65, 0, 36, 0, 0, 0, 0, 1),
(19, 3454, 156, 0, 96, 0, 0, 0, 0, 1),
(20, 3457, 5, 0, 0.25, 0, 1, 0, 0, 1),
(21, 3456, 20, 0, 1, 0, 0, 0, 0, 1),
(22, 3455, 20, 0, 1, 0, 0, 0, 0, 1),
(23, 3147, 20, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Customer_SlNo` int(11) NOT NULL,
  `Customer_Code` varchar(50) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Customer_Type` varchar(50) NOT NULL,
  `Customer_Phone` varchar(50) NOT NULL,
  `Customer_Mobile` varchar(15) NOT NULL,
  `Customer_Email` varchar(50) NOT NULL,
  `Customer_OfficePhone` varchar(50) NOT NULL,
  `Customer_Address` varchar(300) NOT NULL,
  `owner_name` varchar(250) DEFAULT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `area_ID` int(11) NOT NULL,
  `Customer_Web` varchar(50) NOT NULL,
  `Customer_Credit_Limit` decimal(18,2) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `is_member` enum('yes','no') NOT NULL DEFAULT 'no',
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `point` float NOT NULL DEFAULT 0,
  `image_name` varchar(1000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Customer_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_SlNo`, `Customer_Code`, `employee_id`, `Customer_Name`, `Customer_Type`, `Customer_Phone`, `Customer_Mobile`, `Customer_Email`, `Customer_OfficePhone`, `Customer_Address`, `owner_name`, `Country_SlNo`, `area_ID`, `Customer_Web`, `Customer_Credit_Limit`, `previous_due`, `is_member`, `amount`, `point`, `image_name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Customer_brunchid`) VALUES
(1, 'C00001', NULL, 'Forhad', 'retail', '', '01814556688', '', '', 'Dhaka', '', 0, 1, '', 0.00, 0.00, 'yes', 100.00, 9, NULL, 'a', 'Admin', '2025-07-19 10:33:06', NULL, NULL, 1),
(2, 'C00002', NULL, 'hgfds', 'retail', '', '8784e534321', '', '', 'kjhgdfdasasdfgh', '', 0, 1, '', 0.00, 0.00, 'yes', 75.00, 325, NULL, 'a', 'Admin', '2025-07-31 17:50:06', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_payment`
--

CREATE TABLE `tbl_customer_payment` (
  `CPayment_id` int(11) NOT NULL,
  `CPayment_date` date DEFAULT NULL,
  `CPayment_invoice` varchar(20) DEFAULT NULL,
  `CPayment_customerID` varchar(20) DEFAULT NULL,
  `CPayment_TransactionType` varchar(20) DEFAULT NULL,
  `CPayment_amount` decimal(18,2) DEFAULT NULL,
  `out_amount` float NOT NULL DEFAULT 0,
  `CPayment_Paymentby` varchar(50) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `CPayment_notes` varchar(225) DEFAULT NULL,
  `CPayment_brunchid` int(11) DEFAULT NULL,
  `CPayment_previous_due` float NOT NULL DEFAULT 0,
  `CPayment_Addby` varchar(100) DEFAULT NULL,
  `CPayment_AddDAte` date DEFAULT NULL,
  `CPayment_status` varchar(1) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `CPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer_payment`
--

INSERT INTO `tbl_customer_payment` (`CPayment_id`, `CPayment_date`, `CPayment_invoice`, `CPayment_customerID`, `CPayment_TransactionType`, `CPayment_amount`, `out_amount`, `CPayment_Paymentby`, `account_id`, `CPayment_notes`, `CPayment_brunchid`, `CPayment_previous_due`, `CPayment_Addby`, `CPayment_AddDAte`, `CPayment_status`, `update_by`, `CPayment_UpdateDAte`) VALUES
(1, '2025-08-02', 'TR00001', '1', 'CR', 30.00, 0, 'cash', NULL, '', 1, -30, 'Admin', '2025-08-02', 'a', NULL, NULL),
(2, '2025-08-02', 'TR00002', '1', 'CR', 30.00, 0, 'cash', NULL, '', 1, -30, 'Admin', '2025-08-02', 'a', 0, '2025-08-02'),
(3, '2025-08-02', 'TR00003', '1', 'CP', 90.00, 0, 'cash', NULL, '', 1, -90, 'Admin', '2025-08-02', 'a', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damage`
--

CREATE TABLE `tbl_damage` (
  `Damage_SlNo` int(11) NOT NULL,
  `Damage_InvoiceNo` varchar(50) NOT NULL,
  `Damage_Date` date NOT NULL,
  `Damage_Description` varchar(300) DEFAULT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Damage_brunchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_damage`
--

INSERT INTO `tbl_damage` (`Damage_SlNo`, `Damage_InvoiceNo`, `Damage_Date`, `Damage_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Damage_brunchid`) VALUES
(1, 'D0001', '2025-08-06', '', 'a', 'Admin', '2025-08-06 17:31:58', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_damagedetails`
--

CREATE TABLE `tbl_damagedetails` (
  `DamageDetails_SlNo` int(11) NOT NULL,
  `Damage_SlNo` int(11) NOT NULL,
  `Product_SlNo` int(11) NOT NULL,
  `DamageDetails_DamageQuantity` float NOT NULL,
  `damage_rate` float NOT NULL,
  `damage_amount` float NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_damagedetails`
--

INSERT INTO `tbl_damagedetails` (`DamageDetails_SlNo`, `Damage_SlNo`, `Product_SlNo`, `DamageDetails_DamageQuantity`, `damage_rate`, `damage_amount`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 3457, 1, 850, 850, 'a', 'Admin', '2025-08-06 17:31:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `Department_SlNo` int(11) NOT NULL,
  `Department_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `Designation_SlNo` int(11) NOT NULL,
  `Designation_Name` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `District_SlNo` int(11) NOT NULL,
  `District_Name` varchar(50) NOT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`District_SlNo`, `District_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Dhaka', 'a', 'Admin', '2025-07-19 10:32:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `Employee_SlNo` int(11) NOT NULL,
  `Designation_ID` int(11) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` varchar(50) NOT NULL,
  `bio_id` varchar(50) DEFAULT NULL,
  `Employee_Name` varchar(150) NOT NULL,
  `Employee_JoinDate` date NOT NULL,
  `Employee_Gender` varchar(20) NOT NULL,
  `Employee_BirthDate` date NOT NULL,
  `Employee_NID` varchar(50) NOT NULL,
  `Employee_ContactNo` varchar(20) NOT NULL,
  `Employee_Email` varchar(50) NOT NULL,
  `Employee_MaritalStatus` varchar(50) NOT NULL,
  `Employee_FatherName` varchar(150) NOT NULL,
  `Employee_MotherName` varchar(150) NOT NULL,
  `Employee_PrasentAddress` mediumtext NOT NULL,
  `Employee_PermanentAddress` mediumtext NOT NULL,
  `Employee_Pic_org` varchar(250) NOT NULL,
  `Employee_Pic_thum` varchar(250) NOT NULL,
  `salary_range` int(11) NOT NULL,
  `Employee_Reference` mediumtext DEFAULT NULL,
  `status` char(10) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(50) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(50) NOT NULL,
  `Employee_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment`
--

CREATE TABLE `tbl_employee_payment` (
  `id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `month_id` int(11) NOT NULL,
  `total_payment_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` char(2) DEFAULT 'a',
  `saved_by` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee_payment_details`
--

CREATE TABLE `tbl_employee_payment_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(10) UNSIGNED NOT NULL,
  `salary` decimal(20,2) NOT NULL DEFAULT 0.00,
  `benefit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `deduction` decimal(20,2) NOT NULL DEFAULT 0.00,
  `net_payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `payment` decimal(20,2) NOT NULL DEFAULT 0.00,
  `comment` text DEFAULT NULL,
  `saved_by` int(11) UNSIGNED DEFAULT NULL,
  `saved_at` datetime DEFAULT NULL,
  `updated_by` int(11) UNSIGNED DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exchange`
--

CREATE TABLE `tbl_exchange` (
  `id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `sale_id` int(11) NOT NULL,
  `saletotal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `exchangeAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cashPaid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bankPaid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bank_id` int(11) DEFAULT NULL,
  `Status` varchar(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(255) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(255) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `branchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exchange_detail`
--

CREATE TABLE `tbl_exchange_detail` (
  `id` int(11) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `sale_detail_id` int(11) NOT NULL,
  `detail_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` decimal(18,2) NOT NULL,
  `sale_rate` decimal(18,2) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `Status` varchar(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(255) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(255) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `branchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_account`
--

CREATE TABLE `tbl_investment_account` (
  `Acc_SlNo` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `Acc_Code` varchar(50) NOT NULL,
  `Acc_Tr_Type` varchar(25) DEFAULT NULL,
  `Acc_Name` varchar(200) NOT NULL,
  `Acc_Type` varchar(50) NOT NULL,
  `Acc_Description` varchar(255) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_investment_account`
--

INSERT INTO `tbl_investment_account` (`Acc_SlNo`, `branch_id`, `Acc_Code`, `Acc_Tr_Type`, `Acc_Name`, `Acc_Type`, `Acc_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 1, 'I0001', NULL, 'Family Baza', '', '', 'a', 'Admin', '2025-07-19 10:30:35', 'Admin', '2025-08-02 17:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_investment_transactions`
--

CREATE TABLE `tbl_investment_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_investment_transactions`
--

INSERT INTO `tbl_investment_transactions` (`transaction_id`, `account_id`, `transaction_date`, `transaction_type`, `amount`, `note`, `saved_by`, `saved_datetime`, `branch_id`, `status`) VALUES
(1, 1, '2025-07-19', 'Receive', 5000, '', 1, '2025-07-19 10:30:49', 1, 1),
(2, 1, '2025-08-02', 'Receive', 166728, '', 1, '2025-08-02 17:55:10', 1, 1),
(3, 1, '2025-08-02', 'Profit', 500, '', 1, '2025-08-02 18:38:31', 1, 1),
(4, 1, '2025-08-06', 'Payment', 18650, '', 1, '2025-08-06 17:27:10', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_accounts`
--

CREATE TABLE `tbl_loan_accounts` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(500) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `account_type` varchar(200) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `branch_name` varchar(250) DEFAULT NULL,
  `initial_balance` float NOT NULL,
  `description` varchar(2000) NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `save_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_loan_transactions`
--

CREATE TABLE `tbl_loan_transactions` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` datetime NOT NULL,
  `branch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_month`
--

CREATE TABLE `tbl_month` (
  `month_id` int(11) NOT NULL,
  `month_name` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `Product_SlNo` int(11) NOT NULL,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `ProductCategory_ID` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `size` varchar(11) NOT NULL DEFAULT 'na',
  `vat` float NOT NULL,
  `Product_ReOrederLevel` int(11) NOT NULL,
  `Product_Purchase_Rate` decimal(18,2) NOT NULL,
  `Product_SellingPrice` decimal(18,2) NOT NULL,
  `Product_MinimumSellingPrice` decimal(18,2) NOT NULL,
  `Product_WholesaleRate` decimal(18,2) NOT NULL,
  `one_cartun_equal` varchar(20) NOT NULL,
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `Unit_ID` int(11) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(100) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `Product_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1, 'P00001', 'SMC Fruity', 2, 0, 0, 'na', 0, 0, 5.00, 7.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-23 17:55:09', 'Admin', '2025-04-23 18:02:06', 1),
(2, '8941193107843', 'Super Kid 12 Gm Badam', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-23 18:15:25', '', '', 1),
(3, '8941193105511', 'Bolt 25 GM', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-23 18:23:12', '', '', 1),
(4, '8941193105610', 'Orange Biscuit', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 09:06:25', '', '', 1),
(5, '8941193105573', 'Butter Cookies', 1, 0, 0, 'na', 0, 0, 54.00, 65.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 09:16:08', '', '', 1),
(7, '8941193105306', 'SMC PLUS Orange 250 ml', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 09:25:23', '', '', 1),
(8, '8941193105313', 'SMC PLUS Lemon 250 ml', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 09:28:55', '', '', 1),
(9, '8941193105580', 'SMC Lexus  216 gb', 1, 0, 0, 'na', 0, 0, 68.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 09:36:13', '', '', 1),
(10, '8941193105337', 'SMC Plus Lemon 200 ml', 1, 0, 0, 'na', 0, 0, 29.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 09:54:43', '', '', 1),
(11, '8941193105320', 'SMC Plus Orange 200 ml', 1, 0, 0, 'na', 0, 0, 28.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:00:41', '', '', 1),
(12, '8941193100417', 'Smile Pants Baby Diper', 2, 0, 0, 'na', 0, 0, 83.00, 140.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:28:02', '', '', 1),
(13, '8941193100110', 'Joya Sanitar Napkin', 2, 0, 0, 'na', 0, 0, 107.00, 140.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:31:49', '', '', 1),
(14, '8941193100097', 'Joya Sanitar Napkin 5', 2, 0, 0, 'na', 0, 0, 32.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:35:19', '', '', 1),
(15, '8941193100035', 'Joya Sanitar Napkin8', 2, 0, 0, 'na', 0, 0, 54.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:38:46', '', '', 1),
(16, '8941193100059', 'Joya Extra Heavy wings', 2, 0, 0, 'na', 0, 0, 69.00, 110.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:42:43', '', '', 1),
(17, '8941193100011', 'Joya Sanitary Napkin 5 Pads', 2, 0, 0, 'na', 0, 0, 31.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:45:35', '', '', 1),
(18, '8941193100028', 'JOya Sanitary Napkin 8 Pads', 2, 0, 0, 'na', 0, 0, 46.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:48:32', '', '', 1),
(19, '8941193100080', 'Joya Sanitary Napkin 15', 2, 0, 0, 'na', 0, 0, 83.00, 110.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:52:03', 'Admin', '2025-04-24 10:53:38', 1),
(20, '8941193105146', 'Taste me Mango 200 gb', 1, 0, 0, 'na', 0, 0, 89.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 10:59:31', '', '', 1),
(21, '8941193105139', 'Taste me Orange 200 gb', 1, 0, 0, 'na', 0, 0, 89.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-24 11:01:48', '', '', 1),
(22, '8941193105016', 'Taste me Orange 25 gb', 1, 0, 0, 'na', 0, 0, 9.00, 12.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 11:04:54', '', '', 1),
(23, '8941193105023', 'Taste me  Mango 25 gb', 1, 0, 0, 'na', 0, 0, 9.00, 12.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 11:07:58', '', '', 1),
(24, 'P00024', 'Orsaline -N ', 1, 0, 0, 'na', 0, 0, 5.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 11:11:08', '', '', 1),
(25, '8941193105184', 'Taste me Soft Drink powder', 1, 0, 0, 'na', 0, 0, 447.00, 590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 11:13:59', '', '', 1),
(26, '8941193105177', 'Taste me Soft Drink Orange', 1, 0, 0, 'na', 0, 0, 447.00, 590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 11:18:31', '', '', 1),
(27, '8901396601739', 'Veet', 2, 0, 0, 'na', 0, 0, 310.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:01:44', '', '', 1),
(28, '8941102833368', 'Dettol Skincare', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:03:49', '', '', 1),
(29, '8941100283257', 'Dettol Re-Energize', 2, 0, 0, 'na', 0, 0, 243.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:04:29', '', '', 1),
(30, '8941100281345', 'Dettol Antiseptic 750 ', 2, 0, 0, 'na', 0, 0, 227.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:05:40', '', '', 1),
(31, '8941102833511', 'Dettol Fresh', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:07:01', '', '', 1),
(32, '8941102833283', 'Dettol Orginal', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:07:37', '', '', 1),
(33, '8901396155751', 'Harpic Flush Matic 2', 2, 0, 0, 'na', 0, 0, 252.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:08:23', '', '', 1),
(34, '8901396155775', 'Harpic Flush Matic 1', 2, 0, 0, 'na', 0, 0, 135.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:08:58', '', '', 1),
(35, '8901396551867', 'Dettol Original Bandil 125', 2, 0, 0, 'na', 0, 0, 216.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:10:19', '', '', 1),
(36, '8941100930007', 'Dettol Cool Bodywash', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:13:58', '', '', 1),
(37, '8941100929995', 'Dettol Alove Vera Bodywash', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:14:45', '', '', 1),
(38, '8941100842119', 'Dettol Lasting Fresh Bodywash', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:16:22', '', '', 1),
(39, '8941100929926', 'Harpic 750 Liz 500', 2, 0, 0, 'na', 0, 0, 265.00, 295.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:17:40', '', '', 1),
(40, '8941100283356', 'Dettol Aloe vera 170 mm', 2, 0, 0, 'na', 0, 0, 72.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:18:45', '', '', 1),
(41, '8941102833399', 'Dettol Re-Energize170 ml', 2, 0, 0, 'na', 0, 0, 72.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:19:54', '', '', 1),
(42, '8941102833238', 'Dettol Original', 2, 0, 0, 'na', 0, 0, 67.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:20:44', '', '', 1),
(43, '8941102833412', 'Dettol Cool', 2, 0, 0, 'na', 0, 0, 72.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:21:17', '', '', 1),
(44, '8941100281338', 'Dettol Antiseptic Disinfectant 500', 2, 0, 0, 'na', 0, 0, 158.07, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:24:41', '', '', 1),
(45, '8941100281321', 'Dettol Germ Defence 100', 2, 0, 0, 'na', 0, 0, 54.05, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:25:45', '', '', 1),
(46, '9556111624051', 'Dettol  Original', 2, 0, 0, 'na', 0, 0, 75.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:27:17', '', '', 1),
(47, '8941102833955', 'Dettol  Original 125', 2, 0, 0, 'na', 0, 0, 81.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:28:31', '', '', 1),
(48, '8941100775363', 'Dettol Skincare125', 2, 0, 0, 'na', 0, 0, 81.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:29:21', '', '', 1),
(49, '8941100283189', 'Dettol Cool 125', 2, 0, 0, 'na', 0, 0, 81.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:30:13', '', '', 1),
(50, '8941100283516', 'Dettol Aloe Vera 125', 2, 0, 0, 'na', 0, 0, 81.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:35:16', '', '', 1),
(51, '8941100283400', 'Dettol Fresh 125', 2, 0, 0, 'na', 0, 0, 81.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:36:23', '', '', 1),
(52, '8941102833061', 'Dettol Neem 125', 2, 0, 0, 'na', 0, 0, 81.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:37:00', '', '', 1),
(53, '8941100890400', 'Dettol Original  100', 2, 0, 0, 'na', 0, 0, 68.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:38:23', '', '', 1),
(54, '8941100881521', 'Dettol Skincare 100', 2, 0, 0, 'na', 0, 0, 63.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:39:08', '', '', 1),
(55, '8941102833962', 'Dettol Origina 75', 2, 0, 0, 'na', 0, 0, 59.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:40:01', '', '', 1),
(56, '8941100775356', 'Dettol Skincare 75', 2, 0, 0, 'na', 0, 0, 58.06, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:40:44', '', '', 1),
(57, '8941100283141', 'Dettol Cool 75', 2, 0, 0, 'na', 0, 0, 59.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:41:29', '', '', 1),
(58, '8941100283424', 'Dettol Aloe Vera 75', 2, 0, 0, 'na', 0, 0, 58.60, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:44:25', '', '', 1),
(59, '8941100283288', 'Dettol Fresh 75', 2, 0, 0, 'na', 0, 0, 58.60, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:45:00', '', '', 1),
(60, '8941102833177', 'Dettol Neem 75', 2, 0, 0, 'na', 0, 0, 59.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:45:52', '', '', 1),
(61, '8901396508786', 'Trix Lemon 500 ml', 2, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:46:43', '', '', 1),
(62, '8941100360002', 'Trix Lemon 1ltr', 2, 0, 0, 'na', 0, 0, 243.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:48:08', '', '', 1),
(63, '8941100280621', 'Trix Lemon 250 Ml', 2, 0, 0, 'na', 0, 0, 63.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:49:01', '', '', 1),
(64, '8901396601814', 'Veet Pure', 2, 0, 0, 'na', 0, 0, 177.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:49:41', '', '', 1),
(65, '8941100606223', 'Veet Pure 25g', 2, 0, 0, 'na', 0, 0, 97.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:50:27', '', '', 1),
(66, '8901396553045', 'Mortein  Mosquito Killer', 2, 0, 0, 'na', 0, 0, 337.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:51:20', '', '', 1),
(67, '8941100930038', 'Mortein  CMB Vap ', 2, 0, 0, 'na', 0, 0, 179.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:54:51', '', '', 1),
(68, '8941100929988', 'Mortein Refil', 2, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:55:45', '', '', 1),
(69, '8941102833337', 'Harpic Advanced 1 Lter', 2, 0, 0, 'na', 0, 0, 207.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:56:42', '', '', 1),
(70, '8901396175025', 'Harpic Advanced 750', 2, 0, 0, 'na', 0, 0, 156.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:57:21', '', '', 1),
(71, '8941100282212', 'Harpic Advanced 500', 2, 0, 0, 'na', 0, 0, 117.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:58:28', '', '', 1),
(72, '8941100507087', 'Lizol Floral 1 Leter', 2, 0, 0, 'na', 0, 0, 270.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 14:59:23', 'Admin', '2025-04-24 14:59:54', 1),
(73, '8941100507070', 'Lizol Citrus 1 Leter', 2, 0, 0, 'na', 0, 0, 270.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:00:29', '', '', 1),
(74, '8941100507018', 'Lizol Floral  500', 2, 0, 0, 'na', 0, 0, 144.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:01:08', '', '', 1),
(75, '8941100507001', 'Lizol Citrus 500', 2, 0, 0, 'na', 0, 0, 144.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:01:59', '', '', 1),
(76, '8901396153108', 'Harpic Rose 500 ml', 2, 0, 0, 'na', 0, 0, 117.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:02:49', '', '', 1),
(77, '8941100507971', 'MR. Brasso Trigger 500ml', 2, 0, 0, 'na', 0, 0, 207.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:05:48', '', '', 1),
(78, '8901396956587', 'MR. Brasso Trigger250 ml', 2, 0, 0, 'na', 0, 0, 121.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:06:57', '', '', 1),
(79, '8941100508114', 'MR. Brasso Refil 250 ml', 2, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:10:45', '', '', 1),
(80, '8941100507988', 'MR. Brasso Refil 500 ml', 2, 0, 0, 'na', 0, 0, 171.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:11:55', '', '', 1),
(81, '8941100804247', 'Harpic alo  powder 1 KG', 2, 0, 0, 'na', 0, 0, 177.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:12:54', '', '', 1),
(82, '8941100803127', 'Harpic alo powder 400 G', 2, 0, 0, 'na', 0, 0, 88.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:13:40', '', '', 1),
(83, '8941100803110', 'Harpic alo powder 200 G', 2, 0, 0, 'na', 0, 0, 40.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:14:20', '', '', 1),
(84, '8941100280683', 'Trix bar 300 g', 2, 0, 0, 'na', 0, 0, 36.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:14:56', '', '', 1),
(85, '8941100280713', 'Trix bar 75  g', 2, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:15:39', '', '', 1),
(86, '8941100929797', 'Dettol Bodywash 50', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:16:23', '', '', 1),
(87, '8941102833542', 'Dettol Fresh 170 ml', 2, 0, 0, 'na', 0, 0, 67.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:18:49', '', '', 1),
(88, 'P00088', 'Dettol Antiseptic 50 ml', 2, 0, 0, 'na', 0, 0, 41.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:21:01', '', '', 1),
(89, 'P00089', 'Dettol Re- Energize 200', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:24:02', '', '', 1),
(90, 'P00090', 'Dettol Cool 200 ml', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:26:57', '', '', 1),
(91, 'P00091', 'Dettol Aloe Vera CMB', 2, 0, 0, 'na', 0, 0, 121.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:28:54', '', '', 1),
(92, 'P00092', 'Dettol Skincare CMB', 2, 0, 0, 'na', 0, 0, 121.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:30:16', '', '', 1),
(93, 'P00093', 'Dettol Mini 27gm', 2, 0, 0, 'na', 0, 0, 14.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 15:32:19', '', '', 1),
(94, '8941161103273', 'Fresh Refined Sugar', 1, 0, 0, 'na', 0, 0, 117.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:33:27', '', '', 1),
(95, '8941161120010', 'Fresh Milk 25', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:35:34', '', '', 1),
(96, '8941161120065', 'Fresh Milk 1 Kg', 1, 0, 0, 'na', 0, 0, 790.00, 870.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:36:24', '', '', 1),
(97, '8941161120034', 'Fresh Full Cream Milk Powder 250', 1, 0, 0, 'na', 0, 0, 211.00, 240.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-04-24 19:37:45', 'Admin', '2025-06-22 17:01:04', 1),
(98, '8941161120058', 'Fresh Full Cream Milk Powder 500', 1, 0, 0, 'na', 0, 0, 405.00, 450.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-04-24 19:39:05', 'Admin', '2025-06-22 16:59:23', 1),
(99, '8941161120027', 'Instant Full Cram Milk Powder 75', 1, 0, 0, 'na', 0, 0, 64.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:40:17', '', '', 1),
(100, '8941161121130', 'Instant Full Cram Milk Powder 10', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:41:28', '', '', 1),
(101, '8941161120041', 'Instant Full Cram Milk Powder 400', 1, 0, 0, 'na', 0, 0, 330.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:42:57', 'Admin', '2025-04-24 20:07:35', 1),
(102, '8941161120584', 'Super pure  Milk P 1KG', 1, 0, 0, 'na', 0, 0, 645.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:45:20', '', '', 1),
(103, '8941161103877', 'Fresh Danedar tea 500 g', 1, 0, 0, 'na', 0, 0, 164.00, 205.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:46:35', '', '', 1),
(104, '8941161108421', 'Fresh Suji 500 g', 1, 0, 0, 'na', 0, 0, 38.00, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:47:59', '', '', 1),
(105, '8941161103747', 'Fresh premum Tea 50 g', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:49:00', '', '', 1),
(106, '8941161108216', 'Fresh Maida 1 Kg', 1, 0, 0, 'na', 0, 0, 59.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:50:35', '', '', 1),
(107, '8941161108223', 'Fresh Maida 2 Kg', 1, 0, 0, 'na', 0, 0, 117.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:51:16', '', '', 1),
(108, '8941161108056', 'Actifit Psremium Atta 1Kg', 1, 0, 0, 'na', 0, 0, 44.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:52:18', '', '', 1),
(109, '8941161108025', 'Fresh Atta 2 Kg', 1, 0, 0, 'na', 0, 0, 86.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:53:05', 'Admin', '2025-06-22 17:01:42', 1),
(110, 'P00110', 'Fresh Premum Tea 2 Ti', 1, 0, 0, 'na', 0, 0, 360.00, 440.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 19:54:31', '', '', 1),
(111, '8941161113050', 'Super Fresh Water 2 litre b', 1, 0, 0, 'na', 0, 0, 30.83, 45.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-04-24 19:58:45', 'Admin', '2025-06-22 17:00:02', 1),
(112, '8941161113036', 'Super Fresh Water 1 litre b', 1, 0, 0, 'na', 0, 0, 18.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-04-24 20:00:23', '', '', 1),
(113, '8941161113074', 'Super Fresh Water 5 litre ', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-04-24 20:01:09', '', '', 1),
(114, '8941161113081', 'Super Fresh Water 8 litre ', 1, 0, 0, 'na', 0, 0, 105.00, 120.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-04-24 20:01:45', '', '', 1),
(115, '8941161113029', 'Super Fresh Water 500 g', 1, 0, 0, 'na', 0, 0, 10.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-24 20:16:37', '', '', 1),
(116, '8941161007427', 'All Purpose Towel', 2, 0, 0, 'na', 0, 0, 54.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 10:48:37', '', '', 1),
(117, '8941161007533', 'Hand Towel', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 10:55:31', '', '', 1),
(118, '8941161002712', 'Restaurant Paper Napkin', 2, 0, 0, 'na', 0, 0, 45.00, 65.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 10:57:55', '', '', 1),
(119, '8941161002460', 'Paper Napkin Perfumed', 2, 0, 0, 'na', 0, 0, 54.00, 75.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:00:23', '', '', 1),
(120, '8941161008066', 'Facial Tissue', 2, 0, 0, 'na', 0, 0, 61.00, 85.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:01:59', '', '', 1),
(121, '8941161007311', 'Kitchen Towel', 2, 0, 0, 'na', 0, 0, 125.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:03:17', '', '', 1),
(122, '8941161008042', 'Facial Tissue Perfumed', 2, 0, 0, 'na', 0, 0, 54.00, 75.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:04:15', '', '', 1),
(123, '8941193030035', 'Fresh A4 Paper', 2, 0, 0, 'na', 0, 0, 355.00, 465.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:07:24', '', '', 1),
(124, '8941193030028', 'Fresh A4 Paper 80 GSM', 2, 0, 0, 'na', 0, 0, 420.00, 520.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:10:04', '', '', 1),
(125, '8941161002248', 'Wallet Tissue Perfumed', 2, 0, 0, 'na', 0, 0, 7.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:12:33', '', '', 1),
(126, '8941161004969', 'Toilet Tissue gold', 2, 0, 0, 'na', 0, 0, 25.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:18:50', 'Admin', '2025-07-14 11:25:27', 1),
(127, '8941161007557', 'Hand Towel 150', 2, 0, 0, 'na', 0, 0, 33.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:25:42', '', '', 1),
(128, '8941161004914', 'Toilet Tissue White', 2, 0, 0, 'na', 0, 0, 18.00, 28.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 11:29:15', '', '', 1),
(129, '89411610049144', 'Toilet Tissue White Family', 2, 0, 0, 'na', 0, 0, 18.00, 28.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:35:15', 'Admin', '2025-07-14 11:24:29', 1),
(130, 'P00130', 'Spark Ballpen', 2, 0, 0, 'na', 0, 0, 6.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:52:51', '', '', 1),
(131, 'P00131', 'Sharpener', 2, 0, 0, 'na', 0, 0, 9.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:54:35', '', '', 1),
(132, '8941161008943', 'Ballpoint pen', 2, 0, 0, 'na', 0, 0, 4.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:56:19', 'Admin', '2025-04-25 11:57:29', 1),
(133, 'P00133', 'Ballpoint pen 0.5', 2, 0, 0, 'na', 0, 0, 4.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 11:59:16', '', '', 1),
(134, 'P00134', 'Premium ballpen 0.7', 2, 0, 0, 'na', 0, 0, 7.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:03:12', '', '', 1),
(135, 'P00135', 'sprint Ballpen 0.6', 2, 0, 0, 'na', 0, 0, 5.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:04:52', '', '', 1),
(136, 'P00136', 'Goodday Black Ballpen', 2, 0, 0, 'na', 0, 0, 4.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:07:46', '', '', 1),
(137, '8941161008929', '15 CM Scale', 2, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:12:22', '', '', 1),
(138, '8941161008912', '30 CM Scale', 2, 0, 0, 'na', 0, 0, 10.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:14:05', 'Admin', '2025-07-09 17:48:50', 1),
(139, '8941161009667', 'Exericise Book', 2, 0, 0, 'na', 0, 0, 85.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:16:15', '', '', 1),
(140, '8941161012025', 'Exercise Book M', 2, 0, 0, 'na', 0, 0, 25.00, 32.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:17:52', 'Admin', '2025-07-09 18:07:28', 1),
(141, '8941161009612', 'Math Margin 204 Page', 2, 0, 0, 'na', 0, 0, 70.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:19:21', '', '', 1),
(142, '8941161012032', 'Math Square 124 Page', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 12:20:23', 'Admin', '2025-07-09 18:07:08', 1),
(143, '8941161010052', 'Exercise Book Bangla', 2, 0, 0, 'na', 0, 0, 54.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 19:36:25', 'Admin', '2025-04-25 19:39:59', 1),
(144, 'P00144', 'Eraser ', 2, 0, 0, 'na', 0, 0, 7.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 19:43:15', '', '', 1),
(145, '8941161008868', 'Dust Free Eraser Small', 2, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 19:44:55', 'Admin', '2025-04-25 19:45:22', 1),
(146, '8941161008851', 'Dust Free Eraser Big', 2, 0, 0, 'na', 0, 0, 7.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 19:46:14', '', '', 1),
(147, '8941161012056', 'Exercise Book MM', 2, 0, 0, 'na', 0, 0, 25.00, 32.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 19:47:15', '', '', 1),
(148, 'P00148', 'Pencil Box ', 2, 0, 0, 'na', 0, 0, 45.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-25 19:48:50', '', '', 1),
(149, 'P00149', 'Pencil Box  Fresh', 2, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:51:00', '', '', 1),
(150, '8941161009902', '12 Page Bangla', 2, 0, 0, 'na', 0, 0, 41.67, 55.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:52:34', 'Admin', '2025-07-09 18:12:50', 1),
(151, '8941161010007', '124  Page Math Margin', 2, 0, 0, 'na', 0, 0, 41.66, 55.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:53:50', 'Admin', '2025-07-09 18:12:28', 1),
(152, '8941161019437', 'A4 100 Paper', 2, 0, 0, 'na', 0, 0, 510.00, 610.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:54:56', '', '', 1),
(153, '8941161008226', 'Legal  80 GSM Paper', 2, 0, 0, 'na', 0, 0, 500.00, 580.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:56:14', '', '', 1),
(154, '8941161010083', '164 Page Math Margin', 2, 0, 0, 'na', 0, 0, 54.00, 65.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:57:03', '', '', 1),
(155, '8941161009681', '124 Page Math Margin', 2, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 19:57:57', '', '', 1),
(156, '8941161009827', '84 Page Bangla', 2, 0, 0, 'na', 0, 0, 28.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 20:00:15', '', '', 1),
(157, '8941161009841', '84 Page Math Margin', 2, 0, 0, 'na', 0, 0, 28.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 20:02:12', '', '', 1),
(158, '8941161009674', 'SP164 Page Math Margin ', 2, 0, 0, 'na', 0, 0, 70.00, 85.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 20:04:05', '', '', 1),
(159, '8941161009988', 'S 124 Page English', 2, 0, 0, 'na', 0, 0, 44.00, 55.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 20:05:28', '', '', 1),
(160, 'P00160', 'Captain Sharpener', 2, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 20:06:27', '', '', 1),
(161, '8941193100424', 'Baby Diaper', 2, 0, 0, 'na', 0, 0, 96.00, 140.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:35:42', '', '', 1),
(162, '8941193100479', 'Smile Pants Baby Diaper', 2, 0, 0, 'na', 0, 0, 610.00, 890.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:37:03', '', '', 1),
(163, '8941193102220', 'Ultra Thin', 2, 0, 0, 'na', 0, 0, 63.00, 90.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:46:18', '', '', 1),
(164, '8941193102138', 'U and ME', 2, 0, 0, 'na', 0, 0, 43.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:47:55', '', '', 1),
(165, '8941193102022', 'Sensation St', 2, 0, 0, 'na', 0, 0, 28.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:49:55', 'Admin', '2025-04-25 21:51:35', 1),
(166, '8941193102015', 'Sensation Classic', 2, 0, 0, 'na', 0, 0, 28.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:52:21', '', '', 1),
(167, '8941193102251', 'Panther Dotted', 2, 0, 0, 'na', 0, 0, 18.00, 30.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:54:40', '', '', 1),
(168, '8941193102237', 'hero condom', 2, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 21:56:25', '', '', 1),
(169, '8941193100486', 'Pants Baby Diaper ', 2, 0, 0, 'na', 0, 0, 610.00, 890.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-25 22:01:40', '', '', 1),
(170, '8941196240073', 'Savlon Liquid Hand Wash', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:44:02', '', '', 1),
(171, '8941196240080', 'Savlon Liquid Hand Wash 1', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:44:45', '', '', 1),
(172, '8941196240097', 'Savlon Liquid Hand Wash 2', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:46:34', '', '', 1),
(173, '8941196240059', 'Savlon Hand Wash 500 ml', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:47:16', '', '', 1),
(174, '8941196240066', 'Savlon Hand Wash 500', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:47:50', '', '', 1),
(175, '8941196240042', 'Savlon Hand Wash 500  ml', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:48:13', '', '', 1),
(176, '8139003005469', 'Savlon Lemon Burst 1 Lt', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:49:04', '', '', 1),
(177, '8941196242299', 'Savlon Aloe Vera', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:49:31', '', '', 1),
(178, '8941196242305', 'Savlon Oacean Blue', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:50:01', '', '', 1),
(179, '8941196242053', 'Savlon Shinex 1 lt', 2, 0, 0, 'na', 0, 0, 253.00, 285.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:51:28', 'Admin', '2025-04-26 13:51:53', 1),
(180, '813903000585', 'Shinex Glass Cleaner', 2, 0, 0, 'na', 0, 0, 94.00, 115.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:53:32', '', '', 1),
(181, '813903000578', 'Shinex Glass Cleaner 350', 2, 0, 0, 'na', 0, 0, 125.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:54:06', '', '', 1),
(182, '8139003005575', 'Shinex tiles and ceramic c', 2, 0, 0, 'na', 0, 0, 121.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:54:56', '', '', 1),
(183, '8139003005674', 'Hand Wash Marigold 170', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:56:45', '', '', 1),
(184, '8139003005667', 'Hand Wash Iris 170', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:57:20', '', '', 1),
(185, '8139003005681', 'Hand Wash Lavender 170', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:57:47', '', '', 1),
(186, '8139003005582', 'Savlon Antiseptic 170', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 13:58:58', '', '', 1),
(187, '8139003005599', 'Savlon Aloe Vera 170', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:01:15', '', '', 1),
(188, '8139003005612', 'Savlon Lemon Burst', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:01:50', '', '', 1),
(189, '8139003002390', 'Savlon Antiseptic Cream 100g', 2, 0, 0, 'na', 0, 0, 59.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:03:17', '', '', 1),
(190, 'P001908139003002383', 'Savlon Antiseptic Cream 30 g', 2, 0, 0, 'na', 0, 0, 332.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:03:48', '', '', 1),
(191, '813903000264', 'Savlon Antiseptic Cream 60g', 2, 0, 0, 'na', 0, 0, 41.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:04:27', '', '', 1),
(192, '813903000288', 'Savlon Family Size 1000 ml', 2, 0, 0, 'na', 0, 0, 233.28, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:05:31', '', '', 1),
(193, '8139003005636', 'Savlon Aloe Ver P 200 ml', 2, 0, 0, 'na', 0, 0, 92.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:06:27', '', '', 1),
(194, '8139003005643', 'Savlon Ocean Blue 200 ml', 2, 0, 0, 'na', 0, 0, 92.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:07:17', '', '', 1),
(195, '813903000301', 'Savlon 500 ml', 2, 0, 0, 'na', 0, 0, 158.00, 175.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 14:09:34', '', '', 1),
(196, '8941393006151', 'Wonder  Liquid Dish Wash 500', 2, 0, 0, 'na', 0, 0, 116.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 14:10:33', '', '', 1),
(197, 'P00197', 'Savlon 112 ml', 2, 0, 0, 'na', 0, 0, 55.00, 60.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 14:12:34', '', '', 1),
(198, 'P00198', 'Savlon 55 ml', 2, 0, 0, 'na', 0, 0, 41.00, 45.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 14:19:27', '', '', 1),
(199, '8941196243142', 'Savlon Fresh 125 g', 2, 0, 0, 'na', 0, 0, 68.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:21:22', 'Admin', '2025-04-26 14:21:52', 1),
(200, '8941196243111', 'Savlon Mild 125 g', 2, 0, 0, 'na', 0, 0, 68.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:22:36', '', '', 1),
(201, '8941196243104', 'Savlon Mild 100g', 2, 0, 0, 'na', 0, 0, 60.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:23:30', '', '', 1),
(202, '8941196243135', 'Savlon Fresh100g', 2, 0, 0, 'na', 0, 0, 59.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:24:00', '', '', 1),
(203, '8139003005568', 'Savlon Lemon Burst 100g', 2, 0, 0, 'na', 0, 0, 60.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:24:34', '', '', 1),
(204, '8941196243074', 'Savlon Antiseptic100g', 2, 0, 0, 'na', 0, 0, 59.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:25:16', '', '', 1),
(205, '8941196243098', 'Savlon Mild 75', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:25:51', '', '', 1),
(206, '8941196243128', 'Savlon Fresh 75g', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:27:08', '', '', 1),
(207, '8941196243012', 'Savlon Men 100 g', 2, 0, 0, 'na', 0, 0, 63.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:28:53', '', '', 1),
(208, '8941393006144', 'Leona 100 g', 2, 0, 0, 'na', 0, 0, 49.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:29:34', '', '', 1),
(209, '8941393006137', 'Leona Rose and Glycerin 100g', 2, 0, 0, 'na', 0, 0, 49.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:30:49', '', '', 1),
(210, '8941393006113', 'Dish Wash Bar 75 g', 2, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:32:02', '', '', 1),
(211, '8139003005278', 'Savlon fresh 30 g', 2, 0, 0, 'na', 0, 0, 14.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:32:57', '', '', 1),
(212, '8139003005261', 'Savlon Mild', 2, 0, 0, 'na', 0, 0, 14.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:33:48', '', '', 1),
(213, '8941196247027', 'Dish Wash Bar', 2, 0, 0, 'na', 0, 0, 36.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:34:37', '', '', 1),
(214, '8139003003182', 'Savlon Baby Wipes 100', 2, 0, 0, 'na', 0, 0, 167.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:35:40', '', '', 1),
(215, '8941196241209', 'Savlon Baby Wipes 160', 2, 0, 0, 'na', 0, 0, 192.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:36:45', '', '', 1),
(216, '8941393006243', 'Men Shower Gel 250 ml', 2, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:37:36', '', '', 1),
(217, '8941393006236', 'Skin Zen Shower Gel 250 ml', 2, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:38:41', '', '', 1),
(218, '8941196247041', 'Dish Wash 250 ml', 2, 0, 0, 'na', 0, 0, 62.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:39:40', '', '', 1),
(219, '8139003004585', 'Savlon antiseptic Disinfectant', 2, 0, 0, 'na', 0, 0, 91.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:40:40', '', '', 1),
(220, '8941196247072', 'Wonder Liquid Dish Wash 5 lter', 2, 0, 0, 'na', 0, 0, 649.00, 1020.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 14:41:35', '', '', 1),
(221, '8941393006427', 'Wonder Stinless Steel Scrubber', 2, 0, 0, 'na', 0, 0, 15.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 15:10:49', '', '', 1),
(222, '8139003005537', 'Stainless Steel Scrubber ', 2, 0, 0, 'na', 0, 0, 25.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 15:12:35', '', '', 1),
(223, '8139003005971', 'Sponge Scrubber 4', 2, 0, 0, 'na', 0, 0, 55.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 15:13:26', '', '', 1),
(224, 'P00224', 'Savlon Antiseptic 200 ml', 2, 0, 0, 'na', 0, 0, 92.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 15:14:48', '', '', 1),
(225, '8941196242282', 'Savlon Antiseptic Hand 1 leter', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 15:44:08', '', '', 1),
(226, '813903000042', 'ACI Aerosol 800 Ml', 2, 0, 0, 'na', 0, 0, 574.00, 620.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:48:16', '', '', 1),
(227, '813903000035', 'ACI Aerosol 475 ml', 2, 0, 0, 'na', 0, 0, 384.00, 415.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:48:53', '', '', 1),
(228, '813903000028', 'ACI Aerosol 350 Ml', 2, 0, 0, 'na', 0, 0, 315.00, 340.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:49:29', '', '', 1),
(229, '813903000127', 'ACI Aerosol 250Ml', 2, 0, 0, 'na', 0, 0, 231.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:50:12', '', '', 1),
(230, '8941196246518', 'Septex Antiseptic soap 100g', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 16:51:18', '', '', 1),
(231, '8941196246525', 'Septex Antiseptic soap  Deep Clean100g', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 16:51:59', '', '', 1),
(232, '8941196246532', 'Septex Antiseptic soap Vita +100g', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 16:52:33', '', '', 1),
(233, '8139003005346', 'Hand Wash Everyday', 2, 0, 0, 'na', 0, 0, 92.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 16:53:12', '', '', 1),
(234, '8139003005438', 'Septex Hand Wash Everyday', 2, 0, 0, 'na', 0, 0, 65.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 16:54:09', '', '', 1),
(235, '8139003005698', 'Baby Soft75 gm', 2, 0, 0, 'na', 0, 0, 72.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 16:55:16', '', '', 1),
(236, '8139003000846', 'Angelic Citrus Busst 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:56:14', '', '', 1),
(237, '8139003000860', 'Angelic Sparhling Ornge 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:57:02', '', '', 1),
(238, '8139003000884', 'Angelic Fruit Pnch 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:57:47', '', '', 1),
(239, '8139003003755', 'Angelic Pink Rose 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 16:58:19', '', '', 1),
(240, '8139003001133', 'Angelic Anti Tabac 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:00:38', '', '', 1),
(241, '8139003000877', 'Angelic Misty waad 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:01:34', '', '', 1),
(242, '8139003000853', 'Angelic Orchid Breege 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:02:08', '', '', 1),
(243, '8139003001157', 'Angelic Green Valley 300 ml', 2, 0, 0, 'na', 0, 0, 286.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:02:41', '', '', 1),
(244, '8850175010111', 'Glade Scented Gel Floral', 2, 0, 0, 'na', 0, 0, 261.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:03:49', 'Admin', '2025-04-26 17:04:26', 1),
(245, '8850175012276', 'Glade Scented Gel Lavener', 2, 0, 0, 'na', 0, 0, 261.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:04:57', '', '', 1),
(246, '8941196246020', 'ACI Neem soap100 gb', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-26 17:05:52', '', '', 1),
(247, '8941196250072', 'Black Fighter 8 ', 2, 0, 0, 'na', 0, 0, 65.00, 85.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 17:06:52', '', '', 1),
(248, '8941196244088', 'ACI Smart 1 Kg', 2, 0, 0, 'na', 0, 0, 127.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 17:07:58', '', '', 1),
(249, '8941196244040', 'ACI Supreme 1 Kg', 2, 0, 0, 'na', 0, 0, 165.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 17:08:47', '', '', 1),
(250, '8941196244033', 'ACI Supreme 500 g', 2, 0, 0, 'na', 0, 0, 82.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 17:09:31', '', '', 1),
(251, '8139003005711', 'Baby Soft Lotion 100g', 2, 0, 0, 'na', 0, 0, 160.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 17:10:15', '', '', 1),
(252, '8941393005994', 'Baby Soft Wash 100g', 2, 0, 0, 'na', 0, 0, 158.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 17:10:50', '', '', 1),
(253, '8941393006168', 'Baby Soft Cream 50 ml', 2, 0, 0, 'na', 0, 0, 117.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 17:11:19', '', '', 1),
(254, '8169003004841', 'Shahi Biriyani Masala 40g', 2, 0, 0, 'na', 0, 0, 49.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 19:58:08', '', '', 1),
(255, '816903000944', 'Shahi Haleem Mix 200 gm', 2, 0, 0, 'na', 0, 0, 56.50, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 19:59:09', '', '', 1),
(256, '8169003008009', 'Corn Flour 150 g', 2, 0, 0, 'na', 0, 0, 44.50, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 19:59:57', '', '', 1),
(257, '8169003007408', 'Kacchi Biriyani Masala45g', 2, 0, 0, 'na', 0, 0, 61.00, 80.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:02:35', '', '', 1),
(258, '8139003002833', 'Kabab Masala 50 g', 2, 0, 0, 'na', 0, 0, 81.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:03:15', '', '', 1),
(259, '8169003006531', 'Mejbani Beef Masala 65g ', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:03:53', '', '', 1),
(260, '8139003002826', 'Tehari Masala 40 g', 2, 0, 0, 'na', 0, 0, 46.00, 55.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:04:33', '', '', 1),
(261, '8169003006180', 'Shahi Roase Masala 35g ', 2, 0, 0, 'na', 0, 0, 53.00, 65.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:05:12', '', '', 1),
(262, '8169003006173', 'Chatpati Masala 50g', 2, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:05:50', '', '', 1),
(263, '816903000951', 'Kheer Mix 150g', 2, 0, 0, 'na', 0, 0, 55.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 20:08:43', '', '', 1),
(264, '8139003002505', 'Thai Noodles Oriental Thai ', 1, 0, 0, 'na', 0, 0, 31.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:12:46', '', '', 1),
(265, '8139003002499', 'Thai Noodles Hot and Spicy', 1, 0, 0, 'na', 0, 0, 32.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:13:23', '', '', 1),
(266, '8169003009242', 'Stick Noodles Spic', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:14:50', '', '', 1),
(267, '8169003009273', 'Stick Noodles Tandoori', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:15:23', '', '', 1),
(268, '8169003010064', 'Stick Noodles Egg ', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:16:12', '', '', 1),
(269, '8169003009839', 'cHOWMEIN nOODLES 300', 1, 0, 0, 'na', 0, 0, 52.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:17:07', '', '', 1),
(270, '8941693010889', 'Aci Instant Noodles 8 Packs', 1, 0, 0, 'na', 0, 0, 129.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:18:21', 'Admin', '2025-06-20 11:03:26', 1),
(271, '816903000036', 'Chilli Powder 200g', 1, 0, 0, 'na', 0, 0, 118.50, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:19:49', '', '', 1),
(272, '816903000029', 'Chilli Powder 100g', 1, 0, 0, 'na', 0, 0, 65.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:20:26', '', '', 1),
(273, '816903000012', 'Chilli Powder 50g', 1, 0, 0, 'na', 0, 0, 33.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:21:03', '', '', 1),
(274, '816903000128', 'Turmeric Powder 200 g', 1, 0, 0, 'na', 0, 0, 103.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:22:04', '', '', 1),
(275, '816903000104', 'Turmeric Powder50 g', 1, 0, 0, 'na', 0, 0, 28.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:22:37', '', '', 1),
(276, '816903000067', 'Coriander Powder 200g', 1, 0, 0, 'na', 0, 0, 95.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:23:25', '', '', 1),
(277, '816903000050', 'Coriander Powder 100g', 1, 0, 0, 'na', 0, 0, 47.14, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:23:54', '', '', 1),
(278, '816903000043', 'Coriander Powder 50g', 1, 0, 0, 'na', 0, 0, 27.00, 32.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:24:29', '', '', 1),
(279, '816903000739', 'Cumin Powder 200g', 1, 0, 0, 'na', 0, 0, 278.00, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:25:10', '', '', 1),
(280, '816903000074', 'Cumin Powder 50g', 1, 0, 0, 'na', 0, 0, 75.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:25:43', '', '', 1),
(281, '8169003005985', 'Panchforan 50g', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:27:38', '', '', 1),
(282, '8169003010118', 'Beef Curry Masala 100 g', 1, 0, 0, 'na', 0, 0, 74.28, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:28:22', 'Admin', '2025-07-07 17:58:43', 1),
(283, '8169003003905', 'Beef Curry Masala 20g', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:29:16', '', '', 1),
(284, '8169003003899', 'Chicken Curry Masala 20g', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:30:23', '', '', 1),
(285, '816903000234', 'Garam Masala15g', 1, 0, 0, 'na', 0, 0, 29.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:33:16', '', '', 1),
(286, '8169003006494', 'Fun Chanachur 300g', 1, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:36:09', '', '', 1),
(287, '816903002764', 'Fun  Jhal Chanachur 120g', 1, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:36:48', '', '', 1),
(288, '8169003007491', 'Fun Chanachur BAr B Q 25g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:38:25', '', '', 1),
(289, '8941693011053', 'Fun  Aloo Bhujia 22g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:39:15', '', '', 1),
(290, '8169003009525', 'Flattened Rice 250 g', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:40:21', '', '', 1),
(291, '8169003009266', 'Flattened Rice 500g', 1, 0, 0, 'na', 0, 0, 56.50, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:41:23', '', '', 1),
(292, '8169003009181', 'Mustard Oil 5 leter', 1, 0, 0, 'na', 0, 0, 1180.00, 1500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:42:05', '', '', 1),
(293, '815300000090', 'Vermcelli 200g ', 1, 0, 0, 'na', 0, 0, 34.50, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:43:08', '', '', 1),
(294, '816903000166', 'Mustard Oil 1 liter', 1, 0, 0, 'na', 0, 0, 268.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:44:18', '', '', 1),
(295, '816903000968', 'Mustard Oil 200ml', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:44:55', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(296, '816903000258', 'Mustard Oil 80 ml', 1, 0, 0, 'na', 0, 0, 26.50, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:45:40', '', '', 1),
(297, '816903000975', 'Mustard Oil 500 ml', 1, 0, 0, 'na', 0, 0, 142.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:46:09', '', '', 1),
(298, '8169003008849', 'Lachcha Semai100g', 1, 0, 0, 'na', 0, 0, 31.50, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:46:44', '', '', 1),
(299, '8169003008351', 'Tomato Ketchup 340 g', 1, 0, 0, 'na', 0, 0, 90.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:47:32', '', '', 1),
(300, '8169003009983', 'Sweet toast 250 g', 1, 0, 0, 'na', 0, 0, 52.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:48:24', '', '', 1),
(301, '8169003010347', 'Ghee Toast Biscuit 200 g', 1, 0, 0, 'na', 0, 0, 60.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:49:25', '', '', 1),
(302, '816903001149', 'Plain toast biscuit 250g', 1, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:50:19', '', '', 1),
(303, '816903001101', 'Famarind chutney 15', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:53:14', '', '', 1),
(304, '813903000592', 'Mixed Pickle 400 g', 1, 0, 0, 'na', 0, 0, 136.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:54:32', '', '', 1),
(305, '8941693010650', 'Naga Pickle 400g ', 1, 0, 0, 'na', 0, 0, 315.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:55:27', 'Admin', '2025-04-26 20:56:31', 1),
(306, '816903001576', 'Olive pickle 400g ', 1, 0, 0, 'na', 0, 0, 136.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 20:57:36', 'Admin', '2025-04-26 20:58:06', 1),
(307, '8941693010667', 'Sweets Sour Mango Pickle 400g', 1, 0, 0, 'na', 0, 0, 153.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:00:05', '', '', 1),
(308, '8169003007132', 'Orange Jelly 400g', 1, 0, 0, 'na', 0, 0, 150.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:01:56', '', '', 1),
(309, '8941693010698', 'Aloo Bukhara Pickle 400g', 1, 0, 0, 'na', 0, 0, 250.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:03:37', '', '', 1),
(310, '8941693011244', 'NutriFun soft Drink Powder 250g', 1, 0, 0, 'na', 0, 0, 120.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:09:51', '', '', 1),
(311, 'P00311', 'ACI Pure Ghee 100g ', 1, 0, 0, 'na', 0, 0, 172.00, 205.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:11:08', '', '', 1),
(312, 'P00312', 'ACI Pure Ghee 200g', 1, 0, 0, 'na', 0, 0, 320.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:13:26', '', '', 1),
(313, '8169003009952', 'Fun Super Champ  Malai Kheer', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:16:11', '', '', 1),
(314, '8169003009938', 'Fun Super Champ Pineapple', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:17:22', '', '', 1),
(315, '8169003009945', 'Fun Super Champ Chocolate', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 21:17:54', '', '', 1),
(316, '8169003003943', 'Dry Cake Biscuit', 1, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:20:49', '', '', 1),
(317, '8906055793053', 'Layerr Shot Onyx Parfume', 2, 0, 0, 'na', 0, 0, 1272.00, 1590.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:23:11', 'Admin', '2025-06-06 03:54:26', 1),
(318, '8169003006661', 'Awesome Angles ', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:24:01', '', '', 1),
(319, '8169003007262', 'Aromatic Broken Rice 1 Kg', 1, 0, 0, 'na', 0, 0, 70.00, 85.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:25:07', '', '', 1),
(320, '8169003006685', 'Popping pipes', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:25:38', 'Admin', '2025-04-26 21:25:56', 1),
(321, '816903000746', 'Aromatic Chinigura Rice1 KG', 1, 0, 0, 'na', 0, 0, 125.00, 155.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-26 21:26:39', '', '', 1),
(322, '816903000692', 'Chilli Powder 500g ', 1, 0, 0, 'na', 0, 0, 276.19, 345.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 22:02:11', '', '', 1),
(323, '816903000678', 'Turmeric Powder 500 g', 1, 0, 0, 'na', 0, 0, 235.00, 335.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-26 22:02:53', '', '', 1),
(324, '8941100511466', 'রাধুনী হলুদের গুড়া 200 গ্রাম', 2, 0, 0, 'na', 0, 0, 141.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 15:49:25', '', '', 1),
(325, '৮৯৪১১০০৫১২৬৪৭', 'রাঁধুনী সরিষার তেল 250 গ্রাম', 1, 0, 0, 'na', 0, 0, 77.00, 85.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 15:50:16', '', '', 1),
(326, '৮৯৪১১০০৫১২৭৩৯', 'চাট মশলা 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 64.00, 75.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 15:50:47', '', '', 1),
(327, '৮৯৪১১০০৫১১৩৯৮', 'কাচ্চি বিরিয়ানি মশলা 40 গ্রাম', 1, 0, 0, 'na', 0, 0, 58.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:51:22', '', '', 1),
(328, '৮৯৪১১০০৫১১৭২৫', 'রাধুনী হালিম মিক্স  200 গ্রাম', 1, 0, 0, 'na', 0, 0, 61.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:52:14', '', '', 1),
(329, '৮৯৪১১০০৫১১৪৯৭', 'রাঁধুনী মরিচের গুড়া 200 গ্রাম ', 1, 0, 0, 'na', 0, 0, 138.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 15:54:10', '', '', 1),
(330, '৮৯৪১১০০৫১১২৮২', 'রেডিমিক্স মুরগির মাংসের মশলা 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 81.00, 95.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:54:53', '', '', 1),
(331, '৮৯৪১১০০৫১১৭৮৭', 'রাঁধুনী খিচুড়ি মিক্স 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 133.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:55:34', '', '', 1),
(332, '৮৯৪১১০০৫১১১৭৬', 'রেডিমিক্স মাছের মশলা 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 67.00, 80.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:56:38', '', '', 1),
(333, '৮৯৪১১০০৫১১৭৯৪', 'রাঁধুনী সেমািই ', 1, 0, 0, 'na', 0, 0, 38.00, 45.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:57:13', '', '', 1),
(334, '৮৯৪১১০০৫১১০৮৪', 'রেডিমিক্স বোরহানি মশলা 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:57:53', '', '', 1),
(335, '৮৯৪১১০০৫১১৩২৯', 'রেডিমিক্স গরুর মাংসের মশালা 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 79.00, 90.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:58:39', '', '', 1),
(336, '৮৯৪১১০০৫১১৪২৮', 'রেডিমিক্স কালা ভুনা মশলা 80 গ্রাম', 1, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 15:59:23', '', '', 1),
(337, '৮৯৪১১০০৫১১৪০৪', 'রেডিমিক্স তেহারি মশলা 40 গ্রাম', 1, 0, 0, 'na', 0, 0, 46.00, 55.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:00:06', '', '', 1),
(338, '৮৯৪১১০০৫১১১৪৫', 'রেডিমিক্স মাংসের মশলা 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 84.00, 95.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:00:45', '', '', 1),
(339, '৮৯৪১১০০৫১১৩৭৪', 'রেডিমিক্স বিরিয়ানি মশলা 40 গ্রাম', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:02:09', '', '', 1),
(340, '৮৯৪১১০০৫১১৭৫৬', 'রাঁধুনী রিনি মিক্স 150 গ্রাম', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:02:47', '', '', 1),
(341, '৮৯৪১১০০৫১১৮৮৬', 'রাঁধুনী ক্ষীর মিক্স150 গ্রাম', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:03:30', '', '', 1),
(342, '৮৯৪১১০০৫১১৮৭৯', 'রাঁধুনী জর্দা 400 গ্রাম', 1, 0, 0, 'na', 0, 0, 133.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:04:09', '', '', 1),
(343, '৮৯৪১১০০৫১১০৫৩', 'রেডিমিক্স চটপটি মশলা 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 41.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:04:59', '', '', 1),
(344, '৮৯৪১১০০৫১১৪৩৫', 'রেডিমিক্স মেজবানি গরুর মাংসের মশলা 68 গ্রাম', 1, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:05:53', '', '', 1),
(345, '৮ি৯৪১১০০৫১১০৬০', 'রেডিমিক্স কাবাব মশলা 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 84.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:06:56', '', '', 1),
(346, '৮৯৪১১০০৫১১৪১১', 'রেডিমিক্স চিকেন তন্দুরি মশলা 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 68.00, 80.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:07:41', '', '', 1),
(347, '৮৯৪১১০০৫১২৬৫৪', 'রাঁধুনী সরিষার তেল 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 154.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:08:27', '', '', 1),
(348, '৮৯৪১১০০৫১২৬৬১', 'রাঁধুনী সরিষার তেল 1 লিটার', 1, 0, 0, 'na', 0, 0, 310.00, 340.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:09:05', '', '', 1),
(349, '৮৯৪১১০০৫১১৬১৯', 'রাঁধুনী সরিষার তেল 2 লিটার', 1, 0, 0, 'na', 0, 0, 560.00, 640.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:09:42', '', '', 1),
(350, '৮৯৪১১০০৫১২৬৩০', 'রাঁধুনী সরিষার তেল 80  মি লি', 1, 0, 0, 'na', 0, 0, 27.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:10:16', '', '', 1),
(351, '৮৯৪১১০০৫১০৭৭৩', 'রাঁধুনী চিলি ফ্লেক্স 40 গ্রাম', 1, 0, 0, 'na', 0, 0, 58.00, 70.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:10:49', '', '', 1),
(352, '৮৯৪১১০০৫১১৯৩০', 'রাঁধুনী ভিনেগার 540 মিলি', 1, 0, 0, 'na', 0, 0, 58.00, 70.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:11:29', '', '', 1),
(353, '৮৯৪১১০০৫১১১৬৯', 'রেডিমিক্স মাছের মশলা 20 গ্রাম', 1, 0, 0, 'na', 0, 0, 15.00, 18.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:12:10', '', '', 1),
(354, '৮৯৪১১০০৫১১৩০৫', 'রেডিমিক্স  মাংসের মশলা 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:12:59', '', '', 1),
(355, '৮৯৪১১০০৫১১১৩৮', 'রেডিমিক্স মাংসের মশলা 20 গ্রাম', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:13:40', '', '', 1),
(356, '৮৯৪১১০০৫১১২৭৫', 'রেডিমিক্স মুরগির মাংসের মশলা 20 গ্রাম', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:14:11', '', '', 1),
(357, '৮৯৪১১০০৫১০২৪৭', 'রেডিমিক্স জিরার গুঁড়া 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 24.00, 28.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:14:48', '', '', 1),
(358, '৮৯৪১১০০৫১০৮৬৫', 'রাঁধুনী স্বাদমিশালী সিজনিং মিক্স 4 গ্রাম', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:15:41', '', '', 1),
(359, '৮৯৪১১০০৫১০১১৭', 'রাঁধুনী মরিচের গুঁড়া 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 121.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:17:00', '', '', 1),
(360, '৮৯৪১১০০৫১০১৩১', 'রাঁধুনী মরিচের গুঁড়া 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 297.00, 345.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:18:07', 'Admin', '2025-04-27 16:18:25', 1),
(361, '৮৯৪১১০০৫১০১৪৮', 'রাঁধুনী মরিচের গুঁড়া 1কেজি', 1, 0, 0, 'na', 0, 0, 575.00, 665.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:19:03', '', '', 1),
(362, '৮৯৪১১০০৫১০১০০', 'রাঁধুনী মরিচের গুঁড়া 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 65.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:19:47', '', '', 1),
(363, '৮৯৪১১০০৫১০০৮৭', 'রাঁধুনী মরিচের গুঁড়া 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:20:16', '', '', 1),
(364, '৮৯৪১১০০৫১০০৫৬', 'রাঁধুনী হলুাদের গুঁড়া 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 2291.00, 335.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:21:20', '', '', 1),
(365, '৮৯৪১১০০৫১০০৬৩', 'রাঁধুনী হলুাদের গুঁড়া 1 কেজি', 1, 0, 0, 'na', 0, 0, 560.00, 640.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:21:50', '', '', 1),
(366, '৮৯৪১১০০৫১০৮৩৪', 'রাঁধুনী হলুাদের গুঁড়া 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:22:23', '', '', 1),
(367, '৮৯৪১১০০৫১০০৩২', 'রাঁধুনী হলুাদের গুঁড়া 200গ্রাম', 1, 0, 0, 'na', 0, 0, 126.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:22:54', '', '', 1),
(368, '৮৯৪১১০০৫১০২১৬', 'রাঁধুনী ধনিয়ার গুঁড়া 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 210.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:23:42', '', '', 1),
(369, '৮৯৪১১০০৫১০১৬২', 'রাঁধুনী ধনিয়ার গুঁড়া 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:24:35', '', '', 1),
(370, '৮৯৪১১০০৫১০১৮৬', 'রাঁধুনী ধনিয়ার গুঁড়া 100গ্রাম', 1, 0, 0, 'na', 0, 0, 51.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:25:05', '', '', 1),
(371, '৮৯৪১১০০৫১১৫২৭', 'রাঁধুনী ধনিয়ার গুঁড়া 200গ্রাম', 1, 0, 0, 'na', 0, 0, 110.00, 125.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:25:33', '', '', 1),
(372, '৮৯৪১১০০৫১০১৭৯', 'রাঁধুনী ধনিয়ার গুঁড়া 50গ্রাম', 1, 0, 0, 'na', 0, 0, 27.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:26:36', '', '', 1),
(373, '৮৯৪১১০০৫১০০২৫', 'রাঁধুনী হলুদের গুড়া', 1, 0, 0, 'na', 0, 0, 65.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:27:24', '', '', 1),
(374, '৮৯৪১১০০৫১০৩০৮', 'রাঁধুনী জিরার গুঁড়া 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 675.00, 750.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:28:25', '', '', 1),
(375, '৮৯৪১১০০৫১১২০৬', 'রেডিমিক্স রোস্ট মশলা 35 গ্রাম', 1, 0, 0, 'na', 0, 0, 55.00, 65.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:29:31', '', '', 1),
(376, '৮৯৪১১০০৫১১৮৫৫', 'ফালুদা মিক্স ', 1, 0, 0, 'na', 0, 0, 102.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:30:23', '', '', 1),
(377, '৮৯৪১১০০৫১০২৬১', 'রাঁধুনী জিরার গুড়াঁ 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 142.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:31:27', '', '', 1),
(378, '৮৯৪১১০০৫১০২৫৪', 'রাঁধুনী জিরার গুঁড়া 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 75.00, 85.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 16:32:31', '', '', 1),
(379, '৮৯৪১১০০৫১১৫৫৮', 'রাঁধুনী জিরার গুঁড়া 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 290.00, 330.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:33:19', '', '', 1),
(380, '৮৯৪১১০০৫১০৯৮৮', 'রাঁধুনী গুঁরা পাঁচফোড়ন 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:34:41', '', '', 1),
(381, '৮৯৪১১০০৫১০৯৯৫', 'রাঁধুনী আস্থা পাচফোড়ন 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:36:00', '', '', 1),
(382, '৮৯৪১১০০৫১২৭৪৬', 'ফ্রাইড রাইস সিজনিং মিক্স 8 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:36:43', '', '', 1),
(383, '৮৯৪১১০০৫১২৮৪৫', 'রেডিমিক্স খিচুড়ি মশলা 20  গ্রাম', 1, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:37:46', '', '', 1),
(384, '৮৯৪১১০০৫১১৮৬২', 'রাঁধুনী ফালুদা মিক্স  250 গ্রাম', 1, 0, 0, 'na', 0, 0, 102.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:38:48', '', '', 1),
(385, '৮৯৪১১০০৫১১০২২', 'রাঁধুনী গরম মশলার গুঁড়া 40 গ্রাম', 1, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:39:50', '', '', 1),
(386, '৮৯৪১১০০৫১১০১৫', 'রাঁধুনী গরম মশলার গুঁড়া 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 16:41:00', '', '', 1),
(387, '8941100512715', 'Sunflower Oil  1 Liter', 1, 0, 0, 'na', 0, 0, 385.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 16:54:39', '', '', 1),
(388, '৮৯৪১১০০৫১০০৯৪', 'ধাঁধুনী মরিচের গুঁড়া 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 33.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:48:12', '', '', 1),
(389, '8941161008707', 'Happy Nappy Big XXL ', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:56:43', 'Admin', '2025-06-24 22:54:51', 1),
(390, '8941161008684', 'Happy Nappy Big XL', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:57:32', 'Admin', '2025-06-24 22:55:18', 1),
(391, '8941161008660', 'Happy Nappy Big S', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:58:01', 'Admin', '2025-06-24 22:51:53', 1),
(392, '8941161008646', 'Happy Nappy diaper M', 2, 0, 0, 'na', 0, 0, 590.00, 890.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:58:27', '', '', 1),
(393, '8941161008622', 'Happy Nappy Big L', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:58:54', 'Admin', '2025-06-24 22:54:11', 1),
(394, '8941161008653', 'Happy Nappy diaper S 5 Pieces', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 17:59:53', 'Admin', '2025-04-27 18:00:13', 1),
(395, '8941161008639', 'Happy Nappy diaper M 5 Pieces', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:00:40', '', '', 1),
(396, '8941161008615', 'Happy Nappy diaper L 5 Pieces', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:01:16', '', '', 1),
(397, '8941161008677', 'Happy Nappy diaper XL 4 Pieces', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:01:56', '', '', 1),
(398, '8941161008691', 'Happy Nappy diaper XXL 4 Pieces', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:02:20', '', '', 1),
(399, '8941161007021', 'Anonna 8 Belt System', 2, 0, 0, 'na', 0, 0, 42.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:03:33', '', '', 1),
(400, '8941161007014', 'Anonna 15 Belt System', 2, 0, 0, 'na', 0, 0, 75.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:04:11', '', '', 1),
(401, '8941161007045', 'Anonna Regular Flow 8 Pads', 2, 0, 0, 'na', 0, 0, 46.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:05:13', '', '', 1),
(402, '8941161007076', 'Anonna Regular Flow 15 Pads', 2, 0, 0, 'na', 0, 0, 86.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:05:44', '', '', 1),
(403, '8941161007052', 'Anonna Heavy Flow 8 Pads b', 2, 0, 0, 'na', 0, 0, 62.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:06:21', '', '', 1),
(404, '8941161007069', 'Anonna Heavy Flow 15 Pads b', 2, 0, 0, 'na', 0, 0, 110.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:06:51', '', '', 1),
(405, '8941161006857', 'Happy Nappy Baby wipes 20 pcs b ', 2, 0, 0, 'na', 0, 0, 35.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:07:51', '', '', 1),
(406, '8941161006819', 'Happy Nappy Baby wipes 120 pcs b', 2, 0, 0, 'na', 0, 0, 130.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:08:31', '', '', 1),
(407, '8941161006826', 'Happy Nappy Baby Jar160 pcs b', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:09:23', '', '', 1),
(408, '8941161006840', 'Happy Nappy Baby Jar 240 pcs b', 2, 0, 0, 'na', 0, 0, 185.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 18:10:00', '', '', 1),
(409, '8941168070103', 'Lachcha Semai 150 G', 1, 0, 0, 'na', 0, 0, 38.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:00:58', '', '', 1),
(410, '8941168006706', 'Dry Cake 290 GM', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:01:39', '', '', 1),
(411, '8941168014527', 'Ifad Atta 2 Kg', 1, 0, 0, 'na', 0, 0, 100.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:04:37', '', '', 1),
(412, '8941168014589', ' Ifat suji Semolina 200 gm', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:06:50', 'Admin', '2025-07-14 10:45:39', 1),
(413, '8941168014572', 'Ifad suji  Semolina 500gm', 1, 0, 0, 'na', 0, 0, 38.00, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:07:44', 'Admin', '2025-07-14 10:46:11', 1),
(414, '8941168006713', 'Butter Delight 150 G', 1, 0, 0, 'na', 0, 0, 41.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:09:18', '', '', 1),
(415, '8941168005778', 'Choco Delight 175 gm', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:10:25', '', '', 1),
(416, '8941168006041', 'Chpecp Star 38 g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:11:59', '', '', 1),
(417, '8941168006737', 'Choco Chips Biscuit 175 g', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:12:44', '', '', 1),
(418, '8941168006553', 'Biscoff 210 g', 1, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:13:27', '', '', 1),
(419, '8941168005815', 'Kaju Belight 175 g', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:14:18', 'Admin', '2025-05-11 20:15:47', 1),
(420, '8941168005976', 'Kaju Delight 70 g', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:15:03', '', '', 1),
(421, '8941168006393', 'Milk Biscuit 45g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:16:03', '', '', 1),
(422, '8941168006430', 'Nutribite Lexus 180 gm', 1, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:16:46', '', '', 1),
(423, '8941168006751', 'Orange Delight 140g', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:17:55', '', '', 1),
(424, '8941168006324', 'Orange Delight 40bg', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:18:48', '', '', 1),
(425, '8941168012677', 'Ifad Pizza 160g', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:19:38', '', '', 1),
(426, '8941168006676', 'Unique Choice 80 g', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:20:21', '', '', 1),
(427, '8941168006669', 'Unique Choice 180 g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:21:04', '', '', 1),
(428, '8941168000216', 'Hot Nimki 200 g', 1, 0, 0, 'na', 0, 0, 68.00, 85.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:22:41', '', '', 1),
(429, '8941168000131', 'Hot Chanachur 150 G', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:23:46', '', '', 1),
(430, '8941168014770', 'Puffed Rice 500g', 1, 0, 0, 'na', 0, 0, 62.00, 75.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:24:29', '', '', 1),
(431, '8941168001060', 'IFad Pillow16 g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:25:59', '', '', 1),
(432, '8941168001282', 'IFad Pillow Chips15 g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:26:41', '', '', 1),
(433, '8941168001053', 'Eggy Stix 16 g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:27:23', '', '', 1),
(434, '8941168001220', 'Thaizzz Chips Wave 14', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:28:13', '', '', 1),
(435, '8941168001237', 'Thaizzz Chips Wave  Teriyaki 14', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:29:16', '', '', 1),
(436, '8941168001015', 'Wavy Chips BAR B- Q 20 g', 1, 0, 0, 'na', 0, 0, 10.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:29:56', '', '', 1),
(437, '8941168001275', 'Pillow Jumbo Pack 36 g', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:33:40', '', '', 1),
(438, '8941158067571', 'Dishoom 75 g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:34:33', '', '', 1),
(439, '8941168024113', 'Ifad Mustard Oil 1 liter', 1, 0, 0, 'na', 0, 0, 290.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:35:37', '', '', 1),
(440, '8941168024090', 'Ifad Mustard Oil 500 ml', 1, 0, 0, 'na', 0, 0, 136.00, 170.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 20:36:18', '', '', 1),
(441, '8941168024106', 'Ifad Mustard Oil 250 ml', 1, 0, 0, 'na', 0, 0, 69.00, 85.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 20:37:24', '', '', 1),
(442, '8941168019386', 'Ifad Eggy Instant Noodles 200g', 1, 0, 0, 'na', 0, 0, 58.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:38:08', '', '', 1),
(443, '8941168019393', 'Ifad Eggy Instant Noodles 400g', 1, 0, 0, 'na', 0, 0, 112.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:39:01', '', '', 1),
(444, '8941168019270', 'Ifad Eggy Instant Noodles 480g', 1, 0, 0, 'na', 0, 0, 148.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:40:33', '', '', 1),
(445, '8941168019324', 'Ifad Eggy Instant Noodles 720 g', 1, 0, 0, 'na', 0, 0, 222.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:41:16', '', '', 1),
(446, '8941168013285', 'Premium Muri Toast 300 g', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:42:31', 'Admin', '2025-06-24 11:32:23', 1),
(447, '8941168013261', 'Ifad Plain Toast 170 g', 1, 0, 0, 'na', 0, 0, 41.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:43:25', '', '', 1),
(448, '8941168013087', 'IFad Stick Toast 300g', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:44:33', '', '', 1),
(449, '8941168019836', 'Ifad Vermicelli 200 g', 1, 0, 0, 'na', 0, 0, 33.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:46:13', '', '', 1),
(450, '8941168015289', 'IFad Chick pea Bason 500 g', 1, 0, 0, 'na', 0, 0, 85.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:47:26', '', '', 1),
(451, '8941168016736', 'IFad Kheer Mix 150 g', 1, 0, 0, 'na', 0, 0, 58.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:48:10', '', '', 1),
(452, '8941168016699', 'Ifad Biryani Masala 40g', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:49:11', '', '', 1),
(453, '8941168016705', 'IFad Chatpati Masala 50 g', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:49:59', '', '', 1),
(454, '8941168016507', 'Ifad Chicken Curry Masala 100g', 1, 0, 0, 'na', 0, 0, 78.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:51:01', '', '', 1),
(455, '8941168016750', 'Ifad Kala Bhuna Masala 80 g', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:52:02', '', '', 1),
(456, '8941168016491', 'Ifad Meat Curry Masala 100g', 1, 0, 0, 'na', 0, 0, 80.00, 95.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:52:59', '', '', 1),
(457, '8941168016767', 'Ifad Tehari Masala 40g', 1, 0, 0, 'na', 0, 0, 44.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 20:53:51', '', '', 1),
(458, '8941762014510', 'Ifad Atta 1 Kg ', 1, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 20:57:00', '', '', 1),
(459, '8941100504918', 'Revive Sunscreen 50 ml', 2, 0, 0, 'na', 0, 0, 500.00, 700.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 21:30:26', '', '', 1),
(460, '8941100501184', 'Brushing Training Kit 45 g', 2, 0, 0, 'na', 0, 0, 120.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 21:31:13', '', '', 1),
(461, 'P00461', 'Meril Baby Orange Upto 6 y 45 g', 2, 0, 0, 'na', 0, 0, 76.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 21:31:55', '', '', 1),
(462, '8941100501214', 'Meril Baby Strawberry 45 g', 2, 0, 0, 'na', 0, 0, 76.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 21:32:33', '', '', 1),
(463, '8941100501351', 'Meril Baby Ziraf 6 y ', 2, 0, 0, 'na', 0, 0, 53.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-27 21:33:39', '', '', 1),
(464, '8941100501719', 'Meril Baby Panda ', 2, 0, 0, 'na', 0, 0, 53.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:34:11', '', '', 1),
(465, '8941100502945', 'Meril Baby Violin ', 2, 0, 0, 'na', 0, 0, 53.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:35:00', '', '', 1),
(466, 'P00466', 'Meril Baby Shampoo 110 ml', 2, 0, 0, 'na', 0, 0, 145.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:35:41', '', '', 1),
(467, '8941100500255', 'Meril Baby Oil 100 ml', 2, 0, 0, 'na', 0, 0, 200.00, 270.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:36:37', '', '', 1),
(468, '8941100501580', 'Meril Baby Soap 75 ml', 2, 0, 0, 'na', 0, 0, 75.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:37:08', '', '', 1),
(469, '8941100505243', 'Sepnil Sanitizing soap bar 75 g', 2, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:38:04', '', '', 1),
(470, '8941100505250', 'Sepnil Stops Germs 100 g', 2, 0, 0, 'na', 0, 0, 48.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:38:38', '', '', 1),
(471, '8941100503089', 'White plus pro sensitive 90 g', 2, 0, 0, 'na', 0, 0, 72.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:39:19', '', '', 1),
(472, '8941100503072', 'White plus pro sensitive 40 g	', 2, 0, 0, 'na', 0, 0, 38.00, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:39:53', '', '', 1),
(473, '8941100503096', 'White plus Whitening mouthwash 250 ml', 2, 0, 0, 'na', 0, 0, 130.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:40:55', '', '', 1),
(474, '8941100504468', 'Jui Multi Vitamin oil 200 ml', 2, 0, 0, 'na', 0, 0, 155.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:41:42', '', '', 1),
(475, '8941100504475', 'Jui Multi Vitamin oil 350 ml', 2, 0, 0, 'na', 0, 0, 230.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:42:17', '', '', 1),
(476, '8941100504451', 'Jui Multi Vitamin oil 100 ml', 2, 0, 0, 'na', 0, 0, 84.00, 100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:42:43', '', '', 1),
(477, '8941100504499', 'Jui Multi Onion oil 200 ml', 2, 0, 0, 'na', 0, 0, 144.00, 170.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:43:23', '', '', 1),
(478, '8941100505083', 'Jui Multi Vitamin oil Beli 200 ml', 2, 0, 0, 'na', 0, 0, 155.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:44:03', '', '', 1),
(479, '8941100504413', 'Sepnil  Liquid Floor Cleaner 500 ml', 2, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:44:55', '', '', 1),
(480, 'P00480', 'Sepnil Liquid Floor Cleaner 1Liter', 2, 0, 0, 'na', 0, 0, 200.00, 270.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-27 21:45:28', '', '', 1),
(481, '8941100501092', 'Senora Confidence 15 pads', 2, 0, 0, 'na', 0, 0, 119.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:46:16', '', '', 1),
(482, '8941100503935', 'Senora Long Heavy Flow 15 Pads', 2, 0, 0, 'na', 0, 0, 119.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:47:02', '', '', 1),
(483, '8941100505113', 'Senora Feather Light 15 Pads', 2, 0, 0, 'na', 0, 0, 192.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:47:53', '', '', 1),
(484, '8941100500040', 'Senora Belt 15 Pads', 2, 0, 0, 'na', 0, 0, 107.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:49:06', '', '', 1),
(485, '8941100500415', 'Senora Belt 10 Pads', 2, 0, 0, 'na', 0, 0, 82.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:50:09', '', '', 1),
(486, '8941100500057', 'Senora Panty sanitary Napkin 15 Pads', 2, 0, 0, 'na', 0, 0, 107.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:51:02', '', '', 1),
(487, '8941100500941', 'senora Panty sanitary Napkin 10 Pads	', 2, 0, 0, 'na', 0, 0, 82.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:51:50', '', '', 1),
(488, '8941100502617', 'Supermom Baby Diaper S 5 Pcs', 2, 0, 0, 'na', 0, 0, 98.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:52:50', '', '', 1),
(489, '8941100502624', 'Supermom Baby Diaper M 5 Pcs', 2, 0, 0, 'na', 0, 0, 110.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:53:25', '', '', 1),
(490, '8941100502631', 'Supermom Baby Diaper L 5 Pcs', 2, 0, 0, 'na', 0, 0, 119.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:53:55', '', '', 1),
(491, '8941100502648', 'Supermom Baby Diaper Xl 4 Pcs', 2, 0, 0, 'na', 0, 0, 110.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:54:25', '', '', 1),
(492, '8941100502655', 'Supermom Baby Diaper S 60 Pcs', 2, 0, 0, 'na', 0, 0, 1105.00, 1500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:55:04', '', '', 1),
(493, '8941100502662', 'Supermom Baby Diaper M 50 Pcs', 2, 0, 0, 'na', 0, 0, 1105.00, 1500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:55:53', '', '', 1),
(494, '8941100502686', 'Supermom Baby Diaper Xl 40 Pcs', 2, 0, 0, 'na', 0, 0, 1105.00, 1500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:56:24', 'Admin', '2025-04-27 21:57:19', 1),
(495, '8941100502679', 'Supermom Baby Diaper L 40 Pcs', 2, 0, 0, 'na', 0, 0, 995.00, 1350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:57:47', '', '', 1),
(496, '8941100502518', 'Supermom Baby Wipes 20 pcs', 2, 0, 0, 'na', 0, 0, 45.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:58:45', '', '', 1),
(497, '8941100502587', 'Supermom Baby Wipes 120 pcs', 2, 0, 0, 'na', 0, 0, 155.00, 235.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-27 21:59:19', '', '', 1),
(498, '9415007013390', 'Diploma  Instant Full Cream Milk Powder 400 g', 1, 0, 0, 'na', 0, 0, 340.00, 375.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 16:44:56', 'Admin', '2025-04-28 16:45:19', 1),
(499, '9415007013402', 'Diploma Instant Full Cream Milk Powder 500 g', 1, 0, 0, 'na', 0, 0, 447.50, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:46:15', '', '', 1),
(500, '9415007013396', 'Diploma Instant Full Cream Milk Powder 1K', 1, 0, 0, 'na', 0, 0, 890.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:46:50', '', '', 1),
(501, '8941160030150', 'Farmland Full Cream Milk Powder 500 g', 1, 0, 0, 'na', 0, 0, 355.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:49:37', '', '', 1),
(502, '8941160030143', 'Farmland Full Cream Milk Powder 1k g', 1, 0, 0, 'na', 0, 0, 695.00, 790.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:50:14', '', '', 1),
(503, '8941160031508', 'Red Cow Instant Full Cream Milk Powder 400 g', 1, 0, 0, 'na', 0, 0, 345.00, 385.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:53:18', '', '', 1),
(504, '8941160030976', 'Shape Up  Non Fat Hi Protein Mil powder 400 g', 1, 0, 0, 'na', 0, 0, 440.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:54:29', '', '', 1),
(505, '8941160030969', 'Calci - Pro High Calcium 21 + 400 g', 1, 0, 0, 'na', 0, 0, 440.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:55:24', '', '', 1),
(506, '9415007015468', 'Red Cow Butter Oil 400 g', 1, 0, 0, 'na', 0, 0, 683.00, 745.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:56:28', '', '', 1),
(507, '9415007015475', 'Red Cow Butter Oil 900 g', 1, 0, 0, 'na', 0, 0, 1490.00, 1600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:57:44', '', '', 1),
(508, '8941160037166', 'Farmland  Premium Aromatic chingura Rice 1 Kg', 1, 0, 0, 'na', 0, 0, 135.00, 165.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 16:58:44', '', '', 1),
(509, '8941160031577', 'Doodles Chow Mein 300 g', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:00:14', '', '', 1),
(510, '8941160031522', 'Doodles Korean Ramen 4 Packs', 1, 0, 0, 'na', 0, 0, 86.00, 105.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:01:17', '', '', 1),
(511, '8941160031539', 'Doodles Korean Ramen 8 Packs', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:01:54', 'Admin', '2025-06-28 13:39:05', 1),
(512, '9415007916598', 'Doodles Masala Twist 8 Packs', 1, 0, 0, 'na', 0, 0, 132.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:02:44', '', '', 1),
(513, '9415007551478', 'Doodles Masala Twist 4 Packs', 1, 0, 0, 'na', 0, 0, 70.00, 90.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:03:14', '', '', 1),
(514, '8941160031546', 'Doodles Masala Twist 16Packs', 1, 0, 0, 'na', 0, 0, 270.00, 330.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:03:52', 'Admin', '2025-04-28 17:04:08', 1),
(515, '8941160031553', 'Doodles Masala Twist 12Packs', 1, 0, 0, 'na', 0, 0, 205.00, 255.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-28 17:04:55', 'Admin', '2025-06-28 13:38:27', 1),
(516, '8941160031454', 'Red Cow  Instant Full Cream Milk Powder 500 g', 1, 0, 0, 'na', 0, 0, 430.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:07:30', '', '', 1),
(517, 'P00517', 'Diploma  Milk Powder 200 g', 1, 0, 0, 'na', 0, 0, 191.00, 205.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:09:19', 'Admin', '2025-04-28 17:11:16', 1),
(518, 'P00518', 'Diploma 100 g', 1, 0, 0, 'na', 0, 0, 101.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:14:20', '', '', 1),
(519, 'P00519', 'Diploma 50 g', 1, 0, 0, 'na', 0, 0, 53.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:15:55', '', '', 1),
(520, 'P00520', 'Red Cow Butter Oil 200g', 1, 0, 0, 'na', 0, 0, 345.00, 385.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:17:53', '', '', 1),
(521, '846656010051', 'mr Noodles Easy Instant Noodles 140 g', 1, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:37:00', '', '', 1),
(522, '840205750849', 'Mr Noodles Magic  Masala 8 easy pack', 1, 0, 0, 'na', 0, 0, 131.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:38:43', '', '', 1),
(523, '840205726523', 'Mr Noodles Korean Kimchi ramen 480 g', 1, 0, 0, 'na', 0, 0, 183.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:39:37', '', '', 1),
(524, '831730009335', 'Mr Noodles Egg Noodles 150g', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:40:48', '', '', 1),
(525, '841165122745', 'Mr Noodles Mini 80g', 1, 0, 0, 'na', 0, 0, 12.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:42:21', '', '', 1),
(526, '846656006535', 'Mr Noodles chicken 8 packs', 1, 0, 0, 'na', 0, 0, 146.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:43:17', '', '', 1),
(527, '840205728251', 'Mr Noodles cup  35g', 1, 0, 0, 'na', 0, 0, 28.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 17:44:13', 'Admin', '2025-05-22 17:34:59', 1),
(528, '8941100510018', 'রাঁধুনী হলুদের গুঁড়া 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:19:37', '', '', 1),
(529, '৮৯৪১১০০৫১১৯১৬', 'রাঁধুনী গরুর মাংসের মশলা 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:22:07', '', '', 1),
(530, '৮৯৪১১০০৫১০১৯৩', 'রাঁধুনী ধনিয়ার গুঁড়া 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 95.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:24:50', '', '', 1),
(531, '৮৯৪১১০০৫১৪১৯১', 'রুচি অিরিজিনাল মিক্স 150 গ্রাম', 1, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:39:10', '', '', 1),
(532, 'P00৮৯৪১১০০৫১৪২১৪', 'রুচি অিরিজিনাল মিক্স 300 গ্রাম', 1, 0, 0, 'na', 0, 0, 86.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:39:54', '', '', 1),
(533, '৮৯৪১১০০৫১৩২৮৬', 'রুচি চানাচুর প্রিমিয়াম মিক্স 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:40:38', '', '', 1),
(534, '৮৯৪১১০০৫১৩২৯৩', 'রুচি চানাচুর প্রিমিয়াম মিক্স 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 104.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:41:11', 'Admin', '2025-04-28 18:41:22', 1),
(535, '৮৯৪১১০০৫১৩৫৫২', 'রুচি ঝাল চানাচুর  22 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:42:12', '', '', 1),
(536, '৮৯৪১১০০৫১৩১৬৩', 'রুচি ঝাল চানাচুর 150 গ্রাম', 1, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:42:48', '', '', 1),
(537, '৮৯৪১১০০৫১৩২৫৫', 'রুচি ঝাল চানাচুর 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:43:14', '', '', 1),
(538, '৮৯৪১১০০৫১৩২২৪', 'রুচি ঝাল চানাচুর 300 গ্রাম', 1, 0, 0, 'na', 0, 0, 86.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:43:33', '', '', 1),
(539, '৮৯৪১১০০৫১৩২১৭', 'রুচি -বি- কিউ চানাচুর 300 গ্রাম', 1, 0, 0, 'na', 0, 0, 86.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:44:14', '', '', 1),
(540, '৮৯৪১১০০৫১৩৫৬৯', 'রুচি -বি- কিউ চানাচুর 22 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:44:46', '', '', 1),
(541, '৮৯৪১১০০৫১৩১৯৪', 'রুচি -বি- কিউ চানাচুর 150 গ্রাম', 1, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:45:10', '', '', 1),
(542, '৮৯৪১১০০৫১৩২৪৮', 'রুচি -বি- কিউ চানাচুর 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:46:09', '', '', 1),
(543, '৮৯৪১১০০৫১৪১১৫', 'রুচি ঢাল ভাজা', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:47:01', '', '', 1),
(544, '৮৯৪১১০০৫১৩৩৫৪', 'রুচি ডাল ভাজা 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:47:45', '', '', 1),
(545, '৮৯৪১১০০৫১৩৮১১', 'রুচি মুড়ি 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:48:41', 'Admin', '2025-04-28 18:49:18', 1),
(546, '৮৯৪১১০০৫১৩৮২৮', 'রুচি মুড়ি 400 গ্রাম', 1, 0, 0, 'na', 0, 0, 55.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:50:20', '', '', 1),
(547, '৮৯৪১১০০৫১৪১৬০', 'রুচি পটেটো ক্র্যাকার্স 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:51:17', '', '', 1),
(548, '৮৯৪১১০০৫১৩৭৯৮', 'রুচি পটেটো ক্র্যাকার্স 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 12.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:51:52', '', '', 1),
(549, '৮৯৪১১০০৫১৪২০৭', 'রুচি পটেটো ক্র্যাকার্স  থাই সুইট 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:52:56', '', '', 1),
(550, '৮৯৪১১০০৫১৩৮৬৬', 'রুচি পটেটো ক্র্যাকার্স থাই সুইট 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 12.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:53:30', '', '', 1),
(551, '৮৯৪১১০০৫১৩৭০৫', 'রুচি ঝুরিভাজা 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:54:35', '', '', 1),
(552, '৮৯৪১১০০৫১৩৬২০', 'রুচি ঝাল মুড়ি 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:55:19', '', '', 1),
(553, '৮৯৪১১০০৫১৪০৫৪', 'রুচি চিড়া ভাজা 25 গ্রাম', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:56:12', '', '', 1),
(554, '৮৯৪১১০০৫১৫১৬৭', 'চপস্টিক ইয়ামি মাসালা 248 গ্রাম', 1, 0, 0, 'na', 0, 0, 73.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:57:21', '', '', 1),
(555, '৮৯৪১১০০৫১২২০৩', 'চপস্টিক ইয়ামি মাসালা 496 গ্রাম', 1, 0, 0, 'na', 0, 0, 138.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:58:08', '', '', 1),
(556, '৮৯৪১১০০৫১২২১০', 'চপস্টিক ইয়ামি মাসালা 744 গ্রাম', 1, 0, 0, 'na', 0, 0, 213.00, 245.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 18:59:17', '', '', 1),
(557, '৮৯৪১১০০৫১২২২৭', 'চপস্টিক ইয়ামি মাসালা 992 গ্রাম', 1, 0, 0, 'na', 0, 0, 256.00, 315.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:01:20', '', '', 1),
(558, '৮৯৪১১০০৫১৫১৮১', 'চপস্টিক দেশী মাসালা 248 গ্রাম', 1, 0, 0, 'na', 0, 0, 83.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:02:15', '', '', 1),
(559, '৮৯৪১১০০৫১২২৪১', 'চপস্টিক দেশী মাসালা 496 গ্রাম', 1, 0, 0, 'na', 0, 0, 138.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:02:46', '', '', 1),
(560, '৮৯৪১১০০৫১২২৫৮', 'চপস্টিক দেশী মাসালা 744 গ্রাম', 1, 0, 0, 'na', 0, 0, 213.00, 245.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:03:14', '', '', 1),
(561, '৮৯৪১১০০৫১২২৬৫', 'চপস্টিক দেশী মাসালা 992গ্রাম', 1, 0, 0, 'na', 0, 0, 256.00, 315.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:03:48', '', '', 1),
(562, '৮৯৪১১০০৫১৫৭০৯', 'চপস্টিক মাসালা  ডিলাইট  140 গ্রাম', 1, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:06:02', '', '', 1),
(563, '৮৯৪১১০০৫১২২৭২', 'চপস্টিক মাসালা  ডিলাইট  248 গ্রাম', 1, 0, 0, 'na', 0, 0, 73.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:06:29', '', '', 1),
(564, '৮৯৪১১০০৫১২২৮৯', 'চপস্টিক মাসালা  ডিলাইট  496 গ্রাম', 1, 0, 0, 'na', 0, 0, 138.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:07:09', '', '', 1),
(565, '৮৯৪১১০০৫১২২৯৬', 'চপস্টিক মাসালা  ডিলাইট  744 গ্রাম', 1, 0, 0, 'na', 0, 0, 213.00, 245.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:07:44', '', '', 1),
(566, '৮৯৪১১০০৫১৪৯৯৩', 'চপস্টিক রামেন হট চিকেন 160 গ্রাম', 1, 0, 0, 'na', 0, 0, 145.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:08:56', '', '', 1),
(567, '৮৯৪১১০০৫১৫০৬৮', 'চপস্টিক স্টিক নুডলস150 গ্রাম', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:11:15', '', '', 1),
(568, '৮৯৪১১০০৫১২১০৪', 'চাষী সুগন্ধি চিনিগুড়াঁ চাল 1 কেজি', 1, 0, 0, 'na', 0, 0, 138.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:12:40', '', '', 1),
(569, '৮৯৪১১০০৫১৪৭০২', 'রুচি মিক্সড ফ্রট জ্যাম 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 171.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:14:29', '', '', 1),
(570, '৮৯৪১১০০৫১৪৬৯৬', 'রুচি অরেঞ্জ জ্যাম 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 171.00, 195.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:15:13', '', '', 1),
(571, '৮৯৪১১০০৫১৪৬৭২', 'রুচি অরেঞ্জ জ্যাম 250 গ্রাম', 1, 0, 0, 'na', 0, 0, 94.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:15:59', '', '', 1),
(572, '৮৯৪১১০০৫১৪৬৮৯', 'রুচি মিক্সড ফ্রট জ্যাম 250গ্রাম', 1, 0, 0, 'na', 0, 0, 94.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:16:49', '', '', 1),
(573, '৮৯৪১১০০৫১৪৭৩৩', 'রুচি আমের আচার 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 93.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:17:44', '', '', 1),
(574, '৮৯৪১১০০৫১৪৭৭১', 'রুচি মিক্সড আচার', 1, 0, 0, 'na', 0, 0, 158.00, 190.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:18:35', '', '', 1),
(575, '৮৯৪১১০০৫১৪৯১৭', 'রুচি জলপাই আচার 1000 গ্রাম', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:19:24', '', '', 1),
(576, '৮৯৪১১০০৫৯৪৭৫৯', 'রুচি রসুনের আচার 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 128.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:20:23', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(577, '৮৯৪১১০০৫১৪৯০০', 'রুচি চালতার আচার 400 গ্রাম', 1, 0, 0, 'na', 0, 0, 158.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:21:13', '', '', 1),
(578, '৮৯৪১১০০৫১৪১২২', 'রুচি বরই আচার 450 গ্রাম', 1, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:21:54', '', '', 1),
(579, '৮৯৪১১০০৫১৩৫৭৬', 'রুচি চাটনি তেঁতুল 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:22:58', '', '', 1),
(580, '৮৯৪১১০০৫১৩৫৮৩', 'রুচি চাটনি   বরই 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:23:53', '', '', 1),
(581, '৮৯৪১১০০৫১৩৬১৩', 'রুচি লাল মরিচের সস্ 8 গ্রাম', 1, 0, 0, 'na', 0, 0, 2.00, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:24:39', '', '', 1),
(582, '৮৯৪১১০০৫১৩৬০৬', 'রুচি টমেটো কেচাপ 8 গ্রাম', 1, 0, 0, 'na', 0, 0, 2.00, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:25:24', '', '', 1),
(583, '৮৯৪১১০০৫১৩৫৯০', 'রুচি ঝাল টমেটো সস্ 8 গ্রাম', 1, 0, 0, 'na', 0, 0, 2.00, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-28 19:26:13', '', '', 1),
(584, '৮৯৪১১০০৫১৪৩৪৪', 'রুচি তেঁতুলে সস্ 370 গ্রাম', 1, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:26:48', '', '', 1),
(585, '৮৯৪১১০০৫১৪৩৩৭', 'রুচি লাল মরিচের সস্ 360 গ্রাম', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:27:33', '', '', 1),
(586, '৮৯৪১১০০৫১৪৩১৩', 'রুচি টমেটো কেচাপ 350 গ্রাম', 1, 0, 0, 'na', 0, 0, 102.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:28:07', '', '', 1),
(587, '৮৯৪১১০০৫১৪৩২০', 'রুচি ঝাল টমেটো সস্ 350 গ্রাম', 1, 0, 0, 'na', 0, 0, 102.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:28:48', '', '', 1),
(588, '৮৯৪১১০০৫১৪৩৭৫', 'রুচি ঝাল টমেটো সস্ 1 কেজি', 1, 0, 0, 'na', 0, 0, 253.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:29:26', '', '', 1),
(589, '৮৯৪১১০০৫১৪৪৩৬', 'রুচি রসুনের সস্ 350 গ্রাম ', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:30:14', '', '', 1),
(590, '৮৯৪১১০০৫১৪৪৪৩', 'রুচি সুইট চিলি সস্ 350 গ্রাম ', 1, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:30:59', '', '', 1),
(591, '৮৯৪১১০০৫১৪১৭৭', 'রুচি সুইট চিলি সস্ 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 76.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:31:34', '', '', 1),
(592, '৮৯৪১১০০৫১৪১৪৬', 'রুচি বার-বি-কিউ সস্ 200 গ্রাম', 1, 0, 0, 'na', 0, 0, 125.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:32:18', '', '', 1),
(593, '৮৯৪১১০০৫১৪২২১', 'রুচি পিনাট বার 15 গ্রাম', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-28 19:33:43', '', '', 1),
(594, '8941100502730', 'Chaka Advance Ball  Soap 0125 g', 2, 0, 0, 'na', 0, 0, 22.09, 26.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:29:57', '', '', 1),
(595, '8941100501221', 'Chamak Fabric Brightener  50 ml', 2, 0, 0, 'na', 0, 0, 18.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:31:23', '', '', 1),
(596, '8941100501238', 'Chamak Fabric Brightener 100ml', 2, 0, 0, 'na', 0, 0, 31.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:32:23', '', '', 1),
(597, '8941100501313', 'Chaka Super White 200 ml', 2, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:33:06', '', '', 1),
(598, '8941100501320', 'Chaka Super White 500g', 2, 0, 0, 'na', 0, 0, 81.51, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:33:42', '', '', 1),
(599, '8941100505229', 'Chaka Super White1 Kg', 2, 0, 0, 'na', 0, 0, 143.50, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:34:49', '', '', 1),
(600, '8941100505175', 'Chaka All in 1 Lemon 500g', 2, 0, 0, 'na', 0, 0, 64.56, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:35:31', '', '', 1),
(601, '8941100505199', 'Chaka All in 1 Lemon 1kg', 2, 0, 0, 'na', 0, 0, 113.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:36:17', '', '', 1),
(602, '8941100505205', 'Chaka All in 1 Lemon 2kg', 2, 0, 0, 'na', 0, 0, 325.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:38:01', '', '', 1),
(603, '8941100500507', 'Jui Naturl Pure Coconut Oil 200 ml', 2, 0, 0, 'na', 0, 0, 170.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:38:57', '', '', 1),
(604, '8941100500514', 'Jui Naturl Pure Coconut Oil 350 ml', 2, 0, 0, 'na', 0, 0, 270.00, 310.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:39:29', '', '', 1),
(605, '8941100500477', 'Jui Naturl Pure Coconut Oil Pl 100 ml', 2, 0, 0, 'na', 0, 0, 87.00, 100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:41:20', '', '', 1),
(606, '8941100500484', 'Jui Naturl Pure Coconut Oil Pl 200 ml', 2, 0, 0, 'na', 0, 0, 161.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:42:05', '', '', 1),
(607, '8941100500491', 'Jui Naturl Pure Coconut Oil Pl 350 ml', 2, 0, 0, 'na', 0, 0, 270.00, 310.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:42:46', '', '', 1),
(608, '8941100502211', 'Jui Hair Fall Control 350', 2, 0, 0, 'na', 0, 0, 262.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:49:06', '', '', 1),
(609, '8941100500989', 'Kool After Shave Lotion 50 ml', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:50:17', '', '', 1),
(610, '8941100500996', 'Kool After Shave Lotion 150 ml', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 10:50:50', '', '', 1),
(611, '8941100503249', 'Kool Deodorant body spray 150 ml', 2, 0, 0, 'na', 0, 0, 250.00, 325.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:51:53', '', '', 1),
(612, '8941100501054', 'Kool Deodorant body spray  Bule 150 ml', 2, 0, 0, 'na', 0, 0, 250.00, 325.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:52:50', '', '', 1),
(613, '8941100500576', 'Kool Shaving Fam 100 ml', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:53:54', '', '', 1),
(614, '8941100500583', 'Kool Shaving Fam 200 ml', 2, 0, 0, 'na', 0, 0, 263.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:54:37', '', '', 1),
(615, '8941100500590', 'Kool Shaving Fam 400ml', 2, 0, 0, 'na', 0, 0, 295.00, 390.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:55:16', '', '', 1),
(616, '8941100504864', 'Magic Herbal Toothpaste CM 200ml', 2, 0, 0, 'na', 0, 0, 152.00, 175.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:56:04', '', '', 1),
(617, '8941100503560', 'Magic Herbal Toothpaste 100ml', 2, 0, 0, 'na', 0, 0, 78.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:56:42', '', '', 1),
(618, '8941100503652', 'Magic Extra Fresh Tooth Powder 100 g', 2, 0, 0, 'na', 0, 0, 49.00, 58.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:58:35', '', '', 1),
(619, '8941100500033', 'Magic Extra Fresh Tooth Powder 50g', 2, 0, 0, 'na', 0, 0, 27.00, 32.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 10:59:08', '', '', 1),
(620, '8941100500231', 'Meril Baby Lotion 100 ml', 2, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 11:00:04', '', '', 1),
(621, '8941100500248', 'Meril Baby Lotion 200ml', 2, 0, 0, 'na', 0, 0, 285.00, 340.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 11:00:25', '', '', 1),
(622, '8941100501047', 'Meril Nourishin nail poslis remover 40 ml', 2, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 11:01:14', '', '', 1),
(623, '8941100500538', 'Meril Olive Oil 150 ml', 2, 0, 0, 'na', 0, 0, 375.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 11:01:56', '', '', 1),
(624, '8941100501917', 'Meril Milk and Beli 150 g', 2, 0, 0, 'na', 0, 0, 71.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:02:51', '', '', 1),
(625, '8941100503256', 'Meril Milk and Kiwi150 g', 2, 0, 0, 'na', 0, 0, 66.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:03:24', 'Admin', '2025-04-29 11:05:18', 1),
(626, '8941100502068', 'Meril Milk Pure Milk 150 g', 2, 0, 0, 'na', 0, 0, 71.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:04:05', '', '', 1),
(627, '8941100504758', 'Meril Vitamin C Soap Bar 150 g', 2, 0, 0, 'na', 0, 0, 71.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:04:53', '', '', 1),
(628, '8941100501290', 'Meril Milk Soap Bar 100 ml', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:06:11', '', '', 1),
(629, '8941100501726', 'Meril Milk Pure Milk 100g', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:06:49', '', '', 1),
(630, '8941100504741', 'Meril Vitamin C soap Bar Orange 100 ml', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:08:33', '', '', 1),
(631, '8941100504727', 'Meril Vitamin C soap Bar Lemon 100 ml', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:09:14', '', '', 1),
(632, '8941100500187', 'Meril  Milk and Kiwi 100 ml', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:10:11', '', '', 1),
(633, '8941100503317', 'Revive Herbs 5 110 ml ', 2, 0, 0, 'na', 0, 0, 88.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:11:23', '', '', 1),
(634, '8941100500002', 'Revive Perfect Skin Talcum Powder 100 ml', 2, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:12:20', 'Admin', '2025-06-18 22:37:59', 1),
(635, '8941100500019', 'Revive Perfect Skin Talcum Powder 200 ml', 2, 0, 0, 'na', 0, 0, 77.33, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:12:47', 'Admin', '2025-06-18 22:39:04', 1),
(636, '8941100501276', 'Sepnil Stops Germ Marigold 170 ml', 2, 0, 0, 'na', 0, 0, 65.67, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 11:13:38', '', '', 1),
(637, '8941100501108', 'Sepnil Marigold Pum 200 ml', 2, 0, 0, 'na', 0, 0, 92.00, 105.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 11:14:36', '', '', 1),
(638, '8941100502938', 'Sepnil Marigold Pum 1Liter', 2, 0, 0, 'na', 0, 0, 268.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 11:15:09', '', '', 1),
(639, '8906105101258', 'Horlicks  JR 1000 g', 1, 0, 0, 'na', 0, 0, 794.00, 850.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:18:27', '', '', 1),
(640, '8906105101326', 'Horlicks  Stage 1 JR 500 g', 1, 0, 0, 'na', 0, 0, 467.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:20:29', '', '', 1),
(641, '8906105101340', 'Horlicks Stage  2 JR 500 g', 1, 0, 0, 'na', 0, 0, 467.00, 500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 12:21:03', '', '', 1),
(642, '8906105101272', 'Horlicks JR 250 g', 1, 0, 0, 'na', 0, 0, 234.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 12:22:32', '', '', 1),
(643, '8906105101265', 'Horlicks Standerd  500 g', 1, 0, 0, 'na', 0, 0, 421.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 12:23:41', '', '', 1),
(644, '8906105101227', 'Hosrlicks Pouch Pack 400 g', 1, 0, 0, 'na', 0, 0, 327.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:24:29', '', '', 1),
(645, '8906105101098', 'Mothers Horlicks Plus 350 g', 1, 0, 0, 'na', 0, 0, 579.00, 620.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:25:34', '', '', 1),
(646, '8906105101319', 'Horlicks Choco JR 500g', 1, 0, 0, 'na', 0, 0, 467.00, 500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 12:33:02', '', '', 1),
(647, '8906105101364', 'Horlicks Light JR 400g', 1, 0, 0, 'na', 0, 0, 607.00, 650.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 12:33:41', '', '', 1),
(648, '8906105100930', 'Maltova Yummy Chococaramel Drink 400 g', 1, 0, 0, 'na', 0, 0, 467.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:34:31', '', '', 1),
(649, '8906105101203', 'Horlicks Mini18g', 1, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:35:57', '', '', 1),
(650, '8906105101371', 'Boost Sander JR 400g', 1, 0, 0, 'na', 0, 0, 467.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:36:40', '', '', 1),
(651, '8906105100794', 'Glucomax D 75 g', 1, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:39:16', '', '', 1),
(652, '8906105101401', 'Glucomax D 50 g', 1, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:39:48', '', '', 1),
(653, '8906105101395', 'Glucomax D 350 g', 1, 0, 0, 'na', 0, 0, 140.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:40:21', '', '', 1),
(654, '8941100616895', 'Chicken Corn Soup 24 g', 1, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:42:07', '', '', 1),
(655, '8941100647493', 'Hot and Sour Chiken Soup 31 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:42:45', '', '', 1),
(656, 'P00656', 'Knors Thai Soup 28 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:43:20', '', '', 1),
(658, '8906189770418', 'Lux Flaw-less Glow 150g', 2, 0, 0, 'na', 0, 0, 80.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:54:03', '', '', 1),
(659, '8941102466252', 'Ponds Bright Beauty 35 g', 2, 0, 0, 'na', 0, 0, 138.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:55:04', '', '', 1),
(660, '8941102469642', 'Lux Fresh Glow 100g', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:57:38', '', '', 1),
(661, '8901030999192', 'Ponds Detan Facewash 100g', 2, 0, 0, 'na', 0, 0, 320.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:59:08', '', '', 1),
(662, '8941102463572', 'Ponds Bright Beauty 50 g', 2, 0, 0, 'na', 0, 0, 91.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 12:59:47', '', '', 1),
(663, '8941102465231', 'Ponds Bright miracle 50 with', 2, 0, 0, 'na', 0, 0, 90.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:02:02', '', '', 1),
(664, '8941102462643', 'Sunsilk hairfall Solution Conditioner 170 ml ', 2, 0, 0, 'na', 0, 0, 176.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:03:15', '', '', 1),
(665, '8941102467037', 'Sunsilk  Thick and Long 170ml', 2, 0, 0, 'na', 0, 0, 158.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:04:01', '', '', 1),
(666, '8906189770128', 'Sunsilk Hairfall solution 340ml', 2, 0, 0, 'na', 0, 0, 307.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:05:04', '', '', 1),
(667, '8941102466818', 'TRES emme K S 185 ml  Shampoo', 2, 0, 0, 'na', 0, 0, 299.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:06:12', 'Admin', '2025-05-31 22:17:40', 1),
(668, '8941102463763', 'Rin Matic Liquied 800m', 2, 0, 0, 'na', 0, 0, 183.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:08:55', '', '', 1),
(669, '8941102314447', 'Whell Laundry  125 g', 2, 0, 0, 'na', 0, 0, 28.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:10:14', '', '', 1),
(670, '8941102463879', 'Clear Men cool sports Menthol 80 ml', 2, 0, 0, 'na', 0, 0, 77.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:13:22', '', '', 1),
(671, '8941102317981', 'Dove  Hair Fall Rescue Conditioner 170 ml', 2, 0, 0, 'na', 0, 0, 232.00, 290.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:15:40', '', '', 1),
(672, '8901030993749', 'Dove Repair Hair Mask 300 ml', 2, 0, 0, 'na', 0, 0, 769.00, 1000.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:16:52', '', '', 1),
(673, '8901030886065', 'Dove Hair Therapy Conditioner 380 ml', 2, 0, 0, 'na', 0, 0, 685.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:18:11', '', '', 1),
(674, '8901030886041', 'Dove Hair Therapy Conditioner Dry   380 ml', 2, 0, 0, 'na', 0, 0, 675.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:19:55', '', '', 1),
(675, '8941102467075', 'Dove Hair Fall rescue 170 ml', 2, 0, 0, 'na', 0, 0, 171.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:23:08', '', '', 1),
(676, '8941102460243', 'Dove Hair Fall Rescue 330 ml', 2, 0, 0, 'na', 0, 0, 402.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:24:26', '', '', 1),
(677, '8941102461080', 'Dove Hair Fall Rescue 650ml', 2, 0, 0, 'na', 0, 0, 617.00, 740.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:26:52', '', '', 1),
(678, '8941102319954', 'Dove  Healthy Ritual 170ml', 2, 0, 0, 'na', 0, 0, 171.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:28:06', '', '', 1),
(679, '8901030886058', 'Dove Shampoo Hair Therapy 380 ml', 2, 0, 0, 'na', 0, 0, 675.00, 850.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:29:13', '', '', 1),
(680, '8941102467099', 'Dove  Intense Repair 170 ml', 2, 0, 0, 'na', 0, 0, 171.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:30:05', '', '', 1),
(681, '8941102319268', 'Dove Intense Repair 330 ml', 2, 0, 0, 'na', 0, 0, 402.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:30:59', '', '', 1),
(682, '8941102460199', 'Dove Intense Repair 80ml', 2, 0, 0, 'na', 0, 0, 77.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:31:26', '', '', 1),
(683, '8941102461059', 'Dove Intense Repair 450ml', 2, 0, 0, 'na', 0, 0, 483.00, 580.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:32:00', '', '', 1),
(684, '8941102461066', 'Dove Intense Repair 650ml', 2, 0, 0, 'na', 0, 0, 617.00, 740.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:32:42', '', '', 1),
(685, '8941102467105', 'Dove Nourishing oil Care 170 ml', 2, 0, 0, 'na', 0, 0, 171.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:36:06', '', '', 1),
(686, '8941102319237', 'Dove oxygen moisture 330 ml', 2, 0, 0, 'na', 0, 0, 402.00, 470.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:36:52', '', '', 1),
(687, '8941102319251', 'Dove Hair Fall rescue 330 ml k', 2, 0, 0, 'na', 0, 0, 402.00, 470.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:38:15', '', '', 1),
(688, '8941102461981', 'Glow and Lovely BB 18 g', 2, 0, 0, 'na', 0, 0, 126.00, 165.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 13:39:24', 'Admin', '2025-04-29 13:40:33', 1),
(689, '8941102469055', 'Glow and Lovely  Winter Bright 47 g', 2, 0, 0, 'na', 0, 0, 145.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:41:22', '', '', 1),
(690, '8941102463787', 'Glow and Lovely BB 40g', 2, 0, 0, 'na', 0, 0, 183.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:41:58', '', '', 1),
(691, '8941102463206', 'Glow and Lovely Ayurvedic Care +25g', 2, 0, 0, 'na', 0, 0, 90.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:42:52', '', '', 1),
(692, '8941102464821', 'Glow and Lovely Ayurvedic Care +50g', 2, 0, 0, 'na', 0, 0, 166.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:43:36', '', '', 1),
(693, '8941102460458', 'Glow and Lovely Multi Vitamin 100g', 2, 0, 0, 'na', 0, 0, 222.00, 275.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:44:22', '', '', 1),
(694, '8901030942709', 'Glow and Lovely Multi Vitamin 80g', 2, 0, 0, 'na', 0, 0, 230.00, 285.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:44:54', '', '', 1),
(695, '8941102464494', 'Glow and Lovely Mens Facewash 100g', 2, 0, 0, 'na', 0, 0, 146.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:47:17', '', '', 1),
(696, '8941102464500', 'Glow and Lovely Mens Facewash 50g', 2, 0, 0, 'na', 0, 0, 112.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:47:50', '', '', 1),
(697, '8941102311910', 'Glow and Lovely Mens cream 50 g', 2, 0, 0, 'na', 0, 0, 144.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:48:53', 'Admin', '2025-04-29 13:49:23', 1),
(698, '8941102311903', 'Glow and Lovely Mens cream 25g', 2, 0, 0, 'na', 0, 0, 93.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:50:42', '', '', 1),
(699, '8941102468102', 'Glow and r Mm aeulti Vitamin C 47 g', 2, 0, 0, 'na', 0, 0, 139.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:51:51', '', '', 1),
(700, '8941102464814', 'Glow and r Mm aeulti Vitamin Cream 27 g', 2, 0, 0, 'na', 0, 0, 83.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:52:31', '', '', 1),
(701, '8901030704727', 'Glow and Lovely Face Serum 7ml', 2, 0, 0, 'na', 0, 0, 136.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:54:35', '', '', 1),
(702, '8901030704734', 'low and Lovely Face Serum 14ml', 2, 0, 0, 'na', 0, 0, 252.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:55:08', '', '', 1),
(703, '8906189770005', 'Glow and Lovely Face Wash 50ml', 2, 0, 0, 'na', 0, 0, 65.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:57:33', '', '', 1),
(704, '8941102462452', 'Glow and Lovely Face Wash 100ml', 2, 0, 0, 'na', 0, 0, 131.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:58:07', '', '', 1),
(705, '8941102461578', 'Lifebuoy Soap  total 100 g ', 2, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 13:59:46', '', '', 1),
(706, 'P00706', 'Lifebuoy Soap Lemon 100g', 2, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:00:17', '', '', 1),
(707, 'P00707', 'Lifebuoy care 100g', 2, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:00:48', '', '', 1),
(708, '8941102467938', 'Lifebuoy Hand Wash 1 Liter', 2, 0, 0, 'na', 0, 0, 330.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:02:04', '', '', 1),
(709, '8941102467921', 'Lifebuoy Total 1 Liter ', 2, 0, 0, 'na', 0, 0, 330.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:03:09', '', '', 1),
(710, '8941102463015', 'Lifebuoy Total Soap 150 g', 2, 0, 0, 'na', 0, 0, 73.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:04:06', '', '', 1),
(711, '8941102461165', 'Lifebuoy soap Lemon 150', 2, 0, 0, 'na', 0, 0, 73.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:04:49', '', '', 1),
(712, '8941102463374', 'Lifebuoy soap  care 150g', 2, 0, 0, 'na', 0, 0, 73.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:05:38', '', '', 1),
(713, 'P00713', 'Lifebuoy Hand Wash Total 5 Liter', 2, 0, 0, 'na', 0, 0, 1018.00, 1410.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:07:23', '', '', 1),
(714, '8941102462698', 'Lux Body Wash Black Orchid 245 ml', 2, 0, 0, 'na', 0, 0, 173.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:09:05', '', '', 1),
(715, '8941102465460', 'Lux Body Wash Aloe Vera 245 ml', 2, 0, 0, 'na', 0, 0, 173.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:09:57', '', '', 1),
(716, '8906189770593', 'Lux Body Wash almond oil 245 ml', 2, 0, 0, 'na', 0, 0, 173.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:10:52', '', '', 1),
(717, '8906189770616', 'Lux Body Vitamin C 245 ml', 2, 0, 0, 'na', 0, 0, 191.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:11:25', 'Admin', '2025-06-01 01:18:35', 1),
(718, '8941102467235', 'Lux Flaw less Glow 75 g', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:12:21', '', '', 1),
(719, '8941102467273', 'Lux Bright Glow 75 g', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:13:39', '', '', 1),
(720, '8941102467280', 'Lux Bright Glow 100 g', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:14:13', '', '', 1),
(721, '8901030997075', 'Ponds Bright Beauty 23g', 2, 0, 0, 'na', 0, 0, 105.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:16:04', '', '', 1),
(723, '8941102464449', 'Ponds Daily Face Wash 50 g', 2, 0, 0, 'na', 0, 0, 68.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:22:30', '', '', 1),
(724, '8941100613658', 'Ponds Oil control 50ml', 2, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:23:51', '', '', 1),
(725, '8941102317646', 'Ponds Vanishing Cream  28 g', 2, 0, 0, 'na', 0, 0, 49.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:24:31', '', '', 1),
(726, '8941102462537', 'Ponds Vanishing Cream 50g', 2, 0, 0, 'na', 0, 0, 74.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:25:00', '', '', 1),
(728, '8901030997105', 'Ponds Bright Beauty 35g', 2, 0, 0, 'na', 0, 0, 170.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:28:46', '', '', 1),
(729, '8941102462339', 'Ponds Bright Beauty  Facewash 100g', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:29:36', '', '', 1),
(730, '8941102467020', 'Sunsilk Black Shine 170ml', 2, 0, 0, 'na', 0, 0, 158.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:30:21', '', '', 1),
(731, '8941102318773', 'Ponds Cold Cream 28 gm', 2, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:31:08', '', '', 1),
(732, '8941102460625', 'Pepsodent Sensitive Expert 140 gm', 2, 0, 0, 'na', 0, 0, 167.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:32:06', '', '', 1),
(733, '8941102460632', 'Pepsodent Sensitive expert Gum Care 140 gm', 2, 0, 0, 'na', 0, 0, 183.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:33:03', '', '', 1),
(734, 'P00734', 'Pepsodent Sensitive expert professional 70g', 2, 0, 0, 'na', 0, 0, 92.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:33:53', '', '', 1),
(735, '8941102462575', 'Pepsodent Salt 140 g', 2, 0, 0, 'na', 0, 0, 140.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:34:53', '', '', 1),
(736, '8941102460724', 'Pepsodent Germicheck+ 190 gm', 2, 0, 0, 'na', 0, 0, 149.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:37:38', 'Admin', '2025-07-03 19:36:42', 1),
(737, '8941102464142', 'Pepsodent Germicheck+ 140gm', 2, 0, 0, 'na', 0, 0, 114.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:38:25', '', '', 1),
(738, '8941102464135', 'Pepsodent Germicheck+ 85g', 2, 0, 0, 'na', 0, 0, 83.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:39:23', '', '', 1),
(739, '8906189771316', 'Pepsodent Germicheck+ 40g', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:40:00', '', '', 1),
(740, '8941102468294', 'Pepsodent Germicheck Toothpowder 95g ', 2, 0, 0, 'na', 0, 0, 51.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:41:42', '', '', 1),
(741, '8941102466665', 'Pepsodent Kids Strawberry 45g', 2, 0, 0, 'na', 0, 0, 75.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:42:36', '', '', 1),
(742, '8941102469727', 'Pepsodent Kids StrOrange 45g', 2, 0, 0, 'na', 0, 0, 75.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:43:24', '', '', 1),
(743, '8941102469116', 'Closeup toothpaste Everfresh 145g', 2, 0, 0, 'na', 0, 0, 136.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:45:15', '', '', 1),
(744, '8941102469710', 'Closeup toothpaste Everfresh 85g', 2, 0, 0, 'na', 0, 0, 92.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:46:08', '', '', 1),
(745, '8906189771019', 'Closeup toothpaste Everfresh 38g', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:47:03', '', '', 1),
(746, '8941102469048', 'Closeup Lemon Sea Salt 140g', 2, 0, 0, 'na', 0, 0, 149.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:49:02', '', '', 1),
(747, '8941102468089', 'Closeup Red Hot 145g', 2, 0, 0, 'na', 0, 0, 132.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:50:54', '', '', 1),
(748, '8941102468072', 'Closeup Red Hot 38 g', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:53:52', '', '', 1),
(749, '8901030862953', 'Simple Niacinaamide 30ml', 2, 0, 0, 'na', 0, 0, 800.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:54:41', '', '', 1),
(750, '8901030954139', 'Simple Facial Toner 200ml', 2, 0, 0, 'na', 0, 0, 480.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:55:59', '', '', 1),
(751, '8901030954054', 'Simple Light Moisturiser 125 ml', 2, 0, 0, 'na', 0, 0, 440.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 14:57:04', '', '', 1),
(752, '8941102462155', 'Clear complete Active Care 170ml', 2, 0, 0, 'na', 0, 0, 207.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 15:00:54', '', '', 1),
(753, '8941102466399', 'Clear Men sport Menthol 330ml', 2, 0, 0, 'na', 0, 0, 426.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 15:05:16', '', '', 1),
(754, '8941102462186', 'Clear Men sport Menthol 450ml', 2, 0, 0, 'na', 0, 0, 479.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 15:06:22', '', '', 1),
(755, '8941102469185', 'Domex Toilet Cleaner Lime Fresh 750ml', 2, 0, 0, 'na', 0, 0, 146.00, 170.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:10:43', '', '', 1),
(756, '8941102469130', 'Domex Toilet Cleaner  Ocean Fresh 750', 2, 0, 0, 'na', 0, 0, 146.00, 170.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:42:04', 'Admin', '2025-04-29 15:42:34', 1),
(757, '8941102469178', 'Domex Toilet Cleaner Ocean Fresh 500ml', 2, 0, 0, 'na', 0, 0, 112.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:43:05', '', '', 1),
(758, '8941102465781', 'Clear Anti  Hair fall 330 ml', 2, 0, 0, 'na', 0, 0, 347.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:44:50', '', '', 1),
(759, '8941102464692', 'Sunsilk Black Shine 450 ml', 2, 0, 0, 'na', 0, 0, 469.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:46:01', '', '', 1),
(760, '8941102467044', 'Sunsilk Hairfall Sulution 170 ml', 2, 0, 0, 'na', 0, 0, 158.00, 180.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:46:58', '', '', 1),
(761, '8941102318049', 'Sunsilk Hijab Refresh 340ml', 2, 0, 0, 'na', 0, 0, 364.00, 420.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:47:37', '', '', 1),
(762, '8941102464807', 'Sunsilk onion and jojoba oil 375ml', 2, 0, 0, 'na', 0, 0, 364.00, 420.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:50:01', '', '', 1),
(763, '8941102316977', 'Sunsilk thick and long 650ml', 2, 0, 0, 'na', 0, 0, 574.00, 700.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:50:44', '', '', 1),
(764, '8941102316953', 'Sunsilk thick and long 450ml', 2, 0, 0, 'na', 0, 0, 469.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:51:32', '', '', 1),
(765, '8941102315222', 'Sunsilk Valume 375ml', 2, 0, 0, 'na', 0, 0, 364.00, 420.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:52:17', '', '', 1),
(766, '8906189770104', 'Sunsilk Black Shine 340 ml', 2, 0, 0, 'na', 0, 0, 307.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:53:11', 'Admin', '2025-04-29 15:53:22', 1),
(767, '8906189770098', 'Sunsilk Black Shine 80ml', 2, 0, 0, 'na', 0, 0, 79.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:54:05', '', '', 1),
(768, '8941102466511', 'Tresemme Keratin Smooth Conditioner 190 ml', 2, 0, 0, 'na', 0, 0, 256.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:54:57', '', '', 1),
(769, '8941102464098', 'Tresemme hairfall Shampoo580ml', 2, 0, 0, 'na', 0, 0, 640.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:56:04', '', '', 1),
(770, '8941102466832', 'Tresemme Keratin Smooth  Shampoo 580ml', 2, 0, 0, 'na', 0, 0, 640.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:57:00', '', '', 1),
(771, '8941102466825', 'Tresemme Keratin Smooth Shampoo 340ml', 2, 0, 0, 'na', 0, 0, 458.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:57:32', '', '', 1),
(772, '8941102461547', 'TRESemme NR Shampoo 580 ', 2, 0, 0, 'na', 0, 0, 640.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 15:58:36', '', '', 1),
(773, '8901030928581', 'TRESemme KS Hair Sumer 100 ml', 2, 0, 0, 'na', 0, 0, 769.00, 1000.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:01:29', '', '', 1),
(774, '8941102463756', 'Rin liquid 400ml', 2, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:02:59', '', '', 1),
(775, '8941102318988', 'Rin Advanced detergent powder 500 gm', 2, 0, 0, 'na', 0, 0, 81.00, 95.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:04:25', '', '', 1),
(776, '8941102464999', 'Rin Advanced detergent powder 1 kg', 2, 0, 0, 'na', 0, 0, 165.00, 195.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:05:45', '', '', 1),
(777, '8941102318957', 'Rin Advanced detergent powder 2 kg', 2, 0, 0, 'na', 0, 0, 296.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:06:30', '', '', 1),
(778, '8941100657171', 'Wheel 2 in 1  1kg', 2, 0, 0, 'na', 0, 0, 126.00, 145.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:07:35', '', '', 1),
(779, '8941100657188', 'Wheel 2 in 1 500gm', 2, 0, 0, 'na', 0, 0, 65.00, 75.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:08:21', '', '', 1),
(780, '8941100658994', 'Wheel 2 in 1 2kg', 2, 0, 0, 'na', 0, 0, 236.00, 260.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:08:50', '', '', 1),
(781, '8941102463596', 'Vim  Liquid l Liter ', 2, 0, 0, 'na', 0, 0, 0.00, 240.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:13:01', '', '', 1),
(782, '8941102466085', 'Vim Liquid 500ml', 2, 0, 0, 'na', 0, 0, 115.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:13:56', '', '', 1),
(783, '8906189771996', 'Surf Excel  180g', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:15:49', 'Admin', '2025-06-01 01:05:44', 1),
(784, '8941102460304', 'Vim Bar 300 g', 2, 0, 0, 'na', 0, 0, 36.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:18:12', '', '', 1),
(785, '8941102460311', 'Vim Bar 125 g', 2, 0, 0, 'na', 0, 0, 14.00, 15.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:21:26', '', '', 1),
(786, '8906189770487', 'Vim Liquid 5 Liter ', 2, 0, 0, 'na', 0, 0, 952.00, 1100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:23:00', '', '', 1),
(787, 'vim powder', 'vim dishwashing powder 500 g', 2, 0, 0, 'na', 0, 0, 36.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 16:24:03', '', '', 1),
(788, '8941102316854', 'Vaseline Mosquito Defence 50 ml', 2, 0, 0, 'na', 0, 0, 76.00, 99.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:25:41', '', '', 1),
(789, '8941102467334', 'Pure  Microfiber Mesh ', 2, 0, 0, 'na', 0, 0, 181.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:26:46', '', '', 1),
(790, '8941100648520', 'Pure It GKK 3000 Liter', 2, 0, 0, 'na', 0, 0, 1225.00, 1400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:28:55', '', '', 1),
(791, '8941102469949', 'Surf Excel Mini 36 g', 2, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:29:40', '', '', 1),
(792, '8941102466931', 'Surf Excel Mini 18 g', 2, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:30:14', '', '', 1),
(793, '8901030695490', 'Surf Excel Matic Tp Load 500ml', 2, 0, 0, 'na', 0, 0, 175.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:31:32', '', '', 1),
(794, '8941102466535', 'Lux Bright Glow 35 gm', 2, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:32:55', '', '', 1),
(795, '8941102467228', 'Lux Flaw less glow 35 g', 2, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:35:21', '', '', 1),
(796, '8941102464463', 'Ponds Pusre detox 100 facewash ', 2, 0, 0, 'na', 0, 0, 156.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:36:30', '', '', 1),
(797, '8941102319947', 'Dove Healthy Ritual  330ml', 2, 0, 0, 'na', 0, 0, 402.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:38:19', '', '', 1),
(798, '8941102319275', 'Dove Nourishing Oil Care 330 ml', 2, 0, 0, 'na', 0, 0, 402.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:39:13', '', '', 1),
(799, '8941100657478', 'Wheel 2 in 1 200 ml', 2, 0, 0, 'na', 0, 0, 28.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 16:43:42', '', '', 1),
(800, '5063305005441', 'Taaza High Quality Tea 50 bags 95 g', 1, 0, 0, 'na', 0, 0, 82.00, 90.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-29 17:17:24', 'Admin', '2025-04-29 17:18:00', 1),
(801, '5063305005465', 'Lipton Green Tea Pure and Light 32g 25 bags ', 1, 0, 0, 'na', 0, 0, 107.00, 130.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-29 17:19:22', '', '', 1),
(802, '5063305005458', 'Lipton Green Tea Honey Lemon 35g 25 bags', 1, 0, 0, 'na', 0, 0, 123.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-29 17:20:10', '', '', 1),
(803, '5063305007360', 'Taaza  Black Tea 100g ', 1, 0, 0, 'na', 0, 0, 53.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-04-29 17:23:43', '', '', 1),
(804, '5063305007377', 'Taaza Black Tea 200g', 1, 0, 0, 'na', 0, 0, 96.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:24:28', '', '', 1),
(805, '5063305007384', 'Taaza Black Tea 400g', 1, 0, 0, 'na', 0, 0, 194.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:25:40', '', '', 1),
(806, '5063305007391', 'Taaza Black Tea 500g', 1, 0, 0, 'na', 0, 0, 238.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:26:35', '', '', 1),
(807, '5063305004789', 'Taaza Black Tea Threestar 100g', 1, 0, 0, 'na', 0, 0, 48.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:28:22', '', '', 1),
(808, '5063305005236', 'Taaza Black Tea Threestar 200g', 1, 0, 0, 'na', 0, 0, 98.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:29:04', '', '', 1),
(809, '5063305005359', 'Taaza Black Tea Threestar 500g', 1, 0, 0, 'na', 0, 0, 207.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:29:39', '', '', 1),
(810, 'P00810', 'Taaza Black Tea 50g', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 17:31:04', '', '', 1),
(811, '745125887302', 'Dabur Amla Hair Oil 100ml', 2, 0, 0, 'na', 0, 0, 95.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:42:17', '', '', 1),
(812, '745125887319', 'Dabur Amla Hair Oil 200ml', 2, 0, 0, 'na', 0, 0, 171.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:42:46', '', '', 1),
(813, '745125887326', 'Dabur Amla Hair Oil 300ml', 2, 0, 0, 'na', 0, 0, 250.00, 290.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:43:09', '', '', 1),
(814, '745125887180', 'Dabur Vatika Enriched Coconut Hair Oil 150ml', 2, 0, 0, 'na', 0, 0, 164.00, 180.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:44:11', '', '', 1),
(815, '745125887197', 'Dabur Vatika Enriched Coconut Hair Oil 300ml', 2, 0, 0, 'na', 0, 0, 275.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:44:42', '', '', 1),
(816, '745125887401', 'Dabur Coconut 100ml ', 2, 0, 0, 'na', 0, 0, 82.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:46:06', '', '', 1),
(817, '745125887418', 'Dabur Coconut 200ml', 2, 0, 0, 'na', 0, 0, 150.00, 165.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:46:42', '', '', 1),
(818, '8901207029943', 'Odonil Orchid Dew 75 g', 2, 0, 0, 'na', 0, 0, 67.00, 75.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:47:47', '', '', 1),
(819, '8901207502934', 'Odonil  Hang decor 48g ', 2, 0, 0, 'na', 0, 0, 85.00, 95.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:48:44', '', '', 1),
(820, '8901207043468', 'Odonil gel Pocket 10 gm', 2, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:50:01', '', '', 1),
(821, '745125887111', 'Odonil Air Freshener Jasmine 300ml', 2, 0, 0, 'na', 0, 0, 200.00, 290.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:51:48', '', '', 1),
(822, '745125887128', 'Odonil Air Freshener Citus 300 ml', 2, 0, 0, 'na', 0, 0, 200.00, 290.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:52:30', '', '', 1),
(823, '745125887371', 'Odonil Air Freshener Lavender Mist 300ml', 2, 0, 0, 'na', 0, 0, 200.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:53:18', 'Admin', '2025-04-29 17:53:47', 1),
(824, '89005590', 'Dabur Guladari 120 ml', 2, 0, 0, 'na', 0, 0, 70.00, 100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:54:33', '', '', 1),
(825, '8901207035364', 'Dabur Honey Brand 250 ml', 2, 0, 0, 'na', 0, 0, 196.00, 230.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:57:13', '', '', 1),
(826, '8901207872624', 'Dabur Honey Brand 500gm', 2, 0, 0, 'na', 0, 0, 390.00, 430.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 17:59:19', '', '', 1),
(827, '8901207095368', 'Dabur Honey Brand 1kg', 2, 0, 0, 'na', 0, 0, 630.00, 970.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:01:59', '', '', 1),
(828, '8901207900839', 'Hajmola Regular 120', 2, 0, 0, 'na', 0, 0, 86.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:03:20', '', '', 1),
(829, '8901207062865', 'Hajmola Imli 120', 2, 0, 0, 'na', 0, 0, 86.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:03:58', '', '', 1),
(830, '8901888003324', 'Hajmola Borhani120', 2, 0, 0, 'na', 0, 0, 86.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:04:30', '', '', 1),
(831, '8901888000682', 'dabur Chyawanprash 500g', 2, 0, 0, 'na', 0, 0, 500.00, 600.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:08:29', '', '', 1),
(832, '8901207099106', 'Dubur Red 85 g', 2, 0, 0, 'na', 0, 0, 75.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:10:13', '', '', 1),
(833, '8901888000897', 'Dabur Red 190 ml', 2, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-04-29 18:11:01', '', '', 1),
(834, '8901207500657', 'Dabur Meswak 100 g', 2, 0, 0, 'na', 0, 0, 78.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:17:54', '', '', 1),
(835, '8902714330072', 'Dabur Meswak 200 g', 2, 0, 0, 'na', 0, 0, 140.00, 165.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:18:29', '', '', 1),
(836, '8901207500046', 'Dabur Odomos 50g', 2, 0, 0, 'na', 0, 0, 123.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:19:28', '', '', 1),
(837, '8901207500053', 'Dabur Odomos 100g', 2, 0, 0, 'na', 0, 0, 200.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:19:53', '', '', 1),
(838, '745125887036', 'Dabur Glucose D 450g', 2, 0, 0, 'na', 0, 0, 139.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:20:56', '', '', 1),
(839, '745125887517', 'Dabur Glucose D 200g', 2, 0, 0, 'na', 0, 0, 78.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:21:46', '', '', 1),
(840, 'P00840', 'Dabur Honey 100g', 2, 0, 0, 'na', 0, 0, 109.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:23:19', '', '', 1),
(841, 'P00841', 'Odonil Combo pack', 2, 0, 0, 'na', 0, 0, 290.00, 325.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:25:46', '', '', 1),
(842, '8941133008452', 'Deshi Paratha 650 gm', 1, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:43:03', '', '', 1),
(843, '8941100420768', 'Deshi Megha Paratha 1600 gm 20pcs', 1, 0, 0, 'na', 0, 0, 330.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:44:05', '', '', 1),
(844, '8941193401248', 'Premium Deshi paratha 20 pcs', 1, 0, 0, 'na', 0, 0, 277.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:45:02', '', '', 1),
(845, '8941193400142', 'Low Fat Deshi paratha 20 pcs', 1, 0, 0, 'na', 0, 0, 227.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:45:46', '', '', 1),
(846, '8941100421055', 'Atta Rooti  20 pcs ', 1, 0, 0, 'na', 0, 0, 180.00, 220.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-04-29 18:48:36', 'Admin', '2025-06-25 19:32:36', 1),
(847, '8941100420072', 'Allo puri 10 pcs', 1, 0, 0, 'na', 0, 0, 126.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:49:28', '', '', 1),
(848, '8941100420010', 'Dal Puri 10 pcs', 1, 0, 0, 'na', 0, 0, 130.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:49:51', '', '', 1),
(849, '8941100420089', 'Vegetable Spring Roll 10 pcs', 1, 0, 0, 'na', 0, 0, 130.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:50:52', '', '', 1),
(850, '8941100420959', 'Mini Chicken Spring Roll 15 pcs', 1, 0, 0, 'na', 0, 0, 210.00, 235.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:51:26', '', '', 1),
(851, '8941100420935', 'Mini singara 20 pcs', 1, 0, 0, 'na', 0, 0, 112.00, 125.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:52:23', '', '', 1),
(852, '8941100420942', 'Mini singara 40 pcs', 1, 0, 0, 'na', 0, 0, 200.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:53:07', '', '', 1),
(853, '8941100420874', 'Single Bite Chicken Samosa 25 pcs', 1, 0, 0, 'na', 0, 0, 190.00, 215.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:54:01', '', '', 1),
(854, '8941100420836', 'Single Bite Chicken Samosa 50 pcs', 1, 0, 0, 'na', 0, 0, 360.00, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:54:42', '', '', 1),
(855, '8941100421222', 'Strainght Cut French Fries 500g', 1, 0, 0, 'na', 0, 0, 175.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:55:33', '', '', 1),
(856, '8941100421215', 'Strainght Cut French Fries 1 Kg', 1, 0, 0, 'na', 0, 0, 330.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:56:00', '', '', 1),
(857, '8941100420751', 'Mini Chicken Nuggets 22 pcs', 1, 0, 0, 'na', 0, 0, 212.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:56:51', 'Admin', '2025-04-29 19:28:41', 1),
(858, '8941133007936', 'Chicken Sausage 10 pcs', 1, 0, 0, 'na', 0, 0, 230.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:57:52', '', '', 1),
(859, '8941133008476', 'Chicken meat Ball 35 pcs', 1, 0, 0, 'na', 0, 0, 262.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:59:01', '', '', 1),
(860, '8941133008483', 'Chicken Strips 15 pcs', 1, 0, 0, 'na', 0, 0, 260.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 18:59:59', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(861, '8941133008490', 'Sweet and Hot Chicken Wings and Drumlets 12 pcs', 1, 0, 0, 'na', 0, 0, 325.00, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:00:57', '', '', 1),
(862, '8941100421192', 'Chicken Burger Patty 4 pcs', 1, 0, 0, 'na', 0, 0, 172.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:02:32', '', '', 1),
(863, '8941193400425', 'Chicken Shami Kabab 10 pcs', 1, 0, 0, 'na', 0, 0, 230.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:03:51', '', '', 1),
(864, '8941193400265', 'Beef chop 4 pcs', 1, 0, 0, 'na', 0, 0, 235.00, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:04:43', '', '', 1),
(865, '8941193400241', 'Chicken Chop 8 pcs', 1, 0, 0, 'na', 0, 0, 150.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:06:01', '', '', 1),
(866, '8941193400180', 'Chicken Wonton 15 pcs', 1, 0, 0, 'na', 0, 0, 190.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:06:49', '', '', 1),
(867, '8941193400203', 'Chicken Meat Ball 1 Kg', 1, 0, 0, 'na', 0, 0, 410.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:07:30', '', '', 1),
(868, '8941193400210', 'Chicken Nuggets 1 kg', 1, 0, 0, 'na', 0, 0, 595.00, 685.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:08:06', '', '', 1),
(869, '8941193400050', 'Spicy Chicken Sausage 10 pcs', 1, 0, 0, 'na', 0, 0, 245.00, 275.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 19:09:06', '', '', 1),
(870, '745114130617', 'Olympic Premium Toast  175 g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:36:10', '', '', 1),
(871, '745114133892', 'Olympic Foodie Ramen 496 g', 1, 0, 0, 'na', 0, 0, 149.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:37:25', '', '', 1),
(872, 'P00872', 'Olympic Fundools 8 pack', 1, 0, 0, 'na', 0, 0, 131.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:38:53', '', '', 1),
(873, '745114133052', 'Olympic Fundools 12 pack', 1, 0, 0, 'na', 0, 0, 196.00, 255.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:40:07', '', '', 1),
(874, '745114133885', 'Olympic Ramen 4 pack', 1, 0, 0, 'na', 0, 0, 83.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:41:09', '', '', 1),
(875, 'P00875', 'Olympic Gold ', 2, 0, 0, 'na', 0, 0, 14.00, 18.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:43:14', '', '', 1),
(876, 'P00876', 'Olympic Heavy Duty Battery ', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:44:52', '', '', 1),
(877, 'P00877', 'Olympic Heavy Duty Battery 1.5v', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-29 21:45:25', '', '', 1),
(880, '745125275260', 'Fruit Salt ENO Digestive', 1, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:03:18', '', '', 1),
(881, '8901571009091', 'Sensodyne Daily Care ', 2, 0, 0, 'na', 0, 0, 52.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:04:10', '', '', 1),
(882, '8901571004102', 'Sensodyne Fresh Mint 40 g', 2, 0, 0, 'na', 0, 0, 98.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:04:57', '', '', 1),
(883, '8901571004089', 'Sensodyne Fresh Gel  40 ml', 2, 0, 0, 'na', 0, 0, 98.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:05:28', '', '', 1),
(884, '8901571004096', 'Sensodyne Fresh Mint 75g', 2, 0, 0, 'na', 0, 0, 178.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:06:19', '', '', 1),
(885, '8901571004614', 'Sensodyne Fresh Gel 75g', 2, 0, 0, 'na', 0, 0, 178.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:06:49', '', '', 1),
(886, '8901571005659', 'Sensodyne Fresh Mint 150g', 2, 0, 0, 'na', 0, 0, 311.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:07:15', '', '', 1),
(887, '8901571005666', 'Sensodyne Fresh Gel 150g ', 2, 0, 0, 'na', 0, 0, 311.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:07:43', '', '', 1),
(888, '8901571004829', 'Sensodyne Rapid Relief 40g', 2, 0, 0, 'na', 0, 0, 160.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:08:20', '', '', 1),
(889, '8901571004836', 'Sensodyne Rapid Relief 80g', 2, 0, 0, 'na', 0, 0, 293.00, 330.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:08:50', '', '', 1),
(890, '8901571008186', 'Sensodyne whitening 70 g', 2, 0, 0, 'na', 0, 0, 178.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:09:49', '', '', 1),
(891, '8901571010998', 'Sensodyne Sensitive sof', 2, 0, 0, 'na', 0, 0, 88.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:11:01', '', '', 1),
(892, '8901571008773', 'Sensodyne Deep Clean 70 gm', 2, 0, 0, 'na', 0, 0, 178.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:11:35', '', '', 1),
(893, '8901571011049', 'Sensodyne Expert family', 2, 0, 0, 'na', 0, 0, 328.00, 410.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:13:23', '', '', 1),
(894, '8901571013173', 'Sensodyne Complete Protection +250 ml', 2, 0, 0, 'na', 0, 0, 488.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:14:03', '', '', 1),
(895, '8901571013272', 'Sensodyne complete Protection 100ml', 2, 0, 0, 'na', 0, 0, 222.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:14:44', '', '', 1),
(896, '8901571010813', 'Sensodyne Sensitivity and GUM singel ', 2, 0, 0, 'na', 0, 0, 156.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:16:32', '', '', 1),
(897, '8901571011025', 'Sensodyne Expert singel ', 2, 0, 0, 'na', 0, 0, 168.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:17:32', '', '', 1),
(898, '8901571011421', 'Sensodyne Complete Protection+70ml', 2, 0, 0, 'na', 0, 0, 195.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:28:57', '', '', 1),
(899, '8901571010837', 'Sensodyne Repair and Protect 70g', 2, 0, 0, 'na', 0, 0, 320.00, 360.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:30:19', '', '', 1),
(900, '8901571010844', 'Sensodyne Repair and protect 100g', 2, 0, 0, 'na', 0, 0, 422.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:31:30', '', '', 1),
(901, '8901571010677', 'Parodontax Expert Gum Care Daily Fluoride 75 g', 2, 0, 0, 'na', 0, 0, 195.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:33:12', '', '', 1),
(902, '8901571010684', 'Parodontax Expert GUM Care 75 g', 2, 0, 0, 'na', 0, 0, 195.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:35:41', '', '', 1),
(903, '8901571011056', 'Sensodyne Deep Clean Single ', 2, 0, 0, 'na', 0, 0, 112.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:36:46', '', '', 1),
(904, '8901571011094', ' Sensodyne Deep Clean Family 3 ', 2, 0, 0, 'na', 0, 0, 224.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:37:40', '', '', 1),
(905, '8901571011018', 'Sensodyne Sensitive Family 3', 2, 0, 0, 'na', 0, 0, 176.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:40:19', '', '', 1),
(906, '8901571012909', 'Sensodyne Multicare Single ', 2, 0, 0, 'na', 0, 0, 112.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:41:30', '', '', 1),
(907, '8901571013067', 'Sensodyne Gentle Care 1+1', 2, 0, 0, 'na', 0, 0, 224.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:42:30', '', '', 1),
(908, '8901571012688', 'Sensodyne Complete Protection + Single', 2, 0, 0, 'na', 0, 0, 176.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:43:31', '', '', 1),
(909, '8901571012695', 'Sensodyne Complete Protection + Family ', 2, 0, 0, 'na', 0, 0, 352.00, 440.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:44:15', '', '', 1),
(910, '8901571010820', 'Sensodyne Sensitivity andn gum Family', 2, 0, 0, 'na', 0, 0, 312.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:45:07', '', '', 1),
(911, '8901571012503', 'Parodontax Expert Gum care Single', 2, 0, 0, 'na', 0, 0, 176.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 13:46:08', '', '', 1),
(912, '831730004149', 'চিনিগুড়া সুগন্ধি চাল 1 কেজি', 1, 0, 0, 'na', 0, 0, 132.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:36:31', '', '', 1),
(913, '২৩১৭৩০০০৪০৭৯', 'প্রা বাসমতি চাল 1 কেজি', 1, 0, 0, 'na', 0, 0, 330.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:37:26', '', '', 1),
(914, '৮৩১৭৩০০০৯২৫০', 'প্রান মিনিকেট চাল 5 কেজি', 1, 0, 0, 'na', 0, 0, 440.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:38:14', '', '', 1),
(915, '৮৪১১৬৫১৫৮৯৬৬', 'প্রান মিনিকেট চাল 10 কেজি', 1, 0, 0, 'na', 0, 0, 870.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:38:36', '', '', 1),
(916, 'P00916', 'প্রান ডাল 1 কেজি', 1, 0, 0, 'na', 0, 0, 98.00, 115.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:39:51', '', '', 1),
(917, '৮৪১১৬৫১৩০৩১৩', 'প্রান আয়োডাইজড  লবন 1 কেজি', 1, 0, 0, 'na', 0, 0, 34.00, 42.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:40:46', '', '', 1),
(918, '৮৪১১৬৫১৩৬৮৫৮', 'প্রান বংগ  মোটা লাবন 1 কেজি', 1, 0, 0, 'na', 0, 0, 19.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:41:54', '', '', 1),
(919, '৮৪৬৬৫৬০০২১৭৯', 'প্রান চিড়া 250 গ্রাম', 1, 0, 0, 'na', 0, 0, 32.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:42:55', '', '', 1),
(920, '৮৩১৭৩০০০৫৭১৯', 'প্রান চিড়া 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 58.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:43:22', '', '', 1),
(921, '831730005566', 'Pran Synthetic Viegar 650 ml', 1, 0, 0, 'na', 0, 0, 45.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:44:20', '', '', 1),
(922, '841165130269', 'Pran Atta 2 kg', 1, 0, 0, 'na', 0, 0, 85.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:44:57', 'Admin', '2025-06-17 13:47:16', 1),
(923, '846656008836', 'Sat Isabgol 20 gm', 1, 0, 0, 'na', 0, 0, 51.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:48:32', '', '', 1),
(924, '846656000069', 'Pran Isabgol Bhushi 40gm', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:49:16', '', '', 1),
(925, '841165130276', 'Parn Maida 1 Kg', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:49:57', '', '', 1),
(926, '841165130290', 'Pran Suji 500g', 1, 0, 0, 'na', 0, 0, 36.00, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-04-30 22:50:33', '', '', 1),
(928, '8941100502358', 'Rain Shower Meril 250 ml', 2, 0, 0, 'na', 0, 0, 205.00, 260.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:21:08', 'Admin', '2025-05-01 11:21:22', 1),
(929, '8941100504659', 'Maya True Herbs colling 200ml', 2, 0, 0, 'na', 0, 0, 215.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:24:01', '', '', 1),
(930, '8941100503355', 'MAYA ALL NATURAL 100 ml ', 2, 0, 0, 'na', 0, 0, 170.00, 210.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:25:39', '', '', 1),
(931, '8941100503850', 'maya true herbs  CP 200ml', 2, 0, 0, 'na', 0, 0, 175.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:27:28', '', '', 1),
(932, '8941100504666', 'Maya True Herbs rose 200ml', 2, 0, 0, 'na', 0, 0, 160.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:28:46', '', '', 1),
(933, '8941100501672', 'MAX Clean Super Degreasing 500 ml', 2, 0, 0, 'na', 0, 0, 100.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:29:42', '', '', 1),
(934, '8941100502075', 'MAX Clean Super Degreasing AnT pp 250', 2, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:31:12', '', '', 1),
(935, '8941100504871', 'Maya True Herbs Aloe Vera Gel 250 ml', 2, 0, 0, 'na', 0, 0, 250.00, 325.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:31:55', '', '', 1),
(936, '8941100502952', 'Meril Tangerine Orange Shampoo 250 ml', 2, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:34:37', '', '', 1),
(937, '8941100503324', 'Revive  Enriched With 7 Herbs 200ml', 2, 0, 0, 'na', 0, 0, 196.00, 230.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:37:02', '', '', 1),
(938, '8941100500521', 'Zero Call Classic 75 pcs', 2, 0, 0, 'na', 0, 0, 208.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:38:01', '', '', 1),
(939, '8941100501450', 'Zero Call Classic 150 pcs', 2, 0, 0, 'na', 0, 0, 333.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:38:39', '', '', 1),
(940, '8941100500446', 'Kool 3D Shaving Experience 50g', 2, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:39:37', '', '', 1),
(941, '8941100504840', 'Zerocal Stevia 75 Pcs', 2, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:40:29', '', '', 1),
(942, '8941100500347', 'Chaka Advanced Smart Dirt Flghter 200 ml', 2, 0, 0, 'na', 0, 0, 23.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:42:10', '', '', 1),
(943, '8941100505144', 'Maya True Herbs  Marula moisturizing GC 50 g', 2, 0, 0, 'na', 0, 0, 140.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:43:13', '', '', 1),
(944, '8941100505151', 'Maya True Herbs Rosehip Oil & Acne control Gel Cream 50 ml', 2, 0, 0, 'na', 0, 0, 140.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:44:30', '', '', 1),
(945, '8941100504017', 'Maya Anti Pimple Neem Facewash 100 ml', 2, 0, 0, 'na', 0, 0, 135.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:47:05', '', '', 1),
(946, '8941100504697', 'Kool Perfumed Deodorant Stick 50 ml', 2, 0, 0, 'na', 0, 0, 275.00, 325.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 11:48:00', '', '', 1),
(947, '8941100503287', 'Xpel Dual Action Aerosol 475ml', 2, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:49:52', '', '', 1),
(948, '8941100502969', 'Meril Tangerine Orange Conditioner 250 ml', 2, 0, 0, 'na', 0, 0, 200.00, 270.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:50:49', '', '', 1),
(949, '8941100500118', 'Zero Cal classic tablet 100 pcs', 2, 0, 0, 'na', 0, 0, 121.74, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:52:06', '', '', 1),
(950, '8941100503140', 'Zero Cal classic tablet 200pcs', 2, 0, 0, 'na', 0, 0, 166.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:52:46', '', '', 1),
(951, '8941100501191', 'Spring Air Freshener Orange 300 ml', 2, 0, 0, 'na', 0, 0, 267.27, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:53:53', '', '', 1),
(952, '8941100501207', 'Spring Air Freshener Lemon 300 ml', 2, 0, 0, 'na', 0, 0, 267.27, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:54:33', '', '', 1),
(953, '8941100500293', 'Spring Air Freshener Floral 300 ml', 2, 0, 0, 'na', 0, 0, 267.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:55:03', '', '', 1),
(954, '8941100501122', 'Jui Hair Fall Control 200 Ml', 2, 0, 0, 'na', 0, 0, 159.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:55:43', 'Admin', '2025-07-06 11:07:12', 1),
(955, '8941100501115', 'Jui Hair Fall Control 100Ml', 2, 0, 0, 'na', 0, 0, 85.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-01 11:56:26', '', '', 1),
(956, '৮৩০৫২৬২৭৬২৩৪', 'তীর নাজিরশাইল চাল 5 কেজি', 1, 0, 0, 'na', 0, 0, 390.00, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:16:59', '', '', 1),
(957, '৮৩০৪৭৬২৬৪২৩৭', 'তীর সম্পাকাটারি নাজির চাল 5 কেজি', 1, 0, 0, 'na', 0, 0, 450.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:18:09', '', '', 1),
(958, '৮১২৫৪৬১৫৯২৩০', 'তীর  ফাটিফাইড সয়াবিন তেল 5 লিটার', 1, 0, 0, 'na', 0, 0, 907.00, 922.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:20:17', '', '', 1),
(959, '৮১২৫৪৬১৫৯১২৪', 'তীর ফাটিফাইড সয়াবিন তেল 2 লিটার', 1, 0, 0, 'na', 0, 0, 372.00, 378.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:22:04', '', '', 1),
(960, '৮১২৫৪৬১৫৯১০০', 'তীর ফাটিফাইড সয়াবিন তেল 1 লিটার', 1, 0, 0, 'na', 0, 0, 186.00, 189.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:22:34', '', '', 1),
(961, '৮১১৪৮৬১৬৬১০০', 'তীর সরিষার তেল 1 লিটার ', 1, 0, 0, 'na', 0, 0, 275.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:24:11', '', '', 1),
(962, 'P00962', 'তীর সরিষার তেল 500 মি লি', 1, 0, 0, 'na', 0, 0, 135.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:27:01', '', '', 1),
(963, 'P00963', 'তীর সরিষার তেল 2500মি লি', 1, 0, 0, 'na', 0, 0, 68.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:27:20', '', '', 1),
(964, '৮১৮৪১৬২৬২১০৯', 'তীর চিনিগুঁড়ৃা চাল', 1, 0, 0, 'na', 0, 0, 130.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:28:00', '', '', 1),
(965, '৮২০৪৬৬৫৩৩১০৮', 'তীর  চিনি 1 কেজি', 1, 0, 0, 'na', 0, 0, 115.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:28:40', '', '', 1),
(966, '৮৩০৫০৬২৫০১০০', 'তীর মসুর ডাল 1 কেজি', 1, 0, 0, 'na', 0, 0, 115.00, 122.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:29:26', '', '', 1),
(967, '৮১৭৫১৬২২৬১০৩', 'তীর লবণ 1 কেজি ', 1, 0, 0, 'na', 0, 0, 34.00, 42.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:30:03', '', '', 1),
(968, '৮১৪২১৬৪৪১১২৬', 'তীর হোল হুইট আটা 2 কেজি', 1, 0, 0, 'na', 0, 0, 122.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:30:42', '', '', 1),
(969, '৮ি৯৪১০০১৯৮১০৪৭', 'তীর  মুড়ি 400গ্রাম', 1, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:43:19', '', '', 1),
(970, '৮১৪৩৯৬২৪৪০৫০', 'তীর সুজি 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 41.00, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:43:48', '', '', 1),
(971, '৮১৭৫১৬২২৬০৫৯', 'তীর লবণ  500 গ্রাম', 1, 0, 0, 'na', 0, 0, 18.00, 22.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:44:35', '', '', 1),
(972, '৮১৪৩৩৬২৩৬১২১', 'তীর ময়দা 2 কেজি', 1, 0, 0, 'na', 0, 0, 120.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:55:16', '', '', 1),
(973, '৮১৪৩৩৬২৩৬১০৭', 'তীর ময়দা 1 কেজি', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 19:55:44', '', '', 1),
(974, '৮১৪২১৬২২১১০০', 'তীর আটা 1 কেজি', 1, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 20:07:12', '', '', 1),
(975, '৮১৪২১৬২২১১২৪', 'তীর আটা 2 কেজি', 1, 0, 0, 'na', 0, 0, 92.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-01 20:08:01', '', '', 1),
(976, '২০১৭১২১০০০২০১৮১', 'বস্ সুপার মশার কয়েল ', 2, 0, 0, 'na', 0, 0, 45.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-01 21:13:51', '', '', 1),
(977, '৩৮৮৫৫২২৫০১০০৯', 'পুষ্টি সয়াবিন তেল 1 লিটার', 1, 0, 0, 'na', 0, 0, 186.00, 189.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:33:38', 'Admin', '2025-05-03 19:34:04', 1),
(978, '৮৯৪১১৫৩৫০০০৫৯', 'পুষ্টি সয়াবিন তেল 2 লিটার', 1, 0, 0, 'na', 0, 0, 372.00, 378.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:34:44', '', '', 1),
(979, '৮৯৪১১৫৩৫০০০৭৩', 'পুষ্টি সয়াবিন তেল 5 লিটার', 1, 0, 0, 'na', 0, 0, 907.00, 922.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:35:27', '', '', 1),
(980, '৮৯৪১১৫৩৫০৩৫৮৬', 'ভিটালাইফ সানফ্লওয়ার অয়েল 5 লিটার', 1, 0, 0, 'na', 0, 0, 1400.00, 2000.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:36:57', '', '', 1),
(981, '৩৮৮৫১৩২২৫০২৫০', 'পুষ্টি সরিষার তেল 250 মি', 1, 0, 0, 'na', 0, 0, 69.00, 85.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:38:40', '', '', 1),
(982, '৩৮৮৫১৩২২৫০৫০২', 'পুষ্টি সরিষার তেল 500 মি', 1, 0, 0, 'na', 0, 0, 138.00, 175.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:39:14', '', '', 1),
(983, '৩৮৮৫১৩২২৫১০০৪', 'পুষ্টি সরিষার তেল 1লিটার', 1, 0, 0, 'na', 0, 0, 268.00, 320.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:39:50', '', '', 1),
(984, '৩৮৮৫১৩২২৫৫০০২', 'পুষ্টি সরিষার তেল 5 লিটার', 1, 0, 0, 'na', 0, 0, 1100.00, 1300.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:40:21', '', '', 1),
(985, '৮৯৪১১৫৩৫০০৯৭৪', 'পুষ্টি আঠা 1 কেজি', 1, 0, 0, 'na', 0, 0, 44.00, 60.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:41:18', '', '', 1),
(986, '৮৯৪১১৫৩৫০০৯৮১', 'পুষ্টি আঠা 2 কেজি', 1, 0, 0, 'na', 0, 0, 85.00, 120.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:41:54', '', '', 1),
(987, '৮৯৪১১৫৩৫০১০৩২', 'পুষ্টি শয়দা 2 কেজি', 1, 0, 0, 'na', 0, 0, 118.00, 140.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:42:40', '', '', 1),
(988, '৮৯৪১১৫৩৫০১০৭০', 'পুষ্টি সুজি 250 গ্রাম', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:43:11', '', '', 1),
(989, '৮৯৪১১৫৩৫০১০৮৭', 'পুষ্টি সুজি 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 38.00, 48.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:43:39', '', '', 1),
(990, '৮৯৪১১৫৩৫০১৪৭৬', 'পুষ্টি সুগন্ধি চিনিগুঁড়া চাল 1 কেজি', 1, 0, 0, 'na', 0, 0, 133.00, 165.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:44:39', '', '', 1),
(991, '৩৮৮৫৭২৫৬০০৫০৯', 'পুষ্টি দেশী মসুর ডাল 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 58.00, 65.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:45:25', '', '', 1),
(992, '৮৯৪১১৫৩৫০২৯০৯', 'পুষ্টি দেশী মসুর ডাল 1কেজি', 1, 0, 0, 'na', 0, 0, 115.00, 130.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:45:58', '', '', 1),
(993, '৮৯৪১১৫৩৫১২৬৪৯', 'পুষ্টি চা ফ্যামিলি ব্লেন্ড 50 গ্রাম', 1, 0, 0, 'na', 0, 0, 22.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:47:06', '', '', 1),
(994, '৮৯৪১১৫৩৫১২৬৫৬', 'পুষ্টি চা ফ্যামিলি ব্লেন্ড 100 গ্রাম', 1, 0, 0, 'na', 0, 0, 42.00, 60.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:47:38', '', '', 1),
(995, '৮৯৪১১৫৩৫০৩৬৫৪', 'পুষ্টি চা ব্ল্যাক টি 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 140.00, 180.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:48:20', '', '', 1),
(996, '৮৯৪১১৫৩৫০১১৮৬', 'পুষ্টি চা ব্ল্যাক টি বিওপি 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 135.00, 155.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:49:14', '', '', 1),
(997, '৩৮৮৫৪৮৩৯০০৫০৭', 'পুষ্টি চা ব্ল্যাক আর পি এর 500 গ্রাম', 1, 0, 0, 'na', 0, 0, 135.00, 205.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:49:56', '', '', 1),
(998, '৮৯৪১১৫৩৫০১৫৭৫', 'পুষ্টি ড্রিংকিং ওয়াটার 500 মি', 1, 0, 0, 'na', 0, 0, 9.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:56:07', '', '', 1),
(999, '৮৯৪১১৫৩৫০১৫৮২', 'পুষ্টি ড্রিংকিং ওয়াটার 1 লিটার', 1, 0, 0, 'na', 0, 0, 16.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:57:00', '', '', 1),
(1000, '৮৯৪১১৫৩৫০১৫৯৯', 'পুষ্টি ড্রিংকিং ওয়াটার 2 লিটার', 1, 0, 0, 'na', 0, 0, 27.00, 40.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:57:37', '', '', 1),
(1001, '৮৯৪১১৫৩৫০১৬০৫', 'পুষ্টি ড্রিংকিং ওয়াটার 5 লিটার', 1, 0, 0, 'na', 0, 0, 65.00, 80.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-03 19:58:04', '', '', 1),
(1002, '8887155064079', 'Kings Sunflower OiL 5 Litre b', 2, 0, 0, 'na', 0, 0, 1500.00, 2100.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 13:57:36', '', '', 1),
(1003, '8941184000603', 'Fortune Rice Bran oil 5 liter', 2, 0, 0, 'na', 0, 0, 1045.00, 1080.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 13:59:14', '', '', 1),
(1004, '8941184001068', 'Fortune Mustard Oil 5 Liter ', 2, 0, 0, 'na', 0, 0, 1150.00, 1300.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 13:59:52', '', '', 1),
(1005, '8941184001051', 'Fortune Mustard Oil 1 Liter', 2, 0, 0, 'na', 0, 0, 280.00, 330.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:00:33', '', '', 1),
(1006, '8941184001044 ', 'Fortune Mustard Oil 500Ml', 2, 0, 0, 'na', 0, 0, 142.00, 170.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:01:15', '', '', 1),
(1007, '8941184001075', 'Fortune Mustard Oil 250 ml', 2, 0, 0, 'na', 0, 0, 71.00, 85.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:02:10', '', '', 1),
(1008, '8941184001082', 'Fortune Mustard Oil 80ml', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:02:47', '', '', 1),
(1009, '8941052011045', 'রুপচাঁদা ফর্টিফাইড সয়াবিন তেল 1 লেটার', 2, 0, 0, 'na', 0, 0, 185.00, 189.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:03:47', 'Admin', '2025-05-05 10:01:48', 1),
(1010, '৮৯৪১০৫২০১১০৫২', 'রুপচাঁদা ফর্টিফাইড সয়াবিন তেল 2 লেটার', 2, 0, 0, 'na', 0, 0, 370.00, 378.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:04:33', '', '', 1),
(1011, '৮৯৪১০৫২০১১০৮৩', 'রুপচাঁদা ফর্টিফাইড সয়াবিন তেল 5 লিটার', 2, 0, 0, 'na', 0, 0, 902.00, 922.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:05:37', '', '', 1),
(1012, '৮৯৪১০৫২০১১৪৪১', 'রুপচাঁদা ফর্টিফাইড সয়াবিন তেল 1 লিটার পলি', 2, 0, 0, 'na', 0, 0, 183.00, 187.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:06:49', '', '', 1),
(1013, '৮৮০২২৫১৫০০১৪', 'রুপচাঁদা চাল চিনিগুঁড়া 1 কেজি', 2, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:07:50', '', '', 1),
(1014, '৮৯৪১১৮৪০০১০১৩', 'রুপচাঁদা  মসুর ডাল দেশি 1 কেজি', 2, 0, 0, 'na', 0, 0, 148.00, 165.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:09:00', '', '', 1),
(1015, '8906007283205', 'Fortune Biryani Special Basmati Rice 1Kg', 2, 0, 0, 'na', 0, 0, 330.00, 360.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:11:27', 'Admin', '2025-07-02 12:06:29', 1),
(1016, '8906007283212', 'Fortune Biryani Special Basmati Rice 5Kg', 2, 0, 0, 'na', 0, 0, 1770.00, 2100.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:12:43', '', '', 1),
(1017, '৮৯৪১১৮৪০০০৮১৮', 'রুপচাঁদা চাল নাজির শাইল সিদ্ধ 5 কেজি', 2, 0, 0, 'na', 0, 0, 480.00, 525.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:13:56', '', '', 1),
(1018, '৮৯৪১১৮৪০০০৮৬৩', 'রুপচাঁদা চাল নাজির শাইল সিদ্ধ 10 কেজি', 2, 0, 0, 'na', 0, 0, 960.00, 1050.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:14:27', '', '', 1),
(1019, '৮৯৪১১৮৪০০০৭৯৫', 'রুপচাদা চাল জিরাশাইল সিদ্ধ 5 কেজি', 2, 0, 0, 'na', 0, 0, 475.00, 510.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 14:15:28', '', '', 1),
(1020, '4987176124647', 'Wilkinson Double Edge Blads 5s', 2, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-04 15:58:06', '', '', 1),
(1021, '4987176172440', 'Guard Cartridge 1s', 2, 0, 0, 'na', 0, 0, 22.50, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 15:59:27', '', '', 1),
(1022, '8006540917619', 'Guard Razor ', 2, 0, 0, 'na', 0, 0, 37.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:00:13', 'Admin', '2025-07-09 16:49:09', 1),
(1023, '8901358702436', 'Blue 2 Razor', 2, 0, 0, 'na', 0, 0, 45.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:01:03', 'Admin', '2025-07-09 16:48:49', 1),
(1024, '7702018603015', 'Blue 3 Comfort Razor Single ', 2, 0, 0, 'na', 0, 0, 80.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:03:30', '', '', 1),
(1025, '4987176280541', 'guard Cartridge 4 e', 2, 0, 0, 'na', 0, 0, 93.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:04:35', '', '', 1),
(1026, '4987176256997', 'Whisper Ultra Clean xl 6s', 2, 0, 0, 'na', 0, 0, 135.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:07:41', '', '', 1),
(1027, '4987176278562', 'Vector Razor ', 2, 0, 0, 'na', 0, 0, 152.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:09:03', '', '', 1),
(1028, '4987176252708', 'wHISPER mAXI fIT  8S', 2, 0, 0, 'na', 0, 0, 186.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:10:24', '', '', 1),
(1029, '3014260656737', 'Gillette shaving foam regular 98g', 2, 0, 0, 'na', 0, 0, 276.79, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:12:16', 'Admin', '2025-06-23 17:07:43', 1),
(1030, '7702018001132', 'Gellette Shaving Foam Sensitive 98g', 2, 0, 0, 'na', 0, 0, 276.79, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:13:03', 'Admin', '2025-06-23 17:08:25', 1),
(1031, '4987176237163', 'Whisper Ultra Clean Xl 15s', 2, 0, 0, 'na', 0, 0, 363.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:13:55', '', '', 1),
(1032, '4987176257031', 'Whisper Ultra Xl + 15s', 2, 0, 0, 'na', 0, 0, 308.00, 365.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:14:34', '', '', 1),
(1033, '4987176300478', 'Mach3 Base Cartridge 2', 2, 0, 0, 'na', 0, 0, 428.00, 505.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:15:38', '', '', 1),
(1034, '4987176234278', 'Panten Shampoo Luscious Thick180 ml', 2, 0, 0, 'na', 0, 0, 429.00, 530.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:16:32', '', '', 1),
(1035, '4987176234209', ' Pantene Shampoo Silky Smooth Care 180 ml', 2, 0, 0, 'na', 0, 0, 429.00, 530.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:17:44', '', '', 1),
(1036, '8001090310613', ' H&S Shampoo Cool Menthol 180 ml', 2, 0, 0, 'na', 0, 0, 429.00, 530.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:18:32', '', '', 1),
(1037, 'P4987176234223', 'Pantene Shampoo Hair fall Control 180 ml', 2, 0, 0, 'na', 0, 0, 429.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:19:31', '', '', 1),
(1038, '4987176072993', 'M&S Shampoo Lemon Fresh 180ml', 2, 0, 0, 'na', 0, 0, 429.00, 530.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:20:40', '', '', 1),
(1039, '4987176073013', 'H&S shampoo Kilky Black 180ml', 2, 0, 0, 'na', 0, 0, 429.00, 530.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:21:29', '', '', 1),
(1040, '8006540768709', 'H&S Shampoo Smooth &Silky 180 ml', 2, 0, 0, 'na', 0, 0, 429.00, 530.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:22:20', '', '', 1),
(1041, '4987176272164', 'Pantene Shampoo Silky smooth Care 2in1 180 ml', 2, 0, 0, 'na', 0, 0, 485.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:23:48', '', '', 1),
(1042, '4987176030108', 'Gillette Shaving Foam regular 196g', 2, 0, 0, 'na', 0, 0, 535.31, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:24:31', 'Admin', '2025-06-23 17:06:43', 1),
(1043, '4987176254344', 'H&S Shampoo Smooth  & Silky 2in1180ml', 2, 0, 0, 'na', 0, 0, 565.21, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:27:02', 'Admin', '2025-06-23 17:00:21', 1),
(1044, '4987176254313', 'H&S Shampoo coll Menthol 2in1 180ml', 2, 0, 0, 'na', 0, 0, 565.21, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:27:48', 'Admin', '2025-06-23 16:59:54', 1),
(1045, '3014260214692', 'Gillette Series gel Sensitive195 gm', 2, 0, 0, 'na', 0, 0, 552.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:28:31', '', '', 1),
(1046, '3014260220051', 'gillette Series gel moisturrizing 195gm', 2, 0, 0, 'na', 0, 0, 573.00, 675.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:29:05', '', '', 1),
(1047, '4987176226808', 'Mach3 Base Razor', 2, 0, 0, 'na', 0, 0, 590.00, 695.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:30:02', '', '', 1),
(1048, '4987176198228', 'Gillette After Shaves Splash cool Wave Fresh 100ml', 2, 0, 0, 'na', 0, 0, 714.00, 860.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:31:14', '', '', 1),
(1049, '4987176103451', 'Fusion5 Prglide Cartridge 2s', 2, 0, 0, 'na', 0, 0, 747.00, 900.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:32:07', '', '', 1),
(1050, '4987176234247', 'Pantene Shampoo Luscious Thick 340 ml', 2, 0, 0, 'na', 0, 0, 768.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:33:06', '', '', 1),
(1051, '4987176234421', 'Pantene Shampoo Deep Repir 340ml', 2, 0, 0, 'na', 0, 0, 768.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:33:50', '', '', 1),
(1052, '4987176234407', 'Pantene Shampoo Silky smooth care 340ml', 2, 0, 0, 'na', 0, 0, 768.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:34:43', '', '', 1),
(1053, '4987176234308', 'Pantene Shampoo Hair Fall Control 340ml', 2, 0, 0, 'na', 0, 0, 768.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:35:19', '', '', 1),
(1054, '7702018264230', 'Mach3 base Cartride 4', 2, 0, 0, 'na', 0, 0, 801.00, 945.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:37:29', '', '', 1),
(1055, '8001090308856', 'H&S Shampoo Cool Menthol 340ml', 2, 0, 0, 'na', 0, 0, 801.00, 990.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:38:13', '', '', 1),
(1056, '7702018918041', 'Fusion razor', 2, 0, 0, 'na', 0, 0, 905.00, 1090.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:38:47', '', '', 1),
(1057, '4987176272140', 'Pantene Shampoo Silky smooth Care 2in1340ml', 2, 0, 0, 'na', 0, 0, 921.00, 1140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:39:52', '', '', 1),
(1058, '4987176254405', 'H&S Shampoo smooth & Silky 2in1 340 ml', 2, 0, 0, 'na', 0, 0, 1043.00, 1200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:40:31', 'Admin', '2025-06-23 16:58:45', 1),
(1059, '4987176254429', 'H&S  Shampoo coool Menthol 2 in 1340 ml', 2, 0, 0, 'na', 0, 0, 1043.00, 1200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:44:17', 'Admin', '2025-06-23 16:58:00', 1),
(1060, '4987176234391', 'Pantene Shampoo Silky Smooth Care 650 ml', 2, 0, 0, 'na', 0, 0, 1455.00, 1800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:45:19', '', '', 1),
(1061, '4987176234261', ' Pantene Shampoo deep repair 650 ml', 2, 0, 0, 'na', 0, 0, 1455.00, 1800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:46:10', '', '', 1),
(1062, '4987176234285', 'Pantene Shampoo Hair Fall Control 650 ml', 2, 0, 0, 'na', 0, 0, 1455.00, 1800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:47:00', '', '', 1),
(1063, '8001090309013', 'H&S Shampoo Anti Hairfall 650ml', 2, 0, 0, 'na', 0, 0, 1512.00, 1870.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:47:51', '', '', 1),
(1064, '8001090309006', 'H&s Shampoo cool Menthol 650 ml', 2, 0, 0, 'na', 0, 0, 1512.00, 1870.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:48:48', '', '', 1),
(1065, '8006540768716', 'H&S Shampoo smooth & Silky 650 ml', 2, 0, 0, 'na', 0, 0, 1512.00, 1870.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:49:37', '', '', 1),
(1066, '8944000552225', 'Skinpro For Acne Prone Skin 50ml', 2, 0, 0, 'na', 0, 0, 82.00, 99.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:50:40', '', '', 1),
(1067, '8941160252057', 'Care Body  oil Female 100 ml', 2, 0, 0, 'na', 0, 0, 167.00, 199.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:52:21', 'Admin', '2025-05-04 16:52:54', 1),
(1068, '8941160252064', 'Care Body Oil Female 200ml', 2, 0, 0, 'na', 0, 0, 317.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:54:05', '', '', 1),
(1069, '8941160252118', 'Care Hair Serum 100ml', 2, 0, 0, 'na', 0, 0, 408.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:55:08', '', '', 1),
(1070, '6940103976663', 'MAGIC LADY Hair color 60 ml (Black)', 2, 0, 0, 'na', 0, 0, 390.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 16:55:59', '', '', 1),
(1071, '8941161105192', 'Fresh  Fortified Soyabean Oil 5 Liter ', 1, 0, 0, 'na', 0, 0, 903.00, 922.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:40:48', '', '', 1),
(1072, '8941161105178', 'Fresh Fortified Soyabean Oil 2 Liter', 1, 0, 0, 'na', 0, 0, 370.00, 378.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:42:20', '', '', 1),
(1073, '8941161105161', 'Fresh Fortified Soyabean Oil 1 Liter', 1, 0, 0, 'na', 0, 0, 184.00, 189.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:42:44', '', '', 1),
(1074, '8941161105154', 'Fresh Fortified Soyabean Oil 500mL', 1, 0, 0, 'na', 0, 0, 93.00, 96.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:43:20', '', '', 1),
(1075, '8941161106571', 'Fresh Mustard Oil 1 Liter', 1, 0, 0, 'na', 0, 0, 260.00, 320.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:44:04', '', '', 1),
(1076, '8941161106564', 'Fresh Mustard Oil 500ml', 1, 0, 0, 'na', 0, 0, 133.00, 175.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:44:32', '', '', 1),
(1077, '8941161106540', 'Fresh Mustard Oil 250ml', 1, 0, 0, 'na', 0, 0, 65.00, 85.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:44:55', '', '', 1),
(1078, '8941161106519', 'Fresh Mustard Oil 80ml', 1, 0, 0, 'na', 0, 0, 23.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:45:14', '', '', 1),
(1079, '8941161102917', 'Fresh  Super Premium Salt 1 kg', 1, 0, 0, 'na', 0, 0, 34.00, 42.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:45:58', '', '', 1),
(1080, '8941161102900', 'Fresh Super Premium Salt 500', 1, 0, 0, 'na', 0, 0, 17.00, 22.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:46:32', '', '', 1),
(1081, '8941161101019', 'Fresh Chinigura Aromatic Rice 1 kg', 1, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:47:18', '', '', 1),
(1082, '8941161108926', 'Fresh Deshi Red Lentil  Premium 1 kg', 1, 0, 0, 'na', 0, 0, 140.00, 155.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:48:10', '', '', 1),
(1083, 'P01083', 'Fresh Red Lentil Regular 1 kg', 1, 0, 0, 'na', 0, 0, 70.00, 130.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:48:49', '', '', 1),
(1084, '8941161108919', 'Fresh Deshi Red Lentil Premium 500 g', 1, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:50:15', '', '', 1),
(1085, '8941161101569', 'Fresh Chilli Powder 500g', 1, 0, 0, 'na', 0, 0, 250.00, 345.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:51:06', '', '', 1),
(1086, '9809514101545', 'Fresh Chilli Powder 200g', 1, 0, 0, 'na', 0, 0, 108.00, 140.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:51:28', '', '', 1),
(1087, '8941161101538', 'Fresh Chilli Powder 100g', 1, 0, 0, 'na', 0, 0, 53.00, 75.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:51:49', '', '', 1),
(1088, '8941161101521', 'Fresh Chilli Powder 50g', 1, 0, 0, 'na', 0, 0, 29.00, 38.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:52:32', '', '', 1),
(1089, '8941161101620', 'Fresh Turmeric Powder 200', 1, 0, 0, 'na', 0, 0, 98.00, 125.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:53:27', '', '', 1),
(1090, '8941161101613', 'Fresh Turmeric Powder 100g', 1, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:53:46', '', '', 1),
(1091, '6809791101606', 'Fresh Turmeric Powder 50g', 1, 0, 0, 'na', 0, 0, 27.00, 35.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:54:02', '', '', 1),
(1092, '8941161101699', 'Fresh Coriander Powder 100g', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:55:00', '', '', 1),
(1093, '8941161101682', 'Fresh Coriander Powder 50g', 1, 0, 0, 'na', 0, 0, 25.00, 32.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:55:36', '', '', 1),
(1094, '8301100101218', 'Fresh Beef Masala 25g', 1, 0, 0, 'na', 0, 0, 18.00, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:56:33', '', '', 1),
(1095, '8301100101195', 'Fresh Chicken Masala 20g', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 17:57:05', '', '', 1),
(1096, '8941161106601', 'Fresh Mustard Oil 5 Liter', 1, 0, 0, 'na', 0, 0, 1100.00, 1300.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-04 18:02:11', '', '', 1),
(1097, '8941153907568', 'Aconol Handwash 200 ml', 2, 0, 0, 'na', 0, 0, 108.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 18:31:29', 'Admin', '2025-05-04 18:42:06', 1),
(1098, '8941153910018', 'Lily Body wash green apple', 2, 0, 0, 'na', 0, 0, 147.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 18:32:57', 'Admin', '2025-07-16 11:36:11', 1),
(1099, '8941153918038', 'Tylox Liquid Toilet Cleaner 500 ml', 2, 0, 0, 'na', 0, 0, 89.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 18:33:40', '', '', 1),
(1100, '8941153908169', 'Sunbit Refsreshing Lime Liquid dish Wash 500 ml', 2, 0, 0, 'na', 0, 0, 110.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 18:34:36', '', '', 1),
(1101, '8941153908077', 'Sunbit Refreshing Lime Liquid Dish Wash 500 ml', 2, 0, 0, 'na', 0, 0, 122.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 18:35:52', '', '', 1),
(1102, '8941153902082', 'Lily Milk Bath Beauty Soap 75 ml', 2, 0, 0, 'na', 0, 0, 36.00, 45.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 18:38:21', '', '', 1),
(1103, 'P01103', 'Acnol Multifunctional 100 ml soap', 2, 0, 0, 'na', 0, 0, 53.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:41:34', '', '', 1),
(1104, '8941153902068', 'Lily Lime Punch Beauty soap 100 ml', 2, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:43:47', '', '', 1),
(1105, '8941153903898', 'Lily Facewash 100ml', 2, 0, 0, 'na', 0, 0, 106.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:45:48', '', '', 1),
(1106, '8941153918342', 'Tylox Liquid Floor Cleaner 1 Liter', 2, 0, 0, 'na', 0, 0, 278.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:47:24', '', '', 1),
(1107, '8941153907537', 'Aconol Handwash RP 175 ml', 2, 0, 0, 'na', 0, 0, 61.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:48:40', '', '', 1),
(1108, '8941153918564', 'Tylox Liquid Glass Cleaner 500 ml', 2, 0, 0, 'na', 0, 0, 200.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:50:16', '', '', 1),
(1109, '8941153902457', 'Lily Anti Dandruff Shampoo  180 ml', 2, 0, 0, 'na', 0, 0, 261.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:51:52', '', '', 1),
(1110, '8941153904284', 'Lily Aloe Vera Soothing Gel 250ml', 2, 0, 0, 'na', 0, 0, 222.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:53:32', '', '', 1),
(1111, '8941153902440', 'Lily Anti Dandruff Shampoo 90 ml', 2, 0, 0, 'na', 0, 0, 113.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:55:20', '', '', 1),
(1112, '8941153921762', 'Nior Dewy Fresh Cleanser goat Milk 100 ml', 2, 0, 0, 'na', 0, 0, 225.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:56:29', '', '', 1),
(1113, '8941153908091', 'Sunbit Lemon Force Dish Washing Bar 300ml', 2, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:57:43', '', '', 1),
(1114, '8941153908107', 'Sunbit Lemon Force Dish Washing Bar 75 ml', 2, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 18:59:14', '', '', 1),
(1115, '8941153902464', 'Silkore Hair Fall Defense Shampoo 90 ml', 2, 0, 0, 'na', 0, 0, 104.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 19:00:53', '', '', 1),
(1116, '8941153902488', 'Silkore Silk & Shine Shampoo 90ml', 2, 0, 0, 'na', 0, 0, 96.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 19:02:10', '', '', 1),
(1117, '8941153907520', 'Acnol Handwash 175 ml', 2, 0, 0, 'na', 0, 0, 61.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 19:03:36', 'Admin', '2025-05-04 19:06:15', 1),
(1118, '8941153903874', 'Lily Facewash Lemon 100ml ', 2, 0, 0, 'na', 0, 0, 106.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 19:11:27', '', '', 1),
(1119, '8941153903867', 'Lily Facewash Honey 100ml', 2, 0, 0, 'na', 0, 0, 106.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 19:12:06', '', '', 1),
(1120, '8941153907575', 'Aconol Handwash Berry Blast 200 ml', 2, 0, 0, 'na', 0, 0, 108.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 19:12:49', '', '', 1),
(1121, '8941153921755', 'Nior Dewy Fresh cleanser Oat Milk 100 ml', 2, 0, 0, 'na', 0, 0, 225.00, 380.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 19:18:55', '', '', 1),
(1122, '8941153907070', 'Acnol Multifunctional Hygiene Soap 100g', 2, 0, 0, 'na', 0, 0, 53.00, 70.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 19:21:30', 'Admin', '2025-05-04 19:22:37', 1),
(1123, '8941153902471', 'Lily Silkore  Hair Fall Defense Shampoo 180ml', 2, 0, 0, 'na', 0, 0, 217.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 19:23:37', '', '', 1),
(1124, '8941153902129', 'Lily  Elegant Rose Beauty Soap 100ml', 2, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 19:26:39', 'Admin', '2025-05-04 19:28:07', 1),
(1125, '8941153902037', 'Lily Beli Pearls Soap 100ml', 2, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 19:28:52', '', '', 1),
(1126, '8941153907087', 'Acnol Multifunctional Soap 100ml', 2, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 19:30:00', 'Admin', '2025-05-04 19:30:27', 1),
(1127, '8941153902495', 'Lily Silkore Silk & Shine Shampoo 180 ml', 2, 0, 0, 'na', 0, 0, 200.00, 230.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 20:25:51', '', '', 1),
(1128, '8941153921731', 'Nior Deep Clean Gel Face Wash Tea Tree 100 ml', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 20:28:38', '', '', 1),
(1129, '8941153900521', 'Nior  Deep Clean Sweet  Orange 100 ml', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-04 20:29:51', '', '', 1),
(1130, '8941153900538', 'Nior Deep Clean Soothin Menthol', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-04 20:35:27', '', '', 1),
(1131, '৮৪১১৬৫১১০৩১৫', 'মি, নুডল্ স ইন্সট্যান্ট নুডলস 16 পেক', 1, 0, 0, 'na', 0, 0, 294.00, 330.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-05 12:59:53', '', '', 1),
(1132, '৮৪১১৬৫১৩১২২৮', 'মি, নুডল্ স ইন্সট্যান্ট নুডলস 28 পেক', 1, 0, 0, 'na', 0, 0, 465.00, 525.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-05 13:00:43', '', '', 1),
(1133, '৮৪৬৬৫৬০১৭৭৪৬', 'মি, নুডল্ স ইন্সট্যান্ট নুডলস 12পেক', 1, 0, 0, 'na', 0, 0, 223.00, 255.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-05 13:01:51', '', '', 1),
(1134, '৮৪০২০৫৭১৫১৮৩', 'মি, নুডল্ স ইন্সট্যান্ট নুডলস  কোরিয়ান  8 পেক ', 1, 0, 0, 'na', 0, 0, 183.00, 210.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-05 13:02:35', '', '', 1),
(1135, '৮৪০২০৫৭১৪৪০৭', 'মি, নুডল্ স ইন্সট্যান্ট নুডলস কোরিয়ান 4 পেক', 1, 0, 0, 'na', 0, 0, 93.00, 110.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-05 13:03:18', '', '', 1),
(1136, '৮৪১১৬৫১২০৬২৮', 'মি, নুডল্ স ইন্সট্যান্ট  কাপ নুডলস 40 গ্রম ', 1, 0, 0, 'na', 0, 0, 28.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-05 13:04:09', '', '', 1),
(1137, '80176800', 'Nutella Ferrero 750g', 1, 0, 0, 'na', 0, 0, 1220.00, 1500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:21:36', '', '', 1),
(1138, '80177173', 'Nutella Ferrero 350 g', 1, 0, 0, 'na', 0, 0, 560.00, 700.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:22:16', '', '', 1),
(1139, '80177425', 'Nutella Ferrero 1800g', 1, 0, 0, 'na', 0, 0, 360.00, 480.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:22:52', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1140, '8000500009673', 'Ferrero Rocher 300g', 1, 0, 0, 'na', 0, 0, 1380.00, 1800.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:24:07', '', '', 1),
(1141, '8000500418482', 'Kinder Schoko Bons Milky &bCocoa 67g', 1, 0, 0, 'na', 0, 0, 280.00, 350.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:25:32', '', '', 1),
(1142, '80050278', 'Ferrero Rocher ', 1, 0, 0, 'na', 0, 0, 165.00, 230.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:26:27', '', '', 1),
(1143, '8000500418512', 'Kinder Schoko Bons Crispy 22.4g', 1, 0, 0, 'na', 0, 0, 96.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:27:41', '', '', 1),
(1144, '80768258', 'Kinder Joy 20g', 1, 0, 0, 'na', 0, 0, 83.63, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:29:04', '', '', 1),
(1145, '80974482', 'Kinder Joy Rich in Milk With surprise 20g', 1, 0, 0, 'na', 0, 0, 84.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:30:18', '', '', 1),
(1146, '80824107', 'Kinder Cream Milky & Crunchy 19g', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:32:49', '', '', 1),
(1147, '8908008142291', 'Himalaya Anti Hair Fall 375 ml', 2, 0, 0, 'na', 0, 0, 408.00, 480.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:41:35', '', '', 1),
(1148, '8908008142321', 'Himalaya Anti Dandruff  Shampoo 375ml', 2, 0, 0, 'na', 0, 0, 408.00, 480.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:42:14', '', '', 1),
(1149, '8908008142642', 'Himalaya Brightening Vitamin C 100 l', 2, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:43:26', '', '', 1),
(1150, '8908008142246', 'Himalaya Me Acne Clear Meem Face Wash ', 2, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:44:25', 'Admin', '2025-06-22 15:17:45', 1),
(1151, '8908008142000', 'Himalaya Psurifying Neem Face Wash 100 ml', 2, 0, 0, 'na', 0, 0, 157.00, 215.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:44:59', 'Admin', '2025-06-22 15:31:02', 1),
(1152, '8908008142222', 'Himalaya Men Inense Oil Clear Lemon Face Wash 100 ml', 2, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:45:44', '', '', 1),
(1153, '8908008142062', 'Himalaya Moisturizing Aloe Vera Face Wash 100 ml', 2, 0, 0, 'na', 0, 0, 175.00, 225.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:47:24', '', '', 1),
(1154, '8908008142314', 'Himalaya Anti Dandruff Shampoo 180 ml', 2, 0, 0, 'na', 0, 0, 229.00, 270.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:49:36', '', '', 1),
(1155, '8908008142284', 'Himalaya Anti Hair Fall Shampoo 100 ml', 2, 0, 0, 'na', 0, 0, 229.00, 270.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:50:17', '', '', 1),
(1156, '8908008142192', 'Himalaya Men Power Bright Face Wash 100m', 2, 0, 0, 'na', 0, 0, 200.00, 270.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:51:19', '', '', 1),
(1157, '8908008142666', 'Himalaya Brightening Vitamin C 100ml', 2, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:52:46', '', '', 1),
(1158, '8908008142024', 'Himalaya Purifying Neem Face Wash 150 ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:53:27', '', '', 1),
(1159, '8908008142680', 'Himalaya Brightening vitamin C 100 ml', 2, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:54:10', '', '', 1),
(1160, '8908008142345', 'Himalaya Natural Glow 50 ml', 2, 0, 0, 'na', 0, 0, 133.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-06 21:54:47', 'Admin', '2025-06-22 15:30:36', 1),
(1161, '8908008142048', 'Himalaya Natural Glow Face Wash 100 ml', 2, 0, 0, 'na', 0, 0, 175.00, 225.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 21:55:28', '', '', 1),
(1162, '8941149751298', 'Finis Fixol Tiles Cleaner 1 Liter', 2, 0, 0, 'na', 0, 0, 45.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 22:11:32', 'Admin', '2025-05-06 22:20:46', 1),
(1163, 'P011638941149751281', 'Finis Fixol Tiles Cleaner 500 ml', 2, 0, 0, 'na', 0, 0, 65.00, 80.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 22:13:18', 'Admin', '2025-05-06 22:22:07', 1),
(1164, '8941149751038', 'Finins Liquid Spray 400 ml', 2, 0, 0, 'na', 0, 0, 125.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 22:16:01', '', '', 1),
(1165, '8941149751236', 'Finis Certified Original 500g', 2, 0, 0, 'na', 0, 0, 45.00, 65.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 22:18:03', 'Admin', '2025-05-06 22:19:59', 1),
(1166, '8941149751229', 'Finis Certified Original 200g', 2, 0, 0, 'na', 0, 0, 26.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-06 22:19:36', '', '', 1),
(1167, '872031031786', 'সেভয় চকোবার আইসক্রিম 72মি লি', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:19:35', '', '', 1),
(1168, '৮৭২০৩১০৮১৮১১', 'সেভয় মিনি চকোবার আইসক্রিম 46লি', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:20:46', '', '', 1),
(1169, '৮৭২০৩১১০১৮০৯', 'সেভয় শৈল এন্ড কোর আইসক্রিম 62 মি', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:22:43', '', '', 1),
(1170, '৮৭২০৩১০২১০২১১', 'সেভয় দুধ মালাই আইসক্রিম 40 মি', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:23:36', '', '', 1),
(1171, '৮৭২০৩১১৭১২৩৯', 'একদম আম সবেহ্  70 মি', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:24:53', '', '', 1),
(1172, '৮৭২০৩১১১১৮৫৩', 'সেভয় ক্রাঞ্চি বার আইসক্রিম 82 মি', 1, 0, 0, 'na', 0, 0, 38.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:26:12', 'Admin', '2025-05-07 11:26:22', 1),
(1173, '৮৭২০৩১১২১৮৩১৫', 'সেভয় ক্রাঞ্চি বার মিনি আইসক্রিম 52 মি', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:27:21', '', '', 1),
(1174, '৮৭২০৩১০৪১৮০৮', 'সেভয় ললি 62 মি ', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:27:54', '', '', 1),
(1175, '৮৭২০৩১০৫১৮০৭', 'সেভয় ললি 62 মি  অরেন্জ', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:28:30', '', '', 1),
(1176, '৮৭২০৪১০৪৪২৮৮', 'Savoy Kheer Malai Ice Cream cup 120 ml', 1, 0, 0, 'na', 0, 0, 62.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:29:36', '', '', 1),
(1177, 'P01177', 'Savoy Shahi Kheer Ice Cream Mati Hari 100 ml', 1, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:31:30', '', '', 1),
(1178, '872081027777', 'সেভয় আইকোন চকলোট িআইসক্রিম কোন 121 মি', 1, 0, 0, 'na', 0, 0, 51.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:33:40', '', '', 1),
(1179, '৮৭২০৮১০১৭৭৭৮', 'সেভয় আইকোন ভ্যানিলা আইসক্রিম 121 মি', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:34:38', '', '', 1),
(1180, '৮৭২০৮১০১৭৭৮৫', 'সেভয় মিনি ভ্যানিলা আইসক্রিম 72 মি', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:35:48', '', '', 1),
(1181, '872041104289', 'Savoy Mawa Kulfi Ice Cream 120 ml Cup ', 1, 0, 0, 'na', 0, 0, 62.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:37:18', '', '', 1),
(1182, '1007310073013', 'Savoy Dark Desisre Ice Cream aCake 1 litre B ', 1, 0, 0, 'na', 0, 0, 930.00, 1100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:38:06', '', '', 1),
(1183, '1007310073006', 'Savoy golden Delight  Ice Cream Cake 1 Litre ', 1, 0, 0, 'na', 0, 0, 930.00, 1100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:39:03', '', '', 1),
(1184, '872111033662', 'Savouy Double Sunbae 1 Litre ', 1, 0, 0, 'na', 0, 0, 290.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:39:57', '', '', 1),
(1185, '872111013664', 'Savoy Doble Sundae Mongo 1 Litre', 1, 0, 0, 'na', 0, 0, 290.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:40:49', '', '', 1),
(1186, '872111023663', 'Savoy Double Sundae Chocolate 1 Liter', 1, 0, 0, 'na', 0, 0, 290.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 11:41:26', '', '', 1),
(1187, '872051023662', 'Savoy Strawberry ICE Cream 1 Liter', 1, 0, 0, 'na', 0, 0, 236.00, 280.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:53:02', '', '', 1),
(1188, '872051063668', 'Savoy Chocolate Regular 1 Liter', 1, 0, 0, 'na', 0, 0, 236.00, 280.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:53:43', '', '', 1),
(1189, '872051033661', 'Savoy Mango Ice Cream 1 Liter', 1, 0, 0, 'na', 0, 0, 236.00, 280.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:54:15', '', '', 1),
(1190, '872051013663', 'Savoy Vanilla Regular 1 Liter ', 1, 0, 0, 'na', 0, 0, 236.00, 280.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:54:53', '', '', 1),
(1191, '872051023556', 'Savoy Strawberry Ice Cream 500 ml', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:57:29', '', '', 1),
(1192, '872051033555', 'Savoy Strawberry Ice Mango 500 ml', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:58:21', '', '', 1),
(1193, '872051013557', 'Savoy Vanilla ICe Cream 500 ml', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 11:59:42', '', '', 1),
(1194, '8720510400917', 'Savoyn Kheer Malai Ice Cream 1 Liter', 1, 0, 0, 'na', 0, 0, 355.00, 420.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 12:00:54', '', '', 1),
(1195, '872051125663', 'Savoy Butter Scotch With Cashew Crakles I C 1 Litre ', 1, 0, 0, 'na', 0, 0, 416.00, 500.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 12:02:40', '', '', 1),
(1196, '872051135662', 'Savoy Chocolate Fudge Ice Cream 1 Liter', 1, 0, 0, 'na', 0, 0, 416.00, 500.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-07 12:03:22', '', '', 1),
(1197, '8859362502439', 'Men Extra Whitening Face Wash 6X 100 ml', 2, 0, 0, 'na', 0, 0, 288.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:23:29', '', '', 1),
(1198, '8859362513886', 'Miellar Face Wash Gel Water Boost 150 ml', 2, 0, 0, 'na', 0, 0, 476.00, 595.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:24:41', '', '', 1),
(1199, '8859362513893', 'Micellar Facef Wash Gel Tith Milk Water Boost 150 ml', 2, 0, 0, 'na', 0, 0, 476.00, 595.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:25:41', '', '', 1),
(1200, '8859362504297', 'EverGlow  Men Intense White 100 ml', 2, 0, 0, 'na', 0, 0, 303.00, 410.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:33:28', '', '', 1),
(1201, '8859362513879', 'YC Micellar Face Wash Gel 150 ml', 2, 0, 0, 'na', 0, 0, 476.00, 595.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:34:26', '', '', 1),
(1202, '8857101159005', 'CG Ever Glow Acne Face Wash Gel 100 ml', 2, 0, 0, 'na', 0, 0, 288.00, 385.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:35:30', '', '', 1),
(1203, '8857101150651', 'YC Whitening Face Wash Neem Extract 100ml', 2, 0, 0, 'na', 0, 0, 281.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:36:23', '', '', 1),
(1204, '8859362502422', 'YC Men Oil Cotro Face Wash 100ml', 2, 0, 0, 'na', 0, 0, 288.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:40:11', 'Admin', '2025-05-07 21:41:12', 1),
(1205, '8857101158985', 'CG Ever Glow Lemon Face Wash GEL 100 ml', 2, 0, 0, 'na', 0, 0, 288.00, 385.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:41:57', '', '', 1),
(1206, '8859362510380', 'YC Men new Acn Fight 100 ml', 2, 0, 0, 'na', 0, 0, 288.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:44:13', '', '', 1),
(1207, '8857101125703', 'YC Whitening Face Wash Milk Extract 100 ml', 2, 0, 0, 'na', 0, 0, 290.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:45:07', 'Admin', '2025-06-24 17:33:44', 1),
(1208, '8857101125390', 'YC Whitening Face Wash Lemon Extract 100 ml', 2, 0, 0, 'na', 0, 0, 290.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:45:51', 'Admin', '2025-06-24 17:33:57', 1),
(1209, '8859362505386', 'YC Whitening Face Wash Papaya Extract 100 ml', 2, 0, 0, 'na', 0, 0, 281.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:46:32', '', '', 1),
(1210, '614514060025', 'Blue For men Pour Homme200 ml', 2, 0, 0, 'na', 0, 0, 360.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:47:53', '', '', 1),
(1211, '8901277017093', 'Park Avenue Alter EGO Premium Booy Spray 150 ml', 2, 0, 0, 'na', 0, 0, 294.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:50:08', '', '', 1),
(1212, '8901277017086', 'Park Avenue NEO PRemiu Boody Sprry 150ml', 2, 0, 0, 'na', 0, 0, 294.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:51:38', '', '', 1),
(1213, '8904390203985', 'Foot Cream Heals Cracked Heels 50g', 2, 0, 0, 'na', 0, 0, 120.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:53:38', '', '', 1),
(1214, '8904390206207', 'LAFZ Kismet Halal Perfume', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:55:20', '', '', 1),
(1215, '8904390202322', 'LAFZ FAITH No Alcohol Prefume ', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:56:09', '', '', 1),
(1216, '8904390202346', 'LAFZ Makhallat Alaud Perfume ', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:57:06', '', '', 1),
(1217, '614514060209', 'Secret Pour Femme Body Spay 200 ml', 2, 0, 0, 'na', 0, 0, 370.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:58:12', '', '', 1),
(1218, '8904390200946', 'Lafz Rooh Mashariq Perfume ', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:59:00', '', '', 1),
(1219, '8904390202360', 'LAFZ Rhuz Khos Perfume ', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 21:59:56', '', '', 1),
(1220, '8904390202353', 'LAFZ Shuro Al Khaleej Perfume', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:01:03', '', '', 1),
(1221, '8904390202339', 'LAFZ Kaveh  Perfume ', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:02:02', '', '', 1),
(1222, '8904390200939', 'Lafz Kayani Dastoor ', 2, 0, 0, 'na', 0, 0, 253.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:02:30', '', '', 1),
(1223, '8901277016997', 'Park Avenue Singnature Collection ', 2, 0, 0, 'na', 0, 0, 294.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:03:17', '', '', 1),
(1224, '8904390203763', 'Lafz UV Shield AQua Sunscreen 50 SPF', 2, 0, 0, 'na', 0, 0, 310.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:03:58', '', '', 1),
(1225, '614514060018', 'Blue Lady Pur Femme ', 2, 0, 0, 'na', 0, 0, 390.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:04:43', 'Admin', '2025-06-27 19:18:05', 1),
(1226, '8904406199202', 'Lafz Lemar Pocket Deodorant ', 2, 0, 0, 'na', 0, 0, 90.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:05:37', '', '', 1),
(1227, '614514080740', 'Basasi Alpha Ededorant Body Spray Supreme ', 2, 0, 0, 'na', 0, 0, 370.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:06:33', '', '', 1),
(1228, '8941189061029', 'Park Avenue Alexander', 2, 0, 0, 'na', 0, 0, 310.00, 425.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:07:21', '', '', 1),
(1229, '8904390203800', 'LAFZ Foaming Face Wash Arabica coffee 100 ml', 2, 0, 0, 'na', 0, 0, 280.00, 399.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:08:11', '', '', 1),
(1230, '8901277017048', 'Park Avenue Sinature Collection Perfume', 2, 0, 0, 'na', 0, 0, 400.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:09:05', '', '', 1),
(1231, '8904390202810', 'Dr, Rhazes Fresh Air Aragance 150 ml', 2, 0, 0, 'na', 0, 0, 240.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:11:02', '', '', 1),
(1232, '8904390200588', 'LAFZ Onion Seed Essentia 100 ml', 2, 0, 0, 'na', 0, 0, 151.00, 349.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:13:53', '', '', 1),
(1233, '8901526006328', 'Garnier Turbo Bright  Face Wash 2 in 1', 2, 0, 0, 'na', 0, 0, 340.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:16:19', 'Admin', '2025-07-02 14:45:09', 1),
(1234, '8901526005314', 'Garnier Bright Complete  Dark Spot 100 g', 2, 0, 0, 'na', 0, 0, 425.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:18:00', '', '', 1),
(1235, '8901526205561', 'Garnier Deep cleansing Icy Face Wash ', 2, 0, 0, 'na', 0, 0, 367.26, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:19:05', '', '', 1),
(1236, '8901526006359', 'Garnier Bright Face Wash ', 2, 0, 0, 'na', 0, 0, 213.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:21:45', 'Admin', '2025-07-02 14:43:04', 1),
(1237, '8901526209637', 'Garnier Face Wash 99.9%', 2, 0, 0, 'na', 0, 0, 367.26, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:22:59', '', '', 1),
(1238, '8901526209620', 'Garnier Man Acno Fight Face Wash', 2, 0, 0, 'na', 0, 0, 213.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:24:05', 'Admin', '2025-07-02 14:41:29', 1),
(1239, '8901526005208', 'Garnier Bright Complete Vitaminc C Face Wash ', 2, 0, 0, 'na', 0, 0, 367.26, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:24:55', '', '', 1),
(1240, '8901526006342', 'Garnier MsEn Turbo Bright Face Wash ', 2, 0, 0, 'na', 0, 0, 213.00, 245.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:25:52', 'Admin', '2025-07-02 14:43:54', 1),
(1241, '8901526205578', 'OilClear Deep Cleansin ICYn Face Wash ', 2, 0, 0, 'na', 0, 0, 230.09, 245.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:26:34', '', '', 1),
(1242, '8901526006335', 'Garnier Man Turbo Bright  Face Wash VitaminC ', 2, 0, 0, 'na', 0, 0, 367.26, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:27:46', '', '', 1),
(1243, '8901526005192', 'Garnier Bright Complete Vitamin C Face Wash', 2, 0, 0, 'na', 0, 0, 207.96, 235.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:29:06', '', '', 1),
(1244, '8901526207473', 'Garnier Skin Naturals Pure Active Face Wash', 2, 0, 0, 'na', 0, 0, 367.00, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:30:11', '', '', 1),
(1245, '8901526206377', 'Gasrnier Color Naturals Riche ', 2, 0, 0, 'na', 0, 0, 234.51, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:34:00', '', '', 1),
(1246, '8901526529629', 'Garnier Color Natural Riche ', 2, 0, 0, 'na', 0, 0, 380.53, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:34:53', '', '', 1),
(1247, '8901526204496', 'Garnier Color Naturals Ciche 10 x', 2, 0, 0, 'na', 0, 0, 352.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:35:49', '', '', 1),
(1248, '8901526204748', 'Garnier Color Naturals Rich 10x', 2, 0, 0, 'na', 0, 0, 234.51, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:37:40', '', '', 1),
(1249, '8901526006427', 'Garnier Men Turbo Bright UV', 2, 0, 0, 'na', 0, 0, 318.00, 360.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:38:28', '', '', 1),
(1250, '8901526204731', 'Garnier Color Naturals Rice 10 x', 2, 0, 0, 'na', 0, 0, 215.00, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:39:46', 'Admin', '2025-07-02 14:49:16', 1),
(1251, '8901526211067', 'Garnier Acno Fight Clearing ', 2, 0, 0, 'na', 0, 0, 345.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:40:20', '', '', 1),
(1252, '8901526211814', 'Garnier Color natural 10X', 2, 0, 0, 'na', 0, 0, 217.00, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:41:03', '', '', 1),
(1253, '8901526204489', 'Garnier Color Naturals 4 brown', 2, 0, 0, 'na', 0, 0, 380.53, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:41:44', '', '', 1),
(1254, '8901526005178', 'Garnier UN Bright complete V C', 2, 0, 0, 'na', 0, 0, 274.00, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:42:27', '', '', 1),
(1255, '8901526005260', 'Garnier Skin Naturals Bright Complete Night ', 2, 0, 0, 'na', 0, 0, 390.00, 440.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:43:04', '', '', 1),
(1256, '8901526005161', 'Garnier Skin Naturals B C UN', 2, 0, 0, 'na', 0, 0, 164.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:43:40', '', '', 1),
(1257, '8901526005253', 'Garnier Bright Complete Vitamin c Sleeping Mask ', 2, 0, 0, 'na', 0, 0, 256.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:44:48', '', '', 1),
(1258, '8901526005277', 'Garnier Vitaminc B.B Cream', 2, 0, 0, 'na', 0, 0, 358.00, 405.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:45:27', '', '', 1),
(1259, '8901526603459', 'Loreal Paris Hyaluron Moisture ', 2, 0, 0, 'na', 0, 0, 833.00, 1000.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:46:28', '', '', 1),
(1260, '8901526101504', 'Loreal Paris Total Repair 5 Shampoo', 2, 0, 0, 'na', 0, 0, 833.00, 1000.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:47:22', '', '', 1),
(1261, '8901526101245', 'Loreal Paris Color Protect Shampoo ', 2, 0, 0, 'na', 0, 0, 833.00, 1000.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:48:04', '', '', 1),
(1262, '8901526103423', 'Loreal Paris Extraordinary Oil ', 2, 0, 0, 'na', 0, 0, 492.00, 590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:48:44', '', '', 1),
(1263, '8901526102358', 'Loreal Fall Resist 3x ', 2, 0, 0, 'na', 0, 0, 492.00, 590.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 22:51:06', '', '', 1),
(1264, '8901526101511', 'Loreal Total Repair 5 9%', 2, 0, 0, 'na', 0, 0, 492.00, 590.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 22:51:44', '', '', 1),
(1265, '8901526101498', 'Loreal Total Repair 5 4%', 2, 0, 0, 'na', 0, 0, 433.00, 520.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 22:52:14', '', '', 1),
(1266, '8901526101238', 'Loreal Color Protect UVA/UVB ', 2, 0, 0, 'na', 0, 0, 438.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:53:47', '', '', 1),
(1267, '4796918130064', 'Oateo  Quick Cooking White Oats 500g', 2, 0, 0, 'na', 0, 0, 365.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:54:46', '', '', 1),
(1268, '4796018132487', 'Oateo Baby Oats 500g', 2, 0, 0, 'na', 0, 0, 380.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:56:01', '', '', 1),
(1269, '8901247574892', 'Streax Insta Shampoo Hair Colour 2X Shine ', 2, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:57:43', '', '', 1),
(1270, '8901247574922', 'Streax Insta Shampoo Hair', 2, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:58:43', '', '', 1),
(1271, '8901247576292', 'Streax Insta Shampoo Hair 5 ml', 2, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 22:59:31', '', '', 1),
(1272, '8901526573561', 'Garnier Men Shampoo color 5', 2, 0, 0, 'na', 0, 0, 97.35, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:00:01', '', '', 1),
(1273, '8901526573547', 'Garnier Men Shampoo color 5 Black', 2, 0, 0, 'na', 0, 0, 97.35, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:00:37', '', '', 1),
(1274, '8901526209910', 'Garnier Black 15 MIn ', 2, 0, 0, 'na', 0, 0, 97.35, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:01:34', '', '', 1),
(1275, '8901526211715', 'Garnier Black 15 3.16', 2, 0, 0, 'na', 0, 0, 97.35, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:02:10', '', '', 1),
(1276, '8901526592302', 'Garnier Skin Naturals 15 min', 2, 0, 0, 'na', 0, 0, 155.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:02:47', '', '', 1),
(1277, '8901526592326', 'Garnier Skin Naturals Vitamin C  15 min', 2, 0, 0, 'na', 0, 0, 155.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:03:33', '', '', 1),
(1278, '8901526592340', 'Garnier Skin Naturals Sakura Glow ', 2, 0, 0, 'na', 0, 0, 155.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:04:12', '', '', 1),
(1279, '8901247573420', 'Streax instra Cream Hair Colour Quick & Easy ', 2, 0, 0, 'na', 0, 0, 32.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:05:16', '', '', 1),
(1280, '8901526103454', 'Loreal Paris 340 ml', 2, 0, 0, 'na', 0, 0, 350.00, 419.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:06:30', '', '', 1),
(1281, '8901542000478', 'Complan Milk Protein Creamy Classic 350ml', 2, 0, 0, 'na', 0, 0, 462.00, 485.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:08:09', 'Admin', '2025-06-18 16:58:24', 1),
(1282, '8901542000461', 'Complan Milk Royal chocolate Flavour 350 g', 2, 0, 0, 'na', 0, 0, 386.00, 405.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:09:39', 'Admin', '2025-06-18 16:58:57', 1),
(1283, '4796918130019', 'Oats Avoine Instantanee 1 Kg', 2, 0, 0, 'na', 0, 0, 580.00, 750.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:10:18', '', '', 1),
(1284, '8901542001949', 'Complan Milk Protein  Creamy Classic JR 500g', 2, 0, 0, 'na', 0, 0, 614.00, 645.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:11:38', 'Admin', '2025-06-18 16:56:58', 1),
(1285, '8901542001932', 'Complan MilkNew Royale Chocolate  500g', 2, 0, 0, 'na', 0, 0, 496.00, 520.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:12:46', 'Admin', '2025-06-18 16:55:50', 1),
(1286, '8901542000027', 'Complan MilkNew Royale Chocolate 200 g', 1, 0, 0, 'na', 0, 0, 233.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:13:31', '', '', 1),
(1287, '8901247571013', 'Kesh Kala Oil Based Hair colour  Black', 1, 0, 0, 'na', 0, 0, 98.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:14:34', '', '', 1),
(1288, '8901526204458', 'Garnier color Better color 10x', 1, 0, 0, 'na', 0, 0, 360.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:15:12', 'Admin', '2025-07-02 14:47:27', 1),
(1289, '8420701471350', 'Lucy Oliva skin care 100ml', 2, 0, 0, 'na', 0, 0, 292.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 23:15:58', 'Admin', '2025-06-17 17:17:39', 1),
(1290, '8901247573703', 'বেলীফূল প্রিমিয়াম হেয়া অয়েল 100মি', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:17:07', '', '', 1),
(1291, '628942123023', 'Ambassador Spanish Olive Oil 150 ml', 2, 0, 0, 'na', 0, 0, 458.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:18:31', 'Admin', '2025-06-17 17:13:55', 1),
(1292, '8901247573260', 'Vasmol Black Hair Oil 100 ml', 1, 0, 0, 'na', 0, 0, 95.00, 125.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 23:19:10', '', '', 1),
(1293, '8901247573727', 'বেলীফূল প্রিমিয়াম হেয়া অয়েল 200মি', 1, 0, 0, 'na', 0, 0, 140.00, 180.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 23:19:35', '', '', 1),
(1294, '628942123054', 'Spanish Olive Oil 250 ml', 1, 0, 0, 'na', 0, 0, 567.00, 680.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 23:20:34', '', '', 1),
(1295, '8420701471312', 'Lucy Oliva 250 ml', 1, 0, 0, 'na', 0, 0, 563.00, 675.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 23:21:16', '', '', 1),
(1296, '40111490', 'M & M\'s Chocolate', 1, 0, 0, 'na', 0, 0, 115.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-07 23:22:35', 'Admin', '2025-06-22 22:17:35', 1),
(1297, '40111445', 'M&M Peanut 45g', 1, 0, 0, 'na', 0, 0, 115.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:23:34', 'Admin', '2025-06-26 18:07:58', 1),
(1298, '5900951311321', 'Mars 51g', 1, 0, 0, 'na', 0, 0, 93.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:24:44', '', '', 1),
(1299, '5900951311505', 'Snickers 50 g', 1, 0, 0, 'na', 0, 0, 87.50, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-07 23:25:51', '', '', 1),
(1300, '4005808130115', 'Nivea Men Energy 247H  250 ml', 2, 0, 0, 'na', 0, 0, 440.00, 700.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:04:55', '', '', 1),
(1301, '4005808845330', 'Nivea Men Acne Oil Clear Anti Acne foam  100g', 2, 0, 0, 'na', 0, 0, 430.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:05:55', '', '', 1),
(1302, '42179078', 'Nivea Men Fresh Active 48h', 2, 0, 0, 'na', 0, 0, 190.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:06:33', 'Admin', '2025-06-28 21:45:15', 1),
(1303, '42059226', 'Nivea Fresh Natural 50 ml', 2, 0, 0, 'na', 0, 0, 210.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:07:20', 'Admin', '2025-06-27 19:21:04', 1),
(1304, '4005808301843', 'Nivea Men cool Kick 72 H 50 ml', 2, 0, 0, 'na', 0, 0, 208.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:08:03', '', '', 1),
(1305, '42184676', 'Nivea Men cool Kick extra dry 25 ml', 2, 0, 0, 'na', 0, 0, 120.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:08:46', '', '', 1),
(1306, '42179092', 'Nivea Men Fresh Active 4 sa 25ml', 2, 0, 0, 'na', 0, 0, 120.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:09:25', '', '', 1),
(1307, '42187608', 'Nivea Men Silver Protect 48h 25ml', 2, 0, 0, 'na', 0, 0, 120.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:10:03', 'Admin', '2025-05-08 00:10:11', 1),
(1308, '4005808888368', 'Nivea Men Extrabright 10x effect Foam 100g', 2, 0, 0, 'na', 0, 0, 430.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:11:02', '', '', 1),
(1309, '4005808196531', 'Nivea Men cool kick 24h fresh fffect 250 ml', 2, 0, 0, 'na', 0, 0, 580.00, 700.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:11:40', '', '', 1),
(1310, '4005808303427', 'Nivea Men cool Kick extra dry 10c 150 ml', 2, 0, 0, 'na', 0, 0, 385.00, 525.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:12:33', '', '', 1),
(1311, '4005900420091', 'Nivea Men Power 24h fresh effect 3in1 250 ml', 2, 0, 0, 'na', 0, 0, 580.00, 700.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 00:13:24', 'Admin', '2025-05-08 00:13:52', 1),
(1312, '8941174012241', 'Parachute Naturale Shampoo 320 ml', 2, 0, 0, 'na', 0, 0, 193.00, 265.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:22:08', '', '', 1),
(1313, '8941174012234', 'Parachute Naturale Shampoo Milk 320 ml', 2, 0, 0, 'na', 0, 0, 193.00, 265.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:22:54', '', '', 1),
(1314, '8941174012258', 'Parachute Naturale Shampoo Onion  Milk 320 ml', 2, 0, 0, 'na', 0, 0, 202.79, 265.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:23:41', '', '', 1),
(1315, '8941174012265', 'Parachute Naturale Shampoo EGG Shine 320 ml', 2, 0, 0, 'na', 0, 0, 193.00, 265.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:24:45', '', '', 1),
(1316, '8941174012227', 'Parachute Naturale Shampoo Care 320 ml', 2, 0, 0, 'na', 0, 0, 202.79, 265.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:25:37', '', '', 1),
(1317, '8941174012142', 'Parachute Naturale Shampoo Nourishing Care 160 ml', 2, 0, 0, 'na', 0, 0, 102.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:26:29', '', '', 1),
(1318, '8941174012166', 'Parachute Naturale Shampoo Damage Repairv160 ml', 2, 0, 0, 'na', 0, 0, 102.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:27:26', '', '', 1),
(1319, '8941174011695', 'Parachute Naturale Shampoo EGG Shine 170 ml', 2, 0, 0, 'na', 0, 0, 102.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:28:25', 'Admin', '2025-05-08 23:29:02', 1),
(1320, '8941174012159', 'Parachute Naturale Shampoo  Anti 160 ml', 2, 0, 0, 'na', 0, 0, 102.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:29:46', '', '', 1),
(1321, '8941174011305', 'Parachute Naturale Shampoo Onio 175 ml', 2, 0, 0, 'na', 0, 0, 109.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:30:33', '', '', 1),
(1322, '8941174010964', 'প্যারাসুট লীফূল  কোকোনাট হেয়ার অয়েল 230 মি', 2, 0, 0, 'na', 0, 0, 172.04, 220.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:32:41', '', '', 1),
(1323, '৮৯৪১১৭৪০১০৯৭১', 'প্যারাসুট লীফূল কোকোনাট হেয়ার অয়েল 300মি', 2, 0, 0, 'na', 0, 0, 226.00, 240.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:33:15', '', '', 1),
(1324, '8941174010186', 'Parachute Aloe Vera Hair Oil 250 ml', 2, 0, 0, 'na', 0, 0, 252.57, 290.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:34:22', '', '', 1),
(1325, '8941174010162', 'Parachute Aloe Vera Hair Oil 150ml', 2, 0, 0, 'na', 0, 0, 152.61, 195.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:35:01', '', '', 1),
(1326, '8941174012012', 'Parachute  Secrets Rosemary 200 ml', 2, 0, 0, 'na', 0, 0, 209.00, 260.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:35:55', '', '', 1),
(1327, '8941174011992', 'প্যারাসুট  বেলীফুল মাল্টি ভিটামিন 200 মি', 2, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:37:03', '', '', 1),
(1328, 'P01328', 'প্যারাসুট  নীল ও সবুজ ক্যাপে 350 মি', 2, 0, 0, 'na', 0, 0, 270.00, 390.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:38:43', '', '', 1),
(1329, 'P01329', 'প্যারাসুট নীল ও সবুজ ক্যাপে 200মি', 2, 0, 0, 'na', 0, 0, 173.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:39:41', '', '', 1),
(1330, '8941174012029', 'Parachute  Secrets Blackseed 200 ml', 2, 0, 0, 'na', 0, 0, 209.00, 260.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:40:44', '', '', 1),
(1331, '8941174012005', 'Parachute Secrets  Almond 200 ml', 2, 0, 0, 'na', 0, 0, 209.00, 260.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:41:35', '', '', 1),
(1332, '8941174010773', 'Parachute  Just for baby Oil 200 ml', 2, 0, 0, 'na', 0, 0, 326.00, 425.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:42:16', '', '', 1),
(1333, '8941174010780', 'Parachute Just for baby Oil 100ml', 2, 0, 0, 'na', 0, 0, 176.00, 230.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:42:58', '', '', 1),
(1334, '8941174010797', 'Parachute Just for baby   body & hair 200ml', 2, 0, 0, 'na', 0, 0, 230.00, 325.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:44:19', '', '', 1),
(1335, '8941174010803', 'Parachute Just for baby body & hair 100ml', 2, 0, 0, 'na', 0, 0, 166.21, 225.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:45:02', '', '', 1),
(1336, '8941174011091', 'Parachute Just for baby  shampoo 100 ml', 2, 0, 0, 'na', 0, 0, 190.00, 225.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:46:47', '', '', 1),
(1337, 'P01337', 'Saffron and Milk  Just for Baby  MikyGlow ', 2, 0, 0, 'na', 0, 0, 187.00, 265.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:48:25', '', '', 1),
(1338, 'P01338', 'Saffron and Milk Just for Baby Miky Glow S Mal', 2, 0, 0, 'na', 0, 0, 99.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-08 23:49:02', '', '', 1),
(1339, '8941174011930', 'Just for baby Orange Gel Toothpaste 3 pcs', 1, 0, 0, 'na', 0, 0, 73.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:50:22', '', '', 1),
(1340, 'P01340', 'Just for baby  MangoGel Toothpaste 3 pcs', 1, 0, 0, 'na', 0, 0, 73.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:51:21', '', '', 1),
(1341, '8941174010148', 'Parachute Extra Care Anti Hairfall Oil 300 ml', 1, 0, 0, 'na', 0, 0, 302.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:52:23', '', '', 1),
(1342, '8941174010155', 'Parachute Extra Care Anti Hairfall Oil 150ml', 2, 0, 0, 'na', 0, 0, 165.62, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:52:51', '', '', 1),
(1343, '8941174010124', 'Red King Fast Cooling Oil 200ml', 2, 0, 0, 'na', 0, 0, 212.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:53:28', '', '', 1),
(1344, '8941174010131', 'Red King Fast cooling Oil 100 ml', 2, 0, 0, 'na', 0, 0, 118.56, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:54:15', '', '', 1),
(1345, '8941174012135', 'Parachute  Amla Hair Oil 150 ml', 2, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-08 23:55:18', '', '', 1),
(1346, '8941100314432', 'Mirinda Orange Flavour 500 ml', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:06:54', '', '', 1),
(1347, '8941100318461', '7up 1 Liter', 1, 0, 0, 'na', 0, 0, 73.50, 60.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:07:49', 'Admin', '2025-07-05 12:07:19', 1),
(1348, '8941100313824', '7up 2 Liter', 1, 0, 0, 'na', 0, 0, 120.34, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:08:25', '', '', 1),
(1349, '8941100315439', 'Mountam Dew 500 ml', 1, 0, 0, 'na', 0, 0, 45.83, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:08:53', 'Admin', '2025-05-09 00:09:45', 1),
(1350, '8941100315408', 'Mountam Dew 200 ml', 1, 0, 0, 'na', 0, 0, 22.50, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:09:37', '', '', 1),
(1351, '8941100319406', 'Sting 200 ml', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:10:31', '', '', 1),
(1352, 'P01352', 'Mirinda Glues 200 ml', 1, 0, 0, 'na', 0, 0, 28.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:11:50', '', '', 1),
(1353, 'P01353', 'Pepsi Glues 200 ml', 1, 0, 0, 'na', 0, 0, 28.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:12:18', '', '', 1),
(1354, 'P01354', '7up glues 200 ml', 1, 0, 0, 'na', 0, 0, 28.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:12:39', '', '', 1),
(1355, 'P01355', 'Moundtam Dew 200 ml', 1, 0, 0, 'na', 0, 0, 28.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:13:02', '', '', 1),
(1356, '8941100311417', 'Pepsi morefizz 250 ml', 1, 0, 0, 'na', 0, 0, 22.50, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:13:54', 'Admin', '2025-05-09 00:14:03', 1),
(1357, '8941100311516', 'Pepsi Can 250 ml', 1, 0, 0, 'na', 0, 0, 50.00, 70.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:14:55', '', '', 1),
(1358, '8941100311431', 'Pepsi More Fizz 500 ml', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:15:36', '', '', 1),
(1359, '8941100311820', 'Pepsi More Fizz  1.75 Liter', 1, 0, 0, 'na', 0, 0, 120.34, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:16:16', '', '', 1),
(1360, '8941100313411', '7Up250 ml', 1, 0, 0, 'na', 0, 0, 18.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:16:44', '', '', 1),
(1361, '8941100313510', '7Up Can 250 ml', 1, 0, 0, 'na', 0, 0, 62.50, 70.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:17:33', '', '', 1),
(1362, '8941100313435', '7up 500 ml', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:19:56', '', '', 1),
(1363, '8941100314418', 'Mirinda 250 ml', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:20:56', '', '', 1),
(1364, '8941100310434', 'Aquafina  500 ml', 1, 0, 0, 'na', 0, 0, 10.42, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:21:30', '', '', 1),
(1365, '8902080504060', 'Aquafina 1.5 Liter', 1, 0, 0, 'na', 0, 0, 25.00, 35.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:22:18', 'Admin', '2025-07-06 17:39:35', 1),
(1366, '841165144853', 'Rose Water 200 ml', 1, 0, 0, 'na', 0, 0, 17.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:23:10', '', '', 1),
(1367, '841165146529', 'Kewra Water 200 ml', 1, 0, 0, 'na', 0, 0, 17.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:23:49', '', '', 1),
(1368, '846656011041', 'Salt Tasting Salt Monosodium 450g', 1, 0, 0, 'na', 0, 0, 138.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-09 00:24:52', '', '', 1),
(1369, 'P01369', 'Salt 20g', 1, 0, 0, 'na', 0, 0, 8.00, 11.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:25:56', '', '', 1),
(1370, '846656011034', 'Salt Tasting Salt Monosodium 100g', 1, 0, 0, 'na', 0, 0, 38.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:26:29', '', '', 1),
(1371, 'P01371', 'Salt 40 g', 1, 0, 0, 'na', 0, 0, 16.00, 22.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:27:26', '', '', 1),
(1372, '710535347449', 'Act ii ', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:28:34', '', '', 1),
(1373, '710535347456', 'ACT II 50 ml', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:29:23', '', '', 1),
(1374, '710535347470', 'ACT II 70 ml', 1, 0, 0, 'na', 0, 0, 32.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:29:51', '', '', 1),
(1375, '8901512142009', 'Sundrop Peanut Butter With Honey 200 g', 1, 0, 0, 'na', 0, 0, 225.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:30:40', '', '', 1),
(1376, '8901512141705', 'Sundrop Penaut Butter Regular 200 ml', 1, 0, 0, 'na', 0, 0, 225.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:31:26', '', '', 1),
(1377, '8941102467242', 'Lux Flaw Less Glow 100 ml', 1, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:32:31', '', '', 1),
(1378, '8941102467303', 'Lux dBright Glow Jasmine 150 ml', 1, 0, 0, 'na', 0, 0, 80.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 00:33:15', '', '', 1),
(1379, 'P01379', 'Egg', 1, 0, 0, 'na', 0, 0, 9.50, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:19:00', 'Admin', '2025-06-25 16:59:13', 1),
(1380, 'P01380', 'potato', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:19:27', '', '', 1),
(1381, 'P01381', 'Masoor Dal ', 1, 0, 0, 'na', 0, 0, 98.00, 115.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:20:46', '', '', 1),
(1382, 'P01382', 'Miniket Rice Loose', 1, 0, 0, 'na', 0, 0, 74.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:22:02', '', '', 1),
(1383, 'P01383', 'Rice 28', 1, 0, 0, 'na', 0, 0, 58.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:22:57', '', '', 1),
(1384, 'P01384', 'Deshi Peyaj', 1, 0, 0, 'na', 0, 0, 53.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:24:11', 'Admin', '2025-06-26 19:02:17', 1),
(1385, 'P01385', 'Garlic ', 1, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:25:59', '', '', 1),
(1386, 'P01386', 'Ginger', 1, 0, 0, 'na', 0, 0, 90.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 08:26:41', '', '', 1),
(1387, '846656017746', 'Mr Noodles 12 packs 744 g', 1, 0, 0, 'na', 0, 0, 200.00, 255.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 17:06:30', '', '', 1),
(1388, '841165131228', 'Mr Noodles Bagic Masala 28 Packs ', 1, 0, 0, 'na', 0, 0, 465.00, 525.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-09 17:15:27', '', '', 1),
(1389, '8941052011083', 'Rupchanda fortified Soyabean Oil 5 Liter', 1, 0, 0, 'na', 0, 0, 890.00, 900.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-10 12:58:15', 'Admin', '2025-05-22 11:56:20', 1),
(1390, '8941052011052', 'Rupchanda fortified Soyabean Oil 2 Liter', 1, 0, 0, 'na', 0, 0, 372.00, 378.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-10 13:00:52', '', '', 1),
(1391, '8941052011441', 'Rupchanda Fortified Soyadean Oil 1 Pli', 1, 0, 0, 'na', 0, 0, 184.00, 187.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-10 14:23:32', '', '', 1),
(1392, '859875003001', 'Mediplus Toothpaste 140 g', 2, 0, 0, 'na', 0, 0, 76.50, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-10 14:37:28', '', '', 1),
(1393, '859875003209', 'Mediplus Toothpaste 100g', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-10 14:38:26', '', '', 1),
(1394, '859875003032', 'Mediplus DS 140g', 2, 0, 0, 'na', 0, 0, 114.75, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-10 14:40:08', '', '', 1),
(1395, '841165120628', 'Mr. Noodles Chicken flavor 40g', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-10 14:52:13', '', '', 1),
(1396, 'P846656017746', 'Mr Noodles 12  Pack', 1, 0, 0, 'na', 0, 0, 210.00, 255.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-10 15:08:48', '', '', 1),
(1397, '8941193075012', 'Xtreme Mosquito Coil 15sec 10 Coil', 2, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-10 15:12:14', '', '', 1),
(1398, '8941196220037', 'ACI Pure Salt 1 kg', 1, 0, 0, 'na', 0, 0, 34.81, 42.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-10 15:19:30', 'Admin', '2025-05-20 14:44:14', 1),
(1399, '8941100514313', 'Tomato Katchup 350  ml', 1, 0, 0, 'na', 0, 0, 102.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-10 15:25:12', '', '', 1),
(1400, '8941100311462', 'pepsi 1 liter', 1, 0, 0, 'na', 0, 0, 73.50, 80.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-10 15:46:57', '', '', 1),
(1401, '8941100314463', 'Mirinda 1 Liter', 1, 0, 0, 'na', 0, 0, 82.67, 90.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 13:34:29', '', '', 1),
(1402, '8941100319765', 'Slice 200 ml', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 13:34:59', '', '', 1),
(1403, '831730006907', 'Pran Toas fresh & Crispy 250 g', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 13:46:43', '', '', 1),
(1404, '841165147502', 'Pran Potata 50g', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 13:48:05', '', '', 1),
(1405, '846656003480', 'Toast Sweet Rusr 200g', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 13:49:28', '', '', 1),
(1406, '846656012031', 'Mama Creamy Crunch ', 1, 0, 0, 'na', 0, 0, 28.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 13:51:01', '', '', 1),
(1407, '840205714230', 'Pran mama Rollaferbisuits  ', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 13:52:42', '', '', 1),
(1408, '8901499011381', 'Rolled Oats 900 g', 1, 0, 0, 'na', 0, 0, 585.00, 750.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:39:13', '', '', 1),
(1409, '8901499009135', 'Corn Flakes Original kellorggs 250 g', 1, 0, 0, 'na', 0, 0, 208.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:40:51', '', '', 1),
(1410, '8901499008183', 'Corn Flakes Original  Kelluggs 250 g', 1, 0, 0, 'na', 0, 0, 315.00, 360.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:41:55', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1411, '8901499008190', 'Corn Flakes Original Kelluggs 475 g', 1, 0, 0, 'na', 0, 0, 548.00, 630.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:42:25', '', '', 1),
(1412, '8901499011374', 'Oats Rolled Oats 400 g', 1, 0, 0, 'na', 0, 0, 280.00, 360.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:43:05', '', '', 1),
(1413, '8901499010728', 'Chocos Kelluggs 385g', 1, 0, 0, 'na', 0, 0, 397.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:43:52', '', '', 1),
(1414, '8901499010711', 'Chocos Kelluggs 250g', 1, 0, 0, 'na', 0, 0, 314.00, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:44:19', '', '', 1),
(1415, '8901499010704', 'Chocos Kelluggs 127g', 1, 0, 0, 'na', 0, 0, 140.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 14:44:49', '', '', 1),
(1416, '8941153056655', 'Amara chocolate 100 g', 1, 0, 0, 'na', 0, 0, 175.00, 220.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-11 16:43:50', 'Admin', '2025-07-02 10:32:09', 1),
(1417, '8941153056662', 'Fondalo Chocolate Bar 20g', 2, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-05-11 16:45:03', 'Admin', '2025-07-06 18:39:08', 1),
(1418, '8941153053180', 'Malted Crunchy Cookies 87 g', 2, 0, 0, 'na', 0, 0, 75.00, 90.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-11 16:45:45', '', '', 1),
(1419, '8941153053074', 'Fast choco Feel Center Filled Cookies ', 2, 0, 0, 'na', 0, 0, 56.00, 70.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-11 16:46:32', 'Admin', '2025-05-11 16:46:49', 1),
(1420, '8941153056648', 'Amora Chocolate 288 g', 1, 0, 0, 'na', 0, 0, 192.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 16:48:37', '', '', 1),
(1421, '831730007263', 'Pran Milk Cull Cream Milk Powder 400 g', 1, 0, 0, 'na', 0, 0, 610.00, 355.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-11 17:03:44', '', '', 1),
(1422, '840205723027', 'Pran Aktive Orange Flavored 200 ml', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:05:11', '', '', 1),
(1423, '831730000233', 'Pran Mango Frut Drink 200 ml', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:06:10', '', '', 1),
(1424, '840205723010', 'Aktive Lemon  200 ml', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:06:40', '', '', 1),
(1425, '831730007218', 'Pran Milk Full Cream Milk Powder 500 ml', 1, 0, 0, 'na', 0, 0, 390.00, 440.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:07:31', '', '', 1),
(1426, '8941170030300', 'Shezan Mango Fruit Drink 250 ml', 1, 0, 0, 'na', 0, 0, 18.00, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:27:13', '', '', 1),
(1427, '8941170031123', 'Aha  Cola 250 ml', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:28:17', '', '', 1),
(1428, '8941170020127', 'Dairy Land  Kids Lassee 100 ml', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:29:27', '', '', 1),
(1429, '8941133007806', 'Wings Carbonated Bevarage  250 ml', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:30:09', '', '', 1),
(1430, '8941170033110', 'Shezan Mango Fruit Drink 100 ml', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:31:17', '', '', 1),
(1431, '8941170030157', 'Shezan Mango Fruit Drinks ', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:32:18', '', '', 1),
(1432, '8941170030294', 'Shezan Mango Fruit Drinks 500 ml', 1, 0, 0, 'na', 0, 0, 34.00, 45.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:32:58', '', '', 1),
(1433, '8941170020516', 'Sajeeb Lassee 200 ml', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:34:02', '', '', 1),
(1434, '8941170030287', 'Shezan Mango Fruit Drinks 1Liter', 1, 0, 0, 'na', 0, 0, 58.00, 80.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:34:58', '', '', 1),
(1435, '8941170014614', 'Sajeeb Egg Noodles 120 g', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:38:03', '', '', 1),
(1436, '8941170014621', 'Sajeeb Chicken Tandoori Noodles 150 g', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:39:52', '', '', 1),
(1437, '8941170014942', 'Kolson Macaroni 400 g', 1, 0, 0, 'na', 0, 0, 72.00, 85.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:43:12', '', '', 1),
(1438, '8941170014041', 'Kolson Macaroni Assorted Pack 300 g', 1, 0, 0, 'na', 0, 0, 56.00, 65.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:45:08', '', '', 1),
(1439, '8941170014935', 'Macaroni Kolson 200 ml', 1, 0, 0, 'na', 0, 0, 38.00, 45.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:49:07', '', '', 1),
(1440, '8941170038757', 'Shezen Mango Bar ', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:53:11', '', '', 1),
(1441, '8941170007449', 'Sajeeb Choco Moo ', 1, 0, 0, 'na', 0, 0, 145.00, 175.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 17:59:28', '', '', 1),
(1442, '8941170007845', 'Sajeeb Choco Moo  250 g', 1, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 18:00:21', '', '', 1),
(1443, '8941170034162', 'Sajeeb Pure Isobgul Bhushi 20 g', 1, 0, 0, 'na', 0, 0, 52.00, 60.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 18:01:14', '', '', 1),
(1444, '8941170034186', 'Sajeeb Pure Isobgul Bhushi 75g', 1, 0, 0, 'na', 0, 0, 178.00, 200.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 18:02:24', '', '', 1),
(1445, '8941170011040', 'TOP Tasting Salt 100 g', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-11 18:03:30', '', '', 1),
(1446, '8851932287548', 'Vaseline Healthy Bright UV Extra Brghtening 400ml', 2, 0, 0, 'na', 0, 0, 692.00, 900.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 18:40:44', '', '', 1),
(1447, '8906189770661', 'Lifebouoy 200 ml', 2, 0, 0, 'na', 0, 0, 83.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 18:41:31', '', '', 1),
(1448, '8906189770685', 'Lifebuoy 200 ml', 2, 0, 0, 'na', 0, 0, 83.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 18:49:45', 'Admin', '2025-05-11 18:50:49', 1),
(1450, '8941102463466', 'Lifebuoy 170 Pl Hand w', 2, 0, 0, 'na', 0, 0, 61.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 18:54:23', 'Admin', '2025-05-11 18:55:07', 1),
(1451, '8941102463237', 'Lifebuoy 100 ml', 2, 0, 0, 'na', 0, 0, 49.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-11 18:56:02', '', '', 1),
(1452, '8941102461837', 'Vaseline Daily Brightening 48Hr300 ml', 2, 0, 0, 'na', 0, 0, 351.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-11 18:57:32', '', '', 1),
(1453, '8901030957031', 'Vaseline Healthy Bright Gluta -Hya 200 ml', 2, 0, 0, 'na', 0, 0, 557.00, 725.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-11 18:59:36', 'Admin', '2025-05-11 19:00:58', 1),
(1454, '8901030957048', 'Vaseline  Gluta Hya Dewy radiance 200 ml', 2, 0, 0, 'na', 0, 0, 538.00, 700.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-11 19:01:49', '', '', 1),
(1455, '8941102466962', 'Surf Excel 500 g', 2, 0, 0, 'na', 0, 0, 108.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-11 19:03:37', '', '', 1),
(1456, '840205717101', 'Divino Chocolate Smile Box ', 1, 0, 0, 'na', 0, 0, 180.00, 220.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-12 13:45:43', '', '', 1),
(1457, '840205717125', 'Divino Chocolate Little Angel ', 1, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-12 13:46:27', '', '', 1),
(1458, '840205717095', 'Divino Chocolate ', 1, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-12 13:47:16', '', '', 1),
(1459, '841165112449', 'Pran Lacchi 200 ml', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-12 14:09:03', '', '', 1),
(1460, '831730001186', 'Pran Up 250 ml', 1, 0, 0, 'na', 0, 0, 18.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-12 14:10:43', '', '', 1),
(1461, '831730009403', 'Pran  Frooto Mango fruit Drink 250 ml', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-12 14:14:05', '', '', 1),
(1462, '831730009489', 'Pran Frooto Mango Fruit Drink 500 ml', 1, 0, 0, 'na', 0, 0, 37.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:17:05', '', '', 1),
(1463, '831730009755', 'Pran Frooto Mango fruit Drink 1 L B', 1, 0, 0, 'na', 0, 0, 52.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:18:05', '', '', 1),
(1464, 'P01464', 'Chocolate Coated Bar ', 1, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-12 14:31:57', '', '', 1),
(1465, 'P01465', 'Maxx Cola 200 ml', 1, 0, 0, 'na', 0, 0, 18.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-12 14:38:08', '', '', 1),
(1466, 'P01466', 'Drinko float 20 ml', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-12 14:38:48', '', '', 1),
(1467, '745114130778', 'Dry Cake Biscuits 130 g', 1, 0, 0, 'na', 0, 0, 63.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:43:31', '', '', 1),
(1468, '745114131386', 'Nut and cream 100 g', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:45:29', '', '', 1),
(1469, '745114130907', 'Butter Bite Biscuits 165 g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:46:44', '', '', 1),
(1470, '745114130785', 'Marie Gold Biscuits  190 g', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:47:38', '', '', 1),
(1471, '745114130822', 'Saltes Classic Biscuites 200g', 1, 0, 0, 'na', 0, 0, 37.33, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:48:29', '', '', 1),
(1472, '745114130341', 'Biscotti Cookies 160 g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:49:12', '', '', 1),
(1473, '745114130938', 'tim tim Cream Biscuits 140 g', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:52:27', '', '', 1),
(1474, '745114131133', 'Multi Grain 160 g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:53:24', '', '', 1),
(1475, '745114131744', 'Nice Biscuits 170 g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:55:06', '', '', 1),
(1476, '745114133182', 'Dry Cake Marble Biscuits 270 g', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:56:41', '', '', 1),
(1477, '745114131317', 'Biscotti Cookies 80g', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:57:48', '', '', 1),
(1478, '745114133359', 'Sweet Fantasy Chocolate Filled Cookies ', 1, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-12 14:59:00', '', '', 1),
(1479, '8941193314036', 'Ispahani Mirzapore Tea Bags 100g', 1, 0, 0, 'na', 0, 0, 74.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:46:54', '', '', 1),
(1480, '8941193314067', 'Premium Green Tea 35 g', 1, 0, 0, 'na', 0, 0, 90.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:47:55', '', '', 1),
(1481, '8941193314555', 'Ispahani Mirzapore Best Leaf Tea 400g', 1, 0, 0, 'na', 0, 0, 192.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:48:52', '', '', 1),
(1482, '8941193314548', 'Ispahani Mirzapore Best Leaf Tea 200g', 1, 0, 0, 'na', 0, 0, 97.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:49:31', '', '', 1),
(1483, '8997212800318', 'Fox\'s Crystal Clear Fruits', 1, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:57:44', 'Admin', '2025-06-24 16:58:05', 1),
(1484, '8997212800288', 'Fox\'s Crystal Clear Fruits Jar', 1, 0, 0, 'na', 0, 0, 260.00, 570.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:58:28', '', '', 1),
(1485, '8997212800295', 'Fox\'s Crystal Clear Berries jar', 1, 0, 0, 'na', 0, 0, 285.00, 345.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 12:59:29', 'Admin', '2025-06-24 18:39:01', 1),
(1486, '8857101157889', 'Blackhead Remover Mask 50 g', 2, 0, 0, 'na', 0, 0, 304.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 14:16:02', '', '', 1),
(1487, '8857101159784', 'Blackhead Remover Mask 100 g', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 14:16:45', '', '', 1),
(1488, 'P01488', 'Sajeeb Soya Saucc', 1, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 14:56:09', '', '', 1),
(1489, '6917554958340', 'Petra Fleiv Potato Chips 100g', 1, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:28:36', '', '', 1),
(1490, '6917554958333', 'Patra Fleiv Potato sour Cream & Onior', 1, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:30:28', '', '', 1),
(1491, '6917554958319', 'Petra Fleiv Potato Chips Original100g', 1, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:31:22', '', '', 1),
(1492, '8858223005683', 'Wafer Stik', 1, 0, 0, 'na', 0, 0, 280.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:34:42', '', '', 1),
(1493, '8858223010328', 'Wafer Stik 125 g', 1, 0, 0, 'na', 0, 0, 280.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:36:24', '', '', 1),
(1494, '8887290006088', 'Klassno Gold ', 1, 0, 0, 'na', 0, 0, 540.00, 640.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:37:21', '', '', 1),
(1495, '8887290006125', 'Klassno Rich 100g', 1, 0, 0, 'na', 0, 0, 450.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:38:10', '', '', 1),
(1496, '8887290006217', 'Klassno Gold 50 g', 1, 0, 0, 'na', 0, 0, 310.00, 390.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-13 15:39:41', '', '', 1),
(1497, '8887290006194', 'Klassno Rich Premum Blend 50g ', 1, 0, 0, 'na', 0, 0, 260.00, 330.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:43:01', '', '', 1),
(1498, '8852805020262', 'Tom Yum12g', 1, 0, 0, 'na', 0, 0, 24.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:43:58', '', '', 1),
(1499, '8852805020255', 'Chicken 12g', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:44:47', '', '', 1),
(1500, '8513692165329', 'Sandalina Sandal & Rose 100g', 2, 0, 0, 'na', 0, 0, 52.00, 58.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:45:48', '', '', 1),
(1501, '8513692165459', 'Sandalina Sandal & Rose 150g', 2, 0, 0, 'na', 0, 0, 61.66, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:46:48', '', '', 1),
(1502, '8513692165404', 'Sandalina Sandal & Moisturiser 125g', 2, 0, 0, 'na', 0, 0, 58.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:49:12', '', '', 1),
(1503, '8513690101251', 'Sandalina Sandal & rose 75g', 2, 0, 0, 'na', 0, 0, 36.15, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 15:49:49', '', '', 1),
(1504, '8941100648490', 'Pure It  Classic 23 Litres', 2, 0, 0, 'na', 0, 0, 4800.00, 4999.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-13 20:23:09', '', '', 1),
(1505, '846656007990', 'Chicken Nuggets 300g', 1, 0, 0, 'na', 0, 0, 205.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:27:40', '', '', 1),
(1506, '840205737109', 'Spicy Chicken Sausage 250 g', 1, 0, 0, 'na', 0, 0, 168.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:28:23', '', '', 1),
(1507, '846656012666', 'Deshi Paratha 10 pcs', 1, 0, 0, 'na', 0, 0, 142.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:28:59', '', '', 1),
(1508, '841165120840', 'Deshi Paratha Family Pack ', 1, 0, 0, 'na', 0, 0, 261.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:29:48', '', '', 1),
(1509, '846656007068', 'Paratha Low Fat 10pcs', 1, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:30:25', '', '', 1),
(1510, '841165101993', 'Plain Paratha Family Pack 20 pc', 1, 0, 0, 'na', 0, 0, 308.00, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:30:59', '', '', 1),
(1511, '840205716371', 'Paratha Low Fat 20 pcs', 1, 0, 0, 'na', 0, 0, 210.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:31:28', 'Admin', '2025-05-14 10:00:37', 1),
(1512, '841165109944', 'Chicken Sausage 340 g', 1, 0, 0, 'na', 0, 0, 215.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:32:18', '', '', 1),
(1513, '846656007464', 'Roti Chapati Family Pack 1000g', 1, 0, 0, 'na', 0, 0, 133.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:34:20', '', '', 1),
(1514, '841165121779', 'French Fry 500 g', 1, 0, 0, 'na', 0, 0, 166.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:34:53', '', '', 1),
(1515, '840205740871', 'Spicy Chicken Sausage 1 g', 1, 0, 0, 'na', 0, 0, 580.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:35:50', '', '', 1),
(1516, '840205721245', 'Chicken Meat Ball 1 g', 1, 0, 0, 'na', 0, 0, 452.00, 540.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:36:37', '', '', 1),
(1517, '840205721252', 'Chicken Meat Ball  500g', 1, 0, 0, 'na', 0, 0, 240.00, 285.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:37:10', '', '', 1),
(1518, '840205721283', 'chicken Nuggets  1000 g', 1, 0, 0, 'na', 0, 0, 540.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:38:11', '', '', 1),
(1519, '841165131266', 'Chicken Momo 250 g', 1, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:39:33', '', '', 1),
(1520, '840205708376', 'Chicken Lollipop 350 g', 1, 0, 0, 'na', 0, 0, 248.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:40:11', '', '', 1),
(1521, '841165144082', 'Chicken Shami Kabab 250 g', 1, 0, 0, 'na', 0, 0, 217.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:40:48', '', '', 1),
(1522, '841165109050', 'Chicken Mini Spring roll 200g', 1, 0, 0, 'na', 0, 0, 166.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:41:21', '', '', 1),
(1523, '846656005835', 'Spring Roll Vegetable 360 g', 1, 0, 0, 'na', 0, 0, 116.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:42:07', '', '', 1),
(1524, '846656006665', 'Vegetable Singara 400g', 1, 0, 0, 'na', 0, 0, 105.00, 125.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:45:05', '', '', 1),
(1525, '841165122813', 'Chicken Strips 250 g', 1, 0, 0, 'na', 0, 0, 233.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:45:31', '', '', 1),
(1526, '846656005774', 'Dal Puri 454g', 1, 0, 0, 'na', 0, 0, 117.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:46:06', '', '', 1),
(1527, '846656005767', 'Aloo Puri 454g ', 1, 0, 0, 'na', 0, 0, 117.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:46:44', '', '', 1),
(1528, '841165126132', 'Chicken Meat Ball 250 g', 1, 0, 0, 'na', 0, 0, 163.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:47:19', '', '', 1),
(1529, '846656010594', 'Chicken Mini Samosa 250 g', 1, 0, 0, 'na', 0, 0, 180.00, 215.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:47:51', '', '', 1),
(1530, '840205755745', 'Party Box 1000g', 1, 0, 0, 'na', 0, 0, 525.00, 630.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:51:07', '', '', 1),
(1531, '841165115662', 'chicken Pizza 200g', 1, 0, 0, 'na', 0, 0, 172.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:51:44', '', '', 1),
(1532, '840205721658', 'Chicken Momo 1000g', 1, 0, 0, 'na', 0, 0, 600.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 09:52:13', '', '', 1),
(1533, '8941189600112', 'Clemon 200 ml', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:38:19', '', '', 1),
(1534, '8941189600020', 'Mojo 250 ml', 1, 0, 0, 'na', 0, 0, 31.38, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:38:55', 'Admin', '2025-06-18 12:57:42', 1),
(1535, '8941189600273', 'Speed 250 ml', 1, 0, 0, 'na', 0, 0, 38.22, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:39:30', 'Admin', '2025-06-18 12:59:28', 1),
(1536, '8941158112554', 'Nutrilife  cranberry160 ml', 1, 0, 0, 'na', 0, 0, 52.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:45:59', 'Admin', '2025-07-07 12:23:58', 1),
(1537, '8906038710381', 'Nutrilife Osrange 160 ml', 1, 0, 0, 'na', 0, 0, 36.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:46:59', 'Admin', '2025-07-07 12:01:15', 1),
(1538, '8906038710398', 'Nutrilife Mango 160 ml', 1, 0, 0, 'na', 0, 0, 36.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:47:40', '', '', 1),
(1539, '8906038710367', 'Nutrilife apple 160 ml', 1, 0, 0, 'na', 0, 0, 36.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 14:48:45', '', '', 1),
(1540, '8906038710077', 'Nutrilife apple Fruiit juice 1 Litre', 1, 0, 0, 'na', 0, 0, 240.00, 295.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-14 14:51:22', 'Admin', '2025-07-07 12:05:37', 1),
(1541, '8906038710299', 'Nutrilife Cranberry Fruit Juice 1 Litre', 1, 0, 0, 'na', 0, 0, 290.00, 350.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-14 14:52:51', 'Admin', '2025-07-07 12:05:16', 1),
(1542, '8906038710121', 'Nutrilife Guava Fruit Juice 1 Litre', 1, 0, 0, 'na', 0, 0, 240.00, 295.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-14 14:55:07', 'Admin', '2025-07-07 12:06:31', 1),
(1543, '8906038710107', 'Nutrilife Mango 1 Litre', 1, 0, 0, 'na', 0, 0, 240.00, 295.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-14 14:56:20', '', '', 1),
(1544, '8906038710268', 'Nutrilife Pomegranate 1 Litre ', 1, 0, 0, 'na', 0, 0, 240.00, 295.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-14 14:57:33', 'Admin', '2025-07-07 12:06:02', 1),
(1545, '8901058016116', 'KitKat ', 1, 0, 0, 'na', 0, 0, 36.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:16:58', '', '', 1),
(1546, '8901058904741', 'Kitkat Big', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:18:31', 'Admin', '2025-07-09 16:25:57', 1),
(1547, '710535035094', 'Marks Full Cream Milk Powder 100 g', 1, 0, 0, 'na', 0, 0, 90.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:22:57', '', '', 1),
(1548, '725765165978', 'Star Ship Full Cream Milk Powder 1liter', 1, 0, 0, 'na', 0, 0, 645.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:24:44', '', '', 1),
(1549, '710535035032', 'Marks Full Cream Milk Powder 1 Liter', 1, 0, 0, 'na', 0, 0, 828.00, 900.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:25:18', '', '', 1),
(1550, '710535035056', 'Marks Full Cream Milk Powder 500 g', 1, 0, 0, 'na', 0, 0, 416.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:25:58', '', '', 1),
(1551, '710535035230', 'AMA Full Cream Milk Powder 1 Liter', 1, 0, 0, 'na', 0, 0, 741.00, 820.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:26:39', '', '', 1),
(1552, '710535035674', 'Seylon Family Blend 400g', 1, 0, 0, 'na', 0, 0, 178.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:27:16', '', '', 1),
(1553, '725765165992', 'Star Ship Full Cream Milk Powder 500g', 1, 0, 0, 'na', 0, 0, 330.00, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:27:53', '', '', 1),
(1554, '710535035308', 'Seylon Bop 500 g', 1, 0, 0, 'na', 0, 0, 175.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:28:27', '', '', 1),
(1555, '710535035322', 'Seylon gold Tea 100g', 1, 0, 0, 'na', 0, 0, 65.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:29:19', '', '', 1),
(1556, '725765165930', 'Star Ship Full Cream Milk Powder 250g', 1, 0, 0, 'na', 0, 0, 167.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:29:54', '', '', 1),
(1557, '710535035087', 'Marks Full  Cream Milk Powder 200g', 1, 0, 0, 'na', 0, 0, 174.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:30:45', '', '', 1),
(1558, '725765165428', 'Aura 500 g', 1, 0, 0, 'na', 0, 0, 335.00, 385.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:31:49', '', '', 1),
(1559, '725765165411', 'Seylon Instant Milk Tea', 1, 0, 0, 'na', 0, 0, 7.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:32:27', '', '', 1),
(1560, '710535035155', 'Marks Full Cream Milk Powder 400 g', 1, 0, 0, 'na', 0, 0, 336.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 15:51:04', '', '', 1),
(1561, '৮৯৪১১০০৫১৪৭২৬', 'রুচি আমের আচার 400 গ্রাম', 1, 0, 0, 'na', 0, 0, 158.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:27:18', '', '', 1),
(1562, '৮৯৪১১০০৫১৪৭৪০', 'রুচি জলিপাই আচার', 1, 0, 0, 'na', 0, 0, 158.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-14 16:28:54', '', '', 1),
(1563, '8941133201013', 'Avonee Pants L 34 pcs', 2, 0, 0, 'na', 0, 0, 610.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:33:28', 'Admin', '2025-07-02 14:21:58', 1),
(1564, '8941133201020', 'Avonee Pants m 40 pcs ', 2, 0, 0, 'na', 0, 0, 610.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:34:07', 'Admin', '2025-07-02 14:19:33', 1),
(1565, '8941133201037', 'Avonee Pants S 42 pcs', 2, 0, 0, 'na', 0, 0, 610.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:35:04', 'Admin', '2025-07-02 14:21:20', 1),
(1566, '8941133201051', 'Avonee Pants xxl 24 pcs', 2, 0, 0, 'na', 0, 0, 610.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:35:36', 'Admin', '2025-07-02 14:20:31', 1),
(1567, '8941133201044', 'Avonee Pants XL 32  pcs', 2, 0, 0, 'na', 0, 0, 610.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:36:19', 'Admin', '2025-07-02 14:22:40', 1),
(1568, '8941133201082', 'Avonee Pants 5 pcs', 2, 0, 0, 'na', 0, 0, 89.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:36:53', '', '', 1),
(1569, '8941133201075', 'Avonee Pants M 5 pcs ', 2, 0, 0, 'na', 0, 0, 89.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:37:50', '', '', 1),
(1570, '8941133201105', 'Avonee Pants  XXL 4 Pcs ', 2, 0, 0, 'na', 0, 0, 89.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:38:26', '', '', 1),
(1571, '8941133201099', 'Avonee Pants Xl 4 pcs', 2, 0, 0, 'na', 0, 0, 89.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:38:59', 'Admin', '2025-05-14 16:39:18', 1),
(1572, '8941133201068', 'Avonee Pants L 5 pcs', 2, 0, 0, 'na', 0, 0, 89.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-14 16:39:57', '', '', 1),
(1573, '8941160231052', 'Acme Packaged Drinking Water 2 L B', 1, 0, 0, 'na', 0, 0, 27.00, 40.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-15 10:09:30', '', '', 1),
(1574, '8941160231021', 'Acme Packaged Drinking Water 500ml B', 1, 0, 0, 'na', 0, 0, 10.00, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-15 10:11:12', '', '', 1),
(1575, '8941160231038', 'Acme Packaged Drinking Water 1 L B', 1, 0, 0, 'na', 0, 0, 17.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-15 10:11:51', '', '', 1),
(1576, '8941160231106', 'ACME Aamli Mango Frut Drings 1 L B', 1, 0, 0, 'na', 0, 0, 70.00, 90.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-15 10:12:56', '', '', 1),
(1577, '8941160231090', 'ACME Aamli Mango Frut Drings 500 ml B', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-15 10:14:10', '', '', 1),
(1578, '8802540410835', 'Acme Premium Mango  250 ml', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-15 10:16:42', '', '', 1),
(1579, '8802551108011', 'Gree Star 1 kg', 1, 0, 0, 'na', 0, 0, 180.00, 215.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-15 11:41:06', '', '', 1),
(1580, '8133358131026', 'ACME Classic Mango Fruit dring  250 ml', 1, 0, 0, 'na', 0, 0, 29.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-15 12:29:22', '', '', 1),
(1581, '745604877602', 'starship 200 ml', 1, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:35:55', '', '', 1),
(1582, '725765165176', 'starship mango fruit drink 500 ml', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:37:22', '', '', 1),
(1583, '725765165183', 'starship sahi lacci 125ml', 1, 0, 0, 'na', 0, 0, 12.00, 15.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:38:31', '', '', 1),
(1584, '710535035742', 'Marks Active School 125ml', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:39:39', '', '', 1),
(1585, '710535035513', 'Star Ship Mango Drinkls 1000ml', 1, 0, 0, 'na', 0, 0, 0.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:40:47', '', '', 1),
(1586, '710535035803', 'mARKS ACTIVE SCHOOL 200 ML', 1, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:42:40', '', '', 1),
(1587, '710535035377', 'STAE SHIP MANGO DRINKS 200 ML', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:43:31', '', '', 1),
(1588, '710535035148', 'MARKS ACTIVE SCHOOL CHHOCOLATE  200 ML', 1, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:45:24', '', '', 1),
(1589, '725765165039', 'Star Ship mango drinks 200 ML', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:46:32', '', '', 1),
(1590, '710535035391', 'mango fruit drink 125 ml', 1, 0, 0, 'na', 0, 0, 12.00, 15.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:47:53', '', '', 1),
(1591, '725765165008', 'star ship mango fruit drinks 200 ml', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:48:55', '', '', 1),
(1592, '710535035476', 'star ship milk chocolate125 ml', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:50:04', '', '', 1),
(1593, '710535035827', 'marks active school strawberry 125 ml', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:51:06', '', '', 1),
(1594, '710535035834', 'marks active school cookies 125 ml', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:52:16', '', '', 1),
(1595, '710535035384', 'star ship milk chocolate 200 ml', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:53:14', '', '', 1),
(1596, '710535035810', 'active school school cookies 200 ml', 1, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:54:16', '', '', 1),
(1597, '745604877596', 'marks cafa late 125 ml', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:55:05', '', '', 1),
(1598, '725765165022', 'shaad orange drinks 125 ml', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:57:00', '', '', 1),
(1599, '725765165015', 'star ship litchi drinks 125 ml', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 12:58:17', '', '', 1),
(1600, '8941160255249', 'Let Me glow Clean Protect Hand Wash 370 ml', 2, 0, 0, 'na', 0, 0, 196.00, 245.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:23:23', '', '', 1),
(1601, '8941160255393', 'Let me glow Alvender Essenco 125 ml', 2, 0, 0, 'na', 0, 0, 204.00, 255.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:24:16', '', '', 1),
(1602, '8941160255409', 'royal Oud Talcum Powder 125 g', 2, 0, 0, 'na', 0, 0, 190.00, 255.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:24:52', 'Admin', '2025-06-26 12:14:04', 1),
(1603, '8941160255058', 'Clean & protect Hand Wash Neem 370 ml', 2, 0, 0, 'na', 0, 0, 196.00, 245.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:26:19', '', '', 1),
(1604, '8941160255034', 'Clean & protect Hand Wash Orange 370 ml', 2, 0, 0, 'na', 0, 0, 196.00, 245.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:27:15', '', '', 1),
(1605, '8941160255102', 'Oil Clontrol Facial Cleanser 100 ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:27:56', '', '', 1),
(1606, '8941160255041', 'clean & protec Hand Wash 370 mll', 2, 0, 0, 'na', 0, 0, 196.00, 245.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:28:52', '', '', 1),
(1607, '806360081976', 'Lotus Herbals  Youthr ', 2, 0, 0, 'na', 0, 0, 1025.00, 1250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:31:08', '', '', 1),
(1608, '8941160255270', 'levender rain shower gel 500 ml', 2, 0, 0, 'na', 0, 0, 592.00, 740.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:32:54', '', '', 1),
(1609, '8941160255294', 'ocean blur sower gel 250 ml', 2, 0, 0, 'na', 0, 0, 308.00, 385.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:33:59', '', '', 1),
(1610, '8941160255263', 'ocean blue shower gel 500 ml', 2, 0, 0, 'na', 0, 0, 592.00, 740.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:35:09', '', '', 1),
(1611, '8941160255324', 'levender rain sower gel 250 ml', 2, 0, 0, 'na', 0, 0, 308.00, 385.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:36:02', '', '', 1),
(1612, '8941160255119', 'vitamin c facial cleanser 100 ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:38:05', '', '', 1),
(1613, '3616303842154', 'fresh endurance 50 ml', 2, 0, 0, 'na', 0, 0, 292.00, 365.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:40:10', '', '', 1),
(1614, '8941160255416', 'icy aqua 125 gram', 2, 0, 0, 'na', 0, 0, 204.00, 255.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:41:07', '', '', 1),
(1615, '8941160255348', 'grape splash shower gel 500 ml', 2, 0, 0, 'na', 0, 0, 592.00, 740.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:42:31', '', '', 1),
(1616, '8941160255089', 'neem facial cleaner 100 ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:43:20', '', '', 1),
(1617, '8941160255256', 'morning boost shower gel 500 ml', 2, 0, 0, 'na', 0, 0, 592.00, 740.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:44:49', '', '', 1),
(1618, '8941160255379', 'yellow venus talcum powder 125 gm', 2, 0, 0, 'na', 0, 0, 190.00, 255.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:47:21', 'Admin', '2025-06-26 12:10:58', 1),
(1619, '8941160255355', 'intense oud shower gel 500ml', 2, 0, 0, 'na', 0, 0, 592.00, 740.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:48:31', '', '', 1),
(1620, '8941160255317', 'morning boost shower gel 250 ml', 2, 0, 0, 'na', 0, 0, 308.00, 385.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:49:42', '', '', 1),
(1621, '8941160255331', 'grape splash shower gel 250ml', 2, 0, 0, 'na', 0, 0, 308.00, 385.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:51:06', '', '', 1),
(1622, '8941160255386', 'cheery charm talcum powder 125 gm', 2, 0, 0, 'na', 0, 0, 190.00, 255.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:52:18', 'Admin', '2025-06-26 12:14:29', 1),
(1623, '8941160255362', 'intense oud shower gel', 2, 0, 0, 'na', 0, 0, 308.00, 385.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:53:16', '', '', 1),
(1624, '3616303439965', 'intensive perspirant ', 2, 0, 0, 'na', 0, 0, 292.00, 365.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:55:48', '', '', 1),
(1625, '8941160255065', 'tea tree facial cleanser 100ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:56:51', '', '', 1),
(1626, '8941160255096', 'facial foam 100ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:57:58', '', '', 1),
(1627, '806360008058', 'lotus herbals white glow 35g', 2, 0, 0, 'na', 0, 0, 492.00, 580.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 13:59:05', 'Admin', '2025-06-26 15:10:04', 1),
(1628, '806360270400', 'lotus hearbals white glow night cream 40g', 2, 0, 0, 'na', 0, 0, 476.00, 570.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:00:21', '', '', 1),
(1629, '3616303439972', 'pro invisable 50 ml', 2, 0, 0, 'na', 0, 0, 292.00, 365.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:01:21', '', '', 1),
(1630, '806360561201', 'lotus jojo wash120 g', 2, 0, 0, 'na', 0, 0, 480.00, 585.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:03:13', '', '', 1),
(1631, '8941160255027', 'surma tea 200 g', 2, 0, 0, 'na', 0, 0, 90.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:04:02', '', '', 1),
(1632, '8941160255010', 'surma tea 400 g', 2, 0, 0, 'na', 0, 0, 172.00, 210.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:04:59', '', '', 1),
(1633, '806360531204', 'lotus neem face  wash 120g', 2, 0, 0, 'na', 0, 0, 460.00, 560.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:06:03', 'Admin', '2025-07-10 11:36:03', 1),
(1634, '806360651209', 'lotus teatree  face wash 120g', 2, 0, 0, 'na', 0, 0, 460.00, 560.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:07:06', 'Admin', '2025-07-10 11:36:44', 1),
(1635, '806360005491', 'lotus white glow 100g', 2, 0, 0, 'na', 0, 0, 443.00, 540.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:08:13', '', '', 1),
(1636, '806360751008', 'lotus safe sun 100g', 2, 0, 0, 'na', 0, 0, 828.00, 980.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:09:30', '', '', 1),
(1637, '806360008041', 'white glow gel cream 35g', 2, 0, 0, 'na', 0, 0, 402.00, 490.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:10:46', '', '', 1),
(1638, '3616303842130', 'fresh endurance long lasting 50 ml', 2, 0, 0, 'na', 0, 0, 292.00, 365.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:13:24', '', '', 1),
(1639, '806360009338', 'purglow face wash 100 g', 2, 0, 0, 'na', 0, 0, 492.00, 600.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:14:26', '', '', 1),
(1640, '806360750506', 'lotus safe sun 50g', 2, 0, 0, 'na', 0, 0, 545.00, 665.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:15:17', '', '', 1),
(1641, '3616303439941', 'fresh 50 ml', 2, 0, 0, 'na', 0, 0, 292.00, 365.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:17:05', '', '', 1),
(1642, '806360681008', 'lotus matte look daily sunscreen 100g', 2, 0, 0, 'na', 0, 0, 705.00, 950.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:18:51', 'Admin', '2025-06-26 15:01:02', 1),
(1643, '806360341001', 'safe sun sunscreen cream 100g', 2, 0, 0, 'na', 0, 0, 668.00, 815.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:20:39', '', '', 1),
(1644, '8941160255072', 'milk extract 100ml', 2, 0, 0, 'na', 0, 0, 220.00, 275.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:22:30', '', '', 1),
(1645, '806360680506', 'lotus safe sun 50ng', 2, 0, 0, 'na', 0, 0, 487.00, 595.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:23:51', 'Admin', '2025-06-26 15:01:23', 1),
(1646, '703878000508', 'fade out night skin care 50 ml', 2, 0, 0, 'na', 0, 0, 904.00, 1130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:25:51', '', '', 1),
(1647, '703878000157', 'antiwrinkle whitening night cream 50ml', 2, 0, 0, 'na', 0, 0, 944.00, 1180.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:27:23', '', '', 1),
(1648, '703878000140', 'aiti winklw whitening day cream 50 ml', 2, 0, 0, 'na', 0, 0, 944.00, 1180.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:28:17', '', '', 1),
(1649, '703878000492', 'collagagen boost whitening day cream', 2, 0, 0, 'na', 0, 0, 904.00, 1130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:29:17', '', '', 1),
(1650, '703878000768', 'pure glow whitening night cream 50 ml', 2, 0, 0, 'na', 0, 0, 860.00, 1075.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:30:41', '', '', 1),
(1651, '806360130506', 'papaya blem 50 g', 2, 0, 0, 'na', 0, 0, 628.00, 765.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:32:01', 'Admin', '2025-06-26 14:59:12', 1),
(1652, '703878200038', 'advance whitening night cream 50 ml', 2, 0, 0, 'na', 0, 0, 860.00, 1075.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:33:23', '', '', 1),
(1653, '703878000751', 'pure glow whitening day cream 50 ml', 2, 0, 0, 'na', 0, 0, 860.00, 1075.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:34:41', 'Admin', '2025-05-15 14:35:21', 1),
(1654, '703878200021', 'advance whitening day cream niacinamide mul berry 50 ml', 2, 0, 0, 'na', 0, 0, 860.00, 1075.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-15 14:36:51', '', '', 1),
(1655, '8855362001040', 'Fish Sauce 1', 1, 0, 0, 'na', 0, 0, 150.00, 260.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-16 09:06:04', '', '', 1),
(1656, '717273501577', 'American Garden BBQ Sauce', 1, 0, 0, 'na', 0, 0, 200.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-16 09:07:08', '', '', 1),
(1657, '6292848617111', 'Royal Pitted Black  Olives ', 1, 0, 0, 'na', 0, 0, 230.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-16 09:08:22', '', '', 1),
(1658, '8850124011053', 'Nestle Coffee Mate 400g', 1, 0, 0, 'na', 0, 0, 332.00, 360.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:09:39', 'Admin', '2025-05-21 11:39:18', 1),
(1659, '8909106025646', 'Horlicks In', 1, 0, 0, 'na', 0, 0, 600.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:11:53', '', '', 1),
(1660, '4901515118586', 'Kikkoman Soy Sauce ', 1, 0, 0, 'na', 0, 0, 80.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:13:48', '', '', 1),
(1661, '6292848617222', 'Green Olives Royal ', 1, 0, 0, 'na', 0, 0, 230.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:14:34', '', '', 1),
(1662, '8850114402809', 'Cook & Lobster Fish Sauce', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:15:43', 'Admin', '2025-06-24 16:59:05', 1),
(1663, '8904004408089', 'Gol Gappa Ready To Fry 500g ', 1, 0, 0, 'na', 0, 0, 160.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:17:00', '', '', 1),
(1664, '8901011852401', 'Gol Gappa Ready To Fry 200g', 1, 0, 0, 'na', 0, 0, 90.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-16 09:17:42', '', '', 1),
(1665, 'P01665', 'vim liquid', 2, 0, 0, 'na', 0, 0, 115.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-17 16:19:25', '', '', 1),
(1666, 'P01666', 'Closeup 145 g', 2, 0, 0, 'na', 0, 0, 228.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-17 16:26:49', '', '', 1),
(1667, '8906189771989', 'Surf Excel 1 Kg', 2, 0, 0, 'na', 0, 0, 210.00, 235.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-17 16:30:03', 'Admin', '2025-06-25 22:01:36', 1),
(1668, '8941165013042', 'Rani Rice Flour 1 kg', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-17 19:44:45', '', '', 1),
(1669, '4987176280596', 'Gillette Guard ', 2, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-17 20:01:37', '', '', 1),
(1670, 'P01670', 'Sunsilk 340 ml', 2, 0, 0, 'na', 0, 0, 219.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 08:57:55', '', '', 1),
(1672, 'P016721', 'Rin Advance Buy 3 Get Rin LIQ 400 ml', 2, 0, 0, 'na', 0, 0, 470.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:30:27', '', '', 2),
(1673, 'P01673', 'Sunsilk 340 Get 100 Tk', 2, 0, 0, 'na', 0, 0, 219.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:38:45', '', '', 2),
(1674, 'P01674', 'Sunsilk Hair Fall  Get 100 ', 2, 0, 0, 'na', 0, 0, 219.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:43:09', '', '', 2),
(1675, 'P01675', 'Vim Bar Get 3 Free 1', 2, 0, 0, 'na', 0, 0, 108.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:46:44', '', '', 2),
(1676, 'P01676', 'Domex Get Vim  210ml Free', 2, 0, 0, 'na', 0, 0, 225.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:51:31', '', '', 2),
(1677, 'P01677', 'Clear Men Get 100  Off', 2, 0, 0, 'na', 0, 0, 341.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:55:03', '', '', 2),
(1678, 'P01678', 'Domex Get Vim 210 ml', 2, 0, 0, 'na', 0, 0, 225.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-18 09:57:14', '', '', 2),
(1679, '8941161108063', 'Actifit Premium Atta ', 1, 0, 0, 'na', 0, 0, 84.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-19 13:04:20', '', '', 1),
(1680, '8941159000591', 'Aarong Dair Milk 1 Liter', 1, 0, 0, 'na', 0, 0, 91.00, 100.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-19 13:13:38', '', '', 1),
(1681, '8941159000522', 'Aarong Dair Milk 500 ml', 1, 0, 0, 'na', 0, 0, 44.50, 50.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-19 13:14:14', '', '', 1),
(1682, 'P01682', 'Dal Musuri Big', 1, 0, 0, 'na', 0, 0, 98.00, 115.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-19 13:24:10', '', '', 1),
(1684, '8941189600068', 'Mojo 500 ml', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-19 21:00:32', '', '', 1),
(1685, '8941196220013', 'ACI Pure Salt 500 g', 1, 0, 0, 'na', 0, 0, 18.54, 22.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-20 14:43:27', '', '', 1),
(1686, '8335567246427', 'Dekko Sooper Choice  80 g', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:05:59', '', '', 1),
(1687, '8946565137503', 'Dekko Oroma 150gm', 1, 0, 0, 'na', 0, 0, 32.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:07:49', '', '', 1),
(1688, '8946565138708', 'Dekko chocomalt 235gm', 1, 0, 0, 'na', 0, 0, 53.58, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:09:05', '', '', 1),
(1689, '8946565147007', 'Dekko Horlicks 250gm', 1, 0, 0, 'na', 0, 0, 53.58, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:10:44', '', '', 1),
(1690, '8335563267662', 'Dekko Oroma 40gm', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:11:48', '', '', 1),
(1691, '8946565138357', 'Dekko Sooper Dooper 40gm', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:12:43', '', '', 1),
(1692, '745114131324', 'Olympic Nice 40gm', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:14:33', 'Admin', '2025-05-20 18:20:30', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1693, '745114130914', 'Olympic Tim Tim Orange 140gm', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:16:15', 'Admin', '2025-05-20 18:18:03', 1),
(1694, '745114132321', 'Olympic Tim Tim Orange 40gm', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:17:54', 'Admin', '2025-05-20 18:19:55', 1),
(1695, '745114132338', 'Olympic Tim Tim Pineapple 40gm', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:19:22', 'Admin', '2025-05-20 18:18:58', 1),
(1696, '745114132659', 'Olympic Elachi Plus 190gm ', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:21:29', '', '', 1),
(1697, '745114130655', 'Olympic Elachi Plus 42gm', 1, 0, 0, 'na', 0, 0, 8.66, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:23:29', 'Admin', '2025-07-12 15:18:23', 1),
(1698, '745114131515', 'Olympic Frooty 40gm', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:25:20', 'Admin', '2025-05-20 18:19:40', 1),
(1699, '745114131874', 'Olympic Orange Plus 42gm', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:26:46', 'Admin', '2025-05-20 18:20:10', 1),
(1700, '745114130891', 'Olympic Butter Bite 55gm', 1, 0, 0, 'na', 0, 0, 12.62, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:28:04', 'Admin', '2025-05-20 18:19:10', 1),
(1701, '745114130495', 'Olympic Energy Plus', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:29:31', 'Admin', '2025-05-20 18:18:45', 1),
(1702, '745114130815', 'Olympic Saltes 50gm', 1, 0, 0, 'na', 0, 0, 12.62, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:31:12', 'Admin', '2025-05-20 18:17:49', 1),
(1703, '8941153055238', 'Yum Layer Cake Chocolate 17gm', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:32:29', '', '', 1),
(1704, '8941153055481', 'Yum Mini Swiss Roll Chocolat Cake 30gm', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:33:33', '', '', 1),
(1705, '8901012116883', 'Johnson\'s Baby Top To Toe Bath 100 ml ', 1, 0, 0, 'na', 0, 0, 260.00, 291.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:35:54', '', '', 1),
(1706, '8901012116715', 'Johnson\'s Baby oil 100ml', 1, 0, 0, 'na', 0, 0, 218.00, 244.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:39:41', '', '', 1),
(1707, '8901012116685', 'Johnson\'s Baby Milk Soap 75gm', 1, 0, 0, 'na', 0, 0, 125.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:41:10', '', '', 1),
(1708, '8901012100561', 'Johnson\'s Baby powder 100g', 1, 0, 0, 'na', 0, 0, 214.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:42:25', '', '', 1),
(1709, '8901012189504', 'Clean & Clear Foaming Face wash 100ml', 1, 0, 0, 'na', 0, 0, 223.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:44:10', '', '', 1),
(1710, '8901012116647', 'Johnson\'s Baby Soap 75g', 1, 0, 0, 'na', 0, 0, 109.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:45:13', '', '', 1),
(1711, '8901012100516', 'Jognson\'s Baby Powder Blossoms 50g', 1, 0, 0, 'na', 0, 0, 143.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:47:28', '', '', 1),
(1712, '8901012116678', 'Johnson\'s Baby Soap Blossoms 75g ', 1, 0, 0, 'na', 0, 0, 113.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:48:29', 'Admin', '2025-05-20 16:48:46', 1),
(1713, '8922459684025', 'SHAFA Peach 1Liter ', 1, 0, 0, 'na', 0, 0, 394.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:52:42', '', '', 1),
(1714, '8922459684018', 'SHAFA Orange 1liter', 1, 0, 0, 'na', 0, 0, 393.60, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:53:52', '', '', 1),
(1715, '6291047001998', 'emirates macaroni spaghetti 400g', 1, 0, 0, 'na', 0, 0, 140.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:55:37', 'Admin', '2025-05-20 16:56:45', 1),
(1716, '6291047001974', 'emirates macaroni penne rigate 400g', 1, 0, 0, 'na', 0, 0, 140.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 16:59:51', '', '', 1),
(1717, '7566631026459', 'Shafa Pomegranate Drink 300ml', 1, 0, 0, 'na', 0, 0, 205.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:01:47', 'Admin', '2025-06-21 20:20:24', 1),
(1718, '745760505098', 'Shafa Limonade 300ml', 1, 0, 0, 'na', 0, 0, 210.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:05:33', '', '', 1),
(1719, '745760500666', 'SHAFA Apple Juice 200ml', 1, 0, 0, 'na', 0, 0, 73.80, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:07:34', '', '', 1),
(1720, '745760500642', 'SHAFA Orange Juice 200ml', 1, 0, 0, 'na', 0, 0, 73.80, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:09:13', '', '', 1),
(1721, '52287586934776', 'QUANTA  DRIED FRUITS & MIXED NUTS 150g', 1, 0, 0, 'na', 0, 0, 280.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:10:53', '', '', 1),
(1722, '6291047001226', 'emirates macaroni FLORAL', 1, 0, 0, 'na', 0, 0, 140.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:22:26', '', '', 1),
(1723, '745760500680', 'SHAFA Mango Juice 200ml', 1, 0, 0, 'na', 0, 0, 73.80, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:23:12', '', '', 1),
(1724, '6982022121410', 'QUANTA Mushroom (Whole) 1500g ', 1, 0, 0, 'na', 0, 0, 840.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 17:24:59', '', '', 1),
(1725, 'P01725', 'Parachute Coconut Oil 500ml', 2, 0, 0, 'na', 0, 0, 388.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-20 20:26:23', '', '', 1),
(1726, '8941100290507', 'Nido Nestle 2.5 kg', 1, 0, 0, 'na', 0, 0, 3050.00, 3250.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-20 21:02:29', '', '', 1),
(1727, '8941100295625', 'Nido Nestle 1 kg', 1, 0, 0, 'na', 0, 0, 1320.00, 1400.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-20 21:03:16', '', '', 1),
(1728, '8941100296585 ', 'Maggi 2 minute Noodles ', 1, 0, 0, 'na', 0, 0, 85.00, 95.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-20 21:06:23', '', '', 1),
(1729, '8941100292907', 'Nido Forti Grw 350 g', 1, 0, 0, 'na', 0, 0, 373.00, 400.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-20 21:08:04', '', '', 1),
(1730, '8901058008531', 'Koko Krunch 7 vitamin & Minerals ', 1, 0, 0, 'na', 0, 0, 409.00, 450.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-20 21:09:22', '', '', 1),
(1731, '8941100296295', 'Lactogen 3-101', 1, 0, 0, 'na', 0, 0, 291.00, 310.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-20 21:19:13', '', '', 1),
(1732, '8941100296370', 'Lactogen 1 400g', 1, 0, 0, 'na', 0, 0, 772.00, 820.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-20 21:23:49', '', '', 1),
(1733, '8941100296271', 'Lactogen -2 350g', 1, 0, 0, 'na', 0, 0, 634.00, 670.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-20 21:24:49', '', '', 1),
(1734, '8941100294093', 'Coffee mate 450g ', 1, 0, 0, 'na', 0, 0, 326.00, 350.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-20 21:26:00', '', '', 1),
(1735, '8941100294956', 'Maggi 8 pack', 1, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-05-20 21:27:09', '', '', 1),
(1736, '8941100296059', 'Nan Opti Pro - 1', 1, 0, 0, 'na', 0, 0, 1030.00, 1100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-20 21:42:13', '', '', 1),
(1737, '7613034898098', 'NAN Al 110 400 g', 1, 0, 0, 'na', 0, 0, 1365.00, 1450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-20 21:51:29', '', '', 1),
(1738, '8941100296080', 'NAN Opti Pro  2 400g', 1, 0, 0, 'na', 0, 0, 1030.00, 1100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-20 21:52:26', '', '', 1),
(1739, '7613036895729', 'Pre NAN 400 g', 1, 0, 0, 'na', 0, 0, 1415.00, 1500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-20 21:57:39', '', '', 1),
(1740, '8941100295670', 'Maggi 4g', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-20 22:06:56', '', '', 1),
(1741, '8901058010336', 'Gold Corn Flakes Nestle 70g', 1, 0, 0, 'na', 0, 0, 91.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 09:54:58', '', '', 1),
(1742, '8901058841114', 'Nescafe Classic 100 g', 1, 0, 0, 'na', 0, 0, 435.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 09:55:49', '', '', 1),
(1743, '8941100296516', 'Nescafe 3in Orginal ', 1, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 09:56:38', '', '', 1),
(1744, '8941100291351', 'Maggi malaysia Thai 35g', 1, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 09:57:44', '', '', 1),
(1745, '8941100292969', 'Nido Forti Grow Nestle 700g', 1, 0, 0, 'na', 0, 0, 753.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 09:58:28', '', '', 1),
(1746, '8941100295878', 'Maggi Healthy Soups 25 g', 1, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:00:16', '', '', 1),
(1747, '8941100296493', 'Hazelnut Latte 3-1 Nescafe 22g', 1, 0, 0, 'na', 0, 0, 27.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:01:33', '', '', 1),
(1748, '8941100295939', 'Jced Frappe 3-1 Nescafe 30 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:02:26', '', '', 1),
(1749, '8941100295182', 'Nescafe 3-1 Creamy Latte', 1, 0, 0, 'na', 0, 0, 27.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:03:12', '', '', 1),
(1750, '8901058006377', 'Nescafe Classic 45 g', 1, 0, 0, 'na', 0, 0, 254.00, 275.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:04:03', '', '', 1),
(1751, '8901058001617', 'Nescafe Classic 24g', 1, 0, 0, 'na', 0, 0, 175.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:05:04', '', '', 1),
(1752, '8941100291368', 'Maggi Healthy SoupsWinter Vegetables ', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:05:53', '', '', 1),
(1753, '8941100296240', 'Nescafe Americano 8 g', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:07:01', '', '', 1),
(1754, '8941100296448', 'NIDO nestle Family Choice 500g', 1, 0, 0, 'na', 0, 0, 418.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:08:11', '', '', 1),
(1755, '8941100294895', 'Maggi Masala 2 minute N ', 1, 0, 0, 'na', 0, 0, 308.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:10:34', '', '', 1),
(1756, '8941100295168', 'Maggi 12 Pack', 1, 0, 0, 'na', 0, 0, 239.00, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:11:28', '', '', 1),
(1757, '8941100296332', 'Lactogen 4 350 g', 1, 0, 0, 'na', 0, 0, 566.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:15:52', '', '', 1),
(1758, '8941100296356', 'Lactogen  1 180 g', 1, 0, 0, 'na', 0, 0, 292.00, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:16:31', '', '', 1),
(1759, '8941100296301', 'Lactogen -3 350 g', 1, 0, 0, 'na', 0, 0, 634.00, 670.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:17:06', '', '', 1),
(1760, '8941100296264', 'Lactogen -2 180g', 1, 0, 0, 'na', 0, 0, 291.00, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:17:40', '', '', 1),
(1761, '8941100294727', 'Nido Growing up milk 1+ 350g', 1, 0, 0, 'na', 0, 0, 462.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:18:17', '', '', 1),
(1762, '8941100296325', 'Lactogen 4 180 g', 1, 0, 0, 'na', 0, 0, 282.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:18:55', '', '', 1),
(1763, '8941100293942', 'Cerelac Nestle 350g', 1, 0, 0, 'na', 0, 0, 494.00, 525.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:19:41', '', '', 1),
(1764, '8941100296042', 'Cerelac Nestle  350 10-24 Month', 1, 0, 0, 'na', 0, 0, 423.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:20:55', '', '', 1),
(1765, '8941100296363', 'Lactogen 1 350g Nestle', 1, 0, 0, 'na', 0, 0, 615.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:21:40', '', '', 1),
(1766, '8941100296004', 'Cerelac 6-24 Months', 1, 0, 0, 'na', 0, 0, 387.00, 410.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:22:42', '', '', 1),
(1767, '8941100294741', 'NIDO Growing up Milk 3+ 350g', 1, 0, 0, 'na', 0, 0, 462.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:23:26', '', '', 1),
(1768, '8941100296011', 'Cerelac 6-24 Months 350g', 1, 0, 0, 'na', 0, 0, 376.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:24:16', '', '', 1),
(1769, '8941100296639', 'Cerelac 6-24 Months  With Milk', 1, 0, 0, 'na', 0, 0, 376.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:25:20', '', '', 1),
(1770, '8941100296035', 'Cerelac 8-24 Month 350g', 1, 0, 0, 'na', 0, 0, 400.00, 425.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:26:11', '', '', 1),
(1771, '8941100295892', 'Cerelack 12-24 months with milk', 1, 0, 0, 'na', 0, 0, 444.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:26:59', '', '', 1),
(1772, '8941100295885', 'Cerelac 12-24 Months  with Milk 350g', 1, 0, 0, 'na', 0, 0, 455.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:28:33', '', '', 1),
(1773, '8941100296097', 'NAN Opti Pro 12-35 350', 1, 0, 0, 'na', 0, 0, 845.00, 900.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:29:48', '', '', 1),
(1774, '8941100296073', 'NAN OPti Pro  -2 6-12 Months ', 1, 0, 0, 'na', 0, 0, 845.00, 900.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:30:52', '', '', 1),
(1775, '8941100296103', 'NAN Opti pro 4 2 years', 1, 0, 0, 'na', 0, 0, 845.00, 900.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:33:46', '', '', 1),
(1776, '8941100296066', 'NAN Opti Pro 1 6 MOnths', 1, 0, 0, 'na', 0, 0, 751.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 10:37:19', '', '', 1),
(1777, '8941100294840', 'Maggi 10 pack', 1, 0, 0, 'na', 0, 0, 159.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 11:44:30', '', '', 1),
(1778, '8410660064472', 'Span Oliva  Oil 250 ml', 2, 0, 0, 'na', 0, 0, 540.00, 675.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 15:44:00', '', '', 1),
(1779, '8410269241359', 'Span Oliva Oil 100 ml', 2, 0, 0, 'na', 0, 0, 240.00, 300.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 15:44:56', '', '', 1),
(1780, '8412336093953', 'Doctor\'s Organic Apple Cider ', 2, 0, 0, 'na', 0, 0, 512.00, 540.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 15:45:53', '', '', 1),
(1781, '8410269918817', 'Castor Oil B.P', 2, 0, 0, 'na', 0, 0, 190.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 15:46:28', '', '', 1),
(1782, '8437014703092', 'Span Sunflower Oil 2 Liter', 1, 0, 0, 'na', 0, 0, 960.00, 1200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 15:47:51', '', '', 1),
(1783, '8941100502778', 'Select + Plus Shampoo 200 ml', 2, 0, 0, 'na', 0, 0, 320.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 15:56:59', '', '', 1),
(1784, '8941100619759', 'Clinin Plus +340 ml', 2, 0, 0, 'na', 0, 0, 321.24, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:00:31', '', '', 1),
(1785, '8941100500705', 'Select + Plus Shampoo 100ml', 2, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:04:59', '', '', 1),
(1786, '8901526103409', 'Lorel Extraordinary Oil ', 2, 0, 0, 'na', 0, 0, 433.00, 520.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:06:37', '', '', 1),
(1787, '8941102316847', 'Vaseline Mosquit Defence ', 2, 0, 0, 'na', 0, 0, 153.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:09:01', '', '', 1),
(1788, '8941102463442', 'Lifebuoy Lquet 170 ml', 2, 0, 0, 'na', 0, 0, 61.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:10:04', '', '', 1),
(1789, '8901030992223', 'Surf Exce Matic Top Load 1 Liter', 2, 0, 0, 'na', 0, 0, 333.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:15:51', 'Admin', '2025-05-21 16:16:49', 1),
(1790, 'P01790', 'Dove Hair therapy 380 ml', 2, 0, 0, 'na', 0, 0, 675.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:20:44', '', '', 1),
(1791, '8169003007248', 'ACI Pure Falooda Mix 250 ml', 2, 0, 0, 'na', 0, 0, 98.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:23:24', '', '', 1),
(1792, 'P01792', 'Parachute Just for Baby combo pack  ', 2, 0, 0, 'na', 0, 0, 99.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:25:13', '', '', 1),
(1793, 'P01793', 'Lifebuoy combo pack', 2, 0, 0, 'na', 0, 0, 131.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:28:13', '', '', 1),
(1794, '8941174010971', 'parachute-jasmine 300 ml', 2, 0, 0, 'na', 0, 0, 238.06, 310.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:31:47', '', '', 1),
(1795, '8901526102327', 'Loreal Paris Fall Resist 3x', 2, 0, 0, 'na', 0, 0, 458.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:32:38', '', '', 1),
(1796, '8941102463480', 'Pond\'s Bright Beauty Serum Cream 23m', 2, 0, 0, 'na', 0, 0, 105.00, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:34:36', '', '', 1),
(1797, 'P01797', 'Lily Body Wash 250 ml', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:35:36', '', '', 1),
(1798, 'P01798', 'Sajeeb Soya Sauce ', 2, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-21 16:38:45', '', '', 1),
(1799, 'P01799', 'Pond\'s Facial Scrub 100 g', 2, 0, 0, 'na', 0, 0, 128.00, 165.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:42:42', '', '', 1),
(1800, '816903001545', 'aci pure mango pickle', 1, 0, 0, 'na', 0, 0, 136.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:49:00', '', '', 1),
(1801, '8941100283349', 'Dettol Aloe Vera  200 ml', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:51:00', 'Admin', '2025-05-21 16:52:55', 1),
(1802, '8941161100012', 'NO.1 Filled Milk', 2, 0, 0, 'na', 0, 0, 95.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:54:02', 'Admin', '2025-05-21 21:52:56', 1),
(1803, '8941161103020', 'No.1 Cacuum Salt 1 kg', 2, 0, 0, 'na', 0, 0, 34.00, 42.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:55:08', 'Admin', '2025-05-21 21:53:11', 1),
(1804, 'P01804', 'Lux Bright Glow Jasmine 150', 2, 0, 0, 'na', 0, 0, 80.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 16:56:26', '', '', 1),
(1805, '8941100648513', 'Pure Germkill Kit 23 Litres ', 1, 0, 0, 'na', 0, 0, 726.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 18:04:30', '', '', 1),
(1806, '8941187203131', 'Pikup Popcorn bainbow 150g', 1, 0, 0, 'na', 0, 0, 100.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 19:56:44', '', '', 1),
(1807, 'P01807', 'Mini Nescafe 0.9g', 1, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-21 21:59:58', '', '', 1),
(1808, '8906022340419', 'Shri Varalakshmi Sago 500g', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-22 16:11:05', 'Admin', '2025-06-24 17:02:02', 1),
(1809, '8858701404915', 'Tinsels  Tuna Chunk ', 1, 0, 0, 'na', 0, 0, 180.00, 260.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-22 16:14:20', '', '', 1),
(1810, '8888440007245', 'Cowhead Organic rolled Oats 500g', 1, 0, 0, 'na', 0, 0, 560.00, 720.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-22 16:15:40', '', '', 1),
(1811, '710535725681', 'Mozzarella Cheese 250 g', 1, 0, 0, 'na', 0, 0, 180.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-22 16:17:15', '', '', 1),
(1812, '859875003056', 'Medi Plus DS', 2, 0, 0, 'na', 0, 0, 40.80, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-22 20:44:41', '', '', 1),
(1813, '859875003018', 'Medi Plus 70', 2, 0, 0, 'na', 0, 0, 55.25, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-22 20:45:13', '', '', 1),
(1814, '859875003049', 'Medi Plus DS 90g', 2, 0, 0, 'na', 0, 0, 76.50, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-22 20:45:31', '', '', 1),
(1815, '845944043030', 'Raindow Cont 4 pcs set ', 2, 0, 0, 'na', 0, 0, 89.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:06:27', 'Admin', '2025-05-23 10:14:11', 1),
(1816, '845944048233', 'Dasj ice tray With Cover Red ', 2, 0, 0, 'na', 0, 0, 47.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:09:30', '', '', 1),
(1817, '842251171050', 'Spice Tray Red ', 2, 0, 0, 'na', 0, 0, 108.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:11:12', '', '', 1),
(1818, '842251162096', 'Diamond Mug 2L red', 2, 0, 0, 'na', 0, 0, 30.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:19:30', '', '', 1),
(1819, '843635115646', 'Sprint Water Bottle 500 ml', 2, 0, 0, 'na', 0, 0, 70.00, 125.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:20:19', '', '', 1),
(1820, '845944042149', 'Cosmos Jug 3.5L', 2, 0, 0, 'na', 0, 0, 80.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:21:01', '', '', 1),
(1821, '842251132136', 'Wall Hanger 16 Hook Red', 2, 0, 0, 'na', 0, 0, 75.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:22:28', '', '', 1),
(1822, '845944020406', 'Storage  Container 7L tr', 2, 0, 0, 'na', 0, 0, 103.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:26:34', '', '', 1),
(1823, '845944009081', 'Love Stool Red ', 2, 0, 0, 'na', 0, 0, 70.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:29:27', '', '', 1),
(1824, '845944021816', 'Sunflower Paper Basket Blue ', 2, 0, 0, 'na', 0, 0, 94.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:31:57', '', '', 1),
(1825, '842251133591', 'Dust Keeper Paper Basket Blue', 2, 0, 0, 'na', 0, 0, 54.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:33:19', '', '', 1),
(1826, '842251149790', 'Design Bowl 3L Red', 2, 0, 0, 'na', 0, 0, 39.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:34:26', '', '', 1),
(1827, '845944020628', 'Design Bowl 5L Red', 2, 0, 0, 'na', 0, 0, 58.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:35:03', '', '', 1),
(1828, '842251149844', 'Design Bowl 8 L', 2, 0, 0, 'na', 0, 0, 85.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:37:24', '', '', 1),
(1829, '845944002563', 'Design Bucket 16L Red', 2, 0, 0, 'na', 0, 0, 150.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:40:07', '', '', 1),
(1830, '845944002464', 'Design Bucket 20L Red', 2, 0, 0, 'na', 0, 0, 185.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:40:43', '', '', 1),
(1831, '842251149998', 'paddle Bin 15L Silver', 2, 0, 0, 'na', 0, 0, 441.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:41:34', '', '', 1),
(1832, '842251133454', 'Caino Laundry Basket oval Lime Green ', 2, 0, 0, 'na', 0, 0, 639.00, 980.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:42:56', '', '', 1),
(1833, '842251132785', 'Sunflower Glass Stand Red', 2, 0, 0, 'na', 0, 0, 70.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:46:18', '', '', 1),
(1834, '842251133393', 'Calno  Laundry Big Eagle Brown', 2, 0, 0, 'na', 0, 0, 639.00, 980.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 10:47:31', '', '', 1),
(1835, '845944043665', 'Storage Container 20L Tr', 2, 0, 0, 'na', 0, 0, 245.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 11:10:48', '', '', 1),
(1836, '845944024756', 'Container Fresh Sg 3 pcs Set', 2, 0, 0, 'na', 0, 0, 132.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 11:11:56', '', '', 1),
(1837, '8801963686155', 'MUM 500ml', 1, 0, 0, 'na', 0, 0, 10.50, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 11:21:16', 'Admin', '2025-06-17 22:43:17', 1),
(1838, '8801962686750', 'MUM 1 lITER', 1, 0, 0, 'na', 0, 0, 19.18, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 11:21:48', 'Admin', '2025-06-16 09:33:05', 1),
(1839, '8801962686651', 'MUM 2LITER', 1, 0, 0, 'na', 0, 0, 30.84, 40.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 11:23:00', 'Admin', '2025-06-16 09:35:43', 1),
(1840, '880196272401', 'RC Cola 2 Liter', 1, 0, 0, 'na', 0, 0, 91.68, 110.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 11:23:35', 'Admin', '2025-06-16 09:29:23', 1),
(1841, 'P01841', 'Rc Lemon 250ml', 1, 0, 0, 'na', 0, 0, 18.75, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 11:24:42', 'Admin', '2025-06-16 09:22:38', 1),
(1842, 'P01842', 'RC Cola 250 ml', 1, 0, 0, 'na', 0, 0, 17.08, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 11:25:15', 'Admin', '2025-06-16 09:24:51', 1),
(1843, '8941189600044', 'Mojo 250 ml1', 1, 0, 0, 'na', 0, 0, 17.11, 20.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-23 17:50:33', 'Admin', '2025-06-18 12:56:13', 1),
(1844, '710535035001', 'Star Ship  Milk 400g', 1, 0, 0, 'na', 0, 0, 95.00, 105.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-23 18:58:59', '', '', 1),
(1845, '8941161008080', 'Fresh Facial Tissue Pserfumed', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-23 19:45:14', '', '', 1),
(1846, '8941187203049', 'Pikup Bread Crumbs 175g', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-05-23 19:52:41', '', '', 1),
(1847, '8941100619421', 'Vim 500g ', 2, 0, 0, 'na', 0, 0, 41.00, 40.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-23 19:53:44', '', '', 1),
(1848, '841165136858', 'বংগ লবন 1000 গ্রাম', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-23 19:54:54', '', '', 1),
(1849, '721688299424', 'Lays Cream &s Onion 23g', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:48:06', '', '', 1),
(1850, '745604074667', 'Lays Tomato Tango 60g', 1, 0, 0, 'na', 0, 0, 68.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:48:53', '', '', 1),
(1851, '721688299615', 'Kurkure Cream & Onion 70 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:49:31', '', '', 1),
(1852, '721688299677', 'Kurkure Chilli Chatka 70 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:50:07', '', '', 1),
(1853, '721688299707', 'Kurkure Spicy Chicken 70 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:50:52', '', '', 1),
(1854, '721688299738', 'Kurkure Nauchty Tomato 70g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:51:23', '', '', 1),
(1855, '721688299721', 'Kurkure Naughty Tomato 25g', 1, 0, 0, 'na', 0, 0, 18.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:52:18', '', '', 1),
(1856, '745604074681', 'Lays Spicy Chicken 60 g', 1, 0, 0, 'na', 0, 0, 68.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:53:15', '', '', 1),
(1857, '735745809808', 'Lays Spicy Chicken 22g', 1, 0, 0, 'na', 0, 0, 19.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:53:43', '', '', 1),
(1858, '735745809815', 'Lays Spicy Chicken 80 g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:54:33', '', '', 1),
(1859, '726529109672', 'Lays Magic Masala 23 g', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:55:19', '', '', 1),
(1860, '721688299486', 'Lay\'s Classic Salted 37g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:56:00', '', '', 1),
(1861, '735745809846', 'Lay\'s Classic Salted 22g', 1, 0, 0, 'na', 0, 0, 19.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-24 16:56:51', '', '', 1),
(1862, '8907525000145', 'Coca Cola 400 ml', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 14:20:08', '', '', 1),
(1863, '8907525000114', 'Coca Cola 250ml', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 14:20:44', '', '', 1),
(1864, '8907525040189', 'Sprite 1 Liter', 1, 0, 0, 'na', 0, 0, 66.00, 80.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 14:21:20', '', '', 1),
(1865, '8907525000183', 'Coca Cola 1 Liter', 1, 0, 0, 'na', 0, 0, 66.00, 80.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 14:22:04', '', '', 1),
(1866, '8907525040219', 'Sprite 1750 liter ', 1, 0, 0, 'na', 0, 0, 82.00, 99.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 14:22:56', '', '', 1),
(1867, '8907525000213', 'Coca Cola 1.750 Liter', 1, 0, 0, 'na', 0, 0, 82.00, 99.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 14:23:38', '', '', 1),
(1868, '8941165022549', 'TEA Toast  Biscuit 260g', 1, 0, 0, 'na', 0, 0, 46.00, 60.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-25 14:49:47', '', '', 1),
(1869, '8850155021045', 'meridian Real Thai Chicken Chips 14g', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-25 15:01:53', '', '', 1),
(1870, '872051105559', 'Mawa Kulfi 500 ml', 1, 0, 0, 'na', 0, 0, 190.00, 220.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:03:16', '', '', 1),
(1871, '872041134286', 'Chocolate Fudge 120 g', 1, 0, 0, 'na', 0, 0, 71.00, 85.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:04:01', '', '', 1),
(1872, '872041012263', 'ভ্যানিলা আইসক্রিম', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:04:46', '', '', 1),
(1873, '872041062268', 'চকলেট আইসক্রিম 100 ml', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:05:42', '', '', 1),
(1874, '872051155554', 'Caramel Choco Crunch Ice cream', 1, 0, 0, 'na', 0, 0, 190.00, 220.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:06:28', '', '', 1),
(1875, '872041124287', 'Butterscotch with cashew crackles', 1, 0, 0, 'na', 0, 0, 70.00, 85.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:07:21', '', '', 1),
(1876, '1400209810070', 'Discone Savoy ', 1, 0, 0, 'na', 0, 0, 83.33, 100.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-05-25 15:07:57', '', '', 1),
(1878, '872041044288', 'Kheer Malai', 1, 0, 0, 'na', 0, 0, 63.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-25 15:19:45', '', '', 1),
(1879, '872081017785', 'i Kone Chocolate Mini', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-25 15:20:47', 'Admin', '2025-05-25 15:21:15', 1),
(1880, '8941100612019', 'Knorr Thai Soup Classic 28g', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-25 20:32:00', '', '', 1),
(1881, 'P01881', 'Pepsodent 190 ml 12 HR', 2, 0, 0, 'na', 0, 0, 228.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-26 14:43:46', '', '', 1),
(1882, '8941193402818', 'crinkle Cut French Fries 500g', 1, 0, 0, 'na', 0, 0, 210.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-28 08:49:33', '', '', 1),
(1883, 'P01883', 'Onion', 1, 0, 0, 'na', 0, 0, 56.00, 62.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-28 18:05:41', 'Admin', '2025-07-14 20:36:14', 1),
(1884, 'P01884', 'Rice -28', 1, 0, 0, 'na', 0, 0, 60.00, 65.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-28 18:06:13', '', '', 1),
(1885, 'P01885', 'Rice Monjur Miniket', 1, 0, 0, 'na', 0, 0, 65.00, 80.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-28 18:11:03', '', '', 1),
(1886, 'P01886', 'Surf Excel Tubo Clean 1 kg', 2, 0, 0, 'na', 0, 0, 180.00, 200.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-30 08:24:22', '', '', 1),
(1887, '8908009082237', 'Gol Gappa Ready to Fry  400g', 1, 0, 0, 'na', 0, 0, 140.00, 230.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-05-31 10:05:20', '', '', 1),
(1888, '8906189770173', 'Dove Saban', 2, 0, 0, 'na', 0, 0, 52.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 20:41:06', '', '', 1),
(1889, '8941102469024', 'Closoup Menthol Fresh', 2, 0, 0, 'na', 0, 0, 177.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 20:48:20', '', '', 1),
(1890, '8906189771668', 'Closoup Menthol Fresh 145Gm', 2, 0, 0, 'na', 0, 0, 136.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 20:49:40', '', '', 1),
(1891, '8941102469901', 'Pepsi dent Combo Pack ', 2, 0, 0, 'na', 0, 0, 131.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 20:52:34', '', '', 1),
(1892, '8941102462582', 'Pepsodent Sen Exp', 2, 0, 0, 'na', 0, 0, 92.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 20:59:04', '', '', 1),
(1893, '8941102465323', 'Pepsodent Adv Solt', 2, 0, 0, 'na', 0, 0, 79.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:01:49', '', '', 1),
(1894, '8941102460595', 'Pepsodent sen exp pro 40gm', 2, 0, 0, 'na', 0, 0, 59.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:03:36', '', '', 1),
(1895, '8941102460649', 'Pepsodent sen exp pro 140gm', 2, 0, 0, 'na', 0, 0, 154.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:07:46', '', '', 1),
(1896, '8941102468287', 'Pepsodent Germicheck Toothpowder 45gm', 2, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:15:07', 'Admin', '2025-05-31 21:17:05', 1),
(1897, '8941102464432', 'Pond\'s Daly Scrub 100gm ', 2, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:18:25', '', '', 1),
(1898, '8941102466443', 'Ponds Fc olic Cont 50gm', 2, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:19:59', '', '', 1),
(1899, '8941102462377', 'Ponds Fc olic Cont 100gm	', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:40:31', '', '', 1),
(1900, '8941102465798', 'Clear sp Cp active care ', 2, 0, 0, 'na', 0, 0, 347.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 21:57:53', '', '', 1),
(1901, '8941102462179', 'clear Coll sp Manthol 170ml', 2, 0, 0, 'na', 0, 0, 230.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 22:02:16', '', '', 1),
(1902, '8941102469444', 'Clear Man  CSM 80gm', 2, 0, 0, 'na', 0, 0, 77.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 22:04:08', '', '', 1),
(1903, '8941102461523', 'Trees emme Color Revatais 580ml', 2, 0, 0, 'na', 0, 0, 603.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 22:08:34', '', '', 1),
(1904, '8941102317998', 'Dove conditioner Intenserepair 170ml', 2, 0, 0, 'na', 0, 0, 232.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 22:26:24', '', '', 1),
(1905, '8941102319299', 'Dove Hair Fall Rescue Shampoo 450ml', 2, 0, 0, 'na', 0, 0, 483.00, 580.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 22:31:30', '', '', 1),
(1906, '8906189771651', 'Dove Hair Fall Rescue Shampoo 330ml', 2, 0, 0, 'na', 0, 0, 376.00, 440.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 22:54:55', '', '', 1),
(1907, '8941102465927', 'Sunsilk thick and long Shampoo 340 ml', 2, 0, 0, 'na', 0, 0, 307.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 23:20:19', '', '', 1),
(1908, '8941102465910', 'Sunsilk Stunning Black Shin 340 ml', 2, 0, 0, 'na', 0, 0, 307.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-05-31 23:22:00', '', '', 1),
(1909, '8941102318971', 'Rin Powder 200g', 2, 0, 0, 'na', 0, 0, 36.67, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 00:49:18', 'Admin', '2025-07-15 16:39:55', 1),
(1910, '8906189770449', 'Rin powder 2kg', 2, 0, 0, 'na', 0, 0, 339.00, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 00:52:05', '', '', 1),
(1911, '8941102318964', 'Rin Powder 1kg', 2, 0, 0, 'na', 0, 0, 157.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 00:54:47', '', '', 1),
(1912, '8906189771965', 'Surf excel 500g', 2, 0, 0, 'na', 0, 0, 108.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 00:58:33', '', '', 1),
(1913, '8906189770586', 'Lux Magical orchid', 2, 0, 0, 'na', 0, 0, 191.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 01:15:04', '', '', 1),
(1914, '8906189771873', 'Domex Toilet Lime fresh 500ml', 2, 0, 0, 'na', 0, 0, 112.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 01:32:19', '', '', 1),
(1915, '8941102469147', 'Domex toilet Cleaner 750ml', 2, 0, 0, 'na', 0, 0, 150.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-01 01:34:24', '', '', 1),
(1916, '6921101244039', 'lychee', 1, 0, 0, 'na', 0, 0, 22.50, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:13:39', 'Admin', '2025-07-02 20:25:54', 1),
(1917, '4796016860184', 'Ceylon Natural Coconut oil 200ml', 1, 0, 0, 'na', 0, 0, 400.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:26:31', '', '', 1),
(1918, '4796016860399', 'Ceylon Naturals Coconut Oil 300ml', 1, 0, 0, 'na', 0, 0, 620.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:33:31', 'Admin', '2025-06-27 20:44:37', 1),
(1919, '4796016860016', 'Ceylon Naturals Coconut Oil 500ml', 1, 0, 0, 'na', 0, 0, 950.00, 1165.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:34:14', 'Admin', '2025-06-27 20:44:21', 1),
(1920, '8410159040147', 'Figaro Pitted Olives 160gm', 1, 0, 0, 'na', 0, 0, 215.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:36:44', 'Admin', '2025-06-21 18:35:49', 1),
(1921, '8850305320264', 'Coin Box', 1, 0, 0, 'na', 0, 0, 380.00, 450.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 18:37:11', 'Admin', '2025-06-24 17:14:40', 1),
(1923, '6294002407576', 'Herman Creamy Garlic Mayonnaise 500ml', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:38:56', 'Admin', '2025-06-21 17:48:25', 1),
(1924, '8852023664675', 'Cashew Nuts', 1, 0, 0, 'na', 0, 0, 170.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:39:14', 'Admin', '2025-06-21 17:27:52', 1),
(1925, '8901719105913', 'Hide&Seekj Cookies 120gm', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:41:09', '', '', 1),
(1926, '8852045203722', 'Foodex Tuong ot Sriracha 435ml', 1, 0, 0, 'na', 0, 0, 490.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:41:30', 'Admin', '2025-06-21 17:45:04', 1),
(1927, '8901063139329', 'Bourbon Biscuit 10gm', 1, 0, 0, 'na', 0, 0, 33.50, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:42:18', '', '', 1),
(1928, '7622202225512', 'oreo 41.75gm', 1, 0, 0, 'na', 0, 0, 26.13, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:43:40', '', '', 1),
(1929, '7622202252518', 'oreo Biscuit 83.5gm', 1, 0, 0, 'na', 0, 0, 56.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:45:36', '', '', 1),
(1930, '6932017121208', 'Champion Mushrooms 400gm', 1, 0, 0, 'na', 0, 0, 130.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:45:54', '', '', 1),
(1931, '7622202252396', 'oreo Biscuti 108.55 gm', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:47:18', '', '', 1),
(1932, '8901393016628', 'Chupa Chups soft Candy', 1, 0, 0, 'na', 0, 0, 13.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:48:16', '', '', 1),
(1933, '6921101244053', 'Juicy peach ', 1, 0, 0, 'na', 0, 0, 22.50, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:50:43', '', '', 1),
(1934, '8991115012106', 'chupa Chups Babol Stroberi ', 1, 0, 0, 'na', 0, 0, 35.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:52:06', '', '', 1),
(1935, '074305001321', 'Bragg Apple Cider Vinegar 946ml', 1, 0, 0, 'na', 0, 0, 1100.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:52:07', 'Admin', '2025-06-21 16:56:09', 1),
(1936, '8991115011109', 'Chupa chups Blueberry', 1, 0, 0, 'na', 0, 0, 28.50, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:53:04', '', '', 1),
(1937, '6921101244022', 'Juicy BlueBerry', 1, 0, 0, 'na', 0, 0, 22.50, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:53:56', '', '', 1),
(1938, '6958116522357', 'Sport Chewin Gum Cool Mint', 1, 0, 0, 'na', 0, 0, 20.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:55:54', '', '', 1),
(1939, '6958116522371', 'Sport Chewing Gum Orange', 1, 0, 0, 'na', 0, 0, 20.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:57:01', '', '', 1),
(1940, '6958116522364', 'Sport Chewing Gum Strawberry', 1, 0, 0, 'na', 0, 0, 20.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:58:05', '', '', 1),
(1941, '074305001161', 'Bragg Apple Cider Vinegar 473ml', 1, 0, 0, 'na', 0, 0, 650.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:58:44', 'Admin', '2025-06-21 16:54:40', 1),
(1943, '8901393024623', 'Mentos ', 1, 0, 0, 'na', 0, 0, 26.33, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:59:15', '', '', 1),
(1944, '89009871', 'Polo ', 1, 0, 0, 'na', 0, 0, 13.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 18:59:51', '', '', 1),
(1945, '6959988010065', 'Europe Gum', 1, 0, 0, 'na', 0, 0, 11.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:00:44', 'Admin', '2025-06-03 19:01:52', 1),
(1946, '8801073411432', 'Buldak Carbonate 200gm', 1, 0, 0, 'na', 0, 0, 430.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:03:14', 'Admin', '2025-06-24 16:57:22', 1),
(1947, '070221008741', 'Trident Watermelon Gum', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:03:35', '', '', 1),
(1948, '070221008703', 'Trident Spearmint Gum', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:04:48', '', '', 1),
(1949, '070221008680', 'Trident Original Gum', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:05:41', '', '', 1),
(1950, '012546011112', 'Trident Tropical Gum', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:06:20', '', '', 1),
(1951, '89009802', 'Munch Wafer', 1, 0, 0, 'na', 0, 0, 13.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:07:21', 'Admin', '2025-06-24 18:38:08', 1),
(1952, '8850229102038', 'Nautilus Lite Less Sodium 125gm', 1, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:07:31', '', '', 1),
(1954, '7622202243516', 'Perk Wafer', 1, 0, 0, 'na', 0, 0, 13.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:07:56', '', '', 1),
(1955, '5760466913423', 'Dano Sterilized Cream 170gm', 1, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:08:36', '', '', 1),
(1956, '8992741904520', 'Yupi Twin Burger', 1, 0, 0, 'na', 0, 0, 31.75, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:08:49', '', '', 1),
(1957, '8992741945271', 'Yupi Pizza', 1, 0, 0, 'na', 0, 0, 31.75, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:09:27', '', '', 1),
(1958, '8901071706834', 'Hersheye Syrup 623gm', 1, 0, 0, 'na', 0, 0, 530.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:09:34', 'Admin', '2025-06-24 17:17:52', 1),
(1959, '7622202272578', 'Dairy Milk 5.5gm', 1, 0, 0, 'na', 0, 0, 11.81, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:10:12', '', '', 1),
(1960, '7622202272608', 'Dairy Milk 11.5gm', 1, 0, 0, 'na', 0, 0, 20.50, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:11:16', '', '', 1),
(1961, '46204837', 'Nescafe Gold Cofee 47.5gm', 1, 0, 0, 'na', 0, 0, 440.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:11:23', '', '', 1),
(1962, '7622202245558', 'Dairy Milk 46gm', 1, 0, 0, 'na', 0, 0, 96.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:12:01', 'Admin', '2025-06-15 15:49:10', 1),
(1963, '7622201762063', 'Dairy Milk 123gm', 1, 0, 0, 'na', 0, 0, 215.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:12:54', '', '', 1),
(1964, '46204813', 'Necafe Gold Cofee 95gm', 1, 0, 0, 'na', 0, 0, 540.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:13:03', '', '', 1),
(1965, '7622202228360', 'Dairy Milk 160gm', 1, 0, 0, 'na', 0, 0, 330.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:14:04', '', '', 1),
(1966, '8906105101357', 'Horlicks Womens Plus 400gm', 1, 0, 0, 'na', 0, 0, 561.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:14:34', '', '', 1),
(1967, '8901262072670', 'Amul Dark Chocolate 125gm', 1, 0, 0, 'na', 0, 0, 320.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:15:16', '', '', 1),
(1968, '8901262070454', 'Amul Dark Chocolate 40gm', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:16:15', '', '', 1),
(1969, '8906002482481', 'Snicjers Chocolate 22gm', 1, 0, 0, 'na', 0, 0, 43.13, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:17:48', 'Admin', '2025-06-20 11:25:22', 1),
(1970, '6003770000649', 'Nandos Garlic', 1, 0, 0, 'na', 0, 0, 385.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:17:56', 'Admin', '2025-06-24 21:43:24', 1),
(1971, '8906002484003', 'Snickers Chocolate 12gm', 1, 0, 0, 'na', 0, 0, 20.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:19:22', 'Admin', '2025-07-09 16:30:57', 1),
(1972, '8410159006662', 'Figaro Pitted Black Olives 340gm', 1, 0, 0, 'na', 0, 0, 215.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:20:05', 'Admin', '2025-06-21 18:35:37', 1),
(1974, '6281004135934', 'Safari 5gm', 1, 0, 0, 'na', 0, 0, 13.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:21:10', '', '', 1),
(1975, '6281007043359', 'Almarai Creamy Tasty 200gm', 1, 0, 0, 'na', 0, 0, 450.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:21:41', 'Admin', '2025-06-21 17:31:59', 1),
(1976, '6291003191015', 'Alfa Mayonnaise Small', 1, 0, 0, 'na', 0, 0, 140.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:22:53', 'Admin', '2025-06-21 18:31:40', 1),
(1977, '6291003191275', 'Alfa Mayonnaise 473ml', 1, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:23:44', '', '', 1),
(1978, '753854500089', 'Hersheys Cookies n Creme 40gm', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:25:21', '', '', 1),
(1979, '831730002701', 'Pran Mixed Fruit Jam 500gm', 1, 0, 0, 'na', 0, 0, 150.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:25:47', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(1980, '8169003006869', 'Aci Pure Mixed Fruit Jam 500gm', 1, 0, 0, 'na', 0, 0, 150.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:27:39', '', '', 1),
(1981, '8941100514733', 'Ruchi Mango Pikle 200gm', 1, 0, 0, 'na', 0, 0, 93.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:28:50', '', '', 1),
(1982, '8901058005233', 'Kit kat 2', 1, 0, 0, 'na', 0, 0, 21.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:29:31', '', '', 1),
(1983, 'P01983', 'Kit kat 3', 1, 0, 0, 'na', 0, 0, 55.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:30:14', '', '', 1),
(1984, '8901058903164', 'Kit kat 4', 1, 0, 0, 'na', 0, 0, 67.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:30:56', '', '', 1),
(1985, '8445291036062', 'Kit kat White 4', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:32:08', '', '', 1),
(1986, '8901058905113', 'Kit kat 3\\2', 1, 0, 0, 'na', 0, 0, 115.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:33:17', 'Admin', '2025-06-03 19:33:30', 1),
(1987, '8941100594759', 'Ruchi Garlic Pickle 200gm', 1, 0, 0, 'na', 0, 0, 128.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:35:24', '', '', 1),
(1988, '5000159559485', 'Twix 50gm', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:36:03', '', '', 1),
(1989, '8941100514726', 'Ruchi Mixed Fruit Jam 250gm', 1, 0, 0, 'na', 0, 0, 158.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:36:56', 'Admin', '2025-06-03 19:39:34', 1),
(1990, 'P01989', 'Bounty coconut', 1, 0, 0, 'na', 0, 0, 103.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:37:15', '', '', 1),
(1991, '8941100514702', 'Ruchi Mixed Fruit Jam 500gm', 1, 0, 0, 'na', 0, 0, 171.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:37:47', '', '', 1),
(1992, '8941100514672', 'Ruchi Mixed Orange Jam 250gm', 1, 0, 0, 'na', 0, 0, 94.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:38:27', '', '', 1),
(1993, '80052487', 'Raffaello', 1, 0, 0, 'na', 0, 0, 130.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:39:26', '', '', 1),
(1994, '80052760', 'Kinder Bueno', 1, 0, 0, 'na', 0, 0, 125.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:42:20', '', '', 1),
(1995, '7622202315152', '5Star', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:43:07', '', '', 1),
(1996, '4809014944807', 'ICE cream Mallows', 1, 0, 0, 'na', 0, 0, 130.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:44:28', '', '', 1),
(1997, '841165150410', 'Layer squar Box', 1, 0, 0, 'na', 0, 0, 120.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:47:08', 'Admin', '2025-06-03 19:47:18', 1),
(1998, '841165161058', 'Layer Love Box', 1, 0, 0, 'na', 0, 0, 140.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:50:46', 'Admin', '2025-07-07 11:14:46', 1),
(1999, '8941100514740', 'Ruchi Olive Pickle 400gm', 1, 0, 0, 'na', 0, 0, 158.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:52:47', 'Admin', '2025-06-03 19:55:57', 1),
(2000, '3073781193381', 'La Vache quirit Original', 1, 0, 0, 'na', 0, 0, 220.00, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:54:13', 'Admin', '2025-06-24 16:58:27', 1),
(2001, '841165154227', 'm&S chocolate ', 1, 0, 0, 'na', 0, 0, 550.00, 600.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 19:55:19', '', '', 1),
(2002, '8941100514511', 'Ruchi Mixed Pickle 400gm', 1, 0, 0, 'na', 0, 0, 135.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:56:43', '', '', 1),
(2003, '841165115969', 'Treat m&s boll', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:56:57', '', '', 1),
(2004, '831730002497', 'Pran Orange Jelly Suger Free 450gm', 1, 0, 0, 'na', 0, 0, 240.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:58:18', '', '', 1),
(2005, '8941100514221', 'Ruchi Peanut Bar', 1, 0, 0, 'na', 0, 0, 8.75, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:58:23', '', '', 1),
(2006, '831730002558', 'Pran Apple Jelly 500gm', 1, 0, 0, 'na', 0, 0, 155.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 19:59:39', '', '', 1),
(2007, '831730002480', 'Pran OrANGE Jelly 350gm', 1, 0, 0, 'na', 0, 0, 250.00, 305.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:00:31', '', '', 1),
(2008, '5000312000694', 'Carury Cocoa Packet 125gm', 1, 0, 0, 'na', 0, 0, 100.00, 200.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 20:00:32', 'Admin', '2025-06-24 17:04:21', 1),
(2009, '8941100514177', 'Ruchi Sweet Chilli Ssauce 200gm', 1, 0, 0, 'na', 0, 0, 76.50, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:01:49', '', '', 1),
(2010, '8941100514153', 'Ruchi Hot Tomato Sauce 200gm', 1, 0, 0, 'na', 0, 0, 68.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:02:45', '', '', 1),
(2011, '8941100514146', 'Ruchi BBQ Sauce 200gm ', 1, 0, 0, 'na', 0, 0, 125.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:03:26', '', '', 1),
(2012, '8901725015275', 'Dark Fantasy 69gm', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:03:36', '', '', 1),
(2013, '8941100514320', 'Ruchi Hot Tomato Sauce 350gm', 1, 0, 0, 'na', 0, 0, 102.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:04:09', '', '', 1),
(2014, '840205761906', 'Shero Roll Milk', 1, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:04:54', '', '', 1),
(2015, '840205761913', 'Shero Roll Vanilla ', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:05:29', '', '', 1),
(2016, '8941100514337', 'Ruchi Red Chilli Sauce 360gm', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:05:30', '', '', 1),
(2017, '6930058603653', 'Nuts Crisp 250gm', 1, 0, 0, 'na', 0, 0, 260.00, 320.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 20:09:56', 'Admin', '2025-06-24 19:09:29', 1),
(2018, '4897087990548', 'Oats Bar 200gm', 1, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 20:10:49', 'Admin', '2025-06-24 18:39:24', 1),
(2019, '6930058653160', 'Choco Crisp 250gm', 1, 0, 0, 'na', 0, 0, 260.00, 320.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 20:11:39', '', '', 1),
(2020, '9556920001425', 'Oat Choco 400gm', 1, 0, 0, 'na', 0, 0, 450.00, 550.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 20:12:29', 'Admin', '2025-06-03 20:12:38', 1),
(2021, '8996001320051', 'Kopikp Coffee Candy', 1, 0, 0, 'na', 0, 0, 175.00, 210.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 20:17:17', 'Admin', '2025-06-03 20:17:29', 1),
(2022, '8941100514443', 'Ruchi Sweet Chilli Sauce 350gm', 1, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:17:50', '', '', 1),
(2023, '8941100514344', 'Ruchi Tamarind Sauce 370gm', 1, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:18:59', '', '', 1),
(2024, '6922577100843', 'Lolli pop 30/=', 1, 0, 0, 'na', 0, 0, 16.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:19:07', '', '', 1),
(2025, '8941100514375', 'Ruchi Hot Tomato Sauce 1kg', 1, 0, 0, 'na', 0, 0, 253.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:20:08', '', '', 1),
(2027, '8941100514290', 'Ruchi Tomato Ketchup 1kg', 1, 0, 0, 'na', 0, 0, 254.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:21:29', '', '', 1),
(2028, '6922577100805', 'Lolli pop gora', 1, 0, 0, 'na', 0, 0, 16.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:23:34', '', '', 1),
(2029, '6922577100829', 'Lolli pop bang', 1, 0, 0, 'na', 0, 0, 16.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:24:48', '', '', 1),
(2030, '8169003010200', 'Dry Cake Biscuit 300gm', 1, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:26:11', '', '', 1),
(2031, '8941193311776', 'Ismahani Milk Marie Biscuits 200gm', 1, 0, 0, 'na', 0, 0, 45.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:27:39', '', '', 1),
(2032, '8941193312117', 'Ispahani Butter Cookies Biscuit 160gm', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:29:25', '', '', 1),
(2033, '8941193310571', 'Ispahani Ovaltine Cookies Biscuite 160gm', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:31:03', '', '', 1),
(2034, '8941193311653', 'Ispahani Butterful Biscuite 200gm', 1, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:32:10', '', '', 1),
(2036, '8941193311905', 'Ispahani Puffy Bite Biscuite 150gm', 1, 0, 0, 'na', 0, 0, 55.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:33:37', '', '', 1),
(2037, '840205728466', 'Bisk Club Potata Biscuite 50gm', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:35:39', '', '', 1),
(2038, '841165116256', 'Shero Biscuite 85gm', 4, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:37:52', '', '', 1),
(2039, '8941161134062', 'Fresh Fantasy Biscuite 175gm', 4, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:39:15', '', '', 1),
(2040, '8941161134055', 'Fresh Fantasy Biscuite 75gm', 4, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:40:16', '', '', 1),
(2041, '841165118335', 'MR. Cup Noodles 40gm', 4, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:41:32', '', '', 1),
(2042, '840205772599', 'Bisk Club Peanut Cookies Biscuite 230gm', 4, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:43:07', '', '', 1),
(2043, '841165144525', 'Bisk Club Cookies Butter Flavor Biscuit 230gm', 4, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:44:22', '', '', 1),
(2044, '816903002771', 'Fun Jhal Chanachure 300gm', 4, 0, 0, 'na', 0, 0, 61.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:47:52', '', '', 1),
(2045, '8941100513293', 'Ruchi Chanachure Premium Mixed 200gm', 4, 0, 0, 'na', 0, 0, 104.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:49:12', '', '', 1),
(2046, '8941100513163', 'Ruchi Chanachure Jhal 150gm', 1, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:50:34', '', '', 1),
(2047, '8941100513224', 'Ruchi Chanachure Jhal 300gm', 1, 0, 0, 'na', 0, 0, 83.50, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:51:23', '', '', 1),
(2048, '8941100513255', 'Ruchi Chanachure Jhal 500gm', 1, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:53:04', '', '', 1),
(2049, '8941100514191', 'Ruchi Chanachure Orginal Mixed 150gm', 1, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:54:17', '', '', 1),
(2050, '8941100514214', 'Ruchi Chanachure Orginal Mixed 300gm', 1, 0, 0, 'na', 0, 0, 86.50, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:54:53', '', '', 1),
(2051, '8941100513248', 'Ruchi Chanachure BBQ 500gm', 1, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:56:50', '', '', 1),
(2052, '8941100513217', 'Ruchi Chanachure BBQ 300gm', 1, 0, 0, 'na', 0, 0, 86.50, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:58:08', 'Admin', '2025-06-03 21:01:27', 1),
(2053, '840205755769', 'Pluto Wonder', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 20:59:05', 'Admin', '2025-06-03 20:59:18', 1),
(2054, '5000159555715', 'Maltesers', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:00:22', '', '', 1),
(2055, '6933761928495', 'Champagne chocolate 85gm', 1, 0, 0, 'na', 0, 0, 190.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-03 21:01:36', '', '', 1),
(2056, '8941100513194', 'Ruchi Chanachure BBQ 150gm', 1, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:02:14', '', '', 1),
(2057, '6944516003701', 'Eye Candy ', 1, 0, 0, 'na', 0, 0, 13.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:03:37', '', '', 1),
(2058, 'P02058', 'Xcel Gum', 1, 0, 0, 'na', 0, 0, 1.50, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:04:17', '', '', 1),
(2059, '841165135042', 'Lop Lop', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:06:01', '', '', 1),
(2060, '841165135035', 'Sweet Bear', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:06:59', '', '', 1),
(2061, '5060868951949', 'Wow pop', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:07:41', '', '', 1),
(2062, '745125253572', ' Vanilla Plain Cake 140gm', 1, 0, 0, 'na', 0, 0, 67.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:11:50', '', '', 1),
(2063, '745125253589', 'Chocolate Plain Cake 140gm', 1, 0, 0, 'na', 0, 0, 67.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:12:49', '', '', 1),
(2064, '8946000009563', 'Pound Cake 63gm', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:14:09', '', '', 1),
(2065, '725765440730', 'Butter Cake 90gm', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:15:18', '', '', 1),
(2066, '735745714423', 'Chocolate Velvet Cake 300gm', 1, 0, 0, 'na', 0, 0, 210.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:17:41', '', '', 1),
(2067, '745125253503', 'Fruit Cake 220gm ', 1, 0, 0, 'na', 0, 0, 117.00, 140.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:18:41', '', '', 1),
(2068, '8946000009884', 'Dry Cake 300gm', 1, 0, 0, 'na', 0, 0, 166.00, 200.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 21:19:30', '', '', 1),
(2069, '6922577100812', 'Lolli Pop Banny', 1, 0, 0, 'na', 0, 0, 16.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:53:43', 'Admin', '2025-06-03 21:53:52', 1),
(2070, '8941154031385', 'Bombay Chanachure 150gm', 1, 0, 0, 'na', 0, 0, 42.00, 0.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:54:47', '', '', 1),
(2071, '6977158689972', 'Guitar Gummy', 1, 0, 0, 'na', 0, 0, 25.67, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:55:03', '', '', 1),
(2072, '8941154031996', 'Bombay Chanachure 300gm', 1, 0, 0, 'na', 0, 0, 86.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:55:17', 'Admin', '2025-07-10 20:15:05', 1),
(2073, '8941154031408', 'Bombay Chanachure 500gm', 1, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:56:10', '', '', 1),
(2074, '831730005719', 'Pran Flattened Rice 500gm', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:57:24', 'Admin', '2025-07-02 14:34:59', 1),
(2075, '846656002179', 'Pran Flattened Rice 250gm', 1, 0, 0, 'na', 0, 0, 32.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 21:57:58', 'Admin', '2025-07-02 14:35:48', 1),
(2076, '816903000982', 'Puffed Rice ACi 500gm', 1, 0, 0, 'na', 0, 0, 62.50, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:00:25', '', '', 1),
(2077, '764460655193', 'Strawberry Swiss Roll 140gm', 1, 0, 0, 'na', 0, 0, 116.00, 140.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:01:13', 'Admin', '2025-06-03 22:02:52', 1),
(2078, '8941001981047', 'Puffed Rice Teer 400gm', 1, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:01:30', '', '', 1),
(2079, '8941100513811', 'Ruchi Puffed Rice 200gm', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:02:22', '', '', 1),
(2080, '8941100513828', 'Ruchi Puffed Rice 400gm', 1, 0, 0, 'na', 0, 0, 55.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:03:25', '', '', 1),
(2081, '8946000009686', 'Strawberry Swiss Roll 200gm', 1, 0, 0, 'na', 0, 0, 160.00, 190.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:03:44', '', '', 1),
(2082, '8946000009693', 'Fruit Cake 300gm', 1, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:04:34', '', '', 1),
(2083, '8946000009983', 'Classic Brownies 180gm', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:05:29', '', '', 1),
(2084, '725765132628', 'Orange Cake 170gm ', 1, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:06:10', '', '', 1),
(2085, '8946000009655', 'Chocolate Swiss Roll 200gm', 1, 0, 0, 'na', 0, 0, 160.00, 190.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:07:22', '', '', 1),
(2086, '745178898447', 'Oats Cookies', 1, 0, 0, 'na', 0, 0, 140.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:08:18', '', '', 1),
(2087, '745178898478', 'Salted Cookies', 1, 0, 0, 'na', 0, 0, 140.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:09:01', '', '', 1),
(2088, '745178898454', 'Danish Butter Cookies', 1, 0, 0, 'na', 0, 0, 140.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:10:23', '', '', 1),
(2089, '764460655186', 'Chocolate Swiss Roll 140gm', 1, 0, 0, 'na', 0, 0, 116.00, 140.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:11:04', '', '', 1),
(2090, '725765132604', 'Butter CAke 170gm', 1, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:11:35', '', '', 1),
(2091, '725765132659', 'Pound Cake 220gm ', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:12:16', '', '', 1),
(2092, '831730005559', 'Vinegar Pran 300ml', 2, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:12:21', '', '', 1),
(2093, '8946000009433', 'Vanilla Muffin 30gm', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:12:57', '', '', 1),
(2094, '8169003007309', 'Vinegar Pran 650ml', 2, 0, 0, 'na', 0, 0, 33.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:13:21', '', '', 1),
(2095, '8946000009921', 'Cappuccino Muffin 40gm', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:13:47', '', '', 1),
(2096, '8946000009488', 'Vanilla Layer Cake 27gm', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:14:27', '', '', 1),
(2097, '8946000009440', 'Chocolate Layer Cake 27gm', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:15:02', '', '', 1),
(2098, '8946000009419', 'Chocolate Muffin Cake 30gm', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:15:47', '', '', 1),
(2099, '5735745714485', 'Chocochips Muffin Cake 33gm', 1, 0, 0, 'na', 0, 0, 29.17, 35.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:17:09', '', '', 1),
(2100, '8941102463848', 'Vim Liqued 210ml', 2, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:19:20', '', '', 1),
(2101, '070177077693', 'Twings English Breakfast Tea ', 2, 0, 0, 'na', 0, 0, 590.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:23:26', 'Admin', '2025-06-24 21:07:38', 1),
(2102, '8941100502105', 'Sepnil Tea oil pum Liquid H/W 200ml', 2, 0, 0, 'na', 0, 0, 92.33, 105.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:24:25', '', '', 1),
(2103, '070177077563', 'Twinings Earl Grey Tea', 2, 0, 0, 'na', 0, 0, 590.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:26:57', 'Admin', '2025-06-24 21:07:51', 1),
(2104, '8941183001083', 'Jet Aroma + 200gm', 2, 0, 0, 'na', 0, 0, 51.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:27:36', '', '', 1),
(2105, '070177091361', 'Twinings Pure Green Tea', 2, 0, 0, 'na', 0, 0, 590.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:27:41', '', '', 1),
(2106, 'P02105', 'Odonil 5 in1', 2, 0, 0, 'na', 0, 0, 270.00, 325.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:28:31', '', '', 1),
(2107, '9556183960750', 'Instant Oatmeal 1kg', 2, 0, 0, 'na', 0, 0, 920.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:29:30', 'Admin', '2025-06-21 18:35:06', 1),
(2108, '8941183001090', 'Jet Aroma+ 500gm', 2, 0, 0, 'na', 0, 0, 130.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-03 22:29:30', '', '', 1),
(2109, '8941140545094', 'Kidlon Hand Wash pum 200ml', 2, 0, 0, 'na', 0, 0, 79.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:30:52', '', '', 1),
(2110, '9556183910144', 'Captain Oats 1kg', 1, 0, 0, 'na', 0, 0, 920.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:30:59', 'Admin', '2025-06-21 18:32:47', 1),
(2111, '8901023010002', 'Hit Anti Roach Gel 20gm', 2, 0, 0, 'na', 0, 0, 200.00, 225.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:32:51', '', '', 1),
(2112, '9556183960941', 'Captain Classic Rolled Oats 800gm', 2, 0, 0, 'na', 0, 0, 750.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:33:04', 'Admin', '2025-06-26 15:41:09', 1),
(2113, '745110769262', 'Liquid Mosquito Repellent 45ml', 2, 0, 0, 'na', 0, 0, 108.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:33:51', '', '', 1),
(2114, '9555263800368', 'Baby Oats Organic 500gm', 2, 0, 0, 'na', 0, 0, 500.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:34:17', '', '', 1),
(2115, '745110769293', 'Gold Flash Liquid Vapouriser 45ml', 2, 0, 0, 'na', 0, 0, 205.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:35:45', '', '', 1),
(2116, '745110769286', 'Power Activ+ Liquid Vapouriser 45ml', 2, 0, 0, 'na', 0, 0, 170.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:37:18', '', '', 1),
(2117, '8936029057751', 'Dalos Apple Cane', 2, 0, 0, 'na', 0, 0, 115.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:37:58', 'Admin', '2025-06-21 18:29:47', 1),
(2118, '8936029057553', 'Dalos Grape Cane', 2, 0, 0, 'na', 0, 0, 115.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:39:25', 'Admin', '2025-06-21 18:30:06', 1),
(2119, '8901262152341', 'Amul Kool Gold Premium Kesar ', 2, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:40:46', '', '', 1),
(2120, '', 'Tal Misri Dulal Chandro Var 200/=', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:44:46', '', '', 1),
(2121, 'P02121', 'Tal Misri Dulal Chandro Var 120/=', 2, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:45:19', '', '', 1),
(2122, 'P02122', 'Tal Misri Dulal Chandro Var 350/=', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:46:08', '', '', 1),
(2123, '8941100518700', 'Radhuni Soy Sssauce 300gm', 2, 0, 0, 'na', 0, 0, 150.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:47:55', '', '', 1),
(2124, '80135876', 'Nutella 400gm', 2, 0, 0, 'na', 0, 0, 550.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:53:56', 'Admin', '2025-06-24 16:57:44', 1),
(2125, 'P021894119304140625', 'Bashundhara Toilet Tissu 4pcs Pak', 2, 0, 0, 'na', 0, 0, 74.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:56:09', '', '', 1),
(2126, '8901207045370', 'Dabur Honey 50gm', 2, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 22:59:10', '', '', 1),
(2127, '8901207005374', 'Dabur Honey 100gm', 2, 0, 0, 'na', 0, 0, 112.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:00:06', '', '', 1),
(2128, '8941100511497', 'Radhuni Chili Powder 200gm', 2, 0, 0, 'na', 0, 0, 138.50, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:02:36', '', '', 1),
(2129, '8941100511527', 'Radhuni Coriander Powder 200gm', 2, 0, 0, 'na', 0, 0, 110.00, 125.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:03:58', '', '', 1),
(2130, '8941100511558', 'Radhuni Cumin Powder 200gm', 2, 0, 0, 'na', 0, 0, 300.00, 330.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:05:07', '', '', 1),
(2131, '7312202051647', 'Tang Orange 500gm', 2, 0, 0, 'na', 0, 0, 400.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:06:01', '', '', 1),
(2132, '7622202051623', 'Tang Mango 500gm', 2, 0, 0, 'na', 0, 0, 390.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:06:54', '', '', 1),
(2133, '7622201129088', 'Tang Mango 375gm', 2, 0, 0, 'na', 0, 0, 380.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:10:30', 'Admin', '2025-06-21 18:34:44', 1),
(2134, '8169003006623', 'Coriander Powder 200gm', 2, 0, 0, 'na', 0, 0, 106.00, 125.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:14:44', '', '', 1),
(2135, '8169003006739', 'Chilli Powder 200gm', 2, 0, 0, 'na', 0, 0, 134.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:16:21', '', '', 1),
(2136, '8169003006746', 'Turmaric Powder 200gm', 2, 0, 0, 'na', 0, 0, 120.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:17:21', '', '', 1),
(2137, '8941100511787', 'Radhuni Khisri Mix 500g', 1, 0, 0, 'na', 0, 0, 0.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:33:14', '', '', 1),
(2138, '8169003006692', 'Chicken Tandoori Masala', 2, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:34:07', '', '', 1),
(2139, '8941100511862', 'Radhuni Faluda Mix 250g', 1, 0, 0, 'na', 0, 0, 110.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:34:38', '', '', 1),
(2140, '8941693010919', 'Kala Bhuna Masala 80gm', 2, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:35:29', '', '', 1),
(2141, '8169003009730', 'Firni Mix 150gm', 2, 0, 0, 'na', 0, 0, 55.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:37:05', '', '', 1),
(2142, '8941100511176', 'Radhuni Ready Mix Maser Masla 100g', 1, 0, 0, 'na', 0, 0, 0.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:37:10', '', '', 1),
(2143, '816903000227', 'Meat Curry Masla 100gm', 2, 0, 0, 'na', 0, 0, 78.10, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:38:39', 'Admin', '2025-07-07 18:01:34', 1),
(2144, '8941100511282', '	Radhuni  Ready Mix Mansher masala 100g', 1, 0, 0, 'na', 0, 0, 90.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:38:47', '', '', 1),
(2145, '8941100511206', 'Radhuni Ready Mix ', 1, 0, 0, 'na', 0, 0, 60.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:39:25', '', '', 1),
(2146, '685226004', 'Mujaan Garam Masala 20gm', 2, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:40:09', '', '', 1),
(2147, '8941100511756', 'Radhuni  Firni Mix', 1, 0, 0, 'na', 0, 0, 0.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:40:22', '', '', 1),
(2148, '8941100511886', 'Radhuni  Khir mix 150g', 1, 0, 0, 'na', 0, 0, 0.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:41:22', '', '', 1),
(2149, '685226007', 'Mujaan Corn Flour 150gm', 2, 0, 0, 'na', 0, 0, 60.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:42:52', '', '', 1),
(2150, '8941100511435', 'Radhuni Mezbani Gharur Masala  68g', 1, 0, 0, 'na', 0, 0, 93.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:42:56', '', '', 1),
(2151, '685226006', 'Mujaan Cocoa Powder 50gm', 2, 0, 0, 'na', 0, 0, 95.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:43:51', '', '', 1),
(2152, '8941100511374', 'Radhun Ready Mix Birani mashala 40g', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:44:32', '', '', 1),
(2153, '685226005', 'Mujaan Baking Powder 150gm', 2, 0, 0, 'na', 0, 0, 70.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:45:39', '', '', 1),
(2154, '8941100511909', 'Radhun Fried  Chicken Mix 75g', 1, 0, 0, 'na', 0, 0, 73.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:46:27', '', '', 1),
(2155, '685226008', 'Mujaan Custered Powder 150gm', 2, 0, 0, 'na', 0, 0, 70.00, 95.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:46:46', '', '', 1),
(2156, 'P021894110051141156', 'Radhuni Chicken Tanduri Masala 50gm', 1, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:50:09', 'Admin', '2025-06-03 23:55:00', 1),
(2157, '8941100510131', 'Radhun Moricher Ghura', 1, 0, 0, 'na', 0, 0, 197.00, 345.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:50:48', 'Admin', '2025-06-03 23:54:44', 1),
(2158, '8941100511084', 'Radhuni Borhani Masala 50gm', 1, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:51:10', 'Admin', '2025-06-03 23:53:47', 1),
(2159, '8941100511404', 'Radhuni Tehari Masala 40gm', 1, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:51:56', 'Admin', '2025-06-03 23:53:25', 1),
(2160, '8941100511916', 'Radhuni BBQ Masala 50gm', 1, 0, 0, 'na', 0, 0, 70.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:52:29', 'Admin', '2025-06-03 23:53:10', 1),
(2161, '8941100510056', 'Radhuni Holuder Ghura 500g', 1, 0, 0, 'na', 0, 0, 295.00, 335.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:52:37', 'Admin', '2025-06-03 23:53:01', 1),
(2162, '8169003006616', 'Cumin Powder 200gm', 1, 0, 0, 'na', 0, 0, 288.00, 330.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:53:23', 'Admin', '2025-06-03 23:53:58', 1),
(2163, '8941100511763', 'Radhuni Kasundi 285ml', 2, 0, 0, 'na', 0, 0, 57.50, 65.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-03 23:55:16', '', '', 1),
(2164, '8941100510032', 'Radhuni Holuder Ghura 200', 1, 0, 0, 'na', 0, 0, 126.00, 145.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-03 23:56:13', '', '', 1),
(2165, '8941100519677', 'Radhuni Premium ghee 200gm', 2, 0, 0, 'na', 0, 0, 364.00, 415.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-03 23:56:31', '', '', 1),
(2166, '8941100519660', 'Radhuni Premium Ghee 100gm', 2, 0, 0, 'na', 0, 0, 197.00, 225.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-03 23:56:59', '', '', 1),
(2167, '820466533108', 'Teer Sugar 1kg', 1, 0, 0, 'na', 0, 0, 110.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:57:55', '', '', 1),
(2168, '815300000205', 'ACI Pure Moshur Dal  500g', 1, 0, 0, 'na', 0, 0, 78.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-03 23:59:22', '', '', 1),
(2169, '8169003009693', 'Ghee Aci 100gm', 2, 0, 0, 'na', 0, 0, 190.00, 205.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 00:00:16', '', '', 1),
(2170, '815300000007', 'ACI Pure Moshur Dal  1kg', 1, 0, 0, 'na', 0, 0, 145.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:00:22', '', '', 1),
(2171, '8169003009709', 'Ghee 200gm', 2, 0, 0, 'na', 0, 0, 350.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:01:09', '', '', 1),
(2172, '830506250100', 'Tear Moshur dal 1kg', 1, 0, 0, 'na', 0, 0, 112.00, 122.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:02:15', '', '', 1),
(2173, '8941100510308', 'Radhuni  Zirar Ghura 500g', 1, 0, 0, 'na', 0, 0, 0.00, 750.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:04:06', '', '', 1),
(2174, '8941100511794', 'Radhuni Shemai 200g', 1, 0, 0, 'na', 0, 0, 38.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:05:53', '', '', 1),
(2175, '8941100510117', 'Radhuni Moricher Ghura 200g', 1, 0, 0, 'na', 0, 0, 121.50, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:07:22', '', '', 1),
(2176, '817516226103', 'Teer salt 1kg', 2, 0, 0, 'na', 0, 0, 36.00, 42.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:07:47', '', '', 1),
(2177, '8941100512104', 'Square Chashi Chini Ghura 1 kg ', 1, 0, 0, 'na', 0, 0, 138.00, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:08:28', '', '', 1),
(2178, '8941100510216', 'Radhuni Dhuniah Ghra 500g', 1, 0, 0, 'na', 0, 0, 210.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:09:27', '', '', 1),
(2179, '817516226059', 'Teer salt 500g', 2, 0, 0, 'na', 0, 0, 18.00, 22.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:09:29', '', '', 1),
(2180, '8941100510285', 'Radhuni Zirar Ghura 200g', 1, 0, 0, 'na', 0, 0, 0.00, 310.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:10:22', '', '', 1),
(2181, '8941100510193', 'Radhuni Dhuniah Ghra 200g', 1, 0, 0, 'na', 0, 0, 95.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:11:28', '', '', 1),
(2182, '4820078573581', 'Blanc sunflower oil 5l', 2, 0, 0, 'na', 0, 0, 1900.00, 2000.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:12:25', '', '', 1),
(2183, 'Wikipedia', 'Fortune Basmoti Rice', 1, 0, 0, 'na', 0, 0, 0.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:14:12', '', '', 1),
(2184, '8153003000422', 'Rice Bran oil 5l ', 2, 0, 0, 'na', 0, 0, 1020.00, 1080.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:14:31', '', '', 1),
(2185, '8169003006852', 'Aroma Chinigura Rice 1kg', 1, 0, 0, 'na', 0, 0, 126.25, 155.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:15:39', '', '', 1),
(2186, '812546159230', 'Teer soyaben oil 5l', 2, 0, 0, 'na', 0, 0, 890.00, 922.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:15:46', 'Admin', '2025-06-04 00:17:05', 1),
(2187, '818416262109', 'Teer Chinigura Rice', 1, 0, 0, 'na', 0, 0, 155.00, 165.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:16:44', '', '', 1),
(2188, '8153003001085', 'ACI Nutrilife Atta', 1, 0, 0, 'na', 0, 0, 120.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:18:23', '', '', 1),
(2189, '811486166100', 'Teer Mustard oil 1l', 2, 0, 0, 'na', 0, 0, 270.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:19:31', '', '', 1),
(2190, '814216221124', 'Tear Atta 2kg', 1, 0, 0, 'na', 0, 0, 94.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:19:33', '', '', 1),
(2191, '83044625610', 'Teer Rice Flour', 1, 0, 0, 'na', 0, 0, 87.00, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:20:34', '', '', 1),
(2192, '8153003000354', 'ACI PURE Ata 1 kg', 1, 0, 0, 'na', 0, 0, 45.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:21:26', '', '', 1),
(2193, '811486166056', 'Teer Mustard Oil 500ml', 2, 0, 0, 'na', 0, 0, 135.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:22:25', '', '', 1),
(2194, '8941197142093', 'Teer  Semolina 500g', 1, 0, 0, 'na', 0, 0, 40.00, 48.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:22:30', '', '', 1),
(2195, '814336236107', 'Teer Flour 1 kg', 1, 0, 0, 'na', 0, 0, 63.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:23:39', '', '', 1),
(2196, '81148616602', 'Teer Mustard Oil 250ml', 2, 0, 0, 'na', 0, 0, 65.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:23:57', '', '', 1),
(2197, '811486166087', 'Teer Mustard Oil 80ml', 2, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:26:54', '', '', 1),
(2199, '814216221100', 'Teer Atta 1kg', 1, 0, 0, 'na', 0, 0, 47.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:28:32', '', '', 1),
(2200, '8153003000361', 'ACI Pure Atta 2kg', 1, 0, 0, 'na', 0, 0, 87.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:29:24', '', '', 1),
(2201, '784196632879', 'Olive Oil', 1, 0, 0, 'na', 0, 0, 0.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:31:45', '', '', 1),
(2202, '8420701106320', 'RS Castor Oil', 1, 0, 0, 'na', 0, 0, 0.00, 395.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:32:39', '', '', 1),
(2203, '8941158124229', 'Earth Beauty Moisturizer Creme hydratante 50ml', 2, 0, 0, 'na', 0, 0, 300.00, 395.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:34:28', '', '', 1),
(2204, '8941158124182', 'Earth Beauty Onion Oil Black Seed 100ml', 2, 0, 0, 'na', 0, 0, 150.00, 199.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:35:48', '', '', 1),
(2205, '8941158124199', 'Earth Beauty Onion Oil Argan oil 100ml', 2, 0, 0, 'na', 0, 0, 150.00, 199.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:36:44', '', '', 1),
(2206, '8420701103299', 'RS Rafael Salgado', 2, 0, 0, 'na', 0, 0, 260.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:38:03', '', '', 1),
(2207, '8941158124205', 'Earth BeautyCoconut oil 100ml', 2, 0, 0, 'na', 0, 0, 150.00, 199.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:39:06', '', '', 1),
(2208, '8420701103329', 'RS Extra Virgin oil', 2, 0, 0, 'na', 0, 0, 340.00, 355.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:40:13', '', '', 1),
(2209, '8944000574791', 'Skin Cafe Rosemary Essential oil 10ml', 2, 0, 0, 'na', 0, 0, 300.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:41:25', 'Admin', '2025-06-19 09:44:03', 1),
(2210, '8944000592436', 'Ombre Blue Pearl ', 2, 0, 0, 'na', 0, 0, 170.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:43:25', '', '', 1),
(2211, '8944000592443', 'Ombre Golden Hour Pearl', 2, 0, 0, 'na', 0, 0, 170.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:44:32', '', '', 1),
(2212, '8944000592429', 'Ombre Bali Trip 9ml;', 2, 0, 0, 'na', 0, 0, 170.00, 230.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:45:17', '', '', 1),
(2213, '8944000575217', 'Groome EYE BROW', 2, 0, 0, 'na', 0, 0, 180.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:47:49', '', '', 1),
(2214, '8944000575460', 'Groome EYE BROW Facial Razor', 2, 0, 0, 'na', 0, 0, 180.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:49:00', '', '', 1),
(2215, '8944000575200', 'Groome Tea tree Nose Strip', 2, 0, 0, 'na', 0, 0, 146.25, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:50:27', '', '', 1),
(2216, '8944000575187', 'Groome  Charcoal Nose Strip', 2, 0, 0, 'na', 0, 0, 146.25, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:52:03', '', '', 1),
(2217, '8941100512661', 'Radhuni Sorishar oil 1L', 2, 0, 0, 'na', 0, 0, 310.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:54:05', '', '', 1),
(2218, '8941100512647', 'Radhuni Sorishar oil 250ml', 2, 0, 0, 'na', 0, 0, 77.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:55:50', '', '', 1),
(2219, '1685226206', 'Mujaan orange Flavouring 28ml', 2, 0, 0, 'na', 0, 0, 40.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:57:06', '', '', 1),
(2220, '1685226205', 'Mujaan Chocolate Brown Food 28ml', 2, 0, 0, 'na', 0, 0, 35.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 00:58:38', '', '', 1),
(2221, '685226012', 'Mujaan orenge Suitable ', 2, 0, 0, 'na', 0, 0, 80.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:00:48', '', '', 1),
(2222, '1685226207', 'Mujaan Vanilla', 2, 0, 0, 'na', 0, 0, 45.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:01:50', '', '', 1),
(2223, '8941193071618', 'Bashundhara Pocket Tissue', 2, 0, 0, 'na', 0, 0, 7.50, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:03:05', '', '', 1),
(2224, '8941100512630', 'Radhuni Sorishar oil 80 ml', 2, 0, 0, 'na', 0, 0, 27.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:04:29', '', '', 1),
(2225, '685226281', 'All Natural Corn Flour 150', 2, 0, 0, 'na', 0, 0, 48.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:05:51', '', '', 1),
(2226, '685226285', '	All Natural Alkali', 2, 0, 0, 'na', 0, 0, 57.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:06:57', '', '', 1),
(2227, '1685226202', 'All Natural Mujaan Black Pepper', 2, 0, 0, 'na', 0, 0, 70.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:08:08', '', '', 1),
(2228, 'P02228', 'Mujaan Ada Powder', 1, 0, 0, 'na', 0, 0, 70.00, 100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 01:10:09', '', '', 1),
(2229, '685226214', 'Mujaan Bit Salt', 1, 0, 0, 'na', 0, 0, 30.00, 55.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 01:11:04', '', '', 1),
(2230, '1685226204', 'Mujaan Chaat Masala 50g', 1, 0, 0, 'na', 0, 0, 48.00, 65.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 01:13:15', '', '', 1),
(2231, '1685226203', 'Mujaan White Pepper 50g', 1, 0, 0, 'na', 0, 0, 80.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 01:14:04', '', '', 1),
(2232, 'P02232', 'Mujaan Ager 30gm', 1, 0, 0, 'na', 0, 0, 80.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 01:15:45', '', '', 1),
(2233, '8901396513704', 'Mortein 2 in 1 400ml', 2, 0, 0, 'na', 0, 0, 320.00, 415.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:16:21', 'Admin', '2025-06-04 01:16:33', 1),
(2234, '8901023019876', 'Expert Rich Creme', 2, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:17:15', 'Admin', '2025-06-04 01:18:47', 1),
(2235, '745110769156', 'Expert Rich Creme 18ml', 2, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:18:17', 'Admin', '2025-06-04 01:18:39', 1),
(2236, '8901023019913', 'New Export Rich Creme 20g', 2, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:20:02', '', '', 1),
(2237, '8941100296615', 'Maggi Checken Magic mix 8g', 1, 0, 0, 'na', 0, 0, 0.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:21:43', '', '', 1),
(2238, '8941102833375', 'Dettol Skincare 170ml', 2, 0, 0, 'na', 0, 0, 72.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:23:24', '', '', 1),
(2239, '8906105101425', 'Horlicks 15 g', 1, 0, 0, 'na', 0, 0, 13.27, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:23:59', '', '', 1),
(2240, '8906105101418', 'Unilever Glue Kos D ', 1, 0, 0, 'na', 0, 0, 9.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:25:22', '', '', 1),
(2241, '8941100512296', 'chopstick 12 Pac ', 1, 0, 0, 'na', 0, 0, 213.00, 245.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:27:20', '', '', 1),
(2242, '8941100283264', 'Dettol Mini Original', 2, 0, 0, 'na', 0, 0, 13.06, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:27:54', '', '', 1),
(2243, '841165110315', 'Mr Nuodlres 16 Pak', 1, 0, 0, 'na', 0, 0, 285.00, 335.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:29:15', '', '', 1),
(2244, '8941100788165', 'Dettol Re-Energize 200ml', 2, 0, 0, 'na', 0, 0, 99.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:30:08', '', '', 1),
(2245, '8941100515174', 'chopstick 8 pac', 1, 0, 0, 'na', 0, 0, 153.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:30:39', '', '', 1),
(2246, '8941100294833', 'Maggi 2 Minute', 1, 0, 0, 'na', 0, 0, 85.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:32:15', '', '', 1),
(2247, '8941102988563', 'Harpic Liquid 750ml ', 2, 0, 0, 'na', 0, 0, 156.40, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:33:13', '', '', 1),
(2248, '8801073110502', 'Buldak Hot Chicken', 1, 0, 0, 'na', 0, 0, 162.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:33:36', '', '', 1),
(2249, '074603003287', 'Ramen Kimachi', 1, 0, 0, 'na', 0, 0, 162.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:34:41', '', '', 1),
(2250, '8801073113428', 'Buldak Hochi', 1, 0, 0, 'na', 0, 0, 162.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:35:45', '', '', 1),
(2251, '8941100929858', 'DETTOL Original 50gm', 2, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:36:04', '', '', 1),
(2252, '8941100294901', 'Maggi masala bast', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:36:54', '', '', 1),
(2253, 'P02252', 'Dettol Germ Defence Liquid 50ML', 2, 0, 0, 'na', 0, 0, 40.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:37:55', '', '', 1),
(2254, '8941100510261', 'Radhuni Zirar Gura 100g', 1, 0, 0, 'na', 0, 0, 0.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:39:52', '', '', 1),
(2255, '8941100510100', 'Radhuni Moricher Ghura', 1, 0, 0, 'na', 0, 0, 0.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:40:56', '', '', 1),
(2256, '8906055793039', 'Shot Hitman Parfum', 2, 0, 0, 'na', 0, 0, 1272.00, 1590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:41:44', '', '', 1),
(2257, '8906055793060', 'Shot Savage Parfum', 2, 0, 0, 'na', 0, 0, 1272.00, 1590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:42:36', '', '', 1),
(2258, '8941100510988', 'Radhuni  Ghura pachforon 50g', 1, 0, 0, 'na', 0, 0, 0.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:43:04', '', '', 1),
(2259, '8906055793022', 'Wattagirli Flora Perfum ', 2, 0, 0, 'na', 0, 0, 1272.00, 1590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:43:47', '', '', 1),
(2260, '8904238302207', 'Real Man Fresh Mood Spray', 2, 0, 0, 'na', 0, 0, 316.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:44:55', '', '', 1),
(2261, '8941100510995', 'Radhuni  pachforon 50g', 1, 0, 0, 'na', 0, 0, 0.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:45:12', '', '', 1),
(2262, '8904238302214', 'Real Man Fresh Active Spray', 2, 0, 0, 'na', 0, 0, 316.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:45:44', '', '', 1),
(2263, '8904238302191', 'Real Man Fresh Spirit Spray', 2, 0, 0, 'na', 0, 0, 316.13, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:46:25', '', '', 1),
(2264, '8941100510025', 'Radhuni Holuder 100g', 1, 0, 0, 'na', 0, 0, 0.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:46:26', '', '', 1),
(2265, '8904238302184', 'Real Man Fresh Morning Spray', 2, 0, 0, 'na', 0, 0, 316.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:47:15', '', '', 1),
(2266, '6085010092553', 'The Warrior Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:48:21', 'Admin', '2025-06-04 01:49:42', 1),
(2267, '6085010092539', 'Tag-Him Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:49:30', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(2268, '6085010092522', 'Shades Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:50:25', '', '', 1),
(2269, 'P02265', 'Dove 4', 2, 0, 0, 'na', 0, 0, 3.43, 4.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:50:28', '', '', 1),
(2270, 'P02270', 'Clear 4', 2, 0, 0, 'na', 0, 0, 0.00, 4.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:51:12', '', '', 1),
(2271, '6085010092560', 'Derby Club House Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:51:16', '', '', 1),
(2272, '6085010094335', 'Club De Nuit Man Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:51:59', '', '', 1),
(2273, 'P02271', 'Dove  4 Conditionar', 2, 0, 0, 'na', 0, 0, 3.48, 4.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:52:10', '', '', 1),
(2274, '6085010094892', 'Hunter Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:52:42', '', '', 1),
(2275, 'P02274', 'Sunsilk 2', 2, 0, 0, 'na', 0, 0, 1.75, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:53:25', '', '', 1),
(2276, '6085010094342', 'Club De Nuit Woman Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:53:30', '', '', 1),
(2277, '6085010041704', 'Blue Homme Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:54:17', '', '', 1),
(2278, '6297000842219', 'Ossum Desire Perfum', 2, 0, 0, 'na', 0, 0, 336.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:55:55', '', '', 1),
(2279, 'P02276', 'Clinic Plus +', 2, 0, 0, 'na', 0, 0, 1.75, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:56:05', '', '', 1),
(2280, 'P02280', 'Sunsilk', 2, 0, 0, 'na', 0, 0, 0.00, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:56:32', '', '', 1),
(2281, '6297001034019', 'Ossum Fantasy Perfum', 2, 0, 0, 'na', 0, 0, 336.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:56:37', '', '', 1),
(2282, 'P02281', 'Dove 4 taka 1 min Conditioner', 2, 0, 0, 'na', 0, 0, 3.43, 4.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:58:09', '', '', 1),
(2283, '6297001034002', 'Ossum Passion Perfum', 2, 0, 0, 'na', 0, 0, 336.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:58:39', '', '', 1),
(2284, 'P02283', 'Clear 5', 2, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:58:50', '', '', 1),
(2285, '6297000842233', 'Ossum Cherish Perfum', 2, 0, 0, 'na', 0, 0, 336.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 01:59:22', '', '', 1),
(2286, '6294015130331', 'Magnum Carnation Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:00:47', '', '', 1),
(2287, '8906189770432', 'Lux mini 35g', 2, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:00:56', '', '', 1),
(2288, '6294015130324', 'Magnum Sepia Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:01:17', '', '', 1),
(2289, '6294015130317', 'Magnum Pearl River Perfum', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:02:01', '', '', 1),
(2290, 'P02288', 'Lux Flaw less Glow 35g', 2, 0, 0, 'na', 0, 0, 0.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:02:15', '', '', 1),
(2291, 'P02291', 'Sunsilk 3 taka', 2, 0, 0, 'na', 0, 0, 2.58, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:03:07', '', '', 1),
(2292, '025929125511', 'Bondage Body Spray', 2, 0, 0, 'na', 0, 0, 515.00, 645.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:03:52', '', '', 1),
(2293, 'P02292', 'Clear Dadrap 4', 2, 0, 0, 'na', 0, 0, 3.00, 4.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:03:56', '', '', 1),
(2294, '025929166538', 'Extreme Body Spray', 2, 0, 0, 'na', 0, 0, 515.00, 645.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:04:44', '', '', 1),
(2295, 'P02294', 'Clear Dandrop', 2, 0, 0, 'na', 0, 0, 0.00, 4.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:05:39', '', '', 1),
(2296, '8904238300647', 'Ossum Blossom Perfum', 2, 0, 0, 'na', 0, 0, 397.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:06:26', '', '', 1),
(2297, '8904238300623', 'Ossum Romance Perfum', 2, 0, 0, 'na', 0, 0, 396.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:07:55', '', '', 1),
(2298, 'P02296', 'Radhuni dhuniah Ghura 50g', 2, 0, 0, 'na', 0, 0, 0.00, 32.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:08:33', '', '', 1),
(2299, '8906055792759', 'Layerr Shot Emperor Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 435.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:10:00', '', '', 1),
(2300, '8941100511169', 'Radhuni Ready Mix Maser Masla 20g', 2, 0, 0, 'na', 0, 0, 0.00, 18.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:10:39', '', '', 1),
(2301, '8906055792797', 'Layerr Shot Thunder Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 435.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:11:34', '', '', 1),
(2302, '8941100511275', 'Radhuni  Murgir Masala 20g', 2, 0, 0, 'na', 0, 0, 0.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:12:38', '', '', 1),
(2303, '8906055790359', 'Layerr Shot Absolute Craze Body Spray', 2, 0, 0, 'na', 0, 0, 420.00, 525.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:12:41', 'Admin', '2025-06-04 02:17:14', 1),
(2304, '8906055790328', 'Layerr Shot Royal Jade Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:13:27', '', '', 1),
(2305, '8941100511305', 'Radhuni Garur Masala', 1, 0, 0, 'na', 0, 0, 0.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:13:40', '', '', 1),
(2306, '8906055790281', 'Layerr Shot Power Play Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:14:08', '', '', 1),
(2307, '8906055790304', 'Layerr Shot Redstallion Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:15:42', '', '', 1),
(2308, '8941100510186', 'Radhuni Dhuniar Ghura 100g', 1, 0, 0, 'na', 0, 0, 0.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:16:30', '', '', 1),
(2309, '8906055790380', 'Layerr Shot Absolute Power Body Spray', 2, 0, 0, 'na', 0, 0, 420.00, 525.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:18:14', '', '', 1),
(2310, '8941100510094', 'Radhuni Moricher Ghura 50g', 1, 0, 0, 'na', 0, 0, 0.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:18:21', '', '', 1),
(2311, '8904238300630', 'Ossum Pleasure Perfum', 2, 0, 0, 'na', 0, 0, 397.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:19:25', '', '', 1),
(2312, '8941100511015', 'Radhuni Gorom masala 35', 1, 0, 0, 'na', 0, 0, 0.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:20:27', '', '', 1),
(2313, '8941100511022', 'Radhuni Gorom masala 40 g', 1, 0, 0, 'na', 0, 0, 0.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:22:29', '', '', 1),
(2314, '8941100511138', 'Radhuni  Gharur Masala 20', 1, 0, 0, 'na', 0, 0, 0.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:24:39', '', '', 1),
(2315, '8906055790182', 'Layerr Wattagirli Mystic Island Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:26:55', '', '', 1),
(2316, '8906055790342', 'Layerr Wattagirli Fresh Citrus Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:27:46', 'Admin', '2025-06-04 02:29:25', 1),
(2317, '8906055790205', 'Layerr Wattagirli Secret Crush Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:29:15', '', '', 1),
(2318, '8906055793220', 'Layerr Wattagirli Champaca Delight Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:30:16', '', '', 1),
(2319, '8906055790236', 'Layerr Wattagirli Amber Kiss Body Spray', 2, 0, 0, 'na', 0, 0, 396.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:31:21', '', '', 1),
(2320, '8906055790366', 'Layerr Shot Absolute Game Body Spray', 2, 0, 0, 'na', 0, 0, 420.00, 525.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 02:32:40', '', '', 1),
(2321, '025929206531', 'Colour Colours O Colours', 2, 0, 0, 'na', 0, 0, 872.00, 1090.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 03:54:24', 'Admin', '2025-06-04 03:54:37', 1),
(2322, '025929121407', 'Colour Pink O Pink', 2, 0, 0, 'na', 0, 0, 872.00, 1090.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 03:55:38', '', '', 1),
(2323, '025929121605', 'Colour Purple O Purple', 2, 0, 0, 'na', 0, 0, 872.00, 1090.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 03:56:23', '', '', 1),
(2324, '8906189771354', 'Lux Rose 2in1 90gm Sope', 2, 0, 0, 'na', 0, 0, 100.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 05:51:43', 'Admin', '2025-06-04 05:57:00', 1),
(2325, '8941102468423', 'Lux Jasmine 2in1 90gm Sope', 2, 0, 0, 'na', 0, 0, 100.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 05:52:59', 'Admin', '2025-06-04 05:56:50', 1),
(2326, '8941102468416', 'Lux Rose 2in1 100gm Sope', 2, 0, 0, 'na', 0, 0, 100.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 05:54:37', 'Admin', '2025-06-04 05:56:33', 1),
(2327, '8941102466801', 'Lifebuoy lemon 2in1 100gm sope', 2, 0, 0, 'na', 0, 0, 91.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 05:56:20', '', '', 1),
(2328, '8906189771330', 'Lux jasmine 90gm Sope', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 05:57:56', '', '', 1),
(2329, '8941102464746', 'Lifebuoy Liquid Total 170ml 2in1', 2, 0, 0, 'na', 0, 0, 131.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 05:59:24', '', '', 1),
(2330, '8941102464760', 'Lifebuoy Mild Care Liquid 170ml 2in1', 2, 0, 0, 'na', 0, 0, 131.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:00:44', '', '', 1),
(2331, '8941102466788', 'Lifebuoy Total 2in1 100gm sope', 2, 0, 0, 'na', 0, 0, 91.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:04:23', 'Admin', '2025-06-04 06:05:54', 1),
(2332, '8906189771408', 'Lifebuoy Total 90gm sope', 2, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:07:10', '', '', 1),
(2333, '8941102467884', 'Lifebuoy Mild Care Liquid 170ml ', 2, 0, 0, 'na', 0, 0, 74.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:08:32', '', '', 1),
(2334, '8941102469994', 'Lifebuoy lemon 100gm sope', 2, 0, 0, 'na', 0, 0, 50.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:09:41', '', '', 1),
(2335, '8906189771323', 'Lux Rose 90gm Sope', 2, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:10:24', '', '', 1),
(2336, '8909106030534', 'Glow & Lovely Multi Vitamin 80gm', 2, 0, 0, 'na', 0, 0, 275.00, 285.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:11:53', 'Admin', '2025-06-04 06:12:29', 1),
(2338, '8901058008494', 'KOKO Krunce 150gm', 1, 0, 0, 'na', 0, 0, 227.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-04 06:42:26', '', '', 1),
(2339, '123', 'Ponds Detox Face Wash 100g', 2, 0, 0, 'na', 0, 0, 156.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:48:46', '', '', 1),
(2340, '8901058008524', 'Gold Corn Flackes 275gm', 1, 0, 0, 'na', 0, 0, 363.00, 400.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-04 06:50:22', '', '', 1),
(2341, '0123', 'Ponds Nourishing Facial Scrub 100g', 2, 0, 0, 'na', 0, 0, 127.00, 165.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:50:43', '', '', 1),
(2342, '001234', 'Lux Zasmin', 2, 0, 0, 'na', 0, 0, 0.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:51:35', '', '', 1),
(2343, 'P02343', 'Lux Jasmin 150g', 2, 0, 0, 'na', 0, 0, 80.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 06:53:49', '', '', 1),
(2344, '8941193314524', 'Ispahani Black Tea 50gm', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 07:34:15', '', '', 1),
(2345, '8941193314531', 'Ispahani Black Tea 100gm', 2, 0, 0, 'na', 0, 0, 48.00, 57.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 07:35:07', '', '', 1),
(2346, '5053990106981', 'Pringles Cheesy 165g', 2, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 07:39:55', 'Admin', '2025-06-24 20:47:38', 1),
(2347, '5053990161966', 'Pringles Barbeque 165gm', 2, 0, 0, 'na', 0, 0, 0.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 07:41:10', '', '', 1),
(2348, '5053990101573', 'Pringles Original 165gm', 2, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 07:41:47', '', '', 1),
(2349, '5053990101580', 'Pringles Salt & Vinegar 165gm', 2, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 07:42:29', '', '', 1),
(2350, '812546159100', 'Teer Soyabin Oil 1L', 1, 0, 0, 'na', 0, 0, 185.00, 189.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 08:11:32', '', '', 1),
(2351, '812546159124', 'Teer Soyabin Oil 2L', 1, 0, 0, 'na', 0, 0, 366.00, 378.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 08:11:52', '', '', 1),
(2352, '814336236121', 'Teer Moida 2kg', 1, 0, 0, 'na', 0, 0, 120.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-04 08:22:22', '', '', 1),
(2353, ' 8944000574722', 'Rose water Face and Body Mist 120ml', 2, 0, 0, 'na', 0, 0, 240.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:30:58', '', '', 1),
(2354, '8941158124014', 'Rose water Mist Toner 120ml', 2, 0, 0, 'na', 0, 0, 200.00, 275.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:33:04', '', '', 1),
(2355, '784196632886', 'Natural Beauty Ocean Shower Gel 500ml', 2, 0, 0, 'na', 0, 0, 327.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:34:32', '', '', 1),
(2356, '784196632893', 'Natural Beauty FruityShower Gel 500ml', 2, 0, 0, 'na', 0, 0, 327.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:35:34', '', '', 1),
(2357, '8941158124052', 'Earth  Beauty  Body Lotion 350ml', 2, 0, 0, 'na', 0, 0, 260.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:37:06', '', '', 1),
(2358, '8944000592344', 'Ombre Holiday Bliss', 2, 0, 0, 'na', 0, 0, 333.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:38:10', '', '', 1),
(2359, '8944000592337', 'Ombre Golden hours Perfumed Body Mist 120ml', 2, 0, 0, 'na', 0, 0, 333.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:39:39', '', '', 1),
(2360, '8944000612158', 'Ombre Biue Pearl Perfumed Body Mist 120ml	', 2, 0, 0, 'na', 0, 0, 333.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:40:55', '', '', 1),
(2361, '8944000592320', 'Ombre Biue Munsell Dream Perfumed Body Mist 120ml', 2, 0, 0, 'na', 0, 0, 333.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:42:22', '', '', 1),
(2362, '8944000579697', 'Skin Cafe Fash Wash 140ml', 2, 0, 0, 'na', 0, 0, 296.00, 395.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:43:29', '', '', 1),
(2363, '8944000579994', 'Skin Cafe Micellar Water 120ml', 2, 0, 0, 'na', 0, 0, 243.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 08:46:30', '', '', 1),
(2364, '8859178707011', 'Mistine Acne+ Clear 85g', 2, 0, 0, 'na', 0, 0, 260.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:05:13', 'Admin', '2025-06-24 17:38:06', 1),
(2365, '8944000579710', 'Makeup Cleansing Oil Advanced 120g', 2, 0, 0, 'na', 0, 0, 413.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:07:09', '', '', 1),
(2366, '8901314920645', 'Colgate Active Salt 60gm', 2, 0, 0, 'na', 0, 0, 70.80, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:14:16', '', '', 1),
(2367, '8901314620897', 'Colgate Active Salt 200gm', 2, 0, 0, 'na', 0, 0, 194.69, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:17:49', '', '', 1),
(2368, '8901314620484', 'Colgate Active Salt 100gm', 2, 0, 0, 'na', 0, 0, 110.62, 125.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:18:28', '', '', 1),
(2369, '8901314723758', 'Colgate Maxfresh Red Gel 70gm', 2, 0, 0, 'na', 0, 0, 106.19, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:19:37', '', '', 1),
(2370, '8901314839152', 'Colgate Maxfresh Blui Gel 70gm', 2, 0, 0, 'na', 0, 0, 106.19, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:20:21', '', '', 1),
(2371, '8901314864710', 'Colgate Maxfresh Blui Gel 150gm', 2, 0, 0, 'na', 0, 0, 176.99, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:20:57', '', '', 1),
(2372, '8901314889959', 'Colgate Strong Teeth 34gm', 2, 0, 0, 'na', 0, 0, 44.22, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:22:25', '', '', 1),
(2373, '8901314305541', 'Colgate Strong Teeth 100gm', 2, 0, 0, 'na', 0, 0, 101.78, 115.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:23:13', '', '', 1),
(2374, '8901314864734', 'Colgate Maxfresh Red Gel 150gm', 2, 0, 0, 'na', 0, 0, 176.99, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:25:07', '', '', 1),
(2375, '8901314305602', 'Colgate Strong Teeth 200gm', 2, 0, 0, 'na', 0, 0, 190.27, 215.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:26:01', '', '', 1),
(2376, '8944000579949', 'Hawaa olive oil 100ml', 2, 0, 0, 'na', 0, 0, 188.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:28:18', 'Admin', '2025-06-04 09:42:13', 1),
(2377, '8901314200037', 'Colgate Super Flexi tooth Brush', 2, 0, 0, 'na', 0, 0, 44.92, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:40:06', '', '', 1),
(2378, '8901314116123', 'Colgate Kids 0-2 Tooth Brush', 2, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:41:00', '', '', 1),
(2379, '8901314077158', 'Colgate Plax Gentle Care Mouth Wash', 2, 0, 0, 'na', 0, 0, 297.61, 372.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:42:18', '', '', 1),
(2380, '8901314077141', 'Colgate Plax Complete Care Mouth Wash', 2, 0, 0, 'na', 0, 0, 297.61, 372.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:43:11', '', '', 1),
(2381, '8944000574067', 'Hawaa Hair Fall Avenger oil 100ml', 2, 0, 0, 'na', 0, 0, 165.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:44:31', 'Admin', '2025-06-04 09:46:05', 1),
(2382, '8901012116845', 'Johnsons Baby Lotion 100ml', 2, 0, 0, 'na', 0, 0, 246.43, 276.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:49:36', '', '', 1),
(2383, '8901012116852', 'Johnsons Baby Lotion 200ml', 2, 0, 0, 'na', 0, 0, 464.00, 520.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:50:53', '', '', 1),
(2384, '8901012136058', 'Listerine cool Mint 250ml', 2, 0, 0, 'na', 0, 0, 291.00, 326.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:53:53', '', '', 1),
(2385, '8901012100578', 'Johnsons Baby Powder 200ml', 2, 0, 0, 'na', 0, 0, 428.57, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:55:27', '', '', 1),
(2386, '8901012133064', 'Listerine cool Mint Mild Taste 500ml', 2, 0, 0, 'na', 0, 0, 537.00, 601.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:56:34', 'Admin', '2025-06-04 10:03:44', 1),
(2387, '8901012100554', 'Johnsons Baby Powder 50ml', 2, 0, 0, 'na', 0, 0, 162.50, 182.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:57:49', '', '', 1),
(2388, '8901012116821', 'Johnsons Baby Cream 100ml', 2, 0, 0, 'na', 0, 0, 283.00, 317.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 09:59:35', '', '', 1),
(2389, '8901012116814', 'Johnsons Baby Cream 50ml', 2, 0, 0, 'na', 0, 0, 158.04, 177.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 10:01:46', '', '', 1),
(2390, '8850002012561', 'Kodomo Baby Shampoo 200ml', 2, 0, 0, 'na', 0, 0, 420.00, 560.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 22:56:30', '', '', 1),
(2391, '8901012116890', 'Johnson\'s Baby Top To Toe Bath 200 ml', 2, 0, 0, 'na', 0, 0, 357.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 22:58:45', '', '', 1),
(2392, '8901012100967', 'Clean And Clear 50 ml', 2, 0, 0, 'na', 0, 0, 156.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:01:31', '', '', 1),
(2393, '8901012189498', 'Clean And Clear Foaming Face wash 50 ml', 2, 0, 0, 'na', 0, 0, 134.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:03:47', '', '', 1),
(2394, '8901012117019', 'Johnsons Milk Rice Cram 100g', 2, 0, 0, 'na', 0, 0, 287.00, 322.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:08:43', '', '', 1),
(2395, '8901012133057', 'Listerine CoolMint 250Ml', 2, 0, 0, 'na', 0, 0, 291.00, 326.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:10:30', '', '', 1),
(2396, '8850002016958', 'Kodomo Hair  Body Wash 200ml', 2, 0, 0, 'na', 0, 0, 380.00, 507.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:12:52', '', '', 1),
(2397, '8850002010338', 'Kodomo Baby Bath 200ml', 2, 0, 0, 'na', 0, 0, 380.00, 507.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:14:28', '', '', 1),
(2398, '8850002035805', 'Kodomo Head to Toe 200ml', 2, 0, 0, 'na', 0, 0, 380.00, 507.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:15:36', '', '', 1),
(2399, '8850002011885', 'Kodomo Baby ShampooGentel 200ml', 2, 0, 0, 'na', 0, 0, 420.00, 560.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:18:47', '', '', 1),
(2400, '8941174011138', 'Parachute Baby Soap 125', 2, 0, 0, 'na', 0, 0, 123.37, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:20:20', '', '', 1),
(2401, '8850002012554', 'Kodomo Baby ShampooGentel 4000ml', 2, 0, 0, 'na', 0, 0, 850.00, 1133.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:21:20', '', '', 1),
(2402, '8850002019690', 'Kodomo Baby  Shampoo Head to Toe  4000ml', 2, 0, 0, 'na', 0, 0, 780.00, 1040.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:22:36', '', '', 1),
(2403, '8850002807433', 'Kodomo Baby  Baby Powder Extra Mild 180g', 2, 0, 0, 'na', 0, 0, 324.00, 432.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:24:04', 'Admin', '2025-06-04 23:24:19', 1),
(2404, '8888300200007', 'Kodomo Baby Lotion 180ml', 2, 0, 0, 'na', 0, 0, 510.00, 680.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:25:43', '', '', 1),
(2405, '8850002006539', 'Kodomo Baby Baby Powder  50g', 2, 0, 0, 'na', 0, 0, 115.00, 153.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:27:45', '', '', 1),
(2406, '784196632947', 'Saffron Soothing Gel 130ml', 2, 0, 0, 'na', 0, 0, 0.00, 425.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:29:13', '', '', 1),
(2407, '784196632930', 'Milk Soothing Gel', 2, 0, 0, 'na', 0, 0, 0.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:30:54', '', '', 1),
(2408, '8850002807334', 'Kodomo Baby Oil 200ml', 2, 0, 0, 'na', 0, 0, 650.00, 867.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:32:03', '', '', 1),
(2409, '8944000712155', 'Ombre Bali Trip Body Mist 120ml', 2, 0, 0, 'na', 0, 0, 333.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:33:12', '', '', 1),
(2410, '8850002010352', 'Kodomo Baby Bath 400ml', 2, 0, 0, 'na', 0, 0, 0.00, 1040.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:34:46', '', '', 1),
(2411, '8850002015685', 'Kodomo Organic Baby Liquid detergent ', 2, 0, 0, 'na', 0, 0, 310.00, 507.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:36:07', '', '', 1),
(2412, '8850002020887', 'Kodomo Baby fabric Softener 700ml', 2, 0, 0, 'na', 0, 0, 380.00, 420.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:37:28', '', '', 1),
(2413, '784196632787', 'Natural Beauty Apricot Face Scrub 130 ml', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:39:24', '', '', 1),
(2414, '8941174010865', 'Parachute Baby 100g', 2, 0, 0, 'na', 0, 0, 109.10, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:41:10', '', '', 1),
(2415, '8941174011657', 'Parachute Baby Milky Glow 100ml', 2, 0, 0, 'na', 0, 0, 175.66, 235.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:43:32', '', '', 1),
(2416, '8941174011343', 'Parachute Baby  Milk Glow 50ml', 2, 0, 0, 'na', 0, 0, 128.04, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:45:10', 'Admin', '2025-06-28 14:40:38', 1),
(2417, '8941174010841', 'Parachute Baby Face Cream 50ml', 2, 0, 0, 'na', 0, 0, 109.01, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:46:27', '', '', 1),
(2418, '8850002807358', 'Baby Cream 100g', 2, 0, 0, 'na', 0, 0, 600.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:47:40', '', '', 1),
(2419, '784196632954', 'Natural Beauty Aloe Vera 130 ml', 2, 0, 0, 'na', 0, 0, 0.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:48:41', '', '', 1),
(2420, '8850002807327', 'Konomo  Baby oil 100ml', 2, 0, 0, 'na', 0, 0, 350.00, 467.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-04 23:50:27', '', '', 1),
(2421, '8941161006833', 'Fresh Happy Nappy Baby Wipes 120pcs', 2, 0, 0, 'na', 0, 0, 120.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 00:37:11', 'Admin', '2025-06-05 00:41:01', 1),
(2422, '8850002907638', 'Kodomo Happy Kids Gift ', 2, 0, 0, 'na', 0, 0, 1200.00, 1600.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-05 01:43:06', '', '', 1),
(2423, '8888300800634', 'Kodomo Anti cavity', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 01:44:00', '', '', 1),
(2424, '8888300800627', 'Kodomo Anti cavity 2', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 01:45:10', '', '', 1),
(2425, 'P02425', 'Savlon Aloe Vera 170 ml', 2, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 01:49:48', '', '', 1),
(2426, '8941393006519', 'Savlon Lemon Bust hand wash 170ml', 2, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 01:50:45', '', '', 1),
(2427, '8941393006502', 'Savlon Ocean Blue 170ml', 2, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 01:51:34', '', '', 1),
(2428, '8941393006533', 'Savlon Ocean Blue 200ml', 2, 0, 0, 'na', 0, 0, 79.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 01:52:31', '', '', 1),
(2429, '8941393006557', 'Savlon Alovera Hand wash 200ml', 2, 0, 0, 'na', 0, 0, 79.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 01:53:26', '', '', 1),
(2430, '8941196242046', 'Savlon Shinex Liqid  Lemon Floor 500ml', 2, 0, 0, 'na', 0, 0, 144.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:16:29', '', '', 1),
(2431, '8941196242077', 'Savlon Shinex Liqid Floral  Floor 1L', 2, 0, 0, 'na', 0, 0, 253.00, 285.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:17:45', '', '', 1),
(2432, '8941196242060', 'Savlon Shinex Liqid Floral Floor 500ml', 2, 0, 0, 'na', 0, 0, 144.00, 160.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:18:36', '', '', 1),
(2433, 'P02433', 'Savlon liquid 56g', 2, 0, 0, 'na', 0, 0, 41.00, 45.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:19:23', '', '', 1),
(2434, 'P02434', 'Savlon liquid 112g', 2, 0, 0, 'na', 0, 0, 55.00, 60.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:20:05', '', '', 1),
(2435, '8941393006526', 'Savlon Alovera Hand wash 170ml', 2, 0, 0, 'na', 0, 0, 57.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:21:38', '', '', 1),
(2436, '8901023025846', 'Aer Power Poket 10gm', 2, 0, 0, 'na', 0, 0, 58.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:22:13', '', '', 1),
(2437, '8901023028434', 'Aer Lemon Power Poket 10gm', 2, 0, 0, 'na', 0, 0, 58.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:22:53', '', '', 1),
(2438, '8901023025181', 'Aer Lavender Power Poket 10gm', 2, 0, 0, 'na', 0, 0, 58.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:23:32', '', '', 1),
(2439, '745110769323', 'Godrej Morning Air Freshenar 300ml', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:28:36', '', '', 1),
(2440, '8941189060169', 'Godrej Lemon Air Freshenar 300ml', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:29:11', '', '', 1),
(2441, '745110769309', 'Godrej Cool Air Freshenar 300ml', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:29:32', '', '', 1),
(2442, '8901157025200', 'Lal Hit 400ml', 2, 0, 0, 'na', 0, 0, 305.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:30:13', '', '', 1),
(2443, '8941189060305', 'Black Hit 475ml', 2, 0, 0, 'na', 0, 0, 0.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:31:23', '', '', 1),
(2444, '846656003411', 'Mr Noodles 8pcs', 2, 0, 0, 'na', 0, 0, 135.24, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:33:23', 'Admin', '2025-06-16 14:53:39', 1),
(2445, '8941193041031', 'Bashundhara Paper napkin ', 2, 0, 0, 'na', 0, 0, 55.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:46:09', '', '', 1),
(2446, '8941183002660', 'Fay Facial Tissues', 2, 0, 0, 'na', 0, 0, 62.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:47:11', '', '', 1),
(2447, '8941193064160', 'Bashundhara Hand Towel', 2, 0, 0, 'na', 0, 0, 82.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:48:01', '', '', 1),
(2448, '8941100515266', 'Chapstick Instant Nu 12 pac', 2, 0, 0, 'na', 0, 0, 233.00, 265.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:49:14', '', '', 1),
(2449, '8941100515709', 'Chapstick Masala Delight 4 pac', 2, 0, 0, 'na', 0, 0, 44.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:50:42', 'Admin', '2025-07-09 15:46:05', 1),
(2450, '8941100515068', 'Chopstick Stick Noodles 150g', 2, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:51:53', '', '', 1),
(2451, '8941100514696', 'Rhuchi Orange Jam 500g ', 1, 0, 0, 'na', 0, 0, 171.00, 195.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:53:28', '', '', 1),
(2452, '8941100514771', 'Rhuchi Mixed Achar 400g', 1, 0, 0, 'na', 0, 0, 158.00, 185.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:54:32', '', '', 1),
(2453, '8941100514689', 'Rhuchi  Mixed food jam 250g', 1, 0, 0, 'na', 0, 0, 94.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 02:55:18', '', '', 1),
(2454, '8941100513590', 'Rhuchi Zal Tameto shos', 1, 0, 0, 'na', 0, 0, 2.20, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:56:31', 'Admin', '2025-06-05 02:56:51', 1),
(2455, '8941100513613', 'Rhuchi  lal moricher shos', 1, 0, 0, 'na', 0, 0, 3.35, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:57:40', '', '', 1),
(2456, '8941100513606', 'Rhuchi  Tometo khechap ', 1, 0, 0, 'na', 0, 0, 2.35, 3.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:58:32', '', '', 1),
(2457, '8941193041413', 'Bashundhara Hand towel 150pcs', 2, 0, 0, 'na', 0, 0, 33.50, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 02:59:37', '', '', 1),
(2458, '8941193041116', 'Bashundhara Resturent Napkin 100', 2, 0, 0, 'na', 0, 0, 44.66, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:00:47', '', '', 1),
(2459, '8941193073179', 'Bashundhara Facial Tishu', 2, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:01:36', '', '', 1),
(2460, '8941193073162', 'Bashundhara Facial Tishu 120', 2, 0, 0, 'na', 0, 0, 63.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:02:28', '', '', 1),
(2461, '8941193078563', 'Bashundhara  200 pcs', 2, 0, 0, 'na', 0, 0, 65.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:03:12', '', '', 1),
(2462, '8941100512289', 'Chopstick Stick Noodles masala ', 1, 0, 0, 'na', 0, 0, 138.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:05:07', '', '', 1),
(2463, '8941100515297', 'Chopstick Stick Noodles Yeamy Masala', 1, 0, 0, 'na', 0, 0, 300.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:06:56', '', '', 1),
(2464, 'P02464', 'Para suit 350ml ', 2, 0, 0, 'na', 0, 0, 273.52, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:08:22', '', '', 1),
(2465, '8941174010957', 'parachute baniful 100ml', 2, 0, 0, 'na', 0, 0, 92.40, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:11:14', '', '', 1),
(2466, 'P02466', 'Para suit 500ml', 2, 0, 0, 'na', 0, 0, 360.88, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:11:56', '', '', 1),
(2467, 'P02467', 'Para suit 200ml', 2, 0, 0, 'na', 0, 0, 160.67, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:12:26', '', '', 1),
(2468, 'P02468', 'Para sui 100ml', 2, 0, 0, 'na', 0, 0, 91.08, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:12:53', '', '', 1),
(2469, '8941100515280', 'Chapstick istant 16 ,62gm', 1, 0, 0, 'na', 0, 0, 300.00, 340.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:15:13', '', '', 1),
(2470, 'P02470', 'Dabur Vatika Enriched Coconut Hair Oil 200 ml', 1, 0, 0, 'na', 0, 0, 185.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 03:16:41', '', '', 1),
(2471, '8941189605735', 'Frutika Mango food Drink 1L', 1, 0, 0, 'na', 0, 0, 0.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 03:33:46', '', '', 1),
(2473, '8941189605728', 'Frutika Mango food Drink 500ml', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 03:34:39', '', '', 1),
(2474, '8941189605711', 'Frutika Mango food Drink 250ml', 1, 0, 0, 'na', 0, 0, 0.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 03:35:37', '', '', 1),
(2475, '8941189605742', 'Frutika  Red Grape 250ml', 1, 0, 0, 'na', 0, 0, 0.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 03:37:02', '', '', 1),
(2476, '8904238301163', 'Fogg Prince 30ml', 2, 0, 0, 'na', 0, 0, 242.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:03:16', '', '', 1),
(2477, '8904238301170', 'Fogg Sultan 30ml	', 2, 0, 0, 'na', 0, 0, 242.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:04:24', '', '', 1),
(2478, '8904238301149', 'Fogg Czar  30ml	', 2, 0, 0, 'na', 0, 0, 242.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:05:35', '', '', 1),
(2479, '025929164701', 'Bondage hommes 50 ml', 2, 0, 0, 'na', 0, 0, 880.00, 1099.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:07:02', '', '', 1),
(2480, '025929166507', 'Bondage  Extreme 50 ml	', 2, 0, 0, 'na', 0, 0, 880.00, 1099.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:08:44', '', '', 1),
(2481, '8903387099952', 'Ossum Passion Deodorant Roll on 50ml', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:13:07', '', '', 1),
(2482, '8903387099990', 'Ossum Appeal Deodorant Roll on 50ml	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:14:27', '', '', 1),
(2483, '8903387099976', 'Ossum Cherish Deodorant Roll on 50ml	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:16:01', '', '', 1),
(2484, '8903387099969', 'Ossum Desire Deodorant Roll on 50ml	', 2, 0, 0, 'na', 0, 0, 0.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:17:12', '', '', 1),
(2485, '8903387099983', 'Ossum Fantasy Deodorant Roll on 50ml	', 2, 0, 0, 'na', 0, 0, 0.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:18:14', '', '', 1),
(2486, '6297001034880', 'Real Man Pure Neroli ', 2, 0, 0, 'na', 0, 0, 157.63, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:20:05', '', '', 1),
(2487, '6297001034866', 'Real Man Pure Aqua', 2, 0, 0, 'na', 0, 0, 157.63, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:20:53', '', '', 1),
(2488, '8888202026859', 'Enchanteur Alluring 50ml', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:23:01', '', '', 1),
(2489, '8888202035172', 'Enchanteur Enticing 50ml	', 2, 0, 0, 'na', 0, 0, 195.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:23:45', 'Admin', '2025-06-27 19:20:20', 1),
(2490, '8888202018182', 'Enchanteur Romantic 50ml	', 2, 0, 0, 'na', 0, 0, 195.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:24:24', 'Admin', '2025-06-27 19:19:34', 1),
(2491, '6297000669359', 'Yardley London Gentleman 50ml', 2, 0, 0, 'na', 0, 0, 270.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:25:39', 'Admin', '2025-06-27 19:20:41', 1),
(2492, '8999777004484', 'Nivea men cool kick 50 ml', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:26:56', '', '', 1),
(2493, '8941100511725', 'Radhuni  Halim mix 200g', 1, 0, 0, 'na', 0, 0, 61.50, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:28:08', '', '', 1),
(2494, '8941100511329', 'Radhuni  Garur Mansher masala ', 1, 0, 0, 'na', 0, 0, 83.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:29:08', '', '', 1),
(2495, '8888202045690', 'Enchanteur Gargeaus 50ml', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:30:31', '', '', 1),
(2496, '6297000669373', 'Yardley London Gentleman urlone 50ml	', 2, 0, 0, 'na', 0, 0, 0.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:31:58', '', '', 1),
(2497, '8888202018175', 'Enchanteur charming 50ml	', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:33:08', '', '', 1),
(2498, '8888202052384', 'Enchanteur charming Radiant white 50ml	', 2, 0, 0, 'na', 0, 0, 195.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:34:09', 'Admin', '2025-06-27 19:19:53', 1),
(2499, '8908001158794', 'FOGG Fragrance Body Spray 100g', 2, 0, 0, 'na', 0, 0, 370.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:38:28', '', '', 1),
(2500, '8904238302023', 'FOGG Fragrance Body Spray  Brazilian burst 100g	', 2, 0, 0, 'na', 0, 0, 363.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:39:43', '', '', 1),
(2501, '8904238302030', 'FOGG Fragrance Body Spray Rio Wave 100g	', 2, 0, 0, 'na', 0, 0, 363.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:40:35', '', '', 1),
(2502, '8904832302085', 'FOGG Fragrance Body Spray Fizzy dew 100g	', 2, 0, 0, 'na', 0, 0, 0.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:41:29', '', '', 1),
(2503, '8908001158800', 'FOGG Fragrance Body Spray Extreme 100g', 2, 0, 0, 'na', 0, 0, 370.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:42:30', '', '', 1),
(2504, '8908001158817', 'FOGG Fragrance Body Spray Dynamic 100g	', 2, 0, 0, 'na', 0, 0, 370.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:44:31', '', '', 1),
(2505, '6291012244139', 'FOGG Status 100g	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:45:50', '', '', 1),
(2506, '6291012244153', 'FOGG Splendidf 100g	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:47:45', '', '', 1),
(2507, '6291012244146', 'FOGG Bold 100g	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:48:44', '', '', 1),
(2508, '6291012244122', 'FOGG Absolute100g	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:49:41', '', '', 1),
(2509, '6291012244115', 'FOGG Ultimate 100g	', 2, 0, 0, 'na', 0, 0, 158.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:50:47', '', '', 1),
(2510, '8904238301132', 'FOGG Happy 100g	', 2, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:52:44', '', '', 1),
(2511, '8904238301026', 'FOGG Charm 25ml	', 2, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:53:52', '', '', 1),
(2512, '8904238301019', 'FOGG Relish  25ml	', 2, 0, 0, 'na', 0, 0, 114.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:54:48', 'Admin', '2025-06-05 04:54:57', 1),
(2513, '8904238301002', 'FOGG Amaze 25ml	', 2, 0, 0, 'na', 0, 0, 114.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:55:52', '', '', 1),
(2514, '8904238301125', 'FOGG Nice 25ml	', 2, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 04:56:54', '', '', 1),
(2515, '8153003000750', 'Aci Minicate Rice 5kg', 1, 0, 0, 'na', 0, 0, 440.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:07:36', '', '', 1),
(2516, '8169003005572', 'Aci Minicate Rice 10kg', 1, 0, 0, 'na', 0, 0, 770.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:10:44', '', '', 1),
(2517, '8153003000842', 'Aci Nazirshail Rice 5kg', 1, 0, 0, 'na', 0, 0, 450.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:11:40', '', '', 1),
(2518, '8153003000743', 'Aci Nazirshail Rice 10kg', 1, 0, 0, 'na', 0, 0, 890.00, 890.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:12:09', '', '', 1),
(2519, '6297001034743', 'FOGG  Inspiration 17ml', 2, 0, 0, 'na', 0, 0, 84.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:14:47', '', '', 1),
(2520, '6297001034774', 'FOGG Dazzling 17ml	', 2, 0, 0, 'na', 0, 0, 84.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:16:15', '', '', 1),
(2521, '6297001034750', 'FOGG Embellish 17ml	', 2, 0, 0, 'na', 0, 0, 84.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:17:38', '', '', 1),
(2522, '8904238300081', 'FOGG  Scent Xpressio  100ml', 2, 0, 0, 'na', 0, 0, 972.00, 1200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:18:59', '', '', 1),
(2523, '8904238300098', 'FOGG Scent Intensio 100ml	', 2, 0, 0, 'na', 0, 0, 0.00, 1200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:19:51', '', '', 1),
(2524, '8904238301255', 'FOGG Scent Fame 100ml	', 2, 0, 0, 'na', 0, 0, 1010.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:20:39', 'Admin', '2025-06-05 05:20:51', 1),
(2525, '8904238300104', 'FOGG Scent Xtremo 100ml	', 2, 0, 0, 'na', 0, 0, 972.00, 1200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:21:29', '', '', 1),
(2526, '8904238300074', 'FOGG Scent Impressio 100ml	', 2, 0, 0, 'na', 0, 0, 972.00, 1200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:22:18', '', '', 1),
(2527, '8904238301248', 'FOGG Scent Dazzle100ml	', 2, 0, 0, 'na', 0, 0, 1010.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:23:05', '', '', 1),
(2528, '8904238301279', 'FOGG Scent Elite100ml	', 2, 0, 0, 'na', 0, 0, 1010.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:24:04', '', '', 1),
(2529, '8904238301262', 'FOGG Scent Icon 100ml	', 2, 0, 0, 'na', 0, 0, 1010.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:25:12', '', '', 1),
(2530, '8904238301408', 'FOGG Master  Pine 120ml', 2, 0, 0, 'na', 0, 0, 373.00, 485.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:29:08', '', '', 1),
(2531, '8904238301422', 'FOGG Master oak 120ml	', 2, 0, 0, 'na', 0, 0, 373.00, 485.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:30:06', '', '', 1),
(2532, '8904238301415', 'FOGG Master Agar120ml	', 2, 0, 0, 'na', 0, 0, 373.00, 485.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:30:48', '', '', 1),
(2533, '8904238301392', 'FOGG Master Cedar 120ml	', 2, 0, 0, 'na', 0, 0, 373.00, 485.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:31:50', '', '', 1),
(2534, '6291012894365', 'FOGG Bab al shams 10ml	', 2, 0, 0, 'na', 0, 0, 117.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:32:56', '', '', 1),
(2535, '6291012894327', 'FOGG Shasmeen 10ml	', 2, 0, 0, 'na', 0, 0, 117.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:33:43', '', '', 1),
(2536, '6291012894310', 'FOGG Bakhoor Maiki 10ml	', 2, 0, 0, 'na', 0, 0, 117.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:34:35', '', '', 1),
(2537, '6291012894358', 'FOGG Sultan 10ml	', 2, 0, 0, 'na', 0, 0, 117.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:35:30', '', '', 1),
(2538, '6291012894334', 'FOGG SuHumraltan 10ml	', 2, 0, 0, 'na', 0, 0, 117.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:36:05', '', '', 1),
(2539, '8908001158565', 'FOGG  Fresh Woody 100g', 2, 0, 0, 'na', 0, 0, 392.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:37:21', '', '', 1),
(2540, '8908001158541', 'FOGG Fresh Aromatic 100g	', 2, 0, 0, 'na', 0, 0, 392.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:38:08', '', '', 1),
(2541, '8908001158572', 'FOGG Fresh Spicy 100g	', 2, 0, 0, 'na', 0, 0, 392.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:39:29', '', '', 1),
(2542, '8908001158350', 'FOGG Paradise 100g', 2, 0, 0, 'na', 0, 0, 361.00, 435.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:43:43', '', '', 1),
(2543, '8908001158244', 'FOGG Napoleon 100g	', 2, 0, 0, 'na', 0, 0, 361.00, 435.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:44:43', '', '', 1),
(2544, '8908001158305', 'FOGG Marco 100g	', 2, 0, 0, 'na', 0, 0, 361.51, 435.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:45:23', '', '', 1),
(2545, '8908001158312', 'FOGG Royal 100g	', 2, 0, 0, 'na', 0, 0, 361.51, 435.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:46:02', '', '', 1),
(2546, '6298044198508', 'FOGG Arabia 100g	', 2, 0, 0, 'na', 0, 0, 383.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:47:02', '', '', 1),
(2547, '6297001034699', 'FOGG Intense Amber 120ml	', 2, 0, 0, 'na', 0, 0, 383.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:48:48', '', '', 1),
(2548, '6297001034651', 'FOGG Intense Oud  120ml	', 2, 0, 0, 'na', 0, 0, 383.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:49:59', '', '', 1),
(2549, '6297001034675', 'FOGG Intense Arabia 120ml	', 2, 0, 0, 'na', 0, 0, 383.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:50:57', '', '', 1),
(2550, '6297001034682', 'FOGG Intense Arabia Aomitic 120ml	', 2, 0, 0, 'na', 0, 0, 392.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:51:59', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(2551, '8888202000880', 'Enchanteur Romantic 150ml', 2, 0, 0, 'na', 0, 0, 330.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:56:16', '', '', 1),
(2552, '8888202062086', 'Enchanteur Rose and Amaur150ml	', 2, 0, 0, 'na', 0, 0, 330.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:58:22', '', '', 1),
(2553, '8888202000767', 'Enchanteur Charming 150ml	', 2, 0, 0, 'na', 0, 0, 330.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 05:59:48', '', '', 1),
(2554, '3014230021404', 'Brut 200ml Efficacite', 2, 0, 0, 'na', 0, 0, 415.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:01:53', 'Admin', '2025-06-27 19:18:28', 1),
(2555, '6291100171323', 'Active Women  Pour Femme 134 g', 2, 0, 0, 'na', 0, 0, 390.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:03:52', 'Admin', '2025-06-27 19:17:20', 1),
(2556, '6291100171255', 'Active Women Pour Homme 134 g	', 2, 0, 0, 'na', 0, 0, 390.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:05:02', 'Admin', '2025-06-27 19:15:45', 1),
(2557, '3700082500364', 'Havoc Gold Deodorant 200ml', 2, 0, 0, 'na', 0, 0, 390.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:06:21', 'Admin', '2025-06-27 19:19:08', 1),
(2558, '3700082500685', 'Havoc Black  200ml	', 2, 0, 0, 'na', 0, 0, 390.00, 480.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:07:03', 'Admin', '2025-06-27 19:18:49', 1),
(2559, '6291105540186', 'HotIce Scandal 200ml', 2, 0, 0, 'na', 0, 0, 360.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:08:31', '', '', 1),
(2560, '8941181000088', 'Mama  Noodles Hot Spicy ', 1, 0, 0, 'na', 0, 0, 80.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:10:50', '', '', 1),
(2561, '8941181000163', 'Mama Inmstant Noodles 	', 1, 0, 0, 'na', 0, 0, 148.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:11:42', '', '', 1),
(2562, '8941181000057', 'Mama Chicken Flavour', 1, 0, 0, 'na', 0, 0, 80.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:17:31', '', '', 1),
(2563, '8941181000132', 'Mama Chicken Flavour 8 pac', 1, 0, 0, 'na', 0, 0, 148.00, 175.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:18:44', '', '', 1),
(2564, '8941175080300', 'Systema Classic comfort ', 2, 0, 0, 'na', 0, 0, 150.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:21:17', '', '', 1),
(2565, '8941175080331', 'Systema Power Clean	', 2, 0, 0, 'na', 0, 0, 0.00, 330.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:22:09', '', '', 1),
(2566, '8941175080317', 'Systema  Char kol Gurd', 2, 0, 0, 'na', 0, 0, 95.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:22:50', '', '', 1),
(2567, '8941175080324', 'Systema  Easy Access', 2, 0, 0, 'na', 0, 0, 210.00, 330.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:23:30', '', '', 1),
(2568, '8941158124083', 'Earth Beauty Milk Bighting Face Wash 100ml ', 2, 0, 0, 'na', 0, 0, 123.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:28:55', '', '', 1),
(2569, '639853998143', 'Clariss Milk Face Wash 100ml', 2, 0, 0, 'na', 0, 0, 300.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:30:01', '', '', 1),
(2570, '8944000579178', 'Silky Tresses  Conditioner 120ml', 2, 0, 0, 'na', 0, 0, 206.00, 275.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:31:21', '', '', 1),
(2571, '8944000575057', 'Lavino Brightening face wash 100ml ', 2, 0, 0, 'na', 0, 0, 218.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:32:26', '', '', 1),
(2572, '8901396601784', 'Veet Pure 25 g', 2, 0, 0, 'na', 0, 0, 86.60, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:33:54', 'Admin', '2025-07-11 12:05:03', 1),
(2573, '639853998174', 'Clariss  Tea tree 100ml', 2, 0, 0, 'na', 0, 0, 380.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:34:45', '', '', 1),
(2574, '639853998167', 'Clariss  Lemon 100ml', 2, 0, 0, 'na', 0, 0, 380.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:35:28', '', '', 1),
(2575, '8944000574746', 'LILAC Advanced Face Wash 120ml', 2, 0, 0, 'na', 0, 0, 521.00, 695.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:36:24', '', '', 1),
(2576, '784196632756', 'Nature Beauty Neem 100ml', 2, 0, 0, 'na', 0, 0, 190.00, 295.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:37:17', '', '', 1),
(2577, '639853998310', 'Clariss Purifying Face wash ', 2, 0, 0, 'na', 0, 0, 399.00, 499.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:38:22', '', '', 1),
(2578, '8941158124076', 'Earth Beauty  Hydrating  Aloe Vera', 2, 0, 0, 'na', 0, 0, 123.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:39:52', '', '', 1),
(2579, '784196632763', 'Nature Beauty Tea tree face Wash100ml', 2, 0, 0, 'na', 0, 0, 190.00, 295.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:41:03', '', '', 1),
(2580, '8941158124106', 'Earth Beauty Neem acne', 2, 0, 0, 'na', 0, 0, 123.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:42:44', '', '', 1),
(2581, 'P02581', 'JM Lacquer Sp-ray White ', 2, 0, 0, 'na', 0, 0, 0.00, 0.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:44:54', '', '', 1),
(2582, '8944000575064', 'Lavino Neem face wash', 2, 0, 0, 'na', 0, 0, 218.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:45:43', '', '', 1),
(2583, '8941100507032', 'Lizol D surface clear  500ml', 2, 0, 0, 'na', 0, 0, 144.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:46:46', '', '', 1),
(2584, '8941193042014', 'Bashundhara kitchen towel 2 ply', 2, 0, 0, 'na', 0, 0, 62.50, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:49:08', '', '', 1),
(2585, '8908008142451', 'Himalaya Detox Charcoal Face Wash 100ml', 2, 0, 0, 'na', 0, 0, 175.00, 225.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:50:29', 'Admin', '2025-06-22 15:24:05', 1),
(2586, '8941193067017', 'Bashundhara Toiled   Gold ', 2, 0, 0, 'na', 0, 0, 26.00, 38.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:52:20', '', '', 1),
(2587, 'P02587', 'Bashundhara Toiled White', 2, 0, 0, 'na', 0, 0, 18.50, 28.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:54:16', '', '', 1),
(2588, '8944000574616', 'Rajknna acne 100ml', 2, 0, 0, 'na', 0, 0, 138.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:55:06', '', '', 1),
(2589, '8906118418121', 'Plam Green Tea 100ml', 2, 0, 0, 'na', 0, 0, 440.00, 575.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:56:10', '', '', 1),
(2590, '784196632749', 'Nature BeautyMilk plus 100ml', 2, 0, 0, 'na', 0, 0, 190.00, 295.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:57:25', '', '', 1),
(2591, '8904430201063', 'Plam  Nourish 100ml', 2, 0, 0, 'na', 0, 0, 440.00, 575.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:58:38', '', '', 1),
(2592, '8944000579116', 'Liiac daily Scrub 120ml', 2, 0, 0, 'na', 0, 0, 540.00, 720.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 06:59:28', '', '', 1),
(2593, '8901030989865', 'Ponds Bright Beauty i 100g', 2, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:00:24', 'Admin', '2025-06-24 17:36:04', 1),
(2594, '8906118416370', 'Plam Saffron 100ml', 2, 0, 0, 'na', 0, 0, 440.00, 575.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:01:17', '', '', 1),
(2595, '8944000574609', 'Rajknna  Glow bosster 100ml', 2, 0, 0, 'na', 0, 0, 138.00, 185.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:02:21', '', '', 1),
(2596, '8944000575392', 'Lavino vit c Fash wash 100ml', 2, 0, 0, 'na', 0, 0, 180.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:05:50', '', '', 1),
(2597, '8944000579130', 'Rajkonna Bri Body lotion 300ml', 2, 0, 0, 'na', 0, 0, 337.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:07:51', '', '', 1),
(2598, '8690973040763', 'She  Body mist cool 150ml', 2, 0, 0, 'na', 0, 0, 632.00, 790.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:09:01', '', '', 1),
(2599, '8888202035240', 'Enchanteur  enticing 250g', 2, 0, 0, 'na', 0, 0, 490.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:10:05', 'Admin', '2025-07-09 16:35:02', 1),
(2600, '8901248253543', 'Fair And handsome 30g', 2, 0, 0, 'na', 0, 0, 195.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:11:38', 'Admin', '2025-06-24 17:39:41', 1),
(2601, '8941100500132', 'Magic powder', 2, 0, 0, 'na', 0, 0, 49.60, 58.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:12:18', '', '', 1),
(2602, '8941100504178', 'Super white 200g', 2, 0, 0, 'na', 0, 0, 36.67, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:12:58', '', '', 1),
(2603, '8944000574739', 'Pure And Natural Aloe Vera 240ml', 2, 0, 0, 'na', 0, 0, 347.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:13:57', '', '', 1),
(2604, '8809547410028', 'Pax Moly Soothing Gel ', 2, 0, 0, 'na', 0, 0, 780.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:15:20', '', '', 1),
(2605, '8941100502419', 'Sepnil 300ml', 2, 0, 0, 'na', 0, 0, 310.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:16:29', '', '', 1),
(2606, '8809547410264', 'Pax Moly Soothing  300mg', 2, 0, 0, 'na', 0, 0, 780.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:19:01', '', '', 1),
(2607, '8941100502440', 'Sepnil Hand Sanitizer 200ml', 2, 0, 0, 'na', 0, 0, 200.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:26:18', '', '', 1),
(2608, '8941100500606', 'Sepnil Hand Sanitizer 40ml', 2, 0, 0, 'na', 0, 0, 50.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:27:21', '', '', 1),
(2609, '8809547411124', 'Pax Moly  deep Soothing 300mg ', 2, 0, 0, 'na', 0, 0, 780.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:28:40', '', '', 1),
(2610, '8809547410288', 'Pax Moly Honey Soothing 300mg', 2, 0, 0, 'na', 0, 0, 780.00, 1150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:29:30', '', '', 1),
(2611, '8700216489935', 'Panten 400 mle', 2, 0, 0, 'na', 0, 0, 785.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:30:48', 'Admin', '2025-06-24 17:21:24', 1),
(2612, '8700216295789', 'Panten  pro v 400 mle	', 2, 0, 0, 'na', 0, 0, 785.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:31:45', 'Admin', '2025-06-24 17:21:14', 1),
(2613, '6281006424647', 'sunsilk  Hair fall 700ml ', 2, 0, 0, 'na', 0, 0, 1050.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:32:45', 'Admin', '2025-06-24 17:20:47', 1),
(2614, '8944000579192', 'Biotin End of hair fall', 2, 0, 0, 'na', 0, 0, 319.00, 425.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:33:43', '', '', 1),
(2615, '6281006424463', 'sunsilk Soft smooth 700ml	', 2, 0, 0, 'na', 0, 0, 1050.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:34:32', 'Admin', '2025-06-24 17:20:30', 1),
(2616, '6281006424340', 'sunsilk Instant Repair 700ml	', 2, 0, 0, 'na', 0, 0, 1050.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:35:30', 'Admin', '2025-06-24 17:20:59', 1),
(2617, '6281006424586', 'sunsilk Black Shine  700ml	', 2, 0, 0, 'na', 0, 0, 1050.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:36:29', 'Admin', '2025-06-24 17:20:13', 1),
(2618, '6281006424401', 'sunsilk Strength  700ml	', 2, 0, 0, 'na', 0, 0, 0.00, 1250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:37:21', '', '', 1),
(2619, '8809416470245', 'Cosrx Pimple Master', 2, 0, 0, 'na', 0, 0, 0.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:38:10', 'Admin', '2025-06-05 07:38:29', 1),
(2620, '8906118412747', 'Plam eye Swer Kajal', 2, 0, 0, 'na', 0, 0, 360.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:39:24', '', '', 1),
(2621, '8690604539581', 'Flomar Just Liner', 2, 0, 0, 'na', 0, 0, 270.00, 365.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:40:23', '', '', 1),
(2622, '840205754397', 'Pran Patata Spicy', 1, 0, 0, 'na', 0, 0, 0.00, 0.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 07:49:09', '', '', 1),
(2623, '5086230025339', 'Fay Air Tbacco', 2, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 07:57:21', '', '', 1),
(2624, '8941183005050', 'Fay Air Narcissus', 2, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 07:58:51', '', '', 1),
(2625, '8941183005098', 'Fay Air Lavender', 2, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 07:59:29', '', '', 1),
(2626, '8941183005173', 'Fay Air oriental', 2, 0, 0, 'na', 0, 0, 0.00, 0.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 08:00:11', '', '', 1),
(2627, '8941183005142', 'Fay Air  Lime', 2, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 08:00:49', '', '', 1),
(2628, '8941183005081', 'Fay Air Rose', 2, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 08:01:24', '', '', 1),
(2629, '8941183005135', 'Fay Air Lily', 2, 0, 0, 'na', 0, 0, 0.00, 0.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 08:01:49', '', '', 1),
(2630, '8941183005128', 'Fay Air Jasmin', 2, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-05 08:02:18', '', '', 1),
(2631, '8941183001106', 'Jet Aorma+ 1kg', 2, 0, 0, 'na', 0, 0, 260.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:03:13', '', '', 1),
(2632, '8941183002677', 'Fay Fasial 150pcs', 2, 0, 0, 'na', 0, 0, 87.50, 105.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:03:59', '', '', 1),
(2633, '8941183007016', 'Fay Cotton', 2, 0, 0, 'na', 0, 0, 19.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:04:52', '', '', 1),
(2634, '8941183007023', 'Fay 80 pcs', 2, 0, 0, 'na', 0, 0, 32.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:05:30', '', '', 1),
(2635, '8941183001564', 'Jet Liquid 1000ml', 2, 0, 0, 'na', 0, 0, 520.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:06:24', '', '', 1),
(2636, '8941183001533', 'Jet   Liquid   soft', 2, 0, 0, 'na', 0, 0, 520.00, 600.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:07:11', '', '', 1),
(2637, '8904238302085', 'Foog Fine Fizzy Dew 120ml', 2, 0, 0, 'na', 0, 0, 363.00, 470.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-05 08:24:39', '', '', 1),
(2638, '8819937919048', 'Paragon Chicken Strips 200gm', 1, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:06:50', 'Admin', '2025-06-15 17:53:17', 1),
(2639, '784196632817', 'Nature Beauty  Hyaluronic Face serum 30ml', 2, 0, 0, 'na', 0, 0, 430.00, 575.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:07:49', '', '', 1),
(2640, '784196632794', 'Nature Beauty Hyaluronic Acne  Face serum 30ml', 2, 0, 0, 'na', 0, 0, 430.00, 575.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:09:19', '', '', 1),
(2641, '8944000574517', 'Lilac   Face serum 30ml	', 2, 0, 0, 'na', 0, 0, 712.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:11:19', '', '', 1),
(2642, '8819937919130', 'Paragon Chicken Burger Patty 6pcs', 1, 0, 0, 'na', 0, 0, 270.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:14:09', 'Admin', '2025-06-15 17:35:27', 1),
(2643, '784196632800', 'Nature Beauty Niacinamide Face Serum 30ml', 2, 0, 0, 'na', 0, 0, 0.00, 575.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:14:28', '', '', 1),
(2644, '8819937919017', 'Paragon Chicken Nuggets 10pcs', 1, 0, 0, 'na', 0, 0, 170.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:15:03', 'Admin', '2025-06-15 17:10:56', 1),
(2645, '8819139711075', 'Paragon Vegetable Roll 10pcs', 1, 0, 0, 'na', 0, 0, 122.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:15:42', 'Admin', '2025-06-15 17:52:41', 1),
(2646, '8944000574524', 'LilacBrightening serum 30ml', 2, 0, 0, 'na', 0, 0, 712.00, 950.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:15:53', '', '', 1),
(2647, '8819139711099', 'Paragon Chicken Samosa 10pcs', 1, 0, 0, 'na', 0, 0, 271.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:16:35', 'Admin', '2025-06-15 17:28:50', 1),
(2648, '8944000574579', 'Lilac 3x spot Lightener', 2, 0, 0, 'na', 0, 0, 262.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:17:11', '', '', 1),
(2649, '8819937919499', 'Paragon Chicken Beef Momo 12pcs', 1, 0, 0, 'na', 0, 0, 309.00, 370.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:17:42', 'Admin', '2025-06-15 17:56:49', 1),
(2650, '8944000574715', 'Rajkonna toner 120ml', 2, 0, 0, 'na', 0, 0, 180.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:18:16', '', '', 1),
(2651, 'P02650', 'Paragon Chicken Ball 500gm', 1, 0, 0, 'na', 0, 0, 0.00, 285.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:18:40', '', '', 1),
(2652, 'P02652', 'Paragon Chicken Nuggets 500gm', 1, 0, 0, 'na', 0, 0, 0.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:19:23', '', '', 1),
(2653, '8944000579031', 'Rajkonna Spf 40 pa+++', 2, 0, 0, 'na', 0, 0, 371.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:19:37', '', '', 1),
(2654, 'P02653', 'Paragon Chicken Mini Spring Roll 1000gm', 1, 0, 0, 'na', 0, 0, 600.00, 680.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:20:39', '', '', 1),
(2655, '8944000574586', 'Rajikonna Light Rice Water 50g', 2, 0, 0, 'na', 0, 0, 221.00, 295.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:22:33', '', '', 1),
(2656, '8901262010320', 'Amul Butter ', 1, 0, 0, 'na', 0, 0, 280.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:24:29', 'Admin', '2025-06-21 17:07:36', 1),
(2657, '8901248104791', 'Navratna  Oil ', 2, 0, 0, 'na', 0, 0, 215.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:24:45', 'Admin', '2025-06-24 17:39:05', 1),
(2658, '8941189300265', 'Igloo Icecream Vanila 500ml', 1, 0, 0, 'na', 0, 0, 140.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:25:43', '', '', 1),
(2659, '8941189300197', 'Igloo Icecream Single Sunday', 1, 0, 0, 'na', 0, 0, 42.50, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:26:19', '', '', 1),
(2660, '8941189300203', 'Igloo Block Forest Cup Icecream ', 1, 0, 0, 'na', 0, 0, 59.16, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:27:21', '', '', 1),
(2661, '8901088736954', 'livon Anti Frizz  Serum  45ml', 2, 0, 0, 'na', 0, 0, 270.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:27:28', 'Admin', '2025-06-27 19:27:26', 1),
(2662, '8941189308759', 'Igloo Loli Lemon Icecream', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:28:02', '', '', 1),
(2663, '8941189308766', 'Igloo Loli Orange Icecream', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:28:34', '', '', 1),
(2664, '8941189300104', 'Igloo Cup Icecream', 1, 0, 0, 'na', 0, 0, 25.55, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:29:08', '', '', 1),
(2665, '8941189302207', 'Igloo Dudh Malai Icecream', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:29:45', 'Admin', '2025-07-10 11:47:39', 1),
(2666, '8941189308810', 'Igloo Kheer Maklai Icecream 1L', 1, 0, 0, 'na', 0, 0, 0.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:30:47', '', '', 1),
(2667, '8941189300487', 'Igloo Dabule Sunday Chocolate Chears Icecream 1L', 1, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:31:50', 'Admin', '2025-07-02 19:57:57', 1),
(2668, '8941189300449', 'Igloo Dabule Sunday Mango Melady Icecream 1L', 1, 0, 0, 'na', 0, 0, 0.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:32:41', '', '', 1),
(2669, '8904319400006', 'Sesa  Ayurvedic  100ml', 2, 0, 0, 'na', 0, 0, 335.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:33:32', '', '', 1),
(2670, '8941189300395', 'Igloo Nawabi Mithai Icecream 1L', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:33:44', 'Admin', '2025-07-02 19:58:42', 1),
(2671, '8941189300074', 'Igloo Mega Icecream', 1, 0, 0, 'na', 0, 0, 59.38, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:34:36', '', '', 1),
(2672, '8941189300081', 'Igloo Macho Icecream', 1, 0, 0, 'na', 0, 0, 58.75, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:35:03', '', '', 1),
(2673, '8908001158022', 'White Tone Face powder  70g', 2, 0, 0, 'na', 0, 0, 280.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:35:13', 'Admin', '2025-06-24 17:43:48', 1),
(2674, '8941189302191', 'Chocobar Icecream', 1, 0, 0, 'na', 0, 0, 29.79, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:35:47', '', '', 1),
(2675, '8941189308773', 'Igloo Chocobar Icecream', 1, 0, 0, 'na', 0, 0, 25.62, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:36:46', '', '', 1),
(2676, '8941189300098', 'Igloo Ego Icecream', 1, 0, 0, 'na', 0, 0, 82.09, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:37:16', '', '', 1),
(2677, '8941189300234', 'Corneli Classic Icecream 60/=', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:37:57', 'Admin', '2025-07-02 19:56:21', 1),
(2678, '00001', 'Revlon Colorsilk Beautiful  ', 2, 0, 0, 'na', 0, 0, 462.00, 675.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:38:00', 'Admin', '2025-06-06 01:40:50', 1),
(2679, '0001', 'Cornelli Belgian Chocolate Icecream 70/=', 1, 0, 0, 'na', 0, 0, 58.93, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:38:36', 'Admin', '2025-06-18 21:58:28', 1),
(2680, '8941189300036', 'Shell & Core Icecream', 1, 0, 0, 'na', 0, 0, 20.60, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:39:29', '', '', 1),
(2681, '8941154034560', 'Ring Chips', 1, 0, 0, 'na', 0, 0, 16.20, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:41:20', '', '', 1),
(2684, '8420701103176', 'RS Rafael Salgado Extra Virgin  oil  ', 2, 0, 0, 'na', 0, 0, 350.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:50:22', '', '', 1),
(2685, '8941161137995', 'Fresh Crispee 30gm', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:51:55', 'Admin', '2025-06-25 20:27:54', 1),
(2686, '639853998006', 'Clariss  oliv oil pomaace ', 2, 0, 0, 'na', 0, 0, 392.00, 490.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:52:04', '', '', 1),
(2687, '8941158124212', 'Earth Beauty  Face And neck ', 2, 0, 0, 'na', 0, 0, 300.00, 395.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:53:20', '', '', 1),
(2688, '7702018464852', 'Gillette Fusion 75ml', 2, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:54:29', 'Admin', '2025-06-24 18:02:53', 1),
(2689, '7702018308309', 'Gillette Mach3 200ml', 2, 0, 0, 'na', 0, 0, 550.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:55:34', 'Admin', '2025-06-26 16:34:28', 1),
(2690, '7702018619696', 'Gillette  Series 200ml', 2, 0, 0, 'na', 0, 0, 0.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 01:59:38', '', '', 1),
(2691, 'P02690', 'Alu 1kg', 1, 0, 0, 'na', 0, 0, 22.00, 25.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-06 02:10:16', 'Admin', '2025-06-26 19:01:59', 1),
(2692, 'P02692', 'piaj 1kg', 1, 0, 0, 'na', 0, 0, 55.00, 60.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-06 02:10:40', '', '', 1),
(2693, '8690973367709', 'She Is a Clubber 150ml', 2, 0, 0, 'na', 0, 0, 632.00, 790.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:11:00', '', '', 1),
(2694, 'P02693', 'Rosun 1kg', 1, 0, 0, 'na', 0, 0, 160.00, 180.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-06 02:11:04', '', '', 1),
(2695, 'P02695', 'Ada 1kg', 1, 0, 0, 'na', 0, 0, 160.00, 180.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-06 02:11:15', '', '', 1),
(2697, '8690973040770', 'She Is a Fun 150ml', 2, 0, 0, 'na', 0, 0, 632.00, 790.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:11:42', '', '', 1),
(2698, '8809416470368', 'Cosrx Centella Blemish 30g', 2, 0, 0, 'na', 0, 0, 1320.00, 2200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:13:20', '', '', 1),
(2699, '8809598454545', 'Cosrx Clarifying toner 50ml', 2, 0, 0, 'na', 0, 0, 500.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:14:57', '', '', 1),
(2700, '8904238302559', 'Real man Pure Cologne 100ml', 2, 0, 0, 'na', 0, 0, 922.00, 1250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:17:05', '', '', 1),
(2701, '8904238302535', 'Real man Pure Spicy 100ml', 2, 0, 0, 'na', 0, 0, 922.00, 1250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:18:39', '', '', 1),
(2702, '8904238302573', 'Real man Pure Aqua 100ml', 2, 0, 0, 'na', 0, 0, 922.00, 1250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:19:46', '', '', 1),
(2703, '8809416470009', 'Cosrx  Snail 96 100ml', 2, 0, 0, 'na', 0, 0, 780.00, 2500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:21:10', '', '', 1),
(2704, '8809416471112', 'Cosrx  Salicylic 150ml', 2, 0, 0, 'na', 0, 0, 1278.00, 1500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:22:47', '', '', 1),
(2705, '8809598455658', 'Cosrx  The 6 Peptide Skin 150l', 2, 0, 0, 'na', 0, 0, 1560.00, 2500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:24:13', '', '', 1),
(2706, '8809416470030', 'Cosrx Clarifying toner 150ml', 2, 0, 0, 'na', 0, 0, 1200.00, 2100.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:25:15', '', '', 1),
(2707, '8809416470191', 'Cosrx  Aloe Soothing Sun Cream 50+', 2, 0, 0, 'na', 0, 0, 950.00, 1640.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:26:48', '', '', 1),
(2708, '8809416470122', 'Cosrx Hyaluronic 100g', 2, 0, 0, 'na', 0, 0, 1500.00, 2500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:28:11', '', '', 1),
(2709, '784196633012', 'Fruity Beauty bar Premium 115g', 2, 0, 0, 'na', 0, 0, 225.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:29:33', '', '', 1),
(2710, '784196633005', 'Saffron Beauty Bar 100g', 2, 0, 0, 'na', 0, 0, 290.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:30:52', '', '', 1),
(2711, '8944000579208', 'Sun screen Skin cafe 50Pa', 2, 0, 0, 'na', 0, 0, 487.50, 650.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:32:02', '', '', 1),
(2712, '8944000574531', 'Lilac Niacinamide 30ml', 2, 0, 0, 'na', 0, 0, 712.00, 950.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:33:01', '', '', 1),
(2713, '8944000579093', 'Lilac  Advanced Bright Lhi 50g', 2, 0, 0, 'na', 0, 0, 637.00, 850.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:34:25', '', '', 1),
(2714, '8941183002325', 'Ujala Supreme 100ml', 2, 0, 0, 'na', 0, 0, 29.00, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:35:39', '', '', 1),
(2715, '8809747942121', 'Aqua Missha Sun pa++++', 2, 0, 0, 'na', 0, 0, 760.00, 1450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:37:02', 'Admin', '2025-07-08 17:35:55', 1),
(2716, '8941183007061', 'Fay Baby Coton Buds', 2, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:38:01', '', '', 1),
(2717, '784196632923', 'Nature  Sunscreen 50Pa+++', 2, 0, 0, 'na', 0, 0, 412.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:39:19', '', '', 1),
(2718, '8944000592269', 'Night Rep Cream 50gm', 2, 0, 0, 'na', 0, 0, 368.00, 490.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:40:30', '', '', 1),
(2719, '8944000592276', 'Skin Cafe All day 50gm b', 2, 0, 0, 'na', 0, 0, 368.00, 490.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:41:36', '', '', 1),
(2720, '8809598451766', 'Cosrx Low Good M Gel 50ml', 2, 0, 0, 'na', 0, 0, 778.00, 880.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:42:53', '', '', 1),
(2721, '8809547411162', 'Pax Moly acne Clean  ABROP', 2, 0, 0, 'na', 0, 0, 950.00, 1000.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:44:38', '', '', 1),
(2722, '8819937919086', 'Paragon Chicken Sausage 10pcs', 1, 0, 0, 'na', 0, 0, 220.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:44:45', 'Admin', '2025-06-15 17:30:07', 1),
(2723, '8819937919369', 'Paragon Chicken Nuggets 20pcs', 1, 0, 0, 'na', 0, 0, 200.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:45:38', 'Admin', '2025-06-15 17:12:51', 1),
(2724, '025929166200', 'Spirit Heaven Men Oriental ', 2, 0, 0, 'na', 0, 0, 880.00, 1099.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:45:42', '', '', 1),
(2725, '8819139712027', 'Paragon Low Fat Parata 10pcs', 1, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:46:24', 'Admin', '2025-06-15 18:37:54', 1),
(2726, '8690973366405', 'She is love Hunca 150 ml', 2, 0, 0, 'na', 0, 0, 632.00, 790.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:46:36', '', '', 1),
(2727, '8819139712010', 'Paragon Low Fat Porata 20pcs', 1, 0, 0, 'na', 0, 0, 210.00, 255.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:47:19', 'Admin', '2025-06-15 18:00:12', 1),
(2728, '8819937919543', 'Paragon Family Parata 10pcs', 1, 0, 0, 'na', 0, 0, 145.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:47:57', 'Admin', '2025-06-15 17:58:53', 1),
(2729, '8944000574777', 'Rajkonna shower Gel 330 ml', 2, 0, 0, 'na', 0, 0, 247.00, 330.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:49:08', '', '', 1),
(2730, '8819139711037', 'Paragon Family Porata 20pcs', 1, 0, 0, 'na', 0, 0, 271.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:49:26', '', '', 1),
(2731, '8944000575507', 'Lavina Vitnin c Shower Gel Orange ', 2, 0, 0, 'na', 0, 0, 356.00, 475.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:51:01', '', '', 1),
(2732, '091', 'Lavino Mint shower gel 330ml', 2, 0, 0, 'na', 0, 0, 0.00, 475.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:52:34', '', '', 1),
(2733, '784196632909', 'nature beauty Lemon handwash 370ml', 2, 0, 0, 'na', 0, 0, 160.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:54:01', '', '', 1),
(2734, '8944000575514', 'Lavno Tomato 250 mlb', 2, 0, 0, 'na', 0, 0, 356.00, 475.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:54:58', '', '', 1),
(2735, '8941160007572', 'Wave Anti Tobacco AirFreshenar', 1, 0, 0, 'na', 0, 0, 0.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:55:08', '', '', 1),
(2736, '8944000575521', 'Lavno Milk250 mlb', 2, 0, 0, 'na', 0, 0, 356.00, 475.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-06 02:55:42', '', '', 1),
(2737, '8941160007527', 'Wave Jasmine AirFreshenar', 1, 0, 0, 'na', 0, 0, 0.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:55:42', '', '', 1),
(2738, '8941160007602', 'Wave Orange AirFreshenar', 1, 0, 0, 'na', 0, 0, 0.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:56:11', '', '', 1),
(2739, '8941160007565', 'Wave Lemongrass AirFreshenar', 2, 0, 0, 'na', 0, 0, 0.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:56:45', '', '', 1),
(2740, '8941160007541', 'Wave Rajonigondha AirFreshenar', 2, 0, 0, 'na', 0, 0, 0.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:57:25', '', '', 1),
(2741, '8941160007534', 'Wave Lemon AirFreshenar', 2, 0, 0, 'na', 0, 0, 0.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:57:44', '', '', 1),
(2742, '6294015102390', 'Armaf Enchanted Air Freshener', 2, 0, 0, 'na', 0, 0, 380.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 02:59:17', '', '', 1),
(2743, '6294015102352', 'Armaf Foliage Air Freshener', 2, 0, 0, 'na', 0, 0, 380.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:00:13', '', '', 1),
(2745, '6294015102383', 'Armaf Jummer Air Freshener', 2, 0, 0, 'na', 0, 0, 380.00, 475.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:00:50', '', '', 1),
(2746, '6294015149487', 'Armaf Warm red Air Freshener', 2, 0, 0, 'na', 0, 0, 340.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:02:30', '', '', 1),
(2747, '6294015149463', 'Armaf Wild Beauty Air Freshener', 2, 0, 0, 'na', 0, 0, 340.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:03:34', '', '', 1),
(2748, '6291104002326', 'Marten strawberry Airfreshener', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:04:43', '', '', 1),
(2749, '6291104002340', 'Marten Jasmine Airfreshener', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:05:31', 'Admin', '2025-06-06 03:05:52', 1),
(2750, '6291104002593', 'Marten Orange Airfreshener', 2, 0, 0, 'na', 0, 0, 0.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:06:23', '', '', 1),
(2751, '784196632961', 'Nature Beauty Lemon Twist Airfreshener', 2, 0, 0, 'na', 0, 0, 180.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:07:24', '', '', 1),
(2752, '784196632978', 'Nature Beauty Jasmine Dew Airfreshener', 2, 0, 0, 'na', 0, 0, 180.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:08:48', '', '', 1),
(2753, '784196632985', 'Nature Beauty Anti tobaco Airfreshener', 2, 0, 0, 'na', 0, 0, 180.00, 260.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:09:25', '', '', 1),
(2754, '7622201762285', 'Dairy Milk silk Mousse 116g', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:14:33', '', '', 1),
(2755, '7622202290695', 'Dairy Milk silk Mousse 50g', 1, 0, 0, 'na', 0, 0, 160.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:15:02', '', '', 1),
(2756, '7622202290428', 'Dairy Milk silk Rost Amond 50g', 1, 0, 0, 'na', 0, 0, 190.00, 225.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:15:58', '', '', 1),
(2757, '7622201761820', 'Dairy Milk Silk Bubbly 50g', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:18:19', '', '', 1),
(2758, '7622202290572', 'Dairy Milk silk Oreo 50g', 1, 0, 0, 'na', 0, 0, 160.00, 190.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:18:46', '', '', 1),
(2759, '7622202237911', 'Dairy Milk silk Chocolate 40gm', 1, 0, 0, 'na', 0, 0, 128.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:19:49', 'Admin', '2025-06-18 22:58:11', 1),
(2760, '7622201762346', 'Dairy Milk silk Bubbly 116g', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:22:45', '', '', 1),
(2761, '7622202290510', 'Dairy Milk silk Fruit & Nut 116g', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:23:27', '', '', 1),
(2762, '7622201766481', 'Dairy Milk silk Chocolate 116g', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:24:00', '', '', 1),
(2763, '7622201762223', 'Dairy Milk silk Oreo 116g', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:24:46', '', '', 1),
(2764, '7622201415662', 'Dairy Milk Crispello 13g', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:26:09', '', '', 1),
(2765, '6085010092515', 'Armaf High Street Body Spray', 1, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 03:40:23', 'Admin', '2025-06-06 03:41:36', 1),
(2766, '8906055793015', 'Wattagirl ELIXIR Parfume', 2, 0, 0, 'na', 0, 0, 1272.00, 1590.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-06 03:56:49', '', '', 1),
(2767, '8941154033969', 'Alooz Chips 20/=', 1, 0, 0, 'na', 0, 0, 16.20, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 04:18:08', '', '', 1),
(2768, '89411540', 'Potato Chips 10/=', 1, 0, 0, 'na', 0, 0, 8.10, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 04:19:12', '', '', 1),
(2769, '2525', 'Mr Twist Chips 25/=', 1, 0, 0, 'na', 0, 0, 20.25, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-06 04:19:49', '', '', 1),
(2770, '8941193105344', 'SMC Plus Apple Drink 200ml', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-10 20:18:27', '', '', 1),
(2771, '8901393019377', 'Chupa Chups soft Candy Cola ', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-10 20:20:16', '', '', 1),
(2772, '8901393016635', 'Chupa Chups soft Candy Mango', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-10 20:21:29', 'Admin', '2025-06-15 15:48:47', 1),
(2773, '8169003007033', 'Kernel Sunflower Oil 2.585kg', 1, 0, 0, 'na', 0, 0, 630.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-15 16:04:42', 'Admin', '2025-06-15 16:32:33', 1),
(2774, '8169003007071', 'aci sugar 958gm', 1, 0, 0, 'na', 0, 0, 125.00, 145.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-15 16:35:17', '', '', 1),
(2775, '8941693011022', 'ACI RED LENTIL 1KG', 1, 0, 0, 'na', 0, 0, 125.00, 150.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-15 16:39:35', '', '', 1),
(2776, '8169003010293', 'Kernel Sunflower Oil .646kg	', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-15 16:48:55', '', '', 1),
(2777, '8941100512838', 'RADHUNI SUNFLOWER OIL 2L', 1, 0, 0, 'na', 0, 0, 750.00, 870.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-15 16:54:37', '', '', 1),
(2778, '8819139712119', 'Chicken mini spring roll 1kg', 1, 0, 0, 'na', 0, 0, 520.00, 680.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-15 17:18:20', '', '', 1),
(2779, '8819937919796', 'Chicken Nuggets 1kg', 1, 0, 0, 'na', 0, 0, 520.00, 680.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-15 17:20:51', '', '', 1),
(2780, '8819139711266', 'Chicken mini samosa 1 kg', 1, 0, 0, 'na', 0, 0, 520.00, 680.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-15 17:22:16', '', '', 1),
(2781, '8819937919895', 'Chicken nuggets 500g', 1, 0, 0, 'na', 0, 0, 280.00, 350.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-15 17:26:25', '', '', 1),
(2782, '8819937914517', 'Chicken Ball 500g', 1, 0, 0, 'na', 0, 0, 240.00, 285.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-15 17:27:19', '', '', 1),
(2783, '8819937919055', 'Chicken Lollopop', 1, 0, 0, 'na', 0, 0, 250.00, 295.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-15 17:34:04', '', '', 1),
(2784, '8819139711167', 'Chicken mini Samosa 25-26', 1, 0, 0, 'na', 0, 0, 177.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-15 17:54:32', '', '', 1),
(2785, '8819937914418', 'Chicken Ball 1kg', 1, 0, 0, 'na', 0, 0, 420.00, 550.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-15 18:36:58', '', '', 1),
(2786, '8819139711105', 'Vegetable Samosa 10 pc', 1, 0, 0, 'na', 0, 0, 122.00, 145.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-15 18:38:49', '', '', 1),
(2787, '745114130303', 'Pulse Candy', 1, 0, 0, 'na', 0, 0, 1.50, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-15 21:01:43', 'Admin', '2025-06-21 09:49:19', 1),
(2788, 'P02788', 'Olympic AAA', 2, 0, 0, 'na', 0, 0, 12.50, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-15 21:05:18', '', '', 1),
(2789, '880196272203', 'RC COLA 1L', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-16 09:16:42', '', '', 1),
(2790, '8801962728658', 'JEERA PANI', 1, 0, 0, 'na', 0, 0, 18.75, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-16 09:19:15', '', '', 1),
(2791, '8806050127047', 'Hi-Speedy Color Cream 40g', 2, 0, 0, 'na', 0, 0, 415.00, 500.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 11:49:07', 'Admin', '2025-06-16 14:33:55', 1),
(2792, '841165164264', 'lolli pop  30/=', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 13:22:28', '', '', 1),
(2793, '846656010068', 'Treat yammy chocolate', 1, 0, 0, 'na', 0, 0, 180.00, 240.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-16 13:32:15', '', '', 1),
(2794, '4116513020', 'Treat yammy chocolate	mini love', 1, 0, 0, 'na', 0, 0, 72.00, 90.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-16 13:35:08', '', '', 1),
(2795, '841165145232', 'sixers 10/=', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 13:38:13', '', '', 1),
(2796, '841165145249', 'Sixers 20/=', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 13:40:34', '', '', 1),
(2797, '8941124000489', 'Keya soap pink ', 2, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 13:54:45', '', '', 1),
(2798, '8941124000779', 'keya lemon powder', 2, 0, 0, 'na', 0, 0, 53.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 13:58:07', 'Admin', '2025-06-18 09:29:37', 1),
(2799, 'P02799', 'Hi-Speedy Powder 6 g', 2, 0, 0, 'na', 0, 0, 0.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 14:33:38', '', '', 1),
(2800, 'P02800', 'Hi-Speedy Shaving Foam Regular 200 ml', 2, 0, 0, 'na', 0, 0, 115.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 14:35:44', '', '', 1),
(2801, 'P02801', 'Hi-Speedy Shaving Foam Lemon 200 ml', 2, 0, 0, 'na', 0, 0, 115.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 14:36:38', '', '', 1),
(2802, 'P02802', 'Hi-Speedy Shaving Foam Lemon 100 m', 2, 0, 0, 'na', 0, 0, 75.00, 115.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 14:37:12', '', '', 1),
(2803, '846656004029', 'Mr. Noodles Magic 4 pac', 1, 0, 0, 'na', 0, 0, 70.00, 90.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 14:49:15', 'Admin', '2025-06-16 14:49:28', 1),
(2804, '840205714407', 'Mr. Noodles Korean 4 pac', 1, 0, 0, 'na', 0, 0, 93.00, 110.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 14:51:05', '', '', 1),
(2805, '840205715183', 'Mr. Noodles Korean 8 pac', 1, 0, 0, 'na', 0, 0, 188.00, 210.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-16 14:54:48', '', '', 1),
(2806, '880196272825', 'RC Lemon', 1, 0, 0, 'na', 0, 0, 18.75, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-16 15:59:29', '', '', 1),
(2807, '88019627280', 'RC Cola', 1, 0, 0, 'na', 0, 0, 17.09, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-16 16:01:51', '', '', 1),
(2808, '745114130037', 'Lexus Biscuit 216g', 1, 0, 0, 'na', 0, 0, 80.70, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:19:09', '', '', 1),
(2809, '745114130723', 'Nutty Biscuit 175g', 1, 0, 0, 'na', 0, 0, 33.60, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:23:56', '', '', 1),
(2810, '0745114130631', 'Tip Biscuit 200gm', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:27:15', '', '', 1),
(2811, '745114130792', 'Milk Marie 200gm', 1, 0, 0, 'na', 0, 0, 33.60, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:30:45', '', '', 1),
(2812, '745114130693', 'First Choice 180g', 1, 0, 0, 'na', 0, 0, 33.60, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:32:26', '', '', 1),
(2813, '745114130471', 'Energy Plus Biscuit 185g', 1, 0, 0, 'na', 0, 0, 37.80, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:33:35', '', '', 1),
(2814, '745114130488', 'Energy Plus 62g', 1, 0, 0, 'na', 0, 0, 12.00, 15.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:34:52', '', '', 1),
(2815, '745114130716', 'Nutty Biscuit 50g', 1, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:35:39', '', '', 1),
(2816, '745114130624', 'Tip Biscuit 60g', 1, 0, 0, 'na', 0, 0, 13.00, 15.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 16:36:32', '', '', 1),
(2817, '0745125555058', 'Keya Glycerine Landry Soap 125g', 2, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 17:13:03', 'Admin', '2025-06-18 09:04:06', 1),
(2818, '8941124000083', 'Keya Super Lemon Soap 100g', 2, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 17:15:22', 'Admin', '2025-06-18 09:18:40', 1),
(2819, '745125555126', 'Keya White Plus Detergent Powder 2kg', 2, 0, 0, 'na', 0, 0, 335.00, 370.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 17:23:12', 'Admin', '2025-06-18 09:23:26', 1),
(2820, '8941124000953', 'Keya White Plus Detergent Powder 500g', 2, 0, 0, 'na', 0, 0, 60.00, 90.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 17:24:29', 'Admin', '2025-06-18 09:26:09', 1),
(2821, '745114131300', 'Biscotti cookies', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 19:47:31', '', '', 1),
(2822, '745114130754', 'Digestive Biscuit', 1, 0, 0, 'na', 0, 0, 20.00, 30.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 19:50:09', '', '', 1),
(2823, '8941194003717', 'Chocolate Digestive Biscuit 137g', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-16 19:51:13', '', '', 1),
(2824, 'P02824', 'xcel Chewing gum', 1, 0, 0, 'na', 0, 0, 1.50, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 11:55:15', '', '', 1),
(2825, '8941161147925', 'fresh noodles in cup 40 g', 1, 0, 0, 'na', 0, 0, 26.67, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 12:02:04', 'Admin', '2025-06-17 12:02:21', 1),
(2826, '8941161147796', 'fresh noodles 992g	', 1, 0, 0, 'na', 0, 0, 268.00, 330.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 12:06:21', '', '', 1),
(2827, '8941161147543', 'fresh noodles 496g	', 1, 0, 0, 'na', 0, 0, 130.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 12:07:34', '', '', 1),
(2828, '841165127580', 'pran pomegranate ', 1, 0, 0, 'na', 0, 0, 39.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 13:38:24', '', '', 1),
(2829, '840205703104', 'mango bar 10/=', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 13:39:45', 'Admin', '2025-06-24 11:18:09', 1),
(2830, '831730009250', 'Pran minicate rice 5kg', 1, 0, 0, 'na', 0, 0, 420.00, 455.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-17 13:50:13', 'Admin', '2025-06-17 13:50:38', 1),
(2831, 'P02831', 'Pran minicate rice25kg	', 1, 0, 0, 'na', 0, 0, 1850.00, 2250.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-17 14:03:45', '', '', 1),
(2832, '8906014765152', 'bajaj almond drops oill 200ml', 2, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 14:17:06', '', '', 1),
(2833, '8941124000670', 'Power Liquid Toilet Cleaner 500ml', 2, 0, 0, 'na', 0, 0, 55.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-17 16:02:19', 'Admin', '2025-06-18 09:21:45', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(2834, '8420701472661', 'Lucy Oliva Olive Oil 50ml', 2, 0, 0, 'na', 0, 0, 125.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-17 17:15:48', '', '', 1),
(2835, '8941160235043', 'Sesa Herbal Hair Oil 200ml', 2, 0, 0, 'na', 0, 0, 415.00, 490.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-17 17:24:01', '', '', 1),
(2836, '8941160235173', 'Sesa Herbal Care Shampoo 350ml', 2, 0, 0, 'na', 0, 0, 279.17, 335.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-17 17:25:43', '', '', 1),
(2837, '8941160235098', 'Sesa Strong Roots Hair Oil 110ml', 2, 0, 0, 'na', 0, 0, 246.00, 295.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-17 17:27:08', '', '', 1),
(2838, '8908019308051', 'Sesa Herbal Care Hair Oil 100ml', 2, 0, 0, 'na', 0, 0, 210.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-17 17:30:57', '', '', 1),
(2839, '8904319401096', 'Sesa Herbal Anti-Hair Fall Shampoo 100ml', 2, 0, 0, 'na', 0, 0, 0.00, 95.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-17 17:36:12', '', '', 1),
(2840, '8941160235036', 'Sesa Herbal Hair Oil 100ml', 2, 0, 0, 'na', 0, 0, 210.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-17 17:50:46', '', '', 1),
(2841, '8935006540385', 'Oxy Total Anti-Acne 100g', 2, 0, 0, 'na', 0, 0, 550.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 17:53:45', '', '', 1),
(2842, '8935006531956', 'Oxy Deep Wash 100g', 2, 0, 0, 'na', 0, 0, 550.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 17:56:44', '', '', 1),
(2843, '8935006540347', 'Oxy Perfect Wash 100g', 2, 0, 0, 'na', 0, 0, 550.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 17:57:26', 'Admin', '2025-06-17 17:57:46', 1),
(2844, '8935006542334', 'Oxy White Complete 100g', 2, 0, 0, 'na', 0, 0, 550.00, 650.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 17:58:54', '', '', 1),
(2845, '8935006532069', 'Oxy Deep Wash 50g', 2, 0, 0, 'na', 0, 0, 365.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 17:59:47', '', '', 1),
(2846, '8935006540354', 'Oxy Perfect Wash 50g', 2, 0, 0, 'na', 0, 0, 365.00, 430.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-17 18:00:50', '', '', 1),
(2847, '8941159001130', 'Milk Vita Ghee', 1, 0, 0, 'na', 0, 0, 330.00, 380.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-17 18:48:03', '', '', 1),
(2848, '8941101010722', 'Aarong Dairy Yoghurt 500g', 1, 0, 0, 'na', 0, 0, 104.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-17 18:51:32', 'Admin', '2025-06-22 17:46:16', 1),
(2849, 'P02849', 'Alachi', 1, 0, 0, 'na', 0, 0, 5500.00, 6000.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-17 20:07:56', '', '', 1),
(2850, 'P02850', 'Jira ', 1, 0, 0, 'na', 0, 0, 750.00, 1000.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-17 20:08:44', '', '', 1),
(2851, 'P02851', 'Jira(ind)', 1, 0, 0, 'na', 0, 0, 580.00, 800.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-17 20:11:32', '', '', 1),
(2852, 'P02852', 'Kacha Moric ', 1, 0, 0, 'na', 0, 0, 590.00, 1600.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-17 20:56:57', '', '', 1),
(2853, 'P02853', 'Lobon', 1, 0, 0, 'na', 0, 0, 670.00, 2000.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-17 20:57:24', '', '', 1),
(2854, 'P02854', 'DharChini', 1, 0, 0, 'na', 0, 0, 480.00, 800.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-17 20:58:02', '', '', 1),
(2855, 'P02855', 'KathBadam', 1, 0, 0, 'na', 0, 0, 1200.00, 1500.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-17 21:02:55', 'Admin', '2025-07-02 21:55:13', 1),
(2856, 'P02856', 'Kismis', 1, 0, 0, 'na', 0, 0, 330.00, 800.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-17 21:03:21', '', '', 1),
(2857, '8941124000786', 'keya lemon powder	1kg', 2, 0, 0, 'na', 0, 0, 105.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 09:33:22', '', '', 1),
(2858, '8941165002893', 'Boom Biscuits', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 11:12:44', '', '', 1),
(2859, '8941165002619', 'Yoyo Biscuits', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 11:15:40', '', '', 1),
(2860, '841165136834', 'Mithai Son Papdi', 1, 0, 0, 'na', 0, 0, 105.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 11:23:34', '', '', 1),
(2861, '840205727865', 'Europa wafer', 1, 0, 0, 'na', 0, 0, 46.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 11:25:11', '', '', 1),
(2862, '841165163489', 'Pran Hot Tomato Sauce', 1, 0, 0, 'na', 0, 0, 132.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 12:04:58', 'Admin', '2025-07-12 11:54:20', 1),
(2863, '846656006603', 'Pran Hot Tomato Sauce 1kg	', 1, 0, 0, 'na', 0, 0, 245.00, 290.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 12:07:38', '', '', 1),
(2864, '846656005088', 'Parn Hot Tomato Sauce 250 G', 1, 0, 0, 'na', 0, 0, 78.00, 95.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 12:18:06', '', '', 1),
(2865, 'P02865', 'Gulabari Rose water', 2, 0, 0, 'na', 0, 0, 70.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 13:27:52', '', '', 1),
(2866, '8901248451024', '7 Oil in One 100ml Hair oil', 2, 0, 0, 'na', 0, 0, 131.82, 145.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 16:14:54', 'Admin', '2025-06-18 16:15:32', 1),
(2867, '8901248451031', '7 Oil in One 200ml Hair oil', 2, 0, 0, 'na', 0, 0, 254.55, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 16:16:50', '', '', 1),
(2868, '8901248451048', '7 Oil in One 300ml Hair Oil', 2, 0, 0, 'na', 0, 0, 345.46, 380.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 16:17:31', '', '', 1),
(2869, '8901248104043', 'Navratna Oil 200ml ', 2, 0, 0, 'na', 0, 0, 243.55, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 16:18:30', 'Admin', '2025-07-08 14:14:12', 1),
(2870, '8901248253550', 'Fair & Handsome Cream 60g', 2, 0, 0, 'na', 0, 0, 309.74, 350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 16:20:26', '', '', 1),
(2871, '8901120143733', 'Sugar Free Gold 500PCS', 1, 0, 0, 'na', 0, 0, 297.00, 345.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 17:00:20', '', '', 1),
(2872, '8901120143771', 'Sugar Free Gold 300PCS', 1, 0, 0, 'na', 0, 0, 234.00, 272.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 17:01:04', '', '', 1),
(2873, '8999999059941', 'Ponds Age Miracle Night Cream 45g', 2, 0, 0, 'na', 0, 0, 1080.00, 1350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 17:21:23', '', '', 1),
(2874, '8999999059927', 'Ponds Age Miracle Day Cream 45g', 2, 0, 0, 'na', 0, 0, 1080.00, 1350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 17:22:14', '', '', 1),
(2875, '8851932111805', 'Ponds Pinkish White Glow 50ml', 2, 0, 0, 'na', 0, 0, 260.00, 350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 17:25:11', '', '', 1),
(2876, '8851932301572', 'Ponds Perfect Recience  BB powder 50g', 2, 0, 0, 'na', 0, 0, 260.00, 350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 17:27:35', '', '', 1),
(2877, '8901030826887', 'Ponds BB+ Cream Light Make-up Glow 18g', 2, 0, 0, 'na', 0, 0, 275.00, 350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 17:29:47', '', '', 1),
(2878, '60018960', 'Vaseline Jally 100ml', 2, 0, 0, 'na', 0, 0, 250.00, 350.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 17:36:43', '', '', 1),
(2879, '8886467020094', 'Dove Nourishing Body Care Beauty 75g', 2, 0, 0, 'na', 0, 0, 323.00, 450.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 17:38:16', '', '', 1),
(2880, '8886467049521', 'Dove Cream Beauty 150ml', 2, 0, 0, 'na', 0, 0, 605.00, 750.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 17:39:13', '', '', 1),
(2881, '8901030869112', 'Ponds Sandal Powder 100g', 2, 0, 0, 'na', 0, 0, 182.00, 250.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 17:40:21', '', '', 1),
(2882, '8901030869013', 'Ponds Dream Flower Powder 100g', 2, 0, 0, 'na', 0, 0, 182.00, 250.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 17:41:20', '', '', 1),
(2883, '6001085120946', 'Vaseline 100ml', 1, 0, 0, 'na', 0, 0, 323.00, 450.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 17:54:47', '', '', 1),
(2884, '4891228319366', 'Schick Extra 2 Sensitive', 2, 0, 0, 'na', 0, 0, 32.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 18:23:45', '', '', 1),
(2885, '4891228319373', 'Schick Intuition Exacta 2', 2, 0, 0, 'na', 0, 0, 32.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 18:24:34', '', '', 1),
(2886, '8941158187026', 'Anchor Milk 500ml', 1, 0, 0, 'na', 0, 0, 335.00, 390.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 18:26:04', '', '', 1),
(2887, '8901526204168', 'Garnier Color Naturals 70ml+60g', 2, 0, 0, 'na', 0, 0, 380.53, 430.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 18:54:04', '', '', 1),
(2888, '8901526204465', 'Garnier Color Naturals 3 Darkest Brown 70ml+60g', 2, 0, 0, 'na', 0, 0, 380.53, 430.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 18:57:35', '', '', 1),
(2889, '745114130686', 'Olympic First Choice', 1, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 19:20:16', '', '', 1),
(2890, '8901526573554', 'Garnier  Men Shampoo Color 10ml+10ml', 2, 0, 0, 'na', 0, 0, 300.00, 360.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-18 19:28:14', '', '', 1),
(2891, '745114130105', 'Hello Cookies', 1, 0, 0, 'na', 0, 0, 8.66, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 19:55:23', '', '', 1),
(2892, '745114132376', 'Olympic Foodie  12 pak', 1, 0, 0, 'na', 0, 0, 195.00, 255.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:20:02', '', '', 1),
(2893, '8941194002550', 'MR .Cookie', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:22:09', '', '', 1),
(2894, '745114130761', 'Olympic Dry Cake 290 g', 1, 0, 0, 'na', 0, 0, 126.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:24:19', '', '', 1),
(2895, '8941194002536', 'MR .Cookie 175g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:26:08', '', '', 1),
(2896, '8941194002888', 'Milk marie 225 g', 1, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:28:10', '', '', 1),
(2897, '8941194003656', 'Haque Bourbon 180g', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:29:19', '', '', 1),
(2898, '8941194007043', 'Haque La Kokonut', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:30:34', '', '', 1),
(2899, '745114130396', 'Olympic Foodie 8 pak', 1, 0, 0, 'na', 0, 0, 131.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:32:16', '', '', 1),
(2900, '745114130129', 'Olympic Knock 25g', 1, 0, 0, 'na', 0, 0, 172.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:33:46', '', '', 1),
(2901, '8941194003816', 'haque Digestive 120g ', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 20:41:28', '', '', 1),
(2902, 'P02902', 'pepsi 2  liter', 1, 0, 0, 'na', 0, 0, 137.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 21:07:32', '', '', 1),
(2903, 'P02892', 'mum 5lt', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 21:09:45', '', '', 1),
(2904, 'P02903', '7up 2 L', 1, 0, 0, 'na', 0, 0, 120.33, 130.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 21:10:49', '', '', 1),
(2905, 'P02905', 'pepsi 600ml', 1, 0, 0, 'na', 0, 0, 46.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 21:41:11', '', '', 1),
(2906, '710535720204', 'Mother Smile Prima 1, 400g', 1, 0, 0, 'na', 0, 0, 815.00, 850.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 21:53:45', 'Admin', '2025-06-18 21:54:00', 1),
(2907, '710535720211', 'Mother Smile Prima 2, 400g', 1, 0, 0, 'na', 0, 0, 835.00, 870.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 21:54:35', '', '', 1),
(2908, '792649683941', 'Mother Smile Grow up , 400g', 1, 0, 0, 'na', 0, 0, 490.00, 530.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 21:55:44', '', '', 1),
(2909, '792649704899', 'Mother Smile Profom , 400g	', 1, 0, 0, 'na', 0, 0, 580.00, 630.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 21:56:21', '', '', 1),
(2910, 'P02910', 'Corneli Classic Icecream 45/=', 1, 0, 0, 'na', 0, 0, 37.90, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 21:57:56', '', '', 1),
(2911, 'P02911', 'Cornelli Belgian Chocolate Icecream 50/=', 1, 0, 0, 'na', 0, 0, 0.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 21:59:13', '', '', 1),
(2912, 'P02912', 'Igloo 1/2 Lt.', 1, 0, 0, 'na', 0, 0, 135.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:02:57', '', '', 1),
(2913, 'P02913', 'Igloo 1Lt. Icecream', 1, 0, 0, 'na', 0, 0, 260.00, 300.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 22:05:54', '', '', 1),
(2914, 'P02914', 'Igloo 1lt khire malai', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 22:07:35', '', '', 1),
(2915, 'P02915', 'Igloo 1lt Batar squ Icecream', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 22:08:27', '', '', 1),
(2916, 'P02916', 'Igloo 1lt Nobabi Mithi', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 22:09:48', '', '', 1),
(2917, 'P02917', 'Igloo 1lt Dabul Sunday', 1, 0, 0, 'na', 0, 0, 300.00, 350.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-18 22:10:47', '', '', 1),
(2918, '8513691411809', 'Fast wash 1000g', 2, 0, 0, 'na', 0, 0, 143.66, 180.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-18 22:14:24', '', '', 1),
(2919, '8513691412400', 'Fast wash 2000g', 2, 0, 0, 'na', 0, 0, 286.00, 325.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-18 22:15:20', '', '', 1),
(2920, '8513690193140', 'Tibet  570 Soap 125g', 2, 0, 0, 'na', 0, 0, 24.55, 27.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:22:12', '', '', 1),
(2921, '8513690310172', 'Tibet Ball Soap ', 2, 0, 0, 'na', 0, 0, 23.75, 26.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:23:28', '', '', 1),
(2922, 'P02920', 'Smc lemon juse 250ml', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:23:49', '', '', 1),
(2923, 'P02923', 'Smc orenge juse 250ml', 1, 0, 0, 'na', 0, 0, 34.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:24:41', '', '', 1),
(2924, 'P02924', 'Smc Apply juse 200ml', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:26:22', '', '', 1),
(2925, '8513690604509', 'Ice cool powder 100gm', 2, 0, 0, 'na', 0, 0, 52.00, 65.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:34:34', '', '', 1),
(2926, '8513690404406', 'Tibet Talcum Powder', 2, 0, 0, 'na', 0, 0, 47.75, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 22:36:57', '', '', 1),
(2927, 'P02927', 'Mojo 1L', 1, 0, 0, 'na', 0, 0, 54.00, 60.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-18 23:30:27', '', '', 1),
(2928, '8944000579109', 'Lilac Face Wash dry', 2, 0, 0, 'na', 0, 0, 521.00, 0.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 23:36:57', '', '', 1),
(2929, '8944000574562', 'Rajkonna Rice Water', 2, 0, 0, 'na', 0, 0, 180.00, 0.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-18 23:37:50', '', '', 1),
(2930, '8992388134540', 'ABC Super Spicy 4 pcs', 1, 0, 0, 'na', 0, 0, 265.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 00:03:49', '', '', 1),
(2931, '8944000575446', 'Lavion Mint Shower Gel 330ml', 2, 0, 0, 'na', 0, 0, 356.00, 475.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 09:00:57', '', '', 1),
(2932, '8944000574784', 'Skin Cafe Lavender Essential oil 10ml', 2, 0, 0, 'na', 0, 0, 300.00, 400.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 09:41:29', '', '', 1),
(2933, '8944000579680', 'Skin Cafe SooThing Aloe vera Face Wash 140ml', 2, 0, 0, 'na', 0, 0, 296.00, 395.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 09:47:22', '', '', 1),
(2934, '8906150345546', 'Bellavita CEO Man 150ml', 2, 0, 0, 'na', 0, 0, 348.00, 435.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 10:33:59', 'Admin', '2025-06-19 10:34:13', 1),
(2935, '8906150345553', 'Bellavita Klub Man 150ml', 2, 0, 0, 'na', 0, 0, 348.00, 435.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 10:35:49', '', '', 1),
(2936, '8944000712193', 'Ombre I Found You Perfumed 120ml', 2, 0, 0, 'na', 0, 0, 333.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 10:56:25', '', '', 1),
(2937, '6294015102468', 'Club de nuit Man 200ml', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 11:24:55', '', '', 1),
(2938, '025929166262', 'Spirit heven  Men 200ml	', 2, 0, 0, 'na', 0, 0, 436.00, 645.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 11:26:15', '', '', 1),
(2939, '6294015102413', 'Club de nuit Man', 2, 0, 0, 'na', 0, 0, 436.00, 545.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 11:29:23', '', '', 1),
(2940, '8941158124298', 'Earth Rose jam 380ml', 2, 0, 0, 'na', 0, 0, 300.00, 330.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 12:16:22', '', '', 1),
(2941, '8941158124311', 'Earth Rose good karma', 2, 0, 0, 'na', 0, 0, 300.00, 330.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 12:17:09', '', '', 1),
(2942, '784196632916', 'Nature Beauty Strawberry  ', 2, 0, 0, 'na', 0, 0, 160.00, 250.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 12:31:41', '', '', 1),
(2943, '8801771180579', 'IRIS LIke Women 175ml ', 2, 0, 0, 'na', 0, 0, 295.00, 395.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 13:24:24', 'Admin', '2025-06-19 13:28:15', 1),
(2944, '8801771180500', 'IRIS Hike For Man', 2, 0, 0, 'na', 0, 0, 295.00, 375.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 13:28:58', '', '', 1),
(2945, '859875003162', 'Mediplus Toothbrush 40/=', 2, 0, 0, 'na', 0, 0, 68.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 13:49:07', 'Admin', '2025-06-19 13:49:16', 1),
(2946, '859875003124', 'English Antilice Shampoo 125ml', 2, 0, 0, 'na', 0, 0, 93.50, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 13:50:24', '', '', 1),
(2947, 'P02947', 'English Antilice Shampoo 8ml', 2, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 13:52:00', '', '', 1),
(2948, 'P02948', 'Bashundhara Soyabin Oil 5lt.', 1, 0, 0, 'na', 0, 0, 900.00, 922.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 14:09:02', 'Admin', '2025-06-19 14:11:18', 1),
(2949, 'P02949', 'Bashundhara Soyabin Oil 2lt.', 1, 0, 0, 'na', 0, 0, 370.00, 378.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 14:09:27', 'Admin', '2025-06-19 14:11:09', 1),
(2950, 'P02950', 'Bashundhara Soyabin Oil 1lt.', 1, 0, 0, 'na', 0, 0, 185.00, 189.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 14:09:40', 'Admin', '2025-06-19 14:11:01', 1),
(2951, 'P02951', 'Bashundhara Soyabin Oil 500ml.', 1, 0, 0, 'na', 0, 0, 0.00, 0.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 14:09:58', 'Admin', '2025-06-19 14:10:51', 1),
(2952, '8513690101503', 'Tibet Skin Cream 50ml ', 2, 0, 0, 'na', 0, 0, 61.50, 70.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 14:21:04', 'Admin', '2025-06-19 14:21:24', 1),
(2953, '8513690351809', 'Tibet Pumpkin Hair Oil 200ml', 2, 0, 0, 'na', 0, 0, 191.00, 240.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 14:22:54', '', '', 1),
(2954, '8513691412905', 'Fast Wash Detergent Powder 500g', 2, 0, 0, 'na', 0, 0, 0.00, 90.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 14:25:19', '', '', 1),
(2955, '8941197142031', 'Teer Atta 2kg', 1, 0, 0, 'na', 0, 0, 94.00, 120.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 14:36:12', 'Admin', '2025-06-19 14:36:27', 1),
(2956, 'P02956', 'Aarong Dairy Sweetened Yoghurt 500g', 1, 0, 0, 'na', 0, 0, 125.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 15:29:07', 'Admin', '2025-06-19 15:29:19', 1),
(2957, '4800888150639', 'Rexona Shower Clean ', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 15:58:16', '', '', 1),
(2958, '4800888142894', 'Rexona Passion', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 15:58:55', '', '', 1),
(2959, '4800888143402', 'Rexona Quantum Dry Men', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 15:59:28', '', '', 1),
(2960, '4800888158932', 'Rexona Powder Dry', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 15:59:54', '', '', 1),
(2961, '4800888192486', 'Rexona Advanced Men', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:00:30', '', '', 1),
(2962, '4800888153876', 'Rexona Sport Defense Men', 2, 0, 0, 'na', 0, 0, 150.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:01:01', '', '', 1),
(2963, 'P02963', 'Naphthalene Big Balls', 2, 0, 0, 'na', 0, 0, 63.33, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:05:22', 'Admin', '2025-06-19 16:32:52', 1),
(2964, 'P02964', 'Naphthalene Small Balls', 2, 0, 0, 'na', 0, 0, 31.66, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:05:44', 'Admin', '2025-06-19 16:32:31', 1),
(2965, '6926145224559', 'Cotton Swabs fine Stem', 2, 0, 0, 'na', 0, 0, 66.66, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:07:21', '', '', 1),
(2966, '6932309500421', 'China Toothbrash 135/=', 2, 0, 0, 'na', 0, 0, 60.00, 135.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:09:53', '', '', 1),
(2967, '6922683369028', 'China Kids Toothbrash 130/=', 2, 0, 0, 'na', 0, 0, 55.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:11:05', '', '', 1),
(2968, '6946844545304', 'Hair Soft Gel ', 2, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:13:11', '', '', 1),
(2969, 'P02969', 'Pakistan Armol Kali', 2, 0, 0, 'na', 0, 0, 58.33, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:14:25', '', '', 1),
(2970, '6926292541509', 'Manicure Set', 2, 0, 0, 'na', 0, 0, 220.00, 350.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:15:15', '', '', 1),
(2971, '6941334120337', 'Nail Clippers Small', 2, 0, 0, 'na', 0, 0, 90.00, 140.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:20:47', '', '', 1),
(2972, '6941334120313', 'Nail Clippers Big', 2, 0, 0, 'na', 0, 0, 125.00, 170.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:21:45', '', '', 1),
(2973, 'P02973', 'Super Glue ', 2, 0, 0, 'na', 0, 0, 16.66, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:22:37', '', '', 1),
(2974, '4902430786645', 'Gillette ', 2, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:23:14', '', '', 1),
(2975, '6972766010385', 'China Toothpick', 2, 0, 0, 'na', 0, 0, 29.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:24:59', '', '', 1),
(2976, '6936805420580', 'Bamboo Toothpick', 2, 0, 0, 'na', 0, 0, 10.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:26:52', '', '', 1),
(2977, '42204169', 'Nivea Soft Cream', 2, 0, 0, 'na', 0, 0, 190.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:27:58', '', '', 1),
(2978, '6970980540138', 'Cotton Big', 2, 0, 0, 'na', 0, 0, 35.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 16:29:04', '', '', 1),
(2979, '8922459684032', 'Shafa  mango Juce 1lt', 1, 0, 0, 'na', 0, 0, 393.60, 480.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 17:18:48', 'Admin', '2025-06-19 17:19:35', 1),
(2980, '8922459684049', 'Shafa Apple  Juce 1lt', 1, 0, 0, 'na', 0, 0, 393.60, 480.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 17:20:14', '', '', 1),
(2981, '745760505982', 'Shafa Sourcherry Juce 1lt', 1, 0, 0, 'na', 0, 0, 393.60, 480.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 17:20:48', '', '', 1),
(2982, '2312240330686', 'Ahmed Soya Sauce 250ml', 1, 0, 0, 'na', 0, 0, 83.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 18:53:55', 'Admin', '2025-06-19 18:54:08', 1),
(2983, '8231224033068', 'Ahmed Soya Sauce 500ml', 1, 0, 0, 'na', 0, 0, 120.00, 135.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-19 18:54:58', '', '', 1),
(2984, '8823122503400', 'Ahmed Baking Powder 160g', 1, 0, 0, 'na', 0, 0, 73.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 18:56:09', '', '', 1),
(2985, '8823122503509', 'Ahmed Custard Powder 160g', 1, 0, 0, 'na', 0, 0, 73.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 18:56:59', '', '', 1),
(2986, '8823122503608', 'Ahmed Corn Flour 160g', 1, 0, 0, 'na', 0, 0, 73.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 18:57:39', '', '', 1),
(2987, 'P02987', 'Sunlight Batare', 2, 0, 0, 'na', 0, 0, 17.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-19 20:03:26', '', '', 1),
(2988, '8940101202328', 'Pata Bahar Mosquito  Coil', 2, 0, 0, 'na', 0, 0, 61.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 22:06:52', '', '', 1),
(2989, '6924012154268', 'Baoma Mosquito Coil', 2, 0, 0, 'na', 0, 0, 85.00, 95.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 22:07:46', '', '', 1),
(2990, 'P02990', 'mujamel minicat 25kg', 1, 0, 0, 'na', 0, 0, 2025.00, 2150.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 22:18:43', 'Admin', '2025-06-19 22:21:17', 1),
(2991, 'P02991', 'sadman atas chal 25kg', 1, 0, 0, 'na', 0, 0, 1525.00, 1700.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 22:21:07', '', '', 1),
(2992, 'P02992', 'najer chal 25kg', 1, 0, 0, 'na', 0, 0, 2225.00, 2400.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-19 22:22:15', '', '', 1),
(2993, '7622202272639', 'Dairy Milk 21g', 1, 0, 0, 'na', 0, 0, 38.75, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-20 11:29:18', '', '', 1),
(2994, '8888192901884', 'Hosen Honey', 1, 0, 0, 'na', 0, 0, 515.00, 600.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-20 12:02:50', '', '', 1),
(2995, '7622202051647', 'Orange Tang 500g', 1, 0, 0, 'na', 0, 0, 390.00, 450.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-20 12:04:41', '', '', 1),
(2996, '5053990101597', 'Pringles Sour Cream & Onion 165gm', 1, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-20 12:17:45', '', '', 1),
(2997, '5053990101566', 'Pringles Ketchup 165gm', 1, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-20 12:19:25', '', '', 1),
(2998, 'P02998', 'osaka pani tape', 2, 0, 0, 'na', 0, 0, 5.83, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 12:39:31', '', '', 1),
(2999, '8941159000515', 'Aarong Dairy 500ml', 1, 0, 0, 'na', 0, 0, 44.50, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-21 15:19:38', 'Admin', '2025-06-22 17:45:49', 1),
(3000, 'P03000', 'Hexisol Hand Rub 250ml', 2, 0, 0, 'na', 0, 0, 112.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 15:25:35', '', '', 1),
(3001, 'P03001', 'Hexisol Hand Rub 50ml', 2, 0, 0, 'na', 0, 0, 47.15, 55.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 15:26:19', '', '', 1),
(3002, '8906108120003', 'Kaveri Mehendi Cone', 2, 0, 0, 'na', 0, 0, 20.00, 30.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-21 15:28:53', '', '', 1),
(3003, '8941149751106', 'Finis Pipra Nasok 100g', 2, 0, 0, 'na', 0, 0, 32.50, 45.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 15:36:53', '', '', 1),
(3004, '8941149751113', 'Finis Telapoka Nasok 80g', 2, 0, 0, 'na', 0, 0, 34.16, 40.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 15:38:06', '', '', 1),
(3005, '8888082117722', 'Nestle Milo 400g', 1, 0, 0, 'na', 0, 0, 700.00, 800.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-21 17:03:48', '', '', 1),
(3006, '8906036890047', 'Corn Flakes Mix 500g', 1, 0, 0, 'na', 0, 0, 450.00, 550.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-21 17:05:53', '', '', 1),
(3007, '8850124065414', 'Maggi Sauce ', 1, 0, 0, 'na', 0, 0, 215.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 17:44:12', '', '', 1),
(3008, '6294002407583', 'Herman Chilly Mayonnaise 500', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 17:48:03', '', '', 1),
(3009, '8936029057355', 'Dalos Orange Cane', 1, 0, 0, 'na', 0, 0, 115.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 18:28:51', '', '', 1),
(3010, '8936029056358', 'Dalos Mango Cane', 1, 0, 0, 'na', 0, 0, 115.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-21 18:29:23', '', '', 1),
(3011, '6288003191275', 'Alfa Mayonnaise Medium', 1, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 18:31:12', '', '', 1),
(3012, '9556183910014', 'Captain Oats 500g', 1, 0, 0, 'na', 0, 0, 420.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 18:33:29', '', '', 1),
(3013, '7622201129118', 'Tang  375g Orange', 1, 0, 0, 'na', 0, 0, 380.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 18:34:28', 'Admin', '2025-06-26 15:42:10', 1),
(3014, '8941189300258', 'Cornelli Belgain Chocolate icecream', 1, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 20:03:57', 'Admin', '2025-07-02 19:55:55', 1),
(3015, '8941189308841', 'Cornelli Classic Mini', 1, 0, 0, 'na', 0, 0, 35.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 20:04:32', '', '', 1),
(3016, '80916628', 'Kinder joy ', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-21 20:18:35', '', '', 1),
(3017, '9415007972662', 'Diploma milk 100g', 1, 0, 0, 'na', 0, 0, 105.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-21 20:24:09', '', '', 1),
(3018, '8941100510254', 'Raduni Jirar Gura 50g', 1, 0, 0, 'na', 0, 0, 75.00, 85.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-21 20:25:08', '', '', 1),
(3019, '840205725465', 'pran eclair toffee ', 1, 0, 0, 'na', 0, 0, 70.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 10:45:10', '', '', 1),
(3020, '8941149791249', 'harpoon bathroom cleaning powder', 2, 0, 0, 'na', 0, 0, 55.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:03:13', '', '', 1),
(3021, '8941149791294', 'mr.white detergent powder', 2, 0, 0, 'na', 0, 0, 320.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:06:08', '', '', 1),
(3022, '8941149791010', 'eagle mosquito coil', 2, 0, 0, 'na', 0, 0, 55.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:08:07', '', '', 1),
(3023, '7622202398063', 'tang mango ', 1, 0, 0, 'na', 0, 0, 650.00, 780.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:34:49', '', '', 1),
(3024, '7622202398032', 'tang orange', 1, 0, 0, 'na', 0, 0, 650.00, 780.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:35:40', '', '', 1),
(3025, '5711953091308', 'Dano power  1kg', 1, 0, 0, 'na', 0, 0, 851.00, 910.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:54:35', 'Admin', '2025-06-22 14:57:43', 1),
(3026, '5711953043772', 'Dano daily pusti 500g', 1, 0, 0, 'na', 0, 0, 350.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 14:57:23', 'Admin', '2025-06-22 17:22:54', 1),
(3027, '8908008142215', 'Himalaya Men 50ml', 2, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-22 15:18:33', '', '', 1),
(3028, '8901138500184', 'Himalaya Night Cream ', 2, 0, 0, 'na', 0, 0, 480.00, 600.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-22 15:19:23', '', '', 1),
(3029, '8901138816575', 'Himalaya Day Cream', 2, 0, 0, 'na', 0, 0, 440.00, 550.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-22 15:20:02', '', '', 1),
(3030, '8901138714550', 'Himalaya Soap 125g', 2, 0, 0, 'na', 0, 0, 69.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:21:15', '', '', 1),
(3031, '8901138711962', 'Himalaya Soap 75g', 2, 0, 0, 'na', 0, 0, 43.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:21:51', '', '', 1),
(3032, '8908008142734', 'Himalaya Paste 180g', 2, 0, 0, 'na', 0, 0, 72.00, 85.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:22:27', '', '', 1),
(3033, '8908008142628', 'Himalaya Baby Powder 100g', 2, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-22 15:23:03', '', '', 1),
(3034, '8908008142413', 'Himalaya Rose Facewash 100g', 2, 0, 0, 'na', 0, 0, 175.00, 225.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:23:51', '', '', 1),
(3035, '8908008142079', 'Himalaya Alo Vera Facewash 50g', 2, 0, 0, 'na', 0, 0, 110.00, 140.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:24:43', '', '', 1),
(3036, '8901138512583', 'Himalaya Baby Lotion 100g', 2, 0, 0, 'na', 0, 0, 168.00, 220.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:26:42', '', '', 1),
(3037, '8908008142550', 'Himalaya Baby Lotion 200g', 2, 0, 0, 'na', 0, 0, 252.00, 340.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:27:06', '', '', 1),
(3038, '8908008142093', 'Himalaya Oil Clear Facewash 50g', 2, 0, 0, 'na', 0, 0, 110.00, 140.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:27:59', 'Admin', '2025-06-22 15:28:12', 1),
(3039, '8908008142635', 'Himalaya Vitamin C Facewash 50g', 2, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:28:47', '', '', 1),
(3040, '8908008142659', 'Himalaya Vitamin CFacewash 50g', 2, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:29:19', '', '', 1),
(3041, '8908008142017', 'Himalaya Neem Facewash 50g', 2, 0, 0, 'na', 0, 0, 98.00, 130.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:29:50', '', '', 1),
(3042, '8908008142369', 'Himalaya Baby Cream 100G', 2, 0, 0, 'na', 0, 0, 180.00, 225.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:30:18', '', '', 1),
(3043, '8908008142352', 'Himalaya BabyCream 50g', 2, 0, 0, 'na', 0, 0, 112.00, 210.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-22 15:31:43', '', '', 1),
(3044, '8908008142390', 'Himalaya Nurshing Cream 50g', 2, 0, 0, 'na', 0, 0, 135.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-22 15:32:22', '', '', 1),
(3045, '8908008142604', 'Himalaya Head to toe 200g', 2, 0, 0, 'na', 0, 0, 252.00, 305.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-22 15:46:08', '', '', 1),
(3046, '8908008142239', 'Himalaya Men Oil 50g', 2, 0, 0, 'na', 0, 0, 100.00, 125.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 15:50:35', '', '', 1),
(3047, '8908008142253', 'Himalaya Acne Facewash 50g', 2, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-22 15:51:52', '', '', 1),
(3048, '8908008142710', 'Himalaya Baby Shampoo', 2, 0, 0, 'na', 0, 0, 175.00, 210.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-22 16:19:27', '', '', 1),
(3049, '8941161113005', 'Fresh250ml Water', 1, 0, 0, 'na', 0, 0, 6.50, 10.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-22 16:57:57', '', '', 1),
(3050, '5760466984201', 'Dano Power 500G', 1, 0, 0, 'na', 0, 0, 447.00, 480.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 17:21:48', 'Admin', '2025-06-22 17:23:23', 1),
(3051, 'P03051', 'Dano Power 1kg', 1, 0, 0, 'na', 0, 0, 851.00, 910.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 17:24:11', '', '', 1),
(3052, '5711953039423', 'Dano Daily 200g', 1, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 17:25:16', '', '', 1),
(3053, 'P03053', 'Dano Daily 100g', 1, 0, 0, 'na', 0, 0, 82.00, 95.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 17:27:18', '', '', 1),
(3054, 'P03054', 'Dano daily mini', 1, 0, 0, 'na', 0, 0, 8.25, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-22 17:28:20', '', '', 1),
(3055, 'P03055', 'Milk Khamar 1kg', 1, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-22 22:12:15', 'Admin', '2025-07-07 11:11:20', 1),
(3056, 'P03056', 'Pran bubble gum', 1, 0, 0, 'na', 0, 0, 14.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 11:39:59', '', '', 1),
(3057, '8941193000526', 'bashundhara atta', 1, 0, 0, 'na', 0, 0, 87.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 12:08:44', '', '', 1),
(3058, '8800001300138', 'paragon chicken momo 300g', 1, 0, 0, 'na', 0, 0, 238.45, 300.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-23 13:06:03', '', '', 1),
(3059, '8819139711082', 'paragon dal puri 454g', 1, 0, 0, 'na', 0, 0, 116.00, 145.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-23 13:08:40', '', '', 1),
(3060, '6291003191022', 'Alfa mayonnasise 1L.', 1, 0, 0, 'na', 0, 0, 392.00, 550.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 13:57:33', '', '', 1),
(3062, '8007150900015', 'olitalia sunflower oil 1L.', 1, 0, 0, 'na', 0, 0, 385.00, 449.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 16:39:38', '', '', 1),
(3063, '8007150903504', 'olitalia sunflower oil 2L.', 1, 0, 0, 'na', 0, 0, 765.00, 895.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 16:43:25', '', '', 1),
(3064, '8007150900930', 'olitalia sunflower oil 5L.', 1, 0, 0, 'na', 0, 0, 1840.00, 2150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 16:44:30', '', '', 1),
(3065, '4987176073143', 'H&S Shampoo silky black 650 ml', 2, 0, 0, 'na', 0, 0, 1626.09, 1870.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 17:03:11', '', '', 1),
(3066, '4987176254412', 'H&S Shampoo cool menthol 2in 1 650ml', 2, 0, 0, 'na', 0, 0, 1913.04, 2200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-23 17:05:33', '', '', 1),
(3067, '8819139711143', 'paragon chicken spring roll 300g', 1, 0, 0, 'na', 0, 0, 183.35, 230.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-23 18:54:57', '', '', 1),
(3068, '8219139717068', 'paragon chicken spring roll 400g', 1, 0, 0, 'na', 0, 0, 271.00, 320.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-23 19:46:51', '', '', 1),
(3069, 'P03069', 'mango bar 5/=', 1, 0, 0, 'na', 0, 0, 4.33, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 11:20:22', '', '', 1),
(3070, '8941168013162', 'muri toast 20/=', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 11:27:24', '', '', 1),
(3071, '8941168013230', 'Ifad nankhatai 200g', 1, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 11:31:58', '', '', 1),
(3072, '8941193067024', 'basundhara toilet tissue 28/=', 2, 0, 0, 'na', 0, 0, 18.50, 28.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 13:49:42', '', '', 1),
(3073, '8908018845014', 'Tal Misri 1KG', 1, 0, 0, 'na', 0, 0, 280.00, 350.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-24 17:00:00', '', '', 1),
(3074, '8908018845021', 'Tal Misri 500gm', 1, 0, 0, 'na', 0, 0, 160.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-24 17:01:19', '', '', 1),
(3075, '8906022340310', 'Sago 1Kg', 1, 0, 0, 'na', 0, 0, 205.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 17:02:46', '', '', 1),
(3076, '8906022340815', 'Sago 200gm', 1, 0, 0, 'na', 0, 0, 50.00, 70.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 17:03:32', '', '', 1),
(3077, '8908018845045', 'Tal Misri 200g', 1, 0, 0, 'na', 0, 0, 90.00, 120.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-24 17:15:41', '', '', 1),
(3078, '8996001320136', 'Kopiko ', 1, 0, 0, 'na', 0, 0, 175.00, 210.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 17:18:32', '', '', 1),
(3079, '8850169047024', 'Imperial Leather Soap', 2, 0, 0, 'na', 0, 0, 215.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 17:33:23', 'Admin', '2025-07-07 13:30:19', 1),
(3080, '8999999597849', 'Dove FacewASH', 2, 0, 0, 'na', 0, 0, 320.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 17:34:59', '', '', 1),
(3081, '8904109400643', 'Patanjali Gel 150ml', 2, 0, 0, 'na', 0, 0, 240.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 17:37:03', '', '', 1),
(3082, '5011451103863', 'Simple refreshing  Face Wash ', 2, 0, 0, 'na', 0, 0, 546.00, 725.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 17:55:51', 'Admin', '2025-07-09 13:42:09', 1),
(3083, '7622202225550', 'Oreo S', 1, 0, 0, 'na', 0, 0, 26.13, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 18:42:02', '', '', 1),
(3084, '5000159559034', 'Bounty 57g', 1, 0, 0, 'na', 0, 0, 103.00, 120.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 20:08:15', '', '', 1),
(3085, '6003770000670', 'Nandos Extra hot', 1, 0, 0, 'na', 0, 0, 385.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-24 21:41:27', '', '', 1),
(3086, '6003770002414', 'Nandos Lemon & Herb', 1, 0, 0, 'na', 0, 0, 385.00, 450.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-24 21:42:10', '', '', 1),
(3087, '6003770003091', 'Nandos Mild', 1, 0, 0, 'na', 0, 0, 385.00, 450.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-24 21:43:50', '', '', 1),
(3088, '8941196201432', 'Twinkle Big S Pant', 2, 0, 0, 'na', 0, 0, 595.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 22:30:30', 'Admin', '2025-06-24 22:32:32', 1),
(3089, '8941196201470', 'Twinkle Big M Pant', 2, 0, 0, 'na', 0, 0, 595.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 22:32:22', '', '', 1),
(3090, '8941196201517', 'Twinkle Big L Pant', 2, 0, 0, 'na', 0, 0, 595.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 22:33:16', '', '', 1),
(3091, '8941196201555', 'Twinkle Big XL Pant', 2, 0, 0, 'na', 0, 0, 595.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 22:34:18', '', '', 1),
(3092, '8941196201593', 'Twinkle Big XXL Pant', 2, 0, 0, 'na', 0, 0, 595.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-24 22:35:10', '', '', 1),
(3093, '8964000767498', 'treet xl razor', 2, 0, 0, 'na', 0, 0, 26.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 11:56:48', '', '', 1),
(3094, '745760298860', 'Biomil 1 tin 400g', 1, 0, 0, 'na', 0, 0, 750.00, 810.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 12:46:41', '', '', 1),
(3095, '745178953146', 'Biomil 1  350g', 1, 0, 0, 'na', 0, 0, 570.00, 625.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 12:50:59', '', '', 1),
(3096, '745760298853', 'Biomil 2 tin 400g', 1, 0, 0, 'na', 0, 0, 750.00, 810.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 12:51:47', '', '', 1),
(3097, '735745065594', 'Gastro-fix 150g', 1, 0, 0, 'na', 0, 0, 550.00, 570.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 12:53:03', '', '', 1),
(3098, '3086126766171', 'bic metal rezar', 2, 0, 0, 'na', 0, 0, 31.50, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 16:30:51', '', '', 1),
(3099, '4791010007559', 'bic twin lady rezar', 2, 0, 0, 'na', 0, 0, 39.50, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 16:33:05', '', '', 1),
(3100, '8941160237023', 'bic body rezar', 2, 0, 0, 'na', 0, 0, 31.50, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 16:34:53', '', '', 1),
(3101, '4791111106861', 'kumarika oil 300ml', 2, 0, 0, 'na', 0, 0, 270.00, 320.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 16:37:49', 'Admin', '2025-06-25 16:41:51', 1),
(3102, '4791111106885', 'kumarika oil 200ml', 2, 0, 0, 'na', 0, 0, 204.00, 240.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 16:41:11', 'Admin', '2025-06-25 16:44:38', 1),
(3103, '4791111106250', 'eva by kumarika oil 200ml', 2, 0, 0, 'na', 0, 0, 161.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-25 16:44:19', '', '', 1),
(3104, '8941193400135', 'Atta Rooti  lal 20 pcs', 1, 0, 0, 'na', 0, 0, 189.00, 235.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-25 19:36:16', '', '', 1),
(3105, '764460701272', 'Baby Luck 1 tin', 1, 0, 0, 'na', 0, 0, 770.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-26 12:54:19', '', '', 1),
(3106, '764460701289', ' Baby Luck 2 tin', 1, 0, 0, 'na', 0, 0, 770.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-26 12:56:47', 'Admin', '2025-06-26 13:02:59', 1),
(3107, '764460701302', 'Baby Luck 3 tin', 1, 0, 0, 'na', 0, 0, 770.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-26 13:03:52', '', '', 1),
(3108, '764460701326', 'Baby Luck f l tin', 1, 0, 0, 'na', 0, 0, 770.00, 800.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-26 13:05:05', '', '', 1),
(3109, '806360320600', 'Lotus Whiteglow Gel Creme 60g', 2, 0, 0, 'na', 0, 0, 606.00, 765.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-26 15:04:19', '', '', 1),
(3110, '806360781401', 'Lotus Deep Moisturising Creme 40g', 2, 0, 0, 'na', 0, 0, 435.00, 530.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-26 15:05:39', '', '', 1),
(3111, '806360270608', 'Lotus Night Creme 60g', 2, 0, 0, 'na', 0, 0, 656.00, 800.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-26 15:07:35', '', '', 1),
(3112, '806360021217', 'Lotus Night Creme 25g', 2, 0, 0, 'na', 0, 0, 303.00, 370.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-26 15:09:29', '', '', 1),
(3113, '50003120006945', 'Carury Cocoa Packet 125gm Tin', 1, 0, 0, 'na', 0, 0, 330.00, 400.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-26 15:39:54', '', '', 1),
(3114, '8941194003632', 'Chocolate Digestive', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-26 17:51:09', '', '', 1),
(3115, 'P03115', 'Mojjammel minicat Rice 25kg', 1, 0, 0, 'na', 0, 0, 2070.00, 2200.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-26 19:03:53', 'Admin', '2025-06-26 19:05:11', 1),
(3116, 'P03116', 'Quba Najir Rice', 1, 0, 0, 'na', 0, 0, 2170.00, 2280.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-26 19:09:03', '', '', 1),
(3117, '8941102003341', 'Matador I teen 18pc', 2, 0, 0, 'na', 0, 0, 10.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-26 19:24:55', '', '', 1),
(3118, 'P03118', 'Matador Tooth Brush', 2, 0, 0, 'na', 0, 0, 15.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-26 19:26:53', '', '', 1),
(3119, 'P03119', 'Germnil Hand Sanitizer 250ml', 2, 0, 0, 'na', 0, 0, 155.00, 220.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-26 21:30:40', '', '', 1),
(3120, 'P03120', 'Germnil Hand Sanitizer 100ml', 2, 0, 0, 'na', 0, 0, 75.00, 110.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-26 21:31:14', '', '', 1),
(3121, 'P03121', 'Germnil Hand Sanitizer 9ml', 2, 0, 0, 'na', 0, 0, 22.00, 35.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-26 21:32:16', 'Admin', '2025-06-26 21:32:25', 1),
(3122, 'P03122', 'Ratashail Rice', 1, 0, 0, 'na', 0, 0, 130.00, 140.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-06-26 22:47:29', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(3123, '841165107537', 'Pran soy sauce 285ml', 1, 0, 0, 'na', 0, 0, 50.00, 65.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-27 10:55:56', '', '', 1),
(3124, '831730002268', 'Pran Hot tomota sauce 340ml', 1, 0, 0, 'na', 0, 0, 98.00, 125.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-27 10:57:06', '', '', 1),
(3125, '831730002213', 'Pran Ketch 340g', 1, 0, 0, 'na', 0, 0, 98.00, 125.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-27 10:58:21', '', '', 1),
(3126, '8941114001403', 'Banoful Melodies Biscuits Tin', 1, 0, 0, 'na', 0, 0, 250.00, 300.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 12:06:36', '', '', 1),
(3127, 'P03127', 'Banoful Cookies  Zar', 1, 0, 0, 'na', 0, 0, 125.00, 155.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 12:08:23', 'Admin', '2025-07-13 13:11:39', 1),
(3128, '8941159000058', 'Arong Dairy Yoghurt 1 kg', 1, 0, 0, 'na', 0, 0, 185.00, 210.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 12:12:25', '', '', 1),
(3129, '8991115010102', 'Big babol', 1, 0, 0, 'na', 0, 0, 28.50, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-27 20:43:04', '', '', 1),
(3130, '9556823145059', 'Clorox 1L', 2, 0, 0, 'na', 0, 0, 425.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-27 20:45:35', '', '', 1),
(3131, '9556823122258', 'Clorox 500ml', 2, 0, 0, 'na', 0, 0, 225.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-27 20:46:07', '', '', 1),
(3132, '8901138512460', 'Himalaya Neem Facewash(Indian)', 2, 0, 0, 'na', 0, 0, 290.00, 350.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-27 20:47:20', '', '', 1),
(3133, 'P03133', 'Affix Chanachur Big', 1, 0, 0, 'na', 0, 0, 135.00, 180.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:18:46', '', '', 1),
(3134, 'P03134', 'Affix Chanachur Small', 1, 0, 0, 'na', 0, 0, 85.00, 130.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:19:27', '', '', 1),
(3135, 'P03135', 'Affix Chira Vaja ', 1, 0, 0, 'na', 0, 0, 90.00, 130.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:19:51', '', '', 1),
(3136, 'P03136', 'Affix Thai Badam', 1, 0, 0, 'na', 0, 0, 140.00, 200.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:20:13', '', '', 1),
(3137, 'P03137', 'Affix Deshi hat e Badam', 1, 0, 0, 'na', 0, 0, 120.00, 170.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:21:41', '', '', 1),
(3138, 'P03138', 'Affix Deshi Badam', 1, 0, 0, 'na', 0, 0, 90.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:22:02', '', '', 1),
(3139, 'P03139', 'Affix Motor Vaja Big', 1, 0, 0, 'na', 0, 0, 120.00, 180.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:22:30', '', '', 1),
(3140, 'P03140', 'Affix Motor Vaja Small', 1, 0, 0, 'na', 0, 0, 55.00, 80.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:22:46', '', '', 1),
(3141, 'P03141', 'Affix Buter Dal', 1, 0, 0, 'na', 0, 0, 55.00, 80.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:50:24', '', '', 1),
(3142, 'P03142', 'Affix Thai Badam Big', 1, 0, 0, 'na', 0, 0, 290.00, 380.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-27 22:51:05', '', '', 1),
(3143, '8941154033235', 'Lachcha semai premiunm ', 1, 0, 0, 'na', 0, 0, 130.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-28 11:11:54', 'Admin', '2025-06-28 11:23:43', 1),
(3144, '8941154035598', 'Mr.pasta ', 1, 0, 0, 'na', 0, 0, 98.00, 120.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 11:18:22', '', '', 1),
(3145, '8941114008259', 'Kishwan Sugar free cookies', 1, 0, 0, 'na', 0, 0, 135.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-28 11:41:25', '', '', 1),
(3146, '8941114006057', 'kishwan Horlicks cookies', 1, 0, 0, 'na', 0, 0, 55.50, 70.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 11:47:23', '', '', 1),
(3147, '8941101010616', 'Aarong butter 200g', 1, 0, 0, 'na', 0, 0, 245.00, 270.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 12:32:29', '', '', 1),
(3148, '8941114006095', 'KISHWAN OVALTINE BISCUIT', 1, 0, 0, 'na', 0, 0, 55.00, 70.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 12:42:27', '', '', 1),
(3149, '8941114005883', 'KISHWAN RIO', 1, 0, 0, 'na', 0, 0, 75.00, 90.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 12:55:09', '', '', 1),
(3150, '8941174012210', 'PARACHUTE SECRETS ONION 200G', 2, 0, 0, 'na', 0, 0, 179.00, 215.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 13:23:15', '', '', 1),
(3151, '8941174010988', 'PARACHUTE BELIFUL 400 ML', 2, 0, 0, 'na', 0, 0, 333.00, 410.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 13:26:53', '', '', 1),
(3152, '8941100510179', 'Raduni Doniya Gura 50g', 1, 0, 0, 'na', 0, 0, 0.00, 32.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 15:39:18', '', '', 1),
(3153, 'P03153', 'Key Chain Ring', 2, 0, 0, 'na', 0, 0, 40.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 21:35:45', '', '', 1),
(3154, '8901030824968', 'Dove Soap 125gm', 2, 0, 0, 'na', 0, 0, 190.00, 250.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 21:37:21', '', '', 1),
(3155, '856097008579', 'Pears Soap With Plant Oils', 2, 0, 0, 'na', 0, 0, 205.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 21:40:59', '', '', 1),
(3156, '856097008586', 'Pears Soap With Lemon Flower', 2, 0, 0, 'na', 0, 0, 205.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-28 21:41:33', '', '', 1),
(3157, '4005808304721', 'Nivea Brightening 50ml', 2, 0, 0, 'na', 0, 0, 190.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-28 21:45:53', '', '', 1),
(3158, '8901248257374', '7 oil in one(indian)', 2, 0, 0, 'na', 0, 0, 310.00, 395.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-06-28 21:48:18', '', '', 1),
(3159, '4902580163822', 'Maxell Alkaline AA', 2, 0, 0, 'na', 0, 0, 110.00, 155.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 21:58:30', '', '', 1),
(3160, '4902580164416', 'Maxell Alkaline AAA', 2, 0, 0, 'na', 0, 0, 110.00, 155.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 21:58:57', '', '', 1),
(3161, '6975555410502', 'Cobqb ToothBrush', 2, 0, 0, 'na', 0, 0, 55.00, 135.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 22:00:28', '', '', 1),
(3162, 'P03162', 'Majoni Thai Speed', 2, 0, 0, 'na', 0, 0, 20.00, 52.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-06-28 22:03:37', 'Admin', '2025-06-28 22:10:55', 1),
(3163, '8941193104026', 'SMC Orsaline', 1, 0, 0, 'na', 0, 0, 5.04, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-29 11:03:26', '', '', 1),
(3164, '8941193105214', 'SMC Taste Me', 1, 0, 0, 'na', 0, 0, 9.45, 12.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-29 11:05:16', '', '', 1),
(3165, '8889779180661', 'Caramet popcorn', 1, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-30 20:52:03', '', '', 1),
(3166, '8889779180685', 'rainbow  popcorn', 1, 0, 0, 'na', 0, 0, 150.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-30 20:53:53', '', '', 1),
(3167, '8889779180678', 'Bar-b-q popcorn', 1, 0, 0, 'na', 0, 0, 167.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-30 20:59:05', 'Admin', '2025-06-30 21:02:48', 1),
(3168, '8889779150428', 'kazi chocolate muffin cake', 1, 0, 0, 'na', 0, 0, 8.83, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-06-30 21:04:32', 'Admin', '2025-07-04 19:54:06', 1),
(3169, '8819937919215', 'paragon shami kabab 400g', 1, 0, 0, 'na', 0, 0, 296.00, 350.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-06-30 21:30:24', '', '', 1),
(3170, '745125275291', 'Eno orange ', 2, 0, 0, 'na', 0, 0, 11.67, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-01 12:10:55', '', '', 1),
(3171, '745125275277', 'Eno Lemon', 1, 0, 0, 'na', 0, 0, 11.67, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-01 12:11:55', '', '', 1),
(3172, '8941101010609', 'Aarong Butter 100g', 1, 0, 0, 'na', 0, 0, 133.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-01 16:18:53', '', '', 1),
(3173, '8941102467907', 'Lifebuoy  200g', 2, 0, 0, 'na', 0, 0, 101.00, 115.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-01 19:08:42', '', '', 1),
(3174, '745114134004', 'olympic cream plus biscuits ', 1, 0, 0, 'na', 0, 0, 95.00, 120.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 09:59:50', '', '', 1),
(3175, '8889779110040', 'Kazi orginal chicken nuggets 250g', 1, 0, 0, 'na', 0, 0, 174.00, 200.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:09:49', '', '', 1),
(3176, '8889779110057', 'Kazi spicy  chicken nuggets 250g', 1, 0, 0, 'na', 0, 0, 174.00, 200.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:12:22', '', '', 1),
(3177, '8889779110064', 'Kazi  chicken strips 250g', 1, 0, 0, 'na', 0, 0, 227.00, 260.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:16:00', '', '', 1),
(3178, '8889779110088', 'Kazi  chicken meatball 250g', 1, 0, 0, 'na', 0, 0, 170.00, 195.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:18:05', '', '', 1),
(3179, '8889779720249', 'Kazi chicken spicy meatball 250g', 1, 0, 0, 'na', 0, 0, 170.00, 195.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:19:27', '', '', 1),
(3180, '8889779310112', 'Kazi aloo puri', 1, 0, 0, 'na', 0, 0, 119.00, 140.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:25:50', '', '', 1),
(3181, '8889779310143', 'kazi dal puri', 1, 0, 0, 'na', 0, 0, 127.00, 145.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:28:27', '', '', 1),
(3182, '8889779310129', 'Kazi chicken samosa', 1, 0, 0, 'na', 0, 0, 187.00, 215.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:30:55', '', '', 1),
(3183, '8889779310136', 'kazi chicken spring roll 250g', 1, 0, 0, 'na', 0, 0, 187.00, 215.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-02 13:35:49', '', '', 1),
(3184, '8889779310181', 'kazi plain paratha 20 p', 1, 0, 0, 'na', 0, 0, 273.00, 320.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:47:31', '', '', 1),
(3185, '8889779510437', 'azi plain paratha 10 p', 1, 0, 0, 'na', 0, 0, 146.00, 170.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:49:11', '', '', 1),
(3186, '8889779510390', 'kazi chicken shami kabab 200g', 1, 0, 0, 'na', 0, 0, 200.00, 230.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:51:58', '', '', 1),
(3187, '8889779210221', 'kazi chicken sausages ', 1, 0, 0, 'na', 0, 0, 226.00, 260.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:55:33', '', '', 1),
(3188, '8889779210238', 'kazi chicken spicy sausages', 1, 0, 0, 'na', 0, 0, 226.00, 260.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 13:58:18', '', '', 1),
(3189, '8889779510420', 'kazi french fries 500g', 1, 0, 0, 'na', 0, 0, 136.00, 160.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 14:00:35', '', '', 1),
(3190, '8898779511290', 'kazi low fat paratha 10p', 1, 0, 0, 'na', 0, 0, 114.00, 135.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 14:02:14', '', '', 1),
(3191, '841165145355', 'Drinko 250ml', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-02 14:15:37', '', '', 1),
(3192, '831730005665', 'PRAN PUFFED RICE 500G', 1, 0, 0, 'na', 0, 0, 61.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 14:33:19', '', '', 1),
(3193, '831730005672', 'PRAN PUFFED RICE 250G', 1, 0, 0, 'na', 0, 0, 33.00, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 14:34:22', '', '', 1),
(3194, '8941153056693', 'fONDALO CHOCOLATE 10/=', 1, 0, 0, 'na', 0, 0, 8.16, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 14:58:49', '', '', 1),
(3195, '8951713016470', 'PROME BELA TPOAST', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 15:29:37', '', '', 1),
(3196, '8951713016524', 'PROME BABY TOAST', 1, 0, 0, 'na', 0, 0, 48.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 15:30:36', '', '', 1),
(3197, '8941131080016', 'PROME FAMILY TOAST', 1, 0, 0, 'na', 0, 0, 44.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 15:31:18', '', '', 1),
(3198, '8941117000861', 'PROME BUTTER TOAST', 1, 0, 0, 'na', 0, 0, 44.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 15:31:44', '', '', 1),
(3199, '8941713011179', 'Prome Hot Chanachur', 1, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 15:33:23', '', '', 1),
(3200, '8941131080764', 'Prome Hot Chanachur 125g', 1, 0, 0, 'na', 0, 0, 36.00, 45.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 15:34:29', '', '', 1),
(3201, '8951713013806', 'Prome Dry Cake 150g', 1, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 15:35:53', '', '', 1),
(3202, '8951713014780', 'Prome Dry Cake 300g', 1, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 15:36:24', '', '', 1),
(3203, '8941713013296', 'Prome Instant Tea', 1, 0, 0, 'na', 0, 0, 240.00, 300.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 15:37:26', '', '', 1),
(3204, '8951713016258', 'Prome Mustard Oil 1l', 1, 0, 0, 'na', 0, 0, 264.00, 330.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-02 15:38:08', '', '', 1),
(3205, '8951713015688', 'Prome Mustard Oil 500ml', 1, 0, 0, 'na', 0, 0, 136.00, 170.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-02 15:38:42', '', '', 1),
(3206, '8951713015671', 'Prome Mustard Oil 250ml', 1, 0, 0, 'na', 0, 0, 72.00, 90.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-02 15:39:31', '', '', 1),
(3207, '8901248268530', 'HE POCKET PERFUME PASSION', 2, 0, 0, 'na', 0, 0, 101.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 18:59:35', 'Admin', '2025-07-02 19:02:20', 1),
(3208, '8901248268547', 'HE POCKET PERFUME POWER', 2, 0, 0, 'na', 0, 0, 101.00, 130.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 19:02:01', '', '', 1),
(3209, '8941189300111', 'Igloo Choclate Cup', 1, 0, 0, 'na', 0, 0, 25.55, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 19:53:36', '', '', 1),
(3210, '8941189300371', 'Igloo Mango Icecream 1l', 1, 0, 0, 'na', 0, 0, 260.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 20:00:54', '', '', 1),
(3211, '8941189300289', 'Igloo Strawberry 500ml', 1, 0, 0, 'na', 0, 0, 135.00, 160.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-02 20:02:18', '', '', 1),
(3212, 'P03212', 'lal chira 500g ', 1, 0, 0, 'na', 0, 0, 35.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 21:37:35', '', '', 1),
(3213, 'P03213', 'katbadam 50g', 1, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 21:56:38', '', '', 1),
(3214, 'P03214', 'katbadam 100g', 1, 0, 0, 'na', 0, 0, 120.00, 150.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 21:57:18', '', '', 1),
(3215, 'P03215', 'katbadam 200g', 1, 0, 0, 'na', 0, 0, 240.00, 300.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 21:58:42', '', '', 1),
(3216, 'P03216', 'chia seed 250ml', 1, 0, 0, 'na', 0, 0, 90.00, 150.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 22:16:54', '', '', 1),
(3217, 'P03217', 'chia seed 500ml', 1, 0, 0, 'na', 0, 0, 180.00, 300.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 22:17:40', '', '', 1),
(3218, 'P03218', 'Kichmich 100gm', 1, 0, 0, 'na', 0, 0, 58.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 22:20:23', '', '', 1),
(3219, 'P03219', 'Kichmich 50gm', 1, 0, 0, 'na', 0, 0, 29.00, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-02 22:20:41', '', '', 1),
(3220, 'P03220', 'Jira 25g', 1, 0, 0, 'na', 0, 0, 18.50, 25.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-03 11:57:11', '', '', 1),
(3221, 'P03221', 'jira 50g', 1, 0, 0, 'na', 0, 0, 37.50, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-03 11:57:48', '', '', 1),
(3222, 'P03222', 'jira 100g', 1, 0, 0, 'na', 0, 0, 75.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-03 11:58:19', '', '', 1),
(3223, '814216441126', 'teer lal atta 2kg', 1, 0, 0, 'na', 0, 0, 126.00, 140.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-03 13:14:04', '', '', 1),
(3225, 'P03225', 'Rose Buldak ramen', 1, 0, 0, 'na', 0, 0, 136.00, 180.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-03 21:57:12', '', '', 1),
(3226, 'P03226', 'matador pencils ', 2, 0, 0, 'na', 0, 0, 6.66, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-03 22:45:03', 'Admin', '2025-07-03 22:49:15', 1),
(3227, 'P03227', 'fresh pencils', 2, 0, 0, 'na', 0, 0, 6.66, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-03 22:46:53', 'Admin', '2025-07-03 22:48:53', 1),
(3228, 'P03228', 'petra pencils', 2, 0, 0, 'na', 0, 0, 6.66, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-03 22:47:47', 'Admin', '2025-07-03 22:49:03', 1),
(3229, 'P03229', 'fevicol mini', 2, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-03 23:06:13', '', '', 1),
(3230, 'P03230', 'osaka tape 5/=', 2, 0, 0, 'na', 0, 0, 2.50, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 11:05:35', 'Admin', '2025-07-04 11:05:55', 1),
(3231, 'P03231', 'osaka tape 10/=', 2, 0, 0, 'na', 0, 0, 5.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 11:08:03', '', '', 1),
(3232, 'P03232', 'Stapler mini', 2, 0, 0, 'na', 0, 0, 31.66, 45.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-04 11:14:16', '', '', 1),
(3233, '6923989302030', 'mondete stapler ', 2, 0, 0, 'na', 0, 0, 40.00, 60.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-04 11:24:06', '', '', 1),
(3234, 'P03234', 'Stapler mini pin', 2, 0, 0, 'na', 0, 0, 10.00, 15.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-04 11:27:29', '', '', 1),
(3235, 'P03235', 'Stapler big pin', 2, 0, 0, 'na', 0, 0, 18.00, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 11:31:36', '', '', 1),
(3236, 'P03236', 'matador  big rabar', 2, 0, 0, 'na', 0, 0, 7.50, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 11:42:55', '', '', 1),
(3237, 'P03237', 'matador mini rabar	', 2, 0, 0, 'na', 0, 0, 4.00, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 11:44:38', '', '', 1),
(3238, 'P03238', 'matador stapler ', 2, 0, 0, 'na', 0, 0, 100.00, 130.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-04 11:49:16', '', '', 1),
(3239, 'P03239', 'matador hi school 6/=', 2, 0, 0, 'na', 0, 0, 5.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 12:01:07', '', '', 1),
(3240, 'P03240', 'matador woodmark', 2, 0, 0, 'na', 0, 0, 8.33, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-04 12:04:18', '', '', 1),
(3241, '8941700577060', 'Raduni Kabab Masala 50g', 1, 0, 0, 'na', 0, 0, 0.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-04 18:40:46', '', '', 1),
(3242, '8889779150015', 'kazi chocolate muffin cake 10/=', 1, 0, 0, 'na', 0, 0, 8.33, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-04 19:59:19', '', '', 1),
(3243, '841165138418', 'Pran hot tomato sauce 750 g', 2, 0, 0, 'na', 0, 0, 160.00, 215.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-05 11:07:47', '', '', 1),
(3244, '8901058871869', 'nescafe classic  200g ', 1, 0, 0, 'na', 0, 0, 725.00, 850.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 10:14:20', '', '', 1),
(3245, '8941100501689', 'kool  premium Shaving Cream 100', 2, 0, 0, 'na', 0, 0, 73.00, 90.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-06 10:51:21', '', '', 1),
(3246, '8941193070734', 'Bashundhra diapant big L', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 11:28:05', '', '', 1),
(3247, '8941193070819', 'Bashundhra diapant big S', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 11:29:05', '', '', 1),
(3248, '8941193070820', 'Bashundhra diapant big M', 2, 0, 0, 'na', 0, 0, 590.00, 650.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 11:31:08', '', '', 1),
(3249, 'P03249', 'Bashundhra diapant  smoll all siz', 2, 0, 0, 'na', 0, 0, 83.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 11:32:59', '', '', 1),
(3250, '8941101010272', 'Aarong chocolate milk juce', 1, 0, 0, 'na', 0, 0, 30.00, 35.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 12:49:40', 'Admin', '2025-07-06 12:49:57', 1),
(3251, '745114131836', 'Ghee Bite Biscuit 165g', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 15:43:43', '', '', 1),
(3252, '745114131829', 'Ghee Bite Biscuit 34g', 1, 0, 0, 'na', 0, 0, 8.66, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 15:44:25', '', '', 1),
(3253, '8941100310465', 'Aquafina 1l', 1, 0, 0, 'na', 0, 0, 21.00, 30.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 17:40:45', '', '', 1),
(3254, '8941100314401', 'Mirinda 200ml', 1, 0, 0, 'na', 0, 0, 22.50, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 17:41:29', '', '', 1),
(3255, '8941100318430', '7up 500ml', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 17:45:19', '', '', 1),
(3256, '8941100318409', '7up 200ml', 1, 0, 0, 'na', 0, 0, 18.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 17:46:00', '', '', 1),
(3257, '8941100311400', 'Pepsi ', 1, 0, 0, 'na', 0, 0, 22.50, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 17:46:42', '', '', 1),
(3258, '8941100312407', 'Pepsi diet coke 200ml', 1, 0, 0, 'na', 0, 0, 22.50, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 17:59:47', '', '', 1),
(3259, '8941161110042', 'Fresh Mejanda 250ml', 1, 0, 0, 'na', 0, 0, 0.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 18:12:03', 'Admin', '2025-07-06 18:13:14', 1),
(3260, '8941161110165', 'Fresh Mohito 250ml', 1, 0, 0, 'na', 0, 0, 0.00, 25.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 18:13:03', '', '', 1),
(3261, '8941153056686', 'Fondalo Chocolate bar 10g', 2, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-06 18:40:49', '', '', 1),
(3262, '8941175080027', 'Lion Japan 400ml', 2, 0, 0, 'na', 0, 0, 9.50, 10.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-06 19:49:56', '', '', 1),
(3263, 'P03263', 'Milk Khamar 1/2 kg', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-07-07 11:12:27', '', '', 1),
(3264, '841841165150410', 'Layer plus box', 1, 0, 0, 'na', 0, 0, 105.00, 130.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-07 11:18:51', '', '', 1),
(3265, '013256830406', 'bangas Choci Cream', 1, 0, 0, 'na', 0, 0, 21.00, 25.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-07 11:23:35', 'Admin', '2025-07-15 15:23:39', 1),
(3266, '8906038710060', 'Nutrilife Osrange 1Litre', 1, 0, 0, 'na', 0, 0, 240.00, 295.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-07-07 12:04:00', '', '', 1),
(3267, '745760162925', 'Trio oats bar 400g', 1, 0, 0, 'na', 0, 0, 450.00, 550.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-07 12:09:47', '', '', 1),
(3268, '745760162932', 'Trio oats bar 200 g', 1, 0, 0, 'na', 0, 0, 235.00, 295.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-07 12:10:53', '', '', 1),
(3269, '8850535010812', 'atm odonil ross', 2, 0, 0, 'na', 0, 0, 105.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-07 13:54:02', 'Admin', '2025-07-07 13:55:12', 1),
(3270, '8850535030810', 'atm odonil jasmin ', 2, 0, 0, 'na', 0, 0, 105.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-07 13:56:09', '', '', 1),
(3271, '8850535040819', 'atm odonil orchib', 2, 0, 0, 'na', 0, 0, 105.00, 160.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-07 13:57:15', '', '', 1),
(3272, '8941152000017', 'Danish Condensed milk 397g', 1, 0, 0, 'na', 0, 0, 95.00, 105.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-07 15:47:52', '', '', 1),
(3273, '8169003008962', 'Aci Gold Red Sugar 1kg', 1, 0, 0, 'na', 0, 0, 126.00, 140.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-07 15:48:51', '', '', 1),
(3274, '89061897704255', 'Lux broght glow 150g', 2, 0, 0, 'na', 0, 0, 80.20, 90.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-07 18:36:21', '', '', 1),
(3275, '8941189700652', 'polar vanila 1/2 L.', 1, 0, 0, 'na', 0, 0, 127.00, 150.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-07-08 11:23:13', '', '', 1),
(3276, '8941189700294', 'polar cap', 1, 0, 0, 'na', 0, 0, 25.00, 30.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-08 11:25:23', '', '', 1),
(3277, '8941189700515', 'polar robusto ', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-08 11:27:08', '', '', 1),
(3278, '8941189700096', 'polar choco bar', 1, 0, 0, 'na', 0, 0, 29.58, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-08 11:28:52', 'Admin', '2025-07-12 12:58:53', 1),
(3279, '8901023025082', 'Aer sea breeze bathroom fragrance', 2, 0, 0, 'na', 0, 0, 58.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 12:51:20', '', '', 1),
(3280, '8901023025068', 'Aer berry rush bathroom fragrance', 2, 0, 0, 'na', 0, 0, 58.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 12:52:55', '', '', 1),
(3281, '8901157025071', 'Lal Hit 200ml', 2, 0, 0, 'na', 0, 0, 175.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-08 13:19:55', 'Admin', '2025-07-08 13:27:07', 1),
(3282, '8901157025194', 'Lal Hit 625 ml', 2, 0, 0, 'na', 0, 0, 450.00, 500.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-08 13:26:47', '', '', 1),
(3283, '8898779511283', 'kazi low fat paratha 20p', 1, 0, 0, 'na', 0, 0, 220.00, 260.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 13:50:21', '', '', 1),
(3284, '710535720280', 'Cereal Rice,milk 400g', 1, 0, 0, 'na', 0, 0, 590.00, 620.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-08 15:37:28', '', '', 1),
(3285, '745314397896', 'Lacto Fix 250g', 1, 0, 0, 'na', 0, 0, 960.00, 1000.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-08 15:38:15', '', '', 1),
(3286, '710535720242', 'Cereal 4 Fruits 400g', 1, 0, 0, 'na', 0, 0, 670.00, 730.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-08 15:38:56', '', '', 1),
(3287, '710535720266', 'Cereal rice-potato 400g', 1, 0, 0, 'na', 0, 0, 655.00, 710.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-08 15:39:32', '', '', 1),
(3288, '831730008000', 'Pran Milk Full Cream Liquid  1l', 1, 0, 0, 'na', 0, 0, 112.00, 130.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 15:41:05', '', '', 1),
(3289, '840205715473', 'Pran Kulpi Milk Drink 200mi', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 15:43:45', '', '', 1),
(3290, '841165122462', 'Pran Badam Milk Drink 200mi', 1, 0, 0, 'na', 0, 0, 26.00, 30.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 15:44:52', '', '', 1),
(3291, '841165118861', 'Milkman Lacchi 200ml', 1, 0, 0, 'na', 0, 0, 16.00, 20.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-08 15:47:36', '', '', 1),
(3292, '784196632770', 'Nature Beauty papaya Facewash 100ml', 2, 0, 0, 'na', 0, 0, 189.00, 295.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 17:35:14', '', '', 1),
(3293, '8941100512654', 'Raduni Mustard Oil 500ml', 1, 0, 0, 'na', 0, 0, 157.50, 175.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-08 20:43:42', '', '', 1),
(3294, 'P03294', 'No\'or Muug dal 500g', 1, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-08 22:40:26', '', '', 1),
(3295, '840205711666', 'fruit fun', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 10:40:01', 'Admin', '2025-07-09 10:52:41', 1),
(3296, '8941159001260', 'milk vita curd 500g', 1, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-07-09 10:58:44', '', '', 1),
(3297, '8941159001048', 'milk vita milk 1liter', 1, 0, 0, 'na', 0, 0, 91.00, 100.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-07-09 11:02:02', '', '', 1),
(3298, '8941159001055', 'milk vita 500 ml', 1, 0, 0, 'na', 0, 0, 45.00, 50.00, 0.00, 0.00, '', 'false', 4, NULL, '', 'a', 'Admin', '2025-07-09 11:02:58', '', '', 1),
(3299, '8941189039981', 'Gohnson baby set', 2, 0, 0, 'na', 0, 0, 736.00, 920.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-09 13:11:39', '', '', 1),
(3300, '8901030842993', 'Axe body deodorant dark ', 2, 0, 0, 'na', 0, 0, 131.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 13:22:11', '', '', 1),
(3301, '8901030873409', 'Axe body deodorant intense', 2, 0, 0, 'na', 0, 0, 131.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 13:23:48', '', '', 1),
(3302, '7791293048864', 'Axe body spray apollo', 2, 0, 0, 'na', 0, 0, 300.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:26:28', '', '', 1),
(3303, '7791293048888', 'Axe body spray black', 2, 0, 0, 'na', 0, 0, 300.00, 400.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:27:20', '', '', 1),
(3304, '8901030834660', 'Axe perfume dark temptaton', 2, 0, 0, 'na', 0, 0, 435.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:30:53', '', '', 1),
(3305, '8901030834639', 'Axe perfume champion', 2, 0, 0, 'na', 0, 0, 435.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:31:50', '', '', 1),
(3306, '8901030834592', 'Axe perfume intense', 2, 0, 0, 'na', 0, 0, 435.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:32:47', '', '', 1),
(3307, '8901030860225', 'Vaseline Hair tonic 200ml.', 2, 0, 0, 'na', 0, 0, 435.00, 550.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:37:01', '', '', 1),
(3308, '8901030025280', 'Vaseline Hair tonic 100ml.', 2, 0, 0, 'na', 0, 0, 225.00, 280.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:37:52', '', '', 1),
(3309, '50064861', 'Vaseline lip therapy pink', 2, 0, 0, 'na', 0, 0, 171.00, 230.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 13:40:04', '', '', 1),
(3310, '5011451103870', 'Simple moisturising Face Wash	', 2, 0, 0, 'na', 0, 0, 546.00, 725.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 13:43:41', '', '', 1),
(3311, '8710447474419', 'Simple purifying  Face Wash gel	', 2, 0, 0, 'na', 0, 0, 546.00, 725.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 13:45:22', '', '', 1),
(3313, '8710908710773', 'simple micellar Face Wash gel', 2, 0, 0, 'na', 0, 0, 546.00, 725.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 13:53:33', '', '', 1),
(3314, '8901571013876', 'Sensodyne daily protection', 2, 0, 0, 'na', 0, 0, 53.33, 60.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-09 15:28:22', '', '', 1),
(3315, '872031171239', 'Savoy Ekdom AAm ', 1, 0, 0, 'na', 0, 0, 42.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-09 15:36:17', '', '', 1),
(3316, '8720810120201', 'Savoy i-kone', 1, 0, 0, 'na', 0, 0, 0.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-09 15:38:27', '', '', 1),
(3317, '8941100515167', 'Chopstick Instant Noodles yummy Musala 248g', 1, 0, 0, 'na', 0, 0, 83.00, 95.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-09 15:44:18', '', '', 1),
(3318, '8941100512234', 'Chopstick Instant Noodles Deshi Musala 248g', 1, 0, 0, 'na', 0, 0, 73.00, 85.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-09 15:45:36', '', '', 1),
(3319, '8941100512272', 'Chopstick Instant Noodles Musala Delight 248g', 2, 0, 0, 'na', 0, 0, 73.00, 85.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 15:46:50', '', '', 1),
(3320, '6951417200955', 'Europe Grape Flavor', 1, 0, 0, 'na', 0, 0, 12.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:27:31', '', '', 1),
(3321, '6951417200788', 'Europe Strawberry Flavor', 1, 0, 0, 'na', 0, 0, 12.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:28:39', '', '', 1),
(3322, '6951417200894', 'Europe Orange Flavor', 1, 0, 0, 'na', 0, 0, 12.00, 20.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:30:05', '', '', 1),
(3323, '88821191', 'Enchanter Charming 125g', 2, 0, 0, 'na', 0, 0, 280.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:32:08', '', '', 1),
(3324, '88821184', 'Enchanter Romantic 125g', 2, 0, 0, 'na', 0, 0, 280.00, 375.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:32:44', '', '', 1),
(3325, '8888202026422', 'Enchanter Alluring 250g', 2, 0, 0, 'na', 0, 0, 490.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:34:16', '', '', 1),
(3326, '8888202005069', 'Enchanter Romantic 250g', 2, 0, 0, 'na', 0, 0, 490.00, 700.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:34:45', '', '', 1),
(3327, '8908001158077', 'Whitetone Face Powder', 2, 0, 0, 'na', 0, 0, 106.00, 150.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:35:57', '', '', 1),
(3328, '6291104359956', 'Ahsan Arais 180g', 2, 0, 0, 'na', 0, 0, 300.00, 440.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:36:47', '', '', 1),
(3329, '6291104359949', 'Ahsan Malak 180g', 2, 0, 0, 'na', 0, 0, 300.00, 440.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:37:23', '', '', 1),
(3330, '8720182263131', 'Dove Sensitive Skin 90g', 2, 0, 0, 'na', 0, 0, 155.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:38:41', '', '', 1),
(3331, '8904006302507', 'Wild Stone Code Steel 97g', 2, 0, 0, 'na', 0, 0, 375.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:39:50', '', '', 1),
(3332, '8904006306208', 'Wild Stone Code Titanium 97g', 2, 0, 0, 'na', 0, 0, 375.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:40:39', '', '', 1),
(3333, '8904006307700', 'Wild Stone Code Iridium 97g', 2, 0, 0, 'na', 0, 0, 375.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:41:10', '', '', 1),
(3334, '8904006306215', 'Wild Stone Code Gold 97g', 2, 0, 0, 'na', 0, 0, 375.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:41:43', 'Admin', '2025-07-09 16:42:24', 1),
(3335, '8904006302514', 'Wild Stone Code Copper 97g', 2, 0, 0, 'na', 0, 0, 375.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:42:17', '', '', 1),
(3336, '3700082500135', 'Maequis  Body Spray', 2, 0, 0, 'na', 0, 0, 378.00, 495.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:43:16', '', '', 1),
(3337, '8710447224342', 'Tresemme Keratin Smooth 400ml', 2, 0, 0, 'na', 0, 0, 730.00, 940.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 16:44:49', '', '', 1),
(3338, '8851932291323', 'Dove Ulta care 330ml', 2, 0, 0, 'na', 0, 0, 730.00, 940.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-09 16:47:39', '', '', 1),
(3339, '8801073211667', 'Samayang Buldak carvonara cup', 2, 0, 0, 'na', 0, 0, 168.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:50:34', 'Admin', '2025-07-09 16:51:35', 1),
(3340, '8801073212671', 'Samayang Buldak 2x cup', 2, 0, 0, 'na', 0, 0, 168.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:51:25', '', '', 1),
(3341, '8801073212664', 'Samayang Buldak 2x hochi cup	', 2, 0, 0, 'na', 0, 0, 168.00, 200.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:52:16', '', '', 1),
(3342, '6281007032759', 'Almarai 8 Triangles', 2, 0, 0, 'na', 0, 0, 225.00, 300.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:54:36', '', '', 1),
(3343, '9310264911266', 'Beqa Gourmet Slices', 2, 0, 0, 'na', 0, 0, 365.00, 400.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 16:58:58', '', '', 1),
(3344, '8693342006759', 'Chicks 10 Franks', 2, 0, 0, 'na', 0, 0, 180.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:00:13', '', '', 1),
(3345, '42204091', 'Nivea Soft Creamm', 2, 0, 0, 'na', 0, 0, 345.00, 450.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-09 17:14:57', '', '', 1),
(3346, 'P03346', 'Mozzarella Cheese', 1, 0, 0, 'na', 0, 0, 180.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-09 17:40:52', '', '', 1),
(3347, 'P03347', 'Fresh Class room Pen 5-', 2, 0, 0, 'na', 0, 0, 3.75, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:54:22', '', '', 1),
(3348, 'P03348', 'Fresh Campus Pen 5-', 2, 0, 0, 'na', 0, 0, 3.92, 5.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:55:08', '', '', 1),
(3349, 'P03349', 'Fresh Emoji pen 10-', 2, 0, 0, 'na', 0, 0, 7.09, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:56:36', 'Admin', '2025-07-09 17:58:11', 1),
(3350, 'P03350', 'Fresh Icon pen 10-', 2, 0, 0, 'na', 0, 0, 7.09, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:57:09', 'Admin', '2025-07-09 17:58:07', 1),
(3351, 'P03351', 'Fresh Icon sig pen 10-', 2, 0, 0, 'na', 0, 0, 7.09, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:57:42', 'Admin', '2025-07-09 17:58:01', 1),
(3352, 'P03352', 'Fresh Pencil Box Small', 2, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 17:59:41', '', '', 1),
(3353, 'P03353', 'Fresh Pencil box Big', 2, 0, 0, 'na', 0, 0, 50.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:00:33', '', '', 1),
(3354, '8941161008813', 'Fresh Captain HB pencil', 2, 0, 0, 'na', 0, 0, 5.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:01:58', '', '', 1),
(3355, '8941161008844', 'Fresh Campus 4B pencil', 2, 0, 0, 'na', 0, 0, 7.50, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:02:54', '', '', 1),
(3356, 'P03356', 'Fresh Campus Perfume Eraser', 2, 0, 0, 'na', 0, 0, 6.67, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:05:11', '', '', 1),
(3357, '8941161012018', 'Fresh Bangla book', 2, 0, 0, 'na', 0, 0, 25.00, 32.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:08:45', '', '', 1),
(3358, '8941161011042', 'Fresh Math', 2, 0, 0, 'na', 0, 0, 26.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:10:23', '', '', 1),
(3359, '8941161011011', 'Fresh Bangla', 2, 0, 0, 'na', 0, 0, 26.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:10:58', '', '', 1),
(3360, '8941161011028', 'Fresh English', 2, 0, 0, 'na', 0, 0, 26.00, 35.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:11:19', '', '', 1),
(3361, '8941161010021', 'Fresh  English', 2, 0, 0, 'na', 0, 0, 41.67, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-09 18:14:35', '', '', 1),
(3362, '8941102000449', 'Matador supwr flex brush', 2, 0, 0, 'na', 0, 0, 16.66, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-10 10:43:52', '', '', 1),
(3363, 'P03363', 'Kingshuk brush', 2, 0, 0, 'na', 0, 0, 26.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-10 11:04:57', '', '', 1),
(3364, '806360291009', 'lotus whiteglow face  wash 120g', 2, 0, 0, 'na', 0, 0, 484.00, 590.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-10 11:34:46', '', '', 1),
(3365, '8941160031584', 'Doodles tom yum ', 1, 0, 0, 'na', 0, 0, 210.00, 250.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-10 13:25:58', '', '', 1),
(3366, 'P03366', 'sadha tile 100g', 1, 0, 0, 'na', 0, 0, 24.00, 30.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-07-10 14:15:15', '', '', 1),
(3367, '8941133000593', 'KK green tea ', 1, 0, 0, 'na', 0, 0, 185.00, 215.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-10 16:59:29', '', '', 1),
(3368, 'P03368', 'Bit Labon 100g', 1, 0, 0, 'na', 0, 0, 4.50, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-10 17:03:45', '', '', 1),
(3369, 'P03369', 'Bit labon 250g', 1, 0, 0, 'na', 0, 0, 11.25, 25.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-10 17:05:17', '', '', 1),
(3370, 'P03370', 'chia seed 1kg	', 1, 0, 0, 'na', 0, 0, 300.00, 550.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-10 17:11:49', '', '', 1),
(3371, 'P03371', 'paragon  mini samosa 1000g', 1, 0, 0, 'na', 0, 0, 600.00, 680.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-10 18:12:04', '', '', 1),
(3373, '6281007038614', 'Almarai milk 900g tin', 1, 0, 0, 'na', 0, 0, 1700.00, 2000.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-10 23:15:35', 'Admin', '2025-07-10 23:19:11', 1),
(3374, 'P03374', 'matador  hi school gel pen', 2, 0, 0, 'na', 0, 0, 4.50, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 10:58:46', '', '', 1),
(3375, 'P03375', 'matador hi school ball pen', 2, 0, 0, 'na', 0, 0, 4.50, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 10:59:38', '', '', 1),
(3376, 'P03376', 'Matador All time Black pen', 2, 0, 0, 'na', 0, 0, 0.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:19:27', '', '', 1),
(3377, 'P03377', 'Matador Hi-school ballpen', 2, 0, 0, 'na', 0, 0, 0.00, 6.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:24:06', 'Admin', '2025-07-11 17:42:00', 1),
(3378, 'P03378', 'Matador Smoothy ballpen ', 2, 0, 0, 'na', 0, 0, 0.00, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:25:27', '', '', 1),
(3379, 'P03379', 'Matador Fiction gel pen', 2, 0, 0, 'na', 0, 0, 28.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:48:54', '', '', 1),
(3380, 'P03380', 'Matador I-teen gel Black', 2, 0, 0, 'na', 0, 0, 0.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:54:31', '', '', 1),
(3381, 'P03381', 'Matador I-teen gel Blue', 2, 0, 0, 'na', 0, 0, 0.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:56:03', '', '', 1),
(3382, 'P03382', 'Matador I-teen gel Green', 2, 0, 0, 'na', 0, 0, 0.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:57:32', '', '', 1),
(3383, 'P03383', 'Matador I-teen gel Red', 1, 0, 0, 'na', 0, 0, 0.00, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 17:58:34', '', '', 1),
(3384, 'P03384', 'Matador Double Decker Pencil box', 2, 0, 0, 'na', 0, 0, 55.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 18:08:07', '', '', 1),
(3385, 'P03385', 'Matador I-teen color pencil', 2, 0, 0, 'na', 0, 0, 100.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 18:11:47', '', '', 1),
(3386, 'P03386', 'Matador I-teen color pencil H', 2, 0, 0, 'na', 0, 0, 60.00, 70.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 18:18:57', '', '', 1),
(3387, 'P03387', 'Matador I-teen Geometry box', 2, 0, 0, 'na', 0, 0, 130.00, 150.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 18:21:20', '', '', 1),
(3388, 'P03388', 'Matador i-teen oil pastel(s)', 2, 0, 0, 'na', 0, 0, 90.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 18:24:14', '', '', 1),
(3389, 'P03389', 'Matador i-teen pencil 2B', 2, 0, 0, 'na', 0, 0, 7.91, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 18:30:14', '', '', 1),
(3390, 'P03390', 'Matador i-teen Sharpener Big', 2, 0, 0, 'na', 0, 0, 9.17, 20.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-11 18:32:23', '', '', 1),
(3391, 'P03391', 'Matador i-teen sketch pen', 2, 0, 0, 'na', 0, 0, 70.00, 90.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 18:35:02', '', '', 1),
(3392, 'P03392', 'Matador Neon Pencil Dark', 2, 0, 0, 'na', 0, 0, 7.92, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 18:38:48', '', '', 1),
(3393, 'P03393', 'Matador pencil case(small)', 2, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-11 18:50:30', '', '', 1),
(3394, 'P03394', 'Matador Pluto Pencil 2B Black', 2, 0, 0, 'na', 0, 0, 4.58, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 18:59:30', '', '', 1),
(3395, 'P03395', 'Matador Pluto Pencil 2B Red', 2, 0, 0, 'na', 0, 0, 4.58, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 19:03:22', '', '', 1),
(3396, 'P03396', 'Matador Smoothy Pencil 2B', 2, 0, 0, 'na', 0, 0, 5.84, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 19:05:21', '', '', 1),
(3397, 'P03397', 'Matador Woodmark Eraser	', 2, 0, 0, 'na', 0, 0, 8.13, 15.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:09:09', '', '', 1),
(3398, 'P03398', 'Matador Woodmark Pencil 2B', 2, 0, 0, 'na', 0, 0, 8.75, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:13:18', '', '', 1),
(3399, 'P03399', 'Matador Woodmark Pencil box', 2, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-11 19:21:22', '', '', 1),
(3400, 'P03400', 'Matador Markpro yellow', 2, 0, 0, 'na', 0, 0, 25.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:26:02', 'Admin', '2025-07-11 19:40:32', 1),
(3401, 'P03401', 'Matador Markpro Permanent 5000', 2, 0, 0, 'na', 0, 0, 22.00, 40.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:27:36', '', '', 1),
(3402, 'P03402', 'Matador Markpro 3000	', 2, 0, 0, 'na', 0, 0, 26.00, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-11 19:40:16', '', '', 1),
(3403, 'P03403', 'Matador Officemate Correction pen', 2, 0, 0, 'na', 0, 0, 30.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:41:46', '', '', 1),
(3404, 'P03404', 'Matador Line Bag', 2, 0, 0, 'na', 0, 0, 0.00, 50.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:45:33', '', '', 1),
(3405, 'P03405', 'Matador Drawing Book', 2, 0, 0, 'na', 0, 0, 45.00, 60.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-11 19:48:17', '', '', 1),
(3406, 'P03406', 'Parachute Coconut Oil 350ml', 2, 0, 0, 'na', 0, 0, 300.00, 340.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-12 11:01:02', '', '', 1),
(3407, '8941174010438', 'livon Anti Frizz Serum 100ml', 2, 0, 0, 'na', 0, 0, 385.00, 540.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-12 11:31:12', '', '', 1),
(3408, '8941174010414', 'parachute skinpure aloe vera gel 100ml', 2, 0, 0, 'na', 0, 0, 156.00, 205.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-12 11:33:53', '', '', 1),
(3409, 'P03409', 'parachute skinpure aloe vera gel 50ml', 2, 0, 0, 'na', 0, 0, 93.00, 120.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-12 11:35:00', '', '', 1),
(3410, '8335564787251', 'Dekko Great Salt', 1, 0, 0, 'na', 0, 0, 0.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-12 12:48:08', '', '', 1),
(3411, '8889779150411', 'kazi chocolate vanilla cake', 1, 0, 0, 'na', 0, 0, 8.83, 10.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-13 12:16:11', '', '', 1),
(3412, '8941114000581', 'Banoful SP toaste 300g', 1, 0, 0, 'na', 0, 0, 60.00, 80.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-13 12:46:26', '', '', 1),
(3413, '8941114003919', 'Banoful lashcha shemai 200g', 1, 0, 0, 'na', 0, 0, 40.00, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-13 13:08:02', '', '', 1),
(3414, '8941114001441', 'Banoful family  1000g', 1, 0, 0, 'na', 0, 0, 340.00, 400.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-13 13:20:19', '', '', 1),
(3415, '8941114001076', 'BANOFUL MARIE GOLD BISCUIT', 1, 0, 0, 'na', 0, 0, 30.00, 40.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-13 13:22:48', 'Admin', '2025-07-13 13:23:06', 1),
(3416, '8941114000680', 'bANOFUL COCONUT BISCUIT', 1, 0, 0, 'na', 0, 0, 20.00, 25.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-13 13:25:40', '', '', 1),
(3417, '8941114000604', 'bANOFUL DRY CAKE 300G', 1, 0, 0, 'na', 0, 0, 119.00, 150.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-13 13:34:38', '', '', 1);
INSERT INTO `tbl_product` (`Product_SlNo`, `Product_Code`, `Product_Name`, `ProductCategory_ID`, `color`, `brand`, `size`, `vat`, `Product_ReOrederLevel`, `Product_Purchase_Rate`, `Product_SellingPrice`, `Product_MinimumSellingPrice`, `Product_WholesaleRate`, `one_cartun_equal`, `is_service`, `Unit_ID`, `image_name`, `note`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Product_branchid`) VALUES
(3418, 'P03418', 'SUNSILK SHAMPOO 2 TK', 2, 0, 0, 'na', 0, 0, 1.75, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-13 14:24:20', '', '', 1),
(3419, 'P03419', 'LIFE BUOY SHAMPOO 2TK', 2, 0, 0, 'na', 0, 0, 1.75, 2.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-13 14:25:29', '', '', 1),
(3420, '830546231053', 'teer mori 500g', 1, 0, 0, 'na', 0, 0, 57.00, 75.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-14 12:16:23', '', '', 1),
(3421, '332931202063', 'Baking powder 120g', 1, 0, 0, 'na', 0, 0, 40.00, 60.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-14 12:58:56', '', '', 1),
(3422, '5054563123817', 'Little teeth barsh', 1, 0, 0, 'na', 0, 0, 215.00, 280.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-14 13:57:26', '', '', 1),
(3423, '8819139711038', 'paragon red roti 20pic', 1, 0, 0, 'na', 0, 0, 186.00, 220.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-14 13:59:24', '', '', 1),
(3424, '8819139727021', 'paragon french fries 1kg', 1, 0, 0, 'na', 0, 0, 315.00, 380.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-14 14:00:39', '', '', 1),
(3425, '8901571009503', 'Sensodyne fresh mint 450 g', 2, 0, 0, 'na', 0, 0, 622.22, 700.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-14 14:14:54', 'Admin', '2025-07-14 14:16:48', 1),
(3426, '8901571009510', 'Sensodyne Fresh gel 450 g', 2, 0, 0, 'na', 0, 0, 622.22, 700.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-14 14:16:29', '', '', 1),
(3427, '332931202043', 'tasting salt 20g', 1, 0, 0, 'na', 0, 0, 8.00, 10.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-14 14:23:58', '', '', 1),
(3428, '332931202059', 'tasting salt 40g', 1, 0, 0, 'na', 0, 0, 15.00, 20.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-14 14:26:00', '', '', 1),
(3429, '332931202027', 'prop yeast 40g', 1, 0, 0, 'na', 0, 0, 40.00, 60.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-14 14:27:19', '', '', 1),
(3430, '8941175030497', 'Raxoll soap 100g', 2, 0, 0, 'na', 0, 0, 60.00, 75.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-14 19:25:47', '', '', 1),
(3431, 'P03431', 'Tiler Naru', 2, 0, 0, 'na', 0, 0, 150.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-14 21:34:41', '', '', 1),
(3432, '812211028618', 'Kidstar new born', 2, 0, 0, 'na', 0, 0, 80.00, 100.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-15 13:45:57', '', '', 1),
(3433, '6290400030095', 'Quaker ', 1, 0, 0, 'na', 0, 0, 360.00, 450.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-15 13:49:33', '', '', 1),
(3434, '6281007061988', 'Almarai 2.5 kg', 1, 0, 0, 'na', 0, 0, 3500.00, 4000.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-15 13:55:13', '', '', 1),
(3435, '724120155340', 'Nicobena tamarind pickle 325g', 1, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-15 13:57:47', '', '', 1),
(3436, '0724120155258', 'Nicobena mixed hot pickle ', 1, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-15 14:01:16', '', '', 1),
(3437, '724120155197', 'nicobena mango hot pickle', 1, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 8, NULL, '', 'a', 'Admin', '2025-07-15 14:05:04', '', '', 1),
(3438, '0724120155210', 'Nicobena olive hot pickle ', 1, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-15 14:06:27', '', '', 1),
(3439, '724120155326', 'Nicobena chalta pickle', 1, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-15 14:07:30', '', '', 1),
(3440, '724120155333', 'Nicobena boroi pickle', 1, 0, 0, 'na', 0, 0, 115.00, 140.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-15 14:08:55', '', '', 1),
(3441, '872111023557', 'Bangas Pineapple', 1, 0, 0, 'na', 0, 0, 12.50, 15.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-15 15:22:50', '', '', 1),
(3442, '8811789103118', 'Bangas Grand Choice', 1, 0, 0, 'na', 0, 0, 42.50, 50.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-15 15:25:37', '', '', 1),
(3443, '8941102468973', 'Surf Excel 75g', 2, 0, 0, 'na', 0, 0, 18.00, 20.00, 0.00, 0.00, '', 'false', 7, NULL, '', 'a', 'Admin', '2025-07-15 16:39:18', '', '', 1),
(3444, '8941153910032', 'Lily Body wash melon ', 2, 0, 0, 'na', 0, 0, 147.00, 200.00, 0.00, 0.00, '', 'false', 3, NULL, '', 'a', 'Admin', '2025-07-16 11:32:04', '', '', 1),
(3445, '8941153910049', 'Lily Body wash whipped', 2, 0, 0, 'na', 0, 0, 147.00, 200.00, 0.00, 0.00, '', 'false', 9, NULL, '', 'a', 'Admin', '2025-07-16 11:33:22', 'Admin', '2025-07-31 17:07:08', 1),
(3446, '8941153907049', 'Acnol soap 75g', 2, 0, 0, 'na', 0, 0, 41.00, 55.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-16 11:49:40', '', '', 1),
(3447, '8941153912036', 'Orix 500g', 2, 0, 0, 'na', 0, 0, 68.00, 95.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-07-16 11:55:55', '', '', 1),
(3448, '8941193070772', 'Bashundhara diaper smoll all siz', 2, 0, 0, 'na', 0, 0, 85.00, 100.00, 0.00, 0.00, '', 'false', 10, NULL, '', 'a', 'Admin', '2025-07-16 12:15:57', 'Admin', '2025-07-31 17:06:56', 1),
(3449, '8941100500866', 'Meril baslin 15ml', 1, 0, 0, 'na', 0, 0, 20.77, 25.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-17 12:28:23', '', '', 1),
(3450, '8941152014595', 'partex hand tissue 200', 2, 0, 0, 'na', 0, 0, 100.00, 110.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-07-19 07:51:17', '', '', 1),
(3451, '8941189600082', 'mojo 2l', 1, 0, 0, 'na', 0, 0, 95.00, 110.00, 0.00, 0.00, '', 'false', 9, NULL, '', 'a', 'Admin', '2025-07-19 08:47:36', 'Admin', '2025-07-31 17:06:40', 1),
(3452, '129898829514', 'Finray Glass Cleaner', 2, 0, 0, 'na', 0, 0, 110.00, 130.00, 0.00, 0.00, '', 'false', 9, NULL, '', 'a', 'Admin', '2025-07-20 16:52:56', 'Admin', '2025-07-31 17:06:26', 1),
(3453, '8941133210220', 'Neocare Diaper xl 50pcs', 2, 0, 0, 'na', 0, 0, 1400.00, 1450.00, 0.00, 0.00, '', 'false', 2, NULL, '', 'a', 'Admin', '2025-07-31 16:50:08', '', '', 1),
(3454, 'P03454', 'miniket rice', 1, 0, 0, 'na', 0, 0, 70.00, 75.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-07-31 16:53:54', 'Admin', '2025-08-02 19:46:56', 1),
(3455, '7860109003035', 'Orchid Air Freshener', 2, 0, 0, 'na', 0, 0, 75.00, 80.00, 0.00, 0.00, '', 'false', 1, NULL, '', 'a', 'Admin', '2025-08-06 17:14:33', '', '', 1),
(3456, '8850002006553', 'Kodomo Baby Powder (Extra Mild)', 2, 0, 0, 'na', 0, 0, 400.00, 430.00, 0.00, 0.00, '', 'false', 9, NULL, '', 'a', 'Admin', '2025-08-06 17:17:22', '', '', 1),
(3457, '9780201379624', 'Chocolate ', 1, 0, 0, 'na', 0, 0, 850.00, 950.00, 0.00, 0.00, '', 'false', 6, NULL, '', 'a', 'Admin', '2025-08-06 17:19:39', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `ProductCategory_SlNo` int(11) NOT NULL,
  `ProductCategory_Name` varchar(150) NOT NULL,
  `ProductCategory_Description` varchar(300) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) NOT NULL,
  `AddTime` varchar(30) NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateTime` varchar(30) NOT NULL,
  `category_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_productcategory`
--

INSERT INTO `tbl_productcategory` (`ProductCategory_SlNo`, `ProductCategory_Name`, `ProductCategory_Description`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `category_branchid`) VALUES
(1, 'Food', '', 'a', 'Admin', '2025-04-16 15:18:02', '', '', 1),
(2, 'NON Food', '', 'a', 'Admin', '2025-04-16 15:34:22', '', '', 1),
(3, 'Unilever ', '', 'a', 'Admin', '2025-04-16 16:08:27', '', '', 1),
(4, 'IDC', '', 'a', 'Admin', '2025-04-16 17:15:35', '', '', 1),
(5, 'Pran', '', 'a', 'Admin', '2025-04-16 18:50:39', '', '', 1),
(6, 'Pran(health and higeing)', '', 'a', 'Admin', '2025-04-16 19:23:32', 'Admin', '2025-04-16 19:23:47', 1),
(7, 'Risal Trader International', '', 'a', 'Admin', '2025-04-16 20:36:03', '', '', 1),
(8, 'Nestle', '', 'a', 'Admin', '2025-04-17 19:13:31', '', '', 1),
(9, 'Square LTM', '', 'a', 'Admin', '2025-04-18 13:53:14', '', '', 1),
(10, 'Sergical Items ', '', 'a', 'Admin', '2025-04-18 15:28:54', 'Admin', '2025-04-18 15:29:06', 1),
(11, 'Tibet Kohinoor Chemicel', '', 'a', 'Admin', '2025-04-18 16:36:35', '', '', 1),
(12, 'Neocare(incepta) ', '', 'a', 'Admin', '2025-04-18 16:52:59', '', '', 1),
(13, 'Smart Care LTM', '', 'a', 'Admin', '2025-04-18 17:15:56', '', '', 1),
(14, 'GARNIER', '', 'a', 'Admin', '2025-04-18 17:31:49', '', '', 1),
(15, 'Bashundara Ltm', '', 'a', 'Admin', '2025-04-18 17:53:19', '', '', 1),
(16, 'BABY TOYS ', '', 'a', 'Admin', '2025-04-18 17:59:40', '', '', 1),
(17, 'BABY CLOTHES', '', 'a', 'Admin', '2025-04-18 17:59:52', '', '', 1),
(18, 'Electical Items', '', 'a', 'Admin', '2025-04-18 18:01:26', '', '', 1),
(19, 'Baby Products', '', 'a', 'Admin', '2025-04-18 18:05:37', '', '', 1),
(20, 'Bombay Sweets', '', 'a', 'Admin', '2025-04-20 09:57:50', '', '', 1),
(21, 'Women Produts', '', 'a', 'Admin', '2025-04-20 12:22:55', '', '', 1),
(22, 'ANONDO ENTERPRISE', '', 'a', 'Admin', '2025-04-20 13:56:29', '', '', 1),
(23, 'RFL', '', 'a', 'Admin', '2025-04-21 09:57:34', '', '', 1),
(24, 'Olympic LTD', '', 'a', 'Admin', '2025-04-21 17:05:02', '', '', 1),
(25, 'Dettol', '', 'a', 'Admin', '2025-04-21 18:50:34', '', '', 1),
(26, 'Fresh', '', 'a', 'Admin', '2025-04-22 18:24:56', '', '', 1),
(27, 'Biomil', '', 'a', 'Admin', '2025-04-23 12:01:27', '', '', 1),
(28, 'partex ', '', 'a', 'Admin', '2025-04-23 16:13:38', '', '', 1),
(29, 'Haiza Deler', '', 'a', 'Admin', '2025-04-23 16:21:37', 'Admin', '2025-04-24 18:07:33', 1),
(30, 'Dan Cake', '', 'a', 'Admin', '2025-04-24 11:49:57', '', '', 1),
(31, 'Farm Fresh', '', 'a', 'Admin', '2025-04-24 12:03:39', '', '', 1),
(32, 'Rong Donu', '', 'a', 'Admin', '2025-04-24 13:12:21', '', '', 1),
(33, 'Koh Kao', '', 'a', 'Admin', '2025-04-24 17:14:55', '', '', 1),
(34, 'Chips', '', 'a', 'Admin', '2025-04-24 18:02:28', '', '', 1),
(35, 'Bangel Tissue', '', 'a', 'Shakib Hasan ', '2025-04-26 17:27:06', '', '', 1),
(36, 'Babar', '', 'a', 'Shakib Hasan 2', '2025-04-27 17:17:29', '', '', 1),
(37, 'Islamic Item', '', 'a', 'Shakib Hasan 2', '2025-04-27 18:46:24', '', '', 1),
(38, 'Lily', '', 'a', 'Shakib Hasan 2', '2025-04-27 20:26:35', '', '', 1),
(39, 'J S Trading', '', 'a', 'Shakib Hasan 2', '2025-04-27 20:39:03', '', '', 1),
(40, 'Stastionary ', '', 'a', 'Shakib Hasan 2', '2025-04-28 14:32:25', '', '', 1),
(41, 'Cookeries', '', 'a', 'Shakib Hasan 2', '2025-04-29 13:35:02', '', '', 1),
(42, 'Clothes', '', 'a', 'Shakib Hasan 2', '2025-04-29 14:26:32', '', '', 1),
(43, 'Fatama ', '', 'a', 'Shakib Hasan 2', '2025-04-29 18:31:51', '', '', 1),
(44, 'Medicen (incepta)', '', 'a', 'Shakib Hasan 2', '2025-05-01 09:23:40', '', '', 1),
(45, 'PLASTIC', '', 'a', 'Shakib Hasan 2', '2025-05-01 17:00:11', '', '', 1),
(46, 'COCOLA FOOD', '', 'a', 'Shakib Hasan 2', '2025-05-03 16:41:49', '', '', 1),
(47, 'HIMALAYA', '', 'a', 'Shakib Hasan 2', '2025-05-07 17:52:12', '', '', 1),
(48, 'MEDI PLUS', '', 'a', 'Shakib Hasan 2', '2025-05-10 13:59:24', '', '', 1),
(49, 'BD FOOD', '', 'a', 'Shakib Hasan 2', '2025-05-10 14:36:17', '', '', 1),
(50, 'SUN', '', 'a', 'Shakib Hasan 2', '2025-05-12 17:56:59', '', '', 1),
(51, 'ACI', '', 'a', 'Shakib Hasan 2', '2025-05-14 14:25:22', '', '', 1),
(52, 'shahin store', '', 'a', 'Shakib Hasan 2', '2025-05-14 21:51:14', '', '', 1),
(53, 'smoke item', '', 'a', 'Shakib Hasan 2', '2025-05-16 17:40:01', '', '', 1),
(54, 'sumon', 'treding', 'd', 'Admin', '2025-05-17 13:43:39', '', '', 1),
(55, 'sumon trending', 'patti', 'a', 'Admin', '2025-05-17 13:45:46', '', '', 1),
(56, 'ALVIAN SHOE STORE', '', 'a', 'Shakib Hasan 2', '2025-05-17 18:10:41', '', '', 1),
(57, 'CAKE ', '', 'a', 'Shakib Hasan 2', '2025-05-18 18:58:02', '', '', 1),
(58, 'orna house', '', 'a', 'Shakib Hasan 2', '2025-05-19 11:39:17', '', '', 1),
(59, 'LOCK ITEM', '', 'a', 'Shakib Hasan 2', '2025-05-19 11:47:41', '', '', 1),
(60, 'MEDICEN', '', 'a', 'Shakib Hasan 2', '2025-05-20 22:18:25', '', '', 1),
(61, 'SMC', '', 'a', 'Shakib Hasan 2', '2025-05-22 19:17:56', '', '', 1),
(62, 'Lizan harbal', '', 'a', 'Admin', '2025-06-04 20:12:11', '', '', 1),
(63, 'AXE', '', 'a', 'Admin', '2025-06-15 19:57:05', '', '', 1),
(64, 'ikra', '', 'a', 'Admin', '2025-06-21 17:42:50', '', '', 1),
(65, 'star ship', '', 'a', 'Admin', '2025-06-23 18:40:00', '', '', 1),
(66, 'cosmatics', '', 'a', 'Admin', '2025-06-25 12:44:15', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasedetails`
--

CREATE TABLE `tbl_purchasedetails` (
  `PurchaseDetails_SlNo` int(11) NOT NULL,
  `PurchaseMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `PurchaseDetails_TotalQuantity` float NOT NULL,
  `PurchaseDetails_Rate` decimal(18,2) NOT NULL,
  `purchase_cost` decimal(18,2) NOT NULL,
  `PurchaseDetails_Discount` decimal(18,2) NOT NULL,
  `PurchaseDetails_TotalAmount` decimal(18,2) NOT NULL,
  `isFree` enum('yes','no') NOT NULL DEFAULT 'no',
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseDetails_branchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_purchasedetails`
--

INSERT INTO `tbl_purchasedetails` (`PurchaseDetails_SlNo`, `PurchaseMaster_IDNo`, `Product_IDNo`, `exp_date`, `PurchaseDetails_TotalQuantity`, `PurchaseDetails_Rate`, `purchase_cost`, `PurchaseDetails_Discount`, `PurchaseDetails_TotalAmount`, `isFree`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseDetails_branchID`) VALUES
(1, 1, 3451, NULL, 10, 95.00, 0.00, 0.00, 950.00, 'no', 'a', 'Admin', '2025-07-19 10:31:30', NULL, NULL, 1),
(2, 2, 419, NULL, 2, 50.00, 0.00, 0.00, 100.00, 'no', 'a', 'Admin', '2025-07-19 12:21:53', NULL, NULL, 1),
(3, 3, 3452, NULL, 50, 110.00, 0.00, 0.00, 5500.00, 'no', 'a', 'Admin', '2025-07-20 16:56:44', NULL, NULL, 1),
(4, 4, 3450, NULL, 100, 100.00, 0.00, 0.00, 10000.00, 'no', 'a', 'Admin', '2025-07-20 17:02:49', NULL, NULL, 1),
(5, 5, 3451, NULL, 50, 95.00, 0.00, 0.00, 4750.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(6, 5, 3448, NULL, 50, 85.00, 0.00, 0.00, 4250.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(7, 5, 3449, NULL, 50, 20.77, 0.00, 0.00, 1038.50, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(8, 5, 3447, NULL, 50, 68.00, 0.00, 0.00, 3400.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(9, 5, 3446, NULL, 50, 41.00, 0.00, 0.00, 2050.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(10, 5, 3445, NULL, 60, 147.00, 0.00, 0.00, 8820.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(11, 5, 3444, NULL, 60, 147.00, 0.00, 0.00, 8820.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(12, 5, 3443, NULL, 50, 18.00, 0.00, 0.00, 900.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(13, 5, 3442, NULL, 50, 42.50, 0.00, 0.00, 2125.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(14, 5, 3441, NULL, 50, 12.50, 0.00, 0.00, 625.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(15, 5, 3440, NULL, 50, 115.00, 0.00, 0.00, 5750.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(16, 5, 3439, NULL, 50, 115.00, 0.00, 0.00, 5750.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(17, 5, 3438, NULL, 50, 115.00, 0.00, 0.00, 5750.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(18, 5, 3436, NULL, 50, 115.00, 0.00, 0.00, 5750.00, 'no', 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(19, 6, 3453, NULL, 50, 1400.00, 0.00, 0.00, 70000.00, 'no', 'a', 'Admin', '2025-07-31 16:51:13', NULL, NULL, 1),
(20, 7, 3454, NULL, 100, 70.00, 0.00, 0.00, 7000.00, 'no', 'a', 'Admin', '2025-07-31 16:56:53', NULL, NULL, 1),
(21, 8, 3454, NULL, 50, 70.00, 0.00, 0.00, 3500.00, 'no', 'a', 'Admin', '2025-07-31 17:34:37', NULL, NULL, 1),
(22, 8, 3453, NULL, 10, 1400.00, 0.00, 0.00, 14000.00, 'no', 'a', 'Admin', '2025-07-31 17:34:37', NULL, NULL, 1),
(23, 8, 3452, NULL, 10, 110.00, 0.00, 0.00, 1100.00, 'no', 'a', 'Admin', '2025-07-31 17:34:37', NULL, NULL, 1),
(24, 9, 3454, NULL, 5, 0.00, 0.00, 0.00, 0.00, 'yes', 'a', 'Admin', '2025-08-02 19:27:24', NULL, NULL, 1),
(25, 10, 3453, NULL, 5, 1400.00, 0.00, 0.00, 7000.00, 'no', 'a', 'Admin', '2025-08-02 19:31:33', NULL, NULL, 1),
(26, 10, 3454, NULL, 1, 0.00, 0.00, 0.00, 0.00, 'yes', 'a', 'Admin', '2025-08-02 19:31:33', NULL, NULL, 1),
(27, 11, 3457, NULL, 5, 850.00, 0.00, 0.00, 4250.00, 'no', 'a', 'Admin', '2025-08-06 17:20:35', NULL, NULL, 1),
(28, 11, 3456, NULL, 20, 400.00, 0.00, 0.00, 8000.00, 'no', 'a', 'Admin', '2025-08-06 17:20:35', NULL, NULL, 1),
(29, 11, 3455, NULL, 20, 75.00, 0.00, 0.00, 1500.00, 'no', 'a', 'Admin', '2025-08-06 17:20:35', NULL, NULL, 1),
(30, 11, 3147, NULL, 20, 245.00, 0.00, 0.00, 4900.00, 'no', 'a', 'Admin', '2025-08-06 17:20:35', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasemaster`
--

CREATE TABLE `tbl_purchasemaster` (
  `PurchaseMaster_SlNo` int(11) NOT NULL,
  `Supplier_SlNo` int(11) DEFAULT NULL,
  `supplierType` varchar(20) NOT NULL,
  `supplierName` varchar(191) DEFAULT NULL,
  `supplierMobile` varchar(15) DEFAULT NULL,
  `supplierAddress` varchar(255) DEFAULT NULL,
  `Employee_SlNo` int(11) DEFAULT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) NOT NULL,
  `PurchaseMaster_OrderDate` date NOT NULL,
  `PurchaseMaster_PurchaseFor` varchar(50) NOT NULL,
  `PurchaseMaster_Description` longtext NOT NULL,
  `PurchaseMaster_TotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DiscountAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_Tax` decimal(18,2) NOT NULL,
  `PurchaseMaster_Freight` decimal(18,2) NOT NULL,
  `PurchaseMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_PaidAmount` decimal(18,2) NOT NULL,
  `PurchaseMaster_DueAmount` decimal(18,2) NOT NULL,
  `previous_due` float DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseMaster_BranchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_purchasemaster`
--

INSERT INTO `tbl_purchasemaster` (`PurchaseMaster_SlNo`, `Supplier_SlNo`, `supplierType`, `supplierName`, `supplierMobile`, `supplierAddress`, `Employee_SlNo`, `PurchaseMaster_InvoiceNo`, `PurchaseMaster_OrderDate`, `PurchaseMaster_PurchaseFor`, `PurchaseMaster_Description`, `PurchaseMaster_TotalAmount`, `PurchaseMaster_DiscountAmount`, `PurchaseMaster_Tax`, `PurchaseMaster_Freight`, `PurchaseMaster_SubTotalAmount`, `PurchaseMaster_PaidAmount`, `PurchaseMaster_DueAmount`, `previous_due`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `PurchaseMaster_BranchID`) VALUES
(1, NULL, 'G', 'General Supplier', '', '', NULL, '2025000001', '2025-07-19', '1', '', 950.00, 0.00, 0.00, 0.00, 950.00, 950.00, 0.00, 0, 'a', 'Admin', '2025-07-19 10:31:30', NULL, NULL, 1),
(2, NULL, 'G', 'General Supplier', '', '', NULL, '2025000002', '2025-07-19', '1', '', 100.00, 0.00, 0.00, 0.00, 100.00, 100.00, 0.00, 0, 'a', 'Admin', '2025-07-19 12:21:53', NULL, NULL, 1),
(3, NULL, 'G', 'General Supplier', '345678', '', NULL, '2025000003', '2025-07-20', '1', '', 5300.00, 200.00, 0.00, 0.00, 5500.00, 5300.00, 0.00, 0, 'a', 'Admin', '2025-07-20 16:56:44', NULL, NULL, 1),
(4, NULL, 'G', 'General Supplier', '', '', NULL, '2025000004', '2025-07-20', '1', '', 10000.00, 0.00, 0.00, 0.00, 10000.00, 10000.00, 0.00, 0, 'a', 'Admin', '2025-07-20 17:02:49', NULL, NULL, 1),
(5, NULL, 'G', 'General Supplier', '', '', NULL, '2025000005', '2025-07-20', '1', '', 59778.50, 0.00, 0.00, 0.00, 59778.50, 59778.50, 0.00, 0, 'a', 'Admin', '2025-07-20 17:13:16', NULL, NULL, 1),
(6, NULL, 'G', 'General Supplier', '', '', NULL, '2025000006', '2025-07-31', '1', '', 70000.00, 0.00, 0.00, 0.00, 70000.00, 70000.00, 0.00, 0, 'a', 'Admin', '2025-07-31 16:51:13', NULL, NULL, 1),
(7, NULL, 'G', 'General Supplier', '', '', NULL, '2025000007', '2025-07-31', '1', '', 7000.00, 0.00, 0.00, 0.00, 7000.00, 7000.00, 0.00, 0, 'a', 'Admin', '2025-07-31 16:56:53', NULL, NULL, 1),
(8, NULL, 'G', 'General Supplier', '', '', NULL, '2025000008', '2025-07-31', '1', '', 18600.00, 0.00, 0.00, 0.00, 18600.00, 18600.00, 0.00, 0, 'a', 'Admin', '2025-07-31 17:34:37', NULL, NULL, 1),
(9, NULL, 'G', 'General Supplier', '', '', NULL, '2025000009', '2025-08-02', '1', '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 'a', 'Admin', '2025-08-02 19:27:24', NULL, NULL, 1),
(10, 1, 'retail', NULL, NULL, NULL, NULL, '2025000010', '2025-08-02', '1', '', 7000.00, 0.00, 0.00, 0.00, 7000.00, 0.00, 7000.00, 0, 'a', 'Admin', '2025-08-02 19:31:33', NULL, NULL, 1),
(11, NULL, 'G', 'General Supplier', '', '', NULL, '2025000011', '2025-08-06', '1', '', 18650.00, 0.00, 0.00, 0.00, 18650.00, 18650.00, 0.00, 0, 'a', 'Admin', '2025-08-06 17:20:35', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturn`
--

CREATE TABLE `tbl_purchasereturn` (
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `invoice` varchar(50) DEFAULT NULL,
  `PurchaseMaster_InvoiceNo` varchar(50) DEFAULT NULL,
  `Supplier_IDdNo` int(11) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_mobile` varchar(15) DEFAULT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `PurchaseReturn_ReturnDate` date NOT NULL,
  `PurchaseReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `PurchaseReturn_Description` varchar(300) NOT NULL,
  `is_productwise` enum('yes','no') NOT NULL DEFAULT 'no',
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturn_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchasereturndetails`
--

CREATE TABLE `tbl_purchasereturndetails` (
  `PurchaseReturnDetails_SlNo` int(11) NOT NULL,
  `PurchaseReturn_SlNo` int(11) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `PurchaseReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `PurchaseReturnDetails_ReturnQuantity` float NOT NULL,
  `PurchaseReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `PurchaseReturnDetails_brachid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotaion_customer`
--

CREATE TABLE `tbl_quotaion_customer` (
  `quotation_customer_id` int(11) NOT NULL,
  `customer_name` char(50) NOT NULL,
  `contact_number` varchar(35) NOT NULL,
  `customer_address` mediumtext NOT NULL,
  `quation_customer_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_details`
--

CREATE TABLE `tbl_quotation_details` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_Freight` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quotation_master`
--

CREATE TABLE `tbl_quotation_master` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `SaleMaster_customer_name` varchar(500) NOT NULL,
  `SaleMaster_customer_mobile` varchar(50) NOT NULL,
  `SaleMaster_customer_address` varchar(1000) NOT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL,
  `SaleMaster_Freight` decimal(18,2) NOT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_saledetails`
--

CREATE TABLE `tbl_saledetails` (
  `SaleDetails_SlNo` int(11) NOT NULL,
  `SaleMaster_IDNo` int(11) NOT NULL,
  `Product_IDNo` int(11) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `SaleDetails_TotalQuantity` float NOT NULL,
  `Purchase_Rate` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Rate` decimal(18,2) NOT NULL,
  `SaleDetails_Discount` decimal(18,2) NOT NULL,
  `Discount_amount` decimal(18,2) DEFAULT NULL,
  `SaleDetails_Tax` decimal(18,2) NOT NULL,
  `SaleDetails_TotalAmount` decimal(18,2) NOT NULL,
  `isFree` enum('yes','no') DEFAULT 'no',
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleDetails_BranchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_saledetails`
--

INSERT INTO `tbl_saledetails` (`SaleDetails_SlNo`, `SaleMaster_IDNo`, `Product_IDNo`, `exp_date`, `SaleDetails_TotalQuantity`, `Purchase_Rate`, `SaleDetails_Rate`, `SaleDetails_Discount`, `Discount_amount`, `SaleDetails_Tax`, `SaleDetails_TotalAmount`, `isFree`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleDetails_BranchId`) VALUES
(1, 1, 3451, NULL, 2, 95.00, 110.00, 0.00, NULL, 0.00, 220.00, 'no', 'a', 'Admin', '2025-07-19 10:33:45', NULL, NULL, 1),
(2, 2, 3451, NULL, 2, 95.00, 110.00, 0.00, NULL, 0.00, 220.00, 'no', 'a', 'Admin', '2025-07-19 11:08:15', NULL, NULL, 1),
(3, 3, 419, NULL, 1, 50.00, 60.00, 0.00, NULL, 0.00, 60.00, 'no', 'a', 'Admin', '2025-07-19 12:22:49', NULL, NULL, 1),
(4, 4, 419, NULL, 1, 50.00, 60.00, 0.00, NULL, 0.00, 60.00, 'no', 'a', 'Admin', '2025-07-19 12:23:21', NULL, NULL, 1),
(5, 5, 3451, NULL, 1, 95.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-07-19 13:16:23', NULL, NULL, 1),
(6, 6, 3451, NULL, 3, 95.00, 110.00, 0.00, NULL, 0.00, 330.00, 'no', 'a', 'Admin', '2025-07-19 15:08:26', NULL, NULL, 1),
(7, 7, 3452, NULL, 5, 110.00, 130.00, 0.00, NULL, 0.00, 650.00, 'no', 'a', 'Admin', '2025-07-20 16:57:46', NULL, NULL, 1),
(8, 8, 3450, NULL, 5, 100.00, 110.00, 0.00, NULL, 0.00, 550.00, 'no', 'a', 'Admin', '2025-07-20 17:05:44', NULL, NULL, 1),
(9, 8, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-07-20 17:05:44', NULL, NULL, 1),
(10, 9, 3436, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(11, 9, 3438, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(12, 9, 3439, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(13, 9, 3440, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(14, 9, 3441, NULL, 1, 12.50, 15.00, 0.00, NULL, 0.00, 15.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(15, 9, 3442, NULL, 1, 42.50, 50.00, 0.00, NULL, 0.00, 50.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(16, 9, 3443, NULL, 1, 18.00, 20.00, 0.00, NULL, 0.00, 20.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(17, 9, 3444, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(18, 9, 3445, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(19, 9, 3446, NULL, 1, 41.00, 55.00, 0.00, NULL, 0.00, 55.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(20, 9, 3447, NULL, 1, 68.00, 95.00, 0.00, NULL, 0.00, 95.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(21, 9, 3448, NULL, 2, 85.00, 100.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(22, 9, 3449, NULL, 1, 20.77, 25.00, 0.00, NULL, 0.00, 25.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(23, 9, 3450, NULL, 2, 100.00, 110.00, 0.00, NULL, 0.00, 220.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(24, 9, 3451, NULL, 1, 95.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(25, 9, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(26, 10, 3436, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(27, 10, 3438, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(28, 10, 3439, NULL, 12, 115.00, 140.00, 0.00, NULL, 0.00, 1680.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(29, 10, 3440, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(30, 10, 3441, NULL, 1, 12.50, 15.00, 0.00, NULL, 0.00, 15.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(31, 10, 3442, NULL, 1, 42.50, 50.00, 0.00, NULL, 0.00, 50.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(32, 10, 3443, NULL, 1, 18.00, 20.00, 0.00, NULL, 0.00, 20.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(33, 10, 3444, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(34, 10, 3445, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(35, 10, 3446, NULL, 1, 41.00, 55.00, 0.00, NULL, 0.00, 55.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(36, 10, 3447, NULL, 1, 68.00, 95.00, 0.00, NULL, 0.00, 95.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(37, 10, 3448, NULL, 1, 85.00, 100.00, 0.00, NULL, 0.00, 100.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(38, 10, 3449, NULL, 1, 20.77, 25.00, 0.00, NULL, 0.00, 25.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(39, 10, 3450, NULL, 1, 100.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(40, 10, 3451, NULL, 1, 95.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(41, 10, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(42, 11, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-07-20 17:54:13', NULL, NULL, 1),
(43, 12, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-07-20 17:57:46', NULL, NULL, 1),
(44, 13, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-07-20 18:14:07', NULL, NULL, 1),
(45, 14, 3453, NULL, 4, 1400.00, 1450.00, 0.00, NULL, 0.00, 5800.00, 'no', 'a', 'Admin', '2025-07-31 16:51:53', NULL, NULL, 1),
(46, 15, 3453, NULL, 2, 1400.00, 1450.00, 0.00, NULL, 0.00, 2900.00, 'no', 'a', 'Admin', '2025-07-31 16:58:07', NULL, NULL, 1),
(47, 15, 3452, NULL, 2, 110.00, 130.00, 0.00, NULL, 0.00, 260.00, 'no', 'a', 'Admin', '2025-07-31 16:58:07', NULL, NULL, 1),
(48, 15, 3454, NULL, 5, 70.00, 75.00, 0.00, NULL, 0.00, 375.00, 'no', 'a', 'Admin', '2025-07-31 16:58:07', NULL, NULL, 1),
(49, 16, 3452, NULL, 3, 110.00, 130.00, 0.00, NULL, 0.00, 390.00, 'no', 'a', 'Admin', '2025-07-31 17:36:03', NULL, NULL, 1),
(50, 16, 3453, NULL, 2, 1400.00, 1450.00, 0.00, NULL, 0.00, 2900.00, 'no', 'a', 'Admin', '2025-07-31 17:36:03', NULL, NULL, 1),
(51, 16, 3454, NULL, 10, 70.00, 75.00, 0.00, NULL, 0.00, 750.00, 'no', 'a', 'Admin', '2025-07-31 17:36:03', NULL, NULL, 1),
(52, 17, 3453, NULL, 1, 1400.00, 0.00, 0.00, NULL, 0.00, 1450.00, 'yes', 'a', 'Admin', '2025-07-31 17:46:50', NULL, NULL, 1),
(53, 17, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-07-31 17:46:50', NULL, NULL, 1),
(54, 18, 3452, NULL, 6, 110.00, 130.00, 0.00, NULL, 0.00, 780.00, 'no', 'a', 'Admin', '2025-07-31 17:51:21', NULL, NULL, 1),
(55, 18, 3453, NULL, 11, 1400.00, 1450.00, 0.00, NULL, 0.00, 15950.00, 'no', 'a', 'Admin', '2025-07-31 17:51:21', NULL, NULL, 1),
(56, 18, 3454, NULL, 23, 70.00, 75.00, 0.00, NULL, 0.00, 1725.00, 'no', 'a', 'Admin', '2025-07-31 17:51:21', NULL, NULL, 1),
(57, 19, 3453, NULL, 4, 1400.00, 1450.00, 0.00, NULL, 0.00, 5800.00, 'no', 'a', 'Admin', '2025-07-31 17:52:24', NULL, NULL, 1),
(58, 19, 3454, NULL, 10, 70.00, 75.00, 0.00, NULL, 0.00, 750.00, 'no', 'a', 'Admin', '2025-07-31 17:52:24', NULL, NULL, 1),
(59, 19, 3452, NULL, 1, 110.00, 0.00, 0.00, NULL, 0.00, 130.00, 'yes', 'a', 'Admin', '2025-07-31 17:52:24', NULL, NULL, 1),
(60, 19, 3452, NULL, 4, 110.00, 130.00, 0.00, NULL, 0.00, 520.00, 'no', 'a', 'Admin', '2025-07-31 17:52:24', NULL, NULL, 1),
(61, 20, 3439, NULL, 12, 115.00, 140.00, 0.00, NULL, 0.00, 1680.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(62, 20, 3438, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(63, 20, 3440, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(64, 20, 3441, NULL, 1, 12.50, 15.00, 0.00, NULL, 0.00, 15.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(65, 20, 3442, NULL, 1, 42.50, 50.00, 0.00, NULL, 0.00, 50.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(66, 20, 3449, NULL, 1, 20.77, 25.00, 0.00, NULL, 0.00, 25.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(67, 20, 3451, NULL, 11, 95.00, 110.00, 0.00, NULL, 0.00, 1210.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(68, 20, 3445, NULL, 12, 147.00, 200.00, 0.00, NULL, 0.00, 2400.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(69, 20, 3443, NULL, 1, 18.00, 20.00, 0.00, NULL, 0.00, 20.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(70, 20, 3444, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(71, 20, 3446, NULL, 1, 41.00, 55.00, 0.00, NULL, 0.00, 55.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(72, 20, 3447, NULL, 1, 68.00, 95.00, 0.00, NULL, 0.00, 95.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(73, 20, 3448, NULL, 1, 85.00, 100.00, 0.00, NULL, 0.00, 100.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(74, 20, 3450, NULL, 1, 100.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(75, 20, 3436, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(76, 20, 3453, NULL, 3, 1400.00, 1450.00, 0.00, NULL, 0.00, 4350.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(77, 20, 3454, NULL, 5, 70.00, 75.00, 0.00, NULL, 0.00, 375.00, 'no', 'a', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(78, 21, 3450, NULL, 1, 100.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-08-02 16:21:28', NULL, NULL, 1),
(82, 25, 3454, NULL, 5, 70.00, 75.00, 0.00, NULL, 0.00, 375.00, 'no', 'a', 'Admin', '2025-08-02 16:55:36', NULL, NULL, 1),
(85, 28, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 16:57:24', NULL, NULL, 1),
(86, 29, 3453, NULL, 1, 1400.00, 1450.00, 0.00, NULL, 0.00, 1450.00, 'no', 'a', 'Admin', '2025-08-02 17:17:08', NULL, NULL, 1),
(87, 30, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-08-02 17:17:46', NULL, NULL, 1),
(88, 31, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 17:27:20', NULL, NULL, 1),
(89, 32, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 18:16:44', NULL, NULL, 1),
(90, 33, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 18:41:57', NULL, NULL, 1),
(91, 34, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 18:43:38', NULL, NULL, 1),
(92, 35, 3451, NULL, 2, 95.00, 110.00, 0.00, NULL, 0.00, 220.00, 'no', 'a', 'Admin', '2025-08-02 18:48:22', NULL, NULL, 1),
(93, 36, 3447, NULL, 2, 68.00, 95.00, 0.00, NULL, 0.00, 190.00, 'no', 'a', 'Admin', '2025-08-02 18:54:33', NULL, NULL, 1),
(94, 36, 3451, NULL, 2, 95.00, 110.00, 0.00, NULL, 0.00, 220.00, 'no', 'a', 'Admin', '2025-08-02 18:54:33', NULL, NULL, 1),
(95, 36, 3450, NULL, 2, 100.00, 110.00, 0.00, NULL, 0.00, 220.00, 'no', 'a', 'Admin', '2025-08-02 18:54:33', NULL, NULL, 1),
(96, 37, 3453, NULL, 1, 1400.00, 1450.00, 0.00, NULL, 0.00, 1450.00, 'no', 'a', 'Admin', '2025-08-02 19:22:20', NULL, NULL, 1),
(97, 37, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 19:22:20', NULL, NULL, 1),
(98, 38, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 19:22:50', NULL, NULL, 1),
(99, 39, 3454, NULL, 1, 0.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 19:33:37', NULL, NULL, 1),
(100, 40, 3454, NULL, 1, 0.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-02 19:42:30', NULL, NULL, 1),
(101, 41, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-03 16:35:47', NULL, NULL, 1),
(102, 42, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-03 18:01:12', NULL, NULL, 1),
(103, 43, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-03 18:24:27', NULL, NULL, 1),
(104, 44, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-03 18:26:33', NULL, NULL, 1),
(105, 45, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-03 18:30:14', NULL, NULL, 1),
(106, 46, 3453, NULL, 2, 1400.00, 1450.00, 0.00, NULL, 0.00, 2900.00, 'no', 'a', 'Admin', '2025-08-03 18:33:50', NULL, NULL, 1),
(107, 47, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-03 18:49:35', NULL, NULL, 1),
(108, 48, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-03 18:50:12', NULL, NULL, 1),
(109, 49, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-03 19:00:28', NULL, NULL, 1),
(110, 50, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-08-03 19:10:14', NULL, NULL, 1),
(111, 51, 3451, NULL, 1, 95.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-08-03 19:17:20', NULL, NULL, 1),
(112, 52, 3450, NULL, 1, 100.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-08-03 19:25:59', NULL, NULL, 1),
(113, 53, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-04 17:07:37', NULL, NULL, 1),
(114, 54, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-04 17:17:14', NULL, NULL, 1),
(115, 55, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-04 17:32:26', NULL, NULL, 1),
(116, 56, 3454, NULL, 2, 70.00, 75.00, 0.00, NULL, 0.00, 150.00, 'no', 'a', 'Admin', '2025-08-04 17:38:01', NULL, NULL, 1),
(117, 57, 3453, NULL, 2, 1400.00, 1450.00, 0.00, NULL, 0.00, 2900.00, 'no', 'a', 'Admin', '2025-08-04 17:39:21', NULL, NULL, 1),
(118, 58, 3453, NULL, 2, 1400.00, 1450.00, 0.00, NULL, 0.00, 2900.00, 'no', 'a', 'Admin', '2025-08-04 17:51:56', NULL, NULL, 1),
(119, 59, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-04 17:57:45', NULL, NULL, 1),
(120, 60, 3454, NULL, 1, 70.00, 75.00, 0.00, NULL, 0.00, 75.00, 'no', 'a', 'Admin', '2025-08-04 18:22:46', NULL, NULL, 1),
(121, 61, 3448, NULL, 1, 85.00, 100.00, 0.00, NULL, 0.00, 100.00, 'no', 'a', 'Admin', '2025-08-06 14:55:44', NULL, NULL, 1),
(122, 62, 3436, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(123, 62, 3438, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(124, 62, 3439, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(125, 62, 3440, NULL, 1, 115.00, 140.00, 0.00, NULL, 0.00, 140.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(126, 62, 3441, NULL, 1, 12.50, 15.00, 0.00, NULL, 0.00, 15.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(127, 62, 3442, NULL, 1, 42.50, 50.00, 0.00, NULL, 0.00, 50.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(128, 62, 3443, NULL, 1, 18.00, 20.00, 0.00, NULL, 0.00, 20.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(129, 62, 3444, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(130, 62, 3445, NULL, 1, 147.00, 200.00, 0.00, NULL, 0.00, 200.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(131, 62, 3446, NULL, 1, 41.00, 55.00, 0.00, NULL, 0.00, 55.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(132, 62, 3447, NULL, 1, 68.00, 95.00, 0.00, NULL, 0.00, 95.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(133, 62, 3448, NULL, 1, 85.00, 100.00, 0.00, NULL, 0.00, 100.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(134, 62, 3449, NULL, 1, 20.77, 25.00, 0.00, NULL, 0.00, 25.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(135, 62, 3450, NULL, 1, 100.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(136, 62, 3453, NULL, 1, 1400.00, 1450.00, 0.00, NULL, 0.00, 1450.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(137, 62, 3455, NULL, 1, 75.00, 80.00, 0.00, NULL, 0.00, 80.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(138, 62, 3451, NULL, 1, 95.00, 110.00, 0.00, NULL, 0.00, 110.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(139, 62, 3452, NULL, 1, 110.00, 130.00, 0.00, NULL, 0.00, 130.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(140, 62, 3454, NULL, 5, 70.00, 75.00, 0.00, NULL, 0.00, 375.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(141, 62, 3456, NULL, 1, 400.00, 430.00, 0.00, NULL, 0.00, 430.00, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1),
(142, 62, 3457, NULL, 0.25, 850.00, 950.00, 0.00, NULL, 0.00, 237.50, 'no', 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturn`
--

CREATE TABLE `tbl_salereturn` (
  `SaleReturn_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SaleReturn_ReturnDate` date NOT NULL,
  `SaleReturn_ReturnAmount` decimal(18,2) NOT NULL,
  `SaleReturn_Description` varchar(300) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturn_brunchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salereturndetails`
--

CREATE TABLE `tbl_salereturndetails` (
  `SaleReturnDetails_SlNo` int(11) NOT NULL,
  `SaleReturn_IdNo` int(11) NOT NULL,
  `exp_date` date DEFAULT NULL,
  `SaleReturnDetailsProduct_SlNo` int(11) NOT NULL,
  `SaleReturnDetails_ReturnQuantity` float NOT NULL,
  `SaleReturnDetails_ReturnAmount` decimal(18,2) NOT NULL,
  `Status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleReturnDetails_brunchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_salesmaster`
--

CREATE TABLE `tbl_salesmaster` (
  `SaleMaster_SlNo` int(11) NOT NULL,
  `SaleMaster_InvoiceNo` varchar(50) NOT NULL,
  `SalseCustomer_IDNo` int(11) DEFAULT NULL,
  `customerType` varchar(20) NOT NULL,
  `customerName` varchar(191) DEFAULT NULL,
  `customerMobile` varchar(15) DEFAULT NULL,
  `customerAddress` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `SaleMaster_SaleDate` date NOT NULL,
  `SaleMaster_Description` longtext DEFAULT NULL,
  `SaleMaster_SaleType` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'Cash',
  `bank_id` int(11) DEFAULT NULL,
  `SaleMaster_SubTotalAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_TotalDiscountAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pointAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_TaxAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_Freight` decimal(18,2) DEFAULT 0.00,
  `SaleMaster_TotalSaleAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_cashPaid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_bankPaid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_PaidAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `returnAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_DueAmount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `SaleMaster_Previous_Due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `point` float NOT NULL DEFAULT 0,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `is_service` varchar(10) NOT NULL DEFAULT 'false',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `SaleMaster_branchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_salesmaster`
--

INSERT INTO `tbl_salesmaster` (`SaleMaster_SlNo`, `SaleMaster_InvoiceNo`, `SalseCustomer_IDNo`, `customerType`, `customerName`, `customerMobile`, `customerAddress`, `employee_id`, `SaleMaster_SaleDate`, `SaleMaster_Description`, `SaleMaster_SaleType`, `payment_type`, `bank_id`, `SaleMaster_SubTotalAmount`, `SaleMaster_TotalDiscountAmount`, `pointAmount`, `SaleMaster_TaxAmount`, `SaleMaster_Freight`, `SaleMaster_TotalSaleAmount`, `SaleMaster_cashPaid`, `SaleMaster_bankPaid`, `SaleMaster_PaidAmount`, `returnAmount`, `SaleMaster_DueAmount`, `SaleMaster_Previous_Due`, `point`, `Status`, `is_service`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `SaleMaster_branchid`) VALUES
(1, '250100001', 1, 'retail', NULL, NULL, NULL, NULL, '2025-07-19', '', 'retail', 'Cash', NULL, 220.00, 0.00, 0.00, 0.00, 0.00, 220.00, 250.00, 0.00, 250.00, 30.00, 0.00, 0.00, 2, 'a', 'false', 'Admin', '2025-07-19 10:33:45', NULL, NULL, 1),
(2, '250100002', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-19', '', 'retail', 'Cash', NULL, 220.00, 0.00, 0.00, 0.00, 0.00, 220.00, 250.00, 0.00, 250.00, 30.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-19 11:08:15', NULL, NULL, 1),
(3, '250100003', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-19', '', 'retail', 'Cash', NULL, 60.00, 0.00, 0.00, 0.00, 0.00, 60.00, 60.00, 0.00, 60.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-19 12:22:49', NULL, NULL, 1),
(4, '250100004', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-19', '', 'retail', 'Cash', NULL, 60.00, 0.00, 0.00, 0.00, 0.00, 60.00, 100.00, 0.00, 100.00, 40.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-19 12:23:21', NULL, NULL, 1),
(5, '250100005', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-19', '', 'retail', 'Cash', NULL, 110.00, 0.00, 0.00, 0.00, 0.00, 110.00, 200.00, 0.00, 200.00, 90.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-19 13:16:23', NULL, NULL, 1),
(6, '250100006', 1, 'retail', NULL, NULL, NULL, NULL, '2025-07-19', '', 'retail', 'Cash', NULL, 330.00, 0.00, 0.00, 0.00, 0.00, 330.00, 330.00, 0.00, 330.00, 0.00, 0.00, -30.00, 3, 'a', 'false', 'Admin', '2025-07-19 15:08:26', NULL, NULL, 1),
(7, '250100007', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-20', '', 'retail', 'Cash', NULL, 650.00, 0.00, 0.00, 0.00, 0.00, 650.00, 1000.00, 0.00, 1000.00, 350.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-20 16:57:46', NULL, NULL, 1),
(8, '250100008', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-20', '', 'retail', 'Cash', NULL, 680.00, 0.00, 0.00, 0.00, 0.00, 680.00, 680.00, 0.00, 680.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-20 17:05:44', NULL, NULL, 1),
(9, '250100009', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-20', '', 'retail', 'Cash', NULL, 1880.00, 0.00, 0.00, 0.00, 0.00, 1880.00, 2000.00, 0.00, 2000.00, 120.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-20 17:14:46', NULL, NULL, 1),
(10, '250100010', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-20', '', 'retail', 'Cash', NULL, 3210.00, 0.00, 0.00, 0.00, 0.00, 3210.00, 3210.00, 0.00, 3210.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-20 17:38:06', NULL, NULL, 1),
(11, '250100011', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-20', '', 'retail', 'Cash', 0, 130.00, 0.00, 0.00, 0.00, 0.00, 130.00, 130.00, 130.00, 260.00, 130.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-20 17:54:13', NULL, NULL, 1),
(12, '250100012', 1, 'retail', NULL, NULL, NULL, NULL, '2025-07-20', '', 'retail', 'Cash', 0, 130.00, 0.00, 0.00, 0.00, 0.00, 130.00, 0.00, 130.00, 130.00, 0.00, 130.00, -30.00, 1, 'a', 'false', 'Admin', '2025-07-20 17:57:46', NULL, NULL, 1),
(13, '250100013', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-20', '', 'retail', 'Cash', NULL, 130.00, 0.00, 0.00, 0.00, 0.00, 130.00, 130.00, 0.00, 130.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-20 18:14:07', NULL, NULL, 1),
(14, '250100014', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 5800.00, 0.00, 0.00, 0.00, 0.00, 5800.00, 6000.00, 0.00, 6000.00, 200.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-31 16:51:53', NULL, NULL, 1),
(15, '250100015', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 3535.00, 0.00, 0.00, 0.00, 0.00, 3535.00, 3600.00, 0.00, 3600.00, 65.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-31 16:58:07', NULL, NULL, 1),
(16, '250100016', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 4040.00, 0.00, 0.00, 0.00, 0.00, 4040.00, 4200.00, 0.00, 4200.00, 160.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-31 17:36:03', NULL, NULL, 1),
(17, '250100017', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 1525.00, 0.00, 0.00, 0.00, 0.00, 1525.00, 1525.00, 0.00, 1525.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-31 17:46:50', NULL, NULL, 1),
(18, '250100018', 2, 'retail', NULL, NULL, NULL, NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 18455.00, 0.00, 0.00, 0.00, 0.00, 18455.00, 18455.00, 0.00, 18455.00, 0.00, 0.00, 0.00, 246, 'a', 'false', 'Admin', '2025-07-31 17:51:21', NULL, NULL, 1),
(19, '250100019', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 7200.00, 0.00, 0.00, 0.00, 0.00, 7200.00, 7200.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-31 17:52:24', NULL, NULL, 1),
(20, '250100020', NULL, 'G', 'General Customer', '', '', NULL, '2025-07-31', '', 'retail', 'Cash', NULL, 11105.00, 0.00, 0.00, 0.00, 0.00, 11105.00, 11105.00, 0.00, 11105.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-07-31 17:57:38', NULL, NULL, 1),
(21, '250100021', 2, 'retail', NULL, NULL, NULL, NULL, '2025-08-02', '', 'retail', 'Cash', 0, 110.00, 0.00, 0.00, 0.00, 0.00, 110.00, 0.00, 110.00, 110.00, 0.00, 110.00, 0.00, 1, 'a', 'false', 'Admin', '2025-08-02 16:21:28', NULL, NULL, 1),
(25, '250100022', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', NULL, 375.00, 0.00, 0.00, 0.00, 0.00, 375.00, 375.00, 0.00, 375.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 16:55:36', NULL, NULL, 1),
(28, '250100023', 1, 'retail', NULL, NULL, NULL, NULL, '2025-08-02', '', 'retail', 'Cash', 0, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 75.00, 75.00, 0.00, 75.00, -30.00, 0, 'a', 'false', 'Admin', '2025-08-02 16:57:24', NULL, NULL, 1),
(29, '250100024', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', NULL, 1450.00, 0.00, 0.00, 0.00, 0.00, 1450.00, 1450.00, 0.00, 1450.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 17:17:08', NULL, NULL, 1),
(30, '250100025', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', NULL, 130.00, 0.00, 0.00, 0.00, 0.00, 130.00, 130.00, 0.00, 130.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 17:17:46', NULL, NULL, 1),
(31, '250100026', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 17:27:20', NULL, NULL, 1),
(32, '250100027', 2, 'retail', NULL, NULL, NULL, NULL, '2025-08-02', '', 'retail', 'Cash', 0, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 1, 'a', 'false', 'Admin', '2025-08-02 18:16:44', NULL, NULL, 1),
(33, '250100028', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 18:41:57', NULL, NULL, 1),
(34, '250100029', 2, 'retail', NULL, NULL, NULL, NULL, '2025-08-02', '', 'retail', 'Cash', 0, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 1, 'a', 'false', 'Admin', '2025-08-02 18:43:38', NULL, NULL, 1),
(35, '250100030', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', 0, 220.00, 0.00, 0.00, 0.00, 0.00, 220.00, 0.00, 220.00, 220.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 18:48:22', NULL, NULL, 1),
(36, '250100031', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', 0, 630.00, 0.00, 0.00, 0.00, 0.00, 630.00, 608.00, 22.00, 630.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 18:54:33', NULL, NULL, 1),
(37, '250100032', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', 0, 1525.00, 0.00, 0.00, 0.00, 0.00, 1525.00, 25.00, 1500.00, 1525.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 19:22:20', NULL, NULL, 1),
(38, '250100033', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', 0, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 75.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 19:22:50', NULL, NULL, 1),
(39, '250100034', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 19:33:37', NULL, NULL, 1),
(40, '250100035', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-02', '', 'retail', 'Cash', 0, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-02 19:42:30', NULL, NULL, 1),
(41, '250100036', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 75.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 16:35:47', NULL, NULL, 1),
(42, '250100037', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:01:12', NULL, NULL, 1),
(43, '250100038', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:24:27', NULL, NULL, 1),
(44, '250100039', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:26:33', NULL, NULL, 1),
(45, '250100040', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:30:14', NULL, NULL, 1),
(46, '250100041', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 2900.00, 0.00, 0.00, 0.00, 0.00, 2900.00, 1450.00, 1450.00, 2900.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:33:50', NULL, NULL, 1),
(47, '250100042', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:49:35', NULL, NULL, 1),
(48, '250100043', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 18:50:12', NULL, NULL, 1),
(49, '250100044', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 19:00:28', NULL, NULL, 1),
(50, '250100045', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', NULL, 130.00, 0.00, 0.00, 0.00, 0.00, 130.00, 130.00, 0.00, 130.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 19:10:14', NULL, NULL, 1),
(51, '250100046', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', NULL, 110.00, 0.00, 0.00, 0.00, 0.00, 110.00, 110.00, 0.00, 110.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 19:17:20', NULL, NULL, 1),
(52, '250100047', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-03', '', 'retail', 'Cash', NULL, 110.00, 0.00, 0.00, 0.00, 0.00, 110.00, 110.00, 0.00, 110.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-03 19:25:59', NULL, NULL, 1),
(53, '250100048', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-04', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-04 17:07:37', NULL, NULL, 1),
(54, '250100049', 1, 'retail', NULL, NULL, NULL, NULL, '2025-08-04', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 1, 'a', 'false', 'Admin', '2025-08-04 17:17:14', NULL, NULL, 1),
(55, '250100050', 1, 'retail', NULL, NULL, NULL, NULL, '2025-08-04', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 1, 'a', 'false', 'Admin', '2025-08-04 17:32:26', NULL, NULL, 1),
(56, '250100051', 1, 'retail', NULL, NULL, NULL, NULL, '2025-08-04', '', 'retail', 'Cash', 0, 150.00, 0.00, 0.00, 0.00, 0.00, 150.00, 75.00, 75.00, 150.00, 0.00, 0.00, 0.00, 1, 'a', 'false', 'Admin', '2025-08-04 17:38:01', NULL, NULL, 1),
(57, '250100052', 2, 'retail', NULL, NULL, NULL, NULL, '2025-08-04', '', 'retail', 'Cash', 0, 2900.00, 0.00, 0.00, 0.00, 0.00, 2900.00, 1450.00, 1450.00, 2900.00, 0.00, 0.00, 0.00, 38, 'a', 'false', 'Admin', '2025-08-04 17:39:21', NULL, NULL, 1),
(58, '250100053', 2, 'retail', NULL, NULL, NULL, NULL, '2025-08-04', '', 'retail', 'Cash', 0, 2900.00, 0.00, 0.00, 0.00, 0.00, 2900.00, 1450.00, 1450.00, 2900.00, 0.00, 0.00, 0.00, 38, 'a', 'false', 'Admin', '2025-08-04 17:51:56', NULL, NULL, 1),
(59, '250100054', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-04', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-04 17:57:45', NULL, NULL, 1),
(60, '250100055', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-04', '', 'retail', 'Cash', NULL, 75.00, 0.00, 0.00, 0.00, 0.00, 75.00, 75.00, 0.00, 75.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-04 18:22:46', NULL, NULL, 1),
(61, '250100056', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-06', '', 'retail', 'Cash', 0, 100.00, 0.00, 0.00, 0.00, 0.00, 100.00, 50.00, 50.00, 100.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-06 14:55:44', NULL, NULL, 1),
(62, '250100057', NULL, 'G', 'General Customer', '', '', NULL, '2025-08-06', '', 'retail', 'Cash', 0, 4242.50, 0.50, 0.00, 0.00, 0.00, 4242.00, 42.00, 4200.00, 4242.00, 0.00, 0.00, 0.00, 0, 'a', 'false', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_bank`
--

CREATE TABLE `tbl_sales_bank` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `last_digit` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(191) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `branchId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sales_bank`
--

INSERT INTO `tbl_sales_bank` (`id`, `sale_id`, `bank_id`, `last_digit`, `amount`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `branchId`) VALUES
(1, 11, 2, 4321, 130, 'a', 'Admin', '2025-07-20 17:54:13', NULL, NULL, 1),
(2, 12, 2, 4321, 130, 'a', 'Admin', '2025-07-20 17:57:46', NULL, NULL, 1),
(3, 21, 1, 1234, 110, 'a', 'Admin', '2025-08-02 16:21:28', NULL, NULL, 1),
(4, 28, 1, 0, 75, 'a', 'Admin', '2025-08-02 16:57:24', NULL, NULL, 1),
(5, 32, 2, 2321, 75, 'a', 'Admin', '2025-08-02 18:16:44', NULL, NULL, 1),
(6, 34, 2, 3211, 75, 'a', 'Admin', '2025-08-02 18:43:38', NULL, NULL, 1),
(7, 35, 2, 220, 220, 'a', 'Admin', '2025-08-02 18:48:22', NULL, NULL, 1),
(8, 36, 1, 1111, 11, 'a', 'Admin', '2025-08-02 18:54:33', NULL, NULL, 1),
(9, 36, 2, 11, 11, 'a', 'Admin', '2025-08-02 18:54:33', NULL, NULL, 1),
(10, 37, 2, 1234, 1500, 'a', 'Admin', '2025-08-02 19:22:20', NULL, NULL, 1),
(11, 38, 1, 4321, 75, 'a', 'Admin', '2025-08-02 19:22:50', NULL, NULL, 1),
(12, 40, 2, 1342, 75, 'a', 'Admin', '2025-08-02 19:42:30', NULL, NULL, 1),
(13, 41, 1, 3222, 75, 'a', 'Admin', '2025-08-03 16:35:47', NULL, NULL, 1),
(14, 42, 2, 5432, 75, 'a', 'Admin', '2025-08-03 18:01:12', NULL, NULL, 1),
(15, 43, 1, 6789, 75, 'a', 'Admin', '2025-08-03 18:24:27', NULL, NULL, 1),
(16, 44, 1, 4233, 75, 'a', 'Admin', '2025-08-03 18:26:33', NULL, NULL, 1),
(17, 45, 2, 5432, 75, 'a', 'Admin', '2025-08-03 18:30:14', NULL, NULL, 1),
(18, 46, 2, 4343, 1450, 'a', 'Admin', '2025-08-03 18:33:50', NULL, NULL, 1),
(19, 47, 1, 3232, 75, 'a', 'Admin', '2025-08-03 18:49:35', NULL, NULL, 1),
(20, 53, 2, 5454, 75, 'a', 'Admin', '2025-08-04 17:07:37', NULL, NULL, 1),
(21, 54, 2, 8765, 75, 'a', 'Admin', '2025-08-04 17:17:14', NULL, NULL, 1),
(22, 55, 1, 4343, 75, 'a', 'Admin', '2025-08-04 17:32:26', NULL, NULL, 1),
(23, 56, 2, 8765, 75, 'a', 'Admin', '2025-08-04 17:38:01', NULL, NULL, 1),
(24, 57, 2, 987, 1450, 'a', 'Admin', '2025-08-04 17:39:21', NULL, NULL, 1),
(25, 58, 2, 8999, 1450, 'a', 'Admin', '2025-08-04 17:51:56', NULL, NULL, 1),
(26, 61, 2, 1234, 50, 'a', 'Admin', '2025-08-06 14:55:44', NULL, NULL, 1),
(27, 62, 2, 4444, 4200, 'a', 'Admin', '2025-08-06 18:02:17', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms`
--

CREATE TABLE `tbl_sms` (
  `row_id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `sms_text` varchar(500) NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `sms_enabled` varchar(50) NOT NULL DEFAULT 'false',
  `api_key` varchar(500) DEFAULT NULL,
  `sms_type` varchar(50) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `bulk_url` varchar(1000) DEFAULT NULL,
  `url_2` varchar(1000) DEFAULT NULL,
  `bulk_url_2` varchar(1000) DEFAULT NULL,
  `sender_id` varchar(200) DEFAULT NULL,
  `sender_id_2` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `sender_name` varchar(200) NOT NULL,
  `sender_phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `Supplier_SlNo` int(11) NOT NULL,
  `Supplier_Code` varchar(50) NOT NULL,
  `Supplier_Name` varchar(150) NOT NULL,
  `Supplier_Type` varchar(50) NOT NULL,
  `Supplier_Phone` varchar(50) NOT NULL,
  `Supplier_Mobile` varchar(15) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL,
  `Supplier_OfficePhone` varchar(50) NOT NULL,
  `Supplier_Address` varchar(300) NOT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `District_SlNo` int(11) NOT NULL,
  `Country_SlNo` int(11) NOT NULL,
  `Supplier_Web` varchar(150) NOT NULL,
  `previous_due` decimal(18,2) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT 'a',
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Supplier_brinchid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`Supplier_SlNo`, `Supplier_Code`, `Supplier_Name`, `Supplier_Type`, `Supplier_Phone`, `Supplier_Mobile`, `Supplier_Email`, `Supplier_OfficePhone`, `Supplier_Address`, `contact_person`, `District_SlNo`, `Country_SlNo`, `Supplier_Web`, `previous_due`, `image_name`, `Status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Supplier_brinchid`) VALUES
(1, 'S00001', 'raju', '', '', '54321', '', '', 'modern para', 'ehtesam enterprize (DIP)', 0, 0, '', 0.00, NULL, 'a', 'Admin', '2025-08-02 19:30:50', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payment`
--

CREATE TABLE `tbl_supplier_payment` (
  `SPayment_id` int(11) NOT NULL,
  `SPayment_date` date DEFAULT NULL,
  `SPayment_invoice` varchar(20) DEFAULT NULL,
  `SPayment_customerID` varchar(20) DEFAULT NULL,
  `SPayment_TransactionType` varchar(25) DEFAULT NULL,
  `SPayment_amount` decimal(18,2) DEFAULT NULL,
  `SPayment_Paymentby` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `SPayment_notes` varchar(225) DEFAULT NULL,
  `SPayment_brunchid` int(11) DEFAULT NULL,
  `SPayment_status` varchar(2) DEFAULT NULL,
  `SPayment_Addby` varchar(100) DEFAULT NULL,
  `SPayment_AddDAte` date DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `SPayment_UpdateDAte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supplier_payment`
--

INSERT INTO `tbl_supplier_payment` (`SPayment_id`, `SPayment_date`, `SPayment_invoice`, `SPayment_customerID`, `SPayment_TransactionType`, `SPayment_amount`, `SPayment_Paymentby`, `account_id`, `SPayment_notes`, `SPayment_brunchid`, `SPayment_status`, `SPayment_Addby`, `SPayment_AddDAte`, `update_by`, `SPayment_UpdateDAte`) VALUES
(1, '2025-08-02', 'TR00001', '1', 'CP', 5000.00, 'cash', NULL, '', 1, 'a', 'Admin', '2025-08-02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transferdetails`
--

CREATE TABLE `tbl_transferdetails` (
  `transferdetails_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `purchase_rate` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` varchar(1) NOT NULL DEFAULT 'p',
  `added_by` int(11) DEFAULT NULL,
  `added_datetime` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfermaster`
--

CREATE TABLE `tbl_transfermaster` (
  `transfer_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL,
  `transfer_by` int(11) NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `note` varchar(500) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'p',
  `added_by` int(11) NOT NULL,
  `added_datetime` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `receivedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `Unit_SlNo` int(11) NOT NULL,
  `Unit_Name` varchar(150) NOT NULL,
  `status` char(1) NOT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`Unit_SlNo`, `Unit_Name`, `status`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`) VALUES
(1, 'Pcs', 'a', 'Admin', '2025-04-23 10:55:25', 'Admin', '2025-07-31 17:00:21'),
(2, 'Box', 'a', 'Admin', '2025-04-23 10:55:29', 'Admin', '2025-07-31 17:00:30'),
(3, 'BOTOL', 'd', 'Admin', '2025-04-23 10:55:33', NULL, NULL),
(4, 'Ltr', 'a', 'Admin', '2025-04-23 10:55:37', 'Admin', '2025-07-31 17:00:48'),
(5, 'Set', 'a', 'Admin', '2025-04-23 10:55:41', 'Admin', '2025-07-31 17:01:20'),
(6, 'Kg', 'a', 'Admin', '2025-05-19 13:21:45', 'Admin', '2025-07-31 17:01:47'),
(7, 'PAC', 'd', 'Admin', '2025-06-03 20:07:15', 'Admin', '2025-07-20 17:17:15'),
(8, 'Tin', 'a', 'Admin', '2025-07-13 11:10:00', 'Admin', '2025-07-31 17:01:33'),
(9, 'Bottle', 'a', 'Admin', '2025-07-31 16:59:56', NULL, NULL),
(10, 'Packet', 'a', 'Admin', '2025-07-31 17:02:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `User_SlNo` int(11) NOT NULL,
  `User_ID` varchar(50) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `User_Name` varchar(150) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `userBrunch_id` int(11) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'a',
  `verifycode` int(11) NOT NULL,
  `image_name` varchar(1000) DEFAULT NULL,
  `AddBy` varchar(50) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `Brunch_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`User_SlNo`, `User_ID`, `FullName`, `User_Name`, `UserEmail`, `userBrunch_id`, `User_Password`, `UserType`, `status`, `verifycode`, `image_name`, `AddBy`, `AddTime`, `UpdateBy`, `UpdateTime`, `Brunch_ID`) VALUES
(1, 'U0001', 'Admin', 'admin', 'admin@host.com', 1, 'c4ca4238a0b923820dcc509a6f75849b', 'm', 'a', 1, 'uploads/users/Admin_6890a5e10780e.png', NULL, '2023-07-26 18:01:19', NULL, NULL, 1),
(2, 'U0002', 'shamim', 'shamim', 'shamim@gmail.com', 1, 'c81e728d9d4c2f636f067f89cc14862c', 'u', 'a', 0, NULL, '1', '2025-07-19 07:44:50', '1', '2025-07-19 07:45:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_access`
--

CREATE TABLE `tbl_user_access` (
  `access_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `access` text NOT NULL,
  `saved_by` int(11) NOT NULL,
  `saved_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_access`
--

INSERT INTO `tbl_user_access` (`access_id`, `user_id`, `access`, `saved_by`, `saved_datetime`) VALUES
(1, 2, '[\"sales\\/product\",\"salesReturn\",\"salesrecord\",\"exchange\",\"product\",\"productlist\",\"damageEntry\",\"damageList\"]', 1, '2025-07-19 01:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_activity`
--

CREATE TABLE `tbl_user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'a',
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_activity`
--

INSERT INTO `tbl_user_activity` (`id`, `user_id`, `ip_address`, `login_time`, `logout_time`, `status`, `branch_id`) VALUES
(1, 1, '::1', '2025-07-17 13:13:33', NULL, 'a', 1),
(2, 1, '103.198.133.214', '2025-07-17 13:53:49', NULL, 'a', 1),
(3, 1, '103.198.133.214', '2025-07-17 13:53:49', NULL, 'a', 1),
(4, 1, '103.198.133.214', '2025-07-17 13:54:47', NULL, 'a', 1),
(5, 1, '43.250.80.230', '2025-07-18 12:20:33', NULL, 'a', 1),
(6, 1, '27.147.200.99', '2025-07-19 07:36:14', '2025-07-19 07:46:35', 'a', 1),
(7, 2, '27.147.200.99', '2025-07-19 07:46:46', '2025-07-19 07:48:25', 'a', 1),
(8, 1, '27.147.200.99', '2025-07-19 07:48:37', '2025-07-19 08:24:51', 'a', 1),
(9, 1, '27.147.200.99', '2025-07-19 08:25:08', NULL, 'a', 1),
(10, 1, '103.198.133.214', '2025-07-19 10:29:34', NULL, 'a', 1),
(11, 1, '27.147.200.99', '2025-07-20 16:51:00', '2025-07-20 18:01:18', 'a', 1),
(12, 1, '103.198.133.214', '2025-07-20 17:11:24', NULL, 'a', 1),
(13, 1, '27.147.200.99', '2025-07-20 18:04:53', NULL, 'a', 1),
(14, 1, '118.179.106.141', '2025-07-24 00:53:32', '2025-07-24 00:53:37', 'a', 1),
(15, 1, '118.179.106.141', '2025-07-24 00:53:47', NULL, 'a', 1),
(16, 1, '103.198.133.213', '2025-07-26 17:54:27', NULL, 'a', 1),
(17, 1, '103.198.133.213', '2025-07-26 17:56:24', NULL, 'a', 1),
(18, 1, '27.147.200.99', '2025-07-31 16:47:37', '2025-07-31 18:47:30', 'a', 1),
(19, 1, '103.198.133.212', '2025-07-31 17:39:38', NULL, 'a', 1),
(20, 1, '27.147.200.99', '2025-08-02 16:02:29', '2025-08-02 19:52:48', 'a', 1),
(21, 1, '103.198.133.212', '2025-08-02 16:03:53', NULL, 'a', 1),
(22, 1, '103.198.133.212', '2025-08-02 16:09:19', NULL, 'a', 1),
(23, 1, '103.198.133.212', '2025-08-02 17:50:59', NULL, 'a', 1),
(24, 1, '43.250.80.230', '2025-08-02 17:56:52', NULL, 'a', 1),
(25, 1, '103.198.133.212', '2025-08-03 11:04:25', NULL, 'a', 1),
(26, 1, '27.147.200.99', '2025-08-03 16:35:17', '2025-08-03 19:27:19', 'a', 1),
(27, 1, '202.134.11.233', '2025-08-03 18:26:15', NULL, 'a', 1),
(28, 1, '103.198.133.214', '2025-08-04 16:38:26', NULL, 'a', 1),
(29, 1, '27.147.200.99', '2025-08-04 17:06:19', '2025-08-04 17:06:36', 'a', 1),
(30, 1, '27.147.200.99', '2025-08-04 17:07:06', '2025-08-04 18:17:32', 'a', 1),
(31, 1, '103.198.133.214', '2025-08-04 17:11:12', NULL, 'a', 1),
(32, 1, '27.147.200.99', '2025-08-04 18:18:05', '2025-08-04 18:20:53', 'a', 1),
(33, 1, '27.147.200.99', '2025-08-04 18:21:05', '2025-08-04 18:49:33', 'a', 1),
(34, 1, '27.147.200.99', '2025-08-04 18:49:50', '2025-08-04 19:49:43', 'a', 1),
(35, 1, '59.153.100.209', '2025-08-05 12:52:14', '2025-08-05 13:05:57', 'a', 1),
(36, 1, '103.151.171.108', '2025-08-06 14:54:56', NULL, 'a', 1),
(37, 1, '27.147.200.99', '2025-08-06 17:12:38', '2025-08-06 18:21:29', 'a', 1),
(38, 1, '103.198.133.213', '2025-08-07 11:09:55', NULL, 'a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  ADD PRIMARY KEY (`as_id`),
  ADD KEY `as_date` (`as_date`),
  ADD KEY `status` (`status`),
  ADD KEY `branchid` (`branchid`);

--
-- Indexes for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_SiNo`),
  ADD KEY `ProductCategory_SlNo` (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `brand_branchid` (`brand_branchid`);

--
-- Indexes for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  ADD PRIMARY KEY (`brunch_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  ADD PRIMARY KEY (`Tr_SlNo`),
  ADD KEY `Tr_SlNo` (`Tr_SlNo`),
  ADD KEY `Tr_Id` (`Tr_Id`),
  ADD KEY `Tr_date` (`Tr_date`),
  ADD KEY `Tr_Type` (`Tr_Type`),
  ADD KEY `Acc_SlID` (`Acc_SlID`),
  ADD KEY `status` (`status`),
  ADD KEY `Tr_branchid` (`Tr_branchid`);

--
-- Indexes for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `SM_id` (`SM_id`),
  ADD KEY `date` (`date`),
  ADD KEY `remid_date` (`remid_date`),
  ADD KEY `check_status` (`check_status`),
  ADD KEY `status` (`status`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`color_SiNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`Company_SlNo`),
  ADD KEY `Invoice_Type` (`Invoice_Type`),
  ADD KEY `print_type` (`print_type`),
  ADD KEY `company_BrunchId` (`company_BrunchId`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`Country_SlNo`),
  ADD KEY `Status` (`Status`);

--
-- Indexes for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transfer_from_quantity` (`transfer_from_quantity`),
  ADD KEY `transfer_to_quantity` (`transfer_to_quantity`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Customer_SlNo`),
  ADD KEY `Customer_Code` (`Customer_Code`),
  ADD KEY `Customer_Mobile` (`Customer_Mobile`),
  ADD KEY `Customer_Type` (`Customer_Type`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `area_ID` (`area_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Customer_brunchid` (`Customer_brunchid`);

--
-- Indexes for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  ADD PRIMARY KEY (`CPayment_id`),
  ADD KEY `CPayment_date` (`CPayment_date`),
  ADD KEY `CPayment_invoice` (`CPayment_invoice`),
  ADD KEY `CPayment_customerID` (`CPayment_customerID`),
  ADD KEY `CPayment_TransactionType` (`CPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `CPayment_brunchid` (`CPayment_brunchid`),
  ADD KEY `CPayment_status` (`CPayment_status`);

--
-- Indexes for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  ADD PRIMARY KEY (`Damage_SlNo`),
  ADD KEY `Damage_InvoiceNo` (`Damage_InvoiceNo`),
  ADD KEY `Damage_Date` (`Damage_Date`),
  ADD KEY `status` (`status`),
  ADD KEY `Damage_brunchid` (`Damage_brunchid`);

--
-- Indexes for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  ADD PRIMARY KEY (`DamageDetails_SlNo`),
  ADD KEY `Damage_SlNo` (`Damage_SlNo`),
  ADD KEY `Product_SlNo` (`Product_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`Department_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`Designation_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`District_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`Employee_SlNo`),
  ADD KEY `Designation_ID` (`Designation_ID`),
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Employee_brinchid` (`Employee_brinchid`);

--
-- Indexes for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_date` (`payment_date`),
  ADD KEY `month_id` (`month_id`),
  ADD KEY `status` (`status`),
  ADD KEY `paymentBranch_id` (`branch_id`),
  ADD KEY `saved_by` (`saved_by`);

--
-- Indexes for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `payment_id` (`payment_id`) USING BTREE,
  ADD KEY `employee_id` (`employee_id`) USING BTREE,
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_exchange`
--
ALTER TABLE `tbl_exchange`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_exchange_detail`
--
ALTER TABLE `tbl_exchange_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  ADD PRIMARY KEY (`Acc_SlNo`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `Acc_Code` (`Acc_Code`) USING BTREE;

--
-- Indexes for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE,
  ADD KEY `account_id` (`account_id`) USING BTREE;

--
-- Indexes for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `save_date` (`save_date`),
  ADD KEY `branch_id` (`branch_id`) USING BTREE,
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `transaction_date` (`transaction_date`),
  ADD KEY `transaction_type` (`transaction_type`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `status` (`status`),
  ADD KEY `saved_by` (`saved_by`) USING BTREE;

--
-- Indexes for table `tbl_month`
--
ALTER TABLE `tbl_month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`Product_SlNo`),
  ADD UNIQUE KEY `Product_Code` (`Product_Code`),
  ADD KEY `ProductCategory_ID` (`ProductCategory_ID`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `Unit_ID` (`Unit_ID`),
  ADD KEY `status` (`status`),
  ADD KEY `Product_branchid` (`Product_branchid`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`ProductCategory_SlNo`),
  ADD KEY `status` (`status`),
  ADD KEY `category_branchid` (`category_branchid`);

--
-- Indexes for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  ADD PRIMARY KEY (`PurchaseDetails_SlNo`),
  ADD KEY `PurchaseMaster_IDNo` (`PurchaseMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseDetails_branchID` (`PurchaseDetails_branchID`);

--
-- Indexes for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  ADD PRIMARY KEY (`PurchaseMaster_SlNo`),
  ADD KEY `Supplier_SlNo` (`Supplier_SlNo`),
  ADD KEY `Employee_SlNo` (`Employee_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `PurchaseMaster_OrderDate` (`PurchaseMaster_OrderDate`),
  ADD KEY `status` (`status`),
  ADD KEY `PurchaseMaster_BranchID` (`PurchaseMaster_BranchID`);

--
-- Indexes for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  ADD PRIMARY KEY (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseMaster_InvoiceNo` (`PurchaseMaster_InvoiceNo`),
  ADD KEY `Supplier_IDdNo` (`Supplier_IDdNo`),
  ADD KEY `PurchaseReturn_ReturnDate` (`PurchaseReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturn_brunchID` (`PurchaseReturn_brunchID`);

--
-- Indexes for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  ADD PRIMARY KEY (`PurchaseReturnDetails_SlNo`),
  ADD KEY `PurchaseReturn_SlNo` (`PurchaseReturn_SlNo`),
  ADD KEY `PurchaseReturnDetailsProduct_SlNo` (`PurchaseReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `PurchaseReturnDetails_brachid` (`PurchaseReturnDetails_brachid`);

--
-- Indexes for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  ADD PRIMARY KEY (`quotation_customer_id`),
  ADD KEY `quation_customer_branchid` (`quation_customer_branchid`);

--
-- Indexes for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`);

--
-- Indexes for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  ADD PRIMARY KEY (`SaleDetails_SlNo`),
  ADD KEY `SaleMaster_IDNo` (`SaleMaster_IDNo`),
  ADD KEY `Product_IDNo` (`Product_IDNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleDetails_BranchId` (`SaleDetails_BranchId`);

--
-- Indexes for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  ADD PRIMARY KEY (`SaleReturn_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SaleReturn_ReturnDate` (`SaleReturn_ReturnDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturn_brunchId` (`SaleReturn_brunchId`);

--
-- Indexes for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  ADD PRIMARY KEY (`SaleReturnDetails_SlNo`),
  ADD KEY `SaleReturn_IdNo` (`SaleReturn_IdNo`),
  ADD KEY `SaleReturnDetailsProduct_SlNo` (`SaleReturnDetailsProduct_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `SaleReturnDetails_brunchID` (`SaleReturnDetails_brunchID`);

--
-- Indexes for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  ADD PRIMARY KEY (`SaleMaster_SlNo`),
  ADD KEY `SaleMaster_InvoiceNo` (`SaleMaster_InvoiceNo`),
  ADD KEY `SalseCustomer_IDNo` (`SalseCustomer_IDNo`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `SaleMaster_SaleDate` (`SaleMaster_SaleDate`),
  ADD KEY `Status` (`Status`),
  ADD KEY `is_service` (`is_service`),
  ADD KEY `SaleMaster_branchid` (`SaleMaster_branchid`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `tbl_sales_bank`
--
ALTER TABLE `tbl_sales_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`Supplier_SlNo`),
  ADD KEY `Supplier_Code` (`Supplier_Code`),
  ADD KEY `Supplier_Mobile` (`Supplier_Mobile`),
  ADD KEY `District_SlNo` (`District_SlNo`),
  ADD KEY `Country_SlNo` (`Country_SlNo`),
  ADD KEY `Status` (`Status`),
  ADD KEY `Supplier_brinchid` (`Supplier_brinchid`);

--
-- Indexes for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  ADD PRIMARY KEY (`SPayment_id`),
  ADD KEY `SPayment_date` (`SPayment_date`),
  ADD KEY `SPayment_invoice` (`SPayment_invoice`),
  ADD KEY `SPayment_customerID` (`SPayment_customerID`),
  ADD KEY `SPayment_TransactionType` (`SPayment_TransactionType`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `SPayment_brunchid` (`SPayment_brunchid`),
  ADD KEY `SPayment_status` (`SPayment_status`);

--
-- Indexes for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  ADD PRIMARY KEY (`transferdetails_id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `transfer_date` (`transfer_date`),
  ADD KEY `transfer_from` (`transfer_from`),
  ADD KEY `transfer_to` (`transfer_to`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`Unit_SlNo`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`User_SlNo`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `User_Name` (`User_Name`),
  ADD KEY `User_Password` (`User_Password`),
  ADD KEY `UserType` (`UserType`),
  ADD KEY `status` (`status`),
  ADD KEY `Brunch_ID` (`Brunch_ID`);

--
-- Indexes for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  ADD PRIMARY KEY (`access_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_assets`
--
ALTER TABLE `tbl_assets`
  MODIFY `as_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bank_accounts`
--
ALTER TABLE `tbl_bank_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_bank_transactions`
--
ALTER TABLE `tbl_bank_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_brunch`
--
ALTER TABLE `tbl_brunch`
  MODIFY `brunch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cashtransaction`
--
ALTER TABLE `tbl_cashtransaction`
  MODIFY `Tr_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_checks`
--
ALTER TABLE `tbl_checks`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `color_SiNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `Company_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `Country_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_currentinventory`
--
ALTER TABLE `tbl_currentinventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Customer_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_customer_payment`
--
ALTER TABLE `tbl_customer_payment`
  MODIFY `CPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_damage`
--
ALTER TABLE `tbl_damage`
  MODIFY `Damage_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_damagedetails`
--
ALTER TABLE `tbl_damagedetails`
  MODIFY `DamageDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `Department_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `Designation_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `District_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `Employee_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employee_payment`
--
ALTER TABLE `tbl_employee_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employee_payment_details`
--
ALTER TABLE `tbl_employee_payment_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_exchange`
--
ALTER TABLE `tbl_exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_exchange_detail`
--
ALTER TABLE `tbl_exchange_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_investment_account`
--
ALTER TABLE `tbl_investment_account`
  MODIFY `Acc_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_investment_transactions`
--
ALTER TABLE `tbl_investment_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_loan_accounts`
--
ALTER TABLE `tbl_loan_accounts`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_loan_transactions`
--
ALTER TABLE `tbl_loan_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_month`
--
ALTER TABLE `tbl_month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `Product_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3458;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `ProductCategory_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tbl_purchasedetails`
--
ALTER TABLE `tbl_purchasedetails`
  MODIFY `PurchaseDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_purchasemaster`
--
ALTER TABLE `tbl_purchasemaster`
  MODIFY `PurchaseMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_purchasereturn`
--
ALTER TABLE `tbl_purchasereturn`
  MODIFY `PurchaseReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchasereturndetails`
--
ALTER TABLE `tbl_purchasereturndetails`
  MODIFY `PurchaseReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotaion_customer`
--
ALTER TABLE `tbl_quotaion_customer`
  MODIFY `quotation_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_details`
--
ALTER TABLE `tbl_quotation_details`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quotation_master`
--
ALTER TABLE `tbl_quotation_master`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_saledetails`
--
ALTER TABLE `tbl_saledetails`
  MODIFY `SaleDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `tbl_salereturn`
--
ALTER TABLE `tbl_salereturn`
  MODIFY `SaleReturn_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_salereturndetails`
--
ALTER TABLE `tbl_salereturndetails`
  MODIFY `SaleReturnDetails_SlNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_salesmaster`
--
ALTER TABLE `tbl_salesmaster`
  MODIFY `SaleMaster_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `tbl_sales_bank`
--
ALTER TABLE `tbl_sales_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_sms`
--
ALTER TABLE `tbl_sms`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `Supplier_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_supplier_payment`
--
ALTER TABLE `tbl_supplier_payment`
  MODIFY `SPayment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transferdetails`
--
ALTER TABLE `tbl_transferdetails`
  MODIFY `transferdetails_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transfermaster`
--
ALTER TABLE `tbl_transfermaster`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `Unit_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `User_SlNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_access`
--
ALTER TABLE `tbl_user_access`
  MODIFY `access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user_activity`
--
ALTER TABLE `tbl_user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
