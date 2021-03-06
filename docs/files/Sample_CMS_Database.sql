-- CMS For Organisations
-- Link: https://github.com/K-Kraken/cms-for-organisations
-- --------------------------------------------------------------
-- Name: SQL Dump
-- version 4.9.1
-- Generation Time: Apr 09, 2020 at 09:13 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


DELIMITER $$
--
-- Procedures
--
CREATE PROCEDURE `AddUser` (IN `pLogin` VARCHAR(40), IN `pPassword` VARCHAR(255), IN `pName` VARCHAR(80), IN `pEmail` VARCHAR(255))  BEGIN
	INSERT INTO login (LoginName, PasswordHash, FullName, Email) VALUES(pLogin, SHA(pPassword), pName, pEmail);
END$$

CREATE PROCEDURE `CheckUser` (IN `pUser` VARCHAR(255), IN `pPassword` VARCHAR(255))  BEGIN
	SELECT COUNT(*) as code FROM login WHERE LoginName=pUser && PasswordHash=SHA(pPassword);
END$$

CREATE PROCEDURE `GetUser` (IN `pEmail` VARCHAR(255))  NO SQL
BEGIN
SELECT LoginName as code from login where Email=pEmail;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `regno` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `dept` varchar(40) DEFAULT NULL,
  `year` int(10) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `cert_link` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `isInter` tinyint(1) NOT NULL COMMENT 'True, if its an inter-college event'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `LoginName` varchar(40) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(80) DEFAULT NULL,
  `IsAdmin`	tinyint(1) DEFAULT NULL  COMMENT 'TTrue, if user needs admin privileges'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping default admin user into table `login` 
-- Username: admin
-- Password: admin
--

INSERT INTO `login` (`id`, `LoginName`, `PasswordHash`, `Email`, `FullName`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'test@test.com', 'admin');

-- --------------------------------------------------------

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `LoginName` (`LoginName`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `FullName` (`FullName`);

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

