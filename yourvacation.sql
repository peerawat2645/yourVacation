-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2023 at 05:17 PM
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
(1, 'SmfFDGHXw/vS3umfMPQQoF7EO/MfV9pNe7xdGXA+2CvNe3/gsPuRtc1i4nBT+cNTx4bXSWZiu0srMBKqG8W15GPeAa5+7KYsVLp/7b5ClzWWmQYG2wKV7269oSqIqN7Fd8kEmGq1BEZqmpXoz4txeaAgl/8TFQz9uF40YrYxoKDxoDOHzljKGlQsCzSwUON6+sufajkMnDvXPIbB50JhzuSrX0gSWzMkIwG8DjhBpGVb/oEQwpRrWerZIEve85XYw0D7rfBys0yAq4nN3R6ZRsMGfZpH3ak27DrtD8aIznS+G8LJXBYQxgnEmTmcnurU3jh7vhqP1psI+1KF+UgQuw==', 1, 'S52RyarNOdbsuemdPioICSmvEQBsrDldtnyr3bD+t9qkwbqdswqIKQId6WejX80nfD2kVCOZi7uUzskG5Pz19kXmbeWAjZBPHsXsR774pCvCi6bqiDczv4IcNaxwZl+xdB7mX7t6BAfeyde7mtoSfCGAYtbDuwS9CdSeC1B5KuoU4CzX2Srfdihov7vC6EJxIc1kP8oUkbU0kAs19sUZZv8HwBVqFxlVmbh+INrioKUgHErYejgDPdh7GEcbucBtpdzyf5GIq0FooTvyVGCxa5x3Am1ydo9UG2QGdVB56UZDdF6I1hW8h1V2NPMbZ6WjMEiQ2Nrx9jvTT3u4N6E/+Q==', '2023-11-05 07:00:00', '2023-11-03 07:00:00', 'open', '2023-11-03 07:00:00', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCobdtAxoNTPHoQnxKCwxLgSAWiOBI5E1h5+fgIjekO7A9xxCVLLlIDs7YpiVNFVf/jXmhnrieCmK5Mk5I8/DHofkROKsWB6kCKgEmxNmrArLrmFaHXbGc+n/t02Soonld8BaAosvgl0z1V04EeUrNpKr6kORPJmWmd9/pjxWMSAkHvOPKtTO1bGcTuN2XQwd+uDu0UjGEn5gxwuAG0y4uLQ6VMbmUHpdQI5p9vHJdGt0VHFSrGPZy8bARXcgGrwAeDQsNwKyE7FMv/NHQktfP9pkjTfYgdtofZksOUW2nrrHJWmKucM8/bTiDExNjbJ6qBkC3VEf6kpEzf0AKGrulpAgMBAAECggEAU4NRLS+hKzL39WjihUrTf7jGblZuFrXUb3q19QvkbP04dTkEIuB/Uw2XO8Y3L1CClksX6pzMQ3GQLzEW2D1WQ8jj9nw3vYCY6vPMVl28lfevnmlIe6fpE4DA7oHFaSmGCF1Duhpvd1Xj+jvqsE3iXrmOmKAigxoZ5/Vuxmy3gFQm6zj1EuPwMusmWA9t+azt5NbmSuIk4EFhYeEHmnlMeN7tnV82BpRp629egIHb2ZyUd3VaANR7FumCvyY2MUl+Qz2F9bfUcG45qruzSvwKIoE1gsxhuDap5kXB7Agug6OQjQU7LLDyKO9l4Gi3DuQQSxilvOUQlCDaBOQ5+8H4lwKBgQDc6jMZIbjiSTSKtu9NK+i7fko/71qEMvZVs6v/72I/qOSoQ7wFyhjA2XJqOojYTyZTAniQQ4lPrUPQUID1QwpM698tEbeLfMYs39CJxyVrqyoO3GyfMsnsWMDMFhF7Wy9CUOrzvICp7haG9fvd56w2vus4TY1eBVJOedqwRaAbxwKBgQDDLbrCFvK5dXBzFOxnXjwAg0jjWQVSnZ9RTpcHxi8jLV7axys3ttJetYoV6DFo52euQsEDGP9K3rXdSvj2kzrg9JhxfncpCl44Ijg0QYAfJXy+CDWfCXLTAx8NNfG1p7Ft3CfBSeX+eHTptkegov/eSx+hA4H8DJK454aq7uDxTwKBgQCHLW/TAwWEwdK6xrGrgSDKCb8ZXDcBCcYeLvEijLKLzacNJ1VYHZAEAYq3YdX2tof2514quIi/DoCeaYRfj4QwCWzowRyU5+bD8rhCdm95cKUtrsdwqr1QOAbRWvebifJjG+yI9GGumZeDQeW6pVaFsVFxhFLqo0r35ixhDFmqZQKBgHYW4Pw1rj4PlC3M5wvTtDILPLpxTgsiWxZymmaVvkdmWBG+l6Np9fZfmGCQz/RMrip9MRKSuUOvZBG0HtXxVpps4x8oCSjHoSINcjwLtV0i7Up85RSIPvT02oC/trLV90AlB9imwYUplHMjWksS1ATHJyfgW3EImm1Nh+k8BtV5AoGAGyrma+F5RjpoKMjbTZmq64LdqBcc5e9H+f2afkN9UlpncKFrTLrq7ln2s+FG7mQEftj1N4+AtpUTKF7OjkYSxV4O9Gs6/Ob8yRuYDU9RSynQQuEDAcFIns5ZB5muqAXGSzxV/H2u67ZxWc1DQp/7SIK/Qnkr/Ozl3J8/66ztKaE='),
(2, 'SwZ2nLSscnqNfg7zRzGrIQwyrZTRpyDIVv+p/DZBOiajqP6weUkAw1PgYVRrhzzHn2SUe6z0zrVW4rElwlOIgjyfdhsnhfTVZAATLE5nlYu8NPWLR5UGfhpuhPspl0tdRwsk/qBSCZWvfvgKRpfN06Up127pb07EKGvmdusOCUfqsjB3+9csDPlg9l55sThKzXjuoaOVsmyt0cYr6qAjYbSr5VJ2bBxxv6oXW83wDfiIcEVoEliND/sJBCWYIQOZKxnxj+7N5rVHvJ2g5RmoEAOepiyNUcgwWmyghhcl+iZfuRZj6yZsvK8/+KTyTDDvoiDILjljUVB0Qn26NPT7DQ==', 1, 'cx9IhKfigspELKYSyD07RP4gOCNY++dZHuG1D3K1kodn834uYdNcZWV+ELBtkiNA2akddUYi+e9bAqvpLUdjNi0+2E5ST9pWYIOaiom9aKUCZKOK6YOvQOEmmaD3ZDCgvfwiBT9VGuZIL4t+A51rw0IEcuvu9pm7B35eCEhiS9W6qFdsecU1ZH+VJ5pBRAVVpaieOveB+s/CjhzQJhuzBVJN8L45or/elcMVAMe7L3fh4KyERXC4FpHeVepf/zl6Gw7dgksEZIO2BMpCHXJAX+LC9LFuuaLTn08Vs/0B0o397A/XiESBT/MR0DcGjOaUKv7pphDOkZVfg49LNtD8xA==', '2023-11-05 17:00:00', '2023-11-05 17:00:00', 'open', '2023-11-05 17:00:00', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDmLdUv7e3XFx5OdwUHP+tt91CN3FOOeHznYT1uRLwhV4p/BE21WJ5+Jk4KfbEGG784NtFeJj4iI2ZxZWba+LqMei8J0WBRr7uxbork7iM74B++gYrfbo7yzb67Q0RJsXmH97dHkhPR/FD8tysBeO8mJGMSmbtR7vF5da4nIfV1DrJPgCGiFbP5/kX9/l0wmibLDzEqH69C9M5b6buqr81+j/GOkLKwB47ShnKltXX+LwXHa2NPZMmIx2GHcmCrwOkzEt+Y3m9jZOkRHzFdC1Iw/dte9t/3hzQuzAppEDF9jhEuO5igzXeIILhMEjYzBvrDxtA1FRvs2lGOLzgOKNKzAgMBAAECggEAI1hTXa5D8Nzgbv0QvRnAHZ019eqou/5dc6w3YijU2KvYHQP8qMWoZMeeATdmyQDWvpuQT8xAiz5zWyNOhX5fKvYSJghMKY76G9dVJa05pNaYGUlMGV4hPkCAssG0CTri5hGQR8GzIHIFv6CiznGTC4DX48HOhVjTJKsA6Ipq5iPmdvPL2sNHDOXEOTPJr9oyicxpD8uNpPTANr7dNRScYxRDwY7Hban+VgHJkaH2LSwUwiEs81NK/Ew+zO2EOLzezyw3jPLDMDWO0RLD+Wwf9NlYNqlSZ6RlYlxr1Fj9JgpxgwdnEV97FRb5SjuR9WoMf5wQhNDOWfmRYwH6yrz8tQKBgQD9tyfpYYzB1aN9rFryfdothOTKIAZiUAS+BhG6TkzLDt6nxaS5kBxldtfd44sp6mRf0HEGfYYpmHQPz7jVyI9fJyoD6RxEuuCBc1rfFfSzZ5GGelIHvik4FdAGCEJxAfY7ueOtP/KHstRrvxTx3brsgx9wfCPGhgjXrlMBuWUFpQKBgQDoQGwxn7WoohOANuB1jpEOJX3BU/tfryWbgl8vv9SRUb9ipIs7I5IthG5l3Vuw2TACd2Sd9Hjzt9IdX6YUC5Mh+gaTyxJIF18sxhWypYNvtq4Z5rQbJBFGPoLZTdGK1RIQda5ensvxJ3m/dri0lLCG8Pqa9X2fW1j6Qq3oFu33dwKBgQCM+Xs8y05J2eppBx7VxKY5SrFRui+x6uJnr7mj+qPi5FVFhaV80h1lJ37UtP17gdjaAFj9ETw92o8KxhHe//ziE0HeQGXLrsbWRwGEGZAJK5AJ1+fCk6AVoNEguPAqGLv3/dcLSg/55JzxbZA2wEx/5G/QsbmzMoCxTxSiTaBbXQKBgFQopAwHV4hX0sEvIX73vlBl/X/Est4lVXdYcq2W0awm9zcDcQBpD1s3FdoLsGIREXiTUv55zCpkfdrvAftZhmNVenSrrWA6N969mLc3ir08cTIpizIai7fshvW/YSLxuq4ENr9Kw5QLPe7HUn79MkpzoBvuwSqxqzhkWSg0xt5ZAoGATlxc4byhZns3TPvMaLoaqXSCDV+GAa0ySTwp4Co9fBupfDH7y8kIL8zUrNQDj2kv7T97ihRlzsgX/VhzA1MBTa8ZwKn0cKPwl7B3kuDM3N6Y6afNKIeFsTsbIiamFfLS5MwZzL/qHEqOCiKVNUPq9jyPXAjn5rseI+Ws9+VYxBg='),
(3, 'hU9jaMIpa9KP3/Ei/Q2ZwmODtgUd6WYq0Me/Lfp+7oO9NRAM/2IQ2gFzC0Yut++qtdyOU0atkEDRMCwTM3yZpqjHI1JgLB1qFXEDJXuUQxL/aTZ0e9vYDJXJVVJisdJ2o6iv5iH+J4wWWQ34dNW2ZY5CW8559uqHg67VsRF4QkITM+FDDZDgwEJ7v73aYvKtiqGjqp2hSR/ng1nJTMHar+bvKox1deQH4U+Er1+9Zse9FK13iNNbzbYyal9zGQRnONT0ecsEyJ0TQar2+dM1p8XtTM/GRGhfo3sNIx+KSMOAhqS9mYFSh87nUYxzBiImwDo71VanpCm6hPNX6ikyYw==', 1, 'gWszeZbeDdFjRifxGCqBMVX5Yo+rZ24T/vONhRSGr+woiWpocMbdMf4WesXLsdwnWhfi1Z5zIO17tVBqy7yfnlBYm0TopsS7f5jKbluKhOxcSUCsLyl4P/tqzTgVVF9CpvRTqMhALYNavtVsy2kCyfoQI6Fy1ZBptqs8vq3rrlGfjGHKmE82yxJWOtlKRku9aixrW8o7fCMPgUtwNE5hz2aHJljQlApEiO8Fph+t7fTPNoKV9VZShZl4tEb7DBNGTfUON31QTfMJ61WWrN56FWXpS3eUWzN06W2hcHQwbrV1jVGHG/cfdLdqR6QIyoqqg8pM9ACvezijN6fiirXgDA==', '2023-11-05 17:57:00', '2023-11-05 19:56:00', 'open', '2023-11-05 17:57:00', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDC0bZDef/g+va3YlGcMnOzHtTAyqgWNcguS1hRr6D/SL6S1kyCiLZdOZqkFqhm5Rs1M2stJ211li7Hy+9mNT13oH0svnhjZikCP4ML/+Nt6vLpUiz6CwQ5wgaIUTOGUkg/XWZoDL/Vp+v7EKL37utV8Kq19QzDdWhQH89sZL5q3Y00YSSESUdex52XDoJzgIYFkuzjVLGEKChm6fhXDjMcYKVfjpJXVP8n73zkXZIG/XxmqxaywWzfz2WJxNffQOMj5R8Ku4ayu41yBo+FyCLjGIy3DfXDV1HB/QU411H3/XfLa7pU4n130j/zA6qUMln/9d+m+6sRD6zAQUcmsGnXAgMBAAECggEAWaZDZz2m4BLcoXre7y/QSibv5F/dhYruOU92rvBQ9+izucJfptnegXvWi5fZmq/nG040Da1NE4UutcZEvhXV2UzDDWoA4EzMpjovxb/VGmm5qmCkTdPv99wvQV+MhE0s7eu/CjaDuH/zea8oL0uEhCGhjOXdH7zRab2Zp9mcPnQyV74lzqzCf1Det3W0f6wSA71ndOd0eQXR53dojnfb0KqHjSv2q4pmxVLbQTLvl4QanMM6R09cDe/ECWyy1yZvnWEhzM1WAZ8Je1yaLAnUWN4BDsKDwJPWh6mH0SpK4mTxzd00ODPEsISVKGGZORwOcl5ZX4ImiiY0Zwj1+mo6cQKBgQD7zJHPY3XShNgdYQtDwMHJAi6xH/Km5wXqY/NepE8YGQqemwRnAdBuQ4/7FMrgE14k5WtZbTFC/zCx/FkWe56SYYP06Dgt0792xRCuhrsUxMlFfFxRvil4C6qD/T/GC3DoN+mv8ESRtExKLyneCxVhnk0Hi9fDOIhTIBAKdrf5VQKBgQDGEcgwXZDYQKLmMMe0vxDTdXMcwpgi4yDkpj1GyEmAbkF/xGQbjKaepV+nq21FQmqcADBzczfRwSVHwPUmbA+Xb+opN/ZyMWaCdfht755gjdSM4WWuHMftNNG8nQGrxHv0lYCy3QUIgPqHUeBFSe4Q2+xHroYaBy0GxCfStCUmewKBgA4wV+MU2rXTMI5vQoA9422dRt5KS5UmHYo4uaUSozZbauLHH3difclI21str8TysnJnzyXJ5mW9FZRiAO8oZiYfgp0RXOEQNpDNyAPdqbsg36qfuGAO1C1kkuY/JhHV4TXkuLFmW6bOPyJLCBPwEfNfRT3wnmbsz5nHi7/bMsDFAoGAcNIcJ4CESsm2gEv01T2oBer2oMEvC2A4kkUmzjSzuVYUNQTWyOJ63g7wx37cBQFp3GY3MuvENdRAufhtK2+OCgKTbNsVo8ID0/gChAxjODhRg9W3p095ieH2Peto0kBfItgtsLQ4c7mT+pRmnNEZq7y5f7Mna5f+y8XbsScvqhUCgYEAhEyTe+amxwzo9+gcMw+8WOcTNHZ/dnylosmMyrX3A0iCP5aFwgq++oD1YqCbhk+xhZ3/4jz8EaK2afN5J6yj167h+DUT4MErXlQNgUQiPA35stgZRwjTF3m/jBNAM6n87j+sqEe7tZF0ZZP6Xa+u4fC/+sovU5Jh5chAXxcFL0E='),
(4, 'G82TiolevFATCnl9gEt9RzVZKFlkCVFhmenzlNJbiqL4dtzRa2rqAP+ReMiARWIBK87ZmulDLZGSxbV73F9oek4rg0xXhLcV/e9LflM3SQveLHdAt20bNSy1o8hXpOCHFXfLgn43bUfeoOPsLy63jwlJ8jHaksma8GzYSorNiLyOhhh+E1PwSbHKBtO/x6Noqs1EVjE+bpX6xbj8ALGbYLz+l9ylFxcoRvE6wjKduxWqA9CqgZqqRK3/epFRM/+GrZqbs5Tx/FOhDOEzQ1r5khbml48LSEJZq8gGDKXtsHvAAuJ5eLkLAg2s1o+PWfPiybN0JV+i42TySZ8k+3Zaqg==', 1, 'rTHkcTdGln04C9x7Pi0g86Hc8fXmJPRk315+jTcVf5S0o1H7DQB8jcaU1NXL0+TLo/pgBSNCyaxurGrf1X2+ItU9yUX+77ja4Chx8g6fJ0X0Fhm2ToqRbWkpbYyTKmThde+2Cqx9UEl9ZQHEQUa7gv+7wrskXyJql+vs245OPVuCPGTB77QYWotSc5EhpN6GN8sOyCuoegxRJY+4dqpmWKoxnsO+lvuBll9FBLpj9sX2bIN7OZjf9En/hD89J7ISUwDuOsvzx/QX23JNraEslsi0+swPH+f6vIUnWl/6YP2EYjcgckpHYp4BI0r4aS7urC15JSawEKdF1hShYwhTVA==', '2023-11-05 22:17:00', '2023-11-05 23:16:00', 'open', '2023-11-05 22:17:00', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDJfe/GQqMItG1dtUJnHUkpQqDC+nmSCJhsYQzK29VQDUXvebLE1KRQh32Vk6AFw7+reKhRbNR/LTVzAj7ne/gyd14sKx47XyFWPsYawxdF9ZY2cupwoJqMOu81rajjlw1xCER3M/MHiQWtXNsqmtEO4XjglRLbMsc/M6P6J+Y5feAOLoXcrVPHCRKjTQnUImA1w64yx9w0fwkf1JsvBYOnDTT4GjZoeGCXdOdtnHHpzZ7DUh/pTDIlp0PCLHT/46AZ7sAL3jJuoLgFXyKrVVIa5ptrlayjukUpIKJTi8g3jFJVMID4g/EpFSN/b2KeHC9RAIZT09kChZfgPjrwMNBtAgMBAAECggEAKqF0m7P5npveD9eL5xkxI4OvU9F+60DaTwPxmvIMHdXRGCvdgPukkE06au1DDDUwVm0+34txIj9EccLl4EBAcR0EVcABs3obKY46h+sC/5BIadjCdXXlfQnzFp5Zf120QFgJdFcPcmaxRs7AqDD9TnKyCoI/7RS/R0X7ya+rbDovDRDvMKqra8IxFZUEmzW+wMozQZ9mU66yHTYra2ZElpCtSGReZ/2IppXo5F3uMz5L8/1qFZEJAKZ8a5pUgvS6mprrssQXwnO8cy83di7J8UlKaq5uMcfULEhjK4HdJFt+bCMk3uB25ejJfJHb11r9dOgw+8lV4U6BEmzu2sf9mQKBgQDMgdUE5CABohBuHx6pNkxhLMcqJ1B626BMxbEK7R/z81lik/2tT1I3VbUD+Tp3leX0LmE4YbWzLbwIygOKmvUh/bCUHx0I3uJ8UujF0OlykhvXrtB2WJIPaD0lwzes9CcI/ivh+EKyGgw//6Lt8WDp4alCafGJx9lFXJUE6Ez9jwKBgQD8Ob++dUlqGcpJUO11xTD60NfPx+stcp/uKlpZLGmH7q9bU1qg3wfMDmnmcL+4Nems1DR5u+PE6O/TgRmp3OCnZ5QNnYSFpFtCB/yJIx8tjh+WIr28sjbCXHrHHfQEG3fYZMMZCYkIStJmE844dv2SwelOGvOFytIW5oI7UPxMQwKBgByEomL7OOdhZS8mEc2A7+fBKcjcEKIBTHpIOycN6B3JupY/kul/HTTwM7zpHVkdwyJo8U++eGsTHpyPJy1F7Jcf3Gbba94XzreNjD5BorxCWbWbACDwuvWBEL3aWkI5DdR4NUBesVZKwZiPGnZZ6azTthm30mHnR4ofnfxANLRLAoGASCpBuT2XjrroTMfR2TNdSzX7uWBq4mr8ZUlK5l61pwXcuFWGBacqdPDezecOg6cxP5jLltTyW0GGdM5oSFiBEoSpMKgT5aTb022zjI02+3LBiNRR0y5uSnfpTRU93vr49DoINB6tTWkS/8/E3hT1gkrm9MjzSiF4sMKtGkmWlj8CgYBVqfhtXsP7CKlE7OtaFv+6Mcd/jKyFiWwBHbJUGlda6bBh2bS9IR9F4Uil8fnIhjkJeSv2IapS0XaZLIofqzEQJEuiY7VPRJ/5eEzZT2fuNGlQs4eWkE8KYRvWrakoWKzQ8mjfw8n9kNpGbAi0BxaxZ48kLaiJ8+vpPrWOsnPKag=='),
(5, 'dXrjizXvt424XWgfFxEeywt7FSErZOikfQohkJpjQM0IDdimoUx22BQZG0dByXEOiGJzwkxfsLeOGnB8ntX5GWVUXYzZhxMvXgt5+Pw3p/lP3TEU3yW9g0vbshcp/dpxl67vI3Tk98TfrTbPOcTFin2vrf3Zy0pTjWBq1NownoCDuRlNWpWRS3C60f332wnSj9ByjI7QuTwmwaLBmu3AFbzvfyos1UsQG6eIyKQcdDseAMNUSBAClu0NA3TdMSdd+f5SpEwb5m1XFeDyR/qoQtEZ3obhVo9++dZP9zIxy5VIjA+Pr6cJwVw1QWk+KpXCtGPy29mm+C0hA9ZFjq7YpQ==', 1, 'doxnReUT/b7eWcTyW+LbFDENcRoSqGjD7sBDwXz5+Fx6lj7eKQZSCYE/f/IZF+cOxfEM9IoNYwrchr5Lxy9UHxHAr343fiDwTkDtO4WS/ma5dkbqWiOSQO1IciLhMDU03taF3XhGCoImAZBxPlVMtuJalh+8AjAlpiWO5r90FHQd3UKZAkzhWo1eTFsoD1hMJEclbXr5Onhps0sa3Zd4ikOn0X0S2WjbBOcwPOUtiZUMgM3TdJwQySsJCWQ6aHFmJmxBNpkEiliqdtULCMd7CbwqawHwcwHM1A3fXF/2a8b7zlEcXBlG9uGjhdLQEpQWryERFiouudazomYeFFmcAw==', '2023-11-05 22:40:00', '2023-11-05 22:38:00', 'open', '2023-11-05 23:38:00', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCtIaFwno4aCAogbM2aNvnoa6lJX95DqcGYEKm8HGUqlYYhEWplGd6GsyIMV03ok62+VKaMZksjoi0k6MAPN+kJqUy1GitfcEyMxycE0cCF3UJLrXloHIXXc/yE2m0B8ls269ql3vi8PYjimJLlbeOr8t+WNjsBvOwDCA1BZr64n/+e83O4FputkmumnNh7r97SXzS3zCSUB1eBukyG+GQE7CV9PV/9Z0ko5SV+TCt3R+N5XfyipmFONPmSD+zKcQHvMzeAcmaZ3/VIgRjSQYq8jl5hiGUzaY++pkr98KWheUEilVap735AH/VSa30sg6FqlBbU0GOynZZopCqKIhDbAgMBAAECggEAEPVLA5BO9Ex2oXfG08+FabdR8kv0+2+0n259EbM+UuN+gIgHgeD8zk4xjD/o86+zbwHfpmpGpeDhccy9M0BouneIz0cW7yw9c0n2j8mehVOHhjN3Ft7kWpbpKczeAeN5UnHbuC+U8ZXywy9ABD+1SJxrkM0TDo0ww5iVo82qlMQorOB5EIzAVyGTqJqBin+8X9eD+f0RhEBmitS1g+ae3Jwyr7WnBjJpN5J/2jbS42GRwkm957NvZOdAeaOxKWz97d9oxGi6dhhpKgNmWqXb0BwJNFaBRQHiJBHfHvlKV1Fs3Z2Sklm3OgEigukqrzaA34Myh6sfMp7h7MVrgSe/QQKBgQDK1paO8TYfgbSq9Du/CVpJLDpg8ge6+/q1MKP5JyqQaHxEe/2dUMRszWdsGKZIrmu/P/v4PQ3u60zlGNRnHOl2xazLcBtMwJSCWV22PSRA/5UyusVgn3iI6jASqalo0mgXyhsNs3oEodLGhrpZbVbkmLlEfShOMsfF1domTxDocQKBgQDagdz9Mg3HfsQJ71ygi4OLTBLcsuA3BviOaFqBgPp2FZoZelzsSbsas/tXUXEl08THoStZEe2PKnbtOSBK2dDymhCeepKlco6OTRk25jG9vFdd4nx//A+U75RSTAUlBDIl2Q7yzKdXYuSmuZKpRl9GWa6AISRQZf11tw1ts9NUCwKBgErWaa5LqOBvBq2cdv7BAKLGwrNKGTgQCCwZyiX/IWEua8sIxEXqqs5J6sKjRZbDY9WoUdsBC8b+4dwVESkKLck4ncxhjHEBDMobFsxKOroQkoepCXHg5KP/Y8U++9ZE60r7soeXlIlo+09sHg0onkqxXom6c8iGS9beVCKWQXLBAoGBAJOzbLoJ955+Ze2BS0+KfuTOC4H7t+v6XlGE4IjhsmvXtk66k811GXC3cJJZju5O85ktrKuMntRDlBhOoTF3gvI6ijlWCYKkqRAvtXeSqtTiVvwzeIzayX2XZN8sW93ltDA5RQ2CoStEweKhVi3uT8CyJm6d+HoQNwA3OHCLObJ5AoGAZv2a7Jov0Wm5W8s4EQbfcw8I/+yApENYdKv5ODRbi0Yi8c3IFss7Drbap8X/huTbVCNX9nJhdAj6Hd2Fa4Z4bep4R+hTpa8r24WMTr9bfpasfySOr/p/SsvNEoaYU6y0OmRE5QDXEQ6xAg/JTJY7RKMR6LpTFWZOrNc4/03zCug=');

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
(6, 2, '47b2b665-cf96-4e76-8843-fd65689a0668.jpg'),
(7, 5, '470f48af-86a8-454a-a5ed-90b5ef1f83a4.jpg');

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
(5, 8, 1, 6);

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
(5, 'hotel', 8),
(6, 'hotel', 9),
(7, 'hotel', 10),
(8, 'hotel', 11);

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
(5, 2, 2, 'suite', 2000, 1),
(6, 2, 1, 'deluxe', 20000, 2);

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
(1, 1, 1);

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
(5, 'Peerawat', 'Wongmek', 'peace@gmail.com', 'username2', '$2a$10$MWwTWBADGUDdZ9ijVeViQuygISbGeI8JD1HQGs.KFfQDTIVCFxvXe', '0865118978', 0, 'asdasd'),
(6, 'peerawat', 'wongmek', 'username@gmail.com', 'username3', '$2a$10$dqZEzqyoYiDcKG5U5B.YfOxTvlHCAP/wf5YNqIDXXt9BXxnC7kP9G', '0982636676', 0, '12312ased'),
(7, 'asdas', 'asdasd', 'username2', 'username6', '$2a$10$ZWSthA07NfMHC1WrljSYV.vnOq.618ycxHzr/A/st..d4BzqWGosK', '0982636676', 0, '1231'),
(8, 'ads', 'asda', 'username2', 'username4', '$2a$10$fafocPeWzkETAWO5MMCFtey1ZailyXbIOcTeL7CYqxufqMEB8mDCO', '0982636676', 0, '12312'),
(9, 'peerawat', 'wongmek', 'username2', 'usern1m2', '$2a$10$UZf.exR1lUHgDFDMhU5Xu.3M7SY7FwlRO8PUSTrfAitfTbYFhuk1K', '0982636676', 0, '123'),
(10, 'peerawat', 'wongmek', 'username2', 'fsdrwer', '$2a$10$7fiyHxkK2VOlB3sztGxDWOeAI42.rUUZIIQFUoQxWk4mXB3RtzJWu', '0982636676', 0, '123'),
(11, 'peerawat', 'wongmek', 'username2', 'fsdrwer', '$2a$10$HbrTHBoJ59ytSx8J3rRVfeZ06G0zUDhrIQn/F4M7S7.Ceb9/udliW', '0982636676', 0, '123');

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
(1, 2, 5);

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
(1, 1, 'สุวรรณภูมิ', 'สนามบิน', 'บราๆๆ', 'tent'),
(2, 1, 'สุวรรณภูมิ2', 'สนามบิน', 'บราๆๆ', 'tent'),
(3, 1, 'สุวรรณภูมิ3', 'สนามบิน', 'บราๆๆ', 'tent');

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
  MODIFY `hotelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `reservationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subdistrict`
--
ALTER TABLE `subdistrict`
  MODIFY `subdistrictId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tagId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tagname`
--
ALTER TABLE `tagname`
  MODIFY `tagNameId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `userhotel`
--
ALTER TABLE `userhotel`
  MODIFY `userHotelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vacation`
--
ALTER TABLE `vacation`
  MODIFY `vacationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
