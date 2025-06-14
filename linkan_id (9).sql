-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 09:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linkan.id`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_products`
--

CREATE TABLE `affiliate_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appearances`
--

CREATE TABLE `appearances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL,
  `theme_color` varchar(255) NOT NULL DEFAULT '#000000',
  `font_family` varchar(255) NOT NULL DEFAULT 'Arial',
  `background_color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `instagram` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `discord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appearances`
--

INSERT INTO `appearances` (`id`, `user_id`, `banner`, `profile_image`, `name`, `bio`, `theme_color`, `font_family`, `background_color`, `instagram`, `tiktok`, `whatsapp`, `is_active`, `created_at`, `updated_at`, `linkedin`, `facebook`, `website`, `twitter`, `youtube`, `telegram`, `email`, `discord`) VALUES
(1, 1, 'appearances/banners/bMpHEbeJGy7lbZFpKa1XDfZHtKhiW3yn0QQS7GCX.jpg', 'appearances/profiles/1TaVq1bsexo7wq0DmDEg7MQz66E0k59Bit6Q86c5.jpg', 'mrifqi', 'ini adalah contoh dari deskripsi profile (biodata)', '#ff0000', 'Arial', 'city light.png', 'https://www.instagram.com/mrifqiapp/', 'https://www.tiktok.com/@mrap3905', 'https://wa.me/6285320100971', 1, '2025-05-05 06:40:25', '2025-06-03 22:55:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, 'appearances/banners/eCf8Tbf157qyZUgPB9sihmPc2og7Fj7jTwC4TrKw.jpg', NULL, 'izzan', 'bejir', '#3b756f', 'Arial', 'sunset.png', NULL, NULL, NULL, 1, '2025-05-22 21:35:42', '2025-05-22 21:35:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 8, 'appearances/banners/k2Hc0v0xC2LNJc8Glv4NiWo7QEFPXMAiYmSoXyt5.jpg', 'appearances/profiles/Jn1Wa6Gsy90DIeBDDAY8DFUAi08o1odUTmgDxmPq.png', 'Fajar Ramadhan Mulyana S', 'bwahahahaa', '#FF9040', 'Arial', 'news paper.png', NULL, NULL, NULL, 1, '2025-05-23 00:10:02', '2025-05-23 00:10:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 9, 'appearances/banners/wn7rSE3SLgPkckx3Fkz0ceJkSFa3GzZzmpYStm0S.png', NULL, 'Coba Coba', 'bjbjjj', '#dda173', 'Arial', 'blue ocean.png', NULL, NULL, NULL, 1, '2025-05-23 06:26:46', '2025-05-23 06:26:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_products`
--

CREATE TABLE `digital_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `platform_type` enum('upload','dropbox','gdrive','other') NOT NULL,
  `platform_url` varchar(255) DEFAULT NULL,
  `platform_file` varchar(255) DEFAULT NULL,
  `has_quantity_limit` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(11) DEFAULT NULL,
  `button_text` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verification_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `rejection_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `digital_products`
--

INSERT INTO `digital_products` (`id`, `user_id`, `title`, `description`, `image`, `price`, `sale_price`, `platform_type`, `platform_url`, `platform_file`, `has_quantity_limit`, `quantity`, `button_text`, `is_active`, `created_at`, `updated_at`, `verification_status`, `rejection_reason`) VALUES
(1, 1, 'jual logo smang', 'blablabnla', 'product_images/SDGyxSalwRXmVj3IMaMZJor4NUebPFcvtiH7PW3x.png', 200000.00, NULL, 'upload', NULL, 'digital_products/ZnsdoFOSoQKQW6uXZCKUSP49YzshnvowmNPo3hzf.pdf', 0, NULL, 'buy_now', 1, '2025-04-24 11:04:50', '2025-06-11 08:28:43', 'approved', NULL),
(5, 1, 'jual logo linkan', 'ini adalah logo dari linkan blablbabla', 'product_images/bcQiD2T44gbw5vAEgeDb1mrBF35vDPZKDYwi2uig.png', 2000000.00, NULL, 'upload', NULL, 'digital_products/xRaZfkHx52gL72quLyjZjxckg1BTFjTFqHUe5bvh.pdf', 1, NULL, 'buy_now', 1, '2025-05-15 02:12:48', '2025-06-09 21:10:45', 'approved', NULL),
(6, 8, 'gambar bagus', 'bagus sekali', 'product_images/8nRFCtuIEIXt2g7YPTaMzmxe4YwXUNvQhQk14mmk.jpg', 20000.00, NULL, 'gdrive', 'https://drive.google.com/file/d/1CDmRRTt271ZWyQ4Hb7S-Zi5EkYE9HeCH/view?usp=drive_link', NULL, 1, NULL, 'buy_now', 1, '2025-05-23 00:09:17', '2025-06-12 09:26:17', 'rejected', 'copyright'),
(7, 8, 'Template Timeline Project PDF', '✅ Fitur Utama:\n-Format PDF siap pakai – tinggal cetak atau gunakan secara digital.\n-Desain bersih dan profesional – cocok untuk presentasi ke klien atau tim.\n-Struktur timeline mingguan/bulanan – fleksibel untuk berbagai jenis proyek.\n-Kolom aktivitas, tanggal, dan status – memudahkan pemantauan progres.\n-Editable (jika dibuka dengan PDF editor) – bisa diisi langsung di komputer.\n\n💼 Cocok untuk:\n-Manajer proyek\n-Freelance profesional\n-Startup & bisnis kecil\n-Mahasiswa atau dosen untuk keperluan akademik', 'product_images/hxoXDStB1aYxZ2UO0DKNY2JW7sPoB4jnK15uI6dJ.jpg', 5000.00, NULL, 'upload', NULL, 'digital_products/1TAgKwLDCowiOSa24NWBAWzQCt93sjCZ4YfYWANj.pdf', 1, NULL, 'buy_now', 1, '2025-05-28 13:41:02', '2025-06-12 09:26:06', 'approved', NULL),
(9, 1, 'jual logo smangas via drive', 'ini adalah logo via google drive', 'product_images/w63TPFP0LQLKYoySevLgkcYy9aVJWYqB2YldQl11.png', 1000000.00, NULL, 'gdrive', 'https://drive.google.com/file/d/1qno_Bd7kt4sxwsE-SEozxHh6yOeo3bWv/view?usp=drive_link', NULL, 1, NULL, 'buy_now', 1, '2025-06-03 00:58:53', '2025-06-09 21:07:48', 'approved', NULL),
(10, 1, 'gambar', 'ini gambar', 'product_images/UL96f6gpBZKZndFvoT4yWeyyw7QaponwSqHpQH3W.png', 20000.00, NULL, 'other', 'https://drive.google.com/drive/folders/1-Km59BYvDqf7men3sAC3Jx-YgJlQNC_B?usp=drive_link', NULL, 1, NULL, 'buy_now', 1, '2025-06-09 21:23:53', '2025-06-09 21:24:31', 'approved', NULL),
(11, 1, 'logo shopee', 'ini blablabalbala', 'product_images/E7h3tMcLCcC6T2Hh0OEhm5yHj5VbP8XkpmTnDAw1.png', 100000.00, NULL, 'upload', NULL, 'digital_products/27cvpI6M5AJQyMtPYk53avRxazPDZNRaILb1U0Zo.pdf', 1, NULL, 'buy_now', 1, '2025-06-12 23:21:01', '2025-06-12 23:23:10', 'rejected', 'copyright');

-- --------------------------------------------------------

--
-- Table structure for table `failed_callbacks`
--

CREATE TABLE `failed_callbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_processed` tinyint(1) NOT NULL DEFAULT 0,
  `processed_at` timestamp NULL DEFAULT NULL,
  `error_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_clicks`
--

CREATE TABLE `link_clicks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_id` varchar(255) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `link_clicks`
--

INSERT INTO `link_clicks` (`id`, `link_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 'mrap', '127.0.0.1', NULL, '2025-06-03 07:47:35', '2025-06-03 07:47:35'),
(2, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 07:50:25', '2025-06-03 07:50:25'),
(3, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 22:56:38', '2025-06-03 22:56:38'),
(4, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 23:10:07', '2025-06-03 23:10:07'),
(5, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 23:16:41', '2025-06-03 23:16:41'),
(6, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 23:39:39', '2025-06-03 23:39:39'),
(7, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 23:41:53', '2025-06-03 23:41:53'),
(8, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 23:47:36', '2025-06-03 23:47:36'),
(9, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 23:49:34', '2025-06-03 23:49:34'),
(10, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-09 19:05:59', '2025-06-09 19:05:59'),
(11, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-09 21:08:17', '2025-06-09 21:08:17'),
(12, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:25:16', '2025-06-12 07:25:16'),
(13, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:32:00', '2025-06-12 07:32:00'),
(14, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:32:04', '2025-06-12 07:32:04'),
(15, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:44:44', '2025-06-12 07:44:44'),
(16, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:46:12', '2025-06-12 07:46:12'),
(17, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:50:09', '2025-06-12 07:50:09'),
(18, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:53:46', '2025-06-12 07:53:46'),
(19, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:57:37', '2025-06-12 07:57:37'),
(20, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:01:33', '2025-06-12 08:01:33'),
(21, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:04:14', '2025-06-12 08:04:14'),
(22, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:07:38', '2025-06-12 08:07:38'),
(23, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:25:59', '2025-06-12 08:25:59'),
(24, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:33:23', '2025-06-12 08:33:23'),
(25, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:36:10', '2025-06-12 08:36:10'),
(26, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:36:43', '2025-06-12 08:36:43'),
(27, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 08:38:25', '2025-06-12 08:38:25'),
(28, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 09:09:35', '2025-06-12 09:09:35'),
(29, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 09:11:09', '2025-06-12 09:11:09'),
(30, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 09:16:00', '2025-06-12 09:16:00'),
(31, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 09:22:11', '2025-06-12 09:22:11'),
(32, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 09:39:34', '2025-06-12 09:39:34'),
(33, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 09:48:54', '2025-06-12 09:48:54'),
(34, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 18:35:16', '2025-06-12 18:35:16'),
(35, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 18:38:44', '2025-06-12 18:38:44'),
(36, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 18:41:38', '2025-06-12 18:41:38'),
(37, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 23:25:32', '2025-06-12 23:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `link_views`
--

CREATE TABLE `link_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_id` varchar(255) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `link_views`
--

INSERT INTO `link_views` (`id`, `link_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, 'mrap', '127.0.0.1', NULL, '2025-06-03 06:57:18', '2025-06-03 06:57:18'),
(2, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 07:29:20', '2025-06-03 07:29:20'),
(3, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 22:55:41', '2025-06-03 22:55:41'),
(4, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-09 07:00:51', '2025-06-09 07:00:51'),
(5, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-09 19:05:57', '2025-06-09 19:05:57'),
(6, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-11 08:22:43', '2025-06-11 08:22:43'),
(7, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 07:25:12', '2025-06-12 07:25:12'),
(8, 'mrap', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-12 18:35:12', '2025-06-12 18:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_21_000000_create_link_stats_tables', 1),
(5, '2024_03_21_000002_add_link_fields_to_users_table', 1),
(6, '2025_04_15_015600_add_google_id_to_users_table', 1),
(7, '2024_03_21_000003_create_digital_products_table', 2),
(8, '2025_05_11_092203_add_social_links_to_appearances_table', 3),
(9, '2025_05_23_031926_create_digital_product_orders_table', 4),
(10, '2025_05_23_062806_create_transactions_table', 5),
(11, '2025_05_23_063625_create_transactions_table', 6),
(12, '2024_03_21_create_failed_callbacks_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('mrifqiajipratama@gmail.com', '$2y$12$WQewqDzm14Kcdc/I7sNP6ulhkSZ4KU8ouZrytOh0s0ZFuHNytcLLC', '2025-05-13 06:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `payout_transactions`
--

CREATE TABLE `payout_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `method` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `external_transaction_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('876MumOzhu7CvtIWyBL2AbewWTvu87ecAI3gc7nj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzY1MVdRcERkaEtMVkRSU0RuOFNjY1JuaTR6d1QxOE44eXdTNU02NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749924286),
('dPCdNKCV5d9DKX7NRVDf33WGEv6Ltz4GwG4YDEyQ', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMU11Y3FsZzVHclNVbnB5eUdZeTBQdHc0TURtTDFJQWxjVmJLd2tUMyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovL2xvY2FsaG9zdDo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1OiJzdGF0ZSI7czo0MDoiR011RHozcW9sbUdWU2NCeGZZR3hUT1ZKb3RzY1d1MUlsUm9EVlZ2TyI7czo0OiJjYXJ0IjthOjE6e3M6MzoicXR5IjthOjE6e2k6MTtpOjI7fX19', 1749796273),
('o4nHX4XiIDBUhllTT80lMG96Kik3eMrsjQhwZOM1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVXJYRWJiaFVodFJrc0g4NnJpTHZDVXFaUm5CeHpaMmZJUkp5VFptRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbi9nb29nbGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjU6InN0YXRlIjtzOjQwOiJWdzFRbzBLRjFrODNsa2VQVzg4UExLa2dna2xqcVNaeTlyZEZqMWFSIjt9', 1749795576);

-- --------------------------------------------------------

--
-- Table structure for table `shortlinks`
--

CREATE TABLE `shortlinks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `destination` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shortlinks`
--

INSERT INTO `shortlinks` (`id`, `slug`, `destination`, `created_at`, `updated_at`) VALUES
(1, 'fajar', 'https://chatgpt.com/', '2025-05-02 09:33:42', '2025-05-02 09:33:42'),
(2, 'rifqi', 'https://fajar0411.github.io/Portofolio-Rifki.Aerial/', '2025-05-02 09:37:32', '2025-05-02 09:37:32'),
(3, 'test', 'https://fajar0411.github.io/Portofolio-Rifki.Aerial/', '2025-05-02 09:42:57', '2025-05-02 09:42:57'),
(4, 'aha', 'https://fajar0411.github.io/Portofolio-Rifki.Aerial/', '2025-05-02 09:48:38', '2025-05-02 09:48:38'),
(5, 'ggg', 'https://fajar0411.github.io/Portofolio-Rifki.Aerial/', '2025-05-02 09:50:00', '2025-05-02 09:50:00'),
(6, 'test1213', 'https://chatgpt.com/', '2025-05-23 06:27:23', '2025-05-23 06:27:23'),
(7, 'fajaraja', 'https://indobuzz.id/', '2025-06-03 23:03:24', '2025-06-03 23:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_name` varchar(255) NOT NULL,
  `buyer_email` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `product_id`, `buyer_name`, `buyer_email`, `qty`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ORDER-683025d00420e', 6, 'Fajar Ramadhan Ms', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-23 00:38:21', '2025-05-23 00:38:21'),
(2, 'ORDER-6836928542a32', 6, 'Fajar Ramadhan Ms', 'dhefajar0410@gmail.com', 2, 40000, 'success', '2025-05-27 21:36:09', '2025-05-27 21:36:09'),
(3, 'ORDER-68374d14cc5c5', 6, 'Fajar Ramadhan Ms', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 11:05:07', '2025-05-28 11:05:07'),
(4, 'ORDER-6837522d5dfb4', 6, 'Fajar Ramadhan Ms', 'sorenzgaming@gmail.com', 1, 20000, 'success', '2025-05-28 11:14:07', '2025-05-28 11:14:07'),
(5, 'ORDER-68375b0b12931', 6, 'Fajar Ramadhan Ms', 'sorenzgaming@gmail.com', 1, 20000, 'success', '2025-05-28 11:51:28', '2025-05-28 11:51:28'),
(6, 'ORDER-68375c2de2fc8', 6, 'rifqi', 'mrifqiap03@gmail.com', 1, 20000, 'success', '2025-05-28 11:56:25', '2025-05-28 11:56:25'),
(7, 'ORDER-68375e803b843', 6, 'Fajar Ramadhan Mulayana sidik', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 12:07:19', '2025-05-28 12:07:19'),
(8, 'ORDER-683760572f3e4', 6, 'ujang', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 12:14:16', '2025-05-28 12:14:16'),
(9, 'ORDER-683760f3e9d43', 6, 'ujangg', 'sorenzgaming@gmail.com', 1, 20000, 'success', '2025-05-28 12:16:38', '2025-05-28 12:16:38'),
(10, 'ORDER-683764c6bb5fe', 6, 'fajar ramadhan ujang', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 12:33:01', '2025-05-28 12:33:01'),
(11, 'ORDER-683765834ecb0', 6, 'rifqi', 'sorenzgaming@gmail.com', 1, 20000, 'success', '2025-05-28 12:36:09', '2025-05-28 12:36:09'),
(12, 'ORDER-683766ab71012', 6, 'tyan firzi', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 12:40:56', '2025-05-28 12:40:56'),
(13, 'ORDER-683767f402eba', 6, 'fajar ramadhan', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 12:46:26', '2025-05-28 12:46:26'),
(14, 'ORDER-68376ba995790', 6, 'indobuzz', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 13:02:22', '2025-05-28 13:02:22'),
(15, 'ORDER-68376c2d55847', 6, 'Fajar Ramadhan Mulayana sidik', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 13:04:40', '2025-05-28 13:04:40'),
(16, 'ORDER-68376dd9aed50', 6, 'Fajar Ramadhan Mulayana sidik', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 13:11:34', '2025-05-28 13:11:34'),
(17, 'ORDER-68376e5028f13', 6, 'Fajar Ramadhan Mulayana sidik', 'dhefajar0410@gmail.com', 1, 20000, 'success', '2025-05-28 13:13:32', '2025-05-29 13:13:32'),
(18, 'ORDER-683774fe3be66', 7, 'Fajar Ramadhan Mulayana sidik', 'sorenzgaming@gmail.com', 2, 10000, 'success', '2025-05-28 13:42:37', '2025-05-28 13:42:37'),
(19, 'ORDER-683ef49071c6d', 9, 'mrap', 'mrifqiap03@gmail.com', 1, 1000000, 'success', '2025-06-03 06:12:29', '2025-06-03 06:12:29'),
(20, 'ORDER-683fe0276e365', 9, 'mrap', 'mrifqiap03@gmail.com', 2, 2000000, 'failed', '2025-06-03 22:59:20', '2025-06-03 22:59:20'),
(21, 'ORDER-683fe355859f3', 5, 'mrap', 'mrifqiap03@gmail.com', 3, 6000000, 'pending', '2025-06-03 23:11:56', '2025-06-03 23:11:56'),
(22, 'ORDER-683fea333d504', 1, 'mrap', 'mrifqiap03@gmail.com', 1, 200000, 'success', '2025-06-03 23:40:23', '2025-06-03 23:40:23'),
(23, 'ORDER-683feb006a249', 1, 'mrap', 'mrifqiap03@gmail.com', 1, 200000, 'success', '2025-06-03 23:43:47', '2025-06-03 23:43:47'),
(24, 'ORDER-683fec0e6d409', 1, 'mrap', 'mrifqiap03@gmail.com', 1, 200000, 'success', '2025-06-03 23:48:11', '2025-06-03 23:48:11'),
(25, 'ORDER-683fec83a1faf', 1, 'mrap', 'mrifqiap03@gmail.com', 1, 200000, 'success', '2025-06-03 23:50:13', '2025-06-03 23:50:13'),
(29, 'ORDER-684afebd2b004', 5, 'rifqi ap', 'mrifqiap03@gmail.com', 1, 2000000, 'settlement', '2025-06-12 09:22:47', '2025-06-12 09:22:47'),
(30, 'ORDER-684b02ca93d0a', 5, 'rifqi ap', 'mrifqiap03@gmail.com', 1, 2000000, 'settlement', '2025-06-12 09:40:04', '2025-06-12 09:40:04'),
(31, 'ORDER-684b0501294db', 1, 'rifqi ap', 'mrifqiap03@gmail.com', 13, 2600000, 'success', '2025-06-12 09:49:36', '2025-06-12 09:49:36'),
(32, 'ORDER-684b805a28efb', 5, 'rifqi ap', 'mrifqiap03@gmail.com', 1, 2000000, 'success', '2025-06-12 18:35:55', '2025-06-12 18:35:55'),
(33, 'ORDER-684b812979e59', 9, 'ardy', 'ardydamar22@gmail.com', 1, 1000000, 'success', '2025-06-12 18:39:22', '2025-06-12 18:39:22'),
(34, 'ORDER-684bc467b8134', 1, 'mrap', 'mrifqiap03@gmail.com', 2, 400000, 'success', '2025-06-12 23:26:25', '2025-06-12 23:26:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `custom_link` varchar(255) DEFAULT NULL,
  `is_link_active` tinyint(1) NOT NULL DEFAULT 1,
  `role` enum('admin_seller','admin_platform') NOT NULL DEFAULT 'admin_seller',
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `custom_link`, `is_link_active`, `role`, `avatar`, `email`, `google_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `balance`) VALUES
(1, 'mrifqi', 'mrap', NULL, 1, 'admin_seller', NULL, 'mrifqiap03@gmail.com', '105024033295951860033', NULL, '$2y$12$NDp8hsiIvSM4RiDay/BH9.K5DRDrJVDrT2WfcbMMLpeF0K9b.udw6', NULL, '2025-04-24 10:52:46', '2025-05-15 18:10:48', 7800000.00),
(3, 'rifqi', 'admin', NULL, 1, 'admin_seller', NULL, 'rachaugy123@gmail.com', NULL, NULL, '$2y$12$eiMWxfcJmZTfp6Mqvl4LTudloCt4BSfti4Hxxdz4YUA.fTjpMRm/C', NULL, '2025-04-30 09:25:16', '2025-04-30 09:25:16', 0.00),
(4, 'hasbillah', 'hasbiadmin', NULL, 1, 'admin_platform', NULL, 'hasbillahizzan@gmail.com', NULL, NULL, '$2y$12$57pnU1mRgZWeD0tRADCUxeUnNj9jxaUUmPA7PeMfd//oG7sKet092', NULL, NULL, '2025-05-19 19:17:15', 0.00),
(6, 'indobuzz', 'admin1', NULL, 1, 'admin_platform', NULL, 'admin@gmail.com', NULL, NULL, '$2y$12$bZZQzFHEJ8sm/h94PHH/1eB5wcHlbcrJjB8Uwx1BRyM4wbmRllsc2', NULL, '2025-05-22 18:55:10', '2025-05-22 18:55:10', 0.00),
(7, 'izzan', 'mozzy', NULL, 1, 'admin_seller', NULL, 'hszannn@gmail.com', NULL, NULL, '$2y$12$1upyyvTiNu5nzGtmV7rtV.22txpaXuMUm4u6jOpSW8M1uC4DDaJhK', NULL, '2025-05-22 21:32:43', '2025-05-22 21:32:43', 0.00),
(8, 'Fajar Ramadhan Mulyana S', 'fajar', NULL, 1, 'admin_seller', NULL, 'dhefajar0410@gmail.com', '111927696868092660998', NULL, '$2y$12$dSrb8x0vOKqgdVrF0tWbOe975hlcnZfRJnypfwBYAnZ8xY7lAYon2', NULL, '2025-05-22 23:53:28', '2025-05-22 23:53:36', 370000.00),
(9, 'Coba Coba', 'coba', NULL, 1, 'admin_seller', NULL, 'coba@gmail.com', NULL, NULL, '$2y$12$VXM45vjbb5LgieYWxd3YPOjfcqLV7ays0M8sfBoLnYQujOgAXwS9W', NULL, '2025-05-23 06:22:13', '2025-05-23 06:22:13', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_payout_details`
--

CREATE TABLE `user_payout_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_type` varchar(50) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_payout_details`
--

INSERT INTO `user_payout_details` (`id`, `user_id`, `method_type`, `account_name`, `account_number`, `bank_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'DANA', 'mrap', '085320100971', NULL, '2025-06-12 07:16:27', '2025-06-12 18:11:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliate_products`
--
ALTER TABLE `affiliate_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `appearances`
--
ALTER TABLE `appearances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appearances_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `digital_products`
--
ALTER TABLE `digital_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `digital_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_callbacks`
--
ALTER TABLE `failed_callbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_clicks`
--
ALTER TABLE `link_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_views`
--
ALTER TABLE `link_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_seller_id_foreign` (`seller_id`),
  ADD KEY `orders_buyer_id_foreign` (`buyer_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payout_transactions`
--
ALTER TABLE `payout_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shortlinks`
--
ALTER TABLE `shortlinks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shortlinks_slug_unique` (`slug`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_order_id_unique` (`order_id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_custom_link_unique` (`custom_link`);

--
-- Indexes for table `user_payout_details`
--
ALTER TABLE `user_payout_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_payout_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliate_products`
--
ALTER TABLE `affiliate_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appearances`
--
ALTER TABLE `appearances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `digital_products`
--
ALTER TABLE `digital_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_callbacks`
--
ALTER TABLE `failed_callbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_clicks`
--
ALTER TABLE `link_clicks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `link_views`
--
ALTER TABLE `link_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_transactions`
--
ALTER TABLE `payout_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shortlinks`
--
ALTER TABLE `shortlinks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_payout_details`
--
ALTER TABLE `user_payout_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affiliate_products`
--
ALTER TABLE `affiliate_products`
  ADD CONSTRAINT `affiliate_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appearances`
--
ALTER TABLE `appearances`
  ADD CONSTRAINT `appearances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `digital_products`
--
ALTER TABLE `digital_products`
  ADD CONSTRAINT `digital_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payout_transactions`
--
ALTER TABLE `payout_transactions`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `digital_products` (`id`);

--
-- Constraints for table `user_payout_details`
--
ALTER TABLE `user_payout_details`
  ADD CONSTRAINT `fk_user_payout_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
