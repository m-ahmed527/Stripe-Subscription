-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 13, 2024 at 09:14 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stripe_subscription`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_05_03_000001_create_customer_columns', 1),
(5, '2019_05_03_000002_create_subscriptions_table', 1),
(6, '2019_05_03_000003_create_subscription_items_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2024_02_13_133423_create_plans_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `stripe_plan`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 'basic', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 10, 'Basic', '2024-02-13 11:34:02', '2024-02-13 11:34:02'),
(2, 'Premium', 'premium', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 100, 'Premium', '2024-02-13 11:34:02', '2024-02-13 11:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `type`, `stripe_id`, `stripe_status`, `stripe_price`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'sub_1OjOx0HQk1REbrVJ3frYrPw2', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 11:35:19', '2024-02-13 11:35:21'),
(2, 1, '1', 'sub_1OjP4GHQk1REbrVJzqgsm0tg', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 11:42:49', '2024-02-13 11:42:51'),
(3, 1, '1', 'sub_1OjPKvHQk1REbrVJFMXvVOoX', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 12:00:01', '2024-02-13 12:00:04'),
(4, 1, '1', 'sub_1OjPdHHQk1REbrVJ3s2pkhi2', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 12:19:00', '2024-02-13 12:19:02'),
(5, 1, '2', 'sub_1OjPhRHQk1REbrVJFrDlT01s', 'active', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, NULL, NULL, '2024-02-13 12:23:18', '2024-02-13 12:23:20'),
(6, 2, '2', 'sub_1OjRwfHQk1REbrVJpgGTrWYj', 'active', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, NULL, NULL, '2024-02-13 14:47:10', '2024-02-13 14:47:12'),
(7, 2, '2', 'sub_1OjS1pHQk1REbrVJIcLZPSeY', 'active', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, NULL, NULL, '2024-02-13 14:52:30', '2024-02-13 14:52:32'),
(8, 2, '1', 'sub_1OjSCuHQk1REbrVJQ2ZFq5XZ', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 15:03:57', '2024-02-13 15:03:59'),
(9, 2, '2', 'sub_1OjSHmHQk1REbrVJ0XdfNVtw', 'active', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, NULL, NULL, '2024-02-13 15:08:59', '2024-02-13 15:09:01'),
(10, 2, '1', 'sub_1OjSxcHQk1REbrVJC5BXhBYS', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 15:52:13', '2024-02-13 15:52:16'),
(11, 2, '1', 'sub_1OjSyiHQk1REbrVJcEdTyGa1', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 15:53:21', '2024-02-13 15:53:24'),
(12, 2, '2', 'sub_1OjT6uHQk1REbrVJVZBgtjsX', 'active', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, NULL, NULL, '2024-02-13 16:01:49', '2024-02-13 16:01:51'),
(13, 2, '1', 'sub_1OjT9JHQk1REbrVJN6j7scXm', 'active', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, NULL, NULL, '2024-02-13 16:04:19', '2024-02-13 16:04:21'),
(14, 2, '2', 'sub_1OjTCZHQk1REbrVJ4Hi7TMDW', 'active', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, NULL, NULL, '2024-02-13 16:07:40', '2024-02-13 16:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint UNSIGNED NOT NULL,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_product`, `stripe_price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 'si_PYVyp0Qd7sftX9', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 11:35:19', '2024-02-13 11:35:19'),
(2, 2, 'si_PYW62NfvjjpHH8', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 11:42:49', '2024-02-13 11:42:49'),
(3, 3, 'si_PYWNiUDT0DcZKz', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 12:00:02', '2024-02-13 12:00:02'),
(4, 4, 'si_PYWgIwEPkX3g2d', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 12:19:00', '2024-02-13 12:19:00'),
(5, 5, 'si_PYWkelNEOGc7jw', 'prod_PYVsihGfGIoMVJ', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, '2024-02-13 12:23:18', '2024-02-13 12:23:18'),
(6, 6, 'si_PYZ4FV2hlwlDTu', 'prod_PYVsihGfGIoMVJ', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, '2024-02-13 14:47:10', '2024-02-13 14:47:10'),
(7, 7, 'si_PYZASHgArfNoJg', 'prod_PYVsihGfGIoMVJ', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, '2024-02-13 14:52:30', '2024-02-13 14:52:30'),
(8, 8, 'si_PYZLgHEteNW0xj', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 15:03:57', '2024-02-13 15:03:57'),
(9, 9, 'si_PYZQrJRUuqJuNi', 'prod_PYVsihGfGIoMVJ', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, '2024-02-13 15:08:59', '2024-02-13 15:08:59'),
(10, 10, 'si_PYa7HxpLpTSZld', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 15:52:13', '2024-02-13 15:52:13'),
(11, 11, 'si_PYa98Gm3KE7OcH', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 15:53:21', '2024-02-13 15:53:21'),
(12, 12, 'si_PYaHXW9PmNrncK', 'prod_PYVsihGfGIoMVJ', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, '2024-02-13 16:01:49', '2024-02-13 16:01:49'),
(13, 13, 'si_PYaJVSG11z7LvV', 'prod_PYVrQopzOC8Up5', 'price_1OjOpnHQk1REbrVJ1YDeM3Gk', 1, '2024-02-13 16:04:19', '2024-02-13 16:04:19'),
(14, 14, 'si_PYaNzSkm9GBchx', 'prod_PYVsihGfGIoMVJ', 'price_1OjOqRHQk1REbrVJH6BnUr0h', 1, '2024-02-13 16:07:40', '2024-02-13 16:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Test', 'test@example.com', NULL, '$2y$12$ikBF6ocB7XvWmuu4m/w.6uVDe.RbEEFyNArhHg9CxdSD4tU3cM4ky', NULL, '2024-02-13 11:33:25', '2024-02-13 11:35:17', 'cus_PYVyc3GRg9oDUy', 'visa', '4242', NULL),
(2, 'Emma Hodge', 'zosa@mailinator.com', NULL, '$2y$12$26Q7SgAcSczU8YSWF9ewJOAfGP87f1N0o4YByakiTArLLk9G89Eo6', NULL, '2024-02-13 14:45:14', '2024-02-13 14:47:09', 'cus_PYZ4BKONAfAJMn', 'visa', '4242', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
