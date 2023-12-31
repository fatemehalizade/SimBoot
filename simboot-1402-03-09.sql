-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 01:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simboot`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summery` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `summery`, `description`, `created_at`, `image`) VALUES
(4, 'blog 1 title', 'summery blog 1', 'description blog 1', '2023-01-01 08:10:00', '75dc857617921289bd566e353267ece8.jpg'),
(5, 'blog 2', 'summery blog 2', 'dscription blog 2', '2023-01-01 00:11:00', 'af5bc51f336398bf0b5f6f0631ba783a.jpg'),
(6, 'blog 3 title', 'summery blog 3', 'description blog 3', '2023-01-01 08:47:00', '528735571f54aa088c2977961bbffbc5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `image`) VALUES
(1, 'vegetables', '2019-05-08 06:12:00', 'f8712465bc68740b83a19649f7403f8b.jpg'),
(3, 'category 2', '2023-01-01 04:00:00', 'fed170b6a3970a9f3d9d1a245965da26.png'),
(4, 'category 3', '2022-07-01 10:00:00', 'c6a551b973b2b9af5511b86b3eb4024e.jpg'),
(5, 'category 4', '2023-10-01 00:12:00', 'd5fbe38630a673e9590d412a286a6758.png');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `product_id_id`, `name`, `email`, `comment`, `created_at`) VALUES
(1, 2, 'ali alavi', 'ali@gmail.com', 'test comment', '2023-05-07 10:45:31');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `product_id_id` int(11) DEFAULT NULL,
  `percent` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `finish` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `product_id_id`, `percent`, `start`, `finish`, `created_at`) VALUES
(1, 3, 20, '2023-08-06 00:00:00', '2023-08-07 00:00:00', '2023-01-01 03:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230425093735', '2023-04-25 11:37:54', 56),
('DoctrineMigrations\\Version20230425110912', '2023-04-25 13:09:29', 378),
('DoctrineMigrations\\Version20230430072146', '2023-04-30 09:22:09', 102),
('DoctrineMigrations\\Version20230430073725', '2023-04-30 09:37:31', 17),
('DoctrineMigrations\\Version20230430083553', '2023-04-30 10:35:58', 14),
('DoctrineMigrations\\Version20230430085732', '2023-04-30 10:57:37', 314),
('DoctrineMigrations\\Version20230507064859', '2023-05-07 08:49:16', 183),
('DoctrineMigrations\\Version20230507074121', '2023-05-07 09:41:47', 173),
('DoctrineMigrations\\Version20230507075956', '2023-05-07 10:00:01', 17),
('DoctrineMigrations\\Version20230507080639', '2023-05-07 10:06:45', 17),
('DoctrineMigrations\\Version20230507083141', '2023-05-07 10:31:47', 80),
('DoctrineMigrations\\Version20230514062405', '2023-05-14 08:27:22', 72),
('DoctrineMigrations\\Version20230514062718', '2023-05-14 08:28:05', 77),
('DoctrineMigrations\\Version20230514091736', '2023-05-14 11:17:42', 151),
('DoctrineMigrations\\Version20230514104556', '2023-05-14 12:46:00', 472),
('DoctrineMigrations\\Version20230514123503', '2023-05-14 14:35:06', 20),
('DoctrineMigrations\\Version20230530102328', '2023-05-30 12:23:32', 18);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `product_id_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `product_id_id`, `image`, `created_at`) VALUES
(1, 3, 'e69643dd56ef7cf91277eb73c9f75730.jpg', '2023-09-13 11:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 'ali alavi', 'ali@gmail.com', 'test', 'test message . test message . test message . test message . test message . ', '2023-05-07 10:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_letter`
--

CREATE TABLE `news_letter` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_letter`
--

INSERT INTO `news_letter` (`id`, `email`, `created_at`) VALUES
(1, 'ali@yahoo.com', '2023-05-07 10:11:16'),
(2, 'test@gmail.com', '2023-05-30 08:37:46'),
(4, 'babol@gmail.com', '2023-05-30 08:47:37');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `ids` varchar(255) NOT NULL,
  `counts` varchar(255) NOT NULL,
  `totalprice` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `code`, `ids`, `counts`, `totalprice`, `created_at`) VALUES
(1, '26997', '5 3 6 4 ', '8 4 1 4 ', '380000', '2023-05-30 12:24:14'),
(3, '11860', '4 ', '1 ', '20000', '2023-05-30 12:30:10'),
(4, '65113', '4 5 6 ', '1 2 2 ', '100000', '2023-05-30 12:31:31'),
(5, '35320', '2 ', '3 ', '60000', '2023-05-30 13:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `description` longtext NOT NULL,
  `suggested` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id_id`, `name`, `image`, `price`, `description`, `suggested`, `created_at`) VALUES
(2, 1, 'product 1', 'b83b904cf348ba9e83380dd4c4b2e859.png', 20000, 'this is a plain text. this is a plain text. this is a plain text. this is a plain text. this is a plain text.', 1, '2023-05-08 07:07:00'),
(3, 3, 'product 2', 'b83b904cf348ba9e83380dd4c4b2e859.png', 30000, 'this is a plain text. this is a plain text. this is a plain text. this is a plain text.', 0, '2020-01-01 02:06:00'),
(4, 1, 'product 3', 'b83b904cf348ba9e83380dd4c4b2e859.png', 20000, 'this is a plain text. this is a plain text. this is a plain text. this is a plain text. this is a plain text.', 1, '2023-05-08 07:07:00'),
(5, 5, 'product 4', 'b83b904cf348ba9e83380dd4c4b2e859.png', 20000, 'this is a plain text. this is a plain text. this is a plain text. this is a plain text. this is a plain text.', 1, '2023-05-08 07:07:00'),
(6, 4, 'product 5', 'b83b904cf348ba9e83380dd4c4b2e859.png', 20000, 'this is a plain text. this is a plain text. this is a plain text. this is a plain text. this is a plain text.', 1, '2023-05-08 07:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `product_id`, `score`, `created_at`) VALUES
(1, 3, 5, '2023-05-14 08:38:34'),
(2, 3, 3, '2023-05-14 08:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `summery` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `summery`, `image`, `created_at`) VALUES
(1, 'title slider 1', 'summery slider 1', '5dafca0e145812d41f126cd5ac3b8f55.jpg', '2018-01-01 08:00:00'),
(2, 'title slider 2', 'summery slider 2', '2b8bf9f55f9cd9a2fd648ecf8d119dd1.png', '2018-01-01 09:00:00'),
(3, 'title slider 3', 'summery slider 3', '6a838a300446de117bae03bfe570609c.jpg', '2018-01-01 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(1, 'test@gmail.com', '', '$2y$13$/2rpmXXxfyTgBY5RPP0iaOVPHFuBoXZJa0jQRNPa7wLkYzTUtoEeq', 'fatemeh alizadeh');

-- --------------------------------------------------------

--
-- Table structure for table `web_site_profile`
--

CREATE TABLE `web_site_profile` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `address` varchar(255) NOT NULL,
  `tell` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_site_profile`
--

INSERT INTO `web_site_profile` (`id`, `name`, `logo`, `email`, `instagram`, `youtube`, `twitter`, `facebook`, `created_at`, `address`, `tell`) VALUES
(1, 'SimBoot', '107214c8b4d23f3ad395578e6c381b92.png', 'info@simboot.ir', 'https://instagram.com/simboot', 'https://youtube.com/simboot', 'https://twitter.com/simboot', 'https://facebook.com/simboot', '2023-04-30 10:19:00', 'iran mazandaran sari 2', '+98 939 129 5157');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CDE18E50B` (`product_id_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E1E0B40EDE18E50B` (`product_id_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_472B783ADE18E50B` (`product_id_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `news_letter`
--
ALTER TABLE `news_letter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD9777D11E` (`category_id_id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_329937514584665A` (`product_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `web_site_profile`
--
ALTER TABLE `web_site_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_letter`
--
ALTER TABLE `news_letter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_site_profile`
--
ALTER TABLE `web_site_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CDE18E50B` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `FK_E1E0B40EDE18E50B` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `FK_472B783ADE18E50B` FOREIGN KEY (`product_id_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD9777D11E` FOREIGN KEY (`category_id_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `FK_329937514584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
