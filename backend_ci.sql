-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Mar 2024, 12:09:43
-- Sunucu sürümü: 10.4.25-MariaDB
-- PHP Sürümü: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend_ci`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `brands`
--
DELIMITER $$
CREATE TRIGGER `brands_delete` BEFORE DELETE ON `brands` FOR EACH ROW INSERT INTO items_log (item_id, img_url, title, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `brands_update` BEFORE UPDATE ON `brands` FOR EACH ROW INSERT INTO brands_log (item_id, img_url, title, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands_log`
--

CREATE TABLE `brands_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at,` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `products`
--
DELIMITER $$
CREATE TRIGGER `products_delete` BEFORE DELETE ON `products` FOR EACH ROW INSERT INTO products_log (product_id, img_url, title, description, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `products_update` BEFORE UPDATE ON `products` FOR EACH ROW INSERT INTO products_log (product_id, img_url, title, description, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_log`
--

CREATE TABLE `products_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `is_cover` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `product_images`
--
DELIMITER $$
CREATE TRIGGER `product_images_delete` BEFORE DELETE ON `product_images` FOR EACH ROW INSERT INTO product_images_log (product_image_id, product_id, rank, img_url, is_cover, is_active, updated_at)
    VALUES (OLD.id, OLD.product_id, OLD.rank, OLD.img_url, OLD.is_cover, OLD.is_active, NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_images_update` BEFORE UPDATE ON `product_images` FOR EACH ROW INSERT INTO product_images_log (product_image_id, product_id, rank, img_url, is_cover, is_active, updated_at)
    VALUES (OLD.id, OLD.product_id, OLD.rank, OLD.img_url, OLD.is_cover, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images_log`
--

CREATE TABLE `product_images_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `is_cover` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references`
--

CREATE TABLE `references` (
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `references`
--
DELIMITER $$
CREATE TRIGGER `references_delete` BEFORE DELETE ON `references` FOR EACH ROW INSERT INTO references_log (content_id, img_url, title, description, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `references_update` BEFORE UPDATE ON `references` FOR EACH ROW INSERT INTO references_log (content_id, img_url, title, description, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references_log`
--

CREATE TABLE `references_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `services`
--
DELIMITER $$
CREATE TRIGGER `services_delete` BEFORE DELETE ON `services` FOR EACH ROW INSERT INTO settings_log (id, img_url, title, url, description, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `services_update` BEFORE UPDATE ON `services` FOR EACH ROW INSERT INTO services_log (id, img_url, title, url, description, rank, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services_log`
--

CREATE TABLE `services_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `mission` text NOT NULL,
  `vision` text NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `mobile_img_url` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `phone_one` varchar(50) NOT NULL,
  `phone_two` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facebook` varchar(50) NOT NULL,
  `twitter` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `linkedin` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `gsm_one` varchar(50) NOT NULL,
  `gsm_two` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `settings`
--
DELIMITER $$
CREATE TRIGGER `settings_delete` BEFORE DELETE ON `settings` FOR EACH ROW INSERT INTO settings_log (
        company_id, company_name, address, about_us, slogan, mission, vision, img_url,
        mobile_img_url, favicon, phone_one, phone_two, email, facebook, twitter,
        instagram, linkedin, is_active, gsm_one, gsm_two, updated_at
    ) VALUES (
        OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url,
        OLD.mobile_img_url, OLD.favicon, OLD.phone_one, OLD.phone_two, OLD.email, OLD.facebook, OLD.twitter,
        OLD.instagram, OLD.linkedin, OLD.is_active, OLD.gsm_one, OLD.gsm_two, NOW()
    )
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `settings_update` BEFORE UPDATE ON `settings` FOR EACH ROW INSERT INTO settings_log (
        company_id, company_name, address, about_us, slogan, mission, vision, img_url,
        mobile_img_url, favicon, phone_one, phone_two, email, facebook, twitter,
        instagram, linkedin, is_active, gsm_one, gsm_two, updated_at
    ) VALUES (
        OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url,
        OLD.mobile_img_url, OLD.favicon, OLD.phone_one, OLD.phone_two, OLD.email, OLD.facebook, OLD.twitter,
        OLD.instagram, OLD.linkedin, OLD.is_active, OLD.gsm_one, OLD.gsm_two, NOW()
    )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings_log`
--

CREATE TABLE `settings_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `mission` text NOT NULL,
  `vision` text NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `mobile_img_url` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `phone_one` varchar(50) NOT NULL,
  `phone_two` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facebook` varchar(50) NOT NULL,
  `twitter` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `linkedin` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `gsm_one` varchar(50) NOT NULL,
  `gsm_two` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimanials`
--

CREATE TABLE `testimanials` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tetikleyiciler `testimanials`
--
DELIMITER $$
CREATE TRIGGER `testimanials_delete` BEFORE DELETE ON `testimanials` FOR EACH ROW INSERT INTO testimanials_log (user_id, title, description, full_name, company, img_url, rank, is_active)
    VALUES (OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.img_url, OLD.rank, OLD.is_active)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `testimanials_update` BEFORE UPDATE ON `testimanials` FOR EACH ROW INSERT INTO testimanials_log (user_id, title, description, full_name, company, img_url, rank, is_active)
    VALUES (OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.img_url, OLD.rank, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimanials_log`
--

CREATE TABLE `testimanials_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `rank` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`, `created_at`) VALUES
(2, 'http://example.com/img2.jpg', 'user2@example.com', 'mane', 'Smith', 'password123', 1, '2024-03-10 18:26:15'),
(3, 'http://example.com/img3.jpg', 'user3@example.com', 'Alice', 'yanmasın', 'password123', 1, '2024-03-10 18:09:27'),
(4, 'http://example.com/img4.jpg', 'user4@example.com', 'Bob', 'Brown', 'password123', 1, '2024-03-10 18:03:27'),
(5, 'http://example.com/img5.jpg', 'user5@example.com', 'Charlie', 'Davis', 'password123', 1, '2024-03-10 18:03:27');

--
-- Tetikleyiciler `users`
--
DELIMITER $$
CREATE TRIGGER `users_delete` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO users_log (id, img_url, email, name, surname, password, is_active)
    VALUES (OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, OLD.is_active)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `users_update` BEFORE UPDATE ON `users` FOR EACH ROW INSERT INTO users_log (id, img_url, email, name, surname, password, is_active)
    VALUES (OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_log`
--

CREATE TABLE `users_log` (
  `log_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users_log`
--

INSERT INTO `users_log` (`log_id`, `id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`) VALUES
(1, 3, 'http://example.com/img3.jpg', 'user3@example.com', 'Alice', 'Johnson', 'password123', 1),
(2, 1, 'http://example.com/img1.jpg', 'user1@example.com', 'John', 'deneme', 'password123', 1),
(3, 2, 'http://example.com/img2.jpg', 'user2@example.com', 'Jane', 'Smith', 'password123', 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `brands_log`
--
ALTER TABLE `brands_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `products_log`
--
ALTER TABLE `products_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_images_log`
--
ALTER TABLE `product_images_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `references`
--
ALTER TABLE `references`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `references_log`
--
ALTER TABLE `references_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `services_log`
--
ALTER TABLE `services_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `settings_log`
--
ALTER TABLE `settings_log`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `testimanials`
--
ALTER TABLE `testimanials`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `testimanials_log`
--
ALTER TABLE `testimanials_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `users_log`
--
ALTER TABLE `users_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `brands_log`
--
ALTER TABLE `brands_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `products_log`
--
ALTER TABLE `products_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `product_images_log`
--
ALTER TABLE `product_images_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `references`
--
ALTER TABLE `references`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `references_log`
--
ALTER TABLE `references_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `services_log`
--
ALTER TABLE `services_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `settings_log`
--
ALTER TABLE `settings_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimanials`
--
ALTER TABLE `testimanials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `testimanials_log`
--
ALTER TABLE `testimanials_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `users_log`
--
ALTER TABLE `users_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
