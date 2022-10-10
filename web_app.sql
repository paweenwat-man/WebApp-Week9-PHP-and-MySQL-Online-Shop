-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2022 at 03:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`detail_id`, `order_id`, `product_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 1),
(4, 2, 6),
(5, 2, 4),
(6, 2, 6),
(7, 2, 9),
(8, 3, 1),
(9, 3, 3),
(10, 4, 1),
(11, 4, 5),
(12, 4, 9),
(13, 4, 4),
(14, 5, 1),
(15, 5, 1),
(16, 5, 10),
(17, 5, 41),
(18, 5, 4),
(19, 6, 9),
(20, 6, 31),
(21, 6, 3),
(22, 6, 9),
(23, 6, 41),
(24, 6, 3),
(25, 7, 1),
(26, 7, 2),
(27, 7, 1),
(28, 7, 10),
(29, 7, 41),
(30, 7, 42),
(31, 7, 50),
(32, 8, 1),
(33, 8, 5),
(34, 8, 10),
(35, 8, 9);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `fname` varchar(256) NOT NULL,
  `lname` varchar(256) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_date`, `fname`, `lname`, `address`, `mobile`) VALUES
(1, '2022-10-01 17:47:09', 'Paweenwat', 'Maneechai', '78/10', '0982467540'),
(2, '2022-10-01 21:48:26', 'Korawit', 'Orkphol', '54/26', '0819967831'),
(3, '2022-10-01 21:50:53', 'Paweenwat', 'Maneechai', '78/10', '0982467540'),
(4, '2022-10-01 21:51:55', 'Korawit', 'Orkphol', '54/26', '0819967831'),
(5, '2022-10-01 21:52:25', 'Korawit', 'Orkphol', '54/26', '0819967831'),
(6, '2022-10-01 21:54:39', 'Paweenwat', 'Maneechai', '78/10', '0982467540'),
(7, '2022-10-02 19:18:33', 'Korawit', 'Orkphol', '54/26', '0819967831'),
(8, '2022-10-10 20:09:53', 'ปวีณวัช', 'มณีฉาย', '199/1 มหาวิทยาลัยเกษตรศาสตร์ วิทยาเขตศรีราชา', '0800707318');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Louis Theroux: Savile (2016)', 'Louis Theroux: Savile (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTIxZDYyYWQtMjdlMC00MDkwLWIzZTMtOGVjYTI1Yzc3NDY4L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjYzMjA3NzI@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(2, 'Iliza Shlesinger: Confirmed Kills (2016)', 'Iliza Shlesinger: Confirmed Kills (2016)', 100, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZGEyYjkwMWItM2EyZS00N2Q1LWIzZmQtZDg5Y2ZmMzdlNTgyXkEyXkFqcGdeQXVyNjgzNzA2NjU@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(3, 'Gringo: The Dangerous Life of John McAfee (2016)', 'Gringo: The Dangerous Life of John McAfee (2016)', 170, 'https://images-na.ssl-images-amazon.com/images/M/MV5BN2RkMmNkYjktMjk2My00YjQxLTk5YmMtZTc1Y2YyMWY4ZmVjXkEyXkFqcGdeQXVyNTY1OTQ4MzQ@._V1_UY268_CR29,0,182,268_AL_.jpg'),
(4, 'Signed, Sealed, Delivered: Lost Without You (2016)', 'Signed, Sealed, Delivered: Lost Without You (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZjNlNmYxMDUtYzBmYS00NmIwLWE2MDAtOTE5ZDI4YjJjYmRhXkEyXkFqcGdeQXVyMTExNjAwNw@@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(5, 'Samurai Rauni Reposaarelainen (2016)', 'Samurai Rauni Reposaarelainen (2016)', 200, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNGI5ZGY2MzAtYjkyOC00YzNmLWFmYmMtNzZkOWM2ZTJlNmJjXkEyXkFqcGdeQXVyMjM5NjY2OTc@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(6, 'Autumn in the Vineyard (2016)', 'Autumn in the Vineyard (2016)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjQ0MTE0NTA2Nl5BMl5BanBnXkFtZTgwODE5MTIxMDI@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(7, 'Comedy Central Roast of Rob Lowe (2016)', 'Comedy Central Roast of Rob Lowe (2016)', 130, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYTg1ODJhMjYtYTg1ZC00NzI5LWE1MGMtZDBlOThmZjE4N2UxXkEyXkFqcGdeQXVyMTg0NDQwMw@@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(8, 'SmrtelnÌ© historky (2016)', 'SmrtelnÌ© historky (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNThlYWNjZjYtNGQxOC00NmI2LWE3MzYtYjY3NzAwMDY2MTA2XkEyXkFqcGdeQXVyMjQwNDExMTA@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(9, 'Siccin 3: CÌ_rmÌ_ Ask (2016)', 'Siccin 3: CÌ_rmÌ_ Ask (2016)', 180, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMzYyYWE2OWUtMmJlZS00YjNhLTgwYzgtZWZlYzU2NjAyZWMyXkEyXkFqcGdeQXVyMjQzMDU1Njc@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(10, 'The Magnitsky Act. Behind the Scenes (2016)', 'The Magnitsky Act. Behind the Scenes (2016)', 130, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYjQ0MjljNTktM2U0OS00YWY0LWJjM2UtMjUyMmZhZWMxYjY5XkEyXkFqcGdeQXVyMjMyNTg3OA@@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(11, 'Seneca\'s Day (2016)', 'Seneca\'s Day (2016)', 180, 'https://images-na.ssl-images-amazon.com/images/M/MV5BOGFlNGI1OGQtMzA3Yy00YjE4LTgzMmQtZDE0MzdmM2VlNDcyXkEyXkFqcGdeQXVyMjg5MjUyNQ@@._V1_UY268_CR4,0,182,268_AL_.jpg'),
(12, 'Batman: Return of the Caped Crusaders (2016)', 'Batman: Return of the Caped Crusaders (2016)', 100, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYzg0MmNlOTMtNTY3Yi00NmJhLWFjMWUtNzkzNzJjMDk2ZmJlXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UY268_CR14,0,182,268_AL_.jpg'),
(13, 'The Last Gold (2016)', 'The Last Gold (2016)', 170, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTcwMDUxOTY0NV5BMl5BanBnXkFtZTgwMjk3NTU4OTE@._V1_UY268_CR9,0,182,268_AL_.jpg'),
(14, 'Girl in the Box (2016)', 'Girl in the Box (2016)', 180, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZTRkZTY0MjgtZTgzNC00MmEwLWFkMGEtNzlhOTA0NTZhNTc2XkEyXkFqcGdeQXVyMjUxNzU1NjA@._V1_UY268_CR30,0,182,268_AL_.jpg'),
(15, 'Diggeri (2016)', 'Diggeri (2016)', 100, 'https://images-na.ssl-images-amazon.com/images/M/MV5BODNmYzZjMDUtMmFlZS00YmYzLTgzYzYtZTE0OGI5MTQ3OWEwXkEyXkFqcGdeQXVyMjI3NTI3Njc@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(16, 'Amanda Knox (2016)', 'Amanda Knox (2016)', 130, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNTY5NjE4MTQyNF5BMl5BanBnXkFtZTgwMzg1NjEwMDI@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(17, 'Russell Peters: Almost Famous (2016)', 'Russell Peters: Almost Famous (2016)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMzAwMjExNTgtYTMxZS00MmZkLTlkNmYtNGI1MzM0YjNlOTMzXkEyXkFqcGdeQXVyNjgyNjQzOTA@._V1_UY268_CR4,0,182,268_AL_.jpg'),
(18, 'David Cross: Making America Great Again (2016)', 'David Cross: Making America Great Again (2016)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZDc2YTVhYTEtZGM4Yi00N2U5LThmZTktMjQwNGY4OWM5NDQ3XkEyXkFqcGdeQXVyMjUzNTU5NjY@._V1_UY268_CR4,0,182,268_AL_.jpg'),
(19, 'Tell Me How I Die (2016)', 'Tell Me How I Die (2016)', 140, 'https://images-na.ssl-images-amazon.com/images/M/MV5BM2M2ZGM3OGQtYTAyMS00Y2M2LTllMDEtOTc3NmQ1YWEzOTFmXkEyXkFqcGdeQXVyMzU3NjA0MzU@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(20, 'Bad Dad Rehab (2016)', 'Bad Dad Rehab (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNjgyZDhjMDctZTkzYi00NjNjLTg4MmEtNzkxZTAxODcwMzFjXkEyXkFqcGdeQXVyNTU0ODIxMTQ@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(21, 'Asura (2016)', 'Asura (2016)', 180, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA5MzM5OTA4ODReQTJeQWpwZ15BbWU4MDQ1ODA2MjAy._V1_UY268_CR4,0,182,268_AL_.jpg'),
(22, 'Signed, Sealed, Delivered: One in a Million (2016)', 'Signed, Sealed, Delivered: One in a Million (2016)', 180, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZDMyMTNlZjQtZGE0Zi00MGI0LTgzNjItOGEwYTNhODNhNzk5XkEyXkFqcGdeQXVyNjgyMDAyMjg@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(23, 'Brian Posehn: Criminally Posehn (2016)', 'Brian Posehn: Criminally Posehn (2016)', 120, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4YzJlYmEtNmQ0NS00ZTk0LTg0MTgtMTFmMTEyMDE0NDAzXkEyXkFqcGdeQXVyNTU1NTQzMzk@._V1_UY268_CR4,0,182,268_AL_.jpg'),
(24, 'Blue Jay (2016)', 'Blue Jay (2016)', 170, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2Nzk4ODA2M15BMl5BanBnXkFtZTgwODA5MDExMDI@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(25, 'Teo-neol (2016)', 'Teo-neol (2016)', 150, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjE3ODYwODE2OV5BMl5BanBnXkFtZTgwMjM5ODA2OTE@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(26, 'Batman Unlimited: Mechs vs. Mutants (2016)', 'Batman Unlimited: Mechs vs. Mutants (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZWVhZTNmZTQtZTgwYS00YWE5LThjMjktMjFkNjEwYzdkODA2XkEyXkFqcGdeQXVyNDM1NDAyNDk@._V1_UY268_CR2,0,182,268_AL_.jpg'),
(27, '13th (2016)', '13th (2016)', 140, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjAwMjU5NTAzOF5BMl5BanBnXkFtZTgwMjQwODQxMDI@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(28, 'Dwayne Perkins: Take Note (2016)', 'Dwayne Perkins: Take Note (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMzQ4OWE5NjQtNmRkYy00MzBjLWE0YzUtYzAxMTUzMDk4ZDExXkEyXkFqcGdeQXVyNTQ5MzQ2NzM@._V1_UY268_CR4,0,182,268_AL_.jpg'),
(29, 'Jim Jefferies: Freedumb (2016)', 'Jim Jefferies: Freedumb (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYmZkZDFlMzAtNjQ5MS00NDE4LWEwMjktYTRmOTc3Mjc2NjI0XkEyXkFqcGdeQXVyMjQ4MzkyMjE@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(30, 'DC Super Hero Girls: Hero of the Year (2016)', 'DC Super Hero Girls: Hero of the Year (2016)', 130, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjk0N2VhOTYtMmQ3MC00ZjJiLWFhYmUtZDVhOWQzZDFkNTQ3XkEyXkFqcGdeQXVyNTk5Nzg0MDE@._V1_UY268_CR7,0,182,268_AL_.jpg'),
(31, 'My Summer Prince (2016)', 'My Summer Prince (2016)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNjYwMDc2NDg0MV5BMl5BanBnXkFtZTgwMjcwMzk0OTE@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(32, '#Pellichoopulu (2016)', '#Pellichoopulu (2016)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BN2M0ODhlNzAtYTNjMy00MjE0LWI3YjEtYTRmMjAwNmFlOTNlXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(33, 'Pete Johansson: You Might also Enjoy Pete Johansson (2016)', 'Pete Johansson: You Might also Enjoy Pete Johansson (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZjFmZTRhMmItMTBhYy00Yjg5LTk0MTUtNjMxMjAwNDI0YzY3XkEyXkFqcGdeQXVyNTQwMDk4NDM@._V1_UY268_CR4,0,182,268_AL_.jpg'),
(34, 'A Cinderella Story: If the Shoe Fits (2016)', 'A Cinderella Story: If the Shoe Fits (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMzljMmM0MjktNmRkMC00NWIyLTk3ZDEtNDk1NjNlODUzZjVhXkEyXkFqcGdeQXVyNDgwOTMyMTI@._V1_UY268_CR6,0,182,268_AL_.jpg'),
(35, 'Gentleman (2016)', 'Gentleman (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZGM0MWI3MDAtOGNjNC00OTUxLWFkMTYtOTQ2Njk0MWFjZDQ5XkEyXkFqcGdeQXVyNTE0NDY5Njc@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(36, 'El Bosco. El jardÌ_n de los sueÌ±os (2016)', 'El Bosco. El jardÌ_n de los sueÌ±os (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTliOTBmNTctMDVkZC00NTQ5LTliZTktNzBkYTFmYzk4NDdlXkEyXkFqcGdeQXVyNjczOTc2MzA@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(37, 'Sunspring (2016)', 'Sunspring (2016)', 100, 'https://images-na.ssl-images-amazon.com/images/M/MV5BY2Y0ZDE0MTUtMjkzZi00OTMzLWE1NjUtNmM5YmU4ZmVkYzMwXkEyXkFqcGdeQXVyMzg4MjI1MDU@._V1_UY268_CR225,0,182,268_AL_.jpg'),
(38, 'One More Time with Feeling (2016)', 'One More Time with Feeling (2016)', 170, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZjRkZGUzZWYtMjZmYS00NDVlLTk1MjctZDljNTNhMDE5NDU5XkEyXkFqcGdeQXVyMjM0MTE3ODQ@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(39, 'The Wedding March (2016)', 'The Wedding March (2016)', 170, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYWY1M2E0ZDAtMjkxYy00YmE5LTliMDAtMzhmZjRhYTc1Yzc2XkEyXkFqcGdeQXVyMzI4MzkxNTY@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(40, 'Nocno zivljenje (2016)', 'Nocno zivljenje (2016)', 200, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNTU1NjE2YWItOGI3MS00NDkzLWE5M2UtMDdiZjY3YzdhMGVkL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNzAwNjU5ODg@._V1_UY268_CR2,0,182,268_AL_.jpg'),
(41, 'Deon Cole: Cole Blooded Seminar (2016)', 'Deon Cole: Cole Blooded Seminar (2016)', 170, 'https://images-na.ssl-images-amazon.com/images/M/MV5BOWE4ODk5ZDctYTViNy00NWMxLTg0MDMtNTNlZmM4YzFmYWIwXkEyXkFqcGdeQXVyMjIyMjQyMw@@._V1_UY268_CR43,0,182,268_AL_.jpg'),
(42, 'Dan Soder: Not Special (2016)', 'Dan Soder: Not Special (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTUxOTg0NTc0M15BMl5BanBnXkFtZTgwMjY2NDAwOTE@._V1_UY268_CR9,0,182,268_AL_.jpg'),
(43, 'Terra (2015)', 'Terra (2015)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMzhlMzI1NTQtYWI1Yi00MzdiLWIyMGYtMzM1YmZjYjk5MGRhXkEyXkFqcGdeQXVyMzg1NTAxMzc@._V1_UY268_CR2,0,182,268_AL_.jpg'),
(44, 'Brexit: The Movie (2016)', 'Brexit: The Movie (2016)', 130, 'https://images-na.ssl-images-amazon.com/images/M/MV5BODE1MTY2N2UtZjk5Yi00MzBhLTliNDktZjIzYTdlNzI0OGI0XkEyXkFqcGdeQXVyNjcyMDg2NTM@._V1_UY268_CR99,0,182,268_AL_.jpg'),
(45, 'Chasing Great (2016)', 'Chasing Great (2016)', 110, 'https://images-na.ssl-images-amazon.com/images/M/MV5BOTVjMWRjNWQtYTc2YS00NTUzLTk1YjktMmZhYWQ1OTE3NzE0XkEyXkFqcGdeQXVyNjcxMDY5MzY@._V1_UY268_CR3,0,182,268_AL_.jpg'),
(46, 'Lifeline (2016)', 'Lifeline (2016)', 140, 'https://images-na.ssl-images-amazon.com/images/M/MV5BM2JjM2I5MmQtZDk4Yi00NjBlLTk2YTEtZjllNjlhYzZmNjg2XkEyXkFqcGdeQXVyNjcwNDc4NTA@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(47, 'Madaari (2016)', 'Madaari (2016)', 190, 'https://images-na.ssl-images-amazon.com/images/M/MV5BZDFjODM0NDAtNGJkZC00NmRiLWI3NmYtZDFkYmRhYmE4Zjk3XkEyXkFqcGdeQXVyNTIwODMzNjc@._V1_UY268_CR2,0,182,268_AL_.jpg'),
(48, 'Porta dos Fundos: Contrato VitalÌ_cio (2016)', 'Porta dos Fundos: Contrato VitalÌ_cio (2016)', 100, 'https://images-na.ssl-images-amazon.com/images/M/MV5BNWMwNzZlNzYtYTBiZi00NjQ5LWEyOWEtOTUwZDYyYjMzZmQ2XkEyXkFqcGdeQXVyMTkzODUwNzk@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(49, 'Busanhaeng (2016)', 'Busanhaeng (2016)', 160, 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTkwOTQ4OTg0OV5BMl5BanBnXkFtZTgwMzQyOTM0OTE@._V1_UX182_CR0,0,182,268_AL_.jpg'),
(50, 'Doua lozuri (2016)', 'Doua lozuri (2016)', 120, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYjdmYWUzMTUtMjViYy00ZTZjLWJiMGEtNzZmYmZmOTdkYTk5XkEyXkFqcGdeQXVyNDgxMDU4NTU@._V1_UY268_CR7,0,182,268_AL_.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
