-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 06:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fk-edusearchaskace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(4) NOT NULL,
  `AdminName` varchar(100) NOT NULL,
  `AdminEmail` varchar(200) NOT NULL,
  `AdminPassword` varchar(300) NOT NULL,
  `AdminContact` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `AdminName`, `AdminEmail`, `AdminPassword`, `AdminContact`) VALUES
(1, 'matt', 'matt@gmail.com', '12', '12346789');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `ComplaintID` int(4) NOT NULL,
  `UserID` int(4) NOT NULL,
  `ExpertID` int(4) NOT NULL,
  `ComplaintType` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`ComplaintID`, `UserID`, `ExpertID`, `ComplaintType`, `Description`, `Timestamp`, `Status`) VALUES
(2, 45, 2000, 'Unsatisfied Expert’s Feedback', 'test', '2023-06-22 04:11:13', 'Resolved');

-- --------------------------------------------------------

--
-- Table structure for table `expert`
--

CREATE TABLE `expert` (
  `ExpertID` int(4) NOT NULL,
  `ExpertName` varchar(200) NOT NULL,
  `ExpertEmail` varchar(200) NOT NULL,
  `ContactInfo` varchar(20) NOT NULL,
  `ExpertProfilePic` varchar(200) NOT NULL,
  `ExpertPassword` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expert`
--

INSERT INTO `expert` (`ExpertID`, `ExpertName`, `ExpertEmail`, `ContactInfo`, `ExpertProfilePic`, `ExpertPassword`) VALUES
(2000, 'NoExpert', 'noemail', '', '', '123'),
(2004, 'Abu', 'Abu@gmail.com', '0135309184', '', '123'),
(2006, 'ali', 'ali@gmail.com', '', '', '12');

-- --------------------------------------------------------

--
-- Table structure for table `expertcv`
--

CREATE TABLE `expertcv` (
  `id` int(11) NOT NULL,
  `ExpertID` int(4) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `filepath` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expertise`
--

CREATE TABLE `expertise` (
  `ExpertiseID` int(4) NOT NULL,
  `ExpertID` int(4) NOT NULL,
  `ExpertArea` varchar(500) NOT NULL,
  `Major` varchar(50) NOT NULL,
  `YearofExpertise` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expertise`
--

INSERT INTO `expertise` (`ExpertiseID`, `ExpertID`, `ExpertArea`, `Major`, `YearofExpertise`) VALUES
(4, 2004, 'MACHINE LEARNING', 'IMAGE', 2),
(5, 2004, 'GRID COMPUTING', '	DISTRIBUTED SYSTEM', 7);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `PostID` int(4) NOT NULL,
  `UserID` int(4) NOT NULL,
  `PostTitle` varchar(100) NOT NULL,
  `PostContent` varchar(1000) NOT NULL,
  `PostStatus` varchar(10) NOT NULL,
  `PostDate` datetime NOT NULL,
  `ExpertID` int(4) DEFAULT NULL,
  `response` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`PostID`, `UserID`, `PostTitle`, `PostContent`, `PostStatus`, `PostDate`, `ExpertID`, `response`) VALUES
(3035, 1002, 'OOP Question', '    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Closed', '2023-06-21 09:49:44', 2006, 'Done'),
(3036, 45, 'Help with Web Engineering', 'fdsfdffsd    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Accepted', '2023-06-21 09:57:06', 2006, 'ALI'),
(3037, 45, 'This is a test post', 'This is to test the functionality of this post feature.', 'Accepted', '2023-06-21 10:47:11', 2006, ''),
(3055, 45, 'Help with ecom', '    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Pending', '2023-06-22 01:58:50', 2000, '');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `PublicationID` int(4) NOT NULL,
  `ExpertID` int(4) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `PbTitle` varchar(100) NOT NULL,
  `PublicationDate` date NOT NULL,
  `TypeofContribution` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`PublicationID`, `ExpertID`, `Type`, `PbTitle`, `PublicationDate`, `TypeofContribution`) VALUES
(2, 2004, 'BOOK', 'Systematic', '2023-06-16', '50%'),
(3, 2004, 'BOOK CHAPTER', 'Multi-objective Functions in Grid Scheduling', '2023-06-13', '50%'),
(4, 2004, 'BOOK', '	Experimental Analysis on Available Bandwidth Estimation Tools for Wireless Mesh Network', '2023-06-27', '50%');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RatingID` int(4) NOT NULL,
  `ExpertID` int(4) NOT NULL,
  `PostID` int(4) NOT NULL,
  `UserID` int(4) NOT NULL,
  `RatingVal` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` int(4) NOT NULL,
  `AdminID` int(4) NOT NULL,
  `ReportType` varchar(100) NOT NULL,
  `NumOfReport` int(10) NOT NULL,
  `ReportStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ReportID`, `AdminID`, `ReportType`, `NumOfReport`, `ReportStatus`) VALUES
(2, 1, 'Issues About The Content', 1, 'On Hold');

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE `research` (
  `researchID` int(4) NOT NULL,
  `ExpertID` int(4) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `research`
--

INSERT INTO `research` (`researchID`, `ExpertID`, `Title`, `Status`) VALUES
(2, 2004, '	A Trust Management Model for Cyber Physical Production System using Deep Learning Technique', 'Done');

-- --------------------------------------------------------

--
-- Table structure for table `useractivity`
--

CREATE TABLE `useractivity` (
  `ActivityID` int(4) NOT NULL,
  `NumOfPost` int(10) NOT NULL,
  `CommentActivity` varchar(100) NOT NULL,
  `LikesActivity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `useractivity`
--

INSERT INTO `useractivity` (`ActivityID`, `NumOfPost`, `CommentActivity`, `LikesActivity`) VALUES
(1, 30, 'The content in the post not related to the main', 43),
(2, 60, 'The content is great. I like it.', 100);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(4) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Phone` varchar(13) NOT NULL,
  `Research` varchar(100) NOT NULL,
  `AcademicStatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Email`, `Password`, `Phone`, `Research`, `AcademicStatus`) VALUES
(45, 'anwar', 'anwar@mail.com', '123', '8524691', 'CompSci', 'Student: Active'),
(1001, 'Muhammad', 'muhammad@gmail.com', '123', '', '', ''),
(1002, 'Deylan', 'deylan@gmail.com', '123456', '01234567', '', ''),
(1005, 'Tester', 'tester@mail.com', '1234', '012345678', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`ComplaintID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ExpertID` (`ExpertID`);

--
-- Indexes for table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`ExpertID`);

--
-- Indexes for table `expertcv`
--
ALTER TABLE `expertcv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ExpertID` (`ExpertID`);

--
-- Indexes for table `expertise`
--
ALTER TABLE `expertise`
  ADD PRIMARY KEY (`ExpertiseID`),
  ADD KEY `ExpertID` (`ExpertID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ExpertID` (`ExpertID`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`PublicationID`),
  ADD KEY `ExpertID` (`ExpertID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `AdminID` (`AdminID`),
  ADD KEY `AdminID_2` (`AdminID`);

--
-- Indexes for table `research`
--
ALTER TABLE `research`
  ADD PRIMARY KEY (`researchID`),
  ADD KEY `ExpertID` (`ExpertID`);

--
-- Indexes for table `useractivity`
--
ALTER TABLE `useractivity`
  ADD PRIMARY KEY (`ActivityID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `ComplaintID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expert`
--
ALTER TABLE `expert`
  MODIFY `ExpertID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2007;

--
-- AUTO_INCREMENT for table `expertcv`
--
ALTER TABLE `expertcv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expertise`
--
ALTER TABLE `expertise`
  MODIFY `ExpertiseID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3063;

--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `PublicationID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `RatingID` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `research`
--
ALTER TABLE `research`
  MODIFY `researchID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `useractivity`
--
ALTER TABLE `useractivity`
  MODIFY `ActivityID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expertcv`
--
ALTER TABLE `expertcv`
  ADD CONSTRAINT `expertcv_ibfk_1` FOREIGN KEY (`ExpertID`) REFERENCES `expert` (`ExpertID`);

--
-- Constraints for table `expertise`
--
ALTER TABLE `expertise`
  ADD CONSTRAINT `expertise_ibfk_1` FOREIGN KEY (`ExpertID`) REFERENCES `expert` (`ExpertID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`ExpertID`) REFERENCES `expert` (`ExpertID`);

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`ExpertID`) REFERENCES `expert` (`ExpertID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `research`
--
ALTER TABLE `research`
  ADD CONSTRAINT `research_ibfk_1` FOREIGN KEY (`ExpertID`) REFERENCES `expert` (`ExpertID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
