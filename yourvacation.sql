-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2023 at 08:36 AM
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

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`advertisementId`, `hotelId`, `dateStart`, `dateEnd`) VALUES
(4, 2, '2023-11-05 22:09:23', '2023-11-12 22:09:23'),
(5, 6, '2023-11-06 14:10:15', '2023-11-13 14:10:15');

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
(1, 'พหลโยธิน', 1),
(3, 'จตุจักร', 1),
(4, 'นครชัยศรี', 2),
(5, 'กำแพงแสน', 2),
(6, 'เมือง', 2),
(7, 'เมือง', 3),
(8, 'โพธาราม', 3),
(9, 'บ้านโป่ง', 3);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `facilitiesId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `facilitiesNameId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`facilitiesId`, `hotelId`, `facilitiesNameId`) VALUES
(1, 2, 4),
(2, 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `facilitiesname`
--

CREATE TABLE `facilitiesname` (
  `facilitiesNameId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `facilitiesname`
--

INSERT INTO `facilitiesname` (`facilitiesNameId`, `name`) VALUES
(1, 'เครื่องปรับอากาศ'),
(2, 'เครื่องทำน้ำอุ่น'),
(3, 'พัดลม'),
(4, 'TV'),
(5, 'ตู้เย็น'),
(6, 'โทรศัพท์สายตรง'),
(7, 'อนุญาติให้นำสัตว์เข้าพักได้'),
(8, 'อนุญาติให้สูบบุหรี่ในห้องพัก'),
(9, 'ที่จอดรถ'),
(10, 'ลิฟต์'),
(11, 'สระว่ายน้ำ'),
(12, 'ฟิตเนส'),
(13, 'Wifi'),
(14, 'กล้องวงจรปิด'),
(15, 'ร้านอาหาร');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotelId` int(11) NOT NULL,
  `name` varchar(5000) NOT NULL,
  `subdistrictId` int(11) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `openTime` datetime NOT NULL,
  `closeTime` datetime NOT NULL,
  `status` enum('open','close') NOT NULL,
  `checkinTime` datetime NOT NULL,
  `privateKey` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotelId`, `name`, `subdistrictId`, `address`, `openTime`, `closeTime`, `status`, `checkinTime`, `privateKey`) VALUES
(2, 'kTvebM/Zk2rwuHUzoUMDfuQm1jt6Iv5jYPCpSz+ffU5R8yh1SkYO5sgw+eEXp/tUp4D5R5TJg8OG+gVxoACgbZ92N7mA3CvkSnPvldEAcbFIk+BrcRGheJudFdpXACS7Rvc5KWPJCMAOput+SBu7L2Sn9PRr+ctX+sTY84X7dGI0TU87G2yXwXr0skrtDAO6MS3R3QzVc5FjwTANSNqe3DDKKg5B7Hk2LwUKpWeUVbgBEyO8mQ9Ir4YFiRAjAtoLlR5bV2k65h8bT2sJj7LOd7PnrkxH0xXvT8OWnLSE76gyTA/IBWnOxvuEa1XQyEX6xMM3713UP+L25IzBM1NcFQ==', 1, 'C3NxabwXqAKQ0Nu6c1JDFEuY539Gz/X5eeJ0uOgtIix6arqA9/dk0I5UPE5EOAVy0wmHS/gAFDJvY8Z8UqRiG5zWeihWDBMxCLoROnqTtqWzmT/hnwfMHrfQ8r31HNFDF7EDzD6CJuah7ReWSSdk1HD/m26ooChcvSL6dWiIYxKL8T/gDU2boRUI7wfqttGNScQt2hltDpSTmmBnhj2q3svZxCqgnmc3P6Yg7iN/Stpy43KTZpRYZyvvOD767GzMxurHeTXyEv/SVoCIpqhQgRrQiGZmvjSZ8uFoAlWFy9EjA0Trr6vgVEGQypnflwI8IvIj35pmuLumuKAmXBGdIw==', '2023-11-06 13:00:00', '2023-11-06 13:00:00', 'open', '2023-11-06 13:00:00', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQClhfaNO/jhkscUlgF+KMwohj5vKnf5WA3CZe2HEPywQLkS9ZAuQc6C9W2qkugtETKE6SFftmEKvgAlMxnscIfvBSPVykZusuQ02uAr5Fcggbim3HXjzECxyFMVMZIhghAkyvOUsoaDgI4bc1NegNYLyriysYcKTybs2Ub4aHw4kBEhazBe0qFY8tDXx56ba9RQWpBnxzTDeV7x59U1fA64dP09AmcQMcpETJplzcp1tdDQZbzv9WHguyRyZQDR5fZPaj+O+Sl5C5wuCvTE91kH0WUK4Zx8apSpuS/Uh/q7ZiJrJZZ6TFpaAX1caViskWetAI4L25PiBQYlnuCzlns/AgMBAAECggEADqR2ppDPF/lZhh8s+6GVSeJyRHg/y7133iIRLJkamWboWF6DxivJHnminWvIgTAbxXkwHBzwobgkICZQnUNpKwJL5L4zk9hcaraQDSHyeSwwjwZCoYewk2mSu/W6JR+x2OdhO969GoX1TEVb8yi3hqyEwT4GIanV2i7wYcowbvpfLWQ0/dBFghUZH+qcab/24QlRO4mcYGSxZeMVsVZQ5VaWtQxEIe70mSq28lqcF68Xnicl+P4HVTDEaz1PzKWv+cIzeMjZSJPq66fMMSiIFiIlgQlw8hhHpjDpCI4frHNSXrNeApH5Gzcnk1Swn1El4aw22irM16lz0ai3j8LzFQKBgQDW6WtlSVnI0wnk0HDFXLrIyqR8sdERskAnljMnXkPqn3CUd32vbnAMoqWa4U/AKnti+7CrvbQ90CmZdN/qPPAuTPtexvj13PZOcYDvD6Y0HEo4lXij52/dRK7/IwwrT3/icmwcfUsj2yX5Z6+9Bp0rRxNZWiv5Zzq0QK66iKRrGwKBgQDFK0l/Fr2xwn0POJunFrZ+IbWJBSn1f0J0SpLZ71QgUMQdXhT4W27Vq2WvWPkhTwom8rjnPbDo7cpePKd2cs4lHem8ELw4DPvTPejP3F0qivJK2kRX9Zte58k0DP3z6fe+dU2MLwkK/hs4mk1LBHAhsOxHBkMLCZS21Qo8ciXurQKBgG2lESHP1nrbEMUogyBuOu2OVXU4002P/6Mywk5njYb6aVmVzQ3f7lLD+HGYWjPUeLb7aht04axXs6GTO1oqVO+KXwTvxrzJSvCigAF3nngfps5PlAkrXqspC48ntmGyYbCKaBXw5pEYkbs45zQtV6pozLpdgunvfMfR6FNKu3fZAoGAY6qF9GAic4DEhrUuuT+Z8BhKE4EwvJAfn3ky0kdQVyV8fPvZzdEqLYf+Vqy7AkNZ9mYrYXilvJi2+vveCtntqoV8aTxsaEjn4tggnzHdRmwGHiBG+8+DQm4YHt+SX4GdYgEZugrsn0njqLEW8RzFMcKlLSHVMfcd3W3DRtrMoeECgYB7Ebrx0URv09GWFMzJ+p62q2u/sKlVVN7kaqicQ+3S+8hWBsi3gsdL3LNdNj2/dwxeGR6c4hCsC6gkxbJsZbj7coeD63IqAeWUpn6ChOv1ecDgNDFrfFzIwiPkSY5S+ro6dcco2ZTy5BiRBFgPFmThOlDo+rnKKNpuxYVJKd2k7w=='),
(6, 'Alc1fp8hsWAARlAbjRrYEY5ew8Hj6HCT8CraKGe1WN2tED+ZOEK0wG0QfII9Rc8YZoILBUJmtQfcUXrFppi2ATpq/NP6jNXsCI4VyEdvmgMcW+fA8aFf1d4YlY8kgdF+Me9YjiIU0n7loQqHXHnHiED8wjjLkn8rVf/Q+FodJQitVxvmUexnK+gKkoh93w8zoaNuoAJvVMaO5FPeovGA8Yp+9sZxbaPoNFjyTOKCr9yPJZDBi29f9WtZSCtGqdAdszl1EARcvMECEcuTCL0pEmdn/LsJ40iaBkDU4Y5fPf4J4Wc4W2U1XDdCB61M711q7ujA9DJTE3Kw1ki/u2iVkQ==', 1, 'MqPV8n7zJ96/NdQBk16Y2Sa12jCSDDxeFtz+fD6V0yTqTTYMUbOLl6Q9YfSAP1Ys4erO8Mep4GSK0Dabn54SZq7AnJ9qtXA47GpAKNu1IFHUL6usSYI8UQ8csj4LPTo6dTsxzYVMOYaYX9sTxEyRI4BYDwHdR2GJ5J5eeinkoayceuPATH8ej4xA/wdprinwvhOfXespJy6CUmwSgSvvChLQDFv1D8KjWQnhA/Ia/kpNCq02CXLU66aHSsdoR2ay8InCbNwXdsdqynQ0tDwb6SjlpBZ10GZ6XvjUkLsLOgth4YZyiUjZalK2TIrISmHScYEt0HklK3k3wbmz75baUg==', '2023-11-06 05:08:00', '2023-11-06 05:07:00', 'open', '2023-11-06 05:07:00', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCzyIwSfvuU7/bG3nvSvPgId31YoIE4URJq+OW4tWrzwhJiZniUscNH0nw+p0WyP07y1JPYjaa5t/kTMzz5IeJCIe8Q3g5ve5tjZM7gkn3iqIy+JnsIJE3CyozbM4lzRcNzzSZc116uW0FiHA/ItSpqEpOuC/KRo7C12XsRnT11IsMBFOD4Q4szRO6yatFWjyWj/0jAlzpaH1K/KLQxTs6xTY4vdg8r+pygN78xUbXMpFGJixgtT6XDWz6+MEYukqiiy70/zmVoU9kRe6N5lzu9lQ8zc4AzYg2dpXDprgZTeOWem+yPtoNE1HPYDEON0i1VuxSzF19xfLX4Y9Ja5h6NAgMBAAECggEAFqi8HsiqZMcpzz7TVGhEyqxku/rezn5JV/ou2ezjof1f288We4c8GZ1J04u5mRGpnal1SOHxlY6+cdEPakb/AV7Nhs61+w8VMp3OBTfxbdPYiU7ISupocpic0DPaqxCr5biBkUoDwO33e6oVwzIyOlRFELaox/pdl03l2P58dHrKeNBMZStkm2z/8m4U+utFpyylcTV/rOI64qyyj88qbGHHnmf8K3a82J49ywkB4MtswNsqgRvBRunbAOl4a0qop4rR1wtx32KYdHGb/zyGp3YgYoBfbHuFhwfmnf0cezM71gPWGpFutoKfjzQzlr2H8bSJ8deZ3DF5+rYqpPYCcQKBgQC5WlxXGsw7EGtrs57G1JKs0BcbGu7hpx/RTh4QyftqBhHuoh2VMOXDiZfuYv1w/7syo46k7TE0QUA6n20CZ+ed7hMkMaR+yKIpC8pMcvVzj0h49h5AprCh0yKGKO9hwb5PqBTxoJlllS6PkfR6m1VVEksy9BZujT/W0O7rKoJkDwKBgQD4Tr1V/+/B+mKkm+3nRNxYhP17cX+oFztES709+swyGk34jri42eQeKQAQ+71eKJvWvRQGRYDtJgWiOKhyHhiiQRKO1Pkm4IQx+TtOUlyr6nZ+au5K7avHssnmui7Cj4GWysaS2Q+v+T7OxSuoYCrRGMasHeriJTgX7U9MQJwHowKBgEYfc3PYxY9K5Pj4GYergFo016j/hYSFT7pFzYYYhC9WYI5hcsOwnhxd/8bGWI/ZkB7WVe77dXQJg50qF3mjibLsEP3OcictDHxu43gMveOcP5TTuBpJdeWjFRqgfgAD5lYIhvPrCF2wFM9oLo/8GEp5A04hniLw+Ufx/5GkoXPtAoGACEVfKykuTFDRzlffUc/KYyxy4RTDws6bS8gWEqVy/cxAgqIGZyni3lpRRT+NbECACGQd8aOJCt00XNX0TnDQMz9lpdpUPkZGQP/jSNWXfqZ9sfJP47ENAsbi0Mus2RA8qdAxUxzl19++htasgJxLcNGZdIw+ka/ZsXpXJNwWFm8CgYBvT/yxiiCt3Zlvi7xhhiuLBHOWaZNEUqsBO8pTdjOdbvQ1lu0Bk4+MwaRMATGrEB3AWCKtHxMjBLinB+Xih966tAlsgS0nzYfbYP3WdRgXumIKfzyhjrzidWfKCl1mbgO5o/t2yb1A4qCBv5wYZo+e0lqZMESiHOfdZeUio4KoJw==');

-- --------------------------------------------------------

--
-- Table structure for table `imghotel`
--

CREATE TABLE `imghotel` (
  `imghotelId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `filePath` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `imghotel`
--

INSERT INTO `imghotel` (`imghotelId`, `hotelId`, `filePath`) VALUES
(6, 2, '47b2b665-cf96-4e76-8843-fd65689a0668.jpg');

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
(1, 'กรุงเทพมหานคร'),
(2, 'นครปฐม'),
(3, 'ราชบุรี');

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

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationId`, `userId`, `promotionId`, `roomId`) VALUES
(7, 4, 1, 5),
(8, 4, 1, 5),
(9, 4, 1, 24);

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
(2, 'user', 4),
(18, 'hotel', 21),
(19, 'hotel', 6);

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

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomId`, `hotelId`, `guest`, `type`, `price`, `amountRoom`) VALUES
(5, 2, 2, 'suite', 2000, 94),
(6, 2, 1, 'deluxe', 20000, 99),
(24, 2, 2, 'studio', 300, 98),
(27, 6, 2, 'suite', 2000, 94);

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
(1, 'พหลโยธิน', 1),
(2, 'กำแพงแสน', 5),
(3, 'จตุจักร', 3),
(4, 'บ้านโป่ง', 9),
(5, 'นครชัยศรี', 4),
(6, 'เมือง', 6),
(7, 'เมือง', 7),
(8, 'โพธาราม', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL,
  `vacationId` int(11) NOT NULL,
  `tagNameId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tagId`, `vacationId`, `tagNameId`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 2),
(4, 5, 2),
(5, 5, 5);

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
(1, 'sea'),
(2, 'moutain'),
(3, 'river'),
(4, 'waterActivity'),
(5, 'activity'),
(6, 'tent');

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
(4, 'Peerawat', 'Wongmek', 'peace@gmail.com', 'username', '$2a$10$TWqmgtVJxWMp.WdDk0C8uOH4HqXyxlD4LUsyKpdoZiHA5pFr0vwtS', '0865118978', 0, 'asdasd55'),
(5, 'Peerawat', 'Wongmek', 'peace@gmail.com', 'username2', '$2a$10$MWwTWBADGUDdZ9ijVeViQuygISbGeI8JD1HQGs.KFfQDTIVCFxvXe', '0865118978', 0, 'asdasd'),
(6, 'peerawat', 'wongmek', 'username@gmail.com', 'username3', '$2a$10$dqZEzqyoYiDcKG5U5B.YfOxTvlHCAP/wf5YNqIDXXt9BXxnC7kP9G', '0982636676', 0, '12312ased'),
(21, 'peerawat', 'wongmek', 'username2', 'username2233', '$2a$10$h6Un4TAbOj0g7293Ypq3SeWgOJ.Zg572365alY93Z1KMpkjR2shrK', '0982636676', 0, '123456');

-- --------------------------------------------------------

--
-- Table structure for table `userhotel`
--

CREATE TABLE `userhotel` (
  `userHotelId` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `userhotel`
--

INSERT INTO `userhotel` (`userHotelId`, `hotelId`, `userId`) VALUES
(1, 2, 5),
(2, 6, 21);

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
-- Dumping data for table `vacation`
--

INSERT INTO `vacation` (`vacationId`, `subdistrictId`, `name`, `description`, `address`, `tagName`) VALUES
(1, 1, 'น้ำตกเอกน้อย', 'มีสระม่วงและสถานที่ท่องเที่ยวทางธรรมชาติมากมาย', 'บราๆๆ', 'river'),
(2, 1, 'นางโม', 'หมู่เกาะสวยงาม', 'บราๆๆ', 'sea'),
(3, 1, 'แม่น้ำคลองโประ', 'มีธรรมชาติอันสวยงาม', 'นราธิวาส ', 'tent'),
(5, 4, 'นครเชียงฟ้า', 'สถานที่ท่องเที่ยวที่อาจไม่เคยรู้จักมากนัก', 'ถนน ราชวิถี', 'mountain');

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
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`facilitiesId`),
  ADD KEY `hotelId` (`hotelId`),
  ADD KEY `facilitiesNameId` (`facilitiesNameId`);

--
-- Indexes for table `facilitiesname`
--
ALTER TABLE `facilitiesname`
  ADD PRIMARY KEY (`facilitiesNameId`);

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
  MODIFY `advertisementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `districtId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `facilitiesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facilitiesname`
--
ALTER TABLE `facilitiesname`
  MODIFY `facilitiesNameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `imghotel`
--
ALTER TABLE `imghotel`
  MODIFY `imghotelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `provinceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subdistrict`
--
ALTER TABLE `subdistrict`
  MODIFY `subdistrictId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tagId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tagname`
--
ALTER TABLE `tagname`
  MODIFY `tagNameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `userhotel`
--
ALTER TABLE `userhotel`
  MODIFY `userHotelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `vacationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `facilities`
--
ALTER TABLE `facilities`
  ADD CONSTRAINT `facilities_ibfk_1` FOREIGN KEY (`facilitiesNameId`) REFERENCES `facilitiesname` (`facilitiesNameId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facilities_ibfk_2` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`) ON DELETE CASCADE ON UPDATE CASCADE;

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
