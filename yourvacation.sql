-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 09:44 PM
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
(4, 2, '2023-11-05 22:09:23', '2023-11-12 22:09:23');

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
(2, 'BwX5KM89b1UhSJvb9QLxRXZY6QRn/HK4cPepRDFUkve1oVEE+aClNuWFvWi7tuX3/a5IUlSvjxpO7iaJE2TGlARAd+Syady+DoSkLegDxi89HCoie1GBxCkwxpK5EQSqmu1Db0X+xorX+BqwH9j9pBmRyT1mOep73qidQA7iQ3yEL9KSC6N54LyxcCDQGgBtYOHiY7VG/U1OZK4TTg16AB9gYIxJZm1wlIMjlSOYZO6Ndod+v1Z2S7BLhmrnEeHShBMLc9HRUDC4AVSDAOUMYSGbcX3TTe1yp3tbt4bbACciv/Bn0k6qh64PHKXKD1e6/HPBOYVRbCwFXChQS/lGGA==', 1, 'l26XY0vg89XmJv2yTmldsR9ifeeVa4NtLKCZN2IVIoHuGEWOxdTDT76+hJ/OsMA1ykn6LvjKUUHstUK3bAMUpOhGfawn4senh3kjf7PU1qiSZtHbKuFSUa4O2Jdzg7r60W9nhbukKSAK7d/aAAdCTiph2Gez/KJcS8rmsKwkSSYW1qjVWVg+s0yRyQfWPXZfLqKhE4/PYZPK1Efk2gWdS0iocf/ERu5yhIAv6C5nVr6VhC09fQPZCIqJ9UhI7GzuqgclxABUsSMlL8btCrjTSacK9E/o8GUWe2Fu1NMXhX1guPN8B/Z0IYyHGSSNqS3gIHcTe2FD7p98fEUdis74lA==', '2023-11-06 03:00:00', '2023-11-06 03:00:00', 'open', '2023-11-06 03:00:00', 'MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCtW7V100pt3V56eUZHRjHVsePSjWgsg7M9uNMDeOXQ3oH6xWk2TZeISPTg/ibvFgu08OumS7e5xC8dIQLTdrQ4M+UT0JVCua5t3OoCwZwDhNu9u2G2eC1ksSmgNj1uNRiEjlSFZoPSQPQ+zBBY+3peQM163mjG/cGEbVKCf2zTjTGLqwmkvUrLXdeefjo+4n1E9pOHb9S0aJ8iiezmgvKaqfBY6ZzS/AQbWgQAk0ed7CoJtfzaxK5BDS7fcnr8FWdpyz6NYypyg3gOuv29Oq5lVtyUSNXfFdWFKj6xrZXWr60lv5oJ3f2dtsSQdlGT4Cemxv/c/OQKPTanZC0CvLunAgMBAAECggEAGlWRma34ovrbRMiSa/ZWUKt+u7feaNCy1D/00hS1+IYsgY8mfejIiZvnkxwYhv421gw5B+B9rtsF+ytOFhh0pQsBFAL+AY5aWHcUF0oY7JHsnYRPAhx8bMza0Wsb5tdq+4vxe/hIMxLJ55YxL4s4GgRHEpChowTeNkMzIv6/Zd1PdTmJ90bgsz3Nuwj3XUhdsToBgLWDYRwEWxiUs5pNir7sTsGWaRU4aZDVoErmu6/xR5W/f1P8u/Uvaqr1DCuK7QIf8+hGkbtZp4dKJwhn1h5qrob1ecRPJEaPP6mreUH95zIyPTrxl9SrDhV2a8qdkSvDDuRynbweiwPCzwW9DQKBgQDQolyIC8eeyTXzXzoLhtxT4kc/+Ym3oZIfWqAjP0bO24Qt74TKqr7o+llT+1eEB5Br+NbDv4770I+w8SOVOqpqntgykPZ5bxodzYnjXZ4v9lMiWybnsz3hxrUgIZKkXmz0JqQzh5arw0VDux0dGSDEGGLS199mMzA3F+93SUik5QKBgQDUtyNNFJyL2XZv4XEyvJuxFAGoeH2/0Sp4cwtc9CJBHH3k7b+qbIuzxnf8F+N5DUHjLxk7kqqhvUNAgL4EUFlowOTNUbNa9bUzP72JqEDJZ0fmyago29AckD5VjCkBaiGmVfsNp5KacCVkODhQ7QwcjSK9VpdaHjWbaX5beOwBmwKBgBkLVGY0W8sQxjwnszUNBEfBguIIF2MGrx66Zzyz7NEKAszs0pjtdCtNWgm9wxyjN8/uOAGZbhWGTKll2Oqh9zEDTlqLkjqzfoQTVzkG1OVXAVW/cWUg3A3NJ5Lq1MqMVzHbrZxN62VE9HyT6oPCr286qio7JaMEBAapBeLg1iqNAoGBAKvXh10t2YnhFB0uMxSZ6e0UDILdVDkx8O19gyCE2WdgbRQUPVKgffutyiCN6+ZPH3s5AVlvEwm2rC3f06IIhzJpIm38IrjI5qmQRL6AflY2aY+4OXFIosdwf+r8X+QUqTqHG1nclkLNdmeQQ26dEbu/COGMopja7tOuVbXv6jkhAoGBAKmVTjjI9Qwr3kG81pT7iDcINvgBkQa8J4SSPMGk3LR+mi41Q5eUWNyv59Ll4jx4xLgGTId54PRMDiIp7Eqexp/33JUqK6IKRlu+pII/RrZaVytBke45jhec7M0PovtVVhT+BVuARJEs9muKNH7/jCJFypMeQKpCTfDmmxdcNZyn'),
(6, 'qClagJ/YtlKxB7gSqqv7nqhFc2vlk6saSVl0BCd6yjYO8otZd7gnhk7d2PWdLGeNtKXB/wBOcrnawdZBlb+2F5WwbhfEUlifbeKnB9LLVewGTg1ei1qD2apLorWGbcoXSDN3lM8xXB2NUrvttpNnvaLSQmXlmX3/069czO1UX3jfymyZ6w/TD4hyByNmmKps9VNXmZKgQCiaWQVC1qB1AeXM/FA7zS2n09OILeSjbxdJX/SGpUcy2fJqiJczo82yujOF/G0YFINs10NOzFYYyxPHfkIuqXl9IsnJdSgFoJE4cGKE5QI5USpCHWmaw4sQRCIhLZ/08eUTcJwQzXndjA==', 6, 'lqvjOZmd28shalttknA1/9S03Y+7iZN0b3ik7utrcZorkadHzBv0l7PwdbUlXpE9sbGh9iEShyrTG/7cFMPTl5NUmtXsYkU7VdxH7UTabs4yl9lTJlNsix3/2RfN7MgcS8eTodKfpS1Eg452EHLCUTC78HF7eL1mjpm2DPiDHG5GYweRmjwzJ4Nl1icN7HNB3XzMjRVP2tBxUbdUilQIw0dHQ/pvIgshf71UoQs1UPAgEsgNy6pcyUZ+SerJWYGZxOB3MpOqgzGq0buhhX6kWMN4gJy4wHTQDCkjuhOeH6Vtj9p5HmsEW3vmAd7FiKK57lYnFWiFrRaDMjifgnmW0Q==', '2023-11-06 12:08:00', '2023-11-06 12:07:00', 'open', '2023-11-06 12:07:00', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzap1945KCEpzz4UVzE++khSxCVVwttbYaMUePs0Hk5pStuPKuFWXqnuhXbr3OBjgVpcPkJnCyGrDWKuaW4mqgS5inxbFaEVL+ts9LqIMtv/VY6xz2m+Jqv1NPZj0GhphISAnAoRVDjZxr3RXXIHu3vyjfy3pkkofRFVUuicpuG37j6WTJuo43iqMl7jP5xNF1RC3j3g2NeVgKQ2W/9K/gNWAv36QHBhf0AyMeqgC41nuTqKkBgSmu/gFo+wZ0bLjof+OjkEK11s1T22ums17HvonEnUHAaVLUkU8C2IHDo0yQZ4J62W+G9IxAJYcM9yMWQeEb0j8/nOW9ppk9ah7PAgMBAAECggEAEed1x/ZJzIkm+H9metFmfLh9bjEufbFAduSsC38L+Fe6RovKS+z+uqcY8ICwmDquphpgrgfX/y4Cr5ygXjZCBbUFitiDlkVcTubXUOmEDbC2PyVXQpTTx2tIWQgO1vPfhncJ4hsxEAi1r13krA8lyXReE9cuY5Lr0sWaNoaxmMMi4sUYnm1wyOY+8QQL1HGCUI+q+pEicMpCCLIJODvwha4CvoCQqSRtQ5dPanFE71qq4lt04r04fcPxXX2GFmvRAns+1i+wll6WEEwG9zvdMQ+2ivxEOPVW6VeAOdMEzyhv+DzUeNXhvxtwrFbbQUbprRc8wc2llFJbzTrhDN27QQKBgQDSp+Tw9a9sVK7uIxyzv0fTFExj4JEQPqb6PZ5SNkNKe79tmPQJQUzFHTfnmGSfYRva51N9fG5gV7mQFbYqTgmRl+YwTD2CWMROpyTCOgjavmjt6z1pAZnh6Nz1dIGr4QhJzBaymMEqBQ7VIOi2keqeIsz8EhXfzUixnCHJP0j06QKBgQDaCUmuuBewby/zW1KkYMv0vyX/KS/70sl815oym39DMhndbo0Q62p44tPiDTY3g0W8MLQVg2zY4amfxZy3Czmu+bD6htK4nFxhmG76tz3WC6XKZx8OPvvp2SJcUo6hMNgb8vGWMsua9Wc2HOhHoQMCXgxjCkSd/+AFLK/wGbwC9wKBgAkQeGV17Op4al6M3DtPy8NlaDQUAan1SDIUXK+k7hhSYtZQco/DY45Hx5QLlqjVAOHWel038XfrzmxIwuHnIbpGEv2ZCjyFnUzVHFvPK3peHx29tZLDIt/5qShWrw26TST/xypAMG+icBTzqY/Rj4rmbHOcQ5yxtKMP2NRUCMuhAoGBAIHi4Ir9zdbkFZuSPoP/yeBN8pOzdIs+gZsmUQxux3w/H1ti3RREOZQ0A+b42eBuCh/Wn6DlPvVgUQ0FyprcTAupYT2NDYC+XOYiyZH/kQ2uuJ//mGeDK8yd9jMrVx49G7BipHpGXjY8lLSOuezZxRIm9pgVaNT6tfg/K7wLiI33AoGAf4ePpmAP4/Q440iecHgAW/48qg/4QlBNz3uXnJ07AG1dE7d11Snt1IpvDxURehuM5xMxp8VNSIlO+hZmyZxRdmpeGnHoh/6MfIhHpNI+ghzcVxHeBCNWin9sejrncMrErVtvchjRg/5lgUMKX4SxxZu5mhlXPjJf57vASPTgbvk=');

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
(8, 4, 1, 5);

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
(24, 2, 2, 'studio', 3, 99);

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
(2, 1, 5),
(3, 1, 2),
(4, 5, 2),
(5, 5, 6);

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
(3, 'tent'),
(4, 'river'),
(5, 'waterActivity'),
(6, 'activity');

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
  MODIFY `advertisementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `reservationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `tagNameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
