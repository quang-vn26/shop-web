-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 30, 2021 lúc 08:37 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `new_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sản phẩm Hot', 'lorem-ipsum-is', '/storage/photos/1/Banner/banner-02.jpg', 'Khám phá những sản phẩm mới nhất<br>', 'active', '2020-08-14 01:47:38', '2021-12-27 06:39:56'),
(4, 'Giảm giá nhiều mặt hàng', 'banner', '/storage/photos/1/Banner/banner-06.jpg', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2021-12-27 06:40:17'),
(7, 'demo', 'demo', '/storage/photos/1/blog3.jpg', '<p>dđ<br></p>', 'inactive', '2021-10-28 20:48:25', '2021-12-27 06:38:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31'),
(7, 'OEM', 'oem', 'active', '2021-12-29 19:11:19', '2021-12-29 19:11:19'),
(8, 'Everest', 'everest', 'active', '2021-12-29 19:15:28', '2021-12-29 19:15:28'),
(9, 'AAA JEANS', 'aaa-jeans', 'active', '2021-12-29 19:28:17', '2021-12-29 19:28:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(4, 7, 2, 2, 1939.03, 'new', 1, 1939.03, '2020-08-14 22:13:51', '2020-08-14 22:14:59'),
(10, 10, NULL, 2, 270.00, 'new', 2, 570.00, '2020-08-17 21:07:33', '2021-11-27 22:22:40'),
(11, 9, NULL, 2, 190.00, 'new', 2, 380.00, '2020-08-17 21:08:35', '2021-11-27 22:22:40'),
(13, 10, NULL, 1, 270.00, 'new', 1, 300.00, '2021-11-27 15:07:46', '2021-11-27 15:09:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nam', 'mens-fashion', NULL, '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2020-08-14 04:26:15'),
(2, 'Nữ', 'womens-fashion', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2020-08-14 04:26:40'),
(3, 'Trẻ em', 'kids', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2020-08-14 04:27:42'),
(4, 'T-shirt\'s', 't-shirts', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:14', '2020-08-14 04:32:14'),
(5, 'Quần Jeans', 'jeans-pants', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:49', '2021-12-27 06:42:58'),
(6, 'Áo len & áo khoác', 'sweater-jackets', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:33:37', '2021-12-29 19:13:55'),
(7, 'Áo mưa', 'rain-coats-trenches', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:34:04', '2021-12-29 19:14:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '1111', 'percent', '40.00', 'active', NULL, '2021-12-29 19:57:44'),
(5, 'abcd', 'fixed', '250.00', 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', '2021-09-21 23:50:08', '2020-08-17 21:15:12', '2021-09-21 23:50:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('05f89d6c-6ab2-4897-80d1-de6c62ad969f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', '2021-11-27 22:29:25', '2021-11-27 22:22:40', '2021-11-27 22:29:25'),
('095ecaef-56bf-4883-bfd4-db27f6899184', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', '2021-09-21 23:48:31', '2021-09-19 19:10:06', '2021-09-21 23:48:31'),
('1cd32d89-45ac-4143-b8c7-ce0754e276a0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2021-11-04 21:19:01', '2021-11-04 21:19:01'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('2c299ef0-003d-491b-b698-bdd69d231071', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/gray-baby-rompers\",\"fas\":\"fa-star\"}', '2021-10-28 21:38:55', '2021-10-27 20:18:53', '2021-10-28 21:38:55'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('642d59a9-87d6-41d0-89f8-5109c15712a0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', '2021-12-29 06:21:01', '2021-12-27 04:02:41', '2021-12-29 06:21:01'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', '2021-09-19 03:25:36', '2020-08-17 21:17:03', '2021-09-19 03:25:36'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('f010108b-4f8c-4ca4-b555-efc3e37e4e1b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2021-11-27 22:30:43', '2021-11-27 22:30:43'),
('fd8b9c4a-bb32-411c-bc09-bfbfdbcc1ac5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2021-11-27 15:09:28', '2021-11-27 15:09:28'),
('fe685f36-18af-42dd-972d-09a7905e9a0e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fas fa-comment\"}', NULL, '2021-11-27 22:30:20', '2021-11-27 22:30:20'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(2, 'ORD-YFF8BF0YBK', 2, 1939.03, 1, NULL, 2039.03, 1, 'cod', 'unpaid', 'process', 'User', 'Rai', 'user@gmail.com', '90000000990', 'VN', NULL, ' 70 Đường Trần Đại Nghĩa, Hoà Hải, Ngũ Hành Sơn, Đà Nẵng', NULL, '2020-08-14 22:14:49', '2021-12-29 22:06:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from?', 'where-does-it-come-from', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text.&nbsp;</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</span><br></p>', '/storage/photos/1/Blog/blog1.jpg', '2020,Visit nepal 2020', 1, NULL, 2, 'active', '2020-08-14 01:55:55', '2020-08-14 04:29:56'),
(2, 'Where can I get some?', 'where-can-i-get-some', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, '/storage/photos/1/Blog/blog2.jpg', 'Enjoy', 2, NULL, 1, 'active', '2020-08-14 01:58:52', '2020-08-14 07:08:14'),
(3, 'The standard Lorem Ipsum passage, used since the 1500s', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', '', 3, NULL, 1, 'active', '2020-08-14 02:59:33', '2021-11-27 22:26:20'),
(5, 'The standard Lorem Ipsum passage,', 'the-standard-lorem-ipsum-passage', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '/storage/photos/1/Blog/blog2.jpg', ',Enjoy,2020,Visit nepal 2020', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, NULL, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, NULL, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, 3, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, 3, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
(8, 1, 6, 'hi', 'active', NULL, NULL, '2021-09-22 00:11:36', '2021-09-22 00:11:36'),
(9, 1, 6, 'aaaaa', 'active', NULL, 8, '2021-10-27 20:22:07', '2021-10-27 20:22:07'),
(10, 1, 6, 'hi, phần mềm còn hơi sơ sài', 'active', NULL, NULL, '2021-11-27 22:30:20', '2021-11-27 22:30:20'),
(11, 1, 6, 'Cần cải thiện thêm', 'active', NULL, 10, '2021-11-27 22:30:42', '2021-11-27 22:30:42'),
(12, 1, 3, 'qqqq', 'active', NULL, NULL, '2021-12-27 04:02:40', '2021-12-27 04:02:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, '2020', '2020', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
(3, 'Visit nepal 2020', 'visit-nepal-2020', 'active', '2020-08-14 01:54:33', '2020-08-14 01:54:33'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Melange Casual Black', 'melange-casual-black', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/405b7-pmtk004t.jpg,/storage/photos/1/Products/43f35-2_2.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 1, 1, 4, 4, '2020-08-14 04:38:26', '2020-08-14 04:42:46', 0),
(2, 'Áo thể thao màu trắng', 'white-sports-casual-t', '<p>Sản phẩm mới và thời trang nhất<br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/1d60f-2.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, 1, 1, 4, 2, '2020-08-14 04:40:21', '2021-12-27 06:53:32', 3),
(3, 'Áo dài tay', 'summer-round-neck-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/01bc5-mpd006b.jpg,/storage/photos/1/Products/0122b-wsd000t.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, 0, 1, NULL, 2, '2020-08-14 05:57:48', '2021-12-20 15:13:15', 3),
(4, 'Melange Ethnic Kurthi', 'melange-ethnic-kurthi', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/2282b-wsd008t.jpg,/storage/photos/1/Products/21951-image4xxl.jpg', 5, 'XL', 'default', 'active', 4000.00, 50.00, 0, 2, NULL, NULL, '2020-08-14 06:04:13', '2020-08-14 06:04:13', 0),
(5, 'Bộ Quần Áo Nữ Thời Trang Cao Cấp', 'cotton-high-quality-kurt', '<ul><li><strong>Set Quần Áo Nữ Thời Trang Cao Cấp</strong> sẽ là sự lựa chọn hoàn hảo cho bạn trong mùa hè này.</li><li>Với thiết kế kiểu đồ âu nhưng vô cùng&nbsp;thoải mái sẽ mang lại sự nữ \r\ntính và năng động cho bạn, bạn có thể mặc đi chơi, đi làm hay đi dự \r\ntiệc, đi du lịch đều được.</li><li>Vì thế ngày hôm nay mình sẽ giới thiệu đến các bạn nữ set áo phối \r\nquần thời trang mới đẹp hè này và hứa hẹn sẽ là một sự lựa chọn hợp lý, \r\nhoàn hảo cho các nàng.</li><li>Set đồ mang phong cách nữ tính nhưng lại sành điệu phá cách cho các bạn trẻ yêu thích thời trang.</li><li>Set đồ có thể phối cùng với giày cao gót, túi xá khi đi làm, đi chơi với gia đình bạn bè hay là hẹn hò với người yêu.</li></ul>', '<br>', '/storage/photos/1/Products/7.jpg', 10, 'M,XL', 'new', 'active', 400000.00, 10.00, 0, 2, NULL, 7, '2020-08-14 06:10:52', '2021-12-29 19:35:15', 0),
(6, 'Quần Jean Nữ Lưng Cao AAA JEANS', 'ladies-cotton-kurti-sha', '<h4><strong>Thông tin sản phẩm</strong></h4>\r\n<ul><li>Tên sản phẩm: Quần jean nữ lưng cao AAA JEANS</li><li>Dáng quần: Skinny</li><li>Kiểu lưng: Cao</li></ul>', '<h4 class=\"BlockTitle__Wrapper-sc-qpz3fo-0 eHltcn\">Mô Tả Sản Phẩm</h4><h4><strong>Thông tin sản phẩm</strong></h4>\r\n<ul><li>Tên sản phẩm: Quần jean nữ lưng cao AAA JEANS</li><li>Dáng quần: Skinny</li><li>Kiểu lưng: Cao</li><li>Size: 26, 27, 28, 29, 30, 31, 32</li><li>Chất liệu: 98% Cotton, 2% Spandex.</li><li>Xuất xứ: Việt Nam</li><li>Mạc da thương hiệu AAA JEANS phía sau lưng</li><li>Khóa kéo hiệu YKK</li><li><strong>Trường hợp cần đổi size hoặc sản phẩm lỗi quý \r\nkhách vui lòng chat với chúng tôi để được hỗ trợ đổi hàng tận\r\n nơi trên toàn quốc.</strong></li></ul>\r\n<p>&nbsp;</p>\r\n<p><strong>Thông số sản phẩm</strong></p>\r\n<p>Các bạn vui lòng xem kỹ thông tin sản phẩm để chọn size cho phù hợp.</p>\r\n<p><img src=\"https://salt.tikicdn.com/ts/tmp/30/80/e0/a306f595bc6c0e87b4d219b379456b6f.jpg\" alt=\"\" width=\"750\" height=\"681\"></p>\r\n<p><em>Nếu số đo của các chị nằm giữa 2 size và không biết chọn size nào thì các bạn nên chọn size nhỏ hơn do quần thun giãn nhiều.</em></p>\r\n<p>&nbsp;</p>\r\n<h4><strong>Hướng dẫn giặt sản phẩm</strong></h4>\r\n<ul><li>Không giặt chung với quần áo trắng</li><li>Lộn trái sản phẩm trước khi giặt</li><li>Không dùng thuốc tẩy</li><li>Giặt với nước ấm khi cần thiết</li><li>Không giặt khô</li><li>Tránh phơi trực tiếp sản phẩm dưới ánh nắng mặt trời</li></ul>\r\n<p>&nbsp;</p>\r\n<h4><strong>Cam kết của AAA JEANS</strong></h4>\r\n<ul><li>Các sản phẩm đều đúng như mô tả</li><li>Tất cả những hình ảnh sản phẩm của AAA JEANS đều là hình ảnh thực tế của sản phẩm chụp với mẫu thật.</li></ul>', '/storage/photos/1/Products/6.jpg', 6, 'M,L', 'hot', 'active', 900000.00, 3.00, 1, 2, NULL, 7, '2020-08-14 06:13:20', '2021-12-29 19:30:55', 0),
(7, 'SÉT BÔ SÁT NÁCH HÌNH CHÚ MÈO XINH TRAI', 'gray-baby-rompers', '<p>- Chất liệu được làm bằng 100% cotton 4 chiều Loại 1</p><p>- Kiểu dáng: áo SN, quần lửng chấm gối. Chạy viền nguyên bộ. In mèo ngộ nghĩnh đáng yêu</p>', '<br>', '/storage/photos/1/Products/5.jpg', 1, 'M,L', 'hot', 'active', 200000.00, 3.00, 0, 3, NULL, 7, '2020-08-14 06:23:33', '2021-12-29 19:23:37', 0);
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`, `user_id`) VALUES
(8, 'Áo thun polo nam có cổ chất liệu thun cá sấu thời trang Everest', 'baby-girls-2-piece-yell', '<span data-key=\"38\">Áo thun nam thời trang ngày nay rất được các bạn trẻ\r\n yêu thích. Áo thun đã có từ lâu đời nhưng trai qua thời gian và nhiều \r\nxu hướng mới nổi lên, nhưng áo thun chưa bao giờ bị lãng quên và lỗi \r\nmốt. Áo thun có thể mặc trong nhiều dịp khác nhau, từ đi làm đến đi \r\nchơi, dạo phố,… Chỉ cần bạn biết cách phối đồ một chút thì trong bạn sẽ \r\nthật sành điệu và thời trang. </span>', '<h1 data-spm-anchor-id=\"a1zawf.20777315.longDescription.i2.170a4edfrK1Mkz\"><span data-key=\"17\">Áo thun polo nam có cổ</span></h1>\r\n<ul><li><strong>Áo thun nam cổ bẻ thời trang&nbsp;</strong>thiết kế cổ bẻ, tay ngắn, mang đến phong cách khỏe khoắn, năng động</li><li>Thiết kế đơn giản, lịch sự,phù hợp với nhiều độ tuổi, mặc đượctrong nhiều hoàn cảnh khác nhau</li><li>Màu trơn đơn giản, tinh tế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam tính</li><li>Áo thun cá sấu Có nhiều màu sắc khác nhau cho bạn lựa chọn phù hợp với sở thích</li><li>Chất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mang lại cảm giác thoải mái khi mặc</li><li>Bạn có thể chọn kết hợp với quần jeans, đồng hồ thể thao và giày \r\nlười để tạo nên một set đồ hiện đại hoặc nhiều trang phục thời trang \r\nkhác</li></ul>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div data-slate-void=\"true\" data-key=\"35\"><img src=\"https://salt.tikicdn.com/ts/tmp/ef/80/0f/bbffe26b34600be10e39a04644cb7645.jpg\" alt=\"\" width=\"750\" height=\"500\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div><span data-key=\"38\"> Áo thun nam thời trang ngày nay rất được các \r\nbạn trẻ yêu thích. Áo thun đã có từ lâu đời nhưng trai qua thời gian và \r\nnhiều xu hướng mới nổi lên, nhưng áo thun chưa bao giờ bị lãng quên và \r\nlỗi mốt. Áo thun có thể mặc trong nhiều dịp khác nhau, từ đi làm đến đi \r\nchơi, dạo phố,… Chỉ cần bạn biết cách phối đồ một chút thì trong bạn sẽ \r\nthật sành điệu và thời trang. </span></div>\r\n<div><span data-key=\"41\"> Áo thun nam cổ bẻ thời trang có thiết kế tay ngắn, mang đến phong cách khỏe khoắn, năng động</span></div>\r\n<div data-spm-anchor-id=\"a1zawf.20777315.longDescription.i4.170a4edfrK1Mkz\"><span data-key=\"44\">\r\n Áo thun nam cổ bẻ thời trang có thiết kế tay ngắn, mang đến phong cách \r\nkhỏe khoắn, năng động. Thiết kế đơn giản, lịch sự, phù hợp với nhiều độ \r\ntuổi, mặc được trong nhiều hoàn cảnh khác nhau. Màu trơn đơn giản, tinh \r\ntế cùng với form áo rộng rãi, thoải mái giúp tôn được nét mạnh mẽ, nam \r\ntính. Phối logo thêu bên ngực trái, nhấn nhá làm tăng vẻ thời trang cho \r\nchiếc áo. Đặc biệt, áo có chất liệu thun cá sấu mềm mại, thấm hút mồ \r\nhôi, mang lại cảm giác thoải mái khi mặc.</span></div>\r\n<div data-spm-anchor-id=\"a1zawf.20777315.longDescription.i5.170a4edfrK1Mkz\"><span data-key=\"47\">\r\n Áo thun nam cổ bẻ này có nhiều size khác nhau cho bạn lựa chọn phù hợp \r\nvới dáng người, phù hợp nhiều lứa tuổi khác nhau, dù bạn là một cậu nhóc\r\n còn đi học hay là một anh chàng sành điệu đi làm công sở thì vẫn mặc \r\nđược. Áo được làm từ chất liệu thun cá sấu mềm mại, thấm hút mồ hôi, mặc\r\n thoải mái suốt cả ngày dài. Áo có màu xám thanh lịch, đỏ mạnh mẽ và màu\r\n vàng trẻ trung cho bạn phối với quần jean, short, giày,… khi đi làm, đi\r\n chơi với bạn bè. Hãy MUA NGAY cho mình một sản phẩm nhé, chúng tôi sẽ \r\ngiao hàng tận nơi cho bạn.</span></div>\r\n<div>&nbsp;</div>\r\n<div><span data-key=\"53\">ĐÔI NÉT VỀ SẢN PHẨM ÁO THUN NAM</span></div>\r\n<div><span data-key=\"56\">Áo thun nam là trang phục cơ bản và tiện dụng \r\nnhất đối với phái mạnh. Hầu như người đàn ông nào cũng đều phải có vài \r\nchiếc áo pull nam trong tủ áo của mình. Việc mua áo thun nam cũng được \r\nbàn tán sôi nổi trên khắp các diễn đàn hay blog cá nhân. Với những ưu \r\nđiểm tuyệt vời như phong cách đa dạng, kiểu dáng đơn giản và chất liệu \r\nthoáng mát, áo thun nam Hàn Quốc được phái mạnh yêu thích và lựa chọn \r\nkhi đến công sở hay dạo phố. Bên cạnh đó, áo thun nam cổ trụ cũng được \r\ncác chàng trai văn phòng yêu thích vì nét lịch sự và trẻ trung. Chỉ cần \r\nkết hợp áo thun nam body với quần jeans nam hay quần kaki nam và những \r\nphụ kiện đi kèm như ví nam, túi du lịch nam hay đơn giản hơn là chiếc \r\nbalo laptop namnăng động, bạn đã có ngay bộ cánh đơn giản mà hiện đại.</span></div>\r\n<div>&nbsp;</div>\r\n<div><span data-key=\"62\">CÁC KIỂU ÁO THUN NAM ĐẸP</span></div>\r\n<div>&nbsp;</div>\r\n<div data-slate-fragment=\"JTdCJTIyb2JqZWN0JTIyJTNBJTIyZG9jdW1lbnQlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTJDJTIyc3R5bGUlMjIlM0ElMjJtYXJnaW4lM0ElMjAwJTNCcGFkZGluZyUzQSUyMDguMHB4JTIwMCUzQndoaXRlLXNwYWNlJTNBJTIwcHJlLXdyYXAlM0IlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMnNwYW4lMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTJDJTIyc3R5bGUlMjIlM0ElN0IlMjJmb250RmFtaWx5JTIyJTNBJTIybm9uZSUyMiU3RCU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTJDJTIyc3R5bGUlMjIlM0ElMjJtYXJnaW4lM0ElMjAwJTNCcGFkZGluZyUzQSUyMDguMHB4JTIwMCUzQndoaXRlLXNwYWNlJTNBJTIwcHJlLXdyYXAlM0IlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMnNwYW4lMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjIlMkMlMjJtYXJrcyUyMiUzQSU1QiU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCUyQyU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMmgxJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiVDMyU4MW8lMjB0aHVuJTIwbmFtJTIwYyVDMyVCMyUyMGMlRTElQkIlOTUlMjIlMkMlMjJzdHlsZSUyMiUzQSUyMmZvbnQtZmFtaWx5JTNBJTIwbm9uZSUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMGMlQzMlQjMlMjBjJUUxJUJCJTk1JTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMGMlQzMlQjMlMjBjJUUxJUJCJTk1JTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJoMSUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlMjIlMkMlMjJzdHlsZSUyMiUzQSUyMnNpemUlM0ElMjAxLjBweCUzQl8taGFzaCUzQSUyMDguMDcwNDY0ZThweCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMnRleHQlMjIlMkMlMjJsZWF2ZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJsZWFmJTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMm1hcmtzJTIyJTNBJTVCJTVEJTdEJTVEJTdEJTVEJTdEJTVEJTdEJTJDJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIyd2lkdGglM0ElMjAxMDAuMCUyNSUzQmRpc3BsYXklM0ElMjBibG9jayUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyaW1hZ2UlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTJDJTIyc3JjJTIyJTNBJTIyaHR0cHMlM0ElMkYlMkZ2bi1saXZlLTAxLnNsYXRpYy5uZXQlMkZwJTJGNTA2N2ExYTI1MjdiNzNmYjM4OGQ5OTU4ZjcxM2NiODkuanBnJTIyJTJDJTIyc3R5bGUlMjIlM0ElMjJ3aWR0aCUzQSUyMDEwMC4wJTI1JTNCZGlzcGxheSUzQSUyMGJsb2NrJTNCJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjIlMkMlMjJtYXJrcyUyMiUzQSU1QiU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCUyQyU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMmRpdiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMHRoJUUxJUJCJTlEaSUyMHRyYW5nJTIwbmclQzMlQTB5JTIwbmF5JTIwciVFMSVCQSVBNXQlMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwYyVDMyVBMWMlMjBiJUUxJUJBJUExbiUyMHRyJUUxJUJBJUJCJTIweSVDMyVBQXUlMjB0aCVDMyVBRGNoLiUyMCVDMyU4MW8lMjB0aHVuJTIwJUM0JTkxJUMzJUEzJTIwYyVDMyVCMyUyMHQlRTElQkIlQUIlMjBsJUMzJUEydSUyMCVDNCU5MSVFMSVCQiU5RGklMjBuaCVDNiVCMG5nJTIwdHJhaSUyMHF1YSUyMHRoJUUxJUJCJTlEaSUyMGdpYW4lMjB2JUMzJUEwJTIwbmhpJUUxJUJCJTgxdSUyMHh1JTIwaCVDNiVCMCVFMSVCQiU5Qm5nJTIwbSVFMSVCQiU5QmklMjBuJUUxJUJCJTk1aSUyMGwlQzMlQUFuJTJDJTIwbmglQzYlQjBuZyUyMCVDMyVBMW8lMjB0aHVuJTIwY2glQzYlQjBhJTIwYmFvJTIwZ2klRTElQkIlOUQlMjBiJUUxJUJCJThCJTIwbCVDMyVBM25nJTIwcXUlQzMlQUFuJTIwdiVDMyVBMCUyMGwlRTElQkIlOTdpJTIwbSVFMSVCQiU5MXQuJTIwJUMzJTgxbyUyMHRodW4lMjBjJUMzJUIzJTIwdGglRTElQkIlODMlMjBtJUUxJUJBJUI3YyUyMHRyb25nJTIwbmhpJUUxJUJCJTgxdSUyMGQlRTElQkIlOEJwJTIwa2glQzMlQTFjJTIwbmhhdSUyQyUyMHQlRTElQkIlQUIlMjAlQzQlOTFpJTIwbCVDMyVBMG0lMjAlQzQlOTElRTElQkElQkZuJTIwJUM0JTkxaSUyMGNoJUM2JUExaSUyQyUyMGQlRTElQkElQTFvJTIwcGglRTElQkIlOTElMkMlRTIlODAlQTYlMjBDaCVFMSVCQiU4OSUyMGMlRTElQkElQTduJTIwYiVFMSVCQSVBMW4lMjBiaSVFMSVCQSVCRnQlMjBjJUMzJUExY2glMjBwaCVFMSVCQiU5MWklMjAlQzQlOTElRTElQkIlOTMlMjBtJUUxJUJCJTk5dCUyMGNoJUMzJUJBdCUyMHRoJUMzJUFDJTIwdHJvbmclMjBiJUUxJUJBJUExbiUyMHMlRTElQkElQkQlMjB0aCVFMSVCQSVBRHQlMjBzJUMzJUEwbmglMjAlQzQlOTFpJUUxJUJCJTg3dSUyMHYlQzMlQTAlMjB0aCVFMSVCQiU5RGklMjB0cmFuZy4lMjIlMkMlMjJzdHlsZSUyMiUzQSUyMm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMHRoJUUxJUJCJTlEaSUyMHRyYW5nJTIwbmclQzMlQTB5JTIwbmF5JTIwciVFMSVCQSVBNXQlMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwYyVDMyVBMWMlMjBiJUUxJUJBJUExbiUyMHRyJUUxJUJBJUJCJTIweSVDMyVBQXUlMjB0aCVDMyVBRGNoLiUyMCVDMyU4MW8lMjB0aHVuJTIwJUM0JTkxJUMzJUEzJTIwYyVDMyVCMyUyMHQlRTElQkIlQUIlMjBsJUMzJUEydSUyMCVDNCU5MSVFMSVCQiU5RGklMjBuaCVDNiVCMG5nJTIwdHJhaSUyMHF1YSUyMHRoJUUxJUJCJTlEaSUyMGdpYW4lMjB2JUMzJUEwJTIwbmhpJUUxJUJCJTgxdSUyMHh1JTIwaCVDNiVCMCVFMSVCQiU5Qm5nJTIwbSVFMSVCQiU5QmklMjBuJUUxJUJCJTk1aSUyMGwlQzMlQUFuJTJDJTIwbmglQzYlQjBuZyUyMCVDMyVBMW8lMjB0aHVuJTIwY2glQzYlQjBhJTIwYmFvJTIwZ2klRTElQkIlOUQlMjBiJUUxJUJCJThCJTIwbCVDMyVBM25nJTIwcXUlQzMlQUFuJTIwdiVDMyVBMCUyMGwlRTElQkIlOTdpJTIwbSVFMSVCQiU5MXQuJTIwJUMzJTgxbyUyMHRodW4lMjBjJUMzJUIzJTIwdGglRTElQkIlODMlMjBtJUUxJUJBJUI3YyUyMHRyb25nJTIwbmhpJUUxJUJCJTgxdSUyMGQlRTElQkIlOEJwJTIwa2glQzMlQTFjJTIwbmhhdSUyQyUyMHQlRTElQkIlQUIlMjAlQzQlOTFpJTIwbCVDMyVBMG0lMjAlQzQlOTElRTElQkElQkZuJTIwJUM0JTkxaSUyMGNoJUM2JUExaSUyQyUyMGQlRTElQkElQTFvJTIwcGglRTElQkIlOTElMkMlRTIlODAlQTYlMjBDaCVFMSVCQiU4OSUyMGMlRTElQkElQTduJTIwYiVFMSVCQSVBMW4lMjBiaSVFMSVCQSVCRnQlMjBjJUMzJUExY2glMjBwaCVFMSVCQiU5MWklMjAlQzQlOTElRTElQkIlOTMlMjBtJUUxJUJCJTk5dCUyMGNoJUMzJUJBdCUyMHRoJUMzJUFDJTIwdHJvbmclMjBiJUUxJUJBJUExbiUyMHMlRTElQkElQkQlMjB0aCVFMSVCQSVBRHQlMjBzJUMzJUEwbmglMjAlQzQlOTFpJUUxJUJCJTg3dSUyMHYlQzMlQTAlMjB0aCVFMSVCQiU5RGklMjB0cmFuZy4lMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMnRleHQlMjIlMkMlMjJsZWF2ZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJsZWFmJTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMCUyMCUyMCUyMCUyMCUyMCVDMyU4MW8lMjB0aHVuJTIwbmFtJTIwdGglRTElQkIlOURpJTIwdHJhbmclMjBuZyVDMyVBMHklMjBuYXklMjByJUUxJUJBJUE1dCUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjBjJUMzJUExYyUyMGIlRTElQkElQTFuJTIwdHIlRTElQkElQkIlMjB5JUMzJUFBdSUyMHRoJUMzJUFEY2guJTIwJUMzJTgxbyUyMHRodW4lMjAlQzQlOTElQzMlQTMlMjBjJUMzJUIzJTIwdCVFMSVCQiVBQiUyMGwlQzMlQTJ1JTIwJUM0JTkxJUUxJUJCJTlEaSUyMG5oJUM2JUIwbmclMjB0cmFpJTIwcXVhJTIwdGglRTElQkIlOURpJTIwZ2lhbiUyMHYlQzMlQTAlMjBuaGklRTElQkIlODF1JTIweHUlMjBoJUM2JUIwJUUxJUJCJTlCbmclMjBtJUUxJUJCJTlCaSUyMG4lRTElQkIlOTVpJTIwbCVDMyVBQW4lMkMlMjBuaCVDNiVCMG5nJTIwJUMzJUExbyUyMHRodW4lMjBjaCVDNiVCMGElMjBiYW8lMjBnaSVFMSVCQiU5RCUyMGIlRTElQkIlOEIlMjBsJUMzJUEzbmclMjBxdSVDMyVBQW4lMjB2JUMzJUEwJTIwbCVFMSVCQiU5N2klMjBtJUUxJUJCJTkxdC4lMjAlQzMlODFvJTIwdGh1biUyMGMlQzMlQjMlMjB0aCVFMSVCQiU4MyUyMG0lRTElQkElQjdjJTIwdHJvbmclMjBuaGklRTElQkIlODF1JTIwZCVFMSVCQiU4QnAlMjBraCVDMyVBMWMlMjBuaGF1JTJDJTIwdCVFMSVCQiVBQiUyMCVDNCU5MWklMjBsJUMzJUEwbSUyMCVDNCU5MSVFMSVCQSVCRm4lMjAlQzQlOTFpJTIwY2glQzYlQTFpJTJDJTIwZCVFMSVCQSVBMW8lMjBwaCVFMSVCQiU5MSUyQyVFMiU4MCVBNiUyMENoJUUxJUJCJTg5JTIwYyVFMSVCQSVBN24lMjBiJUUxJUJBJUExbiUyMGJpJUUxJUJBJUJGdCUyMGMlQzMlQTFjaCUyMHBoJUUxJUJCJTkxaSUyMCVDNCU5MSVFMSVCQiU5MyUyMG0lRTElQkIlOTl0JTIwY2glQzMlQkF0JTIwdGglQzMlQUMlMjB0cm9uZyUyMGIlRTElQkElQTFuJTIwcyVFMSVCQSVCRCUyMHRoJUUxJUJBJUFEdCUyMHMlQzMlQTBuaCUyMCVDNCU5MWklRTElQkIlODd1JTIwdiVDMyVBMCUyMHRoJUUxJUJCJTlEaSUyMHRyYW5nLiUyMCUyMiUyQyUyMm1hcmtzJTIyJTNBJTVCJTVEJTdEJTVEJTdEJTVEJTdEJTVEJTdEJTJDJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiVDMyU4MW8lMjB0aHVuJTIwbmFtJTIwYyVFMSVCQiU5NSUyMGIlRTElQkElQkIlMjB0aCVFMSVCQiU5RGklMjB0cmFuZyUyMGMlQzMlQjMlMjB0aGklRTElQkElQkZ0JTIwayVFMSVCQSVCRiUyMHRheSUyMG5nJUUxJUJBJUFGbiUyQyUyMG1hbmclMjAlQzQlOTElRTElQkElQkZuJTIwcGhvbmclMjBjJUMzJUExY2glMjBraCVFMSVCQiU4RmUlMjBraG8lRTElQkElQUZuJTJDJTIwbiVDNCU4M25nJTIwJUM0JTkxJUUxJUJCJTk5bmclMjIlMkMlMjJzdHlsZSUyMiUzQSUyMm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMGMlRTElQkIlOTUlMjBiJUUxJUJBJUJCJTIwdGglRTElQkIlOURpJTIwdHJhbmclMjBjJUMzJUIzJTIwdGhpJUUxJUJBJUJGdCUyMGslRTElQkElQkYlMjB0YXklMjBuZyVFMSVCQSVBRm4lMkMlMjBtYW5nJTIwJUM0JTkxJUUxJUJBJUJGbiUyMHBob25nJTIwYyVDMyVBMWNoJTIwa2glRTElQkIlOEZlJTIwa2hvJUUxJUJBJUFGbiUyQyUyMG4lQzQlODNuZyUyMCVDNCU5MSVFMSVCQiU5OW5nJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlQzMlODFvJTIwdGh1biUyMG5hbSUyMGMlRTElQkIlOTUlMjBiJUUxJUJBJUJCJTIwdGglRTElQkIlOURpJTIwdHJhbmclMjBjJUMzJUIzJTIwdGhpJUUxJUJBJUJGdCUyMGslRTElQkElQkYlMjB0YXklMjBuZyVFMSVCQSVBRm4lMkMlMjBtYW5nJTIwJUM0JTkxJUUxJUJBJUJGbiUyMHBob25nJTIwYyVDMyVBMWNoJTIwa2glRTElQkIlOEZlJTIwa2hvJUUxJUJBJUFGbiUyQyUyMG4lQzQlODNuZyUyMCVDNCU5MSVFMSVCQiU5OW5nJTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJkaXYlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJUMzJTgxbyUyMHRodW4lMjBuYW0lMjBjJUUxJUJCJTk1JTIwYiVFMSVCQSVCQiUyMHRoJUUxJUJCJTlEaSUyMHRyYW5nJTIwYyVDMyVCMyUyMHRoaSVFMSVCQSVCRnQlMjBrJUUxJUJBJUJGJTIwdGF5JTIwbmclRTElQkElQUZuJTJDJTIwbWFuZyUyMCVDNCU5MSVFMSVCQSVCRm4lMjBwaG9uZyUyMGMlQzMlQTFjaCUyMGtoJUUxJUJCJThGZSUyMGtobyVFMSVCQSVBRm4lMkMlMjBuJUM0JTgzbmclMjAlQzQlOTElRTElQkIlOTluZy4lMjBUaGklRTElQkElQkZ0JTIwayVFMSVCQSVCRiUyMCVDNCU5MSVDNiVBMW4lMjBnaSVFMSVCQSVBM24lMkMlMjBsJUUxJUJCJThCY2glMjBzJUUxJUJCJUIxJTJDJTIwcGglQzMlQjklMjBoJUUxJUJCJUEzcCUyMHYlRTElQkIlOUJpJTIwbmhpJUUxJUJCJTgxdSUyMCVDNCU5MSVFMSVCQiU5OSUyMHR1JUUxJUJCJTk1aSUyQyUyMG0lRTElQkElQjdjJTIwJUM0JTkxJUM2JUIwJUUxJUJCJUEzYyUyMHRyb25nJTIwbmhpJUUxJUJCJTgxdSUyMGhvJUMzJUEwbiUyMGMlRTElQkElQTNuaCUyMGtoJUMzJUExYyUyMG5oYXUuJTIwTSVDMyVBMHUlMjB0ciVDNiVBMW4lMjAlQzQlOTElQzYlQTFuJTIwZ2klRTElQkElQTNuJTJDJTIwdGluaCUyMHQlRTElQkElQkYlMjBjJUMzJUI5bmclMjB2JUUxJUJCJTlCaSUyMGZvcm0lMjAlQzMlQTFvJTIwciVFMSVCQiU5OW5nJTIwciVDMyVBM2klMkMlMjB0aG8lRTElQkElQTNpJTIwbSVDMyVBMWklMjBnaSVDMyVCQXAlMjB0JUMzJUI0biUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjBuJUMzJUE5dCUyMG0lRTElQkElQTFuaCUyMG0lRTElQkElQkQlMkMlMjBuYW0lMjB0JUMzJUFEbmguJTIwUGglRTElQkIlOTFpJTIwbG9nbyUyMHRoJUMzJUFBdSUyMGIlQzMlQUFuJTIwbmclRTElQkIlQjFjJTIwdHIlQzMlQTFpJTJDJTIwbmglRTElQkElQTVuJTIwbmglQzMlQTElMjBsJUMzJUEwbSUyMHQlQzQlODNuZyUyMHYlRTElQkElQkIlMjB0aCVFMSVCQiU5RGklMjB0cmFuZyUyMGNobyUyMGNoaSVFMSVCQSVCRmMlMjAlQzMlQTFvLiUyMCVDNCU5MCVFMSVCQSVCN2MlMjBiaSVFMSVCQiU4N3QlMkMlMjAlQzMlQTFvJTIwYyVDMyVCMyUyMGNoJUUxJUJBJUE1dCUyMGxpJUUxJUJCJTg3dSUyMHRodW4lMjBjJUMzJUExJTIwcyVFMSVCQSVBNXUlMjBtJUUxJUJCJTgxbSUyMG0lRTElQkElQTFpJTJDJTIwdGglRTElQkElQTVtJTIwaCVDMyVCQXQlMjBtJUUxJUJCJTkzJTIwaCVDMyVCNGklMkMlMjBtYW5nJTIwbCVFMSVCQSVBMWklMjBjJUUxJUJBJUEzbSUyMGdpJUMzJUExYyUyMHRobyVFMSVCQSVBM2klMjBtJUMzJUExaSUyMGtoaSUyMG0lRTElQkElQjdjLiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIybWFyZ2luJTNBJTIwMCUzQnBhZGRpbmclM0ElMjA4LjBweCUyMDAlM0J3aGl0ZS1zcGFjZSUzQSUyMHByZS13cmFwJTNCJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJzcGFuJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiVDMyU4MW8lMjB0aHVuJTIwbmFtJTIwYyVFMSVCQiU5NSUyMGIlRTElQkElQkIlMjB0aCVFMSVCQiU5RGklMjB0cmFuZyUyMGMlQzMlQjMlMjB0aGklRTElQkElQkZ0JTIwayVFMSVCQSVCRiUyMHRheSUyMG5nJUUxJUJBJUFGbiUyQyUyMG1hbmclMjAlQzQlOTElRTElQkElQkZuJTIwcGhvbmclMjBjJUMzJUExY2glMjBraCVFMSVCQiU4RmUlMjBraG8lRTElQkElQUZuJTJDJTIwbiVDNCU4M25nJTIwJUM0JTkxJUUxJUJCJTk5bmcuJTIwVGhpJUUxJUJBJUJGdCUyMGslRTElQkElQkYlMjAlQzQlOTElQzYlQTFuJTIwZ2klRTElQkElQTNuJTJDJTIwbCVFMSVCQiU4QmNoJTIwcyVFMSVCQiVCMSUyQyUyMHBoJUMzJUI5JTIwaCVFMSVCQiVBM3AlMjB2JUUxJUJCJTlCaSUyMG5oaSVFMSVCQiU4MXUlMjAlQzQlOTElRTElQkIlOTklMjB0dSVFMSVCQiU5NWklMkMlMjBtJUUxJUJBJUI3YyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjB0cm9uZyUyMG5oaSVFMSVCQiU4MXUlMjBobyVDMyVBMG4lMjBjJUUxJUJBJUEzbmglMjBraCVDMyVBMWMlMjBuaGF1LiUyME0lQzMlQTB1JTIwdHIlQzYlQTFuJTIwJUM0JTkxJUM2JUExbiUyMGdpJUUxJUJBJUEzbiUyQyUyMHRpbmglMjB0JUUxJUJBJUJGJTIwYyVDMyVCOW5nJTIwdiVFMSVCQiU5QmklMjBmb3JtJTIwJUMzJUExbyUyMHIlRTElQkIlOTluZyUyMHIlQzMlQTNpJTJDJTIwdGhvJUUxJUJBJUEzaSUyMG0lQzMlQTFpJTIwZ2klQzMlQkFwJTIwdCVDMyVCNG4lMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwbiVDMyVBOXQlMjBtJUUxJUJBJUExbmglMjBtJUUxJUJBJUJEJTJDJTIwbmFtJTIwdCVDMyVBRG5oLiUyMFBoJUUxJUJCJTkxaSUyMGxvZ28lMjB0aCVDMyVBQXUlMjBiJUMzJUFBbiUyMG5nJUUxJUJCJUIxYyUyMHRyJUMzJUExaSUyQyUyMG5oJUUxJUJBJUE1biUyMG5oJUMzJUExJTIwbCVDMyVBMG0lMjB0JUM0JTgzbmclMjB2JUUxJUJBJUJCJTIwdGglRTElQkIlOURpJTIwdHJhbmclMjBjaG8lMjBjaGklRTElQkElQkZjJTIwJUMzJUExby4lMjAlQzQlOTAlRTElQkElQjdjJTIwYmklRTElQkIlODd0JTJDJTIwJUMzJUExbyUyMGMlQzMlQjMlMjBjaCVFMSVCQSVBNXQlMjBsaSVFMSVCQiU4N3UlMjB0aHVuJTIwYyVDMyVBMSUyMHMlRTElQkElQTV1JTIwbSVFMSVCQiU4MW0lMjBtJUUxJUJBJUExaSUyQyUyMHRoJUUxJUJBJUE1bSUyMGglQzMlQkF0JTIwbSVFMSVCQiU5MyUyMGglQzMlQjRpJTJDJTIwbWFuZyUyMGwlRTElQkElQTFpJTIwYyVFMSVCQSVBM20lMjBnaSVDMyVBMWMlMjB0aG8lRTElQkElQTNpJTIwbSVDMyVBMWklMjBraGklMjBtJUUxJUJBJUI3Yy4lMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMnRleHQlMjIlMkMlMjJsZWF2ZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJsZWFmJTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMCUyMCUyMCUyMCUyMCUyMCUyMCUyMCVDMyU4MW8lMjB0aHVuJTIwbmFtJTIwYyVFMSVCQiU5NSUyMGIlRTElQkElQkIlMjB0aCVFMSVCQiU5RGklMjB0cmFuZyUyMGMlQzMlQjMlMjB0aGklRTElQkElQkZ0JTIwayVFMSVCQSVCRiUyMHRheSUyMG5nJUUxJUJBJUFGbiUyQyUyMG1hbmclMjAlQzQlOTElRTElQkElQkZuJTIwcGhvbmclMjBjJUMzJUExY2glMjBraCVFMSVCQiU4RmUlMjBraG8lRTElQkElQUZuJTJDJTIwbiVDNCU4M25nJTIwJUM0JTkxJUUxJUJCJTk5bmcuJTIwVGhpJUUxJUJBJUJGdCUyMGslRTElQkElQkYlMjAlQzQlOTElQzYlQTFuJTIwZ2klRTElQkElQTNuJTJDJTIwbCVFMSVCQiU4QmNoJTIwcyVFMSVCQiVCMSUyQyUyMHBoJUMzJUI5JTIwaCVFMSVCQiVBM3AlMjB2JUUxJUJCJTlCaSUyMG5oaSVFMSVCQiU4MXUlMjAlQzQlOTElRTElQkIlOTklMjB0dSVFMSVCQiU5NWklMkMlMjBtJUUxJUJBJUI3YyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjB0cm9uZyUyMG5oaSVFMSVCQiU4MXUlMjBobyVDMyVBMG4lMjBjJUUxJUJBJUEzbmglMjBraCVDMyVBMWMlMjBuaGF1LiUyME0lQzMlQTB1JTIwdHIlQzYlQTFuJTIwJUM0JTkxJUM2JUExbiUyMGdpJUUxJUJBJUEzbiUyQyUyMHRpbmglMjB0JUUxJUJBJUJGJTIwYyVDMyVCOW5nJTIwdiVFMSVCQiU5QmklMjBmb3JtJTIwJUMzJUExbyUyMHIlRTElQkIlOTluZyUyMHIlQzMlQTNpJTJDJTIwdGhvJUUxJUJBJUEzaSUyMG0lQzMlQTFpJTIwZ2klQzMlQkFwJTIwdCVDMyVCNG4lMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwbiVDMyVBOXQlMjBtJUUxJUJBJUExbmglMjBtJUUxJUJBJUJEJTJDJTIwbmFtJTIwdCVDMyVBRG5oLiUyMFBoJUUxJUJCJTkxaSUyMGxvZ28lMjB0aCVDMyVBQXUlMjBiJUMzJUFBbiUyMG5nJUUxJUJCJUIxYyUyMHRyJUMzJUExaSUyQyUyMG5oJUUxJUJBJUE1biUyMG5oJUMzJUExJTIwbCVDMyVBMG0lMjB0JUM0JTgzbmclMjB2JUUxJUJBJUJCJTIwdGglRTElQkIlOURpJTIwdHJhbmclMjBjaG8lMjBjaGklRTElQkElQkZjJTIwJUMzJUExby4lMjAlQzQlOTAlRTElQkElQjdjJTIwYmklRTElQkIlODd0JTJDJTIwJUMzJUExbyUyMGMlQzMlQjMlMjBjaCVFMSVCQSVBNXQlMjBsaSVFMSVCQiU4N3UlMjB0aHVuJTIwYyVDMyVBMSUyMHMlRTElQkElQTV1JTIwbSVFMSVCQiU4MW0lMjBtJUUxJUJBJUExaSUyQyUyMHRoJUUxJUJBJUE1bSUyMGglQzMlQkF0JTIwbSVFMSVCQiU5MyUyMGglQzMlQjRpJTJDJTIwbWFuZyUyMGwlRTElQkElQTFpJTIwYyVFMSVCQSVBM20lMjBnaSVDMyVBMWMlMjB0aG8lRTElQkElQTNpJTIwbSVDMyVBMWklMjBraGklMjBtJUUxJUJBJUI3Yy4lMjIlMkMlMjJtYXJrcyUyMiUzQSU1QiU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCUyQyU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMmRpdiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMGMlRTElQkIlOTUlMjBiJUUxJUJBJUJCJTIwbiVDMyVBMHklMjBjJUMzJUIzJTIwbmhpJUUxJUJCJTgxdSUyMHNpemUlMjBraCVDMyVBMWMlMjBuaGF1JTIwY2hvJTIwYiVFMSVCQSVBMW4lMjBsJUUxJUJCJUIxYSUyMGNoJUUxJUJCJThEbiUyMHBoJUMzJUI5JTIwaCVFMSVCQiVBM3AlMjB2JUUxJUJCJTlCaSUyMGQlQzMlQTFuZyUyMG5nJUM2JUIwJUUxJUJCJTlEaSUyQyUyMHBoJUMzJUI5JTIwaCVFMSVCQiVBM3AlMjBuaGklRTElQkIlODF1JTIwbCVFMSVCQiVBOWElMjB0dSVFMSVCQiU5NWklMjBraCVDMyVBMWMlMjBuaGF1JTJDJTIwZCVDMyVCOSUyMGIlRTElQkElQTFuJTIwbCVDMyVBMCUyMCUyMG0lRTElQkIlOTl0JTIwYyVFMSVCQSVBRHUlMjBuaCVDMyVCM2MlMjBjJUMzJUIybiUyMCVDNCU5MWklMjBoJUUxJUJCJThEYyUyMGhheSUyMGwlQzMlQTAlMjBtJUUxJUJCJTk5dCUyMGFuaCUyMGNoJUMzJUEwbmclMjBzJUMzJUEwbmglMjAlQzQlOTFpJUUxJUJCJTg3dSUyMCVDNCU5MWklMjBsJUMzJUEwbSUyMGMlQzMlQjRuZyUyMHMlRTElQkIlOUYlMjB0aCVDMyVBQyUyMHYlRTElQkElQUJuJTIwbSVFMSVCQSVCN2MlMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjLiUyMCVDMyU4MW8lMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwbCVDMyVBMG0lMjB0JUUxJUJCJUFCJTIwY2glRTElQkElQTV0JTIwbGklRTElQkIlODd1JTIwdGh1biUyMGMlQzMlQTElMjBzJUUxJUJBJUE1dSUyMG0lRTElQkIlODFtJTIwbSVFMSVCQSVBMWklMkMlMjB0aCVFMSVCQSVBNW0lMjBoJUMzJUJBdCUyMG0lRTElQkIlOTMlMjBoJUMzJUI0aSUyQyUyMG0lRTElQkElQjdjJTIwdGhvJUUxJUJBJUEzaSUyMG0lQzMlQTFpJTIwc3UlRTElQkIlOTF0JTIwYyVFMSVCQSVBMyUyMG5nJUMzJUEweSUyMGQlQzMlQTBpLiUyMCVDMyU4MW8lMjBjJUMzJUIzJTIwbSVDMyVBMHUlMjB4JUMzJUExbSUyMHRoYW5oJTIwbCVFMSVCQiU4QmNoJTJDJTIwJUM0JTkxJUUxJUJCJThGJTIwbSVFMSVCQSVBMW5oJTIwbSVFMSVCQSVCRCUyMHYlQzMlQTAlMjBtJUMzJUEwdSUyMHYlQzMlQTBuZyUyMHRyJUUxJUJBJUJCJTIwdHJ1bmclMjBjaG8lMjBiJUUxJUJBJUExbiUyMHBoJUUxJUJCJTkxaSUyMHYlRTElQkIlOUJpJTIwcXUlRTElQkElQTduJTIwamVhbiUyQyUyMHNob3J0JTJDJTIwZ2klQzMlQTB5JTJDJUUyJTgwJUE2JTIwa2hpJTIwJUM0JTkxaSUyMGwlQzMlQTBtJTJDJTIwJUM0JTkxaSUyMGNoJUM2JUExaSUyMHYlRTElQkIlOUJpJTIwYiVFMSVCQSVBMW4lMjBiJUMzJUE4LiUyMEglQzMlQTN5JTIwTVVBJTIwTkdBWSUyMGNobyUyMG0lQzMlQUNuaCUyMG0lRTElQkIlOTl0JTIwcyVFMSVCQSVBM24lMjBwaCVFMSVCQSVBOW0lMjBuaCVDMyVBOSUyQyUyMGNoJUMzJUJBbmclMjB0JUMzJUI0aSUyMHMlRTElQkElQkQlMjBnaWFvJTIwaCVDMyVBMG5nJTIwdCVFMSVCQSVBRG4lMjBuJUM2JUExaSUyMGNobyUyMGIlRTElQkElQTFuLiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIybWFyZ2luJTNBJTIwMCUzQnBhZGRpbmclM0ElMjA4LjBweCUyMDAlM0J3aGl0ZS1zcGFjZSUzQSUyMHByZS13cmFwJTNCJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJzcGFuJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiVDMyU4MW8lMjB0aHVuJTIwbmFtJTIwYyVFMSVCQiU5NSUyMGIlRTElQkElQkIlMjBuJUMzJUEweSUyMGMlQzMlQjMlMjBuaGklRTElQkIlODF1JTIwc2l6ZSUyMGtoJUMzJUExYyUyMG5oYXUlMjBjaG8lMjBiJUUxJUJBJUExbiUyMGwlRTElQkIlQjFhJTIwY2glRTElQkIlOERuJTIwcGglQzMlQjklMjBoJUUxJUJCJUEzcCUyMHYlRTElQkIlOUJpJTIwZCVDMyVBMW5nJTIwbmclQzYlQjAlRTElQkIlOURpJTJDJTIwcGglQzMlQjklMjBoJUUxJUJCJUEzcCUyMG5oaSVFMSVCQiU4MXUlMjBsJUUxJUJCJUE5YSUyMHR1JUUxJUJCJTk1aSUyMGtoJUMzJUExYyUyMG5oYXUlMkMlMjBkJUMzJUI5JTIwYiVFMSVCQSVBMW4lMjBsJUMzJUEwJTIwJTIwbSVFMSVCQiU5OXQlMjBjJUUxJUJBJUFEdSUyMG5oJUMzJUIzYyUyMGMlQzMlQjJuJTIwJUM0JTkxaSUyMGglRTElQkIlOERjJTIwaGF5JTIwbCVDMyVBMCUyMG0lRTElQkIlOTl0JTIwYW5oJTIwY2glQzMlQTBuZyUyMHMlQzMlQTBuaCUyMCVDNCU5MWklRTElQkIlODd1JTIwJUM0JTkxaSUyMGwlQzMlQTBtJTIwYyVDMyVCNG5nJTIwcyVFMSVCQiU5RiUyMHRoJUMzJUFDJTIwdiVFMSVCQSVBQm4lMjBtJUUxJUJBJUI3YyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MuJTIwJUMzJTgxbyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjBsJUMzJUEwbSUyMHQlRTElQkIlQUIlMjBjaCVFMSVCQSVBNXQlMjBsaSVFMSVCQiU4N3UlMjB0aHVuJTIwYyVDMyVBMSUyMHMlRTElQkElQTV1JTIwbSVFMSVCQiU4MW0lMjBtJUUxJUJBJUExaSUyQyUyMHRoJUUxJUJBJUE1bSUyMGglQzMlQkF0JTIwbSVFMSVCQiU5MyUyMGglQzMlQjRpJTJDJTIwbSVFMSVCQSVCN2MlMjB0aG8lRTElQkElQTNpJTIwbSVDMyVBMWklMjBzdSVFMSVCQiU5MXQlMjBjJUUxJUJBJUEzJTIwbmclQzMlQTB5JTIwZCVDMyVBMGkuJTIwJUMzJTgxbyUyMGMlQzMlQjMlMjBtJUMzJUEwdSUyMHglQzMlQTFtJTIwdGhhbmglMjBsJUUxJUJCJThCY2glMkMlMjAlQzQlOTElRTElQkIlOEYlMjBtJUUxJUJBJUExbmglMjBtJUUxJUJBJUJEJTIwdiVDMyVBMCUyMG0lQzMlQTB1JTIwdiVDMyVBMG5nJTIwdHIlRTElQkElQkIlMjB0cnVuZyUyMGNobyUyMGIlRTElQkElQTFuJTIwcGglRTElQkIlOTFpJTIwdiVFMSVCQiU5QmklMjBxdSVFMSVCQSVBN24lMjBqZWFuJTJDJTIwc2hvcnQlMkMlMjBnaSVDMyVBMHklMkMlRTIlODAlQTYlMjBraGklMjAlQzQlOTFpJTIwbCVDMyVBMG0lMkMlMjAlQzQlOTFpJTIwY2glQzYlQTFpJTIwdiVFMSVCQiU5QmklMjBiJUUxJUJBJUExbiUyMGIlQzMlQTguJTIwSCVDMyVBM3klMjBNVUElMjBOR0FZJTIwY2hvJTIwbSVDMyVBQ25oJTIwbSVFMSVCQiU5OXQlMjBzJUUxJUJBJUEzbiUyMHBoJUUxJUJBJUE5bSUyMG5oJUMzJUE5JTJDJTIwY2glQzMlQkFuZyUyMHQlQzMlQjRpJTIwcyVFMSVCQSVCRCUyMGdpYW8lMjBoJUMzJUEwbmclMjB0JUUxJUJBJUFEbiUyMG4lQzYlQTFpJTIwY2hvJTIwYiVFMSVCQSVBMW4uJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjAlMjAlMjAlMjAlMjAlMjAlMjAlMjAlQzMlODFvJTIwdGh1biUyMG5hbSUyMGMlRTElQkIlOTUlMjBiJUUxJUJBJUJCJTIwbiVDMyVBMHklMjBjJUMzJUIzJTIwbmhpJUUxJUJCJTgxdSUyMHNpemUlMjBraCVDMyVBMWMlMjBuaGF1JTIwY2hvJTIwYiVFMSVCQSVBMW4lMjBsJUUxJUJCJUIxYSUyMGNoJUUxJUJCJThEbiUyMHBoJUMzJUI5JTIwaCVFMSVCQiVBM3AlMjB2JUUxJUJCJTlCaSUyMGQlQzMlQTFuZyUyMG5nJUM2JUIwJUUxJUJCJTlEaSUyQyUyMHBoJUMzJUI5JTIwaCVFMSVCQiVBM3AlMjBuaGklRTElQkIlODF1JTIwbCVFMSVCQiVBOWElMjB0dSVFMSVCQiU5NWklMjBraCVDMyVBMWMlMjBuaGF1JTJDJTIwZCVDMyVCOSUyMGIlRTElQkElQTFuJTIwbCVDMyVBMCUyMCUyMG0lRTElQkIlOTl0JTIwYyVFMSVCQSVBRHUlMjBuaCVDMyVCM2MlMjBjJUMzJUIybiUyMCVDNCU5MWklMjBoJUUxJUJCJThEYyUyMGhheSUyMGwlQzMlQTAlMjBtJUUxJUJCJTk5dCUyMGFuaCUyMGNoJUMzJUEwbmclMjBzJUMzJUEwbmglMjAlQzQlOTFpJUUxJUJCJTg3dSUyMCVDNCU5MWklMjBsJUMzJUEwbSUyMGMlQzMlQjRuZyUyMHMlRTElQkIlOUYlMjB0aCVDMyVBQyUyMHYlRTElQkElQUJuJTIwbSVFMSVCQSVCN2MlMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjLiUyMCVDMyU4MW8lMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwbCVDMyVBMG0lMjB0JUUxJUJCJUFCJTIwY2glRTElQkElQTV0JTIwbGklRTElQkIlODd1JTIwdGh1biUyMGMlQzMlQTElMjBzJUUxJUJBJUE1dSUyMG0lRTElQkIlODFtJTIwbSVFMSVCQSVBMWklMkMlMjB0aCVFMSVCQSVBNW0lMjBoJUMzJUJBdCUyMG0lRTElQkIlOTMlMjBoJUMzJUI0aSUyQyUyMG0lRTElQkElQjdjJTIwdGhvJUUxJUJBJUEzaSUyMG0lQzMlQTFpJTIwc3UlRTElQkIlOTF0JTIwYyVFMSVCQSVBMyUyMG5nJUMzJUEweSUyMGQlQzMlQTBpLiUyMCVDMyU4MW8lMjBjJUMzJUIzJTIwbSVDMyVBMHUlMjB4JUMzJUExbSUyMHRoYW5oJTIwbCVFMSVCQiU4QmNoJTJDJTIwJUM0JTkxJUUxJUJCJThGJTIwbSVFMSVCQSVBMW5oJTIwbSVFMSVCQSVCRCUyMHYlQzMlQTAlMjBtJUMzJUEwdSUyMHYlQzMlQTBuZyUyMHRyJUUxJUJBJUJCJTIwdHJ1bmclMjBjaG8lMjBiJUUxJUJBJUExbiUyMHBoJUUxJUJCJTkxaSUyMHYlRTElQkIlOUJpJTIwcXUlRTElQkElQTduJTIwamVhbiUyQyUyMHNob3J0JTJDJTIwZ2klQzMlQTB5JTJDJUUyJTgwJUE2JTIwa2hpJTIwJUM0JTkxaSUyMGwlQzMlQTBtJTJDJTIwJUM0JTkxaSUyMGNoJUM2JUExaSUyMHYlRTElQkIlOUJpJTIwYiVFMSVCQSVBMW4lMjBiJUMzJUE4LiUyMEglQzMlQTN5JTIwTVVBJTIwTkdBWSUyMGNobyUyMG0lQzMlQUNuaCUyMG0lRTElQkIlOTl0JTIwcyVFMSVCQSVBM24lMjBwaCVFMSVCQSVBOW0lMjBuaCVDMyVBOSUyQyUyMGNoJUMzJUJBbmclMjB0JUMzJUI0aSUyMHMlRTElQkElQkQlMjBnaWFvJTIwaCVDMyVBMG5nJTIwdCVFMSVCQSVBRG4lMjBuJUM2JUExaSUyMGNobyUyMGIlRTElQkElQTFuLiUyMiUyQyUyMm1hcmtzJTIyJTNBJTVCJTVEJTdEJTVEJTdEJTVEJTdEJTVEJTdEJTJDJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIybWFyZ2luJTNBJTIwMCUzQnBhZGRpbmclM0ElMjA4LjBweCUyMDAlM0J3aGl0ZS1zcGFjZSUzQSUyMHByZS13cmFwJTNCJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJzcGFuJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJkaXYlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJUM0JTkwJUMzJTk0SSUyME4lQzMlODlUJTIwViVFMSVCQiU4MCUyMFMlRTElQkElQTJOJTIwUEglRTElQkElQThNJTIwJUMzJTgxTyUyMFRIVU4lMjBOQU0lMjIlMkMlMjJzdHlsZSUyMiUzQSUyMm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzQlOTAlQzMlOTRJJTIwTiVDMyU4OVQlMjBWJUUxJUJCJTgwJTIwUyVFMSVCQSVBMk4lMjBQSCVFMSVCQSVBOE0lMjAlQzMlODFPJTIwVEhVTiUyME5BTSUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJUM0JTkwJUMzJTk0SSUyME4lQzMlODlUJTIwViVFMSVCQiU4MCUyMFMlRTElQkElQTJOJTIwUEglRTElQkElQThNJTIwJUMzJTgxTyUyMFRIVU4lMjBOQU0lMjIlMkMlMjJtYXJrcyUyMiUzQSU1QiU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCUyQyU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMmRpdiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlQzMlODFvJTIwdGh1biUyMG5hbSUyMGwlQzMlQTAlMjB0cmFuZyUyMHBoJUUxJUJCJUE1YyUyMGMlQzYlQTElMjBiJUUxJUJBJUEzbiUyMHYlQzMlQTAlMjB0aSVFMSVCQiU4N24lMjBkJUUxJUJCJUE1bmclMjBuaCVFMSVCQSVBNXQlMjAlQzQlOTElRTElQkIlOTFpJTIwdiVFMSVCQiU5QmklMjBwaCVDMyVBMWklMjBtJUUxJUJBJUExbmguJTIwSCVFMSVCQSVBN3UlMjBuaCVDNiVCMCUyMG5nJUM2JUIwJUUxJUJCJTlEaSUyMCVDNCU5MSVDMyVBMG4lMjAlQzMlQjRuZyUyMG4lQzMlQTBvJTIwYyVDNSVBOW5nJTIwJUM0JTkxJUUxJUJCJTgxdSUyMHBoJUUxJUJBJUEzaSUyMGMlQzMlQjMlMjB2JUMzJUEwaSUyMGNoaSVFMSVCQSVCRmMlMjAlQzMlQTFvJTIwcHVsbCUyMG5hbSUyMHRyb25nJTIwdCVFMSVCQiVBNyUyMCVDMyVBMW8lMjBjJUUxJUJCJUE3YSUyMG0lQzMlQUNuaC4lMjBWaSVFMSVCQiU4N2MlMjBtdWElMjAlQzMlQTFvJTIwdGh1biUyMG5hbSUyMGMlQzUlQTluZyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjBiJUMzJUEwbiUyMHQlQzMlQTFuJTIwcyVDMyVCNGklMjBuJUUxJUJCJTk1aSUyMHRyJUMzJUFBbiUyMGtoJUUxJUJBJUFGcCUyMGMlQzMlQTFjJTIwZGklRTElQkIlODVuJTIwJUM0JTkxJUMzJUEwbiUyMGhheSUyMGJsb2clMjBjJUMzJUExJTIwbmglQzMlQTJuLiUyMFYlRTElQkIlOUJpJTIwbmglRTElQkIlQUZuZyUyMCVDNiVCMHUlMjAlQzQlOTFpJUUxJUJCJTgzbSUyMHR1eSVFMSVCQiU4N3QlMjB2JUUxJUJCJTlEaSUyMG5oJUM2JUIwJTIwcGhvbmclMjBjJUMzJUExY2glMjAlQzQlOTFhJTIwZCVFMSVCQSVBMW5nJTJDJTIwa2klRTElQkIlODN1JTIwZCVDMyVBMW5nJTIwJUM0JTkxJUM2JUExbiUyMGdpJUUxJUJBJUEzbiUyMHYlQzMlQTAlMjBjaCVFMSVCQSVBNXQlMjBsaSVFMSVCQiU4N3UlMjB0aG8lQzMlQTFuZyUyMG0lQzMlQTF0JTJDJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjBIJUMzJUEwbiUyMFF1JUUxJUJCJTkxYyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjBwaCVDMyVBMWklMjBtJUUxJUJBJUExbmglMjB5JUMzJUFBdSUyMHRoJUMzJUFEY2glMjB2JUMzJUEwJTIwbCVFMSVCQiVCMWElMjBjaCVFMSVCQiU4RG4lMjBraGklMjAlQzQlOTElRTElQkElQkZuJTIwYyVDMyVCNG5nJTIwcyVFMSVCQiU5RiUyMGhheSUyMGQlRTElQkElQTFvJTIwcGglRTElQkIlOTEuJTIwQiVDMyVBQW4lMjBjJUUxJUJBJUExbmglMjAlQzQlOTElQzMlQjMlMkMlMjAlQzMlQTFvJTIwdGh1biUyMG5hbSUyMGMlRTElQkIlOTUlMjB0ciVFMSVCQiVBNSUyMGMlQzUlQTluZyUyMCVDNCU5MSVDNiVCMCVFMSVCQiVBM2MlMjBjJUMzJUExYyUyMGNoJUMzJUEwbmclMjB0cmFpJTIwdiVDNCU4M24lMjBwaCVDMyVCMm5nJTIweSVDMyVBQXUlMjB0aCVDMyVBRGNoJTIwdiVDMyVBQyUyMG4lQzMlQTl0JTIwbCVFMSVCQiU4QmNoJTIwcyVFMSVCQiVCMSUyMHYlQzMlQTAlMjB0ciVFMSVCQSVCQiUyMHRydW5nLiUyMENoJUUxJUJCJTg5JTIwYyVFMSVCQSVBN24lMjBrJUUxJUJBJUJGdCUyMGglRTElQkIlQTNwJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjBib2R5JTIwdiVFMSVCQiU5QmklMjBxdSVFMSVCQSVBN24lMjBqZWFucyUyMG5hbSUyMGhheSUyMHF1JUUxJUJBJUE3biUyMGtha2klMjBuYW0lMjB2JUMzJUEwJTIwbmglRTElQkIlQUZuZyUyMHBoJUUxJUJCJUE1JTIwa2klRTElQkIlODduJTIwJUM0JTkxaSUyMGslQzMlQThtJTIwbmglQzYlQjAlMjB2JUMzJUFEJTIwbmFtJTJDJTIwdCVDMyVCQWklMjBkdSUyMGwlRTElQkIlOEJjaCUyMG5hbSUyMGhheSUyMCVDNCU5MSVDNiVBMW4lMjBnaSVFMSVCQSVBM24lMjBoJUM2JUExbiUyMGwlQzMlQTAlMjBjaGklRTElQkElQkZjJTIwYmFsbyUyMGxhcHRvcCUyMG5hbW4lQzQlODNuZyUyMCVDNCU5MSVFMSVCQiU5OW5nJTJDJTIwYiVFMSVCQSVBMW4lMjAlQzQlOTElQzMlQTMlMjBjJUMzJUIzJTIwbmdheSUyMGIlRTElQkIlOTklMjBjJUMzJUExbmglMjAlQzQlOTElQzYlQTFuJTIwZ2klRTElQkElQTNuJTIwbSVDMyVBMCUyMGhpJUUxJUJCJTg3biUyMCVDNCU5MSVFMSVCQSVBMWkuJTIyJTJDJTIyc3R5bGUlMjIlM0ElMjJtYXJnaW4lM0ElMjAwJTNCcGFkZGluZyUzQSUyMDguMHB4JTIwMCUzQndoaXRlLXNwYWNlJTNBJTIwcHJlLXdyYXAlM0IlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMnNwYW4lMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJUMzJTgxbyUyMHRodW4lMjBuYW0lMjBsJUMzJUEwJTIwdHJhbmclMjBwaCVFMSVCQiVBNWMlMjBjJUM2JUExJTIwYiVFMSVCQSVBM24lMjB2JUMzJUEwJTIwdGklRTElQkIlODduJTIwZCVFMSVCQiVBNW5nJTIwbmglRTElQkElQTV0JTIwJUM0JTkxJUUxJUJCJTkxaSUyMHYlRTElQkIlOUJpJTIwcGglQzMlQTFpJTIwbSVFMSVCQSVBMW5oLiUyMEglRTElQkElQTd1JTIwbmglQzYlQjAlMjBuZyVDNiVCMCVFMSVCQiU5RGklMjAlQzQlOTElQzMlQTBuJTIwJUMzJUI0bmclMjBuJUMzJUEwbyUyMGMlQzUlQTluZyUyMCVDNCU5MSVFMSVCQiU4MXUlMjBwaCVFMSVCQSVBM2klMjBjJUMzJUIzJTIwdiVDMyVBMGklMjBjaGklRTElQkElQkZjJTIwJUMzJUExbyUyMHB1bGwlMjBuYW0lMjB0cm9uZyUyMHQlRTElQkIlQTclMjAlQzMlQTFvJTIwYyVFMSVCQiVBN2ElMjBtJUMzJUFDbmguJTIwVmklRTElQkIlODdjJTIwbXVhJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjBjJUM1JUE5bmclMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwYiVDMyVBMG4lMjB0JUMzJUExbiUyMHMlQzMlQjRpJTIwbiVFMSVCQiU5NWklMjB0ciVDMyVBQW4lMjBraCVFMSVCQSVBRnAlMjBjJUMzJUExYyUyMGRpJUUxJUJCJTg1biUyMCVDNCU5MSVDMyVBMG4lMjBoYXklMjBibG9nJTIwYyVDMyVBMSUyMG5oJUMzJUEybi4lMjBWJUUxJUJCJTlCaSUyMG5oJUUxJUJCJUFGbmclMjAlQzYlQjB1JTIwJUM0JTkxaSVFMSVCQiU4M20lMjB0dXklRTElQkIlODd0JTIwdiVFMSVCQiU5RGklMjBuaCVDNiVCMCUyMHBob25nJTIwYyVDMyVBMWNoJTIwJUM0JTkxYSUyMGQlRTElQkElQTFuZyUyQyUyMGtpJUUxJUJCJTgzdSUyMGQlQzMlQTFuZyUyMCVDNCU5MSVDNiVBMW4lMjBnaSVFMSVCQSVBM24lMjB2JUMzJUEwJTIwY2glRTElQkElQTV0JTIwbGklRTElQkIlODd1JTIwdGhvJUMzJUExbmclMjBtJUMzJUExdCUyQyUyMCVDMyVBMW8lMjB0aHVuJTIwbmFtJTIwSCVDMyVBMG4lMjBRdSVFMSVCQiU5MWMlMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwcGglQzMlQTFpJTIwbSVFMSVCQSVBMW5oJTIweSVDMyVBQXUlMjB0aCVDMyVBRGNoJTIwdiVDMyVBMCUyMGwlRTElQkIlQjFhJTIwY2glRTElQkIlOERuJTIwa2hpJTIwJUM0JTkxJUUxJUJBJUJGbiUyMGMlQzMlQjRuZyUyMHMlRTElQkIlOUYlMjBoYXklMjBkJUUxJUJBJUExbyUyMHBoJUUxJUJCJTkxLiUyMEIlQzMlQUFuJTIwYyVFMSVCQSVBMW5oJTIwJUM0JTkxJUMzJUIzJTJDJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjBjJUUxJUJCJTk1JTIwdHIlRTElQkIlQTUlMjBjJUM1JUE5bmclMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwYyVDMyVBMWMlMjBjaCVDMyVBMG5nJTIwdHJhaSUyMHYlQzQlODNuJTIwcGglQzMlQjJuZyUyMHklQzMlQUF1JTIwdGglQzMlQURjaCUyMHYlQzMlQUMlMjBuJUMzJUE5dCUyMGwlRTElQkIlOEJjaCUyMHMlRTElQkIlQjElMjB2JUMzJUEwJTIwdHIlRTElQkElQkIlMjB0cnVuZy4lMjBDaCVFMSVCQiU4OSUyMGMlRTElQkElQTduJTIwayVFMSVCQSVCRnQlMjBoJUUxJUJCJUEzcCUyMCVDMyVBMW8lMjB0aHVuJTIwbmFtJTIwYm9keSUyMHYlRTElQkIlOUJpJTIwcXUlRTElQkElQTduJTIwamVhbnMlMjBuYW0lMjBoYXklMjBxdSVFMSVCQSVBN24lMjBrYWtpJTIwbmFtJTIwdiVDMyVBMCUyMG5oJUUxJUJCJUFGbmclMjBwaCVFMSVCQiVBNSUyMGtpJUUxJUJCJTg3biUyMCVDNCU5MWklMjBrJUMzJUE4bSUyMG5oJUM2JUIwJTIwdiVDMyVBRCUyMG5hbSUyQyUyMHQlQzMlQkFpJTIwZHUlMjBsJUUxJUJCJThCY2glMjBuYW0lMjBoYXklMjAlQzQlOTElQzYlQTFuJTIwZ2klRTElQkElQTNuJTIwaCVDNiVBMW4lMjBsJUMzJUEwJTIwY2hpJUUxJUJBJUJGYyUyMGJhbG8lMjBsYXB0b3AlMjBuYW1uJUM0JTgzbmclMjAlQzQlOTElRTElQkIlOTluZyUyQyUyMGIlRTElQkElQTFuJTIwJUM0JTkxJUMzJUEzJTIwYyVDMyVCMyUyMG5nYXklMjBiJUUxJUJCJTk5JTIwYyVDMyVBMW5oJTIwJUM0JTkxJUM2JUExbiUyMGdpJUUxJUJBJUEzbiUyMG0lQzMlQTAlMjBoaSVFMSVCQiU4N24lMjAlQzQlOTElRTElQkElQTFpLiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJUMzJTgxbyUyMHRodW4lMjBuYW0lMjBsJUMzJUEwJTIwdHJhbmclMjBwaCVFMSVCQiVBNWMlMjBjJUM2JUExJTIwYiVFMSVCQSVBM24lMjB2JUMzJUEwJTIwdGklRTElQkIlODduJTIwZCVFMSVCQiVBNW5nJTIwbmglRTElQkElQTV0JTIwJUM0JTkxJUUxJUJCJTkxaSUyMHYlRTElQkIlOUJpJTIwcGglQzMlQTFpJTIwbSVFMSVCQSVBMW5oLiUyMEglRTElQkElQTd1JTIwbmglQzYlQjAlMjBuZyVDNiVCMCVFMSVCQiU5RGklMjAlQzQlOTElQzMlQTBuJTIwJUMzJUI0bmclMjBuJUMzJUEwbyUyMGMlQzUlQTluZyUyMCVDNCU5MSVFMSVCQiU4MXUlMjBwaCVFMSVCQSVBM2klMjBjJUMzJUIzJTIwdiVDMyVBMGklMjBjaGklRTElQkElQkZjJTIwJUMzJUExbyUyMHB1bGwlMjBuYW0lMjB0cm9uZyUyMHQlRTElQkIlQTclMjAlQzMlQTFvJTIwYyVFMSVCQiVBN2ElMjBtJUMzJUFDbmguJTIwVmklRTElQkIlODdjJTIwbXVhJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjBjJUM1JUE5bmclMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwYiVDMyVBMG4lMjB0JUMzJUExbiUyMHMlQzMlQjRpJTIwbiVFMSVCQiU5NWklMjB0ciVDMyVBQW4lMjBraCVFMSVCQSVBRnAlMjBjJUMzJUExYyUyMGRpJUUxJUJCJTg1biUyMCVDNCU5MSVDMyVBMG4lMjBoYXklMjBibG9nJTIwYyVDMyVBMSUyMG5oJUMzJUEybi4lMjBWJUUxJUJCJTlCaSUyMG5oJUUxJUJCJUFGbmclMjAlQzYlQjB1JTIwJUM0JTkxaSVFMSVCQiU4M20lMjB0dXklRTElQkIlODd0JTIwdiVFMSVCQiU5RGklMjBuaCVDNiVCMCUyMHBob25nJTIwYyVDMyVBMWNoJTIwJUM0JTkxYSUyMGQlRTElQkElQTFuZyUyQyUyMGtpJUUxJUJCJTgzdSUyMGQlQzMlQTFuZyUyMCVDNCU5MSVDNiVBMW4lMjBnaSVFMSVCQSVBM24lMjB2JUMzJUEwJTIwY2glRTElQkElQTV0JTIwbGklRTElQkIlODd1JTIwdGhvJUMzJUExbmclMjBtJUMzJUExdCUyQyUyMCVDMyVBMW8lMjB0aHVuJTIwbmFtJTIwSCVDMyVBMG4lMjBRdSVFMSVCQiU5MWMlMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwcGglQzMlQTFpJTIwbSVFMSVCQSVBMW5oJTIweSVDMyVBQXUlMjB0aCVDMyVBRGNoJTIwdiVDMyVBMCUyMGwlRTElQkIlQjFhJTIwY2glRTElQkIlOERuJTIwa2hpJTIwJUM0JTkxJUUxJUJBJUJGbiUyMGMlQzMlQjRuZyUyMHMlRTElQkIlOUYlMjBoYXklMjBkJUUxJUJBJUExbyUyMHBoJUUxJUJCJTkxLiUyMEIlQzMlQUFuJTIwYyVFMSVCQSVBMW5oJTIwJUM0JTkxJUMzJUIzJTJDJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjBjJUUxJUJCJTk1JTIwdHIlRTElQkIlQTUlMjBjJUM1JUE5bmclMjAlQzQlOTElQzYlQjAlRTElQkIlQTNjJTIwYyVDMyVBMWMlMjBjaCVDMyVBMG5nJTIwdHJhaSUyMHYlQzQlODNuJTIwcGglQzMlQjJuZyUyMHklQzMlQUF1JTIwdGglQzMlQURjaCUyMHYlQzMlQUMlMjBuJUMzJUE5dCUyMGwlRTElQkIlOEJjaCUyMHMlRTElQkIlQjElMjB2JUMzJUEwJTIwdHIlRTElQkElQkIlMjB0cnVuZy4lMjBDaCVFMSVCQiU4OSUyMGMlRTElQkElQTduJTIwayVFMSVCQSVCRnQlMjBoJUUxJUJCJUEzcCUyMCVDMyVBMW8lMjB0aHVuJTIwbmFtJTIwYm9keSUyMHYlRTElQkIlOUJpJTIwcXUlRTElQkElQTduJTIwamVhbnMlMjBuYW0lMjBoYXklMjBxdSVFMSVCQSVBN24lMjBrYWtpJTIwbmFtJTIwdiVDMyVBMCUyMG5oJUUxJUJCJUFGbmclMjBwaCVFMSVCQiVBNSUyMGtpJUUxJUJCJTg3biUyMCVDNCU5MWklMjBrJUMzJUE4bSUyMG5oJUM2JUIwJTIwdiVDMyVBRCUyMG5hbSUyQyUyMHQlQzMlQkFpJTIwZHUlMjBsJUUxJUJCJThCY2glMjBuYW0lMjBoYXklMjAlQzQlOTElQzYlQTFuJTIwZ2klRTElQkElQTNuJTIwaCVDNiVBMW4lMjBsJUMzJUEwJTIwY2hpJUUxJUJBJUJGYyUyMGJhbG8lMjBsYXB0b3AlMjBuYW1uJUM0JTgzbmclMjAlQzQlOTElRTElQkIlOTluZyUyQyUyMGIlRTElQkElQTFuJTIwJUM0JTkxJUMzJUEzJTIwYyVDMyVCMyUyMG5nYXklMjBiJUUxJUJCJTk5JTIwYyVDMyVBMW5oJTIwJUM0JTkxJUM2JUExbiUyMGdpJUUxJUJBJUEzbiUyMG0lQzMlQTAlMjBoaSVFMSVCQiU4N24lMjAlQzQlOTElRTElQkElQTFpLiUyMiUyQyUyMm1hcmtzJTIyJTNBJTVCJTVEJTdEJTVEJTdEJTVEJTdEJTVEJTdEJTJDJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIybWFyZ2luJTNBJTIwMCUzQnBhZGRpbmclM0ElMjA4LjBweCUyMDAlM0J3aGl0ZS1zcGFjZSUzQSUyMHByZS13cmFwJTNCJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJzcGFuJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJkaXYlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyQyVDMyU4MUMlMjBLSSVFMSVCQiU4MlUlMjAlQzMlODFPJTIwVEhVTiUyME5BTSUyMCVDNCU5MCVFMSVCQSVCOFAlMjIlMkMlMjJzdHlsZSUyMiUzQSUyMm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjJDJUMzJTgxQyUyMEtJJUUxJUJCJTgyVSUyMCVDMyU4MU8lMjBUSFVOJTIwTkFNJTIwJUM0JTkwJUUxJUJBJUI4UCUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyQyVDMyU4MUMlMjBLSSVFMSVCQiU4MlUlMjAlQzMlODFPJTIwVEhVTiUyME5BTSUyMCVDNCU5MCVFMSVCQSVCOFAlMjIlMkMlMjJtYXJrcyUyMiUzQSU1QiU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCUyQyU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMmRpdiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlMjIlMkMlMjJzdHlsZSUyMiUzQSUyMm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMnRleHQlMjIlMkMlMjJsZWF2ZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJsZWFmJTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMm1hcmtzJTIyJTNBJTVCJTVEJTdEJTVEJTdEJTVEJTdEJTVEJTdEJTJDJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyZGl2JTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMkIlRTElQkElQTFuJTIwcyVFMSVCQSVCRCUyMHIlRTElQkElQTV0JTIwbmclRTElQkElQTFjJTIwbmhpJUMzJUFBbiUyMGIlRTElQkIlOUZpJTIwdCVDMyVBRG5oJTIwdGglRTElQkElQTltJTIwbSVFMSVCQiVCOSUyMG0lQzMlQTAlMjBjJUMzJUExYyUyMGtpJUUxJUJCJTgzdSUyMCVDMyVBMW8lMjB0aHVuJTIwYm9keSUyMG5hbSUyMGMlQzMlQjMlMjB0aCVFMSVCQiU4MyUyMCVDNCU5MWVtJTIwbCVFMSVCQSVBMWkuJTIwTSVFMSVCQiU5OXQlMjBjaGklRTElQkElQkZjJTIwJUMzJUExbyUyMHBoJUMzJUI0bmclMjBuYW0lMjBoJUMzJUEwbmclMjBoaSVFMSVCQiU4N3UlMjB0cm9uZyUyMHQlQzMlQURjaCUyMHQlRTElQkElQUZjJTIwYyVDMyVCMyUyMHRoJUUxJUJCJTgzJTIwYmklRTElQkElQkZuJTIwYiVFMSVCQSVBMW4lMjB0JUUxJUJCJUFCJTIwbSVFMSVCQiU5OXQlMjBhbmglMjBjaCVDMyVBMG5nJTIwbiVDNCU4M25nJTIwJUM0JTkxJUUxJUJCJTk5bmclMjB0aCVFMSVCQiU4MyUyMHRoYW8lMjBzYW5nJTIwbSVFMSVCQiU5OXQlMjBhbmglMjBjaCVDMyVBMG5nJTIwbCVFMSVCQiU4QmNoJTIwbCVDMyVBM20lMjB2JUMzJUEwJTIwYyVDMyVBMSUyMHQlQzMlQURuaC4lMjBLJUUxJUJBJUJGdCUyMGglRTElQkIlQTNwJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjAlQzQlOTElRTElQkElQjlwJTIwdiVFMSVCQiU5QmklMjAlQzMlQTFvJTIwa2hvJUMzJUExYyUyMGMlQzMlQjMlMjBtJUM1JUE5JTIwbSVDMyVBMHUlMjBzJUUxJUJBJUFGYyUyMHRyJUUxJUJBJUJCJTIwdHJ1bmclMjBjaG8lMjBuaCVFMSVCQiVBRm5nJTIwbmclQzMlQTB5JTIwY3UlRTElQkIlOTFpJTIwdHUlRTElQkElQTduJTIwdnVpJTIwdiVFMSVCQSVCQiUyQyUyMHRoJUMzJUFBbSUyMGNoaSVFMSVCQSVCRmMlMjAlQzMlQTFvJTIwdmVzdCUyMGNobyUyMGMlQzMlQTFjJTIwY3UlRTElQkIlOTljJTIwaCVFMSVCQiU4RHAlMjBxdWFuJTIwdHIlRTElQkIlOERuZyUyQyUyMGIlRTElQkElQTFuJTIwcyVFMSVCQSVCRCUyMHRyJUMzJUEwbiUyMCVDNCU5MSVFMSVCQSVBN3klMjBuJUM0JTgzbmclMjBsJUM2JUIwJUUxJUJCJUEzbmclMjB2JUMzJUEwJTIwdCVDNiVCMCVDNiVBMWklMjB0ciVFMSVCQSVCQi4lMjBDaCVDMyVCQW5nJTIwdCVDMyVCNGklMjBsdSVDMyVCNG4lMjBjJUMzJUIzJTIwbmhpJUUxJUJCJTgxdSUyMHMlRTElQkIlQjElMjBsJUUxJUJCJUIxYSUyMGNoJUUxJUJCJThEbiUyMGQlQzMlQTBuaCUyMGNobyUyMGIlRTElQkElQTFuJTJDJTIwdiVFMSVCQiU5QmklMjBuaCVFMSVCQiVBRm5nJTIwcyVFMSVCQSVBM24lMjBwaCVFMSVCQSVBOW0lMjBtJUUxJUJCJTlCaSUyMHRyb25nJTIwYiVFMSVCQiU5OSUyMHMlQzYlQjB1JTIwdCVFMSVCQSVBRHAlMjAlQzMlQTFvJTIwdGh1biUyMG5hbSUyMC4lMjIlMkMlMjJzdHlsZSUyMiUzQSUyMm1hcmdpbiUzQSUyMDAlM0JwYWRkaW5nJTNBJTIwOC4wcHglMjAwJTNCd2hpdGUtc3BhY2UlM0ElMjBwcmUtd3JhcCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjJCJUUxJUJBJUExbiUyMHMlRTElQkElQkQlMjByJUUxJUJBJUE1dCUyMG5nJUUxJUJBJUExYyUyMG5oaSVDMyVBQW4lMjBiJUUxJUJCJTlGaSUyMHQlQzMlQURuaCUyMHRoJUUxJUJBJUE5bSUyMG0lRTElQkIlQjklMjBtJUMzJUEwJTIwYyVDMyVBMWMlMjBraSVFMSVCQiU4M3UlMjAlQzMlQTFvJTIwdGh1biUyMGJvZHklMjBuYW0lMjBjJUMzJUIzJTIwdGglRTElQkIlODMlMjAlQzQlOTFlbSUyMGwlRTElQkElQTFpLiUyME0lRTElQkIlOTl0JTIwY2hpJUUxJUJBJUJGYyUyMCVDMyVBMW8lMjBwaCVDMyVCNG5nJTIwbmFtJTIwaCVDMyVBMG5nJTIwaGklRTElQkIlODd1JTIwdHJvbmclMjB0JUMzJUFEY2glMjB0JUUxJUJBJUFGYyUyMGMlQzMlQjMlMjB0aCVFMSVCQiU4MyUyMGJpJUUxJUJBJUJGbiUyMGIlRTElQkElQTFuJTIwdCVFMSVCQiVBQiUyMG0lRTElQkIlOTl0JTIwYW5oJTIwY2glQzMlQTBuZyUyMG4lQzQlODNuZyUyMCVDNCU5MSVFMSVCQiU5OW5nJTIwdGglRTElQkIlODMlMjB0aGFvJTIwc2FuZyUyMG0lRTElQkIlOTl0JTIwYW5oJTIwY2glQzMlQTBuZyUyMGwlRTElQkIlOEJjaCUyMGwlQzMlQTNtJTIwdiVDMyVBMCUyMGMlQzMlQTElMjB0JUMzJUFEbmguJTIwSyVFMSVCQSVCRnQlMjBoJUUxJUJCJUEzcCUyMCVDMyVBMW8lMjB0aHVuJTIwbmFtJTIwJUM0JTkxJUUxJUJBJUI5cCUyMHYlRTElQkIlOUJpJTIwJUMzJUExbyUyMGtobyVDMyVBMWMlMjBjJUMzJUIzJTIwbSVDNSVBOSUyMG0lQzMlQTB1JTIwcyVFMSVCQSVBRmMlMjB0ciVFMSVCQSVCQiUyMHRydW5nJTIwY2hvJTIwbmglRTElQkIlQUZuZyUyMG5nJUMzJUEweSUyMGN1JUUxJUJCJTkxaSUyMHR1JUUxJUJBJUE3biUyMHZ1aSUyMHYlRTElQkElQkIlMkMlMjB0aCVDMyVBQW0lMjBjaGklRTElQkElQkZjJTIwJUMzJUExbyUyMHZlc3QlMjBjaG8lMjBjJUMzJUExYyUyMGN1JUUxJUJCJTk5YyUyMGglRTElQkIlOERwJTIwcXVhbiUyMHRyJUUxJUJCJThEbmclMkMlMjBiJUUxJUJBJUExbiUyMHMlRTElQkElQkQlMjB0ciVDMyVBMG4lMjAlQzQlOTElRTElQkElQTd5JTIwbiVDNCU4M25nJTIwbCVDNiVCMCVFMSVCQiVBM25nJTIwdiVDMyVBMCUyMHQlQzYlQjAlQzYlQTFpJTIwdHIlRTElQkElQkIuJTIwQ2glQzMlQkFuZyUyMHQlQzMlQjRpJTIwbHUlQzMlQjRuJTIwYyVDMyVCMyUyMG5oaSVFMSVCQiU4MXUlMjBzJUUxJUJCJUIxJTIwbCVFMSVCQiVCMWElMjBjaCVFMSVCQiU4RG4lMjBkJUMzJUEwbmglMjBjaG8lMjBiJUUxJUJBJUExbiUyQyUyMHYlRTElQkIlOUJpJTIwbmglRTElQkIlQUZuZyUyMHMlRTElQkElQTNuJTIwcGglRTElQkElQTltJTIwbSVFMSVCQiU5QmklMjB0cm9uZyUyMGIlRTElQkIlOTklMjBzJUM2JUIwdSUyMHQlRTElQkElQURwJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjAuJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjJCJUUxJUJBJUExbiUyMHMlRTElQkElQkQlMjByJUUxJUJBJUE1dCUyMG5nJUUxJUJBJUExYyUyMG5oaSVDMyVBQW4lMjBiJUUxJUJCJTlGaSUyMHQlQzMlQURuaCUyMHRoJUUxJUJBJUE5bSUyMG0lRTElQkIlQjklMjBtJUMzJUEwJTIwYyVDMyVBMWMlMjBraSVFMSVCQiU4M3UlMjAlQzMlQTFvJTIwdGh1biUyMGJvZHklMjBuYW0lMjBjJUMzJUIzJTIwdGglRTElQkIlODMlMjAlQzQlOTFlbSUyMGwlRTElQkElQTFpLiUyME0lRTElQkIlOTl0JTIwY2hpJUUxJUJBJUJGYyUyMCVDMyVBMW8lMjBwaCVDMyVCNG5nJTIwbmFtJTIwaCVDMyVBMG5nJTIwaGklRTElQkIlODd1JTIwdHJvbmclMjB0JUMzJUFEY2glMjB0JUUxJUJBJUFGYyUyMGMlQzMlQjMlMjB0aCVFMSVCQiU4MyUyMGJpJUUxJUJBJUJGbiUyMGIlRTElQkElQTFuJTIwdCVFMSVCQiVBQiUyMG0lRTElQkIlOTl0JTIwYW5oJTIwY2glQzMlQTBuZyUyMG4lQzQlODNuZyUyMCVDNCU5MSVFMSVCQiU5OW5nJTIwdGglRTElQkIlODMlMjB0aGFvJTIwc2FuZyUyMG0lRTElQkIlOTl0JTIwYW5oJTIwY2glQzMlQTBuZyUyMGwlRTElQkIlOEJjaCUyMGwlQzMlQTNtJTIwdiVDMyVBMCUyMGMlQzMlQTElMjB0JUMzJUFEbmguJTIwSyVFMSVCQSVCRnQlMjBoJUUxJUJCJUEzcCUyMCVDMyVBMW8lMjB0aHVuJTIwbmFtJTIwJUM0JTkxJUUxJUJBJUI5cCUyMHYlRTElQkIlOUJpJTIwJUMzJUExbyUyMGtobyVDMyVBMWMlMjBjJUMzJUIzJTIwbSVDNSVBOSUyMG0lQzMlQTB1JTIwcyVFMSVCQSVBRmMlMjB0ciVFMSVCQSVCQiUyMHRydW5nJTIwY2hvJTIwbmglRTElQkIlQUZuZyUyMG5nJUMzJUEweSUyMGN1JUUxJUJCJTkxaSUyMHR1JUUxJUJBJUE3biUyMHZ1aSUyMHYlRTElQkElQkIlMkMlMjB0aCVDMyVBQW0lMjBjaGklRTElQkElQkZjJTIwJUMzJUExbyUyMHZlc3QlMjBjaG8lMjBjJUMzJUExYyUyMGN1JUUxJUJCJTk5YyUyMGglRTElQkIlOERwJTIwcXVhbiUyMHRyJUUxJUJCJThEbmclMkMlMjBiJUUxJUJBJUExbiUyMHMlRTElQkElQkQlMjB0ciVDMyVBMG4lMjAlQzQlOTElRTElQkElQTd5JTIwbiVDNCU4M25nJTIwbCVDNiVCMCVFMSVCQiVBM25nJTIwdiVDMyVBMCUyMHQlQzYlQjAlQzYlQTFpJTIwdHIlRTElQkElQkIuJTIwQ2glQzMlQkFuZyUyMHQlQzMlQjRpJTIwbHUlQzMlQjRuJTIwYyVDMyVCMyUyMG5oaSVFMSVCQiU4MXUlMjBzJUUxJUJCJUIxJTIwbCVFMSVCQiVCMWElMjBjaCVFMSVCQiU4RG4lMjBkJUMzJUEwbmglMjBjaG8lMjBiJUUxJUJBJUExbiUyQyUyMHYlRTElQkIlOUJpJTIwbmglRTElQkIlQUZuZyUyMHMlRTElQkElQTNuJTIwcGglRTElQkElQTltJTIwbSVFMSVCQiU5QmklMjB0cm9uZyUyMGIlRTElQkIlOTklMjBzJUM2JUIwdSUyMHQlRTElQkElQURwJTIwJUMzJUExbyUyMHRodW4lMjBuYW0lMjAuJTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJoMSUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlMjIlMkMlMjJzdHlsZSUyMiUzQSUyMnNpemUlM0ElMjAxLjBweCUzQiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIyc3BhbiUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJpbm5lclRleHQlMjIlM0ElMjIlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMnRleHQlMjIlMkMlMjJsZWF2ZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJsZWFmJTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMm1hcmtzJTIyJTNBJTVCJTVEJTdEJTVEJTdEJTVEJTdEJTVEJTdEJTJDJTdCJTIyb2JqZWN0JTIyJTNBJTIyYmxvY2slMjIlMkMlMjJ0eXBlJTIyJTNBJTIycGFyYWdyYXBoJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiUyQyUyMnN0eWxlJTIyJTNBJTIybWFyZ2luJTNBJTIwMCUzQnBhZGRpbmclM0ElMjA4LjBweCUyMDAlM0J3aGl0ZS1zcGFjZSUzQSUyMHByZS13cmFwJTNCJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJzcGFuJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmlubmVyVGV4dCUyMiUzQSUyMiUyMiU3RCUyQyUyMm5vZGVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIydGV4dCUyMiUyQyUyMmxlYXZlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmxlYWYlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTJDJTIybWFya3MlMjIlM0ElNUIlNUQlN0QlNUQlN0QlNUQlN0QlNUQlN0QlMkMlN0IlMjJvYmplY3QlMjIlM0ElMjJibG9jayUyMiUyQyUyMnR5cGUlMjIlM0ElMjJwYXJhZ3JhcGglMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTJDJTIyc3R5bGUlMjIlM0ElMjJtYXJnaW4lM0ElMjAwJTNCcGFkZGluZyUzQSUyMDguMHB4JTIwMCUzQndoaXRlLXNwYWNlJTNBJTIwcHJlLXdyYXAlM0IlMjIlN0QlMkMlMjJub2RlcyUyMiUzQSU1QiU3QiUyMm9iamVjdCUyMiUzQSUyMmJsb2NrJTIyJTJDJTIydHlwZSUyMiUzQSUyMnNwYW4lMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIyaW5uZXJUZXh0JTIyJTNBJTIyJTIyJTdEJTJDJTIybm9kZXMlMjIlM0ElNUIlN0IlMjJvYmplY3QlMjIlM0ElMjJ0ZXh0JTIyJTJDJTIybGVhdmVzJTIyJTNBJTVCJTdCJTIyb2JqZWN0JTIyJTNBJTIybGVhZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjIlMkMlMjJtYXJrcyUyMiUzQSU1QiU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RCU1RCU3RA==\"><span data-key=\"68\">Bạn\r\n sẽ rất ngạc nhiên bởi tính thẩm mỹ mà các kiểu áo thun body nam có thể \r\nđem lại. Một chiếc áo phông nam hàng hiệu trong tích tắc có thể biến bạn\r\n từ một anh chàng năng động thể thao sang một anh chàng lịch lãm và cá \r\ntính. Kết hợp áo thun nam đẹp với áo khoác có mũ màu sắc trẻ trung cho \r\nnhững ngày cuối tuần vui vẻ, thêm chiếc áo vest cho các cuộc họp quan \r\ntrọng, bạn sẽ tràn đầy năng lượng và tươi trẻ. Chúng tôi luôn có nhiều \r\nsự lựa chọn dành cho bạn, với những sản phẩm mới trong bộ sưu tập áo \r\nthun nam .</span></div>', '/storage/photos/1/Products/4.jpg', 10, 'S', 'new', 'active', 200000.00, 10.00, 0, 1, NULL, 8, '2020-08-14 06:25:42', '2021-12-29 19:19:47', 0);
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`, `user_id`) VALUES
(9, 'Đầm đỏ xòe thắt eo', 'lorem-ipsum-is-simply', '<div id=\"gioi-thieu\" class=\"content js-content expand\">\r\n<p>Kiểu dáng đơn giản, trẻ trung</p>\r\n<p>Thiết kế với form dễ mặc, thoải mái</p>\r\n<p>Đường may tỉ mỉ, tinh tế</p>\r\n<p>Dễ kết hợp với các trang phục, phụ kiện khác</p>\r\n</div>', '<br>', '/storage/photos/1/Products/3.jpg', 4, 'S,M,XL', 'new', 'active', 99000.00, 5.00, 0, 2, NULL, 7, '2020-08-15 06:52:44', '2021-12-29 19:12:35', 0),
(10, 'Áo thun Nữ Áo phông nữ đơn giản thoải mái vải êm bền đẹp', 'lorem-ipsum-is-simply-2008183507-655', '<p style=\"text-align: center;\">Có tên gọi khác đó là Áo thun Nữ với chất\r\n liệu vãi thun cotton co giãn tốt, thoáng mát dễ chịu, phù hợp đi chơi, \r\ngặp gỡ bạn bè, hay coffee thậm chí bạn có mặc khi tập thê dục vì thun \r\ncotton đó chính là tại sao mẫu áo luôn được các bạn trẻ ưa chuộng&nbsp;</p>\r\n<p style=\"text-align: center;\">Hiện đại với chất liệu cotton da cá giúp \r\nbạn phát huy được sự cá tính, năng động của bản thân. Là mẫu áo quen \r\nthuộc với hầu hết mọi anh chàng và cô gái, đặc biệt thay có nhiều màu \r\nsắc phù hợp với gu thời trang hiện đại, chất lừ pha chút cá tính ngày \r\nnay.</p>', '<p>Áo thun Nữ của chúng tôi trong loạt sản phẩm Với:</p>\r\n<ul><li>\r\n<p>Loại vải cotton thoáng mát, mềm mịn kết hợp với những đường may tinh tế chắc chắn&nbsp;</p>\r\n</li><li>\r\n<p>Giúp luôn tự tin thoải mái khi mặc những bộ cánh này!</p>\r\n</li><li>\r\n<p>Các kiểu áo sơ mi được thiết kế đa dạng phong phú mang đến gu thời trang năng động,cá tính, khỏe khoắn cho người mặc.</p>\r\n</li><li>\r\n<p>Vải Bền Đẹp Êm chống nhăn chống xù cam kết không lem màu</p>\r\n</li><li>\r\n<p>Đường chỉ chắn chắn đẹp Cam Kết Giống Hình</p>\r\n</li></ul>', '/storage/photos/1/Products/2.jpg', 3, 'L,XL', 'hot', 'active', 37000.00, 10.00, 0, 2, NULL, NULL, '2020-08-17 20:50:07', '2021-12-29 19:07:48', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 9, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31'),
(3, 1, 7, 3, 'sss', 'active', '2021-10-27 20:18:51', '2021-10-27 20:18:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Website bán hàng thương mại điện tử tích hợp AI chatbot<br>', '<p>Website bán hàng thương mại điện tử tích hợp AI chatbot<br></p>', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', 'Đà Nẵng, Việt Nam', '+84 94777 3333', 'vnshopvn@gmail.com', NULL, '2021-11-27 22:29:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LV1', '20000.00', 'active', '2020-08-14 04:22:17', '2021-12-29 22:03:33'),
(4, 'LV2', '40000.00', 'active', '2020-08-17 20:50:48', '2021-12-29 22:04:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user','seller') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/qưeqeq.jpg', 'admin', NULL, NULL, 'active', 'Z9WCZlMXx6JbCCaeq7vjiTqx4je98cDlD9sxCssf33bMtXAGlKOLw3vIn3AT', NULL, '2021-12-27 03:44:53'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2021-08-15 07:30:07'),
(3, 'seller1', 'seller1@gmail.com', NULL, '$2y$10$JHIV/h4/GsiEmG1FwUNwauevJXi5tinM61vLOJJeo3CUEROn30QOe', '/storage/photos/3/55dc9475a99f2b2e1f7fa00616ae8f74.jpg', 'seller', NULL, NULL, 'active', NULL, '2021-12-19 14:06:41', '2021-12-27 03:42:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(3, 10, NULL, NULL, 270.00, 1, 270.00, '2021-09-19 19:05:46', '2021-09-19 19:05:46'),
(4, 10, NULL, 2, 270.00, 1, 270.00, '2021-11-04 20:48:18', '2021-11-04 20:48:18');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
