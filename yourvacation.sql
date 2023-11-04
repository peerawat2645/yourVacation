-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 09:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yourvacation`
--

CREATE DATABASE IF NOT EXISTS `yourvacation` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yourvacation`;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `advertisementId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `dateStart` datetime NOT NULL,
  `dateEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `districtId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `provinceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`districtId`, `name`, `provinceId`) VALUES
(2, 'พหลโยธิน', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotelId` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `subdistrictId` int(11) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `openTime` datetime NOT NULL,
  `closeTime` datetime NOT NULL,
  `status` enum('open','close') NOT NULL,
  `checkinTime` datetime NOT NULL,
  `Facilities` tinyint(1) NOT NULL,
  `privateKey` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotelId`, `name`, `subdistrictId`, `address`, `openTime`, `closeTime`, `status`, `checkinTime`, `Facilities`, `privateKey`) VALUES
(1, 'SmfFDGHXw/vS3umfMPQQoF7EO/MfV9pNe7xdGXA+2CvNe3/gsPuRtc1i4nBT+cNTx4bXSWZiu0srMBKqG8W15GPeAa5+7KYsVLp/7b5ClzWWmQYG2wKV7269oSqIqN7Fd8kEmGq1BEZqmpXoz4txeaAgl/8TFQz9uF40YrYxoKDxoDOHzljKGlQsCzSwUON6+sufajkMnDvXPIbB50JhzuSrX0gSWzMkIwG8DjhBpGVb/oEQwpRrWerZIEve85XYw0D7rfBys0yAq4nN3R6ZRsMGfZpH3ak27DrtD8aIznS+G8LJXBYQxgnEmTmcnurU3jh7vhqP1psI+1KF+UgQuw==', 1, 'S52RyarNOdbsuemdPioICSmvEQBsrDldtnyr3bD+t9qkwbqdswqIKQId6WejX80nfD2kVCOZi7uUzskG5Pz19kXmbeWAjZBPHsXsR774pCvCi6bqiDczv4IcNaxwZl+xdB7mX7t6BAfeyde7mtoSfCGAYtbDuwS9CdSeC1B5KuoU4CzX2Srfdihov7vC6EJxIc1kP8oUkbU0kAs19sUZZv8HwBVqFxlVmbh+INrioKUgHErYejgDPdh7GEcbucBtpdzyf5GIq0FooTvyVGCxa5x3Am1ydo9UG2QGdVB56UZDdF6I1hW8h1V2NPMbZ6WjMEiQ2Nrx9jvTT3u4N6E/+Q==', '2023-11-03 07:00:00', '2023-11-03 07:00:00', 'open', '2023-11-03 07:00:00', 0, 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCobdtAxoNTPHoQnxKCwxLgSAWiOBI5E1h5+fgIjekO7A9xxCVLLlIDs7YpiVNFVf/jXmhnrieCmK5Mk5I8/DHofkROKsWB6kCKgEmxNmrArLrmFaHXbGc+n/t02Soonld8BaAosvgl0z1V04EeUrNpKr6kORPJmWmd9/pjxWMSAkHvOPKtTO1bGcTuN2XQwd+uDu0UjGEn5gxwuAG0y4uLQ6VMbmUHpdQI5p9vHJdGt0VHFSrGPZy8bARXcgGrwAeDQsNwKyE7FMv/NHQktfP9pkjTfYgdtofZksOUW2nrrHJWmKucM8/bTiDExNjbJ6qBkC3VEf6kpEzf0AKGrulpAgMBAAECggEAU4NRLS+hKzL39WjihUrTf7jGblZuFrXUb3q19QvkbP04dTkEIuB/Uw2XO8Y3L1CClksX6pzMQ3GQLzEW2D1WQ8jj9nw3vYCY6vPMVl28lfevnmlIe6fpE4DA7oHFaSmGCF1Duhpvd1Xj+jvqsE3iXrmOmKAigxoZ5/Vuxmy3gFQm6zj1EuPwMusmWA9t+azt5NbmSuIk4EFhYeEHmnlMeN7tnV82BpRp629egIHb2ZyUd3VaANR7FumCvyY2MUl+Qz2F9bfUcG45qruzSvwKIoE1gsxhuDap5kXB7Agug6OQjQU7LLDyKO9l4Gi3DuQQSxilvOUQlCDaBOQ5+8H4lwKBgQDc6jMZIbjiSTSKtu9NK+i7fko/71qEMvZVs6v/72I/qOSoQ7wFyhjA2XJqOojYTyZTAniQQ4lPrUPQUID1QwpM698tEbeLfMYs39CJxyVrqyoO3GyfMsnsWMDMFhF7Wy9CUOrzvICp7haG9fvd56w2vus4TY1eBVJOedqwRaAbxwKBgQDDLbrCFvK5dXBzFOxnXjwAg0jjWQVSnZ9RTpcHxi8jLV7axys3ttJetYoV6DFo52euQsEDGP9K3rXdSvj2kzrg9JhxfncpCl44Ijg0QYAfJXy+CDWfCXLTAx8NNfG1p7Ft3CfBSeX+eHTptkegov/eSx+hA4H8DJK454aq7uDxTwKBgQCHLW/TAwWEwdK6xrGrgSDKCb8ZXDcBCcYeLvEijLKLzacNJ1VYHZAEAYq3YdX2tof2514quIi/DoCeaYRfj4QwCWzowRyU5+bD8rhCdm95cKUtrsdwqr1QOAbRWvebifJjG+yI9GGumZeDQeW6pVaFsVFxhFLqo0r35ixhDFmqZQKBgHYW4Pw1rj4PlC3M5wvTtDILPLpxTgsiWxZymmaVvkdmWBG+l6Np9fZfmGCQz/RMrip9MRKSuUOvZBG0HtXxVpps4x8oCSjHoSINcjwLtV0i7Up85RSIPvT02oC/trLV90AlB9imwYUplHMjWksS1ATHJyfgW3EImm1Nh+k8BtV5AoGAGyrma+F5RjpoKMjbTZmq64LdqBcc5e9H+f2afkN9UlpncKFrTLrq7ln2s+FG7mQEftj1N4+AtpUTKF7OjkYSxV4O9Gs6/Ob8yRuYDU9RSynQQuEDAcFIns5ZB5muqAXGSzxV/H2u67ZxWc1DQp/7SIK/Qnkr/Ozl3J8/66ztKaE='),
(2, 'gzvHD4fa3bXa94dF3vdYjvdmyw7cUL/c+wgepraZTp8Y7V4sC/2kHJmqZGaKNRmbejKfM3Sdj3gLyg4HRGFB/INfVLKkNcnw1cgGYpgVXhJGBYoX0FPuF8376ruMA/BiKwPHMe1W82FQ22wwHGhX4luNQb9pqS+9kwdAUXwKJCnP0Tf2ISyi4WFEtnWiw9lFDYgEEBJDAGBs8SibiqgUs6RaApeahE5lTPvShp0n/TAG86fTZO54YDi1X+16M+y3YsJChGpjdMTw2FacOtI0h3+VTTnfk0VmcW62c8+ICc+WCF3mC/0WGFVhZ6voFkzUZBDnu1TitJPEVHZRDaWxIQ==', 1, 'jKtDH8UjLy60p/9JWiPqKyRlEcDTiDP0yLnyTpIRyGd8cdwzx3PqXTDHNJCCgLWFc06qGrOpZb1LIOj2+3WB1AWfYiKAXSxMmIYDVf214aPaJLTdePFq0hNA0kdEqNYFE1WDcEzouc1DSlgYHVIBNTSk4E6msE2CH8KDJr5xD97Q18u3BmGcnQm1tclncuKmqstLQ+jY5SBKJenlr7YBaZlHt7sMWuPg5267qLvvcv1dRM0Y5WxekxQOrxLu/ZNGpns3cJdbTUI1SjhK/2qhjFDHL+zoOAprgMkw3eE63vu7d06yMB1+7TF2wBKKn87re+JhX2t6Fb6s+eg82nj05A==', '2023-11-03 07:00:00', '2023-11-03 07:00:00', 'open', '2023-11-03 07:00:00', 0, 'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC+LQzRu0xl2iX97XsIN0FR+KYNTvo6eLtcqAExkDEt1Ko5pyksICvSX2a2MOQy84sXIFgeD6ebMIdniPgLgAqOkUCSCuiyC1zcY1qt0uSWknHk+4V6ss4GKASUNlj44JzsZo0Kgf2ybMNykFemRnRavUKythrnYFOj+FsBBJ4+34yfNmstX51jVtB6z+Tmsh9uDAHY7AYPdMl2rvjOEkG39OAUws19b28sJs9QvYxxOShtf8Vtl7aIK51bigGFlD8phsPr2ZR4L17DLg+ubvepUGxeZf+FkLWOcWn92ix7TPqbmSr0LyPLXFMzE0UT+f5DWSyy9ZIawqaMeIxhGtnRAgMBAAECggEAAOBCiNtrCp3AoiKF2tjrVyM1kJsoWx85iSYSOfcFRbdYNbwepSzgE5njpIwBG5yTeGqZ5YoChYYkN7RVEnVKE4CseHEe0opy+Q5nTmohiUIU6+JrHrM6cIYTz1KC0t2iWZZ7AGmPnwmVrZStbwZ5M07U54knUweUypgN/cZ3YosXtvPFt5fKDd1/F86rAcfQG9j0eZVcfyx/i9gY5NXFR6eCTb7P2SmV7Z0vBPasDdWDQtifs8F0yIxqXrDCQ94NXHvIgulceHq3UBpMK7enjNM1qHOvAdWi5aybVpC3HhTXvlr7Td1U2D3LSngv4bUQz1KAUbtW4AhknUcXHvlrSQKBgQD3jKQyg/Wfh9e/X1vXW7VwieX4LPGqKVSXiZzbGxM9MOOf6qaVvtkoGZE53awr8572+P6W7N+tYYfTQBSWeDbmchwZRtRqeRh6/u9sGUXfluihGABIZ6YGaZM6gvCulKFs9j388AE9WzepIWw/JMC4bS589SKRk/vGrQ7MKrQ3bwKBgQDEqwRNvvXARTlAQ+AmKqMVIiTkYzytb1Y+hn+JZ5DsD0pSDC/MxcEPr6koDaqC5voIo/HptfXYpCUqwy5xEBmUNDFewLNPfgKqVCdwNIoYx58cPlSJGnav01jkoyKBGh32zMRUgCz1oNWK4ZbhPrbSwrzxo8DAg4VYLkLjoONivwKBgBz1zCPIwkx2hOvziPgJ15Eh4NCG2YLRsP7Fb59GbJrFBGwp9HEiUZ9aVl4Rq9m8d4VnHcmkToqnFU/GeGIeEDYndVgTrDgEkLOa7YGU91KwAekOuMG/tnGbmkjHFsclxjjMGfZkUZDPAhT8PwCoGQ+6XizqNLAZQuQ8TLXf7RNrAoGBAIWSXU7sdn6KxXKHZxKk/LRax1GysMBekOXQdYh+JaieTezhyAk8+n3L4YiJl5hmhcUejCweYIYuHewoOj+iHq1QsYNYP7Cqtea3Vz3XAUAJPGBzWPjxV1Ddq09GGSYz9cvskR+PGnoNLVuxEceTz5nfl3JKtJxL92HHsbhmSmmDAoGBALGeMddWx0/FvlVa0Q3RTFFobioSs+JFbZf8vzTS8IurBOg9e6syOF6ADZ7SMnrpjHZjkOYNZQQLz+RcyVpnBh551qN6QTtK5ZomwCafLQZZ5Jzxihlw5nwYx8KIDnZH0uHB2jcfB1DzbffMJNIR84KlD0jv+oILR3ZYWjLlGw2w');

-- --------------------------------------------------------

--
-- Table structure for table `imghotel`
--

CREATE TABLE `imghotel` (
  `imghotelId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `filePath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imgvacation`
--

CREATE TABLE `imgvacation` (
  `imgvacationId` int(11) NOT NULL,
  `vacationId` int(11) NOT NULL,
  `filePath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotionId` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotionId`, `code`, `discount`) VALUES
(1, 'default', 0);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `provinceId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`provinceId`, `name`) VALUES
(1, 'กรุงเทพมหานคร');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `promotionId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleId`, `name`, `userId`) VALUES
(1, 'hotel', 5),
(2, 'user', 4);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `guest` int(11) NOT NULL,
  `type` enum('studio','deluxe','suite','') NOT NULL,
  `price` int(11) NOT NULL,
  `amountRoom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subdistrict`
--

CREATE TABLE `subdistrict` (
  `subdistrictId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `districtId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subdistrict`
--

INSERT INTO `subdistrict` (`subdistrictId`, `name`, `districtId`) VALUES
(1, 'พหลโยธิน', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL,
  `vacationId` int(11) NOT NULL,
  `tagNameId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagname`
--

CREATE TABLE `tagname` (
  `tagNameId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tagname`
--

INSERT INTO `tagname` (`tagNameId`, `name`) VALUES
(1, 'sea');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `money` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `name`, `lastname`, `email`, `username`, `password`, `phone`, `money`, `address`) VALUES
(4, 'Peerawat', 'Wongmek', 'peace@gmail.com', 'username', '$2a$10$TWqmgtVJxWMp.WdDk0C8uOH4HqXyxlD4LUsyKpdoZiHA5pFr0vwtS', '0865118978', 0, 'asdasd'),
(5, 'Peerawat', 'Wongmek', 'peace@gmail.com', 'username2', '$2a$10$MWwTWBADGUDdZ9ijVeViQuygISbGeI8JD1HQGs.KFfQDTIVCFxvXe', '0865118978', 0, 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `userhotel`
--

CREATE TABLE `userhotel` (
  `userHotelId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `vacationId` int(11) NOT NULL,
  `subdistrictId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tagName` enum('river','sea','mountain','water activities','land activities','tent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`advertisementId`),
  ADD KEY `hotelId` (`hotelId`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`districtId`),
  ADD KEY `provinceId` (`provinceId`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotelId`),
  ADD KEY `subdistrictId` (`subdistrictId`);

--
-- Indexes for table `imghotel`
--
ALTER TABLE `imghotel`
  ADD PRIMARY KEY (`imghotelId`),
  ADD KEY `hotelId` (`hotelId`);

--
-- Indexes for table `imgvacation`
--
ALTER TABLE `imgvacation`
  ADD PRIMARY KEY (`imgvacationId`),
  ADD KEY `vacationId` (`vacationId`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotionId`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`provinceId`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationId`),
  ADD KEY `promotionId` (`promotionId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `roomId` (`roomId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomId`),
  ADD KEY `hotelId` (`hotelId`);

--
-- Indexes for table `subdistrict`
--
ALTER TABLE `subdistrict`
  ADD PRIMARY KEY (`subdistrictId`),
  ADD KEY `districtId` (`districtId`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagId`),
  ADD KEY `vacationId` (`vacationId`),
  ADD KEY `tagNameId` (`tagNameId`);

--
-- Indexes for table `tagname`
--
ALTER TABLE `tagname`
  ADD PRIMARY KEY (`tagNameId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `userhotel`
--
ALTER TABLE `userhotel`
  ADD PRIMARY KEY (`userHotelId`),
  ADD KEY `hotelId` (`hotelId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`vacationId`),
  ADD KEY `vacation_ibfk_1` (`subdistrictId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `advertisementId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `districtId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `imghotel`
--
ALTER TABLE `imghotel`
  MODIFY `imghotelId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imgvacation`
--
ALTER TABLE `imgvacation`
  MODIFY `imgvacationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `provinceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdistrict`
--
ALTER TABLE `subdistrict`
  MODIFY `subdistrictId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tagId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tagname`
--
ALTER TABLE `tagname`
  MODIFY `tagNameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userhotel`
--
ALTER TABLE `userhotel`
  MODIFY `userHotelId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `vacationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`provinceId`) REFERENCES `province` (`provinceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`subdistrictId`) REFERENCES `subdistrict` (`subdistrictId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `imghotel`
--
ALTER TABLE `imghotel`
  ADD CONSTRAINT `imghotel_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `imgvacation`
--
ALTER TABLE `imgvacation`
  ADD CONSTRAINT `imgvacation_ibfk_1` FOREIGN KEY (`vacationId`) REFERENCES `vacation` (`vacationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`promotionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subdistrict`
--
ALTER TABLE `subdistrict`
  ADD CONSTRAINT `subdistrict_ibfk_1` FOREIGN KEY (`districtId`) REFERENCES `district` (`districtId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`tagNameId`) REFERENCES `tagname` (`tagNameId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`vacationId`) REFERENCES `vacation` (`vacationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userhotel`
--
ALTER TABLE `userhotel`
  ADD CONSTRAINT `userhotel_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userhotel_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vacation`
--
ALTER TABLE `vacation`
  ADD CONSTRAINT `vacation_ibfk_1` FOREIGN KEY (`subdistrictId`) REFERENCES `subdistrict` (`subdistrictId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
